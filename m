Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B6C48260
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 23:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6830E10FD75;
	Mon,  5 Feb 2024 23:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeHQZnui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C451810FD74
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707176970; x=1738712970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XiQIjrnj9noxzHS4TiiN+x1mqegepkrWg2VSHODK5uY=;
 b=YeHQZnuiz12B0WYj9Pd6mt6GVu4zHYwcyjECZV/gi/FMtzPHCCcHXijN
 CpjF8cX3SF+NmDpkhEYHUdIem+78gyn6GDaVFWc+g3okuHv1IShfFRdk3
 BFFPvi9hRKMjdOVt4RKjFWE/ECbofeRQUoK8wYb7mMcQPxQb+EbtR/Rmi
 u2lNN48lZIbH0hAWVGCOaVMwHsgiPmKFWc+WGZFgZDBu+Ua603jw3d68D
 HamhX9EbDUZkIXj23WkF4dgnlefIf1LLAj/UoNOCx6vNrS4z2EDpyV8dD
 5H2JPhrjnBh1hUgIfswZhfCWEcp6xeCi5nuDq7S7l985zsDWHG7HMFDwa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="783047"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="783047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 15:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="835534"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 15:49:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 15:49:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 15:49:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 15:49:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPwrDKL5g97rO8+ksd1RS03muoBl9pm+aGfnhmgdaCaZGe6HhGzbrCjTJk9sDtBs9WWrQKOnO85Gi0ZhW3KkEPVyq2vGwuXWyE5u7EQmibStYcSUiBo1/5XityiqW1UehCn+kWt76UOM2/T1LKVXMl2lDula9ePsYunFo+pmcMXVTgCgDk1nBTAv0Lf4heoPh494W+VOCptv+lZMKmDOuHN7icJidfLOGx2avC7zXznIfsK9l/xbSqEsXWZ2pnsHPGR7g+fG/rXmBiWSBQLz81aob9TVTc01mpwj+FLDQKCl7F7qnXCqLEtex7Te2C222q7z6RAVj48aVn5PhMYmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTnbzxM0VlwVZfaP3fJTq5UeT3eMOYhJ59v+2iiWI3c=;
 b=X9g5l0mR9L5Ixup26qwUqrTLt9okVzYyY0XEBJYR14ejm0azhLtBqgnGRV+VIV2wynMwvTfNrkDYQqg7kL7TcGsW43P4aZj9MDxeuBWvkyvxsawM1AijFqzFiQAXc0DJa3l0THrbQjHA82r+8BrxLA3dS5BYsNEuLWv8gozWuOyW++TSMEwTxQFnwyM1B8nMPcPi3IWJzleG6CUHVy67Irs1iyD2Drm2ISxnGVABwan7ygEJa/a/Ho47HuFD4d6VDmsDelvh60aDfExjosYS94rtCLUJpktLw0RniBJBVnEeLiXDJ3C0XzjkeGZt6j1NQrndSwQ+UgNNssT4Vv9jGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 23:49:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%6]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 23:49:26 +0000
Date: Mon, 5 Feb 2024 23:48:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Assume large page size if VMA not yet bound
Message-ID: <ZcFz22dQzkkqhPul@DUT025-TGLU.fm.intel.com>
References: <20240205231714.2956225-1-matthew.brost@intel.com>
 <ZcFt4oK10BuObd1r@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZcFt4oK10BuObd1r@intel.com>
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 0140f13a-3b3c-47c1-928a-08dc26a51607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wyG7SpKRkKmHOj3cyZ3mkUqWTrvk1RIlkVu4nfdK0xr+6BoZmlDMkMhWrVPUvmZcefJBLKCWi4r3E7tzwfp3IHFQh2FU+MpvObJmM+xTsVfUsoFdEVP0W5UjV8j5pm9bvMZQGc2EF2eJyRr1GYCAsLP5tAxKgTubIUsRDmx9t1EqAIk75NipHThZh7XMwUw9NXzKZLQ8Afu7mmpIdf0wdy2eSdTvLBeTSWI++ZWZD5x+6ydS5TRh0Vb1+5q31/Uj2nnKrZfOYIx5vCsR/NjOdQGwZeCl69kKhJgZordvdmWJW6+itBF2gbe8Y1cpSSWhOsd0rFoPQCm1h2k5TpQjZKTjpd1UewLuHp0xn+SkJyD821Acgn92QYiZxjEysC30Z0CbNFgB9MJ5BpU1OYh90Zb2xzh1SyoqCjSs1o7fwPu16kOC+RqJCh+WktWFJo7Pb08yVCYOhhf/eOzGAhESrGLEvHHo6WJeOAxE4+A2rFt5jGwpK+FL7U0eTr+C5uyTk6QSvPo+ml2u8VKoF5k+E3TwHdQOGPX7nip41xDz7WhysDsoW2gHP+6hpYYIu+vL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(66556008)(66946007)(66476007)(6636002)(316002)(4326008)(2906002)(5660300002)(6862004)(8676002)(8936002)(44832011)(83380400001)(82960400001)(38100700002)(6506007)(6512007)(6666004)(478600001)(6486002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?du/VIVea5tOX2puREf60yrWFTJwjZOActVh0KkvddCUZYmIwicvXqkV+gJVw?=
 =?us-ascii?Q?Fg+s/z/y4Jhacz9URirbjdhNUlp5cLAAClcJt3RFGhm9VSOykZwxuHN+82MS?=
 =?us-ascii?Q?KnYmiEdrZWsp4nZOrszJLi5JckaTBAMRLgo3z051QQKCBpco3J/4qS/ffjaq?=
 =?us-ascii?Q?Ks0RYEiegGfAosoPaSBp9hI8UbCS9uEHKFCqQxnqaL+uwXOz87jRcdKCGd4l?=
 =?us-ascii?Q?qouye3BVtPR7RxyR/twhCsPfWV/7eThHfzVnJiGj7OCoudn3JkJf8/LHurTV?=
 =?us-ascii?Q?48c1C0pb80kDTBi4VdnQ7GUxDhl7lCCuX3vEFPIHRD1MsNVtid9WQQrKxUzU?=
 =?us-ascii?Q?/ZKfUxwejNbxBjB1CpDAPEJyN/DrrAzOESSzbaTNJAL4pYoTGOgOvGtDqI1I?=
 =?us-ascii?Q?zGjSxsd67tQ6Vy30i/5rtNhI3/n/PVlu6zTJGPmtYnKB1GaeBYUTXRz6n4gd?=
 =?us-ascii?Q?ilG2PNVJT6PbR89O79jJ/1j05A/T92kL7FndzBJAHiBU8elvP2TzVtkhl6X3?=
 =?us-ascii?Q?hxJyV53iLwd7yFXi0FXphax+d6ZdJRHgvnwrGhLxFjr/4nz1LDKGXO8ZqMSp?=
 =?us-ascii?Q?tIA7xWD7++ci5Z8Y61vlIHrPkl9fwy+puEY8AsEqCwfIgWK98q3DF+6SCjrP?=
 =?us-ascii?Q?ur35kHbxNaCm4b86/p/uoui0g55m7enWlKUUJVKA1k8PNJBbrxyHaKmMgkn4?=
 =?us-ascii?Q?mUlcElhnXJnxfqGmTxEAiLCNZylNqiFexkz36dX7sVumxY3/Uq6N6HrYMksn?=
 =?us-ascii?Q?qbOUC8JpypM+082eb2ZUSveVgjX/AaDz2L/5xigRTytROe8As9sbhP9CI5DY?=
 =?us-ascii?Q?jAmq2n/bmlRLQcCMU57U70Rzychg9FOxx6w2kY1nf7iFgThF3F7Fz2caSS5c?=
 =?us-ascii?Q?cYOPvdBfg9jUs7vgQHPV5xktajeCRfL05PmYb9WbPCPqovsBYANRKKRelzr5?=
 =?us-ascii?Q?/McaCSGin3shFHneLJ6Cz9bBdci6KubTkHVLt1VPhw7lNvfaO1KiOfvJbCu1?=
 =?us-ascii?Q?4Dj4rSdSFr8ByADdFyb2eos50vjmQu/hMSYPOBI/JL7nf/od5ZtLFtBzAU+q?=
 =?us-ascii?Q?M1vqGZ5g/cwBxSg0uZfT0HZV3dFLBervG3BrJ0h77EeAQe5ucNC4RSdk+T8k?=
 =?us-ascii?Q?2tGjC0PwGBY7834wjYgMdX+Ih3t/B4rDSuRPOr1rmtfxbrsAP3mukpOvz4M5?=
 =?us-ascii?Q?3m5oM0nbeUUZFqQNY2W0aRTQnyKz6eF0ea4vZ22dTU0Wi9dVUwTw2uxasFBD?=
 =?us-ascii?Q?zB0c+dNn+TnzMAztC/ExaQ91af07Gme41xrRmAHT2ZxoR7zGqklgtrNOmZcz?=
 =?us-ascii?Q?ZocPEgLmka/dRBaskIg9gaLTo7wt0NsV72GiW98wS2+vNldYKKTH40vxrZAD?=
 =?us-ascii?Q?Ts+qYMgAsu8h0O/VDCaTYXReXwDg/sM4LOVxPgwvsFrv89287Gc4EPU3kA6Z?=
 =?us-ascii?Q?wJ+O2sHHIOZoxoPu2QoZNdWkCODu/4IYWEsWEbLA4gkbFtF0FVIYhstq8Lij?=
 =?us-ascii?Q?7cI5sTRUrRxQcBe1kaGXNxwxHSOhmk9o6XhZIpvW8+B9CgvMEE33agqBgHLZ?=
 =?us-ascii?Q?LENZmmTuOgjnWUzrVXVngUmbyqt5pRujMRr9FfSMQFbAsiqGmcvqP8bEQE85?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0140f13a-3b3c-47c1-928a-08dc26a51607
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 23:49:26.2079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvnfKySdmAef5RppaMBDaT0KNCv2F9NNwuUUJtyueYPh/OOLUd9GL2XlnPK3smvyvAMosmkLNxa7FN5r1ySrfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Mon, Feb 05, 2024 at 06:23:14PM -0500, Rodrigo Vivi wrote:
> On Mon, Feb 05, 2024 at 03:17:14PM -0800, Matthew Brost wrote:
> > The calculation to determine max page size of a VMA during a REMAP
> > operations assumes the VMA has been bound. This assumption is not true
> > if the VMA is from an eariler operation in an array of binds. If a VMA
> > has not been bound use the maximum page size which will ensure the
> > previous / next REMAP operations are not incorrectly skipped.
> > 
> > Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 7e29b816c4d4..ed594fa2f8da 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2200,8 +2200,10 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
> >  		return SZ_1G;
> >  	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
> >  		return SZ_2M;
> > +	else if (vma->gpuva.flags & XE_VMA_PTE_4K)
> > +		return SZ_4K;
> 
> I wonder if we should also have something like:
> else if (vma->gpuva.flags & XE_VMA_PTE_1G)
>      return SZ_1G;
> 

This is the first if statement in xe_vma_max_pte_size.

> drm_err("Something wrong with gpuva flags, using max known page anyway\n");

This is not an error the user doing very odd. Let me give an example.

In an array of binds:

1. MAP 0-4MB
2. UNMAP 1MB-3MB

#2 directly modifies #1, the vma->gpuva.flags gets set in the page
walking step of IOCTL which has yet been executed when
xe_vma_max_pte_size() is called. If a page size of #1 returns 4k
(incorrect as the page will be 2MB) #2 will just do partial UNMAP rather
than a full UNMAP + 2 REMAPs.

Agin very silly user but the user should be able to break the kernel or
trigger an error message.

Matt

> return SZ_1G;
> 
> but up to you...
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> >  
> > -	return SZ_4K;
> > +	return SZ_1G;	/* Uninitialized, used max size */
> >  }
> >  
> >  static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> > -- 
> > 2.34.1
> > 
