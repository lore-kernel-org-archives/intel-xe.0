Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9841BC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352D510E8CB;
	Thu,  9 Nov 2023 14:59:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311FC10E8C7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541939; x=1731077939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9tS6/N/XUvrsc3Hdh24E5RbtgocN04mXOIOeg3d1duI=;
 b=N8gskDQJGV9F8SjuLIZPkuFwE0TRs8k7qjCqUOOduKHlPubx3GujW+cU
 mkbIOOIh7eVxkh1ushq5s9RL946xaPdOHhCS9wfZCiVreTP3GXD3jy4R3
 aXWq5Kf20WDA35jT8jicmd1Ljjl6TO0NosYszT3ZW6jHhR5BKiWD0Xr5s
 knLSlFu+VzbsRTo7/PE2Ra8DdHXHA/XXQR3480QZMfTFimc3BxcM6bPZj
 L0jD0eG1bmqFnIqogbF6oviknyPci32vvphnJSod1azRQmH+iShfcKZy2
 zS7/bVyyOBPzTTRg/pSF+X9ACFXYUibWjoRRD2F/RQJJG50QKAm28arjv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300387"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561454"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/NypgLWrq3Dm6wzo3DduUt3HZH2qCionVjuRchzc3QoHM+at/8XCchBytiMAowe9QcUAZHFHWJ4DwvSf2o57Zb8ITK9nU3RsDQUlGfBIYaFEfZHWq3euV5wsXuDyRKvQeOkwnQvmQeMW2+qVu4agAQtB/W8dpoEloFIKIPkZw7Tef1Og/64EpU3bvXOc9Qa+y9QrBCIQ2DChps0FiMR4+/mUR1oURrwpm/2oYUD1N/gyA7/njzrnsDurIdBS/SNOdTM8G69J470Dwyk7yJ6IUodRHBDVhuWnkPx3KXpPkM9bzvlr++9TbnT1bTTzllKmojj1OGxjbaT01atpxBIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAfSb5Ewfr2xJuFjMg5hTHf3ZaripjKR8J8BdR6xO3c=;
 b=bZQcpoOm4vgrbM9CPx6teGL04a43JGfr/6ITcGeiMs/7jUyXBHBustnb0kwIe0bJ5197UcnMjJK/PrxRTsVErQcDZqXa5qonIAj0Q60DPiXX6FGheN858ZgUUlqnO9bgPIZqZXLwUilJi/kDtORPyQ/O7A9szZ2zLcEFZ6ZUQAnsJn31ijTguIwFU7neXp7ZJ6WvBIiZcLN8xPp2w6rrCLR3aLT649VAyQsffeKRKxjglx1j7VJcfiw6H9AnEqK6apm3cZBuAT7ge2qtR0Ob75IN/pLMEn8qlrObG3fprJZ56qlGsSjDZHgTLkntTIUkoyIAs1hOm8gptrtSUeqTyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:31 -0500
