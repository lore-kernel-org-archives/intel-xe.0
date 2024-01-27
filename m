Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BB1C46CD2
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jan 2024 20:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9404210F35C;
	Sat, 27 Jan 2024 20:00:25 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Sat, 27 Jan 2024 20:00:24 UTC
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4CD10F35C
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jan 2024 20:00:24 +0000 (UTC)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
 by cmsmtp with ESMTPS
 id TllDrUTWFrh9zTojiryyE6; Sat, 27 Jan 2024 19:53:06 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id TojgrVtP9tzh2TojhrAG85; Sat, 27 Jan 2024 19:53:05 +0000
X-Authority-Analysis: v=2.4 cv=Ra6Dtnhv c=1 sm=1 tr=0 ts=65b55f21
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10 a=cm27Pg_UAAAA:8
 a=P8i5SpKGxzEw1qT2wqIA:9 a=QEXdDO2ut3YA:10 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UvcAktpMm8n8yFtE4REBgJw4NqtWj+ffqzp2qlJjMOk=; b=dwg4EtImrINVyEC5ecBDCGzcHH
 7KCOgo/sxT2xCao0cEZ5/Ifd0abNu+vvHDWXTp1EMSxNcJd7q0LoysTtJhvZqKWMJnplmr+iYykbC
 t8fYtJ17TjSdHKmC/Yz/FX6B9vV7aoJMESVvCfPzwF1fWfZLuNqRsdts4TxRfPoNA6NACEwGQaXnK
 xfuObyWFatqjiliDF3VG99+DvBVDo+Tp7bSeazW7pGfFL7pGp6Hdmcf26ZuMx3UJZ5sBXSULo7eLj
 Ft9CMYbYK4Om97s58eLa2IQq5DyfLQdR64whNUSnJ+IcJHfyL06RSotRf6UHLljAy/xg0KFiOmT8H
 tn07v0JA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:55292
 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1rToje-000TwO-2q;
 Sat, 27 Jan 2024 13:53:02 -0600
Message-ID: <0c4cc1a7-f409-4597-b110-81f9e45d1ffe@embeddedor.com>
Date: Sat, 27 Jan 2024 13:53:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Enable -Wstringop-overflow globally
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <Za6JwRpknVIlfhPF@work>
 <CAHk-=wjG4jdE19-vWWhAX3ByfbNr4DJS-pwiN9oY38WkhMZ57g@mail.gmail.com>
 <4907a7a3-8533-480a-bc3c-488573e18e66@embeddedor.com>
 <202401261423.7AF702239@keescook>
 <CAHk-=wiaaCatzmF6GXxP97pa8oEX7e4rBpd4JgsbKex3Ek1_9A@mail.gmail.com>
 <f00e15fcba05497a87e91182a33c888f@AcuMS.aculab.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <f00e15fcba05497a87e91182a33c888f@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rToje-000TwO-2q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10])
 [187.162.21.192]:55292
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBo4N5NeQcl+Em4IaUhx7BcdBJRRkZ+/jis/fOmzv/rMXlH7gC6orwjqo0utw1WyJhal3Ktqr1RQCpHOsVoGDuPXVNjoUdZBgLmhNYHvlcNyFYlSXuk8
 LcpfP/qEPrFVYHc2KHTGQ12KYp6z5C3UMeiPxZf57HniezHDedwGdISgg8sVjFHdsD+LpyWXAUer3BXQqmHmAtUu0iZ8Yv3MoG3Qdqx9yUkGY4pVY2j6rt2z
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 1/27/24 09:11, David Laight wrote:
> From: Linus Torvalds
>> Sent: 26 January 2024 22:36
>>
>> On Fri, 26 Jan 2024 at 14:24, Kees Cook <keescook@chromium.org> wrote:
>>>
>>> I think xe has some other weird problems too. This may be related (under
>>> allocating):
>>>
>>> ../drivers/gpu/drm/xe/xe_vm.c: In function 'xe_vma_create':
>>> ../drivers/gpu/drm/xe/xe_vm.c:806:21: warning: allocation of insufficient size '224' for type
>> 'struct xe_vma' with size '368' [-Walloc-size]
>>>    806 |                 vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
>>>        |                     ^
>>
>> That code is indeed odd, but there's a comment in the xe_vma definition
>>
>>          /**
>>           * @userptr: user pointer state, only allocated for VMAs that are
>>           * user pointers
>>           */
>>          struct xe_userptr userptr;
>>
>> although I agree that it should probably simply be made a final
>> variably-sized array instead (and then you make that array size be
>> 0/1).
> 
> That entire code is odd.
> It isn't obvious that the flag values that cause the short allocate
> are the same ones that control whether the extra data is accessed.
> 
> Never mind the oddities with the 'flags |= ' assignments int the
> 'remap next' path.
> 
> Anyone know how many of these actually get allocated (and their
> lifetimes)?
> How much difference would it make to allocate 368 (maybe 384?)
> bytes instead of 224 (likely 256).

[CC+ xen list and maintainers]

Probably the xen maintainer can help us out here.

--
Gustavo

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
