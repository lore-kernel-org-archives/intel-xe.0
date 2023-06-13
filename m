Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0BFC7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 09:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C3810E061;
	Tue, 13 Jun 2023 09:58:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD10A10E359;
 Tue, 13 Jun 2023 09:58:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D9B0AA7DFF;
 Tue, 13 Jun 2023 09:58:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Tue, 13 Jun 2023 09:58:32 -0000
Message-ID: <168665031288.21693.10388688007778160972@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230613093740.1242129-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230613093740.1242129-1-janga.rahul.kumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/Xe=3A_Use_EOPNOTSUPP_instead_of_ENOTSUPP_=28rev2=29?=
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

Series: drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP (rev2)
URL   : https://patchwork.freedesktop.org/series/119002/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6a595a84dd9dc61b0d4b49ea7cc7b53018faf39c
Author: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Date:   Tue Jun 13 15:07:40 2023 +0530

    drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP
    
    ENOTSUPP is not a standard Unix error should use
    EOPNOTSUPP instead.
    
    v2: Update commit description (Aravind)
    
    Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
+ /mt/dim checkpatch e2343058f0b1a56fbbc7f91a4ff584095e255e66 drm-intel
6a595a84d drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP


