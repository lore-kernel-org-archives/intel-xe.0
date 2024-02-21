Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E705C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 07:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BA210E2CE;
	Wed, 21 Feb 2024 07:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ZUH27ky2";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="JFlF/mfJ";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248D210E2CE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 07:29:18 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly19b.srv.mailcontrol.com (MailControl) with ESMTP id 41L7TG87307368
 for intel-xe@lists.freedesktop.org; Wed, 21 Feb 2024 07:29:16 GMT
Received: from rly19b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender osharabi@habana.ai) (MIMEDefang) with ESMTP id
 41L7TFmX307229 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Wed, 21 Feb 2024 07:29:16 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly19b.srv.mailcontrol.com (MailControl) id 41L7SRtH296657
 for intel-xe@lists.freedesktop.org; Wed, 21 Feb 2024 07:28:27 GMT
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by rly19b-eth0.srv.mailcontrol.com (envelope-sender osharabi@habana.ai)
 (MIMEDefang) with ESMTP id 41L7SQcJ296021 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Wed, 21 Feb 2024 07:28:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3NSGlMFXvH4mG+P4fUyltChMe1rjzSlq7PphDjvVn75OXMH3LQLO/NOwz4HMj0GF1LyRfDHH8BZj59sRPQ+hCbvewZvCbfq0U3AyiFQnwg8+/ZvTKfPCGlU0zy6sQ7eo6ZSPCRXbJ34L9UhEBRSarudfnhF+kF+spsjRSHbSbbhFuWRD+mVWFz0QJ/kDjhKwWi+Iw6CjCwJKpXE5BGyY6QFenwi2e7Nlz6LONwExI7FQUlZnepUDb0fk7YFXeZMrj47M0JLeQidtLYfxXHz8sPDFvTU3gEjV6OemEquEgavtOkf/eausg5325ikP5AMdcwW6UnTlkMsCciygTDBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZCGK3rUawUXPLyx7PAkuGqCBvXfLODQYhMuLT7yy28=;
 b=WFy+crl2KEt47MpAJ4U+JqheBkv16/7kE2aKjRCmt2gSRoN1S9La1I1b4BdBm/Jjej3K6FYD7/Qd/mqnhJ848MtgOrtNMMC4L/FB6qRcKDmFn4cZJ7fwPD+waxZskiysbI5o6ROZQAA/QJKmYYXRK1ZwFwddefR4qWVFSAazJ+HaJxclm4u6cb5QO4W7sbsvyreI7TNlqQllOec+Ybpy50MGjh3QNREdVLAI2V1pXraRwbXcErX9CxDvmOG9taK1V7Pr3dVFVV6JlFrpWGJKI3aNdHTmfexMgHXzZybh/SD7fv+C6MiEEMrxAKNoKasEUReUYZJ0Y8sY83fo+kI1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZCGK3rUawUXPLyx7PAkuGqCBvXfLODQYhMuLT7yy28=;
 b=ZUH27ky2PmTkIb6UF5Ui66Hx8EZ45x20JUB5i6i876OeBiz7yka4/McExoTGpwbSDMPQnRt0k+CGwG+kVyTMUE+29MOLEgqhU/7z7u40MCJu6OUmfBO8443z2pdtpTUtXVXmbZk2sPRRg4n28M2u5eYU5neAzJiGx5GEFeHBtvLulfV8imoEnZ+bvRKyvEAP3FeDvNP8Pht86QXmloHMBsyGO8KXxGVQXuGwYMiHdVM2WecYJEJn3wuXtpb7t3GotpQx0iPFxfuEQnIvPQkGcA0qOL6T1Ava7yKFQqa17xBswovF0wgeuKYLWGyxwhOHdLBPPtVN5x3ZKK6iqpZSbA==
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com (2603:10a6:150:db::6)
 by PA4PR02MB6720.eurprd02.prod.outlook.com (2603:10a6:102:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Wed, 21 Feb
 2024 07:28:24 +0000
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::42b7:1098:d42:9b99]) by GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::42b7:1098:d42:9b99%7]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 07:28:24 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: skip register UC debugfs if UC disabled
Thread-Topic: [PATCH] drm/xe: skip register UC debugfs if UC disabled
Thread-Index: AQHaPvWj71D3lTJChk+nlssed4n2JbEUl6eAgAAZh4A=
Date: Wed, 21 Feb 2024 07:28:24 +0000
Message-ID: <a8863cf1-72c9-4fa2-b963-8a6f3632f1e6@habana.ai>
References: <20240104100557.1204296-1-osharabi@habana.ai>
 <lnatfbxxrwwb44mttxtwkfrpumd65c2vvbp3pxtjpjqv7almtf@n36d2cxfcjwj>
