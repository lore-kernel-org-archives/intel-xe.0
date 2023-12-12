Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18575C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 10:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C3C10E5B5;
	Tue, 12 Dec 2023 10:26:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30DF710E5B5;
 Tue, 12 Dec 2023 10:26:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1AA98AADF2;
 Tue, 12 Dec 2023 10:26:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_DRM=5FGPUVM_helpers_f?=
 =?utf-8?q?or_the_vm_evict_and_exobj_lists?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 12 Dec 2023 10:26:55 -0000
Message-ID: <170237681510.31293.8060764739597150787@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212100144.6833-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231212100144.6833-1-thomas.hellstrom@linux.intel.com>
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

Series: Use DRM_GPUVM helpers for the vm evict and exobj lists
URL   : https://patchwork.freedesktop.org/series/127675/
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
commit 456403f812f25dde8f27b5647e7761b1a21e8f4e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Dec 12 11:01:44 2023 +0100

    drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
    
    Use DRM_GPUVM_RESV_PROTECTED to use corse-grained locking for the
    evict and external object list.
    Since we are already holding the relevant RESV locks, for now at least,
    we don't need the fine-grained locking.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8 drm-intel
43bcf4578 drm/xe: Use DRM GPUVM helpers for external- and evicted objects
456403f81 drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm


