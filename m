Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA00C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 13:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045F510E040;
	Tue, 28 Jan 2025 13:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="MuIdmBLd";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FF510E040
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 13:08:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3863703258fso4154766f8f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 05:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738069718; x=1738674518;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RY4O93I4CvebpCBsEtdmDE5bwfj8C9qQaHAgx0fg+wg=;
 b=MuIdmBLdRLE+5GUYlS9LKgNKSlbPrPWgGyLoXQ6WbsmrvOZIoj7rCUBam0Wu+6UAom
 ZIYAIB1dE+6mbtAGGjRTBU53wJFq8FO4ubyU83Zkgsi+0AfEpz6Z+Kr/2UNSmaoRDmOA
 P60DlPehiOXMSMx4oNl1hZNLkWosr7DuRhlm1Uwx6UWHFVbvPrwRQLfgQqUAvaricsXo
 12s60zvE8r/pI0vWrzPQkAf4xWGwn5z10AaJ+RfgfT8pjIkIntxZMO147PaPn5W0yAbr
 RpgQPz7cWz+QBxvdtLyb+gh/+xciFT80y6XNuGFArRk+xsM1eR7UF7H2bl6nDSh8F46p
 RGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738069718; x=1738674518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RY4O93I4CvebpCBsEtdmDE5bwfj8C9qQaHAgx0fg+wg=;
 b=A2zDcsKA17lEgBNnLdCGbp3UMcS09Nzbi/YKzZLXiBpNu6IsrO+Vi+/yxSw1Vzpkab
 0P0jUcGKGeXefu1RotwR+KTgB6zAAZu8nv/TCZkQgyGEsuOxDL6dTWvQZ+au+dGPTqUM
 qGfYKMoUk6V/bsx1eU29anV0YxQDvvJlPUF34SHLYmKtJgBeCrLqwFUcKadGi010xe6E
 105Uqawa9Zbq/rsZqz+fNh0od3lJOaUhEcJWQTejP/NT4e1AymPkkcRkNiRLm7n8fySa
 GMN7EFYVJdkR6j6RVKhFj6ZGZCOaLEGALzbUSHoHT7dOTQNUu+4ERAl74Y1HfUk5mxB9
 LuZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhLcP5bYNV+bjBj+xlSZWk4jDSBjWgxFnXhSRz0HgflpBfvPrkruSl5r21FLxpAAoLDIzRCToY7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKs1pvm1tiZCY8pg20fNFb6OxKkR/wVnzb7sJ71I7eF5IM+d+8
 oSAmAIt9CrrGNBl1CfEq8r87ou3qL4IMUADRCf6I0yCHA9UDYS0cXMESiZ+tM1s=
X-Gm-Gg: ASbGnct5fk2aro2Cn58nuVO5OjHlB/Fr/G2FEyxv7fuZFExvO6mpcz4BWpJwWN4hZi/
 W31y3it7pbw/huHOvXRbPDVu5HDwKqmumpghcEn84ZSSfKoqYumgCef6DS73c5WgsGLszQz0OQO
 Fr7DsKNUduzEasCJsBn7xE2vq+BTB/P+EC+IvBCGtQbQYht3eJWymCWHs2aYxoYHZrCPkkcZpFM
 fjddAz7OpT1sRqMm64jASclqWyzpAxdm0mJY1EjL8yEoC259E7g9TlJij/3qTr+QGg4l9fVrPl8
 GFguQbGz/NwdVrrlUThWSJ405Gsoefw=
X-Google-Smtp-Source: AGHT+IFfb7tf+j0anyixZwH1df4HSiC3ieCqelmbV75+VCLNc0ud+qFJsrdef7a/uwjLQkiz5VFyNQ==
X-Received: by 2002:a05:6000:186b:b0:385:df17:2148 with SMTP id
 ffacd0b85a97d-38c49a63323mr2433517f8f.20.1738069717655; 
 Tue, 28 Jan 2025 05:08:37 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0c9sm14258160f8f.78.2025.01.28.05.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 05:08:37 -0800 (PST)
Message-ID: <72a58a16-d7aa-4b85-bd67-40cd87366b0b@ursulin.net>
Date: Tue, 28 Jan 2025 13:08:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Disable AuxCCS framebuffers if built
 for Xe
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: "Souza, Jose" <jose.souza@intel.com>
References: <20240228140225.858145-1-juhapekka.heikkila@gmail.com>
 <875xy01vd8.fsf@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <875xy01vd8.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Hi,

On 05/03/2024 16:44, Jani Nikula wrote:
> On Wed, 28 Feb 2024, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>> AuxCCS framebuffers don't work on Xe driver hence disable them
>> from plane capabilities until they are fixed. FlatCCS framebuffers
>> work and they are left enabled. CCS is left untouched for i915
>> driver.

I couldn't find the answer in the below linked issue or in the thread - 
is it known what exactly is missing/broken to make this work and are 
there any plans to do it? Or perhaps not if gen12lp is not intended to 
be supported?

Thanks,

Tvrtko

>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/933
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
>> ---
>>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> index e941e2e4fd14..860574d04f88 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> @@ -2295,6 +2295,9 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
>>   	if (HAS_4TILE(i915))
>>   		caps |= INTEL_PLANE_CAP_TILING_4;
>>   
>> +	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(i915))
>> +		return caps;
>> +
>>   	if (skl_plane_has_rc_ccs(i915, pipe, plane_id)) {
>>   		caps |= INTEL_PLANE_CAP_CCS_RC;
>>   		if (DISPLAY_VER(i915) >= 12)
> 
