Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613A0CDB47E
	for <intel-xe@archiver.kernel.org>; Sun, 15 Oct 2023 12:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F90F10E055;
	Sun, 15 Oct 2023 12:36:36 +0000 (UTC)
Received: from cluster-e.mailcontrol.com (cluster-e.mailcontrol.com
 [85.115.58.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FD010E055
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Oct 2023 12:36:32 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly66e.srv.mailcontrol.com (MailControl) with ESMTP id 39FCaUw1030564
 for intel-xe@lists.freedesktop.org; Sun, 15 Oct 2023 13:36:30 +0100
Received: from rly66e.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 39FCaRbb030091 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 15 Oct 2023 13:36:30 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly66e.srv.mailcontrol.com (MailControl) id 39FCaMuo029462
 for intel-xe@lists.freedesktop.org; Sun, 15 Oct 2023 13:36:22 +0100
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by rly66e-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 39FCaKRH029216 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 15 Oct 2023 13:36:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWTax5QDHFcN6mkrkUeh4bP59EYSAtLYgRlOpAaFapIJfh4CynmvDn/oLUbLemAsCcIhJgOeokfStG6GurUBCEp1S1XnCcoprn0Zb+W1oIvDDyS1+FgUviryZ0mobblsJ7i9nDRY1zv2j/XcbyC99eMuxx+KNMZnhTCI6CM7Kp678v7vJlGw5XjUClqk3jcXhPjS0RGULitzzQsPJzcheYKxMCa6nfguhoomVTF4akXcnZu1DXiMsyCIClKnwOupOy8DYumUGTE/DOjq+/JqRz16Y5i2a0LCBPVrcNvIOA8MxEV4dZfPbOmFsihnpESbQEFS2CZz4h/VsS4Lui7U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsnGND8nJSpYuN6e5BtEnigc0P3YDFoZwYW4nemj/ug=;
 b=JN8GKCJRJbnXO4nEHHJf4txfmyaWnOjGybG9FtAan3oTZ1VGHkVZJ5aNKz8SsCl3WgMBsvscgDKRtozCghdPDTHoL/qKgBfBwl4YWUB2HHnL71MWJtOlG8FVwfKml/09FWNsHWDZu54viLL7mz8XwqEcGXdWJMZvmrMt89cS2wM99yL91DK4jvhIqj70NL729mMl6jYylu8+nTL9fQGR2X09IfVujcQT5Z/LZ4DBTcbCo1BZFTRq0U/hYnC6kySwsXYGU+1NUQ4EmI0O53ThlX+w2D1ObDwijN38MYGPatHvtWzk6OP4Wvjzey1H20k7PGhenuTKYpXIaRUzpBcT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsnGND8nJSpYuN6e5BtEnigc0P3YDFoZwYW4nemj/ug=;
 b=b1xER24lbdW9pzxHu7RZk6PLp/pK8X+z2SEPwzDIiYG5hl0ahkvNl517Ql9mfbI8nm2DAeInOwogT7CByneZJ+qQUOzJ8C/L9Rens15Z5wkLJJaEkc6ZLFMnoLz7eCUkU5mcX9HLqoExx04IxxCUarE+799dICLjplA7pqMv7AUHpcBv9q1pw3JZ06CWxJJNSnzYj9c+baxBVvs1pkBGl5ICceAuGG5vhtMbS/dIIYPI18Wl519hZeBs0f+DUsc5sMcrrnzhf1ZPuPPpXfLPaZyUZZaW0Jd9EZLKuGx5M595raCzzLmO4nkbCCBfId9zE3Kzk7FKnM7iPproxkfWag==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DB9PR02MB8022.eurprd02.prod.outlook.com (2603:10a6:10:372::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sun, 15 Oct
 2023 12:36:19 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 12:36:19 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Koby Elbaz <kelbaz@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: add has_pcode flag
Thread-Index: AQHZ/2JkDZej6UEzGUmkk9FDUxRY6LBKyZ4A
Date: Sun, 15 Oct 2023 12:36:18 +0000
Message-ID: <8838542b-8f79-47c3-9c4d-9aaab1539cf1@habana.ai>
References: <20231015122307.1191684-1-kelbaz@habana.ai>
In-Reply-To: <20231015122307.1191684-1-kelbaz@habana.ai>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|DB9PR02MB8022:EE_
x-ms-office365-filtering-correlation-id: 6297296b-7ede-4e7b-7688-08dbcd7b54a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HPvxwOGBDOGOazf+m2jwGElueYKhiKDpOOuQAoLogsT+bI/iFcU70dm/R6Qsgx1PXk54XLv3bQOnGn6M2p78qnoMlAXN1gUth1YMz7QHSNSI6zCEzORjeG2JC1udGm6jcY/R43D0l7sy3rlVWLF3/5DbCw0So8waEzzgUUJSL1Ih4vaRx7FreruShHuJdnsMuoSzav3r068G/kgDZmmlrr4uUSPOHpgUpdfZO7h4/850DG5CmAgD0B1FIyAe24VD6fvwdqDgq9hi5b+72vgJc3KkwfDJO8UAWB6oh4LIN2PjmNBwYrn/nMblByk2yNdPO9kpdhK/+3r1+YxYOBzOAOMSEhpNRqKHccrDzujPe8UGXualSDgMEq97k/KS+mgTD3NwxiROy4c4fsEp7/Y7C0U1KK1rYSvVFTGnJDY+zQnfuCWIZB2mWL4e0jOZHlIHEY1XZAfNYf6R1mWk6GVlFTBqxNaI12OC7cQgLp2X7+e8pgSfHyQaAjyn1wbhJsdg4LBv+VvFqaDVBVxbvU8SU8mqIQvRp5Crb2VlMgIwf/SJ903cu9a6cCNwlLoUDn0KbWFCIlP3SaFQvMDQbSGVv9p+KlTXpDy9toMISXh8orrFTreUUcn9YzTEx9m2U//oj2NBrkDoa0gogcOlvnoVfDTriZHEbY1A++bwNQa4LKOFDhDUtB2RYq8eJnsNg1LB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39850400004)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(71200400001)(31696002)(6486002)(478600001)(2906002)(41300700001)(8936002)(5660300002)(8676002)(64756008)(76116006)(316002)(91956017)(66446008)(110136005)(66476007)(66556008)(36756003)(83380400001)(66946007)(26005)(82960400001)(6506007)(31686004)(2616005)(38070700005)(6512007)(122000001)(38100700002)(53546011)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW5rT1BwKzYwVjdOZ3BzcGtLUWRzR01zcmVOWTZ6OE9TTU02eEp0Y0NldFVE?=
 =?utf-8?B?d2dwa25kY3Q0TkM5TzJXVXBxU1Q1bGZ4UGhwVEltWnBsTEU0Nm1yQ2ZJTW1u?=
 =?utf-8?B?NXRSRHkvVjN6cWU5TmRaWkxNaXhoUmNvWnRjRjkxWHBtYit5QnR4RnBZQ3V5?=
 =?utf-8?B?R1dwZG03Z0RydC95NDlJWUYzdDZOS2wrMytlU2hrcVJ5d0hPYS9PTEMyZWVu?=
 =?utf-8?B?U2hKOUZma3F3UG82QWQyRXY1YjNEdmtwdVdRb3Q4M21DRDBjSWpua2MzTk5D?=
 =?utf-8?B?ektiZUVrajhVNDhNajNJMklNVGVHeWdLSmlFNHZnNUVzbmkzbVBtQVFhWThl?=
 =?utf-8?B?Ujk0TzhYZkJ0WldTYTBQMnZaSmhxUUZpbVZVNkVuTWIyVGt5TlZvaWxXK29W?=
 =?utf-8?B?SkFvUmNGUTZwUGpKWUNEU3JXdDFPWnRTeU52TGpOb2hPVERQOXNlYUpQa3dj?=
 =?utf-8?B?L2tOd0phdkd0clkrRUNVN2VKSHZkMDNPSkxjL3VCSTNoUEdCNEt3YjNFNDk0?=
 =?utf-8?B?d252S2xqanVIMUl3R2EwczdFRFIvVW9McVMrRXZaNHJUcXpkOHhjcEVPNkM1?=
 =?utf-8?B?T0hvYlA4YWswR2VNdDFza0NQT1lpWDJ1cUh0bGc4WVVYWVUzaGJmQUpTaTNC?=
 =?utf-8?B?ZGF6bGxwbytmcW1IREt0L3JnTUE4dFdrMEJOT3MveEtGSU0rVnVlbnRYdW9G?=
 =?utf-8?B?azI5cGdyOFZSdzZtNDc5QmtJb1RrbzhJY3JPLzluT1pXcHhTWXdtaHRGYXNX?=
 =?utf-8?B?NDQwQlVnT1VhN3NxM3MzTUFuanBISS9Jcy9TYkJRMVlFdzNYOFJEZXRXajd5?=
 =?utf-8?B?cUl1aGFJNjc0WjY1UmhNMWg1c0tDRkhtYjkrcWtXbUpybHFrODN1ZGRmUnp1?=
 =?utf-8?B?WExNTFJYZnlCdFRkLzhSRkhxZS8wV2lZNzBpOVBFLzF2WE5ITUZLZUFXY3pH?=
 =?utf-8?B?cFI1TFE3MW8rQk9LaFpBTEtHTi9BTTZNS0ZRSkR1cGQyRGt2RitDL1dML2hP?=
 =?utf-8?B?N3d3VS9vUURYL2RGSUx2c014T1RxY2N0RjNmUFlBWER1VzdSZjh6RnBydXhT?=
 =?utf-8?B?V0djVGJlN1pyVWpJWWtGSnMwUGtMeWhzVm00U2YvUW1md2s2UGpzcjFzMlJv?=
 =?utf-8?B?bDdRTk9jN0cyb3lRaWJTdThaTjg1NU1VdWw0UnEvWk5YL2xibzNzQlhHMDU5?=
 =?utf-8?B?allpSTgra3NzQTJYK2pNbVU1Snl5ZFUwdEhqS1R0QWs2UEw1THV2SDdvQnpr?=
 =?utf-8?B?am1uM1ozSzVhbTdSbkNzanl2SFZyNWZVTWx6N01oRUNsQkVaWUF5MnVLTkNF?=
 =?utf-8?B?UWdOcCtUL3dLUmtxNW92THNQa214OGZON0JPc1JkY0tDZlRaaitPNTRFQVMz?=
 =?utf-8?B?UGI0cGJ2dTVXSDJlYUthMzhwejhDZWtSUmI2aHpTM0N0ZjUxSmZXdFBvNHNo?=
 =?utf-8?B?VG9na21DbXNoa1NlT2RoclI1MThNMDIrYlp3WGFBRmZ4SHY4V0RLdFRCNkVy?=
 =?utf-8?B?aTI2S1RRN2FnUSt1L3pzdytYNW5Zak0yb1VkMDRySFlJWUNPUWU5WFY4b3JI?=
 =?utf-8?B?c0VyQjdCaG1nUEMxRGF1Nkd1akFwWjVtVzRZeDZCZTIwV00xemdGbCsrWjlx?=
 =?utf-8?B?eDdUTHlzdVhuSGFJZFpaWDFWd2I2VEU4V1k5a0gzSUhDRDdDaE83U21QRXg2?=
 =?utf-8?B?NnR6TVAzODRocHAvbnhkL3I3cDdCWkdRRFcvZnpaQXBRNjFSYjlwRmJveWI5?=
 =?utf-8?B?ZVRwQVhibThpNFRJQTB1OHBJS2M3VVNwTGNUdUZaZjMwYk9MY0YyWkUvNUNo?=
 =?utf-8?B?RW56a3BiSXJrVHhOS1U5T1dNNG5XMTMzTGI1ZFVKT3NzbmNYOGRzd2hwNjlR?=
 =?utf-8?B?cE1KRFZENFpVbE9icmM5M29yZm1TNjZoR2I1N3pDS0p3cXZuTEd2UUExeHhH?=
 =?utf-8?B?ZjVTQ1BaNkg0OVlhVThSNnFpZld0MXJjQ1VQdTFTeCs3OVdJSjF0VUdKb1Fs?=
 =?utf-8?B?T3UxOTNnbHIwL2NhSmtRTnFEUjB0cG5GSGZzY05KWENFL1RDMWFQT0pvbjdF?=
 =?utf-8?B?dHRWNTRqVnl0ZkJ6SnNNendrVlRJdTR5UmVBa1AwZ2lSTFlJR1hibDhSc1M4?=
 =?utf-8?Q?1cXQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA0B4C0EBFCF864B8C1B8B0628B4A9D9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gZwiQqyBJ2sTnXghd53w/rFXdxHDDoQhTUVQAvrKZEs6mKaFNP96+uiZVUx0ZfUzi4nVCJr6nmEtrQG38eOKW3NG4shSu5TA2rY4eg2I0BlzYl/zdWB6e853k468RSNEoXqS7M3mzDHpxrA+E7KXZlmu6sudNaO+o9YVYcQ120B3X7d0LfYEKTtJOtY9eKFf5R7nLJ/wg1UQa+vjtrpQ0W+AaNCmN7WHvoKgpkCh29wLy9sVSvOOUEktHZh1GgqmJbku31aD71uz5TzEO7D1oq5yNxXkLnD66xRRi8B+v0C46qOfrkaz3T6SKa+4zLGvUO5UCrfy3HMw9HyniXEUmLz+70FYfikx38r1mJlLuFaUHEy+VGB56HWKAAqJBwsQxzMQ/B7xkhUSjJngm8TugMbZ0ZdCP2mDFfBqaKiQP2uYWoaMaJqHPg1uVYPy6EFd92Q01FwaaQzX4B1BSTLz/tg7E5crBBlsDj5qk89J3RHY0AheU1/M+a8ki4Gl8+QnyF8trVJw8AyDP01gnf5Jawgvxsu3+Cp54yyQUfXxDUTtKpKcNfgPxZWpR2k/+zWnbCCgE2RYISJ5/B6sYqwM34l0tiivieogWf0t6zQ05RHrH57p1cPrcztioxzJalhAOvAYlv2/5QJ9mfeeGQGmRjnb5fYLP7OunYyxifhCFEri9tMSfc5vTzxescd7NUDu2BRPiNvyFheJ3SEmxvMYFBtpeYg9l4Q+JUbMLtwQhHN7ilx9zxI6qFkBAv1sEJINZMS5TIw3kq11HThqKdnrTjxlHygSX0BUx0C9kspsigrPQ7MEsas8P//ALt90UcGN
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6297296b-7ede-4e7b-7688-08dbcd7b54a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2023 12:36:18.7668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gvy3DrWIdjX73NGsdexFYXx+MbMnciEy6H0Yj9sUdzXnTOLcJHj9BBNZa7pGpvk0SCT5t2q68Hx0FrDmGtlkGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8022
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NzM3MzM4ODpGUEtleTEucHJpdjqQbAUUPwjv5ovN4uciqLcRx/NiIMCBhnJK4xj4TtMdk5pxqBc9/idWh77xVMwig9Jd9urMdSipdiY06jWaoM0PejO2sDxBO5efkpwYAWcbaKUPfKsvfp5IvN1b+8i+/uDV7yiXQFvlQiL2HFb/WLRSsZ3cGVfvCZDxRP8XyyqG+wtdnfWQJjHksXypjSQp7DLdPj4ApLxFk73/vcOJ9J1YLJh0Kt2/kWPbN5hnsMIvHFCB4fj0SDdDRleVTGiDst4aLoE0Fw6B+/bCKS6E5d6awRYjoH1UURyNHNsTnjzo9rin4ckPW2fraOuObVARv05GnrxnY7nx3Lnv2KkwKIqF
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.18.104
X-Mailcontrol-Refers-To: 39FCaRbb030091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=IsnGND8nJSpYuN6e5BtEnigc0P3YDFoZwYW4nemj/ug=;
 b=VyISm1Kyafl5fGKq1RTKQWH7L5bEJzsYwh2q5vXN2BbX1tXI7RmWaSq/78DlJSX16DsY8VS0CsD+XKYGhKQj1meUswjtZzgQzydNUps7hRGbePV6CxUzK1e5+ZiChpzpx/1kZG+uViT+pOyGWJX6cqrakw36BysQGWQzG2rJjB7IzoxQwjktr/Aa3DqMFAOjWn3AGnesRwmWO1a/IgRoS+5H3i/iy51z/rEQdhuYmevBRP+ZA7DW1UjDxW+8gns1EQeu/jLbEpXEVC6245zic7H3t3wGPrUB0S3Y9UsA/16iUQRm4Xy5DschLgmqspHbw+kSpHi48MPGkmzv9isQSg==
Subject: Re: [Intel-xe] [PATCH] drm/xe: add has_pcode flag
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

T24gMTUvMTAvMjAyMyAxNToyMywgS29ieSBFbGJheiB3cm90ZToNCj4gUGVyIGRldmljZSwgdGhp
cyBmbGFnIGluZGljYXRlcyB3aGV0aGVyIFBDT0RFIHVDIGV4aXN0cy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEtvYnkgRWxiYXogPGtlbGJhekBoYWJhbmEuYWk+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8ICAyICsrDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaS5jICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY29kZS5jICAgICAgICB8ICA5ICsrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hh
bmdlZCwgMjQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2VfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaA0KPiBpbmRleCBiYzM3NWRkZGE1YTcuLjhlMzI3NjczYzA1YyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBAQCAtMjU3LDYgKzI1Nyw4IEBAIHN0cnVjdCB4
ZV9kZXZpY2Ugew0KPiAgIAkJdTggYnlwYXNzX210Y2ZnOjE7DQo+ICAgCQkvKiogQHN1cHBvcnRz
X21taW9fZXh0OiBzdXBwb3J0cyBNTUlPIGV4dGVuc2lvbi9zICovDQo+ICAgCQl1OCBzdXBwb3J0
c19tbWlvX2V4dDoxOw0KPiArCQkvKiogQGhhc19wY29kZTogZGV2aWNlIGhhcyBhIFBDT0RFIHVD
ICovDQo+ICsJCXU4IGhhc19wY29kZToxOw0KPiAgIA0KPiAgICNpZiBJU19FTkFCTEVEKENPTkZJ
R19EUk1fWEVfRElTUExBWSkNCj4gICAJCXN0cnVjdCB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGNpLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gaW5k
ZXggOTljY2VlMDdmOGNkLi4yYWFjMGY0ZGY1MGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4g
QEAgLTYxLDYgKzYxLDcgQEAgc3RydWN0IHhlX2RldmljZV9kZXNjIHsNCj4gICAJdTggaGFzX2xs
YzoxOw0KPiAgIAl1OCBieXBhc3NfbXRjZmc6MTsNCj4gICAJdTggc3VwcG9ydHNfbW1pb19leHQ6
MTsNCj4gKwl1OCBoYXNfcGNvZGU6MTsNCj4gICB9Ow0KPiAgIA0KPiAgIF9fZGlhZ19wdXNoKCk7
DQo+IEBAIC0yMTIsNiArMjEzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVz
YyB0Z2xfZGVzYyA9IHsNCj4gICAJLmhhc19kaXNwbGF5ID0gdHJ1ZSwNCj4gICAJLmhhc19sbGMg
PSB0cnVlLA0KPiAgIAkucmVxdWlyZV9mb3JjZV9wcm9iZSA9IHRydWUsDQo+ICsJLmhhc19wY29k
ZSA9IHRydWUsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2Rldmlj
ZV9kZXNjIHJrbF9kZXNjID0gew0KPiBAQCAtMjIxLDYgKzIyMyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgcmtsX2Rlc2MgPSB7DQo+ICAgCS5oYXNfZGlzcGxheSA9IHRy
dWUsDQo+ICAgCS5oYXNfbGxjID0gdHJ1ZSwNCj4gICAJLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0
cnVlLA0KPiArCS5oYXNfcGNvZGUgPSB0cnVlLA0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIGNv
bnN0IHUxNiBhZGxzX3JwbHNfaWRzW10gPSB7IFhFX1JQTFNfSURTKE5PUCksIDAgfTsNCj4gQEAg
LTIzNiw2ICsyMzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGFkbF9z
X2Rlc2MgPSB7DQo+ICAgCQl7IFhFX1NVQlBMQVRGT1JNX0FMREVSTEFLRV9TX1JQTFMsICJSUExT
IiwgYWRsc19ycGxzX2lkcyB9LA0KPiAgIAkJe30sDQo+ICAgCX0sDQo+ICsJLmhhc19wY29kZSA9
IHRydWUsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3QgdTE2IGFkbHBfcnBsdV9pZHNb
XSA9IHsgWEVfUlBMVV9JRFMoTk9QKSwgMCB9Ow0KPiBAQCAtMjUxLDYgKzI1NSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgYWRsX3BfZGVzYyA9IHsNCj4gICAJCXsgWEVf
U1VCUExBVEZPUk1fQUxERVJMQUtFX1BfUlBMVSwgIlJQTFUiLCBhZGxwX3JwbHVfaWRzIH0sDQo+
ICAgCQl7fSwNCj4gICAJfSwNCj4gKwkuaGFzX3Bjb2RlID0gdHJ1ZSwNCj4gICB9Ow0KPiAgIA0K
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgYWRsX25fZGVzYyA9IHsNCj4g
QEAgLTI2MCw2ICsyNjUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGFk
bF9uX2Rlc2MgPSB7DQo+ICAgCS5oYXNfZGlzcGxheSA9IHRydWUsDQo+ICAgCS5oYXNfbGxjID0g
dHJ1ZSwNCj4gICAJLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0cnVlLA0KPiArCS5oYXNfcGNvZGUg
PSB0cnVlLA0KPiAgIH07DQo+ICAgDQo+ICAgI2RlZmluZSBER0ZYX0ZFQVRVUkVTIFwNCj4gQEAg
LTI3Miw2ICsyNzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGRnMV9k
ZXNjID0gew0KPiAgIAlQTEFURk9STShYRV9ERzEpLA0KPiAgIAkuaGFzX2Rpc3BsYXkgPSB0cnVl
LA0KPiAgIAkucmVxdWlyZV9mb3JjZV9wcm9iZSA9IHRydWUsDQo+ICsJLmhhc19wY29kZSA9IHRy
dWUsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3QgdTE2IGRnMl9nMTBfaWRzW10gPSB7
IFhFX0RHMl9HMTBfSURTKE5PUCksIFhFX0FUU19NMTUwX0lEUyhOT1ApLCAwIH07DQo+IEBAIC0y
OTUsNiArMzAyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBhdHNfbV9k
ZXNjID0gew0KPiAgIA0KPiAgIAlERzJfRkVBVFVSRVMsDQo+ICAgCS5oYXNfZGlzcGxheSA9IGZh
bHNlLA0KPiArCS5oYXNfcGNvZGUgPSB0cnVlLA0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBkZzJfZGVzYyA9IHsNCj4gQEAgLTMwNCw2ICszMTIs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIGRnMl9kZXNjID0gew0KPiAg
IA0KPiAgIAlERzJfRkVBVFVSRVMsDQo+ICAgCS5oYXNfZGlzcGxheSA9IHRydWUsDQo+ICsJLmhh
c19wY29kZSA9IHRydWUsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHhl
X2RldmljZV9kZXNjIHB2Y19kZXNjID0gew0KPiBAQCAtMzEyLDYgKzMyMSw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgcHZjX2Rlc2MgPSB7DQo+ICAgCVBMQVRGT1JNKFhF
X1BWQyksDQo+ICAgCS5oYXNfZGlzcGxheSA9IGZhbHNlLA0KPiAgIAkucmVxdWlyZV9mb3JjZV9w
cm9iZSA9IHRydWUsDQo+ICsJLmhhc19wY29kZSA9IHRydWUsDQo+ICAgfTsNCj4gICANCj4gICBz
dGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIG10bF9kZXNjID0gew0KPiBAQCAtMzE5
LDExICszMjksMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBtdGxfZGVz
YyA9IHsNCj4gICAJLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0cnVlLA0KPiAgIAlQTEFURk9STShY
RV9NRVRFT1JMQUtFKSwNCj4gICAJLmhhc19kaXNwbGF5ID0gdHJ1ZSwNCj4gKwkuaGFzX3Bjb2Rl
ID0gdHJ1ZSwNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNl
X2Rlc2MgbG5sX2Rlc2MgPSB7DQo+ICAgCVBMQVRGT1JNKFhFX0xVTkFSTEFLRSksDQo+ICAgCS5y
ZXF1aXJlX2ZvcmNlX3Byb2JlID0gdHJ1ZSwNCj4gKwkuaGFzX3Bjb2RlID0gdHJ1ZSwNCj4gICB9
Ow0KPiAgIA0KPiAgICN1bmRlZiBQTEFURk9STQ0KPiBAQCAtNTc2LDYgKzU4OCw3IEBAIHN0YXRp
YyBpbnQgeGVfaW5mb19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgIAl4ZS0+aW5mby5i
eXBhc3NfbXRjZmcgPSBkZXNjLT5ieXBhc3NfbXRjZmc7DQo+ICAgCXhlLT5pbmZvLnN1cHBvcnRz
X21taW9fZXh0ID0gZGVzYy0+c3VwcG9ydHNfbW1pb19leHQ7DQo+ICAgCXhlLT5pbmZvLnRpbGVf
bW1pb19leHRfc2l6ZSA9IGdyYXBoaWNzX2Rlc2MtPnRpbGVfbW1pb19leHRfc2l6ZTsNCj4gKwl4
ZS0+aW5mby5oYXNfcGNvZGUgPSBkZXNjLT5oYXNfcGNvZGU7DQo+ICAgDQo+ICAgCXhlLT5pbmZv
LmRtYV9tYXNrX3NpemUgPSBncmFwaGljc19kZXNjLT5kbWFfbWFza19zaXplOw0KPiAgIAl4ZS0+
aW5mby52cmFtX2ZsYWdzID0gZ3JhcGhpY3NfZGVzYy0+dnJhbV9mbGFnczsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY29kZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3Bjb2RlLmMNCj4gaW5kZXggNGEyNDBhY2Y3NjI1Li5kODk1Y2IxZTE2YzcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY29kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wY29kZS5jDQo+IEBAIC02MSw2ICs2MSw5IEBAIHN0YXRpYyBpbnQgcGNvZGVfbWFp
bGJveF9ydyhzdHJ1Y3QgeGVfZ3QgKmd0LCB1MzIgbWJveCwgdTMyICpkYXRhMCwgdTMyICpkYXRh
MSwNCj4gICB7DQo+ICAgCWludCBlcnI7DQo+ICAgDQo+ICsJaWYgKCFndF90b194ZShndCktPmlu
Zm8uaGFzX3Bjb2RlKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiAgIAlsb2NrZGVwX2Fzc2VydF9o
ZWxkKCZndC0+cGNvZGUubG9jayk7DQo+ICAgDQo+ICAgCWlmICgoeGVfbW1pb19yZWFkMzIoZ3Qs
IFBDT0RFX01BSUxCT1gpICYgUENPREVfUkVBRFkpICE9IDApDQo+IEBAIC0yNDksNiArMjUyLDkg
QEAgaW50IHhlX3Bjb2RlX2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gICAJaW50IHRpbWVvdXRf
dXMgPSAxODAwMDAwMDA7IC8qIDMgbWluICovDQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICsJaWYg
KCFndF90b194ZShndCktPmluZm8uaGFzX3Bjb2RlKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiAg
IAlpZiAoIUlTX0RHRlgoZ3RfdG9feGUoZ3QpKSkNCj4gICAJCXJldHVybiAwOw0KPiAgIA0KPiBA
QCAtMjgwLDYgKzI4Niw5IEBAIGludCB4ZV9wY29kZV9wcm9iZShzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiAgIHsNCj4gICAJZHJtbV9tdXRleF9pbml0KCZndF90b194ZShndCktPmRybSwgJmd0LT5wY29k
ZS5sb2NrKTsNCj4gICANCj4gKwlpZiAoIWd0X3RvX3hlKGd0KS0+aW5mby5oYXNfcGNvZGUpDQo+
ICsJCXJldHVybiAwOw0KPiArDQo+ICAgCWlmICghSVNfREdGWChndF90b194ZShndCkpKQ0KPiAg
IAkJcmV0dXJuIDA7DQo+ICAgDQoNClJldmlld2VkLWJ5OiBPZmlyIEJpdHRvbiA8b2JpdHRvbkBo
YWJhbmEuYWk+DQo=
