Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B5C282DE
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 02:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C39A10E082;
	Sat,  8 Mar 2025 02:28:34 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD8E10E1A2;
 Sat,  8 Mar 2025 02:28:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/xe/pm=3A_Temporarily_disable_D3Cold_on_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Mar 2025 02:28:33 -0000
Message-ID: <174140091364.4957.13531065093611461138@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
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

Series: series starting with [CI,1/2] drm/xe/pm: Temporarily disable D3Cold on BMG
URL   : https://patchwork.freedesktop.org/series/146029/
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
commit 22c9819bf157fe20286a7bf419fc649f2080a56d
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Mar 7 19:56:36 2025 -0500

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
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
80d4674bc776 drm/xe/pm: Temporarily disable D3Cold on BMG
22c9819bf157 drm/xe/pm: Re-enable D3Cold by default on BMG


