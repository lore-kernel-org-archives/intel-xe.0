Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A82C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920A510E8C8;
	Thu,  9 Nov 2023 14:58:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F0510E8C6
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541933; x=1731077933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=56aqVxaMMwDWNrtmu89+6Josub9hHU9IItwpiz02j04=;
 b=CCQ61MicLOeTv8JaUPDJvVezInw1SXMph+Jwsl2JZUMby2ZqsrSJtqjb
 SPkRWCGPqmNYMaj5YIqO8x7HcgV4CFuWVuDXZNMfiCeQzd+eP0TMeoroB
 ivyoUsSGA+SZz6Z+a3MKbRvQoCQpCFBQH4Cd7VUPo6+duIK7C4Wh2ATfJ
 98M0Y41Zmz3VS9H5IGHjM9rm/S7ADI92S+HdKoTFbdkBbiENiO1anbt0b
 jUAekyHGmmkpzvfT52XXnaGSZx7sW3I6XeK5WzCb6DQyaoMH3L58FfZp0
 tAhhBTjZO5+zOkZNEaLv8O8/kPXy7g7kgnl9/1w0kXvjuzRsD0iAo9N9y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300292"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561417"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsvdzEtXkVFgFo+f1UuP6RHLzX6CI7St+QqLX0IhvNLC9eq2KiDIH3mA74IhFDwV6AAwaTNd7GBGfjCvUAvI6Xly8UvN6SGDrieqZWT0/7gZjDuOzNM2FoovhgNQyb3MDOfuiq2U7e68afukSjUqeCuPmBfx9j47xvqJI3OlJxrnRT81QP0EKt34LYpn1QZlAJ0HEo5zjfYlZvycBljZoqsvCBCIVlnU3jcKQRtCglLY0lQjFdxThvwN5MZe6Pcl/W0Xf0i6nojnQ2JQcV6gALGDB4OjlgTkUiNkbiw6br7k0fDpzvOhGdWFPuL5BNDernRxshPdJDU5v4L+QmqtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UShu04xnn+mKXhvot2zwobE6gFIV2ngRh+sNR2Ei75I=;
 b=T7x9ZLbbI7N82SaUpkNyDCMqBw/ycI/1zgZ64u54+qZaXRILol8lnILRNhOLy/juXcWJWRl9MbQkBkA73sDSJMDLFzyewwdwg3BrnyskGcVOe5ZFQ2EkUUIeG0uxcDCqZEaPVmfwNzhitsbwrCVMo2mzn4GFd37fSTPo2LeGvcVTQcRW0NKyQgpHNZO9LqPCIiA9t64wvlruYp5uj8BzsgRiMCLIh81eg9ETnOflV8hZtVi7jGZpQMPbwCip50mWi0rUeHXC4pCyJwps5cZa2RA9xCrFOU8xeoCzV9tzTq9M7FLwBnMmOACwBKceN6r5ud/3arvKL4mNn3qN3IvlQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:26 -0500
