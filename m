Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC6AEE020F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40310E114;
	Wed, 13 Sep 2023 22:05:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C5A10E114
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694642713; x=1726178713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ksyaWaoRZ3p2ZVqgJCwuABq/NZ5X+9+X8OvBEJ01SHI=;
 b=IvxOQuuF99PR7DpVOrAj98Ji1xMNG/Bbey49Z9+ao5CPpPnEA4UUph9O
 cz18wAaBluovGEDF2PopoHizCFEpivU9EWMdm+IdeBKwrrhVos0kK9J8n
 8c1Q/BBgktP8sSzQOCdzGF9JYTioXG2nKMP9p2F8mh8LTUMdxofzEp2UJ
 IxGt5rWK9gt83LBEn05IwQDU1BmidGkWgseR90SykjApjUX0A1tJlZib/
 tTHJsyU96F9cBSS+CEV0PUp6mfiRpv51w/raPbbZRikbc1EREVDZ2xYJs
 7uZk+nfRSgRlAN4Lm+pq1sswUormcqGPThZ7ToCh/QI8DEgiEth7HGJMK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358226849"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="358226849"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773642404"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773642404"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 15:04:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:04:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 15:04:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 15:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee3NAx6JQA5I7EIefZr5eOzHblKj6WhQwgjPslwsjPbkTx9S5FdHnS0bTAmXS7bsitBxo9hyB2kykuCt3xoQtVCosZhlroolDN7ayuN1Z429qk69pzR4aa3q0DhpUQP++NqX6a6Vr5ny8Vvo8lmN/WYH5M3x5ihi7n8z7Lg+F9WHIfg8tApIO61AIOqUy1oiA0QihomD6kR1i3dXnwYiceYh1uFlh3OcCKKOdChsU57b/+AszntmCbO/KuRbl2Tw9hcNjfJR++x+T8bzMMbOfGR7a52Cxgmy2rC71DgyqhsshyzD+LKIlEWjER0klOMhy9OxEco9p8Ou3KWbvog7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5RA3GcOWBA/fajF/HjMPXdgtS/dzRAKPEhsp7WMAOw=;
 b=R5+Y+W19Q0QbbNBP1z18fxyLnc01zc3iIYUyFi8K3AAbkjYesTgauxxzrxBNjDfIgDnaUnnu7XnXJfq2odJ9n5KyhNDr+Hv0QDDibHKQONJMUuyXyb72hnLvraul2lSV46DmgHCHl5PIfg75drsdhYi1v39OaU6EhSjr5qLn00QJtFIhgDwLyc397wrDq9tLMqMIslQ2P5/o28yANonVTFkPTSkOWvKn6vHWQc3hWJSoXXhloaYlMuHuXxTiiVkId7/SMf+gpO04HBo1+96agl8UsHrnZ4BgKO598h6nBFMT2aGW7dt4r6COF2LYGYb3zDcXJk+Etp1T2GAHISSKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Wed, 13 Sep
 2023 22:04:41 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 22:04:41 +0000
