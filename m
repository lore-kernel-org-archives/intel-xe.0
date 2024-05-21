Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02406C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 15:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C3310E21B;
	Tue, 21 May 2024 15:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn95G1+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189010E1F3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716305038; x=1747841038;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=bCRR2k1S/KlCX/XbQyYsKuEjDAC96YVXWvqoUu5T7+w=;
 b=Zn95G1+RkB03su2ooYZYCWfYZTVqa4BKApHWbUFrWppYsFpUo71JWcKA
 XaEFmRPHVaOmdsVd5W72gm5gCY8D2zeyCenM2Z05t/sw/jR+msKzz4Wn1
 X8Dzf6DeVkyX7+QUMI7NODwDaIvxnv7jzfRmF8UOlW5RcMaFix2VG75at
 49N+7c1LGZLWveEfqJxkYYODpKVswK+sW1hJWxc3iFcpwDu2voAr50VjK
 80M89wKxDKIhOcEbMAeOSbMtf+CNGhn2vZXy3jA4q3/rdf5rJ3bwIWxVN
 6NjvRZ+QBaAGTAKMxGtdpKV+P+leTzbGZtBAIHvkdeO/ZARdXDvtF8+CV A==;
X-CSE-ConnectionGUID: TruSVF9nS8qKFStn7Keqtg==
X-CSE-MsgGUID: bGmhtyT9T3K5g2xPaWcx1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15456272"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="15456272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:23:57 -0700
X-CSE-ConnectionGUID: 0uZf/kIVTTOxvd4e18NoHg==
X-CSE-MsgGUID: EeFzrqH2SdOsm9DlBcpqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37361107"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:23:56 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 21 May 2024 17:23:46 +0200
Subject: [PATCH] drm/xe: flush gtt before signalling user fence on media
 engines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
X-B4-Tracking: v=1; b=H4sIAIG8TGYC/x3MSwrCMBAA0KuUWTvQpimiVxEJ+UxMQFOZMSVQe
 nejy7d5OwhxJoHrsAPTliWvpWM6DeCTLQ/CHLpBjUqPi5qwVROfVZLZvBhHcWUyNVLxhPbs9BI
 u2sd5hh68mWJu//x273ZWCB3b4tOvDPzCRliofeA4vlqWhwiKAAAA
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=bCRR2k1S/KlCX/XbQyYsKuEjDAC96YVXWvqoUu5T7+w=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmTLyLRHo5EzP2hcceipVe2V2JVZmw2gDsidhR56o0
 hbSwSfKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZky8iwAKCRAjYrKT3hD917Q7C/
 9v72ql4HrKHVcOovFiyMocgcRCKAcPB92XT9gUFNg+OzcV2oPhhIACHAnDrfb7ogkEVE/xFW3Lerso
 AMiyHujuLANfjLUvt2Qqn1uf8YcKZc4qRm3llzZlQpPFJd/h+tKF3VSDU8IB9MMH9Qg3cNlqeQ2YmG
 ttl5I6Y7e/S4yJmNI1suC+/A55JpA/6WhpIuhDk5eIResLbRYtw4t5woBwPCICDy890H3A8+Ii6mfJ
 Rh4A/tpUKftfqVvAknAtxFQBssRV1qlZpPF50QE91igXYZ4Ubh7Jnv1BjoKs+EkCw1LLMHhQGdc0Hc
 1+pNGQ7y50k7aRVNZ3Lx4T/YzL67Z7NOfoZFTH3UKQvW6xPzeAyJEMyIMznB+ihz9cP4luykG9dQDt
 Vr/xH7UUJeiuCd2HNcdifsJdGbC65283JKZq4q+g6DSWo4QYPiCUQmczogsrNmUu/bbz/6oHYDwWg0
 YDJNcRkm94U9UH+MLYT2m0WjO40/o2n+YH1nj2+wVkKRI=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Tests show that user fence signalling requires kind of write barrier,
otherwise not all writes performed by the workload will be available
to userspace.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a3ca718456f6..eb36901f96ff 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
-
 	i = emit_user_interrupt(dw, i);
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);

---
base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

