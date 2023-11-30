Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6008C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 04:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8391510E6AC;
	Thu, 30 Nov 2023 04:35:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4532810E6AC;
 Thu, 30 Nov 2023 04:35:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3CD47AA3D8;
 Thu, 30 Nov 2023 04:35:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 30 Nov 2023 04:35:22 -0000
Message-ID: <170131892224.15643.4247494646232961772@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Change_the_name_of_frequency_sysfs_attributes?=
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

Series: drm/xe: Change the name of frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/127098/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7d1641ee4953fa258062584f2f11a8697e002338
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Thu Nov 30 10:09:14 2023 +0530

    drm/xe: Change the name of frequency sysfs attributes
    
    Switching the names of frequency sysfs attrbutes to align with
    required devfreq changes. The name changes are as below;
    
    -freq_act -> act_freq
    -freq_cur -> cur_freq
    -freq_rpn -> rpn_freq
    -freq_rpe -> rpe_freq
    -freq_rp0 -> rp0_freq
    -freq_min -> min_freq
    -freq_max -> max_freq
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch ff1db4de1e4054052fbf99ef307757fd2bc74df5 drm-intel
7d1641ee4 drm/xe: Change the name of frequency sysfs attributes


