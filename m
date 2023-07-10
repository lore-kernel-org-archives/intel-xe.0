Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F58EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE8310E252;
	Mon, 10 Jul 2023 09:42:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40F10E259
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982135; x=1720518135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xF+CWAjAUmyY3ZmNK+cAADNSj+K2O4K+f4PAJnDC8Vw=;
 b=ST5PC+6LHFyEYnsM0IvSO3hGUwmOEQaoatxbGcCDbpURm59ExjWntbcE
 K0yg2w+fnierXbzOqsDvRy9YjOzVZpeOxWWJd4q473pA2Eu0BFCkMNZp9
 gE0GeGymNCDDyskGmXeJOOwtnMXUoZ3fxbgY0egPCGZnq8afhNGqZ1OhH
 rsNtJao05fskPdZXAP5hGoM9yBVjdiElhJjM/s3Q7fa7pZ3FrYN0mIjqt
 4vbGAl1kA+bBPXW8FafQ6qHlqXybG5Uno6TC8/Z5TH9YWpEdcTMpn9w4g
 /lgZKbEMTfagiPWzczW/XBDdcHYWtfpl7CTnkNK0uV3/F4EDgSWzOhp/m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395081128"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395081128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755940738"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755940738"
Received: from congsip-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:40:48 +0100
Message-ID: <20230710094037.28179-23-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 10/11] drm/xe/ct: update g2h outstanding for
 CTB capture
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Looks to always to be zero when inspecting the CTB dump.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index acf488b00b66..0b086d17c083 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1219,6 +1219,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 
 	if (ct->enabled) {
 		snapshot->ct_enabled = true;
+		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
 		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
 					 &snapshot->h2g, atomic);
 		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
-- 
2.41.0

