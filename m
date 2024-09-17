Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43417CAC596
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 19:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F406010E1D1;
	Tue, 17 Sep 2024 19:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8EYMEJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A48210E1D1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726601391; x=1758137391;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8MBRwJFHsHZVMBuQP/8hR9tkg5VU6jJ7FQhU4y9z+FE=;
 b=W8EYMEJUlkDrY7nNOaTaLiS3BspG3RJvNd0ewIEAin+oCj+6gt8yiG59
 eo38ho/3C2Pd8KW3IOzFRF2TbPK9rzWMkDZli97nE5YdLpF8B02D6sPhg
 ri7CSIRT1qqqhE2Lya5quC05BXePzUDC7CPi9R6paanFU60fUdG6SqxuK
 9lwmYKqyjHYqohP5dCWB9JjIbQ4qKSU/tVHUn2YDLAedLK71A4zbThQTZ
 yWBQGH9hozf75mU2oM3C6vBB5MDnMj4z9U2wMoeazqMyhYhfmhVuJLTKa
 heLrG/ML3xccYnlW+OB6EkGsTMD8tX2SXLd9VqwJaEX6q0353bpl9vQJh g==;
X-CSE-ConnectionGUID: 56tC/N8CTZmIUF1q9EnAGw==
X-CSE-MsgGUID: taooYLVMRpWcp4lNdv7yWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="50894720"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="50894720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 12:29:51 -0700
X-CSE-ConnectionGUID: +BviS+ctRUiQQt0iDAwCtQ==
X-CSE-MsgGUID: 3GooDfbMTzmABb/mwiTIdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="92606462"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2024 12:29:49 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C1C5F312D3;
 Tue, 17 Sep 2024 20:29:47 +0100 (IST)
Message-ID: <96b4ae33-1a0f-4823-8774-23c9e4a448b1@intel.com>
Date: Tue, 17 Sep 2024 21:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/xe: memirq infra changes for MSI-X
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240917112307.1242329-1-illevi@habana.ai>
 <20240917112307.1242329-5-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240917112307.1242329-5-illevi@habana.ai>
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



On 17.09.2024 13:23, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> When using MSI-X, hw engines report interrupt status and source to engine
> instance 0. For this scenario, in order to differentiate between the
> engines, we need to pass different status/source pointers in the LRC.
> 
> The requirements on those pointers are:
> - Interrupt status should be 4KiB aligned
> - Interrupt source should be 64 bytes aligned
> 
> To accommodate this, we duplicate the current memirq page layout -
> allocating a page for each engine instance and pass this page in the LRC.
> Note that the same page can be reused for different engine types.
> For example, an LRC executing on CCS #x will have pointers to page #x,
> and an LRC executing on BCS #x will have the same pointers. Thus, to
> locate the proper page, the pointer accessors were modified to receive
> the hw engine.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
