Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6035606A328
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3694310E3EF;
	Fri,  6 Nov 2026 07:27:07 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ACC10E3EF;
 Fri,  6 Nov 2026 07:27:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_non-fatal_errors_r?=
 =?utf-8?q?outed_via_IRQ_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 07:27:05 -0000
Message-ID: <179395002540.130482.599456041713835914@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106071944.2693854-10-riana.tauro@intel.com>
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
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

Series: Handle non-fatal errors routed via IRQ (rev4)
URL   : https://patchwork.freedesktop.org/series/173001/
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
commit 52c84590cc44ccd28237bd035d19dab14d63c434
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Nov 6 12:49:53 2026 +0530

    drm/xe/xe_ras: Skip double-bit ECC page offlining on AER path
    
    Device fatal errors trigger AER, which can race with non-fatal
    double-bit ECC errors reported via IRQ. If the AER PCI error handler
    runs first, it receives all errors as a single response from the
    system controller firmware, which can include the double-bit ECC errors.
    
    Handling these on the AER path leads to unnecessary page offlining,
    since an SBR clears the offlined pages on reload and firmware drops them
    from its queue once read. Skip double-bit ECC handling when on the AER
    path to avoid this.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
    Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch a3e19d73c21539b24a45ced208247913ae622bab drm-intel
c2e0ea6f8b8b drm/xe/hw_error: Reuse CSC worker for generic error handling
7cda931b8507 drm/xe/hw_error: Initialize hw_error_work per tile
fb1128d80424 drm/xe/survivability: Guard runtime survivability enable against unbind
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
the device is being removed. This is incorrect, as runtime survivability mode

total: 0 errors, 1 warnings, 0 checks, 34 lines checked
81308e4553a1 drm/xe/ras: Treat non-fatal PCIe errors as recovered
4544f080663a drm/xe/pci: Add upstream switch port lookup helper
d210bc9e4a07 drm/xe/xe_ras: Add a flag for uncorrectable internal error
2c9ae91ae583 drm/xe: Add support for wa_14028434957
52c84590cc44 drm/xe/xe_ras: Skip double-bit ECC page offlining on AER path


