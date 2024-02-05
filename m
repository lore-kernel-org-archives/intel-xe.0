Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C4C48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 12:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ED3112509;
	Mon,  5 Feb 2024 12:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="YJRMePp6";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="k78Ymn3h";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784BC112508
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 12:56:52 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly07b.srv.mailcontrol.com (MailControl) with ESMTP id 415Cuow0455312
 for intel-xe@lists.freedesktop.org; Mon, 5 Feb 2024 12:56:50 GMT
Received: from rly07b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 415CunP1454783 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Mon, 05 Feb 2024 12:56:50 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly07b.srv.mailcontrol.com (MailControl) id 415CuPiA447157
 for intel-xe@lists.freedesktop.org; Mon, 5 Feb 2024 12:56:25 GMT
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by rly07b-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 415CuOS1446494 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Mon, 05 Feb 2024 12:56:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY2qbQXsVbB5BfOUp1oI3c1z6mp28rjsm4Pr+oEcHIkHkFeIJDRlH86l5/SuYr5ukRnRsSOprb3HAZe5OvhLpKO+HjYWVWb86vOzH+Ubn3WGEG07hjz0SqSVvdMvdm/DlxYldO9bqS4fv3fwhMppJIDNl/Sm2lY60hj2Xyot0IZRNs4KP8uf375l+ttlJf9wVlX5cFVcdx7p9PCvNVYqVZh6jYqGORJffttso/qudj1cB8V0L7/odQuY3WjiQ3hJFrBwK5HN4jUUSCA1eayugwr2PkPf4yVJ8LWQ1tUTwuPJ2Qqph1OZghuAKfPgtHPgM6F1e6dyDWohWsW0ORfCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEulW4VS8vfkgXr0kn2A0eifcP8P6InbFbj13BzqLVM=;
 b=YgyFMSYPKkyOTGn2bmhIxrobLcfbve5Wlm8Z1nPEGjm90mrcAJtfOZZwKqCEbl8NafnoM7Ik0GegLuizfQTkLv1T9PtVItOj61sgB+uD6e2wlqtYJvcOU3MI6oC/XcdS5cKLu0Q6dF4+vv/rG4TT1BoUm8/8O9L4yQzpPDcEaxDSTbbVqA47LfZL2qXA2+jBS2SuBRlksh+squVfNgzyypo94hpdWSQiytZ4NSNp82ggqueAJbW/509H4An5FbWQ987a6gJkYy9h2PGdc1q68UvRvLk7Sr1FQg2SVLEYuEcSZ/ZpG65xdPj6F8vgfIGQQX2y7ISpMkvHUXoyPWjKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEulW4VS8vfkgXr0kn2A0eifcP8P6InbFbj13BzqLVM=;
 b=YJRMePp6iEYgm+S3hh8hTYBAmMXD6xWDjbbfxMCAHbki9nQiLGWAUEVtBZ9BpUqYbNqtQZUTebXeBwtXwmoYLWLZokGrI/hbBRQYwSz4Jc67CTudIoWXCe28848fwieDDEvRjYZ5xUkBzUFNsJKqouBWVvXhK3Fe07XsdijjaNDlcDy/9xF0g4RdBTSO4F43rMwxdcXnwaFp/gc2thmXAY3I2ecjPyhuromJbqEEP7gwTgJ4Sb+txANlc7EjgeJWvz0HonmqhmpJ5Ii8N9MxFA3+5/Wg8xdH+wxNXZJJEniePQW/o05v6CveT5q0TJbWYf3e3nU3ktbk+ikFil8GRA==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DB5PR02MB10261.eurprd02.prod.outlook.com (2603:10a6:10:4a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 12:56:13 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::3688:d7e3:20e8:7271]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::3688:d7e3:20e8:7271%7]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 12:56:13 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Koby Elbaz <kelbaz@habana.ai>, "Winiarski, Michal"
 <michal.winiarski@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl handler
 of the mmio debugfs file
