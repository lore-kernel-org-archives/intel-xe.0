Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1313C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7087810E1C2;
	Thu, 12 Jun 2025 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khvEAVdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3610E1C2
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749765910; x=1781301910;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oQsbMoYN7D6jgRZEoVu7Ft4HjGYEuV1mKJZ+h2WYgwI=;
 b=khvEAVdq3EoC1FecqMjR094SaFbrCwjpsY8TblRrrfW4dnpvmc0s1wus
 rPWOxoC1k909sWHhPNOG05lgCGhnESC7ei99rIodFReWSX2+I81jmedl8
 WtDhUJFZUplim0MzaRdPr+hKx9zEOjuhFOia6kZ/P0x5CicTo0yUyCKQM
 DyVkaOJkUaq2LnrjPWJxmJeRY1M2W+3VrOnw4Tg0KyRLtgPFtspsxp/Sx
 0Xyy5shbW3pxPq8IxB83vLiUHF6I0RG80diuI9YxJiYXaT02/gud3/FoG
 NtYPhAKFX0vcT25U38L1QHxRrjMiDTjvDzROiZ45i1HxXJ6A4KaSODSbf Q==;
X-CSE-ConnectionGUID: mciccESxQDq9FstJAVgorQ==
X-CSE-MsgGUID: U6IxF6Q/Tn2JXzGHzHHS/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51836563"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51836563"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:05:09 -0700
X-CSE-ConnectionGUID: /luXCJ5nSp6oqT2zWoChbg==
X-CSE-MsgGUID: NI2UpaDnR4W5wvWmM6Z+Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152933294"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:05:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 15:05:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 15:05:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 15:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnmJMQHRCGyyO2JoRPx3wOJwJ4KWA5RJ66C5Fluypu6Pva5fgGealCK1kcVeqAXOVwK3/pPsL2qL57A/hwTKLpKhye6gTqTUwjJYaJUr4IiqvDujcpdJI845/ERDKNP+nrPntfnhfXj0ZZ3lh0pq+sRhSignqH4jIdoyhLWyaDLw+89RLSGOQZoJJ5RdMpn+HQRgzjak/0fs7NRRmQy5Ex7Zo0KK2cR2fY2KhDws9Yz24xFIMiKyA5x6OFKQdBu+3KwQxbx1ABqORiWmYCxGdadqcrJsHhG39a/2VMqpjBK9PRlcb+m8LKFNemQ1SPbGcp609o+mIwldAvIJSNj3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FamfJ6eQ0VnbUlwRe7QDiZRgNPDBV2/FyiAcSjaVelM=;
 b=N7xrcNivoSmpg3OvwA2vcs/mWDtAgxT1sKlIN/5sfl+S7NRG1nQOAQm4kUCbyuS5VDPSXrZKivy9ZouGqD8CgTaeA9ijdERnRLOWTN0JcFSouQuO0W8AHSW0te0DmkGi9kkDPTBXtn+yK+oUaJr0YQBfb4XvguTefGIAcGPlJUFZ88cUNyGPCTEq+eGnnHja3+7+cIKqRAQKYMat9hl5awm1xi0Lf3kOxZluxgsPsvZWP5YM2W4/vIYQz/YPBKZ/T6SpfUJ60yCVVJPAFBRTzWfk/7rFGVCh7AUuR2mYOj+eqm5da7gTTGcqKQ3ZCrvLPOZ5WTfj0yN9JGr9Pu70Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 12 Jun
 2025 22:05:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 22:05:05 +0000
Date: Thu, 12 Jun 2025 17:05:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Message-ID: <ipcuzymwpfnoikxo5jp4d4vgobed7ip3wp5ccrljvyprx27yob@bcmzpft4vsnm>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <mgjvnmzve36ippij5wgjc37iskd5zeughb6vaceatuf55md7eq@qdtfddo5bztv>
 <2b862e51-ff9d-453f-b444-5783df07c600@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b862e51-ff9d-453f-b444-5783df07c600@intel.com>
