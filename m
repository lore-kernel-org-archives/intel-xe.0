Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235D9C531FF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A1210E010;
	Fri, 20 Feb 2026 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkZKHCEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81610E010
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771583135; x=1803119135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N8MntAP/70DB66jYBekqkQscAfasJwXQLCGTdLeSAPk=;
 b=LkZKHCEEeuDC61F/CXm/4quNGeG1zJjLCmXpc+Y2nLRvqRrv6h2djEc9
 HMbvcHFqJ0V5wpOrNlDr+8L//RgZxC6HdBd2TYIKMZxFY1YdPfrjV3lJx
 AV402JoI6ZsIyrNW13ebyoXXtLni0HoyTZpnmBKnmZlwjmn5mELGiybIr
 jL6xxyQTNnYXC3CrsIBMAcfaeTL/pGXkl5ChfLttKpCcmx15MBrXo99Vf
 mKkjntDKLD/wLLY1HdtwJLgsxQXRBSqJwvgViDWNr8ufjNVDUAB6hLMfy
 LDLWLbOZNic0dEzQigsMKP+J89eRZCCcl5j/3K3mpNY2LtUL+SVtSYe+L g==;
X-CSE-ConnectionGUID: YxDnYwsRSCGM1K0OxM+bbw==
X-CSE-MsgGUID: liUV54KfRn6W259lexuPRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72659704"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72659704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:25:35 -0800
X-CSE-ConnectionGUID: ltF25NoKQm67zh9coroaOw==
X-CSE-MsgGUID: XdhtJDbjS6iBXJ08u/0LqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="219361569"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.77])
 ([10.245.245.77])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:25:33 -0800
Message-ID: <0863281d-9e3d-48ba-89e3-3503c98407cd@intel.com>
Date: Fri, 20 Feb 2026 10:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] drm/xe/pat: define coh_mode 2way
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
 <20260220101638.1609775-8-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260220101638.1609775-8-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20/02/2026 10:16, Tejas Upadhyay wrote:
> Defining 2way (two-way coherency) is critical for
> Xe3p_LPG (Nova Lake P) platforms to support L2 flush
> optimization safely.
> 
> This mode allows the driver to skip certain manual cache
> flushes (L2 flush optimization) without risking memory
> corruption because the hardware ensures the most recent
> data is visible to both entities.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

