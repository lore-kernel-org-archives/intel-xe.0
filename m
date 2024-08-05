Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34227C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 15:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028FE10E23C;
	Mon,  5 Aug 2024 15:48:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772210E23F;
 Mon,  5 Aug 2024 15:48:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display_suspend/re?=
 =?utf-8?q?sume_fixes=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 15:48:41 -0000
Message-ID: <172287292141.540680.14836336459487151785@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe/display suspend/resume fixes.
URL   : https://patchwork.freedesktop.org/series/136891/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9e645341d3008ce246879af606f45d0e5d21d698
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3be2022c90c5a259f0931dce4a659f174adcc358
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Aug 5 17:13:09 2024 +0200

    drm/xe/display: Make display suspend/resume work on discrete
    
    We should unpin before evicting all memory, and repin after GT resume.
    This way, we preserve the contents of the framebuffers, and won't hang
    on resume due to migration engine not being restored yet.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch d15caf398bccf6c9d34363f65251b7192f833dc9 drm-intel
3ce2f362ecbb drm/xe/display: Match i915 driver suspend/resume sequences better
3be2022c90c5 drm/xe/display: Make display suspend/resume work on discrete


