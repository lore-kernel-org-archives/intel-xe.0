Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC5BC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 17:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC44310E209;
	Wed,  7 Jun 2023 17:49:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BE0810E209;
 Wed,  7 Jun 2023 17:49:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 68B9AA0BA8;
 Wed,  7 Jun 2023 17:49:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 07 Jun 2023 17:49:49 -0000
Message-ID: <168616018942.21184.1126379776870457384@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Im?=
 =?utf-8?q?plement_rcs/ccs_missing_invalidations_and_flushes?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Implement rcs/ccs missing invalidations and flushes
URL   : https://patchwork.freedesktop.org/series/119033/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e101f891af28a3685c61bb6145a14f4a6db6c87f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 7 19:47:29 2023 +0200

    drm/xe: Emit a render cache flush after each rcs/ccs batch
    
    We need to flush render caches before fence signalling, where we might
    release the memory for reuse. We can't rely on userspace doing this,
    so flush render caches after the batch, but before user fence- and
    dma_fence signalling.
    
    Copy the cache flush from i915, but omit PIPE_CONTROL_FLUSH_L3, since it
    should be implied by the other flushes. Also omit
    PIPE_CONTROL_TLB_INVALIDATE since there should be no apparent need to
    invalidate TLB after batch completion.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch dc8094ef1ae1faa7bff0a2a3d510a38ba557302a drm-intel
1745dca57 drm/xe: Invalidate TLB also on bind if in scratch page mode
-:27: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#27: FILE: drivers/gpu/drm/xe/regs/xe_gpu_commands.h:76:
+#define   PIPE_CONTROL_TLB_INVALIDATE                   (1<<18)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 82 lines checked
e101f891a drm/xe: Emit a render cache flush after each rcs/ccs batch


