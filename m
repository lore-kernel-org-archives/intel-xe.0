Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED986C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 14:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989961122E8;
	Tue, 28 May 2024 14:32:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBF91122E8;
 Tue, 28 May 2024 14:32:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_mem/fsb/rawcl?=
 =?utf-8?q?k_freq_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 14:32:31 -0000
Message-ID: <171690675157.2216896.2686115739683913202@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716906179.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716906179.git.jani.nikula@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: mem/fsb/rawclk freq cleanups
URL   : https://patchwork.freedesktop.org/series/134144/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a749f3fffe7e7e6bc0e79d0159ea304340905bf7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 28 17:25:01 2024 +0300

    drm/xe/display: drop unused rawclk_freq and RUNTIME_INFO()
    
    With rawclk_freq moved to display runtime info, xe has no users left for
    them.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 19284ac0399309b4e564175aef99ca2dcbc34825 drm-intel
ff542f7154ee drm/i915/wm: rename intel_get_cxsr_latency -> pnv_get_cxsr_latency
1d704fd2a634 drm/i915/wm: clarify logging on not finding CxSR latency config
85df19516943 drm/i915/dram: separate fsb freq detection from mem freq
968f4f6dc887 drm/i915/dram: split out pnv DDR3 detection
20874fa61638 drm/i915/dram: rearrange mem freq init
8bb036e0941b drm/i915: convert fsb_freq and mem_freq to kHz
d7c6fe9df1a3 drm/i915: extend the fsb_freq initialization to more platforms
0b7cb056a8a7 drm/i915: use i9xx_fsb_freq() for GT clock frequency
a7f1309a1bf9 drm/i915/cdclk: use i9xx_fsb_freq() for rawclk_freq initialization
9a1316f49525 drm/i915: move rawclk init to intel_cdclk_init()
a9dcb1e79d2f drm/i915: move rawclk from runtime to display runtime info
a749f3fffe7e drm/xe/display: drop unused rawclk_freq and RUNTIME_INFO()


