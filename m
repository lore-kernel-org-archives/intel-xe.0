Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1008ACD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 18:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7259F10E5DC;
	Wed, 10 Apr 2024 18:04:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86E10E5DC;
 Wed, 10 Apr 2024 18:04:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_device_atomics_wit?=
 =?utf-8?q?h_a_VM_bind_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 18:04:23 -0000
Message-ID: <171277226370.1338744.804829217230696020@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410170308.409-1-nirmoy.das@intel.com>
In-Reply-To: <20240410170308.409-1-nirmoy.das@intel.com>
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

Series: Enable device atomics with a VM bind flag
URL   : https://patchwork.freedesktop.org/series/132290/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c9691d35ef5cb85263c7d9702c1e8aca9163e6b1
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Apr 10 19:03:08 2024 +0200

    drm/xe/uapi: Introduce VMA bind flag for device atomics
    
    Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
    
    Given that simultaneous usage of device atomics and CPU atomics on
    the same SMEM buffer is not guaranteed to function without migration,
    and UMD expects no migration for SMEM-only buffer objects, so this provide
    a way to set device atomics when UMD is certain to use the buffer only
    for device atomics.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 3658e2ec471a1d67baa30a554583bcdd4be55857 drm-intel
49d3c4f1432d drm/xe: Consolidate setting PTE_AE into one place
dca148c74afb drm/xe: Add function to check if BO has single placement
c9691d35ef5c drm/xe/uapi: Introduce VMA bind flag for device atomics


