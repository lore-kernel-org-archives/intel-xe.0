Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C868C3600C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 14:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004610E6E2;
	Wed, 26 Mar 2025 14:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeYu4ILb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA2910E6E2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743000211; x=1774536211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4JnYVfn4REcnNG1W4MMGnsiC9WkdXb0tgAPF/tywPY8=;
 b=GeYu4ILbMaTQXGm8RYErv+iherdbOd4/HWV1WqFnZjiOqG4Hy5U3OMs9
 m5DEy9AcmGU81kT7N/a9/FMDTRLMcW7R5U1NEDltVrKaAFQHwmQ2fpxMp
 zZJZ2m1bhtLaG72/ECnS+IPl6jdQXvoUUC/AV94K3/lhCkPXa8Ly3rbZh
 c5QlPBCdyq8hrxpxseHTspAqP4Lr9AOh895XxweF743AJYCId6+kLQwod
 9Sl8B9wmOkxWawcZ32t3S/T4/b/ML6RJ/LNngwmJZmPOwO6ntdmxFH9Xe
 5kee0QSPzrBselfCuAr3jZGPBLHsqWKoqUsF1xA8xmjQ8KLGSGLvdvMwc Q==;
X-CSE-ConnectionGUID: nOlpj9XhTMKMlve+kYAELA==
X-CSE-MsgGUID: iLz1VHTpQNyZSRX9QmzTVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44454155"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44454155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 07:43:30 -0700
X-CSE-ConnectionGUID: 5TuZlbAtSzqCoFnSRnqlzA==
X-CSE-MsgGUID: LSKIwwYvRWqh3nELJfCW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124594325"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 07:43:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 07:43:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 07:43:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 07:43:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+iou1rGXyVBL5DUj03SDQngMvbuRTwP4EllpaUvi3KtUKEXnOPUz4PDNNhLv8cKg7+FASJYRldlKbdIMZezRHfT1Eer71qMPNzxzTyHQUWi/npGdCxbwUBP9JCE+lKvpHFiqs0yxg8mGdzwa3BKy5F8kCMubcySfJcNy2ZI7e+cSFboWGkovvTgdYXQV8KMa4Xhpflwf0vhX5/7u47PKrFi9/HuqW8X+XOHumZ6rfDPWzMlCymX+Dx8aO5PDKnu0DFTdgHFwCKc5yTxTLzspthGkUeG2CTgS3HHsSE4WUgqQtcCsJBDRLzCiD3gryd5G5NodptK+Zvx4C1zz1csGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svt4++mXtcW5X+Bz4TF66HGeqj/gTr2VfBJhlnO/rGs=;
 b=lCAybh4HYvmQ/ta4/D2Aw60C/ueAVRdk2GD3whdnPfydmeAAZdCM80ZTyD7oUTB1sEdgnM4iHUDciyE9fr2313Qm9dzE/OFK2mcVGaRpjqISVQCNJbutKGm2BnTsUlc2PlyYmFBqTeQt9o0VNUXMDpsI5bqunN9ZtkEakIPv5ms7OLSOOZ7pvhpGSUDcfbndvpDPTdRhzAfvFhc5iQNFhZ7gFhruamn8hJPTfu5LZQDZaZeP2dQV/2QWi0KYwNn+077P2JV/p6ODpZr1IA748iuitDIUiq3OGUzdMB9JuhUPhTHKMolOEQiP3NZsrCS0+P8bCGZuXjDKHM7jnh3s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 14:43:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 14:43:27 +0000
