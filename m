Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB0C77B78
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0701410E7E2;
	Tue, 25 Apr 2023 19:26:59 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA28010E5A0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450815; x=1713986815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rr8kpPUy7kahdcEKkBY5DoNzCjxNsixhTTLLfJTBGrY=;
 b=n2BEDQm3Cfsju0oR1nREbuwSfmmlmt3C6p0KJHQiYSE+83XOikpM0Upd
 P1efEQQT092++hXtjaDHNRu1crTVADTQhp1989cU0m3YcF64btJbdIlFq
 DVbhaBzHhYewud0bDvobtPuMofYHhV769vxbVmA/HBLTnNnGmXePt33G4
 uO6N5JKYIg8onGPLOzzD4YDhVSNYmFJh05VGduE1RZuoJOKIQq7tZDXCC
 aNI5H87HQRBjLgipEVr/HyIxamHmd8Z7PJLQCeJKY8A9OAkhFZ0XKqxXI
 jOR2Tvv+ZvdlJvqGY8FBoTPC4kW/9rZgNHAxso/byXf0/F39o72hDOtlq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100909"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100909"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990505"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990505"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:49 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:22 -0700
Message-Id: <20230425192624.168640-14-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 13/15] TEMPORARY: drm/xe/display: Enable
 modular fia in TGL
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
Cc: rodrigo.vivi@intel.com
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
index 408bd7c8d1c75..fbae60c179be1 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -489,7 +489,10 @@ void xe_display_info_init(struct xe_device *xe)
 	switch (xe->info.platform) {
 	case XE_TIGERLAKE:
 	case XE_DG1:
-		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
+		xe->info.display = (struct xe_device_display_info) {
+			GEN12_DISPLAY,
+			.has_modular_fia = 1,
+		};
 		break;
 	case XE_ROCKETLAKE:
 		xe->info.display = (struct xe_device_display_info) {
-- 
2.40.0

