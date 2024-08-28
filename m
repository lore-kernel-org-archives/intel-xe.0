Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C00BC636E5
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 17:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9910E0B6;
	Wed, 28 Aug 2024 17:20:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3D10E0B6;
 Wed, 28 Aug 2024 17:20:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_Drop_force?=
 =?utf-8?q?=5Fprobe_requirement_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 17:20:58 -0000
Message-ID: <172486565814.828349.9234296607542461695@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
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

Series: drm/xe/bmg: Drop force_probe requirement (rev2)
URL   : https://patchwork.freedesktop.org/series/137885/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2ba29003ef142923f33ff89158ebb2562dbb2c8d
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Wed Aug 28 13:51:52 2024 +0530

    drm/xe/bmg: Drop force_probe requirement
    
    Battlemage platform is sufficiently tested and found stable. CI is also
    pretty stable.
    Removing the force_probe requirement to enable the platform support by
    default.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch da0e5d5784bc90f24d02e5944051f2e8a3f53b56 drm-intel
2ba29003ef14 drm/xe/bmg: Drop force_probe requirement


