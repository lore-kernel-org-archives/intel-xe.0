Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B21606D811
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 00:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13410FFBC;
	Thu,  5 Nov 2026 00:01:32 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2DA10FFBC;
 Thu,  5 Nov 2026 00:01:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/de=3A_Work_towar?=
 =?utf-8?q?ds_uncore_elimination?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 00:01:31 -0000
Message-ID: <179383689125.121609.5321593999870620364@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/de: Work towards uncore elimination
URL   : https://patchwork.freedesktop.org/series/177794/
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
commit 9be9b71d8de22845bab7254a252167d077a36c1b
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Nov 5 00:18:42 2026 +0200

    drm/xe: Nuke the intel_uncore_{read,write}() wrappers
    
    intel_uncore_{read,write}() are no longer needed by the
    display code. Remove them.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 3379b0f74f31bfc3746b692822a7700aeeebe15d drm-intel
978ce3ec7cb6 drm/i915/de: Introduce dislay->mmio and intel_de_init()
9d5e0bb0483c drm/i915/de: Convert intel_de_{read,write}() into vfuncs
ffc1b27a5559 drm/i915/de: Introduce mmio read/write templates
3922b9f0f206 drm/i915/de: Eliminate runtime overhead from DMC wakelock on pre-LNL platforms
08645490406e drm/i915/de: Introduce display->mmio.lock
6f48b5e7c935 drm/i915/uncore: Don't meddle with mmio debug upon user forcewake
e9e9a214b0d2 drm/i915/de: Move unclaimed mmio detection into display code
-:393: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#393: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:147:
+intel_display_param_named(mmio_debug, int, 0400,
+	"Enable the MMIO debug code for the first N failures (default: off). "

total: 0 errors, 0 warnings, 1 checks, 730 lines checked
fbbc049c6288 drm/i915/de: Stop using intel_uncore_{read,write}()
9be9b71d8de2 drm/xe: Nuke the intel_uncore_{read,write}() wrappers


