Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D794CC3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 17:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FCA10E96E;
	Wed, 26 Jun 2024 17:00:27 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522B10E972;
 Wed, 26 Jun 2024 17:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Remove_xe?=
 =?utf-8?q?=5Fhwmon=5Fprocess=5Freg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 17:00:25 -0000
Message-ID: <171942122593.161869.17821853082205633357@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626170746.2926011-1-karthik.poosa@intel.com>
In-Reply-To: <20240626170746.2926011-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Remove xe_hwmon_process_reg
URL   : https://patchwork.freedesktop.org/series/135440/
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
commit a84e0075b7a43b5a6843e627703bd5679a3e3c55
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Jun 26 22:37:46 2024 +0530

    drm/xe/hwmon: Remove xe_hwmon_process_reg
    
    Remove xe_hwmon_process_reg as it is a umbrella function which can be
    avoided (Lucas).
    
    v2: Improve commit message. (Badal)
    
    v3: Add couple of comments. (Lucas)
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c4601c83a202942e6af78bbda2a274f60262d1dd drm-intel
a84e0075b7a4 drm/xe/hwmon: Remove xe_hwmon_process_reg


