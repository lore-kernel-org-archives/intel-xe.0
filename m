Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252351091916
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 22:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D512410E9BE;
	Thu, 19 Mar 2026 22:13:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5144C10E9A6;
 Thu, 19 Mar 2026 22:13:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_rust=3A_interop=3A_Add_li?=
 =?utf-8?q?st_module_for_C_linked_list_interface_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Mar 2026 22:13:16 -0000
Message-ID: <177395839631.377451.17143089622638547827@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260319210722.1543776-1-joelagnelf@nvidia.com>
In-Reply-To: <20260319210722.1543776-1-joelagnelf@nvidia.com>
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

Series: rust: interop: Add list module for C linked list interface (rev4)
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
commit bc651c96b80eb7c877adfa2190c5b35730a0421e
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Thu Mar 19 17:07:22 2026 -0400

    rust: interop: Add list module for C linked list interface
    
    Add a new module `kernel::interop::list` for working with C's doubly
    circular linked lists. Provide low-level iteration over list nodes.
    
    Typed iteration over actual items is provided with a `clist_create`
    macro to assist in creation of the `CList` type.
    
    Cc: Nikola Djukic <ndjukic@nvidia.com>
    Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
    Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
    Reviewed-by: Alice Ryhl <aliceryhl@google.com>
    Acked-by: Alexandre Courbot <acourbot@nvidia.com>
    Acked-by: Gary Guo <gary@garyguo.net>
    Acked-by: Miguel Ojeda <ojeda@kernel.org>
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 242f4d8af4c4708eabb93e79949d45caec8d4354 drm-intel
bc651c96b80e rust: interop: Add list module for C linked list interface
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 402 lines checked


