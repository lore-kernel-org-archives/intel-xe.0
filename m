Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16D5606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=vhDjfD3i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770C8112524;
	Thu, 22 Oct 2026 12:03:55 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DC510E0B6
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 02:28:11 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-704597ef1d8so612768eaf.3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 19:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.edu; s=google; t=1792636091; x=1793240891; darn=lists.freedesktop.org;
 h=mime-version:content-transfer-encoding:content-type:references
 :in-reply-to:cc:date:subject:to:from:message-id:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xruEMXmxKsYyy3/7Uv5aUsYVZ6xRBTshqU8cnD7X6m8=;
 b=vhDjfD3iElhly3hWPPl+XJWyPkfzarNKzuDZJstiR4az/d4xJI9wscSrt5GpUsjkIt
 t17sSteBRk5RWIF7wbmLEXLgj0s+HA7VQYORZojFn30RKLPVfddylWcCFGlEOW30yKCZ
 e34BPAYDdFPvgfM+tjbGVNLCbN7g7+HKfyvhFAKtEJjxmO/skulx6+aiaYrlqtUSnNL9
 eDhvSv9+8vPjvNPp5Py7zJ8l62+DJ0cnzzGuaK0JgjMW48fozw1QMzhEloKS7brskJy8
 9zyLKf2IFyD7cYjIYVj8frKEG4QE2uYj0tkpn+tZyHwVHwXMOBVYBakl6xp1b8O4t6v6
 vdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792636091; x=1793240891;
 h=mime-version:content-transfer-encoding:content-type:references
 :in-reply-to:cc:date:subject:to:from:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xruEMXmxKsYyy3/7Uv5aUsYVZ6xRBTshqU8cnD7X6m8=;
 b=CjR7/ZeAb1uXobpcBYHDMwo71tt1f/X8eSh9e49NyHjCfAG4b5WOPNBMOBrJc4lONn
 mibmPn+x49/AiWvDWe/FXdzFxph/3RB/7X3Cc66w+CGlDTr74jWvOjiWcqDXUhWg1qPu
 IerFJUr3upV2OBTtZQK9m5Bz0hzpGHdr+gd1G4Vi+I/a96MUVKvlL76Msn7b6+DzJ8Pa
 nfmFEPiEHUcWnvp7Y0I+X6QiE8Uv5q+MJAaqwqeCHggrLFGQ8GfzCMy027ZMgVTR6QSs
 V9BL2xsIyxCh0/UahJLA6n9Iocj8AiKl5ayHE+thFq4ysfl7zu/nmQaE75WZvPsw4GAX
 FjtA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxyunlX5NMBGy5V0VqX+rR6puG+bg2Wi+0Au54CUroL+pcgzeJPMgfI2l+1b0l3bp5i001CRKj+Hw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK2Be2q2b4i++HswrqZlXwev7vujpYZFxDX92VGXAuD6MXK5tKE
 Zw13dWDThPkLL9U5KgEZhO9Q/JOVcfkUO1szl1bnoYRzWoLiq2mUIEycy4BplJanGZE=
X-Gm-Gg: AYBFou0T0j3adIRPFdMQi+AjLPV+lAZH6iRNWZ9ttQDSlh9+/8GCKe/GSyQJhBnY52+
 ayWddpi8AzSfmVSxlxSEtgWKYnnPbDC18FJyaiHancKit1KrTHF7EpcIgfQQx2MczNzB/EPeTGw
 ZsSYkOfTSJBItTGSKsrvXbkP5EaBkSbIwOAXII9AyGd3iV7KTHv+QZKn/G+3wPW8uiM/RhzEwEK
 1dRG5p3b37ekGrNoYvwPxvNzpq2I3VK6fmhYlP8R0a0AG/G8I+dtyFbyoTxY1eWaeUO5jalwgzR
 UQ3SO8V1HXwiP9iqYNuegdalC/mtSzZpSXNd4hBEn7IQKBgETgo6yX/A7Ktkf+YsdgiyNVGpOhs
 kKazoWsZxQONq0o44gticIyQvcXoA7PZHTYBLvS+WUWpL8/QSM+BRm7dBQIVKbdlcbHnHff2g/2
 MWFQvRLTU+6jqXH1FvaL971BUAzCWlhj9L7Czj/D4gVDM1VL6Iztn9wUDulffcrC1XHfcdjRk8h
 6QCK2p3RtSS+jbTIhvhj6X7WHMwYwl7qlZDY5g4RQb3T+HLICcTGlPcmOMIlJnfiSobLyDil7Cq
 +L11DU4fv4Hlf7hkPM6bCMM3zeqgQZ/gBPE30B7X9Wd9NLAJokV19t+Jcyn7SV6cFC2K0+Ps3EU
 QzQwVl1UPK/i3O4gI5mkv1j8xIyYFo+4q2QnUVOUoli9SnEUFtAnrERCW9iqeIb6C+GLvMVA2YW
 in9OFHQW5Ye+ZEQswvx58=
