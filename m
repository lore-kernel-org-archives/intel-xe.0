Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D158E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81710E06B;
	Wed, 11 Dec 2024 06:48:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B9F10E06B;
 Wed, 11 Dec 2024 06:48:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Avoid_reading_inacc?=
 =?utf-8?q?essible_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 06:48:12 -0000
Message-ID: <173389969231.1104584.6409327250883991880@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
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

Series: VF: Avoid reading inaccessible registers (rev2)
URL   : https://patchwork.freedesktop.org/series/142196/
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
commit a346c30572049b158405ddeb9581557e508c4fd7
Author: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Date:   Wed Dec 11 07:42:11 2024 +0100

    drm/xe/vf: Don't apply Wa_22019338487 for VF
    
    Don't use Wa_22019338487 for VF.
    
    Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
    Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
    Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michal Winiarski <michal.winiarski@intel.com>
    Cc: Narasimha C V <narasimha.c.v@intel.com>
    Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 7bbcd7df9387f0d9004f997df33f7a9472d9c080 drm-intel
a90b482631bb drm/xe/vf: Don't check has flat ccs in bios on VF
767122832e43 drm/xe/rtp: Add match helper to omit SR-IOV VF device
a346c3057204 drm/xe/vf: Don't apply Wa_22019338487 for VF


