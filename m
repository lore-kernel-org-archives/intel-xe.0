Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D2CC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 09:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FC710E68A;
	Thu,  2 May 2024 09:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFG3e7+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5010E68A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714643364; x=1746179364;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/IJqzW0jLpW4FOuasd8lYe+tT137UYmPj62NJOLI8SM=;
 b=FFG3e7+ZB3FOvW+EGlbCkJ/9bN9nKVBR6HDcfnfcwzYYXuNE07u1QeCc
 aPaLrGfWh/c9oEt6bE0uEw6mOxizQpp3D31BxEMiLFhhK/gtJf2YuhxwX
 ACVuw4+UDM7EkknqIvdgNdD8L44TnlNRD4qFkgA6F+XAt48g0sYBY7GMv
 0eBAuGP2O/UbmCKXwZxuD6MBaFU1CCF8PoCwBfIO9REgUOfZHSUBwtxzU
 i4WfrFPqXEPhxkj4eyJQqi0Bh0tCCoVcIb76p6C0qPQmp8VcE3m/QhJUe
 P3O21aUZIfZIJ0j9dA+O0mkj2DtIewnw6JtftipBgIWfZtTA5va9rN9hp A==;
X-CSE-ConnectionGUID: ozrv0UVVSCCBUdHXovuzZw==
X-CSE-MsgGUID: a1L1Bc7wTVG0lmyuQCWmBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14208689"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14208689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 02:49:24 -0700
X-CSE-ConnectionGUID: 9Iexnq0HREqbMpmdlXDCqg==
X-CSE-MsgGUID: oE5iREn5TwqiqA00mK2PCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27080810"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 02 May 2024 02:49:23 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 273EB2878B;
 Thu,  2 May 2024 10:49:17 +0100 (IST)
Message-ID: <d0d5a86c-3234-4cfc-b41b-f0b164d2e287@intel.com>
Date: Thu, 2 May 2024 11:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] args.h: add more helpers for manipulating macro
 arguments
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
 <20240501223221.2395-2-michal.wajdeczko@intel.com>
 <ZjNAWXbyNqnLIB-L@smile.fi.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZjNAWXbyNqnLIB-L@smile.fi.intel.com>
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



On 02.05.2024 09:27, Andy Shevchenko wrote:
> On Thu, May 02, 2024 at 12:32:20AM +0200, Michal Wajdeczko wrote:
>> Some advanced macros used to generate code may use helper macros
>> to manipulate the argument lists. Define generic helpers that can
>> replace existing local definitions and allow reuse by new code.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> In general I have no objections, but as I pointed out in the reply to cover
> letter the statistics is a bit scary, i.e. we add too many lines without clear

with another spotted potential user (macro FIRST from bpf_probe.h) and
without comments those statistics will look like:

 drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
 include/linux/args.h                | 26 ++++++++++++++++++++++++++
 include/trace/bpf_probe.h           |  7 ++-----
 4 files changed, 40 insertions(+), 23 deletions(-)

> benefit. Anyway, if people okay with that my tag is above (but also pay
> attention that args.h is used in dozen of cases, including headers, right now
> and this extension may affect a lot the build time of the kernel).

not an expert here, but I guess the cost of parsing another dozen of
lines should negligible compared with opening hundreds of other include
files during compilation ...

> 
> This also has to be sent to LKML.
> 

sure, will do, but first I wanted to collect the results from our CI

Thanks,
Michal
