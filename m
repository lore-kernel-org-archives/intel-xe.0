Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E77EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 11:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B640710E012;
	Thu, 17 Aug 2023 11:30:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F0B410E012;
 Thu, 17 Aug 2023 11:30:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7BF44AADD5;
 Thu, 17 Aug 2023 11:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 17 Aug 2023 11:30:17 -0000
Message-ID: <169227181750.12432.15130855282262365955@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Add_Wa=5F16017236439_=28rev2=29?=
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

Series: drm/xe/pvc: Add Wa_16017236439 (rev2)
URL   : https://patchwork.freedesktop.org/series/121028/
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
commit 73c95dbc4a2d8172f4962e4ee38b6b58ef397f1c
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Thu Aug 17 04:03:52 2023 -0700

    drm/xe/pvc: Use fast copy engines as migrate engine on PVC
    
    Some copy hardware engine instances are faster than others on PVC.
    Use a virtual engine of these plus the reserved instance for the migrate
    engine on PVC. The idea being if a fast instance is available it will be
    used and the throughput of kernel copies, clears, and pagefault
    servicing will be higher.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch c605cfb9a29a5425541053b45efddbe9751cbad3 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


