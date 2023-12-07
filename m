Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D56C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 17:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161F010E149;
	Thu,  7 Dec 2023 17:06:56 +0000 (UTC)
X-Greylist: delayed 2918 seconds by postgrey-1.36 at gabe;
 Thu, 07 Dec 2023 17:06:54 UTC
Received: from cluster-d.mailcontrol.com (mail-01-d.mailcontrol.com
 [85.115.60.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866F910E149
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 17:06:54 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly14d.srv.mailcontrol.com (MailControl) with ESMTP id 3B7GICKu184404
 for intel-xe@lists.freedesktop.org; Thu, 7 Dec 2023 16:18:12 GMT
Received: from rly14d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender kelbaz@habana.ai) (MIMEDefang) with ESMTP id
 3B7GIBJP184031 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Thu, 07 Dec 2023 16:18:12 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly14d.srv.mailcontrol.com (MailControl) id 3B7GHORP168822
 for intel-xe@lists.freedesktop.org; Thu, 7 Dec 2023 16:17:24 GMT
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by rly14d-eth0.srv.mailcontrol.com (envelope-sender kelbaz@habana.ai)
 (MIMEDefang) with ESMTP id 3B7GH5aV162964 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Thu, 07 Dec 2023 16:17:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyLCUX2Iy72ULX4GFrOkh4B7EfE7TiV3QyKFmnD8jmQsgLzVQd5sNLoCovCTjW+wZAedzJR1TlUT7+xSIiCD7za43ID3NFDfQh4RS6UguwJAfsdR5GgOfC7ZaG7FpSF+Cxf6QCBqtEEw3X00iB0EItoZVSogpPztPDlmvWCjat/5Rya2fi1U6Zorm+igy/sSbPVX2dmhiEbEtsjghjlI41ik7ASIA0QJK7fI1TpeNpm4YGIJ+L5fKHtZJir8gcv+cndYi+8HRJVOvB7hU9vmO1Dx7EE2iDoJpeClpeKggXc6M9lpY6iIwhYee23GAtcWcsKDrTMvjdJdLLgEKXmtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AFn+r7ZVBpyrzksCC7VqhL0vXxl3GMUI1C1HVZnUto=;
 b=eDeHKmfzSd0ozFz5PBmGiyhtX6kiy10oxLSrNqLzGaRQLyELTV908slhFJt/B8Fe5fl2WhxkI8FvUkk6gXEJwGot0OVLM69TPEWF/GOS8KqtvwL4Vr33y+mqDgZUE3eFlPbN8aFbyW2dkUZqeetLUT5CC3s/JHZzARLnA2Bj/b+iK7cCKxRK9AeHoZ1301+zky3iguygzdADwCjRiQ30KPOI16mRo1AEXO0xN7NXTEdxsDTPqT2qNOCLSiaxsvRHLs2bIBTklpKjwDDfzpK+lm1wN0lSNX75DGcEy9Ltkc5wRm0lUE4CdPdWxaRndK0qskscmTonhtCVC+TTKwHyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AFn+r7ZVBpyrzksCC7VqhL0vXxl3GMUI1C1HVZnUto=;
 b=RNb7IgdwTz0m9e2AmqtJSo5UfqePkYAezxuDjKT9zrqUPGBhcBO8lecbFwE9mBc0Z71fohn3D8yYYqNc4ky8Pqx/KO/Nnpfu9bGyAtjcucN81guMfG5KvJbcr2lF6GaQddrIk+dE3IXkTzIevurokBJ4iNUIGsrOWj5MPQxfME78dlb1tsfeXHP8JoSbwXjv7g0G6j93eHxTEFy6ILCbP899Z9xnqZguZ1GeGwZPjRr/myaaS9q08rwld+ccDwDkmDs1Bgi0c1fY6BXdm/ZIJ7IjpxFNOtzIleT8h65gAe9RISLC/vqwekJeK3lm050Bb98o1TXDV1ZBpyJr7A+KGQ==
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com (2603:10a6:10:345::21)
 by DB9PR02MB8867.eurprd02.prod.outlook.com (2603:10a6:10:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 16:17:02 +0000
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::ae00:6d72:5454:a3a3]) by DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::ae00:6d72:5454:a3a3%3]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 16:17:02 +0000
From: Koby Elbaz <kelbaz@habana.ai>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename info.supports_* to info.has_*
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Rename info.supports_* to info.has_*
Thread-Index: AQHaJ4q3Aa9W6hUuBEm7Bzn5lyD7P7CcNcQAgAAWFoCAAbaugA==
Date: Thu, 7 Dec 2023 16:17:02 +0000
Message-ID: <0e14b05a-94a5-5875-1d25-7490be4f0c8b@habana.ai>
References: <20231205145235.2114761-1-lucas.demarchi@intel.com>
 <170186687243.27709.2485801479192283213@gjsousa-mobl2>
 <mq756slndp2u2ooh67pdhhaqfrb5o4f47s3utymcwtqh65jpv7@icq4wbtysn3e>
