Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92860C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon, 25 Dec 2023 13:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29110E162;
	Mon, 25 Dec 2023 13:30:52 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457810E162
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Dec 2023 13:30:50 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly03b.srv.mailcontrol.com (MailControl) with ESMTP id 3BPCYs9R061414;
 Mon, 25 Dec 2023 12:34:54 GMT
Received: from rly03b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender kelbaz@habana.ai) (MIMEDefang) with ESMTP id
 3BPCYodp061362
 (TLS bits=256 verify=OK); Mon, 25 Dec 2023 12:34:54 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly03b.srv.mailcontrol.com (MailControl) id 3BPCXss3057719;
 Mon, 25 Dec 2023 12:33:54 GMT
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by rly03b-eth0.srv.mailcontrol.com (envelope-sender kelbaz@habana.ai)
 (MIMEDefang) with ESMTP id 3BPCXnxx057187
 (TLS bits=256 verify=OK); Mon, 25 Dec 2023 12:33:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLZ1jz6xSr2+eP1CHwMk5PGGqBc4caf0FKp9G0mj3NvJ2XGbqrpBsxlaPxzT+qN60qUBqARjpo1mtc+eOGAbI1mfhuYojkYpG31zRoerhgNL5AGh7ZTzfqzxNGRWa2OYWy9TFWwKx9zVzzk0Q9XoFRc4R8l81DZ5w0YJLs68p7f5Bub/T6sw6nf04XZFo9oYOwMaiFCuJWGhXzEItSbqBA6hHZ54tFmBIj0hKBydwhop04FLEK1+oGzZgaGYRrq9SIDRfmmVsiggoH7ezR5ifmGk1SeDYAnXr4iBx6X4xczmdSD1JkefLgRhx5Dg0UYv9eLPAkY379gc9JwDfDewlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6OU902CsHZOi4M+q/Jd9+uu8HqcbbxE/sk3a/SLTMo=;
 b=L4b40jk2AdnO/bF+R+APf6Y/lG8bXVHfnnV8ogr7AVb5TgXbBIoNt3rWNL4t1eo9BGwJSlGVn51ZJOC71p+M5UU0vg6A+0enkMaqemAopCSCuZU5uoHOZ3dvkANA5lMgO5HeHFN8HMTz7Yp7IPC8hbqBQspzTztF6xPnhqvLI5oZsokbyFetcPiDHnyKfzOSR4+Mp/tWkosxQJUM8rId/BQtzh21pmG0KRls+p/5jqlq6xWvQdsxj4PAPG9dGddBYCthbMzm2bQI+LrQCOaROtTva4D1VZAxFuuJlQrcef5B4GiSBL0Rtr003mmSf2JYTCaM0q6ncl3qGT0YncluyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6OU902CsHZOi4M+q/Jd9+uu8HqcbbxE/sk3a/SLTMo=;
 b=ZbHkrKzAwCPpyhDCaJ/3alnjZk9qhZLaMabQlY6qw1m1l+diaTXs3kFc7ysQw4IWZ+3ZT1ukey+HTumkiIglrPcvXnyc+25lx57rADJXVU6NFcnUQX+Bjo+cgSqcQG1Ej4fC6sZsNnLKXQrJACpU1uvg3VJUDKT06pL6iHTpcEGnkD/4xs8RpipQhCD9FJyzPqF1F1P3uN5oifaM09TzeUA5usKSEqKuVyeqF4C0099PGs8lRancEP0BHDUnbtGCStQps4u65Oo6LIW/fsaZI2HIwnL3lVNDQ+sL5YYWC6mXPQX+0qwDmtMe1Q/3gsLkpu9whuFwsyE6SEPcyHTClw==
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com (2603:10a6:10:345::21)
 by PAXPR02MB8103.eurprd02.prod.outlook.com (2603:10a6:102:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Mon, 25 Dec
 2023 12:33:47 +0000
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::1652:fd49:d66f:ca07]) by DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::1652:fd49:d66f:ca07%4]) with mapi id 15.20.7113.026; Mon, 25 Dec 2023
 12:33:47 +0000
From: Koby Elbaz <kelbaz@habana.ai>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl handler
 of the mmio debugfs file
