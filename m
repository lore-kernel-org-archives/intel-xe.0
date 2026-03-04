Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0BCEF900B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 16:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C210E9F7;
	Wed,  4 Mar 2026 16:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgJmc90X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE06B10E9F7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772643012; x=1804179012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kCmT4s0Z3OglrA2BKnkCvW/u6LODi2hBHWa1kSS0pzE=;
 b=IgJmc90X2mBEabbFf1Bjfcf7F8Aw3GCMSUA3xtMxqrqHQZ6Vxh7TX29h
 uwbRSlH8O2wn5/dTRLIMifthFFFEVG1M/NakqzceyJyo7qK4/2QNIaIYY
 goN41H/vGq9xlAWCmynqu+I95hncVJOFgo7iEAvj43k8lGp49Kkuo8pY5
 VM2AQQGLSAB8w+QRftAS/3SjoA1/TiJiez7vbfkE1+vNZypL65EZCXnJq
 e+0wSPbYqr+pxeUDV+GU5qCg0MAarFpaaXhDWpV5xpgOiraABkSs2/lec
 tPvQ9Gw/UVOjGUtTaChcD8Se3wGYiwvJqnJW4B50q9/Ztcz/+LLlEc7zv g==;
X-CSE-ConnectionGUID: 7UgJxEDsSXKh0lBqTWvCPA==
X-CSE-MsgGUID: 7p66nxKXTA6Xedn0ZE6tjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77315743"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77315743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:50:12 -0800
X-CSE-ConnectionGUID: AZdhh4TqSQufdKDU6EcBRA==
X-CSE-MsgGUID: W5y5LTPuSR+TtBB0UcvCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="223367423"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:50:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:50:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 08:50:11 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLwf+Of2dX9Y25Ziq1l2VvORRjOpxCo+GxrcelbARu1sYz8aup3/AOn5PY09OvvSgDfK3Y6ujM2aeQBiTIFfKS9dSM1hIvi6K8wQOHkGW8Y5Ad5uH1ta+P+4rGYkUjz/C2YkDmVpJPrDHllqiEQ0t2tLftB13ackLBfDNidP+65kaJjfMYSzmB46A3w5S6KDYvtlVl0ZopFgFlJll2MEqoF54qobBw/TyDjLas9k1KHr457y02/a61VhDbg2YIbjd/vddnB7/1QLl9nn1IiWqVv8UT0OvkZdlDi4wZseeuYG+pbQQonqV9XQetOZKq9r5kCu/EmNkZDCpN99Ns8vsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yWSoJnyieolFvBw2TTXe8cbWFp1gfui0wZd0Ix57rQ=;
 b=WQhR9ltzj0JcsGF6tqu2z/cTBnwH12OtI5T6QNMrsT2hvAiHs++64Mi7NePlvYhqlqiQEXR8bal6/VPhZf40D85yU06iyYGuxjTEPFeZWq3l2TaAZUZ+h7OQ6r2/OYt1xJ3mfkpFkkJiPKMiPCBsYZw70eq5YdZlIBFgFhPap7OhXt/AZrwE2cg9EEVRj47ovg8WD610neWk9ZZXlHZLbWMK2tV/EDuSL2ejyxozpyvulufwoglyN+v3agcbbXAEjnCXfYQ7l5V7RmI3cNPzXc7uyEw8+OiZs/ipKCWrspANWHonR/0LXDfLno7WCjleWWYEuNXYKBNVqEdj5IQ4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Wed, 4 Mar
 2026 16:50:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 16:50:09 +0000
