Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A680DD2CE1C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 04:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152910E0CD;
	Fri,  5 Dec 2025 04:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U010KVu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F9E10E0CD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 04:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764910548; x=1796446548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uMEvHkLnQ+WlNOSbtrrqf8uz/WUb9bVC3rkEuJ7jR0A=;
 b=U010KVu+Ai7Ihb46GIYPJqGX5c+wo7WZjZffHnDE1fEUQL/+muukl+Hu
 5Vwa1VIVn2zgpn2zuKhx0S8h9DPSDJ8DDUnahFjeLXVEP1CeV7q1vJfTW
 TLViyRclDPG3dmN7m42aQT8qlR6d/hxEIXM0jQ5uYidlF3U7ad6u87guv
 sFnm2CRycr8kv+qcnZR3Ac903xBme2NhsgN76Tr9D19qpAbwgZyYGjBRm
 Ji7EFLDhEe/1llMkpXV6lKlDHhhMygZ1qnYL3dgvDe7oSrbkE4CqphPRi
 /6zAeSXUG61XFMW/ZcYyhyrZAnkaiNqclBL8g2+So7k9Axo6JvSdeCP5L Q==;
X-CSE-ConnectionGUID: +r6NugM8S2q3F7y5zVzewQ==
X-CSE-MsgGUID: WkSAjX7sSPKL/dV/cdeFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70562027"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="70562027"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 20:55:47 -0800
X-CSE-ConnectionGUID: 65czvOT6SkKIu/Hyl7zFfw==
X-CSE-MsgGUID: RNd76q1uTvueOOOV9UQG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195286149"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 20:55:47 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com, joonas.lahtinen@intel.com,
 matthew.brost@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Date: Fri,  5 Dec 2025 05:55:28 +0100
Message-Id: <20251205045529.3801762-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
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

Jan Maslak (1):
  drm/xe: Restore engine registers before restarting schedulers after GT
    reset

 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1

