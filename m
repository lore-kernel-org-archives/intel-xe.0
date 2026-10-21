Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B3606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EF+xe0rq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2799810E316;
	Wed, 21 Oct 2026 15:00:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9110E316
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 14:59:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C7FB041593;
 Wed, 21 Oct 2026 14:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAC71F000C2;
 Wed, 21 Oct 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1792594796;
 bh=fnugHqjVwV6D66r9u8SEgaKV/fLKtzuYWL8n1FAaAHI=;
 h=Subject:To:Cc:From:Date;
 b=EF+xe0rq7Ym76N1QM02N6a/5sqN/v7q5IqesYazHwpSv1jRbXl/3FN+8aBe3PNk4r
 bFT2HBX+uOBQJ6GJUJbofQR3Aq3ye0ly6Rj4wuYBaieHUahQ0XKMYGSoR/302WaYu8
 YRU9PmEZ1FoFOTtubeV5v6sqbXjq/+/YotC8DvNE=
Subject: Patch "drm/xe: Don't transfer shrinker pages for pinned bos on
 purgeable state change" has been added to the 7.2-stable tree
To: arvind.yadav@intel.com, gregkh@linuxfoundation.org,
 himal.prasad.ghimiray@intel.com, intel-xe@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 21 Oct 2026 16:48:51 +0200
Message-ID: <2026102151-compound-fondness-145b@gregkh>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


This is a note to let you know that I've just added the patch titled

    drm/xe: Don't transfer shrinker pages for pinned bos on purgeable state change

to the 7.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-xe-don-t-transfer-shrinker-pages-for-pinned-bos-on-purgeable-state-change.patch
and it can be found in the queue-7.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ffbfd3f98f4393e91dffce3a46ccb7cf5329cf2f Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 9 Oct 2026 09:00:53 +0200
Subject: drm/xe: Don't transfer shrinker pages for pinned bos on purgeable state change
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit ffbfd3f98f4393e91dffce3a46ccb7cf5329cf2f upstream.

Pinned bos have their pages removed from the shrinker's shrinkable /
purgeable counts on pin, and added back on unpin according to the
bo's purgeable state at that time.

However, xe_bo_set_purgeable_shrinker() unconditionally transfers
pages between the shrinkable and purgeable counts. If the purgeable
state of a pinned bo changes, for example by userspace madvising
DONTNEED on a VMA of a bo that is also pinned as a scanout buffer,
this underflows one count and, after unpin, leaves the other one
permanently inflated.

Only update the purgeable flag for pinned bos, and leave the page
accounting to unpin.

Fixes: 536a2ead3a8f ("drm/xe/bo: Add purgeable shrinker state helpers")
Cc: Arvind Yadav <arvind.yadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v7.1+
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Link: https://patch.msgid.link/20261009070053.7790-1-thomas.hellstrom@linux.intel.com
(cherry picked from commit afe6bc012034123fd838328668e609bf57e46bd3)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/xe_bo.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -938,6 +938,8 @@ static int xe_bo_move_notify(struct xe_b
  *
  * Transfers pages between shrinkable and purgeable buckets when the BO
  * purgeable state changes. Called automatically from xe_bo_set_purgeable_state().
+ * For pinned BOs, whose pages are not accounted, only the purgeable flag is
+ * updated, so that the correct bucket is used when the BO is unpinned.
  */
 static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
 					 enum xe_madv_purgeable_state new_state)
@@ -954,7 +956,8 @@ static void xe_bo_set_purgeable_shrinker
 		return;
 
 	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
-	tt_pages = tt->num_pages;
+	/* Pinned bos are not accounted. Only update the purgeable flag. */
+	tt_pages = xe_bo_is_pinned(bo) ? 0 : tt->num_pages;
 
 	if (!xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_DONTNEED) {
 		xe_tt->purgeable = true;


Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-7.2/drm-xe-bump-lru-for-external-objects-on-exec-and-rebind.patch
queue-7.2/drm-xe-don-t-transfer-shrinker-pages-for-pinned-bos-on-purgeable-state-change.patch
