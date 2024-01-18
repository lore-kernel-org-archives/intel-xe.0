Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137D0C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 16:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0B810E83C;
	Thu, 18 Jan 2024 16:08:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9690510E83C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705594117; x=1737130117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QFdjAakksa944TOBGtaXkf3CIAug7GQHMsUn2TJxxMs=;
 b=AZ94oAfvHOHQO7UZoqBEB4gn0aetFpsOObQpgkXllOTe0g5IZZ/XUamm
 W85haIEUjsBBhIMuaymahQYpD3pCdZqUNw+Lv7T1wuT6pRh5Tdl1IW4mV
 +d+dyzxW1aIIBDoRtuYJswhO956Jr1s2E2krHy0FI0QJmGobQ3iU7AdaP
 5PdZIiGr/1t7yn3jN+CDbQrtDLklglkKPO8HqlVxYgnEAtnmR7L1QWPZ7
 QZ06cQ8ggwik+roVr17y+NvOyczjAXNt3+3CirXP9Dw59n/xYRrFM1WFV
 QxiwoWqEtPRdKa24K0xBySfPU0StbUKzDPOr17Z3+S1nb5rD6mD9fxqve w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7886640"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7886640"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903873629"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="903873629"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 08:08:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 08:08:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 08:08:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 08:08:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 08:08:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOdVvA1gF31aZgfoY9bbHPkWaC06AAcrvYUIUAPPy/CceT0MXxZEWUsl8cdy9pFSgRDCYwkl7UdZJFL+KyD4VCm6WyAzHCBA9dP5tqSZPnMCSoVbhXLgZyAlalwylxCq3YNionXH2hA5OvW5PGa8KqLNWxDJ06U3lvHphe4YHwD9CgJCCyc1Fhp5/APF/htkuxLrtuQnfc1gVPNWsQdAuxDT3eWofeD7YXG27x/ABzcr817OZWLlhXzeONLNTzNS1aZ124kzMhJRlzQkz5IfVjBwt2vCSdmoOydjJPPtjfCgqg9zzRXxMaZqEsTxU19K+lwUcLxkorV6M+/0ybTlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ev84ruasgqJGoij82PVjTVv3zXJxq1QZfr/OTgZsQYY=;
 b=VojoPCnV8DDbgyFNj5SRQGRwCV5atrY2AAh+IoqK12Pr3Ue/+ztHNDwAop2TpteDv/NUzhpULEfXp17HbLsBPll6VZlGUrOTLpsWBzqk8bbUwzt9wz1rPfmueNiiSzLP94yjJiGSMgiVbmdHgyYGmzO9P1ypozQLr2bvTP/PQS50+RSGH7AIMGxUyJSG1P6bt0K+4Q5ITFif7ofHYvr4+n63D4OAHTXZ0catHZNDAXEff5+1aKB8VcViiHDnb6wa4j0b9G2knnVtXchNPj709I+wATQi5WUDofSHnxKen7psmj20I6fGjmevukYGjyLmNThNARmtjsehVBT/6Hfn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 16:08:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 16:08:14 +0000
Date: Thu, 18 Jan 2024 08:08:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe: Set PTE_AE for xe2 dgfx platforms
Message-ID: <20240118160812.GF5549@mdroper-desk1.amr.corp.intel.com>
References: <20240117144851.22952-1-nirmoy.das@intel.com>
 <20240118004924.GD5549@mdroper-desk1.amr.corp.intel.com>
 <7cad1473-e49d-44a0-a5e6-bb5b06f6d293@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7cad1473-e49d-44a0-a5e6-bb5b06f6d293@intel.com>
