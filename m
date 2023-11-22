Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1FCC61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 17:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A42310E09D;
	Wed, 22 Nov 2023 17:19:46 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B52310E09D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 17:19:44 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly17d.srv.mailcontrol.com (MailControl) with ESMTP id 3AMHJber103178;
 Wed, 22 Nov 2023 17:19:37 GMT
Received: from rly17d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender osharabi@habana.ai) (MIMEDefang) with ESMTP id
 3AMHJYSF102225
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:19:37 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) id 3AMHJV5T101020;
 Wed, 22 Nov 2023 17:19:31 GMT
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by rly17d-eth0.srv.mailcontrol.com (envelope-sender osharabi@habana.ai)
 (MIMEDefang) with ESMTP id 3AMHJS0p100405
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:19:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acCn0IFdBk5gtaZt2u3jC0/8Stt8RpNfgmxinQJV4QkOMuPlAdZy0wZzypxj+8XeKPYxA3+Zhn7c/arW7u0qwxnaWgOlj/u6RSuT960rGxlCvKTEL4kdkFyUbRoeu+hvxvduz8q6x/KCjtdsTYBTzQreV43idF6fzYxP2FbqzAG2Cpzt7aHRyUyns+u3uQR1NbkU+d8htlwk/CXkKxXYAZeyD31mCEy6KYJOn87/2HjOVBo3ItBoWVFfMcWG6nlYwzlSTJkpCeWw2faWAQAi2Z+5Oq7fsb1DVZfFTQdUt/WKHMSDWHkNBpFTT056dXo6MikHpVuXUrUDRtBaWXQIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpdwyfJQfy7eIKqPeklSA6+ZKcK+dOU8QZILg/r9QqQ=;
 b=RISIFAF8dZTUmaCSe9pci95UEp7HaDA1GnnxGSKzVFnoHJ0gkwoOU5lVLx/2FTikIQg7aydmLNLQOJF0ytuEGthBidr5q4og8YU7vSK2KTRCwm5CQbCOiIVHSLQr31tayWc8pJYcCuLNW39k/iGl/1LGGszMYJDxYqfIs6GjqFqUDZa3qFWHf7SDg43tVzaxZOEtoqqzr+2r9ZiEuvT/3wgYp9RLdNYT4FYM2y4nzUujUGIYhOYNmIg6v8EE1IS8gL0BD+QErPm1S1lkallvLO+BGrGwuMAl96lkZS/Xu68C5BUHwJw5k7MlvsEFMJ/S7YQJ6/wvpU0HeKmSVrAY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpdwyfJQfy7eIKqPeklSA6+ZKcK+dOU8QZILg/r9QqQ=;
 b=UEzHtuI+hPpVIcUvisO1a0RpHfFyUfYkLGZsLDcBR5PRlPRbupV2ou2qVe0a82XhyhPH+x7T7S0Yp8V5voNt/8U7f23GGFIGohdpGIv7tLC9UX1HHRzslwRAerGG/7flbfMpREU1DjkBeGaOYrj/dMnrOuXUkqnzSfhKDQawIBU7DDDZLpEEsJRdY5SRfh7ocqsmjlwqWgvBFPKHm3+4qDjqJw5ECr7CI/22zZSDbL0HRwHkeuoUW1F4fCQI0cUNK10pCi7sL/jA+q1Y7IfUJR8M4wWVvbCwdvvCC5RUOwI+OlbVOH/MnqklLYzrJtyZperzoncXF1hfwOGdWKo2ew==
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com (2603:10a6:150:db::6)
 by DU0PR02MB8522.eurprd02.prod.outlook.com (2603:10a6:10:3e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Wed, 22 Nov
 2023 17:19:26 +0000
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba]) by GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba%4]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:19:26 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 2/4] drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
Thread-Index: AQHaHTOk/k8fchlDW0a8T3k+jP/rwbCGla2A
Date: Wed, 22 Nov 2023 17:19:25 +0000
Message-ID: <da26d139-4b49-4e73-dee4-33f061bc7be6@habana.ai>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-3-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB9325:EE_|DU0PR02MB8522:EE_
x-ms-office365-filtering-correlation-id: 3262278a-16da-4331-1e2c-08dbeb7f2d84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zNCqAjoJvDYd5ER2b+OFrUwzMzCuIEo2fKXSFdmBQX9of7RQb/LrtcsWC6JTNcysPscd4Z1X/KFOEiFv+APbgY3EdP3xhouVcqHjQHbr2rn4QgtlAK9nRQlF3Xfq31QGr9wZl710JkzTnJ8NznnI4v2WtyLKT8CZHWtXPE0hB+3YqvmmhhBzmGuPh0HeiMFcDFZAHlwS1+9NJIl5ScUcMJyXQflW8y0Y64xQztZVDUitnKuyu2v2Ccb6Gj8Nb+4K+nuZwzE+gT1qcpCl2HSOZ8NGGoa7vQO+Kvq6EECn66q2JOX2gDjkw8rsV8nghi8PMNS03IUYgVT6Rbs+Fv47OffEFrZ0/y9hhvt5y+F5Im5D0MZXrhdhW3DcwvBKqxb0zenvJ921PMPcASrDOXC6hyEyH+v5I6r012EI0nuNRoutQuy1CD8l/zZGSgHKoqfUva8lsNLbNVZc7vBMQiZ/2F8fbmXS8sbWaQnVrCW0aXkpRiRJxM3gxTFL8dRB0iCV1Hji8YgjMnSBl1VpfmyHnJMBu9nAMt5CoIw+B8Czbkm0EDbicgIF6ofQVsCIqb98bPPgTedZeAt4QsPEo+Qh02+HOlGs6plJ8mYnAu/7XjlDrZn5tEICFYQx+0zMZHJKHv/UqhjS70YKSkSdFuRJswULiSmp5xtScYmbag/4+I4HHhQxsXQ3TeP3GpMH0eQ5+JEAifgD6PnWQhodH6UQDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR02MB9325.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39850400004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(5660300002)(8936002)(8676002)(82960400001)(31696002)(86362001)(38070700009)(38100700002)(36756003)(66446008)(66476007)(91956017)(41300700001)(122000001)(478600001)(76116006)(66946007)(66556008)(316002)(45080400002)(2616005)(26005)(66574015)(110136005)(64756008)(6486002)(53546011)(966005)(31686004)(83380400001)(71200400001)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YThmdlVIOXB3RnNtU1FzSWovVEhqcmxKTExLenJic2lXbFBUckF5eXYwRnpm?=
 =?utf-8?B?aGdJM3NOWlhoQS8zdnp4MXpvL1NseVFFRlNQQXU1RUE2Z2VXY0FhNWR2S2Uw?=
 =?utf-8?B?em1MR2pxSENqcDdXRDcvMGZLMVkyTGlUTS9GbC9qdzcweGc3ZXIxTHFqN2sy?=
 =?utf-8?B?VEI4VGtOdDg2SGE4akt2Z0EzREFCR1NhOFVrNHdGVkpnVUpzTyszcFZ5TlVm?=
 =?utf-8?B?TFlpalQvQWNtMEpOYXBnUVJGM1dSTDIrQXF3a3FEeXhvZU1oYlYxMkV5WEdl?=
 =?utf-8?B?amFxSkdBMjVhZktPVGxkQWJ1YW5XNFNGZG5rc0RIUDEyTnA2R1N6bUlpbFdW?=
 =?utf-8?B?N2xlQm9RaWxEdzlHNEZLK0thNmp6VHNXcmk1YW1aamVXanl4RmF0bEIvdk9q?=
 =?utf-8?B?YmJ2dkxLV3dLTXlBZ24ybUlUZmdDN3ZnTFNBUENRZkNXNHI1UzVTYU1ZSUhZ?=
 =?utf-8?B?VU05aW8wV21EQVBJZTNWc0s4ZTluOVVPbzdjWEp5MUNNY2dlSDROSS9lOWN6?=
 =?utf-8?B?U3NLS1Zpc3dsMjZBaWljeks1Y1NSUUhRZ3lhcEZ0UjdRemE0TlZJQjJnR1hP?=
 =?utf-8?B?Uk5RU2ZiL0tuWjBJU2l6dUxWQUg1a3hEZXlYb2UyYW5MZS9UOGhyZ3c0bkFs?=
 =?utf-8?B?RHQva09qODFtdnF6SkUwU2h1aTcxdTZhTlVLTDI0M2JtTzdBTmFSWmRPUlJy?=
 =?utf-8?B?QXBJY3YxZGJ5aGpVL3lFTWNjSk45dHBId0VIZ1NPRFBpc3Uydkd5MWJXSEtv?=
 =?utf-8?B?bjgyek9PQ1hXTzNRblkwWHBYb29scWh1b1EyUVowSmRaekNoN243bmRndHlJ?=
 =?utf-8?B?b1h5VERhcmxNWjFoQ2RWdkRzYzRxdm1kMUxYdis4YkU2aGZoQWZwMUpBQWxp?=
 =?utf-8?B?NmZMdXZsZ2hmZ3hrUXRacW5MNzI0VXNXVG1PYVlyTnhYQjlRZzlQa0Q0N1JB?=
 =?utf-8?B?eXc5ZVRFM2dsU1YvdTd4ME01cm0vRDVwQ1VNMmtycG1ZOFpvazg4Q1VkdlVy?=
 =?utf-8?B?VWF6TzhxLzhNWTVIQjNtQzYxTGMxQnJhRTdwZFhyMFJ5OUoxVVdaY1B2TzNC?=
 =?utf-8?B?R2FaM3ZhWkN0c0NNb0JpNGw3ZWFsbHA5SEdhV09oWmdZTzg0dEl0THpuZVIx?=
 =?utf-8?B?aXdjRUs4OXo1SHJiYmJYSThjV3YyeTB1U1dycGVaU0xzOC9Edi9WSW9WZXpO?=
 =?utf-8?B?YlF1RlByUmNEOTRGN1RFN3RySm9qZ0VkdUVzT2dHb2pZNHJiQytkUjRaMm81?=
 =?utf-8?B?VDE3MGI1N1hWNVZPcVYybjV2ZWNzQm9uZzZTNkg3UUI2MUJ2UGtBb285Zkk4?=
 =?utf-8?B?RkZhT3AxanU4dVdWUHhQZ3ZpTHBNZjZaNHYraktkT2RYcW16Snc3d0NSS3Jy?=
 =?utf-8?B?amRYUUV2ZmFvelpHRmhhWGZzd3ZyZEQyOG0zL2NXYS9EY3duZDR5aTZ3MXFT?=
 =?utf-8?B?aXFlU3A5cnVYVi91V1FrcURvY0F4OHVocTMrQk80dWV1Ry94RXEvOFZRajVu?=
 =?utf-8?B?T0Fucm1makpsSG0yaWNuWXA1dHd4ekZ2VHk0ZEFkVnpnamU3bnVXOXM4Z0cv?=
 =?utf-8?B?cE43N1ZCWTRKelR2UTZ1bzdjekc4Lzk0NjFZTUV1cDBwb0JURGc1dUsyRkQx?=
 =?utf-8?B?Mkcxa2ZUaGw3Yk1vTVlTNGFHWjJLR2N4dGlOL1ZrdXZ6MG16WldnbzVlbURj?=
 =?utf-8?B?bDNxN3A3Mll2ZzFXZXp6RmhSZXpBbmxUZHRxdHBiUlVQM2xXNHU3TGlPR1c0?=
 =?utf-8?B?QlhiVUNYanB2STVYRTRZczQraXZxTTdHQUdCeVQ1VUNINm1KY2ZuajlrbWpY?=
 =?utf-8?B?L0NOSnlnOHE1RGRtSUVQVk1SaHZqbDBEd2traEI1UDV2eGw3UnBkZENLVFFB?=
 =?utf-8?B?SUYyVWdGY3RoT1YzLzRLTVJVdVpld2hMZmRFaWhwWHB6SEg1S3U4a1kxY0Qr?=
 =?utf-8?B?N1pnajZGa29OZHpJMFY2bHVXakUyODJGNXZYQjVnRDBadGlmNWc3bmFtR0hh?=
 =?utf-8?B?NjVrWmN6UE52eDdEbFZMZ2ZjNk9zL2RjYnNaMXhidFpHVUVqaGsrZHVDTlF4?=
 =?utf-8?B?MFBXYW00bTh1bHExRkMrVkpvWmdYNzVpL1ZadVByRUNHV2hKOTVoMDRXaG1W?=
 =?utf-8?Q?my0M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01B425E880FF784F84524C733A67D67A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CarshE1G6Yxov+ynpSpgeGjakpNJehhlsSkK/ZHe3DbXb9HTmJR8SMDA8yP0k5nUqbRDZlaZJUUpBOqzTsKciGe6kgrQxSF8K90QZRdLazQMcvULmRg+AMwgqp9uO6/gMInAPpy/H1vP0/lU02NzwTZJAl7qMfUU60d9r3mvSwIeE7YwO+OZbXF7NjoGFky++TPZ160udRsSEhcy8+sPb5vBh394bghtAXWcQBMovfCR0ye9RK7g4FOlEogWTpCGRkN5O9lEUfayRZ5gPl2a3spoVPPRVmn3dZVaZIyWK0mgajobW5AGPB/wMBeEdBUBOGEC89WbY4emBjHL13djwe8wHUdQ98avdLCghx/BNTj9qOZ+nhbm4upLMKEvtvN3A+8sRffblW+S3CNmw/xQf7owTZI5FFZUQ2WpSQHhXn6ZQ8mFLS6m4Lg11QAz8sYPprm9Aqs3NhoqFKQ+73x4xW0YdQepYNKZpyFvk2kPI0lQ1f9K5fOICvPPG9ewcXsLeegdMq0XL0qr03zelT8E+OFFKluiv6v8q+dSls1lxsj/6Va1B/o8eJi4R1+6SO69NVkiZjQJt/blFDNOR0PnU4eg7fj6P3tH5lcO4YhxlIJ9II4P5hQZ3Nz2KzbublVqt4hxmQgB307zUapflQ5E/Qxk9R1vUK4hTUfmw8lDPWsak/iMtSd/ipvY3yBNAWdzRGPjRJLjHzP2VufiolGmFGfUEPztI+YN/5ochZSjm1vqFM3lEArFOjrZXrFnztROGn2C+yUEo6kenhfZCZj9wYJU0A6t5RMDANdYwC8/0ENzmHTAy9mF0ufElLQGs75bTn8jL5mDZGV5lzSCPEH/3A==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB9325.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3262278a-16da-4331-1e2c-08dbeb7f2d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 17:19:25.9975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kB6eGVUYSL5hI2tCq3lGJKPooSONYJ8eOYgm47V/0liHWq/AHywyHolh9Bemzz80sEtRVbuZUdhnS5c9lad7HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8522
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMDY3MzU3NjpGUEtleTEucHJpdjrN63JeoQIiizJD0sj9/A0yTNjXTHJonaG3FOyf6nifPERdRQj8jXFZtfLJMNspGIcA8Z1KQpS1ErGL64ws5jCBzLEdy5iCn1D3Xcrb3RuiaD10si0RevS0e0EYFuELCvu+2BBVzVewoFxHip7YlJGwMJuomIV0Z/8FVkoBy7y+r99rFqHWLgvkAWM00AzNZ6ksNM4Tg6lAcgWRbBlkFYyX6dja+HhvkSBEz8ClF7pLBHS0O1IA97DReOzcQ/nSehrIQQ4qAp7gaEaxbnRwdrYhezTk6YYNDaIV11AROPcuLWRNpz5JTXCTQpldgsRy1CCG2upi2LBcogT2PIf0zU3u
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.18.105
X-Mailcontrol-Refers-To: 3AMHJYSF102225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=CpdwyfJQfy7eIKqPeklSA6+ZKcK+dOU8QZILg/r9QqQ=;
 b=X0TnFrbCln1FGklrrtGWLosNTa6MIWGqYTVICemrYk3pAoJ8idqt8b+h5fIVCLZx+orzr/H/J44ns5wL5Z2mwFM3S9sVxykE0sKeS3dDShubx+CfV0EyhZg2GX/xO49dVPWVg3iftn2huCQLEtFRqCa9RxQpDRpWwNCnq/R3JsNdVwHfHo3nOHKrZRhRxR1HCBhD/C5kblsv+6mPxVlOD8LY7THeKBsaskqPbgWagHVbB0NX5Xw0HtdwV8setQZulFTUrLk5hpnXbmXFTtH2Tc9hqkZ48GcgT5k2TjL4mdL4T7qCclePAOhtEe34Y93D9IsY9wMe61jvVSvdcrwuXQ==
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/bo: Rename xe_bo_get_sg() to
 xe_bo_sg()
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

