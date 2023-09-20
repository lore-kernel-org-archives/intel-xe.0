Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5100DCE79BE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 10:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8EC10E16D;
	Wed, 20 Sep 2023 10:31:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 300E310E16D;
 Wed, 20 Sep 2023 10:31:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 34D7FAADD5;
 Wed, 20 Sep 2023 10:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 20 Sep 2023 10:31:57 -0000
Message-ID: <169520591721.6465.12454669508660013694@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920095001.5539-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230920095001.5539-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Disallow_pinning_dma-bufs_in_VRAM_=28rev2=29?=
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

Series: drm/xe: Disallow pinning dma-bufs in VRAM (rev2)
URL   : https://patchwork.freedesktop.org/series/123897/
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
commit 8f00bb673992097bfaac2557e5189a82a75b335a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Sep 20 11:50:01 2023 +0200

    drm/xe: Disallow pinning dma-bufs in VRAM
    
    For now only support pinning in TT memory, for two reasons:
    1) Avoid pinning in a placement not accessible to some importers.
    2) Pinning in VRAM requires PIN accounting which is a to-do.
    
    v2:
    - Adjust the dma-buf kunit test accordingly.
    
    Suggested-by: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
+ /mt/dim checkpatch b3b5f51b66e9f1bf5aecef46446c4e7c49146834 drm-intel
8f00bb673 drm/xe: Disallow pinning dma-bufs in VRAM


