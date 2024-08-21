Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E10C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 14:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A2110E5AC;
	Wed, 21 Aug 2024 14:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1ZXbLv+X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d2/aV/BD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ZXbLv+X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d2/aV/BD";
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599810E5F0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 14:01:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B13391FB44
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724248903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ImOsu8sSCuCSUasXuDEbrAOKNRcbzUIzsLcqMvwObBg=;
 b=1ZXbLv+XUtRIuunx+QayXF42QeCvahtLsJDOf/Bj6FEIjvyNh6HIu+uSnzo9JmblRMnaxs
 MFe2fTKCvMjjThSDut1SEyewfWGIw5y1X9ywpK4p5NW4uH2M4u2hXQwd6b4sDowAlx9sq4
 Jcn15fuAu1InnMOerGAv3MArMfiD7l8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724248903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ImOsu8sSCuCSUasXuDEbrAOKNRcbzUIzsLcqMvwObBg=;
 b=d2/aV/BD8xsIUXpjSXBg1JTvOxaH677vsc7ApgO3dWiEX7NSYLEcFokBtK9gs3kQPkQP5r
 6EtEyxWVWUEN19Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724248903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ImOsu8sSCuCSUasXuDEbrAOKNRcbzUIzsLcqMvwObBg=;
 b=1ZXbLv+XUtRIuunx+QayXF42QeCvahtLsJDOf/Bj6FEIjvyNh6HIu+uSnzo9JmblRMnaxs
 MFe2fTKCvMjjThSDut1SEyewfWGIw5y1X9ywpK4p5NW4uH2M4u2hXQwd6b4sDowAlx9sq4
 Jcn15fuAu1InnMOerGAv3MArMfiD7l8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724248903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ImOsu8sSCuCSUasXuDEbrAOKNRcbzUIzsLcqMvwObBg=;
 b=d2/aV/BD8xsIUXpjSXBg1JTvOxaH677vsc7ApgO3dWiEX7NSYLEcFokBtK9gs3kQPkQP5r
 6EtEyxWVWUEN19Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FBA8139C2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 14:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5tvPJUfzxWb9LAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>)
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 14:01:43 +0000
Message-ID: <cfb1d5d8-5e47-457d-aa63-bce0ba42e409@suse.de>
Date: Wed, 21 Aug 2024 16:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm=3A_Provide_cl?=
 =?UTF-8?Q?ient_setup_helper_and_convert_drivers_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <172424853165.721436.3814746934686870673@2413ebb6fbb6>
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
In-Reply-To: <172424853165.721436.3814746934686870673@2413ebb6fbb6>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, patchwork.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:helo]
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



Am 21.08.24 um 15:55 schrieb Patchwork:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm: Provide client setup helper and convert drivers (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/137387/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/index.html
>
>
>   CI Bug Log - changes from
>   xe-1804-c83ab549ef8f647c3de42793d222a980021a973f_BAT ->
>   xe-pw-137387v2_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-137387v2_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-137387v2_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (9 -> 8)
>
> Missing (1): bat-adlp-vf
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-137387v2_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_module_load@load:
>       o bat-lnl-2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/bat-lnl-2/igt@xe_module_load@load.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/bat-lnl-2/igt@xe_module_load@load.html>
>

This looks like what Sui was referring to. Since fb_helper funcs can now 
be NULL, this pointer needs to be checked. Will be fixed in v3 of this 
series.

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * igt@xe_module_load@load:
>       o {bat-bmg-2}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/bat-bmg-2/igt@xe_module_load@load.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/bat-bmg-2/igt@xe_module_load@load.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-137387v2_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_flip@basic-flip-vs-wf_vblank:
>
>       o bat-lnl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +2
>         other tests fail
>  *
>
>     igt@xe_vm@munmap-style-unbind-userptr-inval-end:
>
>       o bat-bmg-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1804-c83ab549ef8f647c3de42793d222a980021a973f/bat-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137387v2/bat-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1804-c83ab549ef8f647c3de42793d222a980021a973f ->
>     xe-pw-137387v2
>
> IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1804-c83ab549ef8f647c3de42793d222a980021a973f: 
> c83ab549ef8f647c3de42793d222a980021a973f
> xe-pw-137387v2: 137387v2
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

