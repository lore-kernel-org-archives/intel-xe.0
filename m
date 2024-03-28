Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673E2CD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 20:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F210E0BD;
	Thu, 28 Mar 2024 20:18:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9D810E0BD;
 Thu, 28 Mar 2024 20:18:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Restore_flags_VM=5FBIND?=
 =?utf-8?q?=5FFLAG=5FREADONLY_and_VM=5FBIND=5FFLAG=5FIMMEDIATE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 20:18:49 -0000
Message-ID: <171165712926.1064396.13747323618274939856@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328143742.7-1-francois.dugast@intel.com>
In-Reply-To: <20240328143742.7-1-francois.dugast@intel.com>
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

Series: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
URL   : https://patchwork.freedesktop.org/series/131775/
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
commit 2c0f583bd83c37958ae284dfb5864f620937efcf
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Mar 28 14:37:42 2024 +0000

    drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
    
    The commit 84a1ed5e6756 ("drm/xe/uapi: Remove unused flags") is partially
    reverted. At the time, flags not used by user space were removed during
    some cleanup. There is now a need for flags DRM_XE_VM_BIND_FLAG_READONLY
    and DRM_XE_VM_BIND_FLAG_IMMEDIATE by the compute runtime, so they are
    brought back.
    
    Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f drm-intel
2c0f583bd83c drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE


