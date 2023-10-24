Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55216C07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 17:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E5A10E443;
	Tue, 24 Oct 2023 17:33:07 +0000 (UTC)
X-Greylist: delayed 2171 seconds by postgrey-1.36 at gabe;
 Tue, 24 Oct 2023 17:33:05 UTC
Received: from cluster-e.mailcontrol.com (cluster-e.mailcontrol.com
 [85.115.58.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114210E443
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 17:33:04 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly68e.srv.mailcontrol.com (MailControl) with ESMTP id 39OGun73012283;
 Tue, 24 Oct 2023 17:56:49 +0100
Received: from rly68e.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender kelbaz@habana.ai) (MIMEDefang) with ESMTP id
 39OGuli1012112
 (TLS bits=256 verify=OK); Tue, 24 Oct 2023 17:56:49 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly68e.srv.mailcontrol.com (MailControl) id 39OGtvVo007504;
 Tue, 24 Oct 2023 17:55:57 +0100
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2232.outbound.protection.outlook.com [104.47.11.232])
 by rly68e-eth0.srv.mailcontrol.com (envelope-sender kelbaz@habana.ai)
 (MIMEDefang) with ESMTP id 39OGtuUD007400
 (TLS bits=256 verify=OK); Tue, 24 Oct 2023 17:55:57 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koEJExEbqmq/Hm0hh1dW9K39Wchz8PP1RtObPfAgaHShHqd6nMEYEC8GxnYlSLUpDJi09VqiqAAtAOJ7yqXnFM9+Ec4Q/qqwH9dr6c23hiikNLH+a45KMwuuFEC1PYHzagBK0x884kEj5tMWABHYz0iWyarVzMs/dI0/Wlvqx+CrJh4hEpkQwdsn4TWgt3HNd3p3ApEzb783FRmLzOiPBw1R3GRTnOTNRjgdOp4/2yUbqLv44LVpUHdwfvUOFS9pZfU1xE6454XAjwf4/CxFNIkwewINWj5dAdLh5pb0/LpDN8WUGUiCl1R8CslqPbZhtGQgWefP27olVjyYQd+H6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIdvh1NXivzmgK2p2TV5Wjw2I9wpYd0aFwPR/8G0aGw=;
 b=VscAg8dTd3hanAB0uu6rySSv9MwgJPGs19uFThmjLDD8of4ep8VpZWEfTXqx4iHOu1KNhddmyTUomk6kQJZNakWCkz+NSt0WI17CvE/qfQueBpe8bZKd1vfOa/E3zjHQxpG1g3oAqKXQPoGPphg39Kwgy+9+SZy150I838PIzhN46b5J+YUX08gL+KG8NTLi8FAO28/XJscNywu0Iz2X9VxKWfWBGDo/aQ0CMgjs88CKc52yVOy07xO+E6zgpeaId3s3CadmOW/R2TVsAifjTicJuvdixebRF2CUUvWDESTNYJG3ZV7BTrEcglXzQaU3FCQFTbvaWryTctFOw04JGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIdvh1NXivzmgK2p2TV5Wjw2I9wpYd0aFwPR/8G0aGw=;
 b=CuUGpBdI5M8WIJ4AjgOzRh01VZZS7C0bJfoX6lnnUqEMRorpS2wG8EuVr4ak0PvLTlczmQriYUMcIu2y7XiC1pYcEkHpGDxtTWlN2biTRBdCz5FH1OD4m4b6386qdBQ2bb2NvWxYt9eiz297zGR+CfJllN5YZl6vzfCeDJmrDpTHMckvTGTOOA2G3oKO4vBdspwDQQ2ylbqXc7X7kxJ67fDVh6e+A+GdPbcysqu04mBBkAd7NAkg6KUws8zgJxDa8215tT1bFqdZl3MBaWxWG7Y4j5YEWB5UArsaMUZlZR7ALEdk3pHY3te+SVtHJSSVByEjqPvfZsWCWs/x7/7Rkg==
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com (2603:10a6:10:345::21)
 by DB9PR02MB6684.eurprd02.prod.outlook.com (2603:10a6:10:210::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 16:55:54 +0000
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::ae00:6d72:5454:a3a3]) by DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::ae00:6d72:5454:a3a3%3]) with mapi id 15.20.6886.034; Tue, 24 Oct 2023
 16:55:53 +0000
