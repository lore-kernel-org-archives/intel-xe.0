Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434F0C001B3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 13:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAF810E481;
	Wed, 21 Jun 2023 13:59:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C774B10E487;
 Wed, 21 Jun 2023 13:58:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C3FBEA0093;
 Wed, 21 Jun 2023 13:58:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 21 Jun 2023 13:58:55 -0000
Message-ID: <168735593579.7799.7660716275165997710@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230621135541.151035-1-jani.nikula@intel.com>
In-Reply-To: <20230621135541.151035-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/i915/irq=3A_split_out_display_?=
 =?utf-8?q?irq_handling?=
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

Series: series starting with [1/2] drm/i915/irq: split out display irq handling
URL   : https://patchwork.freedesktop.org/series/119683/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 655996fd035e1baa68b6636a26eecc7fea083046
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jun 21 16:55:41 2023 +0300

    drm/i915: fix intel_display_irq.c include order
    
    I meant to sort the includes before submitting commit 2b874a027810
    ("drm/i915/irq: split out display irq handling") but forgot, and it
    wasn't noticed in review either. Sort the includes.
    
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230516122926.2720581-1-jani.nikula@intel.com
    (cherry picked from commit d705a8c73acbe523cb602228d411a73f288bf34c)
+ /mt/dim checkpatch f0727faae3ac98601f3f4299a967f26542b3e482 drm-intel
e901db458 drm/i915/irq: split out display irq handling
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:72: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#72: 
new file mode 100644

-:201: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#201: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:125:
+		intel_uncore_write(&dev_priv->uncore, GEN8_DE_PIPE_IMR(pipe), dev_priv->de_irq_mask[pipe]);

-:448: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#448: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:372:
+				     intel_uncore_read(&dev_priv->uncore, PIPE_CRC_RES_5_IVB(pipe)));

-:1262: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#1262: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1186:
+		intel_uncore_write(&dev_priv->uncore, SCPD0, _MASKED_BIT_ENABLE(CSTATE_RENDER_CLOCK_GATE_DISABLE));

-:1370: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#1370: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1294:
+		intel_uncore_write(&dev_priv->uncore, SCPD0, _MASKED_BIT_DISABLE(CSTATE_RENDER_CLOCK_GATE_DISABLE));

-:1826: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#1826: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:76:
+void i915_pipestat_irq_handler(struct drm_i915_private *i915, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);

-:1827: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#1827: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:77:
+void i965_pipestat_irq_handler(struct drm_i915_private *i915, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);

-:1829: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#1829: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:79:
+void i8xx_pipestat_irq_handler(struct drm_i915_private *i915, u16 iir, u32 pipe_stats[I915_MAX_PIPES]);

total: 0 errors, 8 warnings, 0 checks, 3675 lines checked
655996fd0 drm/i915: fix intel_display_irq.c include order
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '2b874a027810', maybe rebased or not pulled?
#6: 
I meant to sort the includes before submitting commit 2b874a027810

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


