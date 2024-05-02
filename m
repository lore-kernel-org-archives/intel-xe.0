Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925CDC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 18:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF8A10F3F6;
	Thu,  2 May 2024 18:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aueqrhoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A286210F52F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714675740; x=1746211740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQ2dv66KZhCd538IXedw935HQo1aCjgsMQOFIj+vVwU=;
 b=aueqrhoymUlYgWu1xdgUvROAiaF9ccF5ZEXi1Ipb9/P7HZM+MB3nCeyV
 Mad1C+hMBj00o5TQVOJ9vnt0sXx046G5BdcoPfnRqH94hTMs3eb+njROD
 0F7NpakMEzLhH9odwR3eX2tSnzrLw43xOublhxXnsM52Y1jwuRH0xeVtd
 eT4fMil2KYCfcp5a2beWf1aDoUU0xjgSOPX2VqpzKBOMQVzBZbgVzNCkj
 OuyWWRScW68L1udJQdklkIxEeMZp5A22423IbGvOmVBDa/PS576Kf7/No
 6wkxQNATaUujaZ+X71zB42tVGHz3CUxMEFy+PCKEqv9hVniYb1qk20U0X g==;
X-CSE-ConnectionGUID: Uw57aFQcSA6wfQHwU2Gylw==
X-CSE-MsgGUID: LodfH7RDRCC2nsYPRSH6lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21017438"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21017438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 11:48:59 -0700
X-CSE-ConnectionGUID: IjNWuKhXQiSdmR3JTaU0yg==
X-CSE-MsgGUID: S92kjljHSSWjjG0AB0ZMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31682448"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 11:48:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Fix assert in L3 bank mask generation
Date: Thu,  2 May 2024 11:49:49 -0700
Message-ID: <171467575246.3963368.3838097486966806440.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502124311.159695-1-francois.dugast@intel.com>
References: <20240502124311.159695-1-francois.dugast@intel.com>
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


On Thu, 02 May 2024 14:43:10 +0200, Francois Dugast wrote:
> What needs to be asserted is that the pattern fits in the number
> of bits provided by the user in patternbits, otherwise it would
> be truncated when replicated according to the mask, which is
> likely not the intended use of this function.
> The pattern argument is a bitmap so use find_last_bit() instead
> of fls(). The bit position starts at index 0 so remove "or equal"
> from the comparison. XE_MAX_L3_BANK_MASK_BITS would be the
> returned value if the pattern is 0, which can be the case on some
> platforms.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/gt: Fix assert in L3 bank mask generation
      commit: 8ad0e1810bf23f22cedb8a2664548b15646570c7

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
