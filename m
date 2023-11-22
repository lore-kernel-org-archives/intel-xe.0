Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9A8C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 17:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB4B10E0A7;
	Wed, 22 Nov 2023 17:19:06 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C05E10E0A7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 17:19:03 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly33b.srv.mailcontrol.com (MailControl) with ESMTP id 3AMHIvg6052806;
 Wed, 22 Nov 2023 17:18:57 GMT
Received: from rly33b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender osharabi@habana.ai) (MIMEDefang) with ESMTP id
 3AMHIsbq051798
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:18:57 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly33b.srv.mailcontrol.com (MailControl) id 3AMHI8UL046464;
 Wed, 22 Nov 2023 17:18:08 GMT
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by rly33b-eth0.srv.mailcontrol.com (envelope-sender osharabi@habana.ai)
 (MIMEDefang) with ESMTP id 3AMHI51t046091
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:18:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqNLc4OFPXRdLDCaux6Te06gTI70yWr9FuJVsK1Hl25uEGl4/jD3USSnLMpnnyU+MLCon8mKWLJ9Lg8i3GdSk5bpd4hNHVmIrHBQGnhTh1aTa+QW82RxVCJ4K6D0BeUCVgYfMq4SZH74ndt1Embia18TAbw/4ZipwaXzDLuF6S1Siit4xdf49aFUHg5aeR917v+2hAn8gYVkUxQwE8ET4ZHhkipTn7N/8R35g9k/qaL1WzdEFmDd4Q76sbQW6AX7NBPiQF7pGzpjezBfJU1p0DsmfhLc96IbKbgS67LmuVF5S+79x3hNlQpENy3dRpb7oG4rnpF/GI+1dTD3fyMpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuO6fL7zD91Gj4A8X3x9UKLiE2qSKxPn0Gt3im1yR34=;
 b=VguElmOZQFqxbL28Tvlq1M+bspre2PcK26Da1Gd/oLzcDL9HaOMWaMqba3LzB7pYFuv2vbtr6YkxYTrELFU/ygFBs0nRb8QjGgH7MWfc6qXt0S+TCkytfUNEsufZ0NKZ8max/OHpFGtA4j6696dZyUuTbDErG8w+ehr6D6RIwSOUCwLLdtsYInKKl8gITVZydckcvv6EY2LU3S5zNk69dqCD1TXWxuv5iJ7iSeS581xi39fXPenLAT4kjnvsib1PmS+q5h74qm5ZAYw/DaWfKrUL+V9Jv6V10IaZFNtf50hDZN95ADpqpfYaEijcz8JcZnVarP0tALvLXbIGM6o6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuO6fL7zD91Gj4A8X3x9UKLiE2qSKxPn0Gt3im1yR34=;
 b=PtLMqWlWmjGKeWk0+1DvmTAhUhfAF87xjEhqRBGbdcAeTdReVBXJ8l9E9FQRkh09gJxoEkVltVcvaiHV7H6Mt5Y4c2HKN4pr0A9LZCK9OGpZ7dlM/WsPRaT5g0nYuEeEuLZW5sjOJQknfyPfUbKD6H+Ah+zn4Hfzl8DW04LPDFQzvMdp2u+qvGAvFLzdAQPVn/tjTIdH+3A94JRWwDrujq0tTF7KkDgsRh38AuH4WgKtETuAIKz3lmZVwFTupgK1Wk5zbzKJI2YwfOcH3472nD76ijSP/jnwGHxyCV7W0FWjOtNlUXL6Y8msTJQfBUHm0uvET+wM1bS8wmGtF9Ntpg==
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com (2603:10a6:150:db::6)
 by DU0PR02MB9489.eurprd02.prod.outlook.com (2603:10a6:10:41c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.31; Wed, 22 Nov
 2023 17:18:04 +0000
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba]) by GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba%4]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:18:03 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/4] drm/xe: Ensure that we don't access the placements
 array out-of-bounds
