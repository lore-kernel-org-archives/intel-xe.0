Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC53C54FB9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 12:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFD510E268;
	Tue, 21 Nov 2023 12:24:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7627C10E268;
 Tue, 21 Nov 2023 12:24:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 740C9AADD7;
 Tue, 21 Nov 2023 12:24:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 21 Nov 2023 12:24:43 -0000
Message-ID: <170056948347.30158.13562754798959460387@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120221904.695630-1-lucas.demarchi@intel.com>
In-Reply-To: <20231120221904.695630-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_modpost_warning_on_kunit_modules_=28rev2=29?=
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

Series: drm/xe: Fix modpost warning on kunit modules (rev2)
URL   : https://patchwork.freedesktop.org/series/126675/
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
commit bef6a8ca7235470d3516833af61e78c45f2d07b9
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Nov 20 14:19:04 2023 -0800

    drm/xe: Fix modpost warning on kunit modules
    
    When built with W=1, the following warnings show up on modpost:
    
              MODPOST drivers/gpu/drm/xe/Module.symvers
            WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_bo_test.o
            WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
            WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_migrate_test.o
            WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_pci_test.o
            WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_rtp_test.o
            WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_wa_test.o
    
    Add the module description for each of these to fix the warning.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c9574aef8b5eb68398936c2c14fe4a54fa4e5849 drm-intel
bef6a8ca7 drm/xe: Fix modpost warning on kunit modules


