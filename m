Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06D9C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 14:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B44211A498;
	Thu, 25 Apr 2024 14:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rwh3wMtE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48DD11A496
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714054944; x=1745590944;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6rnU//GRHjJkMSX+zYmjoWzhJlUOjh/SnNxSBEiqdbE=;
 b=Rwh3wMtE98ADSyNkhHiLjWbmjHxvpdOIV0ifeRiOWIIWY5/q4wOrJdQx
 NTxtwoZKgKAuCxkQi3r/v4aQnbxnhszpgkVmUylV3Y7TE3WisT7DGSH0q
 2/S5qTf0Sfvr6GhY6i23BZrF/ispmdhD/XNHytPpJxqGf7LXFB7bPLdvE
 21fMy+0eJ43mUdFxSpbyHmP9Xwkfmvrw3kQLyrTdW37M/bdZW9LrVVZ+4
 Cbms+DdilkRPLX8cUxyWUckHNlRn64X/+UViQvwXIT7fRI1d/t0ylQAKZ
 +XLNVSGfy7IArsXuVSyNkIm1G7s3mmv1t3zLb99OReF+dMy22F7GjaAVz g==;
X-CSE-ConnectionGUID: 3AdCjuMXRz2w89mgX9VvJQ==
X-CSE-MsgGUID: vwLMS2mYTF2rcXeXSlzvZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27259104"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="27259104"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:21:36 -0700
X-CSE-ConnectionGUID: eXohHsYRRt2pq3ccjp0HyQ==
X-CSE-MsgGUID: U3fHLzjPREOI6sXPMie4oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25077174"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 07:21:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 07:21:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 07:21:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 07:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAlKVZwtLlJV+ARgDdR0yQNAfj2inpkQKfeC9AE6MF0YE6XeuPmyDojucgJUlxZGuIEcXr2KRxpCxAAyYAah3/y4EcFiD83H2G/96fmyffHDuBgtoFs3Dojokj2PiBDYuQPfZlFchWJyqTs4pjF5Fg/hpcCjdDxjTAbPsPQwZ1o8sTb8dLkN6mP1eyDoDIi1oUApLX3K7dmcnLWa/3H+e8s9u0odRDNm3Ykke0PMFvRjj3wVZnZpcNyM1D6AF3HRTxDGDRtdsiIK/4DVSE1/SFcEWx1TMG/ftOsZNblIj/61Hk8c2BrnzEY7+5kxnosJRt6JUz0H7g7fY5PFfPjLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWCSYh4JTtJDdDM2IzBrMCwCtDZ4qBPa3yMOtGz06I0=;
 b=YNTGwa3Ze2YJI2SiI/tmsYU19qSDe7Eve2JekeXrevmkTvRws182k9yDsqcmcNGJfKlvP9wr5iet6j5be2iqBng/fHSfMOGEaI68j4LXB4ye0/0cjZK9Gnxv3rsZZTTzq7Qa+SBpi1tvRzi0pbKseirIZRv0JyooEM4LP2V//BtUeobZoX76M9zR2Ka6bkHNID98xG99eV267Zq6wg0NNKVAGtfhPX6NeLTjtk+24BpS7MS1+Uuso+Z11iJBBRDr+pgLRonwPIzo94wjLi620oWjD9WNJi5tneW++r4G8hRj4snSHOtINBe6Nb/FxA0RanE2u80kIgG2gA0/riPsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 14:21:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 14:21:32 +0000
