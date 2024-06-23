Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286D1C27C4F
	for <intel-xe@archiver.kernel.org>; Sun, 23 Jun 2024 20:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D692610E31E;
	Sun, 23 Jun 2024 20:36:05 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F58C10E31E;
 Sun, 23 Jun 2024 20:36:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Fix_kernel_d?=
 =?utf-8?q?oc_warnings_in_xe=5Fdrm=2Eh_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 23 Jun 2024 20:36:05 -0000
Message-ID: <171917496532.135456.13474211799516806298@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Fix kernel doc warnings in xe_drm.h (rev3)
URL   : https://patchwork.freedesktop.org/series/135225/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 74af5176a57e3f86c970bdf6a6794c104987fdcd
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Sun Jun 23 13:31:19 2024 -0700

    drm/xe/oa: Fix kernel doc warnings in xe_drm.h
    
    Fix kernel doc warnings in xe_drm.h. Also eliminate private/non-abi enum
    definitions.
    
    v2: Remove __DRM_XE_PERF_TYPE_MAX since it is unused (Michal)
    v3: Also remove DRM_XE_OA_PROPERTY_MAX since it can also be eliminated (Michal)
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 7fb9ba849242ce027e5233b8e37dad14588d58bd drm-intel
74af5176a57e drm/xe/oa: Fix kernel doc warnings in xe_drm.h
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
v3: Also remove DRM_XE_OA_PROPERTY_MAX since it can also be eliminated (Michal)

total: 0 errors, 1 warnings, 0 checks, 33 lines checked


