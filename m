Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B8AC27C65
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 05:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDBB10E20E;
	Fri,  7 Jun 2024 05:11:38 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EB310E20E;
 Fri,  7 Jun 2024 05:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Assert_for_multiple_or_un?=
 =?utf-8?q?defined_forcewake_domains?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 05:11:37 -0000
Message-ID: <171773709746.25385.10987794704387460390@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
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

Series: Assert for multiple or undefined forcewake domains
URL   : https://patchwork.freedesktop.org/series/134590/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9290515ef4884465091bdfb97d81e01a50ca5189
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Jun 7 10:52:13 2024 +0530

    drm/xe: Check valid domain is passed in xe_force_wake_ref
    
    Assert in case of XE_FORCEWAKE_ALL is passed.
    
    v2
    - use domain != XE_FORCEWAKE_ALL (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch d3c2f5c9ed23d7653741913ee6c38bb0950a8870 drm-intel
f1ea13681d48 drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
9290515ef488 drm/xe: Check valid domain is passed in xe_force_wake_ref


