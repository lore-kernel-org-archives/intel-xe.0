Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD586C02183
	for <intel-xe@archiver.kernel.org>; Sun, 19 Jan 2025 12:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBE210E0D7;
	Sun, 19 Jan 2025 12:57:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432410E0DD;
 Sun, 19 Jan 2025 12:57:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Refactor_some_graphics_de?=
 =?utf-8?q?scriptor_flags_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 19 Jan 2025 12:57:22 -0000
Message-ID: <173729144253.1556956.5096064909108565351@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
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

Series: Refactor some graphics descriptor flags (rev2)
URL   : https://patchwork.freedesktop.org/series/143608/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3d1d04b785986c9cbbcb00181f31cfbfb8629043
Author: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Date:   Sun Jan 19 18:06:44 2025 +0530

    drm/xe: Refactor max_remote_tiles
    
    max_remote_tiles is more related to the platform than the GT IP. Thus
    move it to platform descriptor from graphics descriptor. Note that the
    FIXME is no more required, thus it can be dropped.
    
    Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
+ /mt/dim checkpatch f677c54c2a38bed0be21b9c3ff3b1164bfc962b1 drm-intel
bee188327462 drm/xe: Refactor dma_mask_size
3d1d04b78598 drm/xe: Refactor max_remote_tiles


