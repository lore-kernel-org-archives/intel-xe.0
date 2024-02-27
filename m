Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5610AC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 19:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7210E774;
	Tue, 27 Feb 2024 19:33:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F71A10E774;
 Tue, 27 Feb 2024 19:33:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Stop_checking_f?=
 =?utf-8?q?or_power=5Flost_on_D3Cold?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 19:33:42 -0000
Message-ID: <170906242213.337279.3483248138213900617@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227184330.506881-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240227184330.506881-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Stop checking for power_lost on D3Cold
URL   : https://patchwork.freedesktop.org/series/130451/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5ba87a8cde025bb9655ddbeaa1d6d8e4aa7f206
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Feb 27 13:43:30 2024 -0500

    drm/xe: Stop checking for power_lost on D3Cold
    
    GuC reset status is not reliable for this purpose and it is
    once in a while ending up in a situation of D3Cold, where
    power_reset is false and without the proper memory restoration
    the GuC reload and Display will fail to come back from D3Cold.
    
    So, let's do a full restoration of everything if we have a risk
    of losing power, without further optimizations.
    
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0d7a78693be62a8d1cd311376815b89b18de8204 drm-intel
b5ba87a8cde0 drm/xe: Stop checking for power_lost on D3Cold


