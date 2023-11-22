Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CFEC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 17:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4995210E09D;
	Wed, 22 Nov 2023 17:20:44 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BFA10E09D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 17:20:41 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly17d.srv.mailcontrol.com (MailControl) with ESMTP id 3AMHKbIT122244;
 Wed, 22 Nov 2023 17:20:37 GMT
Received: from rly17d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender osharabi@habana.ai) (MIMEDefang) with ESMTP id
 3AMHKYlh121122
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:20:37 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) id 3AMHJxFP108932;
 Wed, 22 Nov 2023 17:19:59 GMT
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by rly17d-eth0.srv.mailcontrol.com (envelope-sender osharabi@habana.ai)
 (MIMEDefang) with ESMTP id 3AMHJuds107960
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:19:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZRGUrvIZedcjqn4i8stSckQTm2SfFafk6ypF4I3IdqjEGFeh+/x8dl3MIXkNtvyocQyiAaGm9Eu3aMhs2tH323KWH0tjlr8E2/5V6bmNN5FDuwsOOIdNjpq+/ds/eEOvR4H8co8Mn+7xK5coZHtf1uEr9FtNmMUAXeHGvufNk/FOEPnIi+1aPYld/GukvFG6w3Q/uI82yhe1o2yBdfTPhEeMWNy7cvaCsv39YcRsIAblwuBh8/cW4ZPskcepAzDXyjtEE4ogA29/uyO1mXfd6C8LPeEsDUbgMNK4x9/s6kl9eHZr4KlFkRMzNU4gGA+IXZHEGRBz6SopqK4cIgzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8zCCK4nw3hX4rvNRByagC3CqBNdqpA1ensfEbrIDkI=;
 b=HG7ji5/UArTZ2lFWVXdzK2QCFO/nooTb32w9vIzwBZ5ttgj37EBu63hdfNmJMbZwnMCRnk3o466Xe5HoN2+ToUzbPMxXllzh7JuCMJ40K41S4abrUSHyapodYIYzfaJKm/OgpUMG6zARa1M1yeGjmb75M9Z/vfe0G/IK/xwTbKZEL/wHVLiilaJdwBloKwUABCdbxQvUS+bHrPKYvoSnZhWFtwXDq2RfzmiJBOK5aX3PZ1ozUdZZSh2eznjO8AOIavL+N8auq/6uwpkuTc14kSPNUhFAOsnwMv3tp2rVOmWuICh0ZEp0Rintskroed8LxHQSgVEyJ7hBYJmPaKTACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8zCCK4nw3hX4rvNRByagC3CqBNdqpA1ensfEbrIDkI=;
 b=g+cxdPkzaRpGmkmO2PlKk46CIms3tmRA1mDVpCo0PojVYM0mFw1cfnDIgda7zti5KuVpgrTD2e33bUZ8uSbiYMg4pTHqu233K6TnqKU88dXTH7SgM16RzVWNN2z8uk28d9rfLwGXwPAusRQSnHHoeqoxTR1o0MKh0LVPVdxrm9rhR6ztvxibQMHKoMWiNanXPt6R6ccQxLlxAfqcRKKAwGTAR7juMnS3GRlwsoDQG8o6SfWQeUFAemAvUvJylaObMW+hr655DqEGyklDX8/bNZe48sqfeE+pkNLRoJakPsQ+k4Nki8CC48LyVHwj0AG1ntJ7BdGWS9w4yWqPZM/8MA==
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com (2603:10a6:150:db::6)
 by DU0PR02MB8522.eurprd02.prod.outlook.com (2603:10a6:10:3e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Wed, 22 Nov
 2023 17:19:55 +0000
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba]) by GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba%4]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:19:54 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 3/4] drm/xe/bo: Remove leftover trace_printk()
Thread-Index: AQHaHTOl2owx/MTOYUmHTu8vPs5lf7CGldAA
Date: Wed, 22 Nov 2023 17:19:54 +0000
Message-ID: <f1c082b5-f448-ca0c-e644-1fdc5c100cc2@habana.ai>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-4-thomas.hellstrom@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 789f32a3-d154-4967-4f42-08dbeb7f3ec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MT+ls8Xz6R6J13vNKX1/S0xaeYytWjTWMMxdgqL8CYRvvi34JyKgNcAdNMuiXKZtlP3IVhXJJq/0J5W5JAZl5Qt1XNRyh3ht+WeaQkpCjqKF4fyKpEzmRq1I8sSZoJu3lfFoXhnvAr4/QHrzxNy7xnKUZyt4P6J/aFbHeDdThM1Ud83EcavsdQP6qxqU/+ZgPitzuVVrL3Hr23mdnQbrtEh2n8ODHrEjnKHPP6fd9zXrWJVXugryaI7HI1liCRkJKwuLPQErK2Q+AavmHqrvyA/fVJLl34RnMaErcjOu6c+Plr3IOZ68c98xBneq2LoxcsVQUcMlOjA1dNiE/6ImgaYm85hszefwlYVQzxVi/OL2qXSMZE2hcNN3xtlDqaZ+uVmd57zkc/srr/2KoN6qyl0nQxoJ9n1U2soLSITbO4Gr7ov6gS8B6RGHt4WkK4IiSazmfqIN2c5E5pQ8Y9LKld42/YJys2/Z2W73BDPM1215pm7YdzoxrcRCEabMSzXjogTcpGz3wdlpDPCQRJCHhdFdhfmkAVfPM+iSx21EMbsDSFt+gyVve07Y/CuTf7lMfu6QXftzdBEvkgySYu9I6rKMQRRDoePcAv8J6ZXDcalXUsyt649kOZrP7Qn4/PHkJo7tPs+RVDz4UlHxLsIqUjdMrvhOyK2NM4Ljzp2aHncvlznu+qVICr2ftDmU7GrR+/sQs3SgAeVNUBrQT/OuEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR02MB9325.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39850400004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(5660300002)(8936002)(8676002)(82960400001)(31696002)(86362001)(38070700009)(38100700002)(36756003)(66446008)(66476007)(91956017)(41300700001)(122000001)(478600001)(76116006)(66946007)(66556008)(316002)(45080400002)(2616005)(26005)(66574015)(110136005)(64756008)(6486002)(53546011)(966005)(31686004)(83380400001)(71200400001)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk51d0RLdGlNQUd0ZlhubVJUMWVVcE4xaWN1NnhSUklZb1ZMWGFaWlhyTFRn?=
 =?utf-8?B?ejI5NTk0azhQbzFPeXVwc0hqbkRKUWxXSS9ETlBXa0l1blJoVWNtT1ZpMnVq?=
 =?utf-8?B?dXBHckEyd1l5M0VVL2dKc3JhaWloYzlYcGVUajEyanVLN1NWblNBeFR6R3Rv?=
 =?utf-8?B?UXBlVUZyYUJ3dlMrdDNWT0ZzMjkvNUxLN0NNMzFKSkJacUN2ZHVvdU1QMEpX?=
 =?utf-8?B?T3JmUWl5ZWhZcE5oaWVWL3QxRGg4MWJkSmlkR1hVY2prNnhPNFo5NjUzUng2?=
 =?utf-8?B?MFVCM09pUnk0Q1BnRHp3MXFPakJTVDBvV3Nvdk9vZG9zUzdCZUZPQnpJSE5o?=
 =?utf-8?B?U0p3Q1EvMjZVRHN4VWxyLy82YkVwR09rVmxaaDBHeFNwU3FmRkRnWThOYXhi?=
 =?utf-8?B?OGp1WU5MWjN6WTRLMGVkS0k2TmdTY29OOEQzeVlkcDBmSWZRZGtGMUpHbnJp?=
 =?utf-8?B?SkEvVEdIdUhDaXYrNHhMNFhHWnpxeXdOeTcwclNBdW4yb0xYVWZLNGJNc2hm?=
 =?utf-8?B?QkxlUUxLQ1ZEWTI1NFRldkY2YVlHb3FpZnhZMmtQMU9Vc015d2VUOXZQYlFk?=
 =?utf-8?B?dmVFUHI5K3cvR1JHdmJvYnFrNnhRRjk3d0h2MVl0MlU4cEM0TWtCVlE1dVV6?=
 =?utf-8?B?dXdFUzlyQVpLV0xuSmNERUFxNEVMOW5vNWVzcGlHRU1zQjVJVTlLeGE1L21F?=
 =?utf-8?B?bW9hbDRXZERkWGl6TURLcUc2RkFMN2ZNZysrN1M3dHpCNjY4UCtGOTY2TlBj?=
 =?utf-8?B?S21jbld4RmJiR0RiQ0RnenN5UEI3SDJzdGdPYzRiZkJLRUNJM2xuZlZ6cExI?=
 =?utf-8?B?eTJtWmtLMWdJaTdyYUJyOGt0aFBSSCtVMmg3WFpCYmtlbC9ZMFJtNVJQSGxQ?=
 =?utf-8?B?NGZkK2ExR3RyS1JPOGkvbFN6M1UwWmZPbGU2Y2FwbUNsd2lzZk9BdFZRcUYz?=
 =?utf-8?B?TkJ5bDF1Y281T2EveE10SnpZQzZyZ0dPenJ4NlUvNzQ0SmFqR3BWU2h5U0Z3?=
 =?utf-8?B?VVBMUExlVi9Ld0ozbFhBMzh4WkR0bzVkQ2h3Q0diVFV6MnMxVWdhNnZuUEhO?=
 =?utf-8?B?dVFKeExuaEQralBLV2Z4L1FBdkZ0NS9ac0Z6cVVOYy9UK2NMcTRVTWVXT3Zl?=
 =?utf-8?B?NVJVZFNFV2NGbW9Dc1JKNlpmYnJReTViTElaU3ZRc3BBVU1Wd3RTeHRpbGdJ?=
 =?utf-8?B?Q0ZMTUFmM3lIZDVrOFFJdkRiQTVjOElvNlV2dnRIQzN1SEZ5N09tT2lETS94?=
 =?utf-8?B?SmN4dUZIaVQ0WjVlaHhZK1NjR29hSHR3S0RKUktQazk4TG9rNzBPSG02UkNU?=
 =?utf-8?B?OXpzb21XWHVtR2FYYlg5ZzVQNzFQelJZcGVpSnVqTG12aXh3NzR5UjEvTC9p?=
 =?utf-8?B?SVB1c3BYcnVuYVFzZlBYR2l5aDFlWE9LVjVaRmtrUHg0ZlBlNWQwZzMzQ2N1?=
 =?utf-8?B?U09ONWZpSStrekxWa1hDR2xEVE9RYzZEY1NYdTJyamcyYVZWMlJzb25jOTNs?=
 =?utf-8?B?Tno3emJUZHA0UWFTaDczTEZ2Mlc5TXBreGxVbG50MStndDllRnROMWRRRlNF?=
 =?utf-8?B?VjJrOXFWc2MvNkpObU9HZWUwV2RBRnZqdkxWdDV5dnNYcUNzd0dta3BTQnJS?=
 =?utf-8?B?UGJxZFFiY3BGMWhYc2VhMnNuL1NteThlbjJtQnRTdm5ORzhINGlsSWRNbUFw?=
 =?utf-8?B?WlFVWlZzNWhoRnl2ODdLQjVKT2o3aTlWZkVOMiswVTVrS1RsOUdSaW50OVF1?=
 =?utf-8?B?dDlUOElTSWZvSnV2a25RZmh1Lzc3SUhmUys0Y3k2UGJHUEFiUU55citkejRy?=
 =?utf-8?B?bVF5eG02eU94MW9FQUhSWG5McHhYWWdXeFVUN1hIbWxJK25qK3Jkdm1LTHBn?=
 =?utf-8?B?RFFaYVQvM1lGS3dIUHVFWG9TZDlsZXM0cWlkVUNBekpPbWp6TUlQbkw5Yzhh?=
 =?utf-8?B?aVVlb3I2RlYwY1VXdlNVeER3cFk3V09jcEYwL1ZaNUdSQkZaOWc3WmtFcitr?=
 =?utf-8?B?bWVhTGwyTlppdkNlS0tOQnV4Nk81K25Mb0NDcUNEK2tmTDdmelhRaFBHYmN3?=
 =?utf-8?B?ejJveWgxMnJYeWdFdFFZMGZrdERDWTF6WXFOVm5jTGI1Q2FTZkJnRmI1ODhN?=
 =?utf-8?Q?b9BA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CE15BBAD0C7034E8994A8DAB0B6B1FB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yLaPXbQGRQi74hqgfjzslxGDMlo6fzZM0i4OIv7OvTZGN4VZzEhe/B++di46sfS75C8rhjdhxYBK9qJkaiCItvPUjrr9uWOqzyal5iWvwDwb/7V9120xFPcBADUlBcs1y+S3F1QKvE3lJtBI4Ge+i+ueA7nLAteP9nUs9Q9Zzh5Jhug40GHOr0HSXoOrAIvv7Vz4ftMISPzGAvmW78q2bztiMsOds0Tslp7uHQnSpWb7rPvw54QB2vmhbmkhVgpCifhc1dB7dRlH3cyN4OlMVuLpmarkS2GhFuV9CZMLJWqV1CFF9q9IRNMoGheyk51h1wdINHp6vZkcFnoLVK9d/t9XtPpa3mOI55+kpuTsddvSJbD3fBuHM3ECyURp2vYWu4twTBTWJypoKdtvXPe0Fgg2dk9V5oNFGr6BtMWug8FJai+iR4mmWWcieRDL9cEwglOfC2mI9j1L+lwInUktrpMiX9EVvztDHrgRqIZvCBGS0qqgXJuUjBKeb8xbJAUENXtbEb80Q0qlvdoaeeCPaPmKyYb8lML+vX6HTaLeZjk5jTHdaaQfYiSeVYYkklnFrRncraNxI21mE6PFkzun9vQ/jCNLWGgfUUDPP6hF5xsIp0HxDlfrvlBAQxpiGD0wfnbBELosMR9mJ/eFWgVNP43DkNTD91isNlRoNaPjuuPik9s7qKZzl/0k0s72ctiPt2kgpP2hG2m1Wg36itrOi4CP8CaUqhOAjp1jo0Fk+gAybI+SiEUSA7XxL+EleBIJ+ydxVEgexqQMcJI3n2bCqNBmNf+SdRZGnmqivjrJSt5qB0YDL8G+WlumVY/TAmJs4vfumHhI3SPD6n0bz1UYig==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB9325.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789f32a3-d154-4967-4f42-08dbeb7f3ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 17:19:54.8989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcGDbdtTpSJhQ6+KvGdeYsvQLYIweejGr67v/12JY3Qc2/rnOMQarWllkQyfTkonRCfuOFzfG1sbtbtwF3SwNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8522
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMDY3MzYzNjpGUEtleTEucHJpdjpSMf3x0bDlKM4U44X2Lv+F51bbB4yrCXy/LFQQk84bJKqKHWh/8gr4/UlQAWWpEEuED0kigq4ycVJx5ndi8qwGmnqJYBj3Cprmg1TZ7E3e5L0VgT30WylwQAzdraGPNtCAwjN0onfExFo2+M5F1Jn1eBrjT/Q6XgHq1mf1SB6aZwVfQlzhxX2BBrCaoDSJhrvCqJfnFBFSsO2DEeYQFGGO7fdVBY+xZO/5/RQWPP7gVF830ley95r1FwvUSR0hoaxVXCrpwI02yzhAzYzDCBuSZ1YokTRJm8gZVUJui2YeYFII8KmHJQLtNDOmusTvvCZuQhsApXHxET/mF3gNWH3z
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.13.51
X-Mailcontrol-Refers-To: 3AMHKYlh121122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=K8zCCK4nw3hX4rvNRByagC3CqBNdqpA1ensfEbrIDkI=;
 b=Britb2D+nD5Yco4Kkdt6Y2rzon+kozoA/d9aHvXUAyqzr9yZRjNkejhOo2csAd+OjK2siT3y/bX5oMBuhurmki50K0cFoUhOR+nw1mDo6yG0YA1zUsqH/0OlLxqH2osNhYsOs1oNHCjssEiVC6MFk1jbn9le3QaigdNfIz3etQM1ggM21DZSVVychK5RuMIes3hcFLNzQP9GVPCLS4YE+7EQ70OGDMuaeMbuHw5S3sHrLmDNun/kAUInkhpdG4xDHAsOcdZ66k7pgAhYxm2NaiFbviNwHzok1eJPT5FdRXLbjx7djgWW8Xhr4HMM3YcXYPZ9GTHVYPLT2GOqU+ZR3g==
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/bo: Remove leftover trace_printk()
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

