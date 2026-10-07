Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B1BCA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 08:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5BF10E408;
	Wed,  7 Oct 2026 08:38:17 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE99810E408;
 Wed,  7 Oct 2026 08:38:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Expose_retired_?=
 =?utf-8?q?VRAM_pages_via_drm-ras_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 08:38:16 -0000
Message-ID: <179136229690.246953.18238152270027250574@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007080354.3072751-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20261007080354.3072751-1-aravind.iddamsetty@linux.intel.com>
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

Series: drm/xe: Expose retired VRAM pages via drm-ras (rev2)
URL   : https://patchwork.freedesktop.org/series/173066/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 86d056a7465a780a68e15183bd68306c8e4869d8
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Wed Oct 7 13:33:54 2026 +0530

    drm/xe: Remove bad VRAM pages debugfs interface
    
    Drop the "vram_bad_pages" debugfs file added by commit fb19798cc366e
    ("drm/xe: Expose bad VRAM pages via debugfs"). The retired VRAM pages
    are now exported through the drm-ras generic netlink interface, which
    is a stable ABI, making the debugfs-only readback redundant.
    
    This is a partial revert of fb19798cc366e: it removes vram_bad_pages_show(),
    its DEFINE_SHOW_ATTRIBUTE(), xe_ttm_vram_debugfs_init() and its call site
    and declaration, and the now-unused <linux/debugfs.h> include in
    xe_ttm_vram_mgr.c. The struct xe_ttm_vram_mgr.max_pages field introduced
    by the same commit is intentionally retained: it is the FW-provided
    offline-page limit and is now consumed by the drm-ras retired-resources
    capacity summary (xe_ttm_vram_get_max_bad_pages()).
    
    The fault-injection debugfs interface (inject_mempage_offline) is left
    untouched; it remains the mechanism for triggering page offlining in
    test.
    
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Assisted-by: Copilot:claude-opus-4.8
+ /mt/dim checkpatch daeb062fc40f727fafefed080c6d12a5ad1d0d12 drm-intel
882503c045fc drm/xe: Expose retired VRAM pages via drm-ras
-:42: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#42: 
[{'device-name': '0000:03:00.0', 'node-id': 0, 'node-name':'correctable-errors',

-:436: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#436: FILE: drivers/gpu/drm/drm_ras_nl.c:45:
+static const struct nla_policy drm_ras_get_retired_resources_nl_policy[DRM_RAS_A_RETIRED_RESOURCE_ATTRS_NODE_ID + 1] = {

total: 0 errors, 2 warnings, 0 checks, 755 lines checked
86d056a7465a drm/xe: Remove bad VRAM pages debugfs interface
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
This is a partial revert of fb19798cc366e: it removes vram_bad_pages_show(),

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


