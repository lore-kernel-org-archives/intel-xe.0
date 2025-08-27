Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E54CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4F10E0A0;
	Wed, 27 Aug 2025 19:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhEw2FyC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DE610E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756321360; x=1787857360;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3efXIl9Vq2o5pQADkGrcXjAaoVfz34600JyTjnKbh1o=;
 b=UhEw2FyC9Gk4Pjn7FICW2/+LDBMPUzKlW3dRvF5bIPrK/unVjTG6Lr1B
 dMet2f/JG6baYRb9hkdCKEgdeTY4+o8B4/91aaKG26XQKPm30G7IYpFYU
 jqc4PN3XqkTinrUosFV3+p/8T1FKgebKPjiGtqg/5Jz7Ty3ZcMcjZ1vVi
 dxtKo7TmFxAkbj57J0b2hBKqRZbvvSo0yNPKBVp07VxarLhQFQrgXg5Q6
 a4qUz23qQRoCy/PUvMHdaQ+JeWOleWFy2uOYBErIzUZ96ZA9uSiMxAZLs
 DjTov5qRv0gXc7rHfoC45+tF1/Ox42OjnjD1vagf6PCJJn3iWG4+Kljst w==;
X-CSE-ConnectionGUID: U70jHn7MSZOQ1qEkuGvVlQ==
X-CSE-MsgGUID: T28WX1hnTceGQAc4iqOnxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57781747"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57781747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:02:40 -0700
X-CSE-ConnectionGUID: 8BVRPpgySt22PlBEkrpgYA==
X-CSE-MsgGUID: ijoZ5rxlR76zj3wOx/rRkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170079071"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:02:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:02:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:02:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNO8RZ29++ekM96da7k5mjwqY/Gsx7sbjPle7Ra4PefzxGHqli8SvxrUN4KvQgh6WOoUxgiOV1aVLY5PVHRYw2176kk0KJgBESKY6txhRjcUxMxMzAeMZT5mxGHg8N5jFBoFB8S7Kmus1NgUIrgNy0+8Ts08k9RtQ2iko6mF2sgh6WW7NmAEYhW20H2sEskG+zU4AkkxGRpYbRPaw6XvN3FGrpyWNQUSYXWWgTk+8e/VqYu1rVq/o+GyT+OzbEmALwopnVOteaA7VEA1F26dCFM+VmxUID/PZh0yLb9iuXnxkcX/sCayHJLcFBgWmZye8AsxVyNq4ht6rYEEdr6dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44YCtqz0MX+G+mvg7LU7P2b0eD6Vk9vXKkEdMoWWzA4=;
 b=vMnlDs/GXHa6GkJXAs/yIE3YFm468JMyPAaSb6oPD02eM+vLgBNAnFAbXdrOQyciaYHYGMIfF1b+Fyr8CbSvSzKF72NFr6pPC0HwQ0Gxn3tYpd9rSHicIJw3CaQC4LjgymwZJn4khLZGQx8kJRWZcQyAb52+4OopZ0jH5e/NTFmxxpVpJFki4n88GRot8HLO4dLvZwxHCJ8Yj2CvbG1OqM2pP/5I0VCxhb1esMAGgAaUK60vQrEmeQdpK4+iu0pztPk7akcGzEZJVqkj9EkdNWldhl4w7qMPDs9TpMXIyTc2U/Jv1+vI2n9veZqTN1UYd06blB5FOChDOW28o9wAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 19:02:31 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:02:31 +0000
