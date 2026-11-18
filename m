Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B98606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=AvcKfCxg;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=A9Fjg43S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75BE11251D;
	Thu, 19 Nov 2026 15:25:46 +0000 (UTC)
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3579310FFE1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 19:50:33 +0000 (UTC)
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AIJYnW11424736
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 14:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=r7xQ
 Eq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=; b=AvcKfCxgh2FO1dLQ8zx+
 4vXb/ToMs6lkdoSyUzHR7J5mA8oTJ80Evn6C7DQAcQmCKyyCXCcVPXC1AY2BPV+D
 PrxnrOdal+rGAkWkiyrbM+AqOwlZAQ1nJhZU5MP+bzgPUyn08QXjS82Qla/J+pPH
 iCcg3Jt/KcqKZ5SUTzgJwHBANnntnyE+Pl4ScFWubQmhtGSgKuvD11x55l/MrryD
 qpYkODcKqypwoTWy8gK5UZs7YAS4kt/NOgHbNYfZYGtlH43Z2m+cRpG1dhxCVAtF
 QizC4R1HjcRvzV9dgt1KKEHn2w9dfl+PcmY3Jg7zuQba4dl/aGh85fAhkp4sBQiD
 SA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j1fv69s9m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 14:50:32 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5364605e74bso30217801cf.3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1795031431; x=1795636231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
 b=A9Fjg43SNTfMhZ5Hj5c6EjChITqzXkc/AUAAFjZN+2acyoSODqa9LTnNgbWqrkrckO
 oIhKebY/U7aJY5vZ8cKCNiypGAf/392064H78WTNo5fLOrRTZgYaZ51GVnj9EwfrsUTR
 Kn5WBi7rmtSVT9nZK827jrSM1K8vrzWLm+K2X+xSuUOsbwxaG+DRLHmo1taQwnvVp/Fq
 Saw2Q7cpbLVoegprpp3166D3iWSWYUKdIC2b5Tz+1NTKl6v7PiMKc4isnFS1CXfwuiGV
 crIqqCqjDrdz3ALs6tgJa2grh9crq25G6U/XisrrXasBhGIlwzrMU6Y9qFGFpoQBI2lK
 2gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795031431; x=1795636231;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r7xQEq0S5madAXrgChKTKdPfHb7gKwfhdlAPY6R8vGQ=;
 b=I5SR1pXFY6FbAauN+0p+9GKm4vqMlffkzqfwfO/RLSiq0JRUgyLBs6SZ8rVb2n1/Ry
 SxYhKiseGS8qTL5rmXb03RSTP5K5H6SqK6PvigktoTTdQ6m+XT0fc7h6f51sJX4pzpdQ
 pakmPxw8i0XqZEf/DtExqidUhldaywVk6vap+N1up04jWQ5n88w45gzgHPQnSySPkg6/
 lI4E7zatQlIkKBitR1iRNBzD6CEEkr4bH18AwbdAZNa+guHmkATTgcDfy+lTUoBXu2Y1
 t4U+sPB5xcsa6eDtsQlfldFVaNs4fvqsVkmk4aygNL18iI8Cf35aMgiyqqJSbagKR1vS
 CkGg==
X-Forwarded-Encrypted: i=1;
 AL+hErGmo1MOv/7xSzE7BYRfRO+4hpNoFzes4JTEQFYXEWjU6xc7gX+e0QtxADmcxL44TvnOEHUnVpkgUw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+/J0eOALVNzNgBpGWrSDAGjMXpWD38mqz+ri3M0H5n9iapcnfr
 IrlwYUdKikrtQMhFjpHBuP7KLGIr6v5dS/PTUSkD2sRrcwyI031+zi9Y9tKcTrTHVSqx8Ncwnop
 mt9jXUB9YCYXDRbx2sKZ23JPfEANie4gRBEJDj5+LfWbR8F38X39/liBdO1KS2wDN
X-Gm-Gg: AYBFou1IZngLmi6zmpFIIuLkUboaIxyz/7gio0FWKn+DtwssDN32G0ZFu5RqeqQc7hz
 jaCpyfV+pP+Nwq0JFCU0MEkWjS5mDbmJoOBPPTvjvsLrmg2L9V1USRUFaRXTfcbJ7sp5PylcrD6
 MWVhZybeluhGn5pH5hw9cesXW7pzi83M/End0FyErpCO+jyOBeAcnWVPLKSsBRPJs7/O8sPPJAO
 1luf03FLXJ6RCtGQq6McXqKnmVZIUQs25MasdScv5JEouztB2ps1xZ/F2UrGWm4gyN6PV0bVCpl
 7c3XOmZKI/Q1Hfa2YAEVNWEyCBuCxx3YciMOKSImW/K4c/wn2X4xrN67ebzjtHCmIDNZw4F/lRa
 hVvBU+kgbFHbtKw+43jan/qTr9k9SIyaamelx4AwmxyiNR07q8KhPL7NEbrhsUC/CtRYSFruKbe
 +NrZipt0SKJIBLMhm1yL92CQ==
X-Received: by 2002:a05:622a:5807:b0:536:252a:dbf8 with SMTP id
 d75a77b69052e-55d5a537991mr56617601cf.14.1795031431411; 
 Wed, 18 Nov 2026 11:50:31 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:536:252a:dbf8 with SMTP id
 d75a77b69052e-55d5a537991mr56616931cf.14.1795031430933; 
 Wed, 18 Nov 2026 11:50:30 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-14.net.columbia.edu.
 [128.59.176.14]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d66c24503sm7189751cf.20.2026.11.18.11.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 11:50:30 -0800 (PST)
Message-ID: <9a6599cc-f47a-4a27-ae8e-91c8a1a523b5@columbia.edu>
Date: Wed, 18 Nov 2026 14:50:28 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/9] userfaultfd: assorted fixes (part 1)
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
 <179501525761.13527.5348420494097607881.b4-ty@b4>
 <d05636be-5a37-46e1-b6d2-30950b7778b5@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <d05636be-5a37-46e1-b6d2-30950b7778b5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De6COftW c=1 sm=1 tr=0 ts=6afe0188 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=2zM0HjzktFauw5hoOd8SpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=b7hxIIQ5yigvctP09d0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Qpi3AVhAjrc2SIPWPZVjWRJVYPuOvuRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NiBTYWx0ZWRfXwXnirk0N55gq
 h6qQuX/yCseSERWi5jWxdEXs8xG3l4NKNMHwbYeMMm0xFZr9Y6peh6A61ojZzgGW1X5VS8zEz0M
 so2OyadbfKHyfqZRZWa60cgHLM9CmxY2E8JJhuQFkv7zQVhDvtMX8RbA5uVmBLUrDX08/WU49aQ
 DtyN/kjd0lJWFW5JAz5WXyr1DxrwpPo33gqzh3EGJcDJo9VKPk1Hw8KPSYr2xpANhRsQ8scWgnb
 L4ZZ+KqKoYf4UVRbpez0RhXvKVn3J/B4qeRLXy9enf1Ip5F4p0i8XueJEEXgOOn3dD/eNeIoeTl
 LVmTF7cNJeCcf2NqcF9fRIO9XLEcnxF5Rec1rum+QQWujM2dYLGQgRoHfhiprerkDAWxcWCnV2a
 fP8pSUax7UlFjnq1PVnpck+qsZJk3BIPtSXOLvgFzT6m2d9u8uB9PXAMbKaWG/fHv7eZeC5UW9W
 2UEmxhY6qMSg6ZN0DBA==
X-Proofpoint-GUID: Qpi3AVhAjrc2SIPWPZVjWRJVYPuOvuRr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NiBTYWx0ZWRfXxleqIq5rlJtA
 nWOX32VPJggKAV2b7UNyZUXI0LTf4kMA2ixur0YWjwxfZiifF0Ua/dQssW3yVT+nr821sDTgD4q
 Kcw9Z4MnGR/35mTxnbvGhZ1RmJlWq3nanHai/ijWDOwrF4jFX77i
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11970
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=10 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=10 bulkscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180076
X-Mailman-Approved-At: Thu, 19 Nov 2026 15:25:46 +0000
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 10:37 AM, David Hildenbrand (Arm) wrote:
> On 11/18/26 16:20, David Hildenbrand wrote:
>> On Tue, 17 Nov 2026 23:28:40 -0500, Tal Zussman wrote:
>>> This is a first batch of userfaultfd fixes, with more to come.
>>>
>>> These were found by a mix of regular old LLM review and by having an LLM
>>> write a TLA+ model of uffd interactions with PTE bits and other state
>>> and seeing what issues fell out.
>>>
>>> Most of these fix places where mm code loses uffd-wp or RWP protection
>>> while moving or migrating an entry. Userspace then either misses writes
>>> and accesses, or gets pages reported that nobody touched.
>>> There is also a hang in UFFDIO_MOVE, and UFFDIO_ZEROPAGE modifying a
>>> file through a private mapping.
>>>
>>> [...]
>> 
>> Applied, thanks!
>> 
>> tree: mm/core.git
>> branch: thp-7.5.misc
>> 
>> Applied patches will appear soon in mm-next, followed by linux-next.
>> 
>> Please report any outstanding bugs that were missed during review, so we
>> can either drop the patch series or decide how to fix it up.
>> 
>> It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
>> though the patches have already been applied. If possible, patch trailers
>> will be updated.
>> 
>> Note that commit hashes shown below are subject to change due to rebase,
>> trailer updates or similar. Further, this is not a guarantee that the
>> patches will go upstream. If in doubt, please check the listed branch.
>> 
>> [6/9] mm/huge_memory: build the moved huge zero PMD from the destination VMA
>>       https://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git/commit/?id=ec36bf72
> 
> 
> Aaaaaand undone. :)
> 

Thank you David!!

> -- 
> Cheers,
> 
> David
> 

