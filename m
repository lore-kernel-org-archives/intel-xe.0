Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB86CEFC38
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EBA10E23A;
	Tue,  8 Oct 2024 18:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="St/rC1PT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2739B10E23A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728411896; x=1759947896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ex9ybS/eeILQE15bMrVZ26pDsy0IvlqAKZVr5NpA6NQ=;
 b=St/rC1PTKzmFPO6HYOt1NMECtGyMoZ1I4nCZ4hBjKx22d2a2X9fKF+ME
 aXSkLQDICuYmaTnMb6bcILtOZu/QIvrBJPWXl4w5WZtVB38MFXW+NVnR6
 vJnIh9ijsEV4uAuUF52zPJ0be4CiIR283rnFg8yCd55T5QRSuF3Ro1TPk
 peOlK44fSGteTIuk5waUCGDyr0CCGMigwLBYg27Qno9MYM+30NgppKzgH
 envhiggg9SIiTgGMjUFPDbacV620U841rcmTlf/SO7s9ZZv7CFdFAVcg3
 hRum7uE8kb1G98D95NaRzSyKGfWwjVM3YulC5mqHnrUxDjlR4CItBj0yC g==;
X-CSE-ConnectionGUID: nuxjy7WESZiGK/mE/iyC8w==
X-CSE-MsgGUID: GD2PbEfyRgS3mFgrpM0sog==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="30518129"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="30518129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:24:55 -0700
X-CSE-ConnectionGUID: nEcFEda8R6mdK/Iv73Rg3A==
X-CSE-MsgGUID: EVz/c3haTauh32ZJs3Rxaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76051667"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 08 Oct 2024 11:24:55 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 964E32FC5D;
 Tue,  8 Oct 2024 19:24:52 +0100 (IST)
Message-ID: <5a9d64bf-4379-4aeb-868f-c403f7b411a5@intel.com>
Date: Tue, 8 Oct 2024 20:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 26/26] drm/xe: Change return type to void for
 xe_force_wake_put
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-27-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241008071115.1862704-27-himal.prasad.ghimiray@intel.com>
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



On 08.10.2024 09:11, Himal Prasad Ghimiray wrote:
> There is no need to return an error from xe_force_wake_put(), as a
> failure implicitly indicates that the domain failed to sleep.
> 
> v3
> - Move kernel-doc to this patch (Badal)
> 
> v5
> - change parameter to unsigned int in xe_force_wake_put()
> 
> v6
> - Remove unneccsary wrapping (Michal)
> - Remove non required header (Michal)
> - Mention timeout(Michal)
> 
> v8
> - Fix kernel-doc
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>(#rev5)
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

