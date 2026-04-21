Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414A8EA71A4
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 04:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B7510E7B2;
	Tue, 21 Apr 2026 04:17:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647C610E16D;
 Tue, 21 Apr 2026 04:17:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/gmbus=3A_Try_to_?=
 =?utf-8?q?fix_AUX_software_timeouts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Apr 2026 04:17:29 -0000
Message-ID: <177674504940.480178.16509449252865292746@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260420214843.17514-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260420214843.17514-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/gmbus: Try to fix AUX software timeouts
URL   : https://patchwork.freedesktop.org/series/165187/
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
commit 1dc1218382ea4077b9a8d5a08d850be725d57ed8
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Apr 21 00:48:43 2026 +0300

    drm/i915/gmbus: Swap locks vs. wakeref in intel_gmbus_output_aksv()
    
    Normal GMBUS transfers lock the mutexes first, the grab the power
    domain wakeref. Do it the same way around for the HDCP stuff,
    for consistency.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 898b5aa235c5b269d6c745fd84270b296aa75469 drm-intel
ba6affac6f04 drm/i915/gmbus: Lock AUX CH during GMBUS transfers
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
<7> [197.185322] i915 0000:03:00.0: [drm:intel_dp_aux_xfer [i915]] AUX USBC2/DDI TC2/PHY D: timeout (status 0x7d40023f)

total: 0 errors, 1 warnings, 0 checks, 90 lines checked
1dc1218382ea drm/i915/gmbus: Swap locks vs. wakeref in intel_gmbus_output_aksv()


