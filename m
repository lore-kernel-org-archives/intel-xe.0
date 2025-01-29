Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14577C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 05:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF1A10E33E;
	Wed, 29 Jan 2025 05:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1vdInA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B9B10E2AD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738127066; x=1769663066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hb33sWOTMnyrU5eQ1oSUl1AApiJSq9sWShciGIDXiu0=;
 b=i1vdInA8BxxKmvVgxrImzw2rGvsS2+3n4ieFqoEWkvYBd3Vl89Wqh8Gp
 iYZ+ZDatLiqxFNThHLKFybrW73s3F+mWcXrwjzJ199KnELTdczJsgdfpl
 7Qc596aB+7ELYgWOnJYQY8W+DZbt+nAh7ZIaeR53uT3H5pwZXVgUOZGa2
 b/DwXcizLMrujIQRhY05yhDmh2sWFGyYVSSP5C3UEXCw7avS2Fn3uHOCk
 OH4amoh5DmFZmNu/jL/bXUezefahf/1CB2zQKkSsLyWlpzfXcgTNDg0MS
 O8FTSGUYDPZUw7EqExEDlI87oGD7x/iW0BZJiweI4fv2G21licE88b5Th Q==;
X-CSE-ConnectionGUID: qNLK2o+WTAyurOYW3ZG98w==
X-CSE-MsgGUID: fHSuscPPSwWMg0Sv7b0mnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42559470"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="42559470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 21:04:16 -0800
X-CSE-ConnectionGUID: 5B9VJDdPR4mTQw/tMF/8ow==
X-CSE-MsgGUID: +LVcv7N0RcSWZ385157O6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132209521"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 21:04:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 21:04:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 21:04:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 21:04:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSTIL75pRugqPC18UA0xJQYhzc2wppy9jf2lCSvh+633dNXgMoGp945bcGqN/ef+AwPhZpvjTBWlyzs7CderLp8PaOohWk0P8zfrv5MjujFVdj3JcfhDdNdY1e2bOa313I7p7eLmDqaCco5PymgxFJrQTa2JA1V0pYFke3J0+0PTKKrVyqFyIMXb4s2XStSMu8jZjPjLLSEeo28Ny3Yu1O0G8RaCrcXbL7oc4KQJs7+8q57i6KSW/lcR2CEyxLSW8Tqwb9J4UHCkAUNzwQLrqS+8OY6g+q1/INiIDy6R67uz3XBXRphrzgvHCWLcnFGTgUkjwjzZ0sXJeNeCJV7fnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY8JxtHUl6uR1vIEsHrylF/2g4jB8A8DBmxA2yFZV54=;
 b=KoghxLivL4KwwV5y8GQiAR+oqJyKeJpcku1zda8p5T3RUG+DewgQPm++s5X4DjoRlJSUNnxiTlweBgxE8izI+IZcw/ymykQoRBkm7IEO3BugwlODa7MMWJx+b5sU4Sc8HYc58YPEA9MuYVGqZ6WFbKIh2/usPCa3YqECZtHWN0ueTDfyubkGCqqHuj7/wTHYUN6ZCKnuTHA3Q6OlAMtExn8E/lyc+Txi9mq5Pj6s1PmH2dZGjKwNaSJ82LiFxfez0XZjGW+SYHUjHSkSXWKgpz4ewZm0aPmPZAFbbRsWyTow0ud0BgK9wQD3xAcx3M0Uwd8XSn+xx/bL4tf8W/fHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Wed, 29 Jan
 2025 05:03:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 05:03:30 +0000
