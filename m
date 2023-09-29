Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A85E728D6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 18:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E3710E19E;
	Fri, 29 Sep 2023 18:21:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F66010E19E;
 Fri, 29 Sep 2023 18:21:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D666AADF2;
 Fri, 29 Sep 2023 18:21:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Date: Fri, 29 Sep 2023 18:21:18 -0000
Message-ID: <169601167864.19499.17605254515412770221@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe/vm=3A_print_the_correct_=27?=
 =?utf-8?q?keep=27_when_printing_gpuva_ops?=
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

Series: series starting with [1/3] drm/xe/vm: print the correct 'keep' when printing gpuva ops
URL   : https://patchwork.freedesktop.org/series/124465/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 45b088e90e209d16c5ddf5c6b37db98673ec1fd9
Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date:   Fri Sep 29 10:31:04 2023 -0700

    drm/xe: fix range printing for debug messages
    
    We're already using the half-open interval notation "[A, B)", that "-
    1" there makes it wrong. Also, getting rid of the "-1" makes it much
    easier to grep for the logs when you're looking for an address that's
    the end of a vma and the start of another.
    
    Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+ /mt/dim checkpatch ce84294f7fa4242d18b060baf6c61228374b6fa8 drm-intel
fe02e34ac drm/xe/vm: print the correct 'keep' when printing gpuva ops
a0680e357 drm/xe/vm: use list_last_entry() to fetch last_op
45b088e90 drm/xe: fix range printing for debug messages


