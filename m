Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD47C76195
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 06:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAEB10E4D2;
	Fri, 24 Mar 2023 06:10:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D7D10E4D2
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 06:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679638231; x=1711174231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MMkN0Fp5Fn4zYljxlVlboeUGXHYBkVL4RW0CGM6FCEE=;
 b=ZWCZKRb/1rlykHmOPCkpaBL4RSv3uFD9UKjjxjAXe1vdNWHPp36SITa6
 VgjNc1AmgvA1ebkBcbQv5Ej756/xbNClhqSOcCxEv5k7Iy7Wl1UfBedP3
 pjkGbla/5qubLSUr94D9QJzIUaZTvkD5fxmn19fX8pHZnO0/ga2PBR7Aw
 GmVraoLkA8dMe2jO8f8MHnjT/YWJ2AULaNknZNZoZDjHMBv9DgPiteF+U
 LoqQNLpF3bHVzsOswzoNg8CZevY+JaJBKJfDjZToE/Anz6M2oRskt7wkx
 WK4CQnmQ7aQkBJKIRk/1XWnhKY11cJrw2VioO90ne+0WQBpA21gRkZZZZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="342090188"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="342090188"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 23:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659938601"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="659938601"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 23 Mar 2023 23:10:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 23:10:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 23:10:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 23:10:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 23:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu66bb5fb4WFzdEctM9q3bEa2NL/wFQgoDeGqaX21hk+kqVrRZqucFOepWJc2BElV/YTrvQBgBlIozBP57rDBoaxMRp/dsfhwx4i2DwcsGjvPpHkrP2/rGkfxtHbWK00Ksree2kqyiP2budXj0eso30uoqH3xoVXOdePjyedLt/OLur5S3n6N29R4LPUcoaPIFqAlMVqxbQ708tpK6vC3rtF0jtAap5omiy2fa6I7+9l49gJdotlT5emcEngK3Ph3rFvexibJ+snNLQgOudYq6uslFlHAEQdj/n0HZmmJQ4S51UmElfugYlc5hixnafXJKBKqmCaUTLG8pogDnG3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYUhdxhebMobsHi01g5KvQny4zGtiK0xQ+gxiZRm5Fg=;
 b=IXEp+tDaorqCtL563oeDGBhuAWrMb7bRlmB5tneAidfoVSOixDknRxN/tfz5DNJc9QU4AAY4DAgGLiWPwHi+NT05JFvYdwvbHKBnO2/9ZsVbQk+yc8xiIvvA3FIppDcwcheZhaFQzS1x5mh+LTDO3ngJYOWALoupydKNyjCFyNlJRrNmZ+zmX6+nH2VNQqQWtUkf+qu4UKEmK327d2bxANpvKc0icg9ETwhJxhvpegnQgAXAX2OpWdR8XVoF5XmzHf3ekYSDWq29Njvxf+SlfrF93OEZEqcRGr2xJunlG+a/cmOORbzmVOsi4G1o+v3Bf1fjOu6xI2MfwWJVzja9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BN9PR11MB5385.namprd11.prod.outlook.com (2603:10b6:408:11a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 06:10:20 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f%8]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 06:10:20 +0000