Message-ID: <20231109145347.345120-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0040.namprd16.prod.outlook.com
 (2603:10b6:907:1::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0643cd-c768-4862-c29c-08dbe133c3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R7RZ6Ut5+PI9oYUm0CrdHTz9JNRZ6/gmI0yuhiGKnH/yek4OgQPauzydgzrKhNj0Sc21RJGl3XfllkkvW/+lWLMoVbhHiv0kC1FLfKn9jdjB6zkfx2B7N88VgXhlTN3isi+Q0q2bEroXMWn6E76jrHSuNkV1+kXCqCaVwEmaqek7AUKVEscXwM8MenQd2QhBDeNX7aSHtOLS6xDdkvYTNR5XMILB3BAZSoD0aVUE5wYS0H/eVUZ8NSEPNx3t+MMZmHAje7dzl8/MgXr6C/9JtEuMZWORE81QEj2tHoCBNl+2dAEOhqRHOw4BbCL8uMbFw28aXbCV8J+mry55e88K9NfuASQEM1XW/7/AqUOrUdJMEbJfmRYy24DR1J7r3xrEYiGnxzvpERRp9cItFAmtVxrsD9D2yk/D/L+Gzn4rgNZ1vzGsCFFtk61hTBrVLo5WYpOswUCPlWOTPUZc0yrmsovp5ME03Fr8dNrcLBpb0Thv+tbwBeiddv1oj4jEzrppj1t17feCR8UUuNxfmO5S2OE8SakXgXveyXfqFghe3C2NzC95htqwJHRJtQreG5vU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(30864003)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IBG/jSr20LBJPmZZI9ZgVL8p7J1yl2d9TCCfzvWkibBklV8+n8q3SUIUHTEN?=
 =?us-ascii?Q?/1ctcz3h7CCfxFOcLL4tBCedh6CAvB3lZyuXdZzIG7pIjKUzZ7p/t19v/iXw?=
 =?us-ascii?Q?gGYgQqgjtMKcniJUbnQtw4LLxXSG55m7inmSOGIgCMIIv3RK/rBPNBTS6Xl6?=
 =?us-ascii?Q?BkZJoqvWilA1PwcyB2DJ5ioAoKwn2YDI+XBjuJHofUPN27pZTm7AywdNqkII?=
 =?us-ascii?Q?zk8VOswpn+d/HvQCqenEHqp9pzOVa9hpH5KxVexSoON63Tw+98xSw6QA5JXT?=
 =?us-ascii?Q?xBYDu4iOFoqniAJSDe9R6tJwp4LayI5JtiSkVj0jfHUoxIksJsFRlAkRTLAU?=
 =?us-ascii?Q?pFxEfo0NU5KIv7Tn82uVcttLU9pjxeyddh4GrBVyl2C0q20iKCwIPjo2m/L7?=
 =?us-ascii?Q?4tp0fdQgkeSTm73DQcdwA71NkKfCwnmT63goR5TMC9GG5WXAs3/WSFpWktlQ?=
 =?us-ascii?Q?eUOaMn712kxvsilC0NxCVivTqooj0SWjTMewy35qMvW1JJ7WwuY6rYf5nFAW?=
 =?us-ascii?Q?Wq9VbnvIBK4ENzlTWt9KjBQsIrJ9WpZw1x70Lb56ISCqVpCnK4cklAny0MNC?=
 =?us-ascii?Q?zxlsM2umb4Mkg5SVz3PGZ9M0YEAAWiwk9rtfZxj8hW2bHz6BExBZ0eRrJNHS?=
 =?us-ascii?Q?n2WStxvJTwrsqzoha51gmdMUBJ8o5ZjTJMaXpNINUABcIyeq3AJfYW93PxnD?=
 =?us-ascii?Q?kRvW4hizbi27iI85X6C8aLGhe3EdHmw4AXhW3zeC0lp6PuWxwyErN/dGkJYr?=
 =?us-ascii?Q?j7lN6DAIyn4E4vSO4ttfxK9ClL7foZS4F2x6QQwrSblsxbDCO+K29RTeWXpS?=
 =?us-ascii?Q?NBonTL9yWR3NXNzrqiNnnyt/OVMqzWBOuGf+B/YRo+9v2HqJY/Ov/Ygr9hUi?=
 =?us-ascii?Q?QvCCIms2Ly8Fz+R2fVqpp24huJYmVWyqKtcZlVLfYEzewx+R42jappZaP9EM?=
 =?us-ascii?Q?l4KZJvGeCRWzJjlM2yDA5KajCXdJ7BlU8ohh630CNzEo7uwALF0wK3qgjmwK?=
 =?us-ascii?Q?721bCm04RxdnWy1YtQqvvK+wzV8+0Si381xoKJ4ZljnRIZ+4fXZ+G6j9Du7l?=
 =?us-ascii?Q?PCijiYS/jlHsJgMWmratSOQDLzDs7JLB7Bwxr4UsFL8uW7jgVp7QES7F2Cfd?=
 =?us-ascii?Q?AcARBALEMJPK5TiOSQdQ3Kmx+Y4vdjxmKN3w+6MtOzX07vanfiJHEQRvxgHL?=
 =?us-ascii?Q?G9uzsRsKO62DZI+AMUI8PNxoEVaQZxp/Vs5vB8af6I+mWXwAPRi24Le8QjIj?=
 =?us-ascii?Q?J1f9IxoTChgA+kC4WmJufOt8tTw0+6LO0KbcGzsWNSeoigzHpTlRQ6SfwTEy?=
 =?us-ascii?Q?XIlZ4B8n0YXxGMDknDxkLJ2kY8YPfz2DlCI+4DTo7xEufONxKcU7iS9dFzl4?=
 =?us-ascii?Q?BKcz7/+748ncgihrq/8M7ibZy4lK6FrSu0SU9XXl0fL/XW0+TKv9LX29/CvW?=
 =?us-ascii?Q?vtseAco4ZfZHadTT8TK+LDBjwwcRIvuAmIj2tHVXioDYDvw1qV39/yi3zEt5?=
 =?us-ascii?Q?pM+KvpQocdR0f7hFZCs08o24vXfLCKqs9QdUqpT11yjBKRimMdDpLflg3/W/?=
 =?us-ascii?Q?UHdRWxB14YXal8kVglg8Q2jgXeTWmZ1f7qhBbvqfI+iQZxEw207xWcQ02Cz0?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0643cd-c768-4862-c29c-08dbe133c3f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:25.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWQZP7COrbOpt1Ms9eHQ+7L5CKr+VyborR3Ct0LzZYVEd9MLtkp9yoDc/Z20qbNgiLop+EpEKLxe0eQMYHyuhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 08/20] Revert "drm/sched: Convert drm scheduler
 to use a work queue rather than kthread"
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

