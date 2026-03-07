Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B14FC9EC0
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 04:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041E210E342;
	Sat,  7 Mar 2026 04:31:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C062310E077;
 Sat,  7 Mar 2026 04:31:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_rust=3A_interop=3A_Add_li?=
 =?utf-8?q?st_module_for_C_linked_list_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 04:31:45 -0000
Message-ID: <177285790577.329328.4067497404079450350@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
In-Reply-To: <20260306203648.1136554-1-joelagnelf@nvidia.com>
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

Series: rust: interop: Add list module for C linked list interface
URL   : https://patchwork.freedesktop.org/series/162794/
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
commit 2b9c8925434a2fd8c85450500abe05e2aa37f451
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Fri Mar 6 15:36:48 2026 -0500

    rust: interop: Add list module for C linked list interface
    
    Add a new module `kernel::interop::list` for working with C's doubly
    circular linked lists. Provide low-level iteration over list nodes.
    
    Typed iteration over actual items is provided with a `clist_create`
    macro to assist in creation of the `CList` type.
    
    Cc: Nikola Djukic <ndjukic@nvidia.com>
    Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
    Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
    Acked-by: Alexandre Courbot <acourbot@nvidia.com>
    Acked-by: Gary Guo <gary@garyguo.net>
    Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch fce8d7fb2107068c269b868d51aba5f9cf85998a drm-intel
2b9c8925434a rust: interop: Add list module for C linked list interface
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 399 lines checked


