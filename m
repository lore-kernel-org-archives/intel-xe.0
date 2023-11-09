Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E33C4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1910E8CD;
	Thu,  9 Nov 2023 14:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B7610E8CE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541941; x=1731077941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eknXk3DBFH66wdU0QUpA7cBmnFhVZgEiz2DNF0jMrFo=;
 b=L3g7bw7XKFWgX6nXND1vTq6CPWzml+BceLwk51zjsQBLWPgiMhrz2MQc
 T7LCt4tTPt05tXHPA3O1D8dlnYaQnKOyYX3eIqaaWUtuptQnMVR+J3hgd
 giSiRdzU5ys5WNNfKQqUrYYEkaWExeZFdOZgCiIoAG+9hM3lj29JDOBoy
 1yc/WYEEFub3XPOkY4ZMSFyyuOeCo+HHkH0D12+uTFWRo9HA/LX4it1V9
 GiZj1JjXCaGvsuUmfNdTdJLK0fUzVHuf6gqynQCtFY3H7WUULec7jjFUW
 e5uqyzuXYSNCY+M8K3MqdfxH9w8+3qRwXesVFMVTrCYIbke4D0fxHMoy/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300415"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561499"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYNoj6d78ANrCnGsLS+cjUkQdQTmsASs0UzGB+Owk317i/TIlxj1hH0YHJ8cnia2prOBRskLkJv0jjvqkX7VakyI63C/W0LlRg2sjjkPlSviM+w91whS8YgV1+uCl56CzsRhTXiwdeeZnj9lLFKkgNeTe6J/JhkwDZcojwI0/Z+E99qvHLuCpWM+9Z0SPHF84T5Vf/udkqKYTamyWxwUmBWtGcw98CvB71ik63dUeAVykojUMyLBc7tKIi6X67PN8hzvtmpDvAADwBc9bmiUFydBTqM6rQfRZcsgDcBrosLS0ilhnneod7zdEjwTUNofUFiEv/ZoCLlXNDt3TliO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sO8Bwi8dZ28ubNatAz+on51gNCRf00ohfMa5hmWqjA=;
 b=juGKkDalXR4f26xiFjJJfQDpiTF31VFduBR4ZNVIwQbGcH1W4vxrMzUI1HP7tZVhSDqNeYrdr09AnrolwWlDS7XVhnXq/6GtODjIyPXZQ6jUuXVFwY/ikaBNdQktqm4XBnwyJPsDxs+FBQWbZnHJK3DAkHqTrS2ekBugkh7mk86fEHFtkfaV6JpGIFq60hsYS8t6qBr2TzAAt7QoLajeAsz68tt44PO0aKRXpibIAb6z9tX8mJq2y/7hOEsbSZHkFAmOTJzhztUzgCojWw7KVETPrubeZ/LykG4Dp5Uqg7inbVafNBRmRyWBSOf9S5ZnJaboX6hwh318TNttaJb0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:35 -0500
