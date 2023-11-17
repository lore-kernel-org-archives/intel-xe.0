Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E59DC54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 21:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DD110E796;
	Fri, 17 Nov 2023 21:39:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B377310E796;
 Fri, 17 Nov 2023 21:39:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B1CEFA47E9;
 Fri, 17 Nov 2023 21:39:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Fri, 17 Nov 2023 21:39:46 -0000
Message-ID: <170025718672.7875.3862272191849666079@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/guc=3A_Use_FAST=5FREQUEST_for_non-blocking_H2G_messages?=
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

Series: drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages
URL   : https://patchwork.freedesktop.org/series/126495/
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
commit fc9e159627e18613770a42907146d7d651c068c2
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Nov 15 15:40:43 2023 -0800

    drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages
    
    We're currently sending non-blocking H2G messages using the EVENT type,
    which suppresses all CTB protocol replies from the GuC, including the
    failure cases. This might cause errors to slip through and manifest as
    unexpected behavior (e.g. a context state might not be what the driver
    thinks it is because the state change command was silently rejected by
    the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
    type instead, which suppresses the reply only on success; this way we
    still get the advantage of not having to wait for an ack from the GuC
    (i.e. the H2G is still non-blocking) while still detecting errors.
    Since we don't track the non-blocking messages, we don't exactly know
    which one of them failed and therefore can't attempt to recover and need
    to escalate to GT reset instead.
    
    Note that FAST_REQUEST failures are NOT expected and are usually a sign
    that the H2G was either malformed or requested an illegal operation.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d drm-intel
fc9e15962 drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages


