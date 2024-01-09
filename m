Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F8C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 13:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6142510E413;
	Tue,  9 Jan 2024 13:01:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E9010E41E;
 Tue,  9 Jan 2024 13:01:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Silence_a_numbe?=
 =?utf-8?q?r_of_sparse_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 09 Jan 2024 13:01:28 -0000
Message-ID: <170480528895.215663.9934128700066206817@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Silence a number of sparse warnings
URL   : https://patchwork.freedesktop.org/series/128368/
State : warning

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
commit 3adf1938b914d57c5859b20c0503e5b6f29d4971
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Jan 9 12:24:05 2024 +0100

    drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
    
    The pointer points to IO memory, but the __iomem annotation was
    incorrectly placed. Annotate it correctly, update its usage accordingly
    and fix the corresponding sparse error.
    
    Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch eacbcdb537a2774959d012206aba22848fdade26 drm-intel
dead640c5 drm/xe: Use __iomem for the regs pointer
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a4e2f3a299ea', maybe rebased or not pulled?
#12: 
Fixes: a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
41b8ba722 drm/xe: Annotate xe_mem_region::mapping with __iomem
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0887a2e7ab62', maybe rebased or not pulled?
#13: 
Fixes: 0887a2e7ab62 ("drm/xe: Make xe_mem_region struct")

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
b96ab919a drm/xe: Annotate multiple mmio pointers with __iomem
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#12: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3b0d4a557996', maybe rebased or not pulled?
#13: 
Fixes: 3b0d4a557996 ("drm/xe: Move register MMIO into xe_tile")

-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '399a13323f0d', maybe rebased or not pulled?
#14: 
Fixes: 399a13323f0d ("drm/xe: add 28-bit address support in struct xe_reg")

total: 0 errors, 3 warnings, 0 checks, 24 lines checked
3adf1938b drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd8b52a02cb40', maybe rebased or not pulled?
#13: 
Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


