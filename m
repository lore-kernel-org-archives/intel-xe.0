Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8246FE77170
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 17:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3518410E08D;
	Wed,  4 Dec 2024 17:25:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB64F10E08D;
 Wed,  4 Dec 2024 17:25:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Don=27t_appl?=
 =?utf-8?q?y_Wa=5F22019338487_for_VF_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 17:25:55 -0000
Message-ID: <173333315589.2594265.4682651085023718739@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204164059.1366627-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20241204164059.1366627-1-jakub1.kolakowski@intel.com>
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

Series: drm/xe/vf: Don't apply Wa_22019338487 for VF (rev2)
URL   : https://patchwork.freedesktop.org/series/142130/
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
commit f3ea76cc9912aa39ff13b2b7b284d9d262ce53ef
Author: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Date:   Wed Dec 4 16:40:59 2024 +0000

    drm/xe/vf: Don't check has flat ccs in bios on VF
    
    Don't check for flat ccs from VF-level as VF does not have direct
    access to the register.
    
    Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Suggested-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
    Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
    Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
    Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michal Winiarski <michal.winiarski@intel.com>
    Cc: Narasimha C V <narasimha.c.v@intel.com>
    Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 62d365d6c3078d7e4f34dd65735f6fcd7b53a856 drm-intel
f3ea76cc9912 drm/xe/vf: Don't check has flat ccs in bios on VF


