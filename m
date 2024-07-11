Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09703C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 22:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B0E10EBB9;
	Thu, 11 Jul 2024 22:06:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0825110EBB9;
 Thu, 11 Jul 2024 22:06:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/exec=3A_Fix_minor_?=
 =?utf-8?q?bug_related_to_xe=5Fsync=5Fentry=5Fcleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 22:06:04 -0000
Message-ID: <172073556402.165243.15468429149774200603@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/136013/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 94856a97fbc819666d61427700da4c2c284e5d53
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Thu Jul 11 14:12:03 2024 -0700

    drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup
    
    Increment num_syncs after xe_sync_entry_parse() is successful to ensure
    the xe_sync_entry_cleanup() logic under "err_syncs" label works correctly.
    
    v2: Use the same pattern as that in xe_vm.c (Matt Brost)
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch b8617992926ffce3569049c2eb3dffeef5eafe75 drm-intel
94856a97fbc8 drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup


