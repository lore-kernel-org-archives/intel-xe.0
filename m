Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A020C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 21:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229CE10FEC7;
	Fri, 26 Jan 2024 21:34:41 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5910FEC2;
 Fri, 26 Jan 2024 21:34:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_ccs_compressed_fra?=
 =?utf-8?q?mebuffers_on_Xe2_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Fri, 26 Jan 2024 21:34:39 -0000
Message-ID: <170630487992.764780.14725746806846029170@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126210807.320671-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240126210807.320671-1-juhapekka.heikkila@gmail.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Enable ccs compressed framebuffers on Xe2 (rev3)
URL   : https://patchwork.freedesktop.org/series/128946/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit efa9a62d065cbe3ade7ee44ea1154f112f644f7d
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Fri Jan 26 23:08:07 2024 +0200

    drm/i915/display: On Xe2 always enable decompression with tile4
    
    With Xe2 always treat tile4 as if it was using flat ccs.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch eeedb1b4360b100e4fa15a9c5c968a8f5a8de7ed drm-intel
9ca525d64 drm/xe/pat: annotate pat index table with compression information
84863e549 drm/xe: add bind time pat index to xe_bo structure
e143cc399 drm/xe: store bind time pat index to xe_bo
4ee1a16ca drm/xe/xe2: Limit ccs framebuffers to tile4 only
efa9a62d0 drm/i915/display: On Xe2 always enable decompression with tile4


