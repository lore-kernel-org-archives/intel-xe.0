Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42296C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 20:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A7110E2DD;
	Tue, 14 Jul 2026 20:36:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B7210E2DD;
 Tue, 14 Jul 2026 20:36:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Recommend_G?=
 =?utf-8?q?uC_v70=2E65=2E0_for_LNL=2C_BMG=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 20:36:00 -0000
Message-ID: <178406136002.190128.4238503287047107790@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714203012.855004-7-julia.filipchuk@intel.com>
In-Reply-To: <20260714203012.855004-7-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Recommend GuC v70.65.0 for LNL, BMG, PTL
URL   : https://patchwork.freedesktop.org/series/170438/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0e5da5be64364b55da04554763207c7aa76dcf0a
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Jul 14 13:30:01 2026 -0700

    topic/xe-for-CI: Define GuC firmware for NVL-P
    
    Novalake P has different IP on each GT and requires a different GuC
    for each. So add separate graphics and media GT entries or NVL-P.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7235
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Link: https://patch.msgid.link/20260202-nvl-p-upstreaming-v1-16-653e4ff105dc@intel.com
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Link: https://patch.msgid.link/20260529193558.185436-14-daniele.ceraolospurio@intel.com
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Link: https://patch.msgid.link/20260618222536.3351750-14-julia.filipchuk@intel.com
    Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 9cf91140eff27765d402aedeea89505d52db121e drm-intel
b119aad1f3a3 Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
050fe15942cd Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
dd2cb19b57de drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
e728450a8f8e topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
-:21: WARNING:BAD_SIGN_OFF: Duplicate signature
#21: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
0e5da5be6436 topic/xe-for-CI: Define GuC firmware for NVL-P
-:22: WARNING:BAD_SIGN_OFF: Duplicate signature
#22: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


