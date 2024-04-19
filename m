Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EA5C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 18:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D440010FFC5;
	Fri, 19 Apr 2024 18:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8NFS3dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F0710FFC5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713551663; x=1745087663;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ndEerpY4K+FQemBF4xE5lax4FEEjyDQChZjDaR0kAic=;
 b=O8NFS3dpjF7Ay4a8ScNJ1f6WcGqEFnH2KmCi0IfJZHNwXEzRQ7uQ4iWE
 57+dy4Y86PbFmXdE/2RpjSVTw0O3N59U4+nQ/YQ0/QcdpOHi7qV3ZsrOG
 vPhMgd+Sx2CIHGr/lCm45jU1NBWO96CmNzjBFaWL1XsYEFBCyRkklMJpl
 VMG8G+Nm/mbtUpzP8OQqq4Qt2ydGmw1qIaxSS3dR89bp0YyA3GpTGxcfY
 Bbm8pRuFO/uYruEPK4VNwb5/b9H9c4cGw4C0UTcp/jij1A2aeNJ0nkgaQ
 XmCNjG2ev/nHMxBI57F51WXjm9Nq/mAv0mVVTpe0YvWVvyj4n+soD6feq A==;
X-CSE-ConnectionGUID: fJgckO5+Q7+8Nnr+UJoQHw==
X-CSE-MsgGUID: ERu+sJCRQs+MCoSnWUSHnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26681787"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="26681787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:34:23 -0700
X-CSE-ConnectionGUID: F26MljUcQY+Mm6SMZOvcZA==
X-CSE-MsgGUID: uvMV0ncWRJmWennx6eOP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23392430"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:34:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/gsc: define GSCCS for LNL
Date: Fri, 19 Apr 2024 11:34:12 -0700
Message-ID: <20240419183412.1605782-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240419183412.1605782-1-daniele.ceraolospurio@intel.com>
References: <20240419183412.1605782-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
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

LNL has 1 GSCCS, same as MTL. Note that the GSCCS will be disabled until
we have a GSC FW defined, but having it in the list of engine is a
requirement to add such definition.

v2: rebase

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a0cf5dd803c2..58126b3f9112 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -211,7 +211,8 @@ static const struct xe_media_desc media_xe2 = {
 	.name = "Xe2_LPM / Xe2_HPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
-		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
+		BIT(XE_HW_ENGINE_GSCCS0)
 };
 
 static const struct xe_device_desc tgl_desc = {
-- 
2.43.0

