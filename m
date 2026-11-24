Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD71606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ArQqb01A;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=dDI9CewA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8510E132;
	Wed, 25 Nov 2026 14:58:40 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8213C10E281
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 19:37:15 +0000 (UTC)
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOJYjPR2924286
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 14:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=OMjg
 nMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=; b=ArQqb01Alvqy+ezQ3O+b
 wFGaLKLkRPslDfTTnR/1n3YHEnzFvpSAXsSLtAema3OMBGvQTr8MjsfnQdizF1DR
 Y35c9K1YbdbrokVp6lJBFIYVrUHqLLS3WYYBtEDDKg/6m1bODWncA+LZwiNP1MH8
 Z3bx2LUxG6sfpmxDdUI+/kyZI7guQlRgIUWOBYQ6reZ57nqjYw3JFREOmJXGhsy0
 5UyyJqrfI8VjX2MlX1xqtk46jQix4pqRNZv16i1aL2PIz3aAJytU8fQlN33iF7Uo
 xruvXaD2EFNKvtzNiOaeLj7AUiUNlwagsbKMIv+l5TRcoparlTssaELubPi31AEG
 DQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j5fa7h01h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 14:37:14 -0500 (EST)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-536778a8137so87210741cf.2
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1795549034; x=1796153834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
 b=dDI9CewADpfltMyOctEQPXef6qPnURtuo0OcT6SbxH3+FlE/qJUYzqIk1vx6CB7hPF
 m6heUBxPsiywc1A4mOJnWGJwRRXEqaqBogcevklS8h/hpO3VLwG7q3GE941ZMYkFoo9i
 XahTHRfSjvaBgI6h8sX5v34XHSjDDnj0zvhERWBJ0HHcphspAyPUoVsNvhy9yTd6ETuN
 RM7j+08t2tuHma+g4qDjVAmbDUS1peebrC/jMUMIUPcW8QYTTw2zc8RAMZREcvdTfTd5
 IuyZ8DVXX3Zm6RdVgJIsaAuaftrJbgRWsBdsmotXmbtpQZc14BWHCN7sfRk56hHDtw2E
 w4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795549034; x=1796153834;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OMjgnMOdm5LC9Ve7tJbATj56ZsHM2zVs1s6tMJ9jz2Y=;
 b=aiY1crWmN0eCgEFiSyyP1BiOqyyCONMkokFiDykjMv02l5Sh46asxlmar6M2XBA7Hn
 d4qwcwvNoXyFXF8yrecF2O0RZEcaSCgJSXqRybxhyJrYEolmxBB404CwdsfMG1jqp4fm
 8aI1gvhM9NKpk35YvfojtPz6MPQ7uvUssg7DkoDhwiJdaAB329rDuRIwbvgjWVCyY+4T
 lbn58u7T4dz1nqf1PU4yei8pSTgxZhbdX+OzNm60C3z/6NATTNJKigWXd3odj8c5mLwv
 TS0uknHddxL6/G7BaGfxe5kGaElQ9ZvWG7q8Ke1K3/diLXE/bqVydLcVO65ZWksmA0Pr
 Xtcw==
X-Forwarded-Encrypted: i=1;
 AL+hErEY61JstzsViGkCXb66zrwKzdfduu5MG4+2ApBU/hLU7tfpRwcFrsjSeri84DuEq2xvHe7SDn4m9A==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8NB7KDZzd1W+aCxQ2RTS/7LYjTbkXlDnpkLCMhRdWzFzZdAC4/
 1LuYCQwLxh+D5Bj3sePTYoXGbyGiCGtM7OkjBi+IavsvmIaon75tW1GIrN1OVb9J5PwW7GLyMEE
 YIqRhQCmA+U5oyKGR+xZdayzxH8QoFPS2PaYT8K6sbj2nHEzBTqwFFTw5drI+19kS
