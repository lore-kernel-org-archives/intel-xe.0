Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A53EC5478C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 20:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A62310E28E;
	Fri, 23 Feb 2024 20:55:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709F810E050;
 Fri, 23 Feb 2024 20:55:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Handle_timi?=
 =?utf-8?q?ng_out_of_signaled_jobs_gracefully?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 20:55:55 -0000
Message-ID: <170872175546.264276.15522013168975714152@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240223204659.40750-1-matthew.brost@intel.com>
In-Reply-To: <20240223204659.40750-1-matthew.brost@intel.com>
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

Series: drm/xe/guc: Handle timing out of signaled jobs gracefully
URL   : https://patchwork.freedesktop.org/series/130333/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cd62896504543deb288c1d649eed56308dbcfb80
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9bee9eb15e8e392bfab2d8d35115926f5337af82
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Feb 23 12:46:59 2024 -0800

    drm/xe/guc: Handle timing out of signaled jobs gracefully
    
    Timing out of signaled jobs can happen during regular operations (e.g.
    an exec queue closed immediately after last fence signaled). The TDR can
    pass the worker which free jobs. Rather than running through the TDR if
    signaled job is found, simply free it without any debug messages.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reported-by: José Roberto de Souza <jose.souza@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1271
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7661e4e4b6e507b7980f2ff8324c2c16457f5a0e drm-intel
9bee9eb15e8e drm/xe/guc: Handle timing out of signaled jobs gracefully