From: Koby Elbaz <kelbaz@habana.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/2] drm/xe: add skip_pcode flag
Thread-Index: AQHaBQCC0wzT9/lZo0S9Coz6NVEFQ7BYwuyAgABo+IA=
Date: Tue, 24 Oct 2023 16:55:53 +0000
Message-ID: <f86e201f-28d8-9037-8367-8fba3d44fb8f@habana.ai>
References: <20231022155727.717251-1-kelbaz@habana.ai>
 <8734y0b8xg.fsf@intel.com>
In-Reply-To: <8734y0b8xg.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB7873:EE_|DB9PR02MB6684:EE_
x-ms-office365-filtering-correlation-id: ccd152a1-29da-4437-a6ed-08dbd4b215c4
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Zqcn4/XU+PCvQsV9gjRfoPe06KhDCE6CGD08qw2J8njIXEZr3DfmsN99kxKebH06DGlDEseSJt+A8V4XX5Y6rviHXx4pp8I16gs7ynqXacdiiv4h37hwubiAorHDwNrVbJJA9C8HQ4IRqxz/qJCiTzg92RxWLWUItd9iO56mT1U4EXJod5p1BfxK0oJuNxDHgH8v6n8GxtuzCh3+r1K230ZQnINgWfcgIUl0wUyV1nFw+Z8i9MxnASFC0GmldY4rIVxxwd8YJ7QCW3wBcZEere3XVVwTK4YZuwuSD3RLsMsfEjZznqYqNzQDEr+YwC2JMdRd5AosmzMCfrg6JB+tFahL0+GarPUE2cL8nD2pAMK6ZEdU/l7DxOSSKbzoeCCH9mNy83DBR1hN02cu0Xa6LTqZ/WUXD0AX87vrvCbJAysEyR/EtILfq0xJ15q5WY8UQkxZjJHRMJt0xCsEajsBrTBcC9ojJpzkre6Zm8xSadodRghqMnx4F1a1OV+uulSqd9UKc9ST+4G+pvHyEcEFdp7BciJxmILogSciwQQ5VFrnHW40Xg+kzooe2gEn+3zV0+gjBoMlPbjpgpoGiVZVOBSWUlHbuSTdBhtfqzH6j3EtXsf5jMBjKbOjavBVW+w+A9p/l52NjNNquLI8SLfRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB7873.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39850400004)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(8936002)(71200400001)(76116006)(86362001)(66946007)(66556008)(41300700001)(66446008)(91956017)(64756008)(66476007)(110136005)(54906003)(316002)(31696002)(478600001)(6506007)(6512007)(5660300002)(6486002)(4326008)(36756003)(26005)(82960400001)(2906002)(2616005)(38100700002)(122000001)(53546011)(8676002)(83380400001)(31686004)(38070700009)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXU0VFpFazRhTVgyc25BUnk4b2s0eVpRTnhiWk9wNDF3ZHZOQmE0UHRxMDZI?=
 =?utf-8?B?Rk0rK2Q4K3VvZlJYNDZhbTZING9nM3N2TE5DM1JKdU4rUzN2L1F1b0d6OWp0?=
 =?utf-8?B?UGtKUlNlQmZtcWZRQlNhRi9Hc3F3R0pHSjJnSzZUcklUaEtDQm9ZMlpjYWRj?=
 =?utf-8?B?emN1ai94YW4wakhlNFBOU2F2UGFQbzJlWVJRKzhWVW80Znc0V2UvdXJySTZH?=
 =?utf-8?B?R1puODJNdC9mUWFEaHVEdmlMcVp3dHkrZzd4TVVtY0pnb2d5Tkc5WGRPck5Z?=
 =?utf-8?B?UXprTFpGcUNMZHg5TnFyTzB6R2Q2d0tmdmhtTUtlTVR1MG5GTDllTzNkUERy?=
 =?utf-8?B?MFJ4V2NYL3V2VlVxV0dwRWxFK0JEMkhDcEQzODlLdENNdDBpWEQzenF3Sm82?=
 =?utf-8?B?KzlYQlJlNjdHS3p0cGFBcmpuMTRlR1ltUkV3Q3pUdWhDa2hCTGhVR1Y2NkJo?=
 =?utf-8?B?a2hsdUtyYUtvTHlMWk5sVnFZRVJxcDVXQUd0N3JLQXVwVVVMUEZNdUJCNjdr?=
 =?utf-8?B?VTNqNW1tbG1JZ3E5RG9VU2lOeENBNkFoOWFDWHhRQWNFM2dCMXQrVDZEa1dK?=
 =?utf-8?B?eXZaekhkQXQyLzRrck10WFRXQzU3Y1VBclVmUE42NThuSDhxbElCMjFDVzVI?=
 =?utf-8?B?ZXRwUlR5UlRhWjJxVWl4cVdZL1FSSGVNd1Z4TUM3cUJQRDMvbXJLVUdpSkJZ?=
 =?utf-8?B?TXVrd2pPRjJRZi92YzlMY25xSFNRcTh6K1FMZTllUWh3TUZhQWVNMGpETkc3?=
 =?utf-8?B?N1kwVEIzVzBPYTZqZ3Jid29EYm1xVnI1eGJsd25sYkgzcC9YK0RxYS9nN0FP?=
 =?utf-8?B?MlQ2VmVkdGhMNFNwcG1VWjlwOFQ4L2ptL0VXanMwTzNPTFVIdTYrWmp3Y3BU?=
 =?utf-8?B?SWJnemRUVFpHZFZhVnlmVldidmJ6c2c3ODhoWTFsdnJoMmgvS3RFdWYrNWM4?=
 =?utf-8?B?WE1RN0JqRVJLc3A2ckRpQnRSamRDMXZGOEpicTZsM1RWdmgwR3ZCQ1luUVQ4?=
 =?utf-8?B?dUhJMXByaEVFN0JQNGtEam02MG5WSWs4U0xGOGFsSDgzWkMxMmplYWRpSWls?=
 =?utf-8?B?ZHVveitxMzU5dEh5NnhTYmNaRDRKY0lNNVBsdHhxMEpFS1ZuRjRqS2NZd0E3?=
 =?utf-8?B?SWthOEcxNVFNaHYySENMV0NaSC9KUFJQaHVPQ0pETzFOWUtGMVFkTUZ0ZmdG?=
 =?utf-8?B?dnVtbXF4cGtQTktWMm11OWV1d0VoamV6cnQwOWlzK2p0SndLajRnKzEyc2la?=
 =?utf-8?B?MEErYm9Rc0tKYlFJemRRTlBKNmJPS2IwSkljZmhNMnQrbDNVVDdld29VNWJ0?=
 =?utf-8?B?cFpqTHF5aXllS0dGcXNJRVhyUTdZUklYWDFHMDFFK2ZkVXZiZy81dHQzV2xj?=
 =?utf-8?B?VWRDM3hjNnlnc3lQTTFNSmViSm9ZeUZwbW5UTWVtcXFDZWN6dkZSTWVsNDU5?=
 =?utf-8?B?VDlER0MwSmg3UTRXc2lVR29WbXBydmJHdlVkSG1wbnNNcncwWGt6N2hzcitW?=
 =?utf-8?B?K0dNeEQvclVSTUxyRndZa1gzQzRHSC81enZ4Z2djclZOZ25FRmpCUHFORDhl?=
 =?utf-8?B?QkQ1L1VyMUplQUk0elg0THg2U0hUc3BMTjBWWVJOdmY0T2Q4RU1aT3o3d3ZD?=
 =?utf-8?B?WG1peGY5TFVFOEpONGdFWGhUZWhBaVRLdUpDWExtaXpQbXJnM3hoTkhHNHQ2?=
 =?utf-8?B?b3g3SFF5QmdmOGNLVlIxVEFFV1YzLzYyVnJNSlN6NmI2R1FKQXZrQXpWMFRE?=
 =?utf-8?B?QjlMUWJDV1hQK3d5M25wRVlNZVhiK2xvU20zNTlPSHd2azNTV1pzbUFIRXI3?=
 =?utf-8?B?NS9acEp2cThUb3dVYnZVLzQ5dzVCNU8rUkR3VjBNRU40NmM2ZUpPVFFLdS9V?=
 =?utf-8?B?ekRaYmxkQmpYdFQ1YmtMVWQ2aHJsSkhSenV5WXM4VXdueXgwTnhOUmVaYTJm?=
 =?utf-8?B?SE5JeXZ3ODE1dFJQRllzTnpKMzhRRXQvWkRBWkdISWYwUHptUUsxL24vZm8x?=
 =?utf-8?B?SENEdmpRTG1KY2NhQVJVSVJmTEw0ODNnMlkxQzI5SFpMTmVGUjBPay9RRC90?=
 =?utf-8?B?Vyt0enlsVE1JN2lMUnFnRCt4dkJQV3l3b0FxSmR6Q2dXY3JlWTVwR3dRZ0FI?=
 =?utf-8?Q?IZRg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0692B9DB9E49C4B9BD025533EE121EA@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ozcalR6f4NP3ySivg22b0+S9ou8yidl7PkCKC+5xyl+60wPUWovnCNE3TS3DgNTLvAfh/px5EyzkE4jxApBCaOhYzgVFEuRUnQ//00gj90OMV1Wqr8ZwNbV/ERXCfypvEl8RfjXmr/RffnM4Awbkr1j5yGTuTcrgM5JfIpYHrGK6Cj7hS7VFe+bvTGaC9GJx5LpfB/yQH9dgLQFkOg0ErkNxRbEiSngSZ/UOwcebToDqltrfHomwa+FzMKE4L9cNrg0vvEMuFjPf8HjQhuamS9pBIjXAX3mw+iLvtOmiwCM+0wpKz8mrQTXVn6nPCX0cw6PtD/EZRHCkjN1XVkduz/XW7EXmYJ0pdCmmYTB6GHQXpthgFwHJrTr8/3HU5tzTdXU/2FiVB5rs6nAMX5Ol+hvLZKUaI1v+lH0gKhbazt9oUXtHJtpUK3fFfM2cZ3Ylkg4d3VPt6W+tl7LoHhafC6pe4Veyvglf1yqO0NKRzgRuMu7EEXxpTFActA8CVLtX5eWYjlEe5lsHtxSyZxw4bDCEzyCNX9ea8W3Wx9i/N47klvDPYu8fkJ2aPVGNgtxntdlGgRSJqUUBnnQ+L6bOpxgkYcnnn7QwrWt5FGNrjtWlqxoZ8zaTKgWbIrCXyn81CvzJjgylH5N6h9dyMlINjZCVIE/KO1GJarWcO6VLUsB/FqlZ6BXArSBI+i5yLVykDo/ijb8uUMcI9BPLy9BAo7y4WtJviAVLTIJb9L0Rk56/Bd/izuvpa8pSoqKRGDYF3mCMOxztHoojwCBHF/jOavvL2epnmHiQlF1ABwQ7mOY4uPcQJoAynEWdvt+qVJKnRYrg3LckydxMtj0u98NiHA==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB7873.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd152a1-29da-4437-a6ed-08dbd4b215c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 16:55:53.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bh3NZ9R0KYBUHiQrkIvQKL1zNjotWK3d3GnttFX2mQ+4G8db66iGIXeZ8mpLcIoeb4LLJfgPMmKiiraxIonPxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6684
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5ODE2NjYwODpGUEtleTEucHJpdjrACiD9ZABmkuDLY83yM7gdRcMhEgI5B0YtbhOLY9rdsi8rCF5rJnegiBUZrs0zogOR0gphb2aSxxm+8lPbMuqdqhuZf1Ljbtn2xMhUVVJvZHI/hfmZjqi/p/CQFxkRo42Cu8UoX+qbzenda4Ciib8DgYrbEPpFZaOXVQLRKtlGip/sEVsXmiVXMnyawH0BPDbWXsEt+NOBn3yxfcXkozdVYcnSOYSrr6euBSkfbqYhmhd6j8AeMnLLuUX3MpN8eaTG9QOp9NzE8uMThiNrCkE3kzX5VSIR/Ny0NtNnSneXRAHYW6HK/QPIXkfuPZuSyVt7VK+wxaXAeq/wiv45dgc8
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.11.232
X-Mailcontrol-Refers-To: 39OGuli1012112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=pIdvh1NXivzmgK2p2TV5Wjw2I9wpYd0aFwPR/8G0aGw=;
 b=CLVT8kpE+HBbxSRoI+PDZAMf8oiuzWLAUhyPpIE196JQh3S+SX0r+UWrlgow4XKQhpgTm60qCvFbNUvYJtcStYYEsVdxRYoNQdQNS1hhv7/caoRTb+j184iD4uMkuemLFVqUTw40Xeytvmehd7/kvmBb+6a+2NN2qhPk7e6EkClWR0kKVsb4/Rwa6ApKxOYPSss8JWKumqq7AGoOGFU1AHJ4e8802o3rEh8Xfe/d65cGX7ZsPIG1YA/pDBhG82edAsAEg3lLliAvv0b/B9THXXSHMz0IaVi6Ztj96R5wXxqnu1raPMUitdgk2hEHP+RmEDhVm8SxZYNl8p2obJu0fA==
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: add skip_pcode flag
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
Cc: "Bitton, Ofir1" <ofir1.bitton@intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMjQvMTAvMjAyMyAxMzo0MCwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIFN1biwgMjIgT2N0
IDIwMjMsIEtvYnkgRWxiYXogPGtlbGJhekBoYWJhbmEuYWk+IHdyb3RlOg0KPj4gUGVyIGRldmlj
ZSwgc2V0IHRoaXMgZmxhZyB0byBlbmFibGUgYWNjZXNzIHRvIHRoZSBQQ09ERSB1QyBvciB0byBz
a2lwIGl0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEtvYnkgRWxiYXogPGtlbGJhekBoYWJhbmEu
YWk+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gdjI6DQo+PiAtIEFkZGVkIHRoZSBmbGFnICdza2lw
X3Bjb2RlJyBpbnN0ZWFkIG9mICdoYXNfcGNvZGUnDQo+IEkgZG9uJ3Qga25vdyB3aHkgY2hhbmdl
IHdhcyBtYWRlIGZyb20gcG9zaXRpdmUgdG8gbmVnYXRpdmUgZmxhZy4NCj4NCj4gR2VuZXJhbGx5
IGl0J3MgYmV0dGVyIHRvIHVzZSBwb3NpdGl2ZSBmbGFncywgYmVjYXVzZSB0aGV5IGp1c3QgcmVh
ZA0KPiBiZXR0ZXIuIE5lZ2F0aXZlIGZsYWdzIG9mdGVuIGxlYWQgdG8gZG91YmxlIG5lZ2F0aXZl
cyBpbiBzb3VyY2UsIHN1Y2ggYXMNCj4gIWRpc2FibGUuDQo+DQo+IFBsZWFzZSBjb25zaWRlciB1
c2luZyBhIHBvc2l0aXZlIGZsYWcsIGV2ZW4gaWYgaXQncyBub3QgImhhc19zb21ldGhpbmciLg0K
Pg0KPiBCUiwNCj4gSmFuaS4NCg0KDQpJIGFncmVlIHRoYXQgaXQncyBnZW5lcmFsbHkgYmV0dGVy
IHRvIHVzZSBwb3NpdGl2ZSBmbGFncyBmb3IgdGhlIHJlYXNvbnMgeW91DQptZW50aW9uZWQgYWJv
dmUuDQpIb3dldmVyLCBJIGhhZCBhIGRpc2N1c3Npb24gd2l0aCBMdWNhcyBhYm91dCB0aGUgbmFt
aW5nIGNvbnZlbnRpb24gdGhlDQpvdGhlciBkYXksIGFuZCBpdCB3YXMgYWdyZWVkIHRoYXQgYWx0
aG91Z2ggdXNpbmcgdGhlICJoYXNfIiBwcmVmaXgNCm1pZ2h0IGFsaWduIHdpdGggb3RoZXIgZmxh
Z3Mgd2UgaGF2ZSwgd2Ugd2lsbCBzdGlsbCBoYXZlIHRvIG1hbnVhbGx5DQplbmFibGUgdGhpcyBm
bGFnIChoYXNfcGNvZGUgPSB0cnVlKSBmb3IgYWxsIGV4aXN0aW5nIGRldmljZXMsIHdoaWxlDQpw
b3RlbnRpYWxseSBmb3JnZXR0aW5nIHRvIGVuYWJsZSB0aGlzIGZsYWcgZm9yIGRldmljZXMgbm90
IHlldCBzdXBwb3J0ZWQNCmJ5IFhlIChidXQgd2lsbCBiZSBzdXBwb3J0ZWQgc29vbiksIGFuZCB0
aGVyZWZvcmUgcmVncmVzcyB1cG9uIHJlYmFzZS4NCkhhdmluZyBzYWlkIHRoYXQsIEkgZGVjaWRl
ZCB0byBhZGQgdGhlIHNraXBfcGNvZGUgZmxhZywgYW5kIHJlc3BlY3RpdmVseQ0KcmVuYW1lIHRo
ZSBwcmV2aW91c2x5IG1lcmdlZCAiYnlwYXNzX210Y2ZnIiB0byAic2tpcF9tdGNmZyIuDQoNCg0K
VGhhbmtzLA0KS29ieS4NCg0KDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaCB8IDIgKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAgICAgICAgIHwg
MiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYyAgICAgICAgfCA5ICsrKysr
KysrKw0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+PiBpbmRleCA0NGQ2MjJkNGNjM2EuLjI5MTk5
NjcxZDllOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+PiBA
QCAtMjU3LDYgKzI1Nyw4IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPj4gICAJCXU4IGVuYWJsZV9k
aXNwbGF5OjE7DQo+PiAgIAkJLyoqIEBieXBhc3NfbXRjZmc6IEJ5cGFzcyBNdWx0aS1UaWxlIGNv
bmZpZ3VyYXRpb24gZnJvbSBNVENGRyByZWdpc3RlciAqLw0KPj4gICAJCXU4IGJ5cGFzc19tdGNm
ZzoxOw0KPj4gKwkJLyoqIEBza2lwX3Bjb2RlOiBza2lwIGFjY2VzcyB0byBQQ09ERSB1QyAqLw0K
Pj4gKwkJdTggc2tpcF9wY29kZToxOw0KPj4gICAJCS8qKiBAc3VwcG9ydHNfbW1pb19leHQ6IHN1
cHBvcnRzIE1NSU8gZXh0ZW5zaW9uL3MgKi8NCj4+ICAgCQl1OCBzdXBwb3J0c19tbWlvX2V4dDox
Ow0KPj4gICAJCS8qKiBAaGFzX2hlY2lfZ3NjZmk6IGRldmljZSBoYXMgaGVjaSBnc2NmaSAqLw0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYw0KPj4gaW5kZXggMmZhZTQ1YjlkODhlLi4wNWIwYWE5ZjJhYjcgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPj4gQEAgLTYxLDYgKzYxLDcgQEAgc3RydWN0IHhlX2Rl
dmljZV9kZXNjIHsNCj4+ICAgDQo+PiAgIAl1OCBoYXNfbGxjOjE7DQo+PiAgIAl1OCBieXBhc3Nf
bXRjZmc6MTsNCj4+ICsJdTggc2tpcF9wY29kZToxOw0KPj4gICAJdTggc3VwcG9ydHNfbW1pb19l
eHQ6MTsNCj4+ICAgfTsNCj4+ICAgDQo+PiBAQCAtNTc4LDYgKzU3OSw3IEBAIHN0YXRpYyBpbnQg
eGVfaW5mb19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPj4gICAJeGUtPmluZm8ubWVkaWFf
bmFtZSA9IG1lZGlhX2Rlc2MgPyBtZWRpYV9kZXNjLT5uYW1lIDogIm5vbmUiOw0KPj4gICAJeGUt
PmluZm8uaGFzX2xsYyA9IGRlc2MtPmhhc19sbGM7DQo+PiAgIAl4ZS0+aW5mby5ieXBhc3NfbXRj
ZmcgPSBkZXNjLT5ieXBhc3NfbXRjZmc7DQo+PiArCXhlLT5pbmZvLnNraXBfcGNvZGUgPSBkZXNj
LT5za2lwX3Bjb2RlOw0KPj4gICAJeGUtPmluZm8uc3VwcG9ydHNfbW1pb19leHQgPSBkZXNjLT5z
dXBwb3J0c19tbWlvX2V4dDsNCj4+ICAgCXhlLT5pbmZvLnRpbGVfbW1pb19leHRfc2l6ZSA9IGdy
YXBoaWNzX2Rlc2MtPnRpbGVfbW1pb19leHRfc2l6ZTsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNv
ZGUuYw0KPj4gaW5kZXggNGEyNDBhY2Y3NjI1Li5iMzI0ZGMyYTVkZWIgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3Bjb2RlLmMNCj4+IEBAIC02MSw2ICs2MSw5IEBAIHN0YXRpYyBpbnQgcGNvZGVfbWFp
bGJveF9ydyhzdHJ1Y3QgeGVfZ3QgKmd0LCB1MzIgbWJveCwgdTMyICpkYXRhMCwgdTMyICpkYXRh
MSwNCj4+ICAgew0KPj4gICAJaW50IGVycjsNCj4+ICAgDQo+PiArCWlmIChndF90b194ZShndCkt
PmluZm8uc2tpcF9wY29kZSkNCj4+ICsJCXJldHVybiAwOw0KPj4gKw0KPj4gICAJbG9ja2RlcF9h
c3NlcnRfaGVsZCgmZ3QtPnBjb2RlLmxvY2spOw0KPj4gICANCj4+ICAgCWlmICgoeGVfbW1pb19y
ZWFkMzIoZ3QsIFBDT0RFX01BSUxCT1gpICYgUENPREVfUkVBRFkpICE9IDApDQo+PiBAQCAtMjQ5
LDYgKzI1Miw5IEBAIGludCB4ZV9wY29kZV9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+PiAgIAlp
bnQgdGltZW91dF91cyA9IDE4MDAwMDAwMDsgLyogMyBtaW4gKi8NCj4+ICAgCWludCByZXQ7DQo+
PiAgIA0KPj4gKwlpZiAoZ3RfdG9feGUoZ3QpLT5pbmZvLnNraXBfcGNvZGUpDQo+PiArCQlyZXR1
cm4gMDsNCj4+ICsNCj4+ICAgCWlmICghSVNfREdGWChndF90b194ZShndCkpKQ0KPj4gICAJCXJl
dHVybiAwOw0KPj4gICANCj4+IEBAIC0yODAsNiArMjg2LDkgQEAgaW50IHhlX3Bjb2RlX3Byb2Jl
KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+PiAgIHsNCj4+ICAgCWRybW1fbXV0ZXhfaW5pdCgmZ3RfdG9f
eGUoZ3QpLT5kcm0sICZndC0+cGNvZGUubG9jayk7DQo+PiAgIA0KPj4gKwlpZiAoZ3RfdG9feGUo
Z3QpLT5pbmZvLnNraXBfcGNvZGUpDQo+PiArCQlyZXR1cm4gMDsNCj4+ICsNCj4+ICAgCWlmICgh
SVNfREdGWChndF90b194ZShndCkpKQ0KPj4gICAJCXJldHVybiAwOw0KDQoNCg==
