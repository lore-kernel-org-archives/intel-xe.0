Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E36CDB465
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 23:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B3210E035;
	Wed, 11 Oct 2023 23:10:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE8D10E035
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697065814; x=1728601814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1F5tnyRn+3Oh5Qva0IiVUk6PHVEBGHbhuuz/lCX0++I=;
 b=aBQTgMned9Zks6eu5Q0ew1Gl11eGND4bmniOmbNUgAVKp2GGZkd8l8oS
 T3HK9OYDGQJu8ZWLTQoF6d3knmqHz6+GI1jlic8eBgaMqTyuphOqBy70u
 GMp+02nL6q4tak2Xhf9nfyxjplcrYUz6Ju1aufisAYMZdBmMiquLkaBon
 STXpVi+PKjw66Hfa5TfLqTOQfBpGesusEbDCtN9IOV7kyaOcRRo7NpM9X
 YTth9BTPU4KvnBmHv+r9e/+eXCY2/XWdwn9XnhmTDzrYYRWMZgYmEwiUI
 6evvWSB20tpSciKnEMOj7+2hf1u4QrKOCCd4onzHb8ShOzuDtdZiIBMoV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451282082"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="451282082"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="703919053"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="703919053"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:09:58 -0700
Message-ID: <20231011230957.463381-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] LRC debugfs and general instruction tweaks
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

During device probe, workarounds that target registers in an engine's
LRC image are applied and then a snapshot of the context image is saved
as the "default LRC" which is later copied as the starting point for all
new contexts.  Internally the engine state is encoded as a batchbuffer
that the hardware can execute on context switch to restore the relevant
registers and other state information.

"LRC workarounds" are those which target registers that are part of the
an engine's LRC; the driver programs the registers with the desired
updates before triggering creation of the default LRC snapshot, thus
ensuring that the necessary settings are inherited by all new contexts
that get created.

There's an upcoming workaround that will require the driver to emit not
only updates to specific registers at driver init, but also some
non-register state (e.g., 3DSTATE_* instructions) before snapshotting
the default LRC.  This is also expected to become necessary for
non-workaround initialization on future platforms as well.

Before we start making these updates to the initial engine state and
default LRC, it's helpful to be able to see exactly what's inside the
context image.  The changes here add some debugfs entries that dump each
engine type's default LRC with some basic instruction header decoding.
E.g.,

        $ sudo cat /sys/kernel/debug/dri/0/gt0/default_lrc_ccs
        MI_NOOP (1 dwords)
        MI_LOAD_REGISTER_IMM: 15 regs
         - 0x1a244 = 0xffff0048
         - 0x1a034 = 0x000000f8
         - 0x1a030 = 0x000000f8
         - 0x1a038 = 0x00fc0000
         - 0x1a03c = 0x00003001
         - 0x1a168 = 0x00000000
         - 0x1a140 = 0x00400004
         - 0x1a110 = 0x00000000
         - 0x1a1c0 = 0x00000000
         - 0x1a1c4 = 0x00000000
         - 0x1a1c8 = 0x00000000
         - 0x1a180 = 0x00000080
         - 0x1a2b4 = 0x00000000
         - 0x1a120 = 0x00000000
         - 0x1a124 = 0x00000000
        MI_NOOP (1 dwords)
        MI_LOAD_REGISTER_IMM: 9 regs
<...snip...>
        MI_NOOP (6 dwords)
        PIPELINE_SELECT (1 dwords)
        STATE_BASE_ADDRESS (22 dwords)
        STATE_SIP (3 dwords)
        STATE_COMPUTE_MODE (2 dwords)
        3DSTATE_BINDING_TABLE_POOL_ALLOC (4 dwords)
        3DSTATE_CHROMA_KEY (4 dwords)
        3DSTATE_CHROMA_KEY (4 dwords)
        3DSTATE_BTD (6 dwords)
        MI_NOOP (114 dwords)
        MI_BATCH_BUFFER_END

A few other changes are made to the general way GPU instructions are
defined in the Xe driver to make the definitions more consistent and
easier to re-use in the new dumping logic.


Matt Roper (6):
  drm/xe: Make MI_FLUSH_DW immediate size more explicit
  drm/xe: Separate number of registers from MI_LRI opcode
  drm/xe: Clarify number of dwords/qwords stored by MI_STORE_DATA_IMM
  drm/xe: Extract MI_* instructions to their own header
  drm/xe/debugfs: Add dump of default LRCs' MI instructions
  drm/xe/debugfs: Include GFXPIPE commands in LRC dump

 .../drm/xe/instructions/xe_gfxpipe_commands.h | 107 ++++++++++
 .../gpu/drm/xe/instructions/xe_inst_defs.h    |  32 +++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  61 ++++++
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h     |  33 ----
 drivers/gpu/drm/xe/xe_bb.c                    |   1 +
 drivers/gpu/drm/xe/xe_execlist.c              |   1 +
 drivers/gpu/drm/xe/xe_gt.c                    |   3 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  41 ++++
 drivers/gpu/drm/xe/xe_lrc.c                   | 187 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
 drivers/gpu/drm/xe/xe_migrate.c               |  10 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |  21 +-
 12 files changed, 450 insertions(+), 52 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_inst_defs.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h

-- 
2.41.0

