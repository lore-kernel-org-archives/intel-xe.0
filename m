Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4C8C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 13:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB69710EC46;
	Fri,  7 Jun 2024 13:35:19 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281D10EC46;
 Fri,  7 Jun 2024 13:35:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/xe=3A_Ensure_caller_uses_sole_domain_for_xe=5Fforc?=
 =?utf-8?q?e=5Fwake=5Fassert=5Fheld?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 13:35:17 -0000
Message-ID: <171776731798.26305.3168469715017829944@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607125741.1407331-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240607125741.1407331-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [CI,1/2] drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
URL   : https://patchwork.freedesktop.org/series/134605/
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
commit de88f0d66ed8cc0f1fc0c8e4a216f51c89405471
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Jun 7 18:27:41 2024 +0530

    drm/xe: Check valid domain is passed in xe_force_wake_ref
    
    Assert domain is not XE_FORCEWAKE_ALL.
    
    v2
    - use domain != XE_FORCEWAKE_ALL (Michal)
    
    v3
    - Fix commit description.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch d9550a18e990d5709c4bc33073842a3c0a8bcaea drm-intel
fccec432cd4e drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
de88f0d66ed8 drm/xe: Check valid domain is passed in xe_force_wake_ref


