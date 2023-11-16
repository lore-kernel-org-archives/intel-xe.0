Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67154C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0758210E68F;
	Thu, 16 Nov 2023 19:45:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DA410E68F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700163948; x=1731699948;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RgjGb6QRGtWFLJbdydGfwOl0Ih9X78aHs70OgGCYmFo=;
 b=lneTbv65vKIhCp0+OsDUM7MXL0TvhwUBToUyAJ+E89CQTfyyxq1xClam
 2vZhdNwqvjrecI45HAqPqIFm7JXF9612LcfUYcXC9TM4I2p3InZkT4geI
 BjiSXnjEbYp83GCIZmPeUypLAuXrYI9nAKW6trufHktJ8Ac6AozBhqnjq
 BuMJqZJsDVybkZbS+OC80p70soo5NrnGnda1SIgATozgu1WgM3TBumr6+
 Xa1hgtmJtg2eGy+eLyish6nbN6GMjS6pJnh7zSLmCC9MLEzSi6xtOAmlY
 ake0FIdp2CqH8Ce9Eldzqb89h/pHdTu/EPpi4ukJ+RxR5w+9FPeLR5rQY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376213393"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="376213393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="794609863"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="794609863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 11:45:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:45:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:45:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 11:45:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 11:45:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATSpPsC9VEt+EN4r/GPDUCQgKji9QkwIZgByvGbpwpd03o00D2crcaYeXSt3ZII0eHhm1RI5D/lqqClghPhy7MoO5cLDgVDl+Hzj3wG1187SyWYr5OI/j9GYZoZzL74s6pIMPFb+ihnK0XgzEwyAUt/IDAPpYQGQYL2k69ZGYcMwx77RAN0N9FTiDN5fNFy6iAkPTrSuzGEGzxYBjFnMHC3fH1LR/uRtUV8C+vd1Ak+vl9gb71gdc3o2hxB/hvBi066nKuyhP0xy1KGAs5GCTP6UoqXXAjs91nmbv/W0BSX669OiUYt31su5U8oSxjEiK7oGsJNsH8ZcfMExPD04bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brF4XnSs8SQSRjhHWKeEhNHCJ2NSgJqFMSB7Zsk7khQ=;
 b=CxBT6R8HKrxSvcVjNeuI+U0G2ha7xDOYsqWLmLu24xYOlqKGuHOkQ7KHePxqU0Y33aNh5nVHgU1DwvZ8jVBE4wo8kTTvYaDQYK5iWIg/4g8GGxPHw5y9+l7nZbioVIsmJn69KX+mxTmSLdcUuWawE0ovI9qMF3UOyBitXhfR3hAKlGOho1oznQ5PPPAV/EYNozMA+U3pX0JrnDYOQgatuj7Qg46/Fkf8SgAPV27875vMWZy9HS/xOANNVUZyfuXgvcntl2A1PXpf+x4ticjlr/9ZU4ak93A7VnjcP9zvVaeA2l+7mJAaunOLjH+o00KSnQENq1+HC8P354GoRjlb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 19:45:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 19:45:43 +0000
