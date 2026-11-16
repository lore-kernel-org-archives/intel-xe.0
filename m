Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E583B606A333
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=iYLVIb4e;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2yf8L0WY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F30F10FC31;
	Wed, 18 Nov 2026 13:04:13 +0000 (UTC)
X-Greylist: delayed 2159 seconds by postgrey-1.36 at gabe;
 Mon, 16 Nov 2026 23:42:48 UTC
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CB610F541
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 23:42:48 +0000 (UTC)
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGLYgPL3519793
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 18:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=shtR
 RPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=; b=iYLVIb4eyo24+udnvs3G
 MJgMkShakHkhAOAO9CCgFnM6i8wa3coBagtc8oRa+Lz6Z+MsbX20IDG3LJDy0vFX
 Z0Yjgn48CeEZWOfHZUatppMpD+9lfvTeu1uj/3fqHOBdXDNgGL9YK9AfIpsuUf6b
 JdLsR/VkazINFOI0UV6cZ08cE5if7g0pIqYZr6Tij0qLt8/TfT5VCHu0/nirog4e
 J04gsFT5b3xlACp4HxuRzGUOdy0q0fmWzSUnd1tqycWphXxfpPmPT2mfDAxLoHOg
 MM4XfQsJlIgAnl7FQPviBjf51Fu25cAE/NqerET3PQEQk5MvIcw/7mao9MSb59qZ
 Lw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059ybkqq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 18:06:47 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-921029ad756so153176d6.1
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1794870407; x=1795475207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=shtRRPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=;
 b=2yf8L0WYBYN1i5CdFMfs6juxWDHJycWymrDEAm4SHsqdOATgbGuoNrsWZOe1k1klrE
 jO2i0n8DRIIyIXTB/j40eBB4TUpS+a2PYG3IXNIfEWZRicE/Pfu2WcDXFr9Dl4WVIQwl
 hxck0pTnsb1+kCqR/POE3av8ruxAZR4jmWkZ+ajTYe6/MA2BWbIVkRxbbEW3UiLAmHo5
 fMvoDXisG91r8o6O31pqTKOVIWCFPWwz5p+cfgAkAbdizx2/jMbB2ZFiMrr0eknulp0y
 amlSZn5pQrUbz9yxxAsWE+gaWfMZMGli+k/imxoL10+25d7QCl70ymQJBTtGDkNmfEm6
 3zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794870407; x=1795475207;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=shtRRPv4sO05cfKy9jDsVgauLpUzE/l0Te4xSbg74SE=;
 b=vq3P0JO9CMiqb66qu8c3nRBWgaTVnnaNNZHexeoXeyabG+un09q9qD71hAIT4g/ZQq
 h6ZGflp1gGeOJ7WtxE1VVPLLKhjdpFRDlXHnpghUId/b445NNb8nXvMYgabTEEpIR5kQ
 J8maNnQ3AQso7GjrD8j/MeJtEnGqzb+vgQ+bnkkxIjwj8W06jLZxAwryHhGYIQFMNyV8
 V97yiGBvGgKgJ8LjhWKj2el2QIqOJI4g7Ln/NNOl+fknXZ9Y/P1/p0hu1dp160MH+C/V
 FTLl2podrU+qg/Fp8RjRqsYcLaUBxt/ijalb3ZqhIIPgB9hbtkE87aeBmQKp83DrsZty
 26gQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHXYXKLO8NJs6zxer+iG+Yp/uyxWdjI7BmSrueTEfaN58XOeElO4VdjiTPeoqVYJjo9PiQFwrH5Gw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z939NTW9G1EgVDVXGtxlaAHkAL8OH2H3b5YNOYtfdXuTgjNIvma
 /CnkpPChIb7J0dgKmchjdoOzbDQzKbhJu056zOkGQwtlnp9G6ooAF4bNWoV20jkdv6i2+vir33k
 455X02bwAjqHo0OyhfoAZGSlPjWXc0MhuXZKKLFlgxotdRQyBi16bFlPawbktBXEj
X-Gm-Gg: AZFdTZfR1HSSqFcigKvGAtV2xtLWiCcLzrvC4W3xbSCLppliSme4qt3DyGCnq1lCQQO
 iaWFlytJTHIUjf+tKrurBtuckkXgve5FQ0KTmEIQN6kOJnCkluLKHr30sMLFpurjFQW4Fe2mr85
 vX5SmFzP/Ykg0R9w93hSQGq5eG8iQuma4UHye0p7ofBAwA8zzu9bYt7tKvR3CUFbXzjRossceqV
 ydd3RwHvgDAqPpvUui77ZrML7G+3n1/BOM2APVjQwB3ztNqKEjvLCEaXbPWY0k8vKzHof1fNSER
 Oh9Mf9jK8yTijg2QW/fxsoKL1IdYCMF3Psq848L/rvtp2vgmNCvN7BkWJ/L4oo1MvtvaA/b0tUB
 knx7ZhBBD/b9/5y/XgGDOEwf58akKI+fkMzFjsHRF4mPFRDMKL357WtOus5akJECQ8YnNLlzNCQ
 tDX3ZuUkA1FJ1csy0E1vJc0jQr
