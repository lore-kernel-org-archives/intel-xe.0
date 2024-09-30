Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153ECCE8347
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 14:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D156E10E515;
	Mon, 30 Sep 2024 14:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="EkIiN5K8";
	dkim-atps=neutral
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302B010E515
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 14:28:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240930142815euoutp02d238e40303710d4001b7aab5c9075412~6C_dljeNa2140221402euoutp02o
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 14:28:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240930142815euoutp02d238e40303710d4001b7aab5c9075412~6C_dljeNa2140221402euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727706495;
 bh=kcTh8rMgfoSAiaCc93sDBpmXCoV+x2qosK0tnJrX1sI=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=EkIiN5K8pvlwxaqa715UvTZBIPIAydI30P4moyB6+J90hWhigM4p9lvpFamU2nJsf
 sw7vR2xeBjvZ3JK3RxM9eJNdRlR4hIB5uDZm/rLky21WW7mdGYZ4jl3ick1T3LhHPM
 mDUKbSZjorNWBPIKRftXDesuGupEocXHXGgsbObE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240930142815eucas1p26c20fc4dc58aab5d2b95a70a5a9e9b63~6C_dXYGam2184121841eucas1p2O;
 Mon, 30 Sep 2024 14:28:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 73.4A.09624.F75BAF66; Mon, 30
 Sep 2024 15:28:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240930142814eucas1p150dfa5283fb811ef11c50f3e7c86b024~6C_c-ybV12686326863eucas1p1U;
 Mon, 30 Sep 2024 14:28:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240930142814eusmtrp136fcdcde6bafa18b4d047840ef298a42~6C_c-CsW-2923929239eusmtrp1Y;
 Mon, 30 Sep 2024 14:28:14 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-f9-66fab57f79fe
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 88.EC.14621.E75BAF66; Mon, 30
 Sep 2024 15:28:14 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240930142814eusmtip27074ddbc9d2ff497fe076e7bde1a0807~6C_cxveUj1467114671eusmtip2k;
 Mon, 30 Sep 2024 14:28:14 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Sep 2024 15:28:13 +0100
Date: Mon, 30 Sep 2024 16:28:13 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <patchwork@emeril.freedesktop.org>, <tools@kernel.org>
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930142813.qmri7u27lxqlxwvu@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87msjpw7v1.fsf@intel.com>
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZduzned36rb/SDE4u4bN4dLqP2eLH5hdM
 Fssvr2e0ePl3DbPFuY0PmR1YPc5MWcXksWlVJ5vHvJOBHve7jzMFsERx2aSk5mSWpRbp2yVw
 ZSw/1c1Y0MZd8WDpRvYGxj8cXYycHBICJhIT5/SzdjFycQgJrGCUeLloIxOE84VR4vnf0ywQ
 zmdGiYYb+9lgWlpWd0K1LAdq2bSKGa7qW88uqJbNjBIPvrQxg7SwCKhKrF1xhhXEZhPQlNh3
 chM7iC0ioCux9sYTsFHMAq2MEp+ermYCSQgLmErca1vMAmLzCnhL3HqwhAnCFpQ4OfMJWJxZ
 QEdiwe5PQDdxANnSEsv/gX3EKaAu8fXJJWaIUxUlZkxcyQJh10qc2nKLCcK+wCFxpM8YwnaR
 +HXkBTuELSzx6vgWKFtG4vTkHqjedIkl62ZB2QUSe27PYgVZKyFgLdF3Jgci7Cgx+9EtFogw
 n8SNt4IQR/JJTNo2nRkizCvR0SYEUa0msfreG5YJjMqzkLw1C8lbsxDeWsDIvIpRPLW0ODc9
 tdgwL7Vcrzgxt7g0L10vOT93EyMwmZz+d/zTDsa5rz7qHWJk4mA8xCjBwawkwnvv0M80Id6U
 xMqq1KL8+KLSnNTiQ4zSHCxK4ryqKfKpQgLpiSWp2ampBalFMFkmDk6pBiadJ6fvX1wpmHu6
 +tlxk69z1t9IsronGTb57PzN20+tsZA3O3/bm0lf8e2Hg+5cR2/Nm7b2y23v7kARvZ05C93T
 RbTq3/N8eNMfHVol5jJh3/Il9ZOWJD9WOPEprlegb3aBTdOBu/bpb3te5K5U5Xj/yHZl7IxO
 7lfFNyv6TnFpHu8QvWBTK39ASOvpvGWlE6NcZfr+V2l+VAy/xPAv/GTThYVKN6LWRvu/aus1
 EHc95xP59vYjm7liPp3/YjcpSwS9L+nM4zc2vPk7y7evY81Co5f/noc9V/u3bOH733flF7J/
 ZzOYmHbbt/nvv2PP73cdMbVL+uCx7vTFVWIq1cHdT21N7kwtMVRc2FUjemqlEktxRqKhFnNR
 cSIAed8mAJUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7p1W3+lGWzao2fx6HQfs8WPzS+Y
 LJZfXs9o8fLvGmaLcxsfMjuwepyZsorJY9OqTjaPeScDPe53H2cKYInSsynKLy1JVcjILy6x
 VYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy1h+qpuxoI274sHSjewNjH84
 uhg5OSQETCRaVneydjFycQgJLGWUmLb2LSNEQkZi45errBC2sMSfa11sEEUfGSXW/PkGlhAS
 2MwocfRcGIjNIqAqsXbFGbA4m4CmxL6Tm9hBbBEBXYm1N56AbWAWaGWU+PR0NRNIQljAVOJe
 22IWEJtXwFvi1oMlTBAb9jBKLPrylxEiIShxcuYTsCJmAR2JBbs/AZ3BAWRLSyz/B/YCp4C6
 xNcnl5ghLlWUmDFxJQuEXSvx+e8zxgmMwrOQTJqFZNIshEkLGJlXMYqklhbnpucWG+oVJ+YW
 l+al6yXn525iBMbVtmM/N+9gnPfqo94hRiYOxkOMEhzMSiK89w79TBPiTUmsrEotyo8vKs1J
 LT7EaAoMi4nMUqLJ+cDIziuJNzQzMDU0MbM0MLU0M1YS53W7fD5NSCA9sSQ1OzW1ILUIpo+J
 g1Oqgal/YaTZCwnND++ucb/5zbDD4aFyw+tYT3cRgeTdqnN/yj1wTDoac8V8/tut2qtnXGQL
 2L1qmkNY58nfB8La8oUZ3pcnVT1nsi+60iptvHyuZfam60/Wpc34z3jN3+zf/ZL+Yu+O+vmz
 Z4bpiRxl6rf1Ueeun+/9dGKAd6da1TauEKYy3srD3Xx9TjuYXgRN1LPYsnP/9GbdyJR5qQz6
 p7/23PzVu24F69SyCxmPzqr2+59lSLFqyjCwfu7hmpuXMzFobaGpn7ve6Y69xy/cX9u+5mPg
 yZBTP85zbm7f/6To14kP086s/pPromuiVX3uf2CRteGa8qrIB9abd4hPdpp/TPC/ltTa/Wz3
 K3wyWZVYijMSDbWYi4oTAZE+F8c0AwAA
X-CMS-MailID: 20240930142814eucas1p150dfa5283fb811ef11c50f3e7c86b024
X-Msg-Generator: CA
X-RootMTR: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <87msjpw7v1.fsf@intel.com>
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

On Mon, Sep 30, 2024 at 05:09:54PM +0300, Jani Nikula wrote:
> On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> > Hi,
> >
> > I sent this patch [1] using B4 web endpoint and then I received a
> > response email to the wrong address: To: "Daniel Gomez via B4 Relay"
> > <devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
> > <da.gomez@samsung.com>.
> >
> > [1] https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880e60@samsung.com/
> 
> I guess you're saying the replies should be using the Reply-To: header.

Exactly. Do you know if this can be fixed on the ci/patchwork bot?

> 
> Oddly enough, even my MUA doesn't respect the Reply-To: header when the
> same address is already in To:/Cc:, as a way to handle mailing list
> Reply-To "munging" [1].

My address was in Cc. B4 adds you in the To/Cc automatically unless you specify
no with '--not-me-too'.

Do you know if removing yourself from To/Cc makes ci/patchwork use the Reply-To
header?

> 
> BR,
> Jani.
> 
> 
> [1] https://protect2.fireeye.com/v1/url?k=ce24ae2c-aec63371-ce252563-000babd9f1ba-20c0723eefd97920&q=1&e=ad8d684b-6634-4f39-87c0-216f0a44334f&u=http%3A%2F%2Fmarc.merlins.org%2Fnetrants%2Freply-to-harmful.html
> 
> 
> 
> >
> > Is this something that can be fixed on the CI, patchwork side?
> >
> > Thanks,
> > Daniel
> 
> -- 
> Jani Nikula, Intel
