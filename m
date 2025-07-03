Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA078C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF8110E8FB;
	Thu,  3 Jul 2025 21:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8ODuN0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF94110E8F9
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751579384; x=1783115384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6dVQsiD92inSlNH6rKVR+MAs0U03gKptENCc8Ijj65U=;
 b=k8ODuN0GSj1AVObBKsaiJEXcrXwK6psPx54i91jeHRHM77u3V5wjrZIL
 V/ctavXwfYPY9pI4zUTpGmP5dTHL3nQ0SM3zSWMrXAaH5++UgDfnsb3st
 eGYMywULnK+FIRA0ClQp/ycokSVAylJIiYI1B1H3bOA3wRONb/7vtzQrf
 dEY58ywRRsU/9jZEb+DO8B0Sqx+q7DVDQNk7UercIoBPZ508n63LzNh+S
 LxAO3qUelEL0ekj+pCylwK5SRSy/p84ifFuBCSTEJsWSxHhLloq7orx4Z
 sRHUEipWTTnLo481apwBCwAm/iWhLXwcYNJI3FpMmucd8fG4xz2/y9mOS w==;
X-CSE-ConnectionGUID: UiDy8A7NSYunDMmWmrS/mw==
X-CSE-MsgGUID: pFSvQqhXQIagxblP7qN3MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79355499"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="79355499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:49:43 -0700
X-CSE-ConnectionGUID: eyExFCjlRHiA3/i+5Gji7g==
X-CSE-MsgGUID: CC+B6piDS6KqHV+oYqhWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="178150447"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:49:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] Revert "drm/xe/xe2: Enable Indirect Ring State support
 for Xe2"
Date: Thu,  3 Jul 2025 14:49:33 -0700
Message-ID: <175157932588.2530949.11992821161868622370.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702035846.3178344-1-matthew.brost@intel.com>
References: <20250702035846.3178344-1-matthew.brost@intel.com>
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


On Tue, 01 Jul 2025 20:58:46 -0700, Matthew Brost wrote:
> This reverts commit fe0154cf8222d9e38c60ccc124adb2f9b5272371.
> 
> Seeng unexplained random failures during LRC context switches with
> indirect ring state enabled. Indirect ring state is not required for any
> current features, disable for now until failures can be root caused.
> 
> 
> [...]

I reworded the commit message to give a little bit more context
and applied to drm-xe-next, thanks!

[1/1] Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
      commit: 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35

Best regards,
-- 
Lucas De Marchi

