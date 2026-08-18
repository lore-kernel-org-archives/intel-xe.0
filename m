Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CA7C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 15:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FC910E512;
	Tue, 18 Aug 2026 15:15:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F20810E4C2;
 Tue, 18 Aug 2026 15:15:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_error_threshold?=
 =?utf-8?q?_to_drm=5Fras_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 15:15:42 -0000
Message-ID: <178706614231.63833.8503885338405775277@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818135304.497098-1-raag.jadav@intel.com>
In-Reply-To: <20260818135304.497098-1-raag.jadav@intel.com>
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

Series: Introduce error threshold to drm_ras (rev6)
URL   : https://patchwork.freedesktop.org/series/165091/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1d2260907dc80a20e3ca12c33a8f1a49ba22c0f9
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Aug 18 19:22:09 2026 +0530

    drm/xe/sysctrl: Reuse xe_sysctrl_create_command()
    
    Now that we have a helper to create sysctrl command, reuse it for
    threshold crossed events.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 275df33dcf4c5d018717867a0b29ed1d3b62c1ef drm-intel
cf978eb34a24 drm/ras: Cancel and free message on get counter failure
38da62016855 drm/ras: Introduce error threshold
-:318: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#318: FILE: drivers/gpu/drm/drm_ras_nl.c:32:
+static const struct nla_policy drm_ras_get_error_threshold_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

-:324: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#324: FILE: drivers/gpu/drm/drm_ras_nl.c:38:
+static const struct nla_policy drm_ras_set_error_threshold_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD + 1] = {

total: 0 errors, 2 warnings, 0 checks, 370 lines checked
180e579dc707 drm/xe/ras: Add support for error threshold
3843714c6e86 drm/xe/drm_ras: Wire up error threshold callbacks
1d2260907dc8 drm/xe/sysctrl: Reuse xe_sysctrl_create_command()


