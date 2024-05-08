Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB5BC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 21:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1D41129D9;
	Wed,  8 May 2024 21:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN/1o7z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346611129D9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715203795; x=1746739795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AS8dv9AzPjsz5gI+rMFcXzuPKgBpJJN5lGiWot9AoTQ=;
 b=gN/1o7z+gCK4aPaPfoBlHHd8Fc9+M9Nj1ooJlvI4NqgbA+rDS1M0WrD+
 ntSycBtEZ1mmNrDpWbHZkJ55H8rOt6NpnqCV6mnoK1nVbCt0dumZB3prD
 0pPTi/1k3iFmT/hMmJGUwlydVWHa5jP7sn7Odpk6QOry3xyMbWcUWweet
 nPW22vVfMwS2NUlpg4DZ+2ew4MQeQiijLUG4BZCDdwtneZSyOLFVXHmfD
 FsxQzEnBauL4ysxs4ubfCg+Nvi0vilQt7ifPuOgqRq8qrSxlkT6NYUzWb
 pnAtKgZkWsczIqFXtA3EhwmoQBJALI3FrhBREQ+tYQh0VbIv10hweBp3Q A==;
X-CSE-ConnectionGUID: 9purDbhTRISNFvEep9OBDQ==
X-CSE-MsgGUID: vg8fK/V/RLyB0cU3XAptLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22496767"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22496767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 14:29:54 -0700
X-CSE-ConnectionGUID: BYxWGeNyT5ulLBWE0i+pyA==
X-CSE-MsgGUID: gYd2WNgsQM+rHD1wP9Co4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="60182524"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 14:29:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
Date: Wed,  8 May 2024 14:30:54 -0700
Message-ID: <171520383041.475437.18119625215736341108.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
References: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
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


On Thu, 18 Apr 2024 16:45:34 +0530, Bommu Krishnaiah wrote:
> This workaround applies to Graphics 20.01 as RCS engine workaround
> 
> 

Applied to drm-xe-next, thanks!

[1/1] drm/xe/xe2: Add workaround 14021402888
      commit: 598dc939edf8d7bb1d69e84513c31451812128fc

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