Date: Thu, 16 Nov 2023 12:44:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZVYOyewCBF9TmYl+@DUT025-TGLU.fm.intel.com>
References: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca01364-50ff-4aa8-f2f8-08dbe6dc9ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLzyM7KEgK2Eu8QIDjNNvLFLb4gaLS9krY9xg61kEXjIGkn7zGL3kZ760KWLE6plicbk3V40zFPTXZ+CO3oSY7H8kCRxqJhsfqSwIAQgUnVEhHSd7moFKuDLyiU6xqiItQyeNfSvGRMTbv5hiqhzroaMCDPilcANBFU2E3D0IcRPOIc4t89BpLgPI5qhLe6BL7GfbtIGb8RCq1vYRlIYpovxRQnyhuDn1qPSNKkZWCJRBNYrzuCLdAU8tvofaS1M1IqwrxNmegFPMvVCTasrPWEWJSSIJfOws3ztvAI2D++K1OQJkEjZJPXn9PimNKPHJl7mNmmzbN8a+L0AMc0vDjcAGndQd9zvT6y3ya4SIzWsOn3sYdo0DS75IJll1MpBmHPEAeruGD8o+k6iaybD2nTP1Cb63E5gnMhSmQ7gNZT+NlQ21HTFn0gnYI2RfplGhIYQsZTGDiu4GH6ayNUGP+WOsaSN7O4mK672YIM8dUNez/cZIK6jz7r/Q1jnuFRDczEEOwAOClJ+2PcU7dxFs24gO4sPK8CiTHPbCOhx36e+r1dVBVQ1jqyhBkZlyxZj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(6506007)(6486002)(54906003)(6916009)(86362001)(316002)(66946007)(478600001)(6666004)(66556008)(66476007)(83380400001)(6512007)(82960400001)(44832011)(66574015)(26005)(2906002)(30864003)(5660300002)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gb7o8ljfSEoStG7mlyaDOAZAhOglemU2HX6qZK0Zykdl52avA151ouP7W6?=
 =?iso-8859-1?Q?wjzXD1KRwq6gPvSvC3+ct+1c5vClroPOSOnm1E9FTfLOoQaB0GWbZDbQN0?=
 =?iso-8859-1?Q?18bxCJuZC+fkza0WtgAU2O/R8lCRhVBQqai3i0QZUEfegBCovy8pDcK3qU?=
 =?iso-8859-1?Q?am56jlqIz29HdmzeZ6gjq/15066ySkja+Vi2LRr+KJFSviGjSrseFH1NTi?=
 =?iso-8859-1?Q?CDgXA+oxSJ0lCLWfzUqHahz2F/YRYirSDz/HJuCm7gLi+dbwAcicA32pmJ?=
 =?iso-8859-1?Q?Evqjp+HudA2f8zrY5KLzcJWYZRvQsWfYldD8s7FI/+Bxgr2wbpuxlIOrUN?=
 =?iso-8859-1?Q?lM7TCmKoZHynGV3zc4qT83fK9ofkff2QdoeZUKRL8Nke+DXXWBHmtyV9nf?=
 =?iso-8859-1?Q?wlzk/dwWeYnS0upA1Vk9/vd0xDsc/qE58D6SHHP2P24UGoG383mSRWyrur?=
 =?iso-8859-1?Q?kH/T7qjW5OXpuQDiclh1H8jTnki/l79oR8SPCaexnUWYruDsxG8c4g6ri4?=
 =?iso-8859-1?Q?z/H7zPqwF3EDnDOxUFFQjYjGat7Orm2qFXJIKfuvTfwl84iYJXQmJ6juiJ?=
 =?iso-8859-1?Q?fH08NWWYinzIMHoa+h9IH1bKQ+VTkhlF3Opm01lqQaijb/cj7EYHLhxHzz?=
 =?iso-8859-1?Q?kTBndCSQh1vwOb569WOnoSR+pqoLMznXJPg7ACDSM7+Y+Az0n8kDUBM82o?=
 =?iso-8859-1?Q?nDOi1hz39MU9u7TDxYhd5359qqTWCPsZay/zRMLcnROm1093pU7CI8Mz/w?=
 =?iso-8859-1?Q?2Vk//iNYwjQdDjvKXcCKPThvbo4ZMys+uRVu+RzOZx0UociouuLbnMSkA1?=
 =?iso-8859-1?Q?jew+w68E4xQQnWwy7B25K8pNtw9sHjTp6ixTA85R9qScTzGx6dm7yQLWA6?=
 =?iso-8859-1?Q?SqeOrW8RfiH5LhCPDdTXXVWRObMYRjTZUVJ8k8lJQDLj8G5yKz35QAw1MA?=
 =?iso-8859-1?Q?LdvfZXoom8aB1EVprJdH6HX7ZkTfkonIMKlc19Y6a98wrAa0zDSsjjfONt?=
 =?iso-8859-1?Q?+ci+PoEKr4HbgVrOdffYd2owv1TisET6yayVlGt33klscuLBzcwPio/Upa?=
 =?iso-8859-1?Q?/ts5HaLCiFru4GwDKHi4h0WCXZo2xXIqtV3jk/zC0+6wrYUSqo783enkNI?=
 =?iso-8859-1?Q?VR7KMpvy0LJA8D5P43ue+FdWMPu3WiYb1NNfeJcDB0aF4jvCv2xPdVwSgP?=
 =?iso-8859-1?Q?1yE5M9e5ybRwY1scVLDoLYR+UWcfWJMZ9Xw/tCgNSGD4p58OYWUkoswPmm?=
 =?iso-8859-1?Q?tMz7WX6j8azu/JOmyf/91z4HyvbJ84wjvivk4OeRqH6SUSOVWONuUx3sZC?=
 =?iso-8859-1?Q?a0gKEvDFFN04k9hVyYOUjs/CaJGoBHs+pSKNpYpwVg6p6+GE46PLedRsDT?=
 =?iso-8859-1?Q?joxWaULthliORaI6qZMoVzBr146sO2ZCOOLn8Nmbb3iSvGm5R0VZbvE8lY?=
 =?iso-8859-1?Q?30nc0Z/BgD7RR9u4p98uaioYrrPZBDAlNiN+dQnENFYqWErFdr2Ap4yWMq?=
 =?iso-8859-1?Q?fteX2xgdnJJBmkn/dNCeqQldaEELl7JtO9fZt2wailDuk5+r8PSJ7JszQQ?=
 =?iso-8859-1?Q?DdAg4pVOkIdezcNM/0DwpcSBBv/QTOy7jWLuiMHbvj3x2HgwxERQwaC5Xx?=
 =?iso-8859-1?Q?mH8E6UQ49ASQoGVmS+kCUeo6nraMOsSBR6uk9nxVXAogCCysjv2v1NLA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca01364-50ff-4aa8-f2f8-08dbe6dc9ea1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 19:45:43.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3f6MiTDK8mCk4p6ZTO8JUw1RD9kEcawvJV4OcYSDH95XWcjaX2XtCMldGyorvGnHY7Y5nuIHyetV5KTwCdx4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/vm,
 drm/xe/uapi: Use LR abbrev for long-running vms
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 02:59:13PM +0100, Thomas Hellström wrote:
> Currently we're using "compute mode" for long running VMs using
> using preempt-fences for memory management, and "fault mode" for long
> running VMs using page faults. Internally the driver uses "no_dma_fences"
> for long-running vms which is a bit misleading since dma-fences are only
> disallowed as out-fences.
> 
> Change this to use the terminology "long-running" abbreviated as LR for
> long-running VMs. These VMs can then either be in preempt-fence mode or
> fault mode. The user can force fault mode at creation time, but otherwise
> the driver can choose to use fault- or preempt-fence mode for long-running
> vms depending on the device capabilities. Initially unless fault-mode is
> specified, the driver uses preempt-fence mode.
> 

