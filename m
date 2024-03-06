Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9276C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDFA112425;
	Wed,  6 Mar 2024 10:15:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C66112388;
 Wed,  6 Mar 2024 10:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/xe=3A_Rework_xe=5Fvm=5Frebind=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 10:15:36 -0000
Message-ID: <170972013629.524851.12292716598342647293@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306100133.4962-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240306100133.4962-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/2] drm/xe: Rework xe_vm_rebind()
URL   : https://patchwork.freedesktop.org/series/130798/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6ba7af82fc988159a1d7753d19b9639f1d6dc08f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 6 11:01:33 2024 +0100

    drm/xe: Move vma rebinding to the drm_exec locking loop
    
    Rebinding might allocate page-table bos, causing evictions.
    To support blocking locking during these evictions,
    perform the rebinding in the drm_exec locking loop.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 6e50187af603728329f9d3c3a53ad162d7eda9a4 drm-intel
66ea70965576 drm/xe: Rework xe_vm_rebind()
6ba7af82fc98 drm/xe: Move vma rebinding to the drm_exec locking loop


