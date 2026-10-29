Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TF+nisfO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27F111229D;
	Thu, 29 Oct 2026 13:14:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115D3112262
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:49:52 +0000 (UTC)
X-CSE-ConnectionGUID: y2gqzbcYSJiFJRVsEJChzw==
X-CSE-MsgGUID: pO+PuuwoQRGxuyu8DRlPJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908051"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908051"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:49:51 -0700
X-CSE-ConnectionGUID: Mn3v3CSeQEixR0XLaiRAeA==
X-CSE-MsgGUID: T+zZ9FtyQWuxIHb9frGQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6887899"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:49:51 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 29 Oct 2026 13:49:48 +0200
Resent-Message-ID: <12832f7f449b948c8f9aab1f35bae84b7885d6dc@intel.com>
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3856820B8CD1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:32 -0700 (PDT)
X-CSE-ConnectionGUID: uE8tgQcHTkuxfK4Oqzs3YQ==
X-CSE-MsgGUID: QbFY7N0hS/uAf59WOc4RKA==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5036228"
Received: from orvoesa111.jf.intel.com ([10.18.183.151])
 by smtp.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:32 -0700
X-CSE-ConnectionGUID: NMrmDxPQQrWf3W+AIbr4jg==
X-CSE-MsgGUID: osrvgO/TTFadnexya1lAOw==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=dmitrymalovanyy@gmail.com; spf=Pass
 smtp.mailfrom=dmitrymalovanyy@gmail.com; spf=None
 smtp.helo=postmaster@mail-ej1-f45.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6ae31d77_sdNVzw7bTNWUXOgrdqRdFwmG8Z7VM04jlwJIulVywwfvMkO
 UAXd8LZLmGdCX2RrM7/YXIBNTNjJiptn8qqZSYg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0HoCQCEHONqfC3aVdFaglkCgj+BC2EzBFQElCdaAQEBB?=
 =?us-ascii?q?oE+i3iSJ4E/PQIPAQEBAQEBAQEBBwEBRAsCBAEBAwQ3AYRGjh8CHgcBBDAJD?=
 =?us-ascii?q?QEBAgECAQMCAQIBAQEBAQEBAQEBAQEKAQEBAgIBAQECAQECBAMBAQEBAhABA?=
 =?us-ascii?q?SIZBw4SKYZPDUkBAYk8BwEIAYICAYEkYQIFAzsBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEFAg0fYTYBDQEbHQEDEhBbAhEBBQE1gwIBg?=
 =?us-ascii?q?iIBBhABAzcDBAEMqV+NBwUCFoEBgg0GBQMCAYEN2VQKGSgNcgOBaAIBBgkBC?=
 =?us-ascii?q?wGBNwGEeCpdAYI+hSR2hAOBIRt9gRCBFYJ6b4Ifgjk4hXgEgy6BcpRrCAcfE?=
 =?us-ascii?q?ggBHAYKAkgVEgMEAwQEAQILEwkDAwIOAggDAggGGQE/EgQTCgMKCwcFHwoCD?=
 =?us-ascii?q?BYKKCISKwoDNRIPGxUBCAYCAgQEAgQMAgkCAgUHAhEDBAEBCAICLQMBAxkBB?=
 =?us-ascii?q?wkIAgsFERgMCwcxAxAJAx8XCA4IRQgGAxMBGgYFBgs3FQUMEQECGwIfBB0PC?=
 =?us-ascii?q?AMBBg4EAgEJAwQWBAIUCiEFAhsBDwMDBgMHAwcCBAMIAggDAwgIAxYDAwUBA?=
 =?us-ascii?q?gIEAwMICAQDAwQCAgMLBQMCAwMFAwMHAgQCBAMDAQUBAgcCAwcCARgDAgQIB?=
 =?us-ascii?q?wcFAgsEAggEDQkEAgQCAg8EBgMDBwEBAgEHBQYDAgIQAQgKBQYCAgIcAx0BA?=
 =?us-ascii?q?w0BCQUCAQUOBwUCAhgDBgIDBgUBAwEJCwEBAgMKAQIEAgUDAwEDAgMCBgMDA?=
 =?us-ascii?q?gUFBQMJBwUVAQMDBgUCAgMCAwECCAQGBQMCAwUBAwQDBwMCCAMIAwwCFgIFA?=
 =?us-ascii?q?wMDBgkDBwcCAwcDAgUCBwUDAwUDBgEDAgEDAwgLEiIDAQUDAwIBAwIFAwMYA?=
 =?us-ascii?q?gIEBQMDAwMDCAQCAgEHBgQCAgIBBQUFBAUGAgQDCAEBBQMDCg0BAgcMAwwGA?=
 =?us-ascii?q?wcDAwQEAwIFCgIEAQcNBwkHAwIDBwEBCwQBAwMKAwMFAgEBBwUDBgMHAgMDA?=
 =?us-ascii?q?wUEBQMCCwMHAgIDAwMCJwEBAQMDAwMDBAMBAwEDAwcDBQMCEAgBCgMCBgMHB?=
 =?us-ascii?q?gMFAwMCAQIDAwURAwYEBQYXAgYRMgEIAgMDARQEBAUCBRUCCAEDBQMDAwMCB?=
 =?us-ascii?q?QEBBQEBAwMFAwMDAwMDBAEDBAIDBwYIAQEBAggDAwIFAwMDBAMDAgELBAIFA?=
 =?us-ascii?q?wYCAgQCBAEHAwECAgMDAwMBAgQEAgcEBQILAwQCAwMFAgMCAwsGAgsEAgMDA?=
 =?us-ascii?q?wMDDQECCwYUBQkECAUDDwUBBQcHCQEDCAUDBgMJAxQDAwYDAwMKBAIFAQYOD?=
 =?us-ascii?q?A0EAQgDAgQCDhUEBAMHCgoBAQQOAwQBBAECAgYUAggMBwEIAgUCAgIDAwMCB?=
 =?us-ascii?q?QgCBQIGAwIHAgQJAwIDAgICBgEDAgQBBwICAwIZBAYDBgMDBgYOAgcDAwIEC?=
 =?us-ascii?q?gYQAQUDAgMDEQMMCwMDAwQFAwIBAwMDBQICAwkDAgUHBwYCBAQGAwIEBAMLE?=
 =?us-ascii?q?gkIBwwBPAwHCigENgEVFAUEJRlnBweRXYI/TgEBMCc3BySCSpZFAY0Joidxa?=
 =?us-ascii?q?YM/in6BJJU6GjOXUwyTEJkIjBCBepsOEwcRJBKBMjqBXE0jgQGCNhM9AxkPk?=
 =?us-ascii?q?iSFE8knQzUCAToBAQcCBw4DC4Fog1s+ggGCUYVVgXSBTAEB?=