Message-ID: <50331fc5-e234-41c7-a724-74972c6c87d6@intel.com>
Date: Wed, 27 Aug 2025 21:02:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe: Add clearing stats to GT debugfs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250827184352.175550-1-matthew.brost@intel.com>
 <20250827184352.175550-2-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250827184352.175550-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: 700343fe-4506-45a8-47d1-08dde59c4638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFZRQ1RVQ2xzVis4c1lTVitQbXZNRnpvS2NhSnlrcFlJOGE3Tkc2S0wrV2x5?=
 =?utf-8?B?WU5uVWozelVIVkkrd2drd0wybzA5ekNEWHdTcjRLQmJzdFB2cjczWGJlRDRT?=
 =?utf-8?B?YllQNkltd1JlTTVmTEQ5VFYvQ2ZkOGc1cHZJdTBlK0hlRHkrNkdKYnhDMzNp?=
 =?utf-8?B?TU9EaElkeGNTbG9lY2VvdlY5VVVXK1lqd0ppdkgvMG85TGF3MG9RNE9vVTgv?=
 =?utf-8?B?UmtzWUJBS2gxNUJFK3NSZTB6WWF4Y0hiYklUWXpnY1BrTnNuSDlhN1VJMzla?=
 =?utf-8?B?WkJxa3g2SEdmNmttVWdyMzEwTWZxbUE4b0hPSUszYXBVaVQ5S3Q3YVNPVE1B?=
 =?utf-8?B?bDYxN2loTVU5SVllM0tnNmlUdnNoZWNrUmlWWVE1aEIxUjcwREgyVVVLSHRw?=
 =?utf-8?B?V1Zic284eTRnQnhEeFBObC8vR0pkNDI4ZnlWeE00cDFVQzA2RXZmbDArM3Jl?=
 =?utf-8?B?NjR2QkF1K3QyVWthQnpCTWloYndicGw5YnBZTWM3Z2xBaGFmQ1ovTUxKSVVz?=
 =?utf-8?B?WVBTRUYvZkNZbGhRVzUydmFDQlpmNWZqOU51TGtzbWlWdHIyOTdFNUlISUd0?=
 =?utf-8?B?K2FRYnJSRmxEa0MwUmFnVHhIbWFnUEJGV2crbkZxK1ZNU0U3LzNYZWlUY3pP?=
 =?utf-8?B?TmVIOUFmVjh0a0YzVXF4YjZFc2w0elBOMERpNWU2bUNCTTljN1dmd2kyWEpX?=
 =?utf-8?B?Qk0vUTFZR2RuZUtxajJva0V0VTY5dS8zZldQODR6MXBvbzZYQmVmYTB1S0Ri?=
 =?utf-8?B?d0hHTGE0WlN6d00yb051d0xCS1cyQy9PQ2FHZWJ6QlpMa0g5YnV1NDMwTXZx?=
 =?utf-8?B?T2tXSHluRVFJTCtxNjBUbkhXYnFTelB5ZVNFTkNvOHJqNHhENG9wb0ZNRFhD?=
 =?utf-8?B?WnZrMFpxbW5rZFpkYmQvbng5VHRVV2JYRVFLVW9NVS9RaWZiV1RaakFiNnlZ?=
 =?utf-8?B?SE8zU2d5WmM2Ukk5WUJqMFlQU3JBbVBVY1RLUlVPWEdkeU5nOEhSRThIWTVM?=
 =?utf-8?B?cHJhN0xXY0FFc3dkVnArc001N2hDNVN5d3ppWm54Z2taTElES2tKUjM5Ri9W?=
 =?utf-8?B?cTJWV0lFeGtjNExDL002dGw1Lzk1UHFyalFZbHJ3T0IxSjMzYW5lcEs4SFRM?=
 =?utf-8?B?Nms1WWgrcnI4a3ZLMzBERkZwbmNVM2N2Z2NZcWpCczNZMkZkMmpkQk1vY1l3?=
 =?utf-8?B?R3lKWUhTMU1UbU0xa0tKN0VYbzhlM1hsbGVxN3p5WUR4aGNFL0cxQzRlL3ds?=
 =?utf-8?B?dDdBcFgvaTVrVG9POE1QbGd4SzdOSDNNTGhBT0NKWmZBMkZoeDJod21Vc051?=
 =?utf-8?B?RmZTQ21qeHY1Ymg3SDBwNVdVQkFjTTA4blZWMXVaUm1MREdBY21jdWxUZk5X?=
 =?utf-8?B?VHc4bEpwZEI3YlpDYUVDVTdHOHliTk9teXZKTEJIbS90MXBZSjFhV2tIcW5q?=
 =?utf-8?B?NVVUMEhuN0NldWNKSzVpWkhzQ1oxZU5EUUdyOUJ2aGw3c0xqWkNWRnppbFkv?=
 =?utf-8?B?cjVQTDFMbkRMYTE5YXRvaDYrRnhGSDRjOUdIaFZZa0M1K25JYisydkZEeDJj?=
 =?utf-8?B?RFQwVTVZbjR4UC9Cemp3UFJIdXFGdEVzR0ZGWUVERUtJZVNYSXE4QldWdkcz?=
 =?utf-8?B?OGR4WTE4UVdzV2FGUUYyWDdVOG0xYkpKenJsUlVST0xXbGY4ZFdTQktqRGRK?=
 =?utf-8?B?eStmUkZvQlUyQjljTkhvZVEzS0NZcWZBZkpFcVJUTVpQK0xUSEw0VVdCVEln?=
 =?utf-8?B?cDAvUmJJSGhZWU5ZTXBaNFhwdXc0c0pNdkRiM0pTU2lKZ1IyWWJJU0NXcUNO?=
 =?utf-8?B?MnA5cEp0M2hHUmpJVmVMNlNhclZxYndrc1k2djh6ZWhQeUdiSGtOWXRTLyt1?=
 =?utf-8?B?L0U1OEJ3N0lkTm5Vb0NNUDBMN1JXeWw1YmpuNnA0TWZORGcrcnkxSCtwOS9R?=
 =?utf-8?Q?G5dGeQxnpKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZkbkhXNnRmTDl0TmJLamN5b3ZtUUNvamxJV1RaNUlxSEsyeTVITGJHZ1JQ?=
 =?utf-8?B?M1ZwUVIyMnZnV2JOV2JORjVxVnVCYThCQWx0S0tUeWZQRzVaVjhDT0lUSzBu?=
 =?utf-8?B?ei9NS09EczQxWE41REUyajBkQUVnbE1aRXZrMTBNcTlJV3I3QW9SMjlxejVJ?=
 =?utf-8?B?VjByY2YzN1hIOThjN0dkTW9XSE9kQVQ1NWEvMlhMcXQ0aXM4Rkd5MmZvMkdI?=
 =?utf-8?B?b25oYXliRlMwb1kwZ1dETDl5Q3MvZGRER1kwUmZUWDF2RWM5aTV4VnBnamZt?=
 =?utf-8?B?MEpUYjBqeStPTTk5QmlPeUpuc2hJUmJRVWhRVVJ1bmNnZUZWUjdXaHp4NXRM?=
 =?utf-8?B?b2k5djRoS21Ta1dtV3k2M1kraDB1L1lVRFVma2dBdmRuTFg5eUNQdmUxNG1h?=
 =?utf-8?B?a3pOU25hRmtnRFM3Tmg4bUZpeERGQXVKbDNtUkJCODFMRHUrS3NhZTF3Y0Nt?=
 =?utf-8?B?WjRWZW1TRFc4bEV6eGwwMXdQRDlxVDZmczVFblQwcTNaZFFUTGZOU09YbDda?=
 =?utf-8?B?azJUZCs2am9UeExKejB2QmZvNjJOemVLdzRFUVBtazJUSWV1OFlsNG8wQU93?=
 =?utf-8?B?U09SVDBHSVQyYWxXRHFWa3NrOXBCRnpVVDV2Wmt3RmdBbFc3ZFdhQnk0dTJP?=
 =?utf-8?B?RW5ock4ydHBsZGgwMUlOVUt3eFVEY2xTS1ZabkI3L0JpZ29VYjZ3RmhoSk5Z?=
 =?utf-8?B?SE9EWU1YY2hvRkRiUzRQMUlJWkRubnhNNVJFYWloUFpuZVFVS0VCOHA3V1kz?=
 =?utf-8?B?QmUwa04rMTlVM1o5Z2diZlpHcnFqQW52bXYrQjNRTHdUSnQ1Y0cwNzFNMG41?=
 =?utf-8?B?MGt1MFJWbStsbkF6cHNDYzQraVhTQlhvUlFzWDFNOC8wNHlsdmRLeWpwcFZ3?=
 =?utf-8?B?VnpuUXMydFNtaHQ1eWJmRFlhcjluaStaZlB1MWF3Ym5tMmNIVE5WOUdQQzNk?=
 =?utf-8?B?enA2QTQ5dkJ5RXlHUVVOUW1wczF1WHZVS215N2s2ZUEvSm1abzRQMXg3UnN0?=
 =?utf-8?B?TVhUdlB0WThVQTRmTHVnb3ZDeWcxWkY5NFF3TTdMQ3FUL0s2MXhyTHdwWmxU?=
 =?utf-8?B?NkpHZWNWU2ZHTnlJdnZTNGgrT2NRS2IyT1hYTllJTERkczlQR2ZkdWtjeU5i?=
 =?utf-8?B?ZzdnOTQ1ZVBFTnlEdTNYdkE5OURPOEY4WHZqSmFHdEFZa1JJUkJTOThEZ1k2?=
 =?utf-8?B?NHdpR2Z6UTNzNU9WdjdxdG1XMTZMZkU2cVJQR0FZbEZoc1hjcXBMaGRHdUYv?=
 =?utf-8?B?WURVVGt2T1NQT29IUTIzclJMRTQ3TXJOaDVYZEllWmxKOFpKUlpFYkdyOGZl?=
 =?utf-8?B?RmxsZDlzdGQwYzBrVkZuN0Izdi9UMEg2bFhsZUs4cW5CTmVYWHpFTElTcFI2?=
 =?utf-8?B?cXUwS3g4THhWOTgxNnlDQkhsQlRLcHlvd0psMitMZ3JiVWhnaEc3SjJPdTFs?=
 =?utf-8?B?RkpOTG9uZnZ1ZXIxaWZXUW9jR0pMbkttaUJwcWNlQ1N2NnJOZXNaeG1TVjRU?=
 =?utf-8?B?YjdwQjREbXUzb0dnc3BhajhBUzNPYjFwSzNLeno4dHpRZS9ZM0x1dk1uVEdz?=
 =?utf-8?B?L2FDS3ZIbkZ4K1plWmduMWQwZ3VuQnZYSGIwcExnOWJyWTZZNmF0K2dJcWZR?=
 =?utf-8?B?SHVqMGhPdlc0N0JyL3hXUGpqQjhtL3kyNkY0TVYrOVNJTS9BTzF4eThJbk5F?=
 =?utf-8?B?RG9POHBzS0tQeGM5dk9iRE9YMzdiOFJXQjVCNjFVMXNtVSsvZjFVZ2Z6VDE4?=
 =?utf-8?B?QXJQMjQwQkVJeHhtTHU0ekpGc1ptVWk3bUtaUnh4YjJKcmRRRE93ZHJhSTF6?=
 =?utf-8?B?dmcxN21uUzVoNWt2YUF0TUpKQ2xDenBERWhNSnVwWVRJUTVxd095ZXRlaFFT?=
 =?utf-8?B?L1dJM05BR0lkT00reGw2RE1SbWplcnp1TUdPR3V6dG1QNzBIVHdtMnc0ekFZ?=
 =?utf-8?B?bXdFVXFhVFFITGRXWldwSTJDbnpGbWFOenQyR1pMM25Ud0s5alFtUjNIUEh3?=
 =?utf-8?B?aTBHUldyWnR1NjBHdkdKUGh1cGxqY3dKeUN5N09NSDNodStnWjlEZEJSTjI2?=
 =?utf-8?B?eVI0bWo4Yyt6RXFGK3pQMGVneEVjYjg4eU1EYW1oMlMvOE5wYVVqN0dCWlVy?=
 =?utf-8?B?UlRhaHFSdnQrT2xTNiswQk04VnJUMVg3dU9TM0xRVXFmR1RSMkRiVmdtY2Fn?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 700343fe-4506-45a8-47d1-08dde59c4638
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:02:31.4670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqN9eD684N8q6T9LUhgLlYBp1JyQA3VxIqWN98W51YmqHoxjyX6Exo5X+AP2LIGtbG4Y69pRkBVOmAsW2g405cK7OgxsOG1UQ/kAfysBqcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
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



