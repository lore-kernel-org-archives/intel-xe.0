Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC84C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 14:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE9F10EB24;
	Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EA610EB27;
 Thu, 17 Apr 2025 14:12:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_BMG_PCIe_Gen4_downsp?=
 =?utf-8?q?eed_attributes_and_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 14:12:57 -0000
Message-ID: <174489917790.15099.2445392855326157064@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417111233.2322000-1-raag.jadav@intel.com>
In-Reply-To: <20250417111233.2322000-1-raag.jadav@intel.com>
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

Series: BMG PCIe Gen4 downspeed attributes and usage
URL   : https://patchwork.freedesktop.org/series/147908/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 830407db6fa5 drm-tip: 2025y-04m-17d-09h-30m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: s/xe_device_sysfs_init/xe_pm_sysfs_init
Applying: drm/xe: Expose PCIe Gen4 downspeed attributes
Applying: drm/xe/doc: Wire up PCIe Gen5 update limitations