Date: Thu, 25 Apr 2024 16:21:30 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Fix typos in VF CFG KLVs descriptions
Message-ID: <20240425142130.yc2x3j3pxtz2li4b@intel.com>
References: <20240424140506.2133-1-michal.wajdeczko@intel.com>
 <20240424190005.eavg5mlvhwgwa77m@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424190005.eavg5mlvhwgwa77m@intel.com>
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c00139-ddc1-4d5d-fd08-08dc6533019d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlETm4za1liK0hsUGh2Y2g2aDdhN3N6YW5BYmZKTnQvbU9nTlM3eG9jYVVk?=
 =?utf-8?B?dUxMaU11ViswTm1Jdy9wN3lHdWwrMXNIUXZJYmlXT3hjUjh0WTRyckFLdkhz?=
 =?utf-8?B?OGpzVS9QVk96ZDg1NHBlTytxbU9TbjNsZllaYXhnVkwyYTRLSmlLVXVlY29i?=
 =?utf-8?B?M3hUTStzT1dRSkVoZWpQWWd1MlNscmQ3VW01ektKOExsM0ZnL002MWI2NGhr?=
 =?utf-8?B?cjVhSnJlcWp6V1ZuMTJNaEtWWGxtQWNNNHVJUmMydCtyWVZzMU1Nb1BkZWhQ?=
 =?utf-8?B?Qkhsc1BiS3Y5TldCekxJaVpqb3o3MVpoMzN1NWZxN1dJQURBZlY1TTNud01V?=
 =?utf-8?B?TTR2MzVmS2U1OEtBeUlGVU9Cd3dQQVNyYTFKckgyYTRoWEdUWmtqWi9ldXF5?=
 =?utf-8?B?N1ZhaGc4dFZFKzE5NlErNmdEc2M2UUVnRFp6NHhTY3A0eDd3aWdrMU9QQ1o0?=
 =?utf-8?B?c2plZlVhQ0VKbTFUTGFGMjZxU1ZMaXpVdTZ3RmhKeGd3UGZVN0dHUFMvRTFK?=
 =?utf-8?B?L0p6MEhRb1Q2Z2duOTBWQnhLQmJ2TDRWTUJRVFREK0RwQS9peUc3QnNPMHZL?=
 =?utf-8?B?eUx0MmZaV1ZadlJlQ29IeDZuSXY0cy81K0JoZUQzTFA2M01ITlk0NDZmWit5?=
 =?utf-8?B?UHBIRk5LRmUzWTJWdlpGVUUwZGtVMWwrekxqUHNWd2hZNndndy81alE3Q3hG?=
 =?utf-8?B?dXRHNFBGZEw2bks3aEJ5TXN2Z0Y5NllIanB5NTh5Z3NLL1pKczRzRzU2b0NS?=
 =?utf-8?B?NlFGbVFHVTJqY3h2V0V3MHVMSkwrUU1oc25sN2F1WUM1RUlRcXZQUlJrTmZZ?=
 =?utf-8?B?WWsyUzZPWS8ycGFiOWNXZWpSVjBoTEZqcDY3NVNqamJFQ2w1UkVJa0JnRnJa?=
 =?utf-8?B?TVZoVU5DNWExelZMYTI1Ylpja055VnlDTjFRclVOTXhLSXZELzVSS2gwT1Qy?=
 =?utf-8?B?ck4yN3p2VGZobXZyR2NydTNxNWYxSHorKzRMK3ozWVBhQ1UwUEd1eFRKQ0gw?=
 =?utf-8?B?NnRCRGV4TkJvZlZabkozSmIwZE9Yenk2SlBqaXdNcVRPQVNSS1NlT0M2RnRN?=
 =?utf-8?B?UWNYcWZYU2RaWHFPdjQ3Ujk1TkJJNVVldjk5N0VkVkQ2amxSTUM1bkdYc2ww?=
 =?utf-8?B?VE1zUEdoYlNsaVFOV2l0cVUxWWNXZUtxTm94TUxFWjFrbWxMM2ZuRUpySVQv?=
 =?utf-8?B?N0ZCU0J5NUtqK0c0SDNQOW1IT2c2V0lOYm5pRW9xRDlMeFBkVXZFZUxKRzli?=
 =?utf-8?B?OXRFKzVLVDF5MldXbjU0bWREemRKR2k4RTAvSyt0MTV5TVZXL3krZTZyMUNN?=
 =?utf-8?B?STVhR1IvZzcxbFlNUzNHVXpHNzR4NWxaemxybmYrOFd4cG5HU0JzVDFXdU1V?=
 =?utf-8?B?L2tBbTkzOWJVQVdlWmpkemtwcVNFWWszS2tqYjNZcU1URTV1Wm5iaWZyeXhs?=
 =?utf-8?B?SjBtZFphYzQ1VUF5TXIvc21VVFpwUlk5dThIWWJQaWY2bjdOQlFESC9rVXhr?=
 =?utf-8?B?OThsZy9iNWVsUUhJbTNUdFN0NUNyZVMrUDBjanVZYVZNbm1mT1J6RnN1bzE2?=
 =?utf-8?B?ejJCdS9YTlk4KzFaT0FVeWVRK0JENEp6VEtIMnV4TlFkQVMrd2FhL0lUZ0lw?=
 =?utf-8?B?YW9PM1RKRGY5bGFQM3JWQlNYcUFUMjdjVFQzVTc2eERURkwwNmp3THdyamh0?=
 =?utf-8?B?ekEwckxNSkdUVEM5RVlCRlA3bGUrWEtsZFNWd0hKSGRjYlhPTDh0RU13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZhNytiSUs2aE9GM2k5aGdaSy9ZK2Y3QWRTSloyVmxERWJIM2JRL0NtZ1Yy?=
 =?utf-8?B?VWliSG5tRW1jTms5b1Y4SFJSZ3lYdVlENU9UKzQxNi9MSUhyUjdGWGtISUVF?=
 =?utf-8?B?VFlxZWhwTUJ1UEFUdTZQMlFIMXBkQldKT0c0UWVLQWJjRjkyNFB6UVFNU2ZP?=
 =?utf-8?B?d0xnL3B4b09tZDRHNHIrM2xMK284ZHJTbThhbS9NZjkyT1JQajVoV0R5WUk4?=
 =?utf-8?B?OW1mRzRWbmVDdzF4bDM3c0xEK0xVR2pFcndkdFFCa3NyUFg4OWxGMlJGczdF?=
 =?utf-8?B?MkdtLzZma1p2TUZjNS8vTFZUelU4QVpIWUJXT2s4UXI4cUFPalFodFhzRHNQ?=
 =?utf-8?B?d05LTEJxNjh0dUNvOXY0aElHVkc1MUtPOEFvY1djV3c3VG5hSDNFTFczck53?=
 =?utf-8?B?NkVId2VvQitETkNINHVLbTNKTVV4Ym1CNmVDTExRQTRxM2Q1azVRdHVJcVlU?=
 =?utf-8?B?d2xIdnp6QnE0Q3huMjY4MlpxMlNNRW0xSTdmSTAyckN5T09hN2UyOUxXaWIx?=
 =?utf-8?B?d1kxeDdHZzlxY0hpUm5hWGEzQTg0NGJFSENGeVJ5UytlTmc2THZjclhSWDFz?=
 =?utf-8?B?akhTZ1dESCtpVFVHUS82S1k1UXRlQ2RoMnU3RWVhWDh3TmJaREVTSGtheUc4?=
 =?utf-8?B?T0pQWEFlUEVFL25DcHljTWhIVlI5bVZyc25tTU91dFYwRXg5MzdHN0dCaEc3?=
 =?utf-8?B?N0FGUFFVSldWYnNTc2dVcEIxN3E5bnZVRmJHTkxIM2J4UGlRd2tZVEI2Slpi?=
 =?utf-8?B?SDNtQS9ld0Q1aUpyN21jQmx3QmR3bk5wL0l0TER0WTVGM1NqejJyYllLbElq?=
 =?utf-8?B?Nnp6RW45azVTTVBVUzVFb3FublJGNDRSWmxjYjNSc0MvTjd6SUYydmxwQURK?=
 =?utf-8?B?MXk2SEtOZkNHU3Q4RG9leTYwVFQ4SVhuVXpBRk84ZTBRSTZMaWlnRURuQXJa?=
 =?utf-8?B?cyszUGhEQU1EMU1KSHdhZWxYMm5kcU0yTExGYnFpMmtRWDFaNkdIbkIzWWNB?=
 =?utf-8?B?bHN3TDdReDJaS29RVVBEVkMxTEhpYU5od2loRjhiL21pOHp2SFFnc05VdXZT?=
 =?utf-8?B?WHhaR1Q1dkJKVm9WZUdIOS9zcUVKV0lEMFZYVlNaZE1WbEt2OVZ2d1liOTgy?=
 =?utf-8?B?QmxZaHJIRkNiTWc4SGxRWCtEZmMxaHdGaElaU3NnRlYvQ0hZbXRwa2RzRy9r?=
 =?utf-8?B?TlhocGFtUnV2ajIzVlgxOEtTS1FiQnhJRXJXY2hJWVNLM3JMT2VROHFXbWQ0?=
 =?utf-8?B?RVpUcnV2S0xsRnhZU2FCSjBQbjNwUDlBYzZrWGc3SVBremhiKzRPcHp3Ky9p?=
 =?utf-8?B?N0I5dHlMcm1tVERaRTVHSko1ZEtuRHN1QXVDaHB4M2psd2hPT1VWcE12amRs?=
 =?utf-8?B?Vjd0MkphVkhmdVJDdURWVitZclFKVlVZalNvR3Vtd05MY09MbFVkb3JBb04r?=
 =?utf-8?B?SGhKc3lGQkk3QXEvWFNNZWV6aWk4bTloU1VNS2tNOG9ZNkhIaTVKSkN2ZUln?=
 =?utf-8?B?TlRuTlBPQmUrQXBhRTBMSnk3b3RqOW9lT1ovWWNLazFUcGJkZ3RSdWl5Y1JQ?=
 =?utf-8?B?SFJIL3RJUldOY0pRZ1JQZ0FzTUhxNU5uWDh6czZjc3huaGV1Z0toSVEwYXVn?=
 =?utf-8?B?WHN2SFM2eFJaZEhMcXpvQ05hZk10VHdGUDVDY0xhZEQyK2MyTmovaldvT1lo?=
 =?utf-8?B?YXBVN3kyM3JvbUV3YkRERDFtcnZWd3hlMDNsbHJzcmI5aDdwYWk5TEswMVlu?=
 =?utf-8?B?Sk5kWTVwWTU5QTdGYnlpbVBaRk5LY2VwK0pYdjliS1RzZmZvbGdrejJ1R1Q5?=
 =?utf-8?B?L282dEdpVHdPNnNBb1VSZ2U3czJpVnYvMzkxemxTUjExNklKbGxCRzJHVVlv?=
 =?utf-8?B?azQza0IydjZvb2RoY0RBaHUyQWFNa2x3NGFpTG53VUVGbGhaM3ZlZkZnanpq?=
 =?utf-8?B?bmhKYS80dUNxUjAyOEtJb1dvUXZNTTNEWGwrK0JCZUVSS3luNnFKMmh4MVE5?=
 =?utf-8?B?LzFQc3AvLy9sTFN4eFEwZytrc1FuVm5IT1RtdXpvL3lBaEtHNjJPVjd5eS9I?=
 =?utf-8?B?MHBTelFDY0VraXlrd3graXlvcXdxYmRRVWFwZlJwdk9uOUErNjljYitjMzN3?=
 =?utf-8?B?UHcxbE9tYUhoTldxOU5XalorYVVRdW5BYndVQ2FKampiNm5vVTZVYThSa29y?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c00139-ddc1-4d5d-fd08-08dc6533019d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 14:21:32.6100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbFTIsbYvPCzePXRKzCsx/65NrKhzngILxMOoY0x1jdPA2QXRuBDTSlB11kyBw5/2kAtnB/SSpNiCOL5maaKcadQ7zGP/6PQI+Vq2IG9IlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on śro [2024-kwi-24 21:00:05 +0200]:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-24 16:05:06 +0200]:
