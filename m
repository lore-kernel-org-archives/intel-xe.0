Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB1CCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 09:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99E410E3CE;
	Wed, 18 Oct 2023 09:47:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25CCD10E3CE;
 Wed, 18 Oct 2023 09:47:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 240DAAADD8;
 Wed, 18 Oct 2023 09:47:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 18 Oct 2023 09:47:43 -0000
Message-ID: <169762246314.15106.9627773708538553581@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231018083733.12881-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231018083733.12881-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe?=
 =?utf-8?q?/xe=5Fbo=3A_Reject_bo_creation_of_unaligned_size_=28rev3=29?=
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

Series: xe/xe_bo: Reject bo creation of unaligned size (rev3)
URL   : https://patchwork.freedesktop.org/series/116419/
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
commit c1da63f0479593492377b0708171d14eb0d47ad1
Author: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Date:   Wed Oct 18 10:37:33 2023 +0200

    xe/xe_bo: Reject bo creation of unaligned size
    
    For xe bo creation we request passing size which matches system or
    vram minimum page alignment. This way we want to ensure userspace
    is aware of region constraints and not aligned allocations will be
    rejected returning EINVAL.
    
    v2:
    - Rebase, Update uAPI documentation. (Thomas)
    v3:
    - Adjust the dma-buf kunit test accordingly. (Thomas)
    
    Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 4d039d7be23937e2b498ed783aa5b0d8801b377b drm-intel
c1da63f04 xe/xe_bo: Reject bo creation of unaligned size


