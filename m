Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00307C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 10:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011310E33B;
	Mon,  4 Dec 2023 10:59:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9320010E33B;
 Mon,  4 Dec 2023 10:59:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8717FAADE1;
 Mon,  4 Dec 2023 10:59:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 04 Dec 2023 10:59:14 -0000
Message-ID: <170168755455.20594.16442226168034508866@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231204105126.34751-2-matthew.auld@intel.com>
In-Reply-To: <20231204105126.34751-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_add_some_debug_info_for_d3cold?=
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

Series: drm/xe: add some debug info for d3cold
URL   : https://patchwork.freedesktop.org/series/127284/
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
commit e740bbf80e3f6dd0fcacdb2a8a4f536f3749b018
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Dec 4 10:51:27 2023 +0000

    drm/xe: add some debug info for d3cold
    
    From the CI logs we want to easily know if the machine is capable and
    allowed to enter d3cold, and can therefore potentially trigger the
    d3cold RPM suspend and resume path.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 813b2afb0faa8df81cfb8fe25713bd4839484170 drm-intel
e740bbf80 drm/xe: add some debug info for d3cold