This reverts commit f541e47f2535bf55054ce006fd6673964c989047.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   2 +-
 drivers/gpu/drm/lima/lima_sched.c             |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 123 ++++++++----------
 drivers/gpu/drm/v3d/v3d_sched.c               |  10 +-
 include/drm/gpu_scheduler.h                   |  14 +-
 12 files changed, 85 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 33ce91533917..625db444df1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
 		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
 
-		if (!(ring && ring->sched.ready))
+		if (!(ring && ring->sched.thread))
 			continue;
 
 		/* stop secheduler and drain ring. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 78623eaeb90d..a4faea4fa0b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.ready)
+		if (!ring || !ring->sched.thread)
 			continue;
-		drm_sched_run_wq_stop(&ring->sched);
+		kthread_park(ring->sched.thread);
 	}
 
 	seq_puts(m, "run ib test:\n");
@@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.ready)
+		if (!ring || !ring->sched.thread)
 			continue;
-		drm_sched_run_wq_start(&ring->sched);
+		kthread_unpark(ring->sched.thread);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1897,7 +1897,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 	ring = adev->rings[val];
 
-	if (!ring || !ring->funcs->preempt_ib || !ring->sched.ready)
+	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
 		return -EINVAL;
 
 	/* the last preemption failed */
@@ -1915,7 +1915,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	drm_sched_run_wq_stop(&ring->sched);
+	kthread_park(ring->sched.thread);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1949,7 +1949,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	drm_sched_run_wq_start(&ring->sched);
+	kthread_unpark(ring->sched.thread);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b64fd2a28f84..30c4f5cca02c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 			break;
 		}
 
-		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
@@ -4588,7 +4588,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.ready)
+		if (!ring || !ring->sched.thread)
 			continue;
 
 		spin_lock(&ring->sched.job_list_lock);
@@ -4727,7 +4727,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.ready)
+		if (!ring || !ring->sched.thread)
 			continue;
 
 		/* Clear job fence from fence drv to avoid force_completion
@@ -5266,7 +5266,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.ready)
+			if (!ring || !ring->sched.thread)
 				continue;
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
@@ -5341,7 +5341,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.ready)
+			if (!ring || !ring->sched.thread)
 				continue;
 
 			drm_sched_start(&ring->sched, true);
@@ -5667,7 +5667,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = adev->rings[i];
 
-			if (!ring || !ring->sched.ready)
+			if (!ring || !ring->sched.thread)
 				continue;
 
 			drm_sched_stop(&ring->sched, NULL);
@@ -5795,7 +5795,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.ready)
+		if (!ring || !ring->sched.thread)
 			continue;
 
 		drm_sched_start(&ring->sched, true);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 618a804ddc34..345fec6cb1a4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
-	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
+	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
 			     dev_name(gpu->dev), gpu->dev);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 8d858aed0e56..ffd91a5ee299 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
 			      NULL, name, pipe->ldev->dev);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 3891b629248c..fa527935ffd4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -809,7 +809,7 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		drm_sched_run_wq_stop(sched);
+		kthread_park(sched->thread);
 	}
 }
 
@@ -819,7 +819,7 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		drm_sched_run_wq_start(sched);
+		kthread_unpark(sched->thread);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 1097f8e93d6b..40c0bc35a44c 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -94,10 +94,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
-			     num_hw_submissions, 0, sched_timeout,
-			     NULL, NULL, to_msm_bo(ring->bo)->name,
-			     gpu->dev->dev);
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+			num_hw_submissions, 0, sched_timeout,
+			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 4c959dec42b3..3b7ea5221226 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -435,7 +435,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 	if (!drm->sched_wq)
 		return -ENOMEM;
 
-	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
+	return drm_sched_init(sched, &nouveau_sched_ops,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 326ca1ddf1d7..033f5e684707 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops, NULL,
+				     &panfrost_sched_ops,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index eb389c1f42fc..9337d3cf517b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -48,6 +48,7 @@
  * through the jobs entity pointer.
  */
 
+#include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
@@ -255,53 +256,6 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
 }
 
