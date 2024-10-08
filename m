Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2D3CEFC30
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CD610E0DC;
	Tue,  8 Oct 2024 17:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1j84+hs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0F010E0DC
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407088; x=1759943088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lQ7/GPcMlcAojgi0pVvfKDnDRe5/1pbtRtjY2lQK9RI=;
 b=d1j84+hs1KSnqs3TtoWoypffEto+veMp/KXH1NRHKysf25btWBfQrLM/
 Xjcz8u2W8o4nnEqJMWWiYyfLuCCB5ouO/p/q5YfwemLysjZI/P5WWS6KQ
 aVr+OEsjLSntnbt9PRAROFvtOoef+Fqfp5WyxdrAQ1qnm96bv6ZrSa0Th
 vWz4fooaMAnaSsOCF01sZIzwvrZV5IGm9R7YGSjz+eB82UT4BCpB6qEsx
 KPzsys4SbLEpt9lmJun06Zimi4jPU5InRrez3FhdZwGgwdxnoE4jCFWhp
 PxY8vA/06wSzA9n+LSAe03HoUJKwoSK3dd6qQ+EP0zxMg29ASOpsSFf9H w==;
X-CSE-ConnectionGUID: tTDd1uCcShS8vz0wzj7fVw==
X-CSE-MsgGUID: WlmcFvOGTbGyIkRMJJ6Sgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="15243427"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="15243427"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:04:47 -0700
X-CSE-ConnectionGUID: z3Me2X6SSviQwwRKVYSx6Q==
X-CSE-MsgGUID: y2eGWyEYTb6Nke+9iy/kRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76333446"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 08 Oct 2024 10:04:46 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0CC292FC5B;
 Tue,  8 Oct 2024 18:04:43 +0100 (IST)
Message-ID: <4376cbf8-d2d1-45c6-be30-94f032ff663e@intel.com>
Date: Tue, 8 Oct 2024 19:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/26] drm/xe/forcewake: Change awake_domain datatype
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241008071115.1862704-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 08.10.2024 09:10, Himal Prasad Ghimiray wrote:
> Change the datatype of awake_domains to unsigned int to accommodate
> values that differ from the enum xe_force_wake_domains.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

