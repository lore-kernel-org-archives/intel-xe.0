Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C41C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 18:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424E10E661;
	Tue, 11 Mar 2025 18:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/ELy0FD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E46A10E661
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 18:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741716164; x=1773252164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w45C8h5n+MeVLA+E0lFVfaoSIpKjIvD6AJYBWVtXnM0=;
 b=f/ELy0FDfKe9axXjF4PlCTyLDpniZu5hCTD57WroC6L0++E34poM8Hy/
 oTsBjwbX4HP46I3ycJlWodYNLH7vWENkjkgzUddTkAifHwyCOjdo4IL3A
 ITidMVp7jhmFQfQYyozdVe3c6xgRUHZ/8JXa/qngOrN+pgBOiRjL2+OSS
 p+WuUC/EGK2ri1HoOeGUEb+9+ExsOvW0GyamXCHiIua/Dc3z1TAKC/L1h
 vHNRfMIdmLGNn+gJkTAKH4cTiGFaXiuKCKQSeCRrDLZQQIx1U64cNbNPA
 +Fw+OxImy3MfRbQYmpCimwNX5AMSkmvyH2t5LDiKiGyUVvgfItgonwgCk g==;
X-CSE-ConnectionGUID: dFLec7cdRbCdwZTHJ6VRkg==
X-CSE-MsgGUID: gZ0wZ8ojQyCMvWgMTo7QfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46416646"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46416646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:02:44 -0700
X-CSE-ConnectionGUID: f4AYp1PRQNSfTgeeKkj6lA==
X-CSE-MsgGUID: 0lsQOolOS+a7nXDC6Y3xbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="125296871"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:02:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 11 Mar 2025 11:02:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 11:02:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 11:02:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hx7c787A9GVdn/2UbuFEXdrpEDf84RTEtTl/2RFjvOoGV6yoQoqLd+mX5Yg6w4y0blKpAfrmabdp6QCawcZhIj9MjeOEYF05IXqb9v7UgSp2+MkuLg92+BsN2hUP5XyM3SqgPx9qcsBgc6f4yJAnIq3k8ReHSBpD3kHFze9PruFNtQ0UlTDBEhaSa9LMw4k4tsgZvGRZKjlIHTL6crDC4rJT0horEDhCfBjbSIFT2blEYZ7rkY7BcKh3fFEfWNyzW0uk3T6eHhR0M9EAzjHoCziWnnAn7I706xZduKpPpWvmo1FUN8IYr/coGjzhF4oYDZvPr6fIRM6Mdvy8ik6C6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6itBx5kBMf+f/XNekHraYeb98f600GmQKlHqYwSR5vA=;
 b=Lq3CQmMW+aYqeBqJZCEGTEFPiyqPVXWTD5dJOb2P7qC2dwgu1fGSLIimncoYLqBJDY1LWYQv9tVsWHNSoovM8O3eLtQrXFyeJbGqdXfozBniVdze6DPuDSSuw00L9F/8SslUstT+OrtX8TS6jMnv1/AjQfjGkF0KG1WlAhN/yfzTxiUfXpAWOFT6Tr7Tda+xbaQBH7kQA1JFnp/oRi8bZ5N8JAF8mWBYVeaqJTCi4821L45P/GRO26+2F+amki6/BOyxnPfZ/Ex3hP6a7BBa2VD+tOteyHpzX09cHpnd5E9BRmuSW+UV+qPhn93B2ES4xkEGJInUwoIYR51Xe/0IBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 18:02:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 18:02:37 +0000
