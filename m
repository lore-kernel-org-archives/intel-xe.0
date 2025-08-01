Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4193EC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 06:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D505010E7FC;
	Fri,  1 Aug 2025 06:36:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E810E2F4;
 Fri,  1 Aug 2025 06:36:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_MEI_GSC_interface_av?=
 =?utf-8?q?ailable_if_i915_isn=27t_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Aug 2025 06:36:12 -0000
Message-ID: <175403017271.204281.6019345058621813880@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250801060032.2416-1-Simon.Richter@hogyros.de>
In-Reply-To: <20250801060032.2416-1-Simon.Richter@hogyros.de>
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

Series: Make MEI GSC interface available if i915 isn't (rev2)
URL   : https://patchwork.freedesktop.org/series/151618/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 46c8cc2baf93cc56e41e2f9a8040a21b97a1b797
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Fri Aug 1 15:00:16 2025 +0900

    misc/mei: Xe graphics also has IME GSC interface
    
    This driver is useful if at least one DRM driver registers an auxiliary device
    for the ME interface. With the addition of Xe, this is no longer just i915.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
+ /mt/dim checkpatch 68a99106069be8ab52030c61215da008b2f6dbd2 drm-intel
56137dfa812a misc/mei: Allow building Intel ME interface on non-x86
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Intel dGPUs can exist on other platforms as well, and contain an Intel ME GSC

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
bcb3c4c9acfa misc/mei: Decouple ME interfaces from GPU drivers
f9defd868dce misc/mei: Allow building standalone for compile testing
46c8cc2baf93 misc/mei: Xe graphics also has IME GSC interface
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
This driver is useful if at least one DRM driver registers an auxiliary device

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


