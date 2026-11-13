Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2460A2621
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 14:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA2A112415;
	Fri, 13 Nov 2026 14:33:44 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E19112415;
 Fri, 13 Nov 2026 14:33:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D=3A_M?=
 =?utf-8?q?ake_unclaimed_mmio_detection_lockless_and_enable_it_for_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 14:33:43 -0000
Message-ID: <179458042334.20639.3791126700206653573@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/{i915, xe}: Make unclaimed mmio detection lockless and enable it for xe
URL   : https://patchwork.freedesktop.org/series/178490/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a24f10132fa884d9be314ea3457ce9410cfccfe5
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Nov 13 15:43:55 2026 +0200

    drm/i915/de: Nuke driver_is_i915()
    
    Now that both i915 and xe use the same mmio funcs for
    TGL+ we can unify the intel_de_init() if-ladders for
    the two drivers and get rid of driver_is_i915().
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch d41695c479e8bb24eb941e5ba916e42784af6f4d drm-intel
63524d796f40 drm/i915/de: Uninline intel_de_{read,write}_fw()
23efbb3fa2f0 drm/i915/de: Pimp the intel_de_{read,write}_fw() docs
891c09358a99 drm/i915/de: Flatten the unclaimed mmio code
767ab8939b87 drm/i915/de: Make mmio_debug lockless
-:247: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#247: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:147:
+intel_display_param_named(mmio_debug, bool, 0400,
+	"Enable MMIO debug code (default: false). "

total: 0 errors, 0 warnings, 1 checks, 170 lines checked
3b5ef1a0c476 drm/i915/de: Optimize the mmio_debug checks in intel_de_{read, write}()
a7f0bbe9c98a drm/i915/de: Make display registers unlocked for TGL+ on i915
ca74c8469e68 drm/xe: Enable unclaimed register detection on xe
a24f10132fa8 drm/i915/de: Nuke driver_is_i915()


