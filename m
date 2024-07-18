Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A27C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 17:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362610EA8A;
	Thu, 18 Jul 2024 17:40:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD1A10EA98;
 Thu, 18 Jul 2024 17:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Build_PM_into_GuC_CT_laye?=
 =?utf-8?q?r_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 17:40:06 -0000
Message-ID: <172132440684.287207.9971671733120968369@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718173445.1490455-1-matthew.brost@intel.com>
In-Reply-To: <20240718173445.1490455-1-matthew.brost@intel.com>
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

Series: Build PM into GuC CT layer (rev2)
URL   : https://patchwork.freedesktop.org/series/136226/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e1dc9fa275ceb0a6455cd67275244c9779b4faaf
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 18 10:34:45 2024 -0700

    drm/xe: Build PM into GuC CT layer
    
    Take PM ref when any G2H are outstanding, drop when none are
    outstanding.
    
    To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
    to be held when scheduler messages are pending too.
    
    v2:
     - Add outer PM protections to xe_file_close (CI)
    v3:
     - Only take PM ref 0->1 and drop on 1->0 (Matthew Auld)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 943ad04000a54cc7fdb5347606d0ce6a93ea286d drm-intel
e1dc9fa275ce drm/xe: Build PM into GuC CT layer