Date: Tue, 28 Jan 2025 21:04:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Message-ID: <Z5m22oRBNKgHPy0B@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
 <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: 246c1f56-637a-4c54-731a-08dd4022459f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6hjSaj+VsQTjQq0K/58Cn0A8t2GsZkUglYhswhCRMOSClYLLzxRD087iSCmq?=
 =?us-ascii?Q?7DfTzKFN7RMwEGe4j2llQV43hvwjtdqpFRUFPyrtWIEEk+sekgaDgXNsYmE4?=
 =?us-ascii?Q?vReQ9nsCB4Mt9OwW2EUUY8hWrdGDzmTtyrwBb/Ovgyi457TVihXxHcVo/tuu?=
 =?us-ascii?Q?zRVwC2IB1JYYKldjtkh9qKTltzpgBuEw4r8LYwAGvrt21t50NJSCkDXvBSpD?=
 =?us-ascii?Q?tELGKBR9SzC0XmIFGUgG3iLwQT48IFfDGfoJx2VzSTQ/0HHP+crznaRA+h90?=
 =?us-ascii?Q?P8BcpiTDYV+8yRuFbsaxn2E6B6+I9BIHlWsyW4OXCwFP1bNQ17OsWZKGpw1h?=
 =?us-ascii?Q?KK48/bKg90HFoJGoH6fjLHsh430pgyL5EHCdiX8PjhAeav9F+wEgCJkvUsEH?=
 =?us-ascii?Q?12lwf++MARC1VuCvjrsM9tkk0DMMv7s+gPIPNPPJRqR2aoA7n13uS1dKYmvo?=
 =?us-ascii?Q?vHG0NNRiTsHkoDitJ5OeDTfB5PYoo3ZvsuyjlO+y+k4szmZ6cIN/I7sAUKvF?=
 =?us-ascii?Q?rs6+4hRZdtxH8cqDCBllPaNFWFl4KL9YfPkZvcdPhLQakER+Cg7FBif8pVDm?=
 =?us-ascii?Q?3VhY/RDdIEbbpRQnYMjG704Al6iomp2ruGzZTBDXwEOMpMUfC3qYJH32bF75?=
 =?us-ascii?Q?T4NUpglJ0ZtF4yQetTxT+icuImeAOBRLDK9Z1vILo3OXygzZBYLvEfxcgSKb?=
 =?us-ascii?Q?lGOsIa9+BX9LrN9AlCllmym48lJykV3TlJorFtkp1qXl+3RRkJHJziD9dPic?=
 =?us-ascii?Q?3R8BShTYAfoNpQL4rDel7pQXgx0nVfY8O8egWeWgv6RpdtB/8BiGd0VooXXz?=
 =?us-ascii?Q?kKopJMvE1M3jH5IM08AQ0qrMJQkf5d0zpQtLGtVsJ71NI2nBiQuxERYhrRKG?=
 =?us-ascii?Q?UyEgHIRLOctpu3vvcRXWOxppDL/isHW+FhVm11ZsreW5EcM9npaxcBO0vkvd?=
 =?us-ascii?Q?qn6EKdiatRVNza+LjOjpyoIsMUqo/FAyFC8ZByUgBKTmrrW0CEwm7aQPgGpq?=
 =?us-ascii?Q?Krh+rkZhBVv6uD/UKOvMBnEYJg5t+HyPWGW8S0NNpYd33x/DyU3WongL6FLu?=
 =?us-ascii?Q?sh8Um+eIOTY4h2b1DYOhc7pcNPm20238PBC0T2cSPJmzN+qEVABgjjKRJjLJ?=
 =?us-ascii?Q?dj8bsisJ2LH1ZXX6nY8xTexI/WxElieiAUNzmCf0k+hRacKKq1hRe/Hy83Uj?=
 =?us-ascii?Q?YkoDGUjdzayk/flrZc/TJ6/n5hw9WuVeBgoyN11DafcYXvsPrTQb37ZGuwm8?=
 =?us-ascii?Q?qum0p9iWOqyzUJTsBYyi8y5rSSEmJYhFUk/5yFyirHQ+pvt6J1PDfu8eXFoV?=
 =?us-ascii?Q?7c4GENnK+K71NC3oxs5CtyBNplAMqQUCgbOmaJqy+UutHPyztp0GP+CHh4tC?=
 =?us-ascii?Q?aLYvXWpxv5TzqgoZ3x3SE4Pyniwa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsKq+42O5thk5yl3zq+g/r1k84jKApNvGhKDIyFRI+A1ufU+tSzAK6n3rrgx?=
 =?us-ascii?Q?WwlM6Eq5DaTrvUfdcdK5RJhmVbZx6F+gjqxfFRhwckfcFWvwS7kjlkrqvTQW?=
 =?us-ascii?Q?vgzO5lYJJ/5l9DIbFHYsNApwLk5L64pGDfXfT5TKTZ20z49ADhMQGAQiCt76?=
 =?us-ascii?Q?Vm3GCfAvHtAJ0qDGCnTcPh24dHHlhB8tUC4UgVxsjRszcKAuVCPTDphXesgk?=
 =?us-ascii?Q?H0K4qKWyTFjBGz6FssxU+hYZwdarOb9328vmIuq9T5eSim6pWnFnH92UJGH4?=
 =?us-ascii?Q?RrfuqLy/ADIMQXMD8SyZdaRu9ty9LNWiO9V/hEe57pT/GB/AxyYDXXyLiwoo?=
 =?us-ascii?Q?w5xrm+LtjVvE2UCl6s4fGiXWhtbA0n6MLtAWu1hGhpiUTl83k/bnr1f+VlHV?=
 =?us-ascii?Q?Pnvjr0T2EFASQorLD5AyhRV/GjUJ9XvNtrK2ya3eq32Q8uJQOfAm32cD04mg?=
 =?us-ascii?Q?x84Xnc1DSihG8gCSGv8kyzWughCC3OV74gdcRrwOR2B0Dwh49ksItmIcRHLp?=
 =?us-ascii?Q?cGsGKT0IQKLVkORS5hiOHEZhKi4F4Cpyp0WY61a7dmyvXL6NrhONiPOwRuen?=
 =?us-ascii?Q?3jlkdzsZkGSMuf7yRifCywuuVlm2Yo8qkUVsvMBe+wD2iz7Wd9F0USPCgw7s?=
 =?us-ascii?Q?/riarGjDtYTdUQK006blkJK1hZWUqZ8/5vdE26KKpiuIDoiRH3+dt9AffCNf?=
 =?us-ascii?Q?721PvE7D0+zrJAH9NLZwwm73kp7zUcbAeZJgxZ6cswoKiFjBqF8DixhKhAS6?=
 =?us-ascii?Q?eXujgGiPsXrw5wJIigH5Ij5uqIvbpZn9RV8bat80136ztFPU51cQRlv0YXd+?=
 =?us-ascii?Q?1Jz9J0ZLZDzTHujNqImLWIKstXcSa1SinqY0VihDuEOwiTgORI2RusXcFzVe?=
 =?us-ascii?Q?nxqKOYjeAd8QSBhWkO4sA+iidTO2SrTcsrMgDxqaSaT8mdAzPN2dM0gqzoiV?=
 =?us-ascii?Q?brBdgDL2dcHx1XrmoV1MspB48fbvWPSZvga7MqMkLrbNzg1hSCXo8zQ94foD?=
 =?us-ascii?Q?wgmuYeEv1s2mSQV37wGbeNDMqDdI3yTJ14oks/2OKeFf7+EPugkLgFYmTUNF?=
 =?us-ascii?Q?9IwGsmYmBzPJermXbrqUPHguBvD0V7d7jpaNFgUchmQd1WthV7lsxOadzb2Z?=
 =?us-ascii?Q?QXjBN9VK7QAB2HBitKgt+foLzmMu5kp8UvdPzhZSzvERwHrJrWfWw+1J1K/1?=
 =?us-ascii?Q?CztYScM0YtZbrKrdA5CT/0FQY9fmE3+/2yILFsHvCKGGL+gRpAxrpLu6zYgd?=
 =?us-ascii?Q?Us/H3kxFnWTykJalMf0j0zzcz53JHnwovltEULekhvyxc0jHJxr2FsorZ/3X?=
 =?us-ascii?Q?V0UoQmCNTWquMv7HbkdV+DgidvSs9dAWluI1/qaO/AAss87yTKOjHZ2CzH4w?=
 =?us-ascii?Q?76zHIebWJ97rssSz/C7rw6Qaaa9CSf3t7ffyjb9kTis/yZPW1Fx88VF2MKcv?=
 =?us-ascii?Q?GnEkQh4q8vpTiS89J1anUW/ND2ggxGZbfDPIQotCFt/LQmU5CI/s7ZlUdmpz?=
 =?us-ascii?Q?iZtwcs26iPe8ib/Pk6yhVpSBnBrsZjriCXNg+hDLg4XyWICJrKuPRI2wI/vf?=
 =?us-ascii?Q?cevDrMcJ0A2ifHdJBmDAdhv/yGVPHjw4SrI2Wa4aoSEKvJxFJq1/C34OfP9B?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246c1f56-637a-4c54-731a-08dd4022459f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 05:03:29.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB/pTLl4lVlKjuq1pdmNELl85A3ZdIC1zQQhfv28/IVvSZQFCTRyscMPbve/XaZociJBkIfgcQrzzUAbRDSsaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
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

