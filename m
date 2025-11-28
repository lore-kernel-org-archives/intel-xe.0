Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E473CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 15:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA21710E868;
	Fri, 28 Nov 2025 15:38:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9609E10E868;
 Fri, 28 Nov 2025 15:38:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Rust_GPUVM_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Nov 2025 15:38:53 -0000
Message-ID: <176434433361.38795.15211150072564413539@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
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

Series: Rust GPUVM support
URL   : https://patchwork.freedesktop.org/series/158211/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dfb7567469d0fd0201ffefc9bfc3cbf27a5da0ba
Author: Alice Ryhl <aliceryhl@google.com>
Date:   Fri Nov 28 14:14:18 2025 +0000

    rust: drm: add GPUVM immediate mode abstraction
    
    Add a GPUVM abstraction to be used by Rust GPU drivers.
    
    GPUVM keeps track of a GPU's virtual address (VA) space and manages the
    corresponding virtual mappings represented by "GPU VA" objects. It also
    keeps track of the gem::Object<T> used to back the mappings through
    GpuVmBo<T>.
    
    This abstraction is only usable by drivers that wish to use GPUVM in
    immediate mode. This allows us to build the locking scheme into the API
    design. It means that the GEM mutex is used for the GEM gpuva list, and
    that the resv lock is used for the extobj list. The evicted list is not
    yet used in this version.
    
    This abstraction provides a special handle called the GpuVmCore, which
    is a wrapper around ARef<GpuVm> that provides access to the interval
    tree. Generally, all changes to the address space requires mutable
    access to this unique handle.
    
    Some of the safety comments are still somewhat WIP, but I think the API
    should be sound as-is.
    
    Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
    Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
    Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
    Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
    Signed-off-by: Alice Ryhl <aliceryhl@google.com>
+ /mt/dim checkpatch f0525ac2ab2d085a083fe1671aebb7b4dfc8ba67 drm-intel
1be72af2003c drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
edf793fabae6 drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
3cd276e58bcd drm/gpuvm: use const for drm_gpuva_op_* ptrs
dfb7567469d0 rust: drm: add GPUVM immediate mode abstraction
-:66: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#66: 
new file mode 100644

-:968: WARNING:LONG_LINE_COMMENT: line length of 114 exceeds 100 columns
#968: FILE: rust/kernel/drm/gpuvm/sm_ops.rs:437:
+        // SAFETY: If we reach `sm_step_unmap` then we were called from `sm_map` or `sm_unmap` which passes either

-:987: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#987: FILE: rust/kernel/drm/gpuvm/sm_ops.rs:456:
+        // SAFETY: If we reach `sm_step_remap` then we were called from `sm_map` or `sm_unmap` which passes either

total: 0 errors, 3 warnings, 0 checks, 1302 lines checked


