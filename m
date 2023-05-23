Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BB6C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EBC10E440;
	Tue, 23 May 2023 13:51:09 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668610E440
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:51:07 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f4b256a0c9so2375865e87.2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20221208.gappssmtp.com; s=20221208; t=1684849865; x=1687441865; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wRC7/fGaTj42vyU/1p0xQlxqwERjYuuS14+Ah0ENEuM=;
 b=s6FCvuYR8SuQSKzIMhOr6gwA3DiaITYu1qIh+08ST/81H/UP6cTQzNtYd4UOw/fam+
 4M6D9eX+m2UHxr2p1OD3w84Otao9FrB1sL3pMxLuPt9cgt/TARXPBHAeXzEPymw1MgCD
 UnZ+RcAt1sWW+7E6sXrf/5TY3vkhGJFhWv0N6yswn7tGh70xqOYmaIeSUgUeNIhQJ8hE
 NRxohHC4CMwSF00kfv/4wHwdULcCfvdcKGgH2yWdEVzpCBMG0lzbBfPpU8SzRUmEh56p
 mNS2sht3gmiQoYqg6fxyPM/p1a6IrAl1LyeuHjxHIICSIQ6iac3qOtbSK7nFfm58c6Rs
 3JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684849865; x=1687441865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wRC7/fGaTj42vyU/1p0xQlxqwERjYuuS14+Ah0ENEuM=;
 b=SewU7ezxz8Eq3/mEi/ytIWKhs+XULOqD2hU+N81u0pcdNHOJ89ZoHNd78oCJwbL/Ux
 gl0KvY0qdBp+XjXA9udGMCYw9+SrPCRbnHTeQO1yu7prIP5V8CsnSLODyqLlFBoTyNbr
 vKZmbOZqnRfe12makcZJ8o72FvULMzSLALaMzX+OcMDraclYhRZ+0dnSijVifxWXGLNO
 OZMZo9/eVDrpl23JP2127UG7MiwvdB19QdPMQNdfhBm9owRBRlndFBucvcBNICxY2lFc
 d65S7zUv/Hc//He1T1xqxXRPGQ6jIgUXP3GT4X7mWxzrr2eGn7ozH7VYA9DU21tTjxzc
 l9Rg==
X-Gm-Message-State: AC+VfDxX8v/YxypW2F6KuGCHlRbxDBr9r4lpUrJz+ebNqmjEkKKI1G2u
 4kmWZ5HK20eCpJBNw638XCIBDMxar/Cov501Z3M=
X-Google-Smtp-Source: ACHHUZ7NE+qU28Ss328XUH58rTpHA/ndT2XsQ7Ka2rp2EmUopy94c8jFkjvRXcwkZ6d8ZEKnQOkBfw==
X-Received: by 2002:a05:6512:218d:b0:4ea:e60a:2f5d with SMTP id
 b13-20020a056512218d00b004eae60a2f5dmr3801947lft.40.1684849864899; 
 Tue, 23 May 2023 06:51:04 -0700 (PDT)
Received: from localhost (83.8.55.66.ipv4.supernova.orange.pl. [83.8.55.66])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a197612000000b004efef5cf939sm1343757lff.83.2023.05.23.06.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 06:51:04 -0700 (PDT)
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 15:50:19 +0200
Message-Id: <20230523135020.345596-1-michal@hardline.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Fix uninitialized variables
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

Using uninitialized variables leads to undefined behavior.

Moreover, it causes the compiler to complain with:
../drivers/gpu/drm/xe/xe_vm.c:3265:40: error: variable 'vma' is uninitialized when used here [-Werror,-Wuninitialized]
../drivers/gpu/drm/xe/xe_rtp.c:118:36: error: variable 'i' is uninitialized when used here [-Werror,-Wuninitialized]
../drivers/gpu/drm/xe/xe_mocs.c:449:3: error: variable 'flags' is uninitialized when used here [-Werror,-Wuninitialized]

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 2 +-
 drivers/gpu/drm/xe/xe_rtp.c  | 2 +-
 drivers/gpu/drm/xe/xe_vm.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index c7a9e733ef3b..ec82088b73f0 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -373,7 +373,7 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
 static unsigned int get_mocs_settings(struct xe_device *xe,
 				      struct xe_mocs_info *info)
 {
-	unsigned int flags;
+	unsigned int flags = 0;
 
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 0c6a23e14a71..86fd1025b931 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -115,7 +115,7 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
 	if (!rule_matches(gt, hwe, entry))
 		return;
 
-	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
+	for (i = 0, action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
 		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
 		    (action->flags & XE_RTP_ACTION_FLAG_ENGINE_BASE))
 			mmio_base = hwe->mmio_base;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..109a5d93be89 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3262,7 +3262,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (!vmas[i])
 			break;
 
-		list_for_each_entry_safe(vma, next, &vma->unbind_link,
+		list_for_each_entry_safe(vma, next, &vmas[i]->unbind_link,
 					 unbind_link) {
 			list_del_init(&vma->unbind_link);
 			if (!vma->destroyed) {
-- 
2.40.1

