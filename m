Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BC606A331
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IK/e+JaP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BED910F243;
	Mon, 16 Nov 2026 14:38:21 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324C010EC9A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 20:53:20 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-91ef011e338so26357996d6.1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 12:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1794603199; x=1795207999; darn=lists.freedesktop.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MSDd0mIYLOoBidzRJM/vL/FHkNZCGR1RZTFok+0qNYU=;
 b=IK/e+JaP2/7WMnxx2y5d84Oa3HLNc7m+zjeEykruOfX22tv7ShPVnl07MSugiXw9aK
 9w2sWFxI8a77KDRXYTuS9+frpkU1OkpazLnIiNbXaDDVK9tlUb9IBAlC2eKyUt3SLLa4
 sQrRc+SkAIAtRGyMWJcorbZhA4API8giAIOHD26ksAdfv3MdC/g+sKUIf/GtKePQAJLr
 xSxvTYQBVQ+j9hk2TRIC1zSEwMn/Sj4n+SfzuPcsEUrRUylK5Uia5a+suZ+DylARPpeG
 GqpsJCJv38ShLS8KiU7kGmh3L6hNrYpzrhiolHBrnUQjyA+FCdvdvjOH0JDVrAeHgHmY
 H1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794603199; x=1795207999;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MSDd0mIYLOoBidzRJM/vL/FHkNZCGR1RZTFok+0qNYU=;
 b=pDUhGdahQSIxVr1zd9ESSitX8ISb/gy1ckFfcuznA0MBHq54NssuuL0tYgNblS6iJ+
 enlCjj/eL7ScdXQpAgDBlspJbYF51jZokyt+13GyenFu11OhQG9s4/KA033yYzMBe78v
 SkmiovJ/Zm2cM6BU0UUxMRBQTXShgSzd8ZDPMvGMqO9+hWoG1irPzA0ftC/Jyk7np5VK
 L50ikiGmo8wpcnmPdAriiifihElgePZR26cT/tI7HnQUGokI2VZPyhCLvpMutohaCNaj
 UDI8my5lTX8O9An/ByMiUTM/MdSlSABoK3tGEQuFqeYIc3yTcT1aH4wcbkJ+jVA+Q+k/
 UoaA==
X-Forwarded-Encrypted: i=1;
 AL+hErEykn1uiVKZ2tyfATnxGJNk24iHB8Z+M1G+OAtYbqkDmHfJ8k/g4NtiIOBWfzHqlmuAI60J+SRxsw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8NJghDgpJI9TzvQkEc00RV4ji54LFlB90pYKCG73i4eAbRtZAz
 jdnM7BrYtqizPbtq4fo2vEU9UacjdmCfb1VpUMLNmCcJG370/G6erts5unIz54w2hd4=
X-Gm-Gg: AYBFou0/sm7zpElsN/iPgwNLmhDm/juS44sPhOZ8t0JKpbjx3sxd80imcmfkEQK5n7C
 95JcP6c5K4hiw94vOoeZhuPVrzMPmuhwLLN3h+gnQU4XAo8dMIfFPAGFT1yY2a9wPA0/lCbra9+
 uUpltHTqrqsIyStY7oPrxKJ9BY1mFNGYKtekDNIzpld3LUU36ABCe/82CRMvC4vJsTLTIbCPJZU
 Kcm5zUHhbQz40vMvFSCA8yCxJfl+tH7q+9tsxunQIC53gKZ79Xq1GKZFw1qE/OgJLFu2Gs4VasH
 BiwhlG9wQrZAqJ2aTL3cXWbyYHAbzN+ZTNzFogmTsZFQQJhFrQj25qy47TdzflKXO8hCBcEU0u6
 bjQqNZgDirWXeQ+w7oVBPFhi1j8YwzXOb8smHWM1p7Ix9tjfuLHrU5YqqoMLBt09tHWr6WUgCNm
 cQbhAYV3FU21CLrFEfX3E68j+Eo/lKOOxx37cUpDuZdNq78ww8hdvR9p+h0EaXLeNB9nie3lkKM
 /0/2vQ3OGGPKSjtkKRdU5apGX8nA+NQQgIJ2oz2CGbrlIT8zRZ8P6js3HKzYm0Qmih6Sth+Fc7Z
 bxH4N1aqNcRNtH3pcKqdk0ksLKF5aHK/TyMiYwZOZcYTfagmmnkxw+kHCjVKJJWh2TFGUbnO2Tz
 cJUkVWdc=
X-Received: by 2002:a05:6214:8583:10b0:91e:a6a7:73a9 with SMTP id
 6a1803df08f44-91f24193e70mr44399636d6.15.1794603198962; 
 Fri, 13 Nov 2026 12:53:18 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net.
 [71.191.145.202]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23d453casm28237866d6.10.2026.11.13.12.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 12:53:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mm/hmm: skip NUMA balancing on protnone faults
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, linux-mm@kvack.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <9ec3e8b9-064a-47a7-8d00-566ff371b846@kernel.org>
References: <20261112-numa-v1-1-ad9cbca8f49a@intel.com>
 <b32fb02a-68b4-4db9-83dd-254147dbf215@kernel.org>
 <1993e931e6a4b0cda5c04e72b1a8d5fb924f950a.camel@linux.intel.com>
 <9ec3e8b9-064a-47a7-8d00-566ff371b846@kernel.org>
Date: Fri, 13 Nov 2026 15:53:18 -0500
Message-Id: <179460319801.482102.15329919214055018110.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:53 +0000
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-13 21:43 +0100, David Hildenbrand (Arm) wrote:
> On 11/13/26 21:34, Thomas Hellström wrote:
> > 
> > There are two major problems with the current behaviour.
> > 
> > 1) The work item executing hmm_range_fault() might have no affinity at
> > all to the GPU about to access the memory.
> > 
> > 2) If migration happens, then hmm_range_fault() will stop and retry
> > leading to excessive execution time.
> > 
> > While perhaps Matt's commit message doesn't correctly describe the GUP
> > behaviour, do you have any alternative suggestion than to avoid
> > migration in this case? I think it's a reasonable idea given the
> > problems with the current code?
> 
> Adding fault reasons that hack around NUMA hinting such that a actual CPU
> accessing it later will not trigger ... NUMA hinting?
> 
> I might be missing the "reasonable" in here :P
> 

Ehhh... I think the hint faulting code is already very tenuous, so yeah,
lets maybe not try to go down that route.

> I recall that John (cc) kept saying "GPUs and NUMA balancing is inherently
> incompatible, you have to disable NUMA balancing".
> 

If this is a NUMA-hotplugged GPU, then this is resolved by a private
node, because this:

@@ -6404,6 +6404,9 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
        if (!folio || folio_is_zone_device(folio))


changes to

        if (!folio || folio_is_common_memory(folio))

And all folios on the GPU node are never subject to NUMA Balancing

so balancing can stay enabled while the GPU memory is not subject to
PROT_NONE spew.

~Gregory

-- 
~Gregory

