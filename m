Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2B1C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 13:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572FE10E0F4;
	Wed,  8 May 2024 13:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ntwntmYj";
	dkim-atps=neutral
X-Greylist: delayed 3730 seconds by postgrey-1.36 at gabe;
 Wed, 08 May 2024 13:12:29 UTC
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776210FC1D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 13:12:28 +0000 (UTC)
Received: from rly17d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) with ESMTP id 448CAD6Y187397;
 Wed, 8 May 2024 13:10:13 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) id 448C9ie2175386;
 Wed, 8 May 2024 13:09:44 +0100
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by rly17d-eth0.srv.mailcontrol.com (envelope-sender fkassabri@habana.ai)
 (MIMEDefang) with ESMTP id 448C9hBb175126
 (TLS bits=256 verify=OK); Wed, 08 May 2024 13:09:44 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLYpMvo4d1/jUXak50VgRqzXXuBCrIiStzjJjGwH5ZiDOZDv06VoaH1WNDv7N/5GBKotLo+/FCPsrUCzioCd9FBjcNFZQIOwpknkhzahAGhj6PN9uDwCHBUe+nwDl8ms3GAQk8BcfuplBk8c9YSwsyJGnPUFvDiKPCUYIvfEAvg3yZ8intJFjWrMwBN9RLRSbYSet/6PfjCTiC86YQzvIlMJ0kfT1fZIOWm39I2cPpSIWCKRKXVt0Ch2WVCRyjk+/x2Cgs+JE7MISUOcb+xEkekkKHxt2t+1U2rSTS04xTFuFGJSKIwY7hv7YR2pkLKE4V1xQpPfFH1UF0kAjalmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwZuDo+7iKkAn/jcPC7D/qi8zHVkOUfxVsZNnJKyBKE=;
 b=a2dOS93bRd/tuV/tAdKkDRnKtclhaX14Njm0CtcrnQfLCQvXLnrIJUrXMusJwX2qhTmmFO10AmAd3JGQNcRt/71nlqZiEBA/DGGxUC+phM8NVv2J4/Ot/wmw3f9VuM9kLz1xX1k5DDFg/8I/5By9/cc/i5Wdciqaj1vBX5sjpxB9XRUncpLaCJ8mUliSmNAG08xyczd0mKfq5ckjwgjGiJdOmMQxXJdWzvF8ApUvBHEYKEAYudJn0eyK1gg6ydU0p2eGlmD8Wab9/M44vAN0Lpiwz+yAv74qDE1NBNYFqobgLshfyCjSvvl07VuPgXwt7tf4AxjGSXvWy3QnocIk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwZuDo+7iKkAn/jcPC7D/qi8zHVkOUfxVsZNnJKyBKE=;
 b=ntwntmYj40h34rryJO1GHXDgMA2IBK/VqR5bnbREhaCf7WC2TdV019GckhtWFiuO18q1vJfr5EaSm2UP1djm/r5SC+x2YgOKGL41DYaFphlcHi/IoZdkcjVHIpWioILg/pPUsiTQDH0r7yWO0JoDygB52rzUxadCpRZeQdvBv9ebKSjUZt029BTOZSdolHRFhzbhQzSDhcz7vEq3GKWvHUQ9QtgprDOOVj8zkpkmYJW2sOA+NBbfbTIH2kHCyqU48EGMkC4XGypC7PkEUKAKOLGracMt2hRprFw+rQmt6G9VR3SIXVLXsmxSbHKTG61L6M7VC8B3Vyo55RfxbomiPw==
Received: from VI1PR02MB5246.eurprd02.prod.outlook.com (2603:10a6:803:bb::20)
 by AM9PR02MB6626.eurprd02.prod.outlook.com (2603:10a6:20b:2cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 12:09:42 +0000
Received: from VI1PR02MB5246.eurprd02.prod.outlook.com
 ([fe80::db0a:b598:8fbd:ba02]) by VI1PR02MB5246.eurprd02.prod.outlook.com
 ([fe80::db0a:b598:8fbd:ba02%2]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 12:09:41 +0000
From: Farah Kassabri <fkassabri@habana.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Ohad Sharabi <osharabi@habana.ai>
Subject: Re: [PATCH 2/2] drm/xe: set last driver commit sha
Thread-Topic: [PATCH 2/2] drm/xe: set last driver commit sha
Thread-Index: AQHali8xdW5AR6/0QUq0VpzKT0415bF/IMyAgA40C4A=
Date: Wed, 8 May 2024 12:09:41 +0000
Message-ID: <ab91a394-3076-40a6-a416-1517148054c3@habana.ai>
References: <20240424100706.269523-1-fkassabri@habana.ai>
 <20240424100706.269523-2-fkassabri@habana.ai> <878r0w4dy4.fsf@intel.com>
In-Reply-To: <878r0w4dy4.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR02MB5246:EE_|AM9PR02MB6626:EE_
x-ms-office365-filtering-correlation-id: a4933af2-7ed3-47e5-8b1a-08dc6f57bdd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?TTJsekc0cHMwMVArTlpZSUtxbTRIZmxGckJTeVJpNk1vNGtvNjhyaDVzUUIz?=
 =?utf-8?B?OGh2UzIrWW9pVWhEc0xsWmVtaFFwSEtTbWVpTERsRVJXbmpxRjZMOHNMRFN2?=
 =?utf-8?B?U1lPSzVXeHNWQXlmRDRaeUVjMHlPTHk0dVJNUngzTWE5TEZkbnhoNi9XN1JY?=
 =?utf-8?B?Sjh4U2pyYXAxb05waXU2Y3lxWEkrOEhIWjl4ZXh1M0YwSlEvM1ppeTFmK3pU?=
 =?utf-8?B?ZzZPZVMxTjBVRzNSdW1oVE5PUFJlcVB2VXVJMWpqM0NOUFZSa29CcUZLQlFp?=
 =?utf-8?B?eVZRcEc0dEJVVTIvdmxQK0ZqQjNETDc1bm9HVHh5Sktrd01WUWFXeUdLc1Ry?=
 =?utf-8?B?MGo4cENKa2Qzcm96VnRyU0xJbSs5TlRQVE1wSkxGWTczUmRUSUQyc2tTVEVQ?=
 =?utf-8?B?a2t0c3dzL3ZYRGN5cjFrWDU0aXRHOVJNT2V6dFFobkQzdVJWRVJwQ3M1akRv?=
 =?utf-8?B?OXlGNExGMWNNbmdUUTlESTNhYjQzR3JOeGdrTkVVZVlvdXZRTXF3M21mUHl4?=
 =?utf-8?B?M0JsVG9YMHhQa0xYU25XM05sdW9VdDhDdTZJTzZsaFhiMCtSQkE5a0pLUXRi?=
 =?utf-8?B?NTlFZ09PMDV5MUl1WGV1MURxNk40eW5yYzhtMXljdmhpeEgybWtRSWVmUXpC?=
 =?utf-8?B?SFZGVDNxY2FMZ2ZNZEE5ZGFJa3lQcmxTWlVidGdFYlRqelV0SnNFb2kzYldt?=
 =?utf-8?B?eStDMXVmMXlIZEw5Y1BWZDl1TlN6Y1NmVW56YlgyVVcvTGtqUVQrREgvN2Zy?=
 =?utf-8?B?ZDdMNXBQd3lsZG9IaXZjQWhZeHZqMUVlQ2crdWxWTUJEL1dRY0t4VTVCRlJn?=
 =?utf-8?B?Z1hzbnM4Vi9UdndSN1hrL0hBT05JM3VkV0pVSER4M0poaVFkZlFNRDdDRDRl?=
 =?utf-8?B?R2Fna3Q3MUVzK09MbTJRdE8wZEM5Y3ZKS21Vb21BSVg2MGIzSkp6WEsyWWZ2?=
 =?utf-8?B?Zm0xMGRRWDMrRnBjWWQ2YXdhbXRzS3JkQWRXWU1yWVluL3MvWDFyNERpOTRw?=
 =?utf-8?B?QWx4aG5NcnlDaFltZjZXZitzaGZ6a0tMR0ZRYkM5dE9HbkxyRjBwdm9Fall3?=
 =?utf-8?B?YjVSTjdQQldpUzZoWHhNRnFvYTlUVXJnZzdZdnRaMmdJenhwblpvK2JhaktE?=
 =?utf-8?B?eE85a1VUUGE1MFJNUlRXenRzd2hlRDlGcmFoWUpmTDdQNnVZaHVTV1labzls?=
 =?utf-8?B?YlZWYWFZY2g4WXAzYVhtOFREVTBqZTVqQ0VzM2VDYWgzZ1ZhUTAwcDRFbmha?=
 =?utf-8?B?L1c1alJWaEUvR3o5Vm50cDBSNjZQWFpzUlhpZC9HS2lRNU9MMVdoVmx2TGtk?=
 =?utf-8?B?ck0zRHpZK2pBSHZ2UVlQajdhZ3ZzcTNDMzROczAwVS9LeTJ6N1pJTS9kaHZG?=
 =?utf-8?B?cGZXbGJOWEZTQ2NYczR2UlNJWU1QSzllSDYrYlBiUWFRTU9vSEdSdmpXNjJT?=
 =?utf-8?B?d2c4NVc4VGozenhnSEF6MWtVL2JJZUdtOGhaejFBanpuZ3ZrMENYbll3OGN1?=
 =?utf-8?B?RllDSEt6NVVMclNIUDRDOVROMGNTWVBubnF6UE5TSEJucnBPVTN4N0xoMzE0?=
 =?utf-8?B?UjZzVXJGNDIvMDBaTWNkZC93czdQL29oYjllUm1pRHlUc1VoT252VUFTTE5w?=
 =?utf-8?B?SWE0K3F1a2RLcDBnazdGVmlJS3dkVVFQa09Pbnp2Si9zT3JzKzgwUDB1RGNR?=
 =?utf-8?B?T3VJTU8yeUkrd2p6R1RKVHhXSFVGeWJMV3c4MFJzZDduT1NNZjJTQkMzVjVZ?=
 =?utf-8?B?NTRFSGNwZmI5NHlaeG9nREJQK05mWVprVE0zdG5oaVFENlAwbUsweG5hY2VB?=
 =?utf-8?B?UUFFN0F0cnREWW1mRlViQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR02MB5246.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFBvclhYMEdPYjFPeEVlU1plTkt1Q2pKd25OWVQxQis0aHVvLzUrNXJkdDRl?=
 =?utf-8?B?Wm8xTzRZWUhDbUt6YkFXZkh2N2EzbTI0S3ZITW1LMklCRVZKb2dlaFZDaWYx?=
 =?utf-8?B?SUxsNnNENmQvUFZiM0t5eVFuS0hVenJPWGxBaklaT2k4OHVFaktpMHRHYUlJ?=
 =?utf-8?B?MXVUdUpsWGhjRVllKzN6M2xSaDhKVTMvbXBNVEgvRGx1RlJRM21XMzl2a1J1?=
 =?utf-8?B?WHRDc0pyVjRzazM3ejN1TTNPeEJIYnE1NlExd2VxL1NaaWpBZHBTR2paUHRF?=
 =?utf-8?B?TTFwQnhicWk2YmkrVFhoZG9NZmJpYnhjTHNybFIvYlljbjdXcDdiYnEvM3J1?=
 =?utf-8?B?SURuUXc3aCtKUVM2UTNMNFhwUndiM0M1WDErdXFPMEhZd1RaNFZVWjhrVXFw?=
 =?utf-8?B?eHlnWlJBNmxoVjJMVEJMSWdNY3NsK3lNTXdaL0pxK1dzQXZ6MkhaTmFiUnVj?=
 =?utf-8?B?STFrNjg5YTFkQU0wVmk1L0tkMmp1UkdIT1MrTzhFN2o1eEljeXptVW9SSkVK?=
 =?utf-8?B?YUd6MmxUd0VpSnJtUzhjWG1wblJqcnZiNkdPSGswb253QkpxaEVWam1HU0ls?=
 =?utf-8?B?WFZRY1Z3SVljb0tuYzI2WlhLZlJNV2xSSndzQ1p4czJYN2JMSWdpOHkvMXkw?=
 =?utf-8?B?VkNYRXBKOWVwdktYdElSVUJpUC9kc3hQdmQ1V3IxTmdRUkszT2ZGQUl6a2xw?=
 =?utf-8?B?aUtpSTQ4SG1kVVQ1RkpLZ3Z3SDdzVkJvOEs3WHpRUXh4NnFjUUZrNnZKY1g3?=
 =?utf-8?B?dy9SbEQ1WlZFWWhhYjNVeG42eVo1Ui9LYWxXOXk4SkEvK2VQWTZ6YWNHRHIy?=
 =?utf-8?B?QkFEY25oR2Y0cDJUNWhCeTBlVStYWUZmZFBQb211Sk9jTmc4QUo1NnJ6VjUz?=
 =?utf-8?B?UXl6N0xGUFFVNGlPaXZjS2d6OGZlY1Q1UTFyeGpld3ZnU2lzdlJQUjJ0c1ZW?=
 =?utf-8?B?aFlwT2RIdmhCNW55cWFSSWgwWmhIV1dNZ2pZUWR1OVBST0ZSbmg4OGsxcVl1?=
 =?utf-8?B?MnZFUTZETlc1QlNHR21YMGZGam41VzRuZWdYOWNaSWdLeXd0TXBvRkNrVWtz?=
 =?utf-8?B?STJYT3N1ZUVnWDh6T0ZXZmJuSm5YWjhZclMyZGdnM2JmdWwxZE1wWTlzYmpT?=
 =?utf-8?B?N1U4WHBHeGxJTHZSY1BnRHlDSHBhZzZscWowQmlRVFk4UHVMTVBjRzV3TTVk?=
 =?utf-8?B?aTNlYWJ6R0JXUlZGc1p6VExNTkx2V1p6alF2WmZubklIV055MXcyQXhQNUV2?=
 =?utf-8?B?ZW41MHc0TGlPR0orL0ZCQlBtbThDcVdQbmV1WFpLVFVwV0hUc1FQVC83QTFN?=
 =?utf-8?B?SWZSQll0bkVoMllhYVRYM1dKRmNCcEEyRmJVY1hvZFA2U0dhbFk4b1lTNnRU?=
 =?utf-8?B?R1dlSVpEekdmaDh2cGtkNEhBcGY1enI3djdHSktTSUF4SHgreVV4SUZvaXR1?=
 =?utf-8?B?Z3BoWXFKQnBXRkdTQ0l2dk9YTmdwR0F1YlJ5amx5a1hlRDJjT3Q3U0lycDYv?=
 =?utf-8?B?Y2tGN21lTnR1VjlqVGg3M3NEd3BiSWtjbFIrNndLRFV6WVVuN1RhTE1veUxi?=
 =?utf-8?B?MDZxUG02ZCtVR1VtaVZvSlN6ZFM1aHltOW13WkM0dmR2ekEwQUU2b0JYQlo5?=
 =?utf-8?B?K3V1WEpoZDY2QmdRamM2VzJhQlo1eG1PSjgzTmNHV2FBSkphWUJNS3F1Q0tq?=
 =?utf-8?B?bGFkcjlMYzdydythdmlNRVE5WXR0OGtTVHVFeGp6b0JTRkt3UHhZL2dDVlBx?=
 =?utf-8?B?T1JVVzVVZGM2WldSaDlGdHhTK2paSFJuY2IwanFVdk5Cd2F6T2lHR3BSb2hJ?=
 =?utf-8?B?UitRdnpmaGlTVWdZNE85dmhoTjVqMytETks5ZmlKRlRTK3dVa2o0VmRLR1R5?=
 =?utf-8?B?QWxzK0pTeEFDVEM4TlBCZWtlcGNlTW1YODg3elVUZXJvRUxYQ0JWN1FqQ2RC?=
 =?utf-8?B?Umx0aXFhL005NnZFRHZyRmo5eFRHTFVNYURhTzVTOS82clBBSkR3Z2ZvcHVS?=
 =?utf-8?B?Yk1jNDFsL1VNRjRycVhGUUtpTDRtbDdRYVdiSU5CeTRXdS9ZY0hTZHZId3lQ?=
 =?utf-8?B?djlTUEFzUiswSGFlT3ZjczZrbGdHR2lEYTR6b2xCMlRoUTlnN2phdS9TRmJ6?=
 =?utf-8?Q?c8PC/OHUSE1RkJk6qrXnrWXE3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9877485C3198DB46ACA84D57D498F386@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TgUZhyurtUkun/UPGifXDRe4sXz/kEkXeMALJMfj+vXAlkTaun/MPOi/ocL4KsWLu5EUdOUPnlOcOSj66MhCb0iBUU9bJj5CAJ7n2/k0mZq3ILjFJo7zje+q+IB0KZqTuPiY/wXCC5xbAJvp0YDK82GA0de6tjI2he3TAry2vhOWMuGibMX6tiYzB5XdKNgApxCfjGWaUF89Qomc1+wtW3b1/L0emg3y+2IEg9DPwVrWQ3+1X5wTmHWzoSayH9+bDON7/QsvIglks6OsLvkRAML02kbjShoT/8AV4/VrLJog/7e0L3FxxKcEr2OEzz5EZRHkj2iBV/SZsHLKCrLjS22/uQ6TsfMdKzosUJ6xUmcP9knLmCkaAO8VHltcLfcgoPbT9cM+HbQWdJZ/jCK4BdlEqizYIAm4vw3FpcE6VRvZu5k2GZFaDd7E5VZ3V8p2yNQCOuqu9RbtGSk3ljXvVGvQvbzh7xLje/JbrKurzNv/DQSWAFY+5lumjL5jfSM9Evhe155/NATK92AFEOlIkA9WIVK1sbUErv5tKvMPFqoKAMdM2x+UtKM2+bEnYCntRdn033He99VtYlENcOlzt/nvwYafdR4RfIX2lvWT4gobl56Gi0WEscQo8ccnoqVM
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB5246.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4933af2-7ed3-47e5-8b1a-08dc6f57bdd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 12:09:41.7530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O4NFnqmM4Q78VZUJoY+YTYVPzpUVZkNyLAHNlA71KRadp7AQ+kksIFBX7EUH9upfRYCbvh0icAMw8k21cp+6Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6626
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxNTE3MDIxMzpGUEtleTEucHJpdjpCm3b/yImzChGsnQ0Ferp0fR+/BnX/ErWY3S9pbnA/u0Y77e2+CBRBh2E4UbU6mKAGqlu8S+PlxoSgkX3P9tpOnPyLtcYx8EHvnUIcZkuuokFbxiTgQ0U6RlhkfViTjNo0kZWmVAWb6h3O7zZsW13hrY6B5rzBSy9TCx6iBLkQUjO/w4poVbYtzasqqdxKCoXSf8FVEfdEXsiTqj+IOaKj0mRs6tUVWkXeOK5MoJ4uVCP0fmze0fyU3q/QGP+Se+EyphE272uaLo5ZUqVP8LWqEhvw1wDnBUmuV3bYa911kLRa1909wvL7h+5eYQ/7A1k83AkqKfhXnFPinNPEpsEB
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.68.1.127
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

T24gNC8yOS8yMDI0IDE0OjE1LCBKYW5pIE5pa3VsYSB3cm90ZToNCj4gT24gV2VkLCAyNCBBcHIg
MjAyNCwgRmFyYWggS2Fzc2FicmkgPGZrYXNzYWJyaUBoYWJhbmEuYWk+IHdyb3RlOg0KPj4gVGhp
cyBwYXRjaCB3aWxsIHNldCB0aGUgbGFzdCBkcml2ZXIgY29tbWl0IHNoYSBpbnRvIHRoZSBkcm0g
ZHJpdmVyDQo+PiBpbmZvIGRhdGEgc3RydWN0dXJlLCB3aGljaCB3aWxsIGJlIHVzZWQgaW4gdGhl
IGxvZyBtZXNzYWdlIHdoaWNoDQo+PiBwcmludHMgdGhlIGRldmljZSBpbmZvIGF0IHRoZSBlbmQg
b2YgdGhlIGRyaXZlciBpbml0aWFsaXphdGlvbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGYXJh
aCBLYXNzYWJyaSA8Zmthc3NhYnJpQGhhYmFuYS5haT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0veGUvTWFrZWZpbGUgICAgfCA0ICsrKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5jIHwgMSArDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZQ0KPj4gaW5kZXggODMyMWVjNGY5YjQ2Li5hY2NjYjUxN2I3YmIg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPj4gQEAgLTMwOSw2ICszMDksMTAgQEAgaWZlcSAo
JChDT05GSUdfREVCVUdfRlMpLHkpDQo+PiAgIAkJaTkxNS1kaXNwbGF5L2ludGVsX3BpcGVfY3Jj
Lm8NCj4+ICAgZW5kaWYNCj4+ICAgDQo+PiArR0lUX1NIQSA/PSAkKHNoZWxsIGNkICQoc3JjdHJl
ZSkgJiYgZ2l0IHJldi1wYXJzZSAtLXNob3J0IEhFQUQpDQo+IA0KPiBUaGVyZSBhcmUgbm8gZ3Vh
cmFudGVlcyB0aGF0IHRoZSBrZXJuZWwgaXMgYmVpbmcgYnVpbHQgZnJvbSBhIGdpdA0KPiBjaGVj
a291dC4gT3IgaWYgaXQgaXMsIHRoYXQgdGhlcmUgYXJlIG5vIHVuY29tbWl0dGVkIGNoYW5nZXMu
IEV0Yy4gU2VlDQo+IHNjcmlwdHMvc2V0bG9jYWx2ZXJzaW9uLg0KPiANCj4gSU1PIGl0J3MganVz
dCBub3Qgc28gc2ltcGxlIHRoYXQgd2UgY291bGQgcmVhc29uYWJseSBhZGQgdGhpcyBpbnRvIGEN
Cj4gbG9jYWwgTWFrZWZpbGUuDQo+IA0KDQpUaGlzIHNjcmlwdCBsb29rcyBnb29kLCBidXQgdG8g
bXkgdW5kZXJzdGFuZGluZyBpdCBjb21wZWxzIGhhdmluZyBhIA0KJGtFUk5FTFZFUlNJT04gc2V0
ICh3aGljaCBpcyBhbHNvIG5vdCBhbHdheXMgdGhlIGNhc2UpLCBhbmQgd2UgbmVlZCB0byANCmNo
YW5nZSBpdCB0byBzZXJ2ZSBteSBwdXJwb3NlIGFzIHdlbGwgaW4gb3JkZXIgdG8gaGF2ZSB0aGUg
c2hhIGluIHRoZSBkbWVzZy4NCmlmIHlvdSB0aGluayBpdHMgYmV0dGVyIHRvIGNoYW5nZSB0aGF0
IHNjcmlwdCwgYW5kIGNhbGwgaXQgZnJvbSB0aGUgb3VyIA0KTWFrZWZpbGUgdG8gc2V0IGVudiB2
YXJpYWJsZSBpbnN0ZWFkIGknbGwgY29uc2lkZXIgdGhhdC4NCg0KQlIsDQpGYXJhaA0KDQo+IEJS
LA0KPiBKYW5pLg0KPiANCj4+ICtEUlZfQ0ZMQUdTX01PRFVMRT0iLURYRV9EUklWRVJfR0lUX1NI
QT0tJChHSVRfU0hBKSINCj4+ICtDRkxBR1NfTU9EVUxFICs9ICR7RFJWX0NGTEFHU19NT0RVTEV9
DQo+PiArDQo+PiAgIG9iai0kKENPTkZJR19EUk1fWEUpICs9IHhlLm8NCj4+ICAgb2JqLSQoQ09O
RklHX0RSTV9YRV9LVU5JVF9URVNUKSArPSB0ZXN0cy8NCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jDQo+PiBpbmRleCA1NWJiYzhiOGRmMTUuLjJlNzRhYTE4ZTk1MyAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5jDQo+PiBAQCAtMjE1LDYgKzIxNSw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
ZHJtX2RyaXZlciBkcml2ZXIgPSB7DQo+PiAgIAkubWFqb3IgPSBEUklWRVJfTUFKT1IsDQo+PiAg
IAkubWlub3IgPSBEUklWRVJfTUlOT1IsDQo+PiAgIAkucGF0Y2hsZXZlbCA9IERSSVZFUl9QQVRD
SExFVkVMLA0KPj4gKwkuZ2l0X3NoYSA9IF9fc3RyaW5naWZ5KFhFX0RSSVZFUl9HSVRfU0hBKSwN
Cj4+ICAgfTsNCj4+ICAgDQo+PiAgIHN0YXRpYyB2b2lkIHhlX2RldmljZV9kZXN0cm95KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmR1bW15KQ0KPiANCg0K
