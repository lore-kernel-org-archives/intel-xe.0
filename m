Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7DDC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 07:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7E110E67E;
	Wed, 25 Jun 2025 07:24:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245610E67B;
 Wed, 25 Jun 2025 07:24:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_missing_XeLP_workaro?=
 =?utf-8?q?unds_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 07:24:12 -0000
Message-ID: <175083625272.107035.18400286297629904289@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
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

Series: More missing XeLP workarounds (rev5)
URL   : https://patchwork.freedesktop.org/series/149097/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 255f1d8609207a990c801a6bc1e010412e6aa7cb
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Jun 13 16:35:58 2025 +0100

    drm/xe/xelp: Add Wa_18022495364
    
    Add Wa_18022495364 as a context workaround batch buffer workaround.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch bd57aee20daefb7b0dfe9017663668c92115ff19 drm-intel
e2169d3c924c drm/xe: Consolidate LRC offset calculations
-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost <matthew.brost@intel.com'
#16: 
Cc: Matthew Brost <matthew.brost@intel.com

total: 1 errors, 0 warnings, 0 checks, 119 lines checked
721459f08f4e drm/xe: Generalize wa bb emission code
24403b269eb0 drm/xe: Return number of written dwords from workaround batch buffer emission
0484ae38f464 drm/xe: Allow specifying number of extra dwords at the end of wa bb emission
e058941714f8 drm/xe: Add plumbing for indirect context workarounds
3b564d0ae34c drm/xe/xelp: Implement Wa_16010904313
255f1d860920 drm/xe/xelp: Add Wa_18022495364


