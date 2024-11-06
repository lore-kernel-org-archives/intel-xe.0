Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26021D59F4D
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 16:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947910E71C;
	Wed,  6 Nov 2024 16:05:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACC310E71C;
 Wed,  6 Nov 2024 16:05:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Pcode?=
 =?utf-8?q?_sets_the_CD_clock_frequency_voltage_levels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 16:05:15 -0000
Message-ID: <173090911576.1417588.14534113710201146695@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106152023.398748-1-mika.kahola@intel.com>
In-Reply-To: <20241106152023.398748-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Pcode sets the CD clock frequency voltage levels
URL   : https://patchwork.freedesktop.org/series/141013/
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
commit 7b5b04c554f48b9b8218e561e2334d1c3afc4fc4
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Wed Nov 6 17:20:23 2024 +0200

    drm/i915/display: Pcode sets the CD clock frequency voltage levels
    
    On xe3lpd the CD clock frequency is set by the driver
    without setting voltage levels. Previously, we had 4
    levels of voltages to choose from. However, having only 4
    levels is rather coarse and we may end up consuming more
    power than necessary. Therefore, these are now removed
    and choosing the correct voltage level is now handed over
    to Pcode firmware which is able to set voltage level with
    higher granularity.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 334cc1166d7241367450ee517d933e1dc8b1c96d drm-intel
7b5b04c554f4 drm/i915/display: Pcode sets the CD clock frequency voltage levels


