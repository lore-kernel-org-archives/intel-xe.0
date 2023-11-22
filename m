Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67C7C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 17:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1A10E09D;
	Wed, 22 Nov 2023 17:24:18 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390AE10E09D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 17:24:16 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly02d.srv.mailcontrol.com (MailControl) with ESMTP id 3AMHOBKD350767;
 Wed, 22 Nov 2023 17:24:11 GMT
Received: from rly02d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender osharabi@habana.ai) (MIMEDefang) with ESMTP id
 3AMHO8av349979
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:24:11 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) id 3AMHNwNI345587;
 Wed, 22 Nov 2023 17:23:58 GMT
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by rly02d-eth0.srv.mailcontrol.com (envelope-sender osharabi@habana.ai)
 (MIMEDefang) with ESMTP id 3AMHNu6k344886
 (TLS bits=256 verify=OK); Wed, 22 Nov 2023 17:23:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDVgR5HJbwnQCuqVJZah0VOvxfd2PkYg6rKS+oO81ry47dV5gPdOJKbQrPF7IiGk8gnFAff/ifY+FeGL9Odor1AZJhEkKd0zcP1kNAKhMygO49wkBDnqOPtSiMI49zA+EHPT1Ei6KfNGJpowuW0iMiUtzq0V0nUk9tb0AwcACj4giJ6UaVnrKVBjHChmrz3Z6yDrWjp/ZncrKWYLTjbPSvYDpeyh3UuKjHNR7rNPmIH/chHQ9wuCkHCCPSGAJ1b6mRqfDWFNiD4g9LYel9iURQbkJOi0hLDnDoXyXM13S1CBuG1tYmX7zK40CBsaW3kixAOQNHYnppSu6P7U7MCYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSTb7jrO41FZndCgZppp8CmR18XhraywSRE5K88WF6Y=;
 b=brvlYHiZv6Kw0VzPpf+j0dmaomD/zMy+wU5TlCmOLKUO5s6sxTF3anyU+m7GUdU7A6jxEmaHwcNA5QpMkjdKWuTMVnMLrw5S1hDBWxBaxAHMrtEE+g6FQGBkL66mFTIAEpRJlAd1Rfz/x4+RNCtE8Ec4qo78E3RmG7wOO0KBMVYfou3MU5hlh8LP4LgyHnOcLbVnqp9vi9HFzHkr9tw+LOyJ3HPojF+Se9uU7fXQuZvZXltM1PpKMXHMCYLUR8QD2KxHqs/n6EsgrNjdWNu6GB5aSMLSXm3YY9INMjfCZj3RKeay63jEFj2sjr/1YyZ0BOTCQFwD6zfgxKUMTFTF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSTb7jrO41FZndCgZppp8CmR18XhraywSRE5K88WF6Y=;
 b=b3VzXFqUroN/YWTs5GNlf3NJ7YnHnosQqq9Fdgn4yQ+J66iNmJafOFpJowqu2EZldBn+gXJDhrSXZ4Ds6tWQc7zqK67eAvpq9zAzX5GLzkF8tgXN5jx2G7DdXkmis/wln+AIR5jomcCjZHB4pSrEvqNYAziOAd1XHM1dYRMogAI4oS/xhYRoeWYQ7LlpmMAbz6EcBKCpJoGDV9EbxxpYt1TfI5Pem+uoJi0Np9HfOF1JKcT9pKJI7KmXxhDv1AMULNpAR9dOJbgh5+gCKOdO2ZqG105WPRnsFpdzrsoRh+JkLTJ4VwEemZiVqq5YiirkAuntMHXThalL2Ne3AEvN5Q==
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com (2603:10a6:150:db::6)
 by DU0PR02MB9489.eurprd02.prod.outlook.com (2603:10a6:10:41c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.31; Wed, 22 Nov
 2023 17:23:54 +0000
Received: from GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba]) by GV2PR02MB9325.eurprd02.prod.outlook.com
 ([fe80::c5e3:443b:c840:32ba%4]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:23:53 +0000
From: Ohad Sharabi <osharabi@habana.ai>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 4/4] drm/xe/vm: Fix ASID XA usage
Thread-Index: AQHaHTOnSS7MIQpWsUa0Mqeqz89ZM7CGlu2A
Date: Wed, 22 Nov 2023 17:23:53 +0000
Message-ID: <3d0f2b42-428a-57a2-5d14-b0ed61677c1d@habana.ai>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-5-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-5-thomas.hellstrom@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: c4279eb0-bfce-4d35-d571-08dbeb7fcd33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WCk43eyU1WYaN5rF5MWjbBEPbbW5OyLqraklKvAhsIRI5xL/ucRfGXu+4Ln2+nO7sCfNDkff71RM0c1iVPCxR2msgOd9PLrIjKYT4vrmOEI/hAT2wJIc6kZPFeqCSl9wq3CSay85J6fXE/Nrg8rVvl0HWxiXBXG7+xOaIl0nXMvzj7IFyBZtVBLHYLiH8aZ2Vus1S2W5Kbn2C5Ad+D9//IOkug0wkY5tE485dH/BtkyyleAuz95DImpp8A4TKtcnbI6DuJ9vwrvwxbaI9QPIiICHOXK7GFrJVgFG/NcgA2BsKnCcoSaJMe5YtuvYoYUfWGnwnchDq/YJ0rmWjk6ECBzETnLlf03SxVPqN4tksTWqdAEbCt11sJY7gXV72/Wzj3eN+yRNpHVVKONhJIXRUjJu5+EKo0kk84G/ZCoxBBGKFY7Wr1F03b0OHh5I8vBCGc6nW8eBJGLqQj3V6Yrkd+XpKPVI6BkSW906rnWF6zpl17oA2hJzLEcFjg+YTQtmxaxaKxZfMoxhwyOfldXt+ljlVnGs0/s1ZNXKudye49BovQUU5y7XXa1ClnRoJjp1qc1JHM0zeqQUAIwNeXi6G+n86hlNKdSgMAhJGupy7DbnUddOpUcFPPkTihVP3iM3x/Tox6hJoyaYhp0qfid7Nn+qqchY61SVky0EM9Q2AiI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR02MB9325.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39850400004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(82960400001)(66574015)(86362001)(83380400001)(41300700001)(122000001)(6512007)(38070700009)(38100700002)(31686004)(36756003)(53546011)(2616005)(6506007)(2906002)(71200400001)(5660300002)(45080400002)(966005)(31696002)(316002)(66556008)(64756008)(91956017)(110136005)(76116006)(66446008)(66476007)(66946007)(8676002)(8936002)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVJlR1N2elVEZ2hzSDUyaVVpYVpucThYZ2RNL0pYd1RaaEozeWRULzhQaDZQ?=
 =?utf-8?B?YlNtSVN1Rjd4VDNXR0E2OW4rT0QvNlk1N2pDOHF5VUJHQzZLRFBScld6bVND?=
 =?utf-8?B?U3NWM3VQZjVoWUw3dC9rN0F5RlVlZWxkb1dnNldDWGpJTnA2OVdQa0psbUpP?=
 =?utf-8?B?MjNiNDVVZFhySGFMek9aRHRwOEFNOCtxbmpHbFk3SDVqS0JrM2ZzM3B4NHFM?=
 =?utf-8?B?cXphd0cwUGVzT2lLNEY4V0prdk9vSlh1Wkc2TkQ2WHFLUlZ6Qkx5d294c3lN?=
 =?utf-8?B?ZU5YRVZkV0h0RGNQZlBKczIvakpaZEVtZmpDd3Z0TitmbS9PVXJZUUZyMHdn?=
 =?utf-8?B?N2dkdkJaVlNqbzFzUWVwL21JUjdtNENubkJ6UzltZmc4WVlzYkl4RkFTRmkw?=
 =?utf-8?B?M1BncWREdUd2bFBUc0k1S1BqblFXUVNTRllqODllTHJiQW05WHRyVS9jWCtG?=
 =?utf-8?B?MUZlRGlwcm5BS0NYTTlhTGYzVGJlYS9UQ0hhbFFvMURmWFpZdnhvZGlFL0J6?=
 =?utf-8?B?dDU4RjU1MXhEb29IMEZ6S0szaktacU1oMHJndG9iaktFR3FBQzdlelhCOUxh?=
 =?utf-8?B?TEgwcmxsQjRPejZsb2IvZzhuVnJQVDV4KzlSdkdSbnoxaEM1R1hoVDJZY2la?=
 =?utf-8?B?M0FXblBOeEVzYWZqbW1NZXdqY0tlTEpvSkphei91dmttK01HMnBoQWdTb0VF?=
 =?utf-8?B?NEh2blVvN2NIcVM5SW9EMDJCWGxvTXY0c3NuQzhoZHI5YU8zdEdvNk0wY2RE?=
 =?utf-8?B?dlBiZWtWU25lNmZiV0Q1UmhQNDdzR3UwL2lpVFRsNWovKzNBeG9aejRFTkJX?=
 =?utf-8?B?aXFpZS9uMzllZ0o0d05RbGE0S3VwV3dsSDJmMmNoaDFOYUtvaE5UcU0wZGhL?=
 =?utf-8?B?c0RhbWtDTUV2VDllYm9BUWRxdGxIZlp0WkpZWjluQUFBWmoveXRSTU10enRK?=
 =?utf-8?B?dkFHUGN5eWJENTN1WUYrbFFBb2pPT2FKVXE3ZmREb1NCdVRxMkJPUUF0ZXYz?=
 =?utf-8?B?OGh5bUZ4dkRUNVZyZmJNdHdqVEVaaFZuNWlyZE5SQVpMKzVPZ0d5M1BQclla?=
 =?utf-8?B?YlFMM2VtUHNlWlVFc3lHUmRyL2JDM2g5V3FwZG5uZE5vRUFXaEoxb0YxVEdy?=
 =?utf-8?B?bWNzVENReHRiOTFGNWlLeW1XdFRGOERCT0JXRU8wZVhpSWtoMEFCYVROT1hy?=
 =?utf-8?B?QkNMM1BMYVVxMDFqR3lDeGpBRjdSS2t3TDhqOVlOOW4vN2RLOEE5T3lndjBx?=
 =?utf-8?B?VlRYcm9US3pnZlgrWGR2Qy9YbzhYTFc4TkFIZFoxOTVkam9ja0tNYmpsZk5J?=
 =?utf-8?B?Wkk2SVNuam5GWlRHOS9QTUR0NVJidmJ0bituQXRIMzdObEo3UmRKVnNYa2xk?=
 =?utf-8?B?K0tROUxsMkpLWDlVRkVvMlRXckRZV3ZZV1VMSGh6OWxwb1BBeXQ5VHNBdUQy?=
 =?utf-8?B?aEpxQTRiK2J2N2tWZ0lNU2dvRGtReGxyT2hxNDlkMUorVUhkcGh4dTBBQkNQ?=
 =?utf-8?B?aDdyRnlCakpTRG5icDU1eTFEVTlmZ0t1YXkrek44Q0RQOTJWL1lMd0oxdmwz?=
 =?utf-8?B?S08ySitrWVhXQnJvWS93NVZpRUpBSFJndGxmMWlyNkllN3RnQlJwWEdDRVFj?=
 =?utf-8?B?YWVJZHBJZTZoSkpmamlNbUNyVkswL0x1cklZTk40SnlnRVVRVmVaN3pwVWts?=
 =?utf-8?B?SjhNVWRGY0c3Z05yZkZsbnZ6SmZiMlhjNmtGZlV6NEhyczdTVXpiZU1xaUtY?=
 =?utf-8?B?VnBYM3NPd2J2WXExSmMyT0h4d2JEOGo1NlV4RWUzZ0hQd1NDaXg5Y0w4aXZ6?=
 =?utf-8?B?NVUyQk96V3V5bFhTYTArU05FTEo3ZUlnZXpVczJYVWNsNWZRa0pCejM0T2Qx?=
 =?utf-8?B?dm51RDdRYlpuQmo3TUxrK1lCZ0p0RHh0L2J5OVZ4RnNGb1pocER6UWhRK0xW?=
 =?utf-8?B?ZFdqTjZLK0FQdU1qeGtReHY5ZGE5Tm9HWDVZaU01b0hCZHAxKy9TU2dZOGZF?=
 =?utf-8?B?YWtWY0R0WVNURVFLWEYzK05QYlZZL3Y5enlFN2JvWlNuWU5XYnExRGtlZm9k?=
 =?utf-8?B?NU1Zdjd3VE1PZGYzb0tqM2NXNjMxcHRNQ1h3RUh6QUY1aFJqUWZxVlpxZmN2?=
 =?utf-8?Q?F4i4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15C445BB64028F4294DF5AA0350EB1A3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: t/zIsf5DEDTupL9yr93y2oPkwZyxeholw7Kg+fFGOs/xFF+JpEDD+AfupbY8r6Wti0DFBIH1Efdkss1dV0JWRp3iBwg6ufaVuDI/XlZ5Wf5M+fkLm2L8Nvo2c3NU83F028iuZVfSh8qZcwoEWGTLhPSbJMx5MlAERXjZpt+2Raosh+CfoBsgpruoUFQbF+eOvMbTowZpLw3N7shqOga33M+01a0U54mirDA/WD9l66fTi9yUaCkPIVuZDNSVwJbHC+r3YpQfQbDevJfpM0tyeFdJey6FjuO/FeilQfIZtEgcNKrjAujkOYIdb2vIxuqZbeTlTkrXv+mlbs+P+2E/xWRbmMuO1stSHlDYumdeTF+4/GD8xVGLwMR1WPlqt4wz6nqu1pBzJdp2jBYcldnusHgSSr3YiJNZaJDHd0k1YD6GPuN1+4/2/Qol+kIpjw0mFH/w6Gj7aLy4H8ygIHjdAuVO4K798nQwb3PKWcPFJmtUjhmavHgqLBB+GSP3QqrlcKGaIJVF94W89MPH0kkmkyVdMNvIceohcNc+PpZi2DekrDR0/OXktneQ18ruDYxs/E7fepwIaBxzTrC39elkkB/D+JGO09iW4sR/cUnsGTD/kt7fNlAei3eVLhY4XZdwbN66yNI7oFGtxMnchwPFZlyA05lM1zgVY7xCcJuKnHUFNbwvtEG5YkBIp3JYaQQ5FLsVrScqmuku3CU9SXc/mdF7X65mnTTtK2gB3pnLSVEmCBc16zSXueJX/+0/b0cuavBOdjRosm9tjE5x1fWavvOkqhPih5xG8pMFVFx2kkWgVLgFyZjM/YrSlcHVHlRY9aRMDQvIcKSY9Rvn9HmJMg==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB9325.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4279eb0-bfce-4d35-d571-08dbeb7fcd33
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 17:23:53.8865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRQpIGG6eIT1oNvYYy7JY0XN/IwF3ilAAUUz7tNpyX12j2RVUZptxHBKR2ry9/qXfLdOylyO/3zzFANB7leYyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9489
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwMDY3Mzg1MDpGUEtleTEucHJpdjoUPOxyZhS2w8V4D6Md2i8UfdZB8j/0Y9EAJU8yio4TOZrKLGyZsfbbsbha/77di8rHqalArSyix+xow9ADN5TX6loU94RX0iYJXRWNs14MUm/JLyWHb6lL2PzNjJdjUazidLJ9T6JmmzLg2/a/4L8K2EbVrRVZVSRXDmO+GtopujpxfcdBnpWWkQDW0Ylz3e7uoNudYVti0+a6mkeKUK4ZV170JfL82imY6Z9pIwhKwBh+sepOwPWJqtXtsSyo+LyW69CBKg1HcXMF3EzEAM8KqJjbC+hcsNt8w3Uk+AOZZ3olv8eAVZge02p9nFBn38QKDCZ7skuyF7gC7NfqnOop
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.17.105
X-Mailcontrol-Refers-To: 3AMHO8av349979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=qSTb7jrO41FZndCgZppp8CmR18XhraywSRE5K88WF6Y=;
 b=rm9O4/s4POq/oL/ON0/Odx+au6R04NHnlmFHBx6V9JN4Psc3Cbkzsr4ntcKPXMS6pV5kqpbLCpmiBBCIqyUloOPxnZo6hNVxtxwLBuBu5iAngKvQ7zjjz7iHppk2iMXPyf8/7zVnuGPacv5EhZHSNF0QQadGuGjjuPVldfc+EWaoHIsod3Co5Rpq78XYaTJ/Ix2w5pPkq37vvyFlfucNxcRAp4Nd7Yoe0/p5CuJ2kAsR0pkoQtB9kNhwb6XNPhyh4VMYT0e0/IByphIc9A6jct/cXChLL8wf5CFK4V8xJv9pDbd5Q3zqLH6fhnbFWM38THICK4OaEBnwdZvQWH7BKA==
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/vm: Fix ASID XA usage
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

