Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1355C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 00:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7056110E540;
	Wed, 10 Jan 2024 00:45:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8205E10E540
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 00:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704847519; x=1736383519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YgSRqyV0YIdJOiIRJWbaylpwrnK/UAQOb6nJTJFWZyg=;
 b=Dm9eQ9PPFTIpClDvSi1h0ALdGMdZ4PyPf7fsZbzMnY9DX0VcLclJW8Eq
 2QSySd5Wutloi77fBE2m4Vo2nFY3CARvSN+Zh0JV9YPOD/tYKAzQAnIBV
 aep+uH8nE/R+FB9hG4cafYlRexQupvhy31+WGl26sO3B9dhVL7gOt8+p0
 cETu4p+bzHoM8o18Jbj0f2uVpbBPwXoS7GK5v8jppKh7Sblc4D73eylE1
 GW3+wN4A1bV+5qFBdCVuMx9TMA5ilhZVGXrWpUgeEVT+I/SRJ7Qlk5bX7
 ZkccBMYqHNgzdhmhM9+UieV2/ZEPAVn4InId5IUJyKobzXitXybnUG4C2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388805533"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="388805533"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:45:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785425927"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785425927"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 16:45:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 16:45:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 16:45:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 16:45:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEhUiSMEPsgRoodUMgs2Cf56mT6QO/mmB5FC+v9T5ULHkwILxzsz28lPKTeE9Z0IF9nRndPNTh2wu65pvl4QE8RuDxcdo59iTjXbXvOPhTWH2nSOGv+DigojvKT1pwZn6Q7rvknnMtf+Qm05lwmE1kwpealiyUQjtm1mMHakPpLIIzNrU+nU2kdYNguS93Zkf0yOeklv9p/YreBlnzjTJDKn/qtl0+rB2i26IyR/uZC6QMv1iGUzuY8vPoujvFuw+khU5tEVFwNRLOyT+SfJKgdgx66Xc5VIrOhjYwS9+/3zxgN7DRKJX3dycgE9TIX2o9NHrhbyjsabFCUu8eXEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg3vxkLE+c3DCJirIcMEVlqPHTMTg8XFaV/xcZP63Bk=;
 b=I16hmfZ3TpwlD0D+y+3tGJ3zw/Vr/bg8UqRe1+9QJXREodLbJ4SX3Ww56EGupWreQprNu8yTk0xDjzWMV+eIpB8iUVwsrZxX6FCLn4uC/6DTHeLit7InQ7oceI8I1+OuGA+WlyG/f08ulPL51qiOLq+01KuxkhmPDBaMY8yNEaDU6brOBanbCkd97cLhHm02hUQu9Ehro8rsufSp1WiIkE1UWxlOYotxSIUYN/suWOBteWrre/5+S17PArrO2ULnYMG1zzOnLoIZeZqkNSRlmuNkEXwfXsL1h5iYFkmI8ltZNam4wEiaMCdwp1Cx8wDsfFS/1iPbN2z2J8G3KWp/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 00:45:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 00:45:16 +0000
Date: Wed, 10 Jan 2024 00:44:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Use proper definitions while processing
 G2H events
