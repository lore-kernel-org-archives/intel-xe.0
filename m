Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23E606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFCIEVz0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACAA10E805;
	Thu, 29 Oct 2026 13:14:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA24E112262
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:50:13 +0000 (UTC)
X-CSE-ConnectionGUID: 68rK61+2SveUHLhxd0wfFQ==
X-CSE-MsgGUID: 243Yv72sRsKzZonOVOz78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908078"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908078"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:13 -0700
X-CSE-ConnectionGUID: r/HUirMRR26mtFuXmq80tA==
X-CSE-MsgGUID: Xfp0itpwRdGsFQAjPlehfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6887925"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:50:13 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 29 Oct 2026 13:50:10 +0200
Resent-Message-ID: <f1c530311fa323c6f79fadd68aae5be9d5dc0682@intel.com>
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3DC5420B8CD1
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:36 -0700 (PDT)
X-CSE-ConnectionGUID: OI+nd966T3Wxe0bBQV9aXA==
X-CSE-MsgGUID: GM3Qdfs9SZyaXUYlsruf3Q==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5036242"
Received: from orvoesa111.jf.intel.com ([10.18.183.151])
 by smtp.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:36 -0700
X-CSE-ConnectionGUID: AaThpOYNTK+JVjsw1M1JQA==
X-CSE-MsgGUID: CGJ5HibMTQ2W5Z1gCo8+0Q==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=dmitrymalovanyy@gmail.com; spf=Pass
 smtp.mailfrom=dmitrymalovanyy@gmail.com; spf=None
 smtp.helo=postmaster@mail-ej1-f43.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6ae31d7b_kOOReiQFiO9ltfIwombjXvBzT6SDLU4uGUTuJwDiN2jscVf
 WUmZltmqH0Blj7IOq1IH9X2eAiI9ODjeAUXt5JA==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0HeBACEHONqfCvaVdFaglkCgj8WgVYzBFSUK1oBAQEGj?=
 =?us-ascii?q?TYDh1SEcYVfgT89Ag8BAQEBAQEBAQEHAQFPAgQBAQMEOIRGAo4dAh4HAQQxC?=
 =?us-ascii?q?A4BAgECAQMCAQIBAQEBAQEBAQEBAQEKAQEBAgIBAQECAQECBAMBAQEBAhABA?=
 =?us-ascii?q?SIZBw4SKYZPDUkBiUQBCAGCAgGBJGECBQM7AQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBBQIsXwIBAycLAQ0BGx0BAwwGEDsgAhEBBQEcG?=
 =?us-ascii?q?YMCgiMBBhABAzcDBAGpa4xxFgUCFoEBgg0GBQMCAYEN2VQKGSgNcgOBZQECA?=
 =?us-ascii?q?gcJAQoBAYE3AYR4Kl0Bgj6FJHaEA3onG32BEIEVg2mCH4FrTjiFeASCIoEMl?=
 =?us-ascii?q?l0IBx8SCAEcBgoCSBUSAwQDBAQBAgsTCQMDAg4CCAMCCAYZAT8SBBMKAwoLB?=
 =?us-ascii?q?wUfCgIMFgooIhIrCgM1Eg8bFQEIBgICBAQCBAwCCQICBQcCEQMEAQEIAgItA?=
 =?us-ascii?q?wEDGQEHCQgCCwURGAwLBzEDEAkDHxcIDghFCAYDEwEaBgUGCzcVBQwRAQIbA?=
 =?us-ascii?q?h8EHQ8IAwEGDgQCAQkDBBYEAhQKIQUCGwEPAwMGAwcDBwIEAwgCCAMDCAgDF?=
 =?us-ascii?q?gMDBQECAgQDAwgIBAMDBAICAwsFAwIDAwUDAwcCBAIEAwMBBQECBwIDBwIBG?=
 =?us-ascii?q?AMCBAgHBwUCCwQCCAQNCQQCBAICDwQGAwMHAQECAQcFBgMCAhABCAoFBgICA?=
 =?us-ascii?q?hwDHQEDDQEJBQIBBQ4HBQICGAMGAgMGBQEDAQkLAQECAwoBAgQCBQMDAQMCA?=
 =?us-ascii?q?wIGAwMCBQUFAwkHBRUBAwMGBQICAwIDAQIIBAYFAwIDBQEDBAMHAwIIAwgDD?=
 =?us-ascii?q?AIWAgUDAwMGCQMHBwIDBwMCBQIHBQMDBQMGAQMCAQMDCAsSIgMBBQMDAgEDA?=
 =?us-ascii?q?gUDAxgCAgQFAwMDAwMIBAICAQcGBAICAgEFBQUEBQYCBAMIAQEFAwMKDQECB?=
 =?us-ascii?q?wwDDAYDBwMDBAQDAgUKAgQBBw0HCQcDAgMHAQELBAEDAwoDAwUCAQEHBQMGA?=
 =?us-ascii?q?wcCAwMDBQQFAwILAwcCAgMDAwInAQEBAwMDAwMEAwEDAQMDBwMFAwIQCAEKA?=
 =?us-ascii?q?wIGAwcGAwUDAwIBAgMDBREDBgQFBhcCBhEyAQgCAwMBFAQEBQIFFQIIAQMFA?=
 =?us-ascii?q?wMDAwIFAQEFAQEDAwUDAwMDAwMEAQMEAgMHBggBAQECCAMDAgUDAwMEAwMCA?=
 =?us-ascii?q?QsEAgUDBgICBAIEAQcDAQICAwMDAwECBAQCBwQFAgsDBAIDAwUCAwIDCwYCC?=
 =?us-ascii?q?wQCAwMDAwMNAQILBhQFCQQIBQMPBQEFBwcJAQMIBQMGAwkDFAMDBgMDAwoEA?=
 =?us-ascii?q?gUBBg4MDQQBCAMCBAIOFQQEAwcKCgEBBA4DBAEEAQICBhQCCAwHAQgCBQICA?=
 =?us-ascii?q?gMDAwIFCAIFAgYDAgcCBAkDAgMCAgIGAQMCBAEHAgIDAhkEBgMGAwMGBg4CB?=
 =?us-ascii?q?wMDAgQKBhABBQMCAwMRAwwLAwMDBAUDAgEDAwMFAgIDCQMCBQcHBgIEBAYDA?=
 =?us-ascii?q?gQEAwsSCQgHDAE8DAcKKAQ2ARUUBQQlGWcHB5Fdgj9PgQ58gTWXCgGbCpQmc?=
 =?us-ascii?q?WmDP4p+kGKFfBozl1MMkxAuh2aQdJIUlwQTBxEkEoEzATiBXE0jgQGCNlADG?=
 =?us-ascii?q?Q+OLhaDYM46QzU9AQEHAgcOAwuBaINbPoRShVWBQDSBTAEB?=
