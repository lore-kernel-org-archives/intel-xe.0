Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AC1C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8FD10E1DE;
	Fri, 17 Jan 2025 07:24:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2B310E1DE;
 Fri, 17 Jan 2025 07:24:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Extended_Wake_Timeout_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 07:24:45 -0000
Message-ID: <173709868577.588873.2845428494387196528@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117054850.1189650-1-suraj.kandpal@intel.com>
In-Reply-To: <20250117054850.1189650-1-suraj.kandpal@intel.com>
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

Series: Extended Wake Timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/142516/
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
commit 97e62c7da474a95783deb6465825ba879a1d2967
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jan 17 11:18:50 2025 +0530

    drm/i915/lttpr: Enable Extended Wake Timeout
    
    Usually retimers take around 30 to 40ms to exit all devices from
    sleep state. Extended wake timeout request helps to give additional
    time by reading the DPCD register through which sink requests the
    minimal amount of time required to wake the sink up.
    Source  device shall keep retying  the AUX tansaction till the extended
    timeout that is being granted for LTTPRs from the sink device
    
    --v2
    -Grant the requested time only if greater than 1ms [Arun]
    -Reframe commit message [Arun]
    
    Spec: DP v2.1 Section 3.6.12.3
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch d8c883b9b7702b39eb913a72fd7158ad9a6ea11f drm-intel
629092d488b2 drm/dp: Add the DPCD register required for Extended wake timeout
97e62c7da474 drm/i915/lttpr: Enable Extended Wake Timeout