X-Received: by 2002:a05:6214:486:b0:91e:cb85:f84c with SMTP id
 6a1803df08f44-91f241ce6admr203454616d6.27.1794870407355; 
 Mon, 16 Nov 2026 15:06:47 -0800 (PST)
X-Received: by 2002:a05:6214:486:b0:91e:cb85:f84c with SMTP id
 6a1803df08f44-91f241ce6admr203453936d6.27.1794870406649; 
 Mon, 16 Nov 2026 15:06:46 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu.
 [128.59.176.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23d459c6sm97731756d6.14.2026.11.16.15.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 15:06:46 -0800 (PST)
Message-ID: <71aa028f-c753-40d5-a8e4-8daef5aea3aa@columbia.edu>
Date: Mon, 16 Nov 2026 18:06:44 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] mm/migrate_device: do not migrate a uffd-protected
 zero page
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
 linux-fsdevel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
 <20261116-uffd-state-fixes-v2-8-4397a0196479@columbia.edu>
 <a384d75c-2134-407a-924f-ee511f65a2d1@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <a384d75c-2134-407a-924f-ee511f65a2d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MiBTYWx0ZWRfXySnp006DmOaF
 LYngHrl+csivLQU3iUHmgEg/1rN+ldbEd/VBWK6/iau99DkwTztNKZ44mTQm9D4AE8RWvI9CBM8
 Tb9hJmhalsp7Me1oNKR9QCERybr6uBdv/VA33deCz00cMeQOue5bDtzy2l1wb2kFdU3o213Jt3r
 7pmwvwqjx8pcAEft+xKLvq9KF4SL6MLvY+hwuiGXbB0w2+SdiFQu6f6ry20zRaHNeSRkDRaWLGT
 wWUjXbbigOHJ6YrkDMwoUE3L+1YckbpBbJ2CwLZJhnGCxbplIwhPusaGM2hm6Qxz+tFOcgkdmwG
 O7bupzk+XIDAEfGG6fHCOQ9SOw00ZJleAhemwS6OvdGHQ07fAOrQ0uMRzMlQ7DcVtTN3VFVdnBR
 9qTzoOLRD6Xx/dOXK6Nic04czIeAKtGIojd9PNZsp6tgARFwpPP6TVLQj1nXLwOiB5Ol1AheANT
 d3CAy8mKTa6aaetInFg==
X-Proofpoint-ORIG-GUID: Kne47uuZXsUS87n71zFcprvdptROWJEJ
X-Authority-Analysis: v=2.4 cv=MOv1C8Zl c=1 sm=1 tr=0 ts=6afb8c88 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=9jRdOu3wAAAA:8 a=e5mUnYsNAAAA:8 a=Ikd4Dj_1AAAA:8 a=zEWuSTdDNGilpxNPLJEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=ZE6KLimJVUuLrTuGpvhn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Kne47uuZXsUS87n71zFcprvdptROWJEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MiBTYWx0ZWRfXzIExWcV7CzeP
 4o2reUy8kWCqrjuRC7MjeOv5KRxCJ47K7UcIUJPPkS7FYckm74N7eRdp6PzVZOma0gDH4i49v9q
 HmQMx6MbYc6VK9m8aNKqbc0OojGsEmoFqOJ1TcKdisIFF/O06sKQ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=10
 bulkscore=10 adultscore=0 impostorscore=10 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160092
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 3:45 PM, David Hildenbrand (Arm) wrote:
> On 11/16/26 21:02, Tal Zussman wrote:
>> Device migration replaces a PTE that maps the zero page with a new PTE
>> that is built only from the VMA flags, so its userfaultfd WP or RWP
>> protection is lost. The same applies to the huge zero PMD. Writes and
>> accesses to the page are then no longer reported to userfaultfd.
>> 
>> To fix it, do not migrate a uffd-protected zero page. Skip it during
>> collection, and check again under the page table lock before inserting,
>> as another thread can protect the page after it was collected.
>> 
>> The alternative would be to carry the uffd state over to the new entry,
>> but a uffd-protected zero page in a range that a driver migrates should
>> be rare.
>> 
>> Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
>> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Leon Romanovsky <leon@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  mm/migrate_device.c | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>> 
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 9e19fadfa65c..140b99f72508 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -159,7 +159,16 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>  
>>  		folio = pmd_folio(*pmdp);
>>  		if (is_huge_zero_folio(folio)) {
>> +			/*
>> +			 * Nothing carries the uffd state of the zero page
>> +			 * over, so skip it if its uffd bit is set.
>> +			 */
>> +			bool protected = userfaultfd_protected(walk->vma) &&
>> +					 pmd_uffd(*pmdp);
> 
> Now that I read it 3 times in a row below, these needs a helper.
> 
> userfaultfd_pte_protected() ? userfaultfd_pte?
> 
> That might help you to get rid of the local variable (that should have been
> called something that includes uffd and should have been const)
> 
> 
> Maybe just add a simple helper for the pmd as well and use it below.
> 

Will do. I'll do userfaultfd_pte_protected() and userfaultfd_huge_pmd_protected()
to match the existing wp and rwp helpers.

Re: the local variable, I'll rid of it and just call spin_unlock() in
both branches, which is a little ugly.

> 
> -- 
> Cheers,
> 
> David
> 

