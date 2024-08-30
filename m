Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111F3CA0EFB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 10:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08CA10EA4E;
	Fri, 30 Aug 2024 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1jTOqweb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6izCp4Hg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1jTOqweb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6izCp4Hg";
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F8410EA4E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 10:33:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BCF81218FF
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725014019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LXAeBF23nAs/WkdHTLqEAin9O9YoOMF5un1aTWpcEFc=;
 b=1jTOqwebVzFml8tVcxEFKV0/GowCiAgtSpB2l9UXnUDcDS4gFVqaxwtRD+7fdt/HsMW4lR
 Tu1jDpBlrM5RetHICXLeJf3towV/xkTyEWA/J97p14DJVG0hIOzMgI17w890zDjv3Enwbw
 hg57PvssoeF+lczGdxOYNOfCvYG8/Fs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725014019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LXAeBF23nAs/WkdHTLqEAin9O9YoOMF5un1aTWpcEFc=;
 b=6izCp4Hgm3+8DtrAGfBVxsqhc/iULVuzraPwK/gVzPhMXYYu0bUsaM0wfnJb+EDZoOl/YO
 fSaePNIxrDMAeGDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725014019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LXAeBF23nAs/WkdHTLqEAin9O9YoOMF5un1aTWpcEFc=;
 b=1jTOqwebVzFml8tVcxEFKV0/GowCiAgtSpB2l9UXnUDcDS4gFVqaxwtRD+7fdt/HsMW4lR
 Tu1jDpBlrM5RetHICXLeJf3towV/xkTyEWA/J97p14DJVG0hIOzMgI17w890zDjv3Enwbw
 hg57PvssoeF+lczGdxOYNOfCvYG8/Fs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725014019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LXAeBF23nAs/WkdHTLqEAin9O9YoOMF5un1aTWpcEFc=;
 b=6izCp4Hgm3+8DtrAGfBVxsqhc/iULVuzraPwK/gVzPhMXYYu0bUsaM0wfnJb+EDZoOl/YO
 fSaePNIxrDMAeGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A613613A3D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 10:33:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3yLIJgOg0WY7HwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>)
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 10:33:39 +0000
Message-ID: <a0962d92-04a6-43eb-95e6-746f56a52a3f@suse.de>
Date: Fri, 30 Aug 2024 12:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBDSS5QYXRjaF9hcHBsaWVkOiBmYWlsdXJlIGZvciBkcm06?=
 =?UTF-8?Q?_Provide_client_setup_helper_and_convert_drivers_=28rev3=29?=
To: intel-xe@lists.freedesktop.org
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <172500828460.853066.11340929742053771105@2413ebb6fbb6>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <172500828460.853066.11340929742053771105@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 PREVIOUSLY_DELIVERED(0.00)[intel-xe@lists.freedesktop.org];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
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



