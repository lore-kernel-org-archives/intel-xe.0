Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4C6E6B27C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 13:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4649610E2DF;
	Fri,  1 Nov 2024 13:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMpFKnhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A0410E2DF
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730468660; x=1762004660;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=67HjPmbKYCAr4uQ095Emn6CUZGx1r07vJjgEtU/0ZfA=;
 b=bMpFKnhlQ5KOwC9MaTB4jMcZJbDtVF9Ym2uB5jHr6XGXYFcVFFY3AlDL
 mmsWBiJrXBRontIHjTuTf86p1N5MBjolb2zILYuZXTR739x3fRCcDRSPU
 FDoyxyoepDlncSL79AKL9axeJ+pDz2qgkaxVK4GGbWF2GyIJi5gFWrnLw
 RbvpnqtpOv7EaXVSaZ56OjZe3I0S1jP0yebUnqH8n0F6vnKQ3k+HcyD1Z
 cZDJWf5k497yhQNChDZDr8tWnhKjpJNYVCGM5o2xsLGoBmkUp6gqTCRhf
 iOmGeuULcer/c9Ch09oCTBFksbcTcO2xrAWd8EewgxQ4xXXHgbBGWOlHy w==;
X-CSE-ConnectionGUID: QY+4Xnd6SVaCWA0hl5yCaQ==
X-CSE-MsgGUID: murKj1tETDyVLVdxmeNZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52799912"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52799912"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:44:20 -0700
X-CSE-ConnectionGUID: 1Icn4DtZQ8KDsztBkXvUSA==
X-CSE-MsgGUID: oaKBJx1ySTSLQNqmox2+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="113750397"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.196.144])
 ([10.245.196.144])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:44:17 -0700
Message-ID: <65a8fa25-0c14-4251-ad22-8f4b31be0d4e@linux.intel.com>
Date: Fri, 1 Nov 2024 14:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe: Move LNL scheduling WA to xe_device.h
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
References: <20241029120117.449694-1-nirmoy.das@intel.com>
 <afd4adf1-5220-40ff-816e-da588b74fadc@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <afd4adf1-5220-40ff-816e-da588b74fadc@intel.com>
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


On 11/1/2024 2:21 PM, Matthew Auld wrote:
> On 29/10/2024 12:01, Nirmoy Das wrote:
>> Move LNL scheduling WA to xe_device.h so this can be used in other
>> places without needing keep the same comment about removal of this WA
>> in the future. The WA, which flushes work or workqueues, is now wrapped
>> in macros and can be reused wherever needed.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> cc: <stable@vger.kernel.org> # v6.11+
>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks for reviewing the series, Matt!

