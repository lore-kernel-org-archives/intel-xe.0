Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AA5C30653
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 10:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1C810E07C;
	Tue, 25 Jun 2024 10:02:27 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3764410E07C;
 Tue, 25 Jun 2024 10:02:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/client=3A_Check_re?=
 =?utf-8?q?turn_value_of_xe=5Fforce=5Fwake=5Fget_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 10:02:26 -0000
Message-ID: <171930974622.154922.8316064294372152349@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625094228.5327-1-nirmoy.das@intel.com>
In-Reply-To: <20240625094228.5327-1-nirmoy.das@intel.com>
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

Series: drm/xe/client: Check return value of xe_force_wake_get (rev5)
URL   : https://patchwork.freedesktop.org/series/134121/
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
commit 41e147bff318489d8e62c1b824faadb3df2c698b
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Jun 25 11:42:28 2024 +0200

    drm/xe/client: Check return value of xe_force_wake_get
    
    xe_force_wake_get() can return error so check it's return value
    before reading gpu_timestamp value.
    
    v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
        Add a warn on for xe_force_wake_put(Himal)
    
    Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 5e45785f315938951d86af616d35a5ba08bfeabc drm-intel
41e147bff318 drm/xe/client: Check return value of xe_force_wake_get


