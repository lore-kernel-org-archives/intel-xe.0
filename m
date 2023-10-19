Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082F1CDB482
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 11:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9A310E4C6;
	Thu, 19 Oct 2023 11:05:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1B510E4C6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697713500; x=1729249500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1iKZmxZkQb0dyddVxMEWtfceNH0910RlgfGCDuUSdto=;
 b=Z4OyBp/ypd51H90xGdpLC8aYOdkvMhOu54rVMGjGRcqMUGvlUwCj0tFF
 BfKIZkiO5PtmTAlIqVcucRf49tsAi0PrZbpPPucG5QJlfpaPao59xgT/G
 gSIVrKDPcAXQSaypEs6uNZ5WTa4MWsmwHao167RQjlq16R0nQ++rUMzcO
 YWzd8+NmICSIuYo+lT1RkZs6Fhp2RMDvq/L+5/i55HYJH9JPxWGdElKsa
 piG0q0cvoKIvjC2ma+D4FpXk8QbHETjk/hrB2Aprt9zEb3wkPA3Ba0lwq
 IC8VikxMaZM+JZB1wYQJEmy6cgF1zC0c/2RK7iD5g/S6tAdUSXSarJws6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450444093"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="450444093"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 04:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880610807"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="880610807"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 04:05:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 04:04:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 04:04:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 04:04:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmN/ZUi+p1dc05R1ebRLDtfyqpVY6rDH7Xzdi0gGd+eoJyI/m2EeS0wQHNFdHzdusKKMFsdby2ejUNnqDTs6tJ2/iE16f2Rjiy2+o8e4bikG3pvrLyLNOiq3+BgHQ90aF4hUfJQnbp1ZY5AlqaBg7pIUiEw4dBvAM/dSqbCX3m3n5AjYDdJOLrqPea587mNti1mgQRSrD1vvq8vyQc5Jt1zAdaiflF/XW3NbvDZfU+0t8Ix9dKIAwVn2D4AdMColWW0od6f+uQOYNTZKm2LT9skmhZwAHD1+aUB4554Belu6va9omBg7LtzowINGPyLaNnjWcSgLYa+ip2VCKIkHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7jiTWoQN3j89HgwDkt3AwM+gjBz/MGNsIoYB8p9nXQ=;
 b=HkTLyzdOTbZsh5seCtzMNXqau+MIZ9VJKkl1i6+kdtJBo07IBPFH+l75/J1zux7ATbQ+tJa5xZDxrbwPvDlMKeJNjny3a3LBNMlrP1MxAUkc2ANt+jcvcWXYe3cGIxVOlUp1rynOUOVciLCCzklEzX0Va426tmPCt8ZcnB4bbbMaZ2ljOn1W0qCoXq2xeB6Zk6jy/TqeWlWejpOlGQM4UvVpOaG8e9BH5mJbSFPCyr7KMtSTg0ipm1xl5Ti2RTD+JxCHe7dUNklLqAaiwE8SdVTd7cb08FVZyWn4x4TzKt9HmuyipqXhXk1isZEVU0vex7t6EbQvq3gs/ff0zRH8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 11:04:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:04:57 +0000
