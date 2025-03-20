Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94CCC36000
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB9110E6C6;
	Thu, 20 Mar 2025 21:12:42 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23EE10E6D6;
 Thu, 20 Mar 2025 21:12:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_debugfs_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 21:12:40 -0000
Message-ID: <174250516086.61048.5444533328967753061@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250320210738.1733-1-michal.wajdeczko@intel.com>
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

Series: VF: debugfs fixes
URL   : https://patchwork.freedesktop.org/series/146561/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a257966ab6de7d5d07ca5aa9396e6266e649e7e9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Mar 20 22:07:38 2025 +0100

    drm/xe/vf: Don't expose privileged GT debugfs files if VF
    
    Some of the debugfs files require access to the registers that are
    not accessible to the VFs. Don't expose those files on VF drivers.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
+ /mt/dim checkpatch 2695de3e236e7acf43a2cf431e31635585873fc4 drm-intel
c2bf179d224e drm/xe/guc: Refactor GuC debugfs initialization
08c8f3cbefa8 drm/xe/guc: Don't expose GuC privileged debugfs files if VF
a257966ab6de drm/xe/vf: Don't expose privileged GT debugfs files if VF


