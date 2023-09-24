Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA85CE7A8A
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 14:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA6210E1AF;
	Sun, 24 Sep 2023 14:59:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4116610E1AF;
 Sun, 24 Sep 2023 14:59:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 74DC1A0BA8;
 Sun, 24 Sep 2023 14:59:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Date: Sun, 24 Sep 2023 14:59:25 -0000
Message-ID: <169556756547.29781.3569252932451251037@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
In-Reply-To: <20230924144751.446446-1-arun.r.murthy@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Add_module_parameter_=27?=
 =?utf-8?q?fastboot=27?=
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

Series: series starting with [1/2] drm/xe: Add module parameter 'fastboot'
URL   : https://patchwork.freedesktop.org/series/124163/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f24af9371f74f8eff3bb7f6ee2f21296897c5585
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Sun Sep 24 20:17:51 2023 +0530

    Revert "FIXME: drm/i915: xe doesn't have fastboot module parameter"
    
    Fastboot module parameter has been added to xe driver.
    
    This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.
+ /mt/dim checkpatch 16e2c940ef53f81b2c68e16ec39cf5772894a625 drm-intel
32a780686 drm/xe: Add module parameter 'fastboot'
f24af9371 Revert "FIXME: drm/i915: xe doesn't have fastboot module parameter"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e1d816044a2feb4aab2592c840e999bd9a13f0a8', maybe rebased or not pulled?
#9: 
This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.

-:32: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 16 lines checked


