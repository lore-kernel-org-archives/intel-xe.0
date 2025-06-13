Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4DEC71151
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 14:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F291D10E9CE;
	Fri, 13 Jun 2025 14:00:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DE110E9CD;
 Fri, 13 Jun 2025 14:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/xe/hwmon=3A?=
 =?utf-8?q?_fix_uninitialised_access_in_xe=5Fhwmon=5Fpcode=5Fwrite=5Fpower?=
 =?utf-8?q?=5Flimit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Qasim Ijaz" <qasdev00@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 14:00:12 -0000
Message-ID: <174982321271.76863.1833819098962021074@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603180333.32117-1-qasdev00@gmail.com>
In-Reply-To: <20250603180333.32117-1-qasdev00@gmail.com>
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

Series: drm/xe/hwmon: fix uninitialised access in xe_hwmon_pcode_write_power_limit
URL   : https://patchwork.freedesktop.org/series/150229/
State : failure

== Summary ==

Address 'qasdev00@gmail.com' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!


