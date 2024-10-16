Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0BD1AD50
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B0E10E6BA;
	Wed, 16 Oct 2024 12:43:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5910E6BA;
 Wed, 16 Oct 2024 12:43:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_functions_to_sa?=
 =?utf-8?q?ve_and_restore_VF_LMEM_and_CCS_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 12:43:16 -0000
Message-ID: <172908259616.1273835.17806738516234607111@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
In-Reply-To: <20241016095745.7477-1-lukasz.laguna@intel.com>
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

Series: PF: Add functions to save and restore VF LMEM and CCS data
URL   : https://patchwork.freedesktop.org/series/140050/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d0c5b77e93172d98064765929d5942168b2f923
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Wed Oct 16 11:57:45 2024 +0200

    drm/xe/pf: Add functions to save and restore VF LMEM and CCS data
    
    State of VF LMEM and corresponding CCS metadata needs to be saved and
    restored during migration of VM with attached dGPU VF. Add helpers that
    allow it. We will start using them in upcoming patches.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com
+ /mt/dim checkpatch 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 drm-intel
ac7fed655423 drm/xe/migrate: Add function for raw copy of VRAM and CCS
19b772bf306f drm/xe/bo: Add trylock helper for buffer objects
9d0c5b77e931 drm/xe/pf: Add functions to save and restore VF LMEM and CCS data
-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Lukasz Laguna <lukasz.laguna@intel.com'
#11: 
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com

-:153: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Lukasz Laguna <lukasz.laguna@intel.com>'

total: 2 errors, 0 warnings, 0 checks, 130 lines checked


