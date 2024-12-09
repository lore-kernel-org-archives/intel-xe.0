Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B6CE77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E4010E74C;
	Mon,  9 Dec 2024 14:17:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679BB10E74C;
 Mon,  9 Dec 2024 14:17:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Adjus?=
 =?utf-8?q?t_Added_Wake_Time_with_PKG=5FC=5FLATENCY?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Dec 2024 14:17:12 -0000
Message-ID: <173375383242.490008.7023620528796857269@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209074702.3975702-1-animesh.manna@intel.com>
In-Reply-To: <20241209074702.3975702-1-animesh.manna@intel.com>
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

Series: drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY
URL   : https://patchwork.freedesktop.org/series/142276/
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
commit e3168ee2948bdab4b9d067604013ff1248f074cd
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Dec 9 13:17:02 2024 +0530

    drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY
    
    The PKG_C_LATENCY Added Wake Time field is not working.
    When added wake time is needed, such as for flip queue
    DSB execution, increase the PKG_C_LATENCY Pkg C Latency
    field by the added wake time.
    
    WA: 22020432604
    
    v1: Initial version.
    v2: Rebase and cosmetic changes.
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch c266f2fbb9c0250af17b14788364766adf802a4a drm-intel
e3168ee2948b drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY


