Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBC9D0D791
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2D410EAF7;
	Fri, 11 Oct 2024 13:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="NIqB1jgX";
	dkim-atps=neutral
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 336DF10E7D6
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 19:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1728501746; bh=Cgq/9yo0Az36vK7/5pvekRKWRvtfNHMNj/p/Mdzc/D0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=NIqB1jgXz0HDy8xuQcAo1CgLNUp91yheh2qZh3Tza9eJ7JwAzo68493YzvmHrNl5p
 L8MqK16soqPjKoAHivWjjzhQDFzxPVBcf1qrNyNB2ubPJUq/v1dDzYWRqW7B8+12xU
 meuwaaobeB32BsUPxR0yLy8aKVr3ctNviNDOGZV8aownetVA2Lebvpvnp3nYiJ1tpb
 lr17lGrgflr3AlZgn1G9WweCxXyABUrYYW8PVpCMZp1ljJPLGuhuVkNyxBasEWkpnk
 9ParMjhmRkuFCYGaHfX0+bQb1JUYd7VYDqsoIONF25DUA/XW6bypWdyNhk5O1Vvmv/
 hCrkQ0d24/flSYJS4uhYkZOacVtWF+kLFTQXpZLlKSmwP59fMdxVJZL6RvFbpYYSe3
 EcZH3Ur6IdwkTzR583XFxYKcp6ojinJDQzXhTbV2yClT6p43nm8vSNSY/QnzoclKNC
 GvE6x7IWDe5FXf8CgdLvqKi6UEKjCb/N8rlO51g3CzXPLnk9gfYw8M8JgcWcZeaTxH
 KHaUSydWZiQo9lV98Que3S5N0YRUzKIW05z14FloUQvnpz7BkyYKPA6cup0tuEcFRa
 DONvcQfgy0t38hBo2cPPXrejoeoDIlIcYzlBoFF5cuL2OotnryF6qsJVcgMKjUzCxp
 iyg+582Kz4hWA+pXzkWobT1c=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 54990160E0A;
 Wed,  9 Oct 2024 21:22:26 +0200 (CEST)
Message-ID: <859bc217-0f47-4f2c-83a3-d1f99eb7ca4b@ijzerbout.nl>
Date: Wed, 9 Oct 2024 21:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v28,6/6] drm/xe/guc: Save manual engine capture into capture list
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20241004193428.3311145-7-zhanjun.dong@intel.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241004193428.3311145-7-zhanjun.dong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 11 Oct 2024 13:55:28 +0000
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

Op 04-10-2024 om 21:34 schreef Zhanjun Dong:
> Save manual engine capture into capture list.
> This removes duplicate register definitions across manual-capture vs
> guc-err-capture.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c     |   3 +-
>   drivers/gpu/drm/xe/xe_guc_capture.c     | 153 +++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_capture.h     |   3 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c       | 255 +-----------------------
>   drivers/gpu/drm/xe/xe_hw_engine.h       |   2 -
>   drivers/gpu/drm/xe/xe_hw_engine_types.h |  59 ------
>   6 files changed, 163 insertions(+), 312 deletions(-)
>
> [...]
> +static void
> +read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_group *list,
> +		 struct guc_mmio_reg *regs)
> +{
> +	int i;
> +
> +	if (!list || list->num_regs == 0)
> +		return;
> +
> +	if (!regs)
> +		return;
> +
> +	for (i = 0; i < list->num_regs; i++) {
> +		struct __guc_mmio_reg_descr desc = list->list[i];
> +		u32 value;
> +
> +		if (!list->list)
This test makes no sense at this point.
Notice that list->list[i] is used to get "desc". It would have crashed 
if list->list was NULL.
It could make sense before the for-loop, but you'll have to decide on that.
> +			return;
> +
> +		if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
> +			value = xe_hw_engine_mmio_read32(hwe, desc.reg);
> +		} else {
> +			if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS &&
> +			    FIELD_GET(GUC_REGSET_STEERING_NEEDED, desc.flags)) {
> +				int group, instance;
> +
> +				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, desc.flags);
> +				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, desc.flags);
> +				value = xe_gt_mcr_unicast_read(hwe->gt, XE_REG_MCR(desc.reg.addr),
> +							       group, instance);
> +			} else {
> +				value = xe_mmio_read32(&hwe->gt->mmio, desc.reg);
> +			}
> +		}
> +
> +		regs[i].value = value;
> +		regs[i].offset = desc.reg.addr;
> +		regs[i].flags = desc.flags;
> +		regs[i].mask = desc.mask;
> +	}
> +}
>
-- 
Kees
