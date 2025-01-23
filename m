Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E94EC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 07:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EB410E0FA;
	Thu, 23 Jan 2025 07:06:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDD810E0FA;
 Thu, 23 Jan 2025 07:06:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Add_W?=
 =?utf-8?q?A=5F14018221282_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 07:06:35 -0000
Message-ID: <173761599570.3420134.9854348392792489241@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241226060632.213790-1-nemesa.garg@intel.com>
In-Reply-To: <20241226060632.213790-1-nemesa.garg@intel.com>
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

Series: drm/i915/display: Add WA_14018221282 (rev4)
URL   : https://patchwork.freedesktop.org/series/142469/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2e47934fe854cbce369735e3c754b8597dee49c2
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Thu Dec 26 11:36:32 2024 +0530

    drm/i915/display: Add WA_14018221282
    
    It was observed that the first write to DKL PHY DP Mode
    register was not taking effect, hence rewrite this register.
    
    v2: Rename function [Mitul]
    v3: Rename function [Jani]
    v4: Add check for display ver 13 [Matt]
    
    Co-developed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
    Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 33906a7032dfca356fd7309e6abbdf5a7ea97db4 drm-intel
2e47934fe854 drm/i915/display: Add WA_14018221282


