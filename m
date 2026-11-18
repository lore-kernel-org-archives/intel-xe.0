Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC7606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nkgzzLi3;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=WlLntvbl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE48112545;
	Thu, 19 Nov 2026 15:25:48 +0000 (UTC)
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2410FDCF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:26:59 +0000 (UTC)
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AIEgIMR3421316
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 10:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps01; bh=y03Y
 2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=; b=nkgzzLi3h9HeG8fKyYEG
 uDh31vyXH1oYKrz4We4FN7MFzIgxKgw5bbl/1yYWvjel0KI9TY0DcA4tf8wyHfUO
 E9S3VBpfvNnGIkq1nWd7rxaJV0Lqs7OrEOCpyx0/oBVIQHwhYGWzDerPT+uUwcIw
 UNDOHrTbQpKsrdIawLbTecxwoOgThMzBSetvGLfhD1Fr+I+bJ8XjXzV/tn3a/mwj
 WnmC1oaXxkPmI1tAL5NMf/NM2XxF0DEM+oYOVbl6k3afNC9MEBBmKm7ao0MfRmEk
 9PYcQAKRmMuhT+Cw6VRw5kLAg34WlAdslNZkvKUYJ/1MhKqj8LIxnHzWfAB0TDWa
 AQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu84csn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 10:26:58 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f33438950so228876585a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 07:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=columbia.edu; s=lionmail; t=1795015617; x=1795620417;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
 b=WlLntvblwnONcfhUxAoMG/YrAGVztFECiTcxtIRPsKR96f0ysNTpo8JfRH1FkUJXrR
 5FA6chq87kfh8uK0vn+L/4UW7WD4+2j7MoZcphn+8lE6x8tNMSPEbHUScGas6YU6m4Po
 azvgX44tvhversno90UqRQNdB31YDeFHGszpHrWwstEo4Le/fV5zoDz0qZORflySCMop
 s6pCLeFEOXDO7UEqAHlG1RRErnde50zY0ydbk5Ge0b7mBoDywQO0EJ6zy2UqDKLnm4T+
 Lpejv1M922inJtBSArsfzy2v38WRVCGpmLELG0D/BawpS7duF0wdZafdjszQs+g8H0wZ
 P8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795015617; x=1795620417;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y03Y2WW5oPTNmKuWLrWXmR4s/hn2HFIbPEH/c3XFLbg=;
 b=z7E58HNZQ9WAsjFjov84+K4j7VHvAJU/cTuIlAFJjq11XKwMg81kUkoJHBniGYPQFQ
 NDByF6UBFvVej06lj4vX2g2p3qIDtrze5SFwAYoxImgzFUNzWXm27NjYg67lLBtcv+87
 RTAUThuSODTACLNKbYbI5tozYrDTIYDGNi7gYQ+Ib/RaPBJRF5jyJJCS+0ypu4vVcDkv
 esqN0VyNPYJy0EmNWDVsUpH2gPjL8LrRmNO+7OUx5ci8BUBXSxypTGxBFSoHEDVspRtj
 3vyxxh9QwqEgATimL/SgTBOlEbz28ldOX3CJHpQcmelH0W6lwyu+AFg0sFRhHBBVGDmm
 hnSA==
X-Forwarded-Encrypted: i=1;
 AL+hErELbJV/JFQ/h32N+LC4an4svpOVDgqqyvXc+uCrrYxb9aipOAFBau7IQwxtu812uScKG6e49CXltg==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+ZJ3IDxv4evv+s2VgWE+868VG6q1i6RytIoMNOCQ+WdeOc4Zzq
 t1tZHnP5xCjadlgZNeSpKqDjdnpFKOAX3i4SnuxU+ZlU9rdHTuH9RsND9Elrv+KxijOfEaLUw/0
 dm6Ovjfxj/aXKvOCFtzmZ5mqwNATEQvjiMRfI5l0Y+ALpP0D3XPC4+lcNADRpfjuW
