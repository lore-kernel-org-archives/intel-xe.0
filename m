Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78039CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 17:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C66610E818;
	Wed, 22 Oct 2025 17:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrrCWgMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05710E818
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761154398; x=1792690398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aZ/8cY7KkC7FzaE8jgntnqlUqThHcc1y1TLNri/+7p8=;
 b=hrrCWgMHNyudFekteko+9nPNub/ibCmOdHvnozqQL+ge9Lf87Q7qjFuc
 pxMoeP+2K7U9VdqzX5MHgnXXMJQPWKitwE5m3VcWpJ4L9qt9NoGtARcJM
 GplFWnlv2dBcDgVgqLbXfPsXuiUotaNOwRuuTL/MLQxaKjTA7sBexwmBa
 nEdM41S7+BRuqsec07Z6PsctepJBoef001v0hk8W2b7P7+WRUHnRmoXkm
 wsxtI/dwm9iuwgnAVdcgylpvZrM5WJMkYFaTA3OmsBEpDSYCt+eo+vMmb
 RXGQlxpewOHotTfH12YqBxb7w3d11uiNAjlnuKpkeYnZIKhQjwT1ggQWu g==;
X-CSE-ConnectionGUID: gFnPpa+iQ86WKFpRdoahWg==
X-CSE-MsgGUID: kwQFHyBWSym7JqiqX1qlFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85936132"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="85936132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:33:17 -0700
X-CSE-ConnectionGUID: E6ND+DSqSG+yMPj9i1UKPg==
X-CSE-MsgGUID: usTKlMoBQ/eowq+tBwclMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="214584935"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:33:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:33:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 10:33:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2YGfPF5vmBaf08RtlPWC1T8VOBYWAEV5XU38a4D9PKUw0bnHoJ3kRrqzB9C3EIKXp+46ryCTDqKAvQng2kBH/NBiaos8OlHsM2wqoYCI8SP1fQVuMZ/UyL87ZoDuKRSbm/WTskWpI3ingYflPlXIjIaKkXaaJikskGQP4/o7eNuF02EMUaH33pM/Jc1G4NHTME52/LRTF/FrceT8EmRPndMAzFoYgmUrjZlV50Nzx+qddZ9cr1oYdwlxVTwz/nudOphn/BIDae7RvogUExPV1pEh+VfgYkZpKLHsMHHlO2SOr4beCLaVdjYQt4Kv5O/8ybg/bHqwvfUau/lhvJlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hgz2Sz9iKTZKRzM6tH5qA3mq7mmY8Rqm5UqdvZj4tk4=;
 b=aPFOFUnEmJMfboFJVup/f8buvSFCqaKgLJ6xibRlRTTJWHl/3xaKcUB59yPrqqWYVqPshUDfzjsYAx1U9HEqpbVoLdqXfMDG1F6AO5Pbort/s2L0Mg/LILjCmKfYc6C/49wQqeilMyNetg21VtSSU+dIsU5BDK99L6B1I3zQ8zbLcPRxZCcX8Gm6W7oXGHFR1AeDlrcFDnKFN7SMARzC+EzDStt1oM9lQ1HIDyof5WM2aSMghRXBwbUa4Vz701LkWodrjZWK5x7X6cEHRoKp8I/ivUmpBEL4Mwg01IMnMkcyBSfnPUi7R9r6cdDTpwLsUPi3SE9Vcsi2r8gfTUbfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 17:33:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 17:33:04 +0000
Date: Wed, 22 Oct 2025 10:33:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/7] drm/xe/migrate: fix offset and len check
Message-ID: <aPkVTkO8ZizhW+aF@lstrano-desk.jf.intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
 <20251022163836.191405-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022163836.191405-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:303:85::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: df2149d6-7ea8-4224-f7c7-08de11910ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pVR2GWf+8vQMylwpzGjDVLP3vFCSBYhcBpWVs0dISQbU6GKYeBG949PN270x?=
 =?us-ascii?Q?6Y1ld/33MLLhyIwY1KA02qeIatSmDl4UldQq3T9Sh5B3znkYw702b2ivCrqL?=
 =?us-ascii?Q?LR5lwBDFhkVy2tciFcITcka8DlE40rEDMxSol928qfOYp6YJiwGc//Q/ed5x?=
 =?us-ascii?Q?p/LlcPzXq0xVLKowbH2zVITdCtkerhlPKNtTk+zpNKrU3ItgXBFBqpullAKS?=
 =?us-ascii?Q?qDep+qlQVUOQGVvtKXkC92NoxSj4MnPhSPzKbjkjRAahYI8X2xT7v5u3b51T?=
 =?us-ascii?Q?BBedoUEG+m64Gv1VeidFGR9gquxffVgLHYjESBID31g68666T7StLDfSb9Gq?=
 =?us-ascii?Q?ky3814LXgita5lZ843FJh5bAzXqaWwB1GxSLV8BnsrKgfseWzRG93Yu+5d62?=
 =?us-ascii?Q?Ut9LPKCOu3ygilW8ZYWK7sLhPrH2E+pRj4UM3m9voIFaA7T9ODYzZu9CzRiM?=
 =?us-ascii?Q?kV4gsgxhIiw1fjy//GALHCneqd64Xls6EdF0Uy0FjKhmupQpNoWyb2tYSdbg?=
 =?us-ascii?Q?sfkrvc41Nz4xwJ3wHx4ojyEbpxU3xIaJxeEulXPNw0qGqRX0ju1T4TSp6jc4?=
 =?us-ascii?Q?EjCyEvLtr8DqsdK9EtS0imKSqOByFtzb1AfPFZXDWuXXa7moOf5r55hLNius?=
 =?us-ascii?Q?vwQJ5QSBasjFG8PblYBazctSzAxAJ/SjfmP4MHk/ryZHNDxmroilB3HHZ4uk?=
 =?us-ascii?Q?DGVbk1HcqWayifJuE6k1UMrcKLGyIzaAlCsMSt6kM3dZ/oYbT1hY/v9N+Pwh?=
 =?us-ascii?Q?tisHTSCrGR/AhzXFszH7wSqe+UsRPszrI8TmALKuL5wS26jo0VpQ5JmTG+IF?=
 =?us-ascii?Q?+LGL5N9j4K642FWLItCNW6mZrmY4SAicRy3aDqCiKB/ZmZ6uaexOX7ZEG4qP?=
 =?us-ascii?Q?vMuIYc/P1PbDjmPF6YbFGUIeAOHPsULGW322Ti00JQyq1EN1bN0EsEW5fNcI?=
 =?us-ascii?Q?IHCuFJ0Y1lP1a8y7qYoTiGIzVCsY1LRxyZVtchvvPOVZBeM1t4eTJ2MJcxmD?=
 =?us-ascii?Q?fgDzYkFG97XiRMbSzefSj07rURQ3/6AjX7j+G4lmD1mSiThKxujitnJIt7Ih?=
 =?us-ascii?Q?JVr+c/VD/RKEGx7DTraLysF0+HdKbjcc9xRDNJeMBtzXKZAwlmGmvCSNA8zJ?=
 =?us-ascii?Q?YYS4M/M/CI+O5pJ36TodjPDhhx5hMaEejNTfDxXuCG9LcujDxfAv0PIOiuBd?=
 =?us-ascii?Q?65y8BsRTeW0Xva1te6ig7kZb89vtgmLlTlFjjRWE8gvgffKdK9jq47cKxQGl?=
 =?us-ascii?Q?FbNNoix1F1td7ppfiMSRVAS/05oQ+zVRSXy7dWcDJA4hAGgzPpaAI6oEW7R6?=
 =?us-ascii?Q?Xz8Vnzr+WtOncu8AB4kqcKUUulKWtOZgd6wpNz+Fn32pWmiLUcGhI8yRCxhy?=
 =?us-ascii?Q?RcJX8HnfmHXjQl6vt/bDZS3OEiZ/8eqWcyhf+TgcqSV7cu2aUn5QWsOqGFBH?=
 =?us-ascii?Q?kr2+nJ2fiqPGYj/y13hG3oQa5buIuaPB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHHQ60Bs1JSvMuJkaouWoYtbRh6v+UD66DNY9oWmhUPMR4rx4vUF60mRcKTp?=
 =?us-ascii?Q?LCjXGe76bRat+53Wt2NWxle26yLs05g1oE0XGzue3cfhm9pJgaIuEcPD7LIm?=
 =?us-ascii?Q?ok7GJc9Hmd3vb62Y9qnAYAjy9udB2UP+AwCEiQzDc+rNobciGplo/4xGYh7B?=
 =?us-ascii?Q?56+eT4NvePuVPEtO2kY8qiDqMC3+/I+o6c5B06D5Y2/3ZEoXkeuM+tNVGOiu?=
 =?us-ascii?Q?1fa6ZIuVN7y1VHBQam+ozjgYySih3LKBaDX7PdSTO2Un1SagTe9iOk39mG1U?=
 =?us-ascii?Q?PRELmpHgyQojkkoWe80nJ55DV3idqgt56OvHvGWcKVJAc5evnuYbY8X+yd7u?=
 =?us-ascii?Q?kz/a3uNkKNB2rfAogDRNy8/JQkWknTptcaAWFK0l92dbfXtRnm+iQyPJgBo1?=
 =?us-ascii?Q?Aa0kFmSCj6YfxSckPQVYSKficzitgxDuUuqGpIDVvedd+EmcEKbiupAIMMmU?=
 =?us-ascii?Q?MDeNMYmMjVyTPJibhPPfmYl5+IEHtGvDGhLFppLPzWUBzvX15ZaY6HxL1agL?=
 =?us-ascii?Q?rxJ1kYq8isityKJFvoGvtpv/m8DNkDvqaze4KGkq2YAAE5n8c7z7LhAfJQ6A?=
 =?us-ascii?Q?YnT++cutRSjHFp99aqwDfj4ghPGoA/cQMD8KvEvYxGlTrseXPwckaov9lwJE?=
 =?us-ascii?Q?I7ltfuLRcop7zoMYJFgTULjtGvtKd08roxoyCU0eMWiRqL9g/Pa+Hj9F73dw?=
 =?us-ascii?Q?NFCD55es6Gl0OItGaoZexr6BhuHmQ852GaGO26jq2eNWewrQ19RbN6P6dGWs?=
 =?us-ascii?Q?r7EuFYR2IOx5vgw578aPFag8rH6JbwjU/YoQxCQpCDeyKsVbQeLJcaP5r5rj?=
 =?us-ascii?Q?etArj/w9q9t4fHqjYDITzqnwRo0DiQaX0vRz1dsoLkV85u+I3OO0txezuhxw?=
 =?us-ascii?Q?aibouHPhbl9JhjOdee09JC9un995DQ99XnWff528BUri1DIyS6gasICfcKei?=
 =?us-ascii?Q?LS6i7J7JIOL8/qtg6bbCnN3CJEyvJWc8q67v6E0GrwGUsTd3zGg197yxxg5E?=
 =?us-ascii?Q?HhMUNicQP8FOAbjhJrYzZpUYpW66dAkAVqsY65oPAsr72b3wEZFISXfafp9O?=
 =?us-ascii?Q?uGE/+EFvGD+uYcHeva6PA4rBAX3Ox4QdrnEJZs2u8gqTwufg5xy2lxg9tEWy?=
 =?us-ascii?Q?KM0VZjiKrK2wfBjh0CoG+dvoE0pOP7kwzFjMP8q1qBKmkH0T5iDgLXfbJvtM?=
 =?us-ascii?Q?+DjaLjDKADsq/yBkSBvYd/9+tAcc0iNQx6m4NeV8H6hxwejJoUgOFBXIJZYr?=
 =?us-ascii?Q?vd2Ru9VodVHv8BCDrJTUfwObRQ/WuYsH24ATVTuJHoUgK5zj3UUp/uFLBpZ1?=
 =?us-ascii?Q?1ZbIuKQvLRigDxOXyhbk23/aMCAhHCWoZ81v8CnabmKWG4ZMYGFy/DGWt6dc?=
 =?us-ascii?Q?plrOOofp1WiN9l6OrVgX56lqh1bzD3VRJRZVKvVQpQal2feK26NQXsVfuih/?=
 =?us-ascii?Q?it7WNfBSp6ZFbCQTuzbIAC4he4CNAtebKsRl4h7SJA16zX9UMXXl7STwNbh7?=
 =?us-ascii?Q?dUqUK1Sc+1W8YB1CJmO98t+WCYhOHX644jMAxgc2jkMzFafOVcliKCRvEXeh?=
 =?us-ascii?Q?K1DCPl2SbA1DoFduad5AhSrkdcwQcTNEV3XHQAj2DpmRMr8rMS+S54Ip2E6U?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df2149d6-7ea8-4224-f7c7-08de11910ea6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:33:04.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFfxwDDFuPGIaHYneJJBAUCQC6FxIKRvv6z3BdRoTtD+kzr+IglIT2ZYEEF7yHB70OjMUEqTzt6lG4KFRScSGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
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

On Wed, Oct 22, 2025 at 05:38:30PM +0100, Matthew Auld wrote:
> Restriction here is pitch of 4bytes to match pixel width (32b), and hw
> restriction where src and dst must be aligned to 64bytes. If any of that
> is not possible then we need a bounce buffer.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3112c966c67d..ce2ad876586c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1883,7 +1883,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	unsigned long i, j;
>  	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
>  
> -	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> +	if (drm_WARN_ON(&xe->drm, (!IS_ALIGNED(len, pitch)) ||
>  			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> @@ -2103,8 +2103,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	xe_bo_assert_held(bo);
>  
>  	/* Use bounce buffer for small access and unaligned access */
> -	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> -	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
> +	if (!IS_ALIGNED(len, 4) ||
> +	    !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
> +	    !IS_ALIGNED(offset, XE_CACHELINE_BYTES)) {
>  		int buf_offset = 0;
>  		void *bounce;
>  		int err;
> -- 
> 2.51.0
> 
