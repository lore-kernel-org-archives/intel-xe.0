Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAFCC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCACA10FE14;
	Thu, 30 May 2024 15:00:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16110F05C;
 Thu, 30 May 2024 15:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_xe=5Fforce?=
 =?utf-8?q?=5Fwake=5Fassert=5Fheld_for_enum_XE=5FFORCEWAKE=5FALL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 15:00:09 -0000
Message-ID: <171708120911.2238782.858704894774360383@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL
URL   : https://patchwork.freedesktop.org/series/134254/
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
commit e2c68dc6e1794bc6b1f84670e074f9ef116b1a81
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu May 30 19:55:33 2024 +0530

    drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL
    
    Make sure that the assertion condition covers the wakefulness of all
    domains for XE_FORCEWAKE_ALL.
    
    Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of XE_WARN_ON macro")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch bdab4dd15a635eedc4b4d95be9d4155be46e5e4b drm-intel
e2c68dc6e179 drm/xe: Fix xe_force_wake_assert_held for enum XE_FORCEWAKE_ALL


