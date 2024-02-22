Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D56EC47DD9
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 23:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4921010EAB5;
	Thu, 22 Feb 2024 23:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfwNvzTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162F310EAB5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 23:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708644244; x=1740180244; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=G3583sf1aOC/p6a4S9yYwtCmc48Qs92Ti39ltwWOdr4=;
 b=nfwNvzTGdRKg+mt1HkHmfavfQbU9FU3OvASGSPvccVc3OsHiND1FEINJ
 R+KgDpCEm6EVaP0Hmuk0r+0JwNYQZXYye7DDRfNtyVy933Agu2I08MSTd
 5e6gFdNLJsBSOErNEP1uf5XdPxgPUh/EGawgLpLhJN74SIdf46mKPvzGm
 0dHdep2uc67odR2TuGcnDsVNPiC/a182cTbwJ1PgI+b9H9G9LFWmf6907
 jOAYomSsHTqL21zuLW0OGozb0OQuXOWHYc455Iq4+Ti0QwysajS0gcoZ5
 ER0d9GGPaB6GzpfC7C9LciVOtY0OFHl4VREJmNCqqHQqIkabx3eFjP8zH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20462550"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="20462550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36688150"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 15:24:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 15:24:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 15:24:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 15:24:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOql6f8rpFKA+ShM9bty6GCNzsi87afg2fR6JDgsyKiFLHBX6Y+8POt5IAuR6TlYA4rti2zYzFh0ZcFAqUNU9a2UgrQTx0JUSBD57W2ybskucundmqjtI1IdDIsTWYv8zIPc2ftkE/l8LrGzbM4F3hcwwRxpK/ijT7igHQ8pWI9SPjDRmERt/6vVuxE/Bu4MR4fQ/MLWBnA1nDxM5j798tNNw/IHF68qcFGWOUHIyGVDRMKuuXlH/KCYNfF2UeVCTsdqMAwQDQ6CeGBRHaw8Gs8RuJIMbg40v4VoRtGNxgxK1IHiZSmfOjcYMBT9rXd38AJDWtL3Zxe5eICFuKWhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUhtjujUPQBRx7jHhWznSWaXeiIF9MQzpae+YFxs4bs=;
 b=Z3cIQxo4enq4s7tjioWJxZJfFmIUsAVTKYFM+ed6nrYwvSKkCisTTDThaW6/kexxUS4BOvnSRsM0h8UHlFNUHCyTNYOITfwPmIttKdRU8FQp1kycwW3T7d5TuJr8mCO/H8N40UGsUcdFyV2PNm8jSjRxmRvPvGY98bvzY9lCviijXofRMwEyMbMPIQA7/Gx5SujCPrb2iSyN6sGpz9/B7cu3ej6jIQnR//W05U/419/omV21FfBG89zEbTU/sno+vEKf+vToM08HzqF41JBUh6wt6cAe9qfx3n5RZ3iHUGniGiEZauaBAaETdIdoZxrejhK1eszziFWbAYmrmUeWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5708.namprd11.prod.outlook.com (2603:10b6:610:111::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 23:23:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 23:23:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI] drm/xe/uapi: Remove unused flags
Date: Thu, 22 Feb 2024 18:23:56 -0500
Message-ID: <20240222232356.175431-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c3ee4f-eec2-436c-ae53-08dc33fd58b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtSrejuNfLxLyKwyOG/QzOBKi8cZNCyWNhZVV77zzVkc/HtWN+AHHmV6qhomsEPvljFLdVWh/GtUPcG8ZTUf4d67jPS6PJSkOVsUM3YvGCrQuK9sTVOhXKw9QUCffcAHhjg2UIXUheAPpIv10WviV30ey/cn/iL+YBvbDC+ZadaNrOe22AhyrHuFzPM/bzl1Uk9K4yhEXCeyaZPQgpgVx3X6aPfpvwK7I3GhRqpbhSgn5PLriyiF5c6Ulh4sW1lkVTvjTP6h+iSr9TVDFIZByX7VTAEr/HyglYATV8tKjeTBIjvat82USByPbRxPc5RH0YlVvbUN8l9SIYty8pHWTDoe8b577aHja67XRH3+NnQpoDoDy6Px5WGBcxIYsvcRxlgytUxA/DBUM0qkvWfC5eTnP+Xg95u5IRkTqSoaGItBfEYRYxUZfjjr4axAEdyJz4zPuK4C4T0eo3g8vYwFFM8jFTfmyvk6OyBC6fFQCCG+UnmSTnYyoG/UcVQ5dcsAoHP2u8NcvfwEcpzDBJ6qxLI5/5kDrqv+PiY8HNedXAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjB0S0t5b1QvV2pSKy9yWkZRTGREN1ZnODJUblg2ZkhEMWxzdVU2aklDWlFi?=
 =?utf-8?B?VlltY0xKVjZVUTJqdjM0bWdENEtWK3k2bStITGNEQTg5QnBBaEl2ODhJQ3pT?=
 =?utf-8?B?bldSaTZ3ZVhvNncrVmhVSXMyZmcyQWJ2ZXdiTmF2K2svd3RBY1oxTTlpQ3c2?=
 =?utf-8?B?TUFLb1NLNGJSOFkybmF3WjlsaDlNd005YW1OQWhuR0Z1QytPOGV2d1VsMUpD?=
 =?utf-8?B?WEMxclRDNkNBem5TRUF4T2xhbVpNOXRWU0VlQ0NIOUJoMlpCNm9pb1hyU0pH?=
 =?utf-8?B?WTNyUWpJeHVsQ0FBN3BLWVp4L1Zob3YzaWNSa3pSeDM0dWNZc0JmbzJYd1ZZ?=
 =?utf-8?B?UE50MUFVa1RrUktHaFQ3UVhmcFpTQmV5WisrYjJMNnJzcFVEdEpzeXczcFc5?=
 =?utf-8?B?Q1J1OEZUYWEvQXhSUG9TbUVlb2NXajMvZFh3c0QwVDAxOGVNK3Uvbld6dW9a?=
 =?utf-8?B?U2djeXhzbXdIb21PaGpnTWtnK2tVTmVSb1A1SngwT0YxR3cxTzRoQkY3Q3Ez?=
 =?utf-8?B?SEtYdjdPTjNoR2VPWXRjQnFMaGxWcXRjZUNTNUZ3eWhadE5NcFBRNFdjaVpE?=
 =?utf-8?B?dWkzdDY4ZTM1bXpCd2R5Y2VEekE2ZFYwUW1qRUhDcmg2UTd3QkZYU3Nldjh4?=
 =?utf-8?B?cEVjODRWY29GeHRYY0wvNEZ0YnhJVHllL08wM3pldHNwajBOMTJrZ1ZaenJ2?=
 =?utf-8?B?ckQwTHJuUTIwc3Fqb0pBU29FZnpnMmxpTG1IZ0NjT3BMYTJSbXlkdnFUenhC?=
 =?utf-8?B?UzRzREQ0TTR6RkdTbW9yelk0RDJsMkFWSjVTSjdYckVLTXhBWjllcnlxY01a?=
 =?utf-8?B?bm9QeEF4SEluMzVHRGswZ3JHZHVxWm9nOUtNQk5LTXA4aERoTVBXWEw0emYw?=
 =?utf-8?B?TVpvSHd4MWEvVjU4cUNya3VRY3R0UFM3ak85eG5Vem5NRjdvR25kSENKYkY2?=
 =?utf-8?B?LzNDdURRekdLMmdNcXUzR2t3UDBKK0M3UDFhejB3c05Bd2RjMC9wOXR0cE85?=
 =?utf-8?B?VGYwODczRUJaak5RRzJLOUJpQ3cwUE9WeWk4VGl3Nmwra0todnNkdVM3RllF?=
 =?utf-8?B?OElNcVRZQmtTY2REOGttNXNjbFpsZ1lORHZrVzBteFV1TWRnRDZuNVY1RHJ5?=
 =?utf-8?B?S3h0QUxDT1dRVlQrdjdycDltODl5bkJnblBPMUVlTENPa05rZ1UvQ0s2cTJR?=
 =?utf-8?B?QVd4cW1SQ0NiNjIvRjNmbFlDT3dTbDVJNnBKSkxCTWQ5a2Vrd29FWmp2cjI3?=
 =?utf-8?B?ZEd4QUJsSHl0SGRzZUU3T0tSTDVIelNvNXpQLzlFZFJwRUx2NXZTell0QVRO?=
 =?utf-8?B?QVh1WmQrUnYzZ1RUZkhBQ01QbmdhOE82cG9BajVnTTJPVnBldjRhMnVLdEhu?=
 =?utf-8?B?NmV6K2srczNSTk1pVFN1K1VkakpFK2FwVlgzVVFKV1l3WTJPaWNtcmhKekdr?=
 =?utf-8?B?WGxSMlNtUFBtcW50TVhuVEx6amhqTTF5Rjk2Y245bURSeDM3WXk1Nit6UDRj?=
 =?utf-8?B?V1lEeDRYc3ptTGpiYUorTUlIL1ZWMHZUVTNGR1M4NC9ITXFsNHdnVDdlbVNH?=
 =?utf-8?B?eG5XbXJkeThWNUpMSWZMQjMyenNWVE9MNVhXN3pvU1QrOHpTWTQxNEE0UzB2?=
 =?utf-8?B?aytuazJNaUtkY3o2QldJZU92Wm84U1lzT1dIVTkvZlllRHo5L042SFAzSlJ5?=
 =?utf-8?B?d3l3ZE5pWEhweEFBSXE2RjFJR0d1WjhxdmwrVUMrSXBsUEhGeW5LNkZOUnoy?=
 =?utf-8?B?dWdhNHFCVHIzeFEzbFBFaG9KelpYRXBjUGh5ZVFJYWg4TXZwQjJxY0p5SzFN?=
 =?utf-8?B?UU95NlN5STRTZlNRb2lTVnl3b2ZyZ0l4VndPd2E0UXhhRUV6SGJGa3UyN01l?=
 =?utf-8?B?RzNSOGxWcUJmSGpkNjFsWjlkdjY2ZWVlU3Y4ZjNrWklZSUNLckxEdzlWOFB3?=
 =?utf-8?B?WjZwait2MWl3YlNBTWt1eEIxTkRzcWxKRzF6N1F1RVQxYXZQM0dCU2xjUU1D?=
 =?utf-8?B?V2tYNmhQUUVQcUVGWDdzdXVVdGVBL1Y1cEdMQ0E3eEJpU2VPWjZXWFdKZlln?=
 =?utf-8?B?U0FWVDF4NkJPclJiQkJyaGVzaGJjay94RUtBTy83NUJuY2xDRE5zbFVnR0Na?=
 =?utf-8?Q?vlC/IkFD6gaTkvYFh6vHBKOk/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c3ee4f-eec2-436c-ae53-08dc33fd58b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 23:23:58.9689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh3i2pmBdYV52S3pCo1/w8kAQlyKvo2nez25RxAUvslRv0A/qv8mgbtPeBfr17uCLxrv1O5yl+RntkhNN8CokQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5708
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

