Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8DBC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 14:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3BE10FF00;
	Wed, 24 Apr 2024 14:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiI9+Auh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DD113B9A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713967522; x=1745503522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rrtoMuOkIZVEDl7NQzwtS2hhtXUsh+Az7tCmsrqJYvE=;
 b=IiI9+AuhjClMQEerGEWSy73Kiurm52ll5dT/zpSu6g5w3bRi07tJvRV3
 +WbEb1MtGYfjCp4GZ1I6vvYgJbgPSavTAtPzT7kNr4ndgUFbirgo3ZpCm
 a1hezoqu5Gu8FQsEexdQSu9WYVkx+zTeWvbnONLebE8rIf1odv5KBDWei
 4uEJ0+vOMgBn+gHR00tGimR568MGM2gT/Nbq4HfxnALgjllOHFLyaCedl
 IhQLez0hbrdQWdqJSJlXXQknwfZB/AKGozragO0NbGTJQVb1kFPHe8p4w
 WjvBlvDYbqFPmzJkwKsQSGjJKwBZCH0ngWHj4ngRNHTiYCkkhAcdsWY8o g==;
X-CSE-ConnectionGUID: F9L5AWiQQ1+AzsRQLY3uig==
X-CSE-MsgGUID: QiB45iPwRQmy3I/4d918WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20294109"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="20294109"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 07:05:21 -0700
X-CSE-ConnectionGUID: 2zaG6Xr/TdGj6SS8dReqdA==
X-CSE-MsgGUID: xWQ3rwJtTaSoD40d/Lx8Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24784472"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.46.168])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 07:05:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/guc: Fix typos in VF CFG KLVs descriptions
Date: Wed, 24 Apr 2024 16:05:06 +0200
Message-Id: <20240424140506.2133-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Apart from the obvious spelling typo, use the correct values for
infinity quantum/timeout settings (it's 0x0 instead of 0xFFFFFFFF).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e53ffaee2fcd..5c1d40432ca0 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -194,9 +194,9 @@ enum  {
  *      granularity) since the GPUs clock time runs off a different crystal
  *      from the CPUs clock. Changing this KLV on a VF that is currently
  *      running a context wont take effect until a new context is scheduled in.
- *      That said, when the PF is changing this value from 0xFFFFFFFF to
- *      something else, it might never take effect if the VF is running an
- *      inifinitely long compute or shader kernel. In such a scenario, the
+ *      That said, when the PF is changing this value from 0x0 to
+ *      a non-zero value, it might never take effect if the VF is running an
+ *      infinitely long compute or shader kernel. In such a scenario, the
  *      PF would need to trigger a VM PAUSE and then change the KLV to force
  *      it to take effect. Such cases might typically happen on a 1PF+1VF
  *      Virtualization config enabled for heavier workloads like AI/ML.
@@ -215,9 +215,9 @@ enum  {
  *      different crystal from the CPUs clock. Changing this KLV on a VF
  *      that is currently running a context wont take effect until a new
  *      context is scheduled in.
- *      That said, when the PF is changing this value from 0xFFFFFFFF to
- *      something else, it might never take effect if the VF is running an
- *      inifinitely long compute or shader kernel.
+ *      That said, when the PF is changing this value from 0x0 to
+ *      a non-zero value, it might never take effect if the VF is running an
+ *      infinitely long compute or shader kernel.
  *      In this case, the PF would need to trigger a VM PAUSE and then change
  *      the KLV to force it to take effect. Such cases might typically happen
  *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
-- 
2.43.0

