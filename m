Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA30EC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 12:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229710E00F;
	Thu, 10 Jul 2025 12:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abVKfqze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D6E10E00F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752149181; x=1783685181;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YtaRk4ND4uD6SNoqoXcLapItr29doLlOcpwe/5qUgDM=;
 b=abVKfqzeBu7DrgsrE22EtbhVin4+RzfPMzrDE04KM0YUfb62EmOChrza
 ap8pFlgBPJH3rFUrIA6liG0SObG2FpfbXn4L/c/BTkJm6E9EFnjU3AcPs
 wudCVmsXMoAWJKB6FzeZrDqDYM2ATwQzQ/SH0MD2/v6GLUL3BulVEJGcI
 X5tkdkyaq+LtCNotIZvz6Er2yvorGDj2UEdqyixgmMyVzHCIjGenK5ShE
 dg/cxrmTY00PGormgHVts+gO8p9Fn4nOfi0imCF+rj+ripMyRpXnzpjrD
 o/zfl49Z2YXhoNlVC8PIrfZKZeQfv/xRBdRDjQiMoGpFQG3onVxIGly5U w==;
X-CSE-ConnectionGUID: uQftisemTPuHa0gzgFiUIg==
X-CSE-MsgGUID: WGi4dAK1SY+CCfMuw/4jdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53538352"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="53538352"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:06:21 -0700
X-CSE-ConnectionGUID: /H1/t2MBRaqQJqV0iPwSVw==
X-CSE-MsgGUID: zmI/c3LVTBm2M8LL6W7m/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="161726252"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 10 Jul 2025 05:06:21 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3AA3E28798
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 13:06:19 +0100 (IST)
Message-ID: <c88b2d7a-78dc-46c2-8f88-c5392b489714@intel.com>
Date: Thu, 10 Jul 2025 14:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBQRjogUHJpbnQg?=
 =?UTF-8?Q?debug_stuff_using_debug_printer_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20250604190021.725-1-michal.wajdeczko@intel.com>
 <175169480796.137013.5432727712372657301@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175169480796.137013.5432727712372657301@1538d3639d33>
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



On 05.07.2025 07:53, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Print debug stuff using debug printer (rev2)
> URL   : https://patchwork.freedesktop.org/series/149849/
> State : failure
> 
> == Summary ==
> 
> ERROR: The runconfig 'xe-3340-78e7d701d4c6a7044f032be1ef0780b17ea17a3e_FULL' does not exist in the database
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149849v2/index.html
> 

whatever results diff would be, since series is only touching code under
CONFIG_DRM_XE_DEBUG_SRIOV, it can't introduce any regression

