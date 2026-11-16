Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E28606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=BjTQbKVQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA1510FC1D;
	Wed, 18 Nov 2026 13:03:45 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71C10E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 23:57:54 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-91f0274f88cso66542686d6.0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1794873473; x=1795478273; darn=lists.freedesktop.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kNMtaHpahG58C4CDJTpyGiQEPKrM5bilgLdnVmpa1D8=;
 b=BjTQbKVQGLxLjrPYR/qNvpCQkKHEYRBzLdBf86Bxqk6N+fAEExkWKBfnj+EtMXfcq7
 qVO2cDx8hMvKWs4jNaUViomDFcY+ggGFxu1WwYw16QwWngqdsg5vAzgvQaLL6gRl/Nny
 n7BKGyUuWLq4DQsU6shEViebdtX9f3u5xd4m8m7n4dbsQi+dLEWTN7yCiVZVFSQ/oraE
 0sV49KdJ+YAAhYBn9tnLz5l2X9KoLGsavMO2TxmxV+cp7Vf9GfAmKnHNOeyEHyDFX3lB
 V8NhPVC4A4HHr+pfTG1fvUsFoXHwacwybCX+D4T0BFMXQ9SqI/nlAQyO3ZKUXBug+vPN
 F07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794873473; x=1795478273;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kNMtaHpahG58C4CDJTpyGiQEPKrM5bilgLdnVmpa1D8=;
 b=NC4qobhP2RLN5gh9RtJEDHieNJqOx6C7+BqUc4L2sv8XL029BSNJ/Igy/L+vSh1wIN
 Gzs5Y6CpG0FuH/469Yy4rWQseA4xRGiYir+j1f3NXOYtV39UWO+A/EHjxbHrWTwK+7DA
 8YUe1U2eBveZ8c0w+qt13C0lMyYuxWLETR41PCfXUXi2kBDEp8WNwnUNmQt0IMysbNEK
 ej6/tRra7UUEKgv3oT4BVPHB9+zdYEQWDhNamnsWEmiE5luWTZUM1q4lW/mUMJZpk7IH
 lF/Pod2s/VrCkxwdhVStwvlCOC4NAEMd1fX3MiMTuK/XpgpP8SZtmq+avSoc/SEpSwcm
 nBBA==
X-Forwarded-Encrypted: i=1;
 AL+hErFobfpWf2KduXyw/hO7OaUoiBVgnmHLqpGqpq+mOrGTyzZTNgpmI+IgQogNIgnRn2l3iB+MdfII6A==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/+wl5NhMY0JkvAEQFoqqbdM9m6QfmC3zIUPJisnTx161KolsxA
 vGHNTndDVkz9vVRhOU7VQ0I6VOOnIqOSIeGhv7DJOqC2jj77AckCBJUKEgdNkw4GSYo=
X-Gm-Gg: AZFdTZfFLe6+1LHQUo+ah3IINCg37mXbb6Byv4Z00zjt6gYgCuwE6iAwExwsZy5NL6n
 gDYg5hNQk4bZ7zSt0LSgHDmI5AeUOiM2pDaiokWbYIghQlmWmZNvoDUrcLN3HJ5ZjzqP2UNcZjB
 vqbEs9ptq7t13EoSGeUxxCa/V7ALoPwF2pa4z3rn88o5knQKTFsFsu9eo8gUAf7RTBocOVkjOLf
 YKCuqEzY8HQoOMpK0bOb28YJitMbMOpuLx/6dBnGGe15K8uL8T1kuxoWOXRLHwXgc1uSFoySeIr
 rQsHVkEz/HHi3Np1SmijOvQnuRNN9X2X2mb3nD+8ANwJPvUDAvjq3C80eq06n8QiIevUnOLmvKl
 FShFSM5XYyjcqm1Ayc/EiGmu03Z6wd1NK1HnE6/qO3QUKl5sa/hNX+ykSkPJiA09tiz842vu/nd
 2+aoOj+IF873zN53QYke6x3utMzmdiFM3LboeHXZODw15Lv9DACmFSvdJM2zHvld2w3ladfsF5Y
 LIt0l4iLMhRIvzmg5VZEF8dgAAJI8/b3rinMBBL4UN5MGe9nTRTlBLvQ6Z0fqe3k1tlK0cwNnIZ
 0xUlf5Cna+QVE/nxe+sl5BSRGkN149AlZ+SX0/6I8tHzCyGLJDfWbHV9uY2ydpa5H/+e0Hmxhtp
 /4O1zUs0=
X-Received: by 2002:a05:6214:4019:b0:91e:a219:fed9 with SMTP id
 6a1803df08f44-91f2400c99emr200139666d6.1.1794873473078; 
 Mon, 16 Nov 2026 15:57:53 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net.
 [71.191.145.202]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23d453casm97144106d6.10.2026.11.16.15.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 15:57:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mm/hmm: skip NUMA balancing on protnone faults
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Alistair Popple <apopple@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, linux-mm@kvack.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <avuN2eIrlqrO0u6O@nvdebian.thelocal>
References: <20261112-numa-v1-1-ad9cbca8f49a@intel.com>
 <b32fb02a-68b4-4db9-83dd-254147dbf215@kernel.org>
 <1993e931e6a4b0cda5c04e72b1a8d5fb924f950a.camel@linux.intel.com>
 <9ec3e8b9-064a-47a7-8d00-566ff371b846@kernel.org>
 <179460319801.482102.15329919214055018110.b4-reply@b4>
 <avuN2eIrlqrO0u6O@nvdebian.thelocal>
Date: Mon, 16 Nov 2026 18:57:52 -0500
Message-Id: <179487347201.482102.6428415219993123805.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Mailman-Approved-At: Wed, 18 Nov 2026 13:03:43 +0000
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

On 2026-11-17 10:24 +1100, Alistair Popple wrote:
> On 2026-11-14 at 07:53 +1100, "Gregory Price (Meta)" <gourry@gourry.net> wrote...
> > On 2026-11-13 21:43 +0100, David Hildenbrand (Arm) wrote:
> > > On 11/13/26 21:34, Thomas Hellström wrote:
> > 
> > > I recall that John (cc) kept saying "GPUs and NUMA balancing is inherently
> > > incompatible, you have to disable NUMA balancing".
> > > 
> > 
> > If this is a NUMA-hotplugged GPU, then this is resolved by a private
> > node, because this:
> > 
> > @@ -6404,6 +6404,9 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
> >         if (!folio || folio_is_zone_device(folio))
> > 
> > 
> > changes to
> > 
> >         if (!folio || folio_is_common_memory(folio))
> > 
> > And all folios on the GPU node are never subject to NUMA Balancing
> > 
> > so balancing can stay enabled while the GPU memory is not subject to
> > PROT_NONE spew.
> 
> Hi Gregory, just to hopefully help clarify understanding a bit here this isn't
> related to folio location and therefore private node won't help much.
> 
> This about a driver getting a snapshot of current PTE state to program a
> secondary MMU (in this case on a GPU, but can equally be a NIC or other device).
> 
> Even CPU memory being subject to NUMA balancing can have quite an adverse impact
> on GPU performance due to increased incidence of GPU faults, hence why John says
> GPUs (using SVM) are inherently incompatible with NUMA balancing.
> 

Ah, I follow.  I'm still working through the performance implications of
mmu_notifiers in the presence of PROT_NONE faults, but if i'm
understanding correctly it tracks that you'd say it's incompatible.

I presume here the driver needs a global view of memory (or at least all
memory it can potentially DMA), rather than simply just a subset
(some set of VMAs)?

~Gregory

-- 
~Gregory

