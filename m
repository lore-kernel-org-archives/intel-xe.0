Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83883C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 19:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BD110E45E;
	Mon, 25 Mar 2024 19:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDEvPVm+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C535410E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711394061; x=1742930061;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FbJ0l2G2qUHWaovk1yVzpU5IabPktVP5GN7EL4OXU7w=;
 b=LDEvPVm+6yur3NyLJdys7cPwQHEAwJMgqtVuRTC4XV1AS9M+mlC7sx+t
 edebVqkzHIBM4DbCQYapPMApicmw1pI8gnue7YPAVQTD4H+qfG/DMjzvX
 NPe10+4t9+R1Pg4EQ6fGI+DV/Klap2sqG+G70meAKMVjTMq6rX9YNwjcS
 TmAu2TqANRe74QQQh8SRjmEcdl8ieo9zqcVx5ahGdRIGpdFZXIFnOuGlU
 H08LkHyuqv8H2UYZKqUjGX6wZeLDGeGq8zLyOc56r3+uzXt+Yh7vnUwgE
 zafSb1gl6ilP123rAtAc10cbNS1S6cwpyk+p2jWUCE6gNPtmMzT7DT07X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6280432"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6280432"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20407591"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 12:14:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 12:14:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 12:14:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 12:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYPax+9oFqwgqsP7FMzQtxDs2m0W3Z886PohDUxEcPteq3aKdMXeyb3si6NdBWTGb0MYdKlA+mNhJYef0sSv5FXo6LnahsaglhGEcsK9JgqYVQwi3tR2PrPP9NCN4E7R85taXD38r8M41J+1g+yiCRH78w/n9JxWRdvZTeiFzRs/NJTIxAjULH8oKHlQTlR2ouUt/B9x16FPCN0kwFxDBgiI69VLg1OSXL2zZtJryAZjuRwBygGDlJiayGfg3HvdW1kO6u7I+74+9/wQK7NeICB2YcfSVnDCH2L9TmWlABhexQmizWHSeK9/FOAKgIe/mT1LDqBhgySBH9oFUuW4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4rnp9qYXuWnoqXJxs5jXywCzcDn1hRzF09bwefzAF8=;
 b=DrJPq5kEAqvGGVgVTzQ4LBl2TywydrzYGfPttgy+iKh50MRasezlEh8mPNV1483iYNE/HvsCJbE47EBQOnnCu5QCXvFv0cItluJUSLy4tO1yI/k7RPL/d/sQSEtnvr9rXIvERbPZJqZq2YEq4LZc6y/5KslIDLIhWDVr6hFwYQ7V6C5xtUiEv/A84IWw/QaJTrWHaKE/CopQMeZGXyXKtbM4e5pFroWB6MYxx11gCtHkxF/REw9uD3RsE3Nd9m/yGook/nv20oDmGLFXSwQMfvNbU1OMpKEJcIzcj+1+xU4tyivV5V0ZbtI5g9Ie1RlhzKj30bxc8qc4BkvfM67JLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 19:14:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 19:14:18 +0000
Date: Mon, 25 Mar 2024 12:14:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Add helpers to loop over geometry and
 compute DSS
