Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D165C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4305D10E07D;
	Tue, 25 Jun 2024 19:50:31 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17A310E07D;
 Tue, 25 Jun 2024 19:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PF=3A_Trigger_explicit_FL?=
 =?utf-8?q?R_while_disabling_VFs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 19:50:29 -0000
Message-ID: <171934502991.157680.16169229344139619285@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625194546.1301-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240625194546.1301-1-michal.wajdeczko@intel.com>
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

Series: PF: Trigger explicit FLR while disabling VFs
URL   : https://patchwork.freedesktop.org/series/135380/
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
commit 7ced8a827ef5bdf12ec0359a7c945bb446f60407
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 25 21:45:46 2024 +0200

    drm/xe/pf: Trigger explicit FLR while disabling VFs
    
    We attempt to unprovision all VFs GuC when disabling them, but
    GuC may reject such request if the target VF was previously active
    but VF driver didn't unload with explicit VF reset H2G action or
    the VMM has not started the VF FLR.
    
    To avoid mismatches between configs maintained the PF and GuC,
    trigger an explicit FLR sequences just before releasing resources.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch edccdf441f1e061f81e0d1d172aa0f37511bbe4d drm-intel
7ced8a827ef5 drm/xe/pf: Trigger explicit FLR while disabling VFs