X-ClientProxiedBy: BYAPR08CA0066.namprd08.prod.outlook.com
 (2603:10b6:a03:117::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd4b708-4b63-4512-5ee2-08dc183facf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jEnhR89Kh8C0e7bp8yiATqWvIg5lm6Iy8MhgPYbLLq/a0JpwO1zRXg/dH4XNUU2J7CIVQZg81xSV7ezAAjpNKhcNQndqUgAGH5Ed7IuFSEtcN4K0LC8tYRD64ZUsskohJQhzQxQ5sY69qZrocCBQWsl0ww2gyFQFTI4YTAi6zlvOmRQFRcIVpbbbHxdSAzRS9XDOwPcAOaJhDshA6bbsVsAiJtKwVBuJAEZIv8uXDj7aG8e//uaC/MosYcfi03Jv3VxziiKVquEC2/bgDcq5dRRUsD6RSpbAeUeukBb1AZ42Jx/jDuAbkrdxtWfEJ1DhuOL2xrsaUIofmrKUg2lXkhc3TBPC7jfZQqg9IQFLksJKeJrF8tcJt8ojk+DYPKXRjoQaDlXkOENJaqBxPgLgI8UJKILJ8KTdUwZ0grxpaZk0t8KhvNvN9o5i8yxL3EDeSJoO+nn8ft7BBYMxdEPKXPmxpzlN3/148Xf9oT4UGmFvUq/lX7AJGQVoejmNLyxAgbgBS0ubUvEBisJ3un2lDL7M1Q+ctkY96LZSXF1U4H4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(26005)(1076003)(38100700002)(82960400001)(8936002)(6636002)(8676002)(966005)(41300700001)(5660300002)(54906003)(66946007)(6862004)(4326008)(6506007)(2906002)(66556008)(316002)(66476007)(6512007)(53546011)(6486002)(478600001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EFdlpjtvdx5CjOUbXQMGPU86x6f+JjMbRM5jsgoEnRU02ABn/cbe1Umzsr6W?=
 =?us-ascii?Q?CRNf2mIygBx3dTlLVflvkM+vxFhUkZwd9Gd+oczGnC4PMD/l5wP/e84z6Y/F?=
 =?us-ascii?Q?u0URxkFPWwYoufKmYzlu/MeVTkzhPn5+uPzQpUNIXHFe2Re5kSMJDWGK+iKX?=
 =?us-ascii?Q?ep8UFxzZBAtarPIIjhefOz+OhB0vJQQ1jqjtpQdi4b2kjsmaz3w4VKpNBBtd?=
 =?us-ascii?Q?ogVZlOWMMV4Xw/AoTlvdiuSnKdk2760OF3arK9Sjt1AmlcebLRMJkXYWlL2+?=
 =?us-ascii?Q?YrkP3mDOTk2QeFoBcwZ15QiqDGwcKIG5cpC30p7f+avser32fCbL7xP3nR7n?=
 =?us-ascii?Q?nkcH1IM8h2JBQgkFSM9cYQYriyFFd4fiZMrjQAMH8Y523relE4HiAdPa2rqK?=
 =?us-ascii?Q?093ehrMYeOyq6w6zELbcLXCT7zbDb/JDtUUuKrIHWFUfQ2iuylx3tWn45jBp?=
 =?us-ascii?Q?LSyMVnYgeUJG9zQ1F5P1TKY0k2TxyzgDvy5M2spK53KnpsDkoPn+l3voyecv?=
 =?us-ascii?Q?AdtgNrEeEwJycUSB1rICOggtuq7kiDzQD63a7dywMjGR1cc8/YXsXEeFmI1K?=
 =?us-ascii?Q?tT8cafVI8fWsvHV3/laVD0MV+b6lT7e6dnNVEPAvJH9ntFBCKPhoopKuppRj?=
 =?us-ascii?Q?/njSOzpIbAcJIAD3o4eCDMUN6J/rWX67QEpGL0Iv18W9lHECBJiB+S4nU8RD?=
 =?us-ascii?Q?vcSnosmcg3p1LtGydw6BEd7LQIEhvCGs3GEW/IhNXUKPWHyrblhhobYqJ+DM?=
 =?us-ascii?Q?cA7n2E7Nzt7BFqw9lAQUTLtvoZqHEuULY9C9r47JNnZUPA4g1A7FNK8BWg2v?=
 =?us-ascii?Q?xGYkjw3ghrmt6r1DWKJ95/kNe7rFDYLnYpQiGWlQPNkxoodm0eONesKMkOt+?=
 =?us-ascii?Q?VkVjhO5PEYYTGnIp1zg0lbwPCVvTO5E5WWhoKVLATl/kwOuxDKVwAa3FnG7X?=
 =?us-ascii?Q?gKVfK6xy/IJ2ko6Q3dZDbEzhGAkAstBlFqdqcy3G3cbR/G08RbBkb5kHa4Xk?=
 =?us-ascii?Q?7DQ8hfe+ob6H9PYRm8BkYkdkdycX+Nf0ijig9+vvj4NPJy1dKf2gPihTkjCS?=
 =?us-ascii?Q?6DzMjPnJR5H5of0+BGGfy+oAkoqnQdbwE5VZoRR6nhJoYI2cG9enKr4TB7K7?=
 =?us-ascii?Q?f0NsZR69hjCTqXzwbRWQzrNJOrmMuxSK3mXKLF0J7FIZrcY+NMOLDOTQBfBb?=
 =?us-ascii?Q?u1KJ03ewbs/xRz2uEmHDMLdbghSXdV0wXBXqVx/Jam4+VXJqY54Cla5aV+Qg?=
 =?us-ascii?Q?6ppgqso4fLioq4HoAMHTYt0/piEQN0/r6afcB8EvwqNtBJ/y51cgBN2Iv6Q/?=
 =?us-ascii?Q?UFKyRH7/UDqTpgazeuAQej27K/0S4ZMiOiHcVw8EXHSjXGPDU2a+3MzC9sId?=
 =?us-ascii?Q?MPQQ6ag9IhPVl99yCEr49QGC/R+7IDBZClxqkj01RgoX14w5GiXX5dWjVCla?=
 =?us-ascii?Q?DjHvX0BCiL17dsJ6JtPpzvD4yqzOLWTZsQTyALGsHFRiaraG2YIaw4aVfixe?=
 =?us-ascii?Q?z3UT+nZLx+w2fv4CTgREnI/dBuM/1GkKcDnrJFKehJoiREI1T/KP8e9cuXRK?=
 =?us-ascii?Q?/lTuZt5hLVS5a6PsNfRz52G/hNptzczv5Vij9wMeVzPBL/C0UbaCtfNqH6L9?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd4b708-4b63-4512-5ee2-08dc183facf6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 16:08:14.5171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5AgkVuhq1U1FyAkH7e8vJDwo28sYAle3Uh6kvUNmLGZm8VVFnugYTmNbpXZ9x3MOFZg7gOVY+D3yBNJfo0QpBYNyc4lcm4jSYXzrRUzj1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 03:42:56PM +0100, Nirmoy Das wrote:
> 
> Hi Matt,
> 
> On 1/18/2024 1:49 AM, Matt Roper wrote:
> > On Wed, Jan 17, 2024 at 03:48:51PM +0100, Nirmoy Das wrote:
> > > Atomics on XE2 works for both type of memory so
> > > extend setting PTE_AE for dgfx platforms as well.
> > There are no Xe2 dgfx platforms yet, so it's kind of hard to review this
> > fully,
> I should've have sent it internally.
> >   but my understanding from bspec 71539 is that in theory a dGPU
> > atomic operation against system memory would probably only be atomic in
> > device scope, not global scope.  I.e., it's atomic with other GPU
> > operations,
> This is my understand as well.
> >   assuming the CPU isn't also accessing the buffer.  But if
> > the buffer is shared between the CPU and GPU, then you'd want to set
> > AE=0 to ensure that we get a page fault and can migrate the object into
> > lmem first.
> 
> I think on system memory, AE=1 should be the default and opt-out by UMD with
> a uAPI. Basic operations like
> 
> MI_ATOMIC will fail otherwise which if understand correctly MI_ATOMIC should
> work on system memory except
> 
> on PVC because of a know bug. I added a small test to check MI_ATOMIC which
> works on dg2 system memory
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html
> 
> and also on discrete xe2 but requires this patch.

I think it depends what you mean by "work."  My understanding is that
barring hardware defects, MI_ATOMIC can always execute and perform the
requested operation on Xe2.  However in some situations the operation
will not actually behave atomically from the CPU's point of view.  The
AE bit in the page table doesn't make MI_ATOMIC work/not work, it just
determines whether we want MI_ATOMIC to trigger a page fault or not.  In
cases like this where a buffer can be accessed from both the CPU and
GPU, and where we need true global scope atomicity, then we'd want to
make sure AE=0 so that a page fault is generated and we get the
opportunity to migrate the buffer to LMEM.

I think the expectation of userspace would be that MI_ATOMIC is always
truly atomic.  Wouldn't it be better to make sure we trigger a page
fault by default and only turn that off if userspace explicitly tells us
they're okay with relaxing to device scope atomicity?

Either way, we should probably wait until there actually are Xe2
discrete GPUs; at the moment this is all theoretical since the only
Xe2 platform we have today is an igpu.


Matt

> 
> 
> 
> Regards,
> 
> Nirmoy
> 
> > Matt
> > 
> > > Cc: Fei Yang<fei.yang@intel.com>
> > > Cc: Jose Souza<jose.souza@intel.com>
> > > Cc: Matt Roper<matthew.d.roper@intel.com>
> > > Cc: Brian Welty<brian.welty@intel.com>
> > > Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pt.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index de1030a47588..3ace4b401369 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -602,8 +602,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > >   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > >   	int ret;
> > > +	/**
> > > +	 * XE_USM_PPGTT_PTE_AE is available for igfx and dgfx from xe2 onwards
> > > +	 * and also for PVC but atomics only works for PVC on device memory.
> > > +	 */
> > >   	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> > > -	    (is_devmem || !IS_DGFX(xe)))
> > > +	    (is_devmem || GRAPHICS_VER(xe) >= 20))
> > >   		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> > >   	if (is_devmem) {
> > > -- 
> > > 2.42.0
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