Date: Wed, 13 Sep 2023 15:04:33 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQIx8VKzO30XkBjS@nvishwa1-DESK>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-2-matthew.brost@intel.com>
 <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 714653b0-8d1e-4160-cfb3-08dbb4a56ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMEt3tzXw+D4oCmhjBrixTvWDXvW9x3U9/kWfE7r4O0DAkbF24+tZsAm7aqNFPM7jg0v8fycyfvAnzTb/FJ+VVNULuNsXC2S5wAvFl9JzB+EQv9nn/Xr+Q3LYhLUBy1EYfm0vdOXsg7CZVEyyLM1Jk4SbolEfECL9z5tOJnnNGcXqhTIFqg7iKlkvIAbNT0wGR1Vc4/+BsAbqUVfibC237j3sx/82xAt2EFp2x13eTZ5+mbvHZjdqLE8ZtOQ8IN66kxuFEHU566HkfXvjwjYPLrMFD7LRB3Q81SKR/PUoF6FcWDT+JNXfksvtAlDB1c6Jbjj373BBvR0Vzie/7vCLLH5VSGnVlCpGHtSRZPF7KWANLE2JOF2w50gS65wlNrP49FR4moWYjNttmY9JZs7Htt4Zo88M6vHd2LEvrxWemGwA/u2dpFOfhY5KyOKpzdaDTY7afJXSO3qJ49dC5rRY4WmxKyHEFJPwd00VqC4miYfQbXeLaiApUGudG7djWkJ0H1ORHVXlO9ENMerP+cOoB491J7vKty/lI3eKXDu0zQXuGCiMerqexwuwY6COznj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(376002)(396003)(39860400002)(136003)(186009)(451199024)(1800799009)(5660300002)(26005)(8936002)(8676002)(4326008)(6862004)(2906002)(86362001)(33716001)(82960400001)(44832011)(38100700002)(83380400001)(6506007)(6666004)(6486002)(66476007)(66946007)(6636002)(66556008)(478600001)(9686003)(41300700001)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6eLkokBBrf4K331kTldOzN1sva3Wyn5FCCaX1dbnev4a1qJAzhVyYUGP6Mx?=
 =?us-ascii?Q?pcyMMVuzrf73h+LYguXpj2ITi2pSvTfDSgNT5EE08DO80Z2H5RjmvmWPaPFv?=
 =?us-ascii?Q?V1e0GCsrf9AMYXPkVwNQEqXb3jlVefuQ7MTgQoxuhD63XSG1IHjpKTLLsTBg?=
 =?us-ascii?Q?5jyzlY5DEJHRox949MO8FEXSBrfyn9IP9Ybbtmx5K1+i2GgvSLNiogVajVtR?=
 =?us-ascii?Q?jNB4N2BMuBplQwIC/p8PLVJ3Oihk4HwdlySD6jDVrEZf1X/+K6C1PQbcr0go?=
 =?us-ascii?Q?fVUNdJ6DOwnpTfZOIjkAp4pPbU06PVyfzW0aCCw691qzA/HIQ+mbuNiBwsEX?=
 =?us-ascii?Q?DnSQquaFbUC5FPS6MAa9eWlJozIUwlkdqleA2YLBeg0lecSGWNoxnjJdlZeq?=
 =?us-ascii?Q?o1PNMekS1C4su5ExbIdMCUGU6ds29U+w9IjOMK0XXwauyJJ3R46Gyc5n1qxb?=
 =?us-ascii?Q?BuK57WqeaHzqk1eSWeKRd9w7NDp2xOYUAdPUWZ8MYEGpN4E6cOlR7QQVu+ST?=
 =?us-ascii?Q?egeKQD4JSMzh3tPHs9BuybvrYXJrXsObwdgy2xdTUtJmTGptHWvpGdXMjztS?=
 =?us-ascii?Q?5aMsPI7QB8A5A2LH55qgc2aRIsBX2hGiY8NQWE5v1FuLnwiswDdcWz/5XViB?=
 =?us-ascii?Q?7xscxfJe2Ri0u6NKskaey5OQbkLflkTb6WryuXgYTf5ZOFHIkwX3AGTZGz1Q?=
 =?us-ascii?Q?SW8ZelCYNf16XkshqoyGEBYss/peDg2mwS7lX9G0MYEUoK3fRkSBCEPux5oJ?=
 =?us-ascii?Q?GjmqGdi8oRq/SoIHNMRF3YPkE7xLhg706yizdK7ys6UZgByKDu/9Kyi9T9BR?=
 =?us-ascii?Q?+uvl6OUdukLfIMPc/z3daylgpPtLUIgo1CMO45McdkKB5uWLyV56selTpYi/?=
 =?us-ascii?Q?lBwyt3GlaRHcMOEXxVpUHMOCVVoxsqRq84psL4vp2fylA2tnvsYYvM9PB+I/?=
 =?us-ascii?Q?YhQxiiLZHs6spyseEhNoAyVEftQ+8FNCkT7XXgo3w1tEKbgfYCXWCxWutqW/?=
 =?us-ascii?Q?PnmRc7r55AIPwsLSF2jdMrjd2NQoOxB+cxpCrCqYJaJNymZmmPNYKsF2YWOH?=
 =?us-ascii?Q?qLd9RoSHw9/zpCHmaGsxkZgmH+T0ZQx9MhBFFznBgo3fg/IzveU8NxDKIVHq?=
 =?us-ascii?Q?3JEiVziIS1t54qopoqJ8XsNiNExE4hr7290HEmkoeNHtH+uGlVcZDE3fCK91?=
 =?us-ascii?Q?mF201zIGWHWBdNVS3dHeGGdQEWXVoldMsUBAbHXwXJkE8rwzHU7M3Kdvsmcr?=
 =?us-ascii?Q?OZ9GPYAWBocpo2E5H230olAWcgfMiuzPfljPwIH+fBiVQZxxy2+SXeiLgCaF?=
 =?us-ascii?Q?9DdGrxWYyl/5AYGq5DUWInlme65BxVnaXJitxxMRpFraRi22aimb0t6Q+Vt8?=
 =?us-ascii?Q?cMtT26jcPLbRYdnmAc19kVsEbq8ssMFpz0SZa6Ux70JCMOJgtg1gnjI4Uovp?=
 =?us-ascii?Q?r9DZpdW0QObayNIuh91soeF19X8EfyZVCkpu5LmrkxvJhiQSWXh9MQtyKlap?=
 =?us-ascii?Q?v2020js+9oyDfrye2s9ObTptzmXxcdBoYcbjWnobDtg7Q7X8xqBO8/w8punB?=
 =?us-ascii?Q?b95SarV2xtEX6aBx5TeIUVQGE2WcYqfHFDmlxrE5m7MMME3xzawNz45mPFV2?=
 =?us-ascii?Q?OG1Th0a/RN6m1FlAfHhhuOQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 714653b0-8d1e-4160-cfb3-08dbb4a56ddd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:04:41.0197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC2omVe0blpQBJQkC+nI2QA2ajhdyTGJPzcE9OUyYvSuxweVOWldmlClhnQSaZqbLi8ge4i1sWkPHowJtP0mkY71lUtaFwxXb4p4ORDkofsYVWXYLQkz9CSv8egHGSNk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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

