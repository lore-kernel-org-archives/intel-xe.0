Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86ACE7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 04:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6D410ED99;
	Thu,  5 Dec 2024 04:38:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762B10ED99;
 Thu,  5 Dec 2024 04:38:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Make_OA_buffer_size_confi?=
 =?utf-8?q?gurable_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 04:38:12 -0000
Message-ID: <173337349261.2836369.13900028033867734999@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
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

Series: Make OA buffer size configurable (rev3)
URL   : https://patchwork.freedesktop.org/series/141795/
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
commit f490c2de1c55365dbb8764070663a6c3327120c9
Author: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Date:   Thu Dec 5 09:49:13 2024 +0530

    drm/xe/oa/uapi: Make OA buffer size configurable
    
    Add a new property called DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE to
    allow OA buffer size to be configurable from userspace.
    
    With this OA buffer size can be configured to any power of 2
    size between 128KB and 128MB and it would default to 16MB in case
    the size is not supplied.
    
    v2:
      - Rebase
    v3:
      - Add oa buffer size to capabilities [Ashutosh]
      - Address several nitpicks [Ashutosh]
      - Fix commit message/subject [Ashutosh]
    
    BSpec: 61100, 61228
    Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
+ /mt/dim checkpatch 6d42506688c08f85240449e80658ab760d899ae2 drm-intel
f490c2de1c55 drm/xe/oa/uapi: Make OA buffer size configurable


