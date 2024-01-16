Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B558DC4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 11:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C38110E50D;
	Tue, 16 Jan 2024 11:56:54 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E758A10E50D;
 Tue, 16 Jan 2024 11:56:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Use_XE=5FCA?=
 =?utf-8?q?CHE=5FWB_pat_index_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 16 Jan 2024 11:56:53 -0000
Message-ID: <170540621394.501308.12934644371805597561@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116120512.1542167-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240116120512.1542167-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/xe2: Use XE_CACHE_WB pat index (rev3)
URL   : https://patchwork.freedesktop.org/series/128110/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e27e3007b9316f82f19057345eed9e8f9bbfc28
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Jan 16 17:35:12 2024 +0530

    drm/xe/xe2: Use XE_CACHE_WB pat index
    
    The pat table entry associated with XE_CACHE_WB is coherent whereas
    XE_CACHE_NONE is non coherent. Use the coherent entry XE_CACHE_WB for
    buffers not supporting compression. For read/write to flat ccs region
    the issue is not related to coherency with cpu. The hardware expects
    the pat index associated with GPUVA for indirect access to be
    compression enabled hence use XE_CACHE_NONE_COMPRESSION.
    
    Fixes the broken "xe_migrate_test kunit test" on LNL.
    
    v2
    - Fix the argument to emit_pte, pass the bool directly. (Thomas)
    
    v3
    - Rebase
    - Update commit message (Matt)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 3a1d727c0061b96ddf8e653130f94ab331e2f065 drm-intel
5e27e3007 drm/xe/xe2: Use XE_CACHE_WB pat index


