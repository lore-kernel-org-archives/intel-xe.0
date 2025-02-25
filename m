Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29C1C021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 14:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E7B10E6E9;
	Tue, 25 Feb 2025 14:35:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9302610E6E9;
 Tue, 25 Feb 2025 14:35:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Set_submission_vers?=
 =?utf-8?q?ion_in_xe=5Fuc=5Ffw_struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 14:35:46 -0000
Message-ID: <174049414659.1991856.6044439457977174024@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
In-Reply-To: <20250225132337.6508-1-lukasz.laguna@intel.com>
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

Series: VF: Set submission version in xe_uc_fw struct
URL   : https://patchwork.freedesktop.org/series/145406/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 82349b24ce117dd63230c57aee2e0c2da4e426ff
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Tue Feb 25 14:23:37 2025 +0100

    drm/xe/vf: Set submission version in xe_uc_fw struct
    
    The VF driver has already negotiated the ABI version with GuC. What
    remains is to populate the generic xe_uc_fw struct with the version
    before initializing submission.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db drm-intel
8c57009e3763 drm/xe/uc: Add helpers to set firmware version
4d5b62cdccb4 drm/xe/vf: Add helper to get negotiated GuC ABI version
82349b24ce11 drm/xe/vf: Set submission version in xe_uc_fw struct


