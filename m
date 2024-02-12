Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D7FC4829E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 21:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116B10E170;
	Mon, 12 Feb 2024 21:08:57 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B140310E170;
 Mon, 12 Feb 2024 21:08:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_new_PVC_PCI?=
 =?utf-8?q?_ID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 21:08:56 -0000
Message-ID: <170777213672.1183349.16488088328527738648@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212185125.457721-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240212185125.457721-1-radhakrishna.sripada@intel.com>
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

Series: drm/xe: Add new PVC PCI ID
URL   : https://patchwork.freedesktop.org/series/129791/
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
commit b98af503d60bb8f5cbc27d71154b6c3da7d0ca1c
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Mon Feb 12 10:51:25 2024 -0800

    drm/xe: Add new PVC PCI ID
    
    A new PVC vector only SKU got introduced. Add the new PCI id
    to the list of PVC PCI id's.
    
    Bspec: 44484
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch 7cb11b0ad445551ebf972af0fab5bd07202fc3b0 drm-intel
b98af503d drm/xe: Add new PVC PCI ID


