Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7725CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 18:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0C210E237;
	Mon, 11 May 2026 18:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5HPZJZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3C10E237
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 18:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778524315; x=1810060315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IlS2LNGa02M7+Cg3ucUnwz14StluxzZBeUMU4W2Ubno=;
 b=D5HPZJZ5o7r4WBY7vRM59N0PI9IHY779zKuh3hYPWOc+2oorYoCeaQ4M
 yEei5spWzVPBbkd9C3tOYXGkxFohuuCAjUYKSqbHiFgMSdyYlA1qFY4j7
 LJJiWbA/u7/FZPBxjnt/RXa8UT0Pa3A2W7viPzjYjtGu7cgHe3e6P8KMp
 6I3AZvLIQjWmbyYGqhdW5sP7Nd37MKjnS9Yoh0ibnWX2Sbg1fnuecjqrb
 208NUJr7XNilv8ho3e7nrMuDF6gjAwlM6Q/fPgz/QdDv5XyIB90/SiKWl
 wFJH7WX/+tqG0G70AG64PbQsSht/eFPhPy+9WYByrzIAeQL1towpYdN4i g==;
X-CSE-ConnectionGUID: wFv92FxpRnyi8mdpNdVvdg==
X-CSE-MsgGUID: t3GlE1wCQYCfp+sKIe+oXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79369727"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79369727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 11:31:54 -0700
X-CSE-ConnectionGUID: DFZ9SrIDQEK7JEGBQ7Dung==
X-CSE-MsgGUID: fTs20DawQca6aHf4MsL8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="261273698"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 11:31:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 11:31:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 11:31:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 11:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3Mqn64YSC/g15TFXE3NhqxYfp5aFpwzpDQNQhEx2rUvcW78ouxZEUkgk8ckyzeKX0AYsVccVJoqBb9vO+v+tCB/CDPi2wzV+tm8+4pfm0/wGVQYXw3z47mq6meEwt6YXh4TrU4dWW+rjR+4rJZJ+1jBTaaeKbLADtnYuemOW7q54BZHndytmg2n8q1imKfYk6N3nUE7CS1ThlYuIUYe+c/iTC54kyIgMlh+eGIuDBx3bOPWVOi3fizuKICLrYFD95jtP4lL2jbIbiURm4EXeOPIbABXfI0XxQcQkESSUZYVywm01OteepRjGSzemy6SMSdfB/sAT6j5uRLovwwhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSPXO1KxFqOnUsrfRZe2NyJn4TbcFgdmav3vKGQR4Bk=;
 b=fKK8whYIym0Oi4Dutb9q4V3VyFHkNH2YHGz6Jh7sf2a1i6ns4eS0n7Cl5gyCGLcjieFc7pPPc12hwt1byo19lm6JRgJd881M+9rYy4PB3CGud3Mk0KpNUCjRA/nWsQeCv2gvxAl/nV+IyXfnIi2ZJQYJ3Z/wwiA9UEpNKTHXawFhCwyrn7BMbiQpRAvsch+98VycIizC3jihvxFwpg662fkNTGNx/jmsMEOFWUOIRIiNm40KjSMK3T+9T3gqtwa/AplMdE+guEkLcGzlV7HF8D65QeouYMC/BtQWH1fIpYoxZ0aKqrl39aovrL7OE5YZp9ZnF9yiJ4L7/HMsv9uguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB5891.namprd11.prod.outlook.com (2603:10b6:303:169::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 18:31:49 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 18:31:49 +0000
Date: Mon, 11 May 2026 11:31:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/oa: Add val arg to xe_oa_is_valid_config_reg
Message-ID: <agIgkARQniVfvmSd@soc-5CG1426VCC.clients.intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
 <20260430161459.2892545-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260430161459.2892545-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 05db8617-773e-4e60-2e72-08deaf8b905f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: m1KQJn60U6OfoP1iycfYxwOrF46qpuJfur07w+7n0h6DGQQ6ynUQSHahwLRTOR0yEmJSA4gS9sm3QWeodLYyPXxRviNJzn/VtFZyrHSEw8cbz5vmfpi/xoIaRaUomaPCNcV1hjHqSy9XwVW/WSWirSmBpzvohcj0mxdgkD+gl2JfOG6oOhYeyUKDpAfPNVCuScd7Cx+BG/cqSLJB7vfTAl2TBbcYpk540c7SGAh1d36F3xYWw48Cxx0uT9YDXOwUGMVEmSWNqI1owaV4KKTokF0XuAfGNx4BvZmHJtWZlSTL/TKmaSeUsqCK4hPTFrSOzgimLyfziWePJ8jK6iVcV5cyeTwGnaPxFe+RUuKvZYeN/NCFs9dti6IUbCYerWa/jZd9lKbUuw78JLRicRqvlj/dGsMSAjzgNvkV/G7O7jzwACqVW7+5/lzIUwnKXqOtUHSbQU7epdFZixQn4sru5JkM1eduV6P+rTrA6jHmWEXStcOifLHKcqql+7zy5zMcjGp7ZNVVz8sAd1KeHvZtIbVEUXP9Q4AylsBrQ0yftnANoMmRvOeHnhURF2jF7FgE0P5X5koIig85bRoEGW/37nqGRAK7pyl72LLMFwZYaTuKb8qzocrtfONtD/vmfvUI27xRY/TyZCj11yDtXbfZYFWJNDjc0UMthga2JQALH9fxtuIdywKQYRutwYIgqJwY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(11063799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzBndTJnTU1FRWVxVjlodktRL3ZYV25CamZrY3Q3K0VhZ0dhM2RyTE4rVDVY?=
 =?utf-8?B?YXRsR2NTa2tOU1dsTmRTWlJzZGtCYm11WDV0UmZPT3Jqeko4MmZFbSt3NldJ?=
 =?utf-8?B?K1U4Y1JvcENvb3RLazhVTHhROE5LZDZlZXRMV2hKbnh5aUpjZ081V2xJY1FK?=
 =?utf-8?B?L3dPSEhxKzVSRlhDRzNPQ0ZaQ3AwdDFnWHNxV0I1R0FqRm9rWjZybG5Cc0po?=
 =?utf-8?B?WllHUHlmNkdCclhQMThsZ2VzdlpWTjRLaXd2RHFXMFVGSUh5SWppSjk1UXdn?=
 =?utf-8?B?Zk9NbndvZU4zMW5LRnBiOGcrNmRrZVFKQVdvNzZkTmhpbVpFZEd6MEFpVjNw?=
 =?utf-8?B?Uk92cFdyMzJveUhBWllTMXA0c1c3MGpGQTczbFVXMEJmT3N4UVJCMUd6RGVs?=
 =?utf-8?B?NG1aYm44MzVuYlExdHM4Mmk1SXNzWHFNV2RmeWV5elBiVXVxb25xQ21PWHBG?=
 =?utf-8?B?MERzY0VuYTQ0K01XRENFUysrVFBsTG54RGFwMHg0SFFNczhoakMvemxWeXBN?=
 =?utf-8?B?ZlJzR3AvS0FxM1N3eUxrMGZQVC9JMWU3Y1hNVGgvZ1lEYllYaWFST0pyLzV0?=
 =?utf-8?B?RUNEV0EwV1hlR0hQcGF3RFRSWDdFTFVzK3hSdXZxKzNVcGtlaDIxVmRPMjRh?=
 =?utf-8?B?czFKZm1DWjBqQ3h1ZlFTa1A5QlQrWUIrWXVNNkhPclk5MDBFeXNIcU1SVllU?=
 =?utf-8?B?YU9Ja2pDYlo3NWwvQ0IreGpXTENzeXUxaXRETzRSZzZsQnZVZ3ZlUWE2QXk5?=
 =?utf-8?B?K0c4dDRqeHZVWFMxZFV6OC9seXVad1lxNFlvMUZtVFlLMzhxVUM5M2RhaUJN?=
 =?utf-8?B?aG1vL3AzS2FDSHdGWlBkWkJyY2JVS1NnaEt3U1NGRDZ0V1pUUGQ4R0V3bUlK?=
 =?utf-8?B?ZEhLaVpLVHlwOTErZGF2QTRKQWJoVWlLdWNxZ2tsOUNOMzBGUW9WZ0pwVXIr?=
 =?utf-8?B?WFVkWG1CZHdJbmE5ckxCUi84cHdKVUJuek0zbVc0Y3RvRXRjcTlDVXl4WXRM?=
 =?utf-8?B?YjFwaDdNNzB0UjE3bkYycEpRaEhCWVFjdHJpZGpJeDM4YUYyWVljRVI2S3NR?=
 =?utf-8?B?d1cyQVVTZGhaN2E0WkdaRlJKSzZRc0VYZDZlaitZMWRXdGMzY2RoeHdiRGpw?=
 =?utf-8?B?TmQ0T0kwbk9wWXhBL2gyaWZERmJtMnI1VnlqVUhNWFl5aXd4TTR0WERsem96?=
 =?utf-8?B?S2VYVmFFTVZodG5Fb3NNcXFnVzlqZm1yUi9sbVd4SGVLcG82WXpwL0pxMTRC?=
 =?utf-8?B?Q25wWHl1T1RPaTcyRWpmWks3WGo0V1F4Z0MvZ29VblRKYjNmVVJWbmhpNFp6?=
 =?utf-8?B?SzdZclRac0JOc0FKcjJDNmxsL3lEb1p3eHB2TnJ2L2dodThHMnBPc3NmSW9O?=
 =?utf-8?B?Y2tPSlAvYXAxNG9qSGhhTmtNMDA2NFIrQWNndmxWNDkxWkhoT3BqZExVMUNx?=
 =?utf-8?B?RWZaZHFXUElhWjV1R0pLVzluREZCTnZZL0FoU1VNcWFJQi9GYjBleGZjN0Zv?=
 =?utf-8?B?a1ova01IbTBTQWtCanNacXhyZnkxUkhuMGNmYURIS2x2VnZua1JzT3pJVmFW?=
 =?utf-8?B?UitISUpldjJzQVpGS1VJSjlOYzBtNjc3RjJLT0lLeGY5VjFRVUI1LzQvQlhM?=
 =?utf-8?B?a3AzS3hWTTE5UXdVV1NxVHBwRzgybTFxdW5ieFRsN0xQOWtzRFJUTjc3dW9L?=
 =?utf-8?B?UFhvSWcyRXRKdENCRFlzVThrOXEreEpubHNCQjh3S29WeUZGcHlQUjFNVzMz?=
 =?utf-8?B?VHVqbEo2bWU2ZnY1UWUvK0xRcXVvTjJ1UUdQbjdnOU5LdGpoSFlkOExOYVlS?=
 =?utf-8?B?WTV1V3d3VnZjaXd4TFZDZVo5NGhIS210cW5tT2h2em0vSExxbEIzbzRHSVQ4?=
 =?utf-8?B?dmFEZUlUWVhUaG00aE1tQ3VseVJGcEgxQ3hDdjdmYUc3YktKd1ZiRkpkemla?=
 =?utf-8?B?TkdaSUJYR2RVbytjU1BXMHcwaGE1V3VrcjBJTUVub1dLanNoN25nYVNhc3RZ?=
 =?utf-8?B?bWpaSEY1dkZId0NBVXNzbWVXTE5ydlVyKzdOZitpMGJoSFRPaFBoZ0RiUDdy?=
 =?utf-8?B?SEdUQjFMVDFrek5tc3BEckNPNkZEZzRKT0hSdXZsajcrc3FnUG82SnlOVlNC?=
 =?utf-8?B?VHYzU1lIN25CWXhteUErdmRuZFA0U1pTTlA5Y0h5SkRONVRERkdiMUx3MS9N?=
 =?utf-8?B?eHVsbGZKc1NiNG0yOFJtczQrRnE0MXJmeDBQRStnTG11ZTJQUnpHVnJHam1R?=
 =?utf-8?B?Z1RtMUpjL1VtT0tqemJyK2wwMmRhb3g5L0x5d2J2d0t3aUNiT0lUZXIrZHJC?=
 =?utf-8?B?MEpFNm5GSnhWSTljWlZsSGthTEh3U1dsM0tOOS9oZWxZOUZORk05WGUxSERz?=
 =?utf-8?Q?rRmvlhY+co6cF562rNjg0TBo08HopcY11DDBY?=
X-Exchange-RoutingPolicyChecked: qiTLk317JcXcocx8YRPndTK8PlznH94M3el0QPxIfMxMZ6X1jVwOlKnLUBKWI0U06LNIg06UNRVCv6C7dBQQcnN4UPbI8uUYvwQVucPX25oxGzfurGE1Au5tOghJJArbcCFIPk2Y8NS048Oi1BK9ROUVpI/zg+FnL3Kt/XfQbK+GMe73HBvSX1xndx1VbHLWQqIwXrulP2aSpvU2VIo/dmENdaREbySd7mrNsjKPICmtcAyBftoE0amAKNlEP3php+zJ4fTLM7W+9nTXWKcP3MybvLpmhqR5obfIX+XfVvYEy0hmt4GeKE/5XvIiaFTbnKxnfe4uRTrtml/m2xU/qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05db8617-773e-4e60-2e72-08deaf8b905f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 18:31:49.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgrNVUr0ndHPKKOQyVHQzrcaTNPTw/LiBN3Frx07AFVAVL7hOVAoHr33v5DlsMWXAT09Nt9/4MYglCi/OCYigdIBUZgRo/6rgEjDzXnz2xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5891
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

On Thu, Apr 30, 2026 at 09:14:58AM -0700, Ashutosh Dixit wrote:
>Add val arg to xe_oa_is_valid_config_reg so that register values can also
>be verified, in addition to register address. Value verification is needed
>to implement MERTOA Wa_14026779378.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 13458050907ad..7e1e8a86d19c0 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2249,7 +2249,7 @@ static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
> 		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
> }
>
>-static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>+static bool xe_oa_is_valid_config_reg(struct xe_oa *oa, u32 addr, u32 val)
> {
> 	return xe_oa_is_valid_flex_addr(oa, addr) ||
> 		xe_oa_is_valid_b_counter_addr(oa, addr) ||

But val is not being used here. Maybe we can drop it and revive it when 
we actually know what to compare the val against?

Umesh
>@@ -2257,7 +2257,7 @@ static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
> }
>
> static struct xe_oa_reg *
>-xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr, u32 val),
> 		 u32 __user *regs, u32 n_regs)
> {
> 	struct xe_oa_reg *oa_regs;
>@@ -2275,16 +2275,16 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
> 		if (err)
> 			goto addr_err;
>
>-		if (!is_valid(oa, addr)) {
>-			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
>-			err = -EINVAL;
>-			goto addr_err;
>-		}
>-
> 		err = get_user(value, regs + 1);
> 		if (err)
> 			goto addr_err;
>
>+		if (!is_valid(oa, addr, value)) {
>+			drm_dbg(&oa->xe->drm, "Invalid oa_reg addr/value: %#x %#x\n", addr, value);
>+			err = -EINVAL;
>+			goto addr_err;
>+		}
>+
> 		oa_regs[i].addr = XE_REG(addr);
> 		oa_regs[i].value = value;
>
>@@ -2383,7 +2383,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
> 	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
>
> 	oa_config->regs_len = arg->n_regs;
>-	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg,
> 				u64_to_user_ptr(arg->regs_ptr),
> 				arg->n_regs);
> 	if (IS_ERR(regs)) {
>-- 
>2.54.0
>