Thread-Index: AQHaHTOlmxKlDMKMJkSmDPCn3Djur7CGlUuA
Date: Wed, 22 Nov 2023 17:18:03 +0000
Message-ID: <34f31f28-9095-e802-4243-e77eedb63cfc@habana.ai>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB9325:EE_|DU0PR02MB9489:EE_
x-ms-office365-filtering-correlation-id: 7884ab5f-c75d-409b-03dc-08dbeb7efc80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K6Z3q3MBdch7Mn6pIM8Vvoy+HWAgI1fjv2kF7celMEPzru4s9w5oh1ARfuuawFTGnVZUwcRLwrx+CfE/yrV5iiP83WAmu/6KoTcFd3MIBAipRdlZXHcfnaElVfKrlFNiZA+AOerTrsSswCkz0LC2tA9WaE6qBpizXudS4wRFbKhbqElCs/1zYSV70a1ALpspYhbtr4kqZ/CBGEvKb1BD1WoVssEW09xFTD6u80cc6cIZXBZdLfcOPHZxHwO1MwbbZkVnF18zvI5QHv6zNH+4zF5ymAlgAd+OBRlGoXxNwC6VDrf+bhUcZOB9AzmgrzKvDQVm+48uCz6cZud0AeoZTJVCiCeuMH6jJB8P2gdxnrLATH/nXp9AJR+mLEMECDcUfAoJTcttgP3YHTYgwSt7NM+Vnx3S5q16gn4SexHDGkzZAnsnkYGlnL+aBRNsFl0rmLYtzfCTlFjXCvlKHO1KCfhXcwuX0mVeHYe6B6yEhZi9yG69/IuVZmJhVFUSGFJG181SSrqQgDWfrN9ZttdDfmROizLkZKZ+jge3j8qNYVsMRSPQwLnXIPQHKg/47Pa3Qr1tU22YabCGdr/q3gFBuM9zuXkRx/76TpIYeLXiKCgVEXV/0DONw10dGrijN1BMhzKrd3Ere741ySo4dKPraiso9HI0EWDTl4D9Qmw3NsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR02MB9325.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39850400004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(82960400001)(66574015)(86362001)(83380400001)(41300700001)(122000001)(6512007)(38070700009)(38100700002)(31686004)(36756003)(53546011)(2616005)(6506007)(2906002)(71200400001)(5660300002)(45080400002)(966005)(31696002)(316002)(66556008)(64756008)(91956017)(110136005)(76116006)(66446008)(66476007)(66946007)(8676002)(8936002)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlVpWW8xVHV5TkoxZXpZaDNqSnVZS2FCUlEyUGhzdVdxYTRWbWxtdHBqZU1t?=
 =?utf-8?B?aTM0ZkdvTEpKNGlQTzdsMFhhbkFId2YrWnVIcGM1dHJFcUh0V2JyOWc1UFFP?=
 =?utf-8?B?Y2pmWjZ5QTgxQW91cys4czFDaVZxVitON0hTWndVY3RST2JXaS8zcWQxYnJD?=
 =?utf-8?B?Qi9RMzBwMzJzREFKWVcxaEtRTEM4NlJ2QnFsYk0wOGF4U1dEMllIUkM0WGI2?=
 =?utf-8?B?d0tHWTR6c2gvVUNRRzkzelhuZDJSK1hscW1JSmVrQVJCaElsUHFubXZUeDZo?=
 =?utf-8?B?OUlNT0p2dE85OWVhc3RWUmtwVXdKTGJCclpXOEhjSGNjMGRsQnpBbEZRaHB2?=
 =?utf-8?B?anU3REdCVjBJR0QyajVPK2JvMXdWWXlxSE5ySm1wdFBnSVhpNnpmMWlLWHVH?=
 =?utf-8?B?QmFQVE1nUy9QdFRuKzJRaVZpSUhwUGdZTUNoOTRZU3E1dTYvN1hFZDR2S3c0?=
 =?utf-8?B?ZjRsQTNNbGhLZGZuMXZJelFEdlRNUUpwcFY3V2ZBOU1MZFBubkgvSldtekNx?=
 =?utf-8?B?UTR6VTI2WHJ1dkdwSFIzYVIrRXJaOXhnZE5rWThXRE5CZ0NHcmM1b2poSWxL?=
 =?utf-8?B?ZnBuN2kzZ2dJNCsyYmJJUEhDdDFoSDRzdkxwcmt3OEJKQUVQNksvUVRzOWQv?=
 =?utf-8?B?a3RTWmNoWGpBaHlBRDl0YnArNURBTTNPTjlhOTFUTkNJaUNoZnllNU5ybjFM?=
 =?utf-8?B?cFlkZkRya01LMHA1ZWFhY3lrMWUzQ1FyRDdMcDlZMWwyT1ZhbTN6U0U3c3Y0?=
 =?utf-8?B?clRxaXZoT2loSXhoblArR2VTdjdqTlJtdE1Rd0prNXQyVmp0MUVrZlJTWnlw?=
 =?utf-8?B?bXNuUFpUYzJMNWRFelQ2R3BDdkR0b3Y1SkVlakdGdEhQd2JCNnpmRHlEaER4?=
 =?utf-8?B?WVVXS2NacnhhdVh0Ri9KSDliU3pxem1tU0pNVUQ5aHU3c2lhYWk5MmNwTm0y?=
 =?utf-8?B?d25hUG5qQTh2SXZpOVpySTU3d1RjU2twNExYTXhPZEZ5Um5PK3dYdUoybVJk?=
 =?utf-8?B?UGUzRTFxdnFQVWFEMS9JNHl4YmFKa1E4MFh4dG1Da0xuWmpzREFVRTE0ZDVy?=
 =?utf-8?B?eXhMSHZGNDJmbTZxYUp4ajJ4ZU5KRWh0SHhqdHRadFVBOFJydXpqZXY0alQz?=
 =?utf-8?B?c0d0N2RLSXdIa2p5RzhmajgyWHBCcVZjR1JBaFdTNmxSdkd0OGFTOG05M0xt?=
 =?utf-8?B?TlM3UkNoYjBLU0F2bjhXeDNSRkZHWVIwSHZZemF3WWFwYkgwTGcxYi8wcFF5?=
 =?utf-8?B?Q0ZRWDJEOVlzV0pQWHhhNHBNdzBJejIxWC9NSnorbnd1YmpVK0tqWGQrSXNx?=
 =?utf-8?B?Sy9WU0hOY1BVcU1kUWpQcVBpbW5RaENtRi81UFZ0UUNONnBjdDlGamJQNVlp?=
 =?utf-8?B?bmU3c241NkVRdzF0UkRXRDFsZG1YckFkTEFRbEEyamFIeFJtYWU0Rm05ZXdy?=
 =?utf-8?B?N0ovRU5zTldiNjRZTmtSMXY1VWdmcnlPOVNkVWNjVDYzc0dYSmxxdjd2MUo1?=
 =?utf-8?B?aG5wUDFKd1Zidk1WVG1mZkVFcHJsRm0rODdGM1VWdUFMZXVmUXZEblVqMTk4?=
 =?utf-8?B?dU80WUNUZ2RLWTZzS2E1OXBDZ0lBTGFWYzA0VEJjeGpDN3dDZXg1bDJzNmky?=
 =?utf-8?B?SDlsU2IwczZnTUxNWStxYlRzMFBQdHlSZlF4MUVlVXBYUlcvNUpXaE11YUE1?=
 =?utf-8?B?dThWb2ZDNDNPamZPTGMrV1ptZHlIc2QzOUtNNlcreGpPRkoyaVB1WjZydUQ2?=
 =?utf-8?B?ZFdGYkpXZmJPL2VmbGxvYlFxYlVMSmZ5SGd6dGNDQ0JrUFZYdWVTRmpmZmdN?=
 =?utf-8?B?RjJFSTloSkRIcE45SThtY1lsMnNGZTVMcEs0ZkZ5Uis0MC9FbXNuQUNXOXN1?=
 =?utf-8?B?VHpsNVFiVy9JVjVjSk1TQkV0bmw0MS9Obi9vdXd6SzJFeW1uUXNoTmhUbkxM?=
 =?utf-8?B?RFFEOUVoSUtDU1grZllJWGFTbThVUXFvK1FYUmNGZVNrYnpXZnlKbTllTmR4?=
 =?utf-8?B?UzFQZEZKSDdqa01NcHNEa0FweE04OGtlWktPOE9hN1BVeklTaTR6RjlRYW51?=
 =?utf-8?B?Y3h3cTd2aEF3dFJ6bVFKNGJZMitHZ3lCdG8yZVJBNE1jRHZPNWxwMERVZTdS?=
 =?utf-8?Q?tbXY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90E7E9CF73FB0F47B8CEDCAB6C3A0ADF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 32JTU1jZtFPM+WPDCok+N7igLSl18qTogVthUJFYiLAtU0TayUarSQuJezIDmUIee64AObT5uavdieh4QniomSP7S8U62D5ajNMr26j7eQ6yenaMNPeEwO9SEySmO/gEFb/VAovuY4Fz782N/+rznTTtjVkspPUb4e70JrXvPLwwexx6xwlZ0kzdIvXsUJIC1oKEyxOdSFZOfGF57zWlnC1XTnxIgDKrXlvo1Rc5hZnKSu7+/l7ST92iA8wjYuVU+3gQ99p/ynrAxIErB+KMMWKuED90RgoNW+cq9XeM068xnD6iJa9inWFiMCwfpPn/32fxxxHHDeC9PtSazT1RhgtRWzn3SozGV1u+Byyoy4YaFqt2hVwQv+9SeQv09a9FCdjGKmwtFmrWUVhreCZOuOIgsXC+Uv7rCgoN/W2Aer1GbLtud7P/g+CZHMahrq/+RnVT5ojHPAAZsgjAdQ9fTlE+6zT5mE+jn9Uu/YaqryFUEAWSVUET/K+472Y71FHPe6erw54llnDl0X11n2vL531zXGHa88oyMXP20YhIl0JtZsY/539swCUQKG6evbtpkewbQ/pRF5sQJ5ip65cahHRugoamKM73hvwkCGg0+6884gFvsHr+C6UAqolsuncKFSyJqeuIjKN6stIoqsywgoaBo7mzqp81EvdoZJfssHDTADod6f0EjI8D1nqz8Ytz+HDTkfmEYaBeY/VcpiGTGcuJ0KsUZpTsn2/aY9CzqW9HJP4fp7LwUmdx6P3J7oNQyZ8fvTT3hZi5BA4Rt+h09dydW187GBM4JI9QpOKP+FRNCZixwbn3y+C8w7nbJZZD0qQsv+uxImgUd4rTEEiAWg==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB9325.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7884ab5f-c75d-409b-03dc-08dbeb7efc80
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 17:18:03.7423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzWbVgZbdG75aPfGbZnZ0j9lSR69WDSznlD/PhAOqALIUG5SDZFLhOmpbO94Ioc8hIWnvfIcYt0YkgF9RCPfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9489
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMDY3MzUzNjpGUEtleTEucHJpdjoEHYhDAcanxQTpHVmpU2/d7Xhgsr4de30yHIu07mRUkm5lBXSXxfCQKAd2AiTMjX8fauVfS/JTFZLg0G7fQhwCotRw72w3weeWtFX4nAbHcaUlo6hHMiwviNbUga7VEET2YuACYsN6C2jXpIsgN5VIRj5gFNpOPFGOM1i6sn3lAsSlrRPR+xrNGJ8VshilqOBPmEoH4ti95bUOVb+R5ba5YpA4b5xSrDjiYcllK0uUXtb+Oz6M1CeYmvDUHIHQuzNIzjcXGQ9DYtVro2Td5peGcH3QFpnBwHWfaEiz3UrWQfaNm//GpB4NwW1ZKAslOZQqadPpCUTZ1yMOrcZdVEdb
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.17.104
X-Mailcontrol-Refers-To: 3AMHIsbq051798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=VuO6fL7zD91Gj4A8X3x9UKLiE2qSKxPn0Gt3im1yR34=;
 b=Jn+PC2fGG9k7xeXVnOMkfWDa4rdBjmlKy//yS1A7JYNPK59SxPXkIqeh4h2Qy9U5b+mYaTJYgzQNq2FNyOiRCjzttSM0LCW5autT7ZwnambbF77CH88mNK9yPI1FV1k4Qf81PMDFhjvC5tCfXiqVuKVO8YkLtRwinWvx5mJVzbhIBc/Q+LCl80FtKdjSLSMCo78V5/eqQ2g5Slb79LVjIZGvNAK9hJHW91SpwVk8SR8yM5BXtzqpWyfQtqlkw+bhl73z/pxkAP2zY+vHEnsdJxGmKjBCcylXnDtwUPzrXtqJvTRZlGB6vziVFeVrBMsnRiWIkGS27+kcE5jlTt2fFA==
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Ensure that we don't access the
 placements array out-of-bounds
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

