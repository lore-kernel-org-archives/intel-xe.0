Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B5C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2EA10E3B3;
	Thu, 17 Apr 2025 20:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8cOwGLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327CB10E3B3
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744921093; x=1776457093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UZXc6sNsF3Bbza8iLkWXhmvFV2ed68DAMHJOzWk3fqk=;
 b=e8cOwGLGbZjPijlE3mJ0e0xONiRsntKyRKbR9BMIVn7UScKtVUl60KKY
 9NnRUlKQVxA1T1z3Zj6ZxHf+ZAmG1iD6N2iG/B1viiKIWzjsDWzwvUoEw
 yKdg5jJOKBLRv0JEwURmDFWQfNL+/CzXZwDIbHcjMMRqhjqWnRAmbY74P
 G4j23dVoyatSKdAWU+U4aMpP5fqzpdlALtNEdUip5T6ZvesGQMSM+J1uA
 x3XpPcoQ9KXrhj1YY8h1gSTXiEev6ImJjp9u2nGVsqWpIk+rHLM5jZ+3v
 EaNFmfIxknJQhr3OdK2/tfYKY7DUtsvlgLpIp1lef/ob4eJHI+TQybFQu g==;
X-CSE-ConnectionGUID: vx0HiBrNR5uCu7ExnO4+og==
X-CSE-MsgGUID: f5fREgD/TeS7NSfSUArvJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46420293"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46420293"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:18:13 -0700
X-CSE-ConnectionGUID: dBcNIKyKQl6hfIxbgwcCJQ==
X-CSE-MsgGUID: YgZ7vJhwTcagP3Oajo9mRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="131898729"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:18:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:18:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:18:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpGyzLEFTeHd0wKfkvbQKWJzJMPVXoQ3YvBsmhzzCCEb9vlCF6wb09Bt+7YJ1Ca8bSGwbziElrbCgx/nUPQB1KsWRIVOpYsJb0qSfQ7vhOPBa/VsaLT7XJHe0L2bzsWbbkTsC2H4teiWfmuSpU+k3gSgOLlAGWcB3W3RLlPPPfADGyq5UdzuePWr7vnLymASXdb6zdO4HU+0zm1hZCewI5pUZ54HTi5+9pq4WwFiliq6GyRU8IJYuKYUD6bhd09sFaVYwahFZGm1Zaf29X3gnjDbzNGGSdvYn1M2SNdMTWqUneOLsIQuGJhbss0U3gB1xrfzsF4Ngm/grtCCuXTRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03l1u78iLg9UzBH357xQMUKIm6X90y5rhKMoyli0ASI=;
 b=uE9wnRlFQiB5ziGwa4MShARgK9KhchoX0z3dACQufypvzNXHamXchoYGF7aOjJUCP5hTj9Ce/YtGCprA7MbBIR3r83Iw+f4eEJjoySpEMvqtlkdy3ziQty3aRpgQ4/PcGZH4UgIzIhLB+utb1ZzC0/a4/YgwJIIfhC17OPgVrGnAuH+BpGP9HuD8Ge5rgjfb++kXRlOcfjISkqPpkcX7Ayf9U5mC8OZdbhyunO5ImcHeDt1AWg/LPM6vfFMD7WSk/8N1VbsPvgvVCyRbXJ1rsjFIYYwRwr9XT8QpSKXCkghEbhvjRQn6y1NGHPf6lm31IuliN6NDJuEQtmehow1JVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 20:17:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 20:17:54 +0000
Date: Thu, 17 Apr 2025 13:17:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Use the steering flag when printing
 registers
