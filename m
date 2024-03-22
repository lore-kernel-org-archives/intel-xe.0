Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911D1C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5556A10F44A;
	Fri, 22 Mar 2024 09:16:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4700F10F44A;
 Fri, 22 Mar 2024 09:16:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Rework_rebindin?=
 =?utf-8?q?g_and_allow_same-vm_eviction_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Mar 2024 09:16:39 -0000
Message-ID: <171109899929.960365.11655348505705471036@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Rework rebinding and allow same-vm eviction (rev2)
URL   : https://patchwork.freedesktop.org/series/131421/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0b60c0201cd61821d891fb41dc4b4a6f8f1c84ce
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Mar 22 10:02:13 2024 +0100

    drm/xe/bo: Allow eviction of unbound local bos
    
    Local bos that don't have any gpu_vmas set up are allowed
    to be evicted. Support that.
    
    Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a drm-intel
8575828dfeb1 drm/xe: Use ring ops TLB invalidation for rebinds
400593b049a8 drm/xe: Rework rebinding
70edfcbbc6bc drm/xe: Make TLB invalidation fences unordered
8f76f653261c drm/xe: Reserve fences where needed
199d474adeb5 drm/xe: Move vma rebinding to the drm_exec locking loop
628d00c6bebc drm/xe/bo: Forward the decision to evict local objects during validation
0b60c0201cd6 drm/xe/bo: Allow eviction of unbound local bos


