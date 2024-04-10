Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3973CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F173113096;
	Wed, 10 Apr 2024 01:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmxYVQXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076C7113096
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714318; x=1744250318;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Y25kJKzgdZz8mH9w8R/olRqj+MWlx9J1/Dlb9BDLUJ0=;
 b=hmxYVQXHgr1odUskRS/rFRJ7tL9oaGrUwFck8cvWHYUvk/0xLmBjAXGw
 wCQI0+Ec1xKMcaE0TA0fiWaRg3u49ANflO3WrHHL2Z4fHKUiqZNMqGvtp
 S38HYDwKV0LFfCDOFgCLPDp6r0sltKxeCQKRBBxpaoJpuv5QLk4Hqvq5E
 ksgHMCpB8Vb0ldCS7yoTFR7aSGh73vsCC28GDzolrzuSvdAmV3T4wKdWV
 m1F9/R8H/H3Da/BtUHsJXFXIPB35HPQsaxeB/8reYbmkhlE9iY4/HEUnY
 fsytAwf9YmPX5tKQS96bRuPbbMxzcr0Du/vFNcdVPG9B6nA4Eb6U2hmg2 Q==;
X-CSE-ConnectionGUID: IHPHE0wLQbmTTqo3hfkVvA==
X-CSE-MsgGUID: DlfmBcljQBGGkbz9zzuObA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7914076"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7914076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:58:37 -0700
X-CSE-ConnectionGUID: 7OT0loxvQBObFCvLPwW0bg==
X-CSE-MsgGUID: ToGk/DSvSH+sDYxFeydl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20970911"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:58:37 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:58:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgtFBcC6R/KD9ORKmTxtq+epWENmFxNTLS8ysFqjiF3N3e4adACb/R688ADrfQ4SZaq6s/eEKCnMwoPtdyzIlMZkL30MFsKPkCMle2fbonfFAN3Q+Q6VWcGPCc8gmCpKlifiR4j64zQjKD8E+TjBYRVa4Qth987CjryGJf6gkw/aJcPZoWAhXElE6HoPEHwbFDD7LjAn5224Rcu6mb/xDHni0Zwj3BQyvT8PBx2E24HybR6SXmapv0bH0tnVmyxfEcPjUdQ3C30dqpCbSXF3WqA8f1uEXPqzF4O09j0JNKgNITpDzm7f3ye1EeuPpMwvc+btONMqHiTj9E8PTU/ebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU0E+4CI407NV0kr2V3e7BCekLX0W3dCtEClC2WBxaI=;
 b=nkY/haexA38pEahpHfG2CFDSascI4VZUM+n3Y8BZOQaAfHt49UAyXRiLCe40l1d6KYBaumL8IjuOtk7htXlusHYNrJtXxns3LHaVjSkNdM0+N2I5j8tUiVbeu3yYAp7NhtLI9tqRN0yfJKezvArUsqRj8fSAkKYNlNx0gfeHagadVgpplJuT2JBsIzU2UNi+q5wZXe3VSEQoSquFYGP3gXtXpPa64OUpmEZbsoeg2LD1QwnR7xzl4oIqqhGIGCuhM7OhvB42wp+uzZKM/mpZ0HQEtAM8QDULhzb12fQjX0aILwH2x1GKAE//8XA8/EtBgd1t5oeTRqGjjlnUFsTbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 01:58:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 1/9] drm/xe: Introduce xe_pm_runtime_get_noresume for inner
 callers
