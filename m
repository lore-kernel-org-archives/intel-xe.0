Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A454FC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 08:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462310E1F8;
	Thu,  3 Apr 2025 08:27:44 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5702710E20A;
 Thu,  3 Apr 2025 08:27:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_the_missed_?=
 =?utf-8?q?value_paramter_of_LE=5FCOS_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 08:27:43 -0000
Message-ID: <174366886335.31271.14886354769426540089@e6b6f09ec485>
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

Series: drm/xe: Add the missed value paramter of LE_COS (rev4)
URL   : https://patchwork.freedesktop.org/series/147087/
State : success

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
commit 108528133be3b9861d921586a15ba66bc32dba06
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Apr 3 03:46:08 2025 +0000

    drm/xe: remove unused LE_COS
    
    value is missed for LE_COS.
    The value for this field is universally "0" for every MOCS entry on
    the old Xe_LP platforms, and the whole field has been removed from
    Xe_HP onward. Just delete the line so that we don't have an unused
    definition.
    
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 135e2838ed7d44d880e7e19971b1234e6ae04ded drm-intel
108528133be3 drm/xe: remove unused LE_COS