IronPort-PHdr: A9a23:zLlIXhVxDutiDbWsCXzamuc69SbV8KyaWDF92vMcY1JmTK2v8tzYM
 VDF4r011RmVBtuds6gP0rSN6vmocFdDyKjCmUhKSIZLWR4BhJdetC0bK+nBJGvFadXHVGgEJ
 vlET0Jv5HqhMEJYS47UblzWpWCuv3ZJQk2sfQV6Kf7oFYHMks+5y/69+4HJYwVPmTGxfa5+I
 A+5oAjft8Qam5duJrg+xhfUo3ZFdflayX51Ll+Pghjw4du985Fk/ylMofwq6tROUb/9f6Q2T
 LxYCCopPmUo78D1thfNUBWC6GIEXmsZihRHDBHJ4Q/1UJnsqif1ufZz1yecPc3tULA7Qi+i4
 LtxSB/pkygIKTg0+3zKh8NqjaJbpBWhpwFjw4PRfYqYOuZycr/bcNgHXmdKQNpfWDJdDYO9d
 4sPDvQOPeBEr4nmulACqQKyCRSwCO/zzzNFgGL9068n3OQ7CQzI3BIuEswTvnrar9v7M6gdX
 ++uwaXUzjjOde9a1C3h5ITUdB0qvPGCXah3ccrU0UQhGQbFj1WMqYz/ODOey+MDvHKf7+pnS
 +KgkWgnqgFwojOywcojl4zJhoMJylDe9SR5xZw6Jdm/SE5le9GkFptRtiGBOot5R8MtWWBou
 CIgxrIavp67eTEHxZI6zBHQd/KJaZKH4g7/VOmPOzd4gmpoda+jixi98UWtxOzxWMe03VpWr
 CdIndjBuHAC2RHd9sSJSv9w8Ei91DuOygzf9PxJLEA7mKfGJZAs3qI8m5oQvEnFAyT4lkL2j
 KqMeUUl/Oil8+fnbav8pp+aKYB0jhvyMqM0msywB+kzLwsAX3CD9OiiyLHu+Vf1TbZKg/Esj
 KXVrZPXKd4Uq6O5GwNY3Ycu5wyhAzu60NkUh2QLIVZFdR6dk4TkPUzFLuriAvelmVuslS9mx
 /DYMb3lBZXANn3Dn63gfbZ58kJT1ggzwc1G65JaBbwMIOj/WkD2tNzfAR85NxK7z/z7B9V60
 4MSQWOPAqmHP6POqVKE+P4jLu2WaIIWuDvxMeYp6+PtgHMjllIQfbGl3Z4NZ3C5GvRmLV+ZY
 X3pgtoZDGgKuws+TPDwiFyCVD5cfXKyX6Ui5j4hDoKnDYfCS5uigLyExii7H5lWanpaBVCLF
 Hfkb5+EVOsUaCKOPs9hlSQJVbq7RI8n1BGirgn6y7tkLurJ/i0Xr4nu1Nx05+3ViBEz+iZ4D
 8Wb02GRUW50mnkESCMx3KB6uUB9zEyM3rBig/NEDdxT++9JUgAiOJLB1+B6BM79WgXCcNmTU
 FupTMioDSkrTt0v3d8AYFxzFs2njh/Z3iqqB6YZmKKJBJAp667c0Xf8KsZnx3bJ06khiFYmQ
 s9ROmG8mqF/8A3TC5bUnEWalqaqcLwR0jTR+Wme0GSCpFxXUAtqXqXfQX8SflHYoMjk6E3fV
 7OuEqwnMgVZxMCYNqZEd8DngU1dRPf7NtTRe2KxlHm0BRaP3r6CdJPkdX0S0naVNE9RnxoSu
 HqLKwU6LiOguH7FSjJ0GF/jbljv7e5m7nShQRwa1QaPOmFkxqav/VYwjPibVfoVz7NM7Cskq
 iluDVO029XIAtyRtiJueaxdZZU251IRhjGRjBB0IpH1d/MqvVUZaQki+hq2j32fd61exJF55
 Hp/1hF7bLmY2QkcKWDQ1sXqN7neOmT+uwqib6fG112NtbTesu9HoLxw41m2swSgF05k+HJig
 JFOhiHEvMuSU1JNAtrtBx9opkMg+eCDOnhur5OBjCI9avnr6W6aioFhCOI/zEOkftFCIOWFE
 hP/F4sRAM39TY5i0xDhJlpMdOAH/6kyI86ga76awqetJ+hthneri29A7IF73RCJ9i9xD/DFx
 Y0ExPfK2wacTD7zgRKgvpL7kJxJNyoPFGiywjS2D4U0BOU6Nc5DQS/ma5+rwYdwnZnoCXBC8
 1vxG1RU08T7YgeYbVH2wV9c3Fga83mqgjCxwDExkj17tKeH2D2L3+Owfx0BJmNNWCx+nE/hc
 u3Wx5hSFADgJ0AjlE6l3XbA7rFL/P9UEEePYntYTSb0InpibYidh6OAfOBBua4KuiAGCMqTX
 HKZH+2YwVNSm2urVyMWzmUHWXKsu473uCJgsDnadXoqnjnbSegrykzZwvnNQuFr/AMkAyN7s
 ivRW2CWBOWNoI+3tYuTrObiVFOeZ8IJX3Pl1Lzl1mPzrSUiSVX316G1gc3FKVUxyT3p2MlwU
 yTIhSisPIb77rmkNLhgW01NGlSkrJYqRY9Dl4IuvLxI21cDoZy2/XUelyDMMtJ414+hU2ROI
 FxDi5adqECtkAV5f1nZxtP+fC+4+fkxRfWZPUg0mTkst4cTFffFq+dmpQpZpxmFlwPUWPJfr
 3QAjsEJzEcjvr8EpjUEwR2FD4IYPRVXIkmO31zAp5j25O0fVnuvdJOC9FtGvdOjDrjesB1Ae
 yb7Zp4vPTAq3Md8bEvSwFbCs634QfzNYvsKsxbFji7g0Mh4E5Y/rds7miV4HEnbplxAqaZzx
 VQmldny9LmcM2l22OWbCDoHDDLVOtlD+nbkl6kBhM+0hKuoB4h6I2lSfriyEPaKDDE8m+vOP
 QCsEw89sV7cBbngPySN40hLnl/TdvLjfznfbDFRhZ06QReScRkMyBBRXS89mIY+DBzv3sH6b
 UNlsygY/UWrwvM/4rosGxz2SGzlqQyvcDtmAIDKKh1Q40UK/0zJZJXGtqY7BDkN54CotgWLN
 m2dakAABG0KW0nRHRSrN6K264zat6CCG+PrHLuBZLyPreVDS/fN35+31ZF65B6DMcKAOnQkB
 Po+lQ4LBCglS5mGxW1OfmgRkCTAByb6jBKg8ycxr8aj/fCtUwXqtsOUE7UHF9Jp9lithLubc
 faKjXN1LDdEzIIJzHvP1rEZzU86hCRndj3rGrMF5mbWVKyFoqZMFFYAbj9rcs5B7qYyxA5Ib
 MLei8/vx7txivkrAlFURHTun8ioYYoBJGTufEjfChOtM7KLbSbO39mxYa64TuhIi/5IshSrp
 TuBO0rqPzDGmjuwEh7zbKdDiyaUOBEYs4a4IV5hCmnmGcrvcQbzcMR2gjs/3aAuizvUOHQdP
 zlxfwIFrrCZ4S5CxPQqM2NE53tha+KDnnXR4+zRMJ1DqfJwGWw0j7dc53I3g7dU93RCQ/p42
 WPe+9FrqlCi1OKIz1KLSTJorTBGzMKOoUxof6Tf6pREH33D+UBF62LYEBkMq9Z/QtTyp6Bdz
 MTOn6PvOVIgu5rV+8UbHc3dNMOANjIoLxPoHDfeCAZNQySsMCnTgElUkffa8XPwzNBypp3th
 IAfT7ZfU0I8EOILIktgFd0GZpxwW3JskLKWitIJ+WvrtAPYF6A49tjMUvOfB+mqKS7M1+EVI
 UtVh+mhfcJPa96zwUFpZ1hkkZ6fHlbZV5ZMpDFsakk/p0AelRo2BmA1xU/hbRugpXEJEvvh1
 BIzixdkcOEk8DDy6lEmN3LFoSIxlA86ntCv0lXzOHbhaby9W41bEX++u00wLonqRg9xahO7m
 111HDjBTrNVybBncCo47W2U8YsKEvlaQ6peZRYWzvzCfPQk32NXrSC/zFNG7+/IYXd7vDMja
 oXk73dc0gglbdgpKKiWL61MnBBcgaeHvyng0e5UokdWK0MM7HmDfScMv1IBMKg3DyWt9+1or
 weFnnNPdXMNWPwjvv9xvhllaqLQkmS6iu4Fdh35Pvf6TevRo2XakM+UXl48nlgFkUVI5/k+0
 MsudVaVS1F6ybKQExoTMs+RYQpRbsdU6D3SZXPU6bSLkc8zZdztULy1Hors/O4Oj0mpHRgkB
 dEJ8s0LWJiqzEzca8zgKe1gq11l6QL1KVGCFPkMdgiMlWJNr8S+0IVm2IBZIS8UB3RsGSqy7
 7fT4AQthbDQObV+KmdfRYYCOn8sDYe2ni9FpWVFBT2wzOsf2Rmq4Dr1pyCWBz75JYkGBr/cd
 VZnD9e4/i86+q69hAvM85nQEGr9MMxrpt7F7e5J74bCEf5fSqNx9lvNg4QNDWL/SHbBSJTmQ
 vq4I5lpd9H/DWy2F0Cymy5gBdmkJ86jd+CJmV26GtoS6dPGmmhlbYjkSHkfA0si/blSovIhI
 1RZM9xjJke30mZ2f62nflXCio33ETr9d2MEE6kBkbfoIOEJhys0ML3glCN8HM9ql7HlrR5TG
 MNYyUyAoJTrL4hGD3qpRCQCKQufr3Jryzg/arRghbphiBLQ7wtGY2jTJrdnMD4Y749gVwHVf
 CsTaCJwRkfC39DKulb+huxPp3kBz4gIg78C7Sa2v4eBMminAKL5p5+I63h8PYZ68f82bNKrN
 MKCsNm2ciX3ap7Wv0XFVTKzHbxbnMRdJGRTR/wa0WcicdcLv4ZM8wI4S9s+KrpTCaItuqHPC
 3IsDCgcyjUcXp+B2zpKi/m12r/TnBOdOJo4NxlMvJJHi9obGyl4B0FW7LekTJnTnnSYR3IjJ
 Q4S6UFB5ltFmNMtOO/i54XMQdlHzDsX6/N4Xy3XF4V5olv2TmbF5DqwAP6lkuGvwUdT1Ke2i
 ohdCEM5UxENgboLxQMyJbp6KrcdpNvPrjaCM0L8oG/pjuChIQo0q4WcelvmAY7CrWe5XDcb/
 CheSYpO1GvOEJ0WlBRwbrc6jFpJKYGiPE354nZ3ouYhV6n9Ts2ty1s/+DweQDy2FtNaF+x8m
 FfeWTkgbpLy7Zu5ZtNdRWhf/JDboFBc2hYIUWbx2d9XLMdD5SQJVT5ErGCGvde8f8ZE3Nd/E
 54GJtoXU5bVHapFPN2coSRztOCyjHDe/D84vRGxwzDhQ8dQqspW+mQfHkMiIGHM8iHH4MMj9
 27T9hbGtVUmpo9m
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:cnpDUaA+zt+Cc8flHemE55DYdb4zR+YMi2TDGXoBLCC9Ffbo7P
 xG+c5w6faaskd3ZJhNo6HiBEDiewKlyXcW2/h2AV7KZmCP0wuVxelZjLcKqAeQfxEWmNQtt5
 tIQuxRDJnfAzFB4voSIzPVLz/j+rS6GdiT9J7jJr5WIz1XVw==
