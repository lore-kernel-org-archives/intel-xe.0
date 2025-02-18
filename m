Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14747C021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 23:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D473410E157;
	Tue, 18 Feb 2025 23:40:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2210E1A1;
 Tue, 18 Feb 2025 23:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dsb=3A_Update_pl?=
 =?utf-8?q?ane_scalers_on_DSB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 23:40:15 -0000
Message-ID: <173992201579.3703329.1133320708451067152@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218205850.1422-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250218205850.1422-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dsb: Update plane scalers on DSB
URL   : https://patchwork.freedesktop.org/series/145044/
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
commit 531ff9e0d16b831fb331467c2287de47d5a0ed5a
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Feb 18 22:58:50 2025 +0200

    drm/i915: Do state check for color management changes
    
    In order to validate LUT programming more thoroughly let's
    do a state check for all color management updates as well.
    
    Not sure we really want this outside CI. It is rather heavy
    and color management updates could become rather common
    with all the HDR/etc. stuff happening. Maybe we should have
    an extra knob for this that we could enable in CI?
    
    v2: Skip for initial_commit to avoid FDI dotclock
        sanity checks/etc. tripping up
    
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 5496d2c9c90ad0d79dd25337bc2a43704a1e295e drm-intel
86d24b15d5c2 drm/i915/dsb: Allow DSB based updates without planes
51064e3087e1 drm/i915/dsb: Plumb dsb into plane scaler functions
36401e76e784 drm/i915/dsb: Allow DSB based commits when scalers are in use
531ff9e0d16b drm/i915: Do state check for color management changes


