Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74893C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC7910E223;
	Tue,  3 Jun 2025 20:26:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614C510E223;
 Tue,  3 Jun 2025 20:26:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_media_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 20:26:53 -0000
Message-ID: <174898241339.45504.196428644120999080@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
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

Series: Enable media OA
URL   : https://patchwork.freedesktop.org/series/149806/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6664f65d30a33982bd2e9435dc3c79ce2b1e9b64
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Jun 3 13:21:33 2025 -0700

    drm/xe/oa: Enable OAM latency measurement
    
    Enable OAM latency measurement for Xe3+ platforms.
    
    Bspec: 58840
    
    v2: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
4c6f15bf5871 drm/xe/oa/uapi: Expose media OA units
373452cb87d1 drm/xe/oa: Print hwe to OA unit mapping
6fdad47337fc drm/xe/oa: Introduce stream->oa_unit
afc96b9e539c drm/xe/oa: Assign hwe for OAM_SAG
6664f65d30a3 drm/xe/oa: Enable OAM latency measurement


