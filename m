Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C89CEE354
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 21:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E04A10E81E;
	Wed,  9 Oct 2024 21:47:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3EB10E81E;
 Wed,  9 Oct 2024 21:47:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_HPD_interru?=
 =?utf-8?q?pt_enabling_during_runtime_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 21:47:36 -0000
Message-ID: <172851045623.1212464.16449931037554097286@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009194358.1321200-1-imre.deak@intel.com>
In-Reply-To: <20241009194358.1321200-1-imre.deak@intel.com>
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

Series: drm/xe: Fix HPD interrupt enabling during runtime resume
URL   : https://patchwork.freedesktop.org/series/139812/
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
commit 74debc60293a15802d937024d091fdac5eec0663
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Oct 9 22:43:58 2024 +0300

    drm/xe/display: Add missing HPD interrupt enabling during non-d3cold RPM resume
    
    Atm the display HPD interrupts that got disabled during runtime
    suspend, are re-enabled only if d3cold is enabled. Fix things by
    also re-enabling the interrupts if d3cold is disabled.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch e1aba2bf4f79f2f8ae7ce538124d445fc91df852 drm-intel
e6f466d72ade drm/i915/dp: Assume panel power is off if runtime suspended
affe8194893e drm/i915/dp: Disable unnecessary HPD polling for eDP
9a922bb34a46 drm/xe/display: Separate the d3cold and non-d3cold runtime PM handling
74debc60293a drm/xe/display: Add missing HPD interrupt enabling during non-d3cold RPM resume


