Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF73C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7B10E0BF;
	Tue, 15 Jul 2025 21:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpBgLJRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0265710E0BF
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752616182; x=1784152182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uyRGnER3cF3jEd7brg8vwMD3h8aGv3wvU2jXsIWU68A=;
 b=EpBgLJRt9ixncChVZ4KALKFHemzePhJZ5wpOR0NjhsHPiNxKJYpg0Rof
 +sVrQsLwqzkKxAZ/VBC28Ixvjpha+qH3/1Orx6Ga6qobKZnKkcr/d9Tjr
 dnI8ogYw0GpL2zFrevxfjxB8eRUbJpObssZhyiLAapdS4ve32Tbuqoh3u
 rgAC8iNGwACXVjp2tsAzrA9TiU1ugDiRXuIURnR5JAohHgSAQdKcmy3n7
 u1YwAopC+kPhjoRdA0HBT964C3kiRohZTKHcAsMyHeN4bY/jNn4JtgRaE
 7hR38137hzE3crCeZQcq7USsw40zxZdKRircwpu6Q2O9QzcfXS0OKL1PW g==;
X-CSE-ConnectionGUID: hmaG9SPHRO67U29AF/c3lQ==
X-CSE-MsgGUID: 2u33Z/ewSLCADyuDiZgYUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65111751"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="65111751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:49:42 -0700
X-CSE-ConnectionGUID: iNXhO6ZjQvOJ8arQqPZIlA==
X-CSE-MsgGUID: 9FBlBYK5SymklzFiL1L+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="188337538"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:49:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:49:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:49:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBD0FSLsil/XwRo2mda7LuxFJ9jsCnKrqRJVfu6KijXo5tLAhNeOZTdZwRNVoApwLMMAayblSCNZip84g2Y1R0kMmN27OmTaiSkwWpy11sL+ffj9YQ+T+2a0Cr92IFW0d9bw2eEtcjvwTtS0FvurJiqm/v7OkRFunmq4BSXxgPBVogyq8N6JbQnn3hk9XYbze3rHAK8NthWfDtGpFcbv9R4poPOfKFBC9lGr/jn+gCVB5KH74SIHdFE2oI6+RKKmvqw5NNP5RIo7vplCQLGN4ZJ5lQoWCIX9B3CE/Hbz759RioWBbGQ/uxwAghrkHRCSOW9Q5A0nYDHNK369ObV2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95ttD6nKkcJGhPz8e3bgHvANqbcSnBUub/8gaOGNNzY=;
 b=ykiaD8eoE1ZebLeJP/dJ5BPGXjeRb/z8Tqc2hNGm8WESSmv+eLJfliltdCQw0Rh1G/esBf2C8RAEQnN0B81FYkffXpBcWox070BTDUcEpkup30bvsZ5QhbEey54sY6BZC30oO+TNDiLrNCYG5bf9GTOf4ZP5udmVO7NtEZ+M94Ijd59UWHr+AeTda19DoAzmcC0Ws/1T9YtqtrAEA9o5VmJqHjBDGoxDD/8IWvXpZwTCXG0Y7v18FKfGHw1RsbFcLehON0pf+Um5qxCayZRo2vBUflNauysZKwv0WWUYob4FSg62bM5sXqaHuT+eX/L7b4/AqhE914tiHHc9sv5Lzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 15 Jul
 2025 21:49:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 21:49:33 +0000