X-Gm-Gg: AYBFou3XXFzb3g38+kqiK0bsTwktoACOypOBJ4ebnphO7Q1o3MH0kxzPKhVHXuJ2SKV
 A3Z3kLPi3yXbzjyD+oCxis+iQ3fc0PFSgUq8yJUE8vtLV/00BPonySoOKFJsg3aL4sPhd17VMhi
 BiIa1pCgOCwpLD/xM7hIOIwp1QIPO/fgEPlaX83LUP8zZX3S3Zjl7Vn1l9vtTl18IjYiprUterz
 9RCOg+V16rsV8893INsBMpwCMM9ehvwN+TjaCJdRGNMxqky9WDQqNhnobB0wg6zaqpskoZ5G8ys
 XtzwkMPqr7AV0FJRvP6SljI1sByo46WxTHDWhKuyoczifjScgQ7t7T/J/8RyauHRCMYQKHgqmHI
 CHdd2Et+1LQkznL0Sv8fdTUU4uFpgm+RBRSsWWevOAnLRzNytrFnVBYFdZs8nXHqJH1yxAp478R
 dxNEM0n9SxsuOoFr2lGe16PA==
X-Received: by 2002:a05:620a:8395:b0:947:b201:faf9 with SMTP id
 af79cd13be357-949995f04bamr536127985a.59.1795015617480; 
 Wed, 18 Nov 2026 07:26:57 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:947:b201:faf9 with SMTP id
 af79cd13be357-949995f04bamr536117585a.59.1795015616695; 
 Wed, 18 Nov 2026 07:26:56 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-14.net.columbia.edu.
 [128.59.176.14]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9499b72055bsm204599485a.12.2026.11.18.07.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:26:56 -0800 (PST)
Message-ID: <7d31ba34-8b5f-4eb2-9864-145ea80c3412@columbia.edu>
Date: Wed, 18 Nov 2026 10:26:54 -0500
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX+dWygRJOe78D
 gUsx0yQoCuzTwDKX9tJGfYZzAu39K2anP/f0BCr3nQhb9f7QBCq3uaIgOyUoA0Y1//r4/3F7tp1
 8JcZebWysqF6GsM5CwrrwEKVovX5ihIJ4NGvcBqnyF/6JfwUo6gf
X-Authority-Analysis: v=2.4 cv=IeISymqa c=1 sm=1 tr=0 ts=6afdc3c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=2zM0HjzktFauw5hoOd8SpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=Z7cX3StJxvrjZLnT-lEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfXwj2r/XUoluAT
 mhcpbWpRElu4+aF8S0vvVjQ+0u0QKgkZKe2KfYg9uCpxVRVJwYTtCoS6v51tIUHbWsWQY2yQRan
 ccH17xT/2lCxm4bP47YWcYq42JBZkDl0+syuS5lfQGhR+vEwqY0fan9Jju/T09vitb0APv6um+4
 3RthC4CW07XfWC66391pyWTWg/aFfzTX8nkrpjCQNadHQbtTs09U/JJb43XJ3nLnh70pES4a/za
 312OAQlNJ9eAfwIB0yZY5ojAnODHm08MCotprGkQLZJ/abi8UEdKTmpnDlihJUcsA3dOtrkFluL
 3iioDSEKYjmc1W50XesOH9axdAnL7Ktox8YA9/FyiGLQybDAXTyampvnnQf5j31cgViYp+c+Har
 w0QQ+gvUPVUXP5C80gXrK34a6Vzafu/4Mp2M04iqfYq4HeASmpiSqw15UlDSt32LYXgrnwS6kci
 usLqA9xUAa4mNNLPpXg==
X-Proofpoint-ORIG-GUID: 4w7Vn87g6hwH1DaimCyUzttbQkiL3He8
X-Proofpoint-GUID: 4w7Vn87g6hwH1DaimCyUzttbQkiL3He8
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11970
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=10 adultscore=0
 impostorscore=10 phishscore=0 suspectscore=0 lowpriorityscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180061
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 4:41 AM, David Hildenbrand (Arm) wrote:
> On 11/18/26 05:28, Tal Zussman wrote:
...

>> Patch 6 has little user impact on its own. It is included because,
>> together with patch 7, it allows removing clear_uffd_wp_pmd().
>> 

...> 
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

So my one concern is that (as per above), the mremap patch removes 
clear_uffd_wp_pmd() after the huge_memory patch removes the other user.
Splitting them may break compilation. I would've left clear_uffd_wp_pmd()
alone but then it throws a nice ugly unused code warning :\

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
> -- 
> Cheers,
> 
> David
> 

