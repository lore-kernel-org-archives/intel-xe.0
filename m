Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A8C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BA410E29C;
	Mon, 18 Sep 2023 17:27:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A87F10E29C;
 Mon, 18 Sep 2023 17:27:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5AAEEAADD5;
 Mon, 18 Sep 2023 17:27:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Mon, 18 Sep 2023 17:27:25 -0000
Message-ID: <169505804536.32415.13697370232998817304@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918172446.36835-1-gustavo.sousa@intel.com>
In-Reply-To: <20230918172446.36835-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/uapi=3A_Demote_PMU_kernel-doc_to_simple_comment?=
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

Series: drm/xe/uapi: Demote PMU kernel-doc to simple comment
URL   : https://patchwork.freedesktop.org/series/123870/
State : success

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
commit 6feaefcf5210a02097948206266a5e30f632eec3
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Sep 18 14:24:46 2023 -0300

    drm/xe/uapi: Demote PMU kernel-doc to simple comment
    
    The current documentation in include/uapi/drm/xe_drm.h is giving the
    following error:
    
      $ ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
      include/uapi/drm/xe_drm.h:1057: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
       * XE PMU event config IDs
      1 warnings as Errors
    
    Turn the offending kernel-doc into a simple comment for now to unblock
    CI runs. We can turn it back to a kernel-doc later once a proper fix is
    in place.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 717f01815b20bde3f081a18f42f31673ce1f107f drm-intel
6feaefcf5 drm/xe/uapi: Demote PMU kernel-doc to simple comment


