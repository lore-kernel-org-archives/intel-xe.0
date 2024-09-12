Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6806EEEE266
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F3710EAF7;
	Thu, 12 Sep 2024 21:50:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E75210EAF7;
 Thu, 12 Sep 2024 21:50:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Restore_pci_sta?=
 =?utf-8?q?te_upon_resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 21:50:57 -0000
Message-ID: <172617785738.993884.11003639260404739965@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912214507.456897-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240912214507.456897-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Restore pci state upon resume (rev2)
URL   : https://patchwork.freedesktop.org/series/138607/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5d25156856e0fc16c7dd96d614d2a5179e17c877
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Sep 12 17:45:07 2024 -0400

    drm/xe: Restore pci state upon resume
    
    The pci state was saved, but not restored. Restore
    right after the power state transition request like
    every other driver.
    
    v2: Use right fixes tag, since this was there initialy, but
        accidentally removed.
    
    Fixes: f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e55e4cc47de4150012eec3e54b6d710967d66510 drm-intel
5d25156856e0 drm/xe: Restore pci state upon resume


