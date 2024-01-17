Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEC9C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BCB10E6AE;
	Wed, 17 Jan 2024 13:56:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3672110E6AE;
 Wed, 17 Jan 2024 13:56:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Enable_WA_1?=
 =?utf-8?q?4018913170_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Wed, 17 Jan 2024 13:56:02 -0000
Message-ID: <170549976222.536878.8748858050271639120@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117055035.2417711-1-karthik.poosa@intel.com>
In-Reply-To: <20240117055035.2417711-1-karthik.poosa@intel.com>
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

Series: drm/xe/guc: Enable WA 14018913170 (rev3)
URL   : https://patchwork.freedesktop.org/series/128806/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 65bb60738bfdee942da14a3b6a6d60ed2873f128
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Jan 17 11:20:35 2024 +0530

    drm/xe/guc: Enable WA 14018913170
    
    The GuC handles the WA, the KMD just needs to set the flag to enable
    it on the appropriate platforms.
    
    v2:
      - Fixed CI checkpatch warning, alignment should match open parenthesis.
      - Fixed GUC FW version check to use XE_UC_FW_VER_RELEASE which points to
        current GUC FW version instead of XE_UC_FW_VER_COMPATIBILITY which
        holds GUC FW I/F version (Badal).
    v3:
      - Removed extra character in debug print.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch b42f47ca5fff1d04fb8eb02d64520b3f338a495d drm-intel
65bb60738 drm/xe/guc: Enable WA 14018913170


