Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF6C4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 10:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBA210E1AF;
	Mon, 22 Jan 2024 10:26:38 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440A10EC99
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 10:26:36 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly12b.srv.mailcontrol.com (MailControl) with ESMTP id 40MAQXEt090568
 for intel-xe@lists.freedesktop.org; Mon, 22 Jan 2024 10:26:33 GMT
Received: from rly12b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender ttayar@habana.ai) (MIMEDefang) with ESMTP id
 40MAQWtm089602 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Mon, 22 Jan 2024 10:26:33 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly12b.srv.mailcontrol.com (MailControl) id 40MAQGmB085356
 for intel-xe@lists.freedesktop.org; Mon, 22 Jan 2024 10:26:16 GMT
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by rly12b-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 40MAQEuT085110 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Mon, 22 Jan 2024 10:26:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzwzA1d70AOEZlFiM0r6julvPPQS/r/2Cl/j7GQV9M2yv3ZqcaY9fb/hUcDDVKYLxXhXmVyHwGsAuHXZ6WeKcKsix8pPPGVDLXUurL6oM4y65v7p8WbU3wt0/tgzoVoQ4yz0n7QlEK4Mc0sbs3wQSChWfuMGVSA8t7hRqJnjin9F6v9d9DIBu3UVPI8sSaxWGnimRfEW9u2VW9tg1gpiH/51zSBGsMNNv7mA3U3oHaHitMXlCNq2ag4VwV9swo7yk6sdUtn9AyabgzCt965ud6/AWZ6xURSYMiLCZ643A8BxKzwfOWQ4PVpXTjyyiuG44grMfZHZyAN9b98N+qDkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxkGbN2t4bdRArr/z7pP6RNYvjq873JmGAdpRlPsIzM=;
 b=Oro6a/gc02S70twjne6cis2AKXkvT1GAf/dWn6uUnC/gZTZC2muCjw/Js6IxI4XMyGwKOLb3xj7MuAHnydntnq7kAPEHjjBpLalPBNvPxp30GhoxZwrTaA+zgTU0kdQj53lCI+FEKVifWUKcrVFipi6L42uE30RCVWKHc4UyvJnTOsM9XgTRChRCD6x8a6g+HIFOPwwIVxbMatnrkCJWHBRI0VFpOQtrqWamSnsVxWIETn0tyOtascPnxOIJYMzX6omJ/e5PLh1uYszMGXylRrj2gXIgoQ+b/Fwnmdlg4XAn7bfHqxOKEw1Pw0HQs1gI5O3oiDbzMaxmDmFoRjmt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxkGbN2t4bdRArr/z7pP6RNYvjq873JmGAdpRlPsIzM=;
 b=TpFvbKNKejW5eSBxRDs3X10J4DNgjXegvuLsktzo7GwHGYKyb2WBN1BF1BcHR9SqjDf5KQ6JoC0SZvabj4hdoLEgFNOlqUmI8ZXBw5C7C0kXFv25FtfHauMx7QKIcuLifvUFEY/PJnn+6YWQ8qdwg7ZmoZk/qPxbqHZ/oXzImi4ZKagF2R9kxPHN1OcNsQFzHaGOqPgyyXQjco43AMyOcq0+YFuH0JZd52AR/+F0J2Rvkdwf+nOkzcdZNO1kHKr3FinxPCtV7fzcWEts4bQX4Bti8Vaqi/rz3aoMcf1xnzqWmoyicwcm93ZlivVIxOrM6bUwfBYI9MvWZiOm0JADhQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by GV1PR02MB10759.eurprd02.prod.outlook.com (2603:10a6:150:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 10:26:11 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::866d:e302:d95c:6c78]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::866d:e302:d95c:6c78%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 10:26:10 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Moti Haimovski <mhaimovski@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/vm: bugfix in xe_vm_create_ioctl
