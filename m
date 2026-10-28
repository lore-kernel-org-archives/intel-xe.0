Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D4606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645AA10E574;
	Wed, 28 Oct 2026 07:20:37 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302310E557;
 Wed, 28 Oct 2026 07:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Limit?=
 =?utf-8?q?_scaler_count_and_disable_pipe_joiner_on_WCL_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 07:20:37 -0000
Message-ID: <179317203719.80182.10090919301789404810@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
In-Reply-To: <20261007072334.1801956-1-vidya.srinivas@intel.com>
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

Series: drm/i915/display: Limit scaler count and disable pipe joiner on WCL (rev4)
URL   : https://patchwork.freedesktop.org/series/175647/
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
commit 31114348036301bacf8853d9e1aad4b6fd882d22
Author: Vidya Srinivas <vidya.srinivas@intel.com>
Date:   Wed Oct 28 12:34:04 2026 +0530

    drm/i915/display: Disable pipe joiner on WCL
    
    Pipe joining is not supported in the WCL display configuration.
    Report no joiner support on WCL so that modes which would require
    joining are rejected, matching the 4k 60Hz maximum resolution
    documented for the platform.
    
    v2: Rebase onto latest upstream
    v3: Fix up the commit message
    v4: Split the scaler and joiner changes into separate patches (Jani)
    
    Bspec: 74286
    Cc: stable@vger.kernel.org
    Suggested-by: Charlton Lin <charlton.lin@intel.com>
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
+ /mt/dim checkpatch 6a182ac542350dbca9147134654c35e463aa1382 drm-intel
0f5afdb1db33 drm/i915/display: Single scaler per pipe on WCL
-:34: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
311143480363 drm/i915/display: Disable pipe joiner on WCL
-:36: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


