Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23D7C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 12:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1310E236;
	Tue, 11 Feb 2025 12:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TE7nHSmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A100A10E236
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739277620; x=1770813620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6XfvL83ylARuXm9lTHmbz7GOBNIkkmotRAiuUlOWMUc=;
 b=TE7nHSmqVFLQa2F7ZJu+WWOBBIh1lwFW3xecZCy45hRAZ6b/XIsftYx7
 ceDzjs+IQLQR24noG3Q1qtZrbZgJkz4lU221bdNm9+LD9FyRsa7mRzPMj
 ZG4xIjZxUJTPKJbUJmkPEHWYjQnt5BixYtShaUaGrKLGB3+Snb42uoPCl
 t3cOnJB+zIWWYrbj5PIU1gM5wMmgc0dTD3DT6R0BK/nw+UH0nEOZFARq9
 bZC1SyLGwIrD08usBNkmcaPkjhmUPjAXOkLjMH6Oc9JyJa9A+qPiVoV/K
 pdvFNUuY6bVMFSjQB+SXDN6LRS6spsmRBf4cOUlEzcIjVowMGzEs1AdwC Q==;
X-CSE-ConnectionGUID: niJ/8zqBRkyiZZ+a2hZlxg==
X-CSE-MsgGUID: GQT7frhnSXyfsnhIg7jeFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50528649"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50528649"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:40:19 -0800
X-CSE-ConnectionGUID: CRTVdNsWR5+KE0kBPbUlrA==
X-CSE-MsgGUID: jU22W6xaQlGieRlSRiM72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="117584407"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 04:40:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 04:40:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 04:40:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 04:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFjVJQz6mYDbbUqp3suY2jRTbEQ3utHVXSpdQH/yN30UvP2DqkqmVa1ldwITV0ssAju8om9fjhRz65ixbUGlQX/INPVZMpzS5YckkIms6bH3al5GmXBgwrjzGdhqzqAs3/qXDsX4FGx+fmsu16p1XnRsWebxutFbYylVoFKJTuQw8SPfMSjpSh+L7kay1purPK0TmB/AEpDLTFvJd3hIUOln6IWvk/SqMpa1Nh9LT/27p1e4IWl5WVKbUI/klXM+jCyNHfLmaRkc7E03jiNbXPWqiIA+lw+xVxDc5xgFXx0kdh9WC/N8Cpp8uWqlsCYHFUGgo5pzlCekgjYjYc+zfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNZrAXL/8PvkrpQgla3kPuXcQRrfDIXJSZnhNDPVlxU=;
 b=f9R+Zzjis5uYZzm5dhb+hoaPqiLmvXGR9zWgll+MByNYUpsJuYaQxc4NFiJG8vcKF10SMKTmH4ZFz3ndaEou55uj0KVgCPFu/tfbSCSgEwrWL+RYNBjMNk97f0YVOSoXnDEK+EeTYVdCOoU6z4XhPsTHHAy4Gv+P9YOypBa7QoK0nFuq+bVPNCgWZ2IcOJgZyqlRFetxVkThbDH3H9PHCy54JQpHJBfa/BsgcQgSxk8f9LRD5RJTc+hK3XouAuumJG1dqzloWFl2aQ67DGPSFZBBBMp0Mffo1tIH8DzXNGhiLnE/wCypgF5r2hlTqHT127k/OcdjIs8A+YOff5BWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 12:40:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:40:02 +0000
