Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029CAC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9EE10E258;
	Thu, 14 Dec 2023 19:42:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5509410E194;
 Thu, 14 Dec 2023 19:42:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4BD7DA47DF;
 Thu, 14 Dec 2023 19:42:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Trivial_register_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 14 Dec 2023 19:42:16 -0000
Message-ID: <170258293630.19958.10671658900559523195@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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

Series: Trivial register cleanups
URL   : https://patchwork.freedesktop.org/series/127829/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5491d9b3a13191c6b489e1ddd0b33ae043d781fc
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Dec 14 10:47:08 2023 -0800

    drm/xe: Drop some unnecessary header includes
    
    Several files were including register headers that they no longer
    require.  Drop the unnecessary includes to reduce build dependencies.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c drm-intel
13a49d9d4 drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
46d7117e1 drm/xe: Move some per-engine register definitions to the engine header
866447f04 drm/xe: Fix whitespace in register definitions
ae446c6a6 drm/xe: Move engine base offsets to engine register header
c01b5300f drm/xe: Move GSC HECI base offsets out of register header
af401dcb2 drm/xe: Define interrupt vector bits with the interrupt registers
34c155a54 drm/xe: Re-sort GT register header
5491d9b3a drm/xe: Drop some unnecessary header includes


