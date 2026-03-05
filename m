Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BA6F3D334
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 17:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEF010E2C7;
	Thu,  5 Mar 2026 17:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMcs2IFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1A10E2C7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772730208; x=1804266208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=63ScMKrv0jiIhmsZwwSwGOCC1Z3HKPCdWEb/2SMfFzk=;
 b=PMcs2IFwryITCwEOMerqzIs/2PiZKrX1rhtO+dpqzwOSpadZtSbordvv
 3znS7Y1aEW6hylGn3Cx5g2zHytIGcGT9vAYaoT9cJ/zFjUHHbKpUqNuOX
 DZpd5aMQwK7QRzI04VzGe02rOZwN8QAhMB1QNYfj5qyvMljPbihJdt47w
 UY8AsV9rY6jo6Y/AFyROiR+0OkwlehZ1zI4KmBfGooidmukOMtZDENEi+
 yal5fGveDzFgzbLRTlbPUqY20fwUtx3JJXcTIwB95xXzKaRmdzQjFw60d
 ekjPEY3Xn8LK/0h8btwmY9lQmEci6THiUQ98XE1vsFUQUrSQX9HpXimNt Q==;
X-CSE-ConnectionGUID: CUXcTCGiTte8ggMIEERf8A==
X-CSE-MsgGUID: +RoA2GhGQKGScywAu7+lmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77697134"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="77697134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 09:03:04 -0800
X-CSE-ConnectionGUID: zrJyLQJOQAm2FDhUsKrOVQ==
X-CSE-MsgGUID: RluS8FlXSCau4MqkPeSHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218871197"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa007.jf.intel.com with ESMTP; 05 Mar 2026 09:03:02 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, stuart.summers@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI 
Date: Thu,  5 Mar 2026 22:25:20 +0530
Message-ID: <20260305165519.4170892-3-naresh.kumar.g@intel.com>
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

Performance degradation occurs in multi-BMG GPU configurations 
during Peer-to-Peer transactions when one of the two GPUs remains idle
with no engine activity.
The root cause has been identified as frequency downscaling:
the idle remote GPU reduces its operating frequency to the minimum 400MHz,
which negatively impacts the bandwidth available for P2P transactions 
initiated by the active local GPU.

To address above problem this patch ensures for the platform BMG/CRI
the default GT rp frquency min set as 1.2GHz to ensure effetive P2P
transaction bandwidth.

Note: 
While frequency boosting improves performance, 
it also increases power consumption. In single GPU mode,
it causes the GPU to operate at unnecessarily high frequencies by default
and as of now we do not have any mechanism to limit this for single
GPU.

v2:
- Fix Indentation(Thomas)
- Add comment about power impact(Stuart)

Nareshkumar Gollakoti (1):
  drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI

 drivers/gpu/drm/xe/xe_guc_pc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0