Date: Tue, 11 Feb 2025 13:39:59 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Release all VFs configs on device removal
Message-ID: <20250211123959.tjn4nakueqjdwyyy@intel.com>
References: <20250210225944.984-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250210225944.984-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 5250cfcb-78bc-4caa-d441-08dd4a99347c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVFWT21maDZqaXQ1dnlXb09MMU5pT2FINmFlSXVxemRGNlhLNFNGOUs4NWdo?=
 =?utf-8?B?amxudUV2M0pnNk04ZVhTMUR3Ym05aGdJZlFvSUJhRXdyeHVTUi82a3BXbUhq?=
 =?utf-8?B?SkxPT3ZYN1YzK05DZnorWUFvdWdUcVhpajA3WUYwaDRBMDlZeDRsYzRvQ2d3?=
 =?utf-8?B?VzlDUElGd2p5akl5bHVUY28rY3gwUmxlUlpnV0lNWlBKMFRFYVplckZIM0wy?=
 =?utf-8?B?cDl6SUI5RTRaV2FIMW1xUTFvaUJsRXVqVHhmeGtxMXJZRE83TDFCVmxSamtY?=
 =?utf-8?B?V01MUFNWeGN3NUVTSkkyQ0hodU1ad2dJNVFkejQyNkdkQ2dCTVBsb3poSGk2?=
 =?utf-8?B?azhheEJSYmdQZ0pBK2JQVHVDWkVTbjVkQ2xIUTZqNXRZSXJCMTdsZFNNMUVl?=
 =?utf-8?B?NzZ4dWRkdnJKdFRWRnpPQ014YlNoWTVUVWRQZEtPTU1adExkdmFBWHA2ZFow?=
 =?utf-8?B?QUdPSFZjdXBwc0JEQWN3Q3NiL1RkSjRCUDVXM2FyZmRtOHc1SS9Kc1ZNN3No?=
 =?utf-8?B?RnA5QnRBcjZFeUdJNThaemNNLytWVXlnOXJnSmVXQzk4SDF5cUR3T2c4RU53?=
 =?utf-8?B?ajZrcEd6ejA2TzI5ZTR4Q2pacVVTNGxTK1QvSDNjSlpCZDN2ZERSQTNmOUdJ?=
 =?utf-8?B?ZGxLNHBEdzNkQjFBaFEzc2pETFM4NWM2K1RyQWVTWGdrdjB2MzluUmlla0tW?=
 =?utf-8?B?YmU1dTh4VitlelU1VDh1OEhOVUZFeUI4NjNIY3VEWk14MElySG5SdWxFTDdQ?=
 =?utf-8?B?eHNpczlGcG90eUxTUnVoU1V3d3JPKy8wNjdOZG1HcVlQc3VXT3UyMXBVV3dJ?=
 =?utf-8?B?OXhYRWo2TG96ZVEwRW5xdWoxNjV4ZHhMRG0rSEpJWTVKNGw5WksyQnUyOEJT?=
 =?utf-8?B?RXJBV0Fwc01BRUFCaVZtVXF1K2RxcGxST1lBY1hQMWFuRmd4UzlUdjk2RVd5?=
 =?utf-8?B?Mi9zVklZZ2tFWUg5TkRYVnRkcnFjVFBWSlRCS2N0YU51d2NxeGNJaTNDNWkx?=
 =?utf-8?B?VkRySEEveDFoelFrVEZ0NXpQdCtNdS9lWTNFbHIzM0VJWjBEaFlVNytTR2ht?=
 =?utf-8?B?eFJJeFI1T3liT21xeXdwTnhzUzhTVE15bmd5aHExVzVJZVhReGt2TlNQVTRT?=
 =?utf-8?B?YXRwOUt5VVJTbHBodzRqL05CZXVSZkNJYzN3a1hNZEMyWHZMUVRjYVYwZ1lU?=
 =?utf-8?B?NlZPWlNUVjFjc21FMml0ODhGU09rY0FjcFdhOXVFRU9neUxIV0JVQ20yNE5u?=
 =?utf-8?B?OU81MGRKWnhkeW8rQWdwdk9tOS9zODFwYjVzSitMMDg1N1U5RTVzeXJUSFBX?=
 =?utf-8?B?WXlLbDhiNWs3N05kZ2lxUzFiTnp1TTZCNDMzbGdvcllIaXQ3VUJid0NGenhF?=
 =?utf-8?B?OEM2Rm5abFlpTkY4ZnVNUVRQcVYrZ3YzOWwwRHR3andBeVJ6ZjZuQnFTR3lF?=
 =?utf-8?B?VHZZQWtrY1NEemZkK1RQRExUakZtY1dQWXIzM0NmekNlWGVpcDdWeDlSYjV5?=
 =?utf-8?B?YXBTelZlN2ZnT3hBUmtxdEJqeE1xbWdOZHgwU2RqaXJITStaWVd1Q2w4V2Yz?=
 =?utf-8?B?Sk9mSG1CaVlUOUdsazhXWVIwOGQwSzlWcmZpcXNBYmNMc09HK2c3SDZOWUc5?=
 =?utf-8?B?YnJweU5PV2hsck9UMW5pMmp1ZXl1a0s1UzNONUxreStvUVhYcW9nWXRVNWRH?=
 =?utf-8?B?NUJXU1pGZ2NvWXlDRlZlbkJRVG5uckI4d2NManQzV3o0UUNmMVVHS0w4RkMx?=
 =?utf-8?B?TythOHl6ejVyeUc2RVREb1NQZ2NVQlZlaXFqNnVKbHJaYjltc2FzeXpCalpJ?=
 =?utf-8?B?dFZCd0c0bDdRMzhwNUVMZDZNQlJSakkxVFhBVUZ6ZkxudXQ1V3NsSnJEMzZk?=
 =?utf-8?Q?xHX0OI/xYGVcZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkVJd1BwWjVuaXZwRkNsTmowOUtYWlp4TVZlK0xqNytuTUF5cUlaQ2h2Y3JQ?=
 =?utf-8?B?MmZWRk4ya2wwWm9rUmMxbS92OWVXWE1xUjg4WG1VME84WFBSSldhL1RUMkZV?=
 =?utf-8?B?dk45ekhiYkZwL3RFMWNtU2NMMVo3ZklXVnlPSjZnbHZlWEtnMTlxR2NScGVO?=
 =?utf-8?B?ODlkK09aQ0IrN0RpNWNacDE2VGQwZ3Z4Ym9GV0dTbVdBTFh6bnZYWTdHcUFQ?=
 =?utf-8?B?K2VQZ09Tck1VRWxGT1Q1MlJtRzlrWWZPMGp4RVlUbmlJc0ZhSjFwOWlYZm9o?=
 =?utf-8?B?SmE0cjJtRnk3ZERJV0dCZUdpcjBJdmh2ZUFtRjVkaXlyQ3BzZU5rdUMxVjQv?=
 =?utf-8?B?Yms4YUNiNFkraHJsb0QvaTQyMzZmZVRSTnA4S0VCK0hYM0plNDhhL1hwWGl4?=
 =?utf-8?B?cG9Qb0NwZ0JWQ2dja0h3Y3hYNUthUGNNa3ZmUEZUUk5jNWdCc2FZWEpMVEUz?=
 =?utf-8?B?RW82azJBdjlWK2VsbVhsQW5KalpxTUI1bDhKdHlhYW96SnY0bkRTc1BqUUpF?=
 =?utf-8?B?MXNRV3QxdTlCVi9KcHpIOGczUHhpa3IvQTFrOXAwU2d1MDhoM21xd0x0ZHdR?=
 =?utf-8?B?TlhlUG10ZzduU1lSc0xhc3l5ZGthRko2dTZrUmg2eTM0L0o2K0hhV09tRUcz?=
 =?utf-8?B?bUtBaldqRFpaWXhjNjFlcHBrTXVYRWRCa3Bvd24ycmZaV0ZaeVRVRWVwQThB?=
 =?utf-8?B?bzhsMy9HRnVwYktURXNYVVo5d3R0V2d2UWk0aUFtZXZOdnRmR2dxNVpzRm5i?=
 =?utf-8?B?eENJTDh2YXpyTDhSNWhkNXlwUXZqMzdha1F5MGdGSk1RWTZVNVo2bzVBNm9r?=
 =?utf-8?B?MUpwMDJjWWtvdmJRbUVoZUFsZ1Axb1FOSmYxdllzZEpXbnJ3b1drRFJOd1NZ?=
 =?utf-8?B?SGNZcFlQR0RXMmRjL1RkVEpjMTUrOThkNlFuSGZ3L3Z6TW9DcUZZcDZGVUhy?=
 =?utf-8?B?MENkdnVHa2hwZVVhSjRtVjJpVEhpTEFDamdzR1FsdlU0aTZtU0dVYUNHaEhN?=
 =?utf-8?B?dzBkTThxYnpVS1Q4WWhhVUR4ejdXZm16TU91RXJ4akZpSzY3NCtwL1MyeXpD?=
 =?utf-8?B?ZGJac1ArL2NTQmIxQkFKY2s5Q3hsLzcwc2k5MVFVTlkrSzNyNi96V0VJSE15?=
 =?utf-8?B?dVlHR3J0NTExeUEvMWQvRnkzbjJNY0YzWTlKVzBCeTNVR2xWRTRJYnprQmJw?=
 =?utf-8?B?SGlBL0RaaU1tai9sRlg0VnUwaXFiN3IwWHFsVFQ5ckExbEVRL2JaOHJVOHJy?=
 =?utf-8?B?NENiSVRhQW9BR3p6UGJwazdiNVFSQkt6bXRSbzNyUGl0Wk92NyszUjQvMDZB?=
 =?utf-8?B?UjZiMkI1cnNWR2V3eEdkQjhzemdWcm5XMWRFK2xHenIvU1VrSXVVejVtUm5q?=
 =?utf-8?B?M0RSTE9TTXhkZkd2L0g4UjZiNUM5N2RiMkVEM1BJdUg5eTlWWkliWjlPWWZn?=
 =?utf-8?B?Vm41WXBRaXRRL1lQZEN5MEtGaTBLdFM2ZE5aYWR2aFhucW5yYzhhaFYxU0lM?=
 =?utf-8?B?YVB2YTc0ZzVjQmJJU3Ftckl4bUMxS25ZaVpMZVpsUjRWeHova3VkNzkrY0tM?=
 =?utf-8?B?WWZLcmM1M3VzUDl4TjRjNzI1b3BZakp4bWhhWXBwT3p4SkhNMzEzWnNnSm9K?=
 =?utf-8?B?RGl5dXVESzM1UUFucC9GUUMva3dUYlFQSjFhQjRMVkI4Z0UrR3FVSjdIWndp?=
 =?utf-8?B?dnlpWGhoN0tabzQ2dE9wNW5ZMjkrNFQ3ZFo3RFVaQlRFYmR6VW1Kb3luSXhl?=
 =?utf-8?B?bFZ4R29LWWh3clBETU84RlRGMS9OVkJwOWNsM2ZZOUNJNldacU9jRytJMkF5?=
 =?utf-8?B?alhla3ErcjhCZFF0Z0RsVXRFRk9PYnFQMXBETVJNS2w3MHVoQk1VMlNxbVFU?=
 =?utf-8?B?Tlo4RGlxN3MwcnNBOWxCMU1aUkVpRzVVWlhQdGtnUlFiTkI5aEVxUkRPNEkv?=
 =?utf-8?B?Z3FrSmVBQm1MajRHZkNGQUlTWkZldTd1Q2xLY3RFa0p1TmlPT0wwRmRTdnN6?=
 =?utf-8?B?Qlc5V00xdXF6bUZva0l2RXpCRzVuL1JrbXA0a01PRkdtalBVM2sxT3FteXdS?=
 =?utf-8?B?ODNuVndQYk8yVEZDbEZQV3B2YlhyY1F4a29JK1JlbVdLZ3Eyc01kMzNvd09w?=
 =?utf-8?B?bWJMMHIxUEJtTU5ZTDRlOUZZSkExeExSK0tNaVZ4K204dWEyb0J1WS9Gb0VE?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5250cfcb-78bc-4caa-d441-08dd4a99347c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 12:40:02.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2n4sloemzV7kPsvdcPDcueSKP+BfUvNzmIBu41HdEgWsvNGa/o63h2F9ZBFSHmA/suU/zhSQnt65A9uXDjlHfnof8zUFKmCBtUqEiDCeh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2025-lut-10 23:59:44 +0100]:
