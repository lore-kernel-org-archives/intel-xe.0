Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05033C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 05:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6831123C1;
	Wed, 29 May 2024 05:12:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05419113095;
 Wed, 29 May 2024 05:12:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_HWMON_support_for_BMG?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 05:12:33 -0000
Message-ID: <171695955302.2232184.15265162721991854389@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529050758.442056-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240529050758.442056-1-balasubramani.vivekanandan@intel.com>
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

Series: Add HWMON support for BMG (rev2)
URL   : https://patchwork.freedesktop.org/series/133970/
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
commit e7aedd97ef060cfceffd5fb6eda0ecb78ace34a5
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed May 29 10:37:58 2024 +0530

    drm/xe/hwmon: Expose card power and energy attributes of BMG
    
    In BMG there are separate registers for card/platform power and
    energy.
    These are exposed through channel 0 i.e power_1/energy1_xxx.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Link: https://lore.kernel.org/r/20240523144351.4040131-3-balasubramani.vivekanandan@intel.com
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch c148f6df1b6206b3f0279c3f951420b18c8249f8 drm-intel
90406be356ca drm/xe/hwmon: Add HWMON support for BMG
e7aedd97ef06 drm/xe/hwmon: Expose card power and energy attributes of BMG