Date: Tue, 9 Apr 2024 21:58:17 -0400
Message-ID: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7963:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BC8k8SdC7yAf3mQrVCSLGIqnvUurQcMTJeaR4ncu50O8m0/Y9HcEnBFsV74K5k+pN2TtO5T6i4ypkdL2aQb1D4tJOXqpF5+ABbAoRVei02wlQJmD6qxH54isBoxulGglC3UswrQo9x6NRK6lmawKfAoZlYb4U6eFVokN9zVWKqirMDjV4jqNhjK790nC9/mn6w82O9bzSDmoEkNsVTQ7cEZpVOV+4JCv2Gtec3ZPTGyWIyFYm8WaUSmPXoNb3yNK/PHzKsEAk4nyW0TVilHtA9S8NwTukRO4moiJiwx7P5FoYGMW9VAltWX/MvcwL4aCN8gVg7J+c76/qA0lFzIEAS0GqGLq6+D3WrYBpxq7KCnTVvMhYA0utiiimxPhjxe5U9hCAJArZlzxFbxYc6hhIRVTGfcHkV8M9R4+uROhDLV3A6urb6Z/b4AtsyhEqja5RMSbvY0E+1SFqjmokkdC9BYPiESnWdz3FZcMN9xvfctZRLRpzgch/34l678TYTL9Rc/GD/2FnIryLf/QZMYw/7Dt9hRQ+wjHVcP3MZiGdamA9+6nGLX/MbTkXchl14lyJKAhod0bhcIw7qJI7fMfggeGLaYcvpE/BllF+R6M1KhoOe5RrKcNa+drnrElY0/sdmvvn/ZSNXOuDxsTFEWTRj7xuRAic+lOavJT4M0LNlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7wLOy4Hs0+VMF7gP1IfVnikfycDxfEqpxS+3+lKaUkbhDjvVYO08hB2/VsQ3?=
 =?us-ascii?Q?djM/ZdVvEEmtpyfQa2OMo03EXhjkVrll4bLEYcMgYUsP3nXV9uTZRsYN42K8?=
 =?us-ascii?Q?vXQbpvuAXoKzGDYnQuQjvEzAjqTW5iB2KX+SitwRT7xVpLdffx80u/djhA40?=
 =?us-ascii?Q?jpqONtfLFOGKhseSDv3h2APrt3BflZSIMQZkOpMbya0T2nltObFmQ+Iv6qct?=
 =?us-ascii?Q?4jW4poNDd2GLEQdr/5ZpheFNK7x7paMe8x650tjnnyjpXDok9pesUd7KBIRn?=
 =?us-ascii?Q?wdBCOKSYk+4anbUITOoex0/Bi4utpk7evTL6Md+kRsZpoRmuLe2io5rDTWu0?=
 =?us-ascii?Q?WMUFPaa0tgEP49774jBtGiZcrkdiK9reVUQ9zFNJVamNO/Wog7sYdW3MclTc?=
 =?us-ascii?Q?2K30vIxXnomakVPwx5yskpf9W4b9ORZPdbdorvbZoqG+Yz1wHExUIFVCIEOK?=
 =?us-ascii?Q?h3Ki0xfLp+Tq9O2pqAUpPI9SFuOzKMUBo7W3BnMXVaabzz6o8V3g1UphHq1z?=
 =?us-ascii?Q?g52qpvk9lPE3+Zqt/KrTIjZy9SKbVEPJonMPZZIivKt5SE9E2JTtZpTLqJqE?=
 =?us-ascii?Q?jLkM7KiorOll+vvU/XFsI8ergcm1pCAhbYJIFQtFBYhalf16phOdCTrUoK/F?=
 =?us-ascii?Q?2c9Y/VqP7UBeYjJnD3AxI/wrHaYKUy6bImIi6hia2MbrEg+kiMGh/DMcOhSS?=
 =?us-ascii?Q?VkKdpwOsA/ByMMetgW6EY9MNLGQU9PxY5FWiH7fNnWDOe2VuTbOcvY/uo337?=
 =?us-ascii?Q?0u3y2wOspJTAPR3+dMpfaFa+PQoPPVvdMkAUpqVKX7JuDgu21HI0tsB7eBaa?=
 =?us-ascii?Q?qbaYVRHy8wlKVFT4e59wX9l5Ll8CDQt7t5v/twSqKQK0NgDsd9BuA4hKacUB?=
 =?us-ascii?Q?zit8Vuo1s77QHq1T/wcHzGWZqTShG7gZlf6eqcnjxSJeVy4gHfg6J2q326IV?=
 =?us-ascii?Q?/Nojo6EsKoxMx/+1xMlvNy5wbjvS8/KF4A00MUgu85Z+EIjLMe9Q2ipti1Dn?=
 =?us-ascii?Q?jXRtyK8xfC2ysR1KF0MbDEpYg/YRrUgBwC8qanRbrylfK13xfPK7WcBoFP6Q?=
 =?us-ascii?Q?UvwTQIa+kURqq5bPyanUBgU7e6zrhyo8jAHMaVaiHZ5854zckitgqwT+yH0a?=
 =?us-ascii?Q?oqPhy2wPlZfM1+2eV7AWzGgO/f7VNDw7s8cVWHZZ0Ke0EsE9KLm1ovh/Y6nS?=
 =?us-ascii?Q?nQAAlwTc9SB3hubbTLzXic6+kQsLspRXE+Idc+2cj7vgyY1D8zMVn8XpggOG?=
 =?us-ascii?Q?MtbPIva/fIbgT3m0YhWHNf3jg9jghMeNr7BMvy5H0Qk2xSQGtSz5n1xOXOpd?=
 =?us-ascii?Q?F6+7a9K6LST08tDg/VKLj3Nk8x7iU+dnG0BMcsBkOq+8lkiBQVgfLCIdkzBp?=
 =?us-ascii?Q?xF4g+SCNDEiUu8ZCv0QFug2Z1IDtZWGQweT7bAq8FLCTJvEBXfi6clNNiLGd?=
 =?us-ascii?Q?RhfmbVDJaVcwtTPKFtEhVyZGajP470EhiL4uFPpaXl1Bns4ZRag3pHypYJb2?=
 =?us-ascii?Q?daEvg2oYWd1k3+XDirowZeXqSrbXRUMMXKOI65P9x1FTXqwWLNbiEZGQqD03?=
 =?us-ascii?Q?Dzn9kyIFbAXnf+ZSnNd5TqcLiDEeZNOS+pTepZDm1xSVpRSEHq4AV76g1Zlp?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc3c889-2aca-4a42-a06f-08dc5901bb04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:35.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQBx+17K5lWdbNx0uLXCIlYbPW5ekQfi1my55zPWR7BYMRP23E3lgyn926eSjfiYIsjOAxd0pkO6xRjO5ZoFug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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

