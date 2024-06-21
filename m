Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9C6C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 19:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A31E10E071;
	Fri, 21 Jun 2024 19:14:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47810E071;
 Fri, 21 Jun 2024 19:14:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Fix_=27enum_?=
 =?utf-8?q?drm=5Fxe=5Fperf=5Ftype=27_kernel_doc_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 19:14:25 -0000
Message-ID: <171899726527.132113.7964776003264149817@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621190903.3593781-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240621190903.3593781-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Fix 'enum drm_xe_perf_type' kernel doc warnings
URL   : https://patchwork.freedesktop.org/series/135195/
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
commit 7a33677dfc13db60537ceffe4df87da18dc4b7d2
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Jun 21 12:09:03 2024 -0700

    drm/xe/oa: Fix 'enum drm_xe_perf_type' kernel doc warnings
    
    Include kernel doc's for 'enum drm_xe_perf_type' to fix kernel doc
    warnings.
    
    Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 383dc44a79848f13f2430c9ed811b5c9b22b882a drm-intel
7a33677dfc13 drm/xe/oa: Fix 'enum drm_xe_perf_type' kernel doc warnings
-:9: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#9: 
Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


