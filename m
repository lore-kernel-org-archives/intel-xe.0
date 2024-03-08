Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345C4C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 15:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D099810E55D;
	Fri,  8 Mar 2024 15:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPLsRfb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE4410E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709912687; x=1741448687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8JUa9W5+yJLoECJAD5G/dDHWsAazssabldtOp7U2sc=;
 b=gPLsRfb14p22iak1wLwzV1GkJupy4KmCAoYlWktMTcGa6J7F+AbCm2uU
 xzE4QwqZXOgOZveS+1IAs0IM3QZTMAql90/PElhxr0GzMcJ6rDecduH/3
 OyyjCgxwLOojKgfa4C1J0wpSIq/KHk/kTl38yLqjMPgdZyY1akWnEHm2K
 5XHzC88ocbnRC0tSVAya+2CNHGau/28+1yu43dvR1PHM+wJWKzbt8cSui
 WlzekZ5c7a6jp+ZDQ31JqvkWG5oitBc1CQ54aEsyjUs90kjeRkpCyhS8O
 aT2/felMuL5UnxpkUsMGbDt8KLJW50sd6bSN2YSWYABciykQYSPPwYmpc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27108056"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="27108056"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="15048399"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:44:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH xe-for-ci] drm/xe/pvc: fix CI GuC FW path
Date: Fri,  8 Mar 2024 07:44:48 -0800
Message-ID: <170991261656.2151604.7346638288234047960.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
References: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
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


On Fri, 08 Mar 2024 05:42:02 -0800, Daniele Ceraolo Spurio wrote:
> The new repo flow has the CI firmwares located under the intel-ci/
> folder, so we need to update the path in the driver. This messes a bit
> with the formatting, but since this is a CI-only patch it doesn't really
> matter.
> 
> 

And PVC is back to life:
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/index.html

Applied to xe-for-CI branch, thanks!

[1/1] drm/xe/pvc: fix CI GuC FW path
      commit: acec3bca46a221c35922c40b10405500e17309c5

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
