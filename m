Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6792C4829E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 00:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995F110E3A9;
	Tue, 13 Feb 2024 00:29:15 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C8E10E4EC;
 Tue, 13 Feb 2024 00:29:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fixup!_drm/xe=3A_Add_PVC?=
 =?utf-8?q?=27s_PCI_device_IDs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 00:29:13 -0000
Message-ID: <170778415366.1183349.7943446808442422343@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212230024.973104-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240212230024.973104-1-radhakrishna.sripada@intel.com>
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

Series: fixup! drm/xe: Add PVC's PCI device IDs
URL   : https://patchwork.freedesktop.org/series/129802/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit da532d2e67f1e092e5248ba900dae2c240a08709
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Mon Feb 12 15:00:24 2024 -0800

    fixup! drm/xe: Add PVC's PCI device IDs
    
    A new PVC vector only SKU got introduced. Add the new PCI id
    to the list of PVC PCI id's.
    
    v2: Make it a fixup comment(MattR)
    
    Bspec: 44484
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch bd80d96780e6c0ce95fa6e69b2616388a1397ce9 drm-intel
da532d2e6 fixup! drm/xe: Add PVC's PCI device IDs