LGTM. We will need an IGT change for xe_exec_fault_mode I believe.

With that:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c       | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++----
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c         |  6 +++---
>  drivers/gpu/drm/xe/xe_sched_job.c  |  2 +-
>  drivers/gpu/drm/xe/xe_sync.c       |  6 +++---
>  drivers/gpu/drm/xe/xe_vm.c         | 24 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm.h         | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
>  include/uapi/drm/xe_drm.h          |  2 +-
>  10 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 28e84a0bbeb0..347239f28170 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -100,7 +100,7 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
>  	LIST_HEAD(dups);
>  	int err = 0;
>  
> -	if (xe_vm_no_dma_fences(vm))
> +	if (xe_vm_in_lr_mode(vm))
>  		return 0;
>  
>  	/*
> @@ -182,7 +182,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	for (i = 0; i < args->num_syncs; i++) {
>  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
>  					  &syncs_user[i], true,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_in_lr_mode(vm));
>  		if (err)
>  			goto err_syncs;
>  	}
> @@ -197,7 +197,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  retry:
> -	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
> +	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
>  		write_locked = true;
>  	} else {
> @@ -279,7 +279,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	/* Wait behind munmap style rebinds */
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (!xe_vm_in_lr_mode(vm)) {
>  		err = drm_sched_job_add_resv_dependencies(&job->drm,
>  							  &vm->resv,
>  							  DMA_RESV_USAGE_KERNEL);
> @@ -292,7 +292,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto err_put_job;
>  
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (!xe_vm_in_lr_mode(vm)) {
>  		err = down_read_interruptible(&vm->userptr.notifier_lock);
>  		if (err)
>  			goto err_put_job;
> @@ -307,7 +307,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	 * the job and let the DRM scheduler / backend clean up the job.
>  	 */
>  	xe_sched_job_arm(job);
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (!xe_vm_in_lr_mode(vm)) {
>  		/* Block userptr invalidations / BO eviction */
>  		dma_resv_add_fence(&vm->resv,
>  				   &job->drm.s_fence->finished,
> @@ -330,14 +330,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_push(job);
>  	xe_vm_reactivate_rebind(vm);
>  
> -	if (!err && !xe_vm_no_dma_fences(vm)) {
> +	if (!err && !xe_vm_in_lr_mode(vm)) {
>  		spin_lock(&xe->ttm.lru_lock);
>  		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
>  err_repin:
> -	if (!xe_vm_no_dma_fences(vm))
> +	if (!xe_vm_in_lr_mode(vm))
>  		up_read(&vm->userptr.notifier_lock);
>  err_put_job:
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 4fd44a9203e4..ac77d2a7b45f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -327,7 +327,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
>  	if (XE_IOCTL_DBG(xe, !create))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> +	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
>  		return -EINVAL;
>  
>  	if (value)
> @@ -705,14 +705,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe,
> -					 xe_vm_no_dma_fences(vm) ? 0 :
> +					 xe_vm_in_lr_mode(vm) ? 0 :
>  					 EXEC_QUEUE_FLAG_PERSISTENT);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
>  		if (IS_ERR(q))
>  			return PTR_ERR(q);
>  
> -		if (xe_vm_in_compute_mode(vm)) {
> +		if (xe_vm_in_preempt_fence_mode(vm)) {
>  			q->compute.context = dma_fence_context_alloc(1);
>  			spin_lock_init(&q->compute.lock);
>  
> @@ -785,7 +785,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>   */
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
>  {
> -	return q->vm && xe_vm_no_dma_fences(q->vm) &&
> +	return q->vm && xe_vm_in_lr_mode(q->vm) &&
>  		!(q->flags & EXEC_QUEUE_FLAG_VM);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 870dc5c532fa..ee797fa2a774 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1161,7 +1161,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	ge->q = q;
>  	init_waitqueue_head(&ge->suspend_wait);
>  
> -	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> +	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  q->hwe->eclass->sched_props.job_timeout_ms;
>  	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>  			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 31afab617b4e..9277541ea048 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1292,8 +1292,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  	 * non-faulting LR, in particular on user-space batch buffer chaining,
>  	 * it needs to be done here.
>  	 */
> -	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
> -	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
> +	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
> +	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_preempt_fence_mode(vm))) {
>  		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>  		if (!ifence)
>  			return ERR_PTR(-ENOMEM);
> @@ -1355,7 +1355,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  			xe_bo_put_commit(&deferred);
>  		}
>  		if (!rebind && last_munmap_rebind &&
> -		    xe_vm_in_compute_mode(vm))
> +		    xe_vm_in_preempt_fence_mode(vm))
>  			xe_vm_queue_rebind_worker(vm);
>  	} else {
>  		kfree(rfence);
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index adbd82f8744e..b467d5bfa4ac 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -92,7 +92,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	/* Migration and kernel engines have their own locking */
>  	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
>  		lockdep_assert_held(&q->vm->lock);
> -		if (!xe_vm_no_dma_fences(q->vm))
> +		if (!xe_vm_in_lr_mode(q->vm))
>  			xe_vm_assert_held(q->vm);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 73ef259aa387..5874a3c50a97 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  			struct xe_sync_entry *sync,
>  			struct drm_xe_sync __user *sync_user,
> -			bool exec, bool no_dma_fences)
> +			bool exec, bool in_lr_mode)
>  {
>  	struct drm_xe_sync sync_in;
>  	int err;
> @@ -118,7 +118,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>  	case DRM_XE_SYNC_SYNCOBJ:
> -		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
> +		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
>  			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
> @@ -136,7 +136,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		break;
>  
>  	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
> -		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
> +		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
>  			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d26c90f0d702..dae35dbb7955 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -335,7 +335,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	int err;
>  	bool wait;
>  
> -	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  
>  	down_write(&vm->lock);
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> @@ -389,7 +389,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   */
>  void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  {
> -	if (!xe_vm_in_compute_mode(vm))
> +	if (!xe_vm_in_preempt_fence_mode(vm))
>  		return;
>  
>  	down_write(&vm->lock);
> @@ -592,7 +592,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	long wait;
>  	int __maybe_unused tries = 0;
>  
> -	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  	trace_xe_vm_rebind_worker_enter(vm);
>  
>  	down_write(&vm->lock);
> @@ -836,7 +836,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  	struct xe_vma *vma, *next;
>  
>  	lockdep_assert_held(&vm->lock);
> -	if (xe_vm_no_dma_fences(vm) && !rebind_worker)
> +	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
>  		return NULL;
>  
>  	xe_vm_assert_held(vm);
> @@ -1409,9 +1409,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		vm->batch_invalidate_tlb = true;
>  	}
>  
> -	if (flags & XE_VM_FLAG_COMPUTE_MODE) {
> +	if (flags & XE_VM_FLAG_LR_MODE) {
>  		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
> -		vm->flags |= XE_VM_FLAG_COMPUTE_MODE;
> +		vm->flags |= XE_VM_FLAG_LR_MODE;
>  		vm->batch_invalidate_tlb = false;
>  	}
>  
> @@ -1514,7 +1514,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	xe_assert(xe, !vm->preempt.num_exec_queues);
>  
>  	xe_vm_close(vm);
> -	if (xe_vm_in_compute_mode(vm))
> +	if (xe_vm_in_preempt_fence_mode(vm))
>  		flush_work(&vm->preempt.rebind_work);
>  
>  	down_write(&vm->lock);
> @@ -1919,7 +1919,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  }
>  
>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
> -				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
> +				    DRM_XE_VM_CREATE_LR_MODE | \
>  				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
>  				    DRM_XE_VM_CREATE_FAULT_MODE)
>  
> @@ -1955,7 +1955,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
> +	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_LR_MODE) &&
>  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>  		return -EINVAL;
>  
> @@ -1972,8 +1972,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  
>  	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> -	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
> -		flags |= XE_VM_FLAG_COMPUTE_MODE;
> +	if (args->flags & DRM_XE_VM_CREATE_LR_MODE)
> +		flags |= XE_VM_FLAG_LR_MODE;
>  	if (args->flags & DRM_XE_VM_CREATE_ASYNC_DEFAULT)
>  		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
>  	if (args->flags & DRM_XE_VM_CREATE_FAULT_MODE)
> @@ -3087,7 +3087,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>  					  &syncs_user[num_syncs], false,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_in_lr_mode(vm));
>  		if (err)
>  			goto free_syncs;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b08c75fbd8a1..9a0ae19c47b7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -152,19 +152,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
> -static inline bool xe_vm_in_compute_mode(struct xe_vm *vm)
> +static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
>  {
> -	return vm->flags & XE_VM_FLAG_COMPUTE_MODE;
> +	return vm->flags & XE_VM_FLAG_FAULT_MODE;
>  }
>  
> -static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> +static inline bool xe_vm_in_lr_mode(struct xe_vm *vm)
>  {
> -	return vm->flags & XE_VM_FLAG_FAULT_MODE;
> +	return vm->flags & XE_VM_FLAG_LR_MODE;
>  }
>  
> -static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
> +static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
>  {
> -	return xe_vm_in_compute_mode(vm) || xe_vm_in_fault_mode(vm);
> +	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
>  }
>  
>  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
> @@ -186,7 +186,7 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>  
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>  {
> -	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>  }
>  
> @@ -201,7 +201,7 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>   */
>  static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  {
> -	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
> +	if (xe_vm_in_preempt_fence_mode(vm) && vm->preempt.rebind_deactivated) {
>  		vm->preempt.rebind_deactivated = false;
>  		xe_vm_queue_rebind_worker(vm);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index aaf0c7101019..f23e8f462eff 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -161,7 +161,7 @@ struct xe_vm {
>  	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
>  	 */
>  #define XE_VM_FLAG_64K			BIT(0)
> -#define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
> +#define XE_VM_FLAG_LR_MODE		BIT(1)
>  #define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
>  #define XE_VM_FLAG_MIGRATION		BIT(3)
>  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9bd7092a7ea4..1c574dd3bed9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -596,7 +596,7 @@ struct drm_xe_vm_create {
>  	__u64 extensions;
>  
>  #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
> -#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
> +#define DRM_XE_VM_CREATE_LR_MODE	(0x1 << 1)
>  #define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
>  #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
>  	/** @flags: Flags */
> -- 
> 2.41.0
> 
