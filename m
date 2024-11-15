Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53404D68BDA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 22:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6910E183;
	Fri, 15 Nov 2024 22:34:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1F510E183;
 Fri, 15 Nov 2024 22:34:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Converge_on_using_se?=
 =?utf-8?q?cs=5Fto=5Fjiffies=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 22:34:07 -0000
Message-ID: <173171004714.380828.7604383024070994939@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
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

Series: Converge on using secs_to_jiffies() (rev2)
URL   : https://patchwork.freedesktop.org/series/141435/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f43942f219c8 drm-tip: 2024y-11m-15d-19h-15m-44s UTC integration manifest
=== git am output follows ===
Applying: netfilter: conntrack: Cleanup timeout definitions
Applying: coccinelle: misc: Add secs_to_jiffies script
Applying: arm: pxa: Convert timeouts to use secs_to_jiffies()
Applying: s390: kernel: Convert timeouts to use secs_to_jiffies()
Applying: powerpc/papr_scm: Convert timeouts to secs_to_jiffies()
Applying: mm: kmemleak: Convert timeouts to secs_to_jiffies()
Applying: accel/habanalabs: Convert timeouts to secs_to_jiffies()
Applying: drm/xe: Convert timeout to secs_to_jiffies()
Applying: drm/etnaviv: Convert timeouts to secs_to_jiffies()
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
Applying: nfp: Convert timeouts to secs_to_jiffies()