Date: Thu, 23 Mar 2023 23:10:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230321234217.692726-3-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BN9PR11MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d78f75a-2d41-4370-e2a7-08db2c2e723c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkAtwBy8oPjKRFxtqd2aMjn1WbRyJ955o+p2rPZkkgTF46tOG0blQ71Mrqg55av1+PDfI/VbZSJ9mQ8Y8MUVXl+1NqT3rS+tycBbo8rifijxiiMiLmgthNF15WlEdAsWtEfcm6VmpZZZnUcb0dEc4RLVloEpSqUw0lvGZKlp05AHZgHSEnPpxSyZ1+x5vH6DmwwHgrQjAk+Gdx6soM4IU2LcPbf4gYuyPPVjNE6ABMtaXVzCV1OwwkVsfgsSRjwqqii3gTMuniJ5MgWbYmrJAo4frB+ofqkr0Ns3QbWap5PeKrfa6OTFw0lFR5HaDHF9Dy2UP+zaETI7Mt2oIHJFuG78g4eCrLckbTNV7mfkSYM+PpdtF4xVvkRek6bS79hiFJaYNU95uPEuIH3apo3/lYmCB2TaWMr+oU5YvUVzSKnPriZjpK90wA3jSfIjU5VrlVB2my/VGIBIz8+sv5LDv/SBtzCKTgIGeZPke1b72/E+xWJb1mpGhjXeWk9rKm/5o/OAIaC8iN74zUKzhXNoVMeGLtFqx2yDIeDIRBH9vNLXK7agKY8JXCktd36NW8oeM7XJzMKPAt5HM8jHiHTZ6bY9qnjf+4UoIY7/9YC5XxF5T7jhQ8tKsvbIx9m4eZGeXfkk2yCm0ol1ykQVx3aKvfRT4AqCodJWSdLd3dM6O3sa+2z497A5Ggugv6xIpFz8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199018)(478600001)(8676002)(66556008)(66476007)(4326008)(66946007)(6636002)(41300700001)(5660300002)(82960400001)(8936002)(6666004)(6506007)(26005)(44832011)(6862004)(6512007)(9686003)(186003)(316002)(6486002)(83380400001)(33716001)(86362001)(38100700002)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7DK/rm0CJVzsuYYZg3/hxrX8XHere7CpMYc7EhlrQGhvZznIXRupeCXELWPn?=
 =?us-ascii?Q?X/A55e/ohdaCj1W+RI2hMuZBd21840/bX9d2gnBf19Q8aeLvwz6Pt2P76wDI?=
 =?us-ascii?Q?2b1FhzZPX/gMbBMQ2qWT6wchyHTXNv8YWSqBMWY/hQKEUn5JHfuzdrpE9Q3+?=
 =?us-ascii?Q?mF+kIeoyxkHAWuGjlsRqUz6cAYX7+nca/1aIJzOgNYMRZV/bxdhgLerwTphS?=
 =?us-ascii?Q?aOX8McYqHvPol/jfEVx594nc/TknFsx4E4RRWj4R/9bZQ6mONYnp2rUfnEtd?=
 =?us-ascii?Q?TeKjXVjJPR0FQvDkekkgEAmZPJadiS2EapYy4UKAQGj7Z5z1uElaNWQOwnp/?=
 =?us-ascii?Q?hNJe3FeinTXTOId1UahZKg0kGTkQabSYCg8qy2QwIu56DSb/4RQrWoPLil29?=
 =?us-ascii?Q?Ix7o91Jw78xNyULXy2iR1clnGn1RJL5/FeOyJJcZPo5ihIAFc/yiDSJ6ntH/?=
 =?us-ascii?Q?uiLOcKRMLq25UhnzqAbPGzL8hYLjYggA4P+10gJGy/i9Mx0QGkpT+iRgdJcr?=
 =?us-ascii?Q?WlFEmDxdsIlx4/Rv7EiV627pWQvS+17F7xO0evpdF/u1GXsdbSuKZJK/e3SF?=
 =?us-ascii?Q?CI50kzy/b/6LKYby53lR2iUPUPn223GHbqHKb2kVNANkP2W+3YhSYqRQs1yq?=
 =?us-ascii?Q?d6dgju+exKxWRtnXiIxjhJp6pZvAeuY6H4QFqqDYoHAHkMkFd6mQhNMbJw5Q?=
 =?us-ascii?Q?El5Yi2fD4ZzgaQlvGk0DmM7pQ6bVWcfurGzy2SvHBgLmZ/wq/BImOArMMctb?=
 =?us-ascii?Q?0DcekAX8GhDUpo7dNuhPvjbHtMRGAPxfavi1WjMqGz0RQpzFloPFiLKdBnPq?=
 =?us-ascii?Q?hvDXdaSgBkrf5P3DEPrKF1f7+WGBS2il8IMcue0MiVxcvpqZDidLTzPLRp+w?=
 =?us-ascii?Q?XAszPvVTsHUz8kVc3F/cW3WB9A/G0Mhj5vZY68jxb2JSyHyqVIcQDXyuulCx?=
 =?us-ascii?Q?m8I5nuqu4aLhDNpx5zWGogrpBlewJS29/nHv/+rxt+iisrC4pZigAJwPLtrE?=
 =?us-ascii?Q?NEGbsnglb2KtaNIxeNiM4W0DM1o/3MpMeQOMUj2VsjVLp0a3gPl9gxZe118g?=
 =?us-ascii?Q?vrPgCNECqpc1Gw98X5kI/C2hXIq45ssGGFtkYWZ53AjYRmr1nj82sgI8WT+D?=
 =?us-ascii?Q?fPDCDkYKejq6uEWT11+8Zmmk3Z7H29Vz3IwtP151jj66mFNYXFew9+RQhf5/?=
 =?us-ascii?Q?2VdJHyJ3mIJuiTpinr/33lBf+9k3I/RqjkY1ZG286yUYG+OqniMLGHZ4/h5V?=
 =?us-ascii?Q?x5CPfkfzxhuU0XDbjvL2YLvc9HLn3vY+xPENV36w4CHEE993gbrMD454qwOZ?=
 =?us-ascii?Q?HTIbCcNwCu5I5Di3lkzFj6cPYi7PdVGac4KMB9nFmuRD0zwuRGzloXbdEY+l?=
 =?us-ascii?Q?m8+LgNXePYCgpKTo9yTXUO1i21jX1QJ2QbYVWcbTWrXOSFX460XeTMeN7hzw?=
 =?us-ascii?Q?uBW6fauCeQBn6aSuXSoclqH/rmOZ68j7RX4SlcLOArPZlE3701JE4SZiQ3Sk?=
 =?us-ascii?Q?06tQ3gEJPrENyDlqw2w76CRt9u8JsGMWVOxBUb7yEAymqq/LelNpN7Wd8MiF?=
 =?us-ascii?Q?/NkJKeu7UTPojMs+Pn7RhoMejThpIvKJawBwcamDJszCoBSLg+2ksRRSO/sW?=
 =?us-ascii?Q?qnwRSHZxMDvCn4SZKdkC4y8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d78f75a-2d41-4370-e2a7-08db2c2e723c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 06:10:20.0705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtBluZFAuDGYvyvc4PRfxYqkoq4gDYbP1dEuwyWdpRyko2ggZKh080GbNaXXvN61hKmWQQ9qemD9tEzQT4mIw1ehDby12Lb3K3Z2ua+u5ZHPrQEYuec57X011Z4gB872
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5385
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Move in fault mode / non-fault
 mode check to xe_vm_create
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

