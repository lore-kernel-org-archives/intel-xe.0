Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F5DC47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319B10E2BB;
	Fri, 26 Jan 2024 20:32:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55AA10FE62
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301116; x=1737837116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7wm3jIvRST/acYDOWaQm0H0reC4wYTHBGBlIaj8Tpjw=;
 b=T1oyH+PXn2aY87SjsQXr4JZYL+V5DasfKs15FGvn3HEneGkg616+OIZI
 c0PRsZgfvSrMXuBEkiB4AMk1W42DVQMd36fsV+biqqVlGjG130kNH5sgj
 ghGbickQ1yEnIqObrATE2tUjr80uDUV3eKd5DivIMc6bv35VWkJMQuxQK
 tljlQumRmzyCNyI6WTB1o5ClTsegLFN0NdVRUyuGLzkrnRJdP2dH3lxna
 m18XRKyzI76tJKYO6N7kl2iDF3nvkZ6UowXcOixAz0832cRY53tTHtI8/
 ER5dzK4tVdH9SzmtFxuOksIgJbzGbEcPo0xSMy5dYE2iUCPEeiTsW7A7J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948677"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948677"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482133"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482133"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:56 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E89ABdK/WTbdI2Kf8CAGkAJVOjCN2ECKXWaQpXYUudTBo7SioCoRJVwfuW1dHUA551YPovrcbQoSA4DrK937UkhOe2QvY4/nt7PxR08hnsF2VrAobyFLoIDkocbFmAc+ODwzgTUtcLqpiDZSJcfEu70OOH6t08+9J+ZM84XoH9fYm2MjjxcJr5kB3jcG6BoiEAdCAuuTfPxuIogyPpH0z71zPJKCDgn9kroMxCh8c7G+nD2MBjDaUOGbmthvLVAtYZXr5zo/C+cTF2+47h06wEupgbnsH87c0neXfPC8fQoBJmQBgZ7kJ1kNyokkpBvRd3W8R8T63AxjCABjipU36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz7hFS7gRBLWVSkNMjPP60Kc8616jXy9pEiSeFKOdx4=;
 b=FpU+TrLlJE+cnJTikwy96lrqgMCSc17lUAKaiNMRARCkuck9wmekU9b3QtNzqGf5vpijpEliZsXVt3i6+2VR79BotiOCny+mEtDz3cHxL75dLtEz2/A1k4wpqZkz8hUVZj2hvElrHIRJYxHUPoy+nNMgEwZb6s/euVkczBxxI0iQKN8dBGOAnC4h+rabvw38LSG0x6uDn/BZ18qcLwj6x6Mhp/VW5lEzUiz38IpqakA8tgasoa2ySKhKuMYBHb+FGoPEmMNrVo5V40z/meaOTqKvQm4dQts4NZN/3mvcq3kARaoFbPHaT/YeXWK1iTnZa4pkPBAlqx/a3T1go30RKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 19/34] drm/xe: Remove pm_runtime lockdep
