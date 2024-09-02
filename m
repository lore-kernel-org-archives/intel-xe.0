Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709CDCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 13:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4F810E09D;
	Mon,  2 Sep 2024 13:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="dx13XeYf";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FC010E09D
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 13:40:03 +0000 (UTC)
Received: from rly07b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly07b.srv.mailcontrol.com (MailControl) with ESMTP id 482DdpYk243734
 for <intel-xe@lists.freedesktop.org>; Mon, 2 Sep 2024 14:39:51 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly07b.srv.mailcontrol.com (MailControl) id 482Dcrmu229605
 for intel-xe@lists.freedesktop.org; Mon, 2 Sep 2024 14:38:53 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by rly07b-eth0.srv.mailcontrol.com (envelope-sender illevi@habana.ai)
 (MIMEDefang) with ESMTP id 482DcorX228998 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Mon, 02 Sep 2024 14:38:53 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQkAM21xQnUynsMGjk/nguToSQkcYdEpECqZ+guU1M6tvKRRA8aMrn4Zoyyn8MC2JPcI7/rHQgnwSEpwtfT+W49aeaO2EY0oDFmjp7Xq02ME23mX61iBXu3fFrJqeEtfmw67hzkp8DklcbZijnw2XoeVneVSciIC93s5C/3huWa1V4l5l3X7RlDwUqxK1TlkKrqOKfp4qZtwviOhHDeYReYS+1A+afOsWYsdUm9ZJNLLGeMSXvbU0qiQrdHOg+BzHPpxgvkWggyXqciTtsKNeL5vRlquPJ6YimG/HGDArNd3cItLu+/e5/LmOLiJUJUwpBS1Q87D8binPRgS+4nXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1936ubNcDeFiDLnvWyNFm/x+U/l1HI0VrzzqzvaImfk=;
 b=pdhn+TIwJ6yiiJ6xdhU4mdwHBBzf0q078AbzDieqHrEuTvkoNr9SFfE3r9pV8KRPv//F3aSp1eLzyIk5VWFSVEwuWYfOhSIT+KKqQrAtbTpt2C09h5Fny/l2jiaHlVVO/tP0f/CDUNxIQYo4ijuhXedzt5mlukoZBUcEAhTrqoTyqJF8ssYNPYwqyZiiFe71Qqo5nL7HrgMU7/FgpE4/vOtZCvPDWAu4Ojh75MqM3BSHEG9ifNEm0TrMRyH8hB02O/RqX2i9RdZkfB0UN6nba54v3IIT1ims/ReYlB2VZnm5El9LAFB5jmhrwH2HE9JAflRKxhS0aLgo0dqVh6AQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1936ubNcDeFiDLnvWyNFm/x+U/l1HI0VrzzqzvaImfk=;
 b=dx13XeYfOlFaQwXL1LXIkMTlRxusq3/oZX6Z/OlirGxqPDNeRpCpJa/c98t2IjJMXZ/5K4MlEQi0xwNuxcBxVtH34iAigJGlv5eM5UZEYG8THPcADtQWUnRoYC/zXZ8sF+d4pq8Zr+GYZUmBmr+gDuAtrLmizLUDPQ/1ENE/ydFw2QWGe2vR19s0lssgRnKZXsRisinTmaPPWvoz/m7i404eZCHj+jN1GYb1n4N7YwAsVhOZ7KipEg8Bq+cqXFtAnDHwcbxs5447hbsqD0rVRfCwCIdHPqE5kkzFRIuz5C0wHYMfxW+/KEIntRK8KQB006H4C+oC0utCF4SRqxishw==