T24gMjIvMTEvMjAyMyAxMzowMywgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+IHRyYWNlX3By
aW50aygpIGlzIG5vdCBpbnRlbmRlZCBmb3IgcHJvZHVjdGlvbiBjb2RlLiBSZW1vdmUgaXQuDQo+
DQo+IFN1Z2dlc3RlZC1ieTogT2hhZCBTaGFyYWJpIDxvc2hhcmFiaUBoYWJhbmEuYWk+DQo+IExp
bms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVz
Lzk0Ng0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+DQpSZXZpZXdlZC1ieTogT2hhZCBTaGFyYWJpIDxvc2hhcmFiaUBo
YWJhbmEuYWk+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIHwgMSAtDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5k
ZXggOTQ4ZmJiZjU2Y2VlLi41Yjg0Yjk3ZjhjMjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9iby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBA
IC03ODYsNyArNzg2LDYgQEAgc3RhdGljIGludCB4ZV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqdHRtX2JvLCBib29sIGV2aWN0LA0KPiAgICAgICB9DQo+DQo+ICAgICAgIHhlX2Rl
dmljZV9tZW1fYWNjZXNzX3B1dCh4ZSk7DQo+IC0gICAgIHRyYWNlX3ByaW50aygibmV3X21lbS0+
bWVtX3R5cGU9JWRcbiIsIG5ld19tZW0tPm1lbV90eXBlKTsNCj4NCj4gICBvdXQ6DQo+ICAgICAg
IHJldHVybiByZXQ7DQoNCg0K