Date: Fri, 26 Jan 2024 15:30:28 -0500
Message-ID: <20240126203044.1104705-20-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 314cc21a-30ae-4508-d597-08dc1eadd170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qtmQiqcDVfDPM4hGfF+CO3aGFTqUyMDQRvT3aPyRCDb6Q6vMga2cG4wp/tVnj9x2ymfj+vbViihzMPChil07JUkV5Be03rqyznHFKobnmC73p+fAvlt0PUQK/5JD0qEKrl2N35g/ls+SBb3SfKKRQGlLU88aouqVm3khlobfJt4ALvJLDsrm/qzz9C6Qm5RxFCAzlpyZP06suAGerGzeqbeItuJ7sd6xJcbcwT3xJaMMyUEGhcacd3Q/UCUxaDfDho4treQIJ8h4pBsoyd+APKjebvzBEY6EEBzosxnf3IT0IXtQT4Mwtw5fyhBfll1GNZCm/tyXrCqAYeMIKuy7faNIjvXTStPNoiqmwBRz0OuaKITZP7SbJM5QEPF5ApueGTrfzKqudgXWM7pCBlOVhKbw4QGBYAS+5ggR+JN/pSTZ9sWzR/vgekvkHmFS4FawTNrv7WYa3tLeyoUDdst7GqkUnQAHF/n6VpMo2EWAz9qOytk1LKLU8393GmdVhKp9jAtrNfrs/FkcYx5eKWWHwG05g38lkoyyx2Deje/imsxyP8UoghYZ2SEnfyvsWJO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2TwiMDBA0UdClsIjVK/jwqbuPDQ6xG7aWP21Qp4yx9rKLjtt2gWYUkPl/4c8?=
 =?us-ascii?Q?MJcQb8SGUJaSHP6rFB1ihawDgjQ8rUfx8Dioh9gJFf2Cx6MHdSsgw4rkh5ZR?=
 =?us-ascii?Q?XWthVRF+nID5JO+sKwjFeOY/uwHHnVL7ePlnz60jiBWdwlVEmZkWqC6ulyaF?=
 =?us-ascii?Q?uyG70Nz67ol1DHPBd6DdJSqLHEGlUkCVczpBL6yX4n338wQuqqtP9VOyJfTB?=
 =?us-ascii?Q?BmEvSVskTpzmlzNlzMflUJ3s5yPxJ0Z4JTxV5REUchJ4jMaKRyqtPid3N8W5?=
 =?us-ascii?Q?0JlHcruFK8Dl6d7ONQ3wf6WYZ8bZm2vKXzA7V6Ys3dSStxBTc6F1PTEBvXBl?=
 =?us-ascii?Q?hMydVW0ejMqhTyn1Awhj4lw/a+hTJ64asXrq30og1b5zQNSyMTwNWNpWSORu?=
 =?us-ascii?Q?Iem1GHdjKVOxRkASFjhbwD/lZLP8rjvjMDeulQBQySzHq5YYdmhwIPALUA2b?=
 =?us-ascii?Q?+J+EBdqnCACDJZ3LLQF0ejln961ClVbbBcHRtyD703+LB6eW9e/e1oXWdxn9?=
 =?us-ascii?Q?zafZ9gEop4yIuxFcaMvWmiQAcYP51uLz+zZ6YEkvCP7Pk37uxIrT0tJ7DGvo?=
 =?us-ascii?Q?oSiX1ooERr7Vb8LPnMXbpB/xnOkx7e/1UtMcBazYZHXw4dhoCjY8iDU3905V?=
 =?us-ascii?Q?sGKEqLIc1RBor8DMWkibkXC7T4AweS8bHjo0fOPfoErVvS+Pi4HgeTLvitmk?=
 =?us-ascii?Q?Pzjhe715nZo6ALphSguBEFJIclz9cxAd1FHVla+UYswAhatVGHD9AihFaIls?=
 =?us-ascii?Q?jQcgHd3Z2/usgauRwlFqnUyeAo82+vNwgGuHKIwPn1vkXMC+Voy0kz15P7/J?=
 =?us-ascii?Q?jxGudAuOlbioKES1sifNwTEx89ishM8QHcAvck/ZHwYFvEp1k7tzVpD+wVXY?=
 =?us-ascii?Q?+lI/Gdbl1ferzN7ZlCMp4WIGQW+gVw+lFc+KHBp9D5q1CSGKQg+KPCtKoJ6B?=
 =?us-ascii?Q?Z81ApJbuLMFwb+BC2WC0MxZsnri1aLOhkHj/10Ob19DRPfuWMm9yAm8RiAKj?=
 =?us-ascii?Q?SfuXsQEA8gTDsp0tLMXSiEZctlKkIdgmR7RhAND+m38PK/5GCT6NtwD0Frf/?=
 =?us-ascii?Q?x9TSlfPkLEoQRPVZsaBX/2rVVeRLCh5jubK4OBOPS7E7oXk1hBFU1rJpd8CM?=
 =?us-ascii?Q?n4r9Td1IJnorpo8VY0Qt5Azv0m+rRnBhZuIlPhEMvAgbg73qrvfFoNnK2uoD?=
 =?us-ascii?Q?eC3Wl46r/QCxLUpl46YKBWMnoGot9Mdb56mT/KeWl5uDcMVXC57EYPDcVlS0?=
 =?us-ascii?Q?lgptuB6WHlU5f8aYQhwiGFDbGkCgiNP1+2DxdNds4KEzzl7iHOomzz4V/iXN?=
 =?us-ascii?Q?namkc4RtNFohCk2dbp76CQm9yzc0EWVfCBl+2mYl5nFZfCHs9XyhtqBCgMdK?=
 =?us-ascii?Q?PkNRDlWwgjCaH3RKX+Ct6t68XY5CA9KEhKBX9DyPgXZ78PhYMyzkJ02S0HYi?=
 =?us-ascii?Q?bioDbTkn3Kd4EWNb1gOe3xFpM6HYN2nlmwdBfmtZy2fz+a10ES6I6oSNX4PE?=
 =?us-ascii?Q?YmiOQ4dkrEvjjylSQ9Hply6+ZVVAX/JrJ+nUJjRUHewjOqwOicMySA7y2E2X?=
 =?us-ascii?Q?71ZraaE5F6sJsnZc5wDr39s4hGBDodg7tF6DW4v2KQshqsL082b+AfXuR9KQ?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 314cc21a-30ae-4508-d597-08dc1eadd170
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:47.4464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rsKrfPiZODE5lXMaRJ9hbFcQUb++aoxJz9Ad9EaLhQ/ndzh+8/Hjb6SQTbHW5Fc1Fgsma9uSWVLmVD1tYk/8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This lockdep was initially designed for the mem_access,
where the mem_access needed to run the resume sync from
the innerbounds and count the references.

