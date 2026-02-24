Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D839EFB7F3
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF0610E49A;
	Tue, 24 Feb 2026 03:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O62caR/b";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64810E49A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 03:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771904521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfGi+rTpkYSFnpVCfQmyET1TglGZ7PTVeu2IkOlJh3U=;
 b=O62caR/bgXfQUXOMO1Aq6DWNgZVPJmDGB3wmGydzIDcbT1KDKJYtxHFauTpyLRlZF10ddV
 ISOgxMD74r4/KLqZXRxnzNyoRk5E/iUOE8SsrnudubEk/2uXZDFWbK8Y4+P4RQAlnR4N15
 Uju2uAaMT7S7QCmDQe+e59fYTKDQVl4=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-TEozwSbdPmeHIc0jv2ZIvA-1; Mon, 23 Feb 2026 22:41:57 -0500
X-MC-Unique: TEozwSbdPmeHIc0jv2ZIvA-1
X-Mimecast-MFC-AGG-ID: TEozwSbdPmeHIc0jv2ZIvA_1771904517
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1275c6fc58aso9198240c88.0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 19:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771904517; x=1772509317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZfGi+rTpkYSFnpVCfQmyET1TglGZ7PTVeu2IkOlJh3U=;
 b=Ze3IsYd3zE+UwKil61y9v/QkM4KJdQbXHJGCz/ttrmpcbRBROLodAFBCCWEDiotRw4
 deYMY5BcL+GFCJf1pM7EPdEYEyvibb8vVzJQ7rF85Q5PlPDcTNmfYuxgsHv+H4yzZ+Ta
 uZoClOUWFeZyH5L/14yZj15ZJIb4r+8jwE+NAdWqJRKUoGBwpZrn4H6VmFzml7q26TOQ
 Eoj/AfuGwezay2r1d3dC/iSvzjPwHhDWK6jOqu+Z+OedmyrgB86Z9iO6E3Di32O/gZHJ
 FKi6MII2dfjTQKdGMcT6VICoatqbjTfLShjLNptQRNn0numpKDLKUZoo+3fYQTrCG0Ro
 Y43A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCTzwvzqmbI6BSAXUiU6pRrZNQkuzRE6D6IdPWrekvo/9/VAB/CKCELYOB+Xyj7T1M9pimcYCwNQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwogXDz+K6gYWdYKDB/t7wI0XyKqjcz+3/zzx0PbQh+fJZ8w4Oj
 oZSg5r9+31GbTgwKQgWgGUaJEytEJxKOCct6lZCH2GGQKvGSjggc/dTgPmngwXVpVAmalX5iv36
 th+NL/75Qnsj9e6/+0Ysd7o6bRplICbWawQCcT2dRKdt3ULMBHqA/3X6pG5YG31TaaGaPlb8pkR
 IwRNO9V4G/M3FOeZRDt5WQdvlyPRK/s2S7Xax1ldK1sio=
X-Gm-Gg: AZuq6aLS9fmNJ6dAocPjQyIbsA0BGE3eR3TBAqCoJp0wUSKfLRni8iGate+tlGiXQjG
 6rGXxzlmR/hMydvZ+nqAPxgiGWxHUPRjBj65j05ISh3NDA9hhrn9XaibPWA6wFMmuKjjJ58XseG
 YCyRMFJJVNZ3AmhqoZ+7VMxVWFtCk+giSNAtTBN6TK2V38GEOvCWFgK9txp6dJPBUlNBXDeXpop
 cFXrwgRVxE/CL/+izCradEJ/nIDAnUlyvLl
X-Received: by 2002:a05:7022:6986:b0:11b:923d:773f with SMTP id
 a92af1059eb24-1276acb7fe9mr4491844c88.5.1771904516618; 
 Mon, 23 Feb 2026 19:41:56 -0800 (PST)
X-Received: by 2002:a05:7022:6986:b0:11b:923d:773f with SMTP id
 a92af1059eb24-1276acb7fe9mr4491833c88.5.1771904516247; Mon, 23 Feb 2026
 19:41:56 -0800 (PST)
MIME-Version: 1.0
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com>
 <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
 <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
 <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
 <DGMP4FBY8958.1KNWJH7IW7M3I@kernel.org>
In-Reply-To: <DGMP4FBY8958.1KNWJH7IW7M3I@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Tue, 24 Feb 2026 13:41:45 +1000
X-Gm-Features: AaiRm50BDo_t3xPlwTJEEpGzOePwAdIFv9N6YtS43JfkuKqEUHkSqaC-olJg6xU
Message-ID: <CAMwc25q4hXq-ztUHRnMaiWV4aqZeNypU0c_9hatsU_Pyov1G2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
To: Danilo Krummrich <dakr@kernel.org>
Cc: Koen Koning <koen.koning@linux.intel.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>, 
 Arun Pravin <arunpravin.paneerselvam@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q-v2E7ZHLejxV1DI8SZZfcpJF8CNk5PL9pHgUqziQRs_1771904517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 24, 2026 at 8:31=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> (Cc: Arun)
>
> On Mon Feb 23, 2026 at 12:20 PM CET, Danilo Krummrich wrote:
> > On Mon Feb 23, 2026 at 12:17 PM CET, Koen Koning wrote:
> >> Thanks that makes sense, then let's just stick to addressing the curre=
nt
> >> regression with gpu/buddy in the drm-tip tree.
> >
> > The patch should go into drm-misc-next.
> >
> >> Joel, could you grab the v1 of this patchset (or the v2 with with
> >> subsys_initcall, either works) and try to get it applied to drm-tip?
> >> Since this is my first time submitting patches, I'm not really sure ho=
w
> >> to proceed from here, and it will probably be faster if you have a loo=
k.
> >
> > I think we should land your original v1; I don't know if Joel can push =
to
> > drm-misc-next, if not please let me know, I can pick it up then.
>
> Actually, since GPU buddy has a separate maintainers entry, I will leave =
it to
> Matthew and Arun.
>
> (Cc'd you both on v1.)

Since I pushed the original damage, I've pushed this fix.

Dave.

