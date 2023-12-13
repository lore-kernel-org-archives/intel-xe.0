Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347F7C4167D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 16:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0808410E7B4;
	Wed, 13 Dec 2023 16:12:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3147C10E7B4;
 Wed, 13 Dec 2023 16:12:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2DA70AADF2;
 Wed, 13 Dec 2023 16:12:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MAINTAINERS=3A_Updates_to?=
 =?utf-8?q?_Intel_DRM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 13 Dec 2023 16:12:31 -0000
Message-ID: <170248395118.10264.14109416644218043511@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213160915.1414733-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231213160915.1414733-1-rodrigo.vivi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: MAINTAINERS: Updates to Intel DRM
URL   : https://patchwork.freedesktop.org/series/127755/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fc1cf702957347179683eb6ef473bfbd3a5c9d10
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Dec 13 11:09:15 2023 -0500

    MAINTAINERS: Updates to Intel DRM
    
    Introduce the Maintainers of the new drm/xe driver for upcoming
    Intel GPUs.
    
    Since it has a shared display with drm/i915, let's also create a
    dedicated block to group display related files. But without any
    substantial change to the i915 side. The display patches will
    continue to flow through i915 from drm-intel-next branches for now.
    
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Oded Gabbay <ogabbay@kernel.org>
    Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 5cd1893366708380854f4694ae57417192458a6b drm-intel
fc1cf7029 MAINTAINERS: Updates to Intel DRM
-:42: WARNING:MAINTAINERS_STYLE: Misordered MAINTAINERS entry - list file patterns in alphabetic order
#42: FILE: MAINTAINERS:10491:
+F:	drivers/gpu/drm/xe/display/
+F:	drivers/gpu/drm/xe/compat-i915-headers

total: 0 errors, 1 warnings, 0 checks, 41 lines checked


