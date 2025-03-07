Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC36DC282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 22:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E4C10E1C3;
	Fri,  7 Mar 2025 22:54:33 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A9710E1C3;
 Fri,  7 Mar 2025 22:54:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe3=3A_Recognize_3?=
 =?utf-8?q?DSTATE=5FCOARSE=5FPIXEL_to_LRC_dumps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 22:54:32 -0000
Message-ID: <174138807227.4759.16833790663399037011@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307190754.678376-2-matthew.d.roper@intel.com>
In-Reply-To: <20250307190754.678376-2-matthew.d.roper@intel.com>
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

Series: drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps
URL   : https://patchwork.freedesktop.org/series/146021/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bc8bc9f3f28b6673c21192affd70c0b35653904f
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Mar 7 11:07:55 2025 -0800

    drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps
    
    Xe3 adds a new 3DSTATE_COARSE_PIXEL state instruction as part of the
    render engine LRC.  Ensure we can recognize and report this properly in
    the LRC dumps.
    
    Bspec: 65182, 73415
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
bc8bc9f3f28b drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps


