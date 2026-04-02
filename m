Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD92D6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970B10F6F7;
	Thu,  2 Apr 2026 22:54:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80B510F6FB;
 Thu,  2 Apr 2026 22:54:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Recommend_G?=
 =?utf-8?q?uC_v70=2E60=2E0_for_LNL=2C_BMG=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Apr 2026 22:54:01 -0000
Message-ID: <177517044173.430198.2875399469686386267@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402224819.405728-9-julia.filipchuk@intel.com>
In-Reply-To: <20260402224819.405728-9-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG, PTL
URL   : https://patchwork.freedesktop.org/series/164323/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 75dbc583f22ebc6a476065271a03e537edd36f28
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Thu Apr 2 15:47:51 2026 -0700

    Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
    
    This reverts commit 902df612ef7225e8c34b72aa60e51cbaeb8739f3.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 76f07a8a9c761686987cba92056f78c1d3cd1c62 drm-intel
0e1f1fbd60dc Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
153ae49f91ae Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
106e60c934f5 Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
ff80876a72c5 drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
ef215b7dbc90 Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f93a9f056f3dbc847dc365ae12533c7654e21847', maybe rebased or not pulled?
#6: 
This reverts commit f93a9f056f3dbc847dc365ae12533c7654e21847.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
72dcce3d6ccf Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'cf4ab5b23116b6e7d407cda379f8e06bfe5df323', maybe rebased or not pulled?
#7: 
This reverts commit cf4ab5b23116b6e7d407cda379f8e06bfe5df323.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
75dbc583f22e Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '902df612ef7225e8c34b72aa60e51cbaeb8739f3', maybe rebased or not pulled?
#6: 
This reverts commit 902df612ef7225e8c34b72aa60e51cbaeb8739f3.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


