Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F9DC5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 07:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E4810E0D4;
	Mon, 24 Aug 2026 07:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db7xVC+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C7110E0D4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787555898; x=1819091898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v5N1+W5H7cBCK7FZlHNyaUJDCjrBu1UgQLO0r+BGovI=;
 b=Db7xVC+aaofea7TNs5ItHiO+ElTPIf3GTAi5e6P8pj1yjD46MAEGc14u
 EGisrsICfmMom2r4KC5VvIz2EUwTj4mrX5k9FIolDP6QHjpACXNiKapuN
 npvCd1DdaybGjShgrNg/PJ34tRlAn1qrKUf3r6xnSbP8rdO1pu149gz36
 QjDq6D8kElZPXOPTlNzA8bDh57pXlqsUyGcRzXCmoUEvxAhCKSLg6A+od
 eiK2z1uxbc/15BnmB0eF8o9AblDTvfLsmBTGUD1npmtg88RX1O5ZeEoat
 Dr/GLsWIbJU8S5QBrep6p+9tiSZU1Fu0a0jFIifCS5MSeCLquvGQtxXQE g==;
X-CSE-ConnectionGUID: vrrLxXupROe4xi0mafYrQQ==
X-CSE-MsgGUID: TQYol6yMQkySwtPo/7xrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87116879"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="87116879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 00:18:17 -0700
X-CSE-ConnectionGUID: A2np0lCqSR6EltZu3P3FKQ==
X-CSE-MsgGUID: ho6bUu3KSgSl33yYrXQNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="266393314"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 00:18:16 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v3 0/1] drm/xe: Report GT TDR and VM rebind faults using SIGID
Date: Mon, 24 Aug 2026 12:47:48 +0530
Message-ID: <20260824071749.1345374-1-arvind.yadav@intel.com>
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

This patch is a small follow-up on top of the structured SIGID error
logging infrastructure series:

https://patchwork.freedesktop.org/series/171022/

That series adds SIGID-based error reporting and the xe_log_*() helpers.
This patch converts the GuC engine reset-request failure path to that
logging path.

v3:
- Split GuC and VM changes into separate patches.
- Dropped GuC job-timeout warning conversions to avoid changing warning
  logs into error-level SIGID reports.

v2:
 - Rebased on the latest structured SIGID logging series.
 - Switched from the old xe_ras_log_() helpers to the new xe_log_()
   helpers.

Arvind Yadav (1):
  drm/xe/guc: Report reset-request failure using SIGID

 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

