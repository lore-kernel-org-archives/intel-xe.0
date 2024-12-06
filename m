Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF6E7717B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 09:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8F10F071;
	Fri,  6 Dec 2024 09:50:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B417F10F071;
 Fri,  6 Dec 2024 09:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/connector=3A_add_eld?=
 =?utf-8?q?=5Fmutex_to_protect_connector-=3Eeld_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Dec 2024 09:50:13 -0000
Message-ID: <173347861373.3297687.3958857263894754065@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
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

Series: drm/connector: add eld_mutex to protect connector->eld (rev2)
URL   : https://patchwork.freedesktop.org/series/141955/
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
commit 84ef03bee0452d234aa47e34d0ef7a3b33add64d
Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri Dec 6 11:43:13 2024 +0200

    drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
    
    Reading access to connector->eld can happen at the same time the
    drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
    order to protect connector->eld from concurrent access.
    
    Reviewed-by: Maxime Ripard <mripard@kernel.org>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ /mt/dim checkpatch 2e90353f058f2487798ad9236f0926df4ea54f02 drm-intel
8a558f595948 drm/connector: add mutex to protect ELD from concurrent access
c27bd2043e2e drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
1c6e62c019ed drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
ae6932fc514a drm/amd/display: use eld_mutex to protect access to connector->eld
f86a5b7368eb drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
6bbb2736a3e0 drm/i915/audio: use eld_mutex to protect access to connector->eld
928254cbe48c drm/msm/dp: use eld_mutex to protect access to connector->eld
1997667e64df drm/radeon: use eld_mutex to protect access to connector->eld
16213d3b0cbe drm/sti: hdmi: use eld_mutex to protect access to connector->eld
84ef03bee045 drm/vc4: hdmi: use eld_mutex to protect access to connector->eld


