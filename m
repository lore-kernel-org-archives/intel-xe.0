Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00835C02185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 08:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6B210E52B;
	Wed, 15 Jan 2025 08:10:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602C110E52B;
 Wed, 15 Jan 2025 08:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Flpg=3A_Port_2?=
 =?utf-8?q?_WAs_from_i915_to_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 08:10:03 -0000
Message-ID: <173692860338.3881350.4030643283818846838@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115080048.2282183-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250115080048.2282183-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/xe_lpg: Port 2 WAs from i915 to Xe
URL   : https://patchwork.freedesktop.org/series/143547/
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
commit af0f981baa0e3eb773d8293be061cc9fd9ca90b5
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Wed Jan 15 13:30:48 2025 +0530

    drm/xe/xe_lpg: Port 2 WAs from i915 to Xe
    
    Port Wa_16021333562 and Wa_14016712196 for Xe_LPG_MD (G:12.70), and
    Xe_LPG_LG (G:12.71) MeteorLake (MTL) platforms, from drm/i915 to drm/xe.
    
    Also fix the lineage number of Wa_18013179988 for the MTL platform.
    
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch ac1e97c603501be90e530b0ce0eac45728869c85 drm-intel
af0f981baa0e drm/xe/xe_lpg: Port 2 WAs from i915 to Xe


