Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0813C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 20:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D48E10E9E0;
	Wed, 26 Feb 2025 20:13:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171FB10E9E0;
 Wed, 26 Feb 2025 20:13:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/userptr=3A_properl?=
 =?utf-8?q?y_setup_pfn=5Fflags=5Fmask_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 20:13:44 -0000
Message-ID: <174060082409.2444410.13499554136089182197@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226174748.294285-2-matthew.auld@intel.com>
In-Reply-To: <20250226174748.294285-2-matthew.auld@intel.com>
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

Series: drm/xe/userptr: properly setup pfn_flags_mask (rev2)
URL   : https://patchwork.freedesktop.org/series/145509/
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
commit 47f758bec213cbf17d0d1cba09e52bd93d6349ee
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Feb 26 17:47:49 2025 +0000

    drm/xe/userptr: properly setup pfn_flags_mask
    
    Currently we just leave it uninitialised, which at first looks harmless,
    however we also don't zero out the pfn array, and with pfn_flags_mask
    the idea is to be able set individual flags for a given range of pfn or
    completely ignore them, outside of default_flags. So here we end up with
    pfn[i] & pfn_flags_mask, and if both are uninitialised we might get back
    an unexpected flags value, like asking for read only with default_flags,
    but getting back write on top, leading to potentially bogus behaviour.
    
    To fix this ensure we zero the pfn_flags_mask, such that hmm only
    considers the default_flags and not also the initial pfn[i] value.
    
    v2 (Thomas):
     - Prefer proper initializer.
    
    Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@intel.com>
    Cc: <stable@vger.kernel.org> # v6.10+
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch aca765dd193ad1c98ca57c2e22303f1a91c9df94 drm-intel
47f758bec213 drm/xe/userptr: properly setup pfn_flags_mask