X-Received: by 2002:a05:6820:813:b0:6b7:8396:f3d6 with SMTP id
 006d021491bc7-70941fbb729mr2897081eaf.56.1792636090730; 
 Wed, 21 Oct 2026 19:28:10 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([173.174.112.101]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a7d5eb8fc0sm3431624fac.1.2026.10.21.19.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 19:28:10 -0700 (PDT)
Message-ID: <6ad974ba.a8122b97.39a7e6.f867@mx.google.com>
From: karim.sabar@utexas.edu
To: matthew.brost@intel.com
Subject: Re: [PATCH] drm/xe: Use kvmalloc for the VMA ops page-table update
 array
Date: Wed, 21 Oct 2026 21:28:08 -0500
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <atkLLH47Zd6vMX3B@gsse-cloud1.jf.intel.com>
References: <atkLLH47Zd6vMX3B@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Oct 2026 12:03:54 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey Matthew!

Sounds good to me, the fallback of trying to bind the vma one at a time sound=
s good to me. And it is actually a bit broader than my patch since it covers =
the -ENOBUFS case as well. It should also be easy to get through drm-xe-fixes=
 and then backported the normal way.

I can write it as a v2 & test it on my Panther Lake device, I have a small re=
pro that does about 20,000 mappings and fails after suspend (every time witho=
ut the fix). If you'd prefer to write it, I can test your patch as well.

Thanks,
Karim

On Wed, 21 Oct 2026 11:57:48 -0700, Matthew Brost wrote:
> On Tue, Oct 20, 2026 at 07:08:27PM -0500, karim.sabar@utexas.edu wrote:
>> From: Karim Sabar <karim.sabar@utexas.edu>
>>=20
>
> Thanks for the patch. I do see the problem in the old code.
> Unfortunately, we will not be able to pull this into drm-xe-next or
> drm-xe-fixes, as 7.3 is already out and 0e33330f1238 is included in our
> 7.4 PR. As a result, this would need to go directly to stable.
>
> There is also a risk that predates the series containing 0e33330f1238.
> If the bind has to run on the GPU, you can still get -ENOBUFS later in
> the bind pipeline if the bind is too large to fit into the
> migration-layer BB. If that occurs, the proper fix may actually be in
> xe_vm_validate_rebind(). If xe_vm_rebind() fails with -ENOBUFS or
> -ENOMEM, we could call a new function, such as xe_vm_rebind_iterative(),
> which would run each VMA requiring a rebind in its own job. This is
> effectively what Mesa does in userspace when a bind operation returns
> -ENOBUFS.
>
> We could probably still pull that approach into drm-xe-fixes + have
> naturally backport to stable, and it may ultimately be the better
> solution.
>
> Let me know what you think. I can give this an RB, but I'd like to hold
> off until we've settled on the solution we want to pursue here.
>
> Matt
>
>> Big games die after every s2idle resume on flat-CCS iGPUs. The exec
>> ioctl keeps returning -ENOMEM even with 11-16 GB of RAM free.
>>=20
>> On suspend xe_bo_evict_all_user() evicts every user BO in XE_PL_TT on
>> these parts. On resume the first exec rebinds every VMA in one go and
>> xe_vma_ops_alloc() kmallocs one 384-byte op per VMA as a single array.
>> Final Fantasy VII Rebirth has about 33,500 VMAs which means a 12.9 MB
>> array. It's over the 4 MB KMALLOC_MAX_SIZE and can never succeed.
>> __GFP_NOWARN keeps it out of dmesg.
>>=20
>> Data from a Panther Lake handheld (SteamOS kernel 7.2.7), kretprobes
>> after resume:
>>   xe_vma_ops_alloc  -ENOMEM on 63 of 63 attempts
>>   xe_vm_rebind      -ENOMEM on 63 of 63 attempts
>>   BO validate, TTM populate, PT prepare  never failed
>>=20
>> The array is only used by the CPU and doesn't need to be contiguous.
>> This switches it to kvmalloc and kvfree.
>>=20
>> With the same change applied as a module on that kernel, the game
>> survives every sleep I tried with zero ENOMEM. The biggest array was
>> 30,753 ops (11.8 MB).
>>=20
>> drm-xe-next already does this through commit 0e33330f1238 ("drm/xe: Add
>> struct xe_pt_job_ops"), but that's part of a big series that won't go
>> to stable.
>>=20
>> I tracked this down and tested it on my own device. I used an AI
>> assistant to help with the debugging, i.e the kprobe tracing and
>> reading through the xe code. I ran every test, picked the fix and
>> reviewed the change myself.
>>=20
>> What I couldn't do: this is build-tested on drm-xe-fixes but only
>> run-tested on the SteamOS 7.2.7 kernel through an equivalent module,
>> not on a mainline kernel.
>>=20
>> Fixes: 2e524668c440 ("drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops")
>> Cc: stable@vger.kernel.org # v6.11+
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Karim Sabar <karim.sabar@utexas.edu>
>> ---
>> Downstream SteamOS report with the same data: https://github.com/ValveSoft=
ware/SteamOS/issues/2962
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 99e42bd29..5caef443b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -703,9 +703,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, b=
ool array_of_binds)
>>  			continue;
>> =20
>>  		vops->pt_update_ops[i].ops =3D
>> -			kmalloc_objs(*vops->pt_update_ops[i].ops,
>> -				     vops->pt_update_ops[i].num_ops,
>> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>> +			kvmalloc_objs(*vops->pt_update_ops[i].ops,
>> +				      vops->pt_update_ops[i].num_ops,
>> +				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>  		if (!vops->pt_update_ops[i].ops)
>>  			return array_of_binds ? -ENOBUFS : -ENOMEM;
>>  	}
>> @@ -742,7 +742,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>  	xe_vma_svm_prefetch_ops_fini(vops);
>> =20
>>  	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>> -		kfree(vops->pt_update_ops[i].ops);
>> +		kvfree(vops->pt_update_ops[i].ops);
>>  }
>> =20
>>  static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 til=
e_mask, int inc_val)
>>=20
>> ---
>> base-commit: d2ce8fcd778ee6d92748c92d23a56d4416c29d86
>> change-id: 20261020-xe-kvmalloc-vma-ops-2637ebf81cfd
>>=20
>> Best regards,
>> -- =20
>> Karim Sabar <karim.sabar@utexas.edu>
>>
