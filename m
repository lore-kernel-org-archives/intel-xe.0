Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CBFC531FA
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 08:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D8510E053;
	Fri, 24 Jul 2026 08:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7waNz1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01DF10E051
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784883435; x=1816419435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B44CVnQwVISm1XlDK3LU4qqypjZR93FsZiXwqzf3OT8=;
 b=G7waNz1Y3J5RZQOeoO0zlWmMEsmW1ryyxUwy+kWaK45OVqvnZBrMN0K5
 v5Mxv3yRLOAoGFMNkqRzRaaOgjyhc1KKyn1ZHxyHU8SM1Ge2Wmc9t4CBo
 2WBloBH+8OeOQF+LSYfqnTnyR6qFwpqtl3ZZEE6n3tbi9qgrmFshTLLsf
 MVKT7ntc1GmF0I43KGgNgdrdW+v71DDtzuL4Cw0uZj/KuHp/2taKSKb/A
 P1A3QMgcSyDgVvDDGGBavP+hBcZeUMrvdSQRa29vns7y9vKr3iQnoU7AK
 1S7EfMwYgxgiCH6p2onxZDPHsfeg8b4UwlmlkABWRQl341fvS7Buv72BU A==;
X-CSE-ConnectionGUID: e2ZfIA+KQTuj1Njd3+sbww==
X-CSE-MsgGUID: C0bQeZ58TMKlnw2y0RHgjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103088783"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="103088783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:57:13 -0700
X-CSE-ConnectionGUID: KDgXFXSzStiyU4CZr0lS0g==
X-CSE-MsgGUID: ljdiol5yT3On+PKak1ONkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="259318387"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:57:11 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, dnyaneshwar.bhadane@intel.com,
 mallesh.koujalagi@intel.com, matthew.brost@intel.com
Subject: [RFC 0/1] drm/xe: Use RAS logging for GT fault paths
Date: Fri, 24 Jul 2026 14:27:02 +0530
Message-ID: <20260724085703.2540087-1-arvind.yadav@intel.com>
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

This patch is a small follow-up on top of the structured RAS error
logging infrastructure series:

https://patchwork.freedesktop.org/series/168333/

That series adds SIG_ID based error reporting and the xe_ras_log_*()
helpers. This patch converts a few existing driver-detected GT fault
logs to the structured RAS logging path.

Arvind Yadav (1):
  drm/xe: Use RAS logging for GT fault paths

 drivers/gpu/drm/xe/xe_guc_submit.c | 35 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pagefault.c  | 10 +++++----
 drivers/gpu/drm/xe/xe_ras_log.h    | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c         |  4 +++-
 4 files changed, 44 insertions(+), 19 deletions(-)

-- 
2.43.0