T24gMjIvMTEvMjAyMyAxMzowMywgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+IEVuc3VyZSwg
dXNpbmcgeGVfYXNzZXJ0IHRoYXQgdGhlIHZhcmlvdXMgdHJ5X2FkZF88cGxhY2VtZW50PiBmdW5j
dGlvbnMNCj4gZG9uJ3QgYWNjZXNzIHRoZSBibyBwbGFjZW1lbnRzIGFycmF5IG91dC1vZi1ib3Vu
ZHMuDQo+DQo+IFN1Z2dlc3RlZC1ieTogT2hhZCBTaGFyYWJpIDxvc2hhcmFiaUBoYWJhbmEuYWk+
DQo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0v
aXNzdWVzLzk0Ng0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhl
bGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBPaGFkIFNoYXJhYmk8b3No
YXJhYmlAaGFiYW5hLmFpPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
IHwgMTQgKysrKysrKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5kZXggNDMwNWY1Y2JjMmFi
Li45MTU5MTBiODdmYWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC0xMjEsOSArMTIxLDEx
IEBAIHN0YXRpYyBzdHJ1Y3QgeGVfbWVtX3JlZ2lvbiAqcmVzX3RvX21lbV9yZWdpb24oc3RydWN0
IHR0bV9yZXNvdXJjZSAqcmVzKQ0KPiAgICAgICByZXR1cm4gdG9feGVfdHRtX3ZyYW1fbWdyKG1n
ciktPnZyYW07DQo+ICAgfQ0KPg0KPiAtc3RhdGljIHZvaWQgdHJ5X2FkZF9zeXN0ZW0oc3RydWN0
IHhlX2JvICpibywgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2VzLA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgdTMyIGJvX2ZsYWdzLCB1MzIgKmMpDQo+ICtzdGF0aWMgdm9pZCB0cnlfYWRkX3N5
c3RlbShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2JvICpibywNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlcywgdTMyIGJvX2ZsYWdzLCB1
MzIgKmMpDQo+ICAgew0KPiArICAgICB4ZV9hc3NlcnQoeGUsICpjIDwgQVJSQVlfU0laRShiby0+
cGxhY2VtZW50cykpOw0KPiArDQo+ICAgICAgIGlmIChib19mbGFncyAmIFhFX0JPX0NSRUFURV9T
WVNURU1fQklUKSB7DQo+ICAgICAgICAgICAgICAgcGxhY2VzWypjXSA9IChzdHJ1Y3QgdHRtX3Bs
YWNlKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAubWVtX3R5cGUgPSBYRV9QTF9UVCwNCj4g
QEAgLTE3Miw2ICsxNzQsOCBAQCBzdGF0aWMgdm9pZCBhZGRfdnJhbShzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgc3RydWN0IHhlX2JvICpibywNCj4gICBzdGF0aWMgdm9pZCB0cnlfYWRkX3ZyYW0oc3Ry
dWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ibyAqYm8sDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2VzLCB1MzIgYm9fZmxhZ3MsIHUzMiAqYykNCj4g
ICB7DQo+ICsgICAgIHhlX2Fzc2VydCh4ZSwgKmMgPCBBUlJBWV9TSVpFKGJvLT5wbGFjZW1lbnRz
KSk7DQo+ICsNCj4gICAgICAgaWYgKGJvLT5wcm9wcy5wcmVmZXJyZWRfZ3QgPT0gWEVfR1QxKSB7
DQo+ICAgICAgICAgICAgICAgaWYgKGJvX2ZsYWdzICYgWEVfQk9fQ1JFQVRFX1ZSQU0xX0JJVCkN
Cj4gICAgICAgICAgICAgICAgICAgICAgIGFkZF92cmFtKHhlLCBibywgcGxhY2VzLCBib19mbGFn
cywgWEVfUExfVlJBTTEsIGMpOw0KPiBAQCAtMTg4LDYgKzE5Miw4IEBAIHN0YXRpYyB2b2lkIHRy
eV9hZGRfdnJhbShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2JvICpibywNCj4gICBz
dGF0aWMgdm9pZCB0cnlfYWRkX3N0b2xlbihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhl
X2JvICpibywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fcGxhY2UgKnBs
YWNlcywgdTMyIGJvX2ZsYWdzLCB1MzIgKmMpDQo+ICAgew0KPiArICAgICB4ZV9hc3NlcnQoeGUs
ICpjIDwgQVJSQVlfU0laRShiby0+cGxhY2VtZW50cykpOw0KPiArDQo+ICAgICAgIGlmIChib19m
bGFncyAmIFhFX0JPX0NSRUFURV9TVE9MRU5fQklUKSB7DQo+ICAgICAgICAgICAgICAgcGxhY2Vz
WypjXSA9IChzdHJ1Y3QgdHRtX3BsYWNlKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAubWVt
X3R5cGUgPSBYRV9QTF9TVE9MRU4sDQo+IEBAIC0yMTAsMTEgKzIxNiwxMSBAQCBzdGF0aWMgaW50
IF9feGVfYm9fcGxhY2VtZW50X2Zvcl9mbGFncyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0
IHhlX2JvICpibywNCj4gICAgICAgLyogVGhlIG9yZGVyIG9mIHBsYWNlbWVudHMgc2hvdWxkIGlu
ZGljYXRlIHByZWZlcnJlZCBsb2NhdGlvbiAqLw0KPg0KPiAgICAgICBpZiAoYm8tPnByb3BzLnBy
ZWZlcnJlZF9tZW1fY2xhc3MgPT0gRFJNX1hFX01FTV9SRUdJT05fQ0xBU1NfU1lTTUVNKSB7DQo+
IC0gICAgICAgICAgICAgdHJ5X2FkZF9zeXN0ZW0oYm8sIHBsYWNlcywgYm9fZmxhZ3MsICZjKTsN
Cj4gKyAgICAgICAgICAgICB0cnlfYWRkX3N5c3RlbSh4ZSwgYm8sIHBsYWNlcywgYm9fZmxhZ3Ms
ICZjKTsNCj4gICAgICAgICAgICAgICB0cnlfYWRkX3ZyYW0oeGUsIGJvLCBwbGFjZXMsIGJvX2Zs
YWdzLCAmYyk7DQo+ICAgICAgIH0gZWxzZSB7DQo+ICAgICAgICAgICAgICAgdHJ5X2FkZF92cmFt
KHhlLCBibywgcGxhY2VzLCBib19mbGFncywgJmMpOw0KPiAtICAgICAgICAgICAgIHRyeV9hZGRf
c3lzdGVtKGJvLCBwbGFjZXMsIGJvX2ZsYWdzLCAmYyk7DQo+ICsgICAgICAgICAgICAgdHJ5X2Fk
ZF9zeXN0ZW0oeGUsIGJvLCBwbGFjZXMsIGJvX2ZsYWdzLCAmYyk7DQo+ICAgICAgIH0NCj4gICAg
ICAgdHJ5X2FkZF9zdG9sZW4oeGUsIGJvLCBwbGFjZXMsIGJvX2ZsYWdzLCAmYyk7DQo+DQo=