X-ClientProxiedBy: YT4PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c721b2a-1aff-493e-b0ce-08dda9fd2fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sL08GqtthtZRIVcZmdWbBi+Pr2JCgobuB5XUQALReN1KCeJFl8HZU28/Ck?=
 =?iso-8859-1?Q?8YugoN5GjS8JM8bdqiPTNKMPxEDdGhlWcflQL4F0E4nCyurRk/c3xe2rCK?=
 =?iso-8859-1?Q?y1OUsdI9ppwM6ESclBl78gYz7L6yUVazB0i5bGRUFZwrDvfx7cWVyiNaGN?=
 =?iso-8859-1?Q?aLpxHWAtcyoYbF3bHx+LFOGmqg0VVlb6dsU/RbgjCg8/gnBcDCdXsZNEWe?=
 =?iso-8859-1?Q?HoWymIwCM4qd97LZa+UB5GSnQfAPkVIy0CwC3Vn7IF5OTeIdMT2v7gxnHW?=
 =?iso-8859-1?Q?gt90zJYYowWGy2ZZi/QBIbL4oFLZeCO6sIgMxXsUS3rGPN25n4jCVMg44X?=
 =?iso-8859-1?Q?w9seE2h38PriUqKizFLdED8BFeJkveu3M5fTdZsXULgAkiNLLqidmhXO3d?=
 =?iso-8859-1?Q?+ch7wqa0VovWnkLsGGh5qN3VO+37uwNbdoiJW4RQEwYs/Jejl1/V6+iuCb?=
 =?iso-8859-1?Q?owugark7ErCQyiA9IFSTcWPjVWHhIa/+Kya4tnbWG1Xmxk44jNk3LqazeO?=
 =?iso-8859-1?Q?6wRiEcxJwSw5nur4Csw9UKQ3CC98BBOK5apad/DxfGJ1/8+CEhIp+xnVTD?=
 =?iso-8859-1?Q?TtGj9shScczaoavml3xiZ41CIQiamtLpO+quiK1C0DFmO+27A4pq6HXn/J?=
 =?iso-8859-1?Q?t8ntxC3qgwTIkjHWYrEXAb0RqCaNR7xSRgLPNOIE/p0iHkP42bvdAwskWF?=
 =?iso-8859-1?Q?NvgEVcRaJcQjUhA2z043og9l1pPhHW2DPhR+SLYSv2yLzxQ+om0qPUqKUO?=
 =?iso-8859-1?Q?YK/ilunvcdESJU+OvWpu+Wtfc5fXu8Ob54nm/Wioq+vyXEy6s69l3y5x07?=
 =?iso-8859-1?Q?QLfB0o6EzIMx0UnPPT3zSpi/+3BYDIleEyog/hQNREg1Y94Tc5Wyt888M3?=
 =?iso-8859-1?Q?kw8p8q/EYuocdDFXK5dzDdaG8o49GqZjB9G1Q27nDiSgOs/XwO32/AtsCj?=
 =?iso-8859-1?Q?nAmU2o4ig3+R/KesuA7xfjTmJxUT8EkTRXAlbk9WD8Rlhu5G+pYgTw9TnN?=
 =?iso-8859-1?Q?2f/SSdipxPTF0+/CXQO2BuQrZncfve7DNiPx62LM9lrG7NOeagYcrZrVu+?=
 =?iso-8859-1?Q?361dPbsWugbXAFHgzFwkjxjUJZZEtQwLltIMkjk6dTDVs+PU/5NTweK/Em?=
 =?iso-8859-1?Q?/NeMxXAdApthkWSwufKhXx8pNFM8vvHpwnx3WrwzPt4LXIpxNA2OQBu+s2?=
 =?iso-8859-1?Q?VzOOzsXy+mpdp/GI+U4h/ArR/hGf6auxt4vkC3k4wxbVR3q0Gtd7A5L3ZI?=
 =?iso-8859-1?Q?pseJfljeZ3NmCOY007NpJ0O/pUYVqvVMa+JR7KBeXCeuvUs57tRreHRkjX?=
 =?iso-8859-1?Q?9OuwPS7xiZmwtRHebgIdCKPj1orpITnkA0OtLin1y2KN718rn7Tp5i0p73?=
 =?iso-8859-1?Q?HyRxr5TvXsYwRUreqGubYnx9lvhKpGxxqIla/F4u65amfXCxwfwDcpSYBc?=
 =?iso-8859-1?Q?UZT4ndfFStePWDUsbWvgC5xB8z4qXalyGfRSQcR4nmXggXSJSncDyq1IK7?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RPv5hJprfkM23dJs7ORIca2dgfrCV2I81cMeMfDquD5whVuFUL58Y8fM9Z?=
 =?iso-8859-1?Q?72XYAk84L2jDZUCCWMuUJYx3DUzrcruJCUFjdTXy7SN51aebu0WryTfbeU?=
 =?iso-8859-1?Q?pMsJUKOBuYSUjHIWYxiFWiKH8LlAcBqZ49zTmn7oYLpzBeq3qP2keomKkb?=
 =?iso-8859-1?Q?Jx/ZOzvNqSQsJ9qzDVb+EidPxfPiGVuBV6timJpK7CFK4lCcUEd/6Q2/sM?=
 =?iso-8859-1?Q?8wXKYhybCWZj8IomEs8eqTOdxJQsSOI/ZsZOlZsINRoma5hzr2sBQwPfHt?=
 =?iso-8859-1?Q?lXDwMu9nIgGEUozr2Lt572T45NLce3MWuzXAAjYQyZ60HzkZjIoFjNUDee?=
 =?iso-8859-1?Q?vbsK2oj+uVpCxFVuHeBbYfvfEF98YCuAhllAV8rkHx13NxANYq4agYiSVD?=
 =?iso-8859-1?Q?7NfJMEgnahcugEnMx/js/t4sgULcjjqPPeUMUs/0FhHJXAlhpbGNe/oyvR?=
 =?iso-8859-1?Q?0Mv1Y59HoiGZn78oW24t5tlhArzTnUmFIKmEoKWELq7h1QfsKO3Sxx+UHA?=
 =?iso-8859-1?Q?UnqndAb1eWdlrmTrKI+tW0KlfoJH4utGJRlyBn4xEKzSZBd5vYgz79Nhz1?=
 =?iso-8859-1?Q?XDf/PK2KkpdOxZmKnDpKZD1QwtdT6UK7FMuWxxSkh2IxSSTH2jUiseEOPz?=
 =?iso-8859-1?Q?JzgtJ3gOLr9ytFxagr3uLpNNlR+OXHjEMN+k8aNYtet/z6waYRIyPHk1kV?=
 =?iso-8859-1?Q?F5e76rOzvjsTW1UMLi0cX90FcXu9Qf/K1HfbVwqYijz7p3KMwshK2WQuVM?=
 =?iso-8859-1?Q?PVVvrYpEob0VFxQWjoOXhz1dcN9jXcVQf2ZIVXYc0agzdZP33RqgNEI10h?=
 =?iso-8859-1?Q?5tYEtCQbJkgemhvWAG/mkxtg4Ag8qwHEEXlIHWnlIn+QcH9wLhr1Iy4vbY?=
 =?iso-8859-1?Q?CRQEA98jft8Ve5OCV7FQAKQwjZAVAyLPEL+/IULNaDjbrHgXwktVXLvbC1?=
 =?iso-8859-1?Q?GCDzQLyIaQZ+ayi6JaGoh7NNMPhi9lyqN4sqcBREsq89tCvNyzBWmmIlIf?=
 =?iso-8859-1?Q?baW/c9jfjcUYdT4OsV1SLNtfuSdIl6+06RKKc3i4LjwtUNwm9j7a5e1Agf?=
 =?iso-8859-1?Q?eGzL+iPbL4QoYyht4WzpBuorcy5E91dfW3wivY3+KUdPdL4rHmF1r3yh4F?=
 =?iso-8859-1?Q?MJTvznLIIH9VD0Kt62G2Kdt0ex7oY4hg9c/jI20hpAhvt+0ewI+0dxEAKb?=
 =?iso-8859-1?Q?4ZGVXUVU2wtxn0Z0MLiN43uf0ne9WxVxDAvw2EyBBpKq4xxadUPQLS9Wyu?=
 =?iso-8859-1?Q?LRpsS9x5Rs0cs69pVB5Dwj7Cnw0pR51JsZ/hi0bPebThDnFsVjoyx+rWgA?=
 =?iso-8859-1?Q?AQLZuCKwTAFLTT3Dy/S3EaXOgKABCLAXHQf0AXKHk/eiagw3ioIV4eP11l?=
 =?iso-8859-1?Q?ezGqkgSAN4/fxKQCa9Nke13Wi6pGsm84zk0c33UfX+2Jgi3EwNDQc5mK9C?=
 =?iso-8859-1?Q?/+a37KuLsTKYboncZWRLRUAxZXwFJU/S667d9kPrJalJ5l7ismlTxEuq5U?=
 =?iso-8859-1?Q?ajHopHbH3O6hEmZ7U5jhhLYVId2CS9eBxm1peAryE74kG3Wk8mkt5p1yQx?=
 =?iso-8859-1?Q?QbBNjCWEsqkX7CmiKkYSSi3nMe2CY+e2FQqU+ryFuBBjvK+s2wBDcdXH8V?=
 =?iso-8859-1?Q?oaYFvz/Ipv9y7QKQo5tClTxGyzIvCSxHugiBru6z/7K+KlvsGfzx9gzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c721b2a-1aff-493e-b0ce-08dda9fd2fdb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 22:05:05.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2wCedEAbWGqKDOZFWrwx1OpM2fxWVvnEhgiauX8kgdncBwwAuDRnU/UohRQlLNvcK8fRWFdnhItMtj9oJ5ZMAZyb565XK9kDtAR5HNYtWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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

