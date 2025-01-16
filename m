Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E161C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 08:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215BF10E8D8;
	Thu, 16 Jan 2025 08:07:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2BC10E8D8;
 Thu, 16 Jan 2025 08:07:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_clarify_i?=
 =?utf-8?q?ntel=5Fpsr=5Fpre=5Fplane=5Fupdate=28=29_conditions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jan 2025 08:07:06 -0000
Message-ID: <173701482611.195286.13392414898357826357@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108104721.2278220-1-jani.nikula@intel.com>
In-Reply-To: <20250108104721.2278220-1-jani.nikula@intel.com>
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

Series: drm/i915/psr: clarify intel_psr_pre_plane_update() conditions (rev3)
URL   : https://patchwork.freedesktop.org/series/143234/
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
commit 9aacadae013c31a0a94861b49c495a925cc6dd49
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jan 8 12:47:21 2025 +0200

    drm/i915/psr: clarify intel_psr_pre_plane_update() conditions
    
    Make the conditions easier to follow. We don't do anything for
    !psr->enabled, so hoist psr->enabled check higher, avoiding all the
    checks when !psr->enabled. Stop the bitwise OR abuse on booleans by
    removing the temporary variable altogether.
    
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4cea1f90028925afcf1a0f8a0ef301f90349688c drm-intel
9aacadae013c drm/i915/psr: clarify intel_psr_pre_plane_update() conditions


