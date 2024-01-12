Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9181C47077
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 00:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72A010E998;
	Fri, 12 Jan 2024 00:37:06 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DFF10E998;
 Fri, 12 Jan 2024 00:37:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/migrate=3A_Cap_PTE?=
 =?utf-8?q?s_written_by_MI=5FSTORE=5FDATA=5FIMM_to_510?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 12 Jan 2024 00:37:05 -0000
Message-ID: <170501982521.331655.5067712560802120942@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111220238.1467572-2-matthew.d.roper@intel.com>
In-Reply-To: <20240111220238.1467572-2-matthew.d.roper@intel.com>
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

Series: drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
URL   : https://patchwork.freedesktop.org/series/128694/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dbdf749ec8ccecfeb9609489866f99d6b61d3eea
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Jan 11 14:02:38 2024 -0800

    drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
    
    Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is
    considered the largest legal value accepted.  Since that instruction
    field is always encoded in (val-2) format, this translates to 0x400
    dwords for the true maximum length of the instruction.  Subtracting the
    instruction header (1 dword) and address (2 dwords), that leaves 0x3FD
    dwords (i.e., 0x1FE qwords) for PTE values.
    
    Bspec: 60246, 45753
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 drm-intel
dbdf749ec drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510


