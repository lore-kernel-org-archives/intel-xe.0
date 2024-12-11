Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12609E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AA910EBE3;
	Wed, 11 Dec 2024 18:32:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E6010E40C;
 Wed, 11 Dec 2024 18:32:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Program?=
 =?utf-8?q?_double_buffered_LUT_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 18:32:38 -0000
Message-ID: <173394195835.1273498.15840676675604724494@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211181830.3348155-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20241211181830.3348155-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/xe/display: Program double buffered LUT registers
URL   : https://patchwork.freedesktop.org/series/142436/
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
commit 7ea6c6e988598e4c2de3ead4fa27851bef94d756
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Wed Dec 11 23:48:30 2024 +0530

    drm/xe/display: Program double buffered LUT registers
    
    From PTL, LUT registers are made double buffered. This helps us
    to program them in the active region without any concern of tearing.
    This particulary helps in case of displays with high refresh rates
    where vblank periods are shorter.
    
    This patch tries to incorporates LUT programming to the noarm commit path
    for PTL without making significant changes to the color callback framework
    itself. DSB0 is still used to program to non LUT color registers
    (for ex. CTM). However, it does not chain DSB1 to program the LUT
    registers. Instead, it is programmed through intel_pre_update_crtc path.
    
    LUT programming is also disabled in the vblank worker.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch f4246a72ae40a2ac6dfd680e3e4bb1b6895081c3 drm-intel
7ea6c6e98859 drm/xe/display: Program double buffered LUT registers


