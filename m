Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170B606A320
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 14:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8A10E05B;
	Wed, 28 Oct 2026 14:56:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1D610E0E5;
 Wed, 28 Oct 2026 14:56:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?b?4pyXIENJLmNoZWNrcGF0Y2g6IHdhcm5pbmcgZm9yIGRybS9pOTE1OiBEb24ndCB1?=
 =?utf-8?b?c2UgaW50ZWxfZGVfe3JlYWQsIHdyaXRlfV9mdygpIGluIGJkd191cGRhdGVfe3Bp?=
 =?utf-8?b?cGUsIHBvcnR9X2lycSgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 14:56:49 -0000
Message-ID: <179319940950.82594.2701480339873644785@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Don't use intel_de_{read, write}_fw() in bdw_update_{pipe, port}_irq()
URL   : https://patchwork.freedesktop.org/series/177041/
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
commit 5f0ba81ea9cd61ac226fff9efa4d81eb265f1532
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Oct 28 16:50:35 2026 +0200

    drm/i915: Don't use intel_de_{read, write}_fw() in bdw_update_{pipe, port}_irq()
    
    bdw_update_{pipe,port}_irq() can be called from anywhere, so the device
    might be in DC5/6 at the time, which means we need to grab the
    wakelock to guarantee access to the registers on LNL+.
    
    Revert the earlier change to these functions to use
    intel_de_{read,write}_fw() and go back to the full
    ntel_de_{read,write}() which take the wakelock for us.
    
    Fixes: d50b061acc3b ("drm/i915: Use intel_de_{read,write}_fw() in BDW+ irq handlers")
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 0d32e2091823e7b42f62f61fd36cb06943a2a682 drm-intel
5f0ba81ea9cd drm/i915: Don't use intel_de_{read, write}_fw() in bdw_update_{pipe, port}_irq()
-:50: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:247:
+		intel_de_write(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


