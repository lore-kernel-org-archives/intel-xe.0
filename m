Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBB3E77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 01:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3110E4C7;
	Fri, 20 Dec 2024 01:50:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D50910E4C7;
 Fri, 20 Dec 2024 01:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/dg1=3A_Fix_power_g?=
 =?utf-8?q?ate_sequence=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 01:50:14 -0000
Message-ID: <173465941444.618726.7144086468940447730@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219235536.454270-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241219235536.454270-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/dg1: Fix power gate sequence.
URL   : https://patchwork.freedesktop.org/series/142861/
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
commit 6dfd0378ca96fae943e6ad4eb6eb4d0441c219b3
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Dec 19 18:55:36 2024 -0500

    drm/xe/dg1: Fix power gate sequence.
    
    sub-pipe PG is not present on DG1. Setting these bits can disable
    other power gates and cause GPU hangs on video playbacks.
    
    VLK: 16314, 4304
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13381
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 764b5dbd7c2666300f18682978e43c57d8607f7b drm-intel
6dfd0378ca96 drm/xe/dg1: Fix power gate sequence.