Thread-Topic: [PATCH v2 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl
 handler of the mmio debugfs file
Thread-Index: AQHaM3NCDevgNWkC/0CFAjFGPGiU/bC3mLEAgAJdnoA=
Date: Mon, 25 Dec 2023 12:33:47 +0000
Message-ID: <8bcf197d-8c22-4222-9aa6-021dc5a39a09@habana.ai>
References: <20231220183447.297585-1-kelbaz@habana.ai>
 <20231220183447.297585-2-kelbaz@habana.ai>
 <ce121c183ceda0ddd38f5c0457bcd536915f34d3.camel@intel.com>
In-Reply-To: <ce121c183ceda0ddd38f5c0457bcd536915f34d3.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB7873:EE_|PAXPR02MB8103:EE_
x-ms-office365-filtering-correlation-id: 676731d9-5b10-4aa8-cb43-08dc0545bdf2
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A/fAwn0jadA6cY8H3tgznJpIgq+bjFrjAeC2rdqasfSu8BIxwD3SjtdlqPKDeXenuq7dc0T1XeGYvGGNhZWxDfwc5SHvbmmNf9Rlp8sFk+eeiEYd9ZvKnMWFsHwhpL9IWLmC5HvuvhJT/Mx1MLGvfOO81djrRqb7Hs8qd2ylufijy9xOyG4Xp4XQ2/bHtL/rb5L7kjxzv7IuvNsYC1bscoK2FfaV9RKX3+Sxr9Rq5Gpw9fgAEdgyKg/Ps1Y+Y5kmWeRCagUZ/VzPYfY5kzcxQY3LHxqbsnXBk4dcReYB+2DqBHnqtr0cPlnLZb9ud199Pe/bsvlj0fi+ayAUGgNFZhSzHlgILVExMoHd3MSUhdpTk7xCY1rtoPS/WuejSpcBQxZdZRKjNvoqMnkaMNDrVSp/NauOosguGfuNu/V/lGbKT+DHhTKIZKJWp3M1VYQV2QNXLZejPwFzLizcokXIeXxUP7YRxw6X+CyRgelcoNn1scerNkIAlgCLIMzdjpXxr6f0abYcuw0vtn9EkD2n20EXLRjd2hMvTqTkUAgVpQFhYisue6sPMjU5bqihhsG/J2PaeyzteYOX+NSg+MmpQuuq/Es6tIutoaiKJnmZLPHf9uwCY3ob6iIUsBOsZqj5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB7873.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(136003)(346002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(82960400001)(86362001)(36756003)(41300700001)(122000001)(38100700002)(31696002)(966005)(6486002)(478600001)(5660300002)(8936002)(8676002)(4326008)(91956017)(110136005)(316002)(2616005)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(54906003)(4001150100001)(26005)(6512007)(6506007)(53546011)(2906002)(71200400001)(38070700009)(31686004)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEpNaUdYZGJlVGtLK1lCRTFrVWVnM0xBU3Q5V1oxSHpxVjdTS3F6aXpoZjFQ?=
 =?utf-8?B?NCs1ditnQVJKaTgwdWRmeVV6SjE1L0s4OTVmTTU3WXVWL04xMTlSVlUyZ2tw?=
 =?utf-8?B?THh1anJpM2hOUVYvSldWWDBjcE5HbDdyR200SXVHbE1ueTZJUUVYVmcxZm5k?=
 =?utf-8?B?YlNuZkNSQUN6cWd1OGx1TTB0UzJtMWN2ZkJtWklXNEw4eVBETUQ4ei9EdXlL?=
 =?utf-8?B?bHBNQ0ltR2pUWEtpTlBpeTZRdERCdDhGQ1dNTDU4a1c5SUQ2YWhpQ3pXUTNS?=
 =?utf-8?B?M2M4MHEyeG9VNmwwYnJpSTgxcW1oY1R2L09obHdGWmxzSlZabW9kY2lnU1RY?=
 =?utf-8?B?cjBkNVA2QTlDYmd5Zi82ZEJuSWdBZGFZN0hPaE1TQ2c4ZGJrUnpacGdKMlBS?=
 =?utf-8?B?Qlk5OHN0akpOYi9lamI2UUcxQ1JkYUhTTHp1aEkvRnh5Mm5aRE9QNmhPRVE3?=
 =?utf-8?B?ODJDWFpOckxyc1RGM0h4Skl0SUR0NTRiaFZYaS9nSERIV1ZzLy83V3A5ekhm?=
 =?utf-8?B?T3dWTG1ZWVNIV2J5YkVoeGFzcnlrTkhzSnZhYWZZdEJKN0RnQVU5SEZ4YVc2?=
 =?utf-8?B?ZXZUSk1jVXp6SXhRVXAvVkdVa2YvQUxsNVV2MHNoT3NkNkVjcGZSTklDTjAv?=
 =?utf-8?B?RGhjZWdyU2tZWVJQaVd2TXZQZkRRYmZ0d29xMnA2ZW5iNEY5czBpM3EvMmIz?=
 =?utf-8?B?UHhiU1BiUjRTT3p1NGp0Q2pXRllYQzRFVTBvM1IrNlI3YTMrMEFhSndjZWRG?=
 =?utf-8?B?ZFBjL3paVVJ6VFBiMTJYclo2RlNBSWVTWkFyeUUyVTRWa3hDcU1rc2MzVGVO?=
 =?utf-8?B?RDAyaWNUZllJeWtmRTFLYUV1TkNiQkw0MmN0REhubXZrTlJ4TVZacDJsSlEx?=
 =?utf-8?B?Z3hvSzk0RmFKbEQrSS9PZEdZblBGVXFxNlBFMmYyTEs5a3pidmdGWFRQQlNE?=
 =?utf-8?B?M3RGbXk0ZFU2aFo0di91ZG1FczAyMUZDZGplR3Z5YnpMOXEzOVdYNllXR1U4?=
 =?utf-8?B?UkwxVW1CbzZlZ3J0V1NmZHUvcGF1NmRmN3I1aXBmRGZmRnFHZnV1ckRkalBk?=
 =?utf-8?B?ZWRCUTZWSCtHdk1QaldDc1BXVEJXQ0lNdEdIT0J3c253Q2xxRjQrOStva2Fq?=
 =?utf-8?B?SXp1TUtLU0NnVjJQQTBZeTBJSUJsTEl2WE8vSG1mZzEzaXZBVzdaUFoxQXhM?=
 =?utf-8?B?NWxuZjU5ZEczamtzcEw1eVM3K05oRkV5djZKSnB1SjlOQ1ZiTUpzOEs4dUlB?=
 =?utf-8?B?SlBvbnhYL1UvL1pEZmdDL0t1eXNWMmI1NFNDUU1nRmNKMHVtbHZMNTJEQ1Jv?=
 =?utf-8?B?dzAydU96TVRIMUZlS1h6ZWt4aEZGTnBuSzZDa3hYVTVMS3ZCMk5CUHVCM1Js?=
 =?utf-8?B?QkRSd2FYZ1kyaWdLWmNVeXR4dGYrcWd0NFRzY1JaM2tnT0lET1ExVGJGODIv?=
 =?utf-8?B?dzByK2lPOXNhK2gvcVM1ZCtHbEVvZ0R1aTJ3Yjd0aG83ZVBVZVNvVm41Nkg3?=
 =?utf-8?B?SEE2ZW45d0ZaazFlL0FzMzdXa294RDdydmNGWkd6WlA2SDQ3TVEvY1ZmdFA2?=
 =?utf-8?B?WXFuQ3c5cE41NThpSzhDN0ZJdEVVaitUUXdyd1Q5d3FTMm9VOE9VWTBoYlFi?=
 =?utf-8?B?ZmY2cC9QSXZVUFExelRqTnlEdDV6ZWxGQWdlWk5KaXlLdUtDRDA1MTRJc0xY?=
 =?utf-8?B?cUNUSHRYRWhaNTQ1dTh0ZVZpTGZ4Qjg1Tkt2NDdKLzBnT2I1Ukp5TjdsNzh4?=
 =?utf-8?B?cGp0ZHRBbHV2QUZPaHlXbjRGNGYyRWpkaENzN0tPR21PdHk1M0Y3TjJPY0to?=
 =?utf-8?B?b1IxM205V0tFSGZWNjhrUTF4V3VVRDFhV0hnRjJHZGU2cEtrdzR2QjdrKzI5?=
 =?utf-8?B?SWRjZjY1SCtaVS80NnZOQ1BIZkpXSDBEMGpweEI0d1h1QUFCbjRzeG1oaVB4?=
 =?utf-8?B?aXZ3T2JoMDBoNk9VK1Noalh1Y1lTajI2eGVDQTVXbkZMWWc1UXhFK3RRdnJi?=
 =?utf-8?B?Ulh1N2xUR2dRMmRIN09XZU8zRkFjUFFUbXV5c0pHWmErYWlMVFJVcVBWOHdL?=
 =?utf-8?B?MW9JeEFrenBoZjVoTmg3T1cyZnN2TzBuemQvaUVIMmRtV1ZtRExpZmxJNDAw?=
 =?utf-8?Q?vjNo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66D741CEE026114E92EADB883AE77C09@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: brK1mLoa/M8JzCscOPxt0vjFU1rrwz80ABieijiGaYX7HQya9dmieTULh+r0l2OfBTAZvuGYLtVZtywCYLqnro+Xd5UzkqN0G447J7IEE0hh7rG4h1vI9JnnIlVtUWU1X0x7VIN2n7sk1tBTFI7vVp7Ftjp92gmqmLNtMJcZR2P9k34PitbBKWN4Vnxu2qEdBM+Vsak/1aHQlysirfa7A+b6lNcV8Ox1n4arq7vbQKE5KmIvGko57VJ0Zdh64HaRU7wvQ1ASsBtu22h4xBCSFTxftTUhxvs+pvKwtPjp0BaMV9XNG0J0TB5vz11MHXjuYVsse42O3BtZJbj0GuFz08hSyDQc1dwOp6/sJPKZ4Ms8QjLnKhzbAGEcYHkVp4J0mUDjAEuMu9srH8yH0od1L+rJOhWBrRwkh+qZKWJh8xbtSBQ2X8Eln8KjqOJHM5YJIXxQYZu3ALxrBp+dXUktX0+mK3ZRWix2XITIZAQ4PVyMg0sfTkZYylsE6WgKAQTF48iSQOfTn0M4yWAKHMp20uQ2ILwltW5zDCUk+/qjv02sKPqtbnS0k0PUS8btFVDMCfMmKgs3nktdLZ96fn9v4zydLGTAJ/mPAvDojWTXdZFSRRDrW+cx6N6kugOAwS/6
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB7873.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676731d9-5b10-4aa8-cb43-08dc0545bdf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2023 12:33:47.7191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0L0ZQHJj6qF+kbHH7hcmLry3T1uEvcbKxHwPCxcOYqe5MCjlzdErXsmAV+ZxwAznuRvs60seautJW56mjwQ6sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8103
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMzUwNzY5MzpGUEtleTEucHJpdjpaOTRvWBk7WqR8ptKrPJlox8CWYpNRDd2RsBWPjEniZ08HQ/RY8z5z1nuo2AP25ugaqlMjPAaPnhyj8tIgdxc+h1Ly4R46gQE/FAKCWbZBtPAmxF7I3CTE/tgzS5vIxX7/XBvfV3Z/lG7HhElbTt5i+Sqy3kZCfRVYyJih5FPOaPMqbPhjmZjqi8S5kxAopAQWryONlCy0CXm8gMFIt7S6jzFz8iq3rY/DG5NZOsg6opzIBuD+RFERJPAL3hiXGZ/rhxsLdojMrxRDgD1pJ3x5SUHOX5hH5J04W96WIlwtr9Ty9K6gkPKMRdh4PUiPOpL7x8t9nwMiB3tXX1XIJw73
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.14.50
X-Mailcontrol-Refers-To: 3BPCYodp061362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=c6OU902CsHZOi4M+q/Jd9+uu8HqcbbxE/sk3a/SLTMo=;
 b=VpindIuvqk7AFkrd+5oICEExuRglIYK9j6ld549bABv6kRhGQx3NsU+c5Gk5qp8ckKnosBATl0AP+rBX7mA9J4DVw6ctl8PMJqTY33ELWTrEcktkQD93N0i7TUHWdeGU07pqncqXkrA3LvS6WszoJJYcSEF+LWUIuXmUn+HNWs7EDlQqVNbIdYHbAOSF97jbHSN3ilwLCP5j77DBBiNlos/AtIWV8YitDoNJmBvQyTpwFlH0kSIw3gWGKZNVRCbByJ3tw9AsAyFs5gaZ9Zd+O7hobN8tDrx8QM2zQl5KJafBQR/+4NIsUfMoUWonPtclIRNOrrC0T4ABF8Iy13jZvg==
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
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMjQvMTIvMjAyMyAyOjI2LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gT24gV2VkLCAyMDIzLTEy
LTIwIGF0IDIwOjM0ICswMjAwLCBLb2J5IEVsYmF6IHdyb3RlOg0KPj4gVGhlIGRybSBtbWlvIGlv
Y3RsIGhhbmRsZXIgKHhlX21taW9faW9jdGwpIHdhc24ndCBuZWVkZWQgYW55bW9yZSwNCj4+IGFu
ZCB0aGVyZWZvcmUsIHJlY2VudGx5IHJlbW92ZWQuDQo+PiBOZXZlcnRoZWxlc3MsIGl0IGlzIG5v
dyByZXN0b3JlZCBmb3IgZGVidWdnaW5nIHB1cnBvc2VzIHRvIGZ1bmN0aW9uDQo+PiBhcyB0aGUg
aW9jdGwgaGFuZGxlciBvZiB0aGUgJ21taW8nIGRlYnVnZnMgZmlsZS4NCj4+IE5vdGUsIHRoYXQg
dGhlIG5vbi1hZG1pbiB1c2VyJ3MgbGltaXRlZCBtbWlvIGFjY2VzcyAoYWthLCB3aGl0ZWxpc3Qp
LA0KPj4gd2FzIHJlbW92ZWQgYmVpbmcgaXJyZWxldmFudCBhbnltb3JlLCBub3cgdGhhdCBhIHVz
ZXIgdXNpbmcgZGVidWdmcw0KPj4gbXVzdCBhbnl3YXkgaGF2ZSByb290IHBlcm1pc3Npb24gdG8g
dXNlIGl0Lg0KPiB5b3UgY2FuIHVzZSBhIElHVCB0b29sIGNhbGxlZCBpbnRlbF9yZWcgdGhhdCBk
b2VzIHdoYXQgeW91IHdhbnQgd2l0aG91dCBhZGRpbmcgYW55IGxpbmUgdG8gWGUgZHJpdmVyLg0K
Pg0KDQpUbyBzb21lIGV4dGVudCB3ZSBjYW4sIGhvd2V2ZXIsIGl0IGRvZXMgbm90IHNhdGlzZnkg
b3VyIGRldmVsb3BtZW50IG5lZWRzLg0KTW9yZW92ZXIsIHRoaXMgY2hhbmdlIHdhcyByZWNlbnRs
eSBhZ3JlZWQgdXBvbiB0aHJvdWdob3V0IHRoZSByZW1vdmFsIG9mDQp0aGUgZm9ybWVyIG1taW8t
aW9jdGwgY29kZToNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTIz
NDAzLw0KDQoNCktvYnkgRWxiYXoNCg0KPj4gU2lnbmVkLW9mZi1ieTogS29ieSBFbGJheiA8a2Vs
YmF6QGhhYmFuYS5haT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjogcmVtb3ZlZCB3aGl0ZWxp
c3Qgc3VwcG9ydCBmb3Igbm9uLWFkbWluIHVzZXJzDQo+Pg0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGVidWdmcy5jICAgICAgfCAxMDcgKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzX21taW8uaCB8ICA0NCArKysrKysrKysr
Kw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmc19t
bWlvLmgNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4+IGluZGV4IGMyNDYzN2ZmMDlk
OC4uYTQzODFlM2Q3ZDM3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
YnVnZnMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPj4gQEAg
LTEzLDYgKzEzLDEwIEBADQo+PiAgICNpbmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4+ICAgI2luY2x1
ZGUgInhlX2d0X2RlYnVnZnMuaCINCj4+ICAgI2luY2x1ZGUgInhlX3N0ZXAuaCINCj4+ICsjaW5j
bHVkZSAieGVfZGVidWdmc19tbWlvLmgiDQo+PiArI2luY2x1ZGUgInhlX21taW8uaCINCj4+ICsj
aW5jbHVkZSAicmVncy94ZV9yZWdzLmgiDQo+PiArI2luY2x1ZGUgInJlZ3MveGVfZW5naW5lX3Jl
Z3MuaCINCj4+ICAgDQo+PiAgICNpZmRlZiBDT05GSUdfRFJNX1hFX0RFQlVHDQo+PiAgICNpbmNs
dWRlICJ4ZV9ib19ldmljdC5oIg0KPj4gQEAgLTk3LDggKzEwMSwxMDkgQEAgc3RhdGljIGludCBm
b3JjZXdha2VfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkN
Cj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBsb25nIHhlX2RlYnVn
ZnNfbW1pb19pb2N0bChzdHJ1Y3QgZmlsZSAqZiwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQg
bG9uZyBhcmcpDQo+PiArc3RhdGljIGludCBfeGVfZGVidWdmc19tbWlvX2lvY3RsKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgKmFyZ3MpDQo+
PiAgIHsNCj4+ICsJc3RydWN0IHhlX2d0ICpndCA9IHhlX3Jvb3RfbW1pb19ndCh4ZSk7DQo+PiAr
CXVuc2lnbmVkIGludCBiaXRzX2ZsYWcsIGJ5dGVzOw0KPj4gKwlzdHJ1Y3QgeGVfcmVnIHJlZzsN
Cj4+ICsJaW50IHJldCA9IDA7DQo+PiArDQo+PiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3Mt
PmV4dGVuc2lvbnMpIHx8DQo+PiArCSAgICBYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnJlc2VydmVk
WzBdIHx8IGFyZ3MtPnJlc2VydmVkWzFdKSkNCj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPj4gKw0K
Pj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmIH5YRV9ERUJVR0ZTX01NSU9f
VkFMSURfRkxBR1MpKQ0KPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArCWlmIChYRV9J
T0NUTF9EQkcoeGUsICEoYXJncy0+ZmxhZ3MgJiBYRV9ERUJVR0ZTX01NSU9fV1JJVEUpICYmIGFy
Z3MtPnZhbHVlKSkNCj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKwliaXRzX2ZsYWcg
PSBhcmdzLT5mbGFncyAmIFhFX0RFQlVHRlNfTU1JT19CSVRTX01BU0s7DQo+PiArCWJ5dGVzID0g
MSA8PCBiaXRzX2ZsYWc7DQo+PiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmFkZHIgKyBi
eXRlcyA+IHhlLT5tbWlvLnNpemUpKQ0KPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiAr
CS8qDQo+PiArCSAqIFRPRE86IGFsbG93IGRpc3RpbmN0aW9uIGJldHdlZW4gWEVfUkVHIC8gWEVf
UkVHX0VYVCB0bw0KPj4gKwkgKiBoYW5kbGUgcmVnaXN0ZXJzIGZyb20gYm90aCBNTUlPICYgTU1J
T19FWFQgc3BhY2UuDQo+PiArCSAqLw0KPj4gKw0KPj4gKwkvKg0KPj4gKwkgKiBUT0RPOiBtaWdy
YXRlIHRvIHhlX2d0X21jciB0byBsb29rdXAgdGhlIG1taW8gcmFuZ2UgYW5kIGhhbmRsZQ0KPj4g
KwkgKiBtdWx0aWNhc3QgcmVnaXN0ZXJzLiBTdGVlcmluZyB3b3VsZCBuZWVkIHVhcGkgZXh0ZW5z
aW9uLg0KPj4gKwkgKi8NCj4+ICsJcmVnID0gWEVfUkVHKGFyZ3MtPmFkZHIpOw0KPj4gKw0KPj4g
Kwl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0KPj4gKwl4ZV9mb3JjZV93YWtlX2dldChn
dF90b19mdyhndCksIFhFX0ZPUkNFV0FLRV9BTEwpOw0KPj4gKw0KPj4gKwlpZiAoYXJncy0+Zmxh
Z3MgJiBYRV9ERUJVR0ZTX01NSU9fV1JJVEUpIHsNCj4+ICsJCXN3aXRjaCAoYml0c19mbGFnKSB7
DQo+PiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18zMkJJVDoNCj4+ICsJCQlpZiAoWEVfSU9DVExf
REJHKHhlLCBhcmdzLT52YWx1ZSA+IFUzMl9NQVgpKSB7DQo+PiArCQkJCXJldCA9IC1FSU5WQUw7
DQo+PiArCQkJCWdvdG8gZXhpdDsNCj4+ICsJCQl9DQo+PiArCQkJeGVfbW1pb193cml0ZTMyKGd0
LCByZWcsIGFyZ3MtPnZhbHVlKTsNCj4+ICsJCQlicmVhazsNCj4+ICsJCWRlZmF1bHQ6DQo+PiAr
CQkJZHJtX2RiZygmeGUtPmRybSwgIkludmFsaWQgTU1JTyBiaXQgc2l6ZSIpOw0KPj4gKwkJCWZh
bGx0aHJvdWdoOw0KPj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fOEJJVDogLyogVE9ETyAqLw0K
Pj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fMTZCSVQ6IC8qIFRPRE8gKi8NCj4+ICsJCQlyZXQg
PSAtRU9QTk9UU1VQUDsNCj4+ICsJCQlnb3RvIGV4aXQ7DQo+PiArCQl9DQo+PiArCX0NCj4+ICsN
Cj4+ICsJaWYgKGFyZ3MtPmZsYWdzICYgWEVfREVCVUdGU19NTUlPX1JFQUQpIHsNCj4+ICsJCXN3
aXRjaCAoYml0c19mbGFnKSB7DQo+PiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18zMkJJVDoNCj4+
ICsJCQlhcmdzLT52YWx1ZSA9IHhlX21taW9fcmVhZDMyKGd0LCByZWcpOw0KPj4gKwkJCWJyZWFr
Ow0KPj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fNjRCSVQ6DQo+PiArCQkJYXJncy0+dmFsdWUg
PSB4ZV9tbWlvX3JlYWQ2NF8yeDMyKGd0LCByZWcpOw0KPj4gKwkJCWJyZWFrOw0KPj4gKwkJZGVm
YXVsdDoNCj4+ICsJCQlkcm1fZGJnKCZ4ZS0+ZHJtLCAiSW52YWxpZCBNTUlPIGJpdCBzaXplIik7
DQo+PiArCQkJZmFsbHRocm91Z2g7DQo+PiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT184QklUOiAv
KiBUT0RPICovDQo+PiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18xNkJJVDogLyogVE9ETyAqLw0K
Pj4gKwkJCXJldCA9IC1FT1BOT1RTVVBQOw0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArDQo+PiArZXhp
dDoNCj4+ICsJeGVfZm9yY2Vfd2FrZV9wdXQoZ3RfdG9fZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxM
KTsNCj4+ICsJeGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0KHhlKTsNCj4+ICsNCj4+ICsJcmV0dXJu
IHJldDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGxvbmcgeGVfZGVidWdmc19tbWlvX2lvY3Rs
KHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZykN
Cj4+ICt7DQo+PiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZmlsZV9pbm9kZShmaWxwKS0+aV9w
cml2YXRlOw0KPj4gKwlzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgbW1pb19kYXRh
Ow0KPj4gKwlpbnQgcmV0Ow0KPj4gKw0KPj4gKwlpZiAoY21kID09IFhFX0RFQlVHRlNfTU1JT19J
T0NUTCkgew0KPj4gKwkJcmV0ID0gY29weV9mcm9tX3VzZXIoJm1taW9fZGF0YSwgKHN0cnVjdCB4
ZV9kZWJ1Z2ZzX21taW9faW9jdGxfZGF0YSBfX3VzZXIgKilhcmcsDQo+PiArCQkJCXNpemVvZiht
bWlvX2RhdGEpKTsNCj4+ICsJCWlmIChyZXQpDQo+PiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+PiAr
DQo+PiArCQlyZXQgPSBfeGVfZGVidWdmc19tbWlvX2lvY3RsKHhlLCAmbW1pb19kYXRhKTsNCj4+
ICsJCWlmIChyZXQpDQo+PiArCQkJcmV0dXJuIHJldDsNCj4+ICsNCj4+ICsJCXJldCA9IGNvcHlf
dG9fdXNlcigoc3RydWN0IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9kYXRhIF9fdXNlciAqKWFyZywN
Cj4+ICsJCQkJJm1taW9fZGF0YSwgc2l6ZW9mKG1taW9fZGF0YSkpOw0KPj4gKwkJaWYgKHJldCkN
Cj4+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4+ICsJfSBlbHNlIHsNCj4+ICsJCXJldHVybiAtRUlO
VkFMOw0KPj4gKwl9DQo+PiArDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgfQ0KPj4gICANCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmc19tbWlvLmggYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGVidWdmc19tbWlvLmgNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjUyNTkwYjVhY2EwZQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+PiBAQCAtMCwwICsx
LDQ0IEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPj4gKy8qDQo+
PiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4+ICsgKi8NCj4+ICsN
Cj4+ICsjaWZuZGVmIF9YRV9ERUJVR0ZTX01NSU9fSF8NCj4+ICsjZGVmaW5lIF9YRV9ERUJVR0ZT
X01NSU9fSF8NCj4+ICsNCj4+ICsjaW5jbHVkZSA8ZHJtL2RybS5oPg0KPj4gKw0KPj4gKyNkZWZp
bmUgWEVfREVCVUdGU19NTUlPXzhCSVQJCTB4MA0KPj4gKyNkZWZpbmUgWEVfREVCVUdGU19NTUlP
XzE2QklUCQkweDENCj4+ICsjZGVmaW5lIFhFX0RFQlVHRlNfTU1JT18zMkJJVAkJMHgyDQo+PiAr
I2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fNjRCSVQJCTB4Mw0KPj4gKyNkZWZpbmUgWEVfREVCVUdG
U19NTUlPX0JJVFNfTUFTSwkweDMNCj4+ICsjZGVmaW5lIFhFX0RFQlVHRlNfTU1JT19SRUFECQkw
eDQNCj4+ICsjZGVmaW5lIFhFX0RFQlVHRlNfTU1JT19XUklURQkJMHg4DQo+PiArDQo+PiArI2Rl
ZmluZSBYRV9ERUJVR0ZTX01NSU9fVkFMSURfRkxBR1MgKFwNCj4+ICsJWEVfREVCVUdGU19NTUlP
X0JJVFNfTUFTSyB8XA0KPj4gKwlYRV9ERUJVR0ZTX01NSU9fUkVBRCB8XA0KPj4gKwlYRV9ERUJV
R0ZTX01NSU9fV1JJVEUpDQo+PiArDQo+PiArc3RydWN0IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9k
YXRhIHsNCj4+ICsJLyoqIEBleHRlbnNpb25zOiBQb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNp
b24gc3RydWN0LCBpZiBhbnkgKi8NCj4+ICsJX191NjQgZXh0ZW5zaW9uczsNCj4+ICsNCj4+ICsJ
X191MzIgYWRkcjsNCj4+ICsNCj4+ICsJX191MzIgZmxhZ3M7DQo+PiArDQo+PiArCV9fdTY0IHZh
bHVlOw0KPj4gKw0KPj4gKwkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPj4gKwlfX3U2NCBy
ZXNlcnZlZFsyXTsNCj4+ICt9Ow0KPj4gKw0KPj4gKyNkZWZpbmUgWEVfREVCVUdGU19NTUlPX0lP
Q1RMX05SCTB4MDANCj4+ICsNCj4+ICsjZGVmaW5lIFhFX0RFQlVHRlNfTU1JT19JT0NUTCBcDQo+
PiArCV9JT1dSKDB4MjAsIFhFX0RFQlVHRlNfTU1JT19JT0NUTF9OUiwgc3RydWN0IHhlX2RlYnVn
ZnNfbW1pb19pb2N0bF9kYXRhKQ0KPj4gKw0KPj4gKw0KPj4gKyNlbmRpZiAvKiBfWEVfREVCVUdG
U19NTUlPX0hfICovDQoNCg0K
