Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB981C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 06:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22C410E06D;
	Fri, 31 Jan 2025 06:30:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3717610E150;
 Fri, 31 Jan 2025 06:30:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_expose_pa?=
 =?utf-8?q?ckage_and_vram_temperature_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 06:30:00 -0000
Message-ID: <173830500022.3115419.18325784803550252719@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131054502.1528555-1-raag.jadav@intel.com>
In-Reply-To: <20250131054502.1528555-1-raag.jadav@intel.com>
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

Series: drm/xe/hwmon: expose package and vram temperature (rev2)
URL   : https://patchwork.freedesktop.org/series/143225/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7c5202584de510fd1b86ee20aba49ebac3602460
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Jan 31 11:15:02 2025 +0530

    drm/xe/hwmon: expose package and vram temperature
    
    Add hwmon support for temp2_input and temp3_input attributes, which will
    expose package and vram temperature in millidegree Celsius. With this in
    place we can monitor temperature using lm-sensors tool.
    
    v2: Reuse existing channels (Badal, Karthik)
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch 0c2a60e7f1e779d87754254d9e3443beedbb684e drm-intel
7c5202584de5 drm/xe/hwmon: expose package and vram temperature


