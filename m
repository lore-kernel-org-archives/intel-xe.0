Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3211CCD192
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A9610E813;
	Wed, 15 Oct 2025 14:41:30 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0B810E80F;
 Wed, 15 Oct 2025 14:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Prevent_runtime?=
 =?utf-8?q?_PM_wake_while_reading_rp0_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 14:41:28 -0000
Message-ID: <176053928896.17707.10807697078739136591@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015094611.1468939-1-badal.nilawar@intel.com>
In-Reply-To: <20251015094611.1468939-1-badal.nilawar@intel.com>
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

Series: drm/xe: Prevent runtime PM wake while reading rp0 frequency
URL   : https://patchwork.freedesktop.org/series/155973/
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
commit 32f23c63700af3f2b40d3270cad1ce62e21e1d2b
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Oct 15 15:16:11 2025 +0530

    drm/xe: Prevent runtime PM wake while reading rp0 frequency
    
    The rp0 frequency is a fused value that is read once during probe
    and then cached, so there’s no need to trigger a runtime wake
    when accessing rp0.
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch ed00bdb0008276b3497a4c811e160f18d1218554 drm-intel
32f23c63700a drm/xe: Prevent runtime PM wake while reading rp0 frequency
-:14: WARNING:BAD_SIGN_OFF: Duplicate signature
#14: 
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