Message-ID: <20240325191416.GQ2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240325190643.150648-1-jose.souza@intel.com>
 <20240325190643.150648-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325190643.150648-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7488:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R37Ul39sag1B2If/sosBnwkTLuY+uHjNyYl28LDN8nhcoyga4hA41F3ddDrdy+ahDfbOE1plZFH1CmhQl118+XzZmj9R5h9rpy7NNtoKdGMuufDCwKZXRFRkvbzi+yNS47mL/XeTP75Jw7Fj+zuwopZ7IB7n5q8hdqpDDg2QYSWp75zv+ZzElw01/Z7+Gv3vKHKk65fD/xu2iryDF7phgiFVyazf8M0C/GFav9DILuzFX0v6ZPJT86psixanhXVqg8hH4wl7gkKNVLgZChc76JjWGAPF9zFrVnkzcN1xadQpGuE2zFdeJN0s3VYblCV8RzwP46stqyf2W1jfnyZi0hK6XlwC4HDnV/kLCcn17goObPaa7dnzcIW8Okfd67Y0/drJEdgCuapMIrpnJQO1d0c9rDqI1vdQG1oWIrhQL5xJ/O3c3itkIRvQC6cK7Up2PNjjuzqoPUk3Z+66tUaC98QveqBlJiFZoGmDE7qHKeFPnEya4tGqGUXEohdqIdANn7gV+fUjTQwEXgIQoPjDe6Z4IKRTtiFEzD1QtqsqoMfr7J47IYOsYbm/Cp+/pOy0jxPFXSHWHbrPu4868S6NFaENRgU/ZyP7CxfcFLU68bcHW39dQc+noT2oH1zULZ8EJ64qgBep+C0XCYNi3f+CPPpNxy2he5qgf8mt50t+IoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lTO4vQrmcvd2XxvUu+h6fhtIjI0efMhmVXXgeWbQQL2r3RHWJE4svyG8yY?=
 =?iso-8859-1?Q?QgET9DMQNmM39+SqO+KsXjpVYhT+GMEEGu1jv1XBcU1NfDYoQgO9xd0BMZ?=
 =?iso-8859-1?Q?qpLg7VOv9dzylz0zCa8Jedb97wPZqkW7s1s08xrFt4kFhFJr0DsViS7jmz?=
 =?iso-8859-1?Q?J6Mr0VThIWek2Yux+Q+xoy1x9iw/fkUxFWCzdRQ8QhYReQXG5m//N/pYZc?=
 =?iso-8859-1?Q?v7v19mHsTLp18lTkUfyLVUtCGI+1rYGdbIbAhoDLFjZVfN2l1rnSozOkCT?=
 =?iso-8859-1?Q?FQCEaTwoSn4dMWt9r8oGcXFaY+yHjNOIZmwOf0kfMkx/B2qiXQULglu0Mk?=
 =?iso-8859-1?Q?yNLoLjm5fYoQjL2eXMDxLPBK+hYVk2CVQwNXTr+uYfKTryHMxHfrw7zIUV?=
 =?iso-8859-1?Q?+u2Imb/9T5OxpbJjEpqLM8gq7BqbleUTXc0kgAbimUbzJqYbUb5ywm1DKW?=
 =?iso-8859-1?Q?eWGMYhcGekH5r/9VlMgoYIK7iAka/PzPRwGpC1C4wxhv/t1yXiquNkkeTI?=
 =?iso-8859-1?Q?7PZCrir/dvlmuQcfPmOQaOX/UmDAVhQdOieZ7WZiQ6cg7SFFTlNbak+jEH?=
 =?iso-8859-1?Q?IHfZH8PXZafCE+HbWy4zoEvLHXPQSlgwo9khunB/Z1KLaf3h18gK9zilU1?=
 =?iso-8859-1?Q?BECEgCOUzYpd46Qt9vGoPq96HogAxCO4C5aOPdf3o0wG2pIZQuJxmPV9ku?=
 =?iso-8859-1?Q?rIPf7na/omovUVIPEXRWJid+v7/68umcEGMPSiIkd7IPPz0m/pVm6XzNgE?=
 =?iso-8859-1?Q?W83E7WoEePSC35AkbIaQX4NMX8G9qA9lch8qDnZF/6hTvrVtB2k0wqtZk4?=
 =?iso-8859-1?Q?3K0os20GiOiAsGXxzKMq31ZgrY2hfSvdXZsYd/SAOOq9+7wo5WWjhY/WFa?=
 =?iso-8859-1?Q?LmgJ7TyHqcFm8fCxiiNK5c3ZW9T/TzAvPSbQZZTCJB+qJBxYO7pInA54CK?=
 =?iso-8859-1?Q?7yBLbZ9c66/R8/RmcIEF+5AztbhxS0tTStTjC1nn/cMcGBje9eIzzrf3ap?=
 =?iso-8859-1?Q?qKosxVIujM6K8DHfZzcGzSri2vdcFeZNhBIYtP5QjMlu+R19F0VlgkgTAG?=
 =?iso-8859-1?Q?CZNhx0QJfRX9w2tOTgY2k8oD63O+t0HSuKEZBnbysn8JBwoAoydUpgxexd?=
 =?iso-8859-1?Q?czvVl9Wqi6xhwWdibxTTOpXTLSi1y6z35AGnaJZkYM3dCoaFYq303w74Lw?=
 =?iso-8859-1?Q?PCGXYyFIivzoa9qC2/EA8VGXjOmBou/yUll5ouW/IZMCozxOQnR0kmFB+6?=
 =?iso-8859-1?Q?1wkwf70DNCNrf/ApoU45Qp2xrLLNOIAjpao5nENIZZxwZK7rO0vnfTvchW?=
 =?iso-8859-1?Q?Vi0Mefp7/KR3rzFF704It1bGqu/s+hw+AYsCM3pOhS9sVyyIJcC5qa7PDc?=
 =?iso-8859-1?Q?bi0j2A7QaR2mqR2sC+KdoHWH2A/lPMenbR4Mv9q9lcI6WCAsCrenAvGGK/?=
 =?iso-8859-1?Q?gpJpJuSHuZiB6k3mTYap87QgUZrpbL8ebQxoICjcYzEvZtR+m0xddkVmpb?=
 =?iso-8859-1?Q?v3oHqh7ZQMUVzjJPKrcjNNOpJ6/gSozAeTLfX6pF6xPSPTOpxWBHuZmKPJ?=
 =?iso-8859-1?Q?VgoteVTopxJTCFVpcPOMfkQsVMweRlTK/19eZbrwo0RXB4qZOPjrDBeS6a?=
 =?iso-8859-1?Q?adHnrFghmJPBUqKePMZKcM64KYJYWAOuDhG1g3bVshxlZ0Pnr6cOY90g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d98e52-7b9e-45a2-18de-08dc4cffc4e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 19:14:18.5057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTUeYmYbc6aRUs9i1Xk+HXswilRC83ZK/FwbRu2vVYnNwXqA7a1Iuh0lk98ucDg9YGDsypvm92KnAyBMMbshb9gXUZWAHvT++oEw1FIJWmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
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