On 8/27/2025 8:43 PM, Matthew Brost wrote:
> It helpful to clear GT stats, run a test cases which is being profiled,
> and look at the results of the stats from the individual test case. Make
> stats entry writable and upon write clear the stats.
> 
> v5:
>  - Drop clear_stats debugfs entry (Lucas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 25 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index bf3a67b5951c..0004f279dee1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -327,7 +327,6 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> -	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> @@ -363,6 +362,29 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
>  	return count;
>  }
>  
> +static void clear_stats(struct xe_gt *gt)
> +{
> +	xe_gt_stats_clear(gt);
> +}

not needed - see below

> +
> +static ssize_t stats_write(struct file *file, const char __user *userbuf,
> +			   size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);

why not pass the xe_gt_stats_clear() directly here? it's the same signature

> +}
> +
> +static int stats_show(struct seq_file *s, void *unused)
> +{
> +	struct drm_printer p = drm_seq_file_printer(s);
> +	struct xe_gt *gt = s->private;
> +
> +	return xe_gt_stats_print_info(gt, &p);
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(stats);
> +
>  static void force_reset(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -448,6 +470,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	root->d_inode->i_private = gt;
>  
>  	/* VF safe */
> +	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 30f942671c2b..7e12fc3759e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_gt_stats_clear - Clear the GT stats
> + * @gt: GT structure
> + *
> + * This clear (zeros) all the available GT stats.
> + */
> +void xe_gt_stats_clear(struct xe_gt *gt)
> +{
> +	enum xe_gt_stats_id id;

I would just use "int" as we don't really use enum here

> +
> +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)

or even maybe we can just go from 0 to ARRAY_SIZE(gt->stats.counters) ?

> +		atomic64_set(&gt->stats.counters[id], 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> index 38325ef53617..e8aea32bc971 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  
>  #ifdef CONFIG_DEBUG_FS
>  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_clear(struct xe_gt *gt);
>  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
>  #else
>  static inline void

