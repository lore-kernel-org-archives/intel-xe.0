Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EBFCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 02:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B5510E588;
	Fri, 13 Oct 2023 02:54:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A28510E588;
 Fri, 13 Oct 2023 02:54:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9A0F5A02F0;
 Fri, 13 Oct 2023 02:54:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Date: Fri, 13 Oct 2023 02:54:01 -0000
Message-ID: <169716564162.31157.11167855836356057231@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013025321.2972772-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231013025321.2972772-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/pmu=3A_Enable_PMU_interface?=
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

Series: fixup! drm/xe/pmu: Enable PMU interface
URL   : https://patchwork.freedesktop.org/series/125084/
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
commit 6fc3c88a0aaff2a68442f986928ceb6c4e489f7f
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Fri Oct 13 08:23:21 2023 +0530

    fixup! drm/xe/pmu: Enable PMU interface
    
    Drop interrupt event from PMU as that is not useful and not being used
    by any UMD.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
6fc3c88a0 fixup! drm/xe/pmu: Enable PMU interface


