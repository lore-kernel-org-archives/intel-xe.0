Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF613C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 13:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84122112904;
	Mon, 29 Jan 2024 13:06:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697171128F8;
 Mon, 29 Jan 2024 13:06:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remaining_probe?=
 =?utf-8?q?_reordering?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Mon, 29 Jan 2024 13:06:34 -0000
Message-ID: <170653359443.806401.7046610361888756050@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
In-Reply-To: <20240129130308.3544466-1-michal.winiarski@intel.com>
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

Series: drm/xe: Remaining probe reordering
URL   : https://patchwork.freedesktop.org/series/129268/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 91b9a53416de85820f98a79e5291dc9ff70d13fc
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Mon Jan 29 14:03:08 2024 +0100

    drm/xe: Initialize GuC earlier during probe
    
    SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
    to access a curated subset that is needed to initialize the driver by
    communicating with SR-IOV PF using GuC CT.
    Initialize GuC earlier in order to keep the unified probe ordering
    between VF and PF modes.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a0325b172ae7077c52b074d9b531f4e3aa585d82 drm-intel
27a2ac734 drm/xe/guc: Allocate GuC data structures in system memory for initial load
1c2329282 drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
d3b497b5f drm/xe/guc: Move GuC power control init to "post-hwconfig"
91b9a5341 drm/xe: Initialize GuC earlier during probe


