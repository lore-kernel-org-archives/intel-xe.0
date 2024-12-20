Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C074CE77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 00:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB7610E362;
	Fri, 20 Dec 2024 00:01:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC29F10E4C8;
 Fri, 20 Dec 2024 00:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dmc=5Fwl=3A_Supp?=
 =?utf-8?q?ort_extra_values_for_dmc=5Fwl=5Fenable_for_debugging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 00:01:14 -0000
Message-ID: <173465287489.584851.5382027363902779951@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219221429.109668-1-gustavo.sousa@intel.com>
In-Reply-To: <20241219221429.109668-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Support extra values for dmc_wl_enable for debugging
URL   : https://patchwork.freedesktop.org/series/142854/
State : success

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
commit 9444e39cd750b2672bbeb280ead4056ac1d85abd
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Dec 19 19:14:16 2024 -0300

    drm/i915/dmc_wl: Allow enable_dmc_wl=3 to mean "always locked"
    
    When debugging issues that might be related to the DMC wakelock code, it
    might be useful to compare runs with the lock acquired while DC states
    are enabled vs the regular case. If issues disappear with the former, it
    might be a symptom of something wrong in our code. Support having this
    "always locked" behavior with enable_dmc_wl=3.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 764b5dbd7c2666300f18682978e43c57d8607f7b drm-intel
1a1ad14d6bb1 drm/i915/dmc_wl: Use enum values for enable_dmc_wl
f7b4271f376c drm/i915/dmc_wl: Show description string for enable_dmc_wl
28e901e0e656 drm/i915/dmc_wl: Allow enable_dmc_wl=2 to mean "match any register"
9444e39cd750 drm/i915/dmc_wl: Allow enable_dmc_wl=3 to mean "always locked"