Date: Wed, 26 Mar 2025 10:43:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Message-ID: <Z-QSjKb4NgYXKmeb@intel.com>
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
 <Z-MAJWTFFlbaZZcj@intel.com>
 <SJ1PR11MB6204E7681720F3D6F7FFA94181A62@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204E7681720F3D6F7FFA94181A62@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b1b5b0-5fa9-4b21-083e-08dd6c7491bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1wgKx4xjQJ3b1BnPPYayFI64JOtMZ6leQoPJkr10/IjPYOPQ4bVzc8LFZsws?=
 =?us-ascii?Q?8gffU9E+G8QuvrBAB75MEk0KniJft7rEIfVLAPHH5Or6QXZeE6CllK5Y1fFy?=
 =?us-ascii?Q?xK8rA+Bmn9b46TRI+C6lk1HFNtqL5QP3T81jnedbtNBar9toWjCXUrHH6oU9?=
 =?us-ascii?Q?dJ8haEn1Qt6PQZeq13JNmP9vIbriHE1ZWUaClyXZq+3DufrrVUg1azUTzwVY?=
 =?us-ascii?Q?K9XMphvyQa05NfiMJiXKjx6+hTXVpJ7LcrQwC6GQ4PVzuM3flK8bFFIefaqI?=
 =?us-ascii?Q?ywUJdY5Ibug8Q7PhoRogzXR1nJNLiCTHiHZqFlHXCJSWNFi1szlPWyt59y6f?=
 =?us-ascii?Q?0RJ6U/djxBr17nZUyA97Mwc3CuKQGxdOqZA6aNlwpKb8+pRGt+LfYj9/xQw1?=
 =?us-ascii?Q?aRMnA677wfI2XWz/qVPD02xGFGCO6LYLsu8ZCMiXY8bnWi9bx/YuPL98kY/j?=
 =?us-ascii?Q?PrzC65U+o/AMWDrAbBjrfLcKMpgKfSxvXcvdfK8uDSCiUMUA9fr9xHVQvr0Q?=
 =?us-ascii?Q?NoB+i5OyR6uSoPnuWYYbZ7p8ZbewLnRULPSyzA+KiXCaAR3LZtSV00/30S1G?=
 =?us-ascii?Q?uDYU5/xi1qukPT/VhgUEGOXV0qAwLG1UzoN+N8Kggxtuv41LX90ladAyy6rq?=
 =?us-ascii?Q?rwnTS1KFZ1EjOae+p3F2OzWS1PbAETMCHpsZDVK5rA10RTtfREKXWgE2EQ2Q?=
 =?us-ascii?Q?PumYFPug38WTf42CDImZk1naPOv7uyUjYL04dtvweXZhg0I3IR6Ys10Mh2UR?=
 =?us-ascii?Q?8nUmZu8qLGIY6fBHdcTK1kp8+ODZiCBRo3BKydFW1p+4x7awKJCB+U2T7tlg?=
 =?us-ascii?Q?4kCnXgxTN/p+SxBBUxckZgdSfO978f7QS8vPZOFlG16UrNGaPDDF5F1ro6Uf?=
 =?us-ascii?Q?DKDD96ExkCIdjqeJY4GWJ+QWrmgIAVxHdCaJsXcsWZQuXTzuGq+0yCaaEbwm?=
 =?us-ascii?Q?gI1C/4BSMDF5V3bF6LkaL2T0hdCyXacGUpfhvCVq5HBXj5fzE+FdvdSsU+CO?=
 =?us-ascii?Q?rW7Hi1zE6mXvJTNzkQY1hjutiFsUhWcdy15nt2gpwJ42Hj+6cH8pYG6oJ9tz?=
 =?us-ascii?Q?Abv8DylxgwNgISffr1iN0OaBYyp3jjdqx63U0I5NFDlAnGwKgzYttyQQL3/E?=
 =?us-ascii?Q?L6e9A3rovTWXQCg6xN8Tm7g5DraEn1f6Qv/0uPQJkv0gdjYr1G2pQxmbA82n?=
 =?us-ascii?Q?D5UEAFtuPLPo8u31T7Wptr4LwLHUnvF0bE+zZQaJ8kFwwsquo/7px0fqQ25o?=
 =?us-ascii?Q?Jnja3mH1eW+aBJPFCHlcN/Xe3wfPygn0/CWRc+3pk30ChUeJrEuW0R1wL0Kn?=
 =?us-ascii?Q?dGoT6DMk5OVFa0J6oqEUHRtAQwObjhLYFwLCxZJa+j/zJ6VbkL+onlMIZfyN?=
 =?us-ascii?Q?kRcAJkvk8TnvS0lUlcWNNbiUbWa2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rdV/N2zYhO8Gu22h8Tc8erX5zmiPwQV4H4zOGx1+cnAiKJc7+t8rno55/AiR?=
 =?us-ascii?Q?0dyHAzIN/Wg8FGd3loPBetuHY7U/J8mbZ9b0DtH54L2sztMGZX0GdDV+8pxd?=
 =?us-ascii?Q?LehI6neWKYPJlHNjcD9zBZZlkqgp7cGAVXI9kHIWpNky85hHBHhKTibW9X1N?=
 =?us-ascii?Q?5fjtBNUoKqLs4pp1LFGwDuMQmCZMl167NOiBO71d5Au12x6Xi8eaXteH6Zmi?=
 =?us-ascii?Q?NVWQcjgYuudeup8BFzSYalzY4GVeIS/Jt9Ovnsl+aFegsWGoczo9mTRL3j/P?=
 =?us-ascii?Q?M2XX+g5c/xev/b509lLge4apGMgt4t4/Y42FZRUvfF/tgM8qrfLETS1Jrbsc?=
 =?us-ascii?Q?qehkNZ//oKhxaENuoDhJoek+7yULfQXwmiJf9gYVsxqw97zeP8g4OGCS/Q8j?=
 =?us-ascii?Q?QLAxzE21Q1zAtlsJv9gfXIdSkmPzTRPGn0ndfgck7TEiKhGqXOY7K7VWSyxM?=
 =?us-ascii?Q?6w8eLCn6/zDHruyO3c1blma/QMokEwapkFdz5tmOPK9/Q7vkk+Ad6YL8cAJx?=
 =?us-ascii?Q?8M51GcSW5GsyAX+PA+qRxFywhhxJU6T7ytVPywh4A4SwJjEis5m9mshhhGCJ?=
 =?us-ascii?Q?CDxkmXhGJcx5Kg1kPmd0055Z3PoUqMvtKS4nBuijI4fe2e6XidTIlU3olSus?=
 =?us-ascii?Q?CBZnfuTI1UKb71e0HtBCLrzjDbfAix3x88BcAH3RTBQ940CTYHS0M/Hk5Vop?=
 =?us-ascii?Q?Sx9SrAS0CQoZEwxbDY/X3EujPynGw5TC5guHCpegOeVvzD4Z2nDdl04eQH3w?=
 =?us-ascii?Q?VGuyH7R0Cdf/2DNW5GyfYUYsL6LrDVWyVauLv/4FmdKwp3/TLftY6kqPY+y8?=
 =?us-ascii?Q?4hfSRp3SFZgi38x6YepslWBxfm0PJeIJxAN3apqmzvh/yWy8GSOJfLhDwQ6p?=
 =?us-ascii?Q?6G0YPoj1BViLIv064TvujVoHLBbACIo42RJj9EJRj1F4uuXi5DWWHVt2Dsoi?=
 =?us-ascii?Q?gfIWZGUaRtGSihks0+u2W8Kird0brlXh9xjZ+NlcdRyixifAQz/Z5F1loujh?=
 =?us-ascii?Q?cxdVRFxTc/35KT4HPt4TD6RB5mKeqMDl7i11+rsc3Gfi5HdPuPQ0NNCNqEeW?=
 =?us-ascii?Q?ap7KAexSAJIYxAAOqm5M0wgdJpoHrcU0Nvau6UaJlgAk0mggq/vb6ywcde9n?=
 =?us-ascii?Q?LQQntrR3QTLHrSygWXTcDVopcZjZRX4a6pqNL6haM0P8ys8/lH0PicB3HfyQ?=
 =?us-ascii?Q?YN+7EJIFbaAjxoLOmeSNB4+kHxZhzMfYNEbf/7Oa+JXjqJD6NAh9MT5xoGZw?=
 =?us-ascii?Q?jtQ20AdhxSppw9Ljv+g7chPE4E5ifUkfH4KBz+feFFMxFrY2iNDJPhkQxZgk?=
 =?us-ascii?Q?ylcinTIVgqS3SiUWngLv0AVuTFRCb41V9q16K05YyTnXb/lMRxOnUYSGldrJ?=
 =?us-ascii?Q?eLPpb4TB0M9/bTpymY8uVK3GSuI7o40pcqBNX1jSWPz3M6CqP9LbPxu1bytW?=
 =?us-ascii?Q?mhA8aR1zwK2n0vyNmvSuxl1Wo6C0KkXGvXL7zMn59YhFQTcspZ7pU+Ll0oWb?=
 =?us-ascii?Q?G0LIOyV4wCbpbBS7MN62DjaH6bcwHsHcqXA3I/P3ENRTA7ALHkRvO0RhXUOi?=
 =?us-ascii?Q?auR8ziB0Z9k4dbt4mVvdpLnZpy/4+yj0KEi7ZiFPsCF3Jb/NMtMciuKrdSNL?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b1b5b0-5fa9-4b21-083e-08dd6c7491bf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:43:27.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKJKCZxEEd0yB0VjINlehSjvle4ByhBd4SIR6q3m7QFvMxPQwyud/D5oohNEA8Til5XRGuAHYPzpvq5RHJKfmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
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

