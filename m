Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D73EEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 17:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2532A10E117;
	Mon, 26 Jun 2023 17:17:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A367C10E117;
 Mon, 26 Jun 2023 17:17:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A0C8CAADD8;
 Mon, 26 Jun 2023 17:17:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 26 Jun 2023 17:17:47 -0000
Message-ID: <168779986765.5707.1769031424146439636@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230626170905.87112-2-matthew.auld@intel.com>
In-Reply-To: <20230626170905.87112-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/mmio=3A_update_gt=5Fcount_when_probing_multi-tile?=
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

Series: drm/xe/mmio: update gt_count when probing multi-tile
URL   : https://patchwork.freedesktop.org/series/119878/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a7e9bab973eddbd6971432b9073ecf6b9a972556
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jun 26 18:09:06 2023 +0100

    drm/xe/mmio: update gt_count when probing multi-tile
    
    It looks like the single-tile PVC in CI dies during module load when doing
    the pcode init. From the logs we try to access the address
    0000000000138124 which doesn't map to anything, however 0x138124 also
    looks to be the PCODE_MAILBOX register. So looks like the per-tile
    mmio register mapping is NULL.
    
    During probe the tile count is potentially trimmed, since we don't know
    the real count until we actually probe the device. This seems to be
    the case for single-tile PVC or similar devices.  However it looks like
    the gt_count is never adjusted to respect this updated tile count. As a
    result when later doing some for_each_gt() loop, like we do for the
    pcode, we can get back some GT that maps to some non-existent tile
    which hasn't been properly set up, leading to crashes.
    
    Try to fix this by adjusting the gt_count after probing the tiles for
    real.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/383
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch d3fc5af59c7c17ad1a0272c49dbff84534d9d606 drm-intel
a7e9bab97 drm/xe/mmio: update gt_count when probing multi-tile
-:23: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Closes:', use 'Link:' instead
#23: 
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/383

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


