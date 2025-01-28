Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB291C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 12:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA1E10E642;
	Tue, 28 Jan 2025 12:00:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BB210E642;
 Tue, 28 Jan 2025 12:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Add_runtime_?=
 =?utf-8?q?registers_for_graphics_gen_=3E=3D_30?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 12:00:19 -0000
Message-ID: <173806561948.1902647.294166608857410420@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
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

Series: drm/xe/pf: Add runtime registers for graphics gen >= 30
URL   : https://patchwork.freedesktop.org/series/144026/
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
commit a8443e24653c1671ec457595d1ca3ebeb59ed943
Author: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Date:   Tue Jan 28 11:03:00 2025 +0000

    drm/xe/pf: Add runtime registers for graphics gen >= 30
    
    Add missing runtime registers for graphics versions of 3000 or higher.
    This is required for Xe3 where additionally we have
    MIRROR_L3BANK_ENABLE register.
    
    Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
    Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
    Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch 73c0fe019ff4bf312f6ae1114f0ca63bd13ea4b7 drm-intel
a8443e24653c drm/xe/pf: Add runtime registers for graphics gen >= 30


