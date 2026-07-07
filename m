Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E96C44503
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 13:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3C210F13D;
	Wed,  8 Jul 2026 13:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iod2B8/B";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF68B89854
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 15:06:06 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2caea3f742bso61363135ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 07 Jul 2026 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783436766; x=1784041566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ECigN/vOXEtjui4ch8BDCR2M2DmfXoIRQNpruIQx7/M=;
 b=iod2B8/Baxq5kzBeBB52XiJ7TObU+n7lf4g+D5cA6WB+qWK11zTY1GOe27GRoTHqRl
 LnrwO2CI8SV9bvqk2TO7ttjqMCRgArIFsKhLme3wJ1gIUvj7xNUI421BTTJTv3wEV3OJ
 CZvJOujOnDBd/kEnCtncS2GFznMv03WA7sf54KhtlEUi2V/jvDy+zKgxYx74rHUaz11p
 o7bsqEsBkUmcrQDttirvl3GhcfWkngwQewW3hCaP6Gpuy1z+4jOwZTXm2btsxU7xHgpM
 Z2Zo1NaL2S1CuG1RK8ZIjr6VpkBS2MvL9mwsAKt4NP2tmZHrdeb9v5vebD/H1GQdDrDN
 xKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783436766; x=1784041566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECigN/vOXEtjui4ch8BDCR2M2DmfXoIRQNpruIQx7/M=;
 b=OOdZyQnWK9h2v4tfwVAN+NlkGixrs1tO+nc6YEbzYtI1ICWK3iYDSnI5s0AEN8oJah
 373N43pcP4tpx5TXE69R4WwVQ1OoNU4UrqwoQZzYAMeg2UURbsrLNJuKkA3IUcBwsA2H
 HyQGVvDtChxDwAVzh4ONntNIh59KWDJKeW17ttvp6iXRobf8ENWv40blmcSk6JIgs+yl
 QWnM9NpO/HXoiLet2dF7uOu6wzCzGNjkfKMe3JmPGjc2eholquEVQvW1px1WXjlZMtEF
 hu4J/XA1Ds5OywgQcx76OhckhDqJCww6xVVt58onPNs+WCtTGci5lBHwokkBSLgo0Wq3
 WNqA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqiEWLVk9QBkq+TCD9zXP/7lt0zQi0EnthpKDaUiir/csZbox60NCjXdbJRKShdDQXQlN+6gBfzYQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwPl87uc99wwBbTN7/aqkg6TpRbxeDE3APRE3WXT1rRhDuH1Zv
 eVGewmSLIc6gjfLifrjl7DMSes2JXkJXdrBtplrkMHUAIW/zzeAueLHJ
X-Gm-Gg: AfdE7cm83Q59L9AFx7jXKnWetL5kgiz4NdviHueXhZ8JBsmgZR4BXPc1HnW/EiN10SH
 wxP5LvV5uIq+5PBogPEbcssNc5DWt1o6r7swwYNlaNNJfmy7fUQXw3tAKE5xjMn4muD77tYuY0i
 T4E/TZQGkgyFff1nmEw9b9zi94JZkl3T4TBIt9gbo7o1qQUxg+oCWEMw45664LwJ+fSLxOh//u6
 hiWf23hF5Yxsln8CpxkzxtrrxA26z6lUqIJp3ndqBwdEokuZVASmwvt3YsX4sEhMiwLiGyhH9SH
 rjqwa3Q5/chwtywSAO3mHDPWUDevcEDWPeqHu1WzycxOw3jHJVUq/bXBwSWthDXgVn0+WHIzn1k
 V+WdSi3pGo2aK7rZi+o2N1aRQEzgVCWGFUL7i/GcrddBfQ125PpYfeK6OcwEu9bqZw9UIxkGJuF
 Nkz3oV0kpkHbCAJH6GIFEH7w8ewPI4u3Ej
X-Received: by 2002:a17:903:98f:b0:2c9:ff29:3f73 with SMTP id
 d9443c01a7336-2ccbf00d8eemr56727535ad.28.1783436766121; 
 Tue, 07 Jul 2026 08:06:06 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3b906sm13966655ad.56.2026.07.07.08.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 08:06:05 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/xe/lmtt: Unpublish page tables on allocation failure
Date: Tue,  7 Jul 2026 23:05:59 +0800
Message-ID: <20260707150559.2274875-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jul 2026 13:49:02 +0000
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

LMTT allocation publishes a newly allocated child page table before
recursing into the next level. If a lower-level allocation fails, the
error path freed the page table directly but left the parent's software
entry and hardware PTE pointing at it.

The caller's failure cleanup then calls xe_lmtt_drop_pages(), which can
walk the stale entry and destroy the same subtree again. The stale PTE
also remains visible until the next invalidation.

Clear the parent software entry, write an invalid PTE, invalidate the
hardware view, and then destroy the partially allocated subtree.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda93906..9b0f8d4b26abc 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -406,8 +406,13 @@ static int __lmtt_alloc_range(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pd,
 
 		if (pt->level != 0) {
 			err = __lmtt_alloc_range(lmtt, pt, offset, next);
-			if (err)
+			if (err) {
+				pd->entries[idx] = NULL;
+				lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, idx);
+				lmtt_invalidate_hw(lmtt);
+				lmtt_destroy_pt(lmtt, pt);
 				return err;
+			}
 		}
 
 		offset = next;
@@ -453,7 +458,10 @@ static int lmtt_alloc_range(struct xe_lmtt *lmtt, unsigned int vfid, u64 start,
 	return 0;
 
 out_free_pt:
-	lmtt_pt_free(pt);
+	pd->entries[vfid] = NULL;
+	lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid);
+	lmtt_invalidate_hw(lmtt);
+	lmtt_destroy_pt(lmtt, pt);
 	return err;
 }
 
-- 
2.51.0

