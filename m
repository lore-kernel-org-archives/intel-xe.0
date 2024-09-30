Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4971DCEB2C9
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 21:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184210E14B;
	Mon, 30 Sep 2024 21:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="WYeR+imm";
	dkim-atps=neutral
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B773810E151
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 21:15:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240930211523euoutp024950f7a56edfd6ae02ba9cf4fd411420~6Ih7g1uzo2206722067euoutp02S
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 21:15:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240930211523euoutp024950f7a56edfd6ae02ba9cf4fd411420~6Ih7g1uzo2206722067euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727730923;
 bh=Yyj/RSLnldl9QNqHMpOgqi6U6Aw3KrB01BwRZgDQmy0=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=WYeR+immD90VOrOWxyHdLs8z2CqBHRxRbp6Ak9JkpCl3aWJNfFg6gHqIOw2UNgITG
 y3NYOkQRhD3noWLlne7LviJ/w6vIgahfmapbbHFxu/74M+/Ugm0dnZHm1xRUhDVVNw
 n7A49Z0+jC0QA+SIJEvfu6/b78trw5WC9ckNP/5o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240930211522eucas1p122fb428c608bdc132714125ec9b2bfd1~6Ih6qUZE70405804058eucas1p1M;
 Mon, 30 Sep 2024 21:15:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2E.7F.09624.AE41BF66; Mon, 30
 Sep 2024 22:15:22 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240930211520eucas1p2f0e55e480d043bfc3934a6d676e9876c~6Ih5jJAVT0061000610eucas1p2m;
 Mon, 30 Sep 2024 21:15:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240930211520eusmtrp1ee3e365e36eb759fac22338b0d3154f6~6Ih5imwsN2244022440eusmtrp1P;
 Mon, 30 Sep 2024 21:15:20 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-74-66fb14ea03e7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2C.C7.19096.8E41BF66; Mon, 30
 Sep 2024 22:15:20 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240930211520eusmtip2fa6a2426c0b1c4bb80907f93930f76b0~6Ih5VShMO0812608126eusmtip2d;
 Mon, 30 Sep 2024 21:15:20 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Sep 2024 22:15:20 +0100
