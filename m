Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F6CCE8D4D
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 16:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71B710E24D;
	Fri, 14 Nov 2025 16:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4gkWrWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A3D10EAC1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763138222; x=1794674222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ynuicLxITvgY16Ta9U4R6q8g6epCcyiXpTY3qZYqf9M=;
 b=U4gkWrWzQv9v7e93Wu17cYixHmeampZF1vcSaa06ZVx+Hh2igPfSD7H5
 nlNwlf+u20sEoKkUzS0cybMqc62ZFTtkFLDOv7SVqziXDoke9WzNE69Sb
 vm6AvZdyzSIEz/2IZYkXw0ycxMc59BTWNN0qkebRuDOT/DHjxktgJ/j0r
 i55iWL9JpXzWLa2GW7lZ1fNQfEb2jMlMrZgwv5b3jeGQBLR2pbB15UIlN
 xO5SEejNooRV+MMmZf7jxTKFzcTr1y6Qlj0s5Uz6Tcq3thiZvOxjCjUAv
 Saezo1kyx9XW7W/k3Ya2VFGs6Gy+GVNHAAabaAOw/ttSk/bTUi7cJMj7k w==;
X-CSE-ConnectionGUID: 1SaoZIbVRE6QeWKjM8paMg==
X-CSE-MsgGUID: z/U5gK46Q1O5rHMlBh+9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65391502"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65391502"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:37:02 -0800
X-CSE-ConnectionGUID: BfP80DhAThqPSeChn/jcgw==
X-CSE-MsgGUID: 8LnHVKXZSImEV5nfgBiinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189105575"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 08:37:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Fix kernel-doc warning in
 migration_save_consume
Date: Fri, 14 Nov 2025 08:36:24 -0800
Message-ID: <176313817356.4187862.3775621052844592964.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114134030.1795947-1-michal.winiarski@intel.com>
References: <20251114134030.1795947-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 14 Nov 2025 14:40:30 +0100, Michał Winiarski wrote:
> The kernel-doc for xe_sriov_pf_migration_save_consume() contained
> multiple "Return:" sections, causing a warning.
> Fix it by removing the extra line.
> 
> 

Merged to drm-xe-next, thanks!

[1/1] drm/xe/pf: Fix kernel-doc warning in migration_save_consume
      commit: 562b0f254d8b1515a1c8d2a650f940d4f719300e

--
Lucas De Marchi

