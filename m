Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF39CA5FD7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BA810E64A;
	Tue, 20 Jan 2026 18:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="VfvC0D4H";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257310E64E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768933401;
 bh=tVf7ux+/MNtk5XVMSbhhx1SUHKR06uFK9/Qc++BiFYo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VfvC0D4HsssrLROxIKcWXRNxxrajTgrUJEs3NyfCmmZGbPCLwo4BFjaP9RvU0juAO
 shdLETQhtqpIxZ3x8ttYPvhmBNkadRXeP1Nl2hdGzG41wWFCZrREkklLupDeEHf7Q9
 bA+K7dP1WR49u2ZOIdGhZs12X7CBgvFfTwL5QN1Xbp5TljaLWpzOBAv6eiazvOg0jn
 Hn4RtNYEb/wcHkn6HC8lShsD+Z0ZxShHl/7EaCovVJaknGQaZhdYBFd9mWodHFj0Yr
 WYE6YZvp4A6yTlAFDVAP6UkZsTOGPmKoWoC4kRwWdBxUP6wvPoTbbuY9YJQUJX/+d6
 Crd0V25sH8WbQ==
Message-ID: <b305291a-7723-4f00-8531-ddeca3fe7475@lankhorst.se>
Date: Tue, 20 Jan 2026 19:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe: Rewrite GGTT VF initialization
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20260119125101.277182-1-dev@lankhorst.se>
 <20260119125101.277182-3-dev@lankhorst.se>
 <9e8a94a2-927c-486e-9b60-c1d3e82f830d@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <9e8a94a2-927c-486e-9b60-c1d3e82f830d@intel.com>
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

Den 2026-01-20 kl. 17:11, skrev Michal Wajdeczko:
> 
> 
> On 1/19/2026 1:50 PM, Maarten Lankhorst wrote:
>> The previous code was using a complicated system with 2 balloons to
>> set GGTT size and adjust GGTT offset. While it works, it's overly
>> complicated.
>>
>> A better approach is to set the offset and size when initializing GGTT,
>> this removes the need for adding balloons. The resize function only
>> needs readjust ggtt->start to have GGTT at the new offset.
>>
>> This removes the need to manipulate the internals of xe_ggtt outside
>> of xe_ggtt, and cleans up a lot of now unneeded code.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> Co-developed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h  |   2 -
>>  drivers/gpu/drm/xe/xe_ggtt.c          | 164 ++++-----------------
>>  drivers/gpu/drm/xe/xe_ggtt.h          |   5 +-
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  27 +++-
>>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 198 +-------------------------
>>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h |   3 -
>>  6 files changed, 54 insertions(+), 345 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 34feef79fa4e7..0409fa98835e8 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -228,8 +228,6 @@ struct xe_tile {
>>  			struct xe_lmtt lmtt;
>>  		} pf;
>>  		struct {
>> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>> -			struct xe_ggtt_node *ggtt_balloon[2];
>>  			/** @sriov.vf.self_config: VF configuration data */
>>  			struct xe_tile_sriov_vf_selfconfig self_config;
>>  		} vf;
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 7e9ff8057703f..35f5c05680e1c 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -70,8 +70,8 @@
>>   * struct xe_ggtt_node - A node in GGTT.
>>   *
>>   * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
>> - * insertion, reservation, or 'ballooning'.
>> - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
>> + * insertion or reservation.
>> + * It will, then, be finalized by xe_ggtt_node_remove().
>>   */
>>  struct xe_ggtt_node {
>>  	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
>> @@ -347,9 +347,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>  		ggtt_start = wopcm;
>>  		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
>>  	} else {
>> -		/* GGTT is expected to be 4GiB */
>> -		ggtt_start = wopcm;
>> -		ggtt_size = SZ_4G - ggtt_start;
>> +		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
>> +		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
>> +
>> +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
>> +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
>> +			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
>> +				    ggtt_start, ggtt_start + ggtt_size - 1);
> 
> nit: probably it would be better to catch such invalid config sooner, right after we get that from the GuC
> but then we would have to expose some function from xe_ggtt to make that validation that xe_gt_vf code could use

Yeah, I'm seriously tempted to remove all xe_tile_sriov_gvf_ggtt*() calls, make the ggtt_init function call the requied calls directly, and rename xe_ggtt_shift_nodes to xe_ggtt_notify_vf_move(), and have it do the same calls there with a return value if sanitization fails.

Stashing the values, only to use them in only 1 other place is too complicated, should be OK to call directly, IMO.

Think I should go all the way here?

Kind regards,
~Maarten
