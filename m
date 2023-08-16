Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344B6C001E0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 09:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD7910E317;
	Wed, 16 Aug 2023 09:57:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 768B910E317;
 Wed, 16 Aug 2023 09:57:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 66E70AADDA;
 Wed, 16 Aug 2023 09:57:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 16 Aug 2023 09:57:01 -0000
Message-ID: <169217982141.10287.12422836997637924566@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Do?=
 =?utf-8?q?cumentation/gpu=3A_VM=5FBIND_locking_document?=
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

Series: Documentation/gpu: VM_BIND locking document
URL   : https://patchwork.freedesktop.org/series/122507/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0c030b258b33f57def9802c9145f7c152f210c6f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Aug 16 11:15:47 2023 +0200

    Documentation/gpu: VM_BIND locking document
    
    Add the first version of the VM_BIND locking document which is
    intended to be part of the xe driver upstreaming agreement.
    
    The document describes and discuss the locking used during exec-
    functions, evicton and for userptr gpu-vmas. Intention is to be using the
    same nomenclature as the drm-vm-bind-async.rst.
    
    v2:
    - s/gvm/gpu_vm/g (Rodrigo Vivi)
    - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
      (Rodrigo Vivi)
    - Adjust commit message accordingly.
    - Add SPDX license header.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 9829aba16e62fcfba150f72d5d492fd778e0150e drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


