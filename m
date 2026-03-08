Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BA6EA853C
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 18:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A26710E476;
	Sun,  8 Mar 2026 18:10:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E8B10E06D;
 Sun,  8 Mar 2026 18:10:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Rust_GPU_buddy_allocator_?=
 =?utf-8?q?bindings_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 08 Mar 2026 18:10:54 -0000
Message-ID: <177299345405.331690.11170801237334565832@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260308180407.3988286-1-joelagnelf@nvidia.com>
In-Reply-To: <20260308180407.3988286-1-joelagnelf@nvidia.com>
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

Series: Rust GPU buddy allocator bindings (rev2)
URL   : https://patchwork.freedesktop.org/series/162098/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2b9b452a07d3d611c40691ef22fe6abf9c234da
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Sun Mar 8 14:04:07 2026 -0400

    rust: gpu: Add GPU buddy allocator bindings
    
    Add safe Rust abstractions over the Linux kernel's GPU buddy
    allocator for physical memory management. The GPU buddy allocator
    implements a binary buddy system useful for GPU physical memory
    allocation. nova-core will use it for physical memory allocation.
    
    Christian Koenig mentioned he'd like to step down from reviewer role for
    GPU buddy so updated accordingly. Arun/Matthew agree on the modified entry.
    
    Cc: Nikola Djukic <ndjukic@nvidia.com>
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch f705e865254996e9a099a22a9320e523e6debdcf drm-intel
b2b9b452a07d rust: gpu: Add GPU buddy allocator bindings
-:79: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#79: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 702 lines checked


