Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3149C021AA
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 20:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7003D10E293;
	Mon, 17 Feb 2025 20:53:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1D010E293;
 Mon, 17 Feb 2025 20:53:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_type-safety_on_PO?=
 =?utf-8?q?WER=5FDOMAIN=5F*=28=29_macros_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 20:53:19 -0000
Message-ID: <173982559983.3364479.1927076816463808866@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217203722.87152-1-gustavo.sousa@intel.com>
In-Reply-To: <20250217203722.87152-1-gustavo.sousa@intel.com>
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

Series: Improve type-safety on POWER_DOMAIN_*() macros (rev3)
URL   : https://patchwork.freedesktop.org/series/144727/
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
commit 7a09bb3a41221d6281b146345146bd0fc6b9a439
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Feb 17 17:34:28 2025 -0300

    drm/i915/display: Convert POWER_DOMAIN_*() to functions
    
    We already have other functions to get power domain for other things
    (i.e. intel_display_power_*_domain()). Convert POWER_DOMAIN_*() macros
    to the same standard.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch c282b8face163244076dac30e4c9ffd74dc89044 drm-intel
5de7202cc23d drm/i915/display: Use explicit base values in POWER_DOMAIN_*() macros
b8ba44c071e8 drm/i915/display: Make POWER_DOMAIN_*() always result in enum intel_display_power_domain
7a09bb3a4122 drm/i915/display: Convert POWER_DOMAIN_*() to functions


