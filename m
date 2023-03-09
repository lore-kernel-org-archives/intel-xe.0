Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C297C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 22:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D682A10E1D8;
	Thu,  9 Mar 2023 22:19:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C81B10E8F1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 22:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678400344; x=1709936344;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TLEPIwz6duLkZB/FdirE/7EqG9kBYylfm+8/anQ+r4c=;
 b=M+W/m6RyRrYv+7QQzOVc1WhEs86igw7u+LX9xXWM8p4PWTdIWQCItQ1T
 0IO+Oj1fpXyjt+lBxssjaYTppxaNiy7zKsHlVGrMBo7vod4kB+w9i1zRZ
 mNmOGKRksascmVa/kSu78fM4fJjCdcK1TlZHswL8yc2G3WjGN+Nr5qmpF
 Ae5OH6Sk2hcRJE/xzi+uKxPPcmH2esPEMoolV1o9z/breCUtXP77O2VUn
 sVq8CNu2anWnOx7ZznD0N6ZTfj7ReUt8X/Fegd09FTxAU+XPoUdf2i0m/
 hTuqxioKg8mHKZt+Nr/THTpfR2UNWKYROGeNqqmzgUb4GhToOn4ZZw6Si g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="336603526"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="336603526"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 14:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627568197"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="627568197"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 14:19:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 14:19:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 14:19:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 14:19:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdRkw9aPljlDm+pA3vp+UAjx//LZXvHEbLFJAQATFqEixe9ymiOV29umRQoXa0oBTbmhb+oGZYmlzkbaWFzxv0UlIovZHRQ13k47ZlXcSnLBqNVDNiH7WiDNDbs77itlpFY08NKZItL6M7sOBpD1U6Xw40/Z8pplqNJMJQnhQ5Z5aX+BZz0oioggVz9OLV/5oXcApCPic0WkUtourLZiCbUb9ZLLwA+/k0CuDNqsuBE197NGzNkVhm/MZH3NLps3WLA+Cvo1CxwjL8AIzrdVBsPx5Lcp0CFuFOxswwCqc6bx6/CP60F2jMajIIKcstzYSyGbAlUHOxHcSP22cLPnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tByeCUAIHe9RRw9FIKnNDJhSh+AQTLvUDK5DruMW7oA=;
 b=jl6eSZQea0XYmWbYtaPRIh89F+qSa5pLUZg20+Ir/N08D628mDA4reB0HatToghP7oRRYHOuCFYMTjhmUC1ls6wSevL7kOGWUBrWWZAX1uEjK7hQTzCF5wGiDytf6rO24j7Fs1n8zBcqGhRPQQwTQyiTaEMKh/qJg/6BkmQbc6FiJZ/UMqyeN8v+MjFf1cCyiOMH4b8r9BMB1Mnlkln2Y+4DRtknv6ZFQwhWYrhfo6kuLQ1YSkQZgKPylBBthb9EiMG2o6GhxtLzXfKiEauajbtih46SEeUj1/pzMIcgcq2F2fW1uWIkN+cbKiL5uR85+UroeN6RAOn5DizCo27d/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Thu, 9 Mar
 2023 22:19:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6156.029; Thu, 9 Mar 2023
 22:19:00 +0000
Date: Thu, 9 Mar 2023 17:18:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZApbUEobAF/ULC41@intel.com>
References: <20230309121746.479146-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309121746.479146-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: b8903db0-3ddb-4c8e-25cd-08db20ec486a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wZzqpMxGO3sno1J+oAZb4khu5bczIvfW7r3pqzxY6xVG3O97TFrFr0ftMPjHrS61fOVO4lIH3fzmpPu2QiLlR1vXR0KQVL79edH3u2eW3xuG2BTrg7veIMPtlAuOgbYUaxaJOmATeBI5+m5roao7CScPxXXQBocEVZTM+tzuizeTIqQK/KOdh3FxO9oRMW5kZ3BPh87pwFR5Wz9a1b9HrkpMmo7YHszR0vg0xyp/7RFHr2A1dHLcc/ZCcfWIu+K7T3+1h3o7Yegyj9ddQcNHFPDlm9Mpb8Q85O+DPRFdW+tKcc1fqAGb/4V1/DvUhy4Q1bk4koZ7TcFiDPPN+bgKrmA5sc7ZMGKbsT2Bxcrzj0f9/ESZB5C4VDLIfeik1h3krRZFTnugnO51yFaJ06Aw8ky4abw/uWnYsgipdLeBiPlhLUcQt/IUGWUnLZf/KEn8h6y/CJvM5EUv98B1gNpU8gYCUvTO7LSYBp6Col2JJlgGMog0ws5Say1DzqC3Aks0C77Yj6qOAfeuSG87MKSg37g0Avjqkpj27uKU+Lf9Ibs3n9L0otlCTHsugmNv1cPp8cfBi5XPvFVVDewfdHx37CzBWplHCkfAeuyZht5oye5UUftMpiLzM8Q08RUrE9uD37izWlMP6NtlC5YAjqqVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199018)(478600001)(6666004)(83380400001)(6512007)(6486002)(26005)(2906002)(2616005)(316002)(186003)(66476007)(66556008)(66946007)(36756003)(6862004)(5660300002)(44832011)(41300700001)(8936002)(86362001)(4326008)(6506007)(8676002)(37006003)(6636002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smoftXSPx/fbDRwckHcq4pBGYHRq7KtBgHXVEYGyYfadN+YVTv9sltw5inf8?=
 =?us-ascii?Q?z3sOVGTFh6yDrexnwUT/QhL41xvbPljcnLvchnLmsC2o9NfSIt6lh/DP2pnN?=
 =?us-ascii?Q?WRg9vD9GlkKHKUfdLziMgR2+f8iVDYXaLXsC1WrCDM3AE12CNY5J+EopIPdj?=
 =?us-ascii?Q?xE4QypImI3fNy+UesTQqa8TpyKjlQZDl8GaPhPgf3EVHAUoA/vNzv5plzbPG?=
 =?us-ascii?Q?oe8lI5KCNpHjzLBfj1dYv/Ueqk+EVPeTXAzDf512m660PwhTAMBNQvt/rfLF?=
 =?us-ascii?Q?j96QyKGOcqF0aDsEXNQe5EskAJB69qcv2XUY+rn+j1esck91A7TW+KVaZit6?=
 =?us-ascii?Q?EuJHVDTYu+IbVldM8HQCRKJbikZqMdJucNuTKm/0vpe5YmbTy90OtDG6vlb+?=
 =?us-ascii?Q?uIV/v2SH4FJg8SOxOttAR+x6x8Ms938g1bMbG4mrXJx8M4gipVoUB6FrXw8W?=
 =?us-ascii?Q?KTK7o/5F0FoRet/IijQeEYncj7e6LiXnvwPkhOc91jUNVG3IiuZZz2FfW0Cx?=
 =?us-ascii?Q?p/HpDQD1p+5l141RdGcp98zuxYyX+tGuAwHORLdL7tKIHvtceA1HF3yDeALU?=
 =?us-ascii?Q?8+uAidpZvKzNexpEYEWrW1uksHuKbqh6J2Px2+t7hZIUPrEszudcBpK3MaxK?=
 =?us-ascii?Q?Rr1nHBy9njD6H5CNRU1vgxYN37FcJ1LkNUQuGdY/ufKwNzjHBeebu3KTafsQ?=
 =?us-ascii?Q?qAITBfPbDU4iK8Q/WdsaHCbE8apLwh2VwTnrAsa7j3PgmdDbxOSSXq6o/VJ1?=
 =?us-ascii?Q?lRxtgB/EWoki6oh+i2auvOqoa2cC2LlvwnKxYfA6SLbLxtmYVuZlAalQuqGD?=
 =?us-ascii?Q?4RrBRvBVlNwkSjjK726DDieY6Ngi8CD9AVP+3UAuL4S7u9qySGhjENh12dUz?=
 =?us-ascii?Q?lIRQmg35f1W2RjEme2T7zroGWdvXAhzIN68+NPK+Ui69xJ7YydURDIg5XZ88?=
 =?us-ascii?Q?EKm4p09yJCS2nL82sTI6QcHlPAlWZhoTYRx027+vTOGHRxAZQ9EQg1NjRS0D?=
 =?us-ascii?Q?Sy5EREniU4CzWciBPULFl+6MeE2WEmL486Atj07kF1KiEtZLN4NoSWHIrJeN?=
 =?us-ascii?Q?okoSxrDyVCUs9flmmxct2k8fiOGVc3pnvS23MgkbD1EVqRopi1tz6urtOuBf?=
 =?us-ascii?Q?4eyX6fFh4KjvSD5uGKVWag9gDfEEhamX9Rg1KK6bC1/bLsNV9nRDm9acxDgJ?=
 =?us-ascii?Q?TEa56rooQzBI+ainAP/JBjLx5QUBxc8pmQhhUYm7jGHoVXruxBoRHl3+jW80?=
 =?us-ascii?Q?WkPFio24FfRX4IB3mWpoqTc+l6TEmjZdYGboOAScGtKimlcOqxqsmZ6zk+hj?=
 =?us-ascii?Q?eTJk+rdER547HSd7y57KMpWnmIASoKcUdp/q7KML2OsehV9dSikrvJq6u5zF?=
 =?us-ascii?Q?yuRB1RtQsD7O3HDJDjrLBAvhi12WWG5NZgvqGQlKrHsBuUjQymZx9ZrkDv26?=
 =?us-ascii?Q?i9mVOvPk8WEnsqrFCo+X3UCGl6eA04z3GmX1lrKz/WGH1WXyhtaSCCpgwV5O?=
 =?us-ascii?Q?TyLxRN16bnJ4xTxOEoTTw1wMkKeugSbM41Hpz5PmRBEemlwzNG7lCO6XtDUp?=
 =?us-ascii?Q?lhQysRAIJvbuWgIsfk7qfykmdRpMzPCl9r1hNSypsjo3ZS28aLdRgsVXh/sw?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8903db0-3ddb-4c8e-25cd-08db20ec486a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 22:19:00.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RF8lgBRKPeDRjwtAzjmKa8b6DZkr6vvo7W1M421b79ZGOpOtemebUBIJwmfjr1gaVsucYVj+YIxRmz0E6c6+Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: make compound literal initialization
 const
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

On Thu, Mar 09, 2023 at 02:17:46PM +0200, Jani Nikula wrote:
> Be careful about having const in the compound literal initialization to
> keep the initializers in rodata. Here, the impact is 1.8k of mutable
> data moved to rodata.

is there any static tool/script that we could run along with checkpatch
to prevent these?

> 
> add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-1804 (-1804)
> Data                                         old     new   delta
> __compound_literal                          1804       -   -1804
> Total: Before=42425, After=40621, chg -4.25%
> add/remove: 0/0 grow/shrink: 1/0 up/down: 1804/0 (1804)
> RO Data                                      old     new   delta
> __compound_literal                          7696    9500   +1804
> Total: Before=138535, After=140339, chg +1.30
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_rtp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index bd44fd8bbe05..8fc393ef7358 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -363,7 +363,7 @@ struct xe_reg_sr;
>   */
>  #define XE_RTP_RULES(r1, ...)							\
>  	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
> -	.rules = (struct xe_rtp_rule[]) {					\
> +	.rules = (const struct xe_rtp_rule[]) {					\
>  		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
>  	}
>  
> @@ -390,7 +390,7 @@ struct xe_reg_sr;
>   */
>  #define XE_RTP_ACTIONS(a1, ...)							\
>  	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
> -	.actions = (struct xe_rtp_action[]) {					\
> +	.actions = (const struct xe_rtp_action[]) {				\
>  		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
>  	}
>  
> -- 
> 2.39.1
> 
