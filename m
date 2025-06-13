Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA7C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 11:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B69F10E996;
	Fri, 13 Jun 2025 11:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jG9+FnkA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q3/+/XpY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xHw5+Q6i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+OuKbQ4f";
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4281F10E996
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 11:20:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD563219B1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749813651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGY4EINRHEOkYmgZOcWasYJxiwyQauqLR1Uo2V0qBXY=;
 b=jG9+FnkAcecp9MLShN8zCrB9pJvWWy4YJLiJeuDNxB3Avhe7ZGx0q5KHzcPkuOWIGzsbVO
 Q9rwjtYT2/73L+6RvLlF1uqrBXuaQOeLEcpEezqrdM1Py1DiQ+K3jgjysg3BN4Cj+qX7yO
 +i/LJtQUsyHGWpIGhD8NuBDqg9KAVQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749813651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGY4EINRHEOkYmgZOcWasYJxiwyQauqLR1Uo2V0qBXY=;
 b=Q3/+/XpY0zHhMqCxISM6N/NVUf9Zqsr4dag8ms6PhIcw03ir/oDcVFloWmi3Zfc1jdthVz
 wZE6wcVRQ1AjYxBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xHw5+Q6i;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+OuKbQ4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749813650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGY4EINRHEOkYmgZOcWasYJxiwyQauqLR1Uo2V0qBXY=;
 b=xHw5+Q6i4Jw6E7ek8cDmjHkOm5ukbH2LlxdyMBCrpxFt1bm3A2e7LMlXkn89SGsFK2r0oE
 soKSa2LZOhHanwwYeRGE8KIEgmFbfgAGHKW+euHzOV5PIb1lQMbx9JHREe6cu5xP+AATeu
 W89SQNsAAKju+Ah/N5ACy7pEXXIrilM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749813650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGY4EINRHEOkYmgZOcWasYJxiwyQauqLR1Uo2V0qBXY=;
 b=+OuKbQ4f0VR5NkNplVjEQkt4ZEUsFbp+rJJN+YQBLdpMn5nfjomA9wEu1m+UAX7SvIQuCA
 CxQq0folFGC8rbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7318137FE
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 11:20:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M+A6L5IJTGh7XAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>)
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 11:20:50 +0000
Message-ID: <949cf08b-74b7-4760-a928-c6daace48e6a@suse.de>
Date: Fri, 13 Jun 2025 13:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/dumb-buffer?=
 =?UTF-8?Q?s=3A_Fix_and_improve_buffer-size_calculation_=28rev5=29?=
To: intel-xe@lists.freedesktop.org
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <174980668162.75408.13635454391645025559@1538d3639d33>
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
In-Reply-To: <174980668162.75408.13635454391645025559@1538d3639d33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_ONE(0.00)[1];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_MATCH_FROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[intel-xe@lists.freedesktop.org];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: DD563219B1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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


> [09:24:35] ============== drm_test_fb_xrgb8888_to_gray8  ==============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] # drm_test_fb_xrgb8888_to_gray8: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:672
> [09:24:35] Expected buf == result->expected, but
> [09:24:35]     buf ==
> [09:24:35]      ff  00  4c <95><1c><69><e2> b2
> [09:24:35]     result->expected ==
> [09:24:35]      ff  00  4c <99><19><66><e5> b2
> [09:24:35] [FAILED] well_known_colors
> [09:24:35] # drm_test_fb_xrgb8888_to_gray8: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:672
> [09:24:35] Expected buf == result->expected, but
> [09:24:35]     buf ==
> [09:24:35]     <3d><32><c1> 00  00 <ba><3d><32> 00  00  34 <ba><3d> 00  00
> [09:24:35]     result->expected ==
> [09:24:35]     <3c><33><c4> 00  00 <bb><3c><33> 00  00  34 <bb><3c> 00  00
> [09:24:35] [FAILED] destination_pitch
> [09:24:35] # drm_test_fb_xrgb8888_to_gray8: pass:2 fail:2 skip:0 total:4
> [09:24:35] ========== [FAILED] drm_test_fb_xrgb8888_to_gray8 ==========

FYI this unrelated. It is caused by commit a979a54165c2 
("drm/format-helper: Normalize BT.601 factors to 256"). A fix is 
available at https://patchwork.freedesktop.org/series/150218/


