Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A343FC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 11:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5456110E85A;
	Thu,  2 Nov 2023 11:48:28 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD27310E85A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 11:48:25 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly15b.srv.mailcontrol.com (MailControl) with ESMTP id 3A2AhD8l324623;
 Thu, 2 Nov 2023 10:43:13 GMT
Received: from rly15b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender dliberman@habana.ai) (MIMEDefang) with ESMTP id
 3A2AhBg2323422
 (TLS bits=256 verify=OK); Thu, 02 Nov 2023 10:43:13 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly15b.srv.mailcontrol.com (MailControl) id 3A2AgDRJ295683;
 Thu, 2 Nov 2023 10:42:13 GMT
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by rly15b-eth0.srv.mailcontrol.com (envelope-sender dliberman@habana.ai)
 (MIMEDefang) with ESMTP id 3A2AgBd4294975
 (TLS bits=256 verify=OK); Thu, 02 Nov 2023 10:42:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDb2xT1aGzzo+/DLKiMALTAbswp2C7LnAQCRFG4UpyHXcpN9fteSLzZOxLdmD/oCaXX5trLOaGeSp/grj1gEWSm4aDvqZ1VrWciyS9vs5bbmfUThg/d2Mn/MafaFIK6MySl+Fgh00lweEXmhgOqjEsLthrW2iPuwSUgKjF7Bwb7SF0v1OoVBCvw2mbyMr3ZLtb1aqz6BNwap4VFlBsmpivXp7VNeXfjnNvw5+8d1tuw/RYMcCdeh6ug6w0QvL6xC1aH5KzntMl36XIJAr0dHjianXZm0sobSHKaB8AqhAA061liuu9pc4q6ME2Dud4BGSCoOv/sY6HG1FZevHY3Tdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsXv3DLu9aCFH5ixPCT2AzfF+G7xuOL9ibotmonZjzo=;
 b=YzKVQz1XLaRF15ObtNVqSTw9D5iqXfQzmYkefc9aHW99t+xeh7atvI7AT3sckSu9qHJLLyuWQJWbE9I9DLGx6uYDjXnUyFJ/AKqkSAgU2ZMeyjW+ZfdxWajRpBMXv00w5oNeRtG5UtcijocmwFfLE1RLfnq0C6Sklsgp75476lTS0MaZQiU3Szij1XD8Ybx51lcFpsRk9h9YDgRG80mJwjzjbpvh7GmM8AskF7mXVmCGw1E3LH9tyI0ustZFQgtiXxQ9ZEZV+WYVAemPJrgCPWWY3X5kICJtJjRLFhicrwSrPO94as+NB4t/dygm0U3bkr78/6bo92LDDSEgIoLf+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsXv3DLu9aCFH5ixPCT2AzfF+G7xuOL9ibotmonZjzo=;
 b=iXVxUxYEXKT+5HohQq794bAmeg6wOAUUKNuQkaCbdIAlEwyccin7PDLHf48sWQdXRO//Epo8SPQBhdoee1YUlh8f24/Fq65kYAk0b1R+VofWYRnaRW+6eKDAd+cZZ4zCtkycQ5eOjS1fDO29tCePwaobpXnDnESoX1C2qI0h+u1ouACrrpXeO2DKtMU7UzYSyOuOeqYRHxiFAqtrzyueQsbXVrgHmt0By/agxeoI/B8wotUxKszHkCqiqF7fPjBwy5LqtgVbziD5Ewk7FlDMKlZ7rdm8X4t6bHO8Co7cz9wP2wMc/3EdHzOJx5fs63icZcHCYdQrzvHY1SKGukIOpg==
