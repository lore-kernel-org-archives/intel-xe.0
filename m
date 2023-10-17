Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDC3CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 16:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3B10E183;
	Tue, 17 Oct 2023 16:54:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72CFB10E183;
 Tue, 17 Oct 2023 16:54:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 710E0AA3D8;
 Tue, 17 Oct 2023 16:54:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 17 Oct 2023 16:54:29 -0000
Message-ID: <169756166946.14379.9548365694405963376@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231017163243.14112-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231017163243.14112-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?/xe=5Fbo=3A_Reject_bo_creation_of_unaligned_size_=28rev2=29?=
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

Series: xe/xe_bo: Reject bo creation of unaligned size (rev2)
URL   : https://patchwork.freedesktop.org/series/116419/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 530b2dee59517314a99a6b74a8bd8d52071b8657
Author: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Date:   Tue Oct 17 18:32:43 2023 +0200

    xe/xe_bo: Reject bo creation of unaligned size
    
    For xe bo creation we request passing size which matches system or
    vram minimum page alignment. This way we want to ensure userspace
    is aware of region constraints and not aligned allocations will be
    rejected returning EINVAL.
    
    Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b87b8637576a00e513f995952fcc891f3d154f5d drm-intel
530b2dee5 xe/xe_bo: Reject bo creation of unaligned size
-:98: ERROR:CODE_INDENT: code indent should use tabs where possible
#98: FILE: include/uapi/drm/xe_drm.h:331:
+         * maximum value of the &min_page_size across all memory regions$

-:100: ERROR:CODE_INDENT: code indent should use tabs where possible
#100: FILE: include/uapi/drm/xe_drm.h:333:
+         * to track @min_page_size per region can use this value for$

total: 2 errors, 0 warnings, 0 checks, 88 lines checked


