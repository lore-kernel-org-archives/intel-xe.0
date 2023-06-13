Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8607EEB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 17:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581DD10E05E;
	Tue, 13 Jun 2023 17:32:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A7D10E05E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686677571; x=1718213571;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=91ZLIHcu+pgHwEYS/yPhYwU6Dj1f635Ez/ZYY9tCjRw=;
 b=CCm6O8uYBVOvUftnVPpeI7GjA6JhwXIGuyaORvbTiogLlzhhH+1Zxt4/
 wqeY46WCLcmkuwGyCduSbm6J1fxpp6YAv/x68qnZN3/S4SRcysI0YpZ2z
 UhaLWvchfW0oQibr4Y5Lcy3OdnPNaZ6jIwEzj99Pt6JlhAtdbvRnj7HbC
 NQ9g95ZJca2fYNAV0LLaEoGZcfRpwMf0kKFuX3JzuFJwgaPeaMxU4DyLf
 wGCOzLnfxOP3yqvTGu+odfyaZxX3plBsYyThFjQS/2Th7giCJLM2TQCic
 zW+9tzSE0ntSuRiMr0kvhApsioiZQka9ueUTtpvAFxr8F2Ft9w9opeFok A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355903508"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="355903508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824504173"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="824504173"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.22])
 ([10.249.254.22])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:32:49 -0700
Message-ID: <a68b96a0-c315-b556-0f27-62d52ea2c752@linux.intel.com>
Date: Tue, 13 Jun 2023 19:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
 <649e8484-08f4-2c2f-fd19-de3839025fac@linux.intel.com>
 <ZIiQ14S0KPIlAuAs@nvishwa1-DESK>
 <65594b10-f0a5-cc5c-143e-af370fdef419@linux.intel.com>
In-Reply-To: <65594b10-f0a5-cc5c-143e-af370fdef419@linux.intel.com>
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

Hi, again

On 6/13/23 18:52, Thomas Hellström wrote:
> Hi, Niranjana,
>
> On 6/13/23 17:52, Niranjana Vishwanathapura wrote:
>> On Tue, Jun 13, 2023 at 09:31:00AM +0200, Thomas Hellström wrote:
>>> Hi, Niranjana
>>>
>>> The plan to handle non-preemptible hardware with Xe is either to use 
>>> faulting or to pin memory and use CGROUPS to control the
>>> pinning. So when that is fully flushed out, there shouldn't be a 
>>> need for these changes?
>>>
>>
>> Hi Thomas,
>> Currently the preemption timeout is hardcoded in driver to 640ms. These
>> patches are for preemptible hardware and allows preemption timeout to be
>> configurable during compile time. These patches are being ported form 
>> i915.
>>
>> Also, the purpose is actually to give compute tasks longer time to reach
>> a pre-emption point after a pre-emption request has been issued. This is
>> necessary because Gen12 does not support mid-thread pre-emption and 
>> compute
>> tasks can have long running threads.
>
> For ordinary (!LR) contexts, I don't see a problem really as long as 
> this can't be used to extend dma-fence signalling time beyond 10s, I 
> perhaps need to sync up with Matt to understand how that limit is 
> enforced in Xe.
>
> But for the compute context, I'm worried that people will start using 
> this to extend the signalling time of the preempt fences to make sure 
> jobs aren't killed shortly after, for example, userptr invalidation 
> because the compute kernel didn't preempt fast enough. That is not 
> what we want for Xe clients.
>
> The suggested solution to handle this latter problem in Xe for 
> non-preemptible hardware is to avoid  having preempt fences request a 
> timeout in the first place by pinning memory, which will need CGROUPS 
> support, which Maarten is working on.
>
> So in short I believe this is OK if there is no way this can be abused 
> to extend signalling time of ordinary dma-fences or compute 
> preempt-fences beyond 10s.
>
> /Thomas

So after discussing with Matt I think this series is fine if we limit 
the configurability to 10s for compute both at compilation- and run-time.

If we need longer compute timeouts and indeed want to use this as a 
workaround for non-preemptible hardware we need to redo the discussion 
we had previously on how to tackle that problem.

/Thomas


>
>
>>
>> Similarly DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY sets the default timeout
>> for copy engine to a higher value for PVC.
>>
>> Niranjana
>>
>>> /Thomas
>>>
>>> On 6/10/23 02:12, Niranjana Vishwanathapura wrote:
>>>> Allow preemption timeouts to be specified as a config options.
>>>>
>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>> <niranjana.vishwanathapura@intel.com>
>>>>
>>>> Niranjana Vishwanathapura (3):
>>>>   drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>>>>   drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>>>   drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY
>>>>
>>>>  drivers/gpu/drm/xe/Kconfig         |  6 +++++
>>>>  drivers/gpu/drm/xe/Kconfig.profile | 40 
>>>> ++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_engine.c     | 30 +++++++++++++++++++++-
>>>>  3 files changed, 75 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>>>>
