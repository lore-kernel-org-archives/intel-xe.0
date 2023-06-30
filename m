Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B00EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 16:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F394010E4C6;
	Fri, 30 Jun 2023 16:47:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA6B310E4CA;
 Fri, 30 Jun 2023 16:47:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7F119AADE8;
 Fri, 30 Jun 2023 16:47:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 30 Jun 2023 16:47:48 -0000
Message-ID: <168814366851.24870.4466923763421216307@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230630164452.9228-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230630164452.9228-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Do?=
 =?utf-8?q?cumentation/gpu=3A_Draft_VM=5FBIND_locking_document?=
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

Series: Documentation/gpu: Draft VM_BIND locking document
URL   : https://patchwork.freedesktop.org/series/120084/
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
commit 2c3171419adba6263c8888524189bf68105290ec
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 30 18:44:52 2023 +0200

    Documentation/gpu: Draft VM_BIND locking document
    
    Add the first version of the VM_BIND locking document which is
    intended to be part of the xe driver upstreaming agreement.
    
    The document describes and discuss the locking used during exec-
    functions, evicton and for userptr gmvas. Intention is to be using the
    same nomenclature as the drm-vm-bind-async.rst, but to keep naming a
    little shorter, use gvm and gmva instead of gpu_vm and gpu_vma which
    is used in the previous document, with an intention to modify also
    that document.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 3b458784c9645681eea7611e571e1ee752bb2bc0 drm-intel
2c3171419 Documentation/gpu: Draft VM_BIND locking document
-:22: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#22: 
new file mode 100644

-:27: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#27: FILE: Documentation/gpu/drm-vm-bind-locking.rst:1:
+===============

-:42: ERROR:TRAILING_WHITESPACE: trailing whitespace
#42: FILE: Documentation/gpu/drm-vm-bind-locking.rst:16:
+  one per client (DRM file-private), or one per context. $

-:183: ERROR:TRAILING_WHITESPACE: trailing whitespace
#183: FILE: Documentation/gpu/drm-vm-bind-locking.rst:157:
+^I^I$

-:260: ERROR:TRAILING_WHITESPACE: trailing whitespace
#260: FILE: Documentation/gpu/drm-vm-bind-locking.rst:234:
+`this document $

-:298: ERROR:TRAILING_WHITESPACE: trailing whitespace
#298: FILE: Documentation/gpu/drm-vm-bind-locking.rst:272:
+   $

-:333: ERROR:TRAILING_WHITESPACE: trailing whitespace
#333: FILE: Documentation/gpu/drm-vm-bind-locking.rst:307:
+^I  $

total: 5 errors, 2 warnings, 0 checks, 339 lines checked


