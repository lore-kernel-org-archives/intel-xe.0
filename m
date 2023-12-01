Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF018C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 16:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AA510E096;
	Fri,  1 Dec 2023 16:03:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 045BD10E0A2;
 Fri,  1 Dec 2023 16:02:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DEF8DAA3D8;
 Fri,  1 Dec 2023 16:02:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 01 Dec 2023 16:02:52 -0000
Message-ID: <170144657291.19689.14617341373924110703@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231201151147.538291-2-matthew.auld@intel.com>
In-Reply-To: <20231201151147.538291-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/uapi=3A_support_pat=5Findex_selection_with_vm=5Fbin?=
 =?utf-8?q?d?=
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

Series: fixup! drm/xe/uapi: support pat_index selection with vm_bind
URL   : https://patchwork.freedesktop.org/series/127201/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 044e6ae1a4c8be30ca0a72f00a9dee3103c4af47
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Dec 1 15:11:48 2023 +0000

    fixup! drm/xe/uapi: support pat_index selection with vm_bind
    
    Add a note in the docs for NULL bindings and corresponding pat_index:
    
    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26430
    
    Testcase: igt@xe_pat@pat-index-all
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 38dc2e0d8c28a817f2c727402e2638f3ea2accb4 drm-intel
044e6ae1a fixup! drm/xe/uapi: support pat_index selection with vm_bind


