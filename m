Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49583C47DB3
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 12:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0050810E135;
	Fri,  2 Feb 2024 12:12:46 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C1710E135;
 Fri,  2 Feb 2024 12:12:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/4=5D_drm/xe/guc=3A_Allocate_GuC_data_structures_in_system_m?=
 =?utf-8?q?emory_for_initial_load?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 12:12:45 -0000
Message-ID: <170687596595.937153.12178288162141703503@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202120834.1187656-1-michal.winiarski@intel.com>
In-Reply-To: <20240202120834.1187656-1-michal.winiarski@intel.com>
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

Series: series starting with [CI,1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load
URL   : https://patchwork.freedesktop.org/series/129466/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2b7809693d3c9c36d26f2342f2ff6f8e7b09a05
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Fri Feb 2 13:08:34 2024 +0100

    drm/xe: Initialize GuC earlier during probe
    
    SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
    to access a curated subset that is needed to initialize the driver by
    communicating with SR-IOV PF using GuC CT.
    Initialize GuC earlier in order to keep the unified probe ordering
    between VF and PF modes.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1dd92467500a5ead3e44bbdfe15e064dd79b65ef drm-intel
83f79eb48 drm/xe/guc: Allocate GuC data structures in system memory for initial load
f611b985a drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
3fb69608d drm/xe/guc: Move GuC power control init to "post-hwconfig"
b2b780969 drm/xe: Initialize GuC earlier during probe