X-Talos-CUID: 9a23:kbVP3WO7Ci+t5+5Dfgx98WIEIvkcaELTl0iTCm6yEzprR+jA
X-Talos-MUID: 9a23:hm3R3wgqIQTXUL6+jP7VecMpM9xy/auJT3wxv5wKvcSUJCUpPx66k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032603"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:31 -0700
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso306111866b.3
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:31 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793269109; x=1793873909;
 darn=linux.intel.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
 b=TF+nisfOVrP3/1d1Z+jXA3g3nNMyowRJQJ/bkSzn5PBSTL52KJt8vn4kYWY72F2fqW
 9nsxJP5cpzzgxrnihAV86gxQuvm2oMlMvc0/487fUmavPE0jGqOaKhgqn/WkoKfE7Wv+
 r9C8i9oB2MSZ8JDK7CJ+sy0/1u89/3JPIDm+URimQbJY+u/ROLQQU6evWAgPpeZbH4gw
 ZuhmCZHyPHkjja4zttK8jtaeHw2Zjk4qvxCY1DtQMugAqmc9uQH7HESlfSIYwgwMCNsI
 YspdsL/JbL7RgH5r8h/arg7raJ3CoqusQ41JK25lJtkFFwAbnJkZisA/tkWJCzcgEYEt
 0mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793269109; x=1793873909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
 b=WwiZqf2DAhnyDI949eSiVahwygCzi0rLx3+H/cC08BN3tNcY72cyaZWbVbUMmiKzeI
 Mx1WWxtStELG0pzgMuwHz/B/ByLnhAtIJ4LGkdQsdBANXst2VeBheHVXNCY4WOKT1bA8
 tHE2lXpredILVJDX2K2hWvsJ+JHQjOj039JFzj8FoAGQVBlyrqEVdnEHfv9VT1DIr9l+
 iR83qgm6USlpmm7RhL+/ZvHFHAJQkK2opmIO+1pHh3PEchqkzuOpFl4awnco5khyzFTW
 kBK6IIDT6fmyKTxR+fQYUMtVmNqSuiWBLmjeGru09zHHkWtlZKpYLF70jXUJGDixBbd6
 LRCA==
