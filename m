Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96396C30653
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5884510E2C3;
	Tue, 25 Jun 2024 21:21:04 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F4410E2C3;
 Tue, 25 Jun 2024 21:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Skip_programm?=
 =?utf-8?q?ing_FIA_link_enable_bits_for_MTL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 21:21:03 -0000
Message-ID: <171935046306.158784.16914888230069471780@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625202652.315936-1-gustavo.sousa@intel.com>
In-Reply-To: <20240625202652.315936-1-gustavo.sousa@intel.com>
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

Series: drm/i915: Skip programming FIA link enable bits for MTL+
URL   : https://patchwork.freedesktop.org/series/135388/
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
commit 9d732630ea4a28142bb69c2d4a98238758e66cfd
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Tue Jun 25 17:26:52 2024 -0300

    drm/i915: Skip programming FIA link enable bits for MTL+
    
    Starting with Xe_LPDP, support for Type-C connections is provided by
    PICA and programming PORT_TX_DFLEXDPMLE1(*) registers is not applicable
    anymore. Those registers don't even exist in recent display IPs. As
    such, skip programming them.
    
    Bspec: 65750, 65448
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch edccdf441f1e061f81e0d1d172aa0f37511bbe4d drm-intel
9d732630ea4a drm/i915: Skip programming FIA link enable bits for MTL+


