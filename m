Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82988E7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4510E276;
	Mon,  2 Oct 2023 09:27:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48A4D10E274;
 Mon,  2 Oct 2023 09:27:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 36A72A00E8;
 Mon,  2 Oct 2023 09:27:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Mon, 02 Oct 2023 09:27:19 -0000
Message-ID: <169623883922.3206.2545247742419492607@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002092402.1826859-1-jani.nikula@intel.com>
In-Reply-To: <20231002092402.1826859-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?vert_=22drm/i915=3A_define_I915_during_i915_driver_build=22?=
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

Series: Revert "drm/i915: define I915 during i915 driver build"
URL   : https://patchwork.freedesktop.org/series/124513/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c50b4b8878dc182986d17063e5291ea7b6421e2c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Oct 2 12:24:02 2023 +0300

    Revert "drm/i915: define I915 during i915 driver build"
    
    This reverts commit 12b98dd1eb4f2ec852dce19a01a76bf43a39bbee.
    
    We already have commit a4ba1ea69f6b ("drm/i915: define I915 during i915
    driver build") in the baseline. It defines I915 at a slightly different
    place from this, so there was no conflict. This can be dropped.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 22fcf2404f56a8e7aea6734298e0b2b265136313 drm-intel
c50b4b887 Revert "drm/i915: define I915 during i915 driver build"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '12b98dd1eb4f2ec852dce19a01a76bf43a39bbee', maybe rebased or not pulled?
#6: 
This reverts commit 12b98dd1eb4f2ec852dce19a01a76bf43a39bbee.

-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a4ba1ea69f6b', maybe rebased or not pulled?
#8: 
We already have commit a4ba1ea69f6b ("drm/i915: define I915 during i915

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