X-Gm-Message-State: AFq9FYIVayu3gBnJ6gytubjoBtX5um/Kd0W4rRvtXNypsYU/yuABH6gX
 9fWhfBV2wmVtwdSPbb94tlQCgGRmPDBc8ADki6QS77pQQRLxhpJKvLg4
X-Gm-Gg: AYBFou2rFbXgwQ5AVVuuFwLWXErRQowQ0hVL5LosDi0sg4B9jiJJAvAfATQkFVlIPdl
 DIUsFhacARFQoR+lt2ft6y0bG59b8CmPytBVYnp58IoAHlA7gGxGGaDscXExdbxDnNJzPIAzpKH
 k5ZqBCvfI6Bt5ivK6xlLnfTE+c306gCAS1S3SdXRVDbtNEjSsBb9VhNEfP5iJMk88BScOYwFzLW
 6dphVxS0jvhJSYSugD56hSZnWLKdfIFZrlePx5wOtyjJNpPKrTi9IeImd2512MMFE/aYbEwlU5u
 3Kn3puoqJ2A5vnpJbkheiU4I970ckkeQsS2SdsfKVbd7jiajjBC/8/qWIgVyrgSZW5f1oAwddZI
 QsNZU66gOi18LWs4JGAwmOpLQOd8Mh+oDzuDXehktwSSTIx5U15mIB7mWe7dAs2kdfB8QWvnTIN
 1pfDydRvkDeGRLZtyAigQWa4ThABWsB7tDZIjQ4xPHaj61e7ygqN4kFkAxyhIaV6eV88NUb81ZE
 caxijMddGGCj1pmy0Za/lbWvk/0yFayPOWlZSNujkrsWRrTTCGSjjAxexmRZR4YX/PayBqJZZSd
 YvrVU5arowF61nIga45v5elFOtCi66FjOoZ3yQLcRd3jnxXdoWaI3kaBuNc96uY=
