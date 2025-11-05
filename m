Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D6CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 20:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269010E0A8;
	Wed,  5 Nov 2025 20:48:13 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657EB10E0A8;
 Wed,  5 Nov 2025 20:48:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_Reject_as?=
 =?utf-8?q?ync_flips_when_selective_fetch_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 20:48:12 -0000
Message-ID: <176237569240.20785.2008280788715696450@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105171015.22234-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251105171015.22234-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/psr: Reject async flips when selective fetch is enabled
URL   : https://patchwork.freedesktop.org/series/157091/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 01e43e9c565971e328d8dcde6e602a9e93f94a99
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Nov 5 19:10:15 2025 +0200

    drm/i915/psr: Reject async flips when selective fetch is enabled
    
    The selective fetch code doesn't handle asycn flips correctly.
    There is a nonsense check for async flips in
    intel_psr2_sel_fetch_config_valid() but that only gets called
    for modesets/fastsets and thus does nothing for async flips.
    
    Currently intel_async_flip_check_hw() is very unhappy as the
    selective fetch code pulls in planes that are not even async
    flips capable.
    
    Reject async flips when selective fetch is enabled, until
    someone fixes this properly (ie. disable selective fetch while
    async flips are being issued).
    
    Cc: stable@vger.kernel.org
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4247aae08afc576bbe58c7998b5e2f6a2ea982ad drm-intel
01e43e9c5659 drm/i915/psr: Reject async flips when selective fetch is enabled
-:61: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