With the runtime moving to the outer bounds of the driver
and the mem_access replaced by the pure rpm get/put
references, it is no longer needed and it is in a matter
of fact just splatting may false positives as the following:

               -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
[  384.778761]        xe_pm_runtime_get+0xa3/0x100 [xe]
[  384.783871]        invalidation_fence_work_func+0x7f/0x2b0 [xe]
[  384.789942]        invalidation_fence_init+0x8c2/0xce0 [xe]
[  384.795671]        __xe_pt_unbind_vma+0x4a7/0x1be0 [xe]
[  384.801050]        xe_vm_unbind+0x22f/0xc70 [xe]
[  384.805821]        __xe_vma_op_execute+0xc67/0x1af0 [xe]
[  384.811286]        xe_vm_bind_ioctl+0x3a36/0x66c0 [xe]
[  384.816579]        drm_ioctl_kernel+0x14a/0x2c0
[  384.821132]        drm_ioctl+0x4c6/0xab0
[  384.825073]        xe_drm_ioctl+0xa1/0xe0 [xe]
[  384.829651]        __x64_sys_ioctl+0x130/0x1a0
[  384.834115]        do_syscall_64+0x5c/0xe0
[  384.838232]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  384.843829]
               -> #0 (reservation_ww_class_mutex){+.+.}-{4:4}:
[  384.850911]        __lock_acquire+0x3261/0x6330
[  384.855462]        lock_acquire+0x19b/0x4d0
[  384.859666]        __ww_mutex_lock.constprop.0+0x1d8/0x3500
[  384.865263]        ww_mutex_lock+0x38/0x150
[  384.869465]        xe_bo_lock+0x41/0x70 [xe]
[  384.873869]        xe_bo_evict_all+0x7ad/0xa40 [xe]
[  384.878883]        xe_pm_runtime_suspend+0x297/0x340 [xe]
[  384.884431]        xe_pci_runtime_suspend+0x3b/0x1e0 [xe]
[  384.889975]        pci_pm_runtime_suspend+0x168/0x540
[  384.895052]        __rpm_callback+0xa9/0x390
[  384.899343]        rpm_callback+0x1aa/0x210
[  384.903543]        rpm_suspend+0x2ea/0x14c0
[  384.907746]        pm_runtime_work+0x133/0x170
[  384.912213]        process_one_work+0x73b/0x1230
[  384.916853]        worker_thread+0x726/0x1320
[  384.921237]        kthread+0x2ee/0x3d0
[  384.925005]        ret_from_fork+0x2d/0x70
[  384.929120]        ret_from_fork_asm+0x1b/0x30
[  384.933585]
               other info that might help us debug this:

