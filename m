Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757AAE77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 10:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B4310E60B;
	Mon,  6 Jan 2025 10:32:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE2710E60B;
 Mon,  6 Jan 2025 10:32:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Adjus?=
 =?utf-8?q?t_Added_Wake_Time_with_PKG=5FC=5FLATENCY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 10:32:18 -0000
Message-ID: <173615953859.133956.6733062905318190644@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106094408.1011063-1-animesh.manna@intel.com>
In-Reply-To: <20250106094408.1011063-1-animesh.manna@intel.com>
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

Series: drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY (rev2)
URL   : https://patchwork.freedesktop.org/series/142276/
State : warning

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
commit c8c35652066e04741d897bf9d2cfea9fb001728c
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Jan 6 15:14:08 2025 +0530

    drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY
    
    Increase the PKG_C_LATENCY Pkg C Latency field by the added wake time.
    
    v1: Initial version.
    v2: Rebase and cosmetic changes.
    v3:
    - Place latency adjustment early to accomodate round-up. [Suraj]
    - Modify commit description and cosmetic change. [Suraj]
    
    WA: 22020432604
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch f06efdfad9d0e9f5cb74404ac98e1a5b3b246567 drm-intel
c8c35652066e drm/i915/display: Adjust Added Wake Time with PKG_C_LATENCY
-:11: WARNING:TYPO_SPELLING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#11: 
- Place latency adjustment early to accomodate round-up. [Suraj]
                                    ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


