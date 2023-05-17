Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FC9C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 22:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A8810E2BE;
	Wed, 17 May 2023 22:25:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0980E10E2BD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 22:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684362325; x=1715898325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KhUHDzjihRmrIa7v2f6IDwEdCke4BvRCVREk7vEHOag=;
 b=jTzXb8VRylG1EVhCE9ig54sIR/InP2LTl3uCfAJE1cNEPKrI4RvCY4ve
 6TjUBhkEhJIrawzNNHhKDUXLF1O3uFEouddEi7od6hLOx/fMFk5Utkzpo
 J8eWNT0UN3F+MATsFeLiap9+5aX1VRpqTRn4jZGykPZoaK47dAGO+MPMR
 5cQ/5sUpQaTj05ftQsNd0Xhb4BNRbBeJcDGR1w1qlQLaNyg7SI/DVce1K
 Iyln134z1fcaz6tqH32VbP7MPydDg8MpwloaZ55RAonvuiDFEWMv66nQW
 9mUU7s0/SsrUsgtpEmjRRYlfDqZCKXAQSkfMn3OEDK4KIuh129QOXHuln g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438235846"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="438235846"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 15:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="766939641"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="766939641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 17 May 2023 15:25:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 15:25:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 15:25:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 15:25:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 15:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/LYVFlOSlr5SEjYdo45hvTrnbuyPZzMEQ3gzSbyzzguLtucp9mFH+QCy/EpDFJTv9OJKjfMYp7SlYtin2Km4GReTU9Z3oQxWcI6OsqswKb/tNwgkMcrSlUFjA/xmsPoVXTRW6rU9KS4/1bLsiEs73eYWDKdefCbuxAk23u4546CXDOwb434nmq5nitrjA67kANuZ4f8De+rQD9KWagRq1wDThPml1TFOR1VFFXYDuaMuKRgCj6E10bbN2V/nBKI8ZOgEvEr3k4INkKI4MIQC5oklgW4j4l2qr9GKe2xiV/aCPgPXOYMV4VXRsJWAZn462qk6pNQL9unnoebAy8SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETjkM8DWFuog1c4H+4+bZHLyND1FxBOFfrvh/qkKGKE=;
 b=fr2kIwckG1rwnbeAPwq6cm1FqsRuX0KqA8FRazdWyVV/fSY9oYOQJDBuIzbDQi3pyfONWN2eZpujqEFapWSb328HXG343QoEmKoZRe634de4/E8WYSR95eeUB+SmRD6wVeCx0Op57OrI047D6Kx/P7PJCDM43qBlpH6LYlAIUM+nIWKhOg9RpafIzmiIi3QkyzsULULWaVJSW24nMkpXorKRUp/ItEamPmlsSXXtJWqTgjxdG2Xc9N9vlW38CBRrkgOQ54Py/CibiNVEqn1/McUUhX1DjZveKR/RqUxWXlTW5+WQ8Zt988g8HWNGGAf1f0+s1XHFjsb9b8ETMW2bMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 22:25:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 22:25:10 +0000
