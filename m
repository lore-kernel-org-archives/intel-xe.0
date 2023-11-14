Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC5CC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA0D10E202;
	Tue, 14 Nov 2023 13:48:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E0310E202
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699969728; x=1731505728;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=CtxsZQJAkSUhFtTrBUUMCcy0g2JbZ34WcaKS+BnIPl8=;
 b=Y4YAa02BYH1zORo+lg3PGvWwf0vPwsc9umQvwiwtgWvlpoQ1yQJKi+pD
 wdiF/3+nxcOaTJxzNbsCWTfPoV9a0UuSKFwdy9pGApgzWfAahQdnJ2nI0
 MHqC7jum9Zbjw/KHuVLFj8TLObEcBGrwm1fqADGZQf7KbNfauiX9mXv4v
 vKEB6T0N/ftEYOjqW+MdQo+1cE/8XYeUqhBH2kMm0KSS5hK+ODXNYZQo+
 8ShFqVayj3qPxqkur1q11ZnxG95CbYqUGpm5iSJf+jgcq+h7Zp0U0u0d8
 owBW+9bLjcshlOxZ2t1virqd8f4k+FPcqeP9SdIPMaWjfgcOhr5XcHLUz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="394571261"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394571261"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="768249924"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="768249924"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:48:46 -0800
Message-ID: <2260c6b9-6d62-e8c4-a588-d7ec163ac166@linux.intel.com>
Date: Tue, 14 Nov 2023 14:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Intel-xe] PT encoding ops
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

Hi, Lucas, Matt

IMO ideally we should try to keep all page-table-encoding bit definition 
usage in xe_pt.[ch] (or possibly a separate file if we expect a lot of 
hardware variation). Currently it's in xe_vm.c, which is intended for 
higher level vm stuff, although I didn't succeed in separatating it 
completely. I sort of stumbled on this while looking at encoding a 
single NULL mapping from the xe_migrate code.

Do you think it would be possible with only two ops:

pte_encode_addr() and
pde_encode_addr()

And the rest of the current ops would simply be non-hardware-specific 
helpers that called one of the above. Those helpers could then be placed 
in xe_vm.c and xe_bo.c

That would mean a set of generic (non-device-specific) flags:

XE_PT_ENCODE_RW
XE_PT_ENCODE_NULL
XE_PT_ENCODE_DEVMEM
XE_PT_ENCODE_XXX

/Thomas


