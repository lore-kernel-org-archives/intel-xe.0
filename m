Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC28C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 21:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02F810E228;
	Thu, 20 Aug 2026 21:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L9O9osBT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F16C10E228
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 21:24:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A771A41ACC;
 Thu, 20 Aug 2026 21:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E951F000E9;
 Thu, 20 Aug 2026 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787261065;
 bh=jGgtYLNmJKQN3zmQ5kgvqT8IzLhfW2cv0G/FGWqLbyk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=L9O9osBTBZNUDqSYIsmi+/vKzojJt1Fx9XvJdOG1yNZN3Bop2cg9xW3GM36tL5UEx
 irTCiJArczRsuGSdb71ugWginFsV7ppc9MqdupU6xxvDdAlCmE1UBRWNOKX66c4XNr
 Xjmix00J2xzAqZqHUoDVJ6cHGr9NIJoNXavOOxBEIayiebQM3VvZLTTwlSbdiEeVOx
 hApd2iflxWXWpXo1kkmyeEtdFlTgAzY7KGlksynqOOA44TvgmWTnuFojl4b8Tz0RAT
 RgBnjbfXkuTZjyKvX3fu3sVRBp/h+PqlLciddHcnUWpsoiOxCOnqeUl2Ryihd6+xyZ
 jBYNQTTH3WS0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] drm/xe: Sort xe_config_device fields
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820210639.107524-14-stuart.summers@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-14-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 21:24:25 +0000
Message-Id: <20260820212425.69E951F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to dangling pointer returned by xe_configfs_get=
_ctx_restore_mid_bb and post_bb escaping the reference lifetime.
- [High] Out-of-bounds Read in parse_wa_bb_lines when input lacks a trailin=
g newline.
--

--- Patch [2]: [PATCH 02/10] drm/xe: Sort xe_config_device fields ---
commit 299f84549303f530b903f33ec9224a2a497c7599
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Sort xe_config_device fields

As we're planning more configfs entries over time, let's add
some sorting rules to make sure this stays clean and easy to
manage. Sorting first by type and then name for readability.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 0a85043a9dd01..cb6ab1fcb8c18 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c

[ ... ]

> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
> +				       const u32 **cs)
>  {
> -	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> -	bool survivability_mode;
> -	int ret;
> +	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
> +	u32 len;
> =20
> -	ret =3D kstrtobool(page, &survivability_mode);
> -	if (ret)
> -		return ret;
> +	if (!dev)
> +		return 0;
> =20
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> +	scoped_guard(mutex, &dev->lock) {
> +		if (cs)
> +			*cs =3D dev->config.ctx_restore_mid_bb[class].cs;
> =20
> -	dev->config.survivability_mode =3D survivability_mode;
> +		len =3D dev->config.ctx_restore_mid_bb[class].len;
> +	}
> +	config_group_put(&dev->group);
> =20
>  	return len;
>  }
> =20
> -static ssize_t gt_types_allowed_show(struct config_item *item, char *pag=
e)
> +/**
> + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_b=
b setting
> + * @pdev: pci device
> + * @class: hw engine class
> + * @cs: pointer to the bb to use - only valid during probe
> + *
> + * Return: Number of dwords used in the post_ctx_restore setting in conf=
igfs
> + */
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
> +					const u32 **cs)
>  {
> -	struct xe_config_device *dev =3D to_xe_config_device(item);
> -	char *p =3D page;
> -
> -	for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++)
> -		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> -			p +=3D sprintf(p, "%s\n", gt_types[i].name);
> +	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
> +	u32 len;
> =20
> -	return p - page;
> -}
> +	if (!dev)
> +		return 0;
> =20
> -static ssize_t gt_types_allowed_store(struct config_item *item, const ch=
ar *page,
> -				      size_t len)
> -{
> -	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> -	char *buf __free(kfree) =3D kstrdup(page, GFP_KERNEL);
> -	char *p =3D buf;
> -	u64 typemask =3D 0;
> -
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	while (p) {
> -		char *typename =3D strsep(&p, ",\n");
> -		bool matched =3D false;
> -
> -		if (typename[0] =3D=3D '\0')
> -			continue;
> -
> -		for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++) {
> -			if (strcmp(typename, gt_types[i].name) =3D=3D 0) {
> -				typemask |=3D BIT(gt_types[i].type);
> -				matched =3D true;
> -				break;
> -			}
> -		}
> -
> -		if (!matched)
> -			return -EINVAL;
> -	}
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.gt_types_allowed =3D typemask;
> -
> -	return len;
> -}
> -
> -static ssize_t engines_allowed_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev =3D to_xe_config_device(item);
> -	char *p =3D page;
> -
> -	for (size_t i =3D 0; i < ARRAY_SIZE(engine_info); i++) {
> -		u64 mask =3D engine_info[i].mask;
> -
> -		if ((dev->engines_allowed & mask) =3D=3D mask) {
> -			p +=3D sprintf(p, "%s*\n", engine_info[i].cls);
> -		} else if (mask & dev->engines_allowed) {
> -			u16 bit0 =3D __ffs64(mask), bit;
> -
> -			mask &=3D dev->engines_allowed;
> -
> -			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> -				p +=3D sprintf(p, "%s%u\n", engine_info[i].cls,
> -					     bit - bit0);
> -		}
> -	}
> -
> -	return p - page;
> -}
> -
> -/*
> - * Lookup engine_info. If @mask is not NULL, reduce the mask according t=
o the
> - * instance in @pattern.
> - *
> - * Examples of inputs:
> - * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_=
info and
> - *   mask =3D=3D BIT_ULL(XE_HW_ENGINE_RCS0)
> - * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_=
info and
> - *   mask =3D=3D XE_HW_ENGINE_RCS_MASK
> - * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_in=
fo
> - */
> -static const struct engine_info *lookup_engine_info(const char *pattern,=
 u64 *mask)
> -{
> -	for (size_t i =3D 0; i < ARRAY_SIZE(engine_info); i++) {
> -		u8 instance;
> -		u16 bit;
> -
> -		if (!str_has_prefix(pattern, engine_info[i].cls))
> -			continue;
> -
> -		pattern +=3D strlen(engine_info[i].cls);
> -		if (!mask)
> -			return *pattern ? NULL : &engine_info[i];
> -
> -		if (!strcmp(pattern, "*")) {
> -			*mask =3D engine_info[i].mask;
> -			return &engine_info[i];
> -		}
> -
> -		if (kstrtou8(pattern, 10, &instance))
> -			return NULL;
> -
> -		bit =3D __ffs64(engine_info[i].mask) + instance;
> -		if (bit >=3D fls64(engine_info[i].mask))
> -			return NULL;
> -
> -		*mask =3D BIT_ULL(bit);
> -		return &engine_info[i];
> -	}
> -
> -	return NULL;
> -}
> -
> -static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> -			const struct engine_info **pinfo)
> -{
> -	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
> -	const struct engine_info *info;
> -	size_t len;
> -
> -	len =3D strcspn(s, end_chars);
> -	if (len >=3D sizeof(buf))
> -		return -EINVAL;
> -
> -	memcpy(buf, s, len);
> -	buf[len] =3D '\0';
> -
> -	info =3D lookup_engine_info(buf, mask);
> -	if (!info)
> -		return -ENOENT;
> -
> -	if (pinfo)
> -		*pinfo =3D info;
> -
> -	return len;
> -}
> -
> -static ssize_t engines_allowed_store(struct config_item *item, const cha=
r *page,
> -				     size_t len)
> -{
> -	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> -	ssize_t patternlen, p;
> -	u64 mask, val =3D 0;
> -
> -	for (p =3D 0; p < len; p +=3D patternlen + 1) {
> -		patternlen =3D parse_engine(page + p, ",\n", &mask, NULL);
> -		if (patternlen < 0)
> -			return -EINVAL;
> -
> -		val |=3D mask;
> +	scoped_guard(mutex, &dev->lock) {
> +		*cs =3D dev->config.ctx_restore_post_bb[class].cs;
> +		len =3D dev->config.ctx_restore_post_bb[class].len;
>  	}
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.engines_allowed =3D val;
> -
> -	return len;
> -}
> -
> -static ssize_t enable_psmi_show(struct config_item *item, char *page)
> -{
> -	struct xe_config_device *dev =3D to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->enable_psmi);
> -}
> -
> -static ssize_t enable_psmi_store(struct config_item *item, const char *p=
age, size_t len)
> -{
> -	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> -	bool val;
> -	int ret;
> -
> -	ret =3D kstrtobool(page, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.enable_psmi =3D val;
> -
> -	return len;
> -}
> -
> -static ssize_t enable_multi_queue_show(struct config_item *item, char *p=
age)
> -{
> -	struct xe_config_device *dev =3D to_xe_config_device(item);
> -
> -	return sprintf(page, "%d\n", dev->enable_multi_queue);
> -}
> -
> -static ssize_t enable_multi_queue_store(struct config_item *item, const =
char *page,
> -					size_t len)
> -{
> -	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> -	bool val;
> -	int ret;
> -
> -	ret =3D kstrtobool(page, &val);
> -	if (ret)
> -		return ret;
> -
> -	guard(mutex)(&dev->lock);
> -	if (is_bound(dev))
> -		return -EBUSY;
> -
> -	dev->config.enable_multi_queue =3D val;
> +	config_group_put(&dev->group);
> =20
>  	return len;
>  }

[Severity: High]
This is a pre-existing issue, but is it safe for xe_configfs_get_ctx_restor=
e_mid_bb
and xe_configfs_get_ctx_restore_post_bb to return internal pointers from the
configfs context out to the caller while simultaneously dropping the refere=
nce
with config_group_put()?

Because the pointer is returned directly and the group reference is dropped,
the pointer escapes the reference lifetime. If userspace concurrently remov=
es
the configfs directory, xe_config_device_release() will free the internal
buffer.

Could this lead to a use-after-free read during engine initialization if the
freed memory is reused before the caller is finished with the batch buffer?

[ ... ]

> +static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX=
],
> +			   struct xe_config_group_device *dev,
> +			   const char *page, size_t len)
> +{
> +	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] =3D {};
> +	enum xe_engine_class class;
> +	ssize_t count;
> +	u32 *tmp;
> +
> +	/* 1. Ensure the inputs are valid and parseable */
> +	count =3D parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0)
>  		return count;
> =20
>  	guard(mutex)(&dev->lock);
> -
> +
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	/*
> +	 * 2. Allocate a u32 array and set the pointers to the right positions
> +	 * according to the length of each class' wa_bb
> +	 */
> +	tmp =3D krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	if (!count) {
> +		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> +		return len;
> +	}
> +
> +	for (class =3D 0, count =3D 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		tmp_wa_bb[class].cs =3D tmp + count;
> +		count +=3D tmp_wa_bb[class].len;
> +		tmp_wa_bb[class].len =3D 0;
> +	}
> +
> +	/* 3. Parse wa_bb lines again, this time saving the values */
> +	count =3D parse_wa_bb_lines(page, tmp_wa_bb);
> +	if (count < 0)
> +		return count;

[Severity: High]
This is a pre-existing issue, but does parse_wa_bb_lines() handle configfs
inputs that lack a trailing newline safely?

If a user writes a batch buffer command to configfs without a trailing newl=
ine,
parse_hex() parses the last parameter and leaves the pointer exactly at the
null terminator.

At the end of the iteration, the outer for-loop in parse_wa_bb_lines():

	for (p =3D lines; *p; p++) {

unconditionally increments the pointer. This causes the pointer to jump past
the null terminator and read into uninitialized memory on the next loop
condition check.

Can this result in an out-of-bounds read and a potential kernel panic if the
read crosses a page boundary into unmapped memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820210639.1075=
24-12-stuart.summers@intel.com?part=3D2
