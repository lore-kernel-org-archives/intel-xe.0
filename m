Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF82606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2pEE2rF7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CA6112C58;
	Fri, 23 Oct 2026 17:01:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106C6112C4C
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 17:00:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A1B7243218;
 Fri, 23 Oct 2026 17:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070E91F01825;
 Fri, 23 Oct 2026 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1792774807;
 bh=OO3YxadxTotsivQmUzIwDqzbxFrfltbxO5y3LvuAy3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=2pEE2rF7bDlRloxCyktwanggSNBiJM6q7OrEJ1WZHq+5lk4umehc094503S1dsdI5
 K9sjgMjay4OOW0yfwaDjr5tlHiBLPvSiLkn1aTOpcfLFusPgTr5lhAD0SMt0lC5Oqd
 6h/VtBdwAbpptcZfWXhEuvU8Fh5joi+3yzumvTNI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Arvind Yadav <arvind.yadav@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 7.2 164/242] drm/xe: Dont transfer shrinker pages for pinned
 bos on purgeable state change
Date: Fri, 23 Oct 2026 18:40:06 +0200
Message-ID: <20261023163717.662320372@linuxfoundation.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023163713.816071858@linuxfoundation.org>
References: <20261023163713.816071858@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

7.2-stable review patch.  If anyone has any objections, please let me know.

------------------

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