Message-ID: <20231109145347.345120-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: ca246a53-69b1-4588-6675-08dbe133ced0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWZB51R5qMs8no5RxxK8INVVmOVHMnrBWzNqbXOj4EcN11yO3SBb92AduVYJKCV5dEtwwH04HAPevgeM/1Bc3A0U65pc2k0VpkFVNz3oKnnYPV5sqS7X6Jo88Yha90pyFTNndVQHYyzlZAXsj2IvSpuwPHmynYhbWus/U4IWLhTMBREkoLpN8G2T26kmLzI7ePdoqx8XoPRpc0/P6HBn8TxFc7bjxYMfTywGm2w/xU4kg1l3VardYucgSIAXMPfrDeI0ptyOb+c4DZ7/OVVJY7530sJ3umXQplvqRHyX6qDDaZ/XtcRF/C4az2JhdcPvMExtpUFId6foM+a0SLsODAHHRM40DM3Ru5O+RpJuFS4DXHgK/YI5L0uHUKXM2MOWfNJ/kReTZiDoA+fEV+ado4DHZ4TA8fBLe7uqhCpwCPiBRz6Y+mHXhld59zwPxWoh9Z2ttxSJiBZb6PdkpfDzuT8rTT3fQmmwRkLWl4sCIHfWHRydhqvKFV7h7Vunozb+GLTNPyq9/asWXa+Wq5VSkhPEoMF1r/a+zA0iVNEEUjbJ2RPsJgA24p31MKhrD6PM1wiwAN5SPiqd/yZo4CVT1gAwdfGVS57g1a7ngenNVfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(966005)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(54906003)(5660300002)(1076003)(6512007)(36756003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?47gk/Q2qF9sSsEEIWTw2XL3WWLXjlWywcGsYw+YtW2dqWGTJw4Z9MmC2z5Qw?=
 =?us-ascii?Q?XGZ4bd4yyKmnx5UwEoBw2uqz4/MVVWW3EpYgY33ZM2n8R32Xrqqjr0Bvlzwi?=
 =?us-ascii?Q?BQqAdiVYEZk2dS/OIrb1v39eXKCLIzsJdK3fUNwdRhj7EmpI5K3lEBIIbeJp?=
 =?us-ascii?Q?837EJnnVO/09T4hHwa3Fz+F1RY9L4JHBf1eCsxcbICotU24cKJy5s0x3Vw6+?=
 =?us-ascii?Q?qeY2sU0qcVFTFHU18ihz86vsOROrw8AiQxjwYor/WM7PvShDRtnXxnxzilCR?=
 =?us-ascii?Q?uhjgyXbXflqZmcdgIIN+S5hSaHa4gLVig6yx19Y3q3sYBxubnPybDwjrKs6w?=
 =?us-ascii?Q?TT3Ra9h33GcB8Bg/Mbd1aJ3TOSmnyW67+cIzubEgY+sZJCj14teGXB0MMCsd?=
 =?us-ascii?Q?f0xlw+TtyUU1TJsClGQzi2S2CKlHZ0wrVb9u0UVvIt+w28Vj851AWuyhepWN?=
 =?us-ascii?Q?s9CYOM5XgNWnid3s8MkIVSqmW6POlDMP/LkvWoc0D2Ey7Poy/i2kn9eebLZE?=
 =?us-ascii?Q?bkVuRVSFcjQsUVBF8NSYm0uJP0CtZeR5zSRA4GY1EZ6v/Q4Cg7Sj2AmLWsOY?=
 =?us-ascii?Q?/kmZD9XR986qPF7UQZwU3h7qoOpEnLgmv+oi/M3ttZnkICbsqKhFmaiQvT5a?=
 =?us-ascii?Q?PbKxU6oSkInEY+IGFMKjxc1sMCan6znDef2A9JZZBdjNW3y68Zo3Gpsa2RhB?=
 =?us-ascii?Q?OnBUPn91g4tWHj5wWArmn4hKzFk/mD7GCRHaEg7onWvk7w4ZrH6+IGqA9aaW?=
 =?us-ascii?Q?CLNjUyG535qkKy4YLYO64CuW4fX1TjsKbn8HIOdcRt3eyMu47yeqhYyxH0zI?=
 =?us-ascii?Q?z3yGQpx1bBEOLlpA1svxNT81XupCYRwOEqMQDMLTp702sElGg0SnBmN0+vIp?=
 =?us-ascii?Q?WNTbeGr+ADraw6jduglt5oN+xERl20L3+wR66zhwcvXnzMH2Srinv4AKuY1W?=
 =?us-ascii?Q?pao2P2sw+n4ch6E6RmK6WypGf+BMaJrmmP8EMXsaNMqyWM6jCMjb2b9RWbHX?=
 =?us-ascii?Q?u8gpKh3hGE5LmnY/gJRWmOD/u0XYd59lViljhx2zjMwylLtX+K0eXuD+mdGT?=
 =?us-ascii?Q?UFSCUl5H1E2jc17Ulqbd+NNv9naYsh6JAOQg0TNJeI0VWoCusqtdS0OsO7a6?=
 =?us-ascii?Q?mKiVP59eYmnmFxL1EKU7+lXkgtjqMDUj65A7fvA3GErvN0o16KNeS+w7zOvk?=
 =?us-ascii?Q?Qt9+aaxMRffA+joKT9TgAhwuOeq8YRvTUx/1gvoPriDSKb6LAE2m3UkGHXzR?=
 =?us-ascii?Q?R88nSbym+cb12Zt+7OPSqD71axgtgizptWZ8PNqLHPDo33TBJYnB5RBRhs+G?=
 =?us-ascii?Q?y6KwX1/0mFww/HF6G4NAC8vSoDt5g9cWb2sTjciMFCAI/7gUQyc8VAzkWvFN?=
 =?us-ascii?Q?SUjQK+PzvEEemCqtXpDGTqpJEDtQ+2enFHf8Mh/Vh6CNPWm83vKwTEL9HDWq?=
 =?us-ascii?Q?w/0ZUDpFmJPzuOc0y/hhLWuhqlDLh4zO2GRIZJQTL+W9m9p/Z5MgDCEOYlB/?=
 =?us-ascii?Q?b7e8fncAUaudVGZ7Xl5kPxlFYPAiPkIDFFzFIfx/jEpczCxFiJsEUdGupjeq?=
 =?us-ascii?Q?TujN9dPlOFISl9XVTaYnb8R9PZIMH5nYt3cifX4vpQA9Z8Ms3jqshAsi/IR8?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca246a53-69b1-4588-6675-08dbe133ced0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:43.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCs17p+bqs1bqPK+ndLJW+TNaDALXnMqbQUErWvYrKUb7u+bTcP3pGA3lV5KoW6FEetILJH0bOlVjp9LVrLBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 13/20] drm/sched: Add drm_sched_wqueue_* helpers
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Add scheduler wqueue ready, stop, and start helpers to hide the
implementation details of the scheduler from the drivers.

