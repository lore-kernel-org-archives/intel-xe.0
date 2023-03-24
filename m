Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE92C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 06:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9C310E4A7;
	Fri, 24 Mar 2023 06:03:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341AB10E4A7
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679637798; x=1711173798;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BioQgm2v7zHRgmrjlgTS5YI8NUagrtM5hLV2/U6MRI0=;
 b=RXRt6JLYlQKnyJjyBEpnlTF2sGh3Y3HtiEIV8pNxWHRphcL0/HE6korb
 or/xPU1pkCG7Ij1mJ3iU7EASkQRz7OXg9AXmEMNH1OBFOws2hesuDCLPs
 D7KnJVvcavw2XrBEPzuM3Q0Z0RE2P3t9ZmtsKH2YxQVyMowoCXmBWuNF7
 +8Bdf/T7owQ6H/uo14U8cvIAHsCLF0yOYjHI+AnmV0XDPuzo5HwKmnqpY
 HQfM0tDH+MmCQR3gNT0+q5juPhqTAIm3zlKJ7c7MdjT8UysyGkcDo0t1S
 4bbxvBZY7e3Uw5EZzAG6rIecMb1DLABorAc5ywoGoLiM92KqphpIk/uzY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323572590"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="323572590"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 23:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826121421"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="826121421"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 23:03:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 23:03:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 23:03:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 23:03:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 23:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnxruRXDK5UbN8QFobEX++GrMBIXjHSFxeHm+Uupu3i6keoEbMeFIgbhqFGuCFMZ2zolEy5mRTAjeAD7xzAuRcOkfmtRoAvgIL41krwb7Ca/ROsd7OX7EDsLQvQEp0GuypLdkdHN0H6/dvA8lBFxgqNGHJ2wTp6UrVZ9wXW8ZuJXPKK7XY7W+rYKOIOLL0mnA7AGWfdfJxJ8E2yyj0czXeNaIEAmmvvZlYde4u6zx9wIn71YyJkc+SgdNEEzPKrjcm7sZ09MtB9X44UvfyiHYZtfHdAmaxvI3+X8QFfZVMEqstHSOFXoNg49oBoAM1YhAQruiIA+Sny4FXqAr+diBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh5PYrCiPEiUDwDYmBeWLcTD5k4ctg/uL8ZtuOQRUgI=;
 b=S8/LQ0UXhk1KG4R/Xc8XSavNrsek89DZXV1xfnwAiysLVWB/WdDkOCncZlvuRxTvj/fIHCb3/hg77bIYNRY4m+iuzx03dk/asq7mADbWGU+h5ftF9BbnJ8gkwFwvUyFoA1lp/vgayHeBGuJvH1fXOhp67eNZFLQ4x5t5IJeS/BthWxXeIhwwo9h5FdiVePjg6RWGEgFH3DqtVKInVlLPnizyncI626RRX+04FUIAGJrEfDMzA9L81GCfyrMUkQ7F8oRZ60FbMxrIGTqKKWUl7d0h/FWTywAAc8/HSSZWR8VF5ZIviaE4y3gJrwaeYBghE+nAmPGSFEJvaLaFz6RYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 06:03:15 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f%8]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 06:03:15 +0000
