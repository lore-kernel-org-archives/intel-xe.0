Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6401DC4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 01:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EDE10E172;
	Sat,  9 Dec 2023 01:20:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8210310E16F;
 Sat,  9 Dec 2023 01:20:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7D63CAADEA;
 Sat,  9 Dec 2023 01:20:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pmu/uapi=3A_Remove?=
 =?utf-8?q?_PMU_group_busyness_events_from_uapi_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 09 Dec 2023 01:20:51 -0000
Message-ID: <170208485151.20048.17303753366163803@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231209000233.2577418-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231209000233.2577418-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/pmu/uapi: Remove PMU group busyness events from uapi (rev2)
URL   : https://patchwork.freedesktop.org/series/127590/
State : success

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
commit f1eedfb47f93969a7cc0758731ef1ec261a423a8
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Dec 8 16:02:33 2023 -0800

    drm/xe/pmu/uapi: Remove PMU group busyness events from uapi
    
    PMU group busyness uapi is likely to change in the future. Till the uapi is
    decided remove the uapi from xe_drm.h. To not break the build retain the
    events internally in xe_pmu.c for now.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
f1eedfb47 drm/xe/pmu/uapi: Remove PMU group busyness events from uapi


