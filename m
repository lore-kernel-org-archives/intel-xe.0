Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EC7C54ED1
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 11:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ACA10E45F;
	Wed, 28 Aug 2024 11:49:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E550C10E45F;
 Wed, 28 Aug 2024 11:49:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_memirq_infra_changes_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 11:49:22 -0000
Message-ID: <172484576293.810200.5405209378429090434@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828091841.1840086-1-ilia.levi@intel.com>
In-Reply-To: <20240828091841.1840086-1-ilia.levi@intel.com>
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

Series: memirq infra changes (rev3)
URL   : https://patchwork.freedesktop.org/series/137643/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fedbd4415a1d30a287eb310c8b947f055c7b3f3a
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Wed Aug 28 12:18:41 2024 +0300

    drm/xe: separate memirq reset/postinstall from vf
    
    Up until now only VF used Memory Based Interrupts (memirq).
    Moving reset/postinstall flows out of VF to cater for other usages.
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 drm-intel
08a4eb157727 drm/xe: move memirq out of vf
295d053f9a78 drm/xe: memirq infra changes for msix
0425c1acb33b drm/xe: add memirq offsets for engine instance 0 to hw engine properties
5c9eb1e95e75 drm/xe: memirq handler changes
fedbd4415a1d drm/xe: separate memirq reset/postinstall from vf


