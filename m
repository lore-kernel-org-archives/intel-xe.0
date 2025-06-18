Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D38AC7115E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 20:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAC210E94A;
	Wed, 18 Jun 2025 20:16:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED37010E945
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 20:16:53 +0000 (UTC)
Message-ID: <1619bd96-b405-4d33-90bc-a0091e3f4c5d@lankhorst.se>
Date: Wed, 18 Jun 2025 22:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] drm/xe: Simplify GuC early initialization
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250617180132.7059-14-dev@lankhorst.se>
 <20250618094436.198481-2-dev@lankhorst.se>
 <2kauvvdfmmn6qtsha7cz54bfqmcl62pvsx7drwpcbfue2bzzat@nal2bkmcqrcu>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <2kauvvdfmmn6qtsha7cz54bfqmcl62pvsx7drwpcbfue2bzzat@nal2bkmcqrcu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 2025-06-18 21:28, Lucas De Marchi wrote:
> On Wed, Jun 18, 2025 at 11:44:37AM +0200, Maarten Lankhorst wrote:
>> Add a 2-stage GuC init. An early one for everything that is needed
>> for VF, and a full one that loads GuC and is allowed to do allocations.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>> Changes since v3:
>> - keep xe_guc_relay_init() to allow full IGT to pass.
>>
>> drivers/gpu/drm/xe/xe_device.c | 17 ------------
>> drivers/gpu/drm/xe/xe_gt.c     |  9 +++++-
>> drivers/gpu/drm/xe/xe_guc.c    | 51 +++++++++++++++++++++-------------
>> drivers/gpu/drm/xe/xe_guc.h    |  1 +
>> drivers/gpu/drm/xe/xe_guc_ct.c | 28 ++++++++++++-------
>> drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
>> drivers/gpu/drm/xe/xe_uc.c     | 16 +++++++++++
>> drivers/gpu/drm/xe/xe_uc.h     |  1 +
>> 8 files changed, 77 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 03825cc214085..ead538029b128 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -793,23 +793,6 @@ int xe_device_probe(struct xe_device *xe)
>>         err = xe_gt_init_early(gt);
>>         if (err)
>>             return err;
>> -
>> -        /*
>> -         * Only after this point can GT-specific MMIO operations
>> -         * (including things like communication with the GuC)
>> -         * be performed.
>> -         */
>> -        xe_gt_mmio_init(gt);
>> -
>> -        if (IS_SRIOV_VF(xe)) {
>> -            xe_guc_comm_init_early(&gt->uc.guc);
>> -            err = xe_gt_sriov_vf_bootstrap(gt);
>> -            if (err)
>> -                return err;
>> -            err = xe_gt_sriov_vf_query_config(gt);
>> -            if (err)
>> -                return err;
> 
> are these supposed to be squashed in the previous patch?
Correct, looks like something went wrong when rebasing. This should be in 2/9 to make it moving like the commit message says.

Thanks for catching, will clean up and resend!

> ...
> 
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index c23e6f5e25141..b573b7731f62e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -8,6 +8,7 @@
>>
>> struct xe_uc;
>>
>> +int xe_uc_init_noalloc(struct xe_uc *uc);
>> int xe_uc_init(struct xe_uc *uc);
>> int xe_uc_init_hwconfig(struct xe_uc *uc);
>> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> 
> quite not happy with these multiple init. IMO we are exposing too much
> from guc to be handled from the main device probe function.
> 
> I think that if we eventually balance it with not doing a double guc
> load it would be good
> 
> Lucas De Marchi
Yeah, init is a bit of a dance, especially because of SRIOV-VF. It cannot touch MMIO, so it needs to communicate to PF-GUC to obtain the basics like GGTT layout, VRAM, etc. Because we want to keep things determnistic, we have to at least init some of the GuC even for non-VF to keep things from becoming even worse.

I think init is always going to be a bit messy, especially with the requirement of keeping the first allocation for display to prevent losing the FB, either by overwriting GGTT or the physical VRAM.

Kind regards,
Maarten
