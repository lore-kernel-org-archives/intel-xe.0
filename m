Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734DCCCD195
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 13:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF0310E9E9;
	Thu, 16 Oct 2025 13:46:22 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3725F10E9EB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 13:46:20 +0000 (UTC)
Message-ID: <b339cd35-c7f1-4d8e-8bbb-ebf57b15cc98@lankhorst.se>
Date: Thu, 16 Oct 2025 15:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] drm/xe: Improve xe_gt_sriov_pf_config GGTT
 handling
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-20-dev@lankhorst.se>
 <aPAahQy4TpYsFV2S@lstrano-desk.jf.intel.com>
 <cc2f7495-4014-4402-b22a-0402ea1b195c@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <cc2f7495-4014-4402-b22a-0402ea1b195c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2025-10-16 kl. 10:50, skrev Michal Wajdeczko:
> 
> 
> On 10/16/2025 12:04 AM, Matthew Brost wrote:
>> On Wed, Oct 15, 2025 at 09:47:15AM +0200, Maarten Lankhorst wrote:
>>> Do not directly dereference xe_ggtt_node, and add
>>> a member to store the GGTT size.
>>>
>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 15 ++++++++-------
>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h |  8 ++++++--
>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> index 2289756761636..c0dfffd5c553b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> @@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>>>  	if (!xe_ggtt_node_allocated(node))
>>>  		return 0;
>>>  
>>> -	return encode_ggtt(cfg, node->base.start, node->base.size, details);
>>> +	return encode_ggtt(cfg, xe_ggtt_node_addr(node), config->ggtt_size, details);
>>>  }
>>>  
>>>  /* Return: number of configuration dwords written */
>>> @@ -495,13 +495,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>>>  
>>>  	xe_ggtt_assign(node, vfid);
>>>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
>>> -				vfid, node->base.start, node->base.start + node->base.size - 1);
>>> +				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
>>>  
>>> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
>>> +	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
>>>  	if (unlikely(err))
>>>  		goto err;
>>>  
>>>  	config->ggtt_region = node;
>>> +	config->ggtt_size = size;
>>>  	return 0;
>>>  err:
>>>  	pf_release_ggtt(tile, node);
>>> @@ -514,7 +515,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>>>  	struct xe_ggtt_node *node = config->ggtt_region;
>>>  
>>>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>> -	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
>>> +	return xe_ggtt_node_allocated(node) ? config->ggtt_size : 0;
>>>  }
>>>  
>>>  /**
>>> @@ -2516,11 +2517,11 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>>>  		if (!xe_ggtt_node_allocated(config->ggtt_region))
>>>  			continue;
>>>  
>>> -		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
>>> +		string_get_size(config->ggtt_size, 1, STRING_UNITS_2,
>>>  				buf, sizeof(buf));
>>>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
>>> -			   n, config->ggtt_region->base.start,
>>> -			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
>>> +			   n, xe_ggtt_node_addr(config->ggtt_region),
>>> +			   xe_ggtt_node_addr(config->ggtt_region) + config->ggtt_size - 1,
>>>  			   buf);
>>>  	}
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>>> index 686c7b3b6d7a5..9a8e66c8b539f 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>>> @@ -17,10 +17,14 @@ struct xe_bo;
>>>   * Used by the PF driver to maintain per-VF provisioning data.
>>>   */
>>>  struct xe_gt_sriov_config {
>>> -	/** @ggtt_region: GGTT region assigned to the VF. */
>>> -	struct xe_ggtt_node *ggtt_region;
>>>  	/** @lmem_obj: LMEM allocation for use by the VF. */
>>>  	struct xe_bo *lmem_obj;
>>> +
>>> +	/** @ggtt_region: GGTT region assigned to the VF. */
>>> +	struct xe_ggtt_node *ggtt_region;
>>> +	/** @ggtt_size: Size of GGTT region */
>>> +	u64 ggtt_size;
>>
>> Nit: Couldn't we have a helper to dervive the size from the
>> xe_ggtt_node to avoid storing the ggtt_size explicitly?
> 
> +1 (as already commented)
> 
>>
>>> +
>>
>> Longterm we should likely move the PF GGTT config to a per-tile
>> structure like we did for the VF GGTT config. IMO we can do that in
>> follow up. Maybe ping Michal for his thoughts here.
> 
> I have almost finished series with GGTT/LMEM changes, but switched to
> higher priority task (provisioning over sysfs), hopefully will be able
> to return to this topic soon
> 
>>
>> Anyways, this looks like a good cleanup for the existing code structure.
>>
>> With that:
>> Reviewed-by: <Matthew.brost@intel.com> 

All other users of xe_ggtt_node are not using the size member, would it
be too terrible to maintain it in a separate member for SRIOV PF
provisioning, instead of exposing it too?

Seems to me that the size of the ggtt_node is a detail, that we just
happened to expose and use in xe_sriov_pf_config. If necessary I can
keep maintaining that API, but it feels cleaner not to here.

Kind regards,
~Maarten Lankhorst
