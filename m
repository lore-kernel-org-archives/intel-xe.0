Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8935DC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 16:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508610EA25;
	Fri,  3 Nov 2023 16:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283E10EA23
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699028097; x=1730564097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u8iI4CmTsbODjax9C9sLonv1eosxlV74Y8d9UPkZx6Q=;
 b=Kus5WEYo9rcRXg6ffa8zw9fIFNH5bfdl92jCaxNJZMyM5WnjwJk99YKv
 pRwZh/C50J1nQtWqYg7mmJ8xvpyC2UAkMnqca235i5VtZ5XWgcQ8KmVbh
 ejkH023gBnr6K0yBldkZnFE6hXsEfARYAfzx9eFh+EIXAuXdevhJE6DVi
 0C6a0sfey2q4G91HL7qKlGH8gZ3yKTaMUcCXoS8Rcl0F/CT4qFYLq64mi
 CpDx4/TOAinwIOntG/MMUHpaA7bx/uY6Q54Tjs0TqboM8+iHBUvt0K77t
 KHNeqhb+pmJd8Ff2VqLhHNr4cigBsu0EJSrZNeqa2nCzPqKpIghx6cOZi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379371411"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="379371411"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 09:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852312726"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="852312726"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 09:14:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 09:14:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 09:14:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 09:14:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 09:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYfcikjCcDA9Ak1B3jDqy5yzFNAni4/ukcyXUkWKTx+BQk5vsvjZyikzEo90KqAvdecmGtorOdD9U6grnOcRDtCAq+JEfn1vjS8q1QUCnMrvY8wL+ocwBGSMTvd8Nr/EZq9EOIO3zYdDxIenPg2jlFxOy1oQUkn+RJ8D1gCbrxsGFiG1QFnT3uxo2Qp/twToKq9rXzRQcibxVLwDiI2IXzp9HIF6z25Yy404ce6/RcUBB8lShQq0ezvv+cB5NOIOivlvJaFYDU15402tcZuer8V3Lw2IrIVGg9nqBr75PBX5EhfX9TNWD4QfeP1APClRDKAolAF4Cw6bJ2QvKaMz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pX/JC2C0BQM7OrjcjP08zoJf2CwH6knCxhBumk4h+yo=;
 b=jkGPoPQY/JySDUA1mOothCoUc4V9dwnIEwfoj89HVivaxZQxUBk4wiJnDzjNGJd2pcK7FbEoLy6DP5d0LEk72Mrl4KAg/CtJPAStQirEEkv39v25pMDjDGwmZhcOyj9TYjdKbWWQbkTHGXAhlcZOukFreeORc//fL48bABS170Qp8COl8Mpf/eevloiMrrzzoCBl2hdQ41Vvz3Sk0SQhml82fGsgmOvSNaQ6gQdomPC1t830LiUjG9vtuAzhkOh7yxBQ+SvI5x4I/9D8hcd/u80Go70mRfeh2EOxc7ZWy3w94Yxrf+pvfZzE3AAc+wivp43vzjYu5XLqUH4cvvW2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.24; Fri, 3 Nov 2023 16:14:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 16:14:54 +0000
