Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD14CA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403810E9B8;
	Thu, 21 Aug 2025 14:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaw4HpBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A2C10E9B0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755786667; x=1787322667;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Gcne+9fhE9+L6KUJ82dKvfo8u5qyZ0AeE+ZdjSJd5Zw=;
 b=jaw4HpBaNlqVTM67zyx8sxGNdbJhfSYSDHFZTu6xRam79tHBl5x/X8q1
 AZAqcXYKyEA7nCNx9Of4lTrEocBTda5/o27AcZ51GYm03fqBUINv2YDeE
 hItgNDthKMTQw4+ScVw/xS4SHn6rkUiiON5jDPFOsSv/hDQLOdyjSkLTP
 6cDt0DktqYJnMiJQablekdcO5st4Ornj2ZT+JB2/lDxpO8nCAfZYg6tTd
 9pMFp29lKVRu14SJ8gAhZO9UnMFUlNcoo4V8fMu7nale7dfiwfzF/hcdQ
 127yNk0a5sCz0yOtBLMQLNEKpCL1qrGy73XDVxRmUJt/h6cgwWlWuJjCT w==;
X-CSE-ConnectionGUID: l3Xp+hNtTAubTzaqKCyQdQ==
X-CSE-MsgGUID: mzjyEt+OTmqyU8AOUwqq2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58175761"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58175761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:07 -0700
X-CSE-ConnectionGUID: 8YcejxQbQOaF6bWelyXoaA==
X-CSE-MsgGUID: jOgBCNNxRLeoODijUmxxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172840867"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/vm: Clear the scratch_pt pointer on error
Date: Thu, 21 Aug 2025 16:30:45 +0200
Message-ID: <20250821143045.106005-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
References: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Avoid triggering a dereference of an error pointer on cleanup in
xe_vm_free_scratch() by clearing any scratch_pt error pointer.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")
Cc: Brian Welty <brian.welty@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Cc: Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c86337e08a55..d3f6dc6b1779 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1635,8 +1635,12 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
 
 	for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
 		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
-		if (IS_ERR(vm->scratch_pt[id][i]))
-			return PTR_ERR(vm->scratch_pt[id][i]);
+		if (IS_ERR(vm->scratch_pt[id][i])) {
+			int err = PTR_ERR(vm->scratch_pt[id][i]);
+
+			vm->scratch_pt[id][i] = NULL;
+			return err;
+		}
 
 		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
 	}
-- 
2.50.1

