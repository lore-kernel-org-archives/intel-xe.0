Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE18C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  2 Dec 2023 20:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BC810E0C9;
	Sat,  2 Dec 2023 20:02:59 +0000 (UTC)
X-Greylist: delayed 1687 seconds by postgrey-1.36 at gabe;
 Sat, 02 Dec 2023 20:02:49 UTC
Received: from cluster-d.mailcontrol.com (mail-01-d.mailcontrol.com
 [85.115.60.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051F10E0C9
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Dec 2023 20:02:49 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly09d.srv.mailcontrol.com (MailControl) with ESMTP id 3B2JYeO1261015
 for intel-xe@lists.freedesktop.org; Sat, 2 Dec 2023 19:34:40 GMT
Received: from rly09d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 3B2JYcJ5260921 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sat, 02 Dec 2023 19:34:40 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) id 3B2JYE86257469
 for intel-xe@lists.freedesktop.org; Sat, 2 Dec 2023 19:34:14 GMT
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by rly09d-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 3B2JYD99257399 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sat, 02 Dec 2023 19:34:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw+C/HmC0LrHJgq84vz/pTrbW+CTio5k/zjLuufpkiYmQCWaHq9u5indDoH3jB9MjmGOlL/soIUlpjNbxl67kqxnjq6fHBmfY42r8c6L995LfXAVTVKYjSIG+4bJfFIrEZQkjEDkSu4l7uwIRvMoX+h1Z2pilh4FJbQSuVF6/gIjC5cuju4lxuR+dQ4N+WCwuOLjB3xV53fJ5UTTiB8sGigMGAceVXBU8/vZU9lKBvi9FVkiuEIHnID9BrH1n2RkBho06v7Pmli/tXm+kExDgPXrYkvHmwRMZPf1NqoFP2fDr5C0osfsJ3O/93UrKl6/vTYA/REDARqna2JTG1Wu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+aVxvUlKAEcoKwMguM/D3UfKNffK0iqElxn+K7U0ho=;
 b=NwPegnCeyYhTMplBiWWTL4wU/VMfJipU/IkCFiI4GQUzfe1FDUVb8+5776/kSETeqh4y0eCUF717ysRDYeDuvK91snswZmQ60BO4V7JIC2x964h5TkDwEGtbnYJbTQ2IUiQ4yWB/X3mjWw+0oqPBdvtODpcUvkkwGp0sgh3bJSR89SeHslInheLAMWifsnjhSXkZ5QSHUtxU6U7fgijkOSnjeDP6NtLJdLBABNw6yhYRffDoXNoJZYxUBve2yAV5QrZ7PEVR2RrhIWBgb+ay76xLmowVnIUQMvGeBdxitMemBjeUSW6X1Y9zId59eAFKwwHla+pYr+tX/C/C+5nvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+aVxvUlKAEcoKwMguM/D3UfKNffK0iqElxn+K7U0ho=;
 b=f1YhTGi9HVfXw/j8p+4Pt7+CRnezF/vboEQeqz3hq5M68DNw8rwOI48CcDgHa56N9qouC+QuFeRLHz6bJKJnmNeUTFc4H1L/Fijw2IYogXuT1rkAAiEFDWIHS3kffirEfKwKzRn2baprKkde1KP+c3V/6rAyM7yO/5Qp7+ZMYWyy82W2wAqLnwMJUUbSzb0LrSPmu5jT/mOTJiS8LUE+FB8meUizF7Tdg7voOV25Mw+jnFfNIMBLbk4oXiJcFxyaNve7vtm5a4DIXAW7ka86rX47iZoCY8QBwsB4tNMeT5f7Y9itwPR4eUAS2au2Yegr0TaA6eVkvvZQjvbZNyPHtQ==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by PAWPR02MB10092.eurprd02.prod.outlook.com (2603:10a6:102:35c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29; Sat, 2 Dec
 2023 19:34:10 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::3e50:2c13:845b:5f91]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::3e50:2c13:845b:5f91%3]) with mapi id 15.20.7046.028; Sat, 2 Dec 2023
 19:34:10 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Koby Elbaz <kelbaz@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: rename bypass_mtcfg to skip_mtcfg
Thread-Index: AQHaIhttFppgAQ7b7ECV9Arnu96EVLCWaNOA
Date: Sat, 2 Dec 2023 19:34:10 +0000
Message-ID: <8c669497-9b17-492a-934c-703897ac022d@habana.ai>
References: <20231128165316.3142184-1-kelbaz@habana.ai>
 <20231128165316.3142184-2-kelbaz@habana.ai>
In-Reply-To: <20231128165316.3142184-2-kelbaz@habana.ai>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|PAWPR02MB10092:EE_
x-ms-office365-filtering-correlation-id: 878db878-3d29-491e-e6aa-08dbf36da826
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U93DOCR/pL4bRXWH5J25/w5p0t//C2xDK9iuEhh35LVCYuetH/xdHj1gBvQX+uXbmKPb4s++wyMwIOWQp2lmhDzmFIqoTo/zFn6lZX9ktuXdwsAJuCzh5xTBtzvLwQn90QlomucSg0tOjG4cJNLyxF/xoJJYrMzVdhS5zSy0U3mYOQ4D5YePQJccbcjfemikc2ihZtlAyLQXJoBGnGVNKQvCEcrFhV05JGJqlhRhZqwgYkRgbH59N4e51G+8PmMdwzeEdjFexgkChij0QGAe7qTxZFc6wzL2rWYtRotTgmWaM7zzAPbEbDbXkKMT8u2xGnuj6SfPjCEFMQu8jwzI6iSY39/eAsZDF0EXdOTIshQrZlcw8rOcpXM1vc+jVPtio0snni+kMYtWvNXtAAIS57YMSE2cyGPsgL/KXc0ciqubqYT6Y5VpVIwZV4f5qBnD6wUGUPitnECDTC4pEtoRXNsxDRBxJIGjY/2lhmJaTm9mSSYbEda23oYUHkxvQw+RE+UxyQfFqbaoZkAhGKICY0y20RQuCUuYRswL8DOsgCup4Dwy7Jj4PB8EcpvNZ6Cd/i/rBPeI57AYEEBUQd9CjUaGL/59wQLtG6LmQC0PoaQDMOTFEThHC+fYVWM59jsKBrfakgfaYD78mlndOYHRfFJG97W/Fs1wC+5bKKbCSFNCqtyqixyztr1I+EweQ8u6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39850400004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6486002)(26005)(478600001)(83380400001)(71200400001)(6506007)(6512007)(53546011)(82960400001)(36756003)(2616005)(316002)(91956017)(110136005)(66946007)(66476007)(66446008)(64756008)(76116006)(66556008)(122000001)(31686004)(38100700002)(5660300002)(86362001)(8936002)(8676002)(2906002)(31696002)(41300700001)(38070700009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXJhbVcwOHBneU81SnZldUx6QVQvSFRJR3NvZ3E3TmFaaXFNbE9mQkZkMTdt?=
 =?utf-8?B?OXZsNGFFNUZhOE4xOUxWNWs3dnAyb0tJV1NVeHQrVG1TbjdKOFYyczZETDlJ?=
 =?utf-8?B?ZjR1RzROa0ZvMGcwc0kvQjFzczVCeGZzK1pwd0E4K2IvTGNjVVVqMjUzeFdt?=
 =?utf-8?B?RlBWaDhwck1zSUVuQUd1NDhNOW9QVkJrRHdCcFNXY1RJcXluMzZYSVFtK3JM?=
 =?utf-8?B?RG1YSUtiSDVNZG9naUdXbmo4bEl1azBGamxMT3l0QjRjNTlwaDdCZ3M1b1pz?=
 =?utf-8?B?bHBPbjlZQlN6MW0vUXUrdjk5b3dHaTNsUjdDU2xvbFNQWWVWUW9od3dBOE1C?=
 =?utf-8?B?NndPN2N5MjlpTDVWMGwvR2hNb1M5RE4zZkdlR3ExbXhNc2dteFZrVys4bTNG?=
 =?utf-8?B?d2IwM1VTdkNvVXAvVmlvdjJCWVE0eHNsZ25RZFB5ZXlCdCtSenZDSDdYbDFl?=
 =?utf-8?B?bGZCVC84OTFBbzByaHYzL1dURkh5VUJ6MTNpeWdDeGorRmxIWWNRWVRxQXhu?=
 =?utf-8?B?WmJqczQ5WXRLb0VLeUpJOHA1RHZBUUlDNEVlNXBFaEdFd3dVMHBrYTMzTVp4?=
 =?utf-8?B?MkdvcUNZbVUreVBWNmllRk55MmdIWjJPUVpwK0I5T2pDbUZ6NFVUbUhtUy9P?=
 =?utf-8?B?K2ZCd3VkQVhyYVJPMGV1K2lBYmcxVWpUKzE4cDNRZUdjRDVKeUs4T3ZRNVpU?=
 =?utf-8?B?K1ZRbk9WcDdRQk56cDdUeFBaUTI2MUVsb2FidHgrQjNLak44YkprSEZwNHBD?=
 =?utf-8?B?Tkxmb3RVdXZ0ZW8vWFMzNGp2TGdxZUJyNDRiRURDQUtIOVZkVVpFMmlPR08w?=
 =?utf-8?B?UjNxM0wvOTJrcWUxdEZMWmlSRnRJYzNYK0pqTmZUVDRGT2tLNkdZNDFoaGo0?=
 =?utf-8?B?STl5bXFFMU45MktuQytYNEtHVitWSWNLTEU2dkRSTU9TUGRTUWlMNDVTVmY1?=
 =?utf-8?B?dmFSSHBIYW1uYm9lWkFNWWJaRTVWaVpvZ0ZvMkhpK0lnY25WVkdIS0gxMXk4?=
 =?utf-8?B?bDh3UUQ5NEhTV0R5QklPRU1kb1N6ZmFacTl1ZjlWWG9TNitwL3J2V2tseG9k?=
 =?utf-8?B?M2dpRzlnekRZRVJXcjkvbEltM09aMm51eDVvLzIwNjM5amlnZmowQlVEbVVP?=
 =?utf-8?B?S2VuRkJSSlZET3lOZ2l6VWpJakRWQ2JuMDFNV0cyaFljR1dxQzcvdzFIbGZ3?=
 =?utf-8?B?UjJjNXd0WW5mb3Nkc2pCcURibVVxZ2Nna1dXVCs0UGpzSUNDTFdyeHNydVpr?=
 =?utf-8?B?Q0RiSEhNb0VYL1prQk9kWHgxMERGNThINUVNdGQ3Y1ltR0ZzMXlybzQvZURK?=
 =?utf-8?B?d0d6OHFDUmw4aXBjMGNDYnZEeTFrWkxhOE9qUVh0M2lBbi9hOGtXTkJjMXdC?=
 =?utf-8?B?NWphdlBoaVhCT1VJZ3lBMEhPK3l0Y25ma3ZOTU51eUNDV1laak5jRWhBZEV2?=
 =?utf-8?B?TEI0b3B3cmpxSDJBZW1FNkxIODVlQVNOMWZsNzA1ZWRoZDQ4QzVzWmswTG02?=
 =?utf-8?B?MWxVamNTNXoxU2xlVWdvTzlqdmttZWZqOTNyQzljMWxoOFJRRTVQdEZBaWVC?=
 =?utf-8?B?WkJSWDBwT2N0YXR1K0xldWxsbGZNNDk4cUpVbHUwdHgvZ0tRZXY1OXcxS0x2?=
 =?utf-8?B?Uyt5VzZNYWRtMzdsNG9vd3lwdkgwKzFpTEN3NDNZT3pZb0ZOVllRbWl0Rlo1?=
 =?utf-8?B?VXRWMFhPYWx3M1FVckljckdsOW4xUVNKaEFFaXhDc0MvNW9aZlo5OEs0a2lK?=
 =?utf-8?B?SzJ5cXVzemNzUjgrRDRpUEJzL0s2eHNvS045OTY4U2d3VEl4WEwzenRzL1ZF?=
 =?utf-8?B?Uy9GYWFNYk5qQ1Z6N09xT1ExOER6UlVBRTUxQnpOSWlHTEN3R2pjVW9zRCsz?=
 =?utf-8?B?dDh6S2NVMWFSVkhRM0pmRVUzQytLTGM2QWFjZ0Uxeks0a0hORmxYRDdCSlBK?=
 =?utf-8?B?SUpzSkw1V3ZweWtNS0pqeisrWkdJcUlzb2U3MFY5ZENFRWhadElSeWRwcGtG?=
 =?utf-8?B?UGNFeUx0dnQ1MWxVQ0hERndwaDQraXdyUDY0ZXcxTy92SkZHYTNrcnhWc0lV?=
 =?utf-8?B?RGRDZXhvYjZhM1p0Wk1PYklITWM3WlhBYjJTRHloblVTT3lIMVJmNzZTSHky?=
 =?utf-8?Q?iNqk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B493A68BD618134792974B5A73FADBA4@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Q2/fwn0nXcKwRZsgBKyor/2u8Qb3SQ1Jn5hRMLasik5Je3lQCKxND/kXgyCj4yr2dUhGkobidSq9dE2whN1jteAR/UoLiwMUojPWAaWbHyBIJjCKsbRy0GCcw608bz9lFYPzqNo6qkZNDlEvjK1qZWQYYr0rSOuzxRbZm0IJcJsFmByyYLsxCQ0KuhJHiKX6paX0Dq1h9fW4cKRO76DISMi5WNWo6mJ6yTSGF1F9tDdLCDRxFSsK8xSZClub0P+WAJScTCMYNyUPvWrhG/zHep80A0b9KX2kTkjqbevZHpqAOyYcGp+TW9VMSam81pS9/iiRy3zn2Sw88gKuZivjkrHl/ZT/KBZnLiJnEByRVbLmdsCYr/mozlQ4JoPIumF2FFhn/pHZzpkrZ5/G2pDI5/1MxwEWIL2CeEdWl1Tlv7PPEFJ3l/JFLUzGWS7UO2SKw47QHVr1vgoNQ41k1uR6kjZLwU4uDqGcP0vWPbn2zITHZlkSZYXCrVZaeb2S79uabnoqnuJiIViNKarh3773um+Cf/xcPrOrz2ffu0AVbcmtPtAvbuBovUYFbv4x34ndxpKTvQc1HXvdDgaWbOo9rKzXkMhwdnXB+bBJ8rwxv/APGrTn9Sg1nWmiakaqFx+UQnrReOKgvovACv94uzP/qcDbfQ9FH/GXYIE06+dw15Iqp2iyprGZBOA209GWojRywIY+3XviBGeJg8bUhS+HVSKZj0kgM46Q+cDN1theqk5aZUku1H5ObOis8cUpHOLvwU9RFsROP2cD0WJZhdwpaVjubQvhuCXYPDAF6JQtNBI=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878db878-3d29-491e-e6aa-08dbf36da826
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 19:34:10.0923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFfYEpcGjhmvYursLa1vecO6JMTCQlWkwWA6ZJXRrruCBi0c1JU3Gqe+erwUtt+B6N8X9UyumK2hiB3HtpdmKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10092
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMTU0NTY3OTpGUEtleTEucHJpdjqryjqo7IakiVmHo63QkxirnVZ+K9D2U+7TcMFAfgDkYlV4pO+5jRhe+XYSA+4Sz84tAfLVWg6RWNtvtFBHsY0cxQ2kvvbb4AwY6gg734V54Sd9y7qsdO4EdQpTbCzjSS2BA9kPFPmzQ6DWHPRf9rS83faCTjHmxkX1ivklhyrYebeSQ541nIItYvZKWpuCtJzXT6juHgg3EcU5iFKcfkd1+6xYzDQRbwmZb8QXaM2doaorWZ7vKskdDRfyoN9jVigqO74Ck7z7hyYOyImHaQfMx5kSQPotIwpQ88IaAOcHJOaVH0gAVq6GHbq89teSpmKPBrC95OxmBZoTPHiXZmk2
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.0.50
X-Mailcontrol-Refers-To: 3B2JYcJ5260921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=V+aVxvUlKAEcoKwMguM/D3UfKNffK0iqElxn+K7U0ho=;
 b=LbhURAPL4rC22ous6oS3Q1hxP4e9PuvJdC0RJH2RmKqrBvm2kQAMKV+mwbgeG2fxDt7bga4R1jUXF292RH9arLaKsRBiqKKOwEcnT/xtOzkT6HzcbTi57m71AR0u1XhCWzqM88GNhoIoJYZx7VLqKEv2dsl/jnooDycg0R+fX71X6nSMiJqjtvs4FUPf86r1KLtDQs69rJt7MbFwpUeNDsF+tez2X8XAjvTw2gfoIjOyC+6BTSxuT5W0zijHmRD816n5Iocukbzydj7bOkvHh0qCQbj1mQyHodt/PQWL8DWqlpnkyPggSCBRWa5KTFm/6FPxEAnLpLc3nYW14vdvEA==
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: rename bypass_mtcfg to skip_mtcfg
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

