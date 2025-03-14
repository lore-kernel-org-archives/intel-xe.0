Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B4EC28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 06:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D257810E973;
	Fri, 14 Mar 2025 06:56:06 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733B10E973;
 Fri, 14 Mar 2025 06:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_Add_PSR_p?=
 =?utf-8?q?ause/resume_reference_count?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 06:56:06 -0000
Message-ID: <174193536602.32667.17536719819230179940@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314065015.879143-1-jouni.hogander@intel.com>
In-Reply-To: <20250314065015.879143-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Add PSR pause/resume reference count
URL   : https://patchwork.freedesktop.org/series/146285/
State : warning

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
commit 116c21c61164ad9332cf7842839c0a538fda831e
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Mar 14 08:50:15 2025 +0200

    drm/i915/psr: Add PSR pause/resume reference count
    
    We have now seen this:
    
    <4> [2120.434153] i915 0000:00:02.0: [drm] drm_WARN_ON(psr->paused)
    <4> [2120.434196] WARNING: CPU: 3 PID: 4430 at drivers/gpu/drm/i915/display/intel_psr.c:2227 intel_psr_pause+0x16e/0x180 [i915]
    
    Comment for drm_WARN_ON(display->drm, psr->paused) in intel_psr_pause says:
    
    "If we ever hit this, we will need to add refcount to pause/resume"
    
    This patch is implementing PSR pause/resume refcount.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 92c2fc230c1da008b318974d7ce5bd41a7820ca3 drm-intel
116c21c61164 drm/i915/psr: Add PSR pause/resume reference count
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
<4> [2120.434196] WARNING: CPU: 3 PID: 4430 at drivers/gpu/drm/i915/display/intel_psr.c:2227 intel_psr_pause+0x16e/0x180 [i915]

total: 0 errors, 1 warnings, 0 checks, 66 lines checked