Message-ID: <ZZ3oVfxAx6EKHuZR@DUT025-TGLU.fm.intel.com>
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240109230015.365-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: ced2c31a-fd9c-4599-d92f-08dc1175699d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30C+JGO46y4ZVBYcjyY4cyuXnUKqrR2gn9Qb+4315ZLDwtIMRd7VDLUKtWDvWYmPsQr5bPxkFSEWvWnh0V2TeHWsQaPF6q79loKRLOyPttr9W8pUdx+pE/mjyfCSgY7aNuGoDmHGxLRJKXRGs1txfbcdxgF7RHyUj27a1ggK27hsBfQS7wJKsUjFQBD4RATvjY6gPsyW3ETo351heSNEX1inIn/sEPEF+wLJrPbbk+FVPGz1IqayIcqOnh2cPCdtOLQF7SOY7ZpzVa7G48aBz/GbkjYCNewYJqwUC2PTm6SlUVz0cKw7sFRWv2Nvoge16rCuWGy4B/NarzDrDJbYWikc+KaipoZMJKov2jj/XDtndY3t0sQm2/Rokwh6X/amUM7Mk0fWbHutLIIzK+ea4kxPhk2vKo/7yiG9fp7+uES4BsDG3xtJmFA5RM07NzpDc9wPwaW+iyHWac5MXDnEoKYK/xMcVAfcgy3EYaoSMdMUZBTNlKz4OF/fq2qyaBMhBT7/hvyFOkw4PvvXeng3pcj2EGR3kJWgq2qxCbcDlomTV0QceyRUuh8Yby7CF7Ynmyu5nRIDmdfoGuk0Vyqqw97Wh45wUN9llNTI/Q01xNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6486002)(2906002)(41300700001)(5660300002)(8676002)(38100700002)(316002)(8936002)(66946007)(66476007)(66556008)(44832011)(4326008)(6636002)(6666004)(83380400001)(6506007)(6512007)(86362001)(6862004)(82960400001)(478600001)(26005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4i0IYVB1yNRaZT/s4Xleao/oKaNQKq2v1QTc58ookvo/WBTaXXtNA0PVUX0C?=
 =?us-ascii?Q?j5uXBUwXBcywioiaitSOlPgGAS659Gc9Wd4J16I/p1M4+Sw+FkMvIONBmI8u?=
 =?us-ascii?Q?uJwLilLSgwfS0f5sWkhDIObNZ+X5aTPxlE42FSufq7mzp2XB46O6wD0LYxl+?=
 =?us-ascii?Q?pV2kdk4Y9B6DM6zz2GEq8qbvYhOzruJV08NaYcro7wKJU8BTeJJy8If/OGOE?=
 =?us-ascii?Q?/+sDT7MxOFOiBhYFnwD/DHrrpDtWJu2Zw5zcLOqynSqYkQABcNCfZw3loZMi?=
 =?us-ascii?Q?NEKEoXuscZSu1noEV1hNxeCV8+BfDh0AJgqMDxpsA1DtzKhBVke3rBCC22de?=
 =?us-ascii?Q?BWG8VS+imei56gGTxPuz/ov++C4+wACG88W+1GK4BZYTsoQnjIyT6ieYQY90?=
 =?us-ascii?Q?mRanlvzGR82ClvbPuJmFNA1u9SbsGsitv9An0npQilaweASP7cg57FfZsBDM?=
 =?us-ascii?Q?Hg/tD4nuUYaxUWz5QQ92ftYiBowHirptc8+WGkjNW7aPmdPU92fHLi3Raoed?=
 =?us-ascii?Q?5+F1ji4R1NqnudQpVRBMVAxodcEX3FGCZqEx7F7DuulOQbsSlvAeWQ7t/tXq?=
 =?us-ascii?Q?tVVLnpyrtOUB9tWuPeN5mIqmkcyaOm43A+hJDN8iMzAGbhUlReK1tnlPloyI?=
 =?us-ascii?Q?ex72xnFgdhusjji9Vk+cb+rO57Zl0U+eTfzh1fC9J0PtBuNVHBLy0qaU0wHy?=
 =?us-ascii?Q?9HSOw0zkAyYhBLUXnfgJUD63NMGbIYEjIQFLGsrQaf8WMScQMbjX8ggWrJVw?=
 =?us-ascii?Q?lgWzh9ZM2YJXI/7/rl+M1dzpbu0q080jNuEvXtXlk2L4JD2INMmWbX7iuKLq?=
 =?us-ascii?Q?Ks+1TBtoyEUuMJl+RqaXbF8IBXTFg5lcjz52DiQyC8oylwEt8xBwNY8wP/mN?=
 =?us-ascii?Q?vQSwZ66a7wrdI1fBxLsgwul7lBo5j8tsDYuzirKckIYY0mvGLJHM+bPS4MYU?=
 =?us-ascii?Q?LdqqoL1UusNRtaxSuKxhcQuLijC26soOglM3hiUX2/OUqGJfx54wpSwaUaTM?=
 =?us-ascii?Q?LLZvInN1jomugjgyiA5rK0iY3HDkIrm13uVEEYgotCcboJ8Uea0BiOGgHLx2?=
 =?us-ascii?Q?PEbFCqQoEzbo5hFv7M5d4yJswiqWBx8rf+lXeO8fqFz6MVGdA9v+/dEWnYxh?=
 =?us-ascii?Q?UTm3Tq9/azv7QKqN8gzHVg26pzsmlLiv/ZEg5Fw3ARw/Np95ibQ86/LVZNC1?=
 =?us-ascii?Q?GJNuW4jqhhSuuDSEU4HO/+5WzwwRPz5hJr2Y6PNgFZBhmL/pL2hyDSLkHZUk?=
 =?us-ascii?Q?4AzSoF4eiqy30CENhagER7kGKuieY60c+zArsqeoO7X8EBULgTEicJhGcKdp?=
 =?us-ascii?Q?bOyNnCOWvliqcX2qmyohr6T12UMOzUmy7YubEOb10SlD54XSI00TzgBcaQRX?=
 =?us-ascii?Q?m3Gk2r1gzLkY0/Fz4XkIHy6b8E+09UnBhuTLAd/bl1H6VHcF2U+tbiXwkxd2?=
 =?us-ascii?Q?gXSXOeXDzXiNSkroAGA/Rw8/S1sF9u5FSYwz7yG1eRCRRVghUF1sXVYN10e/?=
 =?us-ascii?Q?2FkJZnYBWmjeJsNQ2ORd6ZfwKlL9qE1Uh6PThkz522Ssy/Ifbbw1w9HFedy+?=
 =?us-ascii?Q?WUE/tqPxpPuBghOdrWH+plDafSJ2Qlrf3D6Xipe25eEg3s3haVU8FrHXY8yF?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ced2c31a-fd9c-4599-d92f-08dc1175699d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 00:45:16.2202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk9S9cWEyw5rWHHhOvmUPIXH+/UANbVxZK75b3Q8KUelU8wkgLh2CYCmIzE+gDacfXKHAbq3IvsZ5xnpVHAWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 12:00:14AM +0100, Michal Wajdeczko wrote:
> While dispatching G2H events we should use HXG EVENT definitions,
> no need to rely on outer CTB layer definitions that forced us to
> use shifted offsets:
> 
> 	FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])
> vs
> 	FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c29f095aa1b9..9d1d855da229 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -923,18 +923,21 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	return ret;
>  }
>  
> -static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> +static int process_g2h_msg(struct xe_guc_ct *ct, u32 *hxg, u32 len)