Received: from VE1PR02MB5487.eurprd02.prod.outlook.com (2603:10a6:803:115::17)
 by AM7PR02MB6020.eurprd02.prod.outlook.com (2603:10a6:20b:1a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 13:38:48 +0000
Received: from VE1PR02MB5487.eurprd02.prod.outlook.com
 ([fe80::dad5:9548:aab2:219d]) by VE1PR02MB5487.eurprd02.prod.outlook.com
 ([fe80::dad5:9548:aab2:219d%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 13:38:48 +0000
From: Ilia Levi <illevi@habana.ai>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, Ilia Levi
 <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "koby.elbaz@intel.com" <koby.elbaz@intel.com>,
 "yaron.avizrat@intel.com" <yaron.avizrat@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe: memirq handler changes
Thread-Topic: [PATCH v2 4/5] drm/xe: memirq handler changes
Thread-Index: AQHa+StagVHwFrtHb0GFco32zbi3LbI9IkEAgAdmSAA=
Date: Mon, 2 Sep 2024 13:38:48 +0000
Message-ID: <1c7f42a1-9aaf-4efe-820d-a5596e8c51c7@habana.ai>
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-5-ilia.levi@intel.com>
 <26a834a0-7522-412b-8e23-597ba3ab701e@intel.com>
In-Reply-To: <26a834a0-7522-412b-8e23-597ba3ab701e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR02MB5487:EE_|AM7PR02MB6020:EE_
x-ms-office365-filtering-correlation-id: e998bb8d-6cd5-4182-c0b5-08dccb5492fd
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q0RLNThVNW02K1Bxc3pQTitFeGJrUVNUa3VsMWtIRHNCOTRWajQrRyt0Njc2?=
 =?utf-8?B?ZC9xMkM4MzBqY28wcThrTFFmUldjTUQzV1Nkd2wzQmp1S3BYSGtUemlMNmlh?=
 =?utf-8?B?ajhzTVVIZmVWaXViNVdOV3JkbkIyU3dDNzEvelAzNmRLeUlXNTg4ckJCV2lh?=
 =?utf-8?B?T1Z0eUZRWjJOWkhMRWJmL3BaMmozcGtXanhPS1Jrbnh3V0JacXJ2bWlHTlpx?=
 =?utf-8?B?MENPdDE4SUxub3VNZnpWcXJWTi85Tkk3dStJZG9ic1hSWno2T0toQ3JHTzlC?=
 =?utf-8?B?ak9rQ3IveUtqSWVWdnkveWRmTXB5V0dMemhqWUtDVU5UVURDaHZUU2N6ZzU3?=
 =?utf-8?B?eUdBVnFPU1NCZEdwNjcyZC9VbloxNi9UYXdLTVozcEU0am80Q0dzajY5NFBJ?=
 =?utf-8?B?UWJmY3VXWU5kbjNmNnMxRkh5MHRIWmorS1VVV0lqZWhsdFp2WnFpd3lSMnh5?=
 =?utf-8?B?T2NHZGN5cXplTVRUaHRldVF5cGlDMlQ5Q01ZdXZMWjROYW9CMHEyRmZvZSt1?=
 =?utf-8?B?QnR5WGdwMkNqdGllRjRQS3IvYTJCZzFHeTVsRHNDUURYUEtNc2hSaTNaUW12?=
 =?utf-8?B?WktsVnpFZER4Sm5TVmhVODNEcTlpakQ0a2tZdklXWVliSDVFbU9LbTVQTDly?=
 =?utf-8?B?ZGxKYWxPVUIxNSsrN0lsUUJ0Z1RzOW9mbWZRTmpFUldrakh4aHpBNDdGUTRN?=
 =?utf-8?B?R0FQZEZHVlowaVhFUXBCQlRuR0d5bFdZZVpRZ200b096dkFvMmhRYXM5bEsy?=
 =?utf-8?B?eUNrS3Z4dktEQ2JWQ2ZabjI3eEFRVms2dVczdFovMHJZTWZrUGNjcG1mbXR6?=
 =?utf-8?B?VWNHRkZtRFhJNyt0Rmd4TkVFdWt3aG5yMHNXaUpsNXg3dE1Ya3ZZT2lSNno4?=
 =?utf-8?B?L1RoY2I2Y3plQjhtMk1ZY0lzeW95cmJNaDhvelF3NEVRSzl4T1NXUEZXWkw5?=
 =?utf-8?B?V1AyZEdtWHo5VE1SSVJrbzJNRVJEVlZwVWExRlo1eTBjTCs3Z3U3ck9kbElL?=
 =?utf-8?B?OUh4Wk5tUWpxNFFIWU5hNFQrTzJsY1hzZWViS3k2dVhORG5BWFZQb2lLZzhw?=
 =?utf-8?B?eHJTSGZhY1FxSy92ZkxLRVJtZWp5dFFrTFJKVFVZdS83eU9UL3Rsa3RpR1NN?=
 =?utf-8?B?QUNFZ3lGSjdrUlAxUE9IVDdLZUFwaFNUMXI1V1lpTTEvbnZvekdzUm5WQ2NW?=
 =?utf-8?B?a1BaTmdyd1d5RDdFY3JqNkNrY3YyVURQbldPSGVHYTFXb3pydjlHUUpMeXl4?=
 =?utf-8?B?RFU5VzR2Z0hwUmYvU3h6aHhJOTVGcDU4UG5Ya2Yvd0VqTGEzNHE5bVJUUSty?=
 =?utf-8?B?eDI4QnQ0S09VSzdWN3dvWTRjK3hpY1hxWElTQzRkQ0R3elZXandBcXNUWjBt?=
 =?utf-8?B?WXdyRUxNZ0piV1luSlExN3VEQ0w3RUUyNExneXNvbGpTNTFBK1NPZ2hiV2xj?=
 =?utf-8?B?OU1xdTRXSENkMWZhOU1GZlE5WG9JZjV5MEJFNzl5NVNUaEFlRVJ0cjdsNFQ2?=
 =?utf-8?B?ZW01Y1cwM0twZGR2cERDMzVnbmRsRkxqRzB6NUIwVnBWWHBseFdwdnh4bE94?=
 =?utf-8?B?L0l0WkZzR3cxeW9JYTVPNFpIQnpUckRWYTJLN0c0dmQxajIxQnJZbk05S3Ny?=
 =?utf-8?B?REw1R3BVSmJpNUdJaDZORnhWMXRGT29YYkI0WnlIc0ZFNWxMYzFEcG42a2hv?=
 =?utf-8?B?ejJPSGlmQ2dyV0dHbEVwd0VndlU3NGlZQXd5US9ybEIyUGt1VWNYc09TSUEv?=
 =?utf-8?B?dFBkS1pvVDRUazUvRm44eUo0T3JVQ3lmOFVEczA5ekszYjFQQlNVVUxkOHc0?=
 =?utf-8?B?Q05XMklsV2R2bWMrVXRJUk1PZ1d2RjZiRllWbUtCV0ZqY0sxaW9FbWFyekRa?=
 =?utf-8?B?cnhVWkNzVVErdU1vRWdzRjBrZ3lYeHNwZ3pyRVhpVGR5REE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR02MB5487.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUxpT0RhRmNHbWgzRi80aHJzcWptelB2dUlQcVdDdldZdWxhcWp6WC95a1Ez?=
 =?utf-8?B?dmxJTy8ybFhsSnBHU2VqMERjSVE3SVQrb0VvT2lDYWxVbFJnenBPTUM2YUo5?=
 =?utf-8?B?OUxZaW0ycGw2UEMrWlJVdS82ZmUwY212Tm5jd0UzQjM3NGg1OW9PSGVKS3c5?=
 =?utf-8?B?cElwQWtCcDVMZko5d1daY3lLanloNXJSaG5xbDFIWEtmdWpjRHVWdURNWnEw?=
 =?utf-8?B?ZVdSVDhibUJ5ck8wdDBOTjh6eDVrMlRJL2M1VTNvdm9CUVJvU2MrMEVHbVlG?=
 =?utf-8?B?MEh5RTZub1JRLzl6Uktqdk1rcDhNblk5bGlFZHBTdHNEaHJBa2VYMEY0VXVz?=
 =?utf-8?B?L1JxVGpydno4T2JzSWhRN3ZQc2FxUDBZL1UxVjR4ckw1d1J5SlJIcWhvWlhL?=
 =?utf-8?B?emFiYlprbkdlTUprYW91SmJ2anQ5bXJ2OWxjNytwRkdQamV4R1kyYUZnSlN6?=
 =?utf-8?B?OTBURmxtSHJLT2NkL2tVNlU0M2RoMkhUOUgyWHdUTWZ0bEJINWRaeWUxOXhV?=
 =?utf-8?B?a1N2L1ljdm5SV0ZKcjg5QVBMVTBnTnhOVkR0dmxWSThGMWNFejJlc0tsVjlK?=
 =?utf-8?B?YlNIOUJmZ1NMYVlkNmF6Y203NVZETUJVRHRvUnJzMnJjK0tYTDc1d0ErNW9V?=
 =?utf-8?B?QjlzcnhrdHNsdkE3b3EvaVhDRTkraURmK2Z1NVpJejF6MUswMExBeFIyYTJ4?=
 =?utf-8?B?N3FyMWRLN3RoYTNYN2l4emZRVi9BV3JrMlcrbVNwQWE3cSs2SHNONklHZmZm?=
 =?utf-8?B?ajJzcHI3R0xVMmtkTDRYR3B2NnU2NFNUUFluYVZyTzZORDdCWXJpenJkNWxM?=
 =?utf-8?B?WVZ5TDdTWWZLei8wRWlzTUhtWndrWFZqbUszUWhDczVDU3M1L2RqZ3B2Rk1F?=
 =?utf-8?B?WllVTGNhZU5tZ3drd0xNUUg4K25oOEZWLzNWbjNjUGtJMWVxVHQwOGduTTk5?=
 =?utf-8?B?VUNEcFZPU1ZaYXVGTGh1NHBJWGprSUowMk5RWm5JQkRzVXRia3VGNU5SVGZ2?=
 =?utf-8?B?ajVFaEtkc2Z5dUhqTUgrZW1aMlEwUUJiM29IcHk1MERyQ25DMVAyQ0tRZXZH?=
 =?utf-8?B?VGgrbjFONjNlMmUyV1QxVWlTbkpyUjd6UG5JbnZPdVY1S29kYytVZ2JvZzg1?=
 =?utf-8?B?MVZxZHNVTDNGVjMzdk93Mjlma2pKRTFUYWVaQnZaSVBPV1RvVHlFNzRrYThI?=
 =?utf-8?B?Z0c5S0RZVThqUVhtZzg2YWtvWTVyRitUTjdOQ0czMk1LTzBaZ1pxcTJNRlNa?=
 =?utf-8?B?NXhJUVRUZHdMeTlMNWdZNGNDb1AwWWFJNGduai85b2o1bytQSzdpeHJiRU1X?=
 =?utf-8?B?NTRmSTRlM2pMSmx6ZkQzMmJNOG95Undpa1AxUHc0cklPajlWaml5bStpb05z?=
 =?utf-8?B?dUNGUkRZL2xNYStrc1JFZm5aZkJBTk1RV2ZZdjVxcVg4MmRXdGpreFdXN1Rq?=
 =?utf-8?B?QkpiZUpDUGJwdmtHRjhOc2l4S0dZL1ZBTTloZmdZSzI1U0I0d0gzTkVpSms2?=
 =?utf-8?B?NjZVelVOSmhaTXVGakdTWVQ5SE5vK0dhcFRCbldzT2J3SkFpQVpBTyt4eUxr?=
 =?utf-8?B?ZEU1RE5MWWhQMkF3V0g2SjJzS0E3Mi8vb29xNXVRSUlHSFM3amhkUU9zTTZm?=
 =?utf-8?B?ZUNVdEtBaDVWdVFjL3BCNitrcnlYYWZlc3UvQzE2dFc0UnJhRlNiTEVSNllv?=
 =?utf-8?B?cFBPMmdNTDc5ek9BSkhVd1QzNVBKemIzUndrR0tOcTMwNlpJdVh5Q0wwUnpG?=
 =?utf-8?B?b1llK2dUS0xoQjBmVk1DdXVSNjhhOStYUGdoV3dHWVEyeU9iMjhZTmhTYWRY?=
 =?utf-8?B?dHpvSThjV0I0S0ttb2h0TlY4NnE0S2NoazRLelVnQUQ5ZDBUUHlGUzZSK3Vo?=
 =?utf-8?B?MzlDb2RNcXdFWHo1K05NMDBGUkF1REhQdGRzelRFbWt5TTdQeEtIQi9MMGE3?=
 =?utf-8?B?eHJhZ0UvRWgzVE5IcnBTZzA0Z2ZGQTV3N3FidzhMNHBpMVlWdDdiYVRrOXFu?=
 =?utf-8?B?SFlMT0tKUHFudEs1Z0Y2QWl2Q3VpR0tqcU5VVGUrSDN4S0NVL3VJVjc1RGdJ?=
 =?utf-8?B?RUVXZUs5OE5IWksyRllsR1NoQ2dOYU1jNnJkTFdrUkFqVUlKeDdTKytVem81?=
 =?utf-8?Q?GWJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <098BB063DF0D5243A04603B4929AF198@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: klwnx6AJDt/b+2f6kTsEl+MvUON8I+ghGVsqQ3JRYeRgDSSOoRK6WmjhZrxq/CYmJhgjglMQWf1WlMgPjxNMXl1u2jFWfoSk3+K6UKzQrgnZ/cZlGskVyN9dBK1oLwat0ocLoXBHtoNAhCncdv4OdajDXXwjcuH1A1D6paA340KruLT02PURPFKD8So2Et0ZhQwd0xVk4bxfu4ACAwLqi9MtenQxCfeV9UH8fP/BUYbY1WvNqzJkvzsqBt9OCjs3gZ3Ni+IJ/gCshHIGlEIXTVkCNmMeFs2rFLsR4coxBPh5tkTUTh8gQNqFfRkItI7kEw09zYBolyaeCUm+2qUfrxdIxVattp1GV76tJW0keT2WDNxKEtLcGnqCxKNBRbPVcCKxdTnEES7w9/m3Aw4eD7gIA4+Y+nGjQ9iMirbXTHxKyx/oId3Ym9h3EMnZGKP75Im23P2vMs/uQd3+TQaMUjhowqKi3zbNIRMtS/nImGOsE3krtWCnEu3FUYTaaTcw9HUreqHdi0qsuk83hx1weFHfj5O0vPCuFnMIhk4TNqbLz8Kc1YHcA9+F4DlhcXqGvbv9bR62L6okXgi1r7cV+BeXJljj6o9xsFOh5bU04inWjeXiPL2nehn0TOhhgMxv
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR02MB5487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e998bb8d-6cd5-4182-c0b5-08dccb5492fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 13:38:48.2953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbhXHvHy+vWESeN3w6oeYm1eAXK0mPShy/ShEpj232CDOJnehomD7wTpL87/MnUnAnc+tm8vH/igEaJLt2dw8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6020
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyNTI4NDQwMDpGUEtleTEucHJpdjqgPVuzQn69hWuanfS0cSIWNC72n9fh8CbDRQYs8Rx+dvGqyGLLYv3Fye2UVgi//RWlP/J1nkfj8oE3vwPVt64Hg60nGuUXwceSRgteft6XEDyPL184J5Yi3rPd+5QYV2fJq2KUdNW1vEub8vIZ7Jn3eWj31QqgKL3d44nG2B9SBESATlHkChInzGWqlAHxKrEkl44WTnGqeIojrxEv+epDx7JbjZ3EvVyKm2phTPmI6IHirCoHIi/oUzVloQ5NOYM5pbAzjn1LhTatvkss+vHe6/gg4lbSe7Lj0Mzd+9INI4UWp++wOGZlSH+EQ0Cp6vDFtmP5PMXlJKRf5WFm05H2
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.117
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

T24gMjgvMDgvMjAyNCAyMzozOCwgTWljaGFsIFdhamRlY3prbyB3cm90ZToNCj4gDQo+IA0KPiBP
biAyOC4wOC4yMDI0IDExOjE4LCBJbGlhIExldmkgd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGV4cG9z
ZXMgYW4gaW50ZXJydXB0IHByb2Nlc3NpbmcgaGFuZGxlciBmb3IgYSBzaW5nbGUgaHcgZW5naW5l
Lg0KPj4gVGhpcyBoYW5kbGVyIGFsc28gY2F0ZXJzIGZvciB0aGUgbmV3ICJyZXBvcnRzIHRvIGVu
Z2luZSBpbnN0YW5jZSAwIiBtb2RlLg0KPj4gVXNlIHRoaXMgaGFuZGxlciBmcm9tIHRoZSBWRiB1
c2UtY2FzZSBhcyB3ZWxsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IElsaWEgTGV2aSA8aWxpYS5s
ZXZpQGludGVsLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFu
LmNhdml0dEBpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWVt
aXJxLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+PiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21lbWlycS5oIHwgIDEgKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21lbWlycS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jDQo+
PiBpbmRleCBhMWQ0YmMzZjllNDIuLmMzODhlNDgwYjVjOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21lbWlycS5jDQo+PiBAQCAtMzgzLDYgKzM4MywyOCBAQCBzdGF0aWMgdm9pZCBtZW1pcnFfZGlz
cGF0Y2hfZ3VjKHN0cnVjdCB4ZV9tZW1pcnEgKm1lbWlycSwgc3RydWN0IGlvc3lzX21hcCAqc3Rh
dA0KPj4gIAkJeGVfZ3VjX2lycV9oYW5kbGVyKGd1YywgR1VDX0lOVFJfR1VDMkhPU1QpOw0KPj4g
IH0NCj4+ICANCj4+ICsvKioNCj4+ICsgKiB4ZV9tZW1pcnFfaHdlX2hhbmRsZXIgLSBDaGVjayBh
bmQgcHJvY2VzcyBpbnRlcnJ1cHRzIGZvciBhIHNwZWNpZmljIEhXIGVuZ2luZS4NCj4+ICsgKiBA
bWVtaXJxOiB0aGUgJnhlX21lbWlycQ0KPj4gKyAqIEBod2U6IHRoZSBodyBlbmdpbmUgdG8gcHJv
Y2Vzcw0KPj4gKyAqDQo+PiArICogVGhpcyBmdW5jdGlvbiByZWFkcyBhbmQgZGlzcGF0Y2hlcyBg
TWVtb3J5IEJhc2VkIEludGVycnVwdHNgIGZvciB0aGUgcHJvdmlkZWQgSFcgZW5naW5lLg0KPj4g
KyAqLw0KPj4gK3ZvaWQgeGVfbWVtaXJxX2h3ZV9oYW5kbGVyKHN0cnVjdCB4ZV9tZW1pcnEgKm1l
bWlycSwgc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiANCj4gc2hvdWxkbid0IHRoaXMgYmUg
YSBzdGF0aWMgbWVtaXJxX2h3ZV9oYW5kbGVyKCkgZnVuY3Rpb24/DQo+IHRoZW4gdGhlcmUgaXMg
bm8gbmVlZCBmb3IgRE9DDQo+IA0KDQpUaGUgaWRlYSBpcyB0byBjYWxsIHRoaXMgZnVuY3Rpb24g
ZnJvbSB0aGUgTVNJLVggaW50ZXJydXB0IGhhbmRsZXJzIGxhdGVyLg0KSXQncyB0cnVlIHRoYXQg
aW4gdGhpcyBwYXRjaCBzZXQgaXQgY291bGQgYmUgc3RhdGljLCBidXQgaWYgSSdkIHJhdGhlciBw
cmVwYXJlIGl0IG5vdyBmb3IgZnV0dXJlIHVzYWdlLg0KDQotIElsaWENCg0KPj4gK3sNCj4+ICsJ
dTE2IG9mZnNldCA9IG1lbWlycS0+cmVwb3J0c190b19lMCA/IGh3ZS0+ZTBfaXJxX29mZnNldCA6
IGh3ZS0+aXJxX29mZnNldDsNCj4+ICsJdTE2IGluc3RhbmNlID0gbWVtaXJxLT5yZXBvcnRzX3Rv
X2UwID8gaHdlLT5pbnN0YW5jZSA6IDA7DQo+IA0KPiB3aXRoIHR3ZWFrZWQgaHdlLT5pcnFfb2Zm
c2V0IGluIGh3X2VuZ2luZV9pbml0X2Vhcmx5KCkgbGlrZWx5IHRoaXMgd29uJ3QNCj4gYmUgbmVl
ZGVkIC4uLg0KPiANCj4gDQo+PiArDQo+PiArCXN0cnVjdCBpb3N5c19tYXAgc3JjX29mZnNldCA9
IElPU1lTX01BUF9JTklUX09GRlNFVCgmbWVtaXJxLT5iby0+dm1hcCwNCj4+ICsJCQkJCQkJICAg
IFhFX01FTUlSUV9TT1VSQ0VfT0ZGU0VUKGluc3RhbmNlKSk7DQo+IA0KPiBlbXB0eSBsaW5lIHNo
b3VsZCBiZSBoZXJlIG5vdCBiZXR3ZWVuIGluc3RhbmNlL3NyYyBhYm92ZQ0KPiANCj4+ICsJaWYg
KG1lbWlycV9yZWNlaXZlZChtZW1pcnEsICZzcmNfb2Zmc2V0LCBvZmZzZXQsICJTUkMiKSkgew0K
Pj4gKwkJc3RydWN0IGlvc3lzX21hcCBzdGF0dXNfb2Zmc2V0ID0NCj4+ICsJCQlJT1NZU19NQVBf
SU5JVF9PRkZTRVQoJm1lbWlycS0+Ym8tPnZtYXAsDQo+PiArCQkJCQkgICAgICBYRV9NRU1JUlFf
U1RBVFVTX09GRlNFVChpbnN0YW5jZSkgKyBvZmZzZXQgKiBTWl8xNik7DQo+PiArCQltZW1pcnFf
ZGlzcGF0Y2hfZW5naW5lKG1lbWlycSwgJnN0YXR1c19vZmZzZXQsIGh3ZSk7DQo+PiArCX0NCj4+
ICt9DQo+PiArDQo+PiAgLyoqDQo+PiAgICogeGVfbWVtaXJxX2hhbmRsZXIgLSBUaGUgYE1lbW9y
eSBCYXNlZCBJbnRlcnJ1cHRzYF8gSGFuZGxlci4NCj4+ICAgKiBAbWVtaXJxOiB0aGUgJnhlX21l
bWlycQ0KPj4gQEAgLTQxMCwxMyArNDMyLDggQEAgdm9pZCB4ZV9tZW1pcnFfaGFuZGxlcihzdHJ1
Y3QgeGVfbWVtaXJxICptZW1pcnEpDQo+PiAgCQlpZiAoZ3QtPnRpbGUgIT0gdGlsZSkNCj4+ICAJ
CQljb250aW51ZTsNCj4+ICANCj4+IC0JCWZvcl9lYWNoX2h3X2VuZ2luZShod2UsIGd0LCBpZCkg
ew0KPj4gLQkJCWlmIChtZW1pcnFfcmVjZWl2ZWQobWVtaXJxLCAmbWVtaXJxLT5zb3VyY2UsIGh3
ZS0+aXJxX29mZnNldCwgIlNSQyIpKSB7DQo+PiAtCQkJCW1hcCA9IElPU1lTX01BUF9JTklUX09G
RlNFVCgmbWVtaXJxLT5zdGF0dXMsDQo+PiAtCQkJCQkJCSAgICBod2UtPmlycV9vZmZzZXQgKiBT
Wl8xNik7DQo+PiAtCQkJCW1lbWlycV9kaXNwYXRjaF9lbmdpbmUobWVtaXJxLCAmbWFwLCBod2Up
Ow0KPj4gLQkJCX0NCj4+IC0JCX0NCj4+ICsJCWZvcl9lYWNoX2h3X2VuZ2luZShod2UsIGd0LCBp
ZCkNCj4+ICsJCQl4ZV9tZW1pcnFfaHdlX2hhbmRsZXIobWVtaXJxLCBod2UpOw0KPj4gIAl9DQo+
PiAgDQo+PiAgCS8qIEd1QyBhbmQgbWVkaWEgR3VDIChpZiBwcmVzZW50KSBtdXN0IGJlIGNoZWNr
ZWQgc2VwYXJhdGVseSAqLw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
ZW1pcnEuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuaA0KPj4gaW5kZXggOThlMmI2
MWVmOTczLi44YTkzMzQ0ODJhOWIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbWVtaXJxLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuaA0KPj4g
QEAgLTIwLDYgKzIwLDcgQEAgdTMyIHhlX21lbWlycV9lbmFibGVfcHRyKHN0cnVjdCB4ZV9tZW1p
cnEgKm1lbWlycSk7DQo+PiAgDQo+PiAgdm9pZCB4ZV9tZW1pcnFfcmVzZXQoc3RydWN0IHhlX21l
bWlycSAqbWVtaXJxKTsNCj4+ICB2b2lkIHhlX21lbWlycV9wb3N0aW5zdGFsbChzdHJ1Y3QgeGVf
bWVtaXJxICptZW1pcnEpOw0KPj4gK3ZvaWQgeGVfbWVtaXJxX2h3ZV9oYW5kbGVyKHN0cnVjdCB4
ZV9tZW1pcnEgKm1lbWlycSwgc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKTsNCj4gDQo+IHNlZW1z
IHRvIGJlIG5vdCB1c2VkIG91dHNpZGUgb2YgeGVfbWVtaXJxLmMNCj4gDQo+PiAgdm9pZCB4ZV9t
ZW1pcnFfaGFuZGxlcihzdHJ1Y3QgeGVfbWVtaXJxICptZW1pcnEpOw0KPj4gIA0KPj4gIGludCB4
ZV9tZW1pcnFfaW5pdF9ndWMoc3RydWN0IHhlX21lbWlycSAqbWVtaXJxLCBzdHJ1Y3QgeGVfZ3Vj
ICpndWMpOw0KDQo=
