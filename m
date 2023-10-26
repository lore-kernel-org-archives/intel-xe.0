Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220B8C0032E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 00:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BFD10E605;
	Thu, 26 Oct 2023 00:40:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFA1910E605;
 Thu, 26 Oct 2023 00:40:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CEE47AADE1;
 Thu, 26 Oct 2023 00:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 26 Oct 2023 00:40:33 -0000
Message-ID: <169828083384.20471.3285307109046489269@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231023204112.2856331-2-matthew.d.roper@intel.com>
In-Reply-To: <20231023204112.2856331-2-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/mocs=3A_MOCS_registers_are_multicast_on_Xe=5FHP_and_beyond?=
 =?utf-8?q?_=28rev2=29?=
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

Series: drm/xe/mocs: MOCS registers are multicast on Xe_HP and beyond (rev2)
URL   : https://patchwork.freedesktop.org/series/125478/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e737c982f72e33e804e333fd69c504228605d2a
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Oct 23 13:41:13 2023 -0700

    drm/xe/mocs: MOCS registers are multicast on Xe_HP and beyond
    
    The MOCS registers should be written in an MCR-specific manner on Xe_HP
    and beyond to prevent any other driver threads or external firmware from
    putting the hardware into unicast mode while we initialize the MOCS
    table.
    
    Bspec: 66534, 67609, 71185
    Cc: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch bd3d7e8aa312ce25c5797388f753151f024bec02 drm-intel
3e737c982 drm/xe/mocs: MOCS registers are multicast on Xe_HP and beyond


