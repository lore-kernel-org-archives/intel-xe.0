Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A87AC282D1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 02:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8A10E088;
	Fri,  7 Mar 2025 02:37:04 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EC510E088;
 Fri,  7 Mar 2025 02:37:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=5Fpc=3A_Retry_?=
 =?utf-8?q?and_wait_longer_for_GuC_PC_start?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 02:37:03 -0000
Message-ID: <174131502315.70714.15075053986914585868@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306233906.1043286-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250306233906.1043286-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/guc_pc: Retry and wait longer for GuC PC start
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
commit 71e3fa4702e06dbde0e28eadd8e9e164c7dc9267
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Mar 6 18:39:06 2025 -0500

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
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 9796125d0726448924abdb8c73077c7486e3dd3d drm-intel
71e3fa4702e0 drm/xe/guc_pc: Retry and wait longer for GuC PC start