X-Received: by 2002:a17:906:730e:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c49bdf393b4mr415116466b.16.1793269108982;
 Thu, 29 Oct 2026 03:18:28 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Oct 2026 03:18:28 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 0/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:21 +0100
Message-ID: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: auEJ3CCOoZAt
X-Mailman-Approved-At: Thu, 29 Oct 2026 13:14:13 +0000
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

The Xiaomi Monitor A24i clears DP_ENHANCED_FRAME_CAP in its extended
receiver caps, and through a USB4 dock it does not sync without
enhanced framing. v1 kept the bit from the base caps. As Jani pointed
out, the spec says to enable enhanced framing for DPCD r1.2+ without
looking at the bit, so v2 does that in drm_dp_enhanced_frame_cap() and
converts the remaining direct users of DP_ENHANCED_FRAME_CAP.

amdgpu DC, mediatek and hibmc already enable enhanced framing always,
without checking the bit.

drm_dp_get_phy_test_pattern() still uses DP_ENHANCED_FRAME_CAP, but
there it is a bit in DP_TEST_LANE_COUNT, so it is left alone.

analogix_dp has its own copy of the check (DPCD_ENHANCED_FRAME_CAP()),
I left it out, can do it as a follow up.

Patch 1 is tested on i915 with the affected monitor, the rest is
compile tested only.

