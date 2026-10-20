Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19958606A327
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 16:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76C10E796;
	Tue, 20 Oct 2026 16:55:55 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8F210E796;
 Tue, 20 Oct 2026 16:55:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_reduc?=
 =?utf-8?q?e_clock=5Fgating_interface_between_core_and_display_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 16:55:54 -0000
Message-ID: <179251535496.47641.8348272431061297108@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020090723.803321-1-luciano.coelho@intel.com>
In-Reply-To: <20261020090723.803321-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: reduce clock_gating interface between core and display (rev4)
URL   : https://patchwork.freedesktop.org/series/172330/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2844a00a1801e21925193c068546ef548e33511e
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Tue Oct 20 12:05:50 2026 +0300

    drm/i915/display: separate display and core clock gating
    
    We still call intel_clock_gating_init() from display when leaving
    PC8+ and after a GPU reset.  The core clock gating code then calls
    back into display, so we have dependencies in both directions.
    
    Move display and PCH clock gating into the display code and restore
    the HSW/BDW GT and uncore workarounds from the device-level resume
    paths instead.  Core clock gating is also handled separately when a
    GPU reset affects display.
    
    Display doesn't need the core interface anymore, so build its clock
    gating implementation for Xe and remove the compatibility header.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 4c323e0bf0cb001e147699e8a4dd21f112fba63e drm-intel
7a0d81c18be1 drm/i915/display: move the SNB FBC workaround comment
2844a00a1801 drm/i915/display: separate display and core clock gating
-:479: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#479: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 379 lines checked