On Wed, Mar 26, 2025 at 04:14:21AM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, March 26, 2025 12:43 AM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent
> > directory
> > 
> > On Wed, Mar 19, 2025 at 05:43:49PM +0530, Tejas Upadhyay wrote:
> > > Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops on wrong
> > > directory. Sysfs_ops needs to be defined on immediate parent directory
> > > to be able to called on each attribute set/get.
> > 
> > Please bare with me, but I'm having a hard time to follow this reasoning and
> > the patch, why, and everything else going on here...
> > 
> > >
> > > Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
> > 
> > Why this patch is claiming to fix this? Please note that this mentioned patch
> > just replace the default kobj_sysfs_ops per the new introduced
> > xe_hw_engine_class_sysfs_ops. They are basically identical functions.
> > The only difference is that the new one call our runtime pm wrappers around
> > the calls that we need.
> 
> Earlier we were not doing any common ops for all attr set/get, each attribute has individual setter/getter. With 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call"), we introduced common ops on all attr set/get and which is must to be called now. Thus I though of adding fixes. Please let me know if you guys think otherwise I will just remove, not strong objection.

I'm sorry for the noise. I probably had enough coffee today,
so yes, this is the right Fixes tag ;)

>  
> > 
> > It never touched anything that this patch is touching below.
> > 
> > Perhaps if we also need on the sysfs on upper directory, perhaps we need to
> > also replace the default sysfs_ops on other places like in the upper directory?
> > 
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67
> > > +++++++++----------
> > >  1 file changed, 33 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > index b53e8d2accdb..25592f178482 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > @@ -492,39 +492,6 @@ static const struct attribute * const files[] = {
> > >  	NULL
> > >  };
> > >
> > > -static void kobj_xe_hw_engine_class_fini(void *arg) -{
> > > -	struct kobject *kobj = arg;
> > > -
> > > -	sysfs_remove_files(kobj, files);
> > > -	kobject_put(kobj);
> > > -}
> > > -
> > > -static struct kobj_eclass *
> > > -kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent,
> > > const char *name) -{
> > > -	struct kobj_eclass *keclass;
> > > -	int err = 0;
> > > -
> > > -	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> > > -	if (!keclass)
> > > -		return NULL;
> > > -
> > > -	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> > > -	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > > -		kobject_put(&keclass->base);
> > > -		return NULL;
> > > -	}
> > > -	keclass->xe = xe;
> > > -
> > > -	err = devm_add_action_or_reset(xe->drm.dev,
> > kobj_xe_hw_engine_class_fini,
> > > -				       &keclass->base);
> > > -	if (err)
> > > -		return NULL;
> > > -
> > > -	return keclass;
> > > -}
> > > -
> > >  static void hw_engine_class_defaults_fini(void *arg)  {
> > >  	struct kobject *kobj = arg;
> > > @@ -611,6 +578,38 @@ static const struct kobj_type
> > xe_hw_engine_sysfs_kobj_type = {
> > >  	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,  };
> > >
> > > +static void kobj_xe_hw_engine_class_fini(void *arg) {
> > > +	struct kobject *kobj = arg;
> > > +
> > > +	sysfs_remove_files(kobj, files);
> > > +	kobject_put(kobj);
> > > +}
> > > +
> > > +static struct kobj_eclass *
> > > +kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent,
> > > +const char *name) {
> > > +	struct kobj_eclass *keclass;
> > > +	int err = 0;
> > > +
> > > +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> > > +	if (!keclass)
> > > +		return NULL;
> > > +
> > > +	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
> > > +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> > > +		kobject_put(&keclass->base);
> > > +		return NULL;
> > > +	}
> > > +	keclass->xe = xe;
> > > +
> > > +	err = devm_add_action_or_reset(xe->drm.dev,
> > kobj_xe_hw_engine_class_fini,
> > > +				       &keclass->base);
> > > +	if (err)
> > > +		return NULL;
> > > +
> > > +	return keclass;
> > > +}
> > 
> > I couldn't spot any difference from the both chunks above. So this patch is
> > more moving things around than doing any change right? perhaps a different
> > patch or a mention on the commit message itself?
> 
> The change is, immediate parent directory should be defined with attr_show/store ops if we want it to be called on every attr set/get call. Currently we had sysfs_ops defined on parent to parent directory which does not get called on underlying child's attr set/get call. 