Thread-Topic: [PATCH v6 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl
 handler of the mmio debugfs file
Thread-Index: AQHaVIAe5Z9Aew/B7kmSRXKZQ3TAXLD7vGWA
Date: Mon, 5 Feb 2024 12:56:13 +0000
Message-ID: <2a5bb499-8fe9-46cd-a950-4205271930ce@habana.ai>
References: <20240131195953.852641-1-kelbaz@habana.ai>
 <20240131195953.852641-2-kelbaz@habana.ai>
In-Reply-To: <20240131195953.852641-2-kelbaz@habana.ai>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|DB5PR02MB10261:EE_
x-ms-office365-filtering-correlation-id: 107d966d-19d7-4f96-afd0-08dc2649d578
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HGZ1y2CQU+Wl0FXpXSEq6CipqFowh14yw0RgvQw2nRPpdyWYAxOqUtVQi5ataYOjXmkAF59AiRJqjbHgbFhks5lOZRuigNE3zNFWU29kzTUzOj+QC3aaNQaEYSpOXWzGVc1mjfhxc/0vEMZ6iXMobBzsAlGf4BOf+DPHMvN/v9nV102ZO7yzNciKMIeGLxR0mTbyDjVITCrV9kl74ttwpiA4MyQlyXq72leHpXtA2awiepKLoaGrkpR84KOQw36o5VwpLMFl0E9+rgyIOX7bodXVHiG9OjSEduVEH2hOcv0tydGkYJzn/6kbWGPtsLWCYHDJsOOk/sAc4pehXW4myqn9pN88+YzgFt0qJMU0Hn9fmIP86WPwukCtaz4SrnR3+/xKjWoGh9CupObRZ6YjfWiSFaOsxSYtspBpev5878LXnldEdrdUFyB6ihcdlbEEUn2W2wcg2BXS+6/vtOvxwJ2jOalfywYzGlNG5deDWQMSYDuOO6exKnlEfK7aWNYN42F6UCA6JaOjys5eWa/pxrZuXOVheIoMc4JaxhySzb8Ub++eMYFyK/MCO9zcEedojP47e6rDbF/Nwf3zzfAv9pEOIMNtr6aW8icV+Vzy/GrkGaWLg9q7WCOEIVeIGQ9y1/o5UkD7zi/7+dgy7McQ3VbPtLJe1wIern7eWK8xs9v5Npt8Eld6r9gP4tPmzflx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39840400004)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(41300700001)(82960400001)(36756003)(2906002)(83380400001)(6506007)(71200400001)(122000001)(26005)(38100700002)(6512007)(2616005)(53546011)(76116006)(66476007)(6486002)(316002)(66446008)(31696002)(478600001)(66556008)(66946007)(64756008)(38070700009)(86362001)(91956017)(110136005)(4326008)(8936002)(8676002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm95aUQvT29maE9HcDBCTkxHREFHdklQZzhvZzRvUGdja1pTTmpQeDJRUktX?=
 =?utf-8?B?ZGtyZ0w5TGxtNHpzUFA2dW4zb21tdjRtQ2g1QWlDNUNBQkxyV1FST2xLa3Yz?=
 =?utf-8?B?R3kxS1FXb2FWVFg4d0RsbHlpdnlLaWJrS0p6dElBb1JTN2VnMUtUV1hwOGcv?=
 =?utf-8?B?R3MwcUZiNnk1YS8veW1QeGNTVEhEaGxKUlQzNGRUR2o0cGtOVFBoWmVqdnR3?=
 =?utf-8?B?ZXd6NDdILzVWUW1BNnZlOEhNQ0xsc0NBd0g2a1FTdzZPcE42QzNnUDBzOE9a?=
 =?utf-8?B?eUpKTWdDWFJDdzJ3R0RoQ3cveGpRV1A2V3AzdmpWMkN3LzVDSGZiZEZ0ZXpJ?=
 =?utf-8?B?Y2JiWEQwVlE5eFpiVy9kc2ZTVlNRa3gvTXZ2VkhXTGU4MTd4YkU3d2VpNFdk?=
 =?utf-8?B?R1FDNmphQUY0TWc3YW9SS2Raajh4cWEyOTF6MFNDMTNqSkw4M2Z4Vm5oc2hO?=
 =?utf-8?B?TzhvejlwQWdEcDB3bFI2cUsvWFZZS05IRTFSZEhwYWpxb1h2V0U2akRpZTNF?=
 =?utf-8?B?S0Z1dVVYOVRqSFpVQ094UnNlK3BoTklEMmtoZjRHWlkyUzg0eGxsK3E5MEV6?=
 =?utf-8?B?Und1dXFka1dFR2lGeWxhYTBETFhWOTdXTTQzYTZIMjNDb0dIOWZZazRDcXFO?=
 =?utf-8?B?RGtwbGIreHhybXJENEg3L0g0ZGlQMzl2ZDZmcmVDbEtTZ1dGYk1MQ0IrOVIr?=
 =?utf-8?B?OFIwUEQ3VllWby8yWDhMaWs5TTU3QTlrUzFEaE5keGNROHpQTTI1YkxlYVY5?=
 =?utf-8?B?OEN6R096RnphZ3J2azd3TEZ5eHRqT0lKWjNHSTV0K2hZQzJkY1k0OUlORG50?=
 =?utf-8?B?cm9hV2VaTis1MWxTQnhzMEdMM0wwQUI1V2luWUVrYXRRSkRlZUtHQ2x5Rmhy?=
 =?utf-8?B?ZjJzNGNvRWg2Y2UyWXNCRG9oM2pKcTNQUE1uY3NtOCtJc3ZDZW1oaG0ybUJI?=
 =?utf-8?B?cys3Tk1rZHB5OUNmQTR6T3E4NlA0Q0g4c3IzTU9kOGZYVTkxSFoxTytacGtQ?=
 =?utf-8?B?RVVTaHNWK3QybUlkWlJ0SnRQbFRDaEpkVU9PSlVsUElKMmVlTm4rTzBUTWN2?=
 =?utf-8?B?MkRwTldKOWx2Y28vQWtiS0dCNjArdkRsRWFvVFYwSTJDQ3RyazRsUko0bzJR?=
 =?utf-8?B?TFFxNHdxaExZY050WjhzMnF4RVlxZENLVEIyZm1GMVRaOTdkSFI5SWRoUE84?=
 =?utf-8?B?YkI4bTdHUjg4KzNKUDRWcitBbVZrNTlMN1RCTngwc3pGUjk0TXB0bkdwa0Rp?=
 =?utf-8?B?ejNUTDVrRzFXSkhuWU1VR1FRamZBNll3aXdTaUxidXU5Mm03ZHplZlI3a0NI?=
 =?utf-8?B?cU9RaFUvdDdIbUd0ME9RbmZtWWlkNDB6ZjFxVkYrOTlxWTlKR0ZtdkNwTVM4?=
 =?utf-8?B?dVdhekhxd2RYUzZxMnlKSnh0NCtscGFudmU3SnJLWEl0MEFKR0l4b3JIZDVL?=
 =?utf-8?B?RWY3L1g2UHhIUEo4YXVESVB6MjYxYmdHdmQvUVpqc2NQY2h1OFQ5NmJnUkkz?=
 =?utf-8?B?STgzdVBTZlZiWFNlTnRnaW1HSU1raXNCR2N1QysrUEtnbjAxYzA3ODNCRmNC?=
 =?utf-8?B?WVVIcEEzSjZzTjQ3WTFxb1VhbWVVSFlGc3NoQ3c1SThxVDZQcjduSDRkbllj?=
 =?utf-8?B?N3FwWXM2emNUVmV0NzlGUEViaXBlaDZkbHlSY3grWitic1VTYnEydERBYTBj?=
 =?utf-8?B?RlpPY1dPRGliMjNiOHNUSGNHZ0dJbytjbTl2czJqTkp1WWR4bnB3ZFlad2VB?=
 =?utf-8?B?cWU5bEVCRlF3SU1HaUFlbVh4QkRsZzVJZUpTT3AzcTJadERwK2NtM2Zuelpm?=
 =?utf-8?B?aGlLUWM5YkJ6dmNodnpaeXBWQW1WV1FWMDFqUVJFT2thQ0hYRVNhS3UwMEFZ?=
 =?utf-8?B?blduWlI3cGZITGNkbG5xNFdJdGlMa3oyeHNGYTF0TkRFMkdjQzhaL2x2S2U4?=
 =?utf-8?B?b29XOVJmeGZjOUd3ZDI1a253ZlNJWnVGQ0NpM2pVR1AxRENVZ1laYnRMZHZh?=
 =?utf-8?B?Q1FJNCtFUVYybE5PVnRiRkgyM3pTdW9qcXFRdlgwUUtlbkZ3anF0WXhYUTAz?=
 =?utf-8?B?SEo5ZUtONkZ4ZTlxVEhvMlJhTE91MTdQUjBoV1JZZDJVdU5nTkZtRXY2cjdq?=
 =?utf-8?Q?/C3g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8C0D6405CD2AE408AD07F89D384DFB5@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xLWSZY5SgIHMt7QU/+lvi0kp2g4lLiqn6htmyN0jsFeuy5IQHU9TtoOr5cMD8LvIITFnUsoHBxr9PtwYVlhD3KkdMKNtXheqjNXvbJKS5Qennm4vvSXYngdoeInyw7qO2/zaKg34F7XITOBtEftLJKNLvsWzTyh5lYXqG8VQm9jCqHUEBVNGIOX/7HLUOkpYah/TuBj9oWfjUCOu+NnAE6tLG9qLtXAk6tgUmm8VkzYjomo4rWkHgAXsV9rkyEi0z1ZCOS0DKpj9S8R4iOQIx0kCSzWUg9b4wvHFfdZb1YxB9NhkwgoQRlTj64yWmbmMQ4mNbc12RXozQyFcJM6B/lv/4C7zTNaYXcBdF1sOfbfaWNR91q+Qk+9uzXTKW8YomOaAcfbj4BAjv6ApSLwgiUwObSDFpk9BwcYTYLsR0KansAkDAHAJ7RZjlc2B+xQPO/Mg6qeqjEs4BgMpvIjNo+fcSsTpmAkK0fA4DF85oGBENE2wVUPT04ALlrEEP2r0EzlCZsBHuLYCQ9iN3rP32/zWlCP1L712NSnUIWRA2TiODyrhjiHaiyq3mAvYwWlaTgGuN6dGurl97TemUBA1t/8PkoiwYU2WpGTNJ3n0wer7IYmuQeB0u3MItsLN3sSc
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107d966d-19d7-4f96-afd0-08dc2649d578
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 12:56:13.5547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozouRbhyspPknfxN6C8f+Tv+B3VXntCDVTz7wIU6qGFKZftfnS7bSQ9tke6OcIPRDEnbDvu+gMXreSH+MxucNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10261
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNzEzNzgxMDpGUEtleTEucHJpdjqg9jeMEQs8AhbhgEUUlAFJNNvJm8QWB0ede6EjfHr9grXoPbAHyQDdW7pVYryAqf8hC909qWtkPUdiRGgV2vazFcYqPxkdHXelJwgW52JpdB3nrN6YTakoDMTx8qn/2D29UzM7xq10EDV7LSJMsk1+pazuWO0ndaFJb92pBmOzWKZbSElRAC73Jvn1mlsEVhtMUAuz/0fCiMrBcvfvBJgnrMMOZsb/w48kn8c3ttHa8++9UwDyww32+ZzNYlQaCCntnjJJ6KVOgEigeMh8sXDwek6sNfGrQPu6N/2vWPKHOgw7DbksLCeLsYOSWBpgcEOvat4gfTNl6YP84SpIDlHI
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.18.104
X-Mailcontrol-Refers-To: 415CunP1454783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=wEulW4VS8vfkgXr0kn2A0eifcP8P6InbFbj13BzqLVM=;
 b=k78Ymn3hx8cPHjX0Lm9MxMrw53h+tZniZz6QphxXKXMAg/AbUAbxtqKldit028wN6k9EcfAleXDNeYyHudmKCCQDXVXCCzQFH49goqZqlL8km6yN7FAIiyDl8NlvudwDWE9krZcVtjPHLefeMr7aUpqeMARAVYjE46Ru59qLhTHeliNfFFKCudSgSwz7u0G9rAwmrkT/DVjb5WeRhfulIsdEsXe5xGwF9Go0T2BpsGYScZu0TN8FJlOjdkXpdoj2NG74ssVN70/wTHsb96J8kqOriKZW2ZdUITwXkDApwZp01Yqqx8Bdi94Xwqw3sBHPPq5sPDSlwWKMVFfVTJFw0g==
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

T24gMzEvMDEvMjAyNCAyMTo1OSwgS29ieSBFbGJheiB3cm90ZToNCj4gVGhlIGRybSBtbWlvIGlv
Y3RsIGhhbmRsZXIgKHhlX21taW9faW9jdGwpIHdhc24ndCBuZWVkZWQgYW55bW9yZSwNCj4gYW5k
IHRoZXJlZm9yZSwgcmVjZW50bHkgcmVtb3ZlZC4NCj4gTmV2ZXJ0aGVsZXNzLCBpdCBpcyBub3cg
cmVzdG9yZWQgZm9yIGRlYnVnZ2luZyBwdXJwb3NlcyB0byBmdW5jdGlvbg0KPiBhcyB0aGUgaW9j
dGwgaGFuZGxlciBvZiB0aGUgJ21taW8nIGRlYnVnZnMgZmlsZS4NCj4gTm90ZSwgdGhhdCB0aGUg
bm9uLWFkbWluIHVzZXIncyBsaW1pdGVkIG1taW8gYWNjZXNzIChha2EsIHdoaXRlbGlzdCksDQo+
IHdhcyByZW1vdmVkIGJlaW5nIGlycmVsZXZhbnQgYW55bW9yZSwgbm93IHRoYXQgYSB1c2VyIHVz
aW5nIGRlYnVnZnMNCj4gbXVzdCBhbnl3YXkgaGF2ZSByb290IHBlcm1pc3Npb24gdG8gdXNlIGl0
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29ieSBFbGJheiA8a2VsYmF6QGhhYmFuYS5haT4NCj4g
LS0tDQo+IENoYW5nZXMgaW4gdjY6DQo+ICAgLSBSZW1vdmVkIHVubmVjZXNzYXJ5IGhlYWRlciBp
bmNsdWRlcy4NCj4gICAtIEV4cGFuZGVkIHRoZSBzY29wZSBvZiBzZWN1cml0eV9sb2NrX2Rvd24g
Y2hlY2suDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYyAgICAgIHwgMTExICsr
KysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1
Z2ZzX21taW8uaCB8ICA0MyArKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTUyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzX21taW8uaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdm
cy5jDQo+IGluZGV4IDIxYjIyNTdhYTNhOC4uY2M5ZDEwOGY3ZmIyIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZWJ1Z2ZzLmMNCj4gQEAgLTYsMTMgKzYsMTUgQEANCj4gICAjaW5jbHVkZSAieGVfZGVi
dWdmcy5oIg0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC9zdHJpbmdfaGVscGVycy5oPg0KPiAt
DQo+ICsjaW5jbHVkZSA8bGludXgvc2VjdXJpdHkuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9k
ZWJ1Z2ZzLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgInhlX2JvLmgiDQo+ICAgI2luY2x1ZGUgInhl
X2RldmljZS5oIg0KPiAgICNpbmNsdWRlICJ4ZV9ndF9kZWJ1Z2ZzLmgiDQo+ICAgI2luY2x1ZGUg
InhlX3N0ZXAuaCINCj4gKyNpbmNsdWRlICJ4ZV9kZWJ1Z2ZzX21taW8uaCINCj4gKyNpbmNsdWRl
ICJ4ZV9tbWlvLmgiDQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19EUk1fWEVfREVCVUcNCj4gICAj
aW5jbHVkZSAieGVfYm9fZXZpY3QuaCINCj4gQEAgLTk4LDggKzEwMCwxMTMgQEAgc3RhdGljIGlu
dCBmb3JjZXdha2VfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmls
ZSkNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGxvbmcgeGVfZGVidWdm
c19tbWlvX2lvY3RsKHN0cnVjdCBmaWxlICpmLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBs
b25nIGFyZykNCj4gK3N0YXRpYyBpbnQgX3hlX2RlYnVnZnNfbW1pb19pb2N0bChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwgc3RydWN0IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9kYXRhICphcmdzKQ0KPiAr
ew0KPiArCXN0cnVjdCB4ZV9ndCAqZ3QgPSB4ZV9yb290X21taW9fZ3QoeGUpOw0KPiArCXVuc2ln
bmVkIGludCBiaXRzX2ZsYWcsIGJ5dGVzOw0KPiArCXN0cnVjdCB4ZV9yZWcgcmVnOw0KPiArCWlu
dCByZXQgPSAwOw0KPiArDQo+ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZXh0ZW5zaW9u
cykgfHwNCj4gKwkgICAgWEVfSU9DVExfREJHKHhlLCBhcmdzLT5yZXNlcnZlZFswXSB8fCBhcmdz
LT5yZXNlcnZlZFsxXSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKFhFX0lP
Q1RMX0RCRyh4ZSwgYXJncy0+ZmxhZ3MgJiB+WEVfREVCVUdGU19NTUlPX1ZBTElEX0ZMQUdTKSkN
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCAhKGFy
Z3MtPmZsYWdzICYgWEVfREVCVUdGU19NTUlPX1dSSVRFKSAmJiBhcmdzLT52YWx1ZSkpDQo+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJYml0c19mbGFnID0gYXJncy0+ZmxhZ3MgJiBYRV9E
RUJVR0ZTX01NSU9fQklUU19NQVNLOw0KPiArCWJ5dGVzID0gMSA8PCBiaXRzX2ZsYWc7DQo+ICsJ
aWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+YWRkciArIGJ5dGVzID4geGUtPm1taW8uc2l6ZSkp
DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBUT0RPOiBhbGxvdyBk
aXN0aW5jdGlvbiBiZXR3ZWVuIFhFX1JFRyAvIFhFX1JFR19FWFQgdG8NCj4gKwkgKiBoYW5kbGUg
cmVnaXN0ZXJzIGZyb20gYm90aCBNTUlPICYgTU1JT19FWFQgc3BhY2VzLg0KPiArCSAqLw0KPiAr
DQo+ICsJLyoNCj4gKwkgKiBUT0RPOiBtaWdyYXRlIHRvIHhlX2d0X21jciB0byBsb29rdXAgdGhl
IG1taW8gcmFuZ2UgYW5kIGhhbmRsZQ0KPiArCSAqIG11bHRpY2FzdCByZWdpc3RlcnMuIFN0ZWVy
aW5nIHdvdWxkIG5lZWQgdWFwaSBleHRlbnNpb24uDQo+ICsJICovDQo+ICsJcmVnID0gWEVfUkVH
KGFyZ3MtPmFkZHIpOw0KPiArDQo+ICsJeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KHhlKTsNCj4g
Kwl4ZV9mb3JjZV93YWtlX2dldChndF90b19mdyhndCksIFhFX0ZPUkNFV0FLRV9BTEwpOw0KPiAr
DQo+ICsJaWYgKGFyZ3MtPmZsYWdzICYgWEVfREVCVUdGU19NTUlPX1dSSVRFKSB7DQo+ICsJCXN3
aXRjaCAoYml0c19mbGFnKSB7DQo+ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzMyQklUOg0KPiAr
CQkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+dmFsdWUgPiBVMzJfTUFYKSkgew0KPiArCQkJ
CXJldCA9IC1FSU5WQUw7DQo+ICsJCQkJZ290byBleGl0Ow0KPiArCQkJfQ0KPiArCQkJeGVfbW1p
b193cml0ZTMyKGd0LCByZWcsIGFyZ3MtPnZhbHVlKTsNCj4gKwkJCWJyZWFrOw0KPiArCQlkZWZh
dWx0Og0KPiArCQkJZHJtX2RiZygmeGUtPmRybSwgIkludmFsaWQgTU1JTyBiaXQgc2l6ZSIpOw0K
PiArCQkJZmFsbHRocm91Z2g7DQo+ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzhCSVQ6IC8qIFRP
RE8gKi8NCj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fMTZCSVQ6IC8qIFRPRE8gKi8NCj4gKwkJ
CXJldCA9IC1FT1BOT1RTVVBQOw0KPiArCQkJZ290byBleGl0Ow0KPiArCQl9DQo+ICsJfQ0KPiAr
DQo+ICsJaWYgKGFyZ3MtPmZsYWdzICYgWEVfREVCVUdGU19NTUlPX1JFQUQpIHsNCj4gKwkJc3dp
dGNoIChiaXRzX2ZsYWcpIHsNCj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fMzJCSVQ6DQo+ICsJ
CQlhcmdzLT52YWx1ZSA9IHhlX21taW9fcmVhZDMyKGd0LCByZWcpOw0KPiArCQkJYnJlYWs7DQo+
ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzY0QklUOg0KPiArCQkJYXJncy0+dmFsdWUgPSB4ZV9t
bWlvX3JlYWQ2NF8yeDMyKGd0LCByZWcpOw0KPiArCQkJYnJlYWs7DQo+ICsJCWRlZmF1bHQ6DQo+
ICsJCQlkcm1fZGJnKCZ4ZS0+ZHJtLCAiSW52YWxpZCBNTUlPIGJpdCBzaXplIik7DQo+ICsJCQlm
YWxsdGhyb3VnaDsNCj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fOEJJVDogLyogVE9ETyAqLw0K
PiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18xNkJJVDogLyogVE9ETyAqLw0KPiArCQkJcmV0ID0g
LUVPUE5PVFNVUFA7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gK2V4aXQ6DQo+ICsJeGVfZm9yY2Vf
d2FrZV9wdXQoZ3RfdG9fZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gKwl4ZV9kZXZpY2Vf
bWVtX2FjY2Vzc19wdXQoeGUpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIGxvbmcgeGVfZGVidWdmc19tbWlvX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNp
Z25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZykNCj4gICB7DQo+ICsJc3RydWN0IHhlX2Rl
dmljZSAqeGUgPSBmaWxlX2lub2RlKGZpbHApLT5pX3ByaXZhdGU7DQo+ICsJc3RydWN0IHhlX2Rl
YnVnZnNfbW1pb19pb2N0bF9kYXRhIG1taW9fZGF0YTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJ
cmV0ID0gc2VjdXJpdHlfbG9ja2VkX2Rvd24oTE9DS0RPV05fUENJX0FDQ0VTUyk7DQo+ICsJaWYg
KHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCWlmIChjbWQgPT0gWEVfREVCVUdGU19N
TUlPX0lPQ1RMKSB7DQo+ICsJCXJldCA9IGNvcHlfZnJvbV91c2VyKCZtbWlvX2RhdGEsIChzdHJ1
Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgX191c2VyICopYXJnLA0KPiArCQkJCSAgICAg
c2l6ZW9mKG1taW9fZGF0YSkpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIC1FRkFVTFQ7
DQo+ICsNCj4gKwkJcmV0ID0gX3hlX2RlYnVnZnNfbW1pb19pb2N0bCh4ZSwgJm1taW9fZGF0YSk7
DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJCXJldCA9IGNvcHlf
dG9fdXNlcigoc3RydWN0IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9kYXRhIF9fdXNlciAqKWFyZywN
Cj4gKwkJCQkgICAmbW1pb19kYXRhLCBzaXplb2YobW1pb19kYXRhKSk7DQo+ICsJCWlmIChyZXQp
DQo+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4gKwl9IGVsc2Ugew0KPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gKwl9DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMWRmYjhmYTJjZTlhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+IEBAIC0wLDAgKzEsNDMgQEANCj4gKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQg
wqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX1hFX0RF
QlVHRlNfTU1JT19IXw0KPiArI2RlZmluZSBfWEVfREVCVUdGU19NTUlPX0hfDQo+ICsNCj4gKyNp
bmNsdWRlIDxkcm0vZHJtLmg+DQo+ICsNCj4gKyNkZWZpbmUgWEVfREVCVUdGU19NTUlPXzhCSVQJ
CTB4MA0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fMTZCSVQJCTB4MQ0KPiArI2RlZmluZSBY
RV9ERUJVR0ZTX01NSU9fMzJCSVQJCTB4Mg0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fNjRC
SVQJCTB4Mw0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fQklUU19NQVNLCTB4Mw0KPiArI2Rl
ZmluZSBYRV9ERUJVR0ZTX01NSU9fUkVBRAkJMHg0DQo+ICsjZGVmaW5lIFhFX0RFQlVHRlNfTU1J
T19XUklURQkJMHg4DQo+ICsNCj4gKyNkZWZpbmUgWEVfREVCVUdGU19NTUlPX1ZBTElEX0ZMQUdT
IChcDQo+ICsJWEVfREVCVUdGU19NTUlPX0JJVFNfTUFTSyB8XA0KPiArCVhFX0RFQlVHRlNfTU1J
T19SRUFEIHxcDQo+ICsJWEVfREVCVUdGU19NTUlPX1dSSVRFKQ0KPiArDQo+ICtzdHJ1Y3QgeGVf
ZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgew0KPiArCS8qKiBAZXh0ZW5zaW9uczogUG9pbnRlciB0
byB0aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwgaWYgYW55ICovDQo+ICsJX191NjQgZXh0ZW5z
aW9uczsNCj4gKw0KPiArCV9fdTMyIGFkZHI7DQo+ICsNCj4gKwlfX3UzMiBmbGFnczsNCj4gKw0K
PiArCV9fdTY0IHZhbHVlOw0KPiArDQo+ICsJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4g
KwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+ICsNCj4gKyNkZWZpbmUgWEVfREVCVUdGU19N
TUlPX0lPQ1RMX05SCTB4MDANCj4gKw0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fSU9DVEwg
XA0KPiArCV9JT1dSKDB4MjAsIFhFX0RFQlVHRlNfTU1JT19JT0NUTF9OUiwgc3RydWN0IHhlX2Rl
YnVnZnNfbW1pb19pb2N0bF9kYXRhKQ0KPiArDQo+ICsjZW5kaWYgLyogX1hFX0RFQlVHRlNfTU1J
T19IXyAqLw0KDQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPg0K