On Tue, Jan 28, 2025 at 03:19:13PM -0800, Matthew Brost wrote:
> On Tue, Jan 28, 2025 at 05:21:44PM -0500, Oak Zeng wrote:
> > When a vm runs under fault mode, if scratch page is enabled, we need
> > to clear the scratch page mapping before vm_bind for the vm_bind
> > address range. Under fault mode, we depend on recoverable page fault
> > to establish mapping in page table. If scratch page is not cleared,
> > GPU access of address won't cause page fault because it always hits
> > the existing scratch page mapping.
> > 
> > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > immediate bind can overwrite the scratch page mapping.
> > 
> > So far only is xe2 and xe3 products are allowed to enable scratch page
> > under fault mode. On other platform we don't allow scratch page under
> > fault mode, so no need of such clearing.
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 690330352d4c..196d347c6ac0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -38,6 +38,7 @@
> >  #include "xe_trace_bo.h"
> >  #include "xe_wa.h"
> >  #include "xe_hmm.h"
> > +#include "i915_drv.h"
> >  
> >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> >  {
> > @@ -2917,6 +2918,34 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
> >  	return 0;
> >  }
> >  
> > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device *xe,
> > +					      struct xe_vm *vm, u32 bind_flags)
> > +{
> > +	if (!xe_vm_in_fault_mode(vm))
> > +		return false;
> > +
> > +	if (!xe_vm_has_scratch(vm))
> > +		return false;
> > +
> > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > +		return false;
> > +
> > +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) || IS_PANTHERLAKE(xe)))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static void __xe_vm_clear_scratch_pages(struct xe_device *xe, struct xe_vm *vm,
> > +					u64 start, u64 end)
> > +{
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	for_each_tile(tile, xe, id)
> > +		xe_pt_zap_range(tile, vm, start, end);
> > +}
> > +
> >  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> > @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
> >  		u16 pat_index = bind_ops[i].pat_index;
> >  
> > +		if (__xe_vm_needs_clear_scratch_pages(xe, vm, flags))
> > +			__xe_vm_clear_scratch_pages(xe, vm, addr, addr + range);
> 
> A few things...
> 
> - I believe this is only needed for bind user operations or internal MAP
>   GPU VMA operations.
> - I believe a TLB invalidation will be required.
> - I don't think calling zap PTEs range works here, given how the scratch
>   tables are set up (i.e., new PTEs need to be created pointing to an
>   invalid state).
> - This series appears to be untested based on the points above.
> 
> Therefore, instead of this series, I believe you will need to fully
> update the bind pipeline to process MAP GPU VMA operations here.
> 
> So roughly...
> 
> - Maybe include a bit in xe_vma_op_map that specifies "invalidate on
>   bind," set in vm_bind_ioctl_ops_create, since this will need to be
>   wired throughout the bind pipeline.
> - Don't validate backing memory in this case.
> - Ensure that xe_vma_ops_incr_pt_update_ops is called in this case for
>   MAP operations, forcing entry into the xe_pt.c backend.
> - Update xe_pt_stage_bind_walk with a variable that indicates clearing
>   the PTE. Instead of calling pte_encode_vma in xe_pt_stage_bind_entry,
>   set this variable for PT bind operations derived from MAP operations
>   that meet the "invalidate on bind" condition.

Ugh, typos / nonsense here. Let me try again.

"Update xe_pt_stage_bind_walk with a variable that indicates clearing
the PTE, set this for MAP ops that meet the 'invalidate on bind'
condition. When this variable is set, instead of calling pte_encode_vma
in xe_pt_stage_bind_entry, call a function which encodes an invalid
PTE."

Matt

> - Ensure needs_invalidation is set in struct xe_vm_pgtable_update_ops if
>   a MAP operation is included that meets the "invalidate on bind"
>   condition.
> - Set the VMA tile_invalidated in addition to tile_present for MAP
>   operations that meet the "invalidate on bind" condition.
> 
> I might be missing some implementation details mentioned above, but this
> should provide you with some direction.
> 
> Lastly, and perhaps most importantly, please test this using an IGT and
> include the results in the next post.
> 
> Matt
> 
> > +
> >  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> >  						  addr, range, op, flags,
> >  						  prefetch_region, pat_index);
> > -- 
> > 2.26.3
> > 
