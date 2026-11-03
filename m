Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4B606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 00:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PK/Of11x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7BA10E720;
	Tue,  3 Nov 2026 00:15:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017410E720;
 Tue,  3 Nov 2026 00:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793664932; x=1825200932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=328Cbqa+ETtC4aeTF6ARl0cXCjiYdxEghbRtnuhUYHU=;
 b=PK/Of11xdsmsXF197PYJ0/CEMdjOeQmF3tuIcAET7vR1VYOuQMwRJnoL
 6zpwPtNt9lQWx7yk1gbSZSUAgiv4r0BXN9J++N11oiXgFUg81/In75Cis
 lxO4QDDPO+Kry3eoPNNdoGB/JJm60VMpmGA7qWRTGvjwuGkg8inQ5usAL
 POLGTsAHjnNcq8VAdHkMIrH7wSxIrOld9kVuWuwEnmHdAyXlp77iF1Bhg
 FqaTsQ6BKYUUUhCoW7Lfi07Fe+cTyX8jtlcSiMQAMh2BWk61yElqY8Hp8
 2UwBpmSVuAdwEhjErJ+d6HMnSneIUd4PveSeULpbR1JjpE7bUMZkXGAKN A==;
X-CSE-ConnectionGUID: tYToRug7TuqEopclB7gTlw==
X-CSE-MsgGUID: ManODwvETwGhBySi0jTTAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2386896"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2386896"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 16:15:29 -0800
X-CSE-ConnectionGUID: vqfqqulzSd+YgJwm5j7g6g==
X-CSE-MsgGUID: HRXFleMbTx+a5rC8HGUY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6648399"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 16:15:26 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 0/1] drm/i915: LT's support for Vswing / Pre-emphasis
 Override
Date: Tue,  3 Nov 2026 01:15:17 +0100
Message-ID: <20261103001518.3478578-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch continues on series [1]. NVL+ support has been excluded
from past series due to missing columns in VBT#57. With that fixed
support for NVL+ can follow.

IGT part v7 is available at [2].

I have stripped Suraj's R-B trailer since it is a new series and the
patch has changed overall.

Loaded xe with custom VBT on NVL. Block 57 has been filled with default
register values for NVL from kernel.

Dump of Block 57 decoded with [2] of VBT under test:

Block 57 min size 2 less than block size 962
BDB block 57 (962 bytes, min 2 bytes) - Vswing Preemph:
        Number of vswing tables: 3
        Number of columns: 5
        Number of rows: 16
        PHY type: LT
        Vswing Table #1 (eDP):
                Preset #01: txswing: 0x0000000c, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000001, post-cursor: 0x00000000
                Preset #02: txswing: 0x0000000d, txswing_level: 0x00000000, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #03: txswing: 0x0000000f, txswing_level: 0x00000000, main-cursor: 0x00000003, pre-cursor: 0x00000001, post-cursor: 0x00000002
                Preset #04: txswing: 0x00000013, txswing_level: 0x00000000, main-cursor: 0x00000007, pre-cursor: 0x00000001, post-cursor: 0x00000003
                Preset #05: txswing: 0x0000000e, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #06: txswing: 0x00000010, txswing_level: 0x00000000, main-cursor: 0x00000002, pre-cursor: 0x00000001, post-cursor: 0x00000002
                Preset #07: txswing: 0x00000015, txswing_level: 0x00000000, main-cursor: 0x00000005, pre-cursor: 0x00000001, post-cursor: 0x00000003
                Preset #08: txswing: 0x00000012, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000001, post-cursor: 0x00000002
                Preset #09: txswing: 0x00000016, txswing_level: 0x00000000, main-cursor: 0x00000004, pre-cursor: 0x00000001, post-cursor: 0x00000003
                Preset #10: txswing: 0x0000001a, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000001, post-cursor: 0x00000003
                Preset #11: txswing: 0x00000000, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: txswing: 0x00000000, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: txswing: 0x00000000, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: txswing: 0x00000000, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: txswing: 0x00000000, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: txswing: 0x00000000, txswing_level: 0x00000000, main-cursor: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #2 (DP 1.4):
                Preset #01: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #02: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #03: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #04: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #05: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #06: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #07: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #08: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #09: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #10: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #11: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #12: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #13: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #14: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #15: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
                Preset #16: txswing: 0x00000001, txswing_level: 0x00000001, main-cursor: 0x00000001, pre-cursor: 0x00000001, post-cursor: 0x00000001
        Vswing Table #3 (DP 2.0):
                Preset #01: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #02: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #03: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #04: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #05: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #06: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #07: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #08: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #09: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #10: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #11: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #12: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #13: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #14: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #15: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002
                Preset #16: txswing: 0x00000002, txswing_level: 0x00000002, main-cursor: 0x00000002, pre-cursor: 0x00000002, post-cursor: 0x00000002

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260904123148.2165596-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/igt-dev/20261102235853.3437332-1-michal.grzelak@linux.intel.com/

Michał Grzelak (1):
  drm/i915: override LT's default Vswing / Pre-emphasis when requested

 drivers/gpu/drm/i915/display/intel_bios.c     | 46 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h     |  3 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    | 16 +++++++
 3 files changed, 65 insertions(+)

-- 
2.45.2

