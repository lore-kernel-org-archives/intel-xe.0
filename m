Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B33C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 21:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CE610EDE5;
	Thu, 23 May 2024 21:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieC8QLzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918110F412
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716499039; x=1748035039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ffvYonfJQlHXiZU9l7sXSbfqgwWqj0/LZ1oHckFq9eI=;
 b=ieC8QLzy8A//NaYe4/adtqGbZx8Kj/1syPd+xYYrSElj6+RmXOJdzlrN
 /7/x+qoVhOSqyiUqwM0xONxMixMK5jcc88+LTxrEm51aBDpqdd8o52j1O
 +1Pc2ygdnvfS/FEpjFaqJJx24nmp5BUyNDwo+d0d4HaLe7aetdeV0u5uB
 1UdkYyc17DI7/v7jRqV2ToCL174wHDKWqn6I8pbfwy/XY8yTuoZZBqMPO
 RC8k06PEote9xnfUi0LwQzljJa/2jG4Q9d+cSNE7auu1eHts0yt/Jv0PJ
 tbw1ziLLDH4x7nTbV7Skvt2OJfOu9IMB8B75VhEtbYuiLJ4QzxHBBQHgm A==;
X-CSE-ConnectionGUID: v4MBU7h2SNSkzQEIAWthyQ==
X-CSE-MsgGUID: cHSxtvxSSqm61m9i4YzNag==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15793506"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="15793506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 14:17:18 -0700
X-CSE-ConnectionGUID: 2gOCi1xpT1u3x1cVTIXcLw==
X-CSE-MsgGUID: HAbqohx8SVaOB2dkryHt6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="65012470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 14:17:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:17:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:17:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 14:17:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 14:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFSdWfiXHk8AhpEBoTLGK1Fg1l379t59HWFsE5RmgvwhF0O9sKne0p+y+Io+gnH1oehmVi6/HiFDNNVvCwS/ZKBtSCC+Hf7QadxzwiybGGMIpdgqiDtorP8ss/QbYSo2s0Tw3nEX5wY1zBqjk6iP7BdT7wbH97DmOFSy06+qm5bNnapIUI49TnxZrjiHWXJ9qEZnMDEhLAsaePFDCXLuJDzN8an6qGstlzRXxEzYwuq1bJo7b8D/neDRaRZkzDXZ9PzTaCqyKOD1kylwhHmc+7ZYC02fkLOZ1FDUMqoXpn/x7OLWZABFnGtN8QAFmlK6OG+vde9hTbdvGfoz6LZsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTDpRhw6HvXs9GFBtV/VMJ99nI/Q6YHTPVuWH4VLDr8=;
 b=kE0B2T0FLPozIXHVRWZafRIObwrB02f74zSZkcPhT09UEt++yeBcCwz9qZnFVE6RhahlTWAeEMVJHxJ1JqYg2mEmOQEVfXzs8m3s2vUSO2EhwsIZf8z3Bb7VSEG8zPEIqNaq3qcK+6pbRrahnrniAzVKdYXL84K6rGV+D4cyqO0zeX63zoQglR9EyS4yTy32IUObJPiN53TMpy6KoV3HSzMHIIRcaiK47lM6ktTgCf2GZOQSXp3cCtkOwYjdGB4oSYjckHBxipz5GShtNhtQAeCRD/SF/vZcHE8trxKLCj22WNkddurhzkwq+R/G7LN+D+MRmaxAhgaDwa14a+izcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 21:17:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 21:17:12 +0000