Am 30.08.24 um 10:58 schrieb Patchwork:
> == Series Details ==
>
> Series: drm: Provide client setup helper and convert drivers (rev3)
> URL   : https://patchwork.freedesktop.org/series/137387/
> State : failure
>
> == Summary ==
>
> === Applying kernel patches on branch 'drm-tip' with base: ===
> Base commit: d6714e4e0e19 drm-tip: 2024y-08m-30d-05h-34m-31s UTC integration manifest
> === git am output follows ===
> Applying: drm/fbdev-helper: Move color-mode lookup into 4CC format helper
> Applying: drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
> Applying: drm/fbdev: Add memory-agnostic fbdev client
> Applying: drm: Add client-agnostic setup helper
> Applying: drm/fbdev-dma: Support struct drm_driver.fbdev_probe
> Applying: drm/arcgpu: Run DRM default client setup
> Applying: drm/arm/komeda: Run DRM default client setup
> Applying: drm/arm/hdlcd: Run DRM default client setup
> Applying: drm/arm/malidp: Run DRM default client setup
> Applying: drm/aspeed: Run DRM default client setup
> Applying: drm/atmel-hdlcd: Run DRM default client setup
> Applying: drm/fsl-dcu: Run DRM default client setup
> Applying: drm/hisilicon/kirin: Run DRM default client setup
> Applying: drm/hx8357d: Run DRM default client setup
> Applying: drm/ili9163: Run DRM default client setup
> Applying: drm/ili9225: Run DRM default client setup
> Applying: drm/ili9341: Run DRM default client setup
> Applying: drm/ili9486: Run DRM default client setup
> Applying: drm/imx/dcss: Run DRM default client setup
> Applying: drm/imx/ipuv3: Run DRM default client setup
> Applying: drm/imx/lcdc: Run DRM default client setup
> Applying: drm/ingenic: Run DRM default client setup
> Applying: drm/kmb: Run DRM default client setup
> Applying: drm/logicvc: Run DRM default client setup
> Applying: drm/mcde: Run DRM default client setup
> Applying: drm/mediatek: Run DRM default client setup
> Applying: drm/meson: Run DRM default client setup
> Applying: drm/mi0283qt: Run DRM default client setup
> Applying: drm/mxsfb/lcdif: Run DRM default client setup
> Applying: drm/mxsfb: Run DRM default client setup
> Applying: drm/panel/ili9341: Run DRM default client setup
> Applying: drm/panel-mipi-dbi: Run DRM default client setup
> Applying: drm/pl111: Run DRM default client setup
> Applying: drm/renesas/rcar-du: Run DRM default client setup
> Applying: drm/renesas/rz-du: Run DRM default client setup
> Applying: drm/renesas/shmobile: Run DRM default client setup
> Applying: drm/repaper: Run DRM default client setup
> Applying: drm/rockchip: Run DRM default client setup
> Applying: drm/sti: Run DRM default client setup
> Applying: drm/stm: Run DRM default client setup
> Applying: drm/sun4i: Run DRM default client setup
> Applying: drm/tidss: Run DRM default client setup
> Applying: drm/tilcdc: Run DRM default client setup
> Applying: drm/st7586: Run DRM default client setup
> Applying: drm/st7735r: Run DRM default client setup
> Applying: drm/tve200: Run DRM default client setup
> Applying: drm/vc4: Run DRM default client setup
> Applying: drm/xlnx: Run DRM default client setup
> Applying: drm/fbdev-dma: Remove obsolete setup function
> Applying: drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
> Applying: drm/ast: Run DRM default client setup
> Applying: drm/cirrus: Run DRM default client setup
> Applying: drm/gm12u320: Run DRM default client setup
> Applying: drm/gud: Run DRM default client setup
> Applying: drm/hyperv_drm: Run DRM default client setup
> Applying: drm/mgag200: Run DRM default client setup
> Applying: drm/ofdrm: Use DRM default client setup
> Applying: drm/simpledrm: Run DRM default client setup
> Applying: drm/solomon: Run DRM default client setup
> Applying: drm/udl: Run DRM default client setup
> Applying: drm/virtgpu: Run DRM default client setup
> Applying: drm/vkms: Run DRM default client setup
> Applying: drm/fbdev-shmem: Remove obsolete setup function
> Applying: drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
> Applying: drm/amdgpu: Run DRM default client setup
> Applying: drm/bochs: Run DRM default client setup
> Applying: drm/hisilicon/hibmc: Run DRM default client setup
> Applying: drm/loongson: Run DRM default client setup
> Applying: drm/nouveau: Run DRM default client setup
> Applying: drm/qxl: Run DRM default client setup
> Applying: drm/vboxvideo: Run DRM default client setup
> Applying: drm/vmwgfx: Run DRM default client setup
> Applying: drm/fbdev-ttm: Remove obsolete setup function
> Applying: drm/armada: Run DRM default client setup
> Applying: drm/exynos-drm: Run DRM default client setup
> Applying: drm/gma500: Run DRM default client setup
> Applying: drm/msm: Run DRM derror: patch failed: drivers/gpu/drm/radeon/radeon_drv.c:260

I've just build this code on my machine. I also gave my base commit in 
the cover letter but the CI script seems to ignore it. :/

> error: drivers/gpu/drm/radeon/radeon_drv.c: patch does not apply
> error: patch failed: drivers/gpu/drm/radeon/radeon_fbdev.c:288
> error: drivers/gpu/drm/radeon/radeon_fbdev.c: patch does not apply
> error: patch failed: drivers/gpu/drm/radeon/radeon_mode.h:38
> error: drivers/gpu/drm/radeon/radeon_mode.h: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config advice.mergeConflict false"
> efault client setup
> Applying: drm/radeon: Run DRM default client setup
> Patch failed at 0078 drm/radeon: Run DRM default client setup
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

