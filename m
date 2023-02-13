Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215FEC636CC
	for <intel-xe@archiver.kernel.org>; Mon, 13 Feb 2023 23:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE05310E77C;
	Mon, 13 Feb 2023 23:23:03 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CFD10E77C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Feb 2023 23:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676330581; x=1707866581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dsjfM1HX3KSkQMPGNeEolc9EWNMhmHDs6QCoP10SOqA=;
 b=FfcQI/FCwOeFlhxabeBCIVdV7tZOO+X53n0XV0thvIGEFKLV6XWVlFl3
 rm4XAwQlNvu6Fo3cc86AG9IEKLzAqxVGfrJN37Yns/SX5RlpMHpOQGSLu
 ZsAYzGaQJTGsvehydgMzE92DubCkdIjSQwmOsU/pSxyiNlNm/qse7K8Ib
 S6Mt6d43ySh/+Q8C2gV6RXLFh4x/mtxTBmbsxGX5KRpmRg4ZU0I0bnuQo
 3xRQ29u87AElkrUBFP1hdospNf/EdpVp2fYx7g2bm13Msh3OrOnKklC0Q
 15W3uQBu58hM7BlraAAVWiqP/al1Zrh3UglTzml6yAn9a8sHolVyp8rT9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393425490"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="393425490"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997861108"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="997861108"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 15:23:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 15:23:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 15:23:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 15:23:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 15:22:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mA3etIpZRhtUZesp3FTg/JXHiac2mUrnnGTeEbMnINx1zWggH5nwW8yKv9Y+XUeCSXXlqUh+ocn0oL+1qKhyp17fGIakopDzQ2Ds3VqGmvxy4Mm0rRN/HRUTX9U/AD3h7PtLtKpQwZPa4lO1JPL6bQ1ulz73DiUfRtPZ3RuYZzFvWjIJW4ovPCdebEujCCXb9TDqjaFptJYWJRWXlbf3Oqo+BURuU5pFFa1+pLO1GiLUrougp5ZIYdgeNuPC0zZ7lCG/EKpXK2oM/pn4XFrruhcRkhwnENm+xu+D8/eUx+4hByIWzR+CIzc7x8kFh7FPoJviy9mdhQ8zhKNQArLF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O7VTKEDxRj86sYhMU+3GOFdatOJQWLiKRnGLdtzs8s=;
 b=PdDM1DkcA3pdAyidOOli+GR7pjPjZ0gOtsEJTdg1OyjadlH8Yy0AAE1a9pS4gnyn09W+O9S/ByNtlyKBYA+/xThPVkPOcNVZJ2/AYUUs12j7ufhOKoDMDzREZ1uxhXua38AVyY3KFlrFV94CN6n0LkbbjW9ZWuUbOZ2c8zTWyYFeen2qGczSKeCBbrjgur5YurPbehTcDjjcnsGYJXF4kGNayltXI0wfYIaXuxKy0aGM0jBZm5HX3+C5cJlVCTANM7qgp+MJRC2/lGm1kvGBouSUuU2zPTqFSA+Qrc7Tn7mqWdq/KzGClMvvdK7CjWHe2IfMNW8F8PvSvQCqpEipgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Mon, 13 Feb 2023 23:22:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 23:22:50 +0000
