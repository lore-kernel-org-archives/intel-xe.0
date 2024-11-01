Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C549E6B27B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 13:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FCD10E9BC;
	Fri,  1 Nov 2024 13:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Slww6ePi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EAE10E2D7
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730467322; x=1762003322;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sl65pNdL+vhy6fiRdH8AVzPc+fTP4JD7HNRvpzPQJEU=;
 b=Slww6ePiaZBzTNhjMMatupLClMD19hwANaINsgQI8BpjW3bO5d7+VeY7
 da08OONkT4T2u6N5qJzPbVVlSgQeDAxfi7vlVTcvLXwjch6SdzRKwAh8g
 eZ/WREC9CGLskhKC0EKgvi/Oibc3b6x6qG3+0TnjiAIhT8AWQISEQnTMw
 7NkMxVI+W9H8vvymioAoSeZrxiUhOfYfgnAUx6sCe/SKUFZc4XvZQomLE
 9LYuSJeeIy4PD8qKaW7ROI15Ls3sCSUfNdOU1ByLB7Ek+3hJfwM/MydVb
 Agbe02LAbLaSi34PAN4J5mEH58Rmt2VCQkBrrDUVXUnou6iggTyZ3DHZd g==;
X-CSE-ConnectionGUID: ZYW1aBlERSOXLXaQ0vnYJg==
X-CSE-MsgGUID: W93auoorRTaoyTagaHalpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="40814700"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="40814700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:22:01 -0700
X-CSE-ConnectionGUID: pLeL0BrdSA+dwV7JmSiRdQ==
X-CSE-MsgGUID: 4aXaXWmsTdudMqTOwUSHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="82645265"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:22:00 -0700
Message-ID: <afd4adf1-5220-40ff-816e-da588b74fadc@intel.com>
Date: Fri, 1 Nov 2024 13:21:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe: Move LNL scheduling WA to xe_device.h
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
References: <20241029120117.449694-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029120117.449694-1-nirmoy.das@intel.com>
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

On 29/10/2024 12:01, Nirmoy Das wrote:
> Move LNL scheduling WA to xe_device.h so this can be used in other
> places without needing keep the same comment about removal of this WA
> in the future. The WA, which flushes work or workqueues, is now wrapped
> in macros and can be reused wherever needed.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> cc: <stable@vger.kernel.org> # v6.11+
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
