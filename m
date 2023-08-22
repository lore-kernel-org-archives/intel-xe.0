Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A45EE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 13:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A552E10E36D;
	Tue, 22 Aug 2023 13:49:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6907810E36D;
 Tue, 22 Aug 2023 13:49:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6567FAADF0;
 Tue, 22 Aug 2023 13:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Date: Tue, 22 Aug 2023 13:49:47 -0000
Message-ID: <169271218741.20553.7060489103806550661@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_throttle_reasons_sysfs?=
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

Series: Add throttle reasons sysfs
URL   : https://patchwork.freedesktop.org/series/122723/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 101fd4e85d10adda13e20ba6b604e583a0f9542e
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Tue Aug 22 10:28:25 2023 +0530

    drm/xe: Add throttle reason sysfs attributes
    
    Add throttle reasons sysfs interface under device/../gt#/
    Currently there is one overall status and eight reasons
    attributes.
    
    The new sysfs structure will have the below layout
    
    device/<dev/gt
                 ├── gt0
                 │   └── throttle
                 │       ├── <throttle_reasons>
                 │
                 │
                 ├── gtN
                 │   └── throttle
                 │       ├── <throttle_reasons>
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 779f35314dba1441d29f4cfd510e7beb73c5f615 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