From: Francois Dugast <francois.dugast@intel.com>

Those cases missed in previous uAPI cleanups were mostly accidentally
brought in from i915 or created to exercise the possibilities of gpuvm
but they are not used by userspace yet, so let's remove them. They can
still be brought back later if needed.

v2:
- Fix XE_VM_FLAG_FAULT_MODE support in xe_lrc.c (Brian Welty)
- Leave DRM_XE_VM_BIND_OP_UNMAP_ALL (José Roberto de Souza)
- Ensure invalid flag values are rejected (Rodrigo Vivi)

v3: Rebase after removal of persistent exec_queues (Francois Dugast)

v4: Rodrigo: Rebase after the new dumpable flag.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 94 +-----------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ---
 drivers/gpu/drm/xe/xe_lrc.c              | 10 +--
 drivers/gpu/drm/xe/xe_vm.c               | 12 +--
 drivers/gpu/drm/xe/xe_vm_types.h         |  4 -
 include/uapi/drm/xe_drm.h                | 19 -----
 6 files changed, 6 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dda90f0c9890..99f8b328f68a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -354,91 +354,6 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
-static int exec_queue_set_preemption_timeout(struct xe_device *xe,
-					     struct xe_exec_queue *q, u64 value,
-					     bool create)
-{
-	u32 min = 0, max = 0;
-
-	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
-				      XE_EXEC_QUEUE_PREEMPT_TIMEOUT, &min, &max);
-
-	if (xe_exec_queue_enforce_schedule_limit() &&
-	    !xe_hw_engine_timeout_in_range(value, min, max))
-		return -EINVAL;
-
-	if (!create)
-		return q->ops->set_preempt_timeout(q, value);
-
-	q->sched_props.preempt_timeout_us = value;
-	return 0;
-}
-
-static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
-{
-	u32 min = 0, max = 0;
-
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
-				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
-
-	if (xe_exec_queue_enforce_schedule_limit() &&
-	    !xe_hw_engine_timeout_in_range(value, min, max))
-		return -EINVAL;
-
-	q->sched_props.job_timeout_ms = value;
-
-	return 0;
-}
-
-static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
-		return -EINVAL;
-
-	q->usm.acc_trigger = value;
-
-	return 0;
-}
-
-static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
-				     u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
-		return -EINVAL;
-
-	q->usm.acc_notify = value;
-
-	return 0;
-}
-
-static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
-					  u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
-		return -EINVAL;
-
-	if (value > DRM_XE_ACC_GRANULARITY_64M)
-		return -EINVAL;
-
-	q->usm.acc_granularity = value;
-
-	return 0;
-}
-
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value, bool create);
@@ -446,11 +361,6 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -469,7 +379,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 
 	if (XE_IOCTL_DBG(xe, ext.property >=
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad))
+	    XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index c40240e88068..62b3d9d1d7cd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -141,16 +141,6 @@ struct xe_exec_queue {
 		spinlock_t lock;
 	} compute;
 
