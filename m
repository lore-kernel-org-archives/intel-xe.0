Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049EAC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE48710E4A4;
	Tue, 18 Aug 2026 10:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HXiMwTa5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1D610E4A4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:54:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EFA343BE7;
 Tue, 18 Aug 2026 10:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C161F00AC4;
 Tue, 18 Aug 2026 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787050456;
 bh=1B8vrNfttCcFQtm60FeUPYeVk2uKEKsv/WlpViQerlw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HXiMwTa5HKAPgNXynCm/ObHGmWc6xkwlLBRIteoLgUJOdGWSHpWCmdjud6d8Pq4Kw
 EdqElKeAlqFz/2+VlnGzAqfjNaq1PpeIp2ASi8ucPpc8cFl9nNxQNYgFaTzDzgnBxS
 hO/+TYEdD3mYlDNzdGE9BNEYIc8uMcbUexeC+2d0/VHipw+CPJdiJzeWbmGBhEDIdX
 pXRxDmwl8a2S5C7I+yt4Vgi3iCoU7WNweA5c1BmS7MG7JmVKnQ3lYcZfepDoW5AR2m
 aC8Q496uccaB3FwbKsMBlYecLaT4tmAxSnW8XA13My87gcGGAep6pYYgigoc7mV0dq
 EiiiB+lRoCRRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-24-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-24-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:54:15 +0000
Message-Id: <20260818105416.05C161F00AC4@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Lockless access to `pos->blocks` in `serialize_bad_pages` under RC=
U races with non-RCU list mutations, leading to potential Use-After-Free an=
d uninitialized reads.
- [Medium] Multi-tile VRAM support is broken in the device-level sysfs inte=
rface.
- [Medium] The `max_pages` field is never initialized or retrieved from the=
 firmware, resulting in `max_pages: 0` in the sysfs output.
- [Medium] Stateless `bin_attribute` read handler causes corrupted output (=
data shifting/duplication) during multi-chunk reads.
- [Medium] Racy `allocation_size` calculation and incorrect loop terminatio=
n condition cause mid-line truncation of sysfs output and dead code.
--

--- Patch [10]: [PATCH V17 10/12] drm/xe: Add sysfs interface for bad gpu v=
ram pages ---
commit ec8b371c3f2a5abb7fd5a41d3967e178a7625d0a
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Add sysfs interface for bad gpu vram pages

This patch adds a sysfs interface at /sys/bus/pci/devices/<bdf>/vram_bad_pa=
ges
to expose bad VRAM pages resulting from hardware faults. It uses an RCU-pro=
tected=20
list traversal to read the bad pages asynchronously without blocking normal=
 VRAM=20
