Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E19C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 18:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D529110E7B6;
	Wed, 15 Jan 2025 18:19:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB64D10E7B6;
 Wed, 15 Jan 2025 18:19:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mtl=3A_Add_Wa=5F22?=
 =?utf-8?q?018931422_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 18:19:33 -0000
Message-ID: <173696517396.4059606.5349434496248877374@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114190242.2026743-2-matthew.d.roper@intel.com>
In-Reply-To: <20250114190242.2026743-2-matthew.d.roper@intel.com>
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

Series: drm/xe/mtl: Add Wa_22018931422 (rev2)
URL   : https://patchwork.freedesktop.org/series/143524/
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
commit 9ba5d41efb90c4eb30ee09b4698a7207667d3259
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Jan 14 11:02:43 2025 -0800

    drm/xe/mtl: Add Wa_22018931422
    
    Although Wa_22018931422 still isn't fully documented in the hardware
    database, it's been implemented in i915 for over a year and has been
    successful at fixing MCR lock timeout issues.  Bring the same workaround
    over to the Xe driver.
    
    Since the official documentation for this workaround still isn't fully
    complete, there isn't clear guidance on exactly which platform(s)
    are/aren't impacted, but our belief is that this should be applied to
    the graphics and media IPs used by MTL and ARL platforms.  Offline
    discussion with the hardware teams indicated that this should not be
    relevant to any Xe2 or later platforms.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4059
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
+ /mt/dim checkpatch d597e12dca87a29f4824c173dd9e82e8e1c03e4f drm-intel
9ba5d41efb90 drm/xe/mtl: Add Wa_22018931422