Message-ID: <20250417201752.GD6239@mdroper-desk1.amr.corp.intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250417195215.3002210-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c7e085-06ad-462a-ca19-08dd7decefd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rmoszWASRwJCzLE6Tq1FuQVEloDD2YYVA+8JzDkfdQYDpLx7ShBdcJPc+RED?=
 =?us-ascii?Q?+aluxOfmy7yFVY+bD78TL/3MFa0+5wFYXFFoAkgTQ7WRZqRiuqk/PgSCTJ1B?=
 =?us-ascii?Q?BEl0p+6mJikKDBWIY0pfc2tpVqt14ztjxOxIczXjBPSqGsIeuVbk79nFDenq?=
 =?us-ascii?Q?tMB1UZfDLJNUf3cHpYPkvfbaBkEqCgpyEAXZ4C1Erz2/cCVWzY7gtnH4sUlY?=
 =?us-ascii?Q?Fkzk6UBJRvV1lgLdLUISqcEQ6tbZcNDac6J/t+RQmRtYVhnYrWlg4i1eQy4+?=
 =?us-ascii?Q?+LafIWtS/gNCjEtcpotplvmx/sFUP3eltq/jDy0FidSPhOGvCxIAbVcv7SUQ?=
 =?us-ascii?Q?y+hr2xiAEJ84bZPO8uuwWLviyisH3xkpXzX6wmayP4z8dgyG+MUd2x78bBRM?=
 =?us-ascii?Q?6tmr4Ahs6u4MpvR/6Tjt9LkQxNBzeXGWlXoo42nlWkmZFmjG+FoFjRuNaqXK?=
 =?us-ascii?Q?skVwRkH3Uw6dgrTOkljtvoWTc5nSeMvXKWsIahIOND1ZulRYWbxB9E+/SjGS?=
 =?us-ascii?Q?XRAxrbBB6C9X9sto1uZSBV9WxlMNdK8LZUAKjL2cCRR6w7qStovBP0MGO3Um?=
 =?us-ascii?Q?zZf1U+6hfKPVYW7tmW6SL8Jv2rev8WvGPGws8RzavxyYc+1Q1DA1EmXFsqYo?=
 =?us-ascii?Q?W2PX/YB32C3siuuWGoR/ymcu9IaaVrTv1O6/vWWv7c/rglcMTE56CORdUXgc?=
 =?us-ascii?Q?E8XxcBmnpJ3PAyUIgctdCovJYox6FKBcJfbi6OD3IaiNntWSQWePl4qTdULF?=
 =?us-ascii?Q?YqNX5FnK8LRQ9sEZntDDXmaFLCcKucTty4D6m2jUV+OAghADigtimOnOaFrQ?=
 =?us-ascii?Q?BT4pM7DhNER40r48I0QNjm0UGpjhfg10NUYehAMwk2ZIbI/w07C/jRYZyK0N?=
 =?us-ascii?Q?w+9m4p0g5bver2x5cQJWmOTV+qifAtGxiKY2YloshFutqpuSSvkcBYZS+ehF?=
 =?us-ascii?Q?CvBEbhg7xxq3sExVvE5kOnzjIboKdGw6iauXwZUdesAgk2TE+sVlcd9mTJsi?=
 =?us-ascii?Q?B3y30Air1/PxRpXxddFJ8xl9PpsLjap2Qwrnw7mP1rKSfj/qQL0vTBeuseA8?=
 =?us-ascii?Q?EAmGVuaTygTzPfBHEwVBoEFa9NgDe2M/FIgt9MGj8HPtAll6i6j2hX+gvltI?=
 =?us-ascii?Q?IRLOMli9thWNUzyYe8ame6XjIqzFwLCE81FLj3LX6wtIzCgR1NA8QvHK5pjO?=
 =?us-ascii?Q?X1SHyCWPlzB7B0M/vFJ/YFshGHV6u29fT3Bns0ShdfEGT0en4Lal/Iq5wUo4?=
 =?us-ascii?Q?rxzXZYTw/HABRxyeUb5c12wteOZjhSGDZo75aJOUKtiSfLO+qp1edzzhviwZ?=
 =?us-ascii?Q?nb6v4bGk/AfGYefacxAHUSILdCvEq9yvSHEE+TKdXpcXUf5nQaP39kMBcIhv?=
 =?us-ascii?Q?MAfl6TSXjpGkKAaliDkqVus04roJgHxN67Q00ruHDo8l6vpqDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bHyVmNJI3+uLF2IDng0y9buqUe3Y5PrR5PNNG5aBsNLkb7L5nECNvJPpgQDF?=
 =?us-ascii?Q?RRfgQsf1medeSLeEFGsqTWm11zBpXoeuTOVlv1T/0n12GNwtZMW5O6xEeOqL?=
 =?us-ascii?Q?iH4GXb0JugA3zTYbohujgzVB+Mceqk2cdQh8189yZ9DCSTvvCVGAHzcuuc79?=
 =?us-ascii?Q?u4foX0GIJSQcwCICW8U59qocldgpgY1OUE+5HpK33/L+vzGbRUmOXw6T/mvo?=
 =?us-ascii?Q?JmM+lZ1iLKHNqJ8tSpw19utomPfaPXS6O2axXyNshbaM2+vOTPlMA/MrAA2e?=
 =?us-ascii?Q?Iv0qqKRzff80wKjMwKA0xBVg4wyxNUFdMGmg+W6rV+S21CtgdWr91h5WGCSa?=
 =?us-ascii?Q?02Y3lHgpz4raHvSMaGDxXrizu74/PyzgNbbilEfoB9VmnMhcHieytu47UoBJ?=
 =?us-ascii?Q?YzjePB21fDjTOoU37Lyxx94iXIZU7Omc5nsSzL9ZeOweYfqX3JWJjVN66rW7?=
 =?us-ascii?Q?p47GtJ02Y3LPvhoORDtZGm5bVHvVnpjNvSybQUpjXxIyslEWSCyKnY9NEb1q?=
 =?us-ascii?Q?8E4/HDm88ppjMQNgGV81tExLAYLFHyonZkza2LX0ImbofqO6Q4Fy7t27Kl7l?=
 =?us-ascii?Q?uAQg66St19NMhm+FbLztVzfphLYa2qvoDPWXRnsJOp3y38DV1Ki6vZhkrq4G?=
 =?us-ascii?Q?7hLtGk6TOThidpCls41uH2Ub10i5nmLjGniFoByXVw+eaV00OjYR+W1Uezwy?=
 =?us-ascii?Q?LjkFPqqFSHNxLeRvtPKbIqhanUPKg5KhfRYj6C9u/daSCsAN3u6GjKXPHnxc?=
 =?us-ascii?Q?ymvGbd77uuDZtpGOjHxrztVk+SejZn+UZhlEWRbtqP0LySNJSWZMv5GG1v2r?=
 =?us-ascii?Q?jsMMIpN4i0vYysfhZBT6fulbPeCVqUsHEY3x163pGQ6Dz38cDkKByirvyk1P?=
 =?us-ascii?Q?khzyvGNj/LP8vOst8oMwn8ZF6uDSUqVgdNYJlwyqfDQ4GCS2y2Z+7kDITg/c?=
 =?us-ascii?Q?MnBGHU+xC2XAq+3dpBioOfoUCYoVUZQZ7fWISV5b8hrNOBVAvVA31g+cYd1f?=
 =?us-ascii?Q?GQvUS73tmg/zK1TvQ9H233zUcMohw6tejew4oco9OZBautJbrdQdNmjTdz4y?=
 =?us-ascii?Q?BepW8WRnypxUBhqLqhdua6d1pckTQ3KwpJuGB9xEz70n45mZeW0LqOWJIq0z?=
 =?us-ascii?Q?9gzY3YZPujLzOS0howMzlmdzIBTSyChcMwynB7WHuE1lQHEC2NpAqFH1cH5u?=
 =?us-ascii?Q?ImHrNDTac3a+AR22CfGAxVP1mWKYTGBuRnzU3vewLrOZkLVZhykoOoI3b6zo?=
 =?us-ascii?Q?C98WtjPlt1A0ybNwjRcoSNX705u+GwcOouQkca56J4YYtwhkyXqRTL6UF20G?=
 =?us-ascii?Q?NQJ3BMJygb5wUpBHxyWsbWF0+3z4b/xIM0BpEjvBzzlyAumyoZwazGpQvF4U?=
 =?us-ascii?Q?qd4kcT75US1V76VFjhSCcyIsIysBti2dy7lyrumNLiO5zIqPLwhqwbfa9zHk?=
 =?us-ascii?Q?Nt6aqaIQpPoW8X6hWIqanTkZB8eikswNUPQEcYSTy4y0fHwkeYQtXD2J1cPa?=
 =?us-ascii?Q?oig6IBar18/Kwx4deqEdITaBu9WXuFgTWXuOnYp4fhhXOyIGI8R5lk0/zf/t?=
 =?us-ascii?Q?MUuZAtesgkPOkeumWNoWpwyJZh75Ljqso3ZJZ8O2RI51QkVHLQ8uEuHIrZ9a?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c7e085-06ad-462a-ca19-08dd7decefd6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:17:54.7196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4MbBRzeHDxRns2e/SFbg4IUOgIIEojDnM2gSWQcJshgc27ao/HFt7w3QWYJ5UHMJPwvMpJ9J5bXhm0SeyzjZSw0378Z/RkrG4W5XqRI2JQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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

