Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D62FEFB4E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA0A10EB49;
	Fri, 27 Feb 2026 13:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m9/+nf8g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MdmdOK74";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m9/+nf8g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MdmdOK74";
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB65610EB52
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:31:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 876033FFDF;
 Fri, 27 Feb 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NWPYUaGMo+D0CbUfpRFXHdXe0eu1WRyMhkhK6IMAMFA=;
 b=m9/+nf8gPKYzUzkHcE3NnfXS5Q0/lSQZTT2B4DqgHlcPgZM+1znbrz3oXpCX5VeG0i8DOw
 M4EeDnw3qlWtRHc3mRKMqE2H/COYFXvxLtJBErJdq4uu4stk6hcERfqZiMNGIwo1y5YBYh
 aZSQSTP5HQyJ8aGzr8a9z41CtfOdpJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NWPYUaGMo+D0CbUfpRFXHdXe0eu1WRyMhkhK6IMAMFA=;
 b=MdmdOK74rGL/BGc20MxFuzn5frtirD6B1lmExrSbMTOTjoRjop4HPGto+NhUmx6TUkNrCe
 uYrvF28yL6tsU7BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="m9/+nf8g";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MdmdOK74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NWPYUaGMo+D0CbUfpRFXHdXe0eu1WRyMhkhK6IMAMFA=;
 b=m9/+nf8gPKYzUzkHcE3NnfXS5Q0/lSQZTT2B4DqgHlcPgZM+1znbrz3oXpCX5VeG0i8DOw
 M4EeDnw3qlWtRHc3mRKMqE2H/COYFXvxLtJBErJdq4uu4stk6hcERfqZiMNGIwo1y5YBYh
 aZSQSTP5HQyJ8aGzr8a9z41CtfOdpJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NWPYUaGMo+D0CbUfpRFXHdXe0eu1WRyMhkhK6IMAMFA=;
 b=MdmdOK74rGL/BGc20MxFuzn5frtirD6B1lmExrSbMTOTjoRjop4HPGto+NhUmx6TUkNrCe
 uYrvF28yL6tsU7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 414E83EA6A;
 Fri, 27 Feb 2026 13:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mOazDq6coWkrLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 13:31:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Test for imported buffers with drm_gem_is_imported()
Date: Fri, 27 Feb 2026 14:31:12 +0100
Message-ID: <20260227133113.235940-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 intel.com:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 876033FFDF
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8ff193600443..b28ed3fa370e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -817,7 +817,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 		return ret;
 
 	/* Don't call move_notify() for imported dma-bufs. */
-	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
+	if (ttm_bo->base.dma_buf && !drm_gem_is_imported(&ttm_bo->base))
 		dma_buf_invalidate_mappings(ttm_bo->base.dma_buf);
 
 	/*
@@ -1707,7 +1707,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	struct xe_tile *tile;
 	u8 id;
 
-	if (bo->ttm.base.import_attach)
+	if (drm_gem_is_imported(&bo->ttm.base))
 		drm_prime_gem_destroy(&bo->ttm.base, NULL);
 	drm_gem_object_release(&bo->ttm.base);
 
@@ -2829,7 +2829,7 @@ int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
 	 * No reason we can't support pinning imported dma-bufs we just don't
 	 * expect to pin an imported dma-buf.
 	 */
-	xe_assert(xe, !bo->ttm.base.import_attach);
+	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
 
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
@@ -2899,7 +2899,7 @@ void xe_bo_unpin(struct xe_bo *bo)
 	struct ttm_place *place = &bo->placements[0];
 	struct xe_device *xe = xe_bo_device(bo);
 
-	xe_assert(xe, !bo->ttm.base.import_attach);
+	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5adabfd5dc30..052ddb167dbf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3604,7 +3604,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 	 * with a PAT index that enables compression.
 	 */
 	comp_en = xe_pat_index_get_comp_en(xe, pat_index);
-	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
+	if (XE_IOCTL_DBG(xe, drm_gem_is_imported(&bo->ttm.base) && comp_en))
 		return -EINVAL;
 
 	/* If a BO is protected it can only be mapped if the key is still valid */
-- 
2.52.0

