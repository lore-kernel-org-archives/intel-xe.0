Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC5FC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 03:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA5E10E1E5;
	Thu,  3 Apr 2025 03:47:57 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAD410E1E5;
 Thu,  3 Apr 2025 03:47:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_the_missed_?=
 =?utf-8?q?value_paramter_of_LE=5FCOS_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 03:47:56 -0000
Message-ID: <174365207656.30790.8109876601326911916@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
In-Reply-To: <20250401205703.4179906-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Add the missed value paramter of LE_COS (rev3)
URL   : https://patchwork.freedesktop.org/series/147087/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a6e41ae3ad8141ad817dd7597fa2357f84d707f
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Apr 3 03:42:01 2025 +0000

    drm/xe: remove unused LE_COS
    
    value is missed for LE_COS.
    The value for this field is universally "0" for every MOCS entry on
    the old Xe_LP platforms, and the whole field has been removed from
    Xe_HP onward. Just delete the line so that we don't have an unused
    definition.
    
    Suggested-by:: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 8f917568adaeea8b649e337e7d0e03bd03332253 drm-intel
2a6e41ae3ad8 drm/xe: remove unused LE_COS
-:12: WARNING:BAD_SIGN_OFF: Use a single space after Suggested-by:
#12: 
Suggested-by:: Matt Roper <matthew.d.roper@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


