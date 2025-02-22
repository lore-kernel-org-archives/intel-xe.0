Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03620C021B5
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE72A10E10F;
	Sat, 22 Feb 2025 00:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juYMh13m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE410E10F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183069; x=1771719069;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WEj9kjoijyHpGOSDFDMMwJwJ8axhi0lTFqhWK0iD6GI=;
 b=juYMh13mAZoqGtUH00hz7rufITHLbBz3x24S8YWI18idz/hFDj4srcB3
 52M0D+TGbrSc8yjqoeAq5cl1E8QNjxW+3jtLKSWWqZhMu30fUw1w020wH
 AqGnGaWGMavUsr5OgszRwpeMC6sqxRvuFTnBaZyn43bP5pTgxLGKBJfFd
 HliLpxN0E0DJA+d9ffcAdZuw16zZI5HeHqIUq4TP40+ifMvE0CU3/7TBQ
 51R+o2PNPeFzaN30QQKHELV2LVgAF4TkWW9felmqU1XNmypo0RJMrJIQp
 FztjcnBJeApLAO+bhiUA2LVaaFeVR8yhFK26wSp/wPSGZrOC1mLk1dm9d w==;
X-CSE-ConnectionGUID: PoHbEfaZQPiGROCfguyIbQ==
X-CSE-MsgGUID: b3LoWW2UQ4uxqg3ROTTaTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926388"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926388"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: Y/4KBjk+SgWWtUA8nped5w==
X-CSE-MsgGUID: 6ndOiojrSmy/eO85XXcF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704934"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 03/11] drivers: base: component: Add debug message for
 unbind
Date: Fri, 21 Feb 2025 16:10:43 -0800
Message-ID: <20250222001051.3012936-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Like when binding component, add a debug message to the unbinding case
to make it easy to track the lifecycle. This also includes the component
pointer since that is used to open a group in devres, making it easier
to track the resources.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/base/component.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 741497324d78a..5d10600bbc25e 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -574,6 +574,9 @@ static void component_unbind(struct component *component,
 {
 	WARN_ON(!component->bound);
 
+	dev_dbg(adev->parent, "unbinding %s component %p (ops %ps)\n",
+		dev_name(component->dev), component, component->ops);
+
 	if (component->ops && component->ops->unbind)
 		component->ops->unbind(component->dev, adev->parent, data);
 	component->bound = false;
-- 
2.48.1