X-Gm-Gg: AZFdTZcntWrgpY/qT+Pqzj7M/60vEf4h+5RYk52ZINC3rWVtUtBilovO4ykZy/WCHiQ
 nnzhJ0lm3Vq50Q0E06F0dIEzKOfqazVBRWrC1vrexUIBS+4x676tR3Z8qjWHYQ2YMx9QGxxjgda
 ND8cTSWFfiz+oYeKsBE33SapngYAX5q6i1IwTWeE+sttPUithT7s63Vo2wqd9cn38RN3RFe22TR
 lvU63cSml8fiFJ2FwvnBrxz1t5iGreNDR/CQVueDa/CkkBN7+t6Oq2cRbmFGMM3bBVTYq84LaKL
 UegRmy1GOaN9sdZ7d3GX/1s4dctjfO/R05eynDeT6AYDc0mNAWYu+e1u3USzlnAUBZuTNn3MS95
 3tLYINZ7tizOEpo6tzyR7fCaUunnK6/J8MaeYGIVQKpOIZNDC6ik3LL0lCAmR2TQA9w==
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id
 d75a77b69052e-55d76a5af8dmr288718461cf.49.1795549033826; 
 Tue, 24 Nov 2026 11:37:13 -0800 (PST)
X-Received: by 2002:a05:622a:313:b0:55d:1944:a2ab with SMTP id
 d75a77b69052e-55d76a5af8dmr288717631cf.49.1795549033344; 
 Tue, 24 Nov 2026 11:37:13 -0800 (PST)
Received: from [10.206.101.158] ([129.236.231.128])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9213515f467sm140631006d6.41.2026.11.24.11.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 11:37:12 -0800 (PST)
Message-ID: <3ebb01ea-fe77-4467-a1de-7f30a91593f3@columbia.edu>
Date: Tue, 24 Nov 2026 14:37:11 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Andrei Vagin <avagin@gmail.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 Breno Leitao <leitao@debian.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
 <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <4f23b0bc-b89a-46c1-b8cd-853e7815b7ac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SuHIPlQUTc5ZW9oUt7PS5s1cvsTkFz4n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NiBTYWx0ZWRfX96GaIQ+o9BFS
 LmqSWc7vFzM8jhgjtwzTwMT09k1qQifCYSzXgkz/d7T6tQrCdqb/iwnO88NXXl0ZslJV3pF6pxu
 oNIJak3KYoSgF62vYnftwyN0zmULd4dOfw52erFo7/FPaqHRnnYT
X-Proofpoint-ORIG-GUID: SuHIPlQUTc5ZW9oUt7PS5s1cvsTkFz4n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NiBTYWx0ZWRfX8eNaO1sox2G5
 nRbJ4N4JW+hav5I+8BgapKQvGNHekWdxwnbupD3Gd1XB5oIKBPvAw9+RoelbvzYyQGIz8Cf42YT
 Jho4+J+2MAGf3QDFgqAHhiztrRdtfQt0FuyP2X43CNQsslxDmPFCXnzvBajF71iAQnjGQbdYHMl
 r6M0/YHZi+n0gPzYXMXP6n/fj8iHnONR2EwaT0QJSM3Xxzvdg0/QS2+SIzUPvApcIPpxU2kZwBK
 N65cy08e7ozxxYknA2v0gEs9EmZV1hN3vHR7jZgP12z0N0kzkzEXil5574UMG6I5uAjdtFZnCy2
 WJlXn0EUYfNsMLfGc6bS2FPBlldjuOgYFM9TTezxUwOJlBhNL6Kepo4t2i46nnObVAiDOoJCshw
 D3PgCoAdJJnUlkNFBpDGjhSNPcpNPwi/Sa1rdmYetcw7zrHfcoAMe8p7rMSkfq3BZBXg3pTwTRX
 x2WxjcwBIsVE4dj9wqA==
X-Authority-Analysis: v=2.4 cv=NdZzRGD4 c=1 sm=1 tr=0 ts=6b05e76a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=Z7cX3StJxvrjZLnT-lEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=10 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240076
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:58:40 +0000
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 4:41 AM, David Hildenbrand (Arm) wrote:
...
> 
> So, I would be picking up ...
> 
>> Tal Zussman (9):
>>       userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
>>       userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
>>       fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
>>       mm/migrate: warn on a writable migration entry with the uffd bit set
> 
> This
> 
>>       fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
>>       mm/huge_memory: build the moved huge zero PMD from the destination VMA
> 
> This
> 
>>       mm/mremap: resolve uffd state when the context is dropped, not during the move
>>       mm/migrate_device: do not migrate a uffd-protected zero page
> 
> This
> 
>>       mm/userfaultfd: check the hugetlb alignment of every VMA in the pre-scan
> 
> 
> After waiting a bit longer for more review. Andrew can take the rest.
> 
> 

@Andrew, could you pick up the rest of these (everything but 4 and 8)?
I'd like to send the next batch of uffd fixes I have on top of these.

Thanks,
Tal