Date: Tue, 15 Jul 2025 14:49:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa: Fix static checker warning about null gt
Message-ID: <aHbM63ZEKCWIOpm-@unerlige-desk.amr.corp.intel.com>
References: <20250715181422.2807624-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250715181422.2807624-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b76701-3e55-4ac2-fe48-08ddc3e97bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmVsT3YzSTlNU2xBZzFFa25xU2UvdFhuR0gwY0tOY3dhbyt5elU2T1BrM1hH?=
 =?utf-8?B?Nkk5bWxrWFljelNnS0VBMTNBem5DY3VQOHZySnc0a3hPNG1TQlJSMlEzYnQ2?=
 =?utf-8?B?RGpjd2NZZjVSRmYrSXI1QlBoQmI2QzRhdjFxZnNPL2s0dG0yQi9QNXBwMUl2?=
 =?utf-8?B?Z1YwdVk2UmJoQysrdnVDMGlhV1ZsSTlhV1p3a3BWRC92WStNMjlLdmtybGhF?=
 =?utf-8?B?WlAxdnhibnNRZkxjRys4b3V1N2Y4b20zRXBncnVxVFg1ZlpWM08wWUhaWjlY?=
 =?utf-8?B?NnZkTERSWndhemlGUDh0RHpOeTNYZTdWcFYwcjk3eEJwN2t3Q2NwN2VHcXhh?=
 =?utf-8?B?R2ZvdjBSK2dBdUdvdi9NV09CYzUwYmNJWE02SDZUcFgzTzdBWkFsbEx0VDRZ?=
 =?utf-8?B?QlFRUEtzdkw0OC95VVhWNEpzZ1Q5bW9uWUI4YkFSdXlDNDE1bzNIYVZLNVVK?=
 =?utf-8?B?MWFpREhybWR6WWJIQXQ5WXBhU3pjYkJTY2ZaOGp4UXVQL1gvQklaSE91c0Qz?=
 =?utf-8?B?a1E2SklNeUdmbUwrNGF1bElpN3pDeE9RSTVqOE9YMmV0bUZjZERjUThHS1JC?=
 =?utf-8?B?Y3NzYzdWRjlZY1ByWDlDajQrcXBGRjJBU25ZQUoyeHBDV1VDT2J4ckVSWXQ2?=
 =?utf-8?B?NVdaaElKQVN6ZWJSZUp2MUdiNzR1d1F4WmMxWWFYc3ZrNmFNQTRYN2NHSHRQ?=
 =?utf-8?B?c2FBNmlHY0t2ZzZvdFNyT2FpWS85eExOQysrUVBhUUZvZEkyUFVxMVpzNk9C?=
 =?utf-8?B?RXdZTHNveXVpbzhxUlI0cTFYQldXSFlzL3lPVlRNRlZBbUJmZ3Zobzg1ZTVh?=
 =?utf-8?B?bUlXT3ZacXNqcUg3aWRiY1pER2xrVXJIRTFXcVBnM3VwZEorTDk1Y2l6VVNv?=
 =?utf-8?B?alNpM1NlRGhMUS9JaGRmOEY0QkZJdnloSVRjcDFwdVNYVGs2L28vVVJJSU0x?=
 =?utf-8?B?aVBrNTVxa3FNd29jVHIzd3pBU3hnT3N6cW5uRE5uQjMwUDFtYjRnNXpNczJu?=
 =?utf-8?B?anlWTCtUN3ZVckp1ZzM5d0EvbVQwMFU2dHFsOE05SUphdXJUVmp1LzArN1hv?=
 =?utf-8?B?SWl6VkNXL1lKWCt2TkE0NGl6QXVpdVBGeEg3UWVLSnJTK2pheElRaHBpMVY4?=
 =?utf-8?B?V3BBallNb0xpbTdud3psZlRBanZwMkM2YzhlV09JRlk0R3VlZ1BpMmZSdm5C?=
 =?utf-8?B?YXdkWFBTV1dzMnZweGcxeDdUb1dQSFpiOGNoRWV4dW9RdnFMWkltaUtOM0ZL?=
 =?utf-8?B?SnhYdGlrbE9VTHU4K0lId1pGdUU0b2RSeHdoMzNsYkgzWEJtcS9uL0dJT1pl?=
 =?utf-8?B?VEpGMVdNeExicUpESUZ4ODE5eHVJbHRJWUxCamJzQ01UVjAyYm5PckRsT1g3?=
 =?utf-8?B?RDdPVnRldUdnLzJWRFdnU1NpUU5abHg1UXlyNUhUNUd2eWtVZVBWWmQySlM3?=
 =?utf-8?B?SzdFVmpuUkFDWCt0Z3UyZFVIeEg4QWFlSStZbzFzVkxsUDdacXY3dUw1SVdP?=
 =?utf-8?B?UHdSSm1QYTdYYWliWVhGQ0ZJUUEyaFhXbTFFNW95UmlBbWR1L3RnMHJERHIw?=
 =?utf-8?B?cEQwNUZjZGd0enR3aVZrbUlQNWNWRzh6bmxxRnhCSURrZE81SlpYMXBnLzJT?=
 =?utf-8?B?Z2JveCtGQzBWZlZ0N2Z5VEVWdWJaUWw3MXRjK3Jucm9KZ1JFeXgrcU5ERCty?=
 =?utf-8?B?SWdVUDVnR1lVcHRYNnRQSmRNdTlVUmVXOTkxT2k5bldtMU5DUGZLa3dnNXdk?=
 =?utf-8?B?T1R4Mi9HT0tOektIeVY0VG9mQ1kwMjlRVE9IWE5PS1ZvVDNNd2NVZUhNNGFo?=
 =?utf-8?B?RXVMbU9RcWI1Sjg2QWFFaTFPbVVycEt3YVI2SnhhM3AvVVhtQi95UXVKRitK?=
 =?utf-8?B?OExPTEgzSXRKdkhLYitJTk9KNnRadDh2Sy9RZ0g1UktQdFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlMWWY0WjFrLzB1alo4cXRPdDV3K0g2SVYrVHhMSzJ0YUVxZDhEMDRmRldu?=
 =?utf-8?B?ZloxS1pQM0JBcVkzbkpuNW4wWnJZN0xBZTVxT0xjRnN0d2xkSmVyUjRtdDBh?=
 =?utf-8?B?VXdueGlLMUx6OEptcFlPdithckhXdjFFdmh0UWJXOWgvbWRVZWtVenZ6bXdI?=
 =?utf-8?B?Z3BrcTkrbWZEb21WeW1ZSFp3YzJRNVdSWmlrUTVSVFlabXZ5NnViVTBBN29J?=
 =?utf-8?B?YTF3b3h5ekdLd0Q3anZhYnRKdFNuVzZLcm9tMDh0TkhtWnA3K3pHM1NHLzhM?=
 =?utf-8?B?NFBuQzhOYm9GbUdBdzE4MDd6eDU3czQ0c0h1bTBEMm45MWJzUnV2cFFKRU5l?=
 =?utf-8?B?NzViVDFFRENRZEp1YitBM0VFTXoxSzNzSlNlSkFSeEY5V3VPOFN1S2lrSHJz?=
 =?utf-8?B?by9lL0MxWkMvd0pYRGNUS20wZ3VlZCtaRGp4L01tbGI4aU42SGNhZVlPWHg1?=
 =?utf-8?B?bXJBckxoVkdUeFg5eDN1THByWVR4N1FhdEVDaEVreGZKazlFWGV2SVl2djlu?=
 =?utf-8?B?eXlxZTVsbkU5OTR5QUQrb1p1aitVU0hGd1ZxVEtZbXlpeVRid3VFNFNNelB2?=
 =?utf-8?B?L1FXWVNOaHJBS2lsMG9BeGg3b0s2YlRBQzdmMy84UXRwMGJIdDJKS3lXN2pC?=
 =?utf-8?B?dnhPMmhPTmFiMmtDNlAxdkVXdHVVZHJPOS9Vd2ltTUxXWDdwT0VhbDZoMmNk?=
 =?utf-8?B?TXdHMDA5VXVIR0p4dHZPVWs1SUdZMlM0TEc3WlRFeWVJYklhRml0MjdTcUl2?=
 =?utf-8?B?V0UyTzdXaHZ2R3hxYjFZZEkycG5DQkl6SU5XZE51ZDdVMStsVFhJdDVHbDln?=
 =?utf-8?B?NE1OQ2F1Vlp1YkxjVHRKYWxhMUl3Wml2amI1MzlGNkRaNzlZc1BlNy9iRVZv?=
 =?utf-8?B?QnppdnZqV2taeGJpNUZySWFseG4zaEYvd3VrZ2VoSEZpejQ3TnNSUlQzRE9W?=
 =?utf-8?B?emFCeFgxOTM0WlZYa2FtTkN3Z21DRlU5K1ROMS9ETGhFdHNKZW9tWENzNkhS?=
 =?utf-8?B?MGpFYTdNVkRlNmUvbVNMSjUzWUk3TWVnTk41Uk9kMzRzRUJ6amYrRyswKyts?=
 =?utf-8?B?SU1ZWGlGV0Q3WkMxYlNvN2MwUmZiUzIyRGtSYU5VQzZuTGIwWkRYRnhQcXlj?=
 =?utf-8?B?YkNpM0tFSFpvOXBZbEhXNmE3S2F3cUZScHN2Q0tub2xDWWo3YiszWlB2Mk51?=
 =?utf-8?B?SWFWenhPTElxVnlmT3g0bTlOVkprVHlZMUJPLzE0YkZYVGdjLzdPbWtGUmxx?=
 =?utf-8?B?NHljYXRuVG1zY2dWQVU4S0Nhekl5TlJhOTBDZ3Q4bzYyOG43U2hzRStGMTA4?=
 =?utf-8?B?c093blhQandSUnNIOTkrREd4K2FlNXY2L0RsZk9qZGY2bUFTbG91VWt5M3ll?=
 =?utf-8?B?RDdmRE9ETEltUmZxUlI4Z2FFMjdHdENONUluRXNGMWZEbW1CZ0hsUWFUZTRH?=
 =?utf-8?B?VVZxaWJ6QnhHZ1dyZGZuRlpCNmFKVFI4eDNsT3NvOU1HbVBjZURtWDYvSzVX?=
 =?utf-8?B?ZmVTZUJ5NmNMVTJQOTNpYVk5MkY0VTJmK2FFTjYwRGF1S09JSXhXakR6RVZB?=
 =?utf-8?B?OGpLTC9BR2hRL1NBNkgxeWdOYUtIS2RKK1NIVzhweVpNZnJBMlBQVUlXQk1I?=
 =?utf-8?B?K2poR0xpUGR3WjZKZFJRS250OHAvRmdiemN4TlVUTUU5djFvbFRuT0JybnBV?=
 =?utf-8?B?ZWVkb0JTVXZEN1RwMmVpRVp2R28wazdFbE55Q1dxOVVpbjVRTW1ldS8zdWxo?=
 =?utf-8?B?cnQzeTluaFY0NnUwUUtjTzhTbnRoTU5xL0thWW5hWmcvUWtPN3I2Vjl6T1ow?=
 =?utf-8?B?RFBjKzBJVTB6RkF4NUwzVmZtREtxZ1ZRaFk3bTlUanpmL1NHaiszZkE5NDFv?=
 =?utf-8?B?eERkbi9EbUxjVGRRNlJkS2k2TzhRdFNZVTBRVXlUbkc3d3Q5SzFLWDR5Q3l0?=
 =?utf-8?B?bkJMU3ZoZXJNQ1c1STNLVXRJdHJ0WnFVQ09ENjNma1VMYVRaZ0EwU1R3NUd1?=
 =?utf-8?B?QytqTkZQL3llaXdvQm4zMGJ2ZmUyMXIxUnh6TnpheTF1aVI4aVYwa3VUQXl1?=
 =?utf-8?B?VEF5LzA3Z3FyMmZ2OVYyZmtEZjBNWkd3ZHkzQmxwenBLNTZuQW52WU9RM2hy?=
 =?utf-8?B?YUJ0dHYwUTgyRFFOL0hlcG9ZSElld2VQUTBiM01MbUFSeGVHajJJeEU2V2N6?=
 =?utf-8?Q?6Ix54gV5Lng/DrAo4HWGTCc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b76701-3e55-4ac2-fe48-08ddc3e97bde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:49:33.1237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwF3mMd9XOXyscFHixY0U9+PmykogaN67xxzBv7ovR5NSzhfmSyK+TT0E0rSyksIbl5SBJXdoLyM7tDyBERhnGiNfJdT39MllaMWEmGPIXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7140
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 15, 2025 at 11:14:22AM -0700, Ashutosh Dixit wrote:
>There is a static checker warning that gt returned by xe_device_get_gt can
>be NULL and that is being dereferenced. Use xe_root_mmio_gt instead, which
>is equivalent and cannot return a NULL gt 0.
>
>Fixes: 10d42ef34bce ("drm/xe/oa: Assign hwe for OAM_SAG")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index d991fbd90f201..5729e7d3e3356 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1941,7 +1941,7 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
>
> 	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
> 	if (!param->oa_unit)
>-		param->oa_unit = &xe_device_get_gt(oa->xe, 0)->oa.oa_unit[0];
>+		param->oa_unit = &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
> 	/* When we have an exec_q, get hwe from the exec_q */
> 	if (param->exec_q) {
>-- 
>2.48.1
>