Date: Mon, 13 Feb 2023 15:22:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y+rGRxzbQf8Tc5AG@mdroper-desk1.amr.corp.intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <20230203202409.577032-9-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203202409.577032-9-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a71abea-8661-440e-f899-08db0e193973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJrWGGYh2ENiKTeSchjfkOYWPWC98XKrSnIO4rbFPUX/iPROAOlEcUut5oKTu2QHPDLybsmrb6eJ4I0UNCY5dbCuxZho5z2MEVt/GRWeoO+ALLKhSwy9TjRb+3zh+31Y3fMHaiYr28L8VMbRSXhRWZLU3z61IfoWfmZqKWf/ok2euoQDscYdWjn1kRZGBBhsiXLQJoNFx2ZSEmIu5Fzb3tyxR2cTCd92HymupexC5gDorxqVCanwF27J19Au55hIJ83cBwjcJWcQahRnu4vjceKkiSIyAH9BEUExYeSEDiKbCiRcl22P5UTuajY3FMqMI8ipOCF2c3wyiDx/ezDt2iC0kKRJJ8tf3RpAIYcwnZBiG5EmBf7jffcMKBAqbBh7mLs/3jcFOIADJQ5MpSYIRUfs2SM6ptVq0ED8M3UUxyIEdQ3X4FwC6wzB3ZcErY1PugC+LVYIivdc4Oh5vcT6BwXnFvXut6/VQA1lK4gUpn6rACJ7u5vnnKqLep3a3hkTLfyW/73AS30pnkiaMypGgqF1WVP+hHT5TsJ4QYveqS1tw0YuqQAMGALjPsook95Px5xJilj+DOp3huBb9EUzaRS2knNVIW9wZ9ZKQ5Cm+2045UKxfACbczF0LmKkE6Xt0xoTqIuWpZfPknwCiEzYCZgLVKXyEqNWjrvGh/2/OZM3oqmXtUCgdVsb069p/LC6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(26005)(186003)(6506007)(6512007)(107886003)(6666004)(6862004)(8936002)(2906002)(86362001)(478600001)(5660300002)(6486002)(83380400001)(82960400001)(66476007)(66556008)(66946007)(41300700001)(38100700002)(8676002)(4326008)(316002)(6636002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hcrTnOgtnfF7UkRdnUi6xxKfiweCYOGu9EFx7i7yKD8HqzOMQ0o7WfgtyaER?=
 =?us-ascii?Q?dg1lkoiezV5EdVwfflm53fFm65VRW85aEMyPl1YvQMAfXlcUsaiSXvNO/Cef?=
 =?us-ascii?Q?v499EqmvXRAElMweVekC15K6al/qH2wfQ0KlHABYgPOakCcbWCGhMsUPilCH?=
 =?us-ascii?Q?smWoV8hTBxPD3hMpvBgry9Z5ISGQ7ou5Y8y1ngGPA1bovHCmE8Jabun/qc6T?=
 =?us-ascii?Q?cko1sYmS30HjT+i83yJvnQpd7nz2rK6ttm3gVn0GBiFFUKd6sGoq8RSyuh5B?=
 =?us-ascii?Q?zPaWWI/duY3NtSMPjpMztMGpJ7UrmIBVHeO9uURoBx9E53swHcKK8TfI4fDD?=
 =?us-ascii?Q?G4tHblPpYEyG+NEzw5DniPTqxOd0ehLCgPJeehbAyXWiDucfnZ5pELepR7CJ?=
 =?us-ascii?Q?tA6v+a5rPfWFgv9MLrki90vbbWCpIC3mpRFqRUGIGh0hDHiNmErygvSBeiI8?=
 =?us-ascii?Q?hmENNkDtYh5Jk0mC1CuNHB0NtFCIco2Vo5XOSdbAMltRRUYX1AJI6f1SjGL0?=
 =?us-ascii?Q?V267q/O+JZ9XQdNM72T1RBQewIMoLjrkxtQnS+Glo7qBnWujzHvDBsKX7QPL?=
 =?us-ascii?Q?+Ldf7O1f+qw7dYOPcMlwWlcz+l7NiMMc/V9P6ngsjCJdiqL/yOy3sSOqP4/R?=
 =?us-ascii?Q?jGI2QmOlXM3DhY9RApltcc08042d8abncLHN2CkeUXR6kN6oN+/jOAN9IPro?=
 =?us-ascii?Q?XdeuvRcT8f00+jOJsHiJHWrhjubnkKPGxPybJc50zT7+bDv9x8nT39IAYbkT?=
 =?us-ascii?Q?PX5nAPBZy9hzr9y/3U1LAEP4+2bxYk8Kxal3MuJ7K9BomsnMY7lWLddxCIWO?=
 =?us-ascii?Q?HLAXMoDj1FqNV6eWa9DFQRxC8kE0pxBZ5+DaWZC88sc+oqF0QG7xfwD9ZokI?=
 =?us-ascii?Q?D0bGc68DC2dM0M/BMSrPuSoErzSq539raPCtHPGsAgjVBb13OHOSk3pNy2Yc?=
 =?us-ascii?Q?xEYA0cc3KFDn0XqMEd331lJmeFft+Wtsi/bmkSWSbIg+Zg4t0Qmjxh807YRv?=
 =?us-ascii?Q?z5cOzhT6peOZNgvtVw+xXmd/YtXFxxkpgdn0otBuFDZRATSdq538iRjOU4eE?=
 =?us-ascii?Q?uTmPNNr30NE0eCFcZabSTAObo7NHk/VUmwRks8gUNJHk9OLQH6kDXgHpQxV/?=
 =?us-ascii?Q?0YRvqck6z3494wBJvj7TCWq2hGFTu1584XnzPxIQYvhZXvI6GAoc0rQkgtGy?=
 =?us-ascii?Q?KkLCXnJzgGoRySr+EMTur4h3XoetM4pf5wMcXfJDPr+GlhhweGJpDRTqOk58?=
 =?us-ascii?Q?Dgcl8PyEBbXbUMKRMqiLiRrRnSImx2r2lPdF6CDOPEqJxGcTVpUUF80ouF2W?=
 =?us-ascii?Q?Ue8PWJZ/MaJynUDWQmYEPsNYoUcTVAEq0kAvoqDC7Z78qtZ2VQYiQBUPL8Dq?=
 =?us-ascii?Q?m4iHOfUNMjtIi+jc3elZcGjMIrlnnqGj7dVBYOUApyclR/MFVF0pnZi8vU44?=
 =?us-ascii?Q?AoFVMJndWih02CmTCzlBGsfQxpzjE5tO2IKKPn/0Q1THIgWKjMVKaRVOAzX1?=
 =?us-ascii?Q?tahhQyLv9vQuiy/ORuGOtn8aFJ+l/bFJ9NiHHwm0QIUgAyfFo3NmBeBV3d9I?=
 =?us-ascii?Q?Vxsqwu4j54TYSTYTtAjZJGdjgJmPVhqvNVhKt8ON+7pebkQSn3lIKCMAVgXM?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a71abea-8661-440e-f899-08db0e193973
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 23:22:50.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljY3RRW0AYQakYB85Zd5+gEJctRya4/XC5dvhGwHt6uyFnF998eZhWxFG0h/mWpFsmWSkGBGr/k7FxI2MEqpinmIGLpgv1t/9aOV2xIzrCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/22] drm/xe: Fix build for
 CONFIG_DRM_XE_DEBUG
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
Cc: niranjana.vishwanathapura@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 03:23:55PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> GT TLB invalidation functions are now in header
> xe_gt_tlb_invalidation.h, include that file in xe_gt_debugfs.c if
> CONFIG_DRM_XE_DEBUG is set.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Should this be squashed into patch #2?


Matt

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 30058c6100ab..946398f08bb5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -11,12 +11,15 @@
>  #include "xe_gt.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_mcr.h"
> -#include "xe_gt_pagefault.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_macros.h"
>  #include "xe_uc_debugfs.h"
>  
> +#ifdef CONFIG_DRM_XE_DEBUG
> +#include "xe_gt_tlb_invalidation.h"
> +#endif
> +
>  static struct xe_gt *node_to_gt(struct drm_info_node *node)
>  {
>  	return node->info_ent->data;
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
