Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE9BE748E9
	for <intel-xe@archiver.kernel.org>; Sun,  1 Oct 2023 09:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D2810E059;
	Sun,  1 Oct 2023 09:01:00 +0000 (UTC)
Received: from cluster-e.mailcontrol.com (cluster-e.mailcontrol.com
 [85.115.58.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32C10E09C
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Oct 2023 09:00:36 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly64e.srv.mailcontrol.com (MailControl) with ESMTP id 39190Y9h037987
 for intel-xe@lists.freedesktop.org; Sun, 1 Oct 2023 10:00:34 +0100
Received: from rly64e.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 39190UVx037731 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 01 Oct 2023 10:00:34 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly64e.srv.mailcontrol.com (MailControl) id 39190Uos037573
 for intel-xe@lists.freedesktop.org; Sun, 1 Oct 2023 10:00:30 +0100
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by rly64e-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 39190O13037152 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 01 Oct 2023 10:00:29 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1K20ziEs0+atRLPTlYoaSTfQClApRLCQOYji+wDaNJjgffFoGogVlyo0bBj5lz+ty9oV9CF7v54tIW2fBA763JOrFXL9Hs7D2sV3OPdl3VLjHjaBcPeMhcwRQayKfco4RsAryTKTxwo/Si6r11XkBlw8hwQBGzaAwhwFnXbub4akgkaOgO6t8zUL0sTTR8QO2NyueVmd2y04UkVIt2BoPOE0kROrIq/B5Fa58QU+hwX46zvuebgy60BasmUP6GHyma11yzMgL+RYuz+jT9KcB8DKJdBS7eLacKA221mJuJmZqEubOBHq38EvYWgXylK/5eVTkTdbtDmzKT0vn5w4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOhO9D2pnVwHdKnt3/IZsDpIWWazQUv+qRdJBRqg0A8=;
 b=lqcz4JlqHsxRmIa50/6NvU0Ch5GgXW5qqEHsDB4CJXkMDVIsPp5uwKT/AoqzgbBQoXWi1vnkcDmvVVsJnRGqPfkE2wtUMHpLUyse6YBQW730uuPMK3z41C0nWj27qcNbdDMq9IdtGBH+eKjf4/zAf+2/H8VrRW5nL2Ubg3ozM4uBg4Lc2o2wp4IYoFEAhBLpcdr0q4lEnTpTJw57eR8JTMe//ftN2mDX8BEpD2noCNQ8qJJVMjAPDu3kl6/pBoLcBIXj3rM969dh9HNiek/grrzSrYtEis2rOlZ43H3ZXgAggzQi0ivtV5XWWR229fDBuRS5b+zET5n1Lirr6jLbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOhO9D2pnVwHdKnt3/IZsDpIWWazQUv+qRdJBRqg0A8=;
 b=O+LzuwsJghrmSP4JU4+HmWwH7yxfEuGRsQmqqX/TaMohfSlReTiGtSyie3R/ZqLQlrVW7rWdRopN22I8Tyu1OiC28/ZZiHPEbHLxGTRiOV7y9Hwu4/o/iQLSg2F56wT8T6AhbBuWbXSlpY16EmTRoOt12qANufyezC4pqgN2RZtsxvUOZmnYQLaMsDLwAfzKGpihwlF9v+NHVVoGBdoBy11O7myTK+GLVBFp0N8AhPHJ1Eqt6OQ8rUByH/alNjitvoL6r1XGqCdMVhwxhdDYHabWb4LcGKzJG3XoMrAQJGf+CB+ptc6eOtMvxHJuq+2DwJzrV+c8YPE7909w8O5MqQ==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AS8PR02MB9718.eurprd02.prod.outlook.com (2603:10a6:20b:5ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Sun, 1 Oct
 2023 09:00:21 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6813.027; Sun, 1 Oct 2023
 09:00:21 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, Tejas
 Upadhyay <tejas.upadhyay@intel.com>
Thread-Topic: [Intel-xe] [PATCH V4 0/2] drm/xe: Count and report low level
 driver errors
Thread-Index: AQHZ8U3ku0qXjtMGt0ernI0k6DiRg7AvTsGAgAVaDYA=
Date: Sun, 1 Oct 2023 09:00:21 +0000
Message-ID: <d31d9fe1-2000-0cc0-8466-0db0772354e1@habana.ai>
References: <20230927142919.272895-1-tejas.upadhyay@intel.com>
 <ZRS33TMbpsi63x1U@nvishwa1-DESK>
In-Reply-To: <ZRS33TMbpsi63x1U@nvishwa1-DESK>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AS8PR02MB9718:EE_
x-ms-office365-filtering-correlation-id: 8d7730b1-e033-4820-62be-08dbc25cd7d7
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tv4yxHXTQqR0JPXx0yuyfxihvl9lqFMxCWs0wDR4RkLbU7QSZG+SCnAe7z9nkHSu50N6uzUU8kqmF2/k32owFwuiR281TUennmkHcaMUHox80Fv5ogR1158uCMFhsHC+Zc9iXxYBPTqfG0L9MubtSC4+L/KlA2wDxAzEmB3GevhgGOYyWuK7G0OkOFYuHkEwf2YB7dtKEbADAKAGYxmsfQIJoQKErV2H6jNoU5PrOVsQ/ox3W3IbseZ+ra+SGrM/IXmbRYNAdCjxp4lhb8VCnl4GjIJoelLaVGZ67zSBCyR9cnyX/xBjtB2vePtT904E7mGfwIKyvyx8AtMAiqRwYlahqrotKnaslkBwG7mNTIbHUo3lxIZBhR1m9pDNMeudNJP2Ymqx8J+zWIBjJ9yj4r3KHgylZsVruXhC2Bqy4lxYcg6HwCacDxnppCle+4ffaAArYoLPmjQopFmy2HqMF12tRusYQlllRphx4D0fgJUvefjR3fIICw1IWAAmq4z667supXLdgYeQgL8/Q+euvEytm3FM6tY6r0AL6QldO8U1RVILgyOITZUnfHiyYFGbAj+S8jp6/W/f+CgXkQYyWHV+dXq4AK9AhOP9jNogV0A/FNSS1Dj5Z0WOQxCkwusJcq7A0+RYQIRiH2PHXDYCXl6aOq0ujhobsauiiNzwR30=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39850400004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(5660300002)(41300700001)(66556008)(316002)(26005)(2906002)(4326008)(91956017)(110136005)(64756008)(66476007)(76116006)(31686004)(6486002)(966005)(54906003)(66446008)(66946007)(8676002)(8936002)(478600001)(71200400001)(53546011)(6506007)(6512007)(36756003)(2616005)(83380400001)(38070700005)(31696002)(86362001)(122000001)(38100700002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VElFMmQ5d2NPQ2d0NE9jS1BURTY5SFFhVlJwVzAvTUx2RklheTd0bjl3eHZq?=
 =?utf-8?B?eUJwcWNiNnFFNEh1QWFqalR5SjBNUWZlMWxtb2JjUFlZWXh3bXNoZXV5RXEx?=
 =?utf-8?B?QmUzSnY0VFhPM3FZOTF2cVZ6aEpxVk5hMG1wbkVtMzdKck1lVWdLcjk3Q2E2?=
 =?utf-8?B?d3BjUUU5cXVsYjZNemFhdUx4TGxjcmQxMTdwNzdPSDBERTJaVjNiMWRZekVi?=
 =?utf-8?B?QlN5ZWlLN3VKR29zNXdLVEJlY0F6SDhhcEI5Rkl6cXJYeVgxazU1eE9Qdmx1?=
 =?utf-8?B?SzhueC95enBqWVNwZDk5MktGbmYxWXNBU2xWM3dHL1ZkU0tSRDFBdGVtRGdq?=
 =?utf-8?B?L1dLaU93UDFVSGdudVJuYmlwOTVMTXV5My84Q1dvQkdCRGZ6U1JMQ3RPZWE5?=
 =?utf-8?B?Y2xSN2crZ0FVS2VYWHh5cklCTFRtWWNPaWhSQ2t5TkZtUlBIbnE4WUJxZkNI?=
 =?utf-8?B?OFRaV3VqSzdRbkcwekQzUVB5emh3RmdpRlI1RXJ5NnN2VTVtbEtWNllsN0Rz?=
 =?utf-8?B?YzR3ZDgzSi9TcVJITHhtY3g1bzd1V3lnajJXL3E5ek5XK1V6MjVCSDgzNDJq?=
 =?utf-8?B?eDYwNzZNWXh6L1pDR2hZc2xMMXpWdmlSREFyTnlROXlvQVZxUzA5RzhqM2oz?=
 =?utf-8?B?aloxREl5K3E5UitOb3kwWmk4UHg3VDZRcXR5M1loMHRnYUVGN2dMc21NNThI?=
 =?utf-8?B?NVFWZWhtOEQveWVxZzlBWHhmSmlnbVVIeWtaZjRIaE5uR0tndkcxMm8rWS9D?=
 =?utf-8?B?RmJrOWJYU3VpVlpmSWU3bFN4aVFnMW9XeXNQVGdpQ0gvTzNKWEtxaU9BVVU1?=
 =?utf-8?B?eFlCTFh2VGN3bFpudlV3NisrQjd2KzloOHdOVG1sRm1GSFZJeWxJQk43ZEcv?=
 =?utf-8?B?MkwzbmJtKzdhaTlPOC9Vd1psWU5VV1FqYlhlV3FSZTFGcDZDL1JNRnQwR1FS?=
 =?utf-8?B?OVlrNURRM1E3MWhjaHNOenR2aGNyVjdXV2R6RDVhZmFacjRFbWVkY1NMNFFy?=
 =?utf-8?B?NzMvdUZLTU50bDNSaXdVcEJ0YTdPdXRFa0JabEYxN2NORVZ4U1ArcUM2VFQy?=
 =?utf-8?B?aUkzeXJpdjAvU0daSE9lS1F2WHIwNjZoMnhhaHh3MzZyYU9IMXozeFB0QjlX?=
 =?utf-8?B?c2w1QTMzSlFXSUZyNzNqZVhLaE1zdXBBOHZDNmlld0tPbFU0Q3MxOFU3ckRw?=
 =?utf-8?B?MEpYTEJUbzVNZm55bnBkUDNnWlZ6ekN2ZFhQS3Q1eHFoV1luTjFLS3BPVzhN?=
 =?utf-8?B?RVJLNGVtS3lYVkF1R3RmUS9CZWIzRk50a2h0SlRtQWtBRndyaEJzWThnc21R?=
 =?utf-8?B?a2R1Z1dQVXMzWmZEOHhiWDhybHg2R0E5VUZ3T285cTc3M2hBSzkrUDU1dG8v?=
 =?utf-8?B?TDNueitpaEJNWTFvWmp4MUN3TVJSd01xTENKcEk3azVlSFBkTVpVd21XT0Jm?=
 =?utf-8?B?cGJTTGZMczhMTHNWOUN0RmJYdXFKVllpWVdaaHBLM054S1hvcFdlNUZMV3Zy?=
 =?utf-8?B?bkhoL0kxOUwxaThqUS9saE9QbFAyVjJ3Q0RvaWR0b2dRUE9TVWdzcXBOMEsx?=
 =?utf-8?B?TnpoeDlPaU9oTUVBSUo3ZUhXUnhXUFdwWXVMRjdXeHJ5N1lRQy9xOUdhNWVC?=
 =?utf-8?B?WERzSEtCam9aSHFvYXRuR0R4OFEreGpTZFB2K0hKQmoyU0FiY3FGUVkzWVJ5?=
 =?utf-8?B?RGJaem05ZTZuNG5vbFJyUTlKSjlhRVAxT05XcUNKYXQyRGdVZEhjV2E2c2Iy?=
 =?utf-8?B?RjVJb2c1bEhNZ212M09ET1Jkb3ZHQ3l3Q29UTGNzNVhUeEFoWUhlMnc0d2JX?=
 =?utf-8?B?a21QM3FvS0U0UlZqUnBRL3JKbU5Ka3VxSENTUUtDQWRscU5SQVNBZjc4VVcv?=
 =?utf-8?B?TWorbElaNmtaeE5qK1dINEtDMEM4S0dZN045aVZtNHdVblRVbm02bkd3eDF0?=
 =?utf-8?B?Tnltd3dzSEdHMXl0TzdndVZKT0VqM0tkT054anpiVmt1V1ZKRGljTlpQSFhT?=
 =?utf-8?B?TlBQVnloaGhCdURDZlROY0RRNGljUUZVQ2NFRUNIelp6THFCTG4zRmJGck4z?=
 =?utf-8?B?UW1PU2RRQi9ka0VBN21jaDNSVGMydnViMXVGeXEyTit1VTNNRUd5OWtJUUdp?=
 =?utf-8?Q?C0uw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16DEF8EAFFFEB3418AE8AA386F50C757@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Zvcg5HgFZ2IBfLJuGgODojqW4I4wrcukEnInlemLc0W5bmUXO4Sm99+8FCkKlxo18CmUR97AAxdwAvHBRXP58dz0OnPD7pFKiofXdwEuYINfc3D4MiwxbcWqzZfaVMUu2GXiyCS247J8ltyffIFA3HT39J1uOMtn1sMPN8U+sfYL0mIFzQMqCGX1Lt6pcjDVZxU/wmTeSIVROGbV1oLaoYicoVD2WpFacim0/DyPshByNDO9nbVjQVs+kgfP11JWhUW/K5ciVY5pVPrTrvDAWXsbTXlw2/rdUD5t/GjHnzbHyYPFiyoNT3OW8k28iWMPsnALaHI/F8eoPT+HhFpTwmoFydIHgz6MKNfU7rRhp4ND9is4YO02yBi5WtBBzmY1NuDqf3Y3SqBXPMm+76hdE3wgidiHf/iwddHsAyafLBNOKkXvWKVqnt9r27KW+vuTIHf6W/7bLPs11CzbtGBiiAsC37yYF2k8KR3OkHg1bgqZXyOhfYm1ZAGToa1QY15AmGPDAvFGXwKohpUFUHfBBM9Na4TKS9cbw5gao5ScO7CEf7oni5hJBaT5LOue6AygXVSqs2YGr0VEPC3bWNEAUShk8LFyO8D+gREHcXjsMh+9kahhzQjNy3cYRMtoPwTpKfXhHmWNwjSqmG0LiSNJuYQi4kqWMGYlCSviIa0vlu2B1X40Wj3yGt9pfw6+aIZvEe3HCP7HE5XRVe9554HWwBgt3TOw0wU4V+L5U5ZXSxz4GMTJNWzkrUnEQBkt6GRjAMP6ZQcgSjzZYA5jETLWklJTmzq0JZzhFMsqO3+oROw=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7730b1-e033-4820-62be-08dbc25cd7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:00:21.7002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhucjphOJ/GCkxBOgMhJDcSg5lrs+5wPcnAoGb4IAR8EPXczBdDzX7hHfURgDr56URYfm+av1Ms32uY7jObxjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9718
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NjE1MDgzMzpGUEtleTEucHJpdjpmk9ivsdzmvpqhYwJNMsn7POpKSkiDFj+gV31L9gPnT2cpd3kJLBig4mV+Jj6vlNGoZ5N8DPWhsWX0A/u+qyK3nv9QcL/clWdf6KLfhvG6Rw3vgXZFFer4L456WBuig8eYWZ6JxW1jcdKL8W/6j8yCaSZAQcvU2sHZl4mBKh15fe0KI8XqY8Z1QHz/P4wyBAyUNGZ2To4LQxEr+HYs2nIkorr6b8P1cAoKmvanHuUJjez+xweL0LU2rT7ZEswKUVCuZayapuXWzyI0hAAVn0JU/5YUYm2SBmTD10BwIksde7r0up1ZxPc9nlOhPziYTEmxMU61H0iUp1hdJKkpa/Ln
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.12.52
X-Mailcontrol-Refers-To: 39190UVx037731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=oOhO9D2pnVwHdKnt3/IZsDpIWWazQUv+qRdJBRqg0A8=;
 b=qi/DqLtZhE67dTAysh3e8iV9ZFJq25cpEk5VfJKveOv8qTb5fNYGLgdVH8QQQoizZ4OsdAXLeKxr+pcCQR02ZWWumYoAUOwKajudVKTrwlb29gKBSwBmGtJCGma8bT31bfv3b4Xzt34a4RqHzF9Fvz5mKS7wAb0Opjc6FrCxf+1tpKgvIWVC53AVk1+lduxjMjU4pE1+BcDYfF6x88ruakLgdL2g7xcwfI+AaD8T2qirFXhcsw02pMI2oIIT7U9/WfE0SQHJLXOaaUThEUDsQgoyvYMzA8IrYuhaKV3Jd/Wlrogb6okSe9ZLeF818pXD6pZsiIO8O0/PcCk4bFIYzQ==
Subject: Re: [Intel-xe] [PATCH V4 0/2] drm/xe: Count and report low level
 driver errors
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMjgvMDkvMjAyMyAyOjE2LCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOg0KPiBP
biBXZWQsIFNlcCAyNywgMjAyMyBhdCAwNzo1OToxN1BNICswNTMwLCBUZWphcyBVcGFkaHlheSB3
cm90ZToNCj4+IFRoaXMgc2VyaWVzIGFkZHMgbG93IGxldmVsIGRyaXZlciBlcnJvciBjb3VudGVy
LiBEZXZpZGVkDQo+PiBpbnRvIGJlbG93IHBhdGNoZXM6DQo+PiAxLiBBZGQgQVBJcyB0byBjb3Vu
dCBkaWZmZXJlbnQgY2F0ZWdvcnkgb2YgZXJyb3JzIHVuZGVyIFRpbGUgYW5kIEdUDQo+PiAyLiBB
ZGQgY291bnRlciBpbmNyZW1lbnQgYXQgYWxsIGV4aXN0aW5nIGVycm9yIHRhcCBwb2ludHMNCj4+
DQo+PiBGb2N1cyBpcyBub3QgdG8gYWRkIG5ldyBlcnJvciBjaGVja3MgYnV0IG1haW50YWluIGNv
dW50ZXIgZm9yIGVycm9ycw0KPj4gb24gZXhpc3RpbmcgZXJyb3JzIHdoaWNoIGNhbiBjcmVhdGUg
cGVyZm9ybWFuY2UgaW1wYWN0Lg0KPj4NCj4+IFRPRE86IExhdGVyIG9uIHdoZW4gbmV0bGluayBp
bnRlcmZhY2UgaXMgcmVhZHksIHdlIHdpbGwgZXhwb3J0IHRoZXNlDQo+PiBjb3VudGVycyB0aHJv
dWdoIG5ldGxpbmsgaW50ZXJmYWNlLg0KPj4NCj4gDQo+IEkgYW0gbm90IHN1cmUgaWYgdGhpcyBp
cyBhIGdvb2QgaWRlYS4NCj4gQXJlbid0IHdlIG1ha2luZyBpdCBraW5kIG9mIHVhcGk/IFVzZXIg
Y2FuIGFsc28gZ2V0IHRoaXMgaW5mb3JtYXRpb24NCj4gZnJvbSBkbWVzZy4gQmVzaWRlcyB3ZSBj
YW4gYWRkIHRyYWNlIGV2ZW50cyBpZiByZXF1aXJlZC4NCj4gSXMgdGhlcmUgYW55IHByaW9yIGRp
c2N1c3Npb24gb2YgdGhpcyBkZXNpZ24gd2hpY2ggeW91IGNhbiBwb2ludA0KPiBtZSB0bz8NCj4g
DQo+IE5pcmFuamFuYQ0KPiANCj4+IFRlamFzIFVwYWRoeWF5ICgyKToNCj4+IMKgZHJtL3hlOiBJ
bnRyb2R1Y2UgbG93IGxldmVsIGRyaXZlciBlcnJvciBjb3VudGluZyBBUElzDQo+PiDCoGRybS94
ZTogVXBkYXRlIGNvdW50ZXIgZm9yIGxvdyBsZXZlbCBkcml2ZXIgZXJyb3JzDQo+Pg0KPj4gZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5owqDCoMKgwqDCoMKgwqAgfMKgIDkgKysr
KysNCj4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDE4ICsrKysrKysrKw0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrDQo+PiBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jIHwgMTUgKysrKystLQ0KPj4gZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAgKysr
KysNCj4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTUgKysrKy0tLQ0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MyArKysrKysrKysrKystLS0tLS0tLQ0KPj4g
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxNiArKysrKy0tLQ0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuY8KgwqDC
oMKgwqDCoMKgwqDCoCB8IDQ0ICsrKysrKysrKysrKysrKy0tLS0tLQ0KPj4gZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2lycS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKyst
DQo+PiBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDE5ICsrKysrKy0tLQ0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE4ICsrKysrKysrKw0KPj4gZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RpbGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArDQo+
PiAxMyBmaWxlcyBjaGFuZ2VkLCAxNjUgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gLS0gDQo+PiAyLjI1LjENCj4+DQoNCkluc3RlYWQgb2YgZGVmaW5pbmcgYSBuZXcgdWFw
aSB3ZSBjYW4gZXhwb3NlIHRob3NlIGNvdW50ZXJzIHRocm91Z2ggYSANCmRlYnVnZnMgaW9jdGws
IHlvdSBjYW4gc2VlIHRoZSBkaXNjdXNzaW9uIGhlcmU6DQpodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvNTU2Mjc4Lz9zZXJpZXM9MTIzNDAzJnJldj0xDQoNCkFub3RoZXIg
b3B0aW9uIGlzIHRvIGNyZWF0ZSBhIG5ldyBkZWJ1Z2ZzIG5vZGUgZm9yIGR1bXBpbmcgdGhlIGNv
dW50ZXJzLA0KYXMgbG9uZyBhcyB0aGVyZSBpcyBubyBhY3R1YWwgbmVjZXNzaXR5IGZvciB0aGUg
VU1EIHRvIHJlYWQgdGhvc2UgY291bnRlcnMuDQoNCi0tDQpPZmlyDQo=