Date: Wed, 4 Mar 2026 08:50:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/xe: Skip adding PRL entry to NULL VMA
Message-ID: <aahivkL9Qe8g0z8e@lstrano-desk.jf.intel.com>
References: <20260304005607.2511440-5-brian3.nguyen@intel.com>
 <20260304005607.2511440-8-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260304005607.2511440-8-brian3.nguyen@intel.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: f419b241-c275-43de-3f47-08de7a0e1840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: zRQv2LRLV15ORJBfFhi8BSNLmadkXNOjLoZvwTc7uIxsxgvjsKOgJ/LmfxgaU6RlzFfdMMnSS+8IR7PQemu3J1Svyi5KEH9um/8Jy8rRIjGl7KdcRO7xrVL0DeHAZIsGrbyXdiokYXM7UtuMxjvoFBjrbFXbwoe5BP5usUfAtzVrXTxNnF0hQ4HTwCCPxdKKTFLiUzmtPNIpC0B26S8P3hqBvlKK/4YwTWigt4lK7Hiuuj1bg82p2CKdqJLGbPjySQiHg0PiZ+LZO8BjpuHHy9NkfGgLYbACWG4/qVNEAwIlLNHXnhDcdWGxR0+O3xi6FTxjUz1yCma7hjl/X6OWGyecRNBwKnhYs5HCZtRcPQCFkDgzy7unL7AM1UJVCva8Veb7YWcPuEHMt7e1fZW4ALmYraBf7oVtQ4IGwXfQ+4D1CAClJKgp8/r+5Q6t3B4ksPom/8vDEcMzzrDmy19BD9iNffUZi9LHHxrqQVfbkEeGbZPhEBNRc08ho3bI4rRdZ6o5H3w4un0l3L4Vyp++pOV3oNJXwo5uBJKkDvFsNByQ920enoqjzPfd7YibqBp6qMZMV+uuEEHGM+vtMm8KzyPKZnVIj2aUorO/m2LWsF5nXNvvDxmnpbGFCdhT/4kODi6f8FA1+N1Da+tNb+wNFWXqN/TnyHT7CsgvRJhWb3xoxX7zwLQc1KbwBBJIresQhcDFx2H1wZQC+ArwWexSTt5kQYuLp+ct5vh2dlPcC8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JbSOb5KTI4KItvX2FoJPnX8TtK/bptXPSWN3Zco7N/JAi5F7aqVVnoAfZXyz?=
 =?us-ascii?Q?Vb/D9aej7E5HC/8qrRyigmPsWMgtxvKGQpnBV7uLl0gNVyMyDbfiRSTokr7p?=
 =?us-ascii?Q?0PbMiKQ2BQJnK6L3WfEThryk+KUJCGjPztVdFfVnzRDzIhrmnngIs38PpxMV?=
 =?us-ascii?Q?Xj0ZdYD131xf8w53iX6OKsC3wAfMKBuV1vu4ikWdSNrwC95cFkBAonlccUrL?=
 =?us-ascii?Q?VkYF2mkOwY1E3Dmh6HMupbBn9sIh2Mwl59po/K3LLrsctWLyLJRH7mim35mY?=
 =?us-ascii?Q?nxPsKe+PNwT5RvjrNhoVz0Uw1xbUqSUbuZuTyX3cxDtbjBYcSofC9Wy9eTjJ?=
 =?us-ascii?Q?UQ6NpL14JowduWAyKZd7PHr/midehCovxSDT3aVn2HL8IaefjsE+AwQGcIKZ?=
 =?us-ascii?Q?NGkyK8YxDc5vuoir4CE6ZqCftQbLkUxoGepDy6AjnNtDKB2b2+R1PQLWPLqA?=
 =?us-ascii?Q?oehKzR+6qq1KSCTpDKb/fMvIJ6gxao10wKNW0RGLa8P/bSvdPwaEw62s6klH?=
 =?us-ascii?Q?/G149ivE6R5O+EmRHNfRSxXNZEIwYv44Rne8WS4MJDMvBs+BflrFnIhyJWs1?=
 =?us-ascii?Q?xwfwu5Nc1pO/Th7/eYxxk9KdXPoJDqo74mpHIjopE0CCwKcthdEdpaoHXw1+?=
 =?us-ascii?Q?SX1Snd+Y+/1RMWfe98lr5Ko/b4UD46NL+EKnGkPI5ASk96DAc8DJ4A9M7+ul?=
 =?us-ascii?Q?2Iz2dINyVpuL4L0JfyK/7UObjyRuX9Yz5xXhB1WLw4omybRW7izfClpUXI60?=
 =?us-ascii?Q?dWDFwIywA/aj98UKPHGbB6gyMLunW4IYaOSIMmuPSHgWEUbUl4hIN2rK1h0L?=
 =?us-ascii?Q?bboVDG6CFIcI0A4wvkaHB23s5BHcrXiH6bTSsecA3Z9Ue0nzusas7GDa/TPK?=
 =?us-ascii?Q?3U4Yzxm1CbnVdjZJ0leU+0UvNPl0HXdrD0ZpApM2kx8ME99wsNnkT12nRRTB?=
 =?us-ascii?Q?P26aFtro5dX2bxYmuEfXtKpdKh4EY9jBqFiDyGbJtIU9+glg6Sc8TOH5UIMl?=
 =?us-ascii?Q?xS+eJryXKe72J2KtMmlbHJkt5YYT/uBEg//sMNcd2biu67GsbdloU6txTbor?=
 =?us-ascii?Q?WwtAcHJ15DbThsoIoSPvBKaoWkOlGou40Q9YWNAdnSppfvVEH1h2w8srK7vL?=
 =?us-ascii?Q?oNifd4V73ze2IEL+UPV+RRgcTWJqCvDrxOg93cP4fM9DI4Ridb4mrJsOEgh1?=
 =?us-ascii?Q?BIZfB8EjTuH6E/5UE2zg4OqejX1WLbAEpf4UtohdLTb6iyfUKpt08vru7ju/?=
 =?us-ascii?Q?QRyAHPXGeLt4eu8oIhrSZrEa3KW6Y76WJbwBnRhUCTvHtPv17/DJCWJs0xUB?=
 =?us-ascii?Q?DL6l/y9SoP2snUeb9/seVdp4C9ET6cc6uXl5h4off9HyYzhCCNsQzo2cQoW6?=
 =?us-ascii?Q?gyuQJyc/abKsKD0tFKO2cHAXAVsuqtwbpOIJp5luDGZ0Psh39RiXikFENJYN?=
 =?us-ascii?Q?67QBO5nuvJk2fbJQQx5nhTKEdd+etk+Lm9Bpfl0/5uRxXRuye1/ysTFNAo3T?=
 =?us-ascii?Q?H2XLJvF8y3sTvbgC5IDkI7JDO4WIY0sdZmzJNQaW7eIw1AuiuyHrroxdNd52?=
 =?us-ascii?Q?HoOpcg/pYgJhfhYDbCERbvLYHUvB4Qy2dsIiuuVRMEWoHxtK4giChdvnsGQX?=
 =?us-ascii?Q?teqod8pohzYbK2wX0kq8R8GjaqYdjRkWm7Frhar380oHenxGF2tbPzhuJGiy?=
 =?us-ascii?Q?/QXWSSfO1XaTHW8zrsL7duRI9+pK2Wi/xi1H+JoF93u74iho62ZjeK6r4RoM?=
 =?us-ascii?Q?Ni8kpBCL/CmDUUUIjZCR7xv+Slc8CaY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f419b241-c275-43de-3f47-08de7a0e1840
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:50:08.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyiBrsr+fOpqmo3eW4ZiOzLBmGElfRHnUxO2jaZPx2Uu90+J3zmsN6xNP0JS+CSNM/gilKvA8PDDHr8Br+zaKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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

On Wed, Mar 04, 2026 at 12:56:11AM +0000, Brian Nguyen wrote:
> NULL VMAs have no corresponding PTE, so skip adding a PRL entry to avoid
> an unnecessary PRL abort during unbind.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_page_reclaim.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 60b0fda59ce3..da1ed99cd3f8 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -27,12 +27,18 @@
>   * flushes.
>   * - pat_index is transient display (1)
>   *
> + * For cases of NULL VMA, there should be no corresponding PRL entry
> + * so skip over.
> + *
>   * Return: true when page reclamation is unnecessary, false otherwise.
>   */
>  bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma)
>  {
>  	u8 l3_policy;
>  
> +	if (xe_vma_is_null(vma))
> +		return true;
> +
>  	l3_policy = xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index);
>  
>  	/*
> -- 
> 2.43.0
> 
