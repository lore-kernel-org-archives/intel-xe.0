Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6852D2C122
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 15:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A9B10E406;
	Tue,  5 Nov 2024 15:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuTmMTLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D9B10E406
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730820356; x=1762356356;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xGzT/Ebj1gvz/tvrWd02fh71CoWvqW7kR/9/Z2VDUBw=;
 b=JuTmMTLY7VbwwOmeR3ykYNXhh5H7y6jkfNWYuFXue2ybDqeGh1wTT/Fi
 LHfTxPe4sqQVLPFEEas6bykiTGN5CHI3vAerfuvIzHIo49mjKYtuLe39G
 3ag5r9ZcRnheyJBeOOtALhbWy6wkrJAxobVA7ZiL/IhrkJwRh6Ll9roVM
 w8BzN+u5x7lKLipN19UZPN2Zq8J8cJbDZpWaCwHCQaca1GSJ4V8NC5DM2
 jT3NYeV/p0THh9tzxKkrptbUPnwO4v5vG+CR+X1A15s1Ra4evqlPkFg6p
 xvwja0sTAQYp/9L2jbESKxzQgjyzCUM28iDb+WqjdDCScr2oDq/t2vrqt g==;
X-CSE-ConnectionGUID: 7LyRozgLSzGwDyrJx9uLfQ==
X-CSE-MsgGUID: CDuQ/qjmTsCy/BIKkix57Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41946452"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41946452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 07:25:55 -0800
X-CSE-ConnectionGUID: 2d9QMop5S3CEB7uerX6tHQ==
X-CSE-MsgGUID: iH/y4LPdRBy5liVuycGaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84456969"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 07:25:54 -0800
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 059442FC5A;
 Tue,  5 Nov 2024 15:25:51 +0000 (GMT)
Message-ID: <e88b6d0e-c433-42f4-896b-cad5da2b061b@intel.com>
Date: Tue, 5 Nov 2024 16:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add read/write debugfs helpers for GGTT node
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-2-michal.wajdeczko@intel.com>
 <Zylrsw40oX0fGVU2@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zylrsw40oX0fGVU2@lstrano-desk.jf.intel.com>
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

Hi Matt,

On 05.11.2024 01:49, Matthew Brost wrote:
> On Sun, Nov 03, 2024 at 09:16:32PM +0100, Michal Wajdeczko wrote:
>> In upcoming patch we want to allow copying and updating PTEs of
>> some GGTT nodes over debugfs. Add simple helpers for that.
>>
> 
> On the surface it very much looks like are reinventing something that
> almost certainly already exists or if it doesn't we should try to do
> this in a common way. Have you looked for any similar code to this in
> the kernel.

There are similar copy functions in sound subsystem [1] under CONFIG_SND

	int copy_to_user_fromio();
	int copy_from_user_toio();

and some time ago [2] I was trying to define generic read function

	ssize_t simple_read_from_iomem()

but that didn't get any traction at all, so this time decided to start
with local functions, as otherwise we will not move forward.

Note that some other attempt to make code common [3] also actually ended
with local solution [4] that was merged to drm-xe-next.

I'm more than happy to define those new helper functions in fs/libfs.c
but without wider usage this will be just another dead series like [5].

Michal

[1]
https://elixir.bootlin.com/linux/v6.11.6/source/include/sound/core.h#L269

[2] https://patchwork.freedesktop.org/series/133507/

[3] https://patchwork.freedesktop.org/series/133123/#rev1
[4] https://patchwork.freedesktop.org/series/133123/#rev3

[5]
https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/T/#u