Thread-Topic: [PATCH v3] drm/xe/vm: bugfix in xe_vm_create_ioctl
Thread-Index: AQHaTR00tEXHcwiVJUi9Q4nAeE3eZ7DloJoA
Date: Mon, 22 Jan 2024 10:26:10 +0000
Message-ID: <f8e94c81-8c10-4235-8432-a104b6946859@habana.ai>
References: <20240122102424.4008095-1-mhaimovski@habana.ai>
In-Reply-To: <20240122102424.4008095-1-mhaimovski@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|GV1PR02MB10759:EE_
x-ms-office365-filtering-correlation-id: 3187e6bb-417a-4aaa-9f88-08dc1b348db0
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cbUjcqer7MO2KrdJzWv4k7tX64yP/qnzoD1CPc+Ib9LaVoW5tM+LZDq8FhN4hizkhfpezAShPj09vvZ5rwycgCz+6DbhG9/l4L33rtWOP74TOtkoJp40tzQcFWNDtCi7iFKt//VVUXLa4rKSax6jOY8AI9AVMsl2tYnccUQmqweK+NqfOLRjM5xiVyUjcNkdy9TAXu2yk7z7A2w0Ih1ZsrqMaQ/V38G/WT9D2qF+/ZMWHyUhjKkGqog+E66lkRvyOvGNZTa+1Cf7rKOj+Pia9m7/nhuhNqeHgNTxMUNpEEZQfHQN51CROvXbYXOYbPs1iLwMACWodQ5taTIchpaK1bOBqH3IkQ9eS5Iy3lEAxjER3z1MdFLnv2c7LJTtzrBPpn4W1CfUnu3f3/9AOW7xrZ4zKIfwiDFPeUlqeJlJJHq6Q50OJFhS0voG9ZNn83MJAsdPhOEpAKlLCWjfzlgqZ1gupnCM1IESfPVL7+mP1r9CyDo2QSmgYfdqrrbQkTqoxBGQy9Tvty6o6LJmIouPTVjGQM8jdwhM81qvQf67Ki7oopFSjYExHEmikqYKKhyIi1WOgy9vQyohnNKylGiVRUwELUoxqxH8HmsflnakR/dKoH1Qi+O5EVRP9kR8UODWOB8JLO/i1YMd+/ETG6cMBa6U90d24V9YT9BsAygJ80S2i/4+pWoSho05+on4AcOU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39850400004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(6512007)(71200400001)(8936002)(8676002)(53546011)(66946007)(76116006)(6486002)(66556008)(66476007)(64756008)(66446008)(478600001)(91956017)(316002)(54906003)(110136005)(2616005)(26005)(83380400001)(41300700001)(2906002)(5660300002)(4326008)(86362001)(31696002)(31686004)(82960400001)(38070700009)(122000001)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z251ZVJwRmlGK1krN0FwR0xOd25Ncko3TlZja21kek1scVZ5bXFrZHIrbmZL?=
 =?utf-8?B?SzNQSDVuK2tyZTE3dHFrZDBjYWN6aVMrV1lBZFUrWW81QklsU2pNZ0JBaXp0?=
 =?utf-8?B?MGhReCt6QmJ2citDdXhpNENFL1g0aHhEdFRBaG1CVVZSSFA4SW9uRks1TG1m?=
 =?utf-8?B?TDBEc3lmeVNHc2V3N244Ti9NQ2pUN2FUWVdCWkVlZS9UZ0ptL1pBV3J4ZlBa?=
 =?utf-8?B?MXNDVXg5WFVrdFRJM1RHVmFaQ1dndXoyT1JwWmRnYWhjZ0FoWU4yUmxNZGtX?=
 =?utf-8?B?dEQrVHlxYnZWdDVUblVtNStMUlU2N2N0RlhLL2hNdUZ3VjBtd2QxbHZmSXd0?=
 =?utf-8?B?VXBqcVFtblJ5OWtudjFQSmxneXRKckJ6SlI5YnBUUEtFVDFsc2RnSWloNThG?=
 =?utf-8?B?eVpzbFZsekVDQnFVYmVpS3pJRis0YXJwOXZFSjJEUU82dFEwVUFlczlNeVJD?=
 =?utf-8?B?bzdsL2VUMW9iem9OTDhhRWlpYVF3SVhYYWZRVUhQTjMxTkZQQzBXTjIzemZn?=
 =?utf-8?B?RjR5M2Q4YnhkOEYzYzlCOVQxaDZCd0lZdktvQmNEMGRrNWxNL1JHbDMwR0dZ?=
 =?utf-8?B?bmFsd0FKb2NvUDRFaWloaGNESUhHc3EvZWpBUHdjUEx0U1FSdWFYWGM4VEFo?=
 =?utf-8?B?REJlZUZvSXpFQWE5TmdsU2xDS2lzOHFvSm1MbFNhSHBMbzI2SkswTlc4TWo1?=
 =?utf-8?B?OGUvdlFsZTdGeDYzMkVDSDc4RXZQdDlYT3V0UUJnNkg4c2EyRG1mdGoxRXYw?=
 =?utf-8?B?K2JBMitDMWtHL1NsN3lTN3p1c0tPVFF2ZFIwbGM4TkJjb3JiRjJBNmhXdmkz?=
 =?utf-8?B?VmFiMkJCTjdlMHFHSjZZYno3aUxxUTlkYWZ1Y1U4RG5uSmZwK1dVK1g2TDV4?=
 =?utf-8?B?cllXNno1YXJreUwycjNiNHY1S2tpeGgwUmFyQVdDVHRJYkpPYjFRdlFka2sw?=
 =?utf-8?B?Vm5WaEt0cWNYN1V6M0ZLTk9tLzFtYVhoSHdyRFZOMWFIdUhmS2UwYVZjTVpw?=
 =?utf-8?B?STV4SHNVUmhKZHc4Z1o2MlN6TUdWV2xQVmM2S05tUklZQmZ0VWZ6eWN0cm9D?=
 =?utf-8?B?eHl1U3UzdlkrdGhtbC9pSVB2YzlScnFnTDU1dThYWmwzSTdwTWd0WFlMMlFx?=
 =?utf-8?B?MW42SUs1RzFCTGhnM093c1lQdnYzODkxMS9jTy9qYWhOSHdkaTBWZ2F3VUlw?=
 =?utf-8?B?SW1EZTltVUtnSlZVMVVQc2dYbUI2UVhETXVJYU93ZDlPdEkvTmZPczBTa3Zm?=
 =?utf-8?B?Yjd1UzkwblRiTEVtcXB0ZjFsa1JlbGFKUmRWRFJrYU1Jd0JIaXVaKzA5V3Y0?=
 =?utf-8?B?bERVNzJhOTVJYWJwWGtabFdqTWJyOGRZUkJyOWw2SmI0a2l0SWpLdzFHVXBr?=
 =?utf-8?B?YVRDQktGdW5NL1BCSWRHellUL3dUU0VwNWFmc0VSa2xDcUZUVmRJaGszMGNX?=
 =?utf-8?B?WUJQQVVmVWlIWVFwOWk4cmhaZXpQSzhuemgwWlh2OS96all4QVpCWU1mN0c1?=
 =?utf-8?B?SGU2YzlqS1FrTXBBUThvbklSUXRObUhJdWtVN2w5TzQ4Q1hMYWRIa1ZuaEh0?=
 =?utf-8?B?ejRqTmRaTEFWVWN3WFdtVDNhTHFqaEdEUTZlQW5Uem1XQURCVEx2NWUycndt?=
 =?utf-8?B?UmJ0cjNOQU9qaGJjSFdKWFlXRC9sVHE2M1hsREVYMEN2aTI0MlpVYWlRVVFn?=
 =?utf-8?B?S3V6TDR5bE9Gc1FiY1RickFkTGVtb0lKME5ZcEc2andVZ2tmaTlBc2hHQzcv?=
 =?utf-8?B?RmdsZ3FxaHAwMENOMnIxazhQbkpLdm5Pbk5mYVp1N1J6OXNQWXVQVVlraHVz?=
 =?utf-8?B?N2xoOUsrSUtZRkE2eXVaTVBUUks0Z1pjaEkwdzVUUTBiU3VMTGV1YzVBNllW?=
 =?utf-8?B?VkVlUlB6S3hvWkNkdnRGVm0wUFpIZVFDR1lDQ3VaZHAyeSsyZlI5SE12YjF3?=
 =?utf-8?B?aENKTXBKR0dqUzNORGt3RHlFOExvZmZRTDZCS3lPb1RVTGttYldOSFNLa1BZ?=
 =?utf-8?B?bzh3OGFDNEJrTWVZajYzU0ZxT1J1TGlpd3QxZTRsUEpBR1lqaU9DY2FNTHpX?=
 =?utf-8?B?L25MY08xZVNWQTFrdXg0bk80b3Z6Y0xoOEtTVVc5dmxTVEhEaWVWN0VWOWFJ?=
 =?utf-8?Q?Y6vI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE69A33AD052C4BB6A16DEDFB5025E9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Em9nKPWutmarbR2Euyy9Pc59ArjdmpDI81zGY1LdPED79yHDYidzj13qhXDRixkupwFs7IMClQCfzHcNPvrZNdgvGTYWKxLGb3v1oTwDtBH25D2TIYY2hrN/GUWegLsWFPBDGUrgS4sMUJHxho/sAQ1XfK73V1BKTXT8fFR9MCZAw6BNIoHBqblAjT6sJ3ThC6zw38hBaQgINx1le4cfS9hpw+8HEZ1+kbGzR7WnrGSe05DsV2W11mKIXG7dkzMth4zIWMJn+46id9/Q26mcJFjzLD4UctgaDasO5+JCThjsSA+gc8jHdTTSQxGIcp4wpA2iMs8JPBJPwubZDCzKDhwe60IPv69BQtmqO0F5QdjwJ9nv/Xk1cf57XfQvSGfuUMrDt1BS988eT2gYD6LBu6HTl9h9t6vzxlKwYNS8jPoxHK3ZgxIfPrPk4YBRuPJcal6qpZnIdMhx576PstSoaiIHG+cGxs5BPmgIWiOgNsbFghcFbJHke1Nv4zl3jEKp96lFbKL+D77xiBxUv2eyszu7CxwbXJgXywtLDXVaxqGt810WTEyBcBVVPguFbUGgdLgwCG83KchPRYOx9BJA0BiJN5H8X06WICc2iffIBVilFPSCh8NFMv2uuTg6p5pW
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3187e6bb-417a-4aaa-9f88-08dc1b348db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 10:26:10.9127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjldSvEgnJCUr+3rIuXqcAIEvWI8mRPzH7SObpJnWqAiVzyORVcd8CZnHpPBZ//npciAY9Te8wjgFSsXaoZi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10759
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNTkxOTE5MzpGUEtleTEucHJpdjqyewyeCicORvZZzF7njS5Cfldq+odik4KFlX+Lp2IGrXXMdKr0xUSts3xv5rU6D7zPg9slw9bMnpVJOMYNU8oYyUUBxbCo2GsLe4dosbRYp50CeAPdEnB7OGstIOqf6Ksc+/mJOHgZzuNDU0Sb7/AnYwIiePD4nC8OJyRI9yKwopHOBdttNZfwjfDL16qeiHX1qMowcm69BFbvyWAiNlm2n6C97V3+UaWeX7QZeClRDHbULr6yIz19EDrQyd/nzyU5+zVdOOZ9klBXSdNC6DD08A5vHRD9YlxCxs/aT1RX1WwtJNDtXI7sHrgkzYBsGU4oR/wKppfNye4JBGzzQmXG
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.11.104
X-Mailcontrol-Refers-To: 40MAQWtm089602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=SxkGbN2t4bdRArr/z7pP6RNYvjq873JmGAdpRlPsIzM=;
 b=Rff2i3StuBjfyYZSskiHvHtHT5gQO6tEXRy5ncLF4Ntq16QMrvX8GoCJ7EQWGvSkZdy4TTkZFFeVN0MhjcWm2RMTj5/sJmyky+WLH1j0C8PUjITMr4cOay670LjpB8YwF4VDvvkz2ZFyFRu4omnJbR9iy+DIRSASXqXNRnmE8u+WxRqBRHS2kKOq2zpJj1Sr44KUspQ+W9tCDMuLnRZYAigXI2r0jiPY61qEPvheB0VVO8En6eSuCf6aUMLH05XB7tZYGvaG3o/kNQuMoqqeLXUmWhwzd1/889i4oCT1Ee2lV98WjTXjLNil3QV/w/fywlfim5vC9Ad8YdzhazWaCQ==
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMjIvMDEvMjAyNCAxMjoyNCwgTW90aSBIYWltb3Zza2kgd3JvdGU6DQo+IEZpeCB4ZV92bV9j
cmVhdGVfaW9jdGwgcm91dGluZSBub3QgZnJlZWluZyB0aGUgdm0taWQgYWxsb2NhdGVkIHRvIGl0
DQo+IHdoZW4gdGhlIGZ1bmN0aW9uIGZhaWxzLg0KPg0KPiBGaXhlczogZGQwOGViZjZjMzUyICgi
ZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGRyaXZlciBmb3IgSW50ZWwgR1BVcyIpDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IE1vdGkgSGFpbW92c2tpIDxtaGFpbW92c2tpQGhhYmFuYS5haT4NCj4g
UmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogVG9tZXIgVGF5YXIgPHR0YXlhckBoYWJhbmEuYWk+DQoNCj4NCj4gLS0tDQo+
IENoYW5nZXMgaW4gdjM6DQo+IC0gQWRkZWQgIkZpeGVzIiB0byBjb21taXQgbWVzc2FnZS4gKE1h
dHRoZXcgQikNCj4gLSBBZGRlZCAiUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3QiLiAoTWF0dGhl
dyBCKQ0KPg0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFJlbW92ZWQgaW50ZXJuYWwgdGlja2V0IGlu
Zm8gZnJvbSBjb21taXQgbWVzc2FnZS4gKEx1Y2FzLCBUb21lcikNCj4gLSBNb2RpZmllZCB0aGUg
bmFtZSBvZiB0aGUgZ290byBlcnJvciBsYWJlbHMgaW4geGVfdm1fY3JlYXRlX2lvY3RsDQo+ICAg
IGFjY29yZGluZyB0aGUgcmV2aWV3IHN1Z2dlc3Rpb25zLiAoVG9tZXIgVCkNCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAyMyArKysrKysrKysrKysrKy0tLS0tLS0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdm0uYw0KPiBpbmRleCA3ZWEwZjE1MWQyMjMuLmRjNjA5ZTNjYzA5NCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gQEAgLTE4NTUsMTAgKzE4NTUsOCBAQCBpbnQgeGVfdm1fY3JlYXRl
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgCW11dGV4X2xv
Y2soJnhlZi0+dm0ubG9jayk7DQo+ICAgCWVyciA9IHhhX2FsbG9jKCZ4ZWYtPnZtLnhhLCAmaWQs
IHZtLCB4YV9saW1pdF8zMmIsIEdGUF9LRVJORUwpOw0KPiAgIAltdXRleF91bmxvY2soJnhlZi0+
dm0ubG9jayk7DQo+IC0JaWYgKGVycikgew0KPiAtCQl4ZV92bV9jbG9zZV9hbmRfcHV0KHZtKTsN
Cj4gLQkJcmV0dXJuIGVycjsNCj4gLQl9DQo+ICsJaWYgKGVycikNCj4gKwkJZ290byBlcnJfY2xv
c2VfYW5kX3B1dDsNCj4gICANCj4gICAJaWYgKHhlLT5pbmZvLmhhc19hc2lkKSB7DQo+ICAgCQlt
dXRleF9sb2NrKCZ4ZS0+dXNtLmxvY2spOw0KPiBAQCAtMTg2NiwxMSArMTg2NCw5IEBAIGludCB4
ZV92bV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4g
ICAJCQkJICAgICAgWEFfTElNSVQoMSwgWEVfTUFYX0FTSUQgLSAxKSwNCj4gICAJCQkJICAgICAg
JnhlLT51c20ubmV4dF9hc2lkLCBHRlBfS0VSTkVMKTsNCj4gICAJCW11dGV4X3VubG9jaygmeGUt
PnVzbS5sb2NrKTsNCj4gLQkJaWYgKGVyciA8IDApIHsNCj4gLQkJCXhlX3ZtX2Nsb3NlX2FuZF9w
dXQodm0pOw0KPiAtCQkJcmV0dXJuIGVycjsNCj4gLQkJfQ0KPiAtCQllcnIgPSAwOw0KPiArCQlp
ZiAoZXJyIDwgMCkNCj4gKwkJCWdvdG8gZXJyX2ZyZWVfaWQ7DQo+ICsNCj4gICAJCXZtLT51c20u
YXNpZCA9IGFzaWQ7DQo+ICAgCX0NCj4gICANCj4gQEAgLTE4ODgsNiArMTg4NCwxNSBAQCBpbnQg
eGVfdm1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+
ICAgI2VuZGlmDQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiArDQo+ICtlcnJfZnJlZV9pZDoNCj4g
KwltdXRleF9sb2NrKCZ4ZWYtPnZtLmxvY2spOw0KPiArCXhhX2VyYXNlKCZ4ZWYtPnZtLnhhLCBp
ZCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZ4ZWYtPnZtLmxvY2spOw0KPiArZXJyX2Nsb3NlX2FuZF9w
dXQ6DQo+ICsJeGVfdm1fY2xvc2VfYW5kX3B1dCh2bSk7DQo+ICsNCj4gKwlyZXR1cm4gZXJyOw0K
PiAgIH0NCj4gICANCj4gICBpbnQgeGVfdm1fZGVzdHJveV9pb2N0bChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLA0KDQoNCg==