In-Reply-To: <lnatfbxxrwwb44mttxtwkfrpumd65c2vvbp3pxtjpjqv7almtf@n36d2cxfcjwj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB9325:EE_|PA4PR02MB6720:EE_
x-ms-office365-filtering-correlation-id: 2bb02853-8c9c-46c2-7de8-08dc32aeb055
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PcaZKlF0ivzZ1PhuIQMfDQk4nGy0EMBEXFahHavrbou4cycr93LKCT8rSTzxZCRekhZshpdPzIF0q5yFejolIizxxcpXUjOqQvtPKo8bPJvjlT/ltAjGHCGHUqeAOHZe+tbRDVeabl93/9f+7H9sqdUZDa67Sjvyzob+vwntc4+/7TaX4MiUSwF7D5OSd0UafHCYur7tkYxrnElFElP27kp1zEs1NlOX/F8UStfG0YRgjLSGEQoTxAo8OAuqiXgU3BM92P7wPF2F25Kz25bL9vILQ9OXKraZxtA5X2+cq63OZXSP2KOZNg/26cUiIXFQ3SjsYtwQbNYeUdUpKhIQEv4IhJkTXV51eCFu4lrSu7YsJQ+R+3Eclv5RXyhzZR5/XknHOHNJCR0CtfZOPKBtISjKynqbzzh7er4MlQMagaNemwST6ll3GkzmumtMKfF0f03NsG2GTcSxva9UAKq25Z2aMtyg319rg9E6vSVZtSzuCIl0hMdT2kpNwD9pKYq68cHsDQ2uJ4BW5uzKRiiXqgws7lchQX9olkAuPLgFpqm7bBV6VuNdaGJJEWEiV7Qpb2QzjbI28OY/SUONkclP2SjKXtfq5VurJO0UJ2lJQ8k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR02MB9325.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QndjL0dZSHF3SmJmeHhsaXdzMkF2OVF0dTRwTG5pNWpTVWorVXdBczdyM0l3?=
 =?utf-8?B?OGF3U0ZFMms0WEprZjczR3NPa3pWSHV4TWtMVGhPcXpaUmVlODNJY1JldUZh?=
 =?utf-8?B?VkxoRWpUM2p0dFZ3ZDA3QWp5MG5hSnNNVHBFL3ZaelVNU0ZVaW13TU5jWUg4?=
 =?utf-8?B?RGZ6Y1N1dTYrMGpiZ1VrNVA4SlkybGVaMG1QRWxLc2syMittaDBtdFV2S3Nv?=
 =?utf-8?B?U3dta0FPeXFYOXVmR3o1T3phYitic0phZVFrTVhXdDZHdk5HNWJ1MkJVWHpj?=
 =?utf-8?B?R2ZlZDNRNGNVTGRNMlNGaURXbTVobFNqaGRBczQraDdabEpjeTFaYjI1d2JF?=
 =?utf-8?B?WUNnL0UzQ3IrV055WXlBRlBUQ1g1WE0rbDZZUTZpdDhvZVRqRFFMTlNaOEp3?=
 =?utf-8?B?emhIa3dXNEZFUkZzYys0TWV6RUVGblJiaEN3UjdFQnRCc0YzUWRnS0ZSbE5p?=
 =?utf-8?B?YTJLM2VpSFY0RmJCVHlCTmVQQzJzQjZQSS82UnF0K3lCUnZ2V2dsbDFiZTVs?=
 =?utf-8?B?S0dJMTB5NElFVU1TdTA0Nml0MmZRZ1d5TWVsczY3dXFhcU5jS21nMm15eWJl?=
 =?utf-8?B?NEJiZ0U5cVA4dDI3NjBxTDJxRWhCZnpuRnVJanc2N3BrSlNNeElXZzRzL1lr?=
 =?utf-8?B?d1pVV1FaOElRekFwVkVnTmNjcUNWVkppS1FUMEhFVXg4bllhejVUY3UySlJl?=
 =?utf-8?B?d0VnZ2dSZFVySklkZzdLbkI4cWxvQXlRZlVYSmhMcS9reVlIRVNGdjVQQlly?=
 =?utf-8?B?QXdXMFBLTm1oOTRTZS9zMHhIZ1BtRkRENG9GRDhXWHpEWGVOeDhuZFVabUE1?=
 =?utf-8?B?VituRTJzczZGZCtpV0NwMkxPUGhPUFlsNm9iaFZCVktlQ0xZMG9YL0kzeVpr?=
 =?utf-8?B?a3c0MkpQMnA3S2dnVmUvSmwxRjJhNnM5WlNOK3VKYXdQeVZWNVJFdzNDVjJx?=
 =?utf-8?B?dUs1ckU2NkxxMlhNajNLSkFSUWNHUnF0RThkak90R2J2N1lyVUd3TExQSEV1?=
 =?utf-8?B?NDJQRG1qemo2N3FYZkJQekJod1FScHRWNkRTZ29jQzRpRFpPWDk2emZuTnVZ?=
 =?utf-8?B?TlBIVEFLeStnY3JsbnViUXI3R0wzb01SYmpCWHhWajl6a0JSMUlKbDhCMmpn?=
 =?utf-8?B?QjIxQit4bXk0QmRsV09YNEFBa3hoR0pJZmdLakRTYnlaWW56NkRZTWl0cldW?=
 =?utf-8?B?UU9hUThHc01FUXhOQUM4ZXFmTExHZTJXK0d5UHpLUEJDZElSOXdKaDRaeDRw?=
 =?utf-8?B?Yjc5R29od2ZiQ3hVZnVBV3hQK1oydnlHYndnVm5rUHRtQXRGVVo2Y1Aya05Q?=
 =?utf-8?B?WUo1RnVTcDVHby9OV3hXcStkL0trOWNKZjE0Y1JyTndCNDRRNmFqNUNNWEN6?=
 =?utf-8?B?Z0hsRDBqWXBpNzlhSTZSemJRVUZtTzBvNTBqNXVOUUFDc3BoS3dJRzRQN01u?=
 =?utf-8?B?b3NUUmNmVTkzZVIwc2J0TUZWSGg3SXlsM0xMMzdaN1JQaklNd21lTEJRVXVv?=
 =?utf-8?B?YStadkdvQmNxczhLNzhBYnhDMExUaXRyQnhmZmx3UkloQ2VQNE5kQkZkRm1l?=
 =?utf-8?B?QzgyWnRtYUVkbHRtemx3REtHYkg2cDlhTUQycysrYnlpaDNmZUhFa2d1MmVi?=
 =?utf-8?B?bm44RWtvRFQ2dUJJbnBDSHlOYnM0cDkydUxrK2lLVDgvV25oL1hoaXNiSUYx?=
 =?utf-8?B?OHNMNUNZM0MxM3pabW5TZkdFSXJSMDMrang0NjdRTExSeTNnTWRtS0ZvczBE?=
 =?utf-8?B?d0RTdmlNREd4ZEdVck5YWTgwSi8rUTdVZlZjTGdYNHZKSU83QlJOdFZ5WThO?=
 =?utf-8?B?UDcwQmc5TXFLS3dCcVRoMHRhQ3Q2SUxCamdFUU9KWnpCcDhWeFdiVm1kWTcx?=
 =?utf-8?B?ZzR5QlEwWFRYOUkzQzd4RkdPaFl5dnJWVzNVTDd4c1l3TTJlRVovWTU2ays5?=
 =?utf-8?B?enM5RnZDQmcvS3k4OHdWYyszZGNHNEZwOWpjTzJQQWJqOWMva1MxRFBQMjNj?=
 =?utf-8?B?WHVVUlhpKzBQSnI5bTJKYWVld2ZtWkR0cHZtK2h4QWs4WFpma3RMbWxPYVNE?=
 =?utf-8?B?ZVhCQy9rbWhZVjVtVTk5b0xYNmFwblNLaW1rcFIrdzVENHVVYkJpUnJ3TFRI?=
 =?utf-8?Q?3XTk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13344A5B6371834181458FF12FF5FD94@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9qOb1QWq5sKdAq5hHwdnbiuRBTA5EhC2a4mUfqye7XNFlNDwOp3dj4yOEftlkj3dx/PiAH/kstqwaocEWTnOOjfgIy1XS6MuGsV6JtG+FzMyXl+IhUHKoMTzbSdm9T0ujLclMjG4yhjkiC79KeoPSCW72oZDTSbfntNBPJoPeezuIC4pxFEurJwkURwgYDgJmCcflfzhBYl0RYpckM5ZzPhw3uyb1vFurkwSFFAYtostsvAlgLoS1+TGphD+6HvUk0lEuPqiSRFi8uEdZuaqAyCSUnlPeGIkdEGA6+t+sKQ8gNdEDFGn5WWS5rEzO/SRDYS7rna7RLHWXcsIE+zWcm1r5djFJYE+9X8/SnTUr2Y3qJOn5FE+lWSeMY7QHMQVzNwR6yHsFyPVPNFIZm1ilHUGYratVH/gDdb1GUMRJp+kkVD5BQAqG2eN1VfgTVjR/KD8nS/A1ilWbv4VkBo2z1tcNintIq6gwiz2QePQaWbRUu21HuhJRRKuXucndmyxtiJ9f3pAxrqjKubcKF2CO24Ydu7YZviaQKDEixZ9/EjtvLcMpDYbDjIKlyLk1qYYjVYnJI+XcwvNqhnpI0ml8AKZ0qqohBL8agD06P3D7RdJYl8m/Iz53gdRcsPf2RHw
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB9325.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb02853-8c9c-46c2-7de8-08dc32aeb055
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 07:28:24.3552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5o6f1B97OwlZ0T4/PaW0DBvOF12njY5Bwn+l7tNCTXugGI887WRvcjYSMYYoAPCb2TqGwUhobPZAmbUhSb3OYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6720
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwODUwMDU1NTpGUEtleTEucHJpdjoR5+t3gytZeqlCbWHUD1LFH4RNryLYRLP1emzoT6ImhzLKiV9FhQLFVPFZEAF+E9F00nhFFVCtFwC1zcnAbU73Y7ZugpZ2hxMXVwJf1isX+tjXEc9MholuOUXuHWpXcAl004lcPna2Wughuv6LMq/Mo/VyZbiybHnCpZB9btJMCxFYCdVX+Bs7G6TV65/zgOih5CucShfQD64PlHhwg/zuYi7VVpqp8eRSuCTtE9zdrIKX4+7fwQATVruI8HSWYNDMjMp8GibPO7gpJjJg5HcxJJLGBcbNVnTzXhCJwVh+cOI+JqFofd1gFDuDVklYWppHvLUZIZfjIaDxqV0X8KJ7
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.17.168
X-Mailcontrol-Refers-To: 41L7TFmX307229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=1ZCGK3rUawUXPLyx7PAkuGqCBvXfLODQYhMuLT7yy28=;
 b=JFlF/mfJPdndZiosOTrzevLRsJh1HaHx71k4A//F5aiVPlULdO0GAXYwTuOPYclxCWYdvxUL+37ZflzSIQc1Ju4XiyqvI2+JrG4ARXc2wguTPV3emM/CFWLX1E95WWYC+l8FMsVZRqIfZ7ORRRjU4FB3aD65V0K37ot3BdCgNoihWzpDxRS92cJ737lUocw2LmyRJKIz/TjJu8Jg1KEB3XQL+5ngFBfn2iBFTK+kHlzU37x2h4L9Gk2+WPKu+YqoOo6s3O7meCKZGTxDQ90CidiaDZ5xixl4JnXdvN6avk/Vmjsx8QLo0ea9AG8y++tadrnG9eyL7Xz2laQLGgddpw==
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