[  384.941625]  Possible unsafe locking scenario:

[  384.947572]        CPU0                    CPU1
[  384.952123]        ----                    ----
[  384.956676]   lock(xe_pm_runtime_lockdep_map);
[  384.961140]                                lock(reservation_ww_class_mutex);
[  384.968220]                                lock(xe_pm_runtime_lockdep_map);
[  384.975214]   lock(reservation_ww_class_mutex);
[  384.979765]
                *** DEADLOCK ***

In a matter of fact, there's actually a third lock that is not
in this picture:
spin_lock_irq(&dev->power.lock);
and INIT_WORK(&dev->power.work, pm_runtime_work);

The pm_callback_task will ensure that there's no recursive
calls of the resume function and it will increase the
reference counter anyway.

Then, the pm_runtime workqueue and spin locks will avoid that
any resume and suspend operations happens in parallel with
other resume and suspend operations.

With that, the only thing that we are actually doing here is
to wrongly train the lockdep, basically saying that we will
acquire some locks on resume and on suspend concurrently,
entirely ignoring its serialization and protection.

The above scenario is simply not possible because there's
a serialization with the spin_lock_irq(&dev->power.lock)
before each operation. However we are telling the lockep
that the lock(xe_pm_runtime_lockdep_map) occurs before
the &dev->power.lock and lockdep is not capable to see
that other protection.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 55 --------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 86bf225dba02..f49e449d9fb7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -67,12 +67,6 @@
  */
 
 
-#ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_pm_runtime_lockdep_map = {
-	.name = "xe_pm_runtime_lockdep_map"
-};
-#endif
-
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -291,29 +285,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	/*
-	 * The actual xe_pm_runtime_put() is always async underneath, so
-	 * exactly where that is called should makes no difference to us. However
-	 * we still need to be very careful with the locks that this callback
-	 * acquires and the locks that are acquired and held by any callers of
-	 * xe_runtime_pm_get(). We already have the matching annotation
-	 * on that side, but we also need it here. For example lockdep should be
-	 * able to tell us if the following scenario is in theory possible:
-	 *
-	 * CPU0                          | CPU1 (kworker)
-	 * lock(A)                       |
-	 *                               | xe_pm_runtime_suspend()
-	 *                               |      lock(A)
-	 * xe_pm_runtime_get()           |
-	 *
-	 * This will clearly deadlock since rpm core needs to wait for
-	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
-	 * on CPU0 which prevents CPU1 making forward progress.  With the
-	 * annotation here and in xe_pm_runtime_get() lockdep will see
-	 * the potential lock inversion and give us a nice splat.
-	 */
-	lock_map_acquire(&xe_pm_runtime_lockdep_map);
-
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and delets bo entry from user fault list.
@@ -341,7 +312,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (xe->d3cold.allowed)
 		xe_display_pm_runtime_suspend(xe);
 out:
-	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -361,8 +331,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_pm_runtime_lockdep_map);
-
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
 	 * in gfx card soc would have blocked d3cold, therefore card has not
@@ -400,31 +368,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
-	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
 
-/*
- * For places where resume is synchronous it can be quite easy to deadlock
- * if we are not careful. Also in practice it might be quite timing
- * sensitive to ever see the 0 -> 1 transition with the callers locks
- * held, so deadlocks might exist but are hard for lockdep to ever see.
- * With this in mind, help lockdep learn about the potentially scary
- * stuff that can happen inside the runtime_resume callback by acquiring
- * a dummy lock (it doesn't protect anything and gets compiled out on
- * non-debug builds).  Lockdep then only needs to see the
- * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
- * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
- * For example if the (callers_locks) are ever grabbed in the
- * runtime_resume callback, lockdep should give us a nice splat.
- */
-static void pm_runtime_lockdep_training(void)
-{
-	lock_map_acquire(&xe_pm_runtime_lockdep_map);
-	lock_map_release(&xe_pm_runtime_lockdep_map);
-}
-
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -436,7 +383,6 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	pm_runtime_lockdep_training();
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -466,7 +412,6 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
-	pm_runtime_lockdep_training();
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
-- 
2.43.0

