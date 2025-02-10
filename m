Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E009C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 15:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E5510E59D;
	Mon, 10 Feb 2025 15:24:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D0B10E59C;
 Mon, 10 Feb 2025 15:24:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Carve_out_wopcm?=
 =?utf-8?q?_portion_from_the_stolen_memory_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 15:24:56 -0000
Message-ID: <173920109635.364880.17237274477565514952@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210143654.2076747-1-nirmoy.das@intel.com>
In-Reply-To: <20250210143654.2076747-1-nirmoy.das@intel.com>
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

Series: drm/xe: Carve out wopcm portion from the stolen memory (rev2)
URL   : https://patchwork.freedesktop.org/series/144520/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e9985cf59237b034c92cc0384752c92753929ad
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Feb 10 15:36:54 2025 +0100

    drm/xe: Carve out wopcm portion from the stolen memory
    
    The top of stolen memory is WOPCM, which shouldn't be accessed. Remove
    this portion from the stolen memory region for discrete platforms.
    This was already done for integrated, but was missing for discrete
    platforms.
    
    This also moves get_wopcm_size() so detect_bar2_dgfx() and
    detect_bar2_integrated can use the same function.
    
    v2: Improve commit message and suitable stable version tag(Lucas)
    
    Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.11+
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 656e731586e568a8633c0bd16d28dcec8d67f237 drm-intel
5e9985cf5923 drm/xe: Carve out wopcm portion from the stolen memory