Date: Tue, 11 Mar 2025 11:02:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't try Driver-FLR if VF
Message-ID: <20250311180234.GD3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
 <20250311135726.1998-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311135726.1998-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b03cfa0-f0dd-4a95-544c-08dd60c6e815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8gpRgxXDKp55w6SjS//eKcqhlTEY4A5F3xRiqPojcUzcmjrVHAXjke3S7W3D?=
 =?us-ascii?Q?nIqik2fKNCHl+QEw7nC6LhJwRW5N59WZplmaIkIOoAo/rUlS0AYKIsxE0ngi?=
 =?us-ascii?Q?OSUb9QI8MrgnNivzB+aNgU9H+OZuRk2Sy6FbCrktl3MiUVUgrNh9Wcsb+pfh?=
 =?us-ascii?Q?GKOIRmZhhVzI9kmPYFlLfjmHKlyQ0VOrHslF3eBTBEmmwRG9xqk2OVSLRmW3?=
 =?us-ascii?Q?ihbzW8zcNjmA8mnjUzcXyyuGFpGI4IF0EaQItZuEKWT9cSjlvLpVr4e9z95I?=
 =?us-ascii?Q?8BxoDTUyK46rzK6dMCyHTtq2C49g69KsjH1UmAsGE/3DQQCtbR1d+ImQPJFb?=
 =?us-ascii?Q?VxmZqlq5TN4i8p2dwYgqmX1ZR5zCzg1+Otq/JYaCewuZMhcygTosAuDzXdzK?=
 =?us-ascii?Q?zasj4wZYyLR0KZIIUxqg6MvKi6iRSesdcxIqVoM7T/rBGhO4ChlH2k9CfruL?=
 =?us-ascii?Q?uhcJarZQeD+fBrhgKMUSWlqay9XDynudhMQ6QSlVTte9sGh+FZg1t4sMMUIx?=
 =?us-ascii?Q?MioWa3CRUu89muuLpugvp5rc6oBvAGNTa6ruR1OWOuXSD4yW3TksGRdezdbV?=
 =?us-ascii?Q?DZAXdFPGPnP8l3KXvZ7R6B2Zu2ptlHLFiZ5KZevEBPmfegYFhCR+OFMDWKCc?=
 =?us-ascii?Q?Z++geb5d7Qhz4EZ2keQhWdviZr9YCMkc9IH9J4vyMREITBFn1ekWCT1gYrfA?=
 =?us-ascii?Q?5UHxdtEVB+Uz5M3h/3WyBSxRPTEj+WmSkoLuF/aqAyCix9V1bawmcLGQctEP?=
 =?us-ascii?Q?sFTrrNxJ7TxZeGpoFPnYsdK/cu9lWE+lsJ0aIagsVfiabC+2h7bdacr0VdIi?=
 =?us-ascii?Q?0s4bUL//jVMyYfjPYOjT6tXlQIMDRP0ESlWAiadomMVIcD7W5jbxNFTJ99uk?=
 =?us-ascii?Q?bQUgSASqX4VIvQm4EaYTVLetmgsJMJHalu2PqokB2Za28vU1tTYzWPhoJrlD?=
 =?us-ascii?Q?U9aFOb1AHSHXUpqp4xUovhq0uAFual3r4HI8XAuLNy5QmBq4//Y2sQA2QFEj?=
 =?us-ascii?Q?qpNkDs8GNnvELTHm5b6x+p469YDfaPWuXLwwCwCH5zZOim9ps8uUi1bwfPup?=
 =?us-ascii?Q?OqXnPWmqbGT1VPomeRXvLD9c9pUbpwnDgJ0Ip7YX8pV03cMxmmII3jLSW+8z?=
 =?us-ascii?Q?MacUtYvAFIjschpEW45bm1k1PWDRg6MRizhBCG4wYMVnPPWohjgtMVpsDLMZ?=
 =?us-ascii?Q?S/BPQmXnZ2TQppSIwkWTeLchQVKZaVz7zLqup6Vl4mz48+u8pRvJSeydf0/e?=
 =?us-ascii?Q?cZbNPngjsmNd45+OKoUhS8TJ9uiCYSmn6m/KoJuNFC0CXjozxLInm6BD/WB6?=
 =?us-ascii?Q?C0ZyzSFjHHA8fJtFMzu8WHyTW/uJjxY9Ioyjm9DFYCim9tCFqG1ZKbUNKUwu?=
 =?us-ascii?Q?DdU2vQeYc4PNZ1EqPiGDkDS08X75?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?51tw3AgC062Vw2Z+NCBBMnlr8H0uX3pffw1vU3U9DvEFleSfB6ORzAym9JfY?=
 =?us-ascii?Q?LJbqWNURq1dwnhsOxZw8tYVdPyG7yMTZavkHUXi4bRSxgUtGzR7f0lRbGVru?=
 =?us-ascii?Q?DVqA1LjagpngrwDXHRw+OtwKKFfGRkdmBpQw7CWJ+Aob5qwi/DnRMRoYrT9P?=
 =?us-ascii?Q?6CAYQ55gOclsGsoMAsBzNB2+Y7W1o9z0dLVrc3zZpPwbD7VUOGbBtS17zLDg?=
 =?us-ascii?Q?qONUK5PeZPsD+jnZluUX9OAF12WeHnYzn23K6w68Ks4NeV199hmFZ4wa+Cu3?=
 =?us-ascii?Q?zskdipyBfvTHbTdW9nnWKheh867JWgU499vHsIfVcxIOc+AvileUrjgdGOu+?=
 =?us-ascii?Q?YLYGyU+6i9s8kTIltUboQf45NmiqhTlPtlbc8nN2LXc86XAm1JjRAGNAGO5T?=
 =?us-ascii?Q?3ss68Qskr+QtEw4+uPWau453Huh6MdC4N1flr/1Rjxlgimy/r+DsPTxPsSIU?=
 =?us-ascii?Q?OQl/MNDL7vK8O32v3qYPn1o/4muR/L4dlcCDZn6n62tgvzdp2r5PHI1K2nCt?=
 =?us-ascii?Q?HIA26fQc8mZUh8ApnDggeLsqGZTc+hIJ8WCHbZ/kIueauFY/Q1Inp5a0HIFb?=
 =?us-ascii?Q?cWVOrnO1q/P5N+v9SqZu7L53ycCk8cDyQlhGJXrfR10tisZgB0fehbyo0wzJ?=
 =?us-ascii?Q?ij5EXqLkYyibqj5t0nPf997ZpK7ui5NGG7naev77Cd3tRxE1v7laI6cD9DpW?=
 =?us-ascii?Q?S77Cg7b1Jt4P7l0QeNvOStDKVmdGcVXq+6qPNC/NzJ3tp+aUG64/NlLgr5Lv?=
 =?us-ascii?Q?n4P/onJHPKxtjj1xFph+yvggZBbNVeL4iNT9Dl7ZYBm+SR8FqxCg5E58dp1G?=
 =?us-ascii?Q?JCHzSZl5m8ZsnIndngqR7hD/Liw7cM5dM90SLH20xmpx9WX5tkeo2khVv0LE?=
 =?us-ascii?Q?QZPsLtq7D4o9mSGpdxhFjzMnDOiwBRpBOhNW5vtmkAFvuheIKfO2GEt985/B?=
 =?us-ascii?Q?57s8gkj7i8pl2+qk4SDmxfP2N2R4byOZZzTNF5LJdNsY9BKVcHOSUbLiBtiF?=
 =?us-ascii?Q?FA/KgQG3hXkCwYxY7OVo32g9hTE0xs/NHN0jRbCgOOmuW15cwRdDQ5+tIEp0?=
 =?us-ascii?Q?SMyJoCndUwY8q/Jm7gbqyMrwl/CVYhYhKcuL7LNepGb+u7GA0GsFpt0PS+7e?=
 =?us-ascii?Q?n1EKHiwPgMgRwzM0lku6+e83bTYc+ef/hUUHr2M0iGMNlaI/sENlaBW6gaRj?=
 =?us-ascii?Q?9ngZ59AiNHAMnIr94BokvDVuKsYD+hxx3TPv7RFJnwUEfMtdUl4v4OjAx2BO?=
 =?us-ascii?Q?hyPftZ7ZiCC0m+9mXlPWmA2io6CBOPw6jGAOTQ1YkmUc98kF7l3GUBXuFTwm?=
 =?us-ascii?Q?w9Vu+3z3nejTrhz45nWOzPblw7Bbe7sMj8RlgpXalChr+UhTnY6AsO2YAWKQ?=
 =?us-ascii?Q?Olmq6s3hjFxEJ2rhsEuI7ZtAZjF0y5VT0Zgw7CaGyiRgs6M6VnYhkBAxJgD7?=
 =?us-ascii?Q?Ubw8lcLo+PZeVyQW6W4SImUXjVZY+XPKN3e0TW4E5cl/I4DijvAM6YscHYKW?=
 =?us-ascii?Q?QKFwZ8cUleQ/4FkucyD7uaHFU3ePGdmVliUm0xJBSWlbgAmrHGklN4yncRBH?=
 =?us-ascii?Q?Wg4/ZO58A1rPW2Xd93L65tcrF3OzHud/OHUH4C9wuZ0b6zHTVDlNT4NKjplT?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b03cfa0-f0dd-4a95-544c-08dd60c6e815
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 18:02:37.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwaVn0TmWZO+6yp7LuyX3WjBqsxhT0WA8DP+YBSvacur7lZWrL+MdPXGdk5tlEJj27smC1HdP7k0dT03UmRz3y8oJ7UFrop4P8WLgR6m7vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
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

On Tue, Mar 11, 2025 at 02:57:25PM +0100, Michal Wajdeczko wrote:
> Driver-FLR can't be triggered from the VF driver, so treat it
> as disabled if VF. While around, fix also the message, as it
> shouldn't be printed just 'once' as we may have many devices.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5d79b439dd62..a2afa8a88997 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -504,7 +504,15 @@ ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>  
>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>  {
> -	return xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
> +	if (IS_SRIOV_VF(xe))
> +		return true;
> +
> +	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> +		drm_info(&xe->drm, "Driver-FLR disabled by BIOS\n");
> +		return true;
> +	}
> +
> +	return false;
>  }
>  
>  /*
> @@ -568,10 +576,8 @@ static void __xe_driver_flr(struct xe_device *xe)
>  
>  static void xe_driver_flr(struct xe_device *xe)
>  {
> -	if (xe_driver_flr_disabled(xe)) {
> -		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> +	if (xe_driver_flr_disabled(xe))
>  		return;
> -	}
>  
>  	__xe_driver_flr(xe);
>  }
> -- 
> 2.47.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
