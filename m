Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B9C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 14:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03410E556;
	Tue,  5 Dec 2023 14:27:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A78E210E556;
 Tue,  5 Dec 2023 14:27:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A3F62AA916;
 Tue,  5 Dec 2023 14:27:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Date: Tue, 05 Dec 2023 14:27:40 -0000
Message-ID: <170178646066.24286.15236395840240056357@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205131716.847721-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231205131716.847721-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/xe2=3A_Add_workaround_16021639441?=
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

Series: drm/xe/xe2: Add workaround 16021639441
URL   : https://patchwork.freedesktop.org/series/127357/
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
commit 6d14ce7a7cc6367b2739b9433cfbf66a149804e5
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Dec 5 18:47:16 2023 +0530

    drm/xe/xe2: Add workaround 16021639441
    
    This workaround applies to graphics 20.04 and on
    non render engine.
    
    Workaround has three parts :
    1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
       (at least not right now) since we don't use MI_ATOMIC anywhere
       in the kernel mode driver.
    2. Memory-based interrupt masking - Memory-based interrupt processing
       isn't supported on physical functions, only virtual functions,
       according to bspec 60352. So this is probably only relevant once
       SRIOV support lands in the driver.
    3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
       is added by this change.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch ac7b89571d802765762e7c15d78a6dcd5d92c41b drm-intel
6d14ce7a7 drm/xe/xe2: Add workaround 16021639441