IronPort-PHdr: A9a23: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
 WDXoAmljw==
IronPort-Data: A9a23:vnJ0Xq2U8VDw8+/TfvbD5UN1kn2cJEfYwER7XKvMYLTBsI5bpzxSy
 WdOWzjUb/mMZGb3e9lybNyx/UlU75HQytBrSlM+qSg9HnlHgPSeOdnIdU2Y0wF+jyHgoOCLy
 +1HMoGowBUcFyeEzvuLGuax9SEUOYagH+OhVrKs1hhZHFEiFWF5z00zw4bVu6Yy6fChGQSBp
 NjulMPWPV6hylZcP3kdg065gEoHUM/a5nVC4TTSWdgR5AWAziFPXcpGTU2MByKQrrd8T7bSq
 9nrkenRElPxp38FFt6jm7DnRUwGKpa6FRSOkHdfR5+5iRFEoCEouo5jXBbLQRwP49kht4kZJ
 ORl7fRcey9wVkH/sL11vy1jLs1LFfYuFInveiHj7JPJnyUqRFO3qxlmJBle0YT1YY+bC0kWn
 RATAGllghxuHItaaV90IwVhrp1LESXlAG8Qklhp8THBKscAfbOAYZvI/sAB+W4Sv+kbSJ4yZ
 +JBAdZuRBHJYhkKN1VOTZxix6GngX7wdzAeo1WQzUY1yzKLnUohjf63aYqTJofiqcZ9xi50o
 krK+mXlGAAfPdiY1zOD42OEierGnCe9U4UXfFG93qQy2wfNnzB75Bs+fnSZ/Nm4gGuCYohgd
 n5N9QEp/etqzRn+JjX6d0bl+Sbb70B0t8BrO+8z7gDLzKvX/gKQLmwFSCNRLt0gqMIyAzct0
 ze0c8jBADVutPiYSyvY+OvP6zy1PicRICkJYipsoRY5D8fLiYgPjgrof/BfM+2XsN/uBmjVm
 hKzhX1r71kMtvLnwZlX6rwuvt5Bjp3ATwpw6weOG2z5tUV2Y4mqY4Hu4l/ehRqhEGp7ZgjR1
 JTns5HBhAzrMX1rvHLRKAnqNO/zj8tpyBWG3TZS82AJrlxBAUJPgry8EBkleR4xbZdaEdMYS
 EDUvgxV6ddSOnDsBZJKj3aKI51yl8DITIy7PtiNN4YmSsYrKGevono1DWbOhDCFraTZuftjU
 XttWZzxVS5CYUmmpRLqL9ogPUgDnHxilTqMGcimlHxKE9O2PRaodFvMC3PXBsgR46aNoQGT+
 NFaX/ZmAT0EOAEnSnCPrtZBHkNANnUhG5H9pupec+PJcEIsG3gsB7WVifktcpBs1fYd3OrZ3
 GCPamkBwnrGhFrDNVqrbFJnY+jRRppRly8wEhEtGleK4EIdR7iTwp0RTaZqQol/xtdflaZ1a
 9InZ/S/Bu9+T2Wb2jYFMrj4go9QVDWqogOsPCCaZGA0eZp8djPZ5NPhUBbixC0nPHDutcIBv
 KCRjFLHYJscRjZNCNTdR+KvwmiQ41kcurNWdGnZLuZDfH7D9NBRFBXwqfssMucwJg7lxDDH8
 yq3WzIjuvvoj7E51PLrlJK0hd6lPMUmF3ULAlSBy6i9MBfr21aKwKhCdb2tVi/cXmalw5eST
 7xZ4N+kOcJWgWsQlZR3Fotq6qcM59HPgbt+5SY8FVXpa2WbMJ9REkOk7+Ju6JIUnqR4vDGoU
 H2h4tNZYLWFGP30GW4reTYKUL6x6uE2qBLzs9IOP0TI1A1m9uGmUGJTHSW2pg5zEb9XCL4hk
 MAd4JM4ygrnkRc7EMe0vgYN/US2E3EweaEGtJYbPYzVtjQW2mxyOZzyNgKm4bWkScl9DU0xE
 zrF2IvAn+t9w2TBQVoSFF/M//ZsupAVnC901Xo5flGvtv/YtKVmwi8L4TATSyJLxC5myMN2A
 HBgbGduFJWN/hBppclNZH+tEAd/Hy+k+lT95l8KtW/BRWy6fzbpAExkHsjV52Ef0WZXXgYDz
 YGi0Gy/DArbJpDg7BU9SWtOiqLFT+Uo0ibghcr+PcCOP6diUArfmqX0OFY58Ur2M/gQ2n/Ci
 /JhpttrSKvBMiUVna03Jq+a2ZkUSzGGPGZyeu5gzoxYAVDjfCyO5hbWJ3CTYs9tI9n4wX28A
 eFqJeNNUE2a/wSKpTY5G6UNAuFVmNgE2dk8QY7odFU26+ankjlUsZzr5nffgk0vSI5QisoTE
 N7aWA+DNW2yvkFqvVHxgvNKAUeCWulcVjbAhLi01M4rC6M8tPpddBBu87ms4FSQHghV3zOVm
 wLhZKXpy7Rpz4BwrrT8DKlGKRi5GdfaZr7R8AmMrMl/N4LTEMbRtjE6rkvsEBRWMIAwBfV0r
 6iAgOTm1lLvmocJQ37VnrecGpZK5MuJQ+tcNPzsHkRahSevXMzN4QMJ3mKFdbhloYh63da2Y
 QmVc+6iXIclYMhcz3hrdCRuKRYRJKDpZKPGpynmjfCzJjUC8A7APvW13GTIaDxFSyo2JJHOM
 A/4lPKw7NR+ro4XJhslBeljMqBoMm3YRqoqWN3ghwa2VlDyrAu5hYLjsh485RXgKHqOSp/66
 K2YYCnOTk25vaWQwexJt4B3gAYsM098pusNZWMYxc99jmGrLWwBLNlFC648NLNvrnXQ2q37N
 Rb3V0lzORWlCH4AOV/57c/4VwiSOv0WN52rbnY19keTcGGtCJnGHLJl8Tx67mxrfif4ituqM
 swa5ma6Ky3ZLkuFngrPzqfTbSZbKvLmKrYg/En8l4n/AU9bD+lRknNmGwVJWGrMFMSleIAn4
 4QqbTgsfa15YReZ/QVcl7p9FxQQvTepxDItBctK6MiKoJ2VlYWs19WmU9weEdQ/gAAiK7sHR
 HexTGyIi4xTNrr/poNx0+8UbWRI5T5n0yR0wGIPheHfok1o1lkaAg==
