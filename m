Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D9DC28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 17:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7DC10EBEC;
	Fri,  7 Mar 2025 17:24:03 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA0010EBEC;
 Fri,  7 Mar 2025 17:24:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=5Fpc=3A_Retry_?=
 =?utf-8?q?and_wait_longer_for_GuC_PC_start_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 17:24:02 -0000
Message-ID: <174136824250.3625.1018115912607925377@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307160307.1093391-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250307160307.1093391-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/guc_pc: Retry and wait longer for GuC PC start (rev2)
URL   : https://patchwork.freedesktop.org/series/145954/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 31600b18ea766ccb543aff6068606162a38ba194
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Mar 7 11:03:07 2025 -0500

    drm/xe/guc_pc: Retry and wait longer for GuC PC start
    
    In a rare situation of thermal limit during resume, GuC can
    be slow and run into delays like this:
    
    xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
                     [status = 0x8002F034, timeouts = 0]
    xe 0000:00:02.0: [drm] GT1: excessive init time: \
                     [freq = 100MHz (req = 800MHz), before = 100MHz, \
                     perf_limit_reasons = 0x1C001000]
    xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
    ------------[ cut here ]------------
    xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
    
    When this happens, it will block entirely the GPU to be used.
    So, let's try and with a huge timeout in the hope it comes back.
    
    Also, let's collect some information on how long it is usually
    taking on situations like this, so perhaps the time can be tuned
    later.
    
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 066c46f28642479869d2d1dd27cc6ae476de4abc drm-intel
31600b18ea76 drm/xe/guc_pc: Retry and wait longer for GuC PC start


