Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1804FCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 13:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D914110E2F0;
	Mon,  2 Sep 2024 13:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="BvTYxGhf";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (mail-02-b.mailcontrol.com
 [85.115.56.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ABE10E2F0
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 13:50:21 +0000 (UTC)
Received: from rly48b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly48b.srv.mailcontrol.com (MailControl) with ESMTP id 482DoHlq091004
 for <intel-xe@lists.freedesktop.org>; Mon, 2 Sep 2024 14:50:17 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly48b.srv.mailcontrol.com (MailControl) id 482DnZ45080075
 for intel-xe@lists.freedesktop.org; Mon, 2 Sep 2024 14:49:35 +0100
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp17012031.outbound.protection.outlook.com [40.93.64.31])
 by rly48b-eth0.srv.mailcontrol.com (envelope-sender illevi@habana.ai)
 (MIMEDefang) with ESMTP id 482DnX2C079627 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Mon, 02 Sep 2024 14:49:35 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQQa1TC4EdwK8s43cEY+vMdh8ytQByfRfsNmcpq5XsvbdQwp3VSo2S9B8BNsTklNiQhoi+be1iYc6+TKLZ0ChfMvxaPHVauJ3cV5ns6B8ig2Vu5TcvpBBgGKS9UCtGFyhZrhQIZTRhQhC7F9d/kx6kScZtWfZlzQcD4KOYHJcU/xoj375z7+tfN9+Ypanrprk4nT8XVfF42Nv425nCznCGlAo0RUdfVVa+f+UJyUrIioOaJo9IQuXeK9PKIxX+ILh0iimCCrf2sgyIv04poBqv8ok7M2L0kkjfQKwiqEt2qcd9lUxSLeZYuw4fHhDf2cOQSpnGbCmOp316eHy9fh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RksSDbdF3dlZm9sBDZf1Ms9hg+nmjYOvRMCDR5g4p3Y=;
 b=xSTq7lXFT0XqguSB2sQax4as1Y9BNrMZn5LIZ0HEXfsaRFLynIhDXfZwYPPI3hRi9UFWwJSpKOy51MyLmfCeSBr+DRwAV2+Q0c4NcxWyBLVl7ls5+PuKkZA8f/z4XBqLQqGLapKZFgN+kfg4EDuYHNo6zzQXmTsRMNCtzx81DByw+8GCoKZuVq8jLsj8dK9Y3L9/8vjXc1rWub+hQ7FYUQ4kcquOu/L8FRQs+MPOszjk3Az4y5FqRnxaG8O0bVh835PHfWOuDx95hqSnIxqOfjfJnQsGTP+dERsH0Uuss34AIcAILFyv7/L/4qW6fnak+3fAGZHaxgAaeoxt5s7mLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RksSDbdF3dlZm9sBDZf1Ms9hg+nmjYOvRMCDR5g4p3Y=;
 b=BvTYxGhf5MKm43/VCw9YbUpbmmOPCG3Hlmq0J4UstOuuIEpDXH5b/95Bpa4jRRsQFq88JJ/0bZQ59Fi8hiJsUN2q3254f8J5AUA++CG/Acn7i/Pv2Yrgytz9HAg+bZCw22r84zNW+HPjZ17yTMHJWFNTkdrm+61VfmR1Ged/9MCBr4a+er6iWSOAVjdNopCTWzWkcXvx4pCwr56PjVSfM22qQnytx1DNYuS3kmFIdCkog689JwPfd7psZpnQbzwRpphq3tkJTAzu6bGl/ZUQDNTuKGbbYzeeLNGtDXyJBdIBlPA1yI5NyfjeN5JIfqZnqbWIquTS+YqU3/K2knWN6Q==
Received: from VE1PR02MB5487.eurprd02.prod.outlook.com (2603:10a6:803:115::17)
 by DU4PR02MB11097.eurprd02.prod.outlook.com (2603:10a6:10:581::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 2 Sep
 2024 13:49:32 +0000
Received: from VE1PR02MB5487.eurprd02.prod.outlook.com
 ([fe80::dad5:9548:aab2:219d]) by VE1PR02MB5487.eurprd02.prod.outlook.com
 ([fe80::dad5:9548:aab2:219d%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 13:49:32 +0000
From: Ilia Levi <illevi@habana.ai>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, Ilia Levi
 <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "koby.elbaz@intel.com" <koby.elbaz@intel.com>,
 "yaron.avizrat@intel.com" <yaron.avizrat@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe: separate memirq reset/postinstall from vf
Thread-Topic: [PATCH v2 5/5] drm/xe: separate memirq reset/postinstall from vf
Thread-Index: AQHa+StYW2waEMJcoU6qtIWEyn/8YLI9I0UAgAdoQ4A=
Date: Mon, 2 Sep 2024 13:49:31 +0000
Message-ID: <62afc5b3-5f21-47f7-a21d-138c3e2b8388@habana.ai>
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-6-ilia.levi@intel.com>
 <1429c1eb-91b8-43e0-9e3d-51b2367f2b9d@intel.com>
In-Reply-To: <1429c1eb-91b8-43e0-9e3d-51b2367f2b9d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR02MB5487:EE_|DU4PR02MB11097:EE_
x-ms-office365-filtering-correlation-id: 11c966bf-489c-4cf3-d28d-08dccb56129c
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QnJTODNkUkdsazJ4anBYZ1pTblUwN3Ryb2ZpdHNQaW5JSWtuOE1KTkV3Z2VC?=
 =?utf-8?B?WWR5dFZLQllUNndqTFp5ZVc0VWZKcGl4R2FOUGdFL05UaUovUi8yRDZyenRz?=
 =?utf-8?B?VDAvNmxvRllQWXh1cms1UHVWZ2IrRUxwOW1NNFhvYW1IYUNrOXV5TVpoTGxL?=
 =?utf-8?B?a2FhZ3JJSU1ZOUw4V1ZtUjF3dTVVaW9yWU5iR29hM25XejhjcStOanNFQWJM?=
 =?utf-8?B?MXhEWjhXaldXcVkrbjQyUWMxUnpwV0xrSlVWbzdTcFJIakViTXl0U2piVldS?=
 =?utf-8?B?Wm9ENEczNnpPTmdwZDN5ZzZNR0lzSnh2QUVIVDRIR1hiNjdTbEg4Z25Dd201?=
 =?utf-8?B?WmN0NTZiQWJJZ1RRTGgvbU95TGVDOU4zTDFMT2VWS0JtT1FIRGw1RzZSTHhT?=
 =?utf-8?B?bVJSS1pLd01sanMxMDNrVjdja1lZeWdCNk53cHZvNU1hSzY5dktpTnZxWnRy?=
 =?utf-8?B?aStMSEpGYmRDWEpud1dZNUJEa1g4Ulp2S3d6MStlSE5OejJSVWRGR0pwbVp5?=
 =?utf-8?B?Y3ZtbTdhdFZyL21nQlZFRUZwSEZKb2xVQzZ1RnAwREUwSVhUZmJWUHorRTJE?=
 =?utf-8?B?TlV2OEt4bGM2eWtzOFh1aGJuRHlmNEZFTU96QWdHWkRYQ1lFcGN1SFcwTWlO?=
 =?utf-8?B?dXg0ZHRNVVVoa21FMityR003VG81QkhVREYrTUoveWJITUI0TXdidFYyOTVU?=
 =?utf-8?B?VVQ0K3M4RW95U0Zta3BiRm5zNW0wL3lQSzRWRWtEYlUyVEl0d2QraTI4WDd5?=
 =?utf-8?B?MGdhVUJZVHN2THp1RVhCWlVHQVZzdlFVaTIrU05uMnpHVUswOU9mMWErUDVM?=
 =?utf-8?B?ZnArcTN6Q3RzZFRGcjd2RTZUSzV2aXpBK2tQeDF4cDFTSThSWkp0aitvVXpI?=
 =?utf-8?B?dENDV1JROXR0Q2lhT3gvM3lSVUVtSTY3Sit1czZOMGN5VDFzMHhLMHNQcldU?=
 =?utf-8?B?VGpCak92N1BvS0Y4UjNHd3ppRzEvVzNDRkZaeGlObncrOHdHMkZmZE8xVWR5?=
 =?utf-8?B?VXBUUmV0a3BtcXR6OXpaYnF2RnlvRVRxNndDWGdNR2FiM2ZJcks2T3FZT0s2?=
 =?utf-8?B?VjU4RmNCVzJKakVoTVllbDdnKzlncmNvc2VWNllqaWxEWDJHNDh1c2hRUG9Z?=
 =?utf-8?B?b25Id3htaFd5Y0liV21RT21LN0wvSUZEcHZvVXVUcFF4L3JPOCtuemNISjFN?=
 =?utf-8?B?WXJ3dmZPUkZ6eW5rbDFadUtmYzNsN3R5cHBtbmYxN08xdFlTdk9BdmtOelhT?=
 =?utf-8?B?WS9iZ0djcVVZTFhWazdReHZINzRQT3lac2hGNWFKbmRjdmh6TUVacnBtUjE3?=
 =?utf-8?B?dWN5WGVDQmpXZmVvWjRXbW0xbVBUY2JaVlNKTFk2by8xaG03Tkd2MHQxNXlQ?=
 =?utf-8?B?dTJpZ29YTEVmaHQ4cERZSXpjMlBvKzB0cG11Yk5HMGYzdkNScmhtU2l3U1FC?=
 =?utf-8?B?NmJpcVpYdmo5R1lkSmppODNBUGg5WUQ5NnBsZ1hpUTdvSE83WjhJdkNrc2hH?=
 =?utf-8?B?S0tuc0t6cndXdVNJR2VteWc5Tm5LUkRtUFRsWkxKVUdNREgzMFR4K0RaVWVi?=
 =?utf-8?B?d3BGZk9LQXVPdU9QWGdCTWcvODRUVWVtMHhNbGkwQlE0MVN1YVFrV2ZNV3dz?=
 =?utf-8?B?ZWxFcUhFNDRINVNialhYbVBaM3c1ZmNRUkgxckt4OHhWdTdrb0U5aGRyMnN0?=
 =?utf-8?B?QUt2blYvV1NKTzVHVjBMOTZJM2xiMFVsUzZUYklPelFYOVo1OHE1M0UyVUk3?=
 =?utf-8?B?TUdJckh6RzhId3liT3l2MXovSGRKd25CTkg5YmtqQkk5YmVtd0JOcFNQZXJa?=
 =?utf-8?B?OHlJNDlIMnJuRmEzbUlTTlJZSGtsT3JEYlJkYVZYdjlZaTArWE0xY0FnV3Fo?=
 =?utf-8?B?ZXpLSmpZeERENkYwK1pwMmRNallqZk1mM2lTdzBaUFJVcEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR02MB5487.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmE2d21GaHA1V1hTNklhZ0h5c3BrekNOcW5NYzIzeVFjT3NkcTM0c3dNL0pL?=
 =?utf-8?B?MXFhVEM1cEVoK3VIeTZCdlh3dnVleWZNYVQzV25SY3N6REdCbjc0am5GMitx?=
 =?utf-8?B?eTlBbGg5SjBwcXZhQVc5K3VXMzgzMFhmRVZvWldOQVdxMS8vYkY2LzdHTzVr?=
 =?utf-8?B?WUllN1VlT3NmZjd4ZXRWanFhSjh2am05eGlNL0RhT2pQa3JTRGtWUmZrWWFo?=
 =?utf-8?B?eloyV0FrM3RJZnF6VEpRR0ZOVG5SNWRjc2FjK3E5cTZhYWpPM3NqRklpT0xr?=
 =?utf-8?B?TWU5ckNWNE9yN0FJRnZQVmdjWE9kUG8vWk1WOGJLRzlZN01qVnpicnU2eVJM?=
 =?utf-8?B?MEszcDdjaFlNa2JyQ1BXakJSMXhxMUsxL3FyeUtDcGtQN0ZSSmJldWhkYW1Y?=
 =?utf-8?B?UFhodUtxVDFWVlNrRFVFbENhNEZxUGJXM21aZkI4VDRtdldnams0V0I1cmxD?=
 =?utf-8?B?cXA2OUZnSDk0WnpVMEwzSzkzdEJqbjVBaXg0bTNnekRwVHlnSTY0WVFIRDFL?=
 =?utf-8?B?SDlhRXdhb3BTVnJqVzZ0N2drbFc5ZURZTHEwSmNlZDY3Z1Q0YUdPTmxUZXNm?=
 =?utf-8?B?dDdLWTBUc3BtUlZmL0JRYlFkWlVTaUpxS0g5cUQ2eWkyRGlCMW4zcVc3bU9T?=
 =?utf-8?B?RlVjbW5wUTRNekp1VldvMTV6QnorNmRUczJHOUtkeERVYWE5L05xdHdmckhx?=
 =?utf-8?B?NDNZQldNTDFCYmkxS3ZDRlZ5WEJ2aElwTjVmS2Q3SnMvcGJaZUI5N2FlUW5I?=
 =?utf-8?B?SWRnWTlsSzd6cWFWY3c1RUhkT1NhQnFUMUJZOWVXY0xrOG5JOEJQWWgxYml6?=
 =?utf-8?B?SC8vcFlHZDMrT2d3eXFzU2RZNFpLZmF4bnJoZGsyZUp5Q09QWnFXTkdxUlBH?=
 =?utf-8?B?QXpXQ2VaUUNtZVFaUzJtNzNocmYwdWxNMGRQN1hWWS9sbmVCbDNvbUdPZE9N?=
 =?utf-8?B?NnRUVm45S2F6QldJYzh0VDJGRlVwaDVETU9zZkRDS0dSQWloOEtVV2NJbFRP?=
 =?utf-8?B?WjR0REQ2Z3MxRnNXNkU1WmNLVER5YnFYbCtaT2ZWUUxheG82Z1J5ZVJGRGIv?=
 =?utf-8?B?Y2d6bjN6U3dzVXI0WEo0aktlSGh4bUQrNEQ3UkQ0OW82TXVINER1bmp3T3RC?=
 =?utf-8?B?RkxzNFZuaDg4WExaZGdBNnl5VGJIalVNSFR3cGNoVWZWcVN1dzMxdnUrcVBn?=
 =?utf-8?B?T2VvM2N2Y2ExOTZ0REQ3VVFSd1hRYjBITW5YRC9BcFBiVnVWYmhDRWl4MXNj?=
 =?utf-8?B?SzZLZTdRVUYwZjdiQmJua0M4TjU0M1NBbWdtalBMYzdrb01SaEg3TEtZY1ZN?=
 =?utf-8?B?SjFvTTZVQkxvYmVxWko2Zy9QT010aVQ0VzhCZUlQcXNEOVFUTi9FR0EzYUE1?=
 =?utf-8?B?bVozaWtHLzVlVUgwaGVNekQyQjJDdGYyeUlaRmxaL3BMTnR3SHBhQUsvSS96?=
 =?utf-8?B?VC9DeUhrc2tVSzZod1pxNVhjQXRwa2ZmS3ZkN0xqSGduNWR1ejkwTVZMdTRm?=
 =?utf-8?B?RkRSU0NpSzdmL0xXcEJiMEllc3BGcThlMk8ySUl5U2pSakYyZ296NkpHUUI5?=
 =?utf-8?B?Y0NKWXZCQ3ZzcjZ5WmR0WE13cTNTaW1zdG5EMGQxaWtJZFRMWmxMZGJVZnVE?=
 =?utf-8?B?T3JTTXR1bFZTWDJ0NGNJZEoyUzVTcEMxdngyRndNNTJ5ajVGTkNlTldaVmk5?=
 =?utf-8?B?V3A0dzdpRE9HQU9XTmZjV25ZUVRUWHpTN1RiS2poY1YrRzVES3FNdGY5anZ4?=
 =?utf-8?B?cncrbWtBTlgyZjdWa3RCYUZzM1NxeWR6NEJSNzhZeXhrcmd5bU5Lb0hCMGIz?=
 =?utf-8?B?cWNsUDNKVCtwOTZ4Q05tQmRld0tqYkErcEZCY3JaWHdpSzRFckFUUzJlZy9w?=
 =?utf-8?B?U0JQUDlaOHhFUU9uTWlPMDJDNFhUNkZDdUlVSy83YUlkMGtMYjFJRkJGSHkx?=
 =?utf-8?B?UmFMSHdBTG1KMWQwUFlseXlWUGlGc3V1V1oxTWc3VVJwaTVMeTYwSXNIVG9p?=
 =?utf-8?B?RElGMEwwNnZDYmZEWURnMXBmc1RrWDd0MG9vbzF2RmFKWGNxZkI0WVhKZmhj?=
 =?utf-8?B?T0x6MFFjUitQNTNrTFZhK05yb2lzbWdPSW5ieW1zVVlNdE9QOFhCbzJQVU5I?=
 =?utf-8?Q?5t3U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D865C4282CAD6B40851E0F01515C7DDF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3/Zo2LNGsvFyyEktFzefcv3rpv5ANaO8FCWNN+ULEsBuLiLeWqt0Ic7Z/vPA1DAUIX+Qf97NxPRwrO+M13JETol7s/dkcOupXnNf+bKwmw/KfZocyUZjV6C2OSOlsMFqhqviDC2M5X+w4ifmtEjkPnMtBNcItQNhMwHhqsVfbEJKdxOX6IZ4zhDn3/9AJ5EiB9z6hQ+hSHzX2iP4OPEZlj/SELp+Mjm5QUDzL8ixHlHmEtYbXoa2gXGahLIoNVyoIaMMuK3xN994/ElJcKKaqEt+MKoFVS+3oOEtVREAWsy7zZ1QwYZHT075puosmyNl1ggUzVuNmdu6JPeMhz8A2qp/oSYv1Kkhevz1X45TtylrZt9R57VXR3SNKCkSbkgu137h/6Lhn7Er8tQGxUBFoQNBlKg72v2kj8dpdiFtJndA2ml4RrUA3a0j2Mx0kHSPpg9SuYreW3Pu+9pkGz+lw1u/Lhkgx3ibHsG1l4bQ7bSZ/IOZ08bBJK33tE872WsXlLtZFxAwRLajDv/femu7t01gEQXHPGFX2RL9gzB51UxmNW9UExNDbxin551AYRthH8dRkkT3wVjB7pCU9MubTdlqfAELSOpf9dDyXZNUtizEIZOPtguq8rDwjIsfbdCY
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR02MB5487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c966bf-489c-4cf3-d28d-08dccb56129c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 13:49:31.9452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +x6kXKvbn7xmy1kl/4v5Iw9z+HASZYMu7Ohet8CAG4/0+xBLK9TCddUGIEgN4/R5HYD88PcSnpUXJmW10ftI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11097
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyNTI4NTAxNzpGUEtleTEucHJpdjpzuKCGlzeCwK9GKJRIbntvLd2FQS2AO7yZUkLD9wPnHbiDzcLefXLo5XGcteIxTCZJpAGtGjTDq1OlblF7jiER8e6nxs2ixLlblm0qI3QnzLEeKVBTeUIt4rbU27RfirdBTHYCHtWG1xbZqfEzYq6+ZYSYgYdpsqIrq7fSOP+xqPGg/2CioNdTTYiUdfq9itPdMQysZJzr9Nudik//QvTLmpFz3tNfFUL/tATTijVm+zHBO4jbTy/JicT/rjRG3WrkM6Ld/v2kSbFmfF0/DCCgM3DykXQgMzhlBu2kOGimR6aZS+nIwQpghH5u1y6tt2/AXNHdahp6avL7RjyMnrPN
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.158
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

T24gMjgvMDgvMjAyNCAyMzo0MiwgTWljaGFsIFdhamRlY3prbyB3cm90ZToNCj4gDQo+IA0KPiBP
biAyOC4wOC4yMDI0IDExOjE4LCBJbGlhIExldmkgd3JvdGU6DQo+PiBVcCB1bnRpbCBub3cgb25s
eSBWRiB1c2VkIE1lbW9yeSBCYXNlZCBJbnRlcnJ1cHRzIChtZW1pcnEpLg0KPj4gTW92aW5nIHJl
c2V0L3Bvc3RpbnN0YWxsIGZsb3dzIG91dCBvZiBWRiB0byBjYXRlciBmb3Igb3RoZXIgdXNhZ2Vz
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IElsaWEgTGV2aSA8aWxpYS5sZXZpQGludGVsLmNvbT4N
Cj4+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5j
b20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfCAgMiArLQ0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCB8ICA2ICsrKysrKw0KPj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9pcnEuYyAgICB8IDM2ICsrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0NCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4+IGluZGV4IGM0ZjhiZmQwOGIw
OS4uYTIzZmIwYzgxY2E2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4+IEBAIC02
NjAsNyArNjYwLDcgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkN
Cj4+ICAJCWVyciA9IHhlX2dndHRfaW5pdF9lYXJseSh0aWxlLT5tZW0uZ2d0dCk7DQo+PiAgCQlp
ZiAoZXJyKQ0KPj4gIAkJCXJldHVybiBlcnI7DQo+PiAtCQlpZiAoSVNfU1JJT1ZfVkYoeGUpKSB7
DQo+PiArCQlpZiAoeGVfZGV2aWNlX25lZWRzX21lbWlycSh4ZSkpIHsNCj4+ICAJCQllcnIgPSB4
ZV9tZW1pcnFfaW5pdCgmdGlsZS0+bWVtaXJxLCBmYWxzZSk7DQo+PiAgCQkJaWYgKGVycikNCj4+
ICAJCQkJcmV0dXJuIGVycjsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4+IGluZGV4IGYwNTJj
MDZhMmQyZi4uNGJhMDc2MTcwODRjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4+
IEBAIC05LDYgKzksNyBAQA0KPj4gICNpbmNsdWRlIDxkcm0vZHJtX3V0aWwuaD4NCj4+ICANCj4+
ICAjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgiDQo+PiArI2luY2x1ZGUgInhlX3NyaW92Lmgi
DQo+PiAgDQo+PiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgeGVfZGV2aWNlICp0b194ZV9kZXZpY2Uo
Y29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICB7DQo+PiBAQCAtMTU0LDYgKzE1NSwx
MSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGVfZGV2aWNlX2hhc19tZW1pcnEoc3RydWN0IHhlX2Rl
dmljZSAqeGUpDQo+PiAgCXJldHVybiBHUkFQSElDU19WRVJ4MTAwKHhlKSA+PSAxMjUwOw0KPj4g
IH0NCj4+ICANCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgeGVfZGV2aWNlX25lZWRzX21lbWlycShz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+ICt7DQo+PiArCXJldHVybiBJU19TUklPVl9WRih4ZSkg
JiYgeGVfZGV2aWNlX2hhc19tZW1pcnEoeGUpOw0KPj4gK30NCj4gDQo+IG1heWJlIHdvcnRoIHRv
IGludHJvZHVjZSB0aGlzIGhlbHBlciBlYXJsaWVyIGluIHRoZSBzZXJpZXM/DQo+IA0KPj4gKw0K
Pj4gIHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgc2l6
ZSk7DQo+PiAgDQo+PiAgdm9pZCB4ZV9kZXZpY2Vfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+PiBp
bmRleCAxOGE1MjcyZDliYjAuLmEwODBkNDg2OWIxNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9pcnEuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5j
DQo+PiBAQCAtNTU5LDE3ICs1NTksMTUgQEAgc3RhdGljIHZvaWQgdmZfaXJxX3Jlc2V0KHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPj4gIA0KPj4gIAl4ZV9hc3NlcnQoeGUsIElTX1NSSU9WX1ZGKHhl
KSk7DQo+PiAgDQo+PiAtCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA8IDEyMTApDQo+PiAtCQl4
ZWxwX2ludHJfZGlzYWJsZSh4ZSk7DQo+PiAtCWVsc2UNCj4+ICsJaWYgKEdSQVBISUNTX1ZFUngx
MDAoeGUpID49IDEyMTApIHsNCj4+ICAJCXhlX2Fzc2VydCh4ZSwgeGVfZGV2aWNlX2hhc19tZW1p
cnEoeGUpKTsNCj4+IC0NCj4+IC0JZm9yX2VhY2hfdGlsZSh0aWxlLCB4ZSwgaWQpIHsNCj4+IC0J
CWlmICh4ZV9kZXZpY2VfaGFzX21lbWlycSh4ZSkpDQo+PiAtCQkJeGVfbWVtaXJxX3Jlc2V0KCZ0
aWxlLT5tZW1pcnEpOw0KPj4gLQkJZWxzZQ0KPj4gLQkJCWd0X2lycV9yZXNldCh0aWxlKTsNCj4+
ICsJCXJldHVybjsNCj4+ICAJfQ0KPj4gKw0KPj4gKwl4ZWxwX2ludHJfZGlzYWJsZSh4ZSk7DQo+
PiArDQo+PiArCWZvcl9lYWNoX3RpbGUodGlsZSwgeGUsIGlkKQ0KPj4gKwkJZ3RfaXJxX3Jlc2V0
KHRpbGUpOw0KPj4gIH0NCj4+ICANCj4+ICBzdGF0aWMgdm9pZCB4ZV9pcnFfcmVzZXQoc3RydWN0
IHhlX2RldmljZSAqeGUpDQo+PiBAQCAtNTc3LDYgKzU3NSwxMSBAQCBzdGF0aWMgdm9pZCB4ZV9p
cnFfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+PiAgCXN0cnVjdCB4ZV90aWxlICp0aWxl
Ow0KPj4gIAl1OCBpZDsNCj4+ICANCj4+ICsJaWYgKHhlX2RldmljZV9uZWVkc19tZW1pcnEoeGUp
KSB7DQo+PiArCQlmb3JfZWFjaF90aWxlKHRpbGUsIHhlLCBpZCkNCj4+ICsJCQl4ZV9tZW1pcnFf
cmVzZXQoJnRpbGUtPm1lbWlycSk7DQo+PiArCX0NCj4+ICsNCj4gDQo+ICJlbHNlIiBvciAicmV0
dXJuIiA/DQo+IA0KDQpJIGhvcGUgdG8ga2VlcCB0aGlzIGNoYW5nZSBjb21wbGV0ZWx5IGVxdWl2
YWxlbnQgZm9yIHRoZSBwcmV2aW91cyBmbG93cyAtIGJvdGggVkYgYW5kIG5vbiBWRi9ub24gTVNJ
LVguDQpGb3IgYSBudW1iZXIgb2YgcmVnaXN0ZXJzIGJlbG93IGl0J3Mgbm90IGV4YWN0bHkgY2xl
YXIgd2hldGhlciB0aGV5IG5lZWQgdG8gYmUgc2V0IGZvciBNU0ktWCBvciBub3QsIGJ1dCBJJ2Qg
cmF0aGVyIGZpeCB0aGUgTVNJLVggY2FzZSB3aGVuIG5lZWRlZCB0aGFuIGFjY2lkZW50YWxseSBi
cmVhayBhIHdvcmtpbmcgbm9uIE1TSS1YIGZsb3cuDQotIElsaWENCg0KPj4gIAlpZiAoSVNfU1JJ
T1ZfVkYoeGUpKQ0KPj4gIAkJcmV0dXJuIHZmX2lycV9yZXNldCh4ZSk7DQo+PiAgDQo+PiBAQCAt
NjA0LDEzICs2MDcsNiBAQCBzdGF0aWMgdm9pZCB4ZV9pcnFfcmVzZXQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUpDQo+PiAgDQo+PiAgc3RhdGljIHZvaWQgdmZfaXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlKQ0KPj4gIHsNCj4+IC0Jc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+PiAtCXVu
c2lnbmVkIGludCBpZDsNCj4+IC0NCj4+IC0JZm9yX2VhY2hfdGlsZSh0aWxlLCB4ZSwgaWQpDQo+
PiAtCQlpZiAoeGVfZGV2aWNlX2hhc19tZW1pcnEoeGUpKQ0KPj4gLQkJCXhlX21lbWlycV9wb3N0
aW5zdGFsbCgmdGlsZS0+bWVtaXJxKTsNCj4+IC0NCj4+ICAJaWYgKEdSQVBISUNTX1ZFUngxMDAo
eGUpIDwgMTIxMCkNCj4+ICAJCXhlbHBfaW50cl9lbmFibGUoeGUsIHRydWUpOw0KPj4gIAllbHNl
DQo+PiBAQCAtNjE5LDYgKzYxNSwxNCBAQCBzdGF0aWMgdm9pZCB2Zl9pcnFfcG9zdGluc3RhbGwo
c3RydWN0IHhlX2RldmljZSAqeGUpDQo+PiAgDQo+PiAgc3RhdGljIHZvaWQgeGVfaXJxX3Bvc3Rp
bnN0YWxsKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gIHsNCj4+ICsJc3RydWN0IHhlX3RpbGUg
KnRpbGU7DQo+PiArCXVuc2lnbmVkIGludCBpZDsNCj4+ICsNCj4+ICsJaWYgKHhlX2RldmljZV9u
ZWVkc19tZW1pcnEoeGUpKSB7DQo+PiArCQlmb3JfZWFjaF90aWxlKHRpbGUsIHhlLCBpZCkNCj4+
ICsJCQl4ZV9tZW1pcnFfcG9zdGluc3RhbGwoJnRpbGUtPm1lbWlycSk7DQo+PiArCX0NCj4+ICsN
Cj4+ICAJaWYgKElTX1NSSU9WX1ZGKHhlKSkNCj4+ICAJCXJldHVybiB2Zl9pcnFfcG9zdGluc3Rh
bGwoeGUpOw0KPj4gIA0KDQo=