On Wed, Sep 13, 2023 at 02:34:04PM -0700, Niranjana Vishwanathapura wrote:
>On Tue, Sep 12, 2023 at 04:51:58PM -0700, Matthew Brost wrote:
>>We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
>>uAPI, deprecate the implementation first by making
>>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP.
>>
>
>So, only make it creation time parameter, right?
>May be mention that in the commit text here?

I meant fix it at creation time based on whether VM is in compute mode.

>
>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
>>drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
>>2 files changed, 16 insertions(+), 47 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index 6725157d8c1d..ac392bcf7bc8 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>>static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
>>				       u64 value, bool create)
>>{
>>-	if (XE_IOCTL_DBG(xe, !create))
>>-		return -EINVAL;
>>-
>>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>>-		return -EINVAL;
>>-
>>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
>>-		return -EINVAL;
>>-
>>-	if (value) {
>>-		struct xe_vm *vm = q->vm;
>>-		int err;
>>-
>>-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>>-			return -EOPNOTSUPP;
>>-
>>-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
>>-			return -EOPNOTSUPP;
>>-
>>-		if (XE_IOCTL_DBG(xe, q->width != 1))
>>-			return -EINVAL;
>>-
>>-		q->compute.context = dma_fence_context_alloc(1);
>>-		spin_lock_init(&q->compute.lock);
>>-
>>-		err = xe_vm_add_compute_exec_queue(vm, q);
>>-		if (XE_IOCTL_DBG(xe, err))
>>-			return err;
>>-
>>-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
>>-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>>-	}
>>-
>>	return 0;
>>}
>>
>>@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
>>	if (XE_IOCTL_DBG(xe, !create))
>>		return -EINVAL;
>>
>>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>>+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
>>		return -EINVAL;
>>
>>	if (value)
>>@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>		xe_vm_put(vm);
>>		if (IS_ERR(q))
>>			return PTR_ERR(q);
>>+
>>+		if (xe_vm_in_compute_mode(vm)) {
>>+			q->compute.context = dma_fence_context_alloc(1);
>>+			spin_lock_init(&q->compute.lock);
>>+
>>+			err = xe_vm_add_compute_exec_queue(vm, q);
>>+			if (XE_IOCTL_DBG(xe, err))
>>+				goto put_exec_queue;
>
>Don't we need the below checks here?
>
>if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>       return -EOPNOTSUPP;
>
>if (XE_IOCTL_DBG(xe, q->width != 1))
>       return -EINVAL;
>
>>+		}
>>	}
>>
>>	if (args->extensions) {
>>		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
>>		if (XE_IOCTL_DBG(xe, err))
>>-			goto put_exec_queue;
>>-	}
>>-
>>-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
>>-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
>>-		err = -EOPNOTSUPP;
>>-		goto put_exec_queue;
>>+			goto kill_exec_queue;
>>	}
>>
>>	q->persistent.xef = xef;
>>@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>>	mutex_unlock(&xef->exec_queue.lock);
>>	if (err)
>>-		goto put_exec_queue;
>>+		goto kill_exec_queue;
>>
>>	args->exec_queue_id = id;
>>
>>	return 0;
>>
>>-put_exec_queue:
>>+kill_exec_queue:
>>	xe_exec_queue_kill(q);
>>+put_exec_queue:
>>	xe_exec_queue_put(q);
>
>Not directly related to this patch, but now that I am looking at it, probably
>the function exec_queue_kill_compute() should be renamed to
>xe_vm_remove_compute_exec_queue() and move it to xe_vm.c?
>
>Niranjana
>
>>	return err;
>>}
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>index 347d28442701..f73b9e80b25a 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>@@ -60,12 +60,10 @@ struct xe_exec_queue {
>>#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
>>/* queue keeps running pending jobs after destroy ioctl */
>>#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
>>-/* queue for use with compute VMs */
>>-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
>>/* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
>>-#define EXEC_QUEUE_FLAG_VM			BIT(5)
>>+#define EXEC_QUEUE_FLAG_VM			BIT(4)
>>/* child of VM queue for multi-tile VM jobs */
>>-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
>>+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>>
>>	/**
>>	 * @flags: flags for this exec queue, should statically setup aside from ban
>>-- 
>>2.34.1
>>
