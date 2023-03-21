Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC1BC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 11:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2690E10E098;
	Tue, 21 Mar 2023 11:25:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CC210E098
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679397898; x=1710933898;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lQZbgwCBrMep8M9XM5Iw1wxbn+lK+5smEtQJdsVSyhE=;
 b=QiQzqltHGb8HgpZphGFwSa4kzDp6SflVWC60Wy+mzWLTTYNVagec9X41
 3g8iXY8wewKTaGmUHXkP/b23tHjMZSAoAEwp5sj+IA4rkNJMO6cccoufa
 HekLFm8vIEO7AQuFUHSg/iY7QEQxuclKnZ6Rq4mqVNVw6WIc9uJv4p2Bl
 BMenS0Y/frmLB0dtUPSWJfBF9JcpY4/NpifES/a3oerY/P+NHSlW0H02Y
 Lok1MWmPd6n3x8qdvBB+L1KGuJDNcAMycCUkfG1c4Ya5pM3co4Pf93cTr
 jg3zcLTyLYhav0fE+AHFStvFCFr15nh7JRwsjXNXPCvduj2MaHJtmU8Yc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340455866"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="340455866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681450985"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="681450985"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO [10.252.25.208])
 ([10.252.25.208])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:24:57 -0700
Message-ID: <7923b33a-a1dc-8893-2340-d1393d754c25@intel.com>
Date: Tue, 21 Mar 2023 11:24:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20230321104529.157616-1-matthew.auld@intel.com>
 <20230321104529.157616-2-matthew.auld@intel.com> <87fs9y8idz.fsf@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <87fs9y8idz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v7 1/2] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 21/03/2023 11:15, Jani Nikula wrote:
> On Tue, 21 Mar 2023, Matthew Auld <matthew.auld@intel.com> wrote:
>> +	XE_BUG_ON(min_page_size < mm->chunk_size);
>> +	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
>> +	XE_BUG_ON(size > SZ_2G &&
>> +		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
>> +	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
> 
> Hijacking the thread, sorry. ;)
> 
> If we are supposed to not replicate i915-ism, why do we have
> XE_BUG_ON()?
> 
> I think it's an anti-pattern.
> 
> Currently XE_BUG_ON() is just BUG_ON(), which should not be used for any
> reason. Not even CI. The plan in i915 is to migrate all of them to
> WARN_ON()'s and use panic_on_warn in CI.
> 
> The other thing is that having BUG_ON() in the name gives you the false
> impression that it's sufficient for input (or any precondition)
> validation. In i915 it gets conditionally built for CI only. So we catch
> errors in CI but not in actual production use. You just plunge on.
> 
> Part of it is just naming. The BUG_ON() association is pretty strong for
> any kernel developers. If it were called XE_ASSERT() it would have an
> association with assert() that does what XE_BUG_ON() actually is: code
> is only generated for debug builds.
> 
> In i915 it has become habitual to sprinkle GEM_BUG_ON() all over the
> place, just in case, belt and suspenders. IMO there's not enough
> discretion about what can and can't actually happen, and what can and
> can't happen in CI vs. production.

Fair enough. The above probably should have just been WARN_ON(), along 
with returning a proper error. Will fix, and keep in mind for the future.

> 
> 
> BR,
> Jani.
> 
> 