Date: Thu, 23 May 2024 14:17:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/vf: Provide early access to GMDID register
Message-ID: <20240523211710.GC5383@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-5-michal.wajdeczko@intel.com>
 <20240523210816.GB5383@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523210816.GB5383@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf1178e-7cf2-4f02-b79f-08dc7b6db6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DJ7A2EXRXE4odeu+rjUqNgPhAanTzKl5VFeRE6aLzp1XcKojhOp3zRK+S6a5?=
 =?us-ascii?Q?5DMaE1AJ1909lzhF/zzLSIeOQsr/n1AGxIwtgw/TiriemNEuhR1VZPORb79K?=
 =?us-ascii?Q?uA3n4behgkCUBcs+V20u/iJ9gfeLNTUqCAgVSJICJ8IurfqY3y2AZK+w+8rH?=
 =?us-ascii?Q?IscSZBXywGxEPVwMVipWpDCVIc+w4l4yphWv0dvr4VGPrvqC1L4hnIf3JQHR?=
 =?us-ascii?Q?oe9/xzRygrGL59P3M/5uLIoqqCZmbQ+WV9povnydXjEZzmtqsmCjS5MGW6fJ?=
 =?us-ascii?Q?LdxoUP3YL7+SrXD3c1jZFydJTSp9fDBPcsvSPcZ8aS6pzzCxsPbptXGXX344?=
 =?us-ascii?Q?raTuE9NPfFXlvsl9/goohMRqhvVDEit3OWdTkTaheu6dV1sSsEY5r6JKZSZs?=
 =?us-ascii?Q?H60vadrCA4qZw9GcQub1rY+DDSTedU9JDNDKOUFm9Frgr0LnC+ShMikISF9h?=
 =?us-ascii?Q?xIq4JKwBuvEgMN1w3f8RCe1dvn6jPyJerJN5HZPCjg7+BRs/kx99kgEZYx87?=
 =?us-ascii?Q?n1X0fiUgVc78hpwfa2DS+LCqBLftfCRI6yqloMvIyg9ax5rCIeoEdSWNKPCJ?=
 =?us-ascii?Q?DNCwVK20C0ZAI/8x2z8Uj3uFoAIWJ43cX43xAnSbRZl90bjXeDXLHalxbHoP?=
 =?us-ascii?Q?PZvQrQcFhmQV66upOsYccpKwK1kRcoomTwOvrpx1xITzvw/4rTNcgw60YWb0?=
 =?us-ascii?Q?iN2Q5Xync7RG9WFEYPe0FefFBh8lUaNp4fiExl4F+yMIVZ/u+r+RlaGbJqJc?=
 =?us-ascii?Q?6sB3DMSck85bpPHXwDFbhycvc1gt6nlyGFrnjlFjVtth6xmu2Yq5zEZxJi4x?=
 =?us-ascii?Q?YdZEqJiW/4Vde2RcOnG5vgLSev97+8KXrngsFfF68AfmW1q9oPWv/mVDN06d?=
 =?us-ascii?Q?/HU7csayQq09XtFFbIF1HUhBwv2+CO1bwvBDbrZWCFSk0X7ccxRZXM72XRNh?=
 =?us-ascii?Q?Ckd9unJpjY5pQ5qJSn2p/IFsGI5ASS8eTBa4zZi21sJuxGHn6vjs3sOTvVLj?=
 =?us-ascii?Q?++SLo3OdoA+8fyz/cWw/9+3jh/jR+vtaHCdbu8Cc3mhZIMxsR3Ru/BulLjdS?=
 =?us-ascii?Q?LHU6NC8H6+MvFlX8yw9Tz4a2xvYk0L/FGF0vGx5zF5pYrnKakCBuaU4t7asJ?=
 =?us-ascii?Q?ohfUPoy9p9O0PAauF5HtNz9GiPWb67XdjpDCm+yqi9vXOGLjeY/iOcOOwEjK?=
 =?us-ascii?Q?h3XKa2HJSdIrujE7Hu3Uah6NXQddbuowfBR55Guq1HV+f55NAZOnDe3v7Rrq?=
 =?us-ascii?Q?mn6kLiIkrtD7z1qMfGrEJGFmwzA1KGGVNrjojMP38g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZSARdg90sTFpJTm4KOYA6LEWFJTo2r1cL3u7FvSDy5bMzOKjBs9GeZneOY60?=
 =?us-ascii?Q?MQNWesUV0IadZPOhHfxICnmuIcCaMEB3rzW8O5tQUh/uj7piFiBZCCc6j7xY?=
 =?us-ascii?Q?L8BUyCqTKOzU59plYlrzFgzpzyFjct19IgA8ZKHoaPzcN9Mk1/F8u3j2azGl?=
 =?us-ascii?Q?xU/TkOQnUJB6rhcBXTUhoKMK9CqSXVrrWL76KgKDwVumddLyhqiQ7aIuLKAl?=
 =?us-ascii?Q?1prO8Ajx9v01XpsDhs5kRe0Z5DcRbY+KiMfLbSJ5EmFSvO/EqrmCukXT+Phv?=
 =?us-ascii?Q?wZlwQafqbdhjXYwuLNVApmnGmvyF17bJdqGydqcHJsF/7v+GaV1Yxp4/sSJf?=
 =?us-ascii?Q?429ZnwDWNl4zzHFNxrVmaIzrLfAfwwm4d2VCp/tyX/ULJsOHcKItTM27AmTy?=
 =?us-ascii?Q?pUaMAaOovKOygQX531U0VmpRBPXd5AcWflqD7mzF34M9ouYLJ1rKNgKC23sK?=
 =?us-ascii?Q?Axw6bq21HdGx5meadHQMNFWSX+q8LrNBXn0ICqgkKmp/wikUXUFyclR2ZOuk?=
 =?us-ascii?Q?TP+NUdteUv0Uqr5x7Coi6QwI2ZMVjyJ1VYEn3PVKRF8OVd6At97bnAXcUNBC?=
 =?us-ascii?Q?Hf9G8KaTPQlrHWwF7bs9gV3hzDqpC8qeSr7IQAFDFrHDfK+ryrOdZ/JXqNXW?=
 =?us-ascii?Q?fApxWBgzt/LR3h8NpvDV5kkT7M3vlZHCoi037GLt8GnSEETQTwBSgRgC8GRB?=
 =?us-ascii?Q?5HfWbGZ1VqE2hYcms++KCMlrSavy2CNrevHyWNdApi7MU6elbJMkf0MUSRAe?=
 =?us-ascii?Q?W+FI4L974fNA/mOPJaKhFm5Mk0QM/EAuO0NgyjDQUZdVtx4VNwB6oWGtAJhG?=
 =?us-ascii?Q?T1Kfnz+ZLzSJBrV+Qrsu7408YjZyEyrZRxESterr+JwfDzcvOifP6mC5MyX3?=
 =?us-ascii?Q?ogIBCTPWMzI3BA72z0BsGmqBxQl92jTS61svX4x4oBMPya893f5AL0O11pc8?=
 =?us-ascii?Q?C7aN2Nwn6e8sUiirWAVR7nOwSRtKe/oLIuG8lRAy5os2v98/EqsGNIK0KxHW?=
 =?us-ascii?Q?/3V6GhQpkFkx3v6w6AzvFHoLhS5iF3nzEwFYpvHNRRr7HU6naq0X9NUdAQrF?=
 =?us-ascii?Q?p1t9DRgzB4PdK2h3X5h6J7hvO5eaVhSYsPxpvKzTT+utsg2uYh7vGfjEImYS?=
 =?us-ascii?Q?hQGjttOw6qX/ua3EvdHrvMUuGnSyM0TChdYNCDr4dnyRJXNJ3T+fPRFT+YQw?=
 =?us-ascii?Q?GIC7vK4Ta2JU98v3z1Omxm1epHKbcN6TSkwD5HerpKYseWp6PsvRyyS9MrwW?=
 =?us-ascii?Q?Lq+e+1M60xjbWQgLpWxjx46lBRcVz5wSHGcYhfYMUSkqBCJD7rvCAs7wcfwz?=
 =?us-ascii?Q?Ihg1KEetUlHfPLhInXa6FGnT2nZfOY2a+BD+cB29jaP+FRXOe/asEliX/UME?=
 =?us-ascii?Q?JHAtQXoIljXsc+M9hDrU7M1V6I++7k9iLcUlen8Y9odLKhlTUFh9n2M3C7Fk?=
 =?us-ascii?Q?X4G9HKyvEZj2cl957K4exT4JsnaC5trzO/0G/iCDLqSjYAYiU9AW5XB9B9PC?=
 =?us-ascii?Q?QnqPPdymQIbwgBWXVKRCgpeg+YJBDLvr7K5G08bN2pbxw0Dal3O+llzQMkwo?=
 =?us-ascii?Q?66QFQ3Friz2VAn03eBZdroG4V8DJXLNBnJkedYGieUxRYSDG8yuLoKpc9Fjt?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf1178e-7cf2-4f02-b79f-08dc7b6db6c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:17:12.8477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTrgkn5cYlvwpycCOTcQZnURI7P+bX/PTl926Zen0a22x/n22MrrztvWErsCcJjPIta3JSvCIh+3DFcGN4ehvWWN1sKK6paeYTKx7EQ2D6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