> > Apart from the obvious spelling typo, use the correct values for
> > infinity quantum/timeout settings (it's 0x0 instead of 0xFFFFFFFF).
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > index e53ffaee2fcd..5c1d40432ca0 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > @@ -194,9 +194,9 @@ enum  {
> >   *      granularity) since the GPUs clock time runs off a different crystal
> >   *      from the CPUs clock. Changing this KLV on a VF that is currently
> >   *      running a context wont take effect until a new context is scheduled in.
> > - *      That said, when the PF is changing this value from 0xFFFFFFFF to
> > - *      something else, it might never take effect if the VF is running an
> > - *      inifinitely long compute or shader kernel. In such a scenario, the
> > + *      That said, when the PF is changing this value from 0x0 to
> > + *      a non-zero value, it might never take effect if the VF is running an
> > + *      infinitely long compute or shader kernel. In such a scenario, the
> >   *      PF would need to trigger a VM PAUSE and then change the KLV to force
> >   *      it to take effect. Such cases might typically happen on a 1PF+1VF
> >   *      Virtualization config enabled for heavier workloads like AI/ML.
> > @@ -215,9 +215,9 @@ enum  {
> >   *      different crystal from the CPUs clock. Changing this KLV on a VF
> >   *      that is currently running a context wont take effect until a new
> >   *      context is scheduled in.
> > - *      That said, when the PF is changing this value from 0xFFFFFFFF to
> > - *      something else, it might never take effect if the VF is running an
> > - *      inifinitely long compute or shader kernel.
> > + *      That said, when the PF is changing this value from 0x0 to
> > + *      a non-zero value, it might never take effect if the VF is running an
> > + *      infinitely long compute or shader kernel.
> >   *      In this case, the PF would need to trigger a VM PAUSE and then change
> >   *      the KLV to force it to take effect. Such cases might typically happen
> >   *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
> 
> Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
If my previous A-B was not enough:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> 
> > -- 
> > 2.43.0
> > 
> 
> -- 

-- 
