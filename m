Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69493CEFC32
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3718310E0DC;
	Tue,  8 Oct 2024 17:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cX+mnJ3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4F210E0DC
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407036; x=1759943036;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HAV/Jm6qijsMXWQhK8AnNkZdhzKDWsDYLCbdtxFmr40=;
 b=cX+mnJ3QWaLQrUtebAksVOCWJXoFqXZ/v1CSVYJyHNoReDmuj9fQ5F/X
 57i3rd4Aon79YOKHxzr9do8ntijZvdRIVWoTUe0lw0p3wF+JTe5xcWMyV
 vNM2fjdxMxIZsi5E/CLD/g9FDU6+z1l3J9FmS7JXONa38A5tiAOgM+WEU
 JAn+FW6jjQste/6JHDJk3mSaL5EOD5aSEeIDcWGg9acHSobQGh6UaeUom
 wdwFHk4y4BA2fdnR2sVZfR77aHKx5QxS5aixL9g11SVH+BuYZcQAJqmRz
 KIfgk6OIRD2PrZzAaBzYmJYlDwLLu8d9xh6xleLIxbh1Wyo3b+6CRKgfq g==;
X-CSE-ConnectionGUID: SoYC4pJERvqhI1J/QHBzSA==
X-CSE-MsgGUID: p6cWw4eyRxCd4KrDD154hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38279753"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38279753"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:03:55 -0700
X-CSE-ConnectionGUID: MUgc41xlTtO3UaoQwD7nEQ==
X-CSE-MsgGUID: yYS1EU6KTGS58Eu//Itj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="106735497"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 08 Oct 2024 10:03:54 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 147072FC5E;
 Tue,  8 Oct 2024 18:03:52 +0100 (IST)
Message-ID: <520b1136-bf98-49a7-8b94-179661079873@intel.com>
Date: Tue, 8 Oct 2024 19:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/26] drm/xe: Add member initialized_domains to
 xe_force_wake()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241008071115.1862704-2-himal.prasad.ghimiray@intel.com>
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
> This field serves as a bitmask representing all initialized forcewake
> domains on the GT.
> 
> v2
> - Move awake_domains datatype change out of this patch (Michal)
> - Rename domain_init to init_domain (Michal)
> - optimize alignment (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

