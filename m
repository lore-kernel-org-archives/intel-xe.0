Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B4CC282DE
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 21:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A74C10EA92;
	Thu,  6 Mar 2025 21:42:01 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB31610EA92;
 Thu,  6 Mar 2025 21:42:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Battlemage_D3Cold_issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 21:42:00 -0000
Message-ID: <174129732095.69069.13097261400664830962@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
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

Series: Battlemage D3Cold issues
URL   : https://patchwork.freedesktop.org/series/145946/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 825b5a15c07acf7d5812002799a2067b1fee4aa2
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Mar 6 16:36:15 2025 -0500

    drm/xe/pm: Re-enable D3Cold by default on BMG
    
    This patch re-enables D3Cold by default on BMG.
    
    If issues on runtime_pm resume are seen and the D3cold->D0 transition
    is suspected to block the device or cause memory corruptions, D3cold
    can be disabled for confirmation with either:
    
    1. at runtime:
       echo 0 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold
    
    2. at boot:
       pcie_port_pm=off
    
    Upon confirmation of D3Cold related bug, please file a bug to the
    link below.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 drm-intel
ee66342514a6 drm/xe/pm: Temporarily disable D3Cold on BMG
825b5a15c07a drm/xe/pm: Re-enable D3Cold by default on BMG


