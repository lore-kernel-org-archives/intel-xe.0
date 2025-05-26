Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63E6C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 21:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F8010E3E1;
	Mon, 26 May 2025 21:42:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E3010E3C4;
 Mon, 26 May 2025 21:42:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Reduce_DPT_tabl?=
 =?utf-8?q?e_alignment_as_in_i915_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 21:42:22 -0000
Message-ID: <174829574286.21444.11351769552260066941@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
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

Series: drm/xe: Reduce DPT table alignment as in i915 (rev2)
URL   : https://patchwork.freedesktop.org/series/148868/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b617a7941d8d54383af10f47a8f3c5b824bbf84
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon May 12 09:01:55 2025 +0100

    drm/xe: Reduce DPT table alignment as in i915
    
    There is some magic going on with DPT alignment values which are
    multiplied by 512, and then for specifically pinning the DPT table
    scaled back down.
    
    Make xe do it in the same way as i915.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
8b617a7941d8 drm/xe: Reduce DPT table alignment as in i915