Okay, now I could spot the change:

inside kobj_xe_hw_engine_class()
-       kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
+       kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);

and inside xe_hw_engine_class_sysfs_init()

-       kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
+       kobject_init(kobj, &kobj_xe_hw_engine_type);

With this you invert where the runtime_pm is called moving it to the right parent.
I partially agree with the fix, but I don't agree with the patch itself.
Not only because I got confused, but because it creates inconsistency:

kobj_xe_hw_engine_class now uses xe_hw_engine_sysfs_kobj_type
and
xe_hw_engine_class_sysfs_init now uses kobj_xe_hw_engine_type

If we want to invert, we need to invert the sysfs_ops inside the type functions.
But also, I don't believe that there is the problem on leaving the runtime_pm
hooks in the parent of parent. Just in case we end up adding some extra file
there.

So, What about simply:

 static const struct kobj_type kobj_xe_hw_engine_type = {
        .release = kobj_xe_hw_engine_release,
-       .sysfs_ops = &kobj_sysfs_ops
+       .sysfs_ops = &xe_hw_engine_class_sysfs_ops,
 };

Thanks for catching that up and fixing it,
Rodrigo.

> 
> Tejas
> > 
> > >  static void hw_engine_class_sysfs_fini(void *arg)  {
> > >  	struct kobject *kobj = arg;
> > > @@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> > >  	if (!kobj)
> > >  		return -ENOMEM;
> > >
> > > -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> > 
> > now it looks like this is the only real chunk of this patch, last touched when
> > you added it:
> > 038ff941afe2 ("drm/xe: Add sysfs entries for engines under its GT")
> > 
> > And now, after this patch, who is now using xe_hw_engine_sysfs_kobj_type?
> > 
> > Looking further to both types, perhaps we need to kill the
> > kobj_xe_hw_engine_type itself in favor of the xe_ one?
> > 
> > Or perhaps we need something like this:
> > 
> >  static const struct kobj_type kobj_xe_hw_engine_type = {
> >         .release = kobj_xe_hw_engine_release,
> > -       .sysfs_ops = &kobj_sysfs_ops
> > +       .sysfs_ops = &xe_hw_engine_class_sysfs_ops,
> >  };
> > 
> > >
> > >  	err = kobject_add(kobj, gt->sysfs, "engines");
> > >  	if (err)
> > > --
> > > 2.34.1
> > >
