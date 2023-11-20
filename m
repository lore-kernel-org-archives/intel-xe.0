Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF877C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 16:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C4710E432;
	Mon, 20 Nov 2023 16:02:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A710E451
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700496166; x=1732032166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XNgocCizALK776c71TqZhYI1CI9hj/vNEvs9QyAQIW8=;
 b=aHYKNsueNX5aq/ZV5B3OQ+i4l6nSQpAPudYtWiNkkjpRhoKkBPczZE3U
 jUncjbadUxxRJ8k0x3KAQGrik+Ugyv4+JXgvB19QKi/nQa3jNHamu0G7H
 t7QIFXM+jhtDtDt/14nSKU217a1vaFl5HK1Trv2PRSeOvgYYGIRcMJWhH
 Y96xKrA8PJ0mXSSYiWnsCxBSdG0ibeWMznxVr/XZbwHKQbSuU9oIuRJ5r
 Gz3ImrniXRO4ScKE9yiK4ckH7p3OzNWRPDEk9VG+fasL7avry0Bsd4Uue
 eXjJaP+QInWgYhIuZUZcBITmoekEmm7mct6czeQqm1UEWfXMZRpf0YOZ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13193732"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13193732"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 08:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716256505"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="716256505"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 08:02:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 08:02:03 -0800
Message-Id: <20231120160205.669295-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 0/2] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Last versions failed to apply in CI. Re-submitting this on behalf of
Gustavo. No changes wrt v3.

Gustavo Sousa (2):
  drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
  drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts

 drivers/gpu/drm/xe/xe_mmio.c | 60 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 39 ++---------------------
 2 files changed, 62 insertions(+), 37 deletions(-)

-- 
2.40.1