> [09:24:35] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
> [09:24:35] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
> [09:24:35] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
> [09:24:35] ============ drm_test_fb_xrgb8888_to_argb1555  =============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
> [09:24:35] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
> [09:24:35] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
> [09:24:35] ============= drm_test_fb_xrgb8888_to_bgr888  ==============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ========= [PASSED] drm_test_fb_xrgb8888_to_bgr888 ==========
> [09:24:35] ============ drm_test_fb_xrgb8888_to_argb8888  =============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
> [09:24:35] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
> [09:24:35] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
> [09:24:35] ============== drm_test_fb_xrgb8888_to_mono  ===============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
> [09:24:35] ==================== drm_test_fb_swab  =====================
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ================ [PASSED] drm_test_fb_swab =================
> [09:24:35] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
> [09:24:35] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
> [09:24:35] [PASSED] single_pixel_source_buffer
> [09:24:35] [PASSED] single_pixel_clip_rectangle
> [09:24:35] [PASSED] well_known_colors
> [09:24:35] [PASSED] destination_pitch
> [09:24:35] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
> [09:24:35] ================= drm_test_fb_clip_offset  =================
> [09:24:35] [PASSED] pass through
> [09:24:35] [PASSED] horizontal offset
> [09:24:35] [PASSED] vertical offset
> [09:24:35] [PASSED] horizontal and vertical offset
> [09:24:35] [PASSED] horizontal offset (custom pitch)
> [09:24:35] [PASSED] vertical offset (custom pitch)
> [09:24:35] [PASSED] horizontal and vertical offset (custom pitch)
> [09:24:35] ============= [PASSED] drm_test_fb_clip_offset =============
> [09:24:35] ============== drm_test_fb_build_fourcc_list  ==============
> [09:24:35] [PASSED] no native formats
> [09:24:35] [PASSED] XRGB8888 as native format
> [09:24:35] [PASSED] remove duplicates
> [09:24:35] [PASSED] convert alpha formats
> [09:24:35] [PASSED] random formats
> [09:24:35] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
> [09:24:35] =================== drm_test_fb_memcpy  ====================
> [09:24:35] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
> [09:24:35] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
> [09:24:35] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
> [09:24:35] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
> [09:24:35] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
> [09:24:35] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
> [09:24:35] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
> [09:24:35] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
> [09:24:35] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
> [09:24:35] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
> [09:24:35] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
> [09:24:35] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
> [09:24:35] =============== [PASSED] drm_test_fb_memcpy ================
> [09:24:35]     # module: drm_format_helper_test
> [09:24:35] # drm_format_helper_test: pass:17 fail:1 skip:0 total:18
> [09:24:35] # Totals: pass:82 fail:2 skip:0 total:84
> [09:24:35] ============= [FAILED] drm_format_helper_test ==============
> [09:24:35] ================= drm_format (18 subtests) =================
> [09:24:35] [PASSED] drm_test_format_block_width_invalid
> [09:24:35] [PASSED] drm_test_format_block_width_one_plane
> [09:24:35] [PASSED] drm_test_format_block_width_two_plane
> [09:24:35] [PASSED] drm_test_format_block_width_three_plane
> [09:24:35] [PASSED] drm_test_format_block_width_tiled
> [09:24:35] [PASSED] drm_test_format_block_height_invalid
> [09:24:35] [PASSED] drm_test_format_block_height_one_plane
> [09:24:35] [PASSED] drm_test_format_block_height_two_plane
> [09:24:35] [PASSED] drm_test_format_block_height_three_plane
> [09:24:35] [PASSED] drm_test_format_block_height_tiled
> [09:24:35] [PASSED] drm_test_format_min_pitch_invalid
> [09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
> [09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
> [09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
> [09:24:35] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
> [09:24:35] [PASSED] drm_test_format_min_pitch_two_plane
> [09:24:35] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
> [09:24:35] [PASSED] drm_test_format_min_pitch_tiled
> [09:24:35] =================== [PASSED] drm_format ====================
> [09:24:35] ============== drm_framebuffer (10 subtests) ===============
> [09:24:35] ========== drm_test_framebuffer_check_src_coords  ==========
> [09:24:35] [PASSED] Success: source fits into fb
> [09:24:35] [PASSED] Fail: overflowing fb with x-axis coordinate
> [09:24:35] [PASSED] Fail: overflowing fb with y-axis coordinate
> [09:24:35] [PASSED] Fail: overflowing fb with source width
> [09:24:35] [PASSED] Fail: overflowing fb with source height
> [09:24:35] ====== [PASSED] drm_test_framebuffer_check_src_coords ======
> [09:24:35] [PASSED] drm_test_framebuffer_cleanup
> [09:24:35] =============== drm_test_framebuffer_create  ===============
> [09:24:35] [PASSED] ABGR8888 normal sizes
> [09:24:35] [PASSED] ABGR8888 max sizes
> [09:24:35] [PASSED] ABGR8888 pitch greater than min required
> [09:24:35] [PASSED] ABGR8888 pitch less than min required
> [09:24:35] [PASSED] ABGR8888 Invalid width
> [09:24:35] [PASSED] ABGR8888 Invalid buffer handle
> [09:24:35] [PASSED] No pixel format
> [09:24:35] [PASSED] ABGR8888 Width 0
> [09:24:35] [PASSED] ABGR8888 Height 0
> [09:24:35] [PASSED] ABGR8888 Out of bound height * pitch combination
> [09:24:35] [PASSED] ABGR8888 Large buffer offset
> [09:24:35] [PASSED] ABGR8888 Buffer offset for inexistent plane
> [09:24:35] [PASSED] ABGR8888 Invalid flag
> [09:24:35] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
> [09:24:35] [PASSED] ABGR8888 Valid buffer modifier
> [09:24:35] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
> [09:24:35] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] NV12 Normal sizes
> [09:24:35] [PASSED] NV12 Max sizes
> [09:24:35] [PASSED] NV12 Invalid pitch
> [09:24:35] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
> [09:24:35] [PASSED] NV12 different  modifier per-plane
> [09:24:35] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
> [09:24:35] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] NV12 Modifier for inexistent plane
> [09:24:35] [PASSED] NV12 Handle for inexistent plane
> [09:24:35] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
> [09:24:35] [PASSED] YVU420 Normal sizes
> [09:24:35] [PASSED] YVU420 Max sizes
> [09:24:35] [PASSED] YVU420 Invalid pitch
> [09:24:35] [PASSED] YVU420 Different pitches
> [09:24:35] [PASSED] YVU420 Different buffer offsets/pitches
> [09:24:35] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
> [09:24:35] [PASSED] YVU420 Valid modifier
> [09:24:35] [PASSED] YVU420 Different modifiers per plane
> [09:24:35] [PASSED] YVU420 Modifier for inexistent plane
> [09:24:35] [PASSED] YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
> [09:24:35] [PASSED] X0L2 Normal sizes
> [09:24:35] [PASSED] X0L2 Max sizes
> [09:24:35] [PASSED] X0L2 Invalid pitch
> [09:24:35] [PASSED] X0L2 Pitch greater than minimum required
> [09:24:35] [PASSED] X0L2 Handle for inexistent plane
> [09:24:35] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
> [09:24:35] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
> [09:24:35] [PASSED] X0L2 Valid modifier
> [09:24:35] [PASSED] X0L2 Modifier for inexistent plane
> [09:24:35] =========== [PASSED] drm_test_framebuffer_create ===========
> [09:24:35] [PASSED] drm_test_framebuffer_free
> [09:24:35] [PASSED] drm_test_framebuffer_init
> [09:24:35] [PASSED] drm_test_framebuffer_init_bad_format
> [09:24:35] [PASSED] drm_test_framebuffer_init_dev_mismatch
> [09:24:35] [PASSED] drm_test_framebuffer_lookup
> [09:24:35] [PASSED] drm_test_framebuffer_lookup_inexistent
> [09:24:35] [PASSED] drm_test_framebuffer_modifiers_not_supported
> [09:24:35] ================= [PASSED] drm_framebuffer =================
> [09:24:35] ================ drm_gem_shmem (8 subtests) ================
> [09:24:35] [PASSED] drm_gem_shmem_test_obj_create
> [09:24:35] [PASSED] drm_gem_shmem_test_obj_create_private
> [09:24:35] [PASSED] drm_gem_shmem_test_pin_pages
> [09:24:35] [PASSED] drm_gem_shmem_test_vmap
> [09:24:35] [PASSED] drm_gem_shmem_test_get_pages_sgt
> [09:24:35] [PASSED] drm_gem_shmem_test_get_sg_table
> [09:24:35] [PASSED] drm_gem_shmem_test_madvise
> [09:24:35] [PASSED] drm_gem_shmem_test_purge
> [09:24:35] ================== [PASSED] drm_gem_shmem ==================
> [09:24:35] === drm_atomic_helper_connector_hdmi_check (27 subtests) ===
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_auto_cea_mode_vic_1
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_full_cea_mode_vic_1
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_limited_cea_mode_vic_1
> [09:24:35] ====== drm_test_check_broadcast_rgb_cea_mode_yuv420  =======
> [09:24:35] [PASSED] Automatic
> [09:24:35] [PASSED] Full
> [09:24:35] [PASSED] Limited 16:235
> [09:24:35] == [PASSED] drm_test_check_broadcast_rgb_cea_mode_yuv420 ===
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_changed
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_crtc_mode_not_changed
> [09:24:35] [PASSED] drm_test_check_disable_connector
> [09:24:35] [PASSED] drm_test_check_hdmi_funcs_reject_rate
> [09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_rgb
> [09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_yuv420
> [09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422
> [09:24:35] [PASSED] drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420
> [09:24:35] [PASSED] drm_test_check_driver_unsupported_fallback_yuv420
> [09:24:35] [PASSED] drm_test_check_output_bpc_crtc_mode_changed
> [09:24:35] [PASSED] drm_test_check_output_bpc_crtc_mode_not_changed
> [09:24:35] [PASSED] drm_test_check_output_bpc_dvi
> [09:24:35] [PASSED] drm_test_check_output_bpc_format_vic_1
> [09:24:35] [PASSED] drm_test_check_output_bpc_format_display_8bpc_only
> [09:24:35] [PASSED] drm_test_check_output_bpc_format_display_rgb_only
> [09:24:35] [PASSED] drm_test_check_output_bpc_format_driver_8bpc_only
> [09:24:35] [PASSED] drm_test_check_output_bpc_format_driver_rgb_only
> [09:24:35] [PASSED] drm_test_check_tmds_char_rate_rgb_8bpc
> [09:24:35] [PASSED] drm_test_check_tmds_char_rate_rgb_10bpc
> [09:24:35] [PASSED] drm_test_check_tmds_char_rate_rgb_12bpc
> [09:24:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_check ======
> [09:24:35] === drm_atomic_helper_connector_hdmi_reset (6 subtests) ====
> [09:24:35] [PASSED] drm_test_check_broadcast_rgb_value
> [09:24:35] [PASSED] drm_test_check_bpc_8_value
> [09:24:35] [PASSED] drm_test_check_bpc_10_value
> [09:24:35] [PASSED] drm_test_check_bpc_12_value
> [09:24:35] [PASSED] drm_test_check_format_value
> [09:24:35] [PASSED] drm_test_check_tmds_char_value
> [09:24:35] ===== [PASSED] drm_atomic_helper_connector_hdmi_reset ======
> [09:24:35] = drm_atomic_helper_connector_hdmi_mode_valid (4 subtests) =
> [09:24:35] [PASSED] drm_test_check_mode_valid
> [09:24:35] [PASSED] drm_test_check_mode_valid_reject
> [09:24:35] [PASSED] drm_test_check_mode_valid_reject_rate
> [09:24:35] [PASSED] drm_test_check_mode_valid_reject_max_clock
> [09:24:35] === [PASSED] drm_atomic_helper_connector_hdmi_mode_valid ===
> [09:24:35] ================= drm_managed (2 subtests) =================
> [09:24:35] [PASSED] drm_test_managed_release_action
> [09:24:35] [PASSED] drm_test_managed_run_action
> [09:24:35] =================== [PASSED] drm_managed ===================
> [09:24:35] =================== drm_mm (6 subtests) ====================
> [09:24:35] [PASSED] drm_test_mm_init
> [09:24:35] [PASSED] drm_test_mm_debug
> [09:24:35] [PASSED] drm_test_mm_align32
> [09:24:35] [PASSED] drm_test_mm_align64
> [09:24:35] [PASSED] drm_test_mm_lowest
> [09:24:35] [PASSED] drm_test_mm_highest
> [09:24:35] ===================== [PASSED] drm_mm ======================
> [09:24:35] ============= drm_modes_analog_tv (5 subtests) =============
> [09:24:35] [PASSED] drm_test_modes_analog_tv_mono_576i
> [09:24:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i
> [09:24:35] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
> [09:24:35] [PASSED] drm_test_modes_analog_tv_pal_576i
> [09:24:35] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
> [09:24:35] =============== [PASSED] drm_modes_analog_tv ===============
> [09:24:35] ============== drm_plane_helper (2 subtests) ===============
> [09:24:35] =============== drm_test_check_plane_state  ================
> [09:24:35] [PASSED] clipping_simple
> [09:24:35] [PASSED] clipping_rotate_reflect
> [09:24:35] [PASSED] positioning_simple
> [09:24:35] [PASSED] upscaling
> [09:24:35] [PASSED] downscaling
> [09:24:35] [PASSED] rounding1
> [09:24:35] [PASSED] rounding2
> [09:24:35] [PASSED] rounding3
> [09:24:35] [PASSED] rounding4
> [09:24:35] =========== [PASSED] drm_test_check_plane_state ============
> [09:24:35] =========== drm_test_check_invalid_plane_state  ============
> [09:24:35] [PASSED] positioning_invalid
> [09:24:35] [PASSED] upscaling_invalid
> [09:24:35] [PASSED] downscaling_invalid
> [09:24:35] ======= [PASSED] drm_test_check_invalid_plane_state ========
> [09:24:35] ================ [PASSED] drm_plane_helper =================
> [09:24:35] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
> [09:24:35] ====== drm_test_connector_helper_tv_get_modes_check  =======
> [09:24:35] [PASSED] None
> [09:24:35] [PASSED] PAL
> [09:24:35] [PASSED] NTSC
> [09:24:35] [PASSED] Both, NTSC Default
> [09:24:35] [PASSED] Both, PAL Default
> [09:24:35] [PASSED] Both, NTSC Default, with PAL on command-line
> [09:24:35] [PASSED] Both, PAL Default, with NTSC on command-line
> [09:24:35] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
> [09:24:35] ======== [PASSED] drm_connector_helper_tv_get_modes ========
> [09:24:35] ================== drm_rect (9 subtests) ===================
> [09:24:35] [PASSED] drm_test_rect_clip_scaled_div_by_zero
> [09:24:35] [PASSED] drm_test_rect_clip_scaled_not_clipped
> [09:24:35] [PASSED] drm_test_rect_clip_scaled_clipped
> [09:24:35] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
> [09:24:35] ================= drm_test_rect_intersect  =================
> [09:24:35] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
> [09:24:35] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
> [09:24:35] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
> [09:24:35] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
> [09:24:35] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
> [09:24:35] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
> [09:24:35] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
> [09:24:35] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
> [09:24:35] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
> [09:24:35] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
> [09:24:35] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
> [09:24:35] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
> stty: 'standard input': Inappropriate ioctl for device
> [09:24:35] [PASSED] far away: 1x1+0+0 x 1x1+3+6
> [09:24:35] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
> [09:24:35] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
> [09:24:35] ============= [PASSED] drm_test_rect_intersect =============
> [09:24:35] ================ drm_test_rect_calc_hscale  ================
> [09:24:35] [PASSED] normal use
> [09:24:35] [PASSED] out of max range
> [09:24:35] [PASSED] out of min range
> [09:24:35] [PASSED] zero dst
> [09:24:35] [PASSED] negative src
> [09:24:35] [PASSED] negative dst
> [09:24:35] ============ [PASSED] drm_test_rect_calc_hscale ============
> [09:24:35] ================ drm_test_rect_calc_vscale  ================
> [09:24:35] [PASSED] normal use
> [09:24:35] [PASSED] out of max range
> [09:24:35] [PASSED] out of min range
> [09:24:35] [PASSED] zero dst
> [09:24:35] [PASSED] negative src
> [09:24:35] [PASSED] negative dst
> [09:24:35] ============ [PASSED] drm_test_rect_calc_vscale ============
> [09:24:35] ================== drm_test_rect_rotate  ===================
> [09:24:35] [PASSED] reflect-x
> [09:24:35] [PASSED] reflect-y
> [09:24:35] [PASSED] rotate-0
> [09:24:35] [PASSED] rotate-90
> [09:24:35] [PASSED] rotate-180
> [09:24:35] [PASSED] rotate-270
> [09:24:35] ============== [PASSED] drm_test_rect_rotate ===============
> [09:24:35] ================ drm_test_rect_rotate_inv  =================
> [09:24:35] [PASSED] reflect-x
> [09:24:35] [PASSED] reflect-y
> [09:24:35] [PASSED] rotate-0
> [09:24:35] [PASSED] rotate-90
> [09:24:35] [PASSED] rotate-180
> [09:24:35] [PASSED] rotate-270
> [09:24:35] ============ [PASSED] drm_test_rect_rotate_inv =============
> [09:24:35] ==================== [PASSED] drm_rect =====================
> [09:24:35] ============================================================
> [09:24:35] Testing complete. Ran 616 tests: passed: 614, failed: 2
> [09:24:35] Failures: drm_format_helper_test.drm_test_fb_xrgb8888_to_gray8.well_known_colors, drm_format_helper_test.drm_test_fb_xrgb8888_to_gray8.destination_pitch
> [09:24:35] Elapsed time: 23.483s total, 1.642s configuring, 21.671s building, 0.148s running
>
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
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

