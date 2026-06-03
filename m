Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D06CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079E01122B5;
	Wed,  3 Jun 2026 19:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbak1kqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683A31122B5
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780513809; x=1812049809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jLR/0rvDy1oE6nzwv8kIZQO6J00j1eGRRB/WtXk9PlI=;
 b=mbak1kqFCwjkWmYmj4cs4VjW9fb0WaOxIUqaydya6wlbA8wD93z6ujNm
 xIm/39YuH90zKc+GN69rGniD7oQ8jISqkxPirlTdN1i0f4rz48PJr1zz7
 5gc+A7m1a5o5DZUtWrFDS0wQg+0zXfvvla17pb8VglrdVsuWf5tSmtm7M
 dm6qX3uh3whSb1CusGv+hexQUtadwbIH1IydOJMzfkxUf+nh+atK3E+Wn
 x0PKT8qHn6agW2gaglEmmWKPMBfiv5ftY/ie+3EdVzJyizD+IHHJ3bCjf
 anqgOfMkMvR8SCeVxzfVJNUaJQQm8ywDlfxL3U45nUuT9831XoHQpzqbp g==;
X-CSE-ConnectionGUID: 9ok0spx8ToGq7gz25eXbrg==
X-CSE-MsgGUID: k0jwDu3YRtqCx4MsBCp+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="103996087"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="103996087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:10:09 -0700
X-CSE-ConnectionGUID: xmU+WSKeTY6OI1z0j2GKqQ==
X-CSE-MsgGUID: QZTT2mRWTLy38MDBCeYGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244170219"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:10:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:10:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 12:10:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4UJEsWOb2T7ZmlyBU1+32gaxltmPqBLCHqFTsRr9ca0BXi6zzut74wqeQ7/Gl5IZH7peXyOMvSgvQ/MbVj6F2reG7gEPyCCczA0V5qbRXT+hUN+vi0Y4ErVugm5lXh+H/VN1SQBp4/HcZj5KknHhuirr9CW5PUPKwmaCgIAldEEz040fHtUWYQDHBpAOFEX8mJlxp6MR3e6jS6S+7+bZj+BJlN/5i3xnPqYcrviGVjyflmPB3Yj7XzZ/P2dqacU4fZrTdG2AeZF4xlU2I/nZoddTMip2Kg6RVSH0JSq7Q1jDG1jUyf1rhgDfdE8c2ArCH/CReftJi+GYxRSXHAYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSGk8NnZojjB+0vfc1dDpNew0gEG/XefhV0Df+BeBtY=;
 b=aiyolIExnDFPFi9U1ZnbitCK4FAspFpKX48+RNlR4qiy1xftqCe1rEso8fvtTZtt16ORR+luzvqprCTmgpv+3ZPq+gj2V6b0Sw+t6Z0Trsa8WHy0ABXZ2+cZ9hXmwvUiNH0Mvx7yXcS4h68+Cf8oB2OOEMl09eQvWXIY62xJTZLQEfUI5t9IQvAmFJZ9QLMiLMSWjXvt6Mq3qq/adOEdai4ZFcMFFVJdJCka/lyEQDLMZnAFzSm71Aha8S7OeI7QUYT4nrpQFFmUMBVFAxGutqRsBtQFU5D+TdhTYWl62pDluFL8A3kbGjEtxG9VZi2iavTyZnRdAs5ouL0dvwrijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SAWPR11MB9711.namprd11.prod.outlook.com (2603:10b6:806:4cb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:10:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:10:05 +0000
Date: Wed, 3 Jun 2026 12:09:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/oa: Rename last argument of
 WHITELIST_OA_MMIO_TRG
Message-ID: <aiB8B2FZMbYdCoFl@soc-5CG1426VCC.clients.intel.com>
References: <20260602230908.2350117-1-ashutosh.dixit@intel.com>
 <20260602230908.2350117-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260602230908.2350117-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:303:2b::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SAWPR11MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: a5aa3b64-0bb2-40aa-b4cf-08dec1a3b838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: raQJBSVdsZldQmnj+sOstghKEN8EJsm/UWik86nCrcQXUU2lSuHF4XnqsWbAjZ92cS1SlFxTZ9ALjOVVt0DWMSRuywcrrXTCQcQiu6TEAgrEzIjkA5wYd9yZncSD1fEyrNtt1NNk2GK7XNrf8W0BosD4DyV9QgvTZ5SFi7sPSAg522z1i3QriV76OZc9//8LAdfkhGU8+59jBuWc3h+YZqD3S5Pmm7SURtHrh7pIuIQyGgXLDZoj3zjJXc/ktC47y3hzRWNHfMHKnHB/OQTvlWzZehmWTQsgziE5n8LsuLlMmmzdp0Z3h8sHV2O3J4LSsZ+a4l82sxCmFYcQsKe4n7QLUoUJRETykND+bnIL07aIGcADixYoS9xMdkLo1U4XLsmqCXr7iZYXgQUx7IcIx0R3pTVwqt3t7Tp5+rt4izglz2WGPVsnT2f2QEplht2eZDvtkG5qSyuufAJ30XXwXkGZYk/Dd1c7a92xW9mrdVQ10cuXK6417dymX7UJX1+gZ5uoNCTPjZ+wibyuUPH3uEu+XyXgVxEuyq9kPTTpG+z8BCg4bC4I36y/MpTycUMK9GklrGNKeFde6ibwFl6su8tX6iCukNEr/KKE1y1+upZQJMg2z2c1sMuqwGp48I2RHpvlm4JXB5r1rFf5GNaQ0hNAIhevha+I15SQ43m1isH+zZlw+UF6r820+/c5NgfA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkk0V2QzWTFZS0tpdmpBdy9NbWI3YkZYeXY1anJESTNZT2lNbmQyaUs0eFBq?=
 =?utf-8?B?T21lOWp3N2JBVWpMWWxpaEUzRFlMUURiOGFiTFo5SWYyY0RqZ1lRN1ZBR09U?=
 =?utf-8?B?UHdnQWNNSG9ESm9YM3IwdG9QdGhsczYrby8wbDc4R0FaazY1bmZrY3YxWlBP?=
 =?utf-8?B?UUc1Zzl5WGNyRjRyeUNUaktwRy9udHJnQnlBVlFVZTF1OGZEdU9DZDRTKzk4?=
 =?utf-8?B?dW14aTdtY1Z1eCtmWU5wM1Y4K2owaEMxV2V0eS9nRVd0c0dpdEd2eExiTm92?=
 =?utf-8?B?Nlo2aldXWWVjaHVwVGNwUlJXcUtZbTNBaFZMZko4c2ZuSWM2RklUNHFpR0tW?=
 =?utf-8?B?STRUNDZidjgrVHN6VmlZUit6dzUwN2hCYmlsbTdKcGxkbDQ2QU14dG5MNlNj?=
 =?utf-8?B?cnQ3UnUwUU5IYkJ6NmovY2RDK1c1UGZKNU03d3hBbnNSUmsvRkczQyttenlw?=
 =?utf-8?B?TkR4WEsrOWNuRWNkSC9YY2pjR3Bna2NaanpabnFjSjQ3eWlZSkFLaHQyT3Q4?=
 =?utf-8?B?czhxNnNwdUlWcTZOR1pUNjFvYy80ZjY5b1U2dDBsY2kyZ1RaWmk1SnkxVDB4?=
 =?utf-8?B?MCtLVVZXZVN4ZzhSbG1tRWV3VTZOOW04MGZpUUVKSTlXaW90Y0hNbTdUSStY?=
 =?utf-8?B?SUVBQlhLVUNHaEtibUFPR0REQ3hHYjFCRjlzNitWUU9QYlZQenViemFIN1Jr?=
 =?utf-8?B?UHMrLzJwMTFDTnRLT2hIWGJCNm4rQWk4UXNEZXpmYnVERE93WWtPU2VLVWFM?=
 =?utf-8?B?Vi9WemZ3RTZ6TXVTd0UwQ1VJRTNFTDUxSFFxNzdXRzNsNVhZZGlpWmI2STdF?=
 =?utf-8?B?ZnorMHFnWTBTbGI5L2hhUVRRY0c3NzdUQjY2bXJzRERVb0c1UGV3TXg4Y1NW?=
 =?utf-8?B?OFBiUE05emtCQ21JUnVwRWVtMWdoMEJlWVZzVlNxWGxNK24yaFIyT041cTJq?=
 =?utf-8?B?SHl1WHE2SUs1TlZHMWxYa1ByaXp6M2k3L285Y08vSWI2S29pN3FGaWRMYVVa?=
 =?utf-8?B?dWVpVlVmVXM5Q0JLd3UwMHBYSTBKM0M2VFJia1BsR2cvc0dBVE15VnFNUGVy?=
 =?utf-8?B?QTRra1QrcUJQT3NzYk1iM0x0M3dWU2ZFYmMyVGY4OXJnVm5xYlhDWUNEbnhi?=
 =?utf-8?B?VlNpb0Z4UnVkeERMOEZaMmczSHF1WnVKSzduODhPa3ZsVENjUyt3VVdyNVNR?=
 =?utf-8?B?R2ZWN3ZxL050S0k5MTF2cEtBNzk0RDVyZVJ2QW5idW90K0FpTVgyV0tIaXFR?=
 =?utf-8?B?TStvR1JVelAvZ2FIeGViaUp5WWZZTERDWC9HUFBHSnJNSFVtbTdZRE11KzlW?=
 =?utf-8?B?aFhJTCtmdGphSlBuU0hpNGxCamNjR0w5U0hJZzlKUFdYQjhRemRHR21wNm13?=
 =?utf-8?B?dVZNQitzM2c4QUpoeERnVmpNcExqc2NiZUFYaWpTY2tUaWFISGhPUUhEaU96?=
 =?utf-8?B?UmlVZDFzcmt1eGUyTGMvc2RaZERtNnZpeTZXbW5ST3N5SStnTi8wSmhZVTA1?=
 =?utf-8?B?QzQ3WklXREJMRGFhelp5Q05WNWFCenFxOTM4R0dMcXZnN2l1Zno2MnVhdGNp?=
 =?utf-8?B?UGNlYjF0eU5nS3d6S3JON0pLbHhhd1piR2hhZG5OSTRwY1hlcmhXcGlBNkxa?=
 =?utf-8?B?Tm91QnFqQitLeWRiWFIzc3hwaEo4eUZzTW92a09YZ3JhS1ZPdENFYis5T1c0?=
 =?utf-8?B?dWhQeElOSzZ5cVdCcUdscHphdzVzeWpCY1lxNW5NeFBkQUV1VG5JTWkzZTR1?=
 =?utf-8?B?MFBaWkx3NWNrWWdJTFM5enZ3SXNVYSt2UkF6U3MrR3l0Z1M3d0VKYy9KZDNl?=
 =?utf-8?B?ZkJRcTBWVnFZU0NWc3VCdVNLVTM1N1JZbzJSdmdCWldkNEFqT2VRdEZJQXN3?=
 =?utf-8?B?UmFyK1VmRUNTcDA1UUk1S2szUGlmNGVxTnZ4RHVCcUtGdE5Wa2ZlM2NPL3Uz?=
 =?utf-8?B?akoxWXRTZlk5UXZDSFN1UEhLeHVXM0ZCK0NXb0NSZWNhZDRLYlR4cVpKTHFZ?=
 =?utf-8?B?RlJZZXhZNU50MFVrQllBblJWTUdsRE9uVkhVOXF6cks5eHhOL3lWQUNjT21j?=
 =?utf-8?B?dW9KSzBIVFhWZVBhY2VDRjJCb0U1T3hsL0d0NDdMUzBQaW92WXhCc2pSdjVt?=
 =?utf-8?B?a3ZDekNDNUNnTzcxY3liV3dzSitjUnRqK2l1T09BTjd1ZlRBOGkvNkk0ZTF1?=
 =?utf-8?B?ZW41a3pPdzQzdHhIWDJWNnlhWHhFcnJtdFVGNlY5UFg3QmtTVG4zZkJzTEZY?=
 =?utf-8?B?d0FENUU5enhMR3VEd3FjdjhWSWJGbkhIUUpscFFNQmlaSVEySGVqMExGY05M?=
 =?utf-8?B?OW9RUmh1c0FoQXBRNldicWpMOFFWamxWMSt5RjlJRlRQZURFRTBKUmM3ay8r?=
 =?utf-8?Q?EqOK1cRFbcJwLKXppSJNUAia6QmJ3ZaOzYHjR?=
X-Exchange-RoutingPolicyChecked: PxKawnvOcOpisqD2L9aOG02x2JKeAsY3XbwhZFL1SnHzQP32XZ01KXKhzQ52g5YSrI9Zi9s9BXeKvDqffcfhznkAo2ySHnGfBE9XY6nsMiKwi2Gxzmuq7g0vULMFbf9HeMPDra1SYM6JRQrvQOdNA0KENMYl2WC5HFjSwPHjvg7oAAH2okEFc939d7Y3fKPiRYbZt0ykhPkyhxrrSBaOnpF89m4qwbJkjpt3xXSH+4diCOSAPBI4vAKEymH9ErixLH4H5DAb02tYAiZR1cazJaiQ+a74SjZi6ZmWbzACeOpPz0BklkMyxMYZbttCIE4Zf9C55m5MmP8z+ZPeqcO/vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5aa3b64-0bb2-40aa-b4cf-08dec1a3b838
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:10:05.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqOWgLuKutAauG9lw5TS20HKThVFALylyan5X58JL1wbPAA4P0gp1Z32eW3AFqyv0+1baI1nIb5J9XpOq7XnHHIdO5AfLq6dXkbQtoRHPL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9711
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

On Tue, Jun 02, 2026 at 04:09:07PM -0700, Ashutosh Dixit wrote:
>OA head pointer registers are not used by UMD's and do not need to be
>whitelisted, the last argument of WHITELIST_OA_MMIO_TRG is actually used
>for whitelisting tail pointer and OA buffer registers. Rename the argument
>to tail_buf to highlight this. OA head pointer is sometimes provided to the
>WHITELIST_OA_MMIO_TRG to have the correct register offset alignment (16)
>for RING_FORCE_TO_NONPRIV_RANGE_4.
>
>Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 2e84b1c49f374..a17ebacc1455b 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -104,10 +104,10 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> 	},
>
>-#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
>+#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
> 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
> 	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
>-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>+	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)

I think this would be a good time to split the regs and do away with the 
RANGE_4.  If HEAD and STATUS are not used, then we should just use 2 
slots - one for OA_TAIL and one for OA_BUFFER (single reg mode). Any 
idea if STATUS is needed? I thought the KMD already returns the status 
in an IOCTL.

Regards,
Umesh

>
> #define WHITELIST_OAG_MMIO_TRG \
> 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>-- 
>2.54.0
>
