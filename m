Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1598C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 10:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669DA10E160;
	Mon,  2 Jun 2025 10:39:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8013D10E160;
 Mon,  2 Jun 2025 10:39:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF=3A_Small_updates_aroun?=
 =?utf-8?q?d_GGTT_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 10:39:10 -0000
Message-ID: <174886075051.40237.5392614512314867899@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250602103325.549-1-michal.wajdeczko@intel.com>
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

Series: VF: Small updates around GGTT handling
URL   : https://patchwork.freedesktop.org/series/149730/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78b7106ed742fd0316b7813ca0c713e1e675e301
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jun 2 12:33:25 2025 +0200

    drm/xe/vf: Add sanity check for GGTT configuration
    
    The VF GGTT configuration was prepared by the PF, which should be
    trusted, was obtained from the GuC, which likely already did some
    sanity checks too, but since it's a received data, we should have
    our own sanity checks to detect early any misconfiguration.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch 5a413356a5cf28569f461e1cd07f5fa45fd74888 drm-intel
4aea1805ca5a drm/xe/vf: Introduce helpers to access GGTT configuration
161d15d2ab30 drm/xe/vf: Move tile-related VF functions to separate file
-:355: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#355: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 575 lines checked
78b7106ed742 drm/xe/vf: Add sanity check for GGTT configuration