IronPort-HdrOrdr: A9a23:3JKoPa8DR15yCCJrVk5uk+D8I+orL9Y04lQ7vn2ZhyYlF/Bw8P
 re4cjzsCWftN9/YgBGpTntAtjifZqYz+8M3WBzB8bZYOCFghrPEGgK1+KLqF3d8m/Fh5VgPM
 9bEpSWY+eAaWSS4/yKgjWQIpIPxJ2o/smT6ts2DE0AceipUcxdBn9Ce3+m+4RNKjV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AMQjNJGsPFORTwIByD12FI1q46IsMe0Hd1FDhBXO?=
 =?us-ascii?q?bSkRXSqaKEHrJ2ppNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3APdH6jw6IHKOQszST6q8huw85xoxDzIbzKEEHtKk?=
 =?us-ascii?q?/4fbZB3V/EDDNz2yOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032614"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032614"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026
 03:18:36 -0700
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c4550d8ab15so262491466b.2
 for <jani.nikula@linux.intel.com>; Thu, 29 Oct 2026 03:18:35 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793269113; x=1793873913;
 darn=linux.intel.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
 b=lFCIEVz0D59uz40e//gpwEzgPAAi/kDxgVHXAHDG1CKkK4UGRD3jhctDeh0yjkg4lQ
 ITZBnO34+cCJJFcqB0FPQN4B0LS2rNA14Vt+bUFfBaRbgz2DzWCE+eqsMnUXMUbeTGfJ
 vrPW3dl7rK+oXw3FvWVMAyyg//pLLevSaTYfel1jwa02BqYs6I/YPkGtZQRX+kWW2L+2
 4w5Kkt7wM9vkGk50NTPBASTcoUomKuB87K/OpbETW3N2gr1eQoFzAGjhHM8FjOOdpuf/
 JNb0RBfu4wemslyp6qiXSxE3skvrRcomSSXXA1AaG0kfF4kFqLP8QVo8rPHXWNETHEo3
 g+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793269113; x=1793873913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7eDSUJln09vjqS6fT78Hrmt4ANao45wYJuBLIsNkp4w=;
 b=19fIza6nGzENMHZEyNjuZD/EUjuKs5LE3B2PkZzI9FyzkiTUXO9X7jM8ZKEDfqtQdS
 YGz8wGP21gnBtok+kuBVgKdLLMKTvREuaUfjJws76C1rMV8qzHQPVcF6+eYcyF6l951O
 2poRonK9YGOWUqx2tkMJbV1k9wqS2KwgnX9iYJ2GeB6gbRahpnvdcmn8KkpwexSijR+8
 a5QhsIH6gddp/UNTJzKCq/ZQQm0+u+90hltdaYvihALxwycM0cy6E5ZlWKqcdKlriC5x
 VdO3ZzrweoMGixB/g7ZDKjmgW8N0ghkfajJ4MT2GyMqU581sAifvyHwuhxAeHAKnFJLy
 1C2Q==
