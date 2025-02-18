Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393EDC021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 16:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9210E3EA;
	Tue, 18 Feb 2025 16:02:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B49410E3EA;
 Tue, 18 Feb 2025 16:02:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/kunit=3A_Test_WAs_?=
 =?utf-8?q?for_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 16:02:15 -0000
Message-ID: <173989453550.3604400.14533780590524824451@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218151057.50478-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250218151057.50478-1-matthew.s.atwood@intel.com>
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

Series: drm/xe/kunit: Test WAs for PTL
URL   : https://patchwork.freedesktop.org/series/145029/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a9f00ad26c6dbc73791c6dcac7e8b6174be48b5d
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Tue Feb 18 07:10:57 2025 -0800

    drm/xe/kunit: Test WAs for PTL
    
    Add PTL to make sure the workarounds do not conflict. This matches the
    machines with PTL for CI:
    
            PANTHERLAKE b0b0:0000 dgfx:0
                    gfx:Xe2_LPG / Xe2_HPG / Xe3_LPG (30.00)
                    media: Xe2_LPM / Xe2_HPM / Xe3_LPM (30.00)
                    display:yes dma_m_s:46 tc:1, gscfi:0 cscfi:0
            Stepping = (G:A0, M:A0, B:**)
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4587c05996666a92af63f86ba410bae1dc940794 drm-intel
a9f00ad26c6d drm/xe/kunit: Test WAs for PTL


