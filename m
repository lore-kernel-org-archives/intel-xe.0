Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95758C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 10:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA6210E262;
	Fri, 14 Jun 2024 10:33:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68AC10E262;
 Fri, 14 Jun 2024 10:33:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_fixed_CCS_m?=
 =?utf-8?q?ode_when_running_in_SR-IOV_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 10:33:20 -0000
Message-ID: <171836120068.77190.179476019657294790@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614101415.2208-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240614101415.2208-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Use fixed CCS mode when running in SR-IOV mode (rev2)
URL   : https://patchwork.freedesktop.org/series/134824/
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
commit f4f8bf13a2fe62e98c3a56c160ddc44f88221de3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jun 14 12:14:15 2024 +0200

    drm/xe: Use fixed CCS mode when running in SR-IOV mode
    
    We don't support changing CCS mode when running in SR-IOV mode yet.
    When running as a PF driver just apply default ccs_mode=1 that VF
    drivers will assume as already applied and fixed.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9e00ec95f823e394044b8d9b5cdadd2c71714d91 drm-intel
f4f8bf13a2fe drm/xe: Use fixed CCS mode when running in SR-IOV mode


