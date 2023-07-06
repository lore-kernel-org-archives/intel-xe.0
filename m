Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA2FEB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 15:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5D10E407;
	Thu,  6 Jul 2023 15:48:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E6B10E407
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688658505; x=1720194505;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/QUzWqtP1zn8oS69KJBdMlp7znz4VNlo+jU1z5l+5lc=;
 b=gguD+6AYSA8RD4/gL80dzWKMFosOCmMVuxX1LBTtNKHKz0G/DaDFKl72
 KtwGF2r8XZAH0Jd+cvPsb50HOXXbqXTc0dkVwXS0UV8nUERLd4FAziuW7
 DDzVs2C0wQKqkbIbmtei3s7MIKE0WgK5w4/HEtv0KYIF5V7Jcy8CkxmMj
 00FNYS82ftqImWutWebtLwaascBxZwiNFLqs+8b4SSmETuBOj9ADA91eS
 bMvrtHPKDTuHpDurLRPYvUmnED+oW7CCo72t9Wn0B2/VaJRSrAR5X8bAU
 l/VSqirD8aAWulfORes0MIeE8vi1pEt43dU0cOudTluPLb0U1TobrlHWL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="367129356"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="367129356"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="966282644"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="966282644"
Received: from fmahon-mobl.ger.corp.intel.com (HELO [10.252.26.229])
 ([10.252.26.229])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:48:08 -0700
Message-ID: <b463e151-aa1a-409d-f6b5-f07809ce02ff@intel.com>
Date: Thu, 6 Jul 2023 16:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <e968685ecd7bfc330dde20b885f826549e6c6e51.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e968685ecd7bfc330dde20b885f826549e6c6e51.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v4 0/7] Try to handle TLB invalidations from
 CT fast-path
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

On 06/07/2023 16:23, Souza, Jose wrote:
> On Wed, 2023-07-05 at 17:06 +0100, Matthew Auld wrote:
>> In various test cases and workloads that put the system under a heavy load, we
>> can sometimes see errors with missed TLB invalidations. If we handle the TLB
>> completions directly from IRQ we can see a big improvement.
>>
>> v4:
>>    - Various tweaks. Big thing is to make sure we grab the fast_lock for the g2h
>>      reservation when doing the CT send, which closes one big race with the CT
>>      fast-path.
>>
> 
> Looks like the __g2h_release_space() warning are now fixed for good now.

Thanks for all the testing.

> But got one 'TLB invalidation fence timeout' while starting Xorg once on a TGL, not able to reproduce again... https://pastebin.com/UFqQ4G7Y

OK, there is one more race that Matt spotted...

> 
> 
> 
> 