Date: Thu, 23 Mar 2023 23:03:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZB09F9ghaQFHLsNx@nvishwa1-DESK>
References: <20230321160815.673423-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230321160815.673423-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c97066-0c85-4a98-400b-08db2c2d74eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nk2vbve4IkCos9AKz+t1jFjEY+CYUVHmE1rjQdlFeLB7ACHMqwc1kGJQmCb2m4PJdG8NSoUP0bgRibERx/oHwoznYYVZL9y9cC9r7Soh/EHV5OzoLsCRmtgNB3qnkahT+U2s9B6tM7QB4200ShRHUvNk36uJ+5ieR77MDf2J1WeyTMJOAGDnz0PGku2XhhfzgS4qDgSM7tjf6VrPnf2Yp+B2CT79Sln/5FuNFt45dnpbzYme3YAKoJp2FV1rp4qqgUHVMXr2RzNhtn4j4Alu7+bEuqKHnMLb7eyFsAbAIfBGbrwSdNQhDKew0mtDAyvankBQQ5k9/U7Wx8JRk+6FiECAFICs19ofKutGsZKIAX2ET4EtxAIwBoxSm+lPlzxDO+VFRx3cssOpQ5c3uQ9pbapEXYgoiULRN4t7eXzDMkr7CKbRfxLloGCiFXfYwvxKwP+rsNxcswIDfk4C0SOErKjVqIeaY+dptATCxanDnc87y0dQudF6nwUM8u8OvtKfznEiQzSTQCzJNtzhM6niD/zt0n8elkyVPmfRj6CsTYo3cog1CV3MLGPoL8Z9EgVfRPmSWXIxoTdpKDH97K6kfiwEzSiabHVunCymtKG0LZc0Kjvce1swxiirP34oYEpr8eJSHebUBIZvlRyTYCPcdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199018)(86362001)(66556008)(82960400001)(38100700002)(41300700001)(44832011)(2906002)(5660300002)(66476007)(8676002)(4326008)(6862004)(33716001)(66946007)(8936002)(6512007)(9686003)(186003)(83380400001)(6506007)(316002)(6486002)(26005)(6666004)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OjdGebCg+htThd5YDRO7daTsotWofpRa+Clh1Ue4RbFgLd0vnrnVSuNK9R2O?=
 =?us-ascii?Q?6VDZb5w+/CfMFiHpkueU2AokPb6qWwO7dM3Jwwkhq0vgsmOyvzAgTnXoQsAK?=
 =?us-ascii?Q?hLzmLETBqzy4rP6wDLLamxlopQ3bVZ+W2pkP3gM87hhTOkl8riJefsU2WFm0?=
 =?us-ascii?Q?YR05pN/WeAxJHZrKlKKLD/8NMnk3MZcSa6+hpkIXr6YCNOXY0A/gnw7nWms6?=
 =?us-ascii?Q?IVcSH/DE1+o2bvmAxz2esRU9nN/NyK6LGzsxmxp8cr0ey3ghiXalKHn8bNBG?=
 =?us-ascii?Q?UUAbRtBd5SfFYgb+HjJsugjzkhig6YkLSkzOoTiurQdCFCgd4DzKqGKZ8yRw?=
 =?us-ascii?Q?0dSlVUu4XAEYIrisGLdDu7BcXWLp4Q8oW3fXJw2SCyqkM4cb/J7ZMStSjJiz?=
 =?us-ascii?Q?lvg7n+8B0JrNhAGb6SdEAEDaNGc2UrRWh4fdr2qzH4J8kmOFkQ/hPYXlfvce?=
 =?us-ascii?Q?PJGNqxweSYqG3IiQ0eU9nFxK7RJiug2J2lhr6uwMBPqLpgKRkx96RiyJOarF?=
 =?us-ascii?Q?AqZrBxeJh1utHEnLr0QFzh28Z6UYaD+vlnkJ8tEzANJGUW8ZG3ANSo4cTKMx?=
 =?us-ascii?Q?7C3ukL5Z38Y8aCa3mM6dvgjNQU4Kefzc1pUJv9pO1eCr46G4UGhAsTcxltVG?=
 =?us-ascii?Q?RxgBhlC5HwbyNth6l6Nlk2jQdpSE34HCjTS8ElA/MECiPjfKIc4W2St/TkKR?=
 =?us-ascii?Q?lkTuwP87as7lGwJLA3KUa3BLo9Dx3EnaSNTY+dOOY+dtVljGJvqqTRM2S369?=
 =?us-ascii?Q?a2JuOIbbIFvTQUn7UTaiTzALEBG74DQQ9MwVkZjIJn0E7RcMErj3yQgmAJnP?=
 =?us-ascii?Q?9eOrwXTe5pZ1fCEGyuDgI2oWcl5w+3BVryMsIXrzdE6YAEwwH5X8kn4pwkcn?=
 =?us-ascii?Q?Kkbt5lNnS34dsFrqljDpKeV9hj31f6BnAb++llE9f5F5XUdhULrncdRy3qy2?=
 =?us-ascii?Q?1UQfFvEHukRMUUBTPKvQekNIvCeNfYw9MpU/2x3rKktwzmSlbSjjFqPa19Yr?=
 =?us-ascii?Q?xxV1R26KohWrt8nfHKNqaw4IITwrYXY0MEYMHZioLKBQs5t+NFi3VAvf2MwT?=
 =?us-ascii?Q?yZP0aokWNP9Ifs2+T724lrO+ga/GUfAuY2God6xVyHzhOfR5e6JG2uZ97PDk?=
 =?us-ascii?Q?o1kB0Ga8xU+oQcf+ukJvsdEFn3LeQDcextmJxhnqVuyAvZNuF4XWrR0D++ak?=
 =?us-ascii?Q?012T1gf2XA4HriV3Msm0pD/t9rWwJtXQOq05FvzGsGEloHUzoK2on62sGZ1P?=
 =?us-ascii?Q?Qpvf019/+xXowSLyHNOzkjYZxnEA9i2o0mR49ZCIoPjy8XEJBRl5yzWzb0pO?=
 =?us-ascii?Q?rOivv7hPHrecKjk/xbNgf5UcOji5xwm4vWJHgUbZh48BkbsEEnPhBnGz2TcH?=
 =?us-ascii?Q?wQJle5p1Nj6YCxW1Sn1sdxqIu/QKQHjas2NFndYwrLtU13YiYNwsbHMCp2q4?=
 =?us-ascii?Q?ynoUSuGzdbPI2Bu5rgeDmAUIKKajxoX+fNUqYXfI6ZpFeRUNYlw8uq7I7fO/?=
 =?us-ascii?Q?dwuFivhkBGDUoCGHfTK4pmC0h5eQc20Pst+U1cVhQnw3MVDMJSHP9L2oLLFq?=
 =?us-ascii?Q?HL9NB/t431AU0dINst1DsWcwfH2YlHl3pISD/2mikWgxFcWVSazNtbLCVTWU?=
 =?us-ascii?Q?GR/5T6dPkrwF23/dyQa0haM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c97066-0c85-4a98-400b-08db2c2d74eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 06:03:15.0876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/doQGk5W4kigVBOMzOly8wAsKmvpL+J0MZwc+Y+wViLWG4AjP4edljHujCnNqVPwM0Itq3LRBjXTmzNTwYf3qmM+tSww174RDmiuviFU2/xg+U+Wzvez5bYAtnzK+pi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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

