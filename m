Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C87BC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 07:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0210ECAB;
	Wed, 24 Apr 2024 07:28:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C68010EC42;
 Wed, 24 Apr 2024 07:28:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PF=3A_Clamp_maximum_execu?=
 =?utf-8?q?tion_quantum_to_100s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 07:28:38 -0000
Message-ID: <171394371851.1610961.1758435376301886881@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419123543.270-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240419123543.270-1-michal.wajdeczko@intel.com>
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

Series: PF: Clamp maximum execution quantum to 100s
URL   : https://patchwork.freedesktop.org/series/132642/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 66155377cd5aa087da3b6905a21593fd7012f3c7
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 19 14:35:43 2024 +0200

    drm/xe/pf: Clamp maximum execution quantum to 100s
    
    GuC is silently clamping values of the execution quantum and
    preemption timeout KLVs to 100s. Perform explicit clamping on the
    driver side as later there is no way to read back values used by
    the firmware and we shouldn't mislead the user about actual values
    being used when we print them in dmesg or debugfs.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 4e2a877e497070dbd2c6a62c05e55a13bfb63f79 drm-intel
95db4620817c drm/xe/guc: Update VF configuration KLVs definitions
66155377cd5a drm/xe/pf: Clamp maximum execution quantum to 100s


