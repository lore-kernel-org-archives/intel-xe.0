Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E6DC3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 17:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D07310E33E;
	Mon, 15 Jan 2024 17:17:19 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0DB10E33E;
 Mon, 15 Jan 2024 17:17:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/managed=3A_Add_drmm?=
 =?utf-8?q?=5Frelease=5Faction_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Mon, 15 Jan 2024 17:17:17 -0000
Message-ID: <170533903783.479824.17213235065283751241@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240115171351.504264-1-michal.winiarski@intel.com>
In-Reply-To: <20240115171351.504264-1-michal.winiarski@intel.com>
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

Series: drm/managed: Add drmm_release_action (rev5)
URL   : https://patchwork.freedesktop.org/series/127086/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a7746e30f57e6f4785ec4f83b9cc4ebb5e5cc845
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Mon Jan 15 18:13:51 2024 +0100

    drm/tests: managed: Add a simple test for drmm_managed_release
    
    Add a simple test that checks whether the action is called when
    drmm_managed_release is called.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 3a1d727c0061b96ddf8e653130f94ab331e2f065 drm-intel
d952e1113 drm/managed: Add drmm_release_action
2b703ec14 drm/tests: managed: Rename the suite name to match other DRM tests
90b856c2b drm/tests: managed: Add comments about test intent
e5f6bfd14 drm/tests: managed: Extract device initialization into test init
a7746e30f drm/tests: managed: Add a simple test for drmm_managed_release


