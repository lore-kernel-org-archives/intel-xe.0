Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A6D6552F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 17:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9F310E96B;
	Tue, 26 Nov 2024 17:30:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048CB10E96B;
 Tue, 26 Nov 2024 17:30:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Make_OA_buffer_size_confi?=
 =?utf-8?q?gurable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 17:30:54 -0000
Message-ID: <173264225401.3436606.12809301339891524756@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
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

Series: Make OA buffer size configurable (rev2)
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
commit d947249795e166591caded1388e8c105686e3597
Author: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Date:   Tue Nov 26 22:05:53 2024 +0530

    drm/xe/oa: Remove all the instances of hardcoded OA buffer size
    
    Remove all the instances of hardcoded OA buffer size and use the
    size coming from the new parameter and stream's oa buffer size at
    the required places.
    
    Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
+ /mt/dim checkpatch 739a2506c44a0be22cc842d2c625a05ed21c1198 drm-intel
3da98db746c3 drm/xe/oa: Increase default OA buffer size to 128 M
bad76ab28ee6 drm/xe/oa: Make OA buffer size configurable
d947249795e1 drm/xe/oa: Remove all the instances of hardcoded OA buffer size


