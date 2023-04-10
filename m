Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085CFC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7490F10E187;
	Mon, 10 Apr 2023 18:32:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4E110E1E2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151548; x=1712687548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQkwH/YunKjSNapzNCQAHyDxyxUPJMQLwXlG1hdqgPU=;
 b=ZP0r7ZhfF/yvujKz4OJe86NCv9VxtQIRO1aPrgUdTV8rerrZuUcB1TgP
 cIquClhDElSt9oV/lHL8Omcl6GVweeAF9fEZj9G/L+ipqvtNM0FOOCpPE
 F3xZr6AigN8Fs6lPJTJrtxLxKY7Q8yEmxcn1p9lBnrYXxbgGWbdFPQLhF
 +0mEbMqU+8Y6TnKQ42NA1WFq3A3NzBjbhPjkTruHsjxnVEKISvp+3n1Zd
 1B2w7kn+Ic9YndJcafdjZX9j0CuLyZ9JPktrkD23Oc1w1FaVx2akjNkgi
 jKBm+6cSXUfq2UdTgNuXlw70dydr/2ZpwFt/rv2lWeDuvP+wyKr2nCzS2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408563416"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408563416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681800994"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="681800994"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:27 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:32:17 -0700
Message-Id: <20230410183219.191543-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410183219.191543-1-jose.souza@intel.com>
References: <20230410183219.191543-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/6] TEMPORARY: drm/xe/display: Enable modular
 fia in TGL
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

drm-tip don't have has_modular_fia anymore but to backport it to Xe
would require us to backport several patches, so this patch is
intended to only live until next Xe rebase.

TGL is the first platform tha has it, this is needed to properly
initialize TC ports in some skus.
Enabling it for DG1 don't cause any issues as DG1 don't have any real
TC ports, so intel_tc_port_init() will not be called for DG1.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 5fab5b9fbde0c..0001a9d02495d 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -486,7 +486,10 @@ void xe_display_info_init(struct xe_device *xe)
 	switch (xe->info.platform) {
 	case XE_TIGERLAKE:
 	case XE_DG1:
-		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
+		xe->info.display = (struct xe_device_display_info) {
+			GEN12_DISPLAY,
+			.has_modular_fia = 1,
+		};
 		break;
 	case XE_ALDERLAKE_S:
 		xe->info.display = (struct xe_device_display_info) {
-- 
2.40.0