T24gMjEvMDIvMjAyNCA3OjU3LCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+IE9uIFRodSwgSmFu
IDA0LCAyMDI0IGF0IDEyOjA1OjU3UE0gKzAyMDAsIE9oYWQgU2hhcmFiaSB3cm90ZToNCj4+IFdo
ZW4gd29ya2luZyB3aXRoIGV4ZWNsaXN0IHdlIHNob3VsZCBub3QgcmVnaXN0ZXIgdGhlIFVDIGRl
YnVnZnMgDQo+PiBlbnRyaWVzLg0KPj4NCj4+IEFjY2Vzc2luZyB0aG9zZSBlbnRyaWVzIHdoZW4g
VUMgaXMgZGlzYWJsZWQgY2FuIGxlYWQgdG8gYSBrZXJuZWwgY3J1c2gNCj4+IChOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9oYWQgU2hhcmFiaSA8b3No
YXJhYmlAaGFiYW5hLmFpPg0KPg0KPiBpdCBzZWVtcyB0aGlzIG5ldmVyIGdvdCBhcHBsaWVkLiBJ
IGRvbid0IHRoaW5rIHRoaXMgaXMgdGhlIG9ubHkgcHJvYmxlbQ0KPiB3aXRoIHRyeWluZyB0byB1
c2UgZXhlY2xpc3QsIGlzIGl0PyBEbyB5b3UgaGF2ZSBhIG1vcmUgY29tcGxldGUgcGF0Y2gNCj4g
c2VyaWVzIHdpdGggYWxsIHRoZSBjaGFuZ2VzIHJlcXVpcmVkIHRvIG1ha2UgZXhlY2xpc3QgdXNl
ZnVsPw0KPg0KPiBMdWNhcyBEZSBNYXJjaGkNCg0KTHVjYXMsIGFzIHdlIGFyZSB3b3JraW5nIChp
biBzb21lIG9mIG91ciBmbGF2b3JzKSB3aXRoIGV4ZWNsaXN0IHdlIHNhdyANCnRoaXMgaXNzdWUu
DQoNClRoZSBwcm9wb3NlZCBzb2x1dGlvbiBpcyBhbiBhZC1ob2MgdG8gYnlwYXNzIHRoZSAib3Jk
ZXIgMCIgaXNzdWVzIHdlIGZhY2VkLg0KU28sIHRvIHlvdXIgcXVlc3Rpb24sIEkgZG9uJ3QgaGF2
ZSBhICJtb3JlIGNvbXBsZXRlIiBwYXRjaCBzZXQsDQoNCk9oYWQNCg0KPg0KPj4gLS0tDQo+PiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfZGVidWdmcy5jIHwgMyArKy0NCj4+IDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X2RlYnVnZnMuYw0KPj4gaW5kZXggYzRiNjdjZjA5ZjhmLi5iYWZkNTVhN2ZiMTYg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfZGVidWdmcy5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfZGVidWdmcy5jDQo+PiBAQCAtMjQ1LDUgKzI0
NSw2IEBAIHZvaWQgeGVfZ3RfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVJSQVlfU0laRShkZWJ1Z2ZzX2xpc3Qp
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm9vdCwgbWlub3IpOw0KPj4N
Cj4+IC3CoMKgwqAgeGVfdWNfZGVidWdmc19yZWdpc3RlcigmZ3QtPnVjLCByb290KTsNCj4+ICvC
oMKgwqAgaWYgKHhlX2RldmljZV91Y19lbmFibGVkKHhlKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCB4
ZV91Y19kZWJ1Z2ZzX3JlZ2lzdGVyKCZndC0+dWMsIHJvb3QpOw0KPj4gfQ0KPj4gLS0gDQo+PiAy
LjM0LjENCj4+DQoNCg==
