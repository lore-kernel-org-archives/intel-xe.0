Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C5E7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 20:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D2710E42E;
	Wed, 18 Dec 2024 20:28:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915E110E42E;
 Wed, 18 Dec 2024 20:28:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Display_Global_Histogram_?=
 =?utf-8?q?=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 20:28:36 -0000
Message-ID: <173455371659.164096.13614531633789966101@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
In-Reply-To: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
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

Series: Display Global Histogram (rev7)
URL   : https://patchwork.freedesktop.org/series/138867/
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
commit 8cfed529f96ca89439522480294ec38013b02bed
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Dec 18 20:22:07 2024 +0530

    drm/crtc: Expose API to create drm crtc property for IET LUT
    
    Add drm-crtc property for IET 1DLUT and for the properties added add
    corresponding get/set_property.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch d8f0c44e2ed948dcc45d04a0dfa83612995a702b drm-intel
7c9c1f0cdab3 drm: Define histogram structures exposed to user
e89e9bcc33ff drm: Define ImageEnhancemenT LUT structures exposed to user
a9cb814de48e drm/crtc: Expose API to create drm crtc property for histogram
8cfed529f96c drm/crtc: Expose API to create drm crtc property for IET LUT