Date: Thu, 19 Oct 2023 13:04:49 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZTENUfON_lKaiHbD@fdugast-desk.home>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-16-francois.dugast@intel.com>
 <7c0e833c4e4e517320e33fc41e55049e6b3b35a8.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7c0e833c4e4e517320e33fc41e55049e6b3b35a8.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 56675702-5d94-4be9-71df-08dbd0933ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vu/t14jClAfXx3ZorssBDnmDZxEZXHetDSbDgwsfvYivMZw0MBu2OcG9tpVfTgJlDHlHvs81l703AqR3r/dl/maMWF4KGT6n2AFJJhaH4RActkJXDNXyQc8LkLFIszOiD7aROk0Ck8IdfDTRq9NYPJeLNKjPE26TbhWiGFjWI9DnV6ZkYh44gvCdbxy776yE1ddtDTm/eeWK5lcciRBFBDBTJKaIdqHmg65msvWU1Y0i3w5F/zWkoKsBfB8Q/GqoA0aYPKjMHGiddQoDc+DwCPNcsIN2Oy8ARBEYXNaJgF+uoBsqBnZngNdrQKEQ7iERmfekZ03M09lcVWzpqtAurWdRvrpiUoFjfew9uLHHa3hBSlme59zow5d0nBkHrl6sX2qzBtbhpscw+xtZtWls6U06I5A57UMgqIO7tNVTtU9dX8p7MpCEyqzer2fNvLtYU3byLyn+qFnFQDu81Kfizy84ozXoO2RrOIvDnPGeeAzfNsXw7UwEFeTiXbyXxlJNRc5JZE1PGUXFak7bCFTI25DMng6rzF6nK/JDCfE2y5Xdho6W+gFE8VpiaAap45Cv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(36756003)(26005)(2906002)(4001150100001)(86362001)(4326008)(6862004)(8676002)(8936002)(107886003)(38100700002)(82960400001)(83380400001)(9686003)(36916002)(6666004)(44832011)(6512007)(6506007)(5660300002)(6636002)(316002)(478600001)(6486002)(66946007)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aR3/rTozypOHYsW3bI0cxWUX91YlJqG/g2od3YSpEycqq/My8FDqavOnGCed?=
 =?us-ascii?Q?u81xvLR3zBtOq4wZKjjYJaeyf85bwky4a0hHeowWurva1INfItSBlWgVIPeV?=
 =?us-ascii?Q?2TE2cGe+0yGBhGpuGZHALonM4rp4XEZ9o9J09cvybW2VFwrxASmulG26quLD?=
 =?us-ascii?Q?wvrfMMV3Hq5TmyT1rbrY+zBeIWrYJiaSSnji6j9QhZttvA4t+ycaobtzITPQ?=
 =?us-ascii?Q?SG0GyUbxpm72SF7iEYDUAhlJtF+blmTBTjluik8OXyIgKRohRHEZOc+YX9Wq?=
 =?us-ascii?Q?bTuipns65khtj0r+8mkqcPPOxtb1jHtcCHmtPfyncCeeBBciGru6X3wsVHMe?=
 =?us-ascii?Q?MtPaNoKtvg6ivLvXxUr6RBVFbmxqLgIjQh9/7SXuPFw7+iw/pIWJSc1Q1GSh?=
 =?us-ascii?Q?vqF298pKTFsTYa4wQhL83Yf8kovgJ44OzEPzYAyABrWamV8aPYzpSUIg9/OB?=
 =?us-ascii?Q?a/F1QKK/Zpyge96GpVIOvAzzxXwYuGGEKeqscgqYyV9JsitFSCkfn0wAs4EO?=
 =?us-ascii?Q?DG5wev0EzVu9KyD07CHg8O2oK8zzaYSkBPrms7cFEZYZ/TBNC59MsXrMtHgE?=
 =?us-ascii?Q?sjCZ8RGx3zq/+l2e14iOvKe3ndfXK8Jnq3AcJwoPUWg27linIKFcAsbBxwIK?=
 =?us-ascii?Q?v94V1gh/L0n32JZ/y8GFinMeAWYvAPAN4QFvRymUcwzzWCB5mLUbDWdFtx8l?=
 =?us-ascii?Q?/RwdMwKYx6jXhd6iepJkMEOwb8TanYKNgKsAD+MawInhUtaA0eQaAUlnb7w1?=
 =?us-ascii?Q?AN5yTTG3OxPm8uIzU030YeebX1PZx5DWALQBeJl4AnQy/sNUWOqXSb4dqvld?=
 =?us-ascii?Q?5bATa3tMsUzYD2HTGyWJ5z3ul5CeTHgpEkr6OfZjwAmOQiuIugsOAx0bodgo?=
 =?us-ascii?Q?2wzmDSgkpxc0TiGdGKpAJz+y1T5V2Asb0jwpXsQaKIUYvSXYyUU1TwWoQimc?=
 =?us-ascii?Q?4f8DIXU3Wtjk+LGeedSpTNPvXcBmmTx3teEPofEdHc0bm9QYJpApLRO/CvxF?=
 =?us-ascii?Q?0Rd1uuBNtlLas3Z0cwEJosgwJ1y+3/bDLHEMOvA3EQQgmmt6MCMRNboc89+h?=
 =?us-ascii?Q?bowLHFnUiBIDl+TJPMJUGI8vT2IqzUB7i9YKrlRJ0vvp932AiDQlZemzk3ft?=
 =?us-ascii?Q?Wsz61shOZoNrL+q2FOjWh7Oxzdk+O/NQ/jryVwcgis9C8SlYCeIG2IS+fMd3?=
 =?us-ascii?Q?/1DP8dnnOO+nXwSSjAFclTuGpyV2K7yF/PnD+fkK2ApkQj/8bw3jcL7B5h0P?=
 =?us-ascii?Q?TFoTtwNIVD9qnJI1N2cJD0xAfZM9BAAMxpadflsl6LHi45SPT4YCl0kep9cp?=
 =?us-ascii?Q?ivjJfAw7pK6yVDGk2kzNhbV2PbEC+U1FSO9IP3qFOCVlu+lObBYGSdJ3NPK0?=
 =?us-ascii?Q?Q7Q3FkhYePe3jzRXp8bkCoe82OzimPzQnPe3qFeANkcYKfCtsCOqLUUNswj3?=
 =?us-ascii?Q?+2QerP6aniMnFHphnXd1k/TzMjEPlH+7Ezgatx1u7nKao6PSimOdA60u+aRw?=
 =?us-ascii?Q?0jtQv7XF5Fj39B6pDKIj6Bi3umiOrrjcYbvT5I13A6nj/Qelp9Cp/AAJ/0Ra?=
 =?us-ascii?Q?GzUrU3FfGOwtZBRJL6RNiLpuGs2+zENdmFrwjxg117vJ4DzBPKUF7EumfsjA?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56675702-5d94-4be9-71df-08dbd0933ace
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:04:57.1141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHivtUwVEVKbX2PmjKpWF8p53euQYhX1xq47K30CShBlFXBdcuLzm96X//nKum93AXmvFm+9AF71jPVWlruyibxpWgimZOjKWt1Vgwz4wOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 15/17] drm/xe/uapi: Separate bo_create
 placement from flags
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 04:14:26PM +0200, Souza, Jose wrote:
> On Wed, 2023-10-11 at 13:59 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Although the flags are about the creation, the memory placement
> > of the BO deserves a proper dedicated field in the uapi.
> > 
> > Besides getting more clear, it also allows to remove the
> > 'magic' shifts from the flags that was a concern during the
> > uapi reviews.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 15 +++++++--------
> >  include/uapi/drm/xe_drm.h  | 12 ++++++------
> >  2 files changed, 13 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4f0cd65c8522..c2cc859b0921 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1768,19 +1768,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >  	u32 handle;
> >  	int err;
> >  
> > -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> > +	if (XE_IOCTL_DBG(xe, args->extensions) ||
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >  		return -EINVAL;
> >  
> > +	/* at least one valid memory placement must be specified */
> > +	if (XE_IOCTL_DBG(xe, !(args->placement & xe->info.mem_region_mask)))
> > +		return -EINVAL;
> > +
> >  	if (XE_IOCTL_DBG(xe, args->flags &
> >  			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
> >  			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
> > -			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> > -			   xe->info.mem_region_mask)))
> > -		return -EINVAL;
> > -
> > -	/* at least one memory type must be specified */
> > -	if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
> >  		return -EINVAL;
> >  
> >  	if (XE_IOCTL_DBG(xe, args->handle))
> > @@ -1801,7 +1800,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> >  		bo_flags |= XE_BO_SCANOUT_BIT;
> >  
> > -	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> > +	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> >  
> >  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
> >  		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index df0561fc6c37..97e5f8f4aca3 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -607,9 +607,12 @@ struct drm_xe_gem_create {
> >  	 */
> >  	__u64 size;
> >  
> > -#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
> > -#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
> > -#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
> > +	/** @placement: A mask of memory instances of where BO can be placed. */
> > +	__u32 placement;
> > +
> > +#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> > +#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
> > +#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
> 
> #define DRM_XE_GEM_CREATE_PLACEMENT_FLAG_DEFER_BACKING...
> 
> also this 3 flags should be define above the __u32 placement; like all other flags in xe_drm.h
> 

At first I also read it like you did because placement and the new constant
values come next to each other in the diff but actually those constants
are meant to be used as flags, not as placement.

This means the naming DRM_XE_GEM_CREATE_FLAG_* is consistent and the define
location is correct, it follows the same rules as for other defines:

    #define ...
    #define ...
    /** @flags ...
    __u32 flags;

Francois

> 
> 
> >  	/**
> >  	 * @flags: Flags, currently a mask of memory instances of where BO can
> >  	 * be placed
> > @@ -633,9 +636,6 @@ struct drm_xe_gem_create {
> >  	 */
> >  	__u32 handle;
> >  
> > -	/** @pad: MBZ */
> > -	__u32 pad;
> > -
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[2];
> >  };
> 
