Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC21606A32F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ED610ED58;
	Mon,  2 Nov 2026 12:03:08 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD6F10ED58;
 Mon,  2 Nov 2026 12:03:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_MI=5FSEMAPH?=
 =?utf-8?q?ORE=5FWAIT=5F64_=28Wa=5F16029281913=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 12:03:07 -0000
Message-ID: <179362098796.102461.13154893722235525523@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102100018.2209034-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261102100018.2209034-1-tilak.tirumalesh.tangudu@intel.com>
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

Series: drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
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
commit c1ada4cd41c59eb9b07ab8952af78469681fb166
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Date:   Mon Nov 2 15:30:18 2026 +0530

    drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported
    
    Use the MI_SEMAPHORE_WAIT_64 instruction in emit_ulls_postamble() on
    platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913),
    falling back to the existing 32-bit MI_SEMAPHORE_WAIT path otherwise. Bump
    ULLS_JOB_SIZE_DW from 48 to 50 since the 64-bit postamble is 2 dwords
    wider and the fixed-size ULLS job slot has no headroom to spare in the
    worst case (SRIOV VF).
    
    Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
    Assisted-by: LLM
+ /mt/dim checkpatch 2738102dee943bff3e5976aef7fc1937fc650f6e drm-intel
2fbd06afadbb drm/xe: Add has_sem64 bit for MI_SEMAPHORE_WAIT_64 support
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: LLM

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#17: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 100 lines checked
2b339b468772 drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 29 lines checked
c1ada4cd41c5 drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: LLM

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#15: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 50 lines checked


