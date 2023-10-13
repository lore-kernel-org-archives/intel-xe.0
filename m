Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D8DCDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 14:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA9710E05C;
	Fri, 13 Oct 2023 14:17:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB31110E05C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697206656; x=1728742656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2ibesBndD47WEtKDAABpGInwNiteOex0Efq7Jn3HG+Y=;
 b=k+WrTnbd31x0Og5MqEPKBgCqs6yGy8GjU3K/Z7yLopUbGqnU55RY02OZ
 lv1kwj5a06YpXEuFAduqsTKaX8mfFGKnLTaqIXPuI5oc9EZ6Kvi7mh7Yt
 gzQta4DGJuael2pe1AgdC5n3XDElAY06+QfKIEn6Sa6QdWnfjcFOsN3qJ
 GOn7owFDOim40AYmK+TEbIyOVWf924+QQkZNDr+b0K78HG9X/gmySHcCm
 3kgTQCx/Vh+maAhcfWLXJ+4GzbqMnbwPsiSE8TsjU7vSXMbu3FhGfNbgw
 TZSpNPoWtVpz7up/Hk6QddxY2YU6O8Pm09B6frvkb88y9u22E6mUTa4Sk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388039654"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="388039654"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 07:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928441846"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="928441846"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 07:17:36 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 07:17:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 07:17:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 07:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA4FK9bLRGMpN9at+5oKOKKVyRIwwNUMdzir7ZNX959+wxusdowX4t1sFNoIy9ind9vqQncL14Psd971ThaGb2MOIHJhtLADNBhLoZPqHa1gL2ckM3Tl4wrtdckoyWXgwTgGCic5jbLZ5OjsTQMtev6sBlvltrI2LR92fNT/8CFHDLm9clN5Jchic8UiJ7pZ+5sOIZyRs5BKxoz1Ek0Q+wfpApBW+4ltRGAsNtlLMpuo8yyLh/xuXfoVKAPuahmj1SnZ6Zo2vGiFyKcpThvQmYNuSgRx+eRkzxjneO8xOPsN7Z5hJWSO4kk20viKo4B9lTxb83b9Lr5Vlx32vJUNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndCAeoN7s2FFlnOxEg5XUMAoLNRbOy5UeqT/uYDZ+74=;
 b=HHH2qxp1/hcCTQ7kLRfg0AvUa+zkDd88HX2FyPdu5SdD4T2571bvvA4CiAs++gvZzJO3I+d/lBipTq56UGr19vG3Zv6Xpxsh8jBk9uobM6zDjCKL0BGsxq8ldtv8OQvbaQu6dnm04qkK7EyPQPpu2eszAatM9V6nzriBheQCGCMYkVA+lk4F6zrCdpVREOFJOUYJc/NEVrL2jwUDnOOUQ9sbROKiX0ZdGJYI/IFwe8DGMMIEy01fXYwy0KMKrpYdhs+GZRjM2CwnZI10W05mUOhnG2lTvxdNyJqTG7L4EW++U8TuOFafWXO1/MAinWjDM0cVtHaqwcag/CaNK8XNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 14:17:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 14:17:32 +0000
