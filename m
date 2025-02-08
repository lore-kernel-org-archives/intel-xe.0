Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9BBC0219B
	for <intel-xe@archiver.kernel.org>; Sat,  8 Feb 2025 01:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D6310EBB5;
	Sat,  8 Feb 2025 01:19:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEF310EBB5;
 Sat,  8 Feb 2025 01:19:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/vrr=3A_Fix_DSB+V?=
 =?utf-8?q?RR_usage_for_PTL+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Feb 2025 01:19:50 -0000
Message-ID: <173897759097.2951403.1514741221384442020@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/vrr: Fix DSB+VRR usage for PTL+ (rev2)
URL   : https://patchwork.freedesktop.org/series/144152/
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
commit 588678f793d097f170be2cc81556b64c40cca6bd
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Sat Feb 8 00:31:59 2025 +0200

    drm/i915/dsb: Decode DSB error interrupts
    
    Decode the DSB error interrupts into human readable
    form for easier debugging.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4f934139887fd60bd4ac9027b7eec3e86ade8085 drm-intel
ce4c3678eec7 drm/i915/dsb: Move the +1 usec adjustment into dsb_wait_usec()
0e5f27c5e680 drm/i915/vrr: Don't send push for legacy cursor updates
29f5654637bd drm/i915/vrr: Account for TRANS_PUSH delay
5850ededbeb9 drm/i915/dsb: Compute use_dsb earlier
535abd3f3cce drm/i915/dsb: Introduce intel_dsb_poll()
0d6c8efc249d drm/i915/vrr: Reorder the DSB "wait for safe window" vs. TRANS_PUSH
b17d7828f24d drm/i915/vrr: Check that the push send bit is clear after delayed vblank
588678f793d0 drm/i915/dsb: Decode DSB error interrupts