X-Gm-Message-State: AFq9FYKfx6ktLytZkFngZMPrR5V36Rsm0wKMXVnkAK+HBTUtMX/rNm3S
 r5MXrb/fH2hANUD9gbrXtH5BCAjnFi6+1EHm4ur5yDEmf/4Sa6mzabEh
X-Gm-Gg: AYBFou3fKhbrZfNToG2xEPF9+9BnppY5pub8b7egmGwkMOn1oF+7xiSWGvnq9Per7T0
 XJ5ckEZP+qtySgC7oUIxKo3dBLOtS6BGB3Y0R2n1/zdmpV1ysecdT6eEPke6Vm6tCcYnC7ezT0A
 ZFDGr61+/EUEoiN17JZJWt4UwTpGaFi8AFcsKCDRtZ/zaF9Lwc+UXF2FeK7lHi5FAJQj5dv5A7b
 0GBc2lVMx7fjA/DSYqUh3ktO2wZ54SqM2pJWlXmWite81bwKzOl1Q3/nN2gsub3QnM+HY6MrxgP
 ley89zxaBLW9kC+3KkZSbGmbiqTiYsvZQLhlN9iyTjCEdazOFbVeVbJCbGM7WN+arnKM+HcWEp/
 Sw97P38hGVFCHpXvr9lw+DyY9fN8zRiNnYsAxBuabQvrXgFagZ1FKd4jAkj+YLMdVFIPa6XNh3v
 hdrK2y8EZ3cEMRYTelaAIskbqfn7xI1XtkGuKib2QA3RXoFE0I9qhHNeOqqWnkIcPp7hh/OzU48
 K6wMOQgY1n+U6WR8BzbKWnElf6X2T2QUUhnQrC1bf7FFVKb9i7juvhIdtNwhSckpNJ2D5IyuR9x
 nU31CrlILlykHPzmyijEQ7C843NROrtTmNaTqqUL4fUSzFqL2r8pTT34upDHuqo=
X-Received: by 2002:a17:906:f581:b0:c49:8fa2:4a22 with SMTP id
 a640c23a62f3a-c49bdf569b3mr418814266b.41.1793269113505;
 Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Oct 2026 03:18:33 -0700 (PDT)
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
Subject: [PATCH v2 3/5] drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:24 +0100
Message-ID: <20261029101826.72773-4-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8SM6Qhn6qt6f
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e136ac71e..d798a3db7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1651,7 +1651,7 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
 	link->rate = drm_dp_bw_code_to_link_rate(it6505->dpcd[1]);
 	link->num_lanes = it6505->dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
-	if (it6505->dpcd[2] & DP_ENHANCED_FRAME_CAP)
+	if (drm_dp_enhanced_frame_cap(it6505->dpcd))
 		link->capabilities = DP_ENHANCED_FRAME_CAP;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "DPCD Rev.: %d.%d",
-- 
2.50.1 (Apple Git-155)

