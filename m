Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011A0C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 22:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D098E10E567;
	Wed,  7 Jun 2023 22:40:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E01710E567;
 Wed,  7 Jun 2023 22:40:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1B2C2AA01E;
 Wed,  7 Jun 2023 22:40:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 07 Jun 2023 22:40:55 -0000
Message-ID: <168617765510.21181.14084769257936327565@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607223840.2835605-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230607223840.2835605-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe=3A_Introduce_a_new_DRM_driver_for_Intel_GPUs_=28rev?=
 =?utf-8?q?4=29?=
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

Series: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs (rev4)
URL   : https://patchwork.freedesktop.org/series/115290/
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
commit 3914e50376a0235037a33fa0aa42788480abe974
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Jun 7 15:38:40 2023 -0700

    fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
    
    Trivial kernel-doc fix, s/vm_id/engine_id/
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch dc8094ef1ae1faa7bff0a2a3d510a38ba557302a drm-intel
3914e5037 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs


