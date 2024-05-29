Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C92C27C44
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 14:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FBE11258D;
	Wed, 29 May 2024 14:33:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6553D10F85A;
 Wed, 29 May 2024 14:33:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/client=3A_Detect_when?=
 =?utf-8?q?_ACPI_lid_is_closed_during_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 14:33:10 -0000
Message-ID: <171699319041.2233681.5226401873586460431@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528210319.1242-1-mario.limonciello@amd.com>
In-Reply-To: <20240528210319.1242-1-mario.limonciello@amd.com>
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

Series: drm/client: Detect when ACPI lid is closed during initialization
URL   : https://patchwork.freedesktop.org/series/134191/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 99536a09cd0b091b812266a20f27234b1e352c07
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Tue May 28 16:03:19 2024 -0500

    drm/client: Detect when ACPI lid is closed during initialization
    
    If the lid on a laptop is closed when eDP connectors are populated
    then it remains enabled when the initial framebuffer configuration
    is built.
    
    When creating the initial framebuffer configuration detect the ACPI
    lid status and if it's closed disable any eDP connectors.
    
    Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
    Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
+ /mt/dim checkpatch da00654c89411daac601fd16ac6c45e48639d334 drm-intel
99536a09cd0b drm/client: Detect when ACPI lid is closed during initialization


