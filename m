Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCC1CD4F26
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 10:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F94A10EA96;
	Tue, 23 Jun 2026 10:56:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295CB10EA96;
 Tue, 23 Jun 2026 10:56:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_error_threshold?=
 =?utf-8?q?_to_drm=5Fras_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 10:56:21 -0000
Message-ID: <178221218116.105421.2032233573419673779@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623101043.255897-1-raag.jadav@intel.com>
In-Reply-To: <20260623101043.255897-1-raag.jadav@intel.com>
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

Series: Introduce error threshold to drm_ras (rev4)
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
commit 0455ef26277e364e46e6c48ceda60e0d4bc1cc0d
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Jun 23 15:39:59 2026 +0530

    drm/xe/sysctrl: Reuse xe_sysctrl_create_command()
    
    Now that we have a helper to create sysctrl command, reuse it for
    threshold crossed events.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 60326b17f877e12846167bf8ef83680b9875218a drm-intel
533a6e1cce29 drm/ras: Cancel and free message on get counter failure
aedc9c8edeec drm/ras: Introduce error threshold
-:317: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#317: FILE: drivers/gpu/drm/drm_ras_nl.c:32:
+static const struct nla_policy drm_ras_get_error_threshold_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

-:323: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#323: FILE: drivers/gpu/drm/drm_ras_nl.c:38:
+static const struct nla_policy drm_ras_set_error_threshold_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD + 1] = {

total: 0 errors, 2 warnings, 0 checks, 369 lines checked
931928eb902f drm/xe/ras: Add support for error threshold
7205b1a333a9 drm/xe/drm_ras: Wire up error threshold callbacks
0455ef26277e drm/xe/sysctrl: Reuse xe_sysctrl_create_command()


