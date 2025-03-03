Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BD6C282C5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 09:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1372610E3B0;
	Mon,  3 Mar 2025 09:53:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A6410E3B0;
 Mon,  3 Mar 2025 09:53:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/client=3A_Build_the_t?=
 =?utf-8?q?ests_with_CONFIG=5FDRM=5FKUNIT=5FTEST=3Dm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 09:53:48 -0000
Message-ID: <174099562849.80438.8938950198961797260@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
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

Series: drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
URL   : https://patchwork.freedesktop.org/series/145706/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1c70f7a04bf058ba8e5ee7e58b83e676216d135b
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Mar 3 11:48:08 2025 +0200

    drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
    
    Use IS_ENABLED() to check for CONFIG_DRM_KUNIT_TEST so
    that it picks up the modular case as well.
    
    Cc: Maxime Ripard <mripard@kernel.org>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 60b234fe25a41a2678a21d545477e22e0550faba drm-intel
1c70f7a04bf0 drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m