v2:
  - s/sched_wqueue/sched_wqueue (Luben)
  - Remove the extra white line after the return-statement (Luben)
  - update drm_sched_wqueue_ready comment (Luben)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Link: https://lore.kernel.org/r/20231031032439.1558703-2-matthew.brost@intel.com
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit 35963cf2cd25eeea8bdb4d02853dac1e66fb13a0)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
 drivers/gpu/drm/scheduler/sched_main.c        | 39 ++++++++++++++++++-
 include/drm/gpu_scheduler.h                   |  3 ++
 6 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 625db444df1c..10d56979fe3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
 		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
 
-		if (!(ring && ring->sched.thread))
+		if (!(ring && drm_sched_wqueue_ready(&ring->sched)))
 			continue;
 
 		/* stop secheduler and drain ring. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index a4faea4fa0b5..a4c0bb358db7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
-		kthread_park(ring->sched.thread);
+		drm_sched_wqueue_stop(&ring->sched);
 	}
 
 	seq_puts(m, "run ib test:\n");
@@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
-		kthread_unpark(ring->sched.thread);
+		drm_sched_wqueue_start(&ring->sched);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 	ring = adev->rings[val];
 
-	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
+	if (!ring || !ring->funcs->preempt_ib ||
+	    !drm_sched_wqueue_ready(&ring->sched))
 		return -EINVAL;
 
 	/* the last preemption failed */
@@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	kthread_park(ring->sched.thread);
+	drm_sched_wqueue_stop(&ring->sched);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	kthread_unpark(ring->sched.thread);
+	drm_sched_wqueue_start(&ring->sched);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 15074232fbbd..2625dd86cdee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4589,7 +4589,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
 
 		spin_lock(&ring->sched.job_list_lock);
@@ -4728,7 +4728,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
 
 		/* Clear job fence from fence drv to avoid force_completion
@@ -5267,7 +5267,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 				continue;
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
@@ -5342,7 +5342,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 				continue;
 
 			drm_sched_start(&ring->sched, true);
@@ -5668,7 +5668,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 				continue;
 
 			drm_sched_stop(&ring->sched, NULL);
@@ -5796,7 +5796,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
 			continue;
 
 		drm_sched_start(&ring->sched, true);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fa527935ffd4..8fa9ce3746b6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_park(sched->thread);
+
+		drm_sched_wqueue_stop(sched);
 	}
 }
 
@@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_unpark(sched->thread);
+
+		drm_sched_wqueue_start(sched);
 	}
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 99797a8c836a..54c1c5fe01ba 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	kthread_park(sched->thread);
+	drm_sched_wqueue_stop(sched);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	kthread_unpark(sched->thread);
+	drm_sched_wqueue_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -1252,3 +1252,38 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	}
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
+
+/**
+ * drm_sched_wqueue_ready - Is the scheduler ready for submission
+ *
+ * @sched: scheduler instance
+ *
+ * Returns true if submission is ready
+ */
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
+{
+	return !!sched->thread;
+}
+EXPORT_SYMBOL(drm_sched_wqueue_ready);
+
+/**
+ * drm_sched_wqueue_stop - stop scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
+{
+	kthread_park(sched->thread);
+}
+EXPORT_SYMBOL(drm_sched_wqueue_stop);
+
+/**
+ * drm_sched_wqueue_start - start scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
+{
+	kthread_unpark(sched->thread);
+}
+EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d2fb81e34174..1d5a20af4a06 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -552,6 +552,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.41.0

