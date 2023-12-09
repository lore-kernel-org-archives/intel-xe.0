Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF66BC4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 22:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902310E263;
	Sat,  9 Dec 2023 22:46:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BB2E10E2EB;
 Sat,  9 Dec 2023 22:46:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38249AADDA;
 Sat,  9 Dec 2023 22:46:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_Remove_PMU_?=
 =?utf-8?q?from_Xe_till_uapi_is_finalized_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 09 Dec 2023 22:46:20 -0000
Message-ID: <170216198022.20047.8659443172082858474@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/pmu: Remove PMU from Xe till uapi is finalized (rev2)
URL   : https://patchwork.freedesktop.org/series/127598/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e30a72d2ff8eebd85cf97f13f257d6786eb41e3a
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Sat Dec 9 14:43:52 2023 -0800

    drm/xe/pmu: Remove PMU from Xe till uapi is finalized
    
    PMU uapi is likely to change in the future. Till the uapi is finalized,
    remove PMU from Xe. PMU can be re-added after uapi is finalized.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
e30a72d2f drm/xe/pmu: Remove PMU from Xe till uapi is finalized
-:112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#112: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 114 lines checked


