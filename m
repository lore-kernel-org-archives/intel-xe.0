Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE3606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 13:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E2B10E4D6;
	Tue,  3 Nov 2026 13:20:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A3E10E4D6;
 Tue,  3 Nov 2026 13:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_MI=5FSEMAPH?=
 =?utf-8?q?ORE=5FWAIT=5F64_=28Wa=5F16029281913=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 13:20:12 -0000
Message-ID: <179371201273.110803.3437057382665491302@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
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

Series: drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913) (rev2)
URL   : https://patchwork.freedesktop.org/series/177436/
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
commit 704a1c3952311da4e227d1b9d4f5aadf425eea3f
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Date:   Tue Nov 3 18:07:27 2026 +0530

    drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported
    
    Use the MI_SEMAPHORE_WAIT_64 instruction in emit_ulls_postamble() on
    platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913),
    falling back to the existing 32-bit MI_SEMAPHORE_WAIT path otherwise. Bump
    ULLS_JOB_SIZE_DW from 48 to 50 since the 64-bit postamble is 2 dwords
    wider and the fixed-size ULLS job slot has no headroom to spare in the
    worst case (SRIOV VF).
    
    Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
    Assisted-by: LLM
+ /mt/dim checkpatch a3c3ff69be4e55d4f8f3d93789381ebb23684b17 drm-intel
9f781f2bca7b drm/xe: Add has_sem64 bit for MI_SEMAPHORE_WAIT_64 support
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: LLM

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#17: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 94 lines checked
8f42ffe63c24 drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 30 lines checked
704a1c395231 drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: LLM

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#15: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 52 lines checked


