Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00CBC05023
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BC61129A5;
	Tue, 16 Apr 2024 03:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIAhC2rW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613441129A1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236708; x=1744772708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AHvNwjR+K2hqaY9xrE3kge6v7GyOM3PWHw7xLsM/h00=;
 b=BIAhC2rWPodZWmo7PGPfdhSVyr5YMQF3PW+aWceKfZX48APvgyRrn81o
 ikTQE+jlwACotKEtcPJ4jwjgDivkFZnd07wK0jII2OoxWMchwjybtnjmJ
 bBh/nyJXndaXvwNBXoFhspo9cSM8jnNGSr8Z2a2WXee4q48t4onYaXTwx
 OEwAQFXrdZCPhnP/VeLaZBTEhkSPehpM4R9tErqryIcOKyRBV93nu9DvZ
 LUHtgUWtxAWGEULr8fhQRgGTnwZYR5EQOJtHPBtfFggPd5pMGSLRYjc0M
 /3Qjxxq8ciY1+Oi2Ho0scODGJadEsjhMEGW4DBtHY5vDKAIR6PCzoCg5D A==;
X-CSE-ConnectionGUID: sqDEE6tMQKGaCjvHlRp1qw==
X-CSE-MsgGUID: STM/eUDJSA+m8XYq/hGzcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213821"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: frsG1TNvTDKL8s5A6EnrlA==
X-CSE-MsgGUID: duqEHh42TCqL1AiGeI6PSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895693"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/7] drm/xe: Per client usage
Date: Mon, 15 Apr 2024 20:04:47 -0700
Message-ID: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

Add per-client usage statistics to xe. This ports xe to use the common
method in drm to export the usage to userspace per client (where 1
client == 1 drm fd open).

However insted of using the current format, this creates a new one with
the unit "ticks". The intention here is not to mix the GPU clock domain
with the CPU clock. It allows to cover a few more use cases without
extra complications.

Last patch was a quick implemenation of a gputop-like tool in python.
I ended doing it to cross check the gputop implementation. I's not
really meant to be applied here.

I tested this on DG2 and TGL with kmscube (console-only) and vkcube
(in a gnome session), but it would be good to soak this under more
tests. The biggest goal for this patch series right now is to get
consensus on the new UAPI.

TODO: Add documentation on top with the new interface.

Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/

Lucas De Marchi (5):
  drm/xe: Promote xe_hw_engine_class_to_str()
  drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
  drm/xe: Add helper to capture engine timestamp
  drm/xe/client: Print runtime to fdinfo
  HACK: simple gputop-like impl in python

Umesh Nerlige Ramappa (2):
  drm/xe/lrc: Add helper to capture context timestamp
  drm/xe: Add helper to capture context runtime

 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   9 ++
 drivers/gpu/drm/xe/xe_drm_client.c            |  81 ++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  37 ++++++
 drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  29 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 ++
 drivers/gpu/drm/xe/xe_lrc.h                   |   2 +
 drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c             |   2 +
 pyfdinfo                                      | 113 ++++++++++++++++++
 13 files changed, 292 insertions(+), 19 deletions(-)
 create mode 100755 pyfdinfo

-- 
2.43.0

