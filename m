Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD5606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7A61121D5;
	Thu, 26 Nov 2026 09:33:17 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3BC10E954;
 Thu, 26 Nov 2026 09:33:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_MI=5FSEMAPH?=
 =?utf-8?q?ORE=5FWAIT=5F64_=28Wa=5F16029281913=29_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 09:33:15 -0000
Message-ID: <179568559591.91272.7178705092985376066@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
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

Series: drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913) (rev5)
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
commit c01e7a7cad7f2ff5a8ac49d503b2bd07dd918403
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Date:   Thu Nov 26 14:34:45 2026 +0530

    drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
    
    Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
    platforms whose GT supports it, per gt->info.has_sem64. Platforms
    without support keep using the existing 32-bit MI_SEMAPHORE_WAIT path.
    
    v2: Drop the WA comment, document the zero upper SDD dword (Satya)
    
    Assisted-by: LLM
    Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
    Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch 3895433515d2f602b53c660afbcd2179f0326e1e drm-intel
40f625560733 drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction definition
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
c01e7a7cad7f drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 29 lines checked


