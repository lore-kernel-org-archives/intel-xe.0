Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A50F4BB93
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEF410E624;
	Tue, 24 Feb 2026 22:37:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE7C10E340;
 Tue, 24 Feb 2026 22:37:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_rust=3A_clist_patches_for?=
 =?utf-8?q?_nova-core_memory_management?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Feb 2026 22:37:12 -0000
Message-ID: <177197263224.281933.1254929947109485375@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
In-Reply-To: <20260224222734.3153931-1-joelagnelf@nvidia.com>
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

Series: rust: clist patches for nova-core memory management
URL   : https://patchwork.freedesktop.org/series/162092/
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
commit 0e1812d248797ab677aed0f89ea0c229a097fb72
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Tue Feb 24 17:27:34 2026 -0500

    rust: clist: Add support to interface with C linked lists
    
    Add a new module `clist` for working with C's doubly circular linked
    lists. Provide low-level iteration over list nodes.
    
    Typed iteration over actual items is provided with a `clist_create`
    macro to assist in creation of the `CList` type.
    
    Cc: Nikola Djukic <ndjukic@nvidia.com>
    Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
    Acked-by: Gary Guo <gary@garyguo.net>
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe drm-intel
439e103a753b rust: ffi: Convert pub use to pub mod and create ffi module
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
0e1812d24879 rust: clist: Add support to interface with C linked lists
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 388 lines checked


