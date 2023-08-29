Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE6AC71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 22:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518F410E093;
	Tue, 29 Aug 2023 22:20:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDB910E093
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693347632; x=1724883632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JO3h4EfJdFZIUkz6GV0ovOYi9DcErwCSYvbdKB6//ag=;
 b=Xi6Zk+2sp68M9arhjLPwWqumVhUO/maHMyHX8GYiBDXBxhF2Tu56hPl/
 UQaVWHmV+JHCW40/T7skdkkPYnRBO1DocbNwnVneWt7SW4bmm3Twj5HCw
 6J4BZ1VJJcpALqfKUQ9VPjYCT27br3F7trQqLowT8ZcD/HDItFufSwxAK
 Q/M9pGmsMvkaPniRDUlqr8DMl/ZQlBn900NeDVPNSVHoAZJRfsmaiH6u5
 sb1IiplGUOa33C3LslzPc/tPUnT9DuwyEHa8lRUHwlXn6O9A/MuMR/hBO
 IGlnWYKivKL3OPwzkwa/0WcPn7yZQrTLtuJ4hsmnXLFx5/tR4AebcSWgR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439441855"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="439441855"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 15:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="742005205"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="742005205"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 15:20:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 15:20:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 15:20:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 15:20:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 15:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy3j7M1Ru0BWyoPNdKagipki0NKeSD+8qL7XkbITyEacJ48eHbBeRzGPk6v5geiehWtBBOUBXJ8JEi4jRZjOBCU9Rv2ZhM++T78jmBlM/zAvE7EoNv6SuVHi9fUZKZb/VauT94yoVIueKnHN1jRCqyh+38t0Gl77aTUeLg/0K3oRSO4ZwCx9DWTFlxnyESls4FCcNk5wWlrUN2jqXOYMKDuxYOWn0X8KYzkwbsvQGTw5bgGk/QBkMuGvf6/qCAdiNLkptQFXVD7wD+qjOXeJ/1QdDQrRS8NLfzXFCPYZfkEl12epiTA3bHycds9B2QNvzHcCijp/v07bjvYfJjuJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNxbhte1bJzVhNKOGlWG7xB00Ib7/k/zoT8v4NdAGEg=;
 b=kUNutCuq2xZq5yzL49/mw1K5thVRB4Yyi78OfPyPomHZJsd/vUeRgOIAQBv1e4h//5g3D3zfHxBst0HrCBvmFN+IN0RJKseI5gljB9AnVrigUcikcAvK2sRwklQSz87duOzLvqsdveLuK2kfCop3iG2AO50rqCZbghTOIPE6+/a7dg+F3E54W7YR7utkqzNxqUubROBvGoLSFrkS64YBKJEQWAB8SFNBRexM4oO7m0DOM9zkZDKiUMf6BtyJwZEFnDrw0WLmOg7d8qqobtzUiC7yVpiMxjvd3gEIOCvBChFfTgA2gOnxIXDthwZNXF/7fw4IioF21qBZgTJm+R/Cjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Tue, 29 Aug 2023 22:20:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 22:20:05 +0000
Date: Tue, 29 Aug 2023 15:20:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230829222002.GR6080@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-10-matthew.auld@intel.com>
 <2atx3jvuevvb3a4duzqkym3n3rglbcbxjfn4smamcmuz3wazhq@kpwcva26aenl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2atx3jvuevvb3a4duzqkym3n3rglbcbxjfn4smamcmuz3wazhq@kpwcva26aenl>