Received: from PR1PR02MB4761.eurprd02.prod.outlook.com (2603:10a6:102:e::31)
 by DU0PR02MB8855.eurprd02.prod.outlook.com (2603:10a6:10:40d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Thu, 2 Nov
 2023 10:42:09 +0000
Received: from PR1PR02MB4761.eurprd02.prod.outlook.com
 ([fe80::d705:7987:894d:28e6]) by PR1PR02MB4761.eurprd02.prod.outlook.com
 ([fe80::d705:7987:894d:28e6%4]) with mapi id 15.20.6954.020; Thu, 2 Nov 2023
 10:42:09 +0000
From: Dani Liberman <dliberman@habana.ai>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: XE sched review
Thread-Index: AdoM15iZwhCMpQRKQuqf8QO2NxQmFgAoaGgA
Date: Thu, 2 Nov 2023 10:42:09 +0000
Message-ID: <31cae84e-4454-2128-33f1-1d24d8fa6c75@habana.ai>
References: <PR1PR02MB4761814952E677B0354DDF0BAFA7A@PR1PR02MB4761.eurprd02.prod.outlook.com>
In-Reply-To: <PR1PR02MB4761814952E677B0354DDF0BAFA7A@PR1PR02MB4761.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR1PR02MB4761:EE_|DU0PR02MB8855:EE_
x-ms-office365-filtering-correlation-id: 5b61f53e-ca1f-46a5-9e16-08dbdb905d71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lWu0D6Qz9JWHepE8pAFA7hTAAQE5dbsPR7n63AlDH+EKqyAgWSoSBlunouIu92Qi0FdzXFixHV0fndSmneClRdjFArOyi0oF+MqgrRqXmJwL0XQAzTfNgIm7WoKPfpdLzdTN3VrGZ28rT4JNpyhL1Aph73z+6QtjerCklMoETyhDnk1s2+3uzthTTVHDVvqZXCrvvDgvXwDkCjIECxNaQtYJcL56fws7V+HH7rBMNdoEqNFNrN+8US8zt1egMEd+uFxgautg/AZPRZce8NXrIH1p+04g9Vv14fiJIjlL6YxMVXmuUngNNdviSPcvOFmS6hdEwRteG8pVl8jb7b+dDYPfNw3hleNalPcPV2xs7nMBZ/avG0Qzfqd2u5Kr/DjAFsIvr4qfKsbW+AUoYTAdy6wl70tb86SiFMSuFM9ZPvvSBPY+rsTp2GUTL0+vlgbtlUqbArwhZmRSlam91dvFU4KkPzV4sFiLKWfP/0SiiKbaJ+6FvlsKjl/2rzDXOwK5DeX2zEkPAJ3k4wj/rXg2lShMyg43wjfITZOuPfvjMOwoP57Phm09ZXPYXOkopHojcF7Dm6fJl0iIXXuEs0zfGdtl0lNgmqMRJelqO9Kd3AqaUupDoHbciChRH9JFl2xV5iYUq5JRzlA9dtH6KvPCTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR1PR02MB4761.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(396003)(39850400004)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31686004)(122000001)(82960400001)(26005)(8676002)(6916009)(316002)(66946007)(64756008)(54906003)(66476007)(66446008)(53546011)(5660300002)(2616005)(91956017)(38100700002)(4326008)(83380400001)(76116006)(66556008)(41300700001)(7116003)(8936002)(478600001)(71200400001)(6486002)(2906002)(3480700007)(6506007)(6512007)(31696002)(36756003)(86362001)(38070700009)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHdJTnViZlRDa3RTK3BDVkl2Ym1Dd0wwK3JubzRNUDRQNWVaSHFESGxQQyts?=
 =?utf-8?B?SmZGWXptU0ZuY1BYTGVwMVNYd2F0OHg0RTkyb1lhRlBkTExWVXVQRFlETlhL?=
 =?utf-8?B?cVZMY1BRbDlRRm9sSFZnV2J6K2hGWEJSZlFQZXZwQVU2RnVVSDNCSWk3bmdU?=
 =?utf-8?B?MVFHMXF2ZkVXTnpQekVxNzdQU0kxdDBPM09TR08rWjRVRjZQQllZWE44eE5u?=
 =?utf-8?B?RnNzR2h2MHBHSlZ3eVIzZmZpOEpBbDJRM3lCaG1NMVNVbEdpcEw1NGxVc29G?=
 =?utf-8?B?ejlJVjhxU3UyYnRUL25zbkZiZTFyNkJhMERsUjg5YkhNM0FoMjNvL1JUMm0x?=
 =?utf-8?B?NElwRVoxSm85TFhxVWJTZHhBbDZpQ3FQTEhDNVZuZmMyZ0RGOXMrV2RaaHY2?=
 =?utf-8?B?STVjelpmK3pNS1lYbzdhY3gzWTV1MXhZNUlaNEV4SXA4bi9PZGJ4MmtqUzho?=
 =?utf-8?B?b1dsOGpEdkZLa1JIVndyZExtMEVMUlh3aWhWbDlmVmJ1V3lZTlhaVlVETm5h?=
 =?utf-8?B?OHdIakFLM2JDUDVmbWxUM3ZEb0xrRGo2ZExCUFVJdlZtNmh4dC9yOVk0VEZj?=
 =?utf-8?B?blRRaldLakh0aVRSZHdhUVUyR2MxS2dRZVpqcGtqeFF2UVVwSkVYRlYxYXdu?=
 =?utf-8?B?SVBVWDFkSnZielNMQWxhT3NRUXVKa1A0MmJaNVJsOGJ1Z1A1TytkWllHaStM?=
 =?utf-8?B?QkJPVFhRZWl5U1A0cCtZMFhNRi9ZWkRVUXU1N3V4Tkl3NE1ienJYUFZkVFBh?=
 =?utf-8?B?Z2pKY1BSemQxV0ZTb2d2bVM3NlBKUGs2L0prZ2NGZzFLT3NISnhzOXlsWW9R?=
 =?utf-8?B?QlcycVZsVzB5ZEd1V2NsVXAyUG9qL29tNWVrS01CeFVPMHBmY2J0U0x5TGxw?=
 =?utf-8?B?K2JQWnEyM0FVSzBtbWhPY0hqWG1VRzFEVUIzdlBqSkZCOEZEQWErbHNHcis2?=
 =?utf-8?B?Z2lvUkkyc0xwNElrMC9oa3lUdW1KSnJqWDBONEd5cHI0WEI0cU9yUFMzMXNE?=
 =?utf-8?B?N3lscGpSeDZxYUVKbXcralE5OGNiVWQ4QnR1UFlFRDUyK240cmxBNlJIMnRq?=
 =?utf-8?B?VzRkRG45bVpoOVFuYjBEa21qQWlreCtaTk0vaHNpd0RuYlVGbnJRUXdCVDBJ?=
 =?utf-8?B?aWV5dWk3MGtGdUY1UW5CLzVtRTdISUxyOEc0Sjd6TXlscm9Oc1hvcmc0ZWhV?=
 =?utf-8?B?V3RSKzY5NDJPNXJKN0NzTlVhQ2huQ0x3endWbXo1UFZDeXNnSGtDeDFvNE1X?=
 =?utf-8?B?dTJJS0cydnVSWHBZT0drbVMySGNwdWw1R0IzQUM3UVROQ09KMGtobGlCK29C?=
 =?utf-8?B?ZEwzL0JCQjI1WkJIbVdpcmsxeElXK1AzbHpwWlJjdSs3R0lWTUh5cXNvMmVT?=
 =?utf-8?B?S3Q3aFRDVjQ3MldrNWh1bkNXVStsNVBiQWJrRjJndXczVmVMczFraWlLYWdp?=
 =?utf-8?B?WjE5WWZIa3N5aW5vbC9DZU5vRk83Y1loYjRWbCtqbGo1SUZOY2c3cnZWelRt?=
 =?utf-8?B?YThJbEVQZ0s5THZGa1ZSQ1VhYzdVU0g2NWdUN1VpMlhTOStHbHhFdTRkTjdX?=
 =?utf-8?B?M09YYXZ4d1lHbUtZVG9DeW1HRSttRUF1Y2VIdXNTU2RIN05OSHVjQWs3ZEhr?=
 =?utf-8?B?NFJmcUEwSUpRbm1qWkQ4VHZIYWlzejZ3M2tlWklPQVYza0xMdkx3ZndSQ25k?=
 =?utf-8?B?WHdTaEJUcEZWNGRtZWQrbytpNi9OZ2I1cTN2RTRjY1lvc25mQzFaTXlYbEMr?=
 =?utf-8?B?anhVenFmRXRkbmErS1BaVXdsZVEzd05FbEltTU9SdkxtMGNITk05cE8yWDQ5?=
 =?utf-8?B?dExnZEtUK2MxWjFpVEdhL3A2WHVFOHFicWpBZDBuZXZNQTdHVkFINzBjK2o4?=
 =?utf-8?B?T0Nob0lIZXljTmNtYW5XRklKa1ljbmRCSURwL1pJblV4cDJLSEF2VjBNRHdh?=
 =?utf-8?B?aS9JUDdrb2R4YUN6aFNpaGdxUk1DaE1Nc1BLaE1PSlQra0tVWTlkV2dyb3By?=
 =?utf-8?B?eThhbGd5cURmejhwcmlWY0JCcTBmUW1JdzUrS21NSTNncjdyZ0xrYVQrbmRn?=
 =?utf-8?B?ZjdDdmZuc1gxS1ZaaVdUUE5tUWF4TUw4bmNrQngreFRGcmlMQVhqWkNxTVAx?=
 =?utf-8?Q?jCIw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_31cae84e4454212833f11d24d8fa6c75habanaai_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Zf/SQLuYKwT0JN0a8ci44w3JMc+kdfpSKxnLsVYpJKGmRnxKV6I9S4/idtxXxZriPpR27oundspW9wLixWSd0CZjJtZJImjWPDCdOJf5kCY4X7Z3kWEBG6Y1wsLgbWvB4iY7m1LSgvmd60HVa5rwglYDxtPh+tUs15U2ODDaoZr+jAU0i0zUBzyzlSQpmJXZwoxNvdM4e81eBJ0B/RaG3EhwZ88laBl0+Tg6TFiVmd/G2au/RgmZybpAx504fWGSFibDgaC7IyhQplI11m9UxLOqwZjyhr6baNFTSYrJBQSp7T5BSNWp9Og9TCapBSZWEe0Jj+W0KeWunuYRLPI+/KKjnoDWoYyQOV4kQGSM1D4SfvzWn+mi4EklZAlMg+Y1Y2TJAshSoA4Xi31q3gPjr/haS0QqH/TWi1lZni4w/5nc88LUxtIUdlNMkyndobG4ieaMBE9s0hxweKjVVJyKLy6oKJ8lMF2JuceroABdXi3dbctpa99iB/pqosCIiJgpN6lK7eGUiYU153dbLsTt+6GCnIQadf1v2tLJYlV4UM2bugJ9u86ZHdaHplhUvLTI2kC+oak9e0NdwvztTGvMFSihFfROp0MMionAybRkMWRuFC6YlSUk++6Ic6PI9nIu5jJm626/qmwMjIqcQPyo0JzuWC+d2YOspIo9q2UCmQ+gkO+7nZRP2VE2+wod0PxrLsWI/X/76dhAHjsOsHm+1V6a8h34K1hoYG/ewIUr+DOUov/9avMeJZ/Jy7I6cUttyw3nHlueqTmP3fhDcGQVYOTWoNOedHymM5/hExgyl0BOgfXbCN133FVBK+f0KWy0Dn8qsavpCU4j9Q0HOZ/aTCodYKfYETWoEUBK0MCDhs4=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR1PR02MB4761.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b61f53e-ca1f-46a5-9e16-08dbdb905d71
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 10:42:09.2327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1PJVgHczJ5uN0VQIK0BAa7PLAxeSzbrxuggcnleFT2KwqzDk7m66hzj9OJeHXxj031MeiAZoYjORcN6d+6EhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8855
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5ODkyMTc5MjpGUEtleTEucHJpdjq5ExtMkuo11vGFW3CuaydpFRGylD5pvpsDZbq2Rp/Nv8KKWFvaOjWlFO86Wwus/G6D8VgFK+Ri4Yr2oAGiBrA7EKaO5FafquAM/e8sV7KpaQHESZJyJ5XKdTpBtuuWfc58rPqg7uzYalNQDCjjpENBxu1X82VD0fHXrhqVO0cs2KPa4HZnDm+O83goMY6YBFlK8CtFhxiVotsWZzdIbCZ2hADWUe1djysZKC/GtxahtzHO9jNUE7Eeu9mGxQWN9RJ4HiNg6hGP21G4MrhJt1RrisMrZ5mM3J8wOxn2TWikFZ4LTR8nzJ/zP9mFhrqkrEAyIK3Li45dWMAAKIWM2qNW
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.14.51
X-Mailcontrol-Refers-To: 3A2AhBg2323422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:mime-version;
 s=fpkey81949-1; bh=CsXv3DLu9aCFH5ixPCT2AzfF+G7xuOL9ibotmonZjzo=;
 b=mjRrWrB2YPA0BSUVt131JR7nw/LpJ2viuTF7g2Git+zBJpxLRfx9UPQlW6zGLj8e18yJLh6nrtmR6nHpKOSrVkGf05b9XWsjonpa8+V2P7MMSu9knPbZZxPSb02vcQXdJ1tSoH0Qvw2sT3naBseF1Gt7vSUpk2k3l1wymfS5LohP/H1vRSuwpovKUQQIX2f0frZGDqBKN96sBeeOA+mraGZOrbfE4ooWesHLsQj8AjiVryWlKyFJrniDaFJSOYQ2FQxxk6cUan2yX/vUXEM7oeT9MGN1v2witO0PJFoieIf4Y+PdtEPkjcnb6Ls7UQZHFK2CaNEKIwDHuX6RcBycdA==
