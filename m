Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9CEC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 06:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C5B10E1A5;
	Mon, 18 Sep 2023 06:41:13 +0000 (UTC)
Received: from cluster-e.mailcontrol.com (cluster-e.mailcontrol.com
 [85.115.58.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1977710E1A4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 06:41:10 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly62e.srv.mailcontrol.com (MailControl) with ESMTP id 38I6f0l2033504;
 Mon, 18 Sep 2023 07:41:00 +0100
Received: from rly62e.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 38I6evrQ032950
 (TLS bits=256 verify=OK); Mon, 18 Sep 2023 07:41:00 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly62e.srv.mailcontrol.com (MailControl) id 38I6eROv026498;
 Mon, 18 Sep 2023 07:40:27 +0100
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by rly62e-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 38I6eLrJ025618
 (TLS bits=256 verify=OK); Mon, 18 Sep 2023 07:40:27 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4NoZzwRhh3q/hU9rfYJM8Fg2Ye64vnsf+lZ3fS6Akyt+xWHh6yHBXJgnms7Xm6B/DSOoKhDWBuH+PbYBwppuSnDDhWtT5e05HQa1P0jXTC4BFcLLFnYkIdq1mzkHdoI7tKpZ/fM7QKCiEUU68aZMB3AKIK0sWsVtfQHQtKDxparbRUEwb/8WFBctlNATplIR6dz9xL25h+DcS751hsiksZPBI0ZeDyFblTYegg9Imr/a7Jyq7/rmX9QDEgUoSp5r2VW3jwJNo65Byq0daYIdQ3rAOAb4KIhiTy+VtCqkjI64m908BOr1Jzta3qnUfRtmLiCudKdo82+jVVLyf3dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7bN1eWWqbcQyoUudi/o/TZ7gVPJHddTBRy3paW8t8I=;
 b=QALP3p74M70G2nwmwOSybiSXdjwayN1s8un7N98lJLdJyP9QcuKNPW7+0EJGTJZoiRMaJQaAFKHanqvbYDCPVB2aGjNN7Ddf+OZNyDFwvU8oSy+1e1qWSLscM9lGsbYVZI4rrIPao+hnmmW5V46hY4tSlUJB2D+k4Clvx7Xnanp2rBZXzW2+/j+NB4PYwWnA/bTKLAv5R7TBY8YspYku93fA+haM6u4vO4lHsgA43p/v2HDFBqbNXZntw8oZfx6LhFCtZ9C/lXhSvwwewOS26W9JnZv+lHhCyK7a3Nk7xRzj9hzmZzkL1qjgnIcOZyZgZuo8ZOeSlrbnAxEYM0w9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7bN1eWWqbcQyoUudi/o/TZ7gVPJHddTBRy3paW8t8I=;
 b=QahLCSnlansYjOEJbRfydsCasHyCZqambaQwU37ttwT4wGtzKQ9it3Qc83M0Lc0Y3XETQhpvtlJNPrFo0THzB7C0+tDciUz75uf2OpMQZFWXHYQ7DWJdIQCDXGjpHOXU/hjAo0Itik2IosWEn3FA8fuxJoKLW9EB3lt01zDPoxIfyemxdlRz4RiDgo/bP+w64z6+GiDBsqrVoSaxB6S1VlrdQrFhM3+5q+eApKEMMRa6M2j/U5G+awlPrCcv9Y4JN0z8WVYejeuBIQzRGQMqatV0TSPl7V3JY1pVMOFmXdNzPzUgMFbtYo5hpJmLK+WJydUMUp2rLREAc3UGrH+CYQ==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by PAVPR02MB9206.eurprd02.prod.outlook.com (2603:10a6:102:326::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 06:40:19 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 06:40:19 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
Thread-Index: AQHZ4cJ38SDN4jXuXEKkP+/AO6NU1bAURcqAgAC7nwCAAAn5AIABUGuAgACK+YCAACl6AIAAe20AgAJ9xQCAAGBAgIAAbBuAgAVcqAA=
Date: Mon, 18 Sep 2023 06:40:19 +0000
Message-ID: <bf33b2c3-5111-e4ed-0a3d-5616ce0fc9f6@habana.ai>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai> <87v8cfd4t7.fsf@intel.com>
 <d763fd15-0732-8cd2-a24f-055a5855544a@habana.ai> <87h6nxw3rl.fsf@intel.com>
 <0d208249-a467-9c35-4c38-2bd9dd56f611@habana.ai>
 <CAKMK7uETpBgGGBesKZjBB+aYbfN3UA29OSksADY8FVvFKL=wtw@mail.gmail.com>
In-Reply-To: <CAKMK7uETpBgGGBesKZjBB+aYbfN3UA29OSksADY8FVvFKL=wtw@mail.gmail.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|PAVPR02MB9206:EE_
x-ms-office365-filtering-correlation-id: f44f46a7-3e15-474b-e9db-08dbb812203d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3oL/0U8vs4J+fycfmg+GelIBl30IkhgDclnuc2CQ5mUx+jZssYDYE9Pe9NkrMSUyuusq2l+nCoVf7czAO9OUEsvszWr98FKCijjd+ZhqqKkZqEsy/32EKLLsq6qARHlkFugqqZUG2vUlDLYIHRyMEZrdQFOayOAdBob43+5uv0cnBqu6DfDVxYokxDms9EOmnD5JZhr1aomVJZ/07Fe7LALCp48ezkYPBrwlLNfTkUVfINMkaK9xAuK7+vLZozapxo1doqGaYvHRzOTVXy8y0cJiFrJ0DVv+wGRLyCTUteaYOSmH3kp4GyVoTxEFMk/bxOduNSF0V/fu1mU5qgpvX85vAFkn0yHgQPsYQcIn7t+28ima4nFodJpJtjhYWCFvTXj85FtOXtvjo2U/hC8GnXqN4FhV04BojR3xWfvSGN6s9YtZqP/fM/M2eAy4htyWVd2ui0ogIm17sK9QCAgMCvAKdh6y6TK5Iwf2vOYp1CCKE7Dxhsx9rJ6KLDvTMyzfko7tfcOxvBaxXaR9Br7dHaRRPy/sAtOx/7i37gVw+d+jKyI+xpxYdbOWfPca3solKdGhB4f7ypVRwy1wQV8AK/KS5+A8CH+hgyuR5TLt8IC5q0K5uAznBhKNHcqLS8I3GUkfFdjkUyLEPNooXWINCrxj1kVXPAK9kw4r0h4SQrw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(346002)(396003)(136003)(376002)(186009)(1800799009)(451199024)(26005)(82960400001)(2616005)(8936002)(8676002)(4326008)(122000001)(66899024)(83380400001)(2906002)(36756003)(31696002)(5660300002)(86362001)(53546011)(6506007)(6486002)(966005)(478600001)(71200400001)(31686004)(45080400002)(316002)(54906003)(6512007)(76116006)(91956017)(110136005)(66946007)(66446008)(64756008)(38070700005)(66476007)(66556008)(41300700001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGVxNnhZK2RqYWkrYTBvVDNmcUM2Slc1R0xXR1FDTXhDNTZtMUxDbTJsSVli?=
 =?utf-8?B?Q0lxRHZCekVFMURZOUdzQkVYTGtGeGlZYmZFRTZBUmpOUndFYnhUeEE3MDJQ?=
 =?utf-8?B?RGRjUDVIY3NXblBGQW9OTjF4Yy92UXg2UE5GcG00NGJtelBpcE9zeWdtTjNS?=
 =?utf-8?B?OXVVVDZEak96WXVuVTI5UXIwd0JUNkVUUXRUbzN6L0NUWm85aVVFb1VidGxU?=
 =?utf-8?B?dGZGdG5iZXliVDdra1hjeCsyZGtaVm13ZTA0dGZhaFg1S0kzSERmVEFGRzU1?=
 =?utf-8?B?MkRYTmQ1SVhGdFdhNzJ5aERZMFhEWGl3azJoT2N6OHdFTFRjUGJjRThuS1Rk?=
 =?utf-8?B?ak5UUWNoSklNem9aZkw0T1FHVTB5S1EyRTFyUjR4RlA5OE1lTEhGMGhlZ0FW?=
 =?utf-8?B?bXJVeWlZWThiczR6MDErZjZjb1JQOWVldUtXMjF0eDlaNXJ3TDdHTEVFVnla?=
 =?utf-8?B?SjNteXJVTjAySS9DM3V6YXBrYTM4dHNRNTJSUW9kaU56dlBHZytrOE5qTnBn?=
 =?utf-8?B?QzFBT2ZpUmpNK1hYODJ3TzBCUVFreGltWlM2U0ZBRlRoNlFFd0lnTUJhL2Vy?=
 =?utf-8?B?L1RmRTNFbno1bjhuV1hwUi9DZnIwM0NFQ2FwdHhQM1ByQmJCaHBKaWs1Rmty?=
 =?utf-8?B?a0N3aCt3dzVxWnowZUE2elRMbUVEVlNMTlNNNDZzc2xmc1d5QmtIcGRlbllB?=
 =?utf-8?B?RDNUSis1L1JMZ1d1RU5yNmI0WEVDK08wekcwVnIvRHJGRTRHRSt3dWw5WmIw?=
 =?utf-8?B?S3laUlU5SEtHVFhKTmx6bDBUU3ljK09ickw2MTV2K2pQc05Fa3d3dlFDNEhF?=
 =?utf-8?B?V2tqYzNSSFYvckMrQng2b055bUFmcVdQQ1NtOU4wbmh0c0toaVVRTUZMVzBE?=
 =?utf-8?B?UUs2YWIzaEdCMk1TL3Boc1psaXZ1dTZRRFVwVk52aTM3SlRtaEtLQU1HNEd1?=
 =?utf-8?B?QysxWkxMVkJUM2orcFBSMFZtclltSDhxaHhvTWlwQ1VPcDQ4NzRCVS9lQVR0?=
 =?utf-8?B?b2UxT3hwU25oalNia2pXazZYS2s5R0FTTFgvQlhuTmYydlB2cmVUWHpUZGp2?=
 =?utf-8?B?S21jR3RoUGxSK2ZQUll5WlZrUkV0aFJldllMMGpJSDVqZWhBZWQ1MTR6TXkw?=
 =?utf-8?B?aGZKNHZrUFRKNXRYcE00bkhrbUlTcVFwV3UvSjlnNFN1c1pTd2pUMGdWdFhN?=
 =?utf-8?B?Y2l4ZzdLaXpNR0txRExmTnd5bTJFcDdBcmpTR2lZNlM1MTVGU05aUFlsaDRY?=
 =?utf-8?B?SzlpaTVyVDhRb0s2Y0s2cDUrTHBKMzFSOGJaU2FUd0ZMUllIbGFkMmV1cnR6?=
 =?utf-8?B?a0NWWGJkcitsRG4xM24wM1g1WjFmNzBuZVgwOW1Rb04rU2t1SmlJdVg3NmFz?=
 =?utf-8?B?WHVabTNoQ2daRm5kQzZCMFQ1OVp3OGt5NUNLYnFzb2F6ck14cEt1TEROMjYr?=
 =?utf-8?B?bktoYlFmUE5hQ3NqdFdsVUN6VGRKWUNkWkxyNzFLR3NOUkVubjRDOUpTWTUr?=
 =?utf-8?B?OGR3VU5tUGZTWlNyRXJsNWhvbW9jOTNjOXJHUXJnalZKeXdmSkh4azcyejFw?=
 =?utf-8?B?czhQUWZXdmhMN2VYQVhvMGh3alAyZGRBeEFDa0lWL3BRcllJWVZqcWwzdWpN?=
 =?utf-8?B?SFlxQnV0Sm5QeFgwZ2NBRDl5WSt1UDlWazlwZTRjMTQwbWRLKzU3YUlNV3Nu?=
 =?utf-8?B?MU9meWhqaWgyQjJacFIrZGdvdlVqZEFUK0U4TkVSYVB2MElPeW9hZlIrNHlD?=
 =?utf-8?B?YXdEQUxKdWFJS2JYa3RZdjl6cW1oNlcraFVrdUUvUnFlaEpVMVNwZzNGeXFu?=
 =?utf-8?B?VHV0YXVsaHI3SDZ4TkV3SklCVFczSXZrSkdSd0ZpTmVXbHB0cFN3UDVNWGQ0?=
 =?utf-8?B?OCtkUVMzeC9TeFZkWGhwWkQza0p0V3c5a0Z4akZYWUpqN2MvWXN3NEJFZDBy?=
 =?utf-8?B?VEgvZ3JydTgrOFJoRldhWVQ3dWFaL05OTmtMS3FVaWNBL285SDlZdzI0ODlF?=
 =?utf-8?B?RkpzVU9PSFhCQndyVk1JS2szbnU5c2M5SDFMKzFJeWhXV2doSGtYcEtkeGg5?=
 =?utf-8?B?ZU5LellpR2VVa29wYlorT05WU1VKdnJtQUJtQjBPaWlacVNWR24yUGhVT0xT?=
 =?utf-8?Q?0K6c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7DCBB6F3F09D544873F4325E0813425@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SDTUYI2F6cSQ56kFEWxjtgffTBbE7R//DvEz3W6zt3I5nwcQ+aBvcdTnHsLP3eWtSELCGgcDhW6MslBOYFMglfd3+aqDJpqlkhX1zzPhKqbwXXAP0Oh5ofSrxHjBBV8BhfvDspjbq6Dyd9SbL3hxkpq0dZkfoel+95hOUa79F88okLj92MkeMtI+N2N2MG8S6aeujpvZJHcixyuz4idWfpojFE4jCGF7ntTmThiFcCYlB6Y4m2e+6v0/fzTcOT82QqTIUYTrKfOwBnQSbHc+ZtfTkpQOfWBmfsN8HfAeM+72Q2rry+/84fT7stKQNjbXVwXa3P+yYdncDtpzYMjbui3jIMM/JxRW0E7QXzt46AS/1lVuDJtAxyhOYrN6yWEmVXbPAVHgiv4n5Sfp4chlnWsz+R+1EdBZgMvHtrZeRJzknTwZ0yYPrTfKXQGzMuCY3NYQg2zkvuwCsGFeQi/1neRLo9plfNGcFDimHK3/9mRTImscb7keeLzoRYJsV1GvQ1Wku8WgGFZ2/RAmS9gVTWFRaEohZJ5ItZ73gg00OKyEIN5V/MOW5559Baq1cZo1FYYjRZynV9mFmsptEoJO5UkCMJtyxh+cI8hnTrXWDdvcji3+IWuB+a/cPK1DWuz34g6pmCYuemv1qBoSW2ZYpPkn2V+nqgE2K1cpfNOm8JafZP/gRPmIWmynjvRcbXhqtbDHN4Ff9AHJ1qXure+1cbNjXf+JvbdFWsYjFvkBLWx3MhO7agnF8ZwsMX0doiy7SsKT9HF6gg3SISLw6h87fFy64PO+CPT9XORTCLiuXW9TxtRv6hVO40TeGBUnNtCOiUM1UAEIGDsllEMkuDW0qZ7fYDseB0O87z8avAb0yB7DOlaaBjXtH9fprawLiJvznRLuY905qX/HhGz9j2oSCA==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44f46a7-3e15-474b-e9db-08dbb812203d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 06:40:19.2764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAVoeLI2pjNKEQu7K5dy5DAceuuZ1ZdL8GS6Yj17qw9HM/iw7QB1CcQkrSKOgHAbFAP8nl+rWAl1RTLwNlkmmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9206
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NTAxOTI2MDpGUEtleTEucHJpdjosB0OJ/urDYMyA5JNwGfphWtuQVMRu1cWFjkvTLQz+w8itLqhK2ynqIfJ2L4pMngMPLaQHNOOXud9QuFU4u0rskmoLMYciziLhy9Q1kUjF6gzOjHnVMM8/wniw3PVJRLlCwqnP6bmLuYnqVmveOwaU8hS/bHmatDp5KT6naLvpWYLAclU3ESX9ofUKOZymud4a6nnH6zO0oY9Dj9TIAMIu2W6ONNLhYvylIbfyNkqUSUv4dzH/Atp+6FUcjbwrekyWVeOXGHk56nM8bEQfRoqDehy5NRiH5ZPLESazwhaptBFwWFZS5VQQzXhI21lb5riH9Y2eiMIsZJ1ziAj1ri9P
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.12.54
X-Mailcontrol-Refers-To: 38I6evrQ032950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=+7bN1eWWqbcQyoUudi/o/TZ7gVPJHddTBRy3paW8t8I=;
 b=qrcKYiSguUBAkhLC+pvMQbxvgVuPIUoSz/v7HidP/BFE1G2IMAVR4UrMgamhC0N0rp5Jq4B0kcSmtpWYKoD8GP789NppYKyHH6GvOZiFt1c9lDAhAQ/XXHkttF+t7rpqXplRq3QVIcBKH0dvyjObJfDwddW7h3NkcdClBXITpH3iaTdY3p5yjcXeP34Wwd2mykUIh1zk8eZjSJk7sk7AnF+nGes00+TXwRwG3J8Gdk4jCX6AX/TKn/sROF20vcBSIOaqFMw5MCno4tgfR9IvoVqGx4Di3P/Hi3SBJd6F2sLzHrBa/jjC9UB6QNgPRJztUOFzSlrCaL4DGsAxFDz4cQ==
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMTQvMDkvMjAyMyAyMzo0NywgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gVGh1LCAxNCBT
ZXB0IDIwMjMgYXQgMTY6MjEsIE9maXIgQml0dG9uIDxvYml0dG9uQGhhYmFuYS5haT4gd3JvdGU6
DQo+Pg0KPj4gT24gMTQvMDkvMjAyMyAxMTozNSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+Pj4gT24g
VHVlLCAxMiBTZXAgMjAyMywgT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPiB3cm90ZToN
Cj4+Pj4gT24gMTIvMDkvMjAyMyAxNDoxMSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+Pj4+PiBPbiBU
dWUsIDEyIFNlcCAyMDIzLCBPZmlyIEJpdHRvbiA8b2JpdHRvbkBoYWJhbmEuYWk+IHdyb3RlOg0K
Pj4+Pj4+IE9uIDEyLzA5LzIwMjMgMzoyNSwgTWF0dCBSb3BlciB3cm90ZToNCj4+Pj4+PiBIZXkg
TWF0dCwgSSB0b3RhbGx5IHVuZGVzcnN0YW5kIHlvdXIgY29uY2VybiwgSSBtaWdodCBoYXZlIGFu
b3RoZXINCj4+Pj4+PiBzdWdnZXN0aW9uLiBXZSBjYW4gY3JlYXRlIGFub3RoZXIgRkQgaW4gZGVi
dWdmcyBhbmQgbW92ZSB0aGlzIGlvY3RsDQo+Pj4+Pj4gdGhlcmUgKEkgY2FuIHRha2Ugb3duZXJz
aGlwIG9uIHRoaXMpLCBUaGlzIHdheSBBQkkgaXMgbm90IGFuIGlzc3VlLg0KPj4+Pj4NCj4+Pj4+
IEZEIG9yIGlvY3RsIGluIGRlYnVnZnM/IE9yIGRvIHlvdSBqdXN0IG1lYW4gYWRkaW5nIGEgZGVi
dWdmcyBmaWxlIGZvcg0KPj4+Pj4gcmVnaXN0ZXIgYWNjZXNzPw0KPj4+Pj4NCj4+Pj4+IEJSLA0K
Pj4+Pj4gSmFuaS4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEFkZCBhIG5ldyBmaWxlIGluIGRlYnVnZnMg
dG8gd2hpY2ggd2Ugd2lsbCBzZW5kIGRlYnVnIGlvY3RscyBzdWNoIGFzIHRoZQ0KPj4+PiBtbWlv
IGlvY3RsLg0KPj4+DQo+Pj4gSXQncyBzbyByYXJlIHRvIGRvIGlvY3RsIG9uIGRlYnVnZnMgZmls
ZXMgdGhhdCBJIGZpcnN0IGhhZCB0byBjaGVjayBpdCdzDQo+Pj4gcG9zc2libGUsIGFuZCB0aGVu
IHRyeSB0byBmaW5kIGV4YW1wbGVzIGluIHRoZSBrZXJuZWwuIEkgZm91bmQgb25lIHNvDQo+Pj4g
ZmFyLCB0aG91Z2ggdGhlcmUgYXJlIHByb2JhYmx5IG1vcmUuDQo+Pj4NCj4+PiBJZiBpdCdzIHRo
YXQgcmFyZSwgdXN1YWxseSB0aGUgcXVlc3Rpb24gaXMsIGRvZXMgaXQgbWFrZSBzZW5zZT8NCj4+
Pg0KPj4+DQo+Pj4gQlIsDQo+Pj4gSmFuaS4NCj4+Pg0KPj4+DQo+Pg0KPj4gSSBhY3R1YWxseSBn
b3QgdGhpcyBpZGVhIGZyb20gRGFuaWVsIGZldyBtb250aHMgYmFjayBkdXJpbmcgYSBkaWZmZXJl
bnQNCj4+IGRpc2N1c3Npb24uIERhbmllbCBhbnkgdGhvdWdodHMgb24gdGhpcz8NCj4NCj4gU28g
dGhlIGJhY2tzdG9yeSBpcyB0aGF0IHNvbWUgc2ltdWxhdGlvbiBpbnRlcmZhY2UgZm9yIGdhdWRp
IHVzZWQgYQ0KPiBjaGFyZGV2IG5vZGUsIGZvciB0aGUgZWZmaWNpZW5jeS9mbGV4aWJpbHR5IG9m
IGlvY3RsLiBXaGljaCBmb3INCj4gdXBzdHJlYW0gaXMgYSBuby1nbywgd2UgcmVhbGx5IGRvbid0
IHdhbnQgdG8gbWFrZSB2YWwvc2ltIHN0dWZmIHN0YWJsZQ0KPiB1YXBpLiBCdXQgaW4gZ2VuZXJh
bCBJJ20gdmVyeSBtdWNoIHdlbGNvbWUgdG8gdXBzdHJlYW1pbmcNCj4gZGVidWcvc2ltL3ZhbCBp
bmZyYXN0cnVjdHVyZSwgYW55dGhpbmcgdGhhdCdzIHJlYXNvbmFibGUgYW5kIHJlZHVjZXMNCj4g
dGhlIGRlbHRhIGFnYWluc3QgaW50ZXJuYWwvZG93bnN0cmVhbSB0cmVlcyBpcyBnb29kLCBhbmQg
dGhlIGlvY3RsDQo+IGludGVyZmFjZSBzZWVtcyBsaWtlIHRoZSByaWdodCBmaXQsIGFuZCB0aGUg
c3RhYmxlIHVhcGkgaXNzdWUgY2FuIGJlDQo+IGF2b2lkZWQgYnkgbW92aW5nIGl0IGFsbCBpbnRv
IGRlYnVnZnMuDQo+DQo+IFRoYXQncyBob3cgdGhlIGRlYnVnZnMtd2l0aC1pb2N0bCBpZGVhIHdh
cyBib3JuLg0KPg0KPiBOb3cgc2luY2UgaXQncyBkZWJ1Z2ZzIEkgcmVhbGx5IGRvbid0IGNhcmUg
bXVjaCAoYnV0IG1heWJlDQo+IGRvdWJsZS1jaGVjayB3aXRoIERhdmUgQWlybGllKSwgYXMgbG9u
ZyBhcyB3ZSBkb24ndCBnbyBvdmVyYm9hcmQgYW5kDQo+IHVzZSBpb2N0bCBmb3IgYWJzb2x1dGVs
eSBldmVyeXRoaW5nIGp1c3QgYmVjYXVzZSB3ZSBjYW4uIEJlY2F1c2UgaW4NCj4gZ2VuZXJhbCBJ
IHRoaW5rIGRlYnVnZnMgc2hvdWxkIGJlIGh1bWFuIHJlYWRhYmxlIGFuZCB1c2VhYmxlIHdpdGgg
anVzdA0KPiBjb21tYW5kbGluZSwgdmVyeSBvZnRlbiB0aGF0J3MgcmVhbGx5IHRoZSBtb3N0IGNv
bnZlbmllbnQgaW50ZXJmYWNlLg0KPiBCdXQgaWYgd2UgbmVlZCBzb21ldGhpbmcgd2hlcmUgaW9j
dGwgaXMganVzdCB0aGUgYmV0dGVyIGZpdCwgdGhlbiB5ZWFoDQo+IGlvY3RsIGluIGRlYnVnZnMg
aXMgaW1vIG9rLg0KPg0KPiBDaGVlcnMhDQo+DQoNClRoYW5rcyBEYW5pZWwgZm9yIHRoZSBkZXRh
aWxlZCBpbnB1dCEgSSB0aGluayBpbiBvdXIgY2FzZSB3ZSBjYW4gdXNlDQphIGRlYnVnZnMgaW9j
dGwgT05MWSBmb3IgdGhlIG1taW8gY2FzZSwgYXMgaW5kZWVkIGhlcmUgaXQgaXMgdGhlIGJlc3QN
CmZpdC4gSmFuaSwgYW55IG9iamVjdGlvbj8NCg0KPj4gSWYgeW91IGFyZSB1bmNvbWZvcnRhYmxl
IHdpdGggdGhlIGlvY3RsIGFwcHJvYWNoIHdlIGNhbiBnbyB3aXRoIGENCj4+IGRpZmZlcmVudCBh
cHByb2FjaCwgZm9yIGV4YW1wbGUgd2hhdCB3ZSBkaWQgaW4gdGhlIGhhYmFuYWxhYnMgZHJpdmVy
Og0KPj4NCj4+IHNldHRpbmcgcmVhZC93cml0ZSBhZGRyZXNzOg0KPj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuNi1yYzEvc291cmNlL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFi
cy9jb21tb24vZGVidWdmcy5jI0wxNjMwDQo+Pg0KPj4gcmVhZDMyOg0KPj4gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNi1yYzEvc291cmNlL2RyaXZlcnMvYWNjZWwvaGFiYW5h
bGFicy9jb21tb24vZGVidWdmcy5jI0w4NDQNCj4+DQo+PiBJIGxpa2VkIHRoZSBpb2N0bCBhcHBy
b2FjaCBzbyBtdWNoIGJlY2F1c2UgaXQgcmVxdWlyZXMgYSBzaW5nbGUgc3lzdGVtDQo+PiBjYWxs
IGluc3RlYWQgb2YgMiBhbmQgdGhlIGltcGxlbWVudGF0aW9uIGlzIG11Y2ggY2xlYW5lci4NCj4+
DQo+PiBPZmlyLg0KPj4NCj4+DQo+DQo+DQoNCg==
