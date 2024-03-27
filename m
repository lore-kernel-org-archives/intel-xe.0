Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE8C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 18:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6E10EE57;
	Wed, 27 Mar 2024 18:33:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9AD10E751;
 Wed, 27 Mar 2024 18:33:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_proper_detection_of_t?=
 =?utf-8?q?he_SR-IOV_VF_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Mar 2024 18:33:30 -0000
Message-ID: <171156441057.1060333.9561889574499313707@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240327182740.407-1-michal.wajdeczko@intel.com>
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

Series: Add proper detection of the SR-IOV VF mode
URL   : https://patchwork.freedesktop.org/series/131705/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 72cc0251e176199f20b97da115634b2fcbff8ab2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Mar 27 19:27:40 2024 +0100

    drm/xe/vf: Add proper detection of the SR-IOV VF mode
    
    SR-IOV VF mode detection is based on testing VF capability bit on
    the register that is accessible from both the PF and enabled VFs.
    
    Bspec: 49904, 53227
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 942f9f7739422dcb10052c56d5b518123f2b7406 drm-intel
ad45cfc3a5e9 drm/xe: Separate pure MMIO init from VRAM checkout
39674d847993 drm/xe: Move SR-IOV probe to xe_device_probe_early()
72cc0251e176 drm/xe/vf: Add proper detection of the SR-IOV VF mode