Date: Wed, 17 May 2023 15:25:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <vlbnya333jberbzm7w2wuqmpmt4lox5hscmm7gogesfttkgdnz@sctx3xxxtxk2>
X-Patchwork-Hint: comment
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-10-lucas.demarchi@intel.com>
 <20230517212552.GV10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230517212552.GV10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 019ec81f-d7ce-4b03-527a-08db57259366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kx2lV+0Z49Ubr/Bg/sepqOe1DeOa2yPu4n2TJAR2gFEowS2Cr1LfhUJuImPrZ2v/l1lrUHn5KHFYfgeU+9OPuOxUBsWDB1rNookCr7OfXkd0OCrcSCWgw9860JlrUAoptq429QxcrVx8Z/xeuFc+2Vw1YNBxUda5EO+IWWylcK5h0PPPQACXXXQ3kBddFIpJEEv0focZPxhXQeKTvJfN/F4d0Isp10pEj1+RA6Z0aYD9gyTydx7nJ8VkmkZog3b74BQYcwudV2Dvy9dorYreDUB0lu20Pm/+vrHp4xGf2E9fpM8lM++nyT1uv4+WsAAatT+Uz+kJCn+aYGmjBzkrTUknqAMl2pQBiZ+B3FmzFU2Yy3yEjTi3UOv1z52+mOSVdI698LQuP2ps7LwkCAhicMPqa5COcMysipRt4NkEz/q9TsxgMIghZuoppi2PRNxCSWjhkiDoHbMvmlR+rDFfX4byIJR5lLcU5XHZ1T/ZSEpV94VsYBR2EEk4P/Eja5cnMGZYsDtkQg/wkGhW6EIyKMWloie9fTAIZO1LoWdwoOh5KtmAtokTgQ9Ip2fMwb+d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(86362001)(4326008)(66556008)(478600001)(6636002)(316002)(66476007)(66946007)(107886003)(6666004)(6486002)(8676002)(41300700001)(33716001)(6862004)(8936002)(5660300002)(2906002)(82960400001)(38100700002)(6512007)(9686003)(26005)(6506007)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b9Rh9Qa6LzdW9/Yt0kRDbWkd/D7XxVTo+OLKlXNMyVuG1R+J+mrJGZzAXiVa?=
 =?us-ascii?Q?yLYiwXDnjk3GdDFByKERT19p/A1aySf3oFYS/t+1YJbnS4i9XkwNkGwdeeLA?=
 =?us-ascii?Q?1bU1Oe9ZDrYiXPA8i1hJVqliHgSwnP5UDoNNUlozjco6IZ5ewl8i/yNbTSKI?=
 =?us-ascii?Q?TfxKnoUaFoagyAEVbhZg9NKHmxAfxf2AvKqWsUsAp+6woq3ntEjC2JpZzaYB?=
 =?us-ascii?Q?amQY/EoTQ4UrcXtKOOLNFByGMEk6wx3gsFZRBrLPWr6tPK6tPh5S2l2EtJ9a?=
 =?us-ascii?Q?o0/ZdcdqbY/jXi11A/8V6zN/boXNSL5jJFtU7/91si1z8c2Petxp6r0+bKc+?=
 =?us-ascii?Q?ZHK0D5hLuqqbjuwsnsGtrGm9jE3n8rUeM7m98Q0wJ4WEsrz1vo62yPrzgDo8?=
 =?us-ascii?Q?LSlEKLFizV5324dKSib06zL3kQN5f6TkV+XROTS1A4rCJPTlYyzId/HYfpTN?=
 =?us-ascii?Q?63f2jgiH0m2eI/wajpefbLiaz60bgYYn/6xvh2NIcHkQ/OutHE+VGba2jKKN?=
 =?us-ascii?Q?nwOTCwH5VVw5CfQ8FMFv5G0PP0YUAyDj/eRHmdx20NPtqt9hvF6HOEwrfZmn?=
 =?us-ascii?Q?QtC2IXGptb4mVE+nnVtL9E8h6GpTqZEm5KflW1gua2MZQTby+4M1wjB6Vttx?=
 =?us-ascii?Q?A0tbwowSb5qoh6A7t3P+Ac/REC18N6XeDuPYv/bxupV/r3V5QGtmo306oHF0?=
 =?us-ascii?Q?4mnaMagz3qrWcH+Yo39sruVHcgQOOpZn6brl/WXZuYcSPXljrdHaT8TQtOtS?=
 =?us-ascii?Q?sDY2bWasowCTYZGtdBoLyOgTZA0+kzGDwgGLOkbFdqIqxbUZPYTVS5fG49Ss?=
 =?us-ascii?Q?0KhOMJyFjVKEX0OE/DwReVZcJZJ+uE5QbLqNzDYFmGDaWsGU9GkU2Y55x+wz?=
 =?us-ascii?Q?pIJBww2RG7DVP6S3XG6iLMXMFq2t/yd5RCk/nl0foRm4I4Eyu/KFB8tjCY7p?=
 =?us-ascii?Q?SnO7z6XFh0HCZdIadV0sCNLyKRq9Ql5PJmMkp1Ed1BV8KdT7iMDB51ukkcdq?=
 =?us-ascii?Q?hEx+y7qz35KMhzuI/4MXgQL/Xfd60SwCfHz4I9AZBT4xCVy8HKE2tfsoRHtD?=
 =?us-ascii?Q?/zCDh5FXcfdF2ugq+6koqUkRuTlaKVX9J/nKGf6YERmrpiOusg1OspSV8Yyi?=
 =?us-ascii?Q?awdtYFxtJdY+FicErwUJbKPtb66rC8Sk68KmtKkQvBXlUXmy2CaJZ6EhYwJi?=
 =?us-ascii?Q?AaP//ockMHjSLnLCrdSBklaaM0tEsUorITCt7UlqYDliD6pay1LX0V+WZ3s8?=
 =?us-ascii?Q?oAuu6o0LLi8HZV+KMbzGwxVACKhGf5pYlV39Cd0jaHemaq/6FWJWi4HPCKQx?=
 =?us-ascii?Q?FxJx6o894kg/vlTaPe3bX8xs4Bh4Ak5eOMyJkTOiY8Hrg9dz12CTD0Q8a3KY?=
 =?us-ascii?Q?Vx61eJ0Ks11SsV8Ji9sPB/p2InPdy2tkCbqOX7spoI0OsNqTUTj66nSV12qy?=
 =?us-ascii?Q?Am6zf4GOm8RtQ2JCfsYlJq8hqdU/DVBlwaDfe5AJApeQL+H+fTglVR32HQhd?=
 =?us-ascii?Q?DOww52legU9ROgDrq7ttXE+bLVal7iz2G7zEbGIFOzkmk+bRUh+tbhj2wF4h?=
 =?us-ascii?Q?iYJ4vhAwsHipoKoDW1c3IvIt2qWRX2LNbaBr7wQV32M5C9MX8dWRHcVcRszA?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 019ec81f-d7ce-4b03-527a-08db57259366
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 22:25:10.3400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3oqdGUtD58XGzwz9lekTWuVzRaddpS6D3A/JYqiZSRCgQkDOYkEnFxxaCsk9sYHX6Se9uCnlxYkFUC6pTM7m9LfBJ3UNGvr8p1U8ZpmtOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 9/9] drm/xe/guc: Port workarounds to OOB
 infra
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 02:25:52PM -0700, Matt Roper wrote:
>On Tue, May 16, 2023 at 03:19:50PM -0700, Lucas De Marchi wrote:
>> Let xe_guc.c start using XE_WA() for workarounds. The one missing
>> workaround is left with a "FIXME" since it's not properly implemented
>> yet.
>>
>> Also, some changes were made to a few workarounds:
>>
>> 	- Wa_22011383443 not implemented due to being an early PVC
>> 	  stepping. Wa_16011759253 that has the same condition is the
>> 	  one covering DG2.
>>
>> 	- Wa_22011391025 and Wa_14012197797 were split in 2, since they
>> 	  cover different steppings and we do want to report both as
>> 	  implemented. The latter may eventually be removed due to being
>> 	  early DG2 steppings, but the former should remain.
>>
>> 	- Wa_22012727170 and Wa_22012727685 were split in 2 so both of
>> 	  them can be reported as active, regardless if they (currently)
>> 	  have the same rules.
>>
>> 	- Wa_16015675438 and Wa_18020744125 were not checking by
>> 	  platform or IP version, hence making them not future-proof.
>> 	  Those workarounds should only be active in PVC and DG2,
>> 	  besides the check for "no render engine".
>>
>> DG2 system used for test:
>> 	XE_DG2 G12 56b2:0001 dgfx:1 gfx:Xe_HPG (12.55) media:Xe_HPM (12.55) ...
>> 	Stepping = (G:A1, M:A1, D:C0, B:**)
>>
>> Output is as expected for the current OOB workarounds:
>>
>> 	$ cat /sys/kernel/debug/dri/0/workarounds
>> 	...
>> 	OOB Workarounds
>> 		14014475959
>> 		22011391025
>> 		14012197797
>> 		16015675438
>> 		16016323070
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile        |  2 +-
>>  drivers/gpu/drm/xe/xe_guc.c        | 43 ++++++++----------------------
>>  drivers/gpu/drm/xe/xe_wa_oob.rules | 16 +++++++++++
>>  3 files changed, 28 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index fcf04951a309..07af0d022263 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -38,7 +38,7 @@ $(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>>  	@mkdir -p $(@D)
>>  	$(call cmd,wa_oob)
>>
>> -$(obj)/xe_wa.o:  $(XE_WA_OOB)
>> +$(obj)/xe_wa.o $(obj)/xe_guc.o: $(XE_WA_OOB)
>>
>>  # Please keep these build lists sorted!
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1b5d0b6ad180..252a4bfe6d63 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -5,6 +5,7 @@
>>
>>  #include "xe_guc.h"
>>
>> +#include "generated/xe_wa_oob.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_guc_regs.h"
>>  #include "xe_bo.h"
>> @@ -20,6 +21,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_uc_fw.h"
>> +#include "xe_wa.h"
>>  #include "xe_wopcm.h"
>>
>>  #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
>> @@ -136,29 +138,16 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	u32 flags = 0;
>>
>> -	/* Wa_22012773006:gen11,gen12 < XeHP */
>> -	if (GRAPHICS_VER(xe) >= 11 &&
>> -	    GRAPHICS_VERx100(xe) < 1250)
>> +	if (XE_WA(xe, 22012773006))
>>  		flags |= GUC_WA_POLLCS;
>>
>> -	/* Wa_16011759253 */
>> -	/* Wa_22011383443 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
>> +	if (XE_WA(xe, 16011759253))
>>  		flags |= GUC_WA_GAM_CREDITS;
>>
>> -	/* Wa_14014475959 */
>> -	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
>> -	    xe->info.platform == XE_DG2)
>> +	if (XE_WA(xe, 14014475959))
>>  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>
>Hmm, this workaround was already implemented incorrectly, but it does do
>a good job of highlighting a shortcoming that we need to address...see
>comment farther down.
>
>>
>> -	/*
>> -	 * Wa_14012197797
>> -	 * Wa_22011391025
>> -	 *
>> -	 * The same WA bit is used for both and 22011391025 is applicable to
>> -	 * all DG2.
>> -	 */
>> -	if (xe->info.platform == XE_DG2)
>> +	if (XE_WA(xe, 22011391025) || XE_WA(xe, 14012197797))
>>  		flags |= GUC_WA_DUAL_QUEUE;
>>
>>  	/*
>> @@ -169,27 +158,17 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	if (GRAPHICS_VERx100(xe) < 1270)
>>  		flags |= GUC_WA_PRE_PARSER;
>>
>> -	/* Wa_16011777198 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> -				STEP_B0))
>> +	if (XE_WA(xe, 16011777198))
>>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>>
>> -	/*
>> -	 * Wa_22012727170
>> -	 * Wa_22012727685
>> -	 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> -				STEP_FOREVER))
>> +	if (XE_WA(xe, 22012727170) || XE_WA(xe, 22012727685))
>>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>>
>> -	/* Wa_16015675438, Wa_18020744125 */
>> -	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>> +	if ((XE_WA(xe, 16015675438) || XE_WA(xe, 16016323070)) &&
>> +	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>>
>> -	/* Wa_1509372804 */
>> -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
>> +	if (XE_WA(xe, 1509372804))
>>  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>
>>  	return flags;
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index e69de29bb2d1..060ff25496a7 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -0,0 +1,16 @@
>> +22012773006	GRAPHICS_VERSION_RANGE(1100, 1250)
>> +16011759253	SUBPLATFORM(DG2, G10), STEP(A0, B0)
>> +14014475959	PLATFORM(METEORLAKE), STEP(A0, B0)
>
>In general we can't match on platform anymore for disaggregated IP
>platforms; we need to match solely on IP+version now.  For example, this
>workaround applies to 12.70, but does not apply to 12.71 and also does
>not apply to the media GT for media version 13.  The old way of doing
>things with subplatforms also doesn't work well anymore since we have to
>be ready for this 12.70 graphics chiplet to potentially be re-used in
>some future non-MTL platform.
>
>A first step of doing
>
>        14014475959  GRAPHICS_VERSION(1270), STEP(A0, B0)
>
>isn't quite enough since it will still result in this workaround being
>applied every time guc_ctl_wa_flags() gets called on a platform with
>graphics version 12.70.  In reality, we only want this workaround to be
>applied on the _primary_ GT if the graphics version is 12.70.  When we
>loop around and run the function a second time on the media GT, it
>should not be applied since media version 13 does not need this
>workaround.  Other workarounds might apply to both graphics and media
>GTs, but only specific steppings of each, so we need to specify which IP
>to check the stepping for.  At the moment XE_RTP_MATCH_STEP can only
>cope with graphics steppings in rule_matches().
>
>So maybe we want something like:
>
>        12345678900  GRAPHICS_VER_STEP(1270, B0, B3)
>                     MEDIA_VER_STEP(1300, C1, F4)


MEDIA_VER_STEP() has a implicit && I'd like to avoid with something like
this:

         12345678900  GRAPHICS_VER(1270), STEP(B0, B3)
                      MEDIA_VER(1300), MEDIA_STEP(C1, F4)

	[ MEDIA_STEP() to be added and probably STEP() renamed to
	  GRAPHICS_STEP ]

This is the same as what you wrote, but without exploding on the number
of matches. For instance I'd expect the next request to be the STEP +
version range.

My idea was to leave this on the device-level and anything that is to be
checked on the gt / engine level or in another way, is checked from
outside. See the handling for the other WA above:

	if ((XE_WA(xe, 16015675438) || XE_WA(xe, 16016323070)) &&
	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))


Lucas De Marchi

>
>that ties the stepping to the specific IP and version.  And then we'd
>probably also want XE_WA to take an xe_gt as a parameter so that it can
>make sure that gt->type is appropriate as well.
>
>
>Matt
>
>> +		PLATFORM(DG2)
>> +22011391025	PLATFORM(DG2)
>> +14012197797	PLATFORM(DG2), STEP(A0, B0)
>> +16011777198	SUBPLATFORM(DG2, G10), STEP(A0, C0)
>> +		SUBPLATFORM(DG2, G11), STEP(A0, B0)
>> +22012727170	SUBPLATFORM(DG2, G10), STEP(A0, C0)
>> +		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
>> +22012727685	SUBPLATFORM(DG2, G10), STEP(A0, C0)
>> +		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
>> +16015675438	PLATFORM(PVC)
>> +		PLATFORM(DG2)
>> +16016323070	PLATFORM(PVC)
>> +1509372804	PLATFORM(PVC), STEP(B0, C0)
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