Date: Fri, 13 Oct 2023 09:17:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <lfetbotuwsxua6qktcefpc3zxvzjyyysk7hwmc54tbfvy5mtnb@dld66goy7cdk>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-10-matthew.d.roper@intel.com>
 <pyuuzeqdal4ynnudiz5thlssext67qaxuxz7fu2ho6fi2y3li4@mw6lo2vdr4pz>
 <20231012230420.GN5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231012230420.GN5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 108495bf-068b-4b44-d3da-08dbcbf7241b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TOF47QbR60Jck6V+R+l6NZLw7UsOy05DCjb/aoJczgWPzwiDfKztBBGfSgioH4HVkhxqgvXcwQngLF9Bv1Jbmsa2dcwUJeNAzZSIes1G3BFY/JQODTSqwVrfxGCpM+ET6J1XoMnLsepJrPRsZHRox3En+Xr1NHKHwCESG6t79JgKCCzdRUJ6ijnnsd51aZNGYumzXgwq8miTMefKTfcPtry8zE/qkcyO1ExyvjmbA31OZ1eAsIcKQdm/fer1StknxyWZyQSGn6fjxTSzPxcpIIKpUUsMA/4e1WqfUmN4jMFAZaGbljntpL0PwVZHJHGz8o9TiDhnjovkubhNW56DudV7pvofiennTejuJBoLvV3AgVRDG4bp8kjjbFE+TvOKo/YJ2Xcr2gvsv1vxCwa2ILDPnRjZl7mU9sW/UxGvhuUisTW953dZaYifj0HgKXcQMcJGw4yyOtTtyurOszjVK+MomK6brsn8s+/P4FpP+CokNDyCvd5xZXKonHUuXNnQl1qOvbKD2NWWzXtlLCoyW+Uh2DLO49DUOztBbn2yxueVlMRFG5kuHWGT6h82W1FF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(33716001)(6666004)(9686003)(478600001)(6512007)(6506007)(66556008)(38100700002)(6486002)(26005)(6636002)(66476007)(66946007)(316002)(83380400001)(8936002)(41300700001)(6862004)(4326008)(8676002)(5660300002)(2906002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YOBW0XSbBLqnLtx4d/VleOEEQL2x9E/MuY8egKzr11aSsKt9lDCY75JKhp5t?=
 =?us-ascii?Q?llP4a1aPgClbzCed0JPtVylhUlwBgYfL9kYI5Ej4lSwmkw+/LiAtw/udePUo?=
 =?us-ascii?Q?la61HipYFEBGSCdHi71h9Cv0ixEJYaGIP1PZGTgbzAJy4JlfC7EdB+mFJhaR?=
 =?us-ascii?Q?EOf7rIxiwK16ih1PFNgvS7tTfAEVfUlMmJMxTpyjXk81yvHxMn3NVrAit8f0?=
 =?us-ascii?Q?Ea5T5UzDt/zNHYb4k0PQDpbM9HQkY8T5w8Rv4+fb+65zaQT+1dv7gPCVvWij?=
 =?us-ascii?Q?7wxshVWrhQ0u/Qt9aGZQPshJ8+KHpoo2UqNwgaziLx81OE1NiG8WGfI+ahyO?=
 =?us-ascii?Q?XmvFvYkkLQY1ClTpFS+pU91vQEe5Gwm/xJvBcEbEABpt8RbPt6fXFOn8hGG/?=
 =?us-ascii?Q?fAR2nuT8wd24K7tPMoJPghjI5kobKErZQXYlHpoS3hPpRy4KaY/MvUtxQlC2?=
 =?us-ascii?Q?HwpVpwXOUk1q8gPfeRcoBpnRUkdmrRk/7mEQXh+I+bl2ZIqJzULp6FjvpcAK?=
 =?us-ascii?Q?jh4biiZChnx+dT0K3G8Dq037fhP1U1JBeOpY6TN2K2kOmf2pi/vhYTZhNxn7?=
 =?us-ascii?Q?ctGobmm+Uxs9zzv2XVTd6B+eg4qfj+gJLraL9fah/xnWRGs9bVOsMCzga6og?=
 =?us-ascii?Q?eCPn8IM0OBsoyf8my8IIJDZWDAyN4jpplu3ihTYDI7bsYnoW+QBUKJOkgOCd?=
 =?us-ascii?Q?7BCgJUYZHOL+6QfPh+1wUGJO/A0PhMdfCgyFuLjTxeC87gKXsVbUqrmFsVw9?=
 =?us-ascii?Q?f2aS/G3oB3JTbYGNjZproUvtYWJo/fXCEHyg2MrZky1GF8WZj41wSTjR6KkX?=
 =?us-ascii?Q?K+1VCAE4Rv95AjQjL8cGPUDXz1+llHyi7Vh+RZebVJ2z7/B0I8dStOWAxlM0?=
 =?us-ascii?Q?WeTdIJvkQiQTykmFBr6Se3LxoaLQ0cACpvTLysn4HNkADSllkBnuviCgK5nu?=
 =?us-ascii?Q?jd9SWwS1zxHKiLykUuqPwEBAM4iNu9mAb9exjY+KfgCUeaDDdH708+KsvxE9?=
 =?us-ascii?Q?4kKBC3eKt+hGBMvyyELV99Q/QZ5CIlDANqUlAc4pYK1z7Q9x3zD8htCd8w6u?=
 =?us-ascii?Q?IzTRTSOlxW+n1sphEBO7BLPyHz5kQ7urBIz16AhYMjdJnNkCdvuthLSJLjUu?=
 =?us-ascii?Q?HVkkcNC3+6hAnNI+MZ6VVsaRYRMnb0P0xla2woyQzs39bwWswXQenc2eFKPf?=
 =?us-ascii?Q?Gv3XkDFf4QgHwVBTFeDrT7TElWeiGNsREieoCUt0O0fIx4u9PZ0KrN/DWb+6?=
 =?us-ascii?Q?HXG5ZJNerZb7ZLrqZ0QEZbyql28erGB1FWcvXFuuTyEoZ8pwNaLf9CK/T/cc?=
 =?us-ascii?Q?CVaQz05i1WB8CN6hw1YILSiDOeyOHU59SF47eWLkwyoOsQv5D8uQC1kBNr0j?=
 =?us-ascii?Q?JfykKB1l5HeiLerL+Zb1Tk5BOsL79iciIaCnIwtJYtrxz2Rk6xAZoLPRlwx0?=
 =?us-ascii?Q?QWZaTk7FN2hcWT1EChUqMDU55wXsI8jdl7fgeQHIklbNAWwrrXF5HgMA3UY4?=
 =?us-ascii?Q?FS8uAoEHY3nuxDOx6EI6okS1ZOFjkG0ZrhWlr4xEjMJvvHWeC46PFta7OpR9?=
 =?us-ascii?Q?cQhi4H3rCPiiA6ZVsFO+WRlfPcNrGn7EH3BbGPTXvu+HVHbetDe/AoOApAmo?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 108495bf-068b-4b44-d3da-08dbcbf7241b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 14:17:32.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qplgg2wfJeq6Xw+Wv2QHZnmCn3cpbp1AjfDRD/R5ZDAJlYZIdFzqIgIiVemlEuZDOKEUamCnw7Yi0hQzyIL5MadX7YygZijzN8BeDt5diA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Separate number of registers
 from MI_LRI opcode
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 04:04:20PM -0700, Matt Roper wrote:
>On Thu, Oct 12, 2023 at 03:55:41PM -0500, Lucas De Marchi wrote:
>> On Wed, Oct 11, 2023 at 04:10:00PM -0700, Matt Roper wrote:
>> > Keeping the number of registers to be loaded as a separate macro from
>> > the instruction opcode will simplify some upcoming LRC parsing code.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 4 +++-
>> > drivers/gpu/drm/xe/xe_gt.c                | 2 +-
>> > drivers/gpu/drm/xe/xe_lrc.c               | 2 +-
>> > drivers/gpu/drm/xe/xe_ring_ops.c          | 2 +-
>> > 4 files changed, 6 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> > index 9432a960346b..ad1e5466671b 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> > @@ -25,9 +25,11 @@
>> > #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
>> > #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>> >
>> > -#define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
>> > +#define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
>>
>> since we are going to have a churn in the codebase due to this, maybe
>> it's worth going ahead and doing a s/LOAD_REGISTER_IMMEDIATE/LRI/ so all
>> the macros follow the same pattern?
>
>You mean so that the instruction macro matches the field macro names?  I
>thought about that before but was uncertain whether it was worth
>switching the instruction macro names away from the official name given
>in the bspec.  If we do that for LOAD_REGISTER_IMM, we should probably
>do the same for all of the various LOAD and STORE instructions for
>consistency (although I guess MI_STORE_DATA_IMM is the only one we use
>at the moment).  I don't have a strong feeling either way; what do you
>think?

Thinking that you are printing to debugfs with #cmd, then that would be
user visible and deviating from the bspec. Doing the other way around
and always using the long version would make the code harder to read.

So.. meh, let's keep it as is.

Lucas De Marchi

>
>
>Matt
>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Lucas De Marchi
>>
>> > #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
>> > #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
>> > +#define   MI_LRI_LENGTH			GENMASK(5, 0)
>> > +#define   MI_LRI_NUM_REGS(x)		REG_FIELD_PREP(MI_LRI_LENGTH, 2 * (x) - 1)
>> > #define   MI_LRI_FORCE_POSTED		(1<<12)
>> >
>> > #define MI_FLUSH_DW		MI_INSTR(0x26, 0)
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index c63e2e4750b1..a42ee3b9b8c7 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -145,7 +145,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>> > 	if (count) {
>> > 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>> >
>> > -		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>> > +		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>> >
>> > 		xa_for_each(&sr->xa, idx, entry) {
>> > 			struct xe_reg reg = entry->reg;
>> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> > index 35ae6e531d8a..81463bd5e490 100644
>> > --- a/drivers/gpu/drm/xe/xe_lrc.c
>> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> > @@ -111,7 +111,7 @@ static void set_offsets(u32 *regs,
>> > 		flags = *data >> 6;
>> > 		data++;
>> >
>> > -		*regs = MI_LOAD_REGISTER_IMM(count);
>> > +		*regs = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>> > 		if (flags & POSTED)
>> > 			*regs |= MI_LRI_FORCE_POSTED;
>> > 		*regs |= MI_LRI_LRM_CS_MMIO;
>> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> > index b95cc7713ff9..1e36b07d3e01 100644
>> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> > @@ -50,7 +50,7 @@ static u32 preparser_disable(bool state)
>> > static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
>> > 			      u32 *dw, int i)
>> > {
>> > -	dw[i++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
>> > +	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
>> > 	dw[i++] = reg.addr + gt->mmio.adj_offset;
>> > 	dw[i++] = AUX_INV;
>> > 	dw[i++] = MI_NOOP;
>> > --
>> > 2.41.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