Subject: Re: [Intel-xe] XE sched review
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--_000_31cae84e4454212833f11d24d8fa6c75habanaai_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMDEvMTEvMjAyMyAxNzozMywgRGFuaSBMaWJlcm1hbiB3cm90ZToNCkhpLA0KDQpBcyBwYXJ0
IG9mIHRoZSB1cHN0cmVhbSByZXZpZXcgb2YgdGhlIFhlIGRyaXZlciwgSSByZXZpZXdlZCB0aGUg
WEUgY29kZSB3aGljaCByZWxhdGVzIHRvIHRoZSBEUk0gc2NoZWR1bGVyLiBIZXJlIGFyZSB0aGUg
aXNzdWVzL3F1ZXN0aW9uczoNCg0KZ3VjIGV4ZWMgcXVldWUgc3RhdGVzOg0KMS4gUGxlYXNlIGVs
YWJvcmF0ZSBvbiB0aGUgc3RhdGVzIGFzIHRoZXkgYXJlIHZlcnkgZnVuZGFtZW50YWwgcGFydCBv
ZiB0aGUgZ3VjIHN1Ym1pc3Npb24gKGJhbm5lZCwgZGVzdHJveWVkLCBldGMuLikuDQoyLiBndWMg
c3RhdGUgaXMgYW4gYXRvbWljIHZhcmlhYmxlIGJ1dCB0aGVyZSBpcyBubyBsb2NraW5nIGluIHRo
ZSBzY2hlZCByZWxhdGVkIGNvZGUgYW5kIHRoZSBzdGF0ZSBjYW4gYmUgY2hhbmdlZCByaWdodCBh
ZnRlciBnZXR0aW5nIGl0LiBXaHkgbm90IGNoYW5nZSBpdCB0byBub24gYXRvbWljIHZhcmlhYmxl
Pw0KDQpndWNfZXhlY19xdWV1ZV9ydW5fam9iKCk6DQoxLiBpZiAoIWV4ZWNfcXVldWVfa2lsbGVk
X29yX2Jhbm5lZChxKSAmJiAheGVfc2NoZWRfam9iX2lzX2Vycm9yKGpvYikpOiBpbiBjYXNlIHRo
aXMgY29uZGl0aW9uIGlzIGZhbHNlLCBhbmQgdGhlIGpvYiBpcyBub3Qgc3VibWl0dGVkLiBXaHkg
c3RpbGwgcmV0dXJuaW5nIGZlbmNlIGluc3RlYWQgb2YgTlVMTD8NCjIuIEkgdGhpbmsgdGhhdCBy
ZWdpc3Rlcl9lbmdpbmUoKSBzaG91bGRuJ3QgYmUgcGFydCBvZiBydW5fam9iOg0KICAgLSBJdCBp
cyBwYXJ0IG9mIHRoZSBpbml0IHByb2NlZHVyZSBzbyBJIHRoaW5rIGl0IGlzIG1vcmUgYXBwcm9w
cmlhdGUgdG8gcHV0IGl0IGluIGd1Y19leGVjX3F1ZXVlX2luaXQoKS4NCiAgIC0gTm90IHN1cmUg
aWYgaXQncyBwb3NzaWJsZSBidXQgdGhlIGd1YyBzdGF0dXMgdXBkYXRlcyBhc3luY2hyb25vdXNs
eSBhbmQgaWYgZXhlY19xdWV1ZSBnb3QgdW5yZWdpc3RlcmVkIChhZnRlciBnMmggWEVfR1VDX0FD
VElPTl9ERVJFR0lTVEVSX0NPTlRFWFRfRE9ORSkgd2hpbGUgaW4gdGhlIG1pZGRsZSBvZiBydW5f
am9iLCB3ZSBtaWdodCByZWdpc3RlciBpdCBhZ2Fpbi4NCjMuIExSOiBBRkFJVSBMUiBleGVjX3F1
ZXVlIHdpbGwgdXNlIHRoZSBkcm0gc2NoZWQgb25seSBvbmNlIGFuZCB3ZSBkb24ndCBjYXJlIGFi
b3V0IHRoZSByZXN1bHQgKGZyb20gZHJtIFBPVikuIE1heWJlIGluIExSIG1vZGUsIGl0J3MgYmV0
dGVyIHRvIG1vdmUgdGhlIHN1Ym1pdF9leGVjX3F1ZXVlKCkgcmlnaHQgYWZ0ZXIgZW1pdF9qb2Io
KSBpbiB4ZV9leGVjX2lvY3RsKCkgYW5kDQogICAgICAgbm90IHVzaW5nIGRybSBzY2hlZCBhdCBh
bGwuDQoNCmd1Y19leGVjX3F1ZXVlX3N0YXJ0KCk6IHVzaW5nIGRlcHJlY2F0ZWQgZnVuY3Rpb24g
ZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoKS4NCg0KVGhhbmtzLA0KRGFuaQ0KDQo=

