Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50A1C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 07:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CEF10F6BC;
	Tue, 23 Apr 2024 07:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9hJWNsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE8110E15E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713858516; x=1745394516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QWtgV5SwnbigQC5y4kW5dSSkWPJ3LkNWfptdsmZW9DY=;
 b=U9hJWNsqsxKRl7WoqWikujXRGnfSXyZMzPKDcZHVxh8aw7snJGH33ZJf
 XFAilT356v23L7Nq+cV1/knsV5n/sCA3XcmBk7uwTmRkz8Bk/qvSeLnUT
 5j8iqV+pDr6oGjjkJZdpf8y8lJvefn49XOE08sylCXhGF5mq0LfVEFzA+
 vqqr9pzJhiQju8SDT73PkESpuiPfuWGdHEL+MGS74/3w09rJzUNf4AdiS
 k/lkX0ZWq8t3HFCC2KJ2IiCxEC8Iu/ff4PZ7t8DLouOHp2hHmvFv+2s8n
 iU2qh5RWFklDUYNj4zNrzxKtMwOCkN9b8bz08Bj+DDJfj7sAX+CDDO5Ep w==;
X-CSE-ConnectionGUID: jK9MRcoITGy7WNMCz521wA==
X-CSE-MsgGUID: qyFQtdQZRhSMRyY9igtjog==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9967006"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9967006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:48:36 -0700
X-CSE-ConnectionGUID: v2WlsUaiT9WfvKSTUbiFBg==
X-CSE-MsgGUID: 7g4Dwd7dQJm9eGeBfcqVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28955731"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.139])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:48:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] drm/xe/vm: prevent UAF in rebind_work_func()
Date: Tue, 23 Apr 2024 08:47:23 +0100
Message-ID: <20240423074721.119633-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423074721.119633-3-matthew.auld@intel.com>
References: <20240423074721.119633-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We flush the rebind worker during the vm close phase, however in places
like preempt_fence_work_func() we seem to queue the rebind worker
without first checking if the vm has already been closed.  The concern
here is the vm being closed with the worker flushed, but then being
rearmed later, which looks like potential uaf, since there is no actual
refcounting to track the queued worker. We can't take the vm->lock here
in preempt_rebind_work_func() to first check if the vm is closed since
that will deadlock, so instead flush the worker again when the vm
refcount reaches zero.

v2:
 - Grabbing vm->lock in the preempt worker creates a deadlock, so
   checking the closed state is tricky. Instead flush the worker when
   the refcount reaches zero. It should be impossible to queue the
   preempt worker without already holding vm ref.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1676
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1591
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1304
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1249
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2ba7c920a8af..71de9848bdc2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1509,6 +1509,9 @@ static void vm_destroy_work_func(struct work_struct *w)
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
+	if (xe_vm_in_preempt_fence_mode(vm))
+		flush_work(&vm->preempt.rebind_work);
+
 	mutex_destroy(&vm->snap_mutex);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
-- 
2.44.0

