Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3C606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F372112524;
	Thu, 22 Oct 2026 12:02:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C57112524;
 Thu, 22 Oct 2026 12:02:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Optimize_regi?=
 =?utf-8?q?sters_accesses_in_irq_handlers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Oct 2026 12:02:52 -0000
Message-ID: <179267057291.56426.10835865024840533152@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Optimize registers accesses in irq handlers
URL   : https://patchwork.freedesktop.org/series/176635/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 90dd7d3c6cb4567c17ed791b5fdeca00885a13c9
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Oct 22 14:55:48 2026 +0300

    drm/i915: Skip redundant frame/scanline/time reads for async flips
    
    The frame/scanline/time information we read out at the
    start of intel_pipe_update_end() is never used if we
    we are performing an async flip. Skip the redundant work.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b2af5f9ef576a3026836cca5ec8757cc045a1856 drm-intel
5a1f6d0c6bf3 drm/i915: Use intel_de_read64_2x32_volatile_fw() for IVB_TIMESTAMP_CTR+PIPE_FRMTMSTMP query
d3f761661689 drm/i915: Use intel_de_{read, write})fw() in BDW+ irq handlers
-:72: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:247:
+		intel_de_write_fw(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);

total: 0 errors, 1 warnings, 0 checks, 267 lines checked
992750dd54ef drm/i915: Use intel_de_{read, write})fw() in VLV/CHV irq handlers
90dd7d3c6cb4 drm/i915: Skip redundant frame/scanline/time reads for async flips


