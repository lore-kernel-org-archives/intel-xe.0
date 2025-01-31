Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120DAC0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 07:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A5010E070;
	Fri, 31 Jan 2025 07:51:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463CC10EA30;
 Fri, 31 Jan 2025 07:51:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Skip_survivabil?=
 =?utf-8?q?ity_mode_for_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 07:51:51 -0000
Message-ID: <173830991128.3133498.16402603454013892786@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131080527.2256475-1-riana.tauro@intel.com>
In-Reply-To: <20250131080527.2256475-1-riana.tauro@intel.com>
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

Series: drm/xe: Skip survivability mode for VF
URL   : https://patchwork.freedesktop.org/series/144169/
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
commit 0df906ac7c8da0d434d835e92f7eb6ded3aef755
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Jan 31 13:35:27 2025 +0530

    drm/xe: Skip survivability mode for VF
    
    Follow the probe flow in case of VF and do not enter survivability mode
    in case of pcode init failure.
    
    Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot survivability")
    Suggested-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 0c2a60e7f1e779d87754254d9e3443beedbb684e drm-intel
0df906ac7c8d drm/xe: Skip survivability mode for VF


