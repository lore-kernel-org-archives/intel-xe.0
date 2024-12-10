Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C76DE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 22:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF82510E065;
	Tue, 10 Dec 2024 22:36:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D33C10E065;
 Tue, 10 Dec 2024 22:36:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Converge_on_using_se?=
 =?utf-8?q?cs=5Fto=5Fjiffies=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 22:36:39 -0000
Message-ID: <173387019931.968252.11347972826262533209@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
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

Series: Converge on using secs_to_jiffies() (rev3)
URL   : https://patchwork.freedesktop.org/series/141435/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2223c2c738ec drm-tip: 2024y-12m-10d-21h-20m-53s UTC integration manifest
=== git am output follows ===
Applying: netfilter: conntrack: Cleanup timeout definitions
Applying: coccinelle: misc: Add secs_to_jiffies script
Applying: arm: pxa: Convert timeouts to use secs_to_jiffies()
Applying: s390: kernel: Convert timeouts to use secs_to_jiffies()
Applying: powerpc/papr_scm: Convert timeouts to secs_to_jiffies()
Applying: mm: kmemleak: Convert timeouts to secs_to_jiffies()
Applying: accel/habanalabs: Convert timeouts to secs_to_jiffies()
Applying: drm/xe: Convert timeout to secs_to_jiffies()
Applying: scsi: lpfc: Convert timeouts to secs_to_jiffies()
Applying: scsi: arcmsr: Convert timeouts to secs_to_jiffies()
Applying: scsi: pm8001: Convert timeouts to secs_to_jiffies()
Applying: xen/blkback: Convert timeouts to secs_to_jiffies()
Applying: gve: Convert timeouts to secs_to_jiffies()
Applying: wifi: ath11k: Convert timeouts to secs_to_jiffies()
Applying: Bluetooth: MGMT: Convert timeouts to secs_to_jiffies()
Applying: staging: vc04_services: Convert timeouts to secs_to_jiffies()
Applying: ceph: Convert timeouts to secs_to_jiffies()
Applying: livepatch: Convert timeouts to secs_to_jiffies()
Applying: ALSA: line6: Convert timeouts to secs_to_jiffies()


