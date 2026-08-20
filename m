Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA489C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884010E48B;
	Thu, 20 Aug 2026 20:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7TNQnsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB78D10E613
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787258196; x=1818794196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Q06xdMUnTNXHzk0eTHxQv9RvmvFmvulQMR51MXBmMk=;
 b=H7TNQnsdUSz23sNDekugxKtjr8CUAQEdRSpkiz3ZwKHvB28g3sPHojb1
 IkSujDTnncEdHVVIehod0yTbnw+Ula9yDnYqP55bkPQC0zL6GbwNO2lZ4
 CDzzEiN1DEEq4/e+ukR5fuI0yvFDWFuGp+zsMh3KkxsaHcoaM9Oq1835d
 yxGa2PowCya8r/YJ5YLlHrpVFTBc8xwdZQQoAUPj4iRTK6hFfaEpNhKg/
 tLxvz6nUlGCHkPBMJZChOIqjFLaZHbC0R0JKyn1BqnzMkU1c0+0ItU0fB
 kO98IiIFipRbMwnPXfGMGxNIP+bj7zBcwyo5fujXAl/jnGE3YHXEjdL7v g==;
X-CSE-ConnectionGUID: yyS2LK1CRR+leHM3hir4sw==
X-CSE-MsgGUID: 0iOCFckOSc6KGYoglImovA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105185856"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="105185856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:36:35 -0700
X-CSE-ConnectionGUID: tV/8KtcuRkGAuwd8Zitd3Q==
X-CSE-MsgGUID: KJGQfPViQTKrrkbUJC+arA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="262859990"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:36:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 13:36:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 13:36:34 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 13:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZlZ/36GscjnXyVy4u/GOlNZ/7Uy/TEC3KGCoRaujEXeQ4sEN6HhSIyc099U9GDmIjRYt9/onYl/Ks1ghuD+ATUGu5QwtH3QedyGrJK5ZAyXC9jk4GPP0R2jdM+cin2qiaO+/HzTn7rMxnk9F97yuqzayT3uc8PKs7pFEWtTM6HCazg17airIDuiOgRYDaJEZ2zk1/j388j1BVL/ZHmVnDWYfeDVDytKyfshiwy/GXkfIS7LFqyCvD9WSFX7VCdVWZR1Q4/ZOchuSa1+a67wbJQjMfO6ZMPP0dOXykKBEHtj9p10UcpSIJ63eZADeGrJUuf6kfQgH9FKVuNw/zvXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2SaxW+CEjVK8fFGR9K9pbnUGGdEEyDujrfM1/7BdeA=;
 b=fawzGbfwgb3sOqO8Wct6hZM1dws7xM6vOv3wc4S7qC7IYQGTcOMsB20pP5a5dbLowdQSYeHCEMGT1CFi1+Dh6B0TiHNiz9xwqNn/pf/5pS2Hc7BcphwhdA3WazFa+cpCoW04wIdY3eBoiDwUUpxDe4ytf1K1xr10jJM39GFjGDfnIpLT1d+Grs9e7kiN1B6NFXZ8VKmuz7njGFLlXACxk8xMbkvsT6qq6oAyID22XjtLXTBgtbP1hVimTwbvfW9FpsEgq0bDNqe+pQ/2uO6TrMKpGSBd5exVMIi90lJ585CBRm/nUMCAk72OqxZHZlcfjjFGV9UrTmn5nmFQWPSPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CHAPR11MB9632.namprd11.prod.outlook.com (2603:10b6:610:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 20:36:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 20:36:29 +0000
Date: Thu, 20 Aug 2026 13:36:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Add CCS to the powergating info print
Message-ID: <20260820203627.GD681121@mdroper-desk1.amr.corp.intel.com>
References: <20260819073457.1812722-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260819073457.1812722-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CHAPR11MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 898bcc8e-9adf-4db5-d1ef-08defefab686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UD7y+feOIR2dKqyNTyIOZzoB1dJzPZW2WJ7wNvtGnb7KrGYlEOvN07Rs2CA0nHLVwvDsxQthIjTzUBgxmiJCCOCgZyljRSnNb5fbDoVUj+w1ATSsvek6RFYe5JB1FV38wz432h58flr1cGtpUrnBhQYqD2ei0lwvC+E0wjm7ZSQuBj7WYNcjP8LZfN8kFO1uPGVuhIeUYFqXmCSUv3/3b8LyE59Ivl+UH1s6o4Hj13WiCfcYwmItLwrf4dKsl33G891BV57crTBam2PCaDMDGXe+WJJYyVDzk1TphKHPvGA9iwakwgu1JCpmjUeYXg8ISpkeqxZ1FEW+RYorRLxcYImnHzzLWzTZpQaCEYM0by1vl7chvDEkY+Zvc7H7UjDCb4vssUnbclJoTSL9WilLV7Qe/5NFgqrRwCDLkU/DZGYU7NTCEUMzgBhqLVEKt57T6RFEVsUtrM6OwxxL/4/Ez/5eVJdttuyzT/Cvz5g17ICZVf0VVkFgO2rWMdMr4TjM184vucW6EWWmfHqVzIP9mdlsqiAKgodngzX0Ggrev+oPFeF/9RwHj1Am10xMN/ASQXHhCbuaas9e2o9dnHVu4nXuL/WFiP9Eg36dqab1OXeEPwGGSMZePV3ElNlTd45TrgAY1e32Blya1ccxDat5Db0bfoX79c7ZSzGvkbWS9SY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FD3bHe4sRpBGBy4gxd/+hnPNi5XsCqrUNgJYSFdENQzPbRwDYGHuz5tN+99W?=
 =?us-ascii?Q?mOB9PnT0TVC35pwuc9c1KznfLCVUbGt/haqkwR1aib4SH1H9cPpQbQm1P8Z9?=
 =?us-ascii?Q?U0b5y9bOK5x6mIfQDeC6ON8ZEhpVx/6ODrviGrlalh75XIqKNtVWprlCno09?=
 =?us-ascii?Q?EIfCz91TG40e0WqXBMVv5G51bisQYwzfTiELCsTSyqZUJDjJkFbAuZtZa6hF?=
 =?us-ascii?Q?+419dxADnawqAYuDWWu9C2m6v0wQOOHRECdiu+AOGbex5G3wilseQES07hpf?=
 =?us-ascii?Q?BEPFE6svNnwfdEMIohAUgaDFkYtrrblwF+ANBEwv91iGYPxIqeysGKztXO0n?=
 =?us-ascii?Q?+ft2XZcZ4IeiHnR1QdjvxiiPUs5m2B9EHlPsF4a/lhLcoZYuC16ZpJ8oHBbv?=
 =?us-ascii?Q?4mYLm42zgPQqsbT7szm42MSAgra8Fzo+qEIS/JqjRypheuvL3HvMxvruJSZR?=
 =?us-ascii?Q?xK7udCXmpNGILmABepnlr/pnyVWnyqSrm6wuWslujDezutVQBjBfarchdg+d?=
 =?us-ascii?Q?nhfUzzq4f2meVCKmTx80zYkZk3BFyr/shb3gQ+90cAtyx6iT/73FXEPYSk2R?=
 =?us-ascii?Q?MHcfpWBzoZWdF5JnQ2zW943Tf027JQV7wObMYyuk+ywjGR/EngKGnHh4Ojop?=
 =?us-ascii?Q?iGqkOAKfeoVCdHpRn3UOkYV7TeSoorWSd2IvWZuOnfU7IlR1WQ9WW2P1YSFw?=
 =?us-ascii?Q?HjKHGNMy5S7lVovyx1yHFlUHWsOhy87w1xQyzpan5Vl/B+RruwLstl5XmDmw?=
 =?us-ascii?Q?LEkF4jhBFk4lfKCckO3cMfIW8rMSgdEKeUCUgWiZCZ8exuvXpls+c/SIJLWo?=
 =?us-ascii?Q?WklQviNNzDm1wFtX6KWYbOFq4Cu5BALCBjtKWp/KYd/ZggsmBuHgF8luPUgB?=
 =?us-ascii?Q?tUuFTkZrOqeqKIL3ksqqttIj/DLMsq4yGl0tJ5A3DUVTVMbX0qS1W362F2rb?=
 =?us-ascii?Q?OI/jouhESsONljU3rZxnCeB76ryjnmV+OpZbN8oCbF8LaKReJoym+74Wh3Cm?=
 =?us-ascii?Q?KLgOEHi01Cq/2tjPmkgpyjXkw8SUiutZE/hQ/J9rZB2GkejqoKcmiZqUbM/d?=
 =?us-ascii?Q?Kq/01riDsWEfGwIev3N442snOJ9z1yx3jB/IUXVRW3frXRbwJTZEUVUDQK98?=
 =?us-ascii?Q?VAUegGWqdTAtlksWljkbu9/PhN8WDefkfiBmtxBaG7FFNHg5sCqoNwNGLrDs?=
 =?us-ascii?Q?2Ri/tG1tEllaV0WLd1QBpcO5Tj5RsqwoHXr5B2KGvHg+Iu8VA6XqcQG990fx?=
 =?us-ascii?Q?8my+NY+tI0W2ImJGmQ0ZLEum0QzydR/OEPuCWWR6r9zdSYuz9vlfzdwAh87q?=
 =?us-ascii?Q?UbDVKuyIB5jp0OGtPAx3rHV45ei07kNnBmOE9CwbDC86rDMUR+UPaXNKkq6L?=
 =?us-ascii?Q?McIGEMncOlhkOvV+1TqOEW+7m06hVqyQYFc7H7a7aigHGmwuOIRaUfmIi6/K?=
 =?us-ascii?Q?6Fnwbvm7ps+TLI6RSq/++SeiPaqt2MKwdC0PpthDWYicO3mVYKJKj4sgsbzw?=
 =?us-ascii?Q?7gukmcJPICZcbN+JgzLNQrrc98Xkg0frs7yP3+BBIRYrKzbwOgxOW+NMN45h?=
 =?us-ascii?Q?TUTYRHkP7tdLGsuwpwmWQjAUYAEREBezON9g8W5x9kINwZMondikSiLlc42+?=
 =?us-ascii?Q?pngYjonrnVCJzwGsw7JexdQd49W8WW8+Mrw7t+jVfndeL9/p/bHlqw2bhSPO?=
 =?us-ascii?Q?xhptaISj9Pxzej6lGHHnrOfKvazWMrdiF9+Ij3Ap5dpEtfbjHa2wz6AvclqO?=
 =?us-ascii?Q?9uzOlVjfBLpcmL9/aEON9RdBpqT3qrU=3D?=
X-Exchange-RoutingPolicyChecked: GsC7h+1bLbCihgX1lKyf1KOdsjHsKqgqEY4HQYlTWOW9lmUTvmEH8rioElIeTUdce0ZCgJtU1qjVFQ58R05cB7WtyeeYmwSNl5uwVL6lHJNFYFomzzJxLO4lnxCUnHUQsGhGkZq0TT/VhRS4cPnrkPL+Cknb0N4wR90aUO79C4NPrHWB1skgBMTp/nd3XmmkstO2w87WlVjoyCFhBnyfK7Z5O979E6pj0NA5cBhWQQyONEgsexrfJyNWh80UYI9uaO2aiDWlk2LLu/1++9HUOiyJdhSk/kcoIkzzN2MM7If/cm0jlOW4Ii5TUmR+IaO9F2Nm5DS6qV/Il1a47GCzIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 898bcc8e-9adf-4db5-d1ef-08defefab686
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 20:36:29.3272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Uvio2fxf6GnTeQY6hMXTqEeMY6wcF0kAITX6tO21xrx6IOKDR9kB+WjcRm1wkcySKZ8hirWdF12y5DD+ILefDBlrNBXsclEfz/tSyLWkec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9632
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

On Wed, Aug 19, 2026 at 01:04:58PM +0530, Balasubramani Vivekanandan wrote:
> While reading the main GT powergating info from debugfs, include both
> RCS and CCS engine masks.
> 
> Fixes: 0914c1e45d3a1 ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Yep, "render" domain is the power domain that also contains the compute
pipeline, EUs, etc.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch!


Matt

> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 04b24e1c8b78e..7dc9873aef545 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -248,7 +248,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>  	}
>  
> -	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> +	if (gt->info.engine_mask &
> +	    (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)) {
>  		drm_printf(p, "Render Power Gating Enabled: %s\n",
>  			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