T24gMjIvMTEvMjAyMyAxMzowMywgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+IFVzaW5nICJn
ZXQiIHR5cGljYWxseSByZWZlcnMgdG8gb2J0YWluaW5nIGEgcmVmY291bnQsIHdoaWNoIHdlIGRv
bid0IGRvDQo+IGhlcmUgc28gcmVuYW1lIHRvIHhlX2JvX3NnKCkuDQo+DQo+IFN1Z2dlc3RlZC1i
eTogT2hhZCBTaGFyYWJpIDxvc2hhcmFiaUBoYWJhbmEuYWk+DQo+IExpbms6IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzk0Ng0KPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+DQoNClJldmlld2VkLWJ5OiBPaGFkIFNoYXJhYmk8b3NoYXJhYmlAaGFiYW5hLmFpPg0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9taWdyYXRlLmMgfCAyICstDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICAgICB8IDQgKystLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oICAgICAgICAgICAgfCAyICstDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21pZ3JhdGUuYyAgICAgICB8IDggKysrKy0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcHQuYyAgICAgICAgICAgIHwgMiArLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3Rlc3RzL3hlX21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0
cy94ZV9taWdyYXRlLmMNCj4gaW5kZXggN2FhZDA5MTQwZDdlLi44M2Q2YTY2ZWQzNjkgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9taWdyYXRlLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX21pZ3JhdGUuYw0KPiBAQCAtMzI4LDcgKzMyOCw3
IEBAIHN0YXRpYyB2b2lkIHhlX21pZ3JhdGVfc2FuaXR5X3Rlc3Qoc3RydWN0IHhlX21pZ3JhdGUg
Km0sIHN0cnVjdCBrdW5pdCAqdGVzdCkNCj4gICAgICAgaWYgKHhlX2JvX2lzX3ZyYW0ocHQpKQ0K
PiAgICAgICAgICAgICAgIHhlX3Jlc19maXJzdChwdC0+dHRtLnJlc291cmNlLCAwLCBwdC0+c2l6
ZSwgJnNyY19pdCk7DQo+ICAgICAgIGVsc2UNCj4gLSAgICAgICAgICAgICB4ZV9yZXNfZmlyc3Rf
c2coeGVfYm9fZ2V0X3NnKHB0KSwgMCwgcHQtPnNpemUsICZzcmNfaXQpOw0KPiArICAgICAgICAg
ICAgIHhlX3Jlc19maXJzdF9zZyh4ZV9ib19zZyhwdCksIDAsIHB0LT5zaXplLCAmc3JjX2l0KTsN
Cj4NCj4gICAgICAgZW1pdF9wdGUobSwgYmIsIE5VTV9LRVJORUxfUERFIC0gMSwgeGVfYm9faXNf
dnJhbShwdCksDQo+ICAgICAgICAgICAgICAgICZzcmNfaXQsIFhFX1BBR0VfU0laRSwgcHQpOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYw0KPiBpbmRleCA5MTU5MTBiODdmYWEuLjk0OGZiYmY1NmNlZSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTMxOCw3ICszMTgsNyBAQCBzdGF0aWMgaW50IHhlX3R0X21h
cF9zZyhzdHJ1Y3QgdHRtX3R0ICp0dCkNCj4gICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPg0KPiAt
c3RydWN0IHNnX3RhYmxlICp4ZV9ib19nZXRfc2coc3RydWN0IHhlX2JvICpibykNCj4gK3N0cnVj
dCBzZ190YWJsZSAqeGVfYm9fc2coc3RydWN0IHhlX2JvICpibykNCj4gICB7DQo+ICAgICAgIHN0
cnVjdCB0dG1fdHQgKnR0ID0gYm8tPnR0bS50dG07DQo+ICAgICAgIHN0cnVjdCB4ZV90dG1fdHQg
KnhlX3R0ID0gY29udGFpbmVyX29mKHR0LCBzdHJ1Y3QgeGVfdHRtX3R0LCB0dG0pOw0KPiBAQCAt
MTcyNiw3ICsxNzI2LDcgQEAgZG1hX2FkZHJfdCBfX3hlX2JvX2FkZHIoc3RydWN0IHhlX2JvICpi
bywgdTY0IG9mZnNldCwgc2l6ZV90IHBhZ2Vfc2l6ZSkNCj4gICAgICAgaWYgKCF4ZV9ib19pc192
cmFtKGJvKSAmJiAheGVfYm9faXNfc3RvbGVuKGJvKSkgew0KPiAgICAgICAgICAgICAgIHhlX2Fz
c2VydCh4ZSwgYm8tPnR0bS50dG0pOw0KPg0KPiAtICAgICAgICAgICAgIHhlX3Jlc19maXJzdF9z
Zyh4ZV9ib19nZXRfc2coYm8pLCBwYWdlIDw8IFBBR0VfU0hJRlQsDQo+ICsgICAgICAgICAgICAg
eGVfcmVzX2ZpcnN0X3NnKHhlX2JvX3NnKGJvKSwgcGFnZSA8PCBQQUdFX1NISUZULA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3NpemUsICZjdXIpOw0KPiAgICAgICAgICAg
ICAgIHJldHVybiB4ZV9yZXNfZG1hKCZjdXIpICsgb2Zmc2V0Ow0KPiAgICAgICB9IGVsc2Ugew0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uaA0KPiBpbmRleCA5OGVkMzVjZjM5YTMuLjlmMzczZjZkMjVmMiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmgNCj4gQEAgLTI5MCw3ICsyOTAsNyBAQCB4ZV9ib19wdXRfZGVmZXJyZWQo
c3RydWN0IHhlX2JvICpibywgc3RydWN0IGxsaXN0X2hlYWQgKmRlZmVycmVkKQ0KPg0KPiAgIHZv
aWQgeGVfYm9fcHV0X2NvbW1pdChzdHJ1Y3QgbGxpc3RfaGVhZCAqZGVmZXJyZWQpOw0KPg0KPiAt
c3RydWN0IHNnX3RhYmxlICp4ZV9ib19nZXRfc2coc3RydWN0IHhlX2JvICpibyk7DQo+ICtzdHJ1
Y3Qgc2dfdGFibGUgKnhlX2JvX3NnKHN0cnVjdCB4ZV9ibyAqYm8pOw0KPg0KPiAgIC8qDQo+ICAg
ICogeGVfc2dfc2VnbWVudF9zaXplKCkgLSBQcm92aWRlcyB1cHBlciBsaW1pdCBmb3Igc2cgc2Vn
bWVudCBzaXplLg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gaW5kZXggZWQyZjNmNTEwOWYz
Li44MGExMzBiZWNhNjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiBAQCAtNjgy
LDE2ICs2ODIsMTYgQEAgc3RydWN0IGRtYV9mZW5jZSAqeGVfbWlncmF0ZV9jb3B5KHN0cnVjdCB4
ZV9taWdyYXRlICptLA0KPiAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0K
Pg0KPiAgICAgICBpZiAoIXNyY19pc192cmFtKQ0KPiAtICAgICAgICAgICAgIHhlX3Jlc19maXJz
dF9zZyh4ZV9ib19nZXRfc2coc3JjX2JvKSwgMCwgc2l6ZSwgJnNyY19pdCk7DQo+ICsgICAgICAg
ICAgICAgeGVfcmVzX2ZpcnN0X3NnKHhlX2JvX3NnKHNyY19ibyksIDAsIHNpemUsICZzcmNfaXQp
Ow0KPiAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgeGVfcmVzX2ZpcnN0KHNyYywgMCwgc2l6
ZSwgJnNyY19pdCk7DQo+ICAgICAgIGlmICghZHN0X2lzX3ZyYW0pDQo+IC0gICAgICAgICAgICAg
eGVfcmVzX2ZpcnN0X3NnKHhlX2JvX2dldF9zZyhkc3RfYm8pLCAwLCBzaXplLCAmZHN0X2l0KTsN
Cj4gKyAgICAgICAgICAgICB4ZV9yZXNfZmlyc3Rfc2coeGVfYm9fc2coZHN0X2JvKSwgMCwgc2l6
ZSwgJmRzdF9pdCk7DQo+ICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICB4ZV9yZXNfZmlyc3Qo
ZHN0LCAwLCBzaXplLCAmZHN0X2l0KTsNCj4NCj4gICAgICAgaWYgKGNvcHlfc3lzdGVtX2NjcykN
Cj4gLSAgICAgICAgICAgICB4ZV9yZXNfZmlyc3Rfc2coeGVfYm9fZ2V0X3NnKHNyY19ibyksIHhl
X2JvX2Njc19wYWdlc19zdGFydChzcmNfYm8pLA0KPiArICAgICAgICAgICAgIHhlX3Jlc19maXJz
dF9zZyh4ZV9ib19zZyhzcmNfYm8pLCB4ZV9ib19jY3NfcGFnZXNfc3RhcnQoc3JjX2JvKSwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9BTElHTih4ZV9kZXZpY2VfY2NzX2J5
dGVzKHhlLCBzaXplKSksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjY3NfaXQp
Ow0KPg0KPiBAQCAtOTQxLDcgKzk0MSw3IEBAIHN0cnVjdCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVf
Y2xlYXIoc3RydWN0IHhlX21pZ3JhdGUgKm0sDQo+ICAgICAgIGludCBwYXNzID0gMDsNCj4NCj4g
ICAgICAgaWYgKCFjbGVhcl92cmFtKQ0KPiAtICAgICAgICAgICAgIHhlX3Jlc19maXJzdF9zZyh4
ZV9ib19nZXRfc2coYm8pLCAwLCBiby0+c2l6ZSwgJnNyY19pdCk7DQo+ICsgICAgICAgICAgICAg
eGVfcmVzX2ZpcnN0X3NnKHhlX2JvX3NnKGJvKSwgMCwgYm8tPnNpemUsICZzcmNfaXQpOw0KPiAg
ICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgeGVfcmVzX2ZpcnN0KHNyYywgMCwgYm8tPnNpemUs
ICZzcmNfaXQpOw0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0KPiBpbmRleCAzMzhiZmZlNDg4NWYuLjQzM2Y5
ZWNhNjFkMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gQEAgLTY3Nyw3ICs2NzcsNyBAQCB4ZV9w
dF9zdGFnZV9iaW5kKHN0cnVjdCB4ZV90aWxlICp0aWxlLCBzdHJ1Y3QgeGVfdm1hICp2bWEsDQo+
ICAgICAgICAgICAgICAgICAgICAgICB4ZV9yZXNfZmlyc3QoYm8tPnR0bS5yZXNvdXJjZSwgeGVf
dm1hX2JvX29mZnNldCh2bWEpLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHhlX3ZtYV9zaXplKHZtYSksICZjdXJzKTsNCj4gICAgICAgICAgICAgICBlbHNlDQo+IC0gICAg
ICAgICAgICAgICAgICAgICB4ZV9yZXNfZmlyc3Rfc2coeGVfYm9fZ2V0X3NnKGJvKSwgeGVfdm1h
X2JvX29mZnNldCh2bWEpLA0KPiArICAgICAgICAgICAgICAgICAgICAgeGVfcmVzX2ZpcnN0X3Nn
KHhlX2JvX3NnKGJvKSwgeGVfdm1hX2JvX29mZnNldCh2bWEpLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHhlX3ZtYV9zaXplKHZtYSksICZjdXJzKTsNCj4gICAgICAg
fSBlbHNlIHsNCj4gICAgICAgICAgICAgICBjdXJzLnNpemUgPSB4ZV92bWFfc2l6ZSh2bWEpOw0K
DQoNCg==
