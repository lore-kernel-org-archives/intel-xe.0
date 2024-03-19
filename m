Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD7CC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 03:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FF010ECCC;
	Tue, 19 Mar 2024 03:17:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9710ECCC;
 Tue, 19 Mar 2024 03:17:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xelpg=3A_Add_Wa=5F?=
 =?utf-8?q?14020495402_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 03:17:26 -0000
Message-ID: <171081824681.900715.17391027399178942327@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318210120.564692-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240318210120.564692-1-radhakrishna.sripada@intel.com>
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

Series: drm/xe/xelpg: Add Wa_14020495402 (rev2)
URL   : https://patchwork.freedesktop.org/series/131285/
State : warning

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
commit 388e90faf560e02396bf70b54e51626f097f5091
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Mon Mar 18 14:01:20 2024 -0700

    drm/xe/xelpg: Add Wa_14020495402
    
    Disable clockgating for TDL SVHS fub.
    
    v2: Extend the Wa to 1274(MattR)
    
    Bspec: 46045
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 drm-intel
388e90faf560 drm/xe/xelpg: Add Wa_14020495402
-:13: WARNING:BAD_SIGN_OFF: Duplicate signature
#13: 
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