I can't say I love this change as we pass around ct->msg as an argument
to bunch of other function and changing this to hxg makes this
incongruent. Maybe change this patch to assign hxg from the msg first
and then parse the fields from the hxg variable? Also maybe add a
msg_to_hxg helper and cleanup all the msg[1] usage in this file too.
This would make everything consistent.

Matt

>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> -	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
> -	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
> +	u32 action, adj_len;
> +	u32 *payload;
>  	int ret = 0;
>  
> -	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
> +	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>  		return 0;
>  
> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
> +	payload = hxg + GUC_HXG_EVENT_MSG_MIN_LEN;
> +	adj_len = len - GUC_HXG_EVENT_MSG_MIN_LEN;
> +
>  	switch (action) {
>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>  		ret = xe_guc_sched_done_handler(guc, payload, adj_len);
> @@ -1145,7 +1148,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  	if (unlikely(ret < 0))
>  		return ret;
>  
> -	ret = process_g2h_msg(ct, ct->msg, len);
> +	ret = process_g2h_msg(ct, ct->msg + GUC_CTB_MSG_MIN_LEN, len - GUC_CTB_MSG_MIN_LEN);
>  	if (unlikely(ret < 0))
>  		return ret;
>  
> 
> base-commit: 39df1f6b1259816cc42b5f2451ca5092fad340ce
> -- 
> 2.25.1
> 
