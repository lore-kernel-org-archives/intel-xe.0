Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E80C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 04:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97710EA8A;
	Mon, 18 Mar 2024 04:17:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920810EA8A;
 Mon, 18 Mar 2024 04:17:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Failed_getting_?=
 =?utf-8?q?VMA_cause_display_stuck?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "wangxiaoming321" <xiaoming.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Mar 2024 04:17:49 -0000
Message-ID: <171073546910.883671.16471737604634627916@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318041244.1239610-1-xiaoming.wang@intel.com>
In-Reply-To: <20240318041244.1239610-1-xiaoming.wang@intel.com>
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

Series: drm/xe: Failed getting VMA cause display stuck
URL   : https://patchwork.freedesktop.org/series/131237/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 74d3e5a2f3dae14a59c01f3781b385567ff987d2
Author: wangxiaoming321 <xiaoming.wang@intel.com>
Date:   Mon Mar 18 12:12:44 2024 +0800

    drm/xe: Failed getting VMA cause display stuck
    
    The failure of binding VMA is duing to interrupt,
    So it needs to retry while return fail.
    
    Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
+ /mt/dim checkpatch bb2b694350f7d997c90c0edff2d3409d9adc482a drm-intel
74d3e5a2f3da drm/xe: Failed getting VMA cause display stuck


