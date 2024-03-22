Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90CAC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 08:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B65310EC13;
	Fri, 22 Mar 2024 08:29:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334410EC13;
 Fri, 22 Mar 2024 08:29:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/_xe=5Fsync=3A_Chec?=
 =?utf-8?q?k_NULL_before_dereferencing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Mar 2024 08:29:01 -0000
Message-ID: <171109614101.959940.11628710327914298784@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
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

Series: drm/xe/ xe_sync: Check NULL before dereferencing
URL   : https://patchwork.freedesktop.org/series/131471/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36edeb6595fa422c8eca4ecfe8092e9115fbc972
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Thu Dec 7 04:00:27 2023 +0530

    drm/xe/ xe_sync: Check NULL before dereferencing
    
    checking null pointer before dereferencing schedule job
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a drm-intel
36edeb6595fa drm/xe/ xe_sync: Check NULL before dereferencing


