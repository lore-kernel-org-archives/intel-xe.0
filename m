Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA8D3E2A2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 18:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E329810E242;
	Mon, 28 Oct 2024 18:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="uUGoTT8n";
	dkim-atps=neutral
X-Greylist: delayed 734 seconds by postgrey-1.36 at gabe;
 Mon, 28 Oct 2024 10:02:21 UTC
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com
 [203.205.221.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2159510E446;
 Mon, 28 Oct 2024 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1730109738; bh=xeyQ4CVlwUPQjV1gtHpbGii9ZeSWJyc+nho/aGfUvpc=;
 h=From:To:Cc:Subject:Date;
 b=uUGoTT8nOEkYUu1QLaP3qK050tw4qC+XPpiO+UijjRvkiNgWuSMI9xZi5uobnZHJp
 pVBVDzjxsm3Qc5qS72qsKSL6x6V0dXaRSM1CKqPzpaM1tO0skvtWkgSedtVLPKK4sj
 93Hz7gDnOm1T7/PWDxQ9HvjJc6wS+AzUkgoXFWms=
Received: from localhost.localdomain ([111.48.58.10])
 by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
 id ACF3628A; Mon, 28 Oct 2024 17:43:15 +0800
X-QQ-mid: xmsmtpt1730108595tmhr2h2n9
Message-ID: <tencent_46D189AD021D29866D1A9806B47AB013700A@qq.com>
X-QQ-XMAILINFO: M0yQCYO1Pk4BB9UWeDIUyjZs3jTlXV1Ox3W3489j2qduakf8YQmQky95WNP7w3
 kEHZJj3Swch0FXjcS5ciAQqliZAwisS8ib0v4l5b3DUHTMd94sPA9rtLDNodoek0O8Jrd8oEqaLo
 ExFEQ4QQIPxKCFuQBaQsKFs/hRIeCI6aiSwU1E8vutZ+QZmVNSkCwd+jugg8H3qZKE/9mLiKxAst
 KtB0lB2YA0wsY5n3L7hWDP0N39u+2zgCrW7cfVmyHfHRXijzrfjWiVH/n6/P+YYgc6zyJg7TS1uL
 OpxreeJs6/tG+g5BcGTTyZrjDZS3ynmd+LiDBwtuIMtYptjcDm8lEUrrUsPwHC+vVwqOIlNhP0wN
 tv8GtoQtJTQ+RRcxKebED7AnFpgYFung3bSpUFfS+gOfJywifJBp7UqgXyS8HQ5lUOwOc7nJOhdP
 ASpS8U6x/y6ZW6tlNZnHMRzwvJ1mjL9grTjqiymxBTvaO6/5lCy8LH8NBfmCqo22HLavODtKmdBb
 EpAdxq+TAN8v8ORiBVcaJyZ2QiN86d8TjGIugczIrewM5bC6vRhoF09Z4A3H9f6XHQorOBqoAi12
 CQpwhCYJLXMjMvSkW7N+AU/LHgvZUN01y9rNfofyeSQ7A34+vsmit1jxVqk8IH4Ok6MTqYcGhdwT
 XZP2ddKuDj0EDJ6wtJ3O7JjDc3rD/LIJRLrBstwOeExuOevfPaR8jgbGWm4kkyzcss6QjmAM9UH3
 pN52Otdku4RRkyRwxFhfwGUGC3YZssJ3kg8vWwIq4b1YKCtjMdiLwm76TDvBogw/E1ZTpF35trkY
 yLknEV0AyxEQqwnDIJJAFljlQs7wkRfZfqAkayQN9PV5d8Qprs1H8+pkqaUkJU2LL71VUkwKyRdU
 RJr0Z1vF4BNVjSJH1DPKFFnzK6FPIBStBBF/UOp+0ymBAb9omPafA=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: 1064094935@qq.com
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH] drm/xe/hdcp: Fix logic errors
Date: Mon, 28 Oct 2024 17:43:14 +0800
X-OQ-MSGID: <20241028094314.524356-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Oct 2024 18:28:52 +0000
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

From: pengfuyuan <pengfuyuan@kylinos.cn>

Here the gsc struct null pointer check should use '||' instead of '&&'.

Fix the following patches:
    drm/xe/hdcp: Check GSC structure validity

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 6619a40aed15..f4332f06b6c8 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -42,7 +42,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
 
-	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
+	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
 			    "GSC Components not ready for HDCP2.x\n");
 		return false;
-- 
2.25.1