> If we try to manually provision VFs using debugfs and then we
> try to unload the driver, we will see complains like:
> 
>  [ ] Memory manager not clean during takedown.
>  [ ] RIP: 0010:drm_mm_takedown+0x3f/0x100
>  [ ] [drm:drm_mm_takedown] *ERROR* node [fedff000 + 00001000]: inserted at
>       drm_mm_insert_node_in_range+0x2bd/0x520
>       xe_ggtt_node_insert+0x52/0x90 [xe]
>       pf_provision_vf_ggtt+0x1fa/0xac0 [xe]
>       xe_gt_sriov_pf_config_set_ggtt+0x79/0x7a0 [xe]
>       ggtt_set+0x53/0x80 [xe]
>       simple_attr_write_xsigned.isra.0+0xd2/0x150
>       simple_attr_write+0x14/0x30
>       debugfs_attr_write+0x4e/0x80
> 
>  [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
>  [ ] xe 0000:00:02.0: [drm] GT0:      total 65535
>  [ ] xe 0000:00:02.0: [drm] GT0:      used 1
>  [ ] xe 0000:00:02.0: [drm] GT0:      range 65534..65534 (1)
> 
>  [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC doorbells manager unclean (1/256)
>  [ ] xe 0000:00:02.0: [drm] GT0:      count: 256
>  [ ] xe 0000:00:02.0: [drm] GT0:      available range: 1..255 (255)
>  [ ] xe 0000:00:02.0: [drm] GT0:      available total: 255
>  [ ] xe 0000:00:02.0: [drm] GT0:      reserved range: 0..0 (1)
>  [ ] xe 0000:00:02.0: [drm] GT0:      reserved total: 1
> 
> This could be easily fixed by adding config release action.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index d66478deab98..c08efca6420e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -89,6 +89,12 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>   */
>  int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  {
> +	int err;
> +
> +	err = xe_gt_sriov_pf_config_init(gt);
> +	if (err)
> +		return err;
> +
>  	return xe_gt_sriov_pf_migration_init(gt);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 88bd9d97ba5c..3e2446277e48 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2356,6 +2356,31 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  	return err;
>  }
>  
> +static void fini_config(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	for (n = 1; n <= total_vfs; n++)
> +		pf_release_vf_config(gt, n);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_init - Initialize SR-IOV configuration data.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.

If this function will be called by VF, the assertion will only occur during the execution
of fini_config.
Wouldn't it be better to make this assertion here by inserting the IS_SRIOV_PF assert?

Thanks
Piotr
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
> +{
> +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, fini_config, gt);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_restart - Restart SR-IOV configurations after a GT reset.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index f894e9d4abba..513e6512a575 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -63,6 +63,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>  
> +int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
>  
>  int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
> -- 
> 2.47.1
> 

-- 
