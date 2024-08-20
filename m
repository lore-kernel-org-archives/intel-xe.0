Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF9C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 09:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7AF10E634;
	Tue, 20 Aug 2024 09:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXYVuYjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9137A10E634
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724146725; x=1755682725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hKJPXC6v35dcXvsnle/uYdnpCHQwkKrVKeohGU0xB30=;
 b=LXYVuYjtMdcJr+iJb7+5JH+eKNlYgQPcNigLejukp1ZLZw4HcoRNJ9LR
 FnhIGalmPhTDTgAEYtyM83SVpfs2RN2yIZiuuNfRT1cJ4uHsVArH2jp4V
 VdNG9lvCXCGFPx6AOfpTaemdVBXZvKlhex9Dlt++IS5A0amki3LF2tmrn
 NfxEfWPRLK7hzj/M8p2yz0XlEgJkTU9H1NyFR1c0ztRmw1lSYOzoSv65Q
 iYEh+ts/EFRHTBBrt2Yyiiv7yUE5Z5WDMg+oBqphcaZ7q0dpYUSlM+0C+
 TT4wo3PBp4jkt//MrSFb7ascl4k+21pl7zNfhYG2N8//Wxo9HxGBsxrYh g==;
X-CSE-ConnectionGUID: HWkLoFhFTN+c9g7X33qcnA==
X-CSE-MsgGUID: v6ptjTVZT6qhuc1TWNRE0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33822266"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="33822266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:38:38 -0700
X-CSE-ConnectionGUID: PIe/mFMXQkeBwL35BnDkAg==
X-CSE-MsgGUID: jtIBhy8dTbyN606zINq5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60324023"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2024 02:38:37 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 455B428775;
 Tue, 20 Aug 2024 10:38:36 +0100 (IST)
Message-ID: <a3651242-898d-48e8-913a-7a273744c0fb@intel.com>
Date: Tue, 20 Aug 2024 11:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/xe/pf: Add function to sanitize VF resources
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-2-michal.wajdeczko@intel.com>
 <4simowxl6oki4wr6aefawflhy4giewp3lx2kzaqo7dagjr6ud4@v3svwun32twc>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <4simowxl6oki4wr6aefawflhy4giewp3lx2kzaqo7dagjr6ud4@v3svwun32twc>
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



On 19.08.2024 22:47, Lucas De Marchi wrote:
> On Fri, Aug 09, 2024 at 06:51:48PM GMT, Michal Wajdeczko wrote:
>> +static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo,
>> long timeout)
> 
> it took a while to make xe use "vram"... now we are back with lmem in
> several places :(
> 

it's because GuC ABI is using LMEM terminology

if you really want then I can try to rename implementation side to use
'vram' instead, but question is what to do with debugfs entries that
reflects GuC ABI almost 1:1, should it also be named with vram ?

gt0/pf/lmem_spare	-> gt0/pf/vram_spare
gt0/vf1/lmem_quota	-> gt0/vf1/vram_quota
