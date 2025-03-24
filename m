Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2994CC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 11:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D587910E115;
	Mon, 24 Mar 2025 11:14:15 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1C710E115;
 Mon, 24 Mar 2025 11:14:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe/debugfs=3A_add_local_forcewake=5Fget/put_funcs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 11:14:15 -0000
Message-ID: <174281485544.71275.8543485077096643600@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
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

Series: series starting with [v2,1/2] drm/xe/debugfs: add local forcewake_get/put funcs
URL   : https://patchwork.freedesktop.org/series/146659/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a16cbd7e343628bd82ca2a82b1c4e0abff97f360
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Mon Mar 24 13:07:30 2025 +0200

    drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler
    
    The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
    and therefore, recently removed.
    Nevertheless, it is now restored for debugging purposes as an
    ioctl handler for a newly added 'mmio' debugfs file.
    
    Notes:
    1. The non-admin user's limited mmio access (aka, whitelist),
    was removed being irrelevant anymore, now that a user using debugfs
    must anyway have root permissions to use it.
    2. To support multi-tile access, the tile index is now dynamic and
    will be retrieved from the given mmio address itself.
    
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ofir Bitton <obitton@habana.ai>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
    Reviewed-by: Ofir Bitton <obitton@habana.ai>
+ /mt/dim checkpatch f8c17a63ca147e008f36d1efd80206d4ce4e8ce1 drm-intel
0bcdd56f81b2 drm/xe/debugfs: add local forcewake_get/put funcs
a16cbd7e3436 drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler
-:231: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#231: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 262 lines checked


