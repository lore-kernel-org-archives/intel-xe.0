Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E0606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 09:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ED610F70C;
	Wed, 18 Nov 2026 09:47:06 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC4F10F701;
 Wed, 18 Nov 2026 09:47:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Reset_GuC_b?=
 =?utf-8?q?efore_unmapping_its_post-hwconfig_buffers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 09:47:05 -0000
Message-ID: <179499522544.42041.14389907059863394877@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
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

Series: drm/xe/guc: Reset GuC before unmapping its post-hwconfig buffers (rev2)
URL   : https://patchwork.freedesktop.org/series/176370/
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
commit 4aa8214e96c7e2d2e8bf2bb3bb29e5e287eb1c97
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Mon Oct 19 15:34:48 2026 +0530

    drm/xe/guc: Reset GuC before unmapping its post-hwconfig buffers
    
    guc_fini_hw() resets the GuC on teardown, but it is registered before
    xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
    devm actions run in reverse order, these buffers get unmapped from the
    GGTT while the GuC is still running and may still access them. When
    unmapped GGTT entries are left invalid, this results in a GuC page
    fault on unbind or probe failure.
    
    Re-register guc_fini_hw() after all the GuC buffer allocations, so the
    GuC is reset before any of them is unmapped. Keep GuC submit and RC
    teardown running before the reset, as they still need to stop or talk
    to the GuC.
    
    Assisted-by: LLM
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch a1c57b52cc8428749bd03cefa1f1a1e69963007a drm-intel
4aa8214e96c7 drm/xe/guc: Reset GuC before unmapping its post-hwconfig buffers
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: LLM

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#19: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 59 lines checked


