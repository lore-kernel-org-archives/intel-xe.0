Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9DEC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2CC10E29B;
	Mon,  5 Aug 2024 20:06:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8D10E2A4;
 Mon,  5 Aug 2024 20:06:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Only_check_last?=
 =?utf-8?q?_fence_on_user_binds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 20:06:49 -0000
Message-ID: <172288840979.541475.4654671912338240627@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805200233.3050325-1-matthew.brost@intel.com>
In-Reply-To: <20240805200233.3050325-1-matthew.brost@intel.com>
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

Series: drm/xe: Only check last fence on user binds
URL   : https://patchwork.freedesktop.org/series/136898/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9e645341d3008ce246879af606f45d0e5d21d698
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dac4561e19b02246a35bd8a5a63dfbc1e8abd9af
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Aug 5 13:02:33 2024 -0700

    drm/xe: Only check last fence on user binds
    
    We only set the last fence on user binds, so no need to check last fence
    kernel issued binds. Will avoid blowing up last fence lockdep asserts.
    
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de drm-intel
dac4561e19b0 drm/xe: Only check last fence on user binds