On Wed, Jun 11, 2025 at 04:51:24PM -0700, John Harrison wrote:
>On 6/11/2025 2:49 PM, Lucas De Marchi wrote:
>>On Wed, Jun 11, 2025 at 02:05:53PM -0700, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>The GuC has an option to write log data via NPK. This is basically a
>>>magic IO address that GuC writes arbitrary data to and which can be
>>>logged by a suitable hardware logger. This can allow retrieval of the
>>>GuC log in hardware debug environments even when the system as a whole
>>>dies horribly.
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>>>drivers/gpu/drm/xe/xe_module.c | 4 ++++
>>>drivers/gpu/drm/xe/xe_module.h | 1 +
>>>3 files changed, 9 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index e16d19b44bcc..9c0e3113f7d5 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -35,6 +35,7 @@
>>>#include "xe_guc_submit.h"
>>>#include "xe_memirq.h"
>>>#include "xe_mmio.h"
>>>+#include "xe_module.h"
>>>#include "xe_platform_types.h"
>>>#include "xe_sriov.h"
>>>#include "xe_uc.h"
>>>@@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>    else
>>>        flags |= FIELD_PREP(GUC_LOG_VERBOSITY, 
>>>GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>>
>>>+    if (xe_modparam.guc_log_target)
>>>+        flags |= FIELD_PREP(GUC_LOG_DESTINATION, 
>>>xe_modparam.guc_log_target);
>>
>>is this supported across the board for all platforms and firmware
>>versions? Otherwise, what'd happen if you have and old igfx and you are
>>debugging a new dgfx? or vice-versa.
>All platforms that have a GuC and all firmware builds that have been 
>supported under Linux. North PeaK is part of the host chipset not the 
>GuC or GT.

so I imagine this only works in igfx? I'm mostly concerned about this
being a module param and then you try to debug one card and get the
other to do what you don't want (or crash, or refuse to load). For
similar reason we've been adding these debug aids via configfs rather
than module param.  If it's harmless, then.... well guc_log_level is
already there, doesn't hurt much to have the other.

Lucas De Marchi
