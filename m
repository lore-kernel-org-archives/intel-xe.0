Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC54606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 22:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D0D10E446;
	Thu, 26 Nov 2026 22:23:38 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3D10E48C;
 Thu, 26 Nov 2026 22:23:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_vbt/modparams?=
 =?utf-8?q?-related_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 22:23:36 -0000
Message-ID: <179573181691.95908.12278919773490267388@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
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

Series: drm/i915: vbt/modparams-related cleanups
URL   : https://patchwork.freedesktop.org/series/179789/
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
commit d076ec6733462c02f5ee379dd1ab33b3367e57cb
Author: Michał Grzelak <michal.grzelak@linux.intel.com>
Date:   Thu Nov 26 19:06:14 2026 +0100

    drm/i915/bios: s/init_bdb_blocks/init_each_bdb_block/
    
    init_bdb_blocks() and init_bdb_block() names differ only by the suffix
    's'. Rename the former to lower the confusion and to reflect better it's
    meaning.
    
    No functional change.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
+ /mt/dim checkpatch ea2510ce330242a943078303fffa0aeba53e6e00 drm-intel
7ee9e8f7f39a drm/i915/display: remove edp_vswing modparam
7ae64852510a drm/i915/display: s/vbt_firmware/i915_vbt/
-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:40:
+intel_display_param_named_unsafe(i915_vbt, charp, 0400,
 	"Load VBT from specified file under /lib/firmware");

total: 0 errors, 0 warnings, 1 checks, 24 lines checked
bcbac7336bf5 drm/i915/bios: s/parse_ddi_ports/parse_each_ddi_port/
d076ec673346 drm/i915/bios: s/init_bdb_blocks/init_each_bdb_block/