In-Reply-To: <mq756slndp2u2ooh67pdhhaqfrb5o4f47s3utymcwtqh65jpv7@icq4wbtysn3e>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB7873:EE_|DB9PR02MB8867:EE_
x-ms-office365-filtering-correlation-id: cdae554a-a481-474d-626f-08dbf73ff242
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w97hhVg2QRWW3U27tNbTMLNsYX6r8+03S0Lu20m2yHfoHo62ebelQLO6EFrIGrXRn2FvMjS2gbDxXhnvrajT5ryeU8of06FGIjUl0S2AdLQWNo2kB2Gwsi6xODNGMAIsXOtJHSNDp70ZNo3zp7PJ38P308eCWg6r9sqb90xP+JaAa+91aH9+fYSpOT60giihoGiEpp2viJJlvvxJI60mkm79AvK3kbUj/zZzF2NAi65YlzadQeoYB3rHJTCs0Hu9RLFVMMckEDeVCK/2gPRODDO43bNNzVJc0fS/Vgu3Og9o0ku/nCHtp9WNy0quQ15HrUDC097EGjPcuPiZxjTin3arXq8+HQsDKOB/V8seUJcME9ThWFXJidpO0fyrGUVdRxhVJWwtQ8nYjgdOPBP1wFrx15nCH1sRffJc4HsQEhORHR60SptRqk/j5AFOSx/vLX7SVyLkvJOsdUg2BI5TMsxjBJpbatScGiYkPaXL7gi7O2rINp8SQn0f479uJxilwziqxyebUBu2vuduZDS7TFGoPgMAXSnwBASElpLxM+/V9gsmFV5IaT5cX/NgExHN18aEF1B1futhJX+D++v/1lk1VyBN9y7dAO8SKCjpjZBsLr8QErLLkKYlfGWeq+TijsB+ycuIni/E6lSHEypIuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB7873.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(39850400004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2616005)(26005)(71200400001)(6506007)(6512007)(53546011)(122000001)(5660300002)(8936002)(8676002)(4744005)(4326008)(41300700001)(54906003)(2906002)(478600001)(110136005)(6486002)(91956017)(66556008)(66946007)(64756008)(66446008)(76116006)(66476007)(316002)(86362001)(31696002)(82960400001)(38100700002)(38070700009)(36756003)(31686004)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTFPbFJIUkpCbkRicjY1ZlBxY0d0dEU2VUNBM0FuQlEyRTVueHh2STljNWMz?=
 =?utf-8?B?UEExL0c3OVA5MldhUFRFM09McHdCZWZnYzhrWm8zTk9sdTAwZGw2bFJlejdr?=
 =?utf-8?B?aTBxWmtseDdwbzhPUy9pZS84aUdXQ2NmVzNxdUUxOWI3cFN1c2RGME1EQ2FQ?=
 =?utf-8?B?SXo3NmpudFp0Y2tFNk81VWx5SWVKb2lwM1ZCY1RUK0N1Tmh3UTM0dzdYMkR3?=
 =?utf-8?B?ZklRaWd6U2orNjBvSnlYYzYzVUUrK0Z1OGN0UnBZNy93eWNUTzFMN2pYemgv?=
 =?utf-8?B?ZkJnTTRxaERQaE5TVUNoMVZ2clVqZHFTV2hwMjd1SWllSzRHYUNXemM3bit6?=
 =?utf-8?B?SUxKL2J2RWUxU1h2U1EvNHh6bGk3Rk5rbjFZYS9hVWxEOFp0N0wxUnM1S0xK?=
 =?utf-8?B?NEFMTDFyMlpjNjFRNVJyQS81a3FQQ0hpd0ZOUTBNR2RuanE4eGxJRU5tOG9w?=
 =?utf-8?B?UXpDWm13UWpqL1hueHNGVzY4UWxWRUd3QzBtdzZsNktBQ1p4MjVSQjU4Umxk?=
 =?utf-8?B?VmQ1Z0ptMFg3c3JXMUlqZThEQ2c5QmhsaFY0dC9od1lTekNvNWUwTU9OY3ZE?=
 =?utf-8?B?VGNkSjdoQVZTalRmcWVTSXlLWUpRaGthdXpMTWpHTHg1SW0zcFhtQkFGaTA0?=
 =?utf-8?B?NDRHNXVDSzVnMlM2SGltWjh4UnNSc05YUUFIUlhZbGtSNmZ5MDI3T2xoT0tM?=
 =?utf-8?B?UnJabGZqN3BXcVo0NWRwTlVVQ01zK3lMMXgvcWF1OFF3QlgwZndvTDRwRjVv?=
 =?utf-8?B?d1lYbmlrVEpNM1dzWjlndFdIMDZPdEhQRWVweithRU0zaGMyUUN3QzE5SCtx?=
 =?utf-8?B?UDJYb2R4K29TSUYyczFDa0QrWXlNWlpHZndPdm9BdU43Q2c0WGF4bWp5WTdk?=
 =?utf-8?B?d3ZsWTFXNjZ6a2NlTjdRWHVSaGd0ci9UdXRUZ0E1aFJyWnBpWDRxbjB0bU9o?=
 =?utf-8?B?TzhtTU5MRDkwVnQrcUMrV1dEWDBmWEV1eVhBT3pPQUdDM1JKRkZtYVRjLzVm?=
 =?utf-8?B?bVlXWmhOWnNZNFVCckpPWmNqWTNHUHkxZGxHYllXazU3RHJBYk9McDByOEdL?=
 =?utf-8?B?NWdkY0NwZFpwU2g0SVd0dzB0TmZNdkVjanp4YTdsaHlySnZTVHZSS2lQUXFR?=
 =?utf-8?B?aXRZeCtaak42VUg5OExPRFVHUnVtTHFYK1JzcWQweUFlV0VzY0VLaVJ2amhX?=
 =?utf-8?B?LzREWmNReEt1cmI3OFhHc1J6V3I4YlJSY2tCRERKSkdvSE1SVTJSKzZrUDdT?=
 =?utf-8?B?SVhpT3FRZ2FGN0xGTmwxM2hxczVOeGJHaWRINU9JYnFiZ1l1TENQSVVtQWV2?=
 =?utf-8?B?eFRpbHpEMnFuK3NaV3RyUEJGVHR5Z25GL0doL01PVEtzcThOY25yQVNaV2h4?=
 =?utf-8?B?akEzZ1FuWE9mdE9DUUdYQXQwVlRyRkRPUTR6SDlWa0tlUkErNlJydHIrZUVw?=
 =?utf-8?B?a1hOTXFQRGxlay9Td3d1bXlXUUhFOHNKY1E0cHpIUzJkb0lDenRHUmlKWm9J?=
 =?utf-8?B?TDNWVlJKaFBLYW1FTEg3WUJDblpyMlpiNDdBam94dGp0WmsrNzVYUHBBb2h2?=
 =?utf-8?B?d0crcy9USnk0a3pOS1N4cVdqNHZPanhoemZaTjBjLzMwUGljNCtIZExzeXEz?=
 =?utf-8?B?bnYvNHZZSFNqNW0wam9JMTQ5K0pYdnRQbldZKzVLUDV0eEFKT2hwZFBiZG1a?=
 =?utf-8?B?SnduUWJVSlFvYU8xK0tmaDdyWHI0N3poOHF2K2YveWJiTDNRSEcvOCtqaGVQ?=
 =?utf-8?B?VEk4bU5meW9kZ291aUVwRHNZNVRodUI3ZWF2elBTeXMyYUtYcHRJZzBlQWlI?=
 =?utf-8?B?K1U0czlqdjZMMU5IQWxXck1BbklXWlI0cGNKWndvcklBVWp5bVYwMFBjTnJk?=
 =?utf-8?B?a21ISmdFRFJWQi9DdzFsMzd6Qzg1aWd1TUhGVGwyTW9kcDlBQWorUnlXdGxN?=
 =?utf-8?B?UXExV0hadjkrbkc0eTROSWpsc1g5QnpvRXhwSFFlbEVWTVhSeldXVzM3a0RM?=
 =?utf-8?B?RVM5RVNxanlBZkVmS1B0TFJSY05ISW9FY0dpbWFKejhkOTZ0T01OWERYSFNT?=
 =?utf-8?B?Njc1Qk1nVkZTRjI4WndRMW0vWkVDK3pGUGFVRk5SZ3ZhT05XMEVhY1RYaUwr?=
 =?utf-8?Q?yuEA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF5BE7DE8BE6A542852AEDB3F1D7A7B9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ltyBRbaUtVNjZa4rENk4xWP9xseAbeVxAGQLxT3Zw+mTuIvkd3EFW0iuTPE2cAJiC9WbcP1+JR5SwY3Um2aT4j0tkGr6hpmYADSO90XOSWDgJZ55xkf+SfXx2O3YtjE77HLrReenqUKsEeF/0zhXd/86kbaWkWER/N3P4Y3yOW//HemI25yO955tcP0e3zn+zRC/dSl2eIhkmuwUYPO4LucKFv2WeIlSgI8ikLXA8WT47D+PAk/4VgzIUosS3+nbQAzA0ZzLTyZNgquGZ058qgJm8uTblFrkckJOqiaIQ6ptufycDD0h8tmxzlE697vSKFbyT7vgD3jN0z8EkfjxlaE4m+Fei/Y4eeshIIEMMwkCaU7UBZVYAnH6aWam3JFrdVaof5mvCDolBCNTV8SJwaS2tBhzZVSb337E4Rg+xNe0HNZGF4lGs08S51nFWnAs0wJCj1fAsGTVh7UWKosjED6pkhBlrkCCddxw0jkTtxzHkEs80l6USwkOHAkT8dTbtmTU8O+CacPI1z0lyn1JLPGPbAlW/2NPqGNogN/MrlUVP4U4fha80eetYA6nQUCDwiU6BbRGQWuPGnx0AV+InUZcjdaxIBmFgF3JRT84k/mQbJsyXZI6ySwZ+rAFUm35dPHwPwdbcq44fLFTxFhfVsUuS7MRQ0CQdI8hC9GoMKH57BXqY7R/q+vnaHE0kuJ01RilUHKXkB3zQj0YwXkNDfeVzUc6FXPGmsRUSO5W9N4tlZLcFNJc/2KsLnU8RA9uD3vqfmIAsDfiMch98WdyKSRxMRICOn2rlKGNqMev8tQ=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB7873.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae554a-a481-474d-626f-08dbf73ff242
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 16:17:02.2042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rgM/ef/0tVVpn9v07dy2CDoizsoJV54iF8p0AWEFyQ/OvYrjNNR6Gofb8EUMR3KKCyNjuXS1N2A7AC9c6afh+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8867
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMTk2NTg5MTpGUEtleTEucHJpdjrNFH8DOvfxVjSG0WKyk12dGI/7FdJ2GG+7jjSpnJW4rmFfhwNEYXjwZYogpejAVLXzxOGWqCxpDmmgBoKKsTpNnv7RLshhi9kU1v2FS5rnxDO5S8O9VFSjqYQcoLdkhPes14E9RYQQx1QEx/kT7JQKqJ6xJNynVC3+5jxoN/TZbege8SaWMRe1DgPJvbFMEeyqVEGBv5S476RKy60vKCKG5F386O38Eb60/M4vtMBuq/+4On5pdu3luv8oB5U7CUvm/InamTqHmATzUxFVvxM8SuOEmHzN6y37uH56b3StIVq7oVaGKZHWBDvz0MbeCxIqukMNwNv3c8u/dhHrL1DH
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.17.169
X-Mailcontrol-Refers-To: 3B7GIBJP184031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=+AFn+r7ZVBpyrzksCC7VqhL0vXxl3GMUI1C1HVZnUto=;
 b=DGVf74g/Dxzr7BuVIAhnnWE3gQtw8+U9y5NgvBGLjAEYpAvybSzQqgx0r26Nbzy5FS72/xABwFtpMNJpcOT3+xbfFz2NGeI66ua53gQJKQF/QOsoVadG2VYO8NwHtYZYhVSxX0lAkCFFu1LQjqKTDk312jNjfI8h6h7ncnl2j650JINOVxMn1LxzXF7KROJBCb7tO7CwasfWaLj6SfT96WHTHV2MzB84Ge5uvax1DxImSZDXv+qWJQOJ/pMyla+BJm+FudI8am6IyhjkPjC9UOEI9Cvh29pDyOcQ6FXmWpO9L1jBMWsulPgTSrkzOrn3U4hiiphV6xcZOsYbeE21lw==
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMDYvMTIvMjAyMyAxNjowNiwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiBPbiBXZWQsIERl
YyAwNiwgMjAyMyBhdCAwOTo0Nzo1MkFNIC0wMzAwLCBHdXN0YXZvIFNvdXNhIHdyb3RlOg0KPj4g
UXVvdGluZyBMdWNhcyBEZSBNYXJjaGkgKDIwMjMtMTItMDUgMTE6NTI6MzUtMDM6MDApDQo+Pj4g
UmVuYW1lIHN1cHBvcnRzX21taW9fZXh0IGFuZCBzdXBwb3J0c191c20gdG8gdXNlIGEgaGFzXyBw
cmVmaXggc28gdGhlDQo+Pj4gZmxhZ3MgYXJlIGdyb3VwZWQgdG9nZXRoZXIuIFRoaXMgc2V0dGxl
cyBvbiBqdXN0IG9uZSB2YXJpYW50IGZvcg0KPj4+IHBvc2l0aXZlIGluZm8gbWF0Y2hpbmcgKCJo
YXNfIikgYW5kIG9uZSBmb3IgbmVnYXRpdmUgKCJza2lwXyIpLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+Pg0KPj4g
UmV2aWV3ZWQtYnk6IEd1c3Rhdm8gU291c2EgPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPg0KPg0K
PiBUaGFua3MuIEkgd2lsbCBsZWF2ZSB0aGlzIG91dCBhIGxpdHRsZSBiaXQgbW9yZSBzaW5jZSB0
aGlzIGhhcyBiZWVuIGFuDQo+IGFyZWEgb2YgZGlzYWdyZWVtZW50cyBpbiB0aGUgcGFzdC4NCj4N
Cj4gUm9kcmlnbyAvIEtvYnksIGFueSBvcGluaW9ucyBoZXJlPw0KPg0KPiBMdWNhcyBEZSBNYXJj
aGkNCg0KDQpTb3VuZHMgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IEtvYnkgRWxiYXogPGtl
bGJhekBoYWJhbmEuYWk+DQoNCg==
