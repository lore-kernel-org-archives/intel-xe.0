Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7D2C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 17:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F67B10FE84;
	Wed, 20 Mar 2024 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLAVfon/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C7210FE86
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710955808; x=1742491808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LE5AcWStxHavFVCmEPejMKJcF9X9gzuhgipoLD+StuE=;
 b=NLAVfon/83weWMT38wxH2wMQthABlap9DLz/QvAZDJm53rahRNrHm1Uh
 2nr4K37JgVWBcIx5mdJm5XZ1aRqWcHDKw2iJLQwRZTuOVcGvuf7MsuX1O
 +tkqsu1pB1zXtlEUVCll0A1jFw8e4tAJJU18z0Va+YnDZvFxwifdL+aOE
 zuuXLkKul+tzCRRTzF+P6dH077DWJXYqfmtgFInAy8xQaQx3qnGD6lT0t
 nqZbPLsVrPvs+ecR2XN6U399yWZDRbDt3mcF0zTFhGHd1SWBHUT4gA707
 W7EUkRJhnZ4y8UCzPZfblC4XDsJgjFEFsdLBVpptiJHRXD2Dw231f4C9W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9710049"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="9710049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 10:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18823721"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 10:30:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Date: Wed, 20 Mar 2024 10:30:39 -0700
Message-ID: <171095575438.4049394.7507104471126213988.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
References: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
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


On Mon, 18 Mar 2024 17:10:57 +0530, Tejas Upadhyay wrote:
> Remove continue statement which does not have real effect
> as no actions are to be taken post continue.
> 
> 

Applied, thanks!

[1/1] drm/xe/gt: Remove continue statement which has no effect
      commit: dd1c61057e9e3309aca99e6c215cf964f92c90c1

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
