Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BBCC47DD3
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 04:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717F410E8C0;
	Fri, 19 Jan 2024 04:10:13 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3E610E8C0;
 Fri, 19 Jan 2024 04:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe2=3A_Use_XE=5FCA?=
 =?utf-8?q?CHE=5FWB_pat_index_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Fri, 19 Jan 2024 04:10:11 -0000
Message-ID: <170563741164.558566.15028388985271887829@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119041826.1670496-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240119041826.1670496-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/xe2: Use XE_CACHE_WB pat index (rev4)
URL   : https://patchwork.freedesktop.org/series/128110/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 966acc798c0fb926c0fe030236ecb5ccd2b386d8
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Jan 19 09:48:26 2024 +0530

    drm/xe/xe2: Use XE_CACHE_WB pat index
    
    The pat table entry associated with XE_CACHE_WB is coherent whereas
    XE_CACHE_NONE is non coherent. Migration expects the coherency
    with cpu therefore use the coherent entry XE_CACHE_WB for
    buffers not supporting compression. For read/write to flat ccs region
    the issue is not related to coherency with cpu. The hardware expects
    the pat index associated with GPUVA for indirect access to be
    compression enabled hence use XE_CACHE_NONE_COMPRESSION.
    
    v2
    - Fix the argument to emit_pte, pass the bool directly. (Thomas)
    
    v3
    - Rebase
    - Update commit message (Matt)
    
    v4
    - Add a Fixes: tag. (Thomas)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Fixes: 65ef8dbad1db ("drm/xe/xe2: Update emit_pte to use compression enabled PAT index")
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch ffd89994d2da0d477d1d8a1376127b0f55338d59 drm-intel
966acc798 drm/xe/xe2: Use XE_CACHE_WB pat index
-:29: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '65ef8dbad1db', maybe rebased or not pulled?
#29: 
Fixes: 65ef8dbad1db ("drm/xe/xe2: Update emit_pte to use compression enabled PAT index")

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