Date: Mon, 30 Sep 2024 23:15:19 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
CC: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tools@kernel.org>, <d+samsung@kruces.com>
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930211519.tquvjw7davr7zlfz@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h69xw68b.fsf@intel.com>
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZduzned1XIr/TDF5/Y7HY/f8us8Wj033M
 Fj82v2CyWH55PaPFzs9fGC3ObXzI7MDmsWlVJ5vH/94HrB7zTgZ67J+7ht3jfvdxpgDWKC6b
 lNSczLLUIn27BK6MOUs/Mhf8Eaho3rieuYHxGm8XIyeHhICJRO/Jd8xdjFwcQgIrGCXaZq5k
 h3C+MEoc2/2UBcL5zChxZOcxoAwHWMvbt/IQ8eWMEkfXv0IourtmNtSszYwSG3ZMYwJZwiKg
 KtG/5SIbiM0moCmx7+QmdhBbRCBN4vmSfhYQm1mgUmLy3mawuLCAqcS9tsUsINt4BbwlNndF
 goR5BQQlTs58AlWuI7Fg9yc2kBJmAWmJ5f84QMKcAuoSR782sUK8pigxY+JKFgi7VuLUlltM
 EPc/4JD4qwhhukgs6rCHqBCWeHV8CzuELSNxenIPVGe6xJJ1s6DsAok9t2exQrRaS/SdyYEI
 O0rMfnSLBSLMJ3HjrSDEiXwSk7ZNZ4YI80p0tAlBVKtJrL73hmUCo/IsJE/NQvLULISnFjAy
 r2IUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMK6f/Hf+0g3Huq496hxiZOBgPMUpwMCuJ
 8N479DNNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9qinyqkEB6YklqdmpqQWoRTJaJg1OqgYnt
 8N9NWeaRrulJNw0UzP1+R37K2/qP1UfEUqDA+AxHgavJOefo4pcMP3kXB8jtl3DO+B1a2VEj
 e0Ts5zXNKt76fx46yQsn8Vuvi5jL/bEnUf/4nvYr9XlORSVdkTd+anS0MRwVbXv1ok6QbZvM
 0ST58CWPbscfPSIpyLoqs7rsvaP0QQ+R95q2GUl70r1MKtqlz9ebPUxlXSTtxFup2+shHfex
 LWLZ9kWRz5eeeJj3br7cEbu3xi2X7x9i/XRdPmey4LaqDo3XvD2NMbf7JJc5Z+dzBT/bMXf6
 anYr84hlPj8TRZ4rZeh+erXHUiLorKOql91ert9CGql1VcbOkg6Ris9bTh70aAx5uViJpTgj
 0VCLuag4EQCtoJGqmgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7ovRH6nGdy/YGyx+/9dZotHp/uY
 LX5sfsFksfzyekaLnZ+/MFqc2/iQ2YHNY9OqTjaP/70PWD3mnQz02D93DbvH/e7jTAGsUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZc5Z+ZC74
 I1DRvHE9cwPjNd4uRg4OCQETibdv5bsYuTiEBJYySly7voqxi5ETKC4jsfHLVVYIW1jiz7Uu
 Noiij4wSPxc/ZYFwNjNKrHiwiRmkikVAVaJ/y0U2EJtNQFNi38lN7CC2iECaxPMl/SwgNrNA
 pcTkvc1gcWEBU4l7bYtZQK7gFfCW2NwVCTFzObNE65FtYFfwCghKnJz5BKpXR2LB7k9sIPXM
 AtISy/9xgIQ5BdQljn5tgjpUUWLGxJUsEHatxOe/zxgnMArPQjJpFpJJsxAmLWBkXsUoklpa
 nJueW2ykV5yYW1yal66XnJ+7iREYZ9uO/dyyg3Hlq496hxiZOBgPMUpwMCuJ8N479DNNiDcl
 sbIqtSg/vqg0J7X4EKMpMCQmMkuJJucDIz2vJN7QzMDU0MTM0sDU0sxYSZyX7cr5NCGB9MSS
 1OzU1ILUIpg+Jg5OqQYm9nJ1u02ybtxebS8f87Un7mRqu/hxIfvh7uii7Qw7I5hLVgTPKfwQ
 O0fh8cIZXKHbzmW/jHR8HbVX6F/cFz3VWsezE27Xacy1OJDmZiyne5JV86D68rjP5SdMLEQu
 WflxBy2Y5NouzlY6r8sifdLluFSHpIhtfxpfXjz++9LGnIzT/9KE10z//jq9xcfW5vbyJS9X
 2yjo/QwIrua+3b/TTtLvxyzJ9NZrdh4X+pZdLKm3mss6y+Gu5d7QVj/ZRy8utl5ym9yfLST/
 6G/0Hv3eVVFbj3erfpNV1dv5YaZnuBbrNr+Na6eJ7vU6ePCWgTzbJUn9Vd5Z2o2HTd/8iz6h
 4LMlaBqzd/zbpEcHdk1SYinOSDTUYi4qTgQA8cx0IDwDAAA=
X-CMS-MailID: 20240930211520eucas1p2f0e55e480d043bfc3934a6d676e9876c
X-Msg-Generator: CA
X-RootMTR: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
 <87h69xw68b.fsf@intel.com>
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

On Mon, Sep 30, 2024 at 05:45:08PM +0300, Jani Nikula wrote:
> On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> > On Mon, Sep 30, 2024 at 10:20:57AM -0400, Konstantin Ryabitsev wrote:
> >> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
> >> > > Was it an automated tool that sent you that message? Normally, email clients
> >> > > would honour the "Reply-To" field and not use the From: address put in by the
> >> > > relay.
> >> > 
> >> > It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
> >> > Patchwork <patchwork@emeril.freedesktop.org>".
> >> > 
> >> > [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
> >> > 
> >> > I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
> >> > using the From field.
> >> > 
> >> > 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
> >> > 	Reply-To: da.gomez@samsung.com
> >> 
> >> It's no big deal as long as you got the email response in the end. We expect
> >> this to happen with a lot of automation, which is why any replies to the relay
> >> address are auto-discarded.
> >
> > To clarify, the email response didn't land into my inbox. I realized a response
> > was sent after checking at lore.kernel.org.
> 
> Yeah, our patchwork instance tries not to spam everyone, and limits the
> replies to the submitter + intel-gfx/intel-xe mailing lists, but
> apparently uses From instead of Reply-To.

I've just realized that it also happened with 0-day here:
https://lore.kernel.org/all/20240917-blktrace-algn-v1-1-9fb54b7b1dfa@samsung.com/#t

The answer from 0-day went to the same wrong devnull B4 Relay address.

And lore's git-send-email + mailto: Reply instruction section is using the wrong
address as well. I'm not sure why is the Reply instructions [1] section using
From instead of Reply-To?

[1] Reply instructions:
git send-email \
	--in-reply-to=20240917-blktrace-algn-v1-1-9fb54b7b1dfa@samsung.com \
	--to=devnull+da.gomez.samsung.com@kernel.org \
	...
	/path/to/YOUR_REPLY

> 
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel
