Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ECBC55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 04:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED5610F142;
	Fri, 31 Jul 2026 04:06:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0801610E14D;
 Fri, 31 Jul 2026 04:06:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_make_CTX=5FTIME?=
 =?utf-8?q?STAMP_TOCTOU-safe_and_handle_sentinels_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jul 2026 04:06:03 -0000
Message-ID: <178547076302.7663.2988144571654568917@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
In-Reply-To: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
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

Series: drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels (rev9)
URL   : https://patchwork.freedesktop.org/series/168394/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a45eca1ca26a1d66693bd0518f6cc179fdb7563f
Author: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Date:   Fri Jul 31 04:00:08 2026 +0000

    drm/xe/lrc: Fix ABA race on engine migration in context timestamp read
    
    xe_lrc_context_timestamp() reads the engine id once via
    xe_lrc_engine_id(lrc) and uses it to fetch the live CTX_TIMESTAMP MMIO
    register, then re-checks the LRC-stored value to detect whether the
    context switched out while the MMIO read was in flight. That check
    only confirms the context is (still/again) active - it does not
    confirm it is active on the *same* engine the MMIO read targeted.
    
    If the context is saved and restored onto a different engine between
    the initial engine id read and the final activity check, the
    CONTEXT_ACTIVE sentinel will be observed again (now for the new
    engine), and the stale MMIO value read from the old, now-unrelated
    engine is returned as if it were valid.
    
    Pin the engine id used for the MMIO read and re-validate it against
    the current engine id after the final activity check. If the engine
    changed, retry the whole read (bounded by a small retry count) instead
    of trusting a timestamp sampled from an unrelated context, falling
    back to the last cached value if the context keeps migrating.
    
    Assisted-by: GitHub-Copilot:claude-sonnet-5
    Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
+ /mt/dim checkpatch 374d957e1908042c257b8c239974317bb93b83dc drm-intel
09b881e5fd4b drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
da6cf8082518 drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
-:54: WARNING:MEMORY_BARRIER: memory barrier without comment
#54: FILE: drivers/gpu/drm/xe/xe_lrc.c:892:
+		smp_rmb();

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
a45eca1ca26a drm/xe/lrc: Fix ABA race on engine migration in context timestamp read


