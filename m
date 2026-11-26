Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F5606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B0A10EA03;
	Thu, 26 Nov 2026 17:57:10 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D1D10E624;
 Thu, 26 Nov 2026 17:57:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/de=3A_Convert_mm?=
 =?utf-8?q?io=2Elock_to_raw_spinlock_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 17:57:10 -0000
Message-ID: <179571583007.94780.14613375953001496951@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/de: Convert mmio.lock to raw spinlock (rev2)
URL   : https://patchwork.freedesktop.org/series/179652/
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
commit fe40101683e691726f769f5b45d7dfe14a452c52
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Nov 26 15:22:44 2026 +0200

    drm/i915/de: Convert mmio.lock to raw spinlock
    
    On PREEMPT_RT normal spinlocks turn into sleeping mutexes.
    We want to be able to read registers inside tracepoints
    (which still aren't allowed to sleep on PREEMPT_RT), so
    convert our mmio.lock into a raw spinlock.
    
    The display specific mmio.lock (unlike the old device
    wide uncore.lock) is not held across forcewake waits and
    whatnot, so the lock hold times should be very short.
    Thus a raw spinlock is a good fit here.
    
    v2: Disable irqs also in intel_crtc_update_active_timings() on PREEMPT_RT (sashiko)
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch a103afa433c7d096adffb314a43cfa3d18277bbd drm-intel
fe40101683e6 drm/i915/de: Convert mmio.lock to raw spinlock
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
v2: Disable irqs also in intel_crtc_update_active_timings() on PREEMPT_RT (sashiko)

total: 0 errors, 1 warnings, 0 checks, 100 lines checked


