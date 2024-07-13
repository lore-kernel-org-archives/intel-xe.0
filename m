Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA02C3DA45
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jul 2024 14:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332B810E0EE;
	Sat, 13 Jul 2024 14:34:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5199710E0EE;
 Sat, 13 Jul 2024 14:34:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Track_writes?=
 =?utf-8?q?_to_inaccessible_registers_from_VF_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 13 Jul 2024 14:34:26 -0000
Message-ID: <172088126632.199315.4367027864094560541@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240713142643.1242-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240713142643.1242-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Track writes to inaccessible registers from VF (rev3)
URL   : https://patchwork.freedesktop.org/series/135295/
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
commit 3cb44d1e39819e0f7c93f1bb61845bef51cdfa9b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Jul 13 16:26:43 2024 +0200

    drm/xe/vf: Track writes to inaccessible registers from VF
    
    Only limited set of registers is accessible for the VF driver and
    the hardware will silently drop writes to inaccessible registers.
    To improve our VF driver lets intercept all such writes to warn
    about such unexpected writes on debug builds or optionally allow
    to provide some substitution (as a potential future extension).
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678 drm-intel
3cb44d1e3981 drm/xe/vf: Track writes to inaccessible registers from VF