X-ClientProxiedBy: BYAPR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:40::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4f8d72-c8ce-42ae-9418-08dba8de1895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2c5W9pEUmCe5Y3ObbIfd0CYXP103/B5KKok6Lmr2NtGveS1xS5vRdnUQbbK/GWTSEpKhzfu9JWd0/F5XA3SZ0heVAgoHEFTFlyiMJeuQCdJGl0AdlorG1lqtibjf6a8lrfxnehs89arJ2Q3GXbTcbvlUp8AjlCUNPlgtMFYupwlWZGv2EBpC5wkgvO/S9RImIRpkiPzGngux2XO0twpV+k9lOg+Rr4fAmWxPcejNHHeih73/Kr0V/blRu9hNqYvaQnWbTdYG2JGMnILLLhc/4wCtypKjh585zlIt5L5bBhD8SaUSBJw2qDUD7KsKT/uNukbbXC1lm6C2/E/GqMJg5gN0It/vEbQ20cxfpcte10AMfnGhJaa6A8nJkb6ci3TIcMGsE5x4pl28J3qr3Z0KrUUUjhZIAiKhkrtfD87ik00YmckeE6ObmHDbjiMSEZlmHcp8xDBsD+jzsS3AGJRtVRDvDuiRD1SqqnbcT0WUyGOwjQAaCPXYv4bgqU53VOan4FWkKXqRyeaMf7lOCbQl89q7Ask5xqFLd+iJt6gpbboUMOKmTbPrXcgkz59e5O7c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199024)(186009)(1800799009)(478600001)(26005)(1076003)(6486002)(6512007)(6506007)(6666004)(82960400001)(316002)(33656002)(2906002)(6862004)(8936002)(6636002)(8676002)(66476007)(5660300002)(4326008)(86362001)(38100700002)(66556008)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PejoMzvOnMzN3ljAvnooo6/MFSFaGFptso2fvkvgUcc6CcGw3iZBA2rH5Vj/?=
 =?us-ascii?Q?/I7SwUqfSJqUk6G5z2awBnF6XQziu/NGXSWa4xnUrjv+j218OxFEtNSY3HMd?=
 =?us-ascii?Q?Rhq+X24gOOo7BRvKP28YudjC67ac5VBJzF/Uww/yAktycAhSY2Odr1+Ww6h5?=
 =?us-ascii?Q?8IfdiKB9ACULRO6fEFnhaTwWhd65V22BMOKTV3Y2c/zWIl+R7iV3HCPt/sY+?=
 =?us-ascii?Q?JSPP+d9P78/jZatK9mOXWceWig2tMTf8rdFjuvfX2wx08qPtmX9WJORp2Hph?=
 =?us-ascii?Q?7jlwALiZakB6zMHwIIJHNMNAxfLKTridLQEFLROTo1XAERZKDBPmWt6HC+6y?=
 =?us-ascii?Q?Qk1LUhgISd6QbgT3hoD4Ja3L7QJSM02VyHsB8GFjy3deivWwLs+dJzr7rPzn?=
 =?us-ascii?Q?Qz2qnnOSQRD00W4k3e3wiJBGLto+4+Js4YQlKQXNv9UC0a72L/Rt9CZ75iwu?=
 =?us-ascii?Q?1ioyp7Csh/YSFyFZ37R5GkFqyez4Kiftqfxs5VFjIsJRbjTSPHdmZhZfSjAa?=
 =?us-ascii?Q?LCskjSlm1A7RA1RmJ7ByfCGh1N8oWi4YRD5NXnZL1Ren4Au+Ljp+Gt4VMvqV?=
 =?us-ascii?Q?GjcS04eSSCJBBxydA11VkQGx0J7F4JbLz3rexoG8LEwAaHqvPcWwfq0r8xkZ?=
 =?us-ascii?Q?z9OTSXfTZRgMKotUXQz9kl3+tTbwIYEaoid5w/KtSvLSxcFPAf+6pxtcmDF2?=
 =?us-ascii?Q?IgW4YwYYbXSPqRA2Yg5uxPhLT2idll+rTFNvQUySsrbDx4LAASLHsyPLqZaT?=
 =?us-ascii?Q?bFErDPmApn2jK7BDou5cVgxzN+FfoPfOrM0quer6PIOkOAvF6NIpLvy6nCJA?=
 =?us-ascii?Q?PS0n4MG6aYU/mi6LKDT/7EBzFq1H90TQFAlj/3YTRRlQei/bB6Hz31Zg+5qE?=
 =?us-ascii?Q?KWV88mNNseBeIqeGuL62k7MnsbQNz2h5R9Yl82eONID1xTDuLPLdJqSCKNqX?=
 =?us-ascii?Q?EdWgVi7zSyLc7v9to9mtct0g3AVGcsUpVMSP5aCbZIDcRt7HwnXlPTtcoTor?=
 =?us-ascii?Q?ztUWCsDlk+0dBG3G0yvSxrC3p1G2hHfYxPg6PkIkbJlXowlHLGMoLt7gpjfB?=
 =?us-ascii?Q?d1zkCA9biKnRgKC6Ye9F1qgkVZI5Xijp0lNPKk93qRTGMtgwu1geTnajlJ+d?=
 =?us-ascii?Q?8ilUICPc6iaze6DzrelvoAc8ry/GCk21+h1queK4bL6QaSj7OQYsR3S8wTs8?=
 =?us-ascii?Q?jcif9ieZqrbY9Tt/NCksf5DcMn2dDprT+KeAu2U+f3X89KhhiTdGXGFKO+E7?=
 =?us-ascii?Q?07vFTam8Ui6GC4hwOqCZP8dLajUrOUZd9GdjPrNUuFMpkr+0iS2pebESgfzx?=
 =?us-ascii?Q?ljCeLVxrcGugj07dYLD4ZJGnKWR5f9gnO26faPq8k7gz5x5kLhwx+M0rzy8w?=
 =?us-ascii?Q?cLfUtWWsJqkdLbOmx6aYTmKykR+42a9rB+g+7hHQG9RgqWUUCL07KX35WEdg?=
 =?us-ascii?Q?T7onekCfKFnhfBjWQ8Gisgybe1OzIW9TghIPCehxKFm1iFzHqNWxAYM4BkBo?=
 =?us-ascii?Q?Ut+BLOgdeqiUUpcVSgin5ubuREq2aShc/LyOQt8pmQxWQeoUymFODHUSZlHd?=
 =?us-ascii?Q?UoitiX0oGGprhrngMKAkpJSZdVQkaz1ELatrEoBnCcDhJ4oexe/viYX8BpvK?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4f8d72-c8ce-42ae-9418-08dba8de1895
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 22:20:05.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyrYVqMQydQEFeWQoIpMXKXs4xLS2j++Rvm4O1mGuNajRU29PQx0tQeJH0MeVw7E6cOcwxrsSm8peIDaO7tlKthhidxNuzDtlQC+bJJLRq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 02:49:59PM -0700, Lucas De Marchi wrote:
> On Tue, Aug 29, 2023 at 05:28:44PM +0100, Matthew Auld wrote:
> > We need to able to know the max pat_index range for a given platform, as
> > well being able to lookup the pat_index for a given platform in upcoming
> > vm_bind uapi, where userspace can directly provide the pat_index. Move
> > the platform definition of the pat_table into the device info with the
> > idea of encoding more information about each pat_index in a future
> > patch.
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
...
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index 54022f591621..9ab059758ad1 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -26,8 +26,9 @@
> > #define XELPG_PAT_WB_CACHE_1_WAY       3
> > 
> > struct xe_gt;
> > -extern struct xe_device *xe;
> > +struct xe_device;
> 
> leftover from a previous patch? what was the base you used? I can't see
> this on drm-xe-next.

