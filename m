Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84330D41C02
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 05:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5372A10E67E;
	Wed, 13 Nov 2024 05:29:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE8210E343;
 Wed, 13 Nov 2024 05:29:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Pcode?=
 =?utf-8?q?_sets_the_CD_clock_frequency_voltage_levels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 05:29:43 -0000
Message-ID: <173147578370.3252450.14838743987382811739@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112132411.491540-1-mika.kahola@intel.com>
In-Reply-To: <20241112132411.491540-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Pcode sets the CD clock frequency voltage levels (rev2)
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
commit d39fd4cd899099a8e928e262cb224ad79969a5cf
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Tue Nov 12 15:24:11 2024 +0200

    drm/i915/display: Pcode sets the CD clock frequency voltage levels
    
    On xe3lpd the CD clock frequency is set by the driver
    without setting voltage levels. Previously, we had 4
    levels of voltages to choose from. However, having only 4
    levels is rather coarse and we may end up consuming more
    power than necessary. Therefore, these are now removed
    and choosing the correct voltage level is now handed over
    to Pcode firmware which is able to set voltage level with
    higher granularity.
    
    v2: Leave voltage level calculcations untouched as it returns
        always 0. Drop only voltage level nofication to pcode (Ville)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 26f5fe99791def93b32e27e79e71dbd0666c117b drm-intel
d39fd4cd8990 drm/i915/display: Pcode sets the CD clock frequency voltage levels


