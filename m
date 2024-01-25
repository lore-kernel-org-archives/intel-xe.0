Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B3EC46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 01:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366A210F0E3;
	Thu, 25 Jan 2024 01:25:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323D10E58D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 01:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706145926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSP3KRvJZeXc55WyaIHMprqoGyTLKcs92jafQO1Ntfs=;
 b=YW9d0sd8fxSfwgPSBbCKKreCoW4R3gZMy60497waQq4t2oorrX5a4S5w82JGhHZMBGcskB
 T50WxnulRJ3esHfKExSSSlmHuBz4HWMTy908xUNua+xILv8+kzRbx7Y51GcmEcqVSpUGdO
 68OxBPphrkab8798MGfY2VL4NtawaMY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-8oe02OiXOp-sDDCbxEqMJA-1; Wed, 24 Jan 2024 20:25:25 -0500
X-MC-Unique: 8oe02OiXOp-sDDCbxEqMJA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-2051ab02477so10054482fac.3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 17:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706145924; x=1706750724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSP3KRvJZeXc55WyaIHMprqoGyTLKcs92jafQO1Ntfs=;
 b=mhE+lSftUqDzeBP/dD4G5wnPjQE+4W0ZzV2M6r9cS+rkWTi578zWT94ZiF3k/BwY0v
 LyLq9pUS7Tfadk15BZ7c/nO2YDA6oWcV1vnoo1zuRJV6Tr3Aic6UV5l+8YVv1nwFw8Xs
 FHUc/fQ7qHFYk4OSk4oGfDfptBtf3DcivOLdkGbexfNIANa6S/ffxQ4Mp6I6ychwPB4J
 Qd9k/EcU2mWAvAq9/bEKzFhpnxT/ZZirc6xMmtenrfbP5236DsGctCKVetui873EM951
 pEGGGXPF3OdxhzTzp/iWkSdVHBQqIMv/l01f5GSjIL/2NY4bpKyfai+v7Ily1EBvZfSO
 SpQg==
X-Gm-Message-State: AOJu0Yw001BaWtdSzFN7iU/1iq3HwmqUrxqAW8oP0BVLvuv6WdjbSprQ
 wxLQ5HsZDCapbwryv3VCXIf2N9cnq7/RiDwj1urL68ahowwX04jvVOmH60+/ZxEMnNg9/qARjBZ
 5bu5kIRwq7SbRExNqoDGwWxf5SGMRQ9wQ6Bx0mdJLJhBs86igi+NItDEtm4WdVSv9EfGk8QCHyh
 Gv45Y6T/UT6zxt0/mrwgDDXo9oN1z/lmzN7E3sAFw=
X-Received: by 2002:a05:6871:7582:b0:206:b96f:be9f with SMTP id
 nz2-20020a056871758200b00206b96fbe9fmr176156oac.32.1706145923578; 
 Wed, 24 Jan 2024 17:25:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkwfNBYbHFxucJs4wwgHHQ0rIemE0NXyh/QLdR+TYwJP9QJ5zxGbCHP64N2NWzZa60JX0oPPFZMp4+bN+Q9cI=
X-Received: by 2002:a05:6871:7582:b0:206:b96f:be9f with SMTP id
 nz2-20020a056871758200b00206b96fbe9fmr176130oac.32.1706145922628; Wed, 24 Jan
 2024 17:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 25 Jan 2024 11:25:11 +1000
Message-ID: <CAMwc25rZinyFDMmvPftWwnstOQSJJR01y1X8UkDUBTLgCAZ34Q@mail.gmail.com>
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
Cc: "Winiarski, Michal" <michal.winiarski@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Shah,
 Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

>
>
> For us, Xekmd doesn't need to know it is running under bare metal or virt=
ualized environment. Xekmd is always a guest driver. All the virtual addres=
s used in xekmd is guest virtual address. For SVM, we require all the VF de=
vices share one single shared address space with guest CPU program. So all =
the design works in bare metal environment can automatically work under vir=
tualized environment. +@Shah, Ankur N +@Winiarski, Michal to backup me if I=
 am wrong.
>
>
>
> Again, shared virtual address space b/t cpu and all gpu devices is a hard=
 requirement for our system allocator design (which means malloc=E2=80=99ed=
 memory, cpu stack variables, globals can be directly used in gpu program. =
Same requirement as kfd SVM design). This was aligned with our user space s=
oftware stack.

Just to make a very general point here (I'm hoping you listen to
Christian a bit more and hoping he replies in more detail), but just
because you have a system allocator design done, it doesn't in any way
enforce the requirements on the kernel driver to accept that design.
Bad system design should be pushed back on, not enforced in
implementation stages. It's a trap Intel falls into regularly since
they say well we already agreed this design with the userspace team
and we can't change it now. This isn't acceptable. Design includes
upstream discussion and feedback, if you say misdesigned the system
allocator (and I'm not saying you definitely have), and this is
pushing back on that, then you have to go fix your system
architecture.

KFD was an experiment like this, I pushed back on AMD at the start
saying it was likely a bad plan, we let it go and got a lot of
experience in why it was a bad design.

Dave.

