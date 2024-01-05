Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E190C47079
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 10:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2B10E5C1;
	Fri,  5 Jan 2024 10:46:58 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AA010E59A;
 Fri,  5 Jan 2024 10:46:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/managed=3A_Add_drmm?=
 =?utf-8?q?=5Frelease=5Faction_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Fri, 05 Jan 2024 10:46:57 -0000
Message-ID: <170445161772.39691.17196426309183746917@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105101324.26811-1-michal.winiarski@intel.com>
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
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

Series: drm/managed: Add drmm_release_action (rev4)
URL   : https://patchwork.freedesktop.org/series/127086/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ce40a0b6aaa30f047c3653072d7939e46ba5aec8
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Fri Jan 5 11:13:24 2024 +0100

    drm/tests: managed: Add a simple test for drmm_managed_release
    
    Add a simple test that checks whether the action is indeed called right
    away and that it is not called on the final drm_dev_put().
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
d82ad6288 drm/managed: Add drmm_release_action
d814ae25f drm/tests: managed: Rename the suite name to match other DRM tests
e8fc8ffa1 drm/tests: managed: Remove the waitqueue usage
d56f0a26a drm/tests: managed: Add comments and expect fail messages
23b1af58d drm/tests: managed: Extract device initialization into test init
ce40a0b6a drm/tests: managed: Add a simple test for drmm_managed_release


