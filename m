Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D10C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 15:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AF110EA0E;
	Fri, 14 Mar 2025 15:10:11 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD01310EA0E;
 Fri, 14 Mar 2025 15:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/display=3A_dp=3A_add_?=
 =?utf-8?q?new_DPCD_access_functions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <lumag@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 15:10:09 -0000
Message-ID: <174196500989.35407.3331917508721914582@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
In-Reply-To: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
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

Series: drm/display: dp: add new DPCD access functions (rev2)
URL   : https://patchwork.freedesktop.org/series/146000/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8756b133a8b637c085768ad71fb012d0cc4060d5
Author: Dmitry Baryshkov <lumag@kernel.org>
Date:   Fri Mar 14 07:59:47 2025 +0200

    drm/display: dp-tunnel: use new DCPD access helpers
    
    Switch drm_dp_tunnel.c to use new set of DPCD read / write helpers.
    
    Reviewed-by: Lyude Paul <lyude@redhat.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ /mt/dim checkpatch 83417b23792d937795320a8804fd97d50c4c6233 drm-intel
3a15592390fa drm/display: dp: implement new access helpers
8398908c38cd drm/display: dp: change drm_dp_dpcd_read_link_status() return value
e9434dc3d8dd drm/display: dp: use new DCPD access helpers
8dbafe358e5c drm/display: dp-cec: use new DCPD access helpers
1baf76a5a087 drm/display: dp-mst-topology: use new DCPD access helpers
8756b133a8b6 drm/display: dp-tunnel: use new DCPD access helpers