allocation operations.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 51b98460481d9..372bb25448f61 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -874,3 +874,144 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device =
*xe, u64 addr)
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_m=
gr, mm);
>  }
>  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char *buf=
, size_t max_len)
> +{
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct gpu_buddy_block *block;
> +	size_t s =3D 0;
> +	int printed;
> +	int count =3D 0;
> +
> +	rcu_read_lock();
> +
> +	printed =3D scnprintf(buf + s, max_len - s, "max_pages: %d\n", mgr->max=
_pages);

[Severity: Medium]
Is max_pages ever populated by the firmware? It appears to be added to
struct xe_ttm_vram_mgr and printed here, but never initialized, which would
result in it always printing 0.

> +	s +=3D printed;
> +
> +	list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +		if (count >=3D 10000 || s >=3D max_len)
> +			break;

[Severity: Medium]
Does this loop terminate correctly when the buffer is exhausted? When scnpr=
intf
runs out of space, it returns max_len - 1. This leaves s at max_len - 1, me=
aning
the condition s >=3D max_len evaluates to false.=20

Could this cause the loop to iterate up to 10000 times, repeatedly calling
scnprintf with 1 byte remaining?

> +
> +		block =3D list_first_entry_or_null(&pos->blocks, struct gpu_buddy_bloc=
k, link);

[Severity: High]
Can this lockless access to pos->blocks race with list mutations? If a thre=
ad
encounters a VRAM fault, xe_ttm_vram_reserve_page_at_addr() publishes the e=
ntry
to the queued_pages list before populating its blocks:

list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
ret =3D xe_ttm_vram_buddy_alloc(..., &nentry->blocks, ...);

Since xe_ttm_vram_buddy_alloc() modifies nentry->blocks using non-RCU list
operations without memory barriers, could serialize_bad_pages() dereference=
 a
partially written pointer or a block being freed on an allocation error pat=
h?

> +		if (!block)
> +			continue;
> +
> +		printed =3D scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx : %=
c\n",
> +				    gpu_buddy_block_offset(block) >> PAGE_SHIFT,
> +				    gpu_buddy_block_size(&mgr->mm, block), 'R');
> +		s +=3D printed;
> +		count++;
> +	}
[ ... ]
> +static ssize_t vram_bad_pages_bin_read(struct file *filp, struct kobject=
 *kobj,
> +				       const struct bin_attribute *attr, char *buf,
> +				       loff_t off, size_t count)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct ttm_resource_manager *man;
> +	struct xe_ttm_vram_mgr *mgr;
> +	size_t allocation_size;
> +	struct xe_device *xe;
> +	size_t full_data_len;
> +	int active_entries;
> +	char *temp_buf;
> +
> +	xe =3D pdev_to_xe_device(pdev);
> +	man =3D ttm_manager_type(&xe->ttm, XE_PL_VRAM0);

[Severity: Medium]
Does this sysfs interface support multi-tile devices correctly? By explicit=
ly
fetching XE_PL_VRAM0, this appears to ignore bad pages on any secondary VRAM
tiles.=20

Furthermore, since the exported PFNs are relative to the VRAM region's dpa_=
base,
could the output be ambiguous on multi-tile architectures without an explic=
it
tile identifier?

> +	if (!man)
> +		return -ENODEV;
> +	mgr =3D to_xe_ttm_vram_mgr(man);
> +
> +	active_entries =3D READ_ONCE(mgr->n_offlined_pages) + READ_ONCE(mgr->n_=
queued_pages);
> +
> +	if (active_entries > 10000)
> +		active_entries =3D 10000;
> +
> +	allocation_size =3D 64 + (active_entries * 48);

[Severity: Medium]
Could this lockless allocation size calculation truncate the output? If the=
 list
of offlined or queued pages grows between this calculation and the RCU list
traversal in serialize_bad_pages(), the buffer might be too small to hold t=
he
full output.

> +
> +	temp_buf =3D kvmalloc(allocation_size, GFP_KERNEL);
> +	if (!temp_buf)
> +		return -ENOMEM;
> +
> +	/* serialize_bad_pages uses rcu_read_lock internally */
> +	full_data_len =3D serialize_bad_pages(mgr, temp_buf, allocation_size);
> +
> +	if (off >=3D full_data_len) {
> +		kvfree(temp_buf);
> +		return 0;
> +	}
> +
> +	if (off + count > full_data_len)
> +		count =3D full_data_len - off;
> +
> +	memcpy(buf, temp_buf + off, count);

[Severity: Medium]
Is it safe to regenerate the text dynamically on every read chunk? Since
bin_attribute read callbacks do not persist state across multiple reads, if=
 the
VRAM page list changes between consecutive read syscalls on the same file
descriptor, the offsets will no longer align.=20

Could this cause corrupted, duplicated, or truncated text output for usersp=
ace
tools parsing the file?

> +
> +	kvfree(temp_buf);
> +	return count;
> +}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm=
/xe/xe_ttm_vram_mgr_types.h
> index dc97b0ad0e510..efcf3e1d4e80c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from F=
W */
> +	u16 max_pages;

[Severity: Medium]
As mentioned earlier, is this max_pages field actually initialized and retr=
ieved
from the firmware anywhere in the codebase?

>  };
> =20
>  /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D10