-/**
- * drm_sched_run_wq_stop - stop scheduler run worker
- *
- * @sched: scheduler instance to stop run worker
- */
-void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched)
-{
-	sched->pause_run_wq = true;
-	smp_wmb();
-
-	cancel_work_sync(&sched->work_run);
-}
-EXPORT_SYMBOL(drm_sched_run_wq_stop);
-
-/**
- * drm_sched_run_wq_start - start scheduler run worker
- *
- * @sched: scheduler instance to start run worker
- */
-void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched)
-{
-	sched->pause_run_wq = false;
-	smp_wmb();
-
-	queue_work(sched->run_wq, &sched->work_run);
-}
-EXPORT_SYMBOL(drm_sched_run_wq_start);
-
-/**
- * drm_sched_run_wq_queue - queue scheduler run worker
- *
- * @sched: scheduler instance to queue run worker
- */
-static void drm_sched_run_wq_queue(struct drm_gpu_scheduler *sched)
-{
-	smp_rmb();
-
-	/*
-	 * Try not to schedule work if pause_run_wq set but not the end of world
-	 * if we do as either it will be cancelled by the above
-	 * cancel_work_sync, or drm_sched_main turns into a NOP while
-	 * pause_run_wq is set.
-	 */
-	if (!sched->pause_run_wq)
-		queue_work(sched->run_wq, &sched->work_run);
-}
-
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -321,7 +275,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_run_wq_queue(sched);
+	wake_up_interruptible(&sched->wake_up_worker);
 }
 
 /**
@@ -485,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	drm_sched_run_wq_stop(sched);
+	kthread_park(sched->thread);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -598,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	drm_sched_run_wq_start(sched);
+	kthread_unpark(sched->thread);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -921,7 +875,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		drm_sched_run_wq_queue(sched);
+		wake_up_interruptible(&sched->wake_up_worker);
 }
 
 /**
@@ -1031,42 +985,60 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
+/**
+ * drm_sched_blocked - check if the scheduler is blocked
+ *
+ * @sched: scheduler instance
+ *
+ * Returns true if blocked, otherwise false.
+ */
+static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
+{
+	if (kthread_should_park()) {
+		kthread_parkme();
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * drm_sched_main - main scheduler thread
  *
  * @param: scheduler instance
+ *
+ * Returns 0.
  */
-static void drm_sched_main(struct work_struct *w)
+static int drm_sched_main(void *param)
 {
-	struct drm_gpu_scheduler *sched =
-		container_of(w, struct drm_gpu_scheduler, work_run);
+	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
 	int r;
 
-	while (!READ_ONCE(sched->pause_run_wq)) {
-		struct drm_sched_entity *entity;
+	sched_set_fifo_low(current);
+
+	while (!kthread_should_stop()) {
+		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
 		struct drm_sched_job *sched_job;
 		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job;
+		struct drm_sched_job *cleanup_job = NULL;
 
-		cleanup_job = drm_sched_get_cleanup_job(sched);
-		entity = drm_sched_select_entity(sched);
+		wait_event_interruptible(sched->wake_up_worker,
+					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
+					 (!drm_sched_blocked(sched) &&
+					  (entity = drm_sched_select_entity(sched))) ||
+					 kthread_should_stop());
 
 		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
 
-		if (!entity) {
-			if (!cleanup_job)
-				break;
+		if (!entity)
 			continue;
-		}
 
 		sched_job = drm_sched_entity_pop_job(entity);
 
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			if (!cleanup_job)
-				break;
 			continue;
 		}
 
@@ -1098,6 +1070,7 @@ static void drm_sched_main(struct work_struct *w)
 
 		wake_up(&sched->job_scheduled);
 	}
+	return 0;
 }
 
 /**
@@ -1105,7 +1078,6 @@ static void drm_sched_main(struct work_struct *w)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
- * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1119,16 +1091,14 @@ static void drm_sched_main(struct work_struct *w)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *run_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
-	int i;
+	int i, ret;
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
-	sched->run_wq = run_wq ? : system_wq;
 	sched->timeout = timeout;
 	sched->timeout_wq = timeout_wq ? : system_wq;
 	sched->hang_limit = hang_limit;
@@ -1137,15 +1107,23 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
+	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	INIT_WORK(&sched->work_run, drm_sched_main);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
-	sched->pause_run_wq = false;
+
+	/* Each scheduler will run on a seperate kernel thread */
+	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
+	if (IS_ERR(sched->thread)) {
+		ret = PTR_ERR(sched->thread);
+		sched->thread = NULL;
+		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
+		return ret;
+	}
 
 	sched->ready = true;
 	return 0;
@@ -1164,7 +1142,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	drm_sched_run_wq_stop(sched);
+	if (sched->thread)
+		kthread_stop(sched->thread);
 
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 38e092ea41e6..06238e6d7f5c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	int ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-			     &v3d_bin_sched_ops, NULL,
+			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_bin", v3d->drm.dev);
@@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 		return ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-			     &v3d_render_sched_ops, NULL,
+			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_render", v3d->drm.dev);
@@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 		goto fail;
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
-			     &v3d_tfu_sched_ops, NULL,
+			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_tfu", v3d->drm.dev);
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
-				     &v3d_csd_sched_ops, NULL,
+				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_csd", v3d->drm.dev);
@@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			goto fail;
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
-				     &v3d_cache_clean_sched_ops, NULL,
+				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean", v3d->drm.dev);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e4e103a181c6..f9544d9b670d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -473,16 +473,17 @@ struct drm_sched_backend_ops {
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @sched_rq: priority wise array of run queues.
+ * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
+ *                  is ready to be scheduled.
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @run_wq: workqueue used to queue @work_run
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_run: schedules jobs and cleans up entities
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
+ * @thread: the kthread on which the scheduler which run.
  * @pending_list: the list of jobs which are currently in the job queue.
  * @job_list_lock: lock to protect the pending_list.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
@@ -491,7 +492,6 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
- * @pause_run_wq: pause queuing of @work_run on @run_wq
  * @dev: system &struct device
  *
  * One scheduler is implemented for each hardware ring.
@@ -502,13 +502,13 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
+	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
-	struct workqueue_struct		*run_wq;
 	struct workqueue_struct		*timeout_wq;
-	struct work_struct		work_run;
 	struct delayed_work		work_tdr;
+	struct task_struct		*thread;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
@@ -516,13 +516,11 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
-	bool				pause_run_wq;
 	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *run_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
@@ -552,8 +550,6 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
-void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
-void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.41.0