On Tue, Mar 21, 2023 at 09:08:15AM -0700, Matthew Brost wrote:
>Rather waiting for the VM to be destroyed (all refs to VM go to zero),
>drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
>This avoids a window where user space can create a faulting VM, close
>it, and a subsequent creation of a non-faulting VM fails.
>
>v2 (Lucas): Drop VLK reference in commit message
>
>Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This patch should probably go in the 'USM locking fixes' patch series?

>---
> drivers/gpu/drm/xe/xe_vm.c | 15 +++++++--------
> 1 file changed, 7 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 68ab51f84bed..ab036a51d17e 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1349,6 +1349,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> 	XE_WARN_ON(!list_empty(&vm->extobj.list));
> 	up_write(&vm->lock);
>
>+	mutex_lock(&xe->usm.lock);
>+	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
>+		xe->usm.num_vm_in_fault_mode--;
>+	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
>+		xe->usm.num_vm_in_non_fault_mode--;
>+	mutex_unlock(&xe->usm.lock);
>+
> 	xe_vm_put(vm);

My concern is that something might be holding VM reference and hence
VM will continue to live after we decrement the counts here and thus
might endup in a new VM created in fault mode while the old VM in
non-fault mode still not freed (and vice versa). Is that fine?

Niranjana

> }
>
>@@ -1393,18 +1400,10 @@ static void vm_destroy_work_func(struct work_struct *w)
>
> 	drm_gpuva_manager_destroy(&vm->mgr);
>
>-	mutex_lock(&xe->usm.lock);
>-	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
>-		xe->usm.num_vm_in_fault_mode--;
>-	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
>-		xe->usm.num_vm_in_non_fault_mode--;
>-	mutex_unlock(&xe->usm.lock);
>-
> 	trace_xe_vm_free(vm);
> 	dma_fence_put(vm->rebind_fence);
> 	dma_resv_fini(&vm->resv);
> 	kfree(vm);
>-
> }
>
> void xe_vm_free(struct kref *ref)
>-- 
>2.34.1
>