Message-ID: <20231109145347.345120-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6aca6e-c086-4f73-c0c7-08dbe133d73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTlTuC9FODuKp7LBZT/c2mBCW0V4rpI+n7OglvRUEIt2SpRKssEGzzAPM3k9YUb0hXAEDa5nb6I//tjhjbPmovbiXiSlAmZp0yrUij1eH1/lfZa1TJ3ftFnhj5Jw7cjoYkcwHHAeL/EGBX4QjxOAs5FwZ3sSDs1b6SmUMnduJ6xLoAsNyKjAzwYH9Xrt34GTd5sExK13qbiBod4nlHLZyc9k1N/F7UdKt+wB3Hw5ISW5PfJR0e4AkViGVwlnaWs4WkdKAppmOVexkrmYB4preewA6ejmWTwhZ1/6nSRhkyCbbWU9udEiKfgW/M6WR12dN/qdUsKf9Ju3dhgdBWJndH3mzVcg4tSTgwvTg6UQfLG2sZupYABTArQKBsYDvoj5xfne0luAmwqMqSsxDITnKlzhDqn3plBRlbOjVFPjbEKsx9qfz7GNehqU5Rnox2KGlw46z+ibNxXE8qBBX3EGklCKqAFzhoUfdN7UmAdLaN/y3xDSn4gsWh9RpkO2XtIn7L+DAioQMxRlqZ65DLu1kRlgYzdhGVMTHIzdzSW38rK/75EUepf7ZXqC9+UqTeBihL1k5ut1oCuCDvXXBuEADQs29V9wcbY6lzI3fCtP2iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(966005)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(1076003)(66476007)(6916009)(14773004)(316002)(8676002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ehkrv8deX8KwOolVM4hsGeXVjLeDm7K1fOIn3ct3VwtZrQVC/rXn/tdEfmEt?=
 =?us-ascii?Q?C5Y1/hXFD39kVC11F9PZdRpOlcQXTTVTR4dNHdZHOC9l/acLamUEAu5DRE+9?=
 =?us-ascii?Q?bZ0Z9n1ZSFvSWRNuDQlnxV4GlLPHg+9xYyjWH3zvBwfIZNE5dzwVYMQBLjKZ?=
 =?us-ascii?Q?VPxjVcA6Wvny3Cg7aRHJp4HAQl9EFXY0tGR29cVue1CB61QINWUnwAxlZFQr?=
 =?us-ascii?Q?azX2OD40pQjlrbcaMoQ+DkGNQj5nWmNTqYAfVr8rM9ou7c701TRBphnSsV+G?=
 =?us-ascii?Q?Mecm9N1cWOyUEo0l5kviBObClbma/deKDp+uJ7zXdl2tTzJT6XrCJIzRLJ3C?=
 =?us-ascii?Q?Sbeakt05llTOnDpc8D3tMvxUNHEYToywcxYLk9tNIcJqVyEo6WMNHzOAeAxy?=
 =?us-ascii?Q?VeGw28QW9XsDhbSw1GFAKrW5AayRhAv+iGWCdZ8LJ3uZgz31Iv5vqoh/q9uE?=
 =?us-ascii?Q?9ekPq+tzcEPXFgVGWJwxq5WfAq0dAweVSXWUbYD1AtpRWh2+NUjLMoe2uCTH?=
 =?us-ascii?Q?pKanhRkm3Deqt/TLPtClHmiGO53V1cDcYcsMYTmkUSIW1+IJPSjye1SbFLcv?=
 =?us-ascii?Q?Gio6fiPqDEzFn+ZN/2vxtb/DrFn8ZMLJgmLS4AgZRwWhi6GK9WuEW34Z8McO?=
 =?us-ascii?Q?JA9oTBLFR0zwKAaj4qHuiifHdDNX/LcanYeuVdVIZ4wvcLI92NhJtzEu9mp9?=
 =?us-ascii?Q?9uB1i1xKMx8pKi++4y3f6jR1uGJbKei/0w8rNwPZ4aLoxhw9aTy93E/+/B6t?=
 =?us-ascii?Q?6HTyyWBoKY+ZnaGGqByR1rFEW0fzcMYCCiSsWwFeayGKZCRKRYZftreo3+LD?=
 =?us-ascii?Q?ENnQRNFqtWXJKb1bcqeFLMH+tthqSMZVqUN2cHB6mdZHyGDoekcSexaSc9Bf?=
 =?us-ascii?Q?0n8brl+mJOOLAMJBLmIFY7VAy66fk92GA8+rY7oL7zDhhnn0gc3y0gMXXbKn?=
 =?us-ascii?Q?WEdl8pwgTySzlLBPCUtc5csUhlHrN+c4S+KvvRH+M/CAjyuArJuJnZebVBf+?=
 =?us-ascii?Q?WWUE1gsMxVTHvxM8w81oIrzUAj0S2vK5hPUFkri56Bg9gbQfE21Ws+NelFP3?=
 =?us-ascii?Q?UMfOYFMtVOZkZkjhrOl02z1gjFu5Bgs0979JLuXwXPeZYGX5rmVBbyu8cHE3?=
 =?us-ascii?Q?Az8d+BNl9KcukMmua+0km0cAfPtSjUWOhElg7O65l10sP4eIv8R/DmyzPyHe?=
 =?us-ascii?Q?I1vY4J7YTe5aKk/OHzo4pAAgJEqBEuYU2Vq4bRoTv/jQWpFuJQQzkEzMsroS?=
 =?us-ascii?Q?4vRPtJuWnIbmYEoZWnU3GQT+5YB58WK5MK+Q4EaPtSmlB9nbcV/BwSdPPHFx?=
 =?us-ascii?Q?+lvOSni2rnQFJ4nZnIzdyIxRUGXygl06ixnKZHjoDrAAJfn5QQ/dRxxGFb+P?=
 =?us-ascii?Q?gEuVq4pylcZZI3BTrpt0rewLHOg7GfyATxRNCNeMLlaUk+cxKv2qP7BawBlm?=
 =?us-ascii?Q?nH5yqjLaj4UHaN7brdMzWImnOcy24kE1IS7oTtsTJPlTeHiGn1Se8OKkJ9pa?=
 =?us-ascii?Q?JSmXvyb+4TB2eeBZjeffVqEfP594+ylTeaf0jg0RN63o048i9DY/qZJNxzqK?=
 =?us-ascii?Q?WivngHo1NXRaplQMy8OVDfh+eLLmbwugZRkt9MCpvHVHSxA1FdpUBS7Cy80o?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6aca6e-c086-4f73-c0c7-08dbe133d73b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:57.5687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRZWXLULbT7+FbEQJ/dq5OOZq8+hw6/EXTDWRSBlCbjflh23mL6YcUQEhlSLkAzstTSJ065dD4sprJg9DhBzqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 17/20] drm/sched: Add a helper to queue TDR
 immediately
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

Add a helper whereby a driver can invoke TDR immediately.

v2:
 - Drop timeout args, rename function, use mod delayed work (Luben)
v3:
 - s/XE/Xe (Luben)
 - present tense in commit message (Luben)
 - Adjust comment for drm_sched_tdr_queue_imm (Luben)
v4:
 - Adjust commit message (Luben)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Link: https://lore.kernel.org/r/20231031032439.1558703-6-matthew.brost@intel.com
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit 3c6c7ca4508b6cb1a033ac954c50a1b2c97af883)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fc387de5a0c7..98b2ad54fc70 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -338,7 +338,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
 static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
@@ -348,6 +348,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_tdr_queue_imm: - immediately start job timeout handler
+ *
+ * @sched: scheduler for which the timeout handling should be started.
+ *
+ * Start timeout handling immediately for the named scheduler.
+ */
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	sched->timeout = 0;
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 677ba96759ab..c1565694c0e9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -556,6 +556,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
-- 
2.41.0