On Mon, Mar 25, 2024 at 12:06:42PM -0700, José Roberto de Souza wrote:
> Some DSS can only be available for geometry while others can only be
> available for compute.
> So here adding helpers to loop only available DSS for given usage.
> 
> User of this helper will come in the next patch.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.h |  3 +++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index a7f4ab1aa584b..e7d03e001a49f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -40,4 +40,28 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
>  	for_each_dss((dss), (gt)) \
>  		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))
>  
> +/*
> + * Loop over each DSS available for geometry and determine the group and
> + * instance IDs that should be used to steer MCR accesses toward this DSS.
> + * @dss: DSS ID to obtain steering for
> + * @gt: GT structure
> + * @group: steering group ID, data type: u16
> + * @instance: steering instance ID, data type: u16
> + */
> +#define for_each_geometry_dss(dss, gt, group, instance) \
> +		for_each_dss_steering(dss, gt, group, instance) \
> +			if (xe_gt_has_geometry_dss(gt, dss))
> +
> +/*
> + * Loop over each DSS available for compute and determine the group and
> + * instance IDs that should be used to steer MCR accesses toward this DSS.
> + * @dss: DSS ID to obtain steering for
> + * @gt: GT structure
> + * @group: steering group ID, data type: u16
> + * @instance: steering instance ID, data type: u16
> + */
> +#define for_each_compute_dss(dss, gt, group, instance) \
> +		for_each_dss_steering(dss, gt, group, instance) \
> +			if (xe_gt_has_compute_dss(gt, dss))
> +
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index f5773a14f3c8e..569026cce66af 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -166,3 +166,20 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>  
>  	return quad_first < (quad + 1) * dss_per_quad;
>  }
> +
> +static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
> +{
> +	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
> +
> +	return value & BIT(dss % 8);
> +}
> +
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return has_dss(gt->fuse_topo.g_dss_mask, dss);

No need for the extra helper function.  bitops.h lets us do

        return test_bit(dss, gt->fuse_topo.g_dss_mask)

to check a bit in a bitmap.


Matt

> +}
> +
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return has_dss(gt->fuse_topo.c_dss_mask, dss);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index b3e357777a6e7..746b325bbf6e4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -33,4 +33,7 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>  bool
>  xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>  
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
> +
>  #endif /* _XE_GT_TOPOLOGY_H_ */
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
