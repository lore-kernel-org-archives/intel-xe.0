Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD89C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 23:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC29410E859;
	Wed, 15 Jan 2025 23:46:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A010E859;
 Wed, 15 Jan 2025 23:46:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_HDMI_?=
 =?utf-8?q?C10_PLL_entry_for_265250_MHz?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 23:46:42 -0000
Message-ID: <173698480274.4180910.17774960324853683321@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115230859.2410966-1-clinton.a.taylor@intel.com>
In-Reply-To: <20250115230859.2410966-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/display: HDMI C10 PLL entry for 265250 MHz
URL   : https://patchwork.freedesktop.org/series/143576/
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
commit ed77923ca98e7eaf94a1ce6c4623b2657ba0ca06
Author: Clint Taylor <clinton.a.taylor@intel.com>
Date:   Wed Jan 15 15:08:59 2025 -0800

    drm/i915/display: HDMI C10 PLL entry for 265250 MHz
    
    Add PLL values for 265.250MHz pixel clock to support recent 3440x1440
    monitors.
    
    Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
+ /mt/dim checkpatch 83dd30e2ec24ab8307774b149fcd998a4191eec2 drm-intel
ed77923ca98e drm/i915/display: HDMI C10 PLL entry for 265250 MHz


