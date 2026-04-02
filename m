Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A45ACC6B03
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF27010EFA7;
	Thu,  2 Apr 2026 06:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzDONANn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90410F12D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111661; x=1806647661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iYda7pxLdGJ3PZb9IlDFb6xh2vlYAJIKek2Kd26AK7g=;
 b=gzDONANnjisIRwJJoPRuZF4/DXOIppzuzfCPABKKMoMxLtEy8IKE4NxJ
 l21ghpi0ohxI7HxXSIBCk+G08FFrW6Q2KacC2HvSlUOJ/URSEIqx7OljM
 65gW6cKYjawOAIHLHHqKM0+IDc1HmGaiQ1xbkLoWKbjARxO5H+qfgMdG/
 6ZAS4wApVLoyKYTPqh+CWuraN5MC5iT6ywLM5I6MIPsG+UbxTvmvWif2v
 XwZy663+OqFxXsmkuxkteTQdMt2YbLhgTEB3eH+M6vqBBS3gZUV2i2hU7
 Q+5DN3ArWMxiYrrLMsGsQN0XFDcnIVrzauzr4Otu1cj6PWXvmWrOxxGdL g==;
X-CSE-ConnectionGUID: HXXtukRhSPOSajy/rsVZvQ==
X-CSE-MsgGUID: pW4PW6xNTXqU5tCUphQwug==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051756"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:34:21 -0700
X-CSE-ConnectionGUID: THuEhBQKSfGHzPqNOLt8OQ==
X-CSE-MsgGUID: P8RDrM5tQsekyqKwUt08vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="227153602"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:34:19 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com
Subject: [PATCH v1] drm/xe/xe_sysctrl: Restore __le32 type for app message
 header
Date: Wed,  1 Apr 2026 23:33:58 -0700
Message-ID: <20260402063357.1453605-2-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Using a plain u32 for application message header data causes sparse
warnings on big-endian builds when converting with le32_to_cpu().

Restore __le32 type to correctly model ABI endianness.

Fixes: 37ace5254a2b ("drm/xe/xe_sysctrl: Add ABI and mailbox interface headers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/
Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
index 4cbde267ac44..ac48fa7e4818 100644
--- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -47,7 +47,7 @@
  * Header structure for application-level messages.
  */
 struct xe_sysctrl_app_msg_hdr {
-	u32 data;
+	__le32 data;
 } __packed;
 
 #define SYSCTRL_HDR_GROUP_ID_MASK	GENMASK(7, 0)
-- 
2.43.0

