Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FB606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 23:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4F310E3D0;
	Thu, 26 Nov 2026 23:43:55 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB0F10E3D0;
 Thu, 26 Nov 2026 23:43:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/de=3A_Nuke_uncor?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 23:43:54 -0000
Message-ID: <179573663491.96058.984904067319644434@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/de: Nuke uncore
URL   : https://patchwork.freedesktop.org/series/179800/
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
commit 62ac786ab554ffe1dcc130f022bd83797f23da24
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Nov 26 23:27:28 2026 +0200

    drm/i915/de: Document intel_de_write8()'s usage restrictions
    
    intel_de_read8() has a comment explaining the WARN and why the
    function doesn't need to do anything exotic beyond the raw
    readb(). Add a similar comment to intel_de_write8().
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b9ca025eaaa7b876bdd4a17bb77dc35d6d648648 drm-intel
613ad815a444 drm/i915/de: Move the register tracepoint to display
-:120: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#120: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:963:
+TRACE_EVENT(intel_reg_rw,
+	TP_PROTO(bool write, intel_reg_t reg, u32 val, int len),

-:124: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#124: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:967:
+	TP_STRUCT__entry(

-:131: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#131: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:974:
+	TP_fast_assign(

-:139: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#139: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:982:
+	TP_printk("%s reg=0x%x, len=%d, val=0x%x",
+		__entry->write ? "write" : "read",

total: 0 errors, 0 warnings, 4 checks, 93 lines checked
859497f6a6d5 drm/i915/de: Pimp the intel_reg_rw tracepoint printf format
08741c809a7f drm/i915/de: Convert intel_de_read_fw() into a vfunc
400c256126e9 drm/i915/de: Use raw readl()/writel()/etc for register access in display
fb60bc3d4c2f drm/i915/de: Add intel_parent_mmio_regs() interface
53d58e13d0bc drm/xe: Nuke the compat uncore stuff
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
62ac786ab554 drm/i915/de: Document intel_de_write8()'s usage restrictions


