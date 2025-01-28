Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97748C02190
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 15:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E06E10E690;
	Tue, 28 Jan 2025 15:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPH2qZen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A6710E690
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738079159; x=1769615159;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T+PmFRZMDFk5EepPU4u20YMZbWMZASFQgX87pAeIUdg=;
 b=VPH2qZengUBC/bCEkjw1s4OrKreouPSX+YGyr/O+AxeA1RSPBA90+bsG
 Bh6TSNOBbcug9D5N/6/uBaK/shxo+6YWi+LQHYDVePr24KTlBHZayeRHD
 C6931sctP/VOOJO9EHceQYrhDk4FKt4DVl4OXzX2Wi4lNy8aXxPi0bzBB
 T2dbzBzFrRUvbP3OV4zz2k3OkmRzhqZrv6PsT/wEJxJEE++yJtv0SQuSk
 TsGZiM7l8Qp07+wwdwbz3u09Nmuu6MzzgOtXRlKh75lEVd36eh1e7SSZc
 ziW/VEqloKDM6QJRNN/gcmDDTcqgbsJtgU6NzF33dBtD0mPtRd7tRznv2 g==;
X-CSE-ConnectionGUID: RWSimPL0SG+0ybaPQbhvNQ==
X-CSE-MsgGUID: ZpcngsH2Rr2zjNsTReGc0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49554729"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="49554729"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:45:59 -0800
X-CSE-ConnectionGUID: XVPEWfP2Sfm+tHH636/4aA==
X-CSE-MsgGUID: hFLs7doIS+eK48Z0At44Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="113752567"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 07:45:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 07:45:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 07:45:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 07:45:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYBncJouYlhHxBWgk+JVYjw+fGUhSV15WymEJM1Ab25IQ8wThgJcWzjREEH+ZJhs1pqRDU+ituwV8tVdIELU+fbmn8wtZleVKUkDFsswjC+zi3kE1lp6qAk7ZKaz/GZGy2LQSqBUTeMItLKdgUFX+N2/USeGHpgIv9YFtDMOiwrWI+F0q9rGU3P/4OrTGqvHve7OICRvsWS2WuVwvnyxZl5eTU93JHefRnAa73y+2RZf0SExfoDihJvTEQ13/EecJ5Z+EGNS+8dZY3YMt0Ezog5k2RS0L4vtiGpdvROqnh2/gutP/J23TsmxA3RAXVHEJV66TWvok6x2VIYjMwbIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+KUZKuy6fEFsKxi8QMsvlYEeLZHMLLtc8IFRyGxVjE=;
 b=A4vELNggZqJ2nmlAnOMVEjByyTJk2agh7oII7VX6doYWYy5TBtKUWF149VqbrqEBaWIIJYqMpAUAgdFBQXuMI79rG/38QR/RYe72P3XaLAYhEAKs1lFzfDdYpHu9LIDebyPZqN5jrBWHsIvQXPHexscykknKu3x6MJR3aGm60qyioNZ5gzAdXbbhCjjvQhj+WwYjELDmX3I0li2Tv3bz/ndvSjbfG3xObRiqLrMrD/HU+61fKa6e0b61uTHlJmUHGgJtUnmlLy0gBbzjfhUpQsoh/vjEV3NgytqP1IroP6U2YP8Dh0nqkiTBds0UJQyoidWWZYWrQcZUgbvTpeX74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 15:45:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:45:26 +0000
