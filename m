Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D56E9DE41
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 07:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E710E750;
	Thu,  9 Apr 2026 07:07:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF910E750;
 Thu,  9 Apr 2026 07:07:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_clear-error-counter_c?=
 =?utf-8?q?ommand_to_drm=5Fras?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 07:07:16 -0000
Message-ID: <177571843612.445249.7733089515668201832@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409073318.2909379-4-riana.tauro@intel.com>
In-Reply-To: <20260409073318.2909379-4-riana.tauro@intel.com>
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

Series: Add clear-error-counter command to drm_ras
URL   : https://patchwork.freedesktop.org/series/164601/
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
commit 6d9a11f9d7dd850a6894de837f3403ce165e8554
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Apr 9 13:03:20 2026 +0530

    drm/xe/xe_drm_ras: Add support for clear-error-counter in XE drm_ras
    
    Add support for clear-error-counter command in XE drm_ras
    This resets the counter value.
    
    Usage:
    
    $ sudo ynl --family drm_ras  --do clear-error-counter --json \
    '{"node-id":1, "error-id":1}'
    None
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch e105f427a4533d9a6d4597597da78484313c9b61 drm-intel
d45f37f8710d drm/drm_ras: Add clear-error-counter netlink command to drm_ras
-:165: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#165: FILE: drivers/gpu/drm/drm_ras_nl.c:26:
+static const struct nla_policy drm_ras_clear_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
6d9a11f9d7dd drm/xe/xe_drm_ras: Add support for clear-error-counter in XE drm_ras