> 
> Matt
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 178 +++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_ggtt.h |   7 ++
>>  2 files changed, 185 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 558fac8bb6fb..e003f5f51ac6 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -838,3 +838,181 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>>  
>>  	return total;
>>  }
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +
>> +static size_t copy_iomem_to_user_by_chunk(void __user *to, const void __iomem *from,
>> +					  size_t count, void *buf, size_t size)
>> +{
>> +	size_t chunk;
>> +	size_t rem;
>> +
>> +	while (count) {
>> +		chunk = umin(count, size);
>> +		memcpy_fromio(buf, from, chunk);
>> +		rem = copy_to_user(to, buf, chunk);
>> +		count -= chunk - rem;
>> +		if (rem)
>> +			break;
>> +		from += chunk;
>> +		to += chunk;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static size_t copy_iomem_to_user(void __user *to, const void __iomem *from, size_t count)
>> +{
>> +	char chunk[64];
>> +	size_t size;
>> +	size_t rem;
>> +	void *buf;
>> +
>> +	if (!count)
>> +		return 0;
>> +
>> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
>> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
>> +	if (buf) {
>> +		rem = copy_iomem_to_user_by_chunk(to, from, count, buf, size);
>> +		kfree(buf);
>> +		return rem;
>> +	}
>> +
>> +	return copy_iomem_to_user_by_chunk(to, from, count, chunk, sizeof(chunk));
>> +}
>> +
>> +static ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
>> +				      const void __iomem *from, size_t available)
>> +{
>> +	loff_t pos = *ppos;
>> +	size_t rem;
>> +
>> +	if (pos < 0)
>> +		return -EINVAL;
>> +	if (pos >= available || !count)
>> +		return 0;
>> +	if (count > available - pos)
>> +		count = available - pos;
>> +
>> +	rem = copy_iomem_to_user(to, from + pos, count);
>> +	if (rem == count)
>> +		return -EFAULT;
>> +
>> +	count -= rem;
>> +	*ppos = pos + count;
>> +	return count;
>> +}
>> +
>> +/**
>> + * xe_ggtt_node_read() - Copy PTEs from the GGTT node to the user space buffer
>> + * @node: the GGTT node to read from
>> + * @buf: the user space buffer to read to
>> + * @count: the maximum number of bytes to read
>> + * @ppos: the current position
>> + *
>> + * Return: On success, the number of bytes read is returned and the offset
>> + * @ppos is advanced by this number, or negative value is returned on error.
>> + */
>> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
>> +			  size_t count, loff_t *ppos)
>> +{
>> +	if (!xe_ggtt_node_allocated(node))
>> +		return 0;
>> +
>> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
>> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
>> +
>> +	return simple_read_from_iomem(buf, count, ppos,
>> +				      &node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
>> +				      size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE));
>> +}
>> +
>> +static size_t copy_iomem_from_user_by_chunk(void __iomem *to, const void __user *from,
>> +					    size_t count, void *buf, size_t size)
>> +{
>> +	size_t chunk;
>> +	size_t rem;
>> +
>> +	while (count) {
>> +		chunk = umin(count, size);
>> +		rem = copy_from_user(buf, from, chunk);
>> +		memcpy_toio(to, buf, chunk - rem);
>> +		count -= chunk - rem;
>> +		if (rem)
>> +			break;
>> +		from += chunk;
>> +		to += chunk;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static size_t copy_iomem_from_user(void __iomem *to, const void __user *from, size_t count)
>> +{
>> +	char chunk[64];
>> +	size_t size;
>> +	size_t rem;
>> +	void *buf;
>> +
>> +	if (!count)
>> +		return 0;
>> +
>> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
>> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
>> +	if (buf) {
>> +		rem = copy_iomem_from_user_by_chunk(to, from, count, buf, size);
>> +		kfree(buf);
>> +		return rem;
>> +	}
>> +
>> +	return copy_iomem_from_user_by_chunk(to, from, count, chunk, sizeof(chunk));
>> +}
>> +
>> +static ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
>> +				     const void __user *from, size_t count)
>> +{
>> +	loff_t pos = *ppos;
>> +	size_t rem;
>> +
>> +	if (pos < 0)
>> +		return -EINVAL;
>> +	if (pos >= available || !count)
>> +		return 0;
>> +	if (count > available - pos)
>> +		count = available - pos;
>> +
>> +	rem = copy_iomem_from_user(to + pos, from, count);
>> +	if (rem == count)
>> +		return -EFAULT;
>> +
>> +	count -= rem;
>> +	*ppos = pos + count;
>> +	return count;
>> +}
>> +
>> +/**
>> + * xe_ggtt_node_write() - Update PTEs of the GGTT node using data from the user space buffer
>> + * @node: the GGTT node to write to
>> + * @buf: the user space buffer to read from
>> + * @count: the maximum number of bytes to read
>> + * @ppos: the current position
>> + *
>> + * Return: On success, the number of bytes written is returned and the offset
>> + * @ppos is advanced by this number, or negative value is returned on error.
>> + */
>> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
>> +			   size_t count, loff_t *ppos)
>> +{
>> +	if (!xe_ggtt_node_allocated(node))
>> +		return -ENXIO;
>> +
>> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
>> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
>> +
>> +	return simple_write_to_iomem(&node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
>> +				     size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE),
>> +				     ppos, buf, count);
>> +}
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..64746e23053e 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -34,6 +34,13 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>>  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>>  
>> +#ifdef CONFIG_DEBUG_FS
>> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
>> +			  size_t count, loff_t *pos);
>> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
>> +			   size_t count, loff_t *pos);
>> +#endif
>> +
>>  #ifdef CONFIG_PCI_IOV
>>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
>>  #endif
>> -- 
>> 2.43.0
>>

