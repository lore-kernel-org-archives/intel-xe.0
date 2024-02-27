Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C34CC5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 14:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D14C10E2DE;
	Tue, 27 Feb 2024 14:37:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197A310E2DE;
 Tue, 27 Feb 2024 14:37:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=5Flpm=3A_Renam?=
 =?utf-8?q?e_media_descriptor_to_media=5Fxe2=5Flpm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 14:37:50 -0000
Message-ID: <170904467010.337360.7139928517443324932@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227143209.346005-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240227143209.346005-1-balasubramani.vivekanandan@intel.com>
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

Series: drm/xe/xe2_lpm: Rename media descriptor to media_xe2_lpm
URL   : https://patchwork.freedesktop.org/series/130435/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d0ddc5b3d1923d979762adbe4411bf47751451b2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29da2c2116f98f3bb2c1c09bcd377b01db29ebdf
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Tue Feb 27 20:02:09 2024 +0530

    drm/xe/xe2_lpm: Rename media descriptor to media_xe2_lpm
    
    Media descriptor renamed to avoid conflict with future platforms.
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch ed7aa4acb76bb65356169f2261a95c201a77f38a drm-intel
29da2c2116f9 drm/xe/xe2_lpm: Rename media descriptor to media_xe2_lpm