--_000_31cae84e4454212833f11d24d8fa6c75habanaai_
Content-Type: text/html; charset="utf-8"
Content-ID: <E8BA9FC8A1EB0E49B256B789180EA24B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiAwMS8xMS8yMDIzIDE3OjMzLCBEYW5pIExpYmVybWFuIHdyb3Rl
Ojxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOlBSMVBSMDJN
QjQ3NjE4MTQ5NTJFNjc3QjAzNTREREYwQkFGQTdBQFBSMVBSMDJNQjQ3NjEuZXVycHJkMDIucHJv
ZC5vdXRsb29rLmNvbSI+DQo8bWV0YSBuYW1lPSJHZW5lcmF0b3IiIGNvbnRlbnQ9Ik1pY3Jvc29m
dCBXb3JkIDE1IChmaWx0ZXJlZA0KICAgICAgICBtZWRpdW0pIj4NCjxzdHlsZT5AZm9udC1mYWNl
DQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYg
MyAyIDQ7fUBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1
IDUgMiAyIDIgNCAzIDIgNDt9cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1h
bA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7DQoJbXNvLWxpZ2F0dXJlczpzdGFuZGFyZGNvbnRleHR1YWw7DQoJbXNv
LWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVM7fXNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10
eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7
DQoJY29sb3I6d2luZG93dGV4dDt9Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhw
b3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJbXNvLWZhcmVh
c3QtbGFuZ3VhZ2U6RU4tVVM7fWRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7
fTwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0
PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUg
bXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4
dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4N
CjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBs
YW5nPSJFTi1VUyI+SGksPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5BcyBwYXJ0IG9mIHRoZSB1cHN0cmVh
bSByZXZpZXcgb2YgdGhlIFhlIGRyaXZlciwgSSByZXZpZXdlZCB0aGUgWEUgY29kZSB3aGljaCBy
ZWxhdGVzIHRvIHRoZSBEUk0gc2NoZWR1bGVyLiBIZXJlIGFyZSB0aGUgaXNzdWVzL3F1ZXN0aW9u
czo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5n
PSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gbGFuZz0iZW4tSUwiPmd1YyBleGVjIHF1ZXVlIHN0YXRlczo8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJlbi1JTCI+MS4gUGxl
YXNlIGVsYWJvcmF0ZSBvbiB0aGUgc3RhdGVzIGFzIHRoZXkgYXJlIHZlcnkgZnVuZGFtZW50YWwg
cGFydCBvZiB0aGUgZ3VjIHN1Ym1pc3Npb24gKGJhbm5lZCwgZGVzdHJveWVkLCBldGMuLikuPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iZW4t
SUwiPjIuIGd1YyBzdGF0ZSBpcyBhbiBhdG9taWMgdmFyaWFibGUgYnV0IHRoZXJlIGlzIG5vIGxv
Y2tpbmcgaW4gdGhlIHNjaGVkDQo8L3NwYW4+PHNwYW4gbGFuZz0iRU4tVVMiPnJlbGF0ZWQgPC9z
cGFuPjxzcGFuIGxhbmc9ImVuLUlMIj5jb2RlIGFuZCB0aGUgc3RhdGUgY2FuIGJlIGNoYW5nZWQg
cmlnaHQgYWZ0ZXIgZ2V0dGluZyBpdC4gV2h5IG5vdCBjaGFuZ2UgaXQgdG8gbm9uIGF0b21pYyB2
YXJpYWJsZT88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBsYW5nPSJlbi1JTCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gbGFuZz0iZW4tSUwiPmd1Y19leGVjX3F1ZXVlX3J1bl9qb2IoKTo8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJlbi1J
TCI+MS4gaWYgKCFleGVjX3F1ZXVlX2tpbGxlZF9vcl9iYW5uZWQocSkgJmFtcDsmYW1wOyAheGVf
c2NoZWRfam9iX2lzX2Vycm9yKGpvYikpPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVTIj46IGluIGNh
c2UgdGhpcyBjb25kaXRpb24gaXMgZmFsc2UsIGFuZCB0aGUgam9iIGlzIG5vdCBzdWJtaXR0ZWQu
IFdoeSBzdGlsbCByZXR1cm5pbmcgZmVuY2UgaW5zdGVhZCBvZiBOVUxMPzxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9ImVuLUlMIj4yLiBJIHRo
aW5rIHRoYXQgcmVnaXN0ZXJfZW5naW5lKCkgc2hvdWxkbid0IGJlIHBhcnQgb2YgcnVuX2pvYjo8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJl
bi1JTCI+Jm5ic3A7Jm5ic3A7IC0gSXQgaXMgcGFydCBvZiB0aGUgaW5pdCBwcm9jZWR1cmUgc28g
SSB0aGluayBpdCBpcyBtb3JlIGFwcHJvcHJpYXRlIHRvIHB1dCBpdCBpbiBndWNfZXhlY19xdWV1
ZV9pbml0KCkuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gbGFuZz0iZW4tSUwiPiZuYnNwOyZuYnNwOyAtIE5vdCBzdXJlIGlmIGl0J3MgcG9zc2libGUg
YnV0IHRoZSBndWMgc3RhdHVzIHVwZGF0ZXMNCjwvc3Bhbj48c3BhbiBsYW5nPSJFTi1VUyI+YTwv
c3Bhbj48c3BhbiBsYW5nPSJlbi1JTCI+c3luY2hyb25vdXNseSBhbmQgaWYgZXhlY19xdWV1ZSBn
b3QgdW5yZWdpc3RlcmVkIChhZnRlciBnMmggWEVfR1VDX0FDVElPTl9ERVJFR0lTVEVSX0NPTlRF
WFRfRE9ORSkgd2hpbGUgaW4gdGhlIG1pZGRsZSBvZiBydW5fam9iLCB3ZSBtaWdodCByZWdpc3Rl
ciBpdCBhZ2Fpbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBsYW5nPSJlbi1JTCI+My4gPC9zcGFuPjxzcGFuIGxhbmc9IkVOLVVTIj5MUjwvc3Bhbj48
c3BhbiBsYW5nPSJlbi1JTCI+OiBBRkFJVSBMUiBleGVjX3F1ZXVlIHdpbGwgdXNlIHRoZSBkcm0g
c2NoZWQgb25seSBvbmNlIGFuZCB3ZSBkb24ndCBjYXJlIGFib3V0IHRoZSByZXN1bHQgKGZyb20g
ZHJtIFBPVikuIE1heWJlIGluIExSIG1vZGUsIGl0J3MgYmV0dGVyIHRvIG1vdmUgdGhlIHN1Ym1p
dF9leGVjX3F1ZXVlKCkNCiByaWdodCBhZnRlciBlbWl0X2pvYigpIGluIHhlX2V4ZWNfaW9jdGwo
KSBhbmQ8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBs
YW5nPSJlbi1JTCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG5vdCB1c2lu
ZyBkcm0gc2NoZWQgYXQgYWxsLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIGxhbmc9ImVuLUlMIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJlbi1JTCI+Z3VjX2V4ZWNfcXVldWVfc3Rh
cnQoKTogdXNpbmcgZGVwcmVjYXRlZCBmdW5jdGlvbiBkcm1fc2NoZWRfcmVzdWJtaXRfam9icygp
LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9
ImVuLUlMIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBsYW5nPSJFTi1VUyI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5EYW5pPG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8cD48YnI+DQo8L3A+DQo8L2JvZHk+DQo8L2h0
bWw+DQo=

--_000_31cae84e4454212833f11d24d8fa6c75habanaai_--
