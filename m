Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED136C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E25810E451;
	Mon,  7 Apr 2025 13:46:20 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2375810E451;
 Mon,  7 Apr 2025 13:46:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Stop_writ?=
 =?utf-8?q?ing_VRR=5FCTL=5FIGN=5FMAX=5FSHIFT_for_LNL_onwards?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 13:46:19 -0000
Message-ID: <174403357914.43714.6150213848738684552@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407063758.3131498-1-jouni.hogander@intel.com>
In-Reply-To: <20250407063758.3131498-1-jouni.hogander@intel.com>
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

Series: drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for LNL onwards
URL   : https://patchwork.freedesktop.org/series/147307/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3944ae17465e8663bcc7c8303582d3dbe81149e9
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Apr 7 09:37:58 2025 +0300

    drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for LNL onwards
    
    According to Bspec VRR_CTL_IGN_MAX_SHIFT doesn't exist for LunarLake and
    onwards. Bit 30 is "Mask Block PkgC" instead. Stop writing that for
    LunarLake and onwards.
    
    Bspec: 68925
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com
+ /mt/dim checkpatch 9bd4cfaac6862127b1371a90bf47909879556aa0 drm-intel
3944ae17465e drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for LNL onwards
-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Ankit Nautiyal <ankit.k.nautiyal@intel.com'
#17: 
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com

total: 1 errors, 0 warnings, 0 checks, 11 lines checked