For nouveau I converted both dispnv50 and nvkm in one patch, so the
watermark calculation and the enable stay in sync. Happy to change it
if you prefer another way.

v2:
- Do it in drm_dp_enhanced_frame_cap() instead of patching the
  extended caps (Jani)
- Convert cdns-mhdp8546, it6505, gma500 and nouveau
- Commit message: the sink only fails through the dock, directly
  connected it works without enhanced framing

v1: https://lore.kernel.org/all/20261028162941.62762-1-dmitrymalovanyy@gmail.com/

Dmytro Malovanyi (5):
  drm/dp: Always use enhanced framing for DPCD r1.2+
  drm/bridge: cdns-mhdp8546: Use drm_dp_enhanced_frame_cap()
  drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
  drm/gma500: Use drm_dp_enhanced_frame_cap()
  drm/nouveau: Use enhanced framing for DPCD r1.2+

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c                 |  8 ++------
 drivers/gpu/drm/nouveau/dispnv50/disp.c               |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h         | 11 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c      |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  2 +-
 include/drm/display/drm_dp_helper.h                   |  4 ++++
 9 files changed, 23 insertions(+), 12 deletions(-)


base-commit: feaa32dc98090b2f45f7b6f179711a6640169c1a
-- 
2.50.1 (Apple Git-155)

