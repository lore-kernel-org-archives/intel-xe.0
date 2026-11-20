Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F148606A6E8
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 19:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C6110E252;
	Fri, 20 Nov 2026 19:23:13 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E5310E252;
 Fri, 20 Nov 2026 19:23:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Handle_GuC_sema?=
 =?utf-8?q?phore_instruction_field_check_error_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesus Narvaez" <jesus.narvaez@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 19:23:11 -0000
Message-ID: <179520259195.61886.1413628095299742616@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120191111.4097737-4-jesus.narvaez@intel.com>
In-Reply-To: <20261120191111.4097737-4-jesus.narvaez@intel.com>
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

Series: drm/xe: Handle GuC semaphore instruction field check error (rev2)
URL   : https://patchwork.freedesktop.org/series/178748/
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
commit 0c34914a25d140a00050ae334eaa03dcab143530
Author: Jesus Narvaez <jesus.narvaez@intel.com>
Date:   Fri Nov 20 21:11:14 2026 +0200

    drm/xe/guc: Handle GuC semaphore instruction field check error
    
    On platforms that support 64 bit semaphores with the has_sem64 flag, opt
    in to have the GuC check the SW Token Info field of the semaphore
    instruction.
    
    The 64 bit semaphore instruction has a SW Token Info field that is not
    used by HW for execution and is instead passed to the CSB, which is
    consumed by the GuC. If the GuC detects an unsupported value in this
    field, it sends a G2H message back indicating the failure. Therefore,
    add a handler for the context that the GuC has marked as unrunnable.
    
    Rejecting unsupported values now means that if the values start being
    used later on (e.g. to send hints about the semaphore to the GuC), there
    is no risk of a userspace regression due to the change in behavior.
    
    v2:
    - Updated commit message to explain why GuC checks the instruction field
      (Daniele)
    - Use "instruction field" in comments, but kept KLV name to match GuC
      specs (Daniele)
    - Removed LRCA variable and print out in handler (Daniele)
    
    v3:
    - Updated commit message and KLV documentation to clarify which field
      the GuC is checking (Daniele)
    
    v4:
    - Switch to using has_sem64 GT flag to opt in to KLV instead of a
      platform check and update commit message and comment to match.
    
    Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 90b50d97b3af2f55a75116f1ec76e0cf62914418 drm-intel
2a99b3d1e7ab drm/xe: Add has_sem64 bit to graphics/media IP descriptors
-:21: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#21: 
Assisted-by: LLM

-:21: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#21: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 89 lines checked
0c34914a25d1 drm/xe/guc: Handle GuC semaphore instruction field check error