-	/** @usm: unified shared memory state */
-	struct {
-		/** @usm.acc_trigger: access counter trigger */
-		u32 acc_trigger;
-		/** @usm.acc_notify: access counter notify */
-		u32 acc_notify;
-		/** @usm.acc_granularity: access counter granularity */
-		u32 acc_granularity;
-	} usm;
-
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8c85e90220de..7ad853b0788a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -706,8 +706,6 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
-#define ACC_GRANULARITY_S       20
-#define ACC_NOTIFY_S            16
 
 int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
@@ -778,13 +776,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
 			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
-				     (q->usm.acc_granularity <<
-				      ACC_GRANULARITY_S) | vm->usm.asid);
-	if (xe->info.has_usm && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
-				     (q->usm.acc_notify << ACC_NOTIFY_S) |
-				     q->usm.acc_trigger);
+		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e3bde897f6e8..db3f049a47dc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2131,10 +2131,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 		if (__op->op == DRM_GPUVA_OP_MAP) {
-			op->map.immediate =
-				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
-			op->map.read_only =
-				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
@@ -2329,8 +2325,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
-			flags |= op->map.read_only ?
-				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
@@ -2475,7 +2469,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				 op->syncs, op->num_syncs,
-				 op->map.immediate || !xe_vm_in_fault_mode(vm),
+				 !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
 				 op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2750,9 +2744,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return 0;
 }
 
-#define SUPPORTED_FLAGS	\
-	(DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
+#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7d4f810f9c04..3fce50b91256 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -294,10 +294,6 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
-	/** @immediate: Immediate bind */
-	bool immediate;
-	/** @read_only: Read only */
-	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2fefec9c0e94..538a3ac95c54 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -862,10 +862,6 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
- *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
- *    MAP operation immediately rather than deferring the MAP to the page
- *    fault handler.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -958,8 +954,6 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 	/** @flags: Bind flags */
@@ -1076,19 +1070,6 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
-/* Monitor 128KB contiguous region with 4K sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_128K				0
-/* Monitor 2MB contiguous region with 64KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_2M				1
-/* Monitor 16MB contiguous region with 512KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_16M				2
-/* Monitor 64MB contiguous region with 2M sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.43.2

