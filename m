Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004EFC36014
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 10:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2E710E032;
	Tue,  1 Apr 2025 10:43:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261AF10E032;
 Tue,  1 Apr 2025 10:43:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/dp=5Fmst=3A_Fix_GUID_DPCD_write_to_non-root_MST_branch_?=
 =?utf-8?q?devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 10:43:42 -0000
Message-ID: <174350422215.22413.2902688481548424104@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401103846.686408-1-imre.deak@intel.com>
In-Reply-To: <20250401103846.686408-1-imre.deak@intel.com>
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

Series: series starting with [1/2] drm/dp_mst: Fix GUID DPCD write to non-root MST branch devices
URL   : https://patchwork.freedesktop.org/series/147052/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18bfcf5670b6b30b9e32e96f126db5a06d962e6b
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Apr 1 13:38:46 2025 +0300

    drm/dp_mst: Use drm_dp_dpcd_write_data() to write GUID for non-root MST branch devices
    
    drm_dp_dpcd_write_data() can be used to write the GUID for a non-root
    MST branch device, similarly to writing the GUID to a root MST branch
    device, do so.
    
    Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
    Cc: Lyude Paul <lyude@redhat.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 9368766ece6c78cc0001f9b53037563fe521f887 drm-intel
df1e460be3c6 drm/dp_mst: Fix GUID DPCD write to non-root MST branch devices
18bfcf5670b6 drm/dp_mst: Use drm_dp_dpcd_write_data() to write GUID for non-root MST branch devices


