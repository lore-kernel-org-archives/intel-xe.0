Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7226C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 21:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1C810EAC8;
	Fri, 11 Jul 2025 21:54:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2CE10EAC8;
 Fri, 11 Jul 2025 21:54:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_missing_ker?=
 =?utf-8?q?nel-doc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Jul 2025 21:54:52 -0000
Message-ID: <175227089264.156139.11913932680728849923@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250711214911.2009714-2-lucas.demarchi@intel.com>
In-Reply-To: <20250711214911.2009714-2-lucas.demarchi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix missing kernel-doc
URL   : https://patchwork.freedesktop.org/series/151519/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aee9361629da422274dc9339d9e789ff7cdd7856
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jul 11 14:49:12 2025 -0700

    drm/xe: Fix missing kernel-doc
    
    Fix warning:
    
            Warning: drivers/gpu/drm/xe/xe_device_types.h:658 struct member 'wa_active' not described in 'xe_device'
    
    Fixes: 661a6950e061 ("drm/xe: Add infrastructure for Device OOB workarounds")
    Cc: Matt Atwood <matthew.s.atwood@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 453e24ac0fd683880e40b3a844a774f5a427dc55 drm-intel
aee9361629da drm/xe: Fix missing kernel-doc
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
	Warning: drivers/gpu/drm/xe/xe_device_types.h:658 struct member 'wa_active' not described in 'xe_device'

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