On Tue, Mar 21, 2023 at 04:42:17PM -0700, Matthew Brost wrote:
>The check for fault mode / non-fault mode was in the VM create IOCTL
>before VM creation and not under a lock. The increment was after VM
>creation under the lock. This is racey. Move both the check and
>increment to xe_vm_create before actual creation and have the lock for
>both of these steps.
>
>Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 45 ++++++++++++++++++++++++--------------
> 1 file changed, 28 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index e7674612a57e..965cad81b02a 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1060,9 +1060,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 	struct xe_gt *gt;
> 	u8 id;
>
>+	err = mutex_lock_interruptible(&xe->usm.lock);
>+	if (err)
>+		return ERR_PTR(err);
>+	if (XE_IOCTL_ERR(xe, flags & XE_VM_FLAG_FAULT_MODE &&
>+			 xe_device_in_non_fault_mode(xe)) ||
>+	    XE_IOCTL_ERR(xe, !(flags & XE_VM_FLAG_MIGRATION) &&
>+			 xe_device_in_fault_mode(xe))) {

NIT...is below simplification any better?

bool fault_mode = !!(flags & XE_VM_FLAG_FAULT_MODE);
if (XE_IOCTL_ERR(xe, fault_mode != xe_device_in_fault_mode(xe))

>+		mutex_unlock(&xe->usm.lock);
>+		return ERR_PTR(-EINVAL);
>+	}
>+	if (flags & XE_VM_FLAG_FAULT_MODE)
>+		xe->usm.num_vm_in_fault_mode++;
>+	else if (!(flags & XE_VM_FLAG_MIGRATION))
>+		xe->usm.num_vm_in_non_fault_mode++;
>+	mutex_unlock(&xe->usm.lock);
>+
> 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
>-	if (!vm)
>-		return ERR_PTR(-ENOMEM);
>+	if (!vm) {
>+		err = -ENOMEM;
>+		goto err_usm;
>+	}
>
> 	vm->xe = xe;
> 	kref_init(&vm->refcount);
>@@ -1182,13 +1200,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 	if (number_gts > 1)
> 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>
>-	mutex_lock(&xe->usm.lock);
>-	if (flags & XE_VM_FLAG_FAULT_MODE)
>-		xe->usm.num_vm_in_fault_mode++;
>-	else if (!(flags & XE_VM_FLAG_MIGRATION))
>-		xe->usm.num_vm_in_non_fault_mode++;
>-	mutex_unlock(&xe->usm.lock);
>-
> 	trace_xe_vm_create(vm);
>
> 	return vm;
>@@ -1220,6 +1231,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 		xe_device_mem_access_put(xe);
> 		xe_pm_runtime_put(xe);
> 	}
>+err_usm:
>+	mutex_lock(&xe->usm.lock);
>+	if (flags & XE_VM_FLAG_FAULT_MODE)
>+		xe->usm.num_vm_in_fault_mode--;
>+	else if (!(flags & XE_VM_FLAG_MIGRATION))
>+		xe->usm.num_vm_in_non_fault_mode--;
>+	mutex_unlock(&xe->usm.lock);
>+

Perhaps put these counts increment/decrement blocks into functions
instead of duplicating them?

Niranjana

> 	return ERR_PTR(err);
> }
>
>@@ -1843,14 +1862,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> 		return -EINVAL;
>
>-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
>-			 xe_device_in_non_fault_mode(xe)))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
>-			 xe_device_in_fault_mode(xe)))
>-		return -EINVAL;
>-
> 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> 			 !xe->info.supports_usm))
> 		return -EINVAL;
>-- 
>2.34.1
>
