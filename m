Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8CC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 23:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84D1136EC;
	Tue, 30 Jan 2024 23:12:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C011136EC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 23:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706656374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fv+R8xHqvzsWU4D2+vpyr2dwKdFPoYcOkRs4YtK2ubw=;
 b=MpVW4pHvmvrXOiqxDcZZvQ6Nyj0YEn7FXVxtjQbteL4QCNM96MyGZULTXKKYjoMPwlE9nU
 xQr4W/VJOCggHmJzunknXgVP1nhbfV/0zMuYN9h5P1WXdrCM7e2KExGmJnMB1IAdgUM19M
 l8rm07wYL42bejWlZIUyw49Y7p2Ghb0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-sN3bpYO-Ol6KyXUub0ebKQ-1; Tue, 30 Jan 2024 18:12:52 -0500
X-MC-Unique: sN3bpYO-Ol6KyXUub0ebKQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3bd49f232c8so5935514b6e.1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 15:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706656372; x=1707261172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fv+R8xHqvzsWU4D2+vpyr2dwKdFPoYcOkRs4YtK2ubw=;
 b=Fooh+mVTv4JTsJ8h2kWrhTg96NlM25G/j/FujoY2uvgl3ON6//EI3NfrpO1WCH5jWS
 SrcSyRtzNJUAPumiXCrTPtmGWw/0VVObIQhJnd3WSqcw/Zp9Arq7Fwx8PTdkz0NzWPKz
 Hlm1brLs3pbZbcco43+RC6t6qdNV8nvHVKY8V8xrexobhkNfOeIjjdzLjesM6KY6MqU3
 y4GqrzucF0hh4YdIypqm7FrTWx/jTP7ntCL3Atgwnbd87u2ED1o5BM8ERmL/r1YUrDyz
 +dpbe9JYMnO6h1BMBl+iQJZoCbicmh1GvWIr+FhPdvl3WRrsu6p1U6O1PQYs90j2oiH/
 OwpQ==
X-Gm-Message-State: AOJu0Yy/E5GZ7HdmmPT3BRd4c6NMCg8yqaFToNFbugcudiASKFWLxpdM
 ez+0jmCB96IZa6Ybh0hiRG+m4nTHPaXI2CjgOrug78FZqPa8mn4Sboe9GJSlZrilP4IxG+llHUi
 GYmZpvXK/QgMYpvbRJOsMhJrN6C1VdHg8GV4jPqHWSuQUcUBUDzJMI1qS6BhrrYF0DHkTENfNCf
 qbw034HsNTpwa+3I4CoQiXDy9hoGjwTWEJp2BZiDk=
X-Received: by 2002:a05:6808:1718:b0:3bd:cd55:d320 with SMTP id
 bc24-20020a056808171800b003bdcd55d320mr103413oib.47.1706656371818; 
 Tue, 30 Jan 2024 15:12:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIEadh2cIogiTnMN04c3cPbGTwrXvnfsDwCMEt3jQr24TpqhWG0RFFHPH2yIXmBMmuc6VbkRodJvrD3Bwvrio=
X-Received: by 2002:a05:6808:1718:b0:3bd:cd55:d320 with SMTP id
 bc24-20020a056808171800b003bdcd55d320mr103386oib.47.1706656371546; Tue, 30
 Jan 2024 15:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <801c3357-d49b-4505-a1a4-ef2f36ba63e0@amd.com>
 <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 31 Jan 2024 09:12:39 +1000
Message-ID: <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
Subject: Re: Making drm_gpuvm work across gpu devices
To: "Zeng, Oak" <oak.zeng@intel.com>
X-Mimecast-Spam-Score: 0
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Shah,
 Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 8:29=E2=80=AFAM Zeng, Oak <oak.zeng@intel.com> wrot=
e:
>
> Hi Christian,
>
>
>
> Nvidia Nouveau driver uses exactly the same concept of SVM with HMM, GPU =
address in the same process is exactly the same with CPU virtual address. I=
t is already in upstream Linux kernel. We Intel just follow the same direct=
ion for our customers. Why we are not allowed?


Oak, this isn't how upstream works, you don't get to appeal to
customer or internal design. nouveau isn't "NVIDIA"'s and it certainly
isn't something NVIDIA would ever suggest for their customers. We also
likely wouldn't just accept NVIDIA's current solution upstream without
some serious discussions. The implementation in nouveau was more of a
sample HMM use case rather than a serious implementation. I suspect if
we do get down the road of making nouveau an actual compute driver for
SVM etc then it would have to severely change.

Dave.

