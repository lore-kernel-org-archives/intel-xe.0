Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292D0CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 10:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966410E387;
	Mon,  5 Oct 2026 10:40:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5CE10E254;
 Mon,  5 Oct 2026 10:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_purpose-specifi?=
 =?utf-8?q?c_VRAM_pools_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 10:40:05 -0000
Message-ID: <179119680511.239738.11456798967100230261@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
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

Series: Introduce purpose-specific VRAM pools (rev2)
URL   : https://patchwork.freedesktop.org/series/175411/
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
commit d3f35f02f4ba5fd7b51efe09f3f9af286c00c6f0
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Mon Oct 5 11:30:21 2026 +0200

    drm/xe/kunit: Test VRAM pool allocation
    
    Exercise default pool setup, pool splitting and partition limits, and
    TTM placement range narrowing.
    
    Assisted-by: Claude Opus 5.5
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 drm-intel
4af111719ce2 drm/xe: Define partitioned VRAM manager types
c968e71303a4 drm/xe: Define VRAM regions and pools
4358637997f8 drm/xe/vram: Make VRAM pools the allocation handle
a8dc839ae3cf drm/xe/ttm: Back each VRAM pool with its own buddy allocator
eafbb1be8e1d drm/xe/vram: Allow splitting a region into pools
23c26f88d428 drm/xe/kunit: Test partitioned VRAM manager
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
d3f35f02f4ba drm/xe/kunit: Test VRAM pool allocation
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 165 lines checked


