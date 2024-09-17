Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CFECAC599
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 19:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943E10E179;
	Tue, 17 Sep 2024 19:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5qjt3d3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7A510E179
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726602807; x=1758138807;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h+LwxHVJBgcHPLusvXk0u4+Uc42sXYJbZ7NHrvE97JQ=;
 b=U5qjt3d3UZHiV1bjFR6qbI7XoWZseuMctPKjGT30hpJguRTyQQ6lMeNV
 39deHlflMkLuP8utrQD4+mFkhHLJ1FyKLdOC7SDej6buTmiTfb9QSDekp
 i3SP6IDLgcqiT39PbP0MgPsUJFyT/3gA9jrV6TEg8zJa4BMVoQHl02Zt5
 U1Y3ITk5f45ieC47qPHYXAQ7nuSoGKSe4ebv8u0S/fUSvBcNAPzOMnpu1
 lZb52MGRCIoBOpsUWYdXQRCSzLeXQbpyAuef6zHVTs9BQypLhGVO9wZ01
 jGc/7aPt5MAiXS/qGeuytAHF7QjfTZw8R0kzUljBPkXx2RayUqzr3bICE w==;
X-CSE-ConnectionGUID: FabLu0WXTliWn0IfektYHw==
X-CSE-MsgGUID: hkgixUGERnaB9ZXYI4XsyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36053433"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36053433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 12:53:26 -0700
X-CSE-ConnectionGUID: /+Os8IWNQWCa84/jlaLVaA==
X-CSE-MsgGUID: JLHUbyM9SGmA69Kqz48xDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73397769"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2024 12:53:25 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 45AE7312D3;
 Tue, 17 Sep 2024 20:53:22 +0100 (IST)
Message-ID: <de0b4f71-590e-43cf-9f7a-3299290f0297@intel.com>
Date: Tue, 17 Sep 2024 21:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/xe: memirq handler changes
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240917112307.1242329-1-illevi@habana.ai>
 <20240917112307.1242329-6-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240917112307.1242329-6-illevi@habana.ai>
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
> Expose an interrupt processing handler for a single hw engine.
> Refactor code to use this handler from the VF.
> This handler also caters for the MSI-X mode, where the hardware engines
> report interrupt source and status to the offset of engine instance zero.

nit: maybe you should also add here that "this new function will be used
soon in upcoming MSIX enabling series."

> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

but still LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
