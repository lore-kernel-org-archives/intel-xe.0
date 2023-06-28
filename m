Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF49DEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 12:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A62F10E061;
	Wed, 28 Jun 2023 12:54:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A87610E061;
 Wed, 28 Jun 2023 12:54:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 875F4AADDC;
 Wed, 28 Jun 2023 12:54:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 28 Jun 2023 12:54:46 -0000
Message-ID: <168795688655.32038.17756303892480652234@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Do?=
 =?utf-8?q?cumentation/gpu=3A_Add_a_VM=5FBIND_async_draft_document_=28rev2?=
 =?utf-8?q?=29?=
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

Series: Documentation/gpu: Add a VM_BIND async draft document (rev2)
URL   : https://patchwork.freedesktop.org/series/119672/
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
commit c355ebd260d93710661de96177dedbe73d7260b7
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 28 14:51:46 2023 +0200

    Documentation/gpu: Add a VM_BIND async draft document
    
    Add a motivation for and description of asynchronous VM_BIND operation
    
    v2:
    - Fix typos (Nirmoy Das)
    - Improve the description of a memory fence (Oak Zeng)
    - Add a reference to the document in the Xe RFC.
    - Add pointers to sample uAPI suggestions
    v3:
    - Address review comments (Danilo Krummrich)
    - Formatting fixes
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch abdb420db479bae28a2abd7ba2c66229b7e8cb77 drm-intel
c355ebd26 Documentation/gpu: Add a VM_BIND async draft document
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:29: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#29: FILE: Documentation/gpu/drm-vm-bind-async.rst:1:
+====================

total: 0 errors, 2 warnings, 0 checks, 160 lines checked


