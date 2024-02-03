Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A3DC4828D
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95F710E5F5;
	Sat,  3 Feb 2024 06:22:26 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BA610E5F5;
 Sat,  3 Feb 2024 06:22:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BR?=
 =?utf-8?q?FC=2C1/2=5D_drm/xe=3A_Add_has=5Fwmpt_GT_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 03 Feb 2024 06:22:25 -0000
Message-ID: <170694134572.953177.6143329817028628389@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240203060534.6839-1-nirmoy.das@intel.com>
In-Reply-To: <20240203060534.6839-1-nirmoy.das@intel.com>
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

Series: series starting with [RFC,1/2] drm/xe: Add has_wmpt GT info
URL   : https://patchwork.freedesktop.org/series/129501/
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
commit fa40f7337a5d01c05e051422f64da6f2613b8efc
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Sat Feb 3 07:05:34 2024 +0100

    drm/xe/uapi: Expose wmtp as engine capability
    
    Add capabilities to engine struct which can be used to
    expose various capabilities of each engines.
    
    Add wmtp as engine capability which is retrieve from
    GT info.
    
    Take a field from the reserved for that purpose.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch dd154a5bf55d5f33a8655bdf5247b94a771160e3 drm-intel
316a00499 drm/xe: Add has_wmpt GT info
fa40f7337 drm/xe/uapi: Expose wmtp as engine capability