I think his series is based on top of the latest copy of Ravi's PTE
encoding series.


Matt

> 
> Lucas De Marchi
> 
> > 
> > +int xe_pat_fill_info(struct xe_device *xe);
> > void xe_pat_init(struct xe_gt *gt);
> > void xe_pte_pat_init(struct xe_device *xe);
> > unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 791107dec045..24f2021aae22 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -22,6 +22,7 @@
> > #include "xe_gt.h"
> > #include "xe_macros.h"
> > #include "xe_module.h"
> > +#include "xe_pat.h"
> > #include "xe_pci_types.h"
> > #include "xe_pm.h"
> > #include "xe_step.h"
> > @@ -553,6 +554,7 @@ static int xe_info_init(struct xe_device *xe,
> > 	struct xe_tile *tile;
> > 	struct xe_gt *gt;
> > 	u8 id;
> > +	int err;
> > 
> > 	xe->info.platform = desc->platform;
> > 	xe->info.subplatform = subplatform_desc ?
> > @@ -601,6 +603,10 @@ static int xe_info_init(struct xe_device *xe,
> > 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > 				  enable_display &&
> > 				  desc->has_display;
> > +
> > +	err = xe_pat_fill_info(xe);
> > +	if (err)
> > +		return err;
> > 	/*
> > 	 * All platforms have at least one primary GT.  Any platform with media
> > 	 * version 13 or higher has an additional dedicated media GT.  And
> > -- 
> > 2.41.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
