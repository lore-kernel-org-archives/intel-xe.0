Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C72EE4998
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1E210E086;
	Fri, 18 Aug 2023 22:11:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5A3610E086;
 Fri, 18 Aug 2023 22:11:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D22F7AADEB;
 Fri, 18 Aug 2023 22:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 18 Aug 2023 22:11:40 -0000
Message-ID: <169239670085.12741.13660094764711990004@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_Lunar_Lake_support_=28rev2=29?=
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

Series: Add Lunar Lake support (rev2)
URL   : https://patchwork.freedesktop.org/series/122353/
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
commit 2cd063636ed108f85daf3fcf9104f30c1ec64404
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Fri Aug 18 15:08:24 2023 -0700

    drm/xe/lnl: Hook up MOCS table
    
    LNL uses the Xe2 MOCS table introduced in an earlier patch.
    
    Bspec: 71582
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch ddd31145723188b5d7add72fef209f5ceaf27941 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


