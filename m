Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C9CEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065EF10E63E;
	Fri, 16 Jun 2023 14:16:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F4EC10E641;
 Fri, 16 Jun 2023 14:16:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8BE2EAADE0;
 Fri, 16 Jun 2023 14:16:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Fri, 16 Jun 2023 14:16:51 -0000
Message-ID: <168692501157.9829.780156857781855914@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
In-Reply-To: <20230616141115.1128000-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Xe?=
 =?utf-8?q?_runtime_pm_fixes?=
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

Series: Xe runtime pm fixes
URL   : https://patchwork.freedesktop.org/series/119467/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 44551c08470a0387ddea9deba2c978b0f0140b4f
Author: Anshuman Gupta <anshuman.gupta@intel.com>
Date:   Fri Jun 16 19:41:15 2023 +0530

    drm/xe/pm: Fix PM runtime_idle callback
    
    xe driver is using runtime_idle RPM callback but
    xe_pm_runtime_put() is using pm_runtime_put_autosuspend(), which
    eventually make PM Core to trigger autosuspend directly
    without even calling runtime_idle callback.
    
    Fixing it accordingly in both xe_pm_runtime_put()
    and xe_pci_runtime_idle().
    
    Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch 6bdcfb99792f60648ac64917fe25c6ac4023ac6d drm-intel
cc0688325 drm/xe/pm: Wrap pm_runtime_suspended with power.lock
44551c084 drm/xe/pm: Fix PM runtime_idle callback


