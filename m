Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E561C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 09:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1DD10E90A;
	Thu, 16 Jan 2025 09:19:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C897D10E90C;
 Thu, 16 Jan 2025 09:19:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_and_refacto?=
 =?utf-8?q?r_workarounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jan 2025 09:19:20 -0000
Message-ID: <173701916081.215065.4882632113330216338@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
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

Series: drm/xe: Add and refactor workarounds
URL   : https://patchwork.freedesktop.org/series/143594/
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
commit 1ff3a750e72a59f7e32427d067f002b76f13d1ec
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Thu Jan 16 14:40:04 2025 +0530

    drm/xe/oa: Refactor Wa_18013179988 and Wa_14015568240
    
    Refactor Wa_18013179988 and Wa_14015568240, to use the cleaner and
    newer workaround-check implementation, and drop the use of the platform
    based switch selection.
    
    While at it, fix the lineage number for the MTL.
    
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch 4cea1f90028925afcf1a0f8a0ef301f90349688c drm-intel
abf1c87937e9 drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
1ff3a750e72a drm/xe/oa: Refactor Wa_18013179988 and Wa_14015568240


