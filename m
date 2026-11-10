Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1AC606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F356110E082;
	Tue, 10 Nov 2026 19:19:36 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF510E082;
 Tue, 10 Nov 2026 19:19:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/de=3A_Work_towar?=
 =?utf-8?q?ds_uncore_elimination_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 19:19:35 -0000
Message-ID: <179433837572.5180.9944022770597473856@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/de: Work towards uncore elimination (rev3)
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
commit 486aa922483a7ebc750fe52d28436661aaec1878
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Nov 10 20:46:21 2026 +0200

    drm/xe: Nuke the intel_uncore_{read, write}() wrappers
    
    intel_uncore_{read,write}() are no longer needed by the
    display code. Remove them.
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch c8d0fb6110b86aa64eb59502df08b529e221f232 drm-intel
d2960254fabc drm/i915/de: Introduce dislay->mmio and intel_de_init()
92d189942c9d drm/i915/de: Convert intel_de_{read, write}() into vfuncs
c5284e7921d1 drm/i915/de: Introduce mmio read/write templates
df62c06fd04d drm/i915/de: Eliminate runtime overhead from DMC wakelock on pre-LNL platforms
3b1b7ed70d35 drm/i915/de: Introduce display->mmio.lock
19a29ebe593c drm/i915/uncore: Don't meddle with mmio debug upon user forcewake
df3256e273a9 drm/i915/de: Move unclaimed mmio detection into display code
-:414: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#414: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:147:
+intel_display_param_named(mmio_debug, int, 0400,
+	"Enable the MMIO debug code for the first N failures (default: off). "

total: 0 errors, 0 warnings, 1 checks, 741 lines checked
36c989efadcc drm/i915: Nuke HAS_FPGA_DBG_UNCLAIMED()/.has_fpga_dbg
577b1eac02e5 drm/i915/de: Stop using intel_uncore_{read,write}()
486aa922483a drm/xe: Nuke the intel_uncore_{read, write}() wrappers


