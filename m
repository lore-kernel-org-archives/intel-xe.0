Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF25C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 13:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E541010E3E3;
	Tue, 20 Feb 2024 13:17:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F70710E3B8;
 Tue, 20 Feb 2024 13:17:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/tv=3A_Fix_TV_mod?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 13:17:55 -0000
Message-ID: <170843507539.125001.17075705422936132533@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220131251.453060-1-mripard@kernel.org>
In-Reply-To: <20240220131251.453060-1-mripard@kernel.org>
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

Series: drm/i915/tv: Fix TV mode
URL   : https://patchwork.freedesktop.org/series/130121/
State : warning

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
commit 34ddcffdb887f71016849bcade52be2ad8afb7be
Author: Maxime Ripard <mripard@kernel.org>
Date:   Tue Feb 20 14:12:51 2024 +0100

    drm/i915/tv: Fix TV mode
    
    Commit 1fd4a5a36f9f ("drm/connector: Rename legacy TV property") failed
    to update all the users of the struct drm_tv_connector_state mode field,
    which resulted in a build failure in i915.
    
    However, a subsequent commit in the same series reintroduced a mode
    field in that structure, with a different semantic but the same type,
    with the assumption that all previous users were updated.
    
    Since that didn't happen, the i915 driver now compiles, but mixes
    accesses to the legacy_mode field and the newer mode field, but with the
    previous semantics.
    
    This obviously doesn't work very well, so we need to update the accesses
    that weren't in the legacy renaming commit.
    
    Fixes: 1fd4a5a36f9f ("drm/connector: Rename legacy TV property")
    Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Maxime Ripard <mripard@kernel.org>
+ /mt/dim checkpatch e2b02e89746d8eff8c244f938eecd0f1db8eb805 drm-intel
34ddcffdb887 drm/i915/tv: Fix TV mode
-:25: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#25: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

-:73: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#73: FILE: drivers/gpu/drm/i915/display/intel_sdvo.c:3111:
+	intel_sdvo_connector->base.base.state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[0];

total: 0 errors, 2 warnings, 0 checks, 80 lines checked


