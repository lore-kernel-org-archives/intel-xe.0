Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18867C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 07:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BC010EAFD;
	Thu,  6 Apr 2023 07:45:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6962310EAFD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680767100; x=1712303100;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BEaF+yb6WlHG3dZmpHJaTvud7t56YaomrpPV/mDJbkc=;
 b=STDDbi1TwbhLWBCcfMXalsSqiPqfLRR2QJgtGLuv4VvIYaMBOeRvh5NK
 CNraDKcqrpZfYItnyxULi2pj+fkUPMmxQ66cmNlNFuluEDlCYZU/+Yfmb
 DhW0sXbZX6e1amPaNzs/WHZcVBGJfC4t3duGiZqzc8lh1f8Dm2h6tz8Zo
 FpxrUXHKZTL9lz+g5/YvyZ9eM3Ahm55SGEkBqJtPmw087jCsz8ZYdn97f
 mePGrRkLYLNVjG7dMZC7U/UDh+msc/CwP4CYn6XYxvsU49Jye0LspAj4+
 Qg7GDOCeG1l7lWuwXKzT0bOGfFgsjDMasY9SIXpF7lGUmX2M3M1Gzmuqt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407768653"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="407768653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 00:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717358269"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="717358269"
Received: from radustef-mobl.ger.corp.intel.com (HELO [10.249.33.56])
 ([10.249.33.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 00:44:55 -0700
Message-ID: <53d3da15-3aa6-68d5-1115-c9795d4f83ed@linux.intel.com>
Date: Thu, 6 Apr 2023 09:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230405233403.151088-1-matthew.brost@intel.com>
 <20230405233403.151088-3-matthew.brost@intel.com>
 <ZC4/rAOBkwv6z2Ed@nvishwa1-DESK> <ZC5AIY7zIQdm2z3v@DUT025-TGLU.fm.intel.com>
 <ZC5JSj7jzd5TGXUP@nvishwa1-DESK>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZC5JSj7jzd5TGXUP@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop coalescing of GGTT
 invalidations
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-04-06 06:23, Niranjana Vishwanathapura wrote:
> On Thu, Apr 06, 2023 at 03:44:33AM +0000, Matthew Brost wrote:
>> On Wed, Apr 05, 2023 at 08:42:36PM -0700, Niranjana Vishwanathapura 
>> wrote:
>>> On Wed, Apr 05, 2023 at 04:34:03PM -0700, Matthew Brost wrote:
>>> > Causing a bunch of hangs driver load and in user space. Benefit is
>>> > rather small too, so just drop this for to stablize the stack.
>>> >
>>>
>>> Looks like this should instead be revert of following patches?
>>>
>>> drm/xe: Coalesce GGTT invalidations
>>> drm/xe: Pad GGTT mapping with an extra page pointing to scratch
>>>
>>
>> git revert conflicts...
>>
>
> Looks like a minor conflict.
> I am seeing reverting above patches brings back some XE_BUG_ON()
> checks and a xe_ggtt_invalidate() in __xe_ggtt_insert_bo_at().
> Wondering if we need them as well.

What is the exact bug? Might be not rejecting non-64k aligned pages.

~Maarten

