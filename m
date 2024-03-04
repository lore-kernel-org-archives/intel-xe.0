Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4DAC48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 23:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AA10F43F;
	Mon,  4 Mar 2024 23:35:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6E610F43F;
 Mon,  4 Mar 2024 23:35:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Drop_WA_1601567?=
 =?utf-8?q?5438?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Mar 2024 23:35:52 -0000
Message-ID: <170959535226.503981.6492261299248205129@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304233103.1687412-1-lucas.demarchi@intel.com>
In-Reply-To: <20240304233103.1687412-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Drop WA 16015675438
URL   : https://patchwork.freedesktop.org/series/130697/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dd3ffd39db638cf37fc302eabd3f87bea3668c2c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Mar 4 15:31:03 2024 -0800

    drm/xe: Drop WA 16015675438
    
    With dynamic load-balancing disabled on the compute side, there's no
    reason left to enable WA 16015675438. Drop it from both PVC and DG2.
    
    Note that this can be done because now the driver always set a fixed
    partition of EUs during initialization via the ccs_mode configuration.
    
    Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e8bc216572501440efb20e112bb5aa60599f1863 drm-intel
dd3ffd39db63 drm/xe: Drop WA 16015675438


