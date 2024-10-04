Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A9CFA74C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 06:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A32810E84C;
	Fri,  4 Oct 2024 06:52:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E510410E84C;
 Fri,  4 Oct 2024 06:52:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22platform/x86=3A?=
 =?utf-8?q?intel/pmc=3A_Enable_the_ACPI_PM_Timer_to_be_turned_off_when_suspe?=
 =?utf-8?q?nded=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Oct 2024 06:52:42 -0000
Message-ID: <172802476293.1172550.18233829081194950242@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004064500.1312177-1-luciano.coelho@intel.com>
In-Reply-To: <20241004064500.1312177-1-luciano.coelho@intel.com>
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

Series: Revert "platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended" (rev2)
URL   : https://patchwork.freedesktop.org/series/139499/
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
commit 6ad0d849467456777d055e8405ada6548ab1bf79
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Fri Oct 4 09:45:00 2024 +0300

    Revert "platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended"
    
    This reverts commit e86c8186d03a6ba018e881ed45f0962ad553e861.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch e49bca39c5ea0aacee47de7c70983fb254826245 drm-intel
6ad0d8494674 Revert "platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended"


