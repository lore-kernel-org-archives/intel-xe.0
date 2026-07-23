Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C53C44524
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F7410F034;
	Thu, 23 Jul 2026 08:33:30 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8463B10E575;
 Thu, 23 Jul 2026 08:33:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_ocode_late_binding_su?=
 =?utf-8?q?pport_for_CRI_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jul 2026 08:33:29 -0000
Message-ID: <178479560953.220306.11353585617563660390@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723083659.716683-7-badal.nilawar@intel.com>
In-Reply-To: <20260723083659.716683-7-badal.nilawar@intel.com>
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

Series: Add ocode late binding support for CRI (rev4)
URL   : https://patchwork.freedesktop.org/series/162657/
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
commit 30c96b75868d1eee4d06f7d3dd3d2de0cebb2ee3
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Jul 23 14:07:05 2026 +0530

    drm/xe/xe_late_bind_fw: Refactor pm flow
    
    Refactor late binding flow across suspend/resume by adding dedicated
    pm functions.
    
    Assisted-by: GitHub-Copilot:GPT-5.3
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 2917ea6f91d2957b4c9fa73d4631ccdb6a650830 drm-intel
4721b8dd6bc7 drm/xe/xe_late_bind_fw: Fix firmware leak on missing manifest entry
410db8b3175a drm/xe/xe_late_bind_fw: Convert late bind flag to mask
7ec33c41c06b drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
-:17: WARNING:TYPO_SPELLING: 'dependancy' may be misspelled - perhaps 'dependency'?
#17: 
  - Declare the Ocode firmware dependancy with MODULE_FIRMWARE (Daniele)
                               ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 130 lines checked
65870cd45fb1 drm/xe/xe_late_bind_fw: Enable late binding support for CRI
30c96b75868d drm/xe/xe_late_bind_fw: Refactor pm flow


