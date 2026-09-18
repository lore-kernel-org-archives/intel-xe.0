Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE11DC982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDBF10F188;
	Fri, 18 Sep 2026 06:10:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689C10F188;
 Fri, 18 Sep 2026 06:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Disable_DC?=
 =?utf-8?q?5/6_before_AUX_programming?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 06:10:38 -0000
Message-ID: <178971183893.180302.10062519737928038785@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
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

Series: drm/i915/dp: Disable DC5/6 before AUX programming
URL   : https://patchwork.freedesktop.org/series/174474/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 50140f34665a7148847f7a63c553bed9e5ec0dde
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Sep 18 11:34:26 2026 +0530

    drm/i915/dp: Disable DC5/6 before AUX programming
    
    From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
    for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
    which powers down the PHY. Which means we need to make sure Step 4
    of AUX Programming sequence is honored.
    Disable Dc5/6 when programming AUX.
    
    Bspec: 68851, 68967
    Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 15f7465765dc45d58738fc05a1c11a785e709c05 drm-intel
50140f34665a drm/i915/dp: Disable DC5/6 before AUX programming
-:13: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#13: 
Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


