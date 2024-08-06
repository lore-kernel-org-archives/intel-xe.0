Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661C0C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 18:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1060D10E0A7;
	Tue,  6 Aug 2024 18:11:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B7510E0A7;
 Tue,  6 Aug 2024 18:11:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Fix_VF_confi?=
 =?utf-8?q?g_validation_on_multi-GT_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 18:11:12 -0000
Message-ID: <172296787262.544132.7974770796084498@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806180516.618-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240806180516.618-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Fix VF config validation on multi-GT platforms
URL   : https://patchwork.freedesktop.org/series/136944/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0cc42ae5b867d80977556384c9aa17454408017d
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Aug 6 20:05:16 2024 +0200

    drm/xe/pf: Fix VF config validation on multi-GT platforms
    
    When validating VF config on the media GT, we may wrongly report
    that VF is already partially configured on it, as we consider GGTT
    and LMEM provisioning done on the primary GT (since both GGTT and
    LMEM are tile-level resources, not a GT-level).
    
    This will cause skipping a VF auto-provisioning on the media-GT and
    in result will block a VF from successfully initialize that GT.
    
    Fix that by considering GGTT and LMEM configurations only when
    checking if a VF provisioning is complete, and omit GGTT and LMEM
    when reporting empty/partial provisioning.
    
    Fixes: 234670cea9a2 ("drm/xe/pf: Skip fair VFs provisioning if already provisioned")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 406de6351ab6af1718a41112d733422fe142fe21 drm-intel
0cc42ae5b867 drm/xe/pf: Fix VF config validation on multi-GT platforms


