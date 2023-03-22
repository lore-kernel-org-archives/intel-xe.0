Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E48FC6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 12:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88BA10E934;
	Wed, 22 Mar 2023 12:44:55 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F6D10E934
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679489094; x=1711025094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8OnmCyzoTGh+NqRVevwsRBIM9UK4V44yrxaRPSZ/pqY=;
 b=ETy3w9xWBzZK/c2Vm7U/7AbDpMgYMZ06hdhrtQY3gsHWccsQ2p6KgQd4
 S+dr0PvqGxlU8L6trCa3W3yDkP06Xx6Ih4/Hs1lpsHMfapRFnIiTtCv3u
 79qJQWUyWjpX2reJvY4Y5u6k6y5hGuDUVhYkFRLNv7FvLD/s/wRzkUGsF
 BLvgXS3yY9VOca+ihKj2AOEj94wpJ9b5NFHZ5tgsCrugRmSgS9w3KNPBE
 8sxHRHTEeWtNjEWgIaWstYEcQOpMJfZW5BGS4tPDYRjAVyjjlKA2806jf
 51a/MJKQVSjIeNz5njSQHny5DLdsiVPf1itNDC2B3YYSbDJNiE1MhCX3y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401771599"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="401771599"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825382254"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="825382254"
Received: from mryzhov-mobl2.ger.corp.intel.com (HELO [10.251.222.140])
 ([10.251.222.140])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:44:48 -0700
Message-ID: <832e2a64-ee76-15ff-b567-bc25d742b8d8@linux.intel.com>
Date: Wed, 22 Mar 2023 13:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
 <ZBnBiLcpjSOhgbXM@DUT025-TGLU.fm.intel.com> <ZBoepzf/llmw16rr@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZBoepzf/llmw16rr@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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


On 2023-03-21 22:16, Rodrigo Vivi wrote:
> On Tue, Mar 21, 2023 at 02:39:04PM +0000, Matthew Brost wrote:
>> On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
>>> xe_guc_ct_fast_path() is called from an irq context, and cannot lock
>>> the mutex used by xe_device_mem_access_ongoing().
>>>
>>> Fortunately it is easy to fix, and the atomic guarantees are good enough
>>> to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
>>>
>>> As far as I can tell, the runtime ref in device access should be
>>> killable, but don't dare to do it yet.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> so we can unblock PVC.
>
> but we might re-thing the mem_access in general and consider
> some serialization like 'foo_' example at Documentation/power/runtime_pm.txt

Thanks, pushed.

We will probably need to do something like that on the longer term.

~Maarten

