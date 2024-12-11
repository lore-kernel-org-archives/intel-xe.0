Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C458AE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 16:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FF910EB92;
	Wed, 11 Dec 2024 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgAnbX31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D6910EB92
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733934168; x=1765470168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j8g1DIyoWoE8YRUzbHhvtphKdIBwM1D8EmtKqTT113w=;
 b=UgAnbX31SP/m+sY955MgJIs+oM/CzWv9Joflznww/TqODUrYJomhpThj
 EoT5+WmrK+y8kSQqhKxwvhInl6+EigvhiRhgCntLf9/lhCdpllseFF/Ag
 lJi1C+5GEPimPcJqBEZkSWOTAFiiIjAWbcM5kyKQm1pYaggupQVFlCIn2
 UhUJGyX4QbHyrWtaIVTCsmYw63euzTUR4VEjwfHRG7j3lO1iXjAPHfzNG
 OBjud91Sdp1q8boKNVQVbYDRiNQ8GWRflSs3VIxtAsZI+3hFNhg8FpxeI
 QYAzKQi93mYsA/cazsqPIwjvNUs2yGUrg2gHiZfY1XILGuL0baGhGpZ+f A==;
X-CSE-ConnectionGUID: cvGJCrmVSQKUNFzXT/DxYw==
X-CSE-MsgGUID: 4rZAWp5JT8Owk4H9DtRVmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44796644"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44796644"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 08:22:47 -0800
X-CSE-ConnectionGUID: ZYQi5aXVQ9GPs+dqo9CXQw==
X-CSE-MsgGUID: oF4Ff6AkSNOuctvEyEaHFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95922242"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 08:22:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com
Subject: Re: [PATCH v2 0/5] reg_sr/whitelist fixes and refactors
Date: Wed, 11 Dec 2024 08:22:14 -0800
Message-ID: <173393345386.822403.10630269256801449644.b4-ty@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
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


On Mon, 09 Dec 2024 15:27:34 -0800, Lucas De Marchi wrote:
> First patch is an important fix that we could eventually trip on (and it
> did in this series because it increases the amount of save-restore
> registers).
> 
> Stop writing the unused NONPRIV registers and use the HWE save-restore
> so it doesn't need a separate mmio application and handling for GuC.
> 
> [...]

Applied, thanks for the reviews!

[1/5] drm/xe/reg_sr: Remove register pool
      commit: e5283bd4dfecbd3335f43b62a68e24dae23f59e4
[2/5] drm/xe: Introduce xe_gt_dbg_printer()
      commit: 26582fc61a923e81832df8d5a169bbdab095d15e
[3/5] drm/xe/reg_sr: Convert whitelist to gt logging
      commit: bd022199ce967cd4bfdd6cea2385448d72be2a80
[4/5] drm/xe/reg_sr: Stop setting all whitelist slots
      commit: c1151691b5e97b600a9ef3efd7c31a3abf568e41
[5/5] drm/xe: Apply whitelist to engine save-restore
      commit: 3fcf68d7393fd622b96cd45124ccb1eddf77684c

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
