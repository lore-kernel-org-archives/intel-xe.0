Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB6FCE8345
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 13:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA0B10E477;
	Mon, 30 Sep 2024 13:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="EuIU+GeP";
	dkim-atps=neutral
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153110E4DD
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 13:30:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240930133010euoutp0207addc7514999728127beb2fb50a7c8a~6CLv7RmDL1830518305euoutp028
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 13:30:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240930133010euoutp0207addc7514999728127beb2fb50a7c8a~6CLv7RmDL1830518305euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727703010;
 bh=3e66arz+ZRH0X8MACmZSooV7TnZnFpkTzdpQpXw10jI=;
 h=Date:From:To:CC:Subject:References:From;
 b=EuIU+GePFtwC3NezaBAbnYQGWLafq2DyoMM+88J2X2i3fsRh7hsDtp6b1Obqtf+rX
 LhNuXSJv1ShVeUh09YmymkzSgBq5BszDYVQ9oMavDSVp95q05F9d6C7UA/uKoKAp6Z
 IKffOxFUlRdxolNYQqbq/YS/xj7Zo+3faEfGyYQw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240930133009eucas1p1f476f390428d91d1e4c9cc3af8cb0dc1~6CLvT_nk32271722717eucas1p18;
 Mon, 30 Sep 2024 13:30:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A5.BE.09620.1E7AAF66; Mon, 30
 Sep 2024 14:30:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb~6CLuigJhw2119721197eucas1p1E;
 Mon, 30 Sep 2024 13:30:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240930133009eusmtrp2b0189fc96ba467619be9a2409870faf6~6CLuhyaIP0934509345eusmtrp2j;
 Mon, 30 Sep 2024 13:30:09 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-31-66faa7e1a729
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.01.14621.0E7AAF66; Mon, 30
 Sep 2024 14:30:08 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240930133008eusmtip1ab1aa65231cd2493fabe616bb8f6bbfb~6CLuUn2DZ1536815368eusmtip1p;
 Mon, 30 Sep 2024 13:30:08 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Sep 2024 14:30:07 +0100
Date: Mon, 30 Sep 2024 15:30:07 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <patchwork@emeril.freedesktop.org>,
 <tools@kernel.org>, <d+samsung@kruces.com>
Subject: Incorrect response address when using B4
Message-ID: <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42LZduzned2Hy3+lGZxer2ux+/9dZotHp/uY
 LX5sfsFk8fLvGmaLcxsfMjuwepyZsorJY9OqTjaP/70PWD3udx9nCmCJ4rJJSc3JLEst0rdL
 4MqYePYnc8Ey5op1M1cwNTA+Zupi5OCQEDCR2Hw1r4uRi0NIYAWjxOWdi5khnC+MEtefHIdy
 PjNKLJt4kL2LkROs4/y2XywQieWMErN2zmOBq5p9dQWUs5lRorNzDVgLi4CqxKorW8BsNgFN
 iX0nN4HZIkD2933vwWxmgTKJ3iutLCBHCQsYSrxYlwUS5hXwlngybwUjhC0ocXLmExaIch2J
 Bbs/sYGUMwtISyz/xwFxnKLEjIkrWSDsWolTW24xgZwjIbCFQ+LUmk1MEAkXidv/uhghbGGJ
 V8e3QH0mI/F/53yomnSJJetmQQ0qkNhzexYrJLysJfrO5ECEHSVmP7rFAhHmk7jxVhDiMj6J
 SdumM0OEeSU62oQgqtUkVt97A1UtI3HuE98ERqVZSN6aheStWQhvLWBkXsUonlpanJueWmyc
 l1quV5yYW1yal66XnJ+7iRGYSE7/O/51B+OKVx/1DjEycTAeYpTgYFYS4b136GeaEG9KYmVV
 alF+fFFpTmrxIUZpDhYlcV7VFPlUIYH0xJLU7NTUgtQimCwTB6dUA5NO4u6oyeGfajQ3BzDX
 HfvD3fzW6MhM4wdzSqWMP/mbrJtw+5/RGqnpU3y8Q1wq+d13JSwM+7Ttr8OUyUGhtUe2Jp+M
 3Lcr9EPVfFW+h1WxIonPS8ynBJj8zA1y+pUle37X5AMmYZp7Qi+3qR5Lee+w49aS6dqV0bm3
 TgZM2LOa64oNU0GwgejMnzvVJS5qmp/I4F6T5T61d3HKWc4kBm2BLs59P2p2+ec9OT2pLWjb
 i+QbEWor/8t8K71tKOq+sdNOROd8g/P1xwd4P3Aksgu7XClYIlaaUHaZW2OzvPy/D2evWp9J
 f/DlwNysTr/Pmnw+SzzWL3999WXsxUXXbr9NKpnBZXDI/My8k+2bf8gqsRRnJBpqMRcVJwIA
 AEFJd5MDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42I5/e/4Xd0Hy3+lGfz/Ym6x+/9dZotHp/uY
 LX5sfsFk8fLvGmaLcxsfMjuwepyZsorJY9OqTjaP/70PWD3udx9nCmCJ0rMpyi8tSVXIyC8u
 sVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MuYePYnc8Ey5op1M1cwNTA+
 Zupi5OSQEDCROL/tF0sXIxeHkMBSRomVmxeyQSRkJDZ+ucoKYQtL/LnWBRYXEvjIKPGwORzC
 3swo8fVRNIjNIqAqserKFnYQm01AU2LfyU1gtgiQ/X3fezCbWaBMovdKK9AyDg5hAUOJF+uy
 QMK8At4ST+atYISwBSVOznzCAlGuI7Fg9yc2kHJmAWmJ5f84IK5RlJgxcSULhF0r8fnvM8YJ
 jIKzkHTPQtI9C6F7ASPzKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMAI2Xbs5+YdjPNefdQ7
 xMjEwXiIUYKDWUmE996hn2lCvCmJlVWpRfnxRaU5qcWHGE2BHp7ILCWanA+M0bySeEMzA1ND
 EzNLA1NLM2MlcV63y+fThATSE0tSs1NTC1KLYPqYODilGpiyCyxjdkwsKDmuV95e8V3r2KSs
 hfu7/MN1lTKSr/iXqPvN23j5ECP37Hk6MdqXJy6u2PRih0z1955Pmzj1NX+lPyj5eT37fIxd
 2ZQPqR2yR5pj/QUyWyWuVQrGlIo0GV2abLTrayXLl4nsGyYzGK5QXPJf2uypSk7K+9/m1T3e
 xxP+uzk79IpWvV0e12/feiDsy7EMx481aWervYvqFPOc/4ibBkm/ZO78NJkr7uriQwpPKnY8
 feHcECjp/bhz62JrW7bDLQv4Aiwtff8qvw7Zp9toXPtgZtSKaR7ZExmLOn9qvJHvmbtbWenB
 RNebkzSMCx8d2fTlw6TjrT5PDt54YXJ3f3j3hucZZueuayqxFGckGmoxFxUnAgCZsb91GQMA
 AA==
X-CMS-MailID: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
X-Msg-Generator: CA
X-RootMTR: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
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

Hi,

I sent this patch [1] using B4 web endpoint and then I received a
response email to the wrong address: To: "Daniel Gomez via B4 Relay"
<devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
<da.gomez@samsung.com>.

[1] https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880e60@samsung.com/

Is this something that can be fixed on the CI, patchwork side?

Thanks,
Daniel
