Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68697FE51FF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 10:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B1110F51F;
	Fri, 24 Apr 2026 10:22:12 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B51110F51E;
 Fri, 24 Apr 2026 10:22:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AS_SDP_cleanups_and_addit?=
 =?utf-8?q?ions_for_Panel_Replay_+_VRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 10:22:10 -0000
Message-ID: <177702613056.7958.6059034053738942325@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424093424.3060805-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260424093424.3060805-1-ankit.k.nautiyal@intel.com>
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

Series: AS SDP cleanups and additions for Panel Replay + VRR
URL   : https://patchwork.freedesktop.org/series/165419/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e82109b6b55baa8ee6ef12eccf2d3e25e83eea8
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Apr 24 15:04:24 2026 +0530

    drm/dp: Add target_rr_divider field in AS SDP logging
    
    The field target_rr_divider is missing from the AS SDP logging.
    Add it and print the divider value (1.001 or 1.000) as per the DP 2.1 spec.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e drm-intel
ef5e755c75c1 drm/dp: Rename and relocate AS SDP payload field masks
47fbec7a53e2 drm/dp: Clean up DPRX feature enumeration macros
aac33beb8222 drm/dp: Add bits for AS SDP FAVT Payload Fields Parsing support
91f64a099df6 drm/dp: Add DPCD for configuring AS SDP for PR + VRR
-:23: WARNING:BAD_SIGN_OFF: Duplicate signature
#23: 
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
4967d8f469e5 drm/dp: Store coasting vtotal in struct drm_dp_as_sdp
7ca35c3381dc drm/dp: Add a helper to get the SDP type as a string
5e82109b6b55 drm/dp: Add target_rr_divider field in AS SDP logging


