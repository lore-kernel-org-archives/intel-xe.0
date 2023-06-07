Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A7DC77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 08:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D615410E457;
	Wed,  7 Jun 2023 08:07:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3978E10E457;
 Wed,  7 Jun 2023 08:07:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2A773A00CC;
 Wed,  7 Jun 2023 08:07:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Wed, 07 Jun 2023 08:07:56 -0000
Message-ID: <168612527617.21181.97962920496204044@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607081004.887428-1-badal.nilawar@intel.com>
In-Reply-To: <20230607081004.887428-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Donot_apply_forcewake_while_reading_actual_frequency?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Donot apply forcewake while reading actual frequency
URL   : https://patchwork.freedesktop.org/series/118990/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8a58d8e37243f7cdbe36590aba6b15835ea35d7
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Jun 7 13:40:04 2023 +0530

    drm/xe: Donot apply forcewake while reading actual frequency
    
    The registers RPSTAT1, MTL_MIRROR_TARGET_WP1 doesn't fall under
    any of the forcewake domain so doesn't require forcewake to be read.
    When GT in RC6 frequency reported will be 0.
    
    Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch a17ea8317b0260a1230cedb0469d4ba0cec0f4f2 drm-intel
b8a58d8e3 drm/xe: Donot apply forcewake while reading actual frequency
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7dbca224f176', maybe rebased or not pulled?
#10: 
Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


