Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE87DCA0FF7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A386910E91B;
	Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmPcH9C/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7B10E91A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756334166; x=1787870166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0Ktm4T+y1v8QWg4DB50Uzc6wwSezfPFJ7Se8kQdZeM=;
 b=VmPcH9C/Man9EQv0QPYdnA4pxJu8A0/sqU73Z2Ugw6m3r4by29WepJyZ
 2F5r1+nwQplCbAIDnRmZqyhF2LUApaeKlaZWnYfK7mYtGgJl+PtNZiP0+
 DVlXnJn4O16DImnrn1sr1nwILoWrzVL0nA+7pqNpTt2Y2o0+3+U6bpmP7
 Vt0K0XarYCY1CfOCyBKphIVYg65NlIPaha/Ksc3z2khBj72UzwUpcbQEz
 QsDSyG8fuDgRyUzEnb8aw82vm9PNz48NuAv0hWWdBwsSZ+Qww8HwMIKyr
 nk553Rj+dGG6oDBnp9XwZdX0CCxoVVCEcRyOk9HtEqgQLEY748o8ycDR3 A==;
X-CSE-ConnectionGUID: eGrNgaW5QHC84Mb6iUN7XA==
X-CSE-MsgGUID: 42oqyxuDQtGIQc5ZjXizqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69308120"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69308120"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:05 -0700
X-CSE-ConnectionGUID: +rtbHYVZQemtVOD7+orXSA==
X-CSE-MsgGUID: BQJnxF6hRpudIQnd9/pM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170117867"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2 3/6] drm/xe: Update workaround documentation
Date: Wed, 27 Aug 2025 15:35:28 -0700
Message-ID: <20250827-wa-bb-cmds-v2-3-3cdf4d63c72a@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Bring it up to reality, better documenting the existing batch buffers,
OOB rules and fixing some typos.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 52c7df4c3afd8..a19cf811b580a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -39,7 +39,8 @@
  *   Register Immediate commands) once when initializing the device and saved in
  *   the default context. That default context is then used on every context
  *   creation to have a "primed golden context", i.e. a context image that
- *   already contains the changes needed to all the registers.
+ *   already contains the changes needed to all the registers. See
+ *   drivers/gpu/drm/xe/xe_lrc.c for default context handling.
  *
  * - Engine workarounds: the list of these WAs is applied whenever the specific
  *   engine is reset. It's also possible that a set of engine classes share a
@@ -48,10 +49,10 @@
  *   them need to keeep the workaround programming: the approach taken in the
  *   driver is to tie those workarounds to the first compute/render engine that
  *   is registered.  When executing with GuC submission, engine resets are
- *   outside of kernel driver control, hence the list of registers involved in
+ *   outside of kernel driver control, hence the list of registers involved is
  *   written once, on engine initialization, and then passed to GuC, that
  *   saves/restores their values before/after the reset takes place. See
- *   ``drivers/gpu/drm/xe/xe_guc_ads.c`` for reference.
+ *   drivers/gpu/drm/xe/xe_guc_ads.c for reference.
  *
  * - GT workarounds: the list of these WAs is applied whenever these registers
  *   revert to their default values: on GPU reset, suspend/resume [1]_, etc.
@@ -66,21 +67,39 @@
  *   hardware on every HW context restore. These buffers are created and
  *   programmed in the default context so the hardware always go through those
  *   programming sequences when switching contexts. The support for workaround
- *   batchbuffers is enabled these hardware mechanisms:
+ *   batchbuffers is enabled via these hardware mechanisms:
  *
- *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in the default
- *      context, pointing the hardware to jump to that location when that offset
- *      is reached in the context restore. Workaround batchbuffer in the driver
- *      currently uses this mechanism for all platforms.
+ *   #. INDIRECT_CTX (also known as **mid context restore bb**): A batchbuffer
+ *      and an offset are provided in the default context, pointing the hardware
+ *      to jump to that location when that offset is reached in the context
+ *      restore.  When a context is being restored, this is executed after the
+ *      ring context, in the middle (or beginning) of the engine context image.
  *
- *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default context,
- *      pointing the hardware to a buffer to continue executing after the
- *      engine registers are restored in a context restore sequence. This is
- *      currently not used in the driver.
+ *   #. BB_PER_CTX_PTR (also known as **post context restore bb**): A
+ *      batchbuffer is provided in the default context, pointing the hardware to
+ *      a buffer to continue executing after the engine registers are restored
+ *      in a context restore sequence.
+ *
+ *   Below is the timeline for a context restore sequence:
+ *
+ *   .. code::
+ *
+ *                        INDIRECT_CTX_OFFSET
+ *                   |----------->|
+ *      .------------.------------.-------------.------------.--------------.-----------.
+ *      |Ring        | Engine     | Mid-context | Engine     | Post-context | Ring      |
+ *      |Restore     | Restore (1)| BB Restore  | Restore (2)| BB Restore   | Execution |
+ *      `------------'------------'-------------'------------'--------------'-----------'
  *
  * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
  *   a central place. Those are peppered around the rest of the code, as needed.
- *   Workarounds related to the display IP are the main example.
+ *   There's a central place to control which workarounds are enabled:
+ *   drivers/gpu/drm/xe/xe_wa_oob.rules for GT workarounds and
+ *   drivers/gpu/drm/xe/xe_device_wa_oob.rules for device/SoC workarounds.
+ *   These files only record which workarounds are enabled: during early device
+ *   initialization those rules are evaluated and recorded by the driver. Then
+ *   later the driver checks with ``XE_WA()`` and ``XE_DEVICE_WA()`` to
+ *   implement them.
  *
  * .. [1] Technically, some registers are powercontext saved & restored, so they
  *    survive a suspend/resume. In practice, writing them again is not too

-- 
2.50.1