T24gMjIvMTEvMjAyMyAxMzowMywgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+IHhhX2FsbG9j
X2N5Y2xpYygpIHJldHVybnMgMSBvbiBzdWNjZXNzZnVsIGFsbG9jYXRpb24sIGlmIHdyYXBwaW5n
IG9jY3VycywNCj4gYnV0IHRoZSBjb2RlIGluY29ycmVjdGx5IHRyZWF0cyB0aGF0IGFzIGFuIGVy
cm9yLiBGaXggdGhhdC4NCj4gQWxzbywgeGFfYWxsb2NfY3ljbGljKCkgcmVxdWlyZXMgeGFfaW5p
dF9mbGFncyguLi4sIFhBX0ZMQUdTX0FMTE9DKSwgc28NCj4gZml4IHRoYXQsIGFuZCBhc3N1bWlu
ZyB3ZSBkb24ndCB3YW50IGEgemVybyBBU0lELCBpbnN0ZWFkIG9mIHVzaW5nDQo+IFhBX0ZMQUdT
X0FMTE9DMSwgYWRqdXN0IHRoZSB4YSBsaW1pdHMgYXQgYWxsb2NfY3ljbGljIHRpbWUuDQo+DQo+
IFN1Z2dlc3RlZC1ieTogT2hhZCBTaGFyYWJpIDxvc2hhcmFiaUBoYWJhbmEuYWk+DQo+IExpbms6
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzk0
Ng0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb20+DQpSZXZpZXdlZC1ieTogT2hhZCBTaGFyYWJpIDxvc2hhcmF2aUBoYWJh
bmEuYWk+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8IDIgKy0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgfCA1ICsrKy0tDQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlLmMNCj4gaW5kZXggOGJlNzY1YWRmNzAyLi5hNjdhYWExNWI0YWUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMNCj4gQEAgLTIzMCw3ICsyMzAsNyBAQCBzdHJ1Y3QgeGVfZGV2
aWNlICp4ZV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPiAgICAgICBpbml0
X3dhaXRxdWV1ZV9oZWFkKCZ4ZS0+dWZlbmNlX3dxKTsNCj4NCj4gICAgICAgZHJtbV9tdXRleF9p
bml0KCZ4ZS0+ZHJtLCAmeGUtPnVzbS5sb2NrKTsNCj4gLSAgICAgeGFfaW5pdF9mbGFncygmeGUt
PnVzbS5hc2lkX3RvX3ZtLCBYQV9GTEFHU19BTExPQzEpOw0KPiArICAgICB4YV9pbml0X2ZsYWdz
KCZ4ZS0+dXNtLmFzaWRfdG9fdm0sIFhBX0ZMQUdTX0FMTE9DKTsNCj4NCj4gICAgICAgZHJtbV9t
dXRleF9pbml0KCZ4ZS0+ZHJtLCAmeGUtPnBlcnNpc3RlbnRfZW5naW5lcy5sb2NrKTsNCj4gICAg
ICAgSU5JVF9MSVNUX0hFQUQoJnhlLT5wZXJzaXN0ZW50X2VuZ2luZXMubGlzdCk7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV92bS5jDQo+IGluZGV4IGIzOWM2ZjQzZjAxZi4uODViOWQ2Zjg2NGVjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYw0KPiBAQCAtMTk5NCwxMyArMTk5NCwxNCBAQCBpbnQgeGVfdm1fY3JlYXRlX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgICAgIGlmICh4ZS0+aW5m
by5oYXNfYXNpZCkgew0KPiAgICAgICAgICAgICAgIG11dGV4X2xvY2soJnhlLT51c20ubG9jayk7
DQo+ICAgICAgICAgICAgICAgZXJyID0geGFfYWxsb2NfY3ljbGljKCZ4ZS0+dXNtLmFzaWRfdG9f
dm0sICZhc2lkLCB2bSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEFf
TElNSVQoMCwgWEVfTUFYX0FTSUQgLSAxKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWEFfTElNSVQoMSwgWEVfTUFYX0FTSUQgLSAxKSwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnhlLT51c20ubmV4dF9hc2lkLCBHRlBfS0VSTkVMKTsNCj4g
ICAgICAgICAgICAgICBtdXRleF91bmxvY2soJnhlLT51c20ubG9jayk7DQo+IC0gICAgICAgICAg
ICAgaWYgKGVycikgew0KPiArICAgICAgICAgICAgIGlmIChlcnIgPCAwKSB7DQo+ICAgICAgICAg
ICAgICAgICAgICAgICB4ZV92bV9jbG9zZV9hbmRfcHV0KHZtKTsNCj4gICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiBlcnI7DQo+ICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgIGVy
ciA9IDA7DQo+ICAgICAgICAgICAgICAgdm0tPnVzbS5hc2lkID0gYXNpZDsNCj4gICAgICAgfQ0K
Pg0KDQoNCg==
