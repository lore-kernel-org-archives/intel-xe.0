Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B7C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 16:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72D10E087;
	Tue, 21 May 2024 16:39:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9319C10E96D;
 Tue, 21 May 2024 16:39:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Store_platform_name_in_xe?=
 =?utf-8?q?=5Fdevice=2Einfo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 16:39:35 -0000
Message-ID: <171630957560.2162156.16154226142647675233@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240521142257.756-1-michal.wajdeczko@intel.com>
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

Series: Store platform name in xe_device.info
URL   : https://patchwork.freedesktop.org/series/133880/
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
commit efb1e91bf5e3cf3e5db46fd8d8c4d96735ae30c3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 21 16:22:57 2024 +0200

    drm/xe: Use platform name in xe_assert()
    
    We can now use more user-friendly platform name instead of
    previosly used magic platform enumerator value:
    
      [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
          platform: ALDERLAKE_S ...
      [ ] xe 0000:03:00.0: [drm] Assertion `false` failed!
          platform: DG2 ...
    
    vs
    
      [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
          platform: 3 ...
      [ ] xe 0000:03:00.0: [drm] Assertion `false` failed!
          platform: 7 ...
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 39e2349c88dab7b39cf2c9549783e9b1e03311ad drm-intel
3dc09d73da4d drm/xe: Store platform name in xe_device.info
129096d85d9d drm/xe: Drop undesired prefix from the platform name
efb1e91bf5e3 drm/xe: Use platform name in xe_assert()


