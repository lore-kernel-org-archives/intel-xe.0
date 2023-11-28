Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC1C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAA810E563;
	Tue, 28 Nov 2023 15:07:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1B0A10E563;
 Tue, 28 Nov 2023 15:07:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ADD30A882E;
 Tue, 28 Nov 2023 15:07:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Tue, 28 Nov 2023 15:07:30 -0000
Message-ID: <170118405070.8220.17562934192404480662@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?port_ATS-M_Unique_device_id?=
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

Series: Report ATS-M Unique device id
URL   : https://patchwork.freedesktop.org/series/126990/
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
commit 293116f2273f9d7d1ca6fe6523767b80a4188125
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Nov 28 20:43:33 2023 +0530

    drm/xe: Move device sysfs init out of xe_pm_init
    
    Device sysfs needs to happen right after device probe.
    Currently it is under xe_pm_init() which does not look
    correct now as we add more sysfs entries which are not
    specific to PM.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 417251e59231e74f32b995403a66588e6960da2b drm-intel
454321de2 drm/xe: Track if platform has csc uid
4ce2144f5 drm/xe/ats-m: Expose uid for ATS-M via sysfs
293116f22 drm/xe: Move device sysfs init out of xe_pm_init