Let's ensure that we have an option for inner callers that will
raise WARN if device is not active and not protected by outer callers.

Make this also a void function forcing every caller to unconditionally
put the reference back afterwards.

This will be very important for cases where we want to hold the
reference before scheduling a work in a queue. Then the work job
will be responsible for putting it back.

While at this, already convert a case from mem_access_get_ongoing where
it is not checking for the reference and put it back, what would
cause the underflow.

v2: Fix identation.
v3: Convert equivalent missing put from mem_access towards pm_runtime.

Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  4 ++--
 drivers/gpu/drm/xe/xe_pm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h         |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 71bd52dfebcf..50ec661116a2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -128,7 +128,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+		xe_pm_runtime_get_noresume(xe);
 
 	return 0;
 
@@ -217,7 +217,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_device_mem_access_put(gt_to_xe(q->gt));
+		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9ef03f23a2d7..1692cf08e950 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -489,6 +489,26 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/**
+ * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
+ * @xe: xe device instance
+ *
+ * This function should be used in inner places where it is surely already
+ * protected by outer-bound callers of `xe_pm_runtime_get`.
+ * It will warn if not protected.
+ * The reference should be put back after this function regardless, since it
+ * will always bump the usage counter, regardless.
+ */
+void xe_pm_runtime_get_noresume(struct xe_device *xe)
+{
+	bool ref;
+
+	ref = xe_pm_runtime_get_if_in_use(xe);
+
+	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+		pm_runtime_get_noresume(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0cb38ca244fe..119b630ad1d1 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-- 
2.44.0

