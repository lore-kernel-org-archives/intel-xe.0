Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3AED74954
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 02:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB1A10E73C;
	Wed, 30 Oct 2024 02:58:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A91510E73C;
 Wed, 30 Oct 2024 02:58:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Add_the_?=
 =?utf-8?q?loop_only_for_DP_encoders_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 02:58:52 -0000
Message-ID: <173025713249.1362390.6460109143372800470@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030025304.317977-1-suraj.kandpal@intel.com>
In-Reply-To: <20241030025304.317977-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Add the loop only for DP encoders (rev2)
URL   : https://patchwork.freedesktop.org/series/140632/
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
commit 236ec3f4d3a9c314cf258b37c4a477d35d5d4559
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Oct 30 08:23:04 2024 +0530

    drm/i915/hdcp: Add the loop only for DP encoders
    
    Add the loop on the first read/write we do to give docks and dp encoders
    some extra time to get their HDCP DPCD registers ready only for
    DP/DPMST encoders as this issue is only observed here no need to burden
    other encoders with extra retries as this causes the HDMI connector to
    have some other timing issue and fails HDCP authentication.
    
    --v2
    -Add intent of patch [Chaitanya]
    -Add reasoning for loop [Jani]
    -Make sure we forfiet the 50ms wait for non DP/DPMST encoders.
    
    Fixes: 9d5a05f86d2f ("drm/i915/hdcp: Retry first read and writes to downstream")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch b97473387ce132222c9b71f7cf39c2cd814cbb6f drm-intel
236ec3f4d3a9 drm/i915/hdcp: Add the loop only for DP encoders


