Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85851CA1001
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 20:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5CB10E4FE;
	Tue,  5 Sep 2023 20:05:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C25C510E4FE;
 Tue,  5 Sep 2023 20:05:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AE090A3ECB;
 Tue,  5 Sep 2023 20:05:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 05 Sep 2023 20:05:32 -0000
Message-ID: <169394433270.19169.4489664287666565202@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905194942.7-1-francois.dugast@intel.com>
In-Reply-To: <20230905194942.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Us?=
 =?utf-8?q?e_acpi=5Ftarget=5Fsystem=5Fstate_only_if_ACPI=5FSLEEP_is_enable?=
 =?utf-8?q?d?=
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

Series: Use acpi_target_system_state only if ACPI_SLEEP is enabled
URL   : https://patchwork.freedesktop.org/series/123305/
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
commit c733f83ce7f2fc91a043b56b8b27ccaf5bc336d2
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Sep 5 19:49:42 2023 +0000

    drm/xe/display: Use acpi_target_system_state only if ACPI_SLEEP is enabled
    
    This fixes the build error below with CONFIG_ACPI_SLEEP=n:
    
            drivers/gpu/drm/xe/xe_display.c:334:23: error: implicit declaration of function ‘acpi_target_system_state’; did you mean ‘acpi_get_system_info’? [-Werror=implicit-function-declaration]
              334 |         bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 7ec520d3a63b6e95174329108cd44359a70907ba drm-intel
c733f83ce drm/xe/display: Use acpi_target_system_state only if ACPI_SLEEP is enabled


