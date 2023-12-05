Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10045C10F04
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 04:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923310E1D4;
	Tue,  5 Dec 2023 04:55:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2BA891B4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 04:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701752099; x=1733288099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UdiGyUeUKEy+YAaZkWisqSXVH8XpMaQZGATk1w3nGSs=;
 b=O1vAmpteuT7uUHJMYSqJMp+cGSem5iyT+80evrucfLolonxazt016hF9
 PIUoRD4kGapqaV8vzgdVEkSicH5AskpmmA0aFXUWqNn5mFSa93szhdMHv
 QTrzAorjYBgxgtujSxFF6mQ+2Z84dVdP4G+RfMBQVOwoNDoXV2p/g1BOM
 PaxiMCg+yOe3Y/BeMJIZ265UwUMd1VBmeGv/1FCOiWtK0XmG4S8kfh48/
 Z4ZQ883vmUl9EkWpVRFwyUU+zn995yXyqjm6ByrR4+db15xyVdSTovyUS
 ita+G5LPgbF0oFUxEbKHhNBJXkBDYP9Kjj2u1jnRyrr/XOjCbl0K/frwP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="460329287"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="460329287"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 20:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841317827"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="841317827"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 20:54:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Date: Mon,  4 Dec 2023 20:54:51 -0800
Message-Id: <170175203495.2084037.4652564980195663729.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [CI 01/13] drm/xe: Split xe_info_init
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On Tue, 05 Dec 2023 02:32:56 +0100, Michał Winiarski wrote:
> Parts of xe_info_init are only dealing with processing driver_data.
> Extract it into xe_info_init_early to be able to use it earlier during
> probe.
> 
> 

Applied, thanks!

[01/13] drm/xe: Split xe_info_init
        commit: 86312d9b1a03f670c7cab8c0a341900602f959db
[02/13] drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
        commit: 4cb1dc40c3be0dca280d95661245e5073ee7d5a4
[03/13] drm/xe: Map the entire BAR0 and hold onto the initial mapping
        commit: 68d53685bd27ec7f39e4165307d509c98375b22d
[04/13] drm/xe/device: Introduce xe_device_probe_early
        commit: e6e07ec8a8491909225b7778b76f4ec816dd99e7
[05/13] drm/xe: Don't "peek" into GMD_ID
        commit: a08ebc4c597ee110d9623f9f39fdcf45ca48f601
[06/13] drm/xe: Move system memory management init to earlier point in probe
        commit: 2550919fe5896b9fa17b15e7a6ecec09de07283b
[07/13] drm/xe: Move force_wake init to earlier point in probe
        commit: ff2fd2256a122e99a0641cd326a4a4b049e0894e
[08/13] drm/xe: Reorder GGTT init to earlier point in probe
        commit: ed943a95501ea75254e1f96396b37efc52bcfc07
[09/13] drm/xe: Add a helper for DRM device-lifetime BO create
        commit: 23e939bc8f569c12795d8509571405905a148b6c
[10/13] drm/xe/uc: Split xe_uc_fw_init
        commit: b303baf7abc00183eb6e1a6f74b1b94ff34d3f17
[11/13] drm/xe/uc: Store firmware binary in system-memory backed BO
        commit: 01299c18646500cff557b728d27d162a1afde585
[12/13] drm/xe/uc: Extract xe_uc_sanitize_reset
        commit: 5906133338417f655b1199a4219a675efcff5ae6
[13/13] drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
        commit: 2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
