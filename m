Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A0C021A6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 17:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A180010ED21;
	Fri, 14 Feb 2025 17:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDUflcv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7311E10ED1D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739552751; x=1771088751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZHc0Me6eSm6dCCq5HnWbRrBO4ZYUq7DcvRlldVbmHO4=;
 b=lDUflcv31QyuFJWgX9FDVQ4ugh3NRqQ+OQEw0iUp0RnkwioYvoVszC71
 3fUVs82Tk3G919OVls3GKGeZGjAL9rDEym4GFL2UWktYO7ZOSoapqbNIr
 xKawimLNy5tM669nSvel09YY5jv8YlADY1rCHMTSrvP2j9toArUrlvi+j
 VU0yZfwH987f9EZne6L3RqxAIquzhQi75pvkzbxbOdgpXGJ7Jd8wPImnE
 wZ1r5fPhcCmK/HOzuzI8mPMdwpgf1aua1r89ldNdpi8eOvTZlwJ0/L0ur
 Qa26OKa5EnwcTeF9RFXmtVSPeyTMUJI61WC8dVmvwbcs5d8eSUhNUIX76 A==;
X-CSE-ConnectionGUID: tSsQxldOSluZWXkk6yiXzA==
X-CSE-MsgGUID: Du+Qse38Tz6TBWcsqK4mTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40575941"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40575941"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:05:40 -0800
X-CSE-ConnectionGUID: paH0k3FLRXOU5+goo0DZ9A==
X-CSE-MsgGUID: OrvJ9jlRQKGe7d3CCSBDQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113235217"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:05:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/xe/userptr: restore invalidation list on error
Date: Fri, 14 Feb 2025 17:05:28 +0000
Message-ID: <20250214170527.272182-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
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

On error restore anything still on the pin_list back to the invalidation
list on error. For the actual pin, so long as the vma is tracked on
either list it should get picked up on the next pin, however it looks
possible for the vma to get nuked but still be present on this per vm
pin_list leading to corruption. An alternative might be then to instead
just remove the link when destroying the vma.

Fixes: ed2bdf3b264d ("drm/xe/vm: Subclass userptr vmas")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_vm.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..668b0bde7822 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -670,12 +670,12 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
 				 userptr.invalidate_link) {
 		list_del_init(&uvma->userptr.invalidate_link);
-		list_move_tail(&uvma->userptr.repin_link,
-			       &vm->userptr.repin_list);
+		list_add_tail(&uvma->userptr.repin_link,
+			      &vm->userptr.repin_list);
 	}
 	spin_unlock(&vm->userptr.invalidated_lock);
 
-	/* Pin and move to temporary list */
+	/* Pin and move to bind list */
 	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
 				 userptr.repin_link) {
 		err = xe_vma_userptr_pin_pages(uvma);
@@ -691,10 +691,10 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 			err = xe_vm_invalidate_vma(&uvma->vma);
 			xe_vm_unlock(vm);
 			if (err)
-				return err;
+				break;
 		} else {
-			if (err < 0)
-				return err;
+			if (err)
+				break;
 
 			list_del_init(&uvma->userptr.repin_link);
 			list_move_tail(&uvma->vma.combined_links.rebind,
@@ -702,7 +702,19 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 		}
 	}
 
-	return 0;
+	if (err) {
+		down_write(&vm->userptr.notifier_lock);
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
+					 userptr.repin_link) {
+			list_del_init(&uvma->userptr.repin_link);
+			list_move_tail(&uvma->userptr.invalidate_link,
+				       &vm->userptr.invalidated);
+		}
+		spin_unlock(&vm->userptr.invalidated_lock);
+		up_write(&vm->userptr.notifier_lock);
+	}
+	return err;
 }
 
 /**
-- 
2.48.1

