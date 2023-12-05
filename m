Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6CC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 14:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0CC10E550;
	Tue,  5 Dec 2023 14:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253FE10E550
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701785968; x=1733321968;
 h=message-id:date:mime-version:to:from:subject:cc:
 content-transfer-encoding;
 bh=yIUmlyy02z+sIsV9RgYYsOm2HhWbZg3KBg2P0XTK2XE=;
 b=JNdMWFH+anTjZ0NIA6njr7Nj+A5sMsEhTIhkZIRRELp+4vE+eDTx75D6
 hyMUq/PR5d0px0EHTaPJp8AMxCCH6v3m5ADUofbcdyk96NXAtJRL40dJt
 EvwSDlnkgbqjPN7pMjsB5ClPsVCm38/PT6uZadqGbHYzM7rZwafIPBQum
 BweyHqHZLOB5Z/y6O2RhMNzmfXABKmmSOqWnzzialm05q6svB/eHfuKA3
 EIkxS1G76Z8aLywJHgNgInFlZ3XjcfIdIfi9qRljyFIzYIj8l1yDIYmWi
 OLFUMaoETxpme6iM4sKOF48DNVIw5YyDRSdQ++pQnNghKtY3Zrc1TMMel Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7198817"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7198817"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764340240"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="764340240"
Received: from ctgorman-mobl.ger.corp.intel.com (HELO [10.213.202.242])
 ([10.213.202.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:19:25 -0800
Message-ID: <02c74379-6513-40cc-a195-c4eeb7a7fd79@linux.intel.com>
Date: Tue, 5 Dec 2023 14:19:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Intel-xe] LLC configurating, mmap and bo cache management questions
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
Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Carlos Santa <carlos.santa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi,

We are working on adding xe support to ChromeOS minigbm and have a 
couple questions.

If I follow things correctly with xe mmap caching mode is fixed to 
object caching modes set at bo create. For framebuffers it will be WC 
and for the rest userspace can choose WB or WC via 
drm_xe_gem_create->cpu_caching. (Unless discrete, when WB cannot be used 
at all.)

AFAICT minigbm basically cares about two transition points. Lets call 
them CPU access begin and end.

1)
When a bo is mmapped it wants to invalidate the cache, which looks to be 
about making sure all GPU writes have landed to the backing store. In 
the i915 world that translates to the set_domain ioctl.

What is the uapi for this with xe, or it is somehow guaranteed to not be 
needed?

2)
When a bo is unmapped, or CPU access finished, it wants to flush the CPU 
caches. That is /almost/ completely a CPU operation, where it just needs 
to either clflush or invalidate the WC buffer respectively, if not the 
fact that clflush can be skipped on platforms with LLC.

I did not see an equivalent of an I915_PARAM_HAS_LLC in xe? Did I miss 
it or what it is the plan for querying this detail?

Regards,

Tvrtko
