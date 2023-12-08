Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B0C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 03:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2678610E9C0;
	Fri,  8 Dec 2023 03:23:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F76610E9C0;
 Fri,  8 Dec 2023 03:23:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3AB6EACC20;
 Fri,  8 Dec 2023 03:23:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_!fixup=3A_drm/xe/gsc=3A_G?=
 =?utf-8?q?SC_FW_load?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Fri, 08 Dec 2023 03:23:50 -0000
Message-ID: <170200583023.7327.6349911586162168159@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207205556.495523-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20231207205556.495523-1-mika.kuoppala@linux.intel.com>
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

Series: !fixup: drm/xe/gsc: GSC FW load
URL   : https://patchwork.freedesktop.org/series/127526/
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
commit 6eb540d68b92ef2bce19e543fb8559e436280ab8
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Thu Dec 7 22:55:56 2023 +0200

    !fixup: drm/xe/gsc: GSC FW load
    
    Fix timeout to be in usecs for xe_mmio_wait32
    
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
6eb540d68 !fixup: drm/xe/gsc: GSC FW load