On Thu, May 23, 2024 at 02:08:16PM -0700, Matt Roper wrote:
> On Thu, May 23, 2024 at 09:22:38PM +0200, Michal Wajdeczko wrote:
> > VFs do not have direct access to the GMDID register and must obtain
> > its value from the GuC. Since we need GMDID value very early in the
> > driver probe flow, before we even start the full setup of GT and GuC
> > data structures, we must do some early initializations ourselves.
> > 
> > Additionally, since we also need GMDID for the media GT, which isn't
> > created yet, temporarly tweak the root GT type into MEDIA to allow
> > communication with the correct GuC, as only it can provide the value
> > of the media GMDID register.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 47 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 44 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index ece410289f6c..eefac633dbc1 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -20,6 +20,8 @@
> >  #include "xe_device.h"
> >  #include "xe_drv.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_sriov_vf.h"
> > +#include "xe_guc.h"
> >  #include "xe_macros.h"
> >  #include "xe_mmio.h"
> >  #include "xe_module.h"
> > @@ -471,10 +473,49 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> >  
> >  	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
> >  
> > -	if (type == GMDID_MEDIA)
> > -		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
> > +	if (IS_SRIOV_VF(xe)) {
> > +		/*
> > +		 * To get the value of the GMDID register, VFs must obtain it
> > +		 * from the GuC using MMIO communication.
> > +		 *
> > +		 * Note that at this point the xe_gt is not fully uninitialized
> > +		 * and only basic access to MMIO registers is possible. To use
> > +		 * our existing GuC communication functions we must perform at
> > +		 * least basic xe_gt and xe_guc initialization.
> > +		 *
> > +		 * Since to obtain the value of GMDID_MEDIA we need to use the
> > +		 * media GuC, temporarly tweak the gt type.
> > +		 */
> > +		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> > +
> > +		if (type == GMDID_MEDIA) {
> > +			gt->info.id = 1;
> > +			gt->info.type = XE_GT_TYPE_MEDIA;
> > +		} else {
> > +			gt->info.id = 0;
> > +			gt->info.type = XE_GT_TYPE_MAIN;
> > +		}
> > +
> > +		xe_guc_comm_init_early(&gt->uc.guc);
> > +
> > +		/* don't bother with GMDID if failed to negotiate the GuC ABI */
> > +		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
> > +
> > +		/* undo */
> > +		gt->info.id = 0;
> > +		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
> 
> The xe_guc_comm_init_early() and xe_gt_sriov_vf_bootstrap() above also
> make changes to the various GuC0 structures (which might be "wrong" if
> we were reading the media's GMD_ID, but I think all of those changes
> wind up getting overwritten later with the correct GuC0 values again
> later when we initialize the GuC for real.  You might want to add some
> kind of comment about that, since otherwise it looks at first glance
> like we might be leaving GuC1 state inside the GuC0 structure here.
> 
> Otherwise,
> 
>         Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Oh, one more question --- for non-SRIOV cases we assume that it's always
safe to read the GMD_ID register offsets, even if the platform has
fused-off media (like PVC did in the past).  If media is fused off, that
register read comes back as 0x0 and we move forward recognizing that
media just isn't available.  I don't think any of the post-MTL platforms
we have at the moment (i.e., platforms where GMD_ID exists) ever have
fused off media yet, but I imagine that situation will likely come back
at some point in the future.

With the SRIOV-based flows here, are we going to get any GuC errors
while blindly attempting to read the media GT's GMD_ID if media (and
thus the media GuC) isn't actually present?


Matt

> 
> > +	} else {
> > +		/*
> > +		 * We need to apply the GSI offset explicitly here as at this
> > +		 * point the xe_gt is not fully uninitialized and only basic
> > +		 * access to MMIO registers is possible.
> > +		 */
> > +		if (type == GMDID_MEDIA)
> > +			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
> > +
> > +		val = xe_mmio_read32(gt, gmdid_reg);
> > +	}
> >  
> > -	val = xe_mmio_read32(gt, gmdid_reg);
> >  	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> >  	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
> >  }
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
