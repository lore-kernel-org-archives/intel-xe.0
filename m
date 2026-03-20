Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD3FB5EA9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 05:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653D010E878;
	Fri, 20 Mar 2026 05:02:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F1B10E161;
 Fri, 20 Mar 2026 05:02:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Rust_GPU_buddy_allocator_?=
 =?utf-8?q?bindings_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Mar 2026 05:02:42 -0000
Message-ID: <177398296299.378384.458913408081307081@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320045711.43494-1-joelagnelf@nvidia.com>
In-Reply-To: <20260320045711.43494-1-joelagnelf@nvidia.com>
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

Series: Rust GPU buddy allocator bindings (rev3)
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
commit c89528b86ff747960b4acdf705d5129b049c49d8
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Fri Mar 20 00:57:11 2026 -0400

    MAINTAINERS: gpu: buddy: Update reviewer
    
    Christian Koenig mentioned he'd like to step down from the reviewer
    role for the GPU buddy allocator. Joel Fernandes is stepping in as
    reviewer with agreement from Matthew Auld and Arun Pravin.
    
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a drm-intel
3114ebc098a8 rust: gpu: Add GPU buddy allocator bindings
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

-:470: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#470: FILE: rust/kernel/gpu/buddy.rs:344:
+                to_result(unsafe { bindings::gpu_buddy_init(ptr, size, chunk_size.as_usize() as u64) })

total: 0 errors, 2 warnings, 0 checks, 699 lines checked
c89528b86ff7 MAINTAINERS: gpu: buddy: Update reviewer


