Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA04E810DB
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 12:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC1F10E502;
	Wed, 27 Sep 2023 12:35:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F0610E502
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695818129; x=1727354129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hlPN2X3xZezpwCwb955cXtxvso7L3o5LJnyu2htbwyI=;
 b=ii00+m5DxaGa2Bb86rmr75nI0VI1Ct3Ym7K9ik2XGX4J/9sIRLGV2CqN
 V6n3n+EoD1yh7lSWFJaoTUQtO+sNUF53vFvPw3K8ECeRfoFmHzxpLLqgY
 renPNOoR4XK8rhdtweS2XYbPBZ/CdGq1MLmJ7XXpaGab3lpzM5kOK5hbq
 hN7KWj5cgd/zwIOsgFv8Gu2raiLgBCAAsRNriDfBgbfsKiwW9Canebh2F
 zjs9pMHisSCle9qwcxzCLYOK/2s4RH4ER8i2EdFc+v8l+gHZru4YaimQO
 nwGq3TsjuifUIAq/m62OQMEGoUJV+4M7MM+cr7Y8OrCcLjSkSLbpP07Fh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385670356"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="385670356"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752558173"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752558173"
Received: from vcorfu1-mobl.ger.corp.intel.com (HELO [10.251.220.226])
 ([10.251.220.226])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:35:02 -0700
Message-ID: <85245068-4cce-8851-e527-29792385f78b@linux.intel.com>
Date: Wed, 27 Sep 2023 14:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
 <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
 <2fd37d47aacb192f9d4b4e8491743323536f364c.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <2fd37d47aacb192f9d4b4e8491743323536f364c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic
 commit
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

On 2023-09-27 12:45, Hogander, Jouni wrote:
> On Wed, 2023-09-27 at 12:33 +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> When we wrote the original display support, we purposely decided on
>> not
>> adding i915_sw_fence support.
>>
>> In this case, I think a better approach would be to remove this code
>> from i915 as well, and end up with cleaner display code for both
>> drivers.
> 
> Yes, I agree eventually this would be the goal. I did some experiments
> here:
> 
> https://patchwork.freedesktop.org/patch/558982/?series=123898&rev=4
> 
> Which is replacing i915_sw_fence with same code I'm using for Xe driver
> in this patch set. The problem is GPU reset detection. I don't have
> currently good ideas how to tackle that without compromizing i915
> functionality in this scenario -> ended up doing this only for Xe to
> ensure this is not blocking upstreaming Xe. Would this be acceptable as
> temporary solution to be solved after upstreaming? Anyways what I'm
> doing in these patches is not really an i915_sw_fence revised, but
> using dma_fences.
In atomic, plane_state->fence is set for all fences, and that should be 
enough. I think creating a reservation object is a massive overkill,
and we should try to use the drm_atomic_helper_wait_for_fences if at all 
possible.

Cheers,
~Maarten
