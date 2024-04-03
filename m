Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51900CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 16:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1865112C99;
	Wed,  3 Apr 2024 16:20:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7393112C99;
 Wed,  3 Apr 2024 16:20:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Introduce_a_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 16:20:48 -0000
Message-ID: <171216124881.1172471.16058286281809605960@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240403150732.102678-1-rodrigo.vivi@intel.com>
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

Series: Introduce a wedged state
URL   : https://patchwork.freedesktop.org/series/131998/
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
commit 4dd54d7935773b2a4ff1a938b3869adc96875182
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Apr 3 11:07:32 2024 -0400

    drm/xe: Introduce the wedged_mode debugfs
    
    So, the wedged mode can be selected per device at runtime,
    before the tests or before reproducing the issue.
    
    v2: - s/busted/wedged
        - some locking consistency
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch c8dc2a19ae7157e065d5f0c78bc4d3f83165fdef drm-intel
dba3615ac29e drm/xe: Introduce a simple wedged state
ed345a55b2b3 drm/xe: declare wedged upon GuC load failure
30fcf1374b02 drm/xe: Force wedged state and block GT reset upon any GPU hang
4dd54d793577 drm/xe: Introduce the wedged_mode debugfs


