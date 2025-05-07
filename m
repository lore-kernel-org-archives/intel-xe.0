Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55334C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 19:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4F410E881;
	Wed,  7 May 2025 19:12:45 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87D810E880;
 Wed,  7 May 2025 19:12:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vsec=3A_Allow_for_?=
 =?utf-8?q?kernel_context_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 19:12:44 -0000
Message-ID: <174664516481.57056.13124664329427153378@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507183907.260707-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250507183907.260707-1-michael.j.ruhl@intel.com>
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

Series: drm/xe/vsec: Allow for kernel context access
URL   : https://patchwork.freedesktop.org/series/148726/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b4d2631e6ab267d68b0d68106ae38f4f5d7552bd
Author: Michael J. Ruhl <mjruhl@habana.ai>
Date:   Wed May 7 14:39:01 2025 -0400

    drm/xe/vsec: Allow for kernel context access
    
    The PMT driver allows kernel level access to device data.
    Because of this, the mutex lock turns out to be a poor
    lock.
    
    Change the mutex to a spinlock to avoid sleeping when it
    isn't allowed.
    
    Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
    Signed-off-by: Michael J. Ruhl <mjruhl@habana.ai>
+ /mt/dim checkpatch 12ed58de6491fc48168f29de1c0fa9e9917b858d drm-intel
b4d2631e6ab2 drm/xe/vsec: Allow for kernel context access
-:48: WARNING:USE_SPINLOCK_T: struct spinlock should be spinlock_t
#48: FILE: drivers/gpu/drm/xe/xe_device_types.h:530:
+		struct spinlock lock;

total: 0 errors, 1 warnings, 0 checks, 41 lines checked


