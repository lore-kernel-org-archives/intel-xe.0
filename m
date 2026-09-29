Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CDBCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 17:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A09910EFB5;
	Tue, 29 Sep 2026 17:07:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492C010EFB5;
 Tue, 29 Sep 2026 17:07:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/cri=3A_Expose_devi?=
 =?utf-8?q?ce_UID_through_sysfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Sep 2026 17:07:38 -0000
Message-ID: <179070165829.218638.17790762886266149649@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929171823.3811737-2-badal.nilawar@intel.com>
In-Reply-To: <20260929171823.3811737-2-badal.nilawar@intel.com>
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

Series: drm/xe/cri: Expose device UID through sysfs
URL   : https://patchwork.freedesktop.org/series/175234/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fb6845f86f04a223243d9b0c99d19b43a256aa5a
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue Sep 29 22:48:24 2026 +0530

    drm/xe/cri: Expose device UID through sysfs
    
    Expose a read-only sysfs attribute, device_uid, that reports the
    GPU SoC's unique identifier.
    
    Bspec: 53048, 53049
    Assisted-by: Claude:claude-opus-4.8
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch ecc5a84be849c400af610cdc613a0274e3b101b2 drm-intel
fb6845f86f04 drm/xe/cri: Expose device UID through sysfs
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked


