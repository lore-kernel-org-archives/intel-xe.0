Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26146CCF9EC
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 23:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E510E115;
	Tue,  5 Sep 2023 23:45:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F05CB10E115;
 Tue,  5 Sep 2023 23:45:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F0588A00E8;
 Tue,  5 Sep 2023 23:45:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Date: Tue, 05 Sep 2023 23:45:44 -0000
Message-ID: <169395754498.19168.12402040762845697887@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230829233053.2264563-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230829233053.2264563-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/guc=3A_Report_submission_version_of_GuC_firmware_?=
 =?utf-8?b?KHJldjIp?=
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

Series: fixup! drm/xe/guc: Report submission version of GuC firmware (rev2)
URL   : https://patchwork.freedesktop.org/series/123043/
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
commit 5dd5033c991880136a929c6abe4b3e73cd262b4f
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Aug 29 16:30:53 2023 -0700

    fixup! drm/xe/guc: Report submission version of GuC firmware
    
    Major GuC versions greater than 70 will have the submission version in
    the herader irrespective of their minor version number.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7ec520d3a63b6e95174329108cd44359a70907ba drm-intel
5dd5033c9 fixup! drm/xe/guc: Report submission version of GuC firmware


