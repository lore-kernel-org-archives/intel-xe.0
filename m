Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818FBC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 11:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EAC10E224;
	Thu,  3 Apr 2025 11:56:22 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBFD10E9A1;
 Thu,  3 Apr 2025 11:56:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Don=27t_update_GuC_?=
 =?utf-8?q?reset_policy_when_changing_wedged_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 11:56:21 -0000
Message-ID: <174368138132.32655.17449867639175020151@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
In-Reply-To: <20250403094141.25941-1-lukasz.laguna@intel.com>
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

Series: VF: Don't update GuC reset policy when changing wedged mode
URL   : https://patchwork.freedesktop.org/series/147195/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6cdf5627f24bbdfd38b0cbe432d715fa7c64f1b2
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Thu Apr 3 11:41:41 2025 +0200

    drm/xe/vf: Don't update GuC reset policy when changing wedged mode
    
    Prevent the VF from attempting to update the GuC reset policy when
    changing the wedged mode, as this operation is not supported for VFs.
    
    Log a message to indicate that GuC may still cause engine reset even
    with wedged_mode=2.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 71dac8dae6cc024b633bd6e584f4195c44c0dbc7 drm-intel
29bf54bf87bb drm/xe/vf: Don't support changing GuC reset policy
6cdf5627f24b drm/xe/vf: Don't update GuC reset policy when changing wedged mode


