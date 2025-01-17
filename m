Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE63C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 05:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6453C10EA48;
	Fri, 17 Jan 2025 05:04:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776BC10EA48;
 Fri, 17 Jan 2025 05:04:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Use_corr?=
 =?utf-8?q?ect_function_to_check_if_encoder_is_HDMI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 05:04:10 -0000
Message-ID: <173709025048.576735.6175996879666596747@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117041247.1084381-1-suraj.kandpal@intel.com>
In-Reply-To: <20250117041247.1084381-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Use correct function to check if encoder is HDMI (rev3)
URL   : https://patchwork.freedesktop.org/series/143580/
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
commit 4fa5697f738d76c3c4395352737a0231d3166c8c
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jan 17 09:42:48 2025 +0530

    drm/i915/hdcp: Use correct function to check if encoder is HDMI
    
    Use intel_encoder_is_hdmi function which was recently introduced to
    see if encoder is HDMI or not.
    
    --v2
    -Add Fixes tag [Jani]
    
    Fixes: 6a3691ca4799 ("drm/i915/hdcp: Disable HDCP Line Rekeying for HDCP2.2 on HDMI")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch d8c883b9b7702b39eb913a72fd7158ad9a6ea11f drm-intel
4fa5697f738d drm/i915/hdcp: Use correct function to check if encoder is HDMI