On Thu, Apr 17, 2025 at 12:52:13PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The printing code was doing a test on which list a register was in to
> decide whether it is steered or not. That might be valid at this
> moment but there may be other reasons for extended lists in the
> future. Plus, there is a flag specifically for identifying steered
> registers. So, just use that instead - it is simpler and safer.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 9095618648bc..f4b08136e472 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1672,18 +1672,16 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  {
>  	struct xe_gt *gt = snapshot->hwe->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
>  	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>  	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>  	struct gcap_reg_list_info *reginfo = NULL;
>  	u32 i, last_value = 0;
> -	bool is_ext, low32_ready = false;
> +	bool low32_ready = false;
>  
>  	if (!list || !list->list || list->num_regs == 0)
>  		return;
>  	XE_WARN_ON(!devcore_snapshot->matched_node);
>  
> -	is_ext = list == guc->capture->extlists;
>  	reginfo = &devcore_snapshot->matched_node->reginfo[type];
>  
>  	/*
> @@ -1749,7 +1747,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  			 */
>  			XE_WARN_ON(low32_ready);
>  
> -			if (is_ext) {
> +			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {

This is a single-bit flag, so can't we just do a simple '&' rather than
using FIELD_GET?


Matt

>  				int dss, group, instance;
>  
>  				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
> -- 
> 2.49.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
