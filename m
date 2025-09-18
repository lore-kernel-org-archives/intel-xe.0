Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479DCAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 10:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D057710E6C2;
	Thu, 18 Sep 2025 10:38:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98D10E6C2;
 Thu, 18 Sep 2025 10:38:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/i2c=3A_Don=27t_rel?=
 =?utf-8?q?y_on_d3cold=2Eallowed_flag_in_system_PM_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 10:38:06 -0000
Message-ID: <175819188670.344321.10030150461146027408@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250918103200.2952576-1-raag.jadav@intel.com>
In-Reply-To: <20250918103200.2952576-1-raag.jadav@intel.com>
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

Series: drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path
URL   : https://patchwork.freedesktop.org/series/154693/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 580b6d0c966f17afb91065830e85137ab919cc6a
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Sep 18 16:02:00 2025 +0530

    drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path
    
    In S3 and above sleep states, the device can loose power regardless of
    d3cold.allowed flag. Bring up I2C controller explicitly in system PM
    path to ensure its normal operation after loosing power.
    
    v2: Cover S3 and above states (Rodrigo)
    
    Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 31f149f6d10616688087056856c29390e28d7e44 drm-intel
580b6d0c966f drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path
-:9: WARNING:TYPO_SPELLING: 'loosing' may be misspelled - perhaps 'losing'?
#9: 
path to ensure its normal operation after loosing power.
                                          ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