Date: Tue, 28 Jan 2025 09:45:22 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkhvb2tzOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 Enable GuC log dump and minor fixes in devcoredump (rev2)
Message-ID: <q4ld6xepba2lpzq2dqea7yux4orjuniqrvzl6wcy5utjs4ekr7@nvxip4ey2dz3>
References: <20250123202307.95103-1-jose.souza@intel.com>
 <173766537811.3694609.9048100313429963819@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173766537811.3694609.9048100313429963819@b555e5b46a47>
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d660396-5c87-4e8b-9a54-08dd3fb2c8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXhRWHM2WDFFVWFZaUZDMitDUmoxbTM1U0hhQ2ppN3RKYVRoZTI1K2Q2cWZY?=
 =?utf-8?B?Zm92UTNiVXgvcGNvd2J1dHZQdUgraHVSbmtqQUNYdnpmWFg4dCt0QTdzNFhT?=
 =?utf-8?B?cEVYVXppYXY3K3Z2eWMxVGZsUWtwMkw0S0w4RGFvNXUyN3RoWmVzYlZueStD?=
 =?utf-8?B?emI5NmxLUHJiSU1ISXBBRHNRTzEyT3FXYlJyZjZDaEo2TVltTTAycUdPcTJR?=
 =?utf-8?B?UHdJSjhmRmZ2b1RucnFCWWFKWWN2YnN0Um90YXVBV01xalhaT2tVRS9uQXBo?=
 =?utf-8?B?RUxyeVQzQUVWZk5nQVJEUURaRTRJOXp4WW56Q2lUZmJoUmVhK0JmRk1MOUNN?=
 =?utf-8?B?QVR1cWVLc0lIdXhxS2hyQnNUbUdURGFZSFVPNmVTcE5pck5tUWRGT0djSWxq?=
 =?utf-8?B?M3NpTGtPazM4WHZadGlCM3NOd0RTY3Q2UWprb0lrd2kyNSsweEY1ZWhnS0xN?=
 =?utf-8?B?UHRySmlCaGFUeFhXaE5kaXN5SmRTNDVrVWlETHk2cEMxTW4vQzZJUmxJSlBE?=
 =?utf-8?B?RkRJS2NESlJ5MGFPanlnZHZEblp3ZGsyTWd6Q28wNUJDVlAyQkZlS0hZUzRI?=
 =?utf-8?B?NGh1dmpObG4wU1IyOFRQTjk4cjVuc2VWazgwd0NELzJybTFDQXNxZmgxN0tE?=
 =?utf-8?B?V1ZqVktNUjNXZzFLdlJRT2FabXREbTBGNUhySjRZeU5jK2srNnV5djlwa1hr?=
 =?utf-8?B?L2hvUjdCa1M2KzlJVHU3VEkwM0NsSGtZWTV6YzVzSFMvTTZMckxNM1psZ1FR?=
 =?utf-8?B?YjByM29wUHZQODdodFU4SjJBM3E5bTJ4RndlS0MwbXA4NDVFS29FV1Y0WWp3?=
 =?utf-8?B?RjFPaXkvMGJPVG1TQ0U5RHZVK0VaSHUyV1lmVXVBRUdMaXc4ZkNIaDZVWlEy?=
 =?utf-8?B?TzNReHpXZys0V2VCbkNlVG1Za1VMSUJISGRkeG5td3lVRVdYbUNScFVjdmgz?=
 =?utf-8?B?NzdiQU9VaGJGblh2RjVtTkxvZ2FyRHJlVkluUXA0Y1BYK0JieUcxSW43djRB?=
 =?utf-8?B?WFBIQWkwdE9YYjMzV1l6dFVSRTRqUnAvKzBlOU5lYkp4ZVFHWTUxQUlWWE5O?=
 =?utf-8?B?MHR2cnJ6VWZiRzFnbFZCWTJ0OXlaRGlQZmMwRG0wb0l4M3FiaVRPTkVVRDRX?=
 =?utf-8?B?L3hDcWtRVmw2S1djNU04eUNNRElCZStGalFrWlRXVDJiZ1BaMElKRDlXeUxZ?=
 =?utf-8?B?VDBYYk9YYWNvWk9rUnFEOFBUWGg2Q0ZJdnZLaVYzcXFFZ0VRZXQ0M3A2NWk1?=
 =?utf-8?B?V2czVWZnYVRFYytKYXJzTWNBMGZ4eE4zZzlBaFdiTG5yZmF6K0xhNmIzMXBm?=
 =?utf-8?B?MTUzRzJQbUFkRVlSb1dZWlRLOGV4RXc4VkF4ZzRVSGRXbWRQdUZ0SnMzc0Z6?=
 =?utf-8?B?QzJiTnhwOG10d0NUekozWXMzYnlKU0ZQdmtaSStTY3lMRnBrYmdsOXp1Z29h?=
 =?utf-8?B?OWdMNG9lZWxLbUpRa2NXRHBIZkxua2Z4Vk9oNkQvTHppbm1kZStrczdXVm04?=
 =?utf-8?B?cmFqbkg3WElUa01RN3FyMGlKamZidWNwaGVvWlpVZGl4d0R3aUlNd045NVNh?=
 =?utf-8?B?dy9Tb0Nvc2x4WGxUeStkUEt2MkdlWUhaWHdyVVlNY3d1WVY4SVJrWmtBU1pT?=
 =?utf-8?B?WElxcldZdnB6L2kvZk9SYXBGMlBhblRNMEhyNlE3UVdldnk1bzZiazBaQVV4?=
 =?utf-8?B?c3RZa3RoMnpFcFBhWUh6bldXMzh6eVlJUWhJeFJuazdnRTY3TWJuRXViWUVj?=
 =?utf-8?B?YWhReXA4cUk3UXFzKzBqa2gxbkxEeXBMNVVjQTJsM2RVS3VoenFLWktJV3ZM?=
 =?utf-8?B?eWlWV01uZmRnUjBkYUI0UUZES0ZhcU4zb2tUdEN4UDRQcElTbGpBdDNwTk9N?=
 =?utf-8?Q?DQ6uY2inNyguK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjAvV3dlQUNXdHhXUW94MnZlVFNmSTVJUjVMb1IwVEo3bzdPenZwVWJETXYw?=
 =?utf-8?B?dGNZZHJkTTRtWG5SM3c1NUFzVThFUXhFUlEvNXBwb3ZMZUxpK1hYMnM3L2Jk?=
 =?utf-8?B?cnp3UzVMdmFIczcyQTMzdXJDOUNwTlNqZ1c5TWRwblNGald5MGpZZHdydlJ5?=
 =?utf-8?B?OUY5Qm1WYnFGWmdqUWRQTHlxYk5FdnNCWTI0NjZZalFDbzdtdEhRbVJpOE1q?=
 =?utf-8?B?MUVWUWJPdW8wYWk4ZHRPT2dIMEtscUxQRXlBNmhNNEhaTkdzMk1mSWs1RjVQ?=
 =?utf-8?B?d25SL1B0LytYOWlsYWZXbkE4TWlZOVMyMm90SXU1ZGkvUFB6L0dNaEZQazho?=
 =?utf-8?B?TTVxb01lUDlXSGU3UWtZSGhpQXl6WDVUUlQ3MXdwMHFNWitZL3dVSnhXMFZh?=
 =?utf-8?B?RmpkRVRWemZoYjBZbE1yRkhFT1g1K0xnM1VNR0ZWcGVCbXcrTVVUYTB2Q1M0?=
 =?utf-8?B?QkxxL3VSNm9PVUFKa09TMVNVa2RvdEZiU3BQN2pjQlAyVG1Hc3FZdHlpV2V4?=
 =?utf-8?B?NVRpMmFkZGluSy9qc0hGTThwemV2bHcwZlRUbXk4WE5USkVyNkwrdGdaMnVI?=
 =?utf-8?B?UTBlZWcySHRHVnpQejlHOTcwRC9odXJVSURIRlF1L2p0TlFteEdTdWFGVFBr?=
 =?utf-8?B?Q0V4NmUwc0pOcllsZlhveDljTFhQRXVUaXlSenBvYitUZ3M1WEhRcVRWdnlP?=
 =?utf-8?B?QjZtd3kvNDhBUitXdXdNRWU4LzhGY2tWMTFzSUw5cGsrTGp5aHBXVm1YYzYv?=
 =?utf-8?B?SUVMQlM0NE5KcXB4UDVwdlRsUnFaeGNhOHF3K1ZlSW5OS25YRzN5K0tJNC83?=
 =?utf-8?B?UmgxVXFGUXo5dUg3QlllS0VxLzRpQ2xxTW54NDVackp2MTArUTQ3anRyOFZI?=
 =?utf-8?B?cldLeGNvYVJUUGtUdXhKeGpWV1NhWkdSVFJ1dktYbytaekp6dmQ5KzZmYTJS?=
 =?utf-8?B?M3MxdldxMGpCd2dRNHh6UkV6L2QrWERncGdsSWswc081eEdwZGpYT0dwdGt5?=
 =?utf-8?B?dGs1MmYwdDA0YWRlYzdRVUExRVhaVWFSMUUwOVVlczJRdDdvVjdHMkowMGo4?=
 =?utf-8?B?Qk9SMXQzZ1loVTRxcHZGVWdtRVNOdjNiOGMrRFp0RTlFamxKMGJxOS9WRlBE?=
 =?utf-8?B?eU84YnpuNEtoUEZBeWwzOVlRUjVRS2I2TVVKOGw0aW9kdncrdENCSngzSVRr?=
 =?utf-8?B?eTRLZkx0a3N0d09zbmxuYVArTnNqU1p5cWpNSEdXSWRua2tsZ1lDL3VxcjNT?=
 =?utf-8?B?dGVJM1JMa0wyNUJGaERuUjZDRWlFLzVySzV6UHh0SWlTZlc4YUJBRHNSVy9G?=
 =?utf-8?B?Y3hQSGlLRnh0TEViQVl0VTJpUW9UdzBXUU1odE9JVEVGY2w5b3NTam0wdXVI?=
 =?utf-8?B?NUx0Y1c4L0M5Mm9Xb1RzVVdDRUcvU0N6Y21aZy9aWTgwcGp2ZldrWThHck12?=
 =?utf-8?B?UE5wcUludysrTzlRZjJXVUlRQUk5bnNBVW1zY3FvNFJQanpHTVJJR1JhY0hE?=
 =?utf-8?B?Y21BUW8wcGt2TEV6dTR2a2twcFNOd2NsVzlxZWpOTnBJSk5ZS01sd0p3RTdj?=
 =?utf-8?B?U1BicXRKblJFY0dGdWs2aHVmMFRvT1FGVWRFNlJZeHJ6eVhkVXlRVzFkeE9N?=
 =?utf-8?B?RlU3UG5EUThuOVV5OTZtZ1ZzcjYwVmtHeHNMSGRKTy9HUU9WbFlJaWdLSU02?=
 =?utf-8?B?eWQ5ZmxvWjdEeEZDN1RoSHFkMWJKYjhzRWtkcmJianVjSk5LdExMb1MybHl2?=
 =?utf-8?B?ZFlHMGw4M05ISDZDbEFKTGJ6blNEMU1kMGNhVUo4cS9vdzJoSGRtS2FpV0Zh?=
 =?utf-8?B?ekNmQUZRZndidHpsQTh6ckxJR3lJVFpzNTJ1SzJRY1laZGRjKzRoZDViMVBt?=
 =?utf-8?B?Z2hkYkJZbkRtSkc0Q2RlOFpUNTFxMkNBVHlHQUYzdW12MUFsRnFxdnVSRHlt?=
 =?utf-8?B?L1VEQ2wrSkNvR28zS25pdDd1eHhmM0U3R0xwYS9RWGh6UTNCejEyQmVabG0w?=
 =?utf-8?B?eEo2SHBDeXZoMlpNSUl0K0pCWjhBN1kvNk0rS25udFdGWXNWRHd4QXJtTU1a?=
 =?utf-8?B?Sk9xUmNUTnhFcjZsbDY5S0JXM0k2Q1NZRlJ6c1g4NFJPVGxyOS9JZm1zeW0z?=
 =?utf-8?B?RkNHbDlMdHUvWXlOenYxUWxSc0NlZzlyc2VDYm9haFRXaGdieWJFWC9CZmlT?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d660396-5c87-4e8b-9a54-08dd3fb2c8d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 15:45:26.4786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJpjdn+ANqs3C0pFKm3StJX02AYhEQs9U5YgArrfa1XBrNZdCUX5mkcCp8uhp43muTfKyfT1Ad3gjld7o+jpoe4M9PyaWGqiq0yztcIKYBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
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

On Thu, Jan 23, 2025 at 08:49:38PM +0000, Patchwork wrote:
>run-parts: executing /workspace/ci/hooks/11-build-32b

...

>/workspace/kernel/drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘xe_guc_ct_snapshot_print’:
>/workspace/kernel/drivers/gpu/drm/xe/xe_guc_ct.c:1727:58: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘size_t’ {aka ‘unsigned int’} [-Werror=format=]
> 1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
>      |                                                        ~~^     ~~~~~~~~~~~~~~~~~~
>      |                                                          |             |
>      |                                                          |             size_t {aka unsigned int}
>      |                                                          long unsigned int
>      |                                                        %x

ugh... we did get a report for this and I missed the Hooks CI because I
was looking at the other series I've sent.  My bad, sending a fix in a
jiffy


Lucas De Marchi
