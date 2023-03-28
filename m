Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB795C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 21:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEFB10E4AA;
	Tue, 28 Mar 2023 21:03:22 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149C10E4AA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680037400; x=1711573400;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BlV4rR4GT2YJY88I6QSycM81Q8Qqjtv6o1VYKx5UytM=;
 b=IZAV1u3iIJ6grkqC2b2qq/izG/fjASGe/d+YDmc7VcfinCKmO0rr/4+j
 QBMgW95leM87iHtFVb6MB9XQoTfogoGBcy8PJHRpx6BUkkViGO2IsIUx2
 ijW+1Ht+xEOwVxXmfFteu2OH3ipL3QIXpq9cxqshQ6aQ3Ki+Ju+4WAJe2
 QzEH7B9Vqhy0aLWVD/eB3Du5aTKJJGKQwNYz6XS/whgwWi8gc8c0BGFFa
 hBMoOII5zPLRbS5rWcsbckkE9jLJAxGEOhVno2BQbrFTcNgnDqhk5gjit
 azte2zR+9bjwYMhFJtDVj6aifF06Cr31pgg8FK3cNu7w0XcqqUTxNqUKV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339418020"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="339418020"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="661338810"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="661338810"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 28 Mar 2023 14:03:18 -0700
Received: from [10.249.149.19] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.149.19])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 12762340DF;
 Tue, 28 Mar 2023 22:03:16 +0100 (IST)
Message-ID: <09b3de5d-4b8a-bf41-5e18-c583958b39b1@intel.com>
Date: Tue, 28 Mar 2023 23:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
 <20230328161021.669017-5-rodrigo.vivi@intel.com>
 <20230328202446.GL4085390@mdroper-desk1.amr.corp.intel.com>
 <fbd73cb1d45a956ed723ba4806e38c78337b37e0.camel@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <fbd73cb1d45a956ed723ba4806e38c78337b37e0.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe: Remove useless XE_BUG_ON.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 28.03.2023 22:27, Vivi, Rodrigo wrote:
> On Tue, 2023-03-28 at 13:24 -0700, Matt Roper wrote:
>> On Tue, Mar 28, 2023 at 12:10:20PM -0400, Rodrigo Vivi wrote:
>>> If that becomes needed for some reason we bring it
>>> back with some written reasoning.
>>
>> From a quick skim through this patch, most/all of these shouldn't be
>> BUG_ON either.  These are assertions that we don't expect to get
>> triggered, but if we do screw up somewhere we shouldn't be bringing
>> down
>> the entire machine; a WARN (and possibly an early exit) would be more
>> appropriate for most of these.
> 
> yeap! I fully agree on that. I get frustrated when I hit one of these
> BUG_ONs that should be a graceful exit with a warn without a panic...

Recently there was another discussion with proposal to introduce
XE_ASSERT as a replacement of XE_BUG_ON - is this still considered ?

We likely don't want to pollute production driver with too many
redundant BUG_ON/WARN_ON, but still want be paranoid on debug builds
(with just WARNs and continuing until the unavoidable crash).

Michal
