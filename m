Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0572DEB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 16:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD11710E0BF;
	Tue, 13 Jun 2023 16:52:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CDD10E0BF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686675176; x=1718211176;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p/7SGBGqMoPjIpvqJI5tA6c68tNtLOaPFipOWFXpJC4=;
 b=SVmDgYyncU0Qo+0ZOjvLmNGJMzcyDJEGxpvOi+Sr5cgsuzIRpWs8ep4G
 KV/AlVorl9HcCQCBl798fpSmGZed90GHgryez5WTCX9clG2HnDiMBLquJ
 lslRULr4T1zFXj4Hjy/Qpa7QEbI88CPZnxsozVZe1/q38MRBgYIMCBzb6
 tN1T+Omipwwh6t5BGI975DI/wTEylBX8AfF1bmctXwNpueduxScpdYpUq
 vywWPJ9xBLSsGKzBZM8wqm3g4J3BonMm05rLBfgvFBtbGWWGjVRaXs1Ql
 p6AYQLnoUDyLYXJnKkJssx2HY0ny2zTq5fx1B8Zg0ezDz9IpnBN1zAS11 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="360875856"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="360875856"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 09:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="885912692"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="885912692"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.22])
 ([10.249.254.22])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 09:52:52 -0700
Message-ID: <65594b10-f0a5-cc5c-143e-af370fdef419@linux.intel.com>
Date: Tue, 13 Jun 2023 18:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
 <649e8484-08f4-2c2f-fd19-de3839025fac@linux.intel.com>
 <ZIiQ14S0KPIlAuAs@nvishwa1-DESK>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZIiQ14S0KPIlAuAs@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC 0/3] drm/xe: Add preemption timeout config
 options
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Niranjana,

On 6/13/23 17:52, Niranjana Vishwanathapura wrote:
> On Tue, Jun 13, 2023 at 09:31:00AM +0200, Thomas Hellström wrote:
>> Hi, Niranjana
>>
>> The plan to handle non-preemptible hardware with Xe is either to use 
>> faulting or to pin memory and use CGROUPS to control the
>> pinning. So when that is fully flushed out, there shouldn't be a need 
>> for these changes?
>>
>
> Hi Thomas,
> Currently the preemption timeout is hardcoded in driver to 640ms. These
> patches are for preemptible hardware and allows preemption timeout to be
> configurable during compile time. These patches are being ported form 
> i915.
>
> Also, the purpose is actually to give compute tasks longer time to reach
> a pre-emption point after a pre-emption request has been issued. This is
> necessary because Gen12 does not support mid-thread pre-emption and 
> compute
> tasks can have long running threads.

For ordinary (!LR) contexts, I don't see a problem really as long as 
this can't be used to extend dma-fence signalling time beyond 10s, I 
perhaps need to sync up with Matt to understand how that limit is 
enforced in Xe.

But for the compute context, I'm worried that people will start using 
this to extend the signalling time of the preempt fences to make sure 
jobs aren't killed shortly after, for example, userptr invalidation 
because the compute kernel didn't preempt fast enough. That is not what 
we want for Xe clients.

The suggested solution to handle this latter problem in Xe for 
non-preemptible hardware is to avoid  having preempt fences request a 
timeout in the first place by pinning memory, which will need CGROUPS 
support, which Maarten is working on.

So in short I believe this is OK if there is no way this can be abused 
to extend signalling time of ordinary dma-fences or compute 
preempt-fences beyond 10s.

/Thomas


>
> Similarly DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY sets the default timeout
> for copy engine to a higher value for PVC.
>
> Niranjana
>
>> /Thomas
>>
>> On 6/10/23 02:12, Niranjana Vishwanathapura wrote:
>>> Allow preemption timeouts to be specified as a config options.
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>>
>>> Niranjana Vishwanathapura (3):
>>>   drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>>>   drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>>   drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY
>>>
>>>  drivers/gpu/drm/xe/Kconfig         |  6 +++++
>>>  drivers/gpu/drm/xe/Kconfig.profile | 40 ++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_engine.c     | 30 +++++++++++++++++++++-
>>>  3 files changed, 75 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>>>
