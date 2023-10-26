Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7859CC25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 09:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2010E789;
	Thu, 26 Oct 2023 09:38:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD5D910E789;
 Thu, 26 Oct 2023 09:38:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DC0FFA02F0;
 Thu, 26 Oct 2023 09:38:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Date: Thu, 26 Oct 2023 09:38:38 -0000
Message-ID: <169831311889.20469.12031564205036327386@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025161201.1031963-1-badal.nilawar@intel.com>
In-Reply-To: <20231025161201.1031963-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Extend_rpX_values_extraction_for_future_platforms_=28re?=
 =?utf-8?b?djIp?=
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

Series: drm/xe: Extend rpX values extraction for future platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/125587/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c3f08207e4b774d7e956d9d269a82dac5f26efec
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Oct 25 21:42:01 2023 +0530

    drm/xe: Extend rpX values extraction for future platforms
    
    In existing code flow for future platforms i.e. >1270, the rpX
    (rp0,rpn and rpe) fused values are read from gen 6 registers.
    Which is not correct. Unless specified gen 1270 regs should be valid
    for gen 1270+ platforms as well.
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df drm-intel
c3f08207e drm/xe: Extend rpX values extraction for future platforms