Date: Fri, 3 Nov 2023 09:14:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Haridhar Kalvala <haridhar.kalvala@intel.com>
Message-ID: <20231103161451.GI5757@mdroper-desk1.amr.corp.intel.com>
References: <20231103054641.3311585-1-haridhar.kalvala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103054641.3311585-1-haridhar.kalvala@intel.com>
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f345ea-49ae-4e42-b23e-08dbdc8803c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 246x/nBC9pvz+5tGojy9kRYBmWY8af5lh4l2XXLAMsW94jJ+yuuifTjsASRzJ2jupTznxaC34z5Q5j9DZTl6rDvP5u2ZUKsAMyrgp2rb0+CbRjief2nbTphaqYvu8a4B2UzU+/7/xrAPENRNt2uIjRobUg3AXTB7MCaPA9pYDIQQCl7ij+aFooRczHc05813hHd98tXcWYEPgOKuZr7r1oASzoaRBUE5SZWBx+V7AdttAfnQar0uFFZt5EulJgLaQEwAs2Zc4l+NTky3KXnBOnOcLUDU12ka1YF/nSoPvay0UiBtkrHhimQoLm2UW/hhWTEEp1+JpJggteXcm4M9VxYs6JQyxk7zh4kDbQkkzsJikOgxw7YVHlsCQw3uD1I1C0Uuu8F0dao5zD33CWVVLnHqUig1krO5vxew3Voq6lAdkJm5Y4ZqoJX7KMW32KfRvhSgUFTr+NGIh0vpCdJxSLMgLy99Rwf3sfL1t+K93UHGQ4zZSxjClD4sfRciSpCDa/QLv/X+cFX33eO21JM0Aqtwbd+1p/TQ5M9HyiywTpqww+El3Qs2fpPmZ2Zg91JW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(41300700001)(33656002)(5660300002)(6636002)(316002)(38100700002)(8676002)(8936002)(6862004)(4326008)(86362001)(2906002)(6512007)(26005)(6506007)(6666004)(6486002)(478600001)(82960400001)(66556008)(66476007)(66946007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VzDMxQg8eWffP6bNxFuE8Zf4Wte72GvX6Q/7zgEbMcWrCwSi/cw3tiXnWrM?=
 =?us-ascii?Q?ZoEEhfO27a8n8MVXw88xDbKjkQyh52ca8H4QbUs3pgUE5X/B4qWsdBTJlAez?=
 =?us-ascii?Q?lq06JfB8dJ25jjpr/Z9gDQkQ7yD+lv8Wk072zkIucvKqTKnz7uwbltnxkhI6?=
 =?us-ascii?Q?aihUv1CY+kAtIG7Qkxn6O+fpo3/fBsSpc1ICWxliXW4TGKA0p148enWBEXLP?=
 =?us-ascii?Q?amvvNr4tyfGYu4ZR1tyja4JGA3EBYf0ZCFByX3ti/SXgp2J65TE91kPBwIac?=
 =?us-ascii?Q?H/TjmC0VHc6PBWnviiA3Ew8+56qSfOhDOD7h3Y3UYQMC24ePloKFY+nK37jA?=
 =?us-ascii?Q?3gnvgHhENb+4WBncIa95I0yEhgUfXXeB0cLyuS1NgW1D/D/qkNPfMfznRJZ0?=
 =?us-ascii?Q?bw5JOx6yWOOWHuBEnvar3wn73Inb6+365Vatpj+QRpGO7KgkXFmw68a8nixe?=
 =?us-ascii?Q?RqMg8yfEEDhIL6wU0WVw6+GPNuJ6qMRmlxN6CiGAv6OZOQydddTwL7QpyVps?=
 =?us-ascii?Q?oVz8rxmCn9aVelRmwzFfhhNGXlmTdeJ9P3vhE5lsul9kuQM3+94b6oZwhwT2?=
 =?us-ascii?Q?vX9Tu2SRsrKapy4RKMMQ3as9l1Yc6L84cFmFinWnjr5ox9JL+Di3y+wI7PMh?=
 =?us-ascii?Q?rh1OEA9G5K94Bj+0qgp94RwAFILOA9qHSIJpMnqafIfqixCKLa/vzm7/v+no?=
 =?us-ascii?Q?ns4lVW4eaoGut0Ljebqxvcpck702q50q57qOxrrnxlDmmzAo+AX3rn1Val/i?=
 =?us-ascii?Q?T+ZPk5uAx1pU+fq9xRnOVOBNj39t3kKBdsfSdV7+To9puIe2EfVE675uNCc/?=
 =?us-ascii?Q?7Z6O9sNmSUsgw2xUvUJGLkRhiYbEMSNYMTH5DpSCLFkRdwOQ5kLNrEpofrAX?=
 =?us-ascii?Q?0HRjNnsmdKE6pxlzjNxQS2216hVUVkMYCrxNGxk7vhGjAcc2zQP++JTBZjq9?=
 =?us-ascii?Q?YJ6r12UVy23xSwWTwCPhvL+pXF4TtsGNBLoDQzOAEDkmAsmSwoOLBAeuBO5S?=
 =?us-ascii?Q?AlfA/xisxZ6yH8Vg5t46XO5OIFE9Qj4FJgDrxZVMsy5jj5F/mzwIF+BJHWmG?=
 =?us-ascii?Q?a8wF+XQnbthVBK4hRZf1PbqpcuLh4wiIbZFMqfaDC0EyDCskzdyJqjZVhFR4?=
 =?us-ascii?Q?vN1XVfyVxZoHVhkgGbr2Wj9988iEXRTvOK/FO4+7DSucutz/0furSgfAHKMz?=
 =?us-ascii?Q?x66O4Ohe+XrZHq1oesfla2aFCwAKzf+rMelNK7bvTqIEwq87btWpyuG905xS?=
 =?us-ascii?Q?0U/g1PR6FlBpn+5tRGJ7Uota+YwYzKb4cS4Ge/fSR3AGl3Z2xC98OqqY4xmE?=
 =?us-ascii?Q?w/Dbatpf/KjE/qr7m0y8y0kV5M9vSgOjx6rqP5UTfkKybgAZsV2L8fvLLhKp?=
 =?us-ascii?Q?sQrknTAstDsyFl/6xKnvwdqYWOjzR2YtHh02RcwGYGw/fJ7CX0hVj0PQRbdv?=
 =?us-ascii?Q?F7sUFVgKs8uJhXcyP3UiX63FWK03/dCU6XahwjXQ6y/qB6Tk7ma94Jczkdkz?=
 =?us-ascii?Q?glhga0mr5BOnzzEUINar8keM7y5gegZl9LiKeHQ4f8z/wKT78hnJ+ZK4yylS?=
 =?us-ascii?Q?5H2nSr/MpYZDdXp//rAL5nWDRo48xPRwGd8dR1gnIZYjWzJKRiRNaJQA7p6h?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f345ea-49ae-4e42-b23e-08dbdc8803c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 16:14:54.1125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTVIPIL5tD70Tivcx7QGA7BJXT+vH6Ifj70X0aNxEDTjGoUIPP9jp+DlC+gSp6h8xPuHCajwHTeRMTB4TG8/rGF5/Kk8ySTFZ9JS1hYNxHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Wa_14019877138
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

On Fri, Nov 03, 2023 at 11:16:41AM +0530, Haridhar Kalvala wrote:
> Enable Force Dispatch Ends Collection for DG2.
> 
> BSpec: 46001
> 
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 2f1782db267b..6b6dea233d80 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -671,6 +671,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G12)),

Why just DG2-G12?  According to the workaround database, this applies to
all variants of DG2 and all versions of Xe_LPG as well.


Matt

> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> +	},
>  
>  	/* PVC */
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