T24gMjgvMTEvMjAyMyAxODo1MywgS29ieSBFbGJheiB3cm90ZToNCj4gUGVyIGRldmljZSwgc2V0
IHRoaXMgZmxhZyB0byBhY2Nlc3MgdGhlIE1UQ0ZHIHJlZ2lzdGVyIG9yIHRvIHNraXAgaXQuDQo+
IFRoaXMgaXMgZG9uZSB0byBzdGFuZGFyZGlzZSBYZSBkcml2ZXIgbmFtaW5nIGlmIGFuIGFjY2Vz
cyB0byBhbnkgSFcNCj4gc2hvdWxkIGJlIGF2b2lkZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBL
b2J5IEVsYmF6IDxrZWxiYXpAaGFiYW5hLmFpPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlX3R5cGVzLmggfCA0ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
bW1pby5jICAgICAgICAgfCAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAg
ICAgICAgIHwgNCArKy0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+IGlu
ZGV4IDcyYWI5Njg2OTY1OS4uNTg4NzZlNjk0ZjQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV90eXBlcy5oDQo+IEBAIC0yNTgsOCArMjU4LDggQEAgc3RydWN0IHhlX2RldmljZSB7
DQo+ICAgCQl1OCBoYXNfc3Jpb3Y6MTsNCj4gICAJCS8qKiBAZW5hYmxlX2Rpc3BsYXk6IGRpc3Bs
YXkgZW5hYmxlZCAqLw0KPiAgIAkJdTggZW5hYmxlX2Rpc3BsYXk6MTsNCj4gLQkJLyoqIEBieXBh
c3NfbXRjZmc6IEJ5cGFzcyBNdWx0aS1UaWxlIGNvbmZpZ3VyYXRpb24gZnJvbSBNVENGRyByZWdp
c3RlciAqLw0KPiAtCQl1OCBieXBhc3NfbXRjZmc6MTsNCj4gKwkJLyoqIEBza2lwX210Y2ZnOiBz
a2lwIE11bHRpLVRpbGUgY29uZmlndXJhdGlvbiBmcm9tIE1UQ0ZHIHJlZ2lzdGVyICovDQo+ICsJ
CXU4IHNraXBfbXRjZmc6MTsNCj4gICAJCS8qKiBAc2tpcF9wY29kZTogc2tpcCBhY2Nlc3MgdG8g
UENPREUgdUMgKi8NCj4gICAJCXU4IHNraXBfcGNvZGU6MTsNCj4gICAJCS8qKiBAc3VwcG9ydHNf
bW1pb19leHQ6IHN1cHBvcnRzIE1NSU8gZXh0ZW5zaW9uL3MgKi8NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5j
DQo+IGluZGV4IDBmODQ2MjcyZTM5Yy4uODgzNjEwZmMwYWJmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
bWlvLmMNCj4gQEAgLTMzMCw3ICszMzAsNyBAQCBzdGF0aWMgdm9pZCB4ZV9tbWlvX3Byb2JlX3Rp
bGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiAgIAlpZiAodGlsZV9jb3VudCA9PSAxKQ0KPiAg
IAkJZ290byBhZGRfbW1pb19leHQ7DQo+ICAgDQo+IC0JaWYgKCF4ZS0+aW5mby5ieXBhc3NfbXRj
ZmcpIHsNCj4gKwlpZiAoIXhlLT5pbmZvLnNraXBfbXRjZmcpIHsNCj4gICAJCW10Y2ZnID0geGVf
bW1pb19yZWFkNjRfMngzMihndCwgWEVIUF9NVENGR19BRERSKTsNCj4gICAJCXRpbGVfY291bnQg
PSBSRUdfRklFTERfR0VUKFRJTEVfQ09VTlQsIG10Y2ZnKSArIDE7DQo+ICAgCQlpZiAodGlsZV9j
b3VudCA8IHhlLT5pbmZvLnRpbGVfY291bnQpIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiBpbmRleCAy
MGNhMzBiZjU4YjEuLjI4MjQwODVlNzc0MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiBAQCAt
NjIsNyArNjIsNyBAQCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2Mgew0KPiAgIA0KPiAgIAl1OCBoYXNf
bGxjOjE7DQo+ICAgCXU4IGhhc19zcmlvdjoxOw0KPiAtCXU4IGJ5cGFzc19tdGNmZzoxOw0KPiAr
CXU4IHNraXBfbXRjZmc6MTsNCj4gICAJdTggc2tpcF9wY29kZToxOw0KPiAgIAl1OCBzdXBwb3J0
c19tbWlvX2V4dDoxOw0KPiAgIH07DQo+IEBAIC01ODEsNyArNTgxLDcgQEAgc3RhdGljIGludCB4
ZV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAgCXhlLT5pbmZvLm1lZGlhX25h
bWUgPSBtZWRpYV9kZXNjID8gbWVkaWFfZGVzYy0+bmFtZSA6ICJub25lIjsNCj4gICAJeGUtPmlu
Zm8uaGFzX2xsYyA9IGRlc2MtPmhhc19sbGM7DQo+ICAgCXhlLT5pbmZvLmhhc19zcmlvdiA9IGRl
c2MtPmhhc19zcmlvdjsNCj4gLQl4ZS0+aW5mby5ieXBhc3NfbXRjZmcgPSBkZXNjLT5ieXBhc3Nf
bXRjZmc7DQo+ICsJeGUtPmluZm8uc2tpcF9tdGNmZyA9IGRlc2MtPnNraXBfbXRjZmc7DQo+ICAg
CXhlLT5pbmZvLnNraXBfcGNvZGUgPSBkZXNjLT5za2lwX3Bjb2RlOw0KPiAgIAl4ZS0+aW5mby5z
dXBwb3J0c19tbWlvX2V4dCA9IGRlc2MtPnN1cHBvcnRzX21taW9fZXh0Ow0KPiAgIAl4ZS0+aW5m
by50aWxlX21taW9fZXh0X3NpemUgPSBncmFwaGljc19kZXNjLT50aWxlX21taW9fZXh0X3NpemU7
DQoNCmZvciBib3RoIHBhdGNoZXMuDQoNClJldmlld2VkLWJ5OiBPZmlyIEJpdHRvbiA8b2JpdHRv
bkBoYWJhbmEuYWk+DQo=
