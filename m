Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF4C606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E9310E2FE;
	Fri,  6 Nov 2026 22:40:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0B010E2FE;
 Fri,  6 Nov 2026 22:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_add_wedged=5Fmo?=
 =?utf-8?q?de=3D3_fault_inspection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 22:40:39 -0000
Message-ID: <179400483930.134852.17550602709602594729@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106221323.1207676-1-daniel.charles@intel.com>
In-Reply-To: <20261106221323.1207676-1-daniel.charles@intel.com>
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

Series: drm/xe: add wedged_mode=3 fault inspection
URL   : https://patchwork.freedesktop.org/series/178025/
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
commit 4af296ad8cdb8f15cbee881b954d5ae5c2d758d7
Author: Daniel Charles <daniel.charles@intel.com>
Date:   Fri Nov 6 14:13:23 2026 -0800

    drm/xe/wedge: request inspection for additional fault paths
    
    Request mode-3 inspection for unsuccessful pagefault service, GuC memory
    CAT errors, and TLB invalidation fence timeouts. Keep the resume-failure
    fallback with the TLB timeout trigger so a failed inspection resume
    restores normal timeout handling and completes expired fences with -ETIME.
    Preserve the existing TLB timeout diagnostics outside inspection.
    
    Defer timeout processing for a pending pause only while the inspection
    request remains pending and resume has not failed. If inspection exits
    before taking over the pause, clear stale pause flags and resume normal
    timeout handling rather than rearming indefinitely. Preserve indefinite
    deferral once inspection has taken over.
    
    For MMIO-enabled RAS reset requests, request or join inspection and wait
    before preparing PCI reset or disabling the device. Reuse the framework's
    one-shot GT-stop state to decline this device's reset request after SKIP
    or CONTINUE. Fall back to normal recovery if inspection aborts before
    stopping GTs, except during teardown. Release mode_mutex before waiting
    so teardown can abort inspection.
    
    Keep the existing separation between synchronous inspection-only GT
    stopping and asynchronous ordinary GT wedging, including the PCI reset
    path's worker flushes. Leave frozen-channel recovery and other wedge
    modes unchanged.
    
    Inspection can stall shared PCI recovery indefinitely and cannot prevent
    resets forced by the PCI core or requested by other devices. The timeout
    cleanup does not make CONTINUE safe after an intervening reset or prevent
    reset/resume during inspection. Reference the SKIP and CONTINUE reply
    constants in the debugfs documentation.
    
    Assisted-by: LLM
    Signed-off-by: Daniel Charles <daniel.charles@intel.com>
+ /mt/dim checkpatch e1eab8c2bb59cc2cca357fd48d3a4e6ac6f39123 drm-intel
2654313ede3a drm/xe/wedge: add fault inspection with debugfs release
709ad9c7820c drm/xe/wedge: preserve pending TLB invalidations during inspection
-:23: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#23: 
Assisted-by: LLM

-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#23: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 144 lines checked
4af296ad8cdb drm/xe/wedge: request inspection for additional fault paths
-:36: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#36: 
Assisted-by: LLM

-:36: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#36: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 217 lines checked


