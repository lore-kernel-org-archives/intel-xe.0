Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB92C4829B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 11:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD5210EC82;
	Mon, 12 Feb 2024 11:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="DDd0FhFU";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="eKs+S/M3";
	dkim-atps=neutral
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4275510E957
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 11:32:38 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly13d.srv.mailcontrol.com (MailControl) with ESMTP id 41CBWXNv064407;
 Mon, 12 Feb 2024 11:32:33 GMT
Received: from rly13d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender mhaimovski@habana.ai) (MIMEDefang) with ESMTP id
 41CBWTro063485
 (TLS bits=256 verify=OK); Mon, 12 Feb 2024 11:32:33 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly13d.srv.mailcontrol.com (MailControl) id 41CBVxoe051214;
 Mon, 12 Feb 2024 11:31:59 GMT
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by rly13d-eth0.srv.mailcontrol.com (envelope-sender mhaimovski@habana.ai)
 (MIMEDefang) with ESMTP id 41CBVoen048851
 (TLS bits=256 verify=OK); Mon, 12 Feb 2024 11:31:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJtcq0oit1zQhbJkYCeknjpm91EhScGMIpZzDbMYQNBsG9PWJWRqSZbZ1VIJqTn4w2g5ZVqU0Rna+BYj+oNkWb9PUj2/J4GtYQuSCrhl0T5wXKuJEKCRyyk5HfgotNuDkdu1thft3EpPE4XPpaLpQTfGAojMcT9XaT5qhp/NcB2f8dKdxlJjmy2bFIcJyOq0Obsd6o8YVJx4NBnHfVUkahRDI2jARXyHp8XAEcz2QsPOY2tll2dVnmOV1AUYirA+3pLxbsV3UMhmJcsqoCW87KD58spPiXrudrTl71+/eC8Si8v9iMfMUW2qlvG1cS3LfUsJ5WUXvs/2oNFk0cevwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCOdL4mRN/flQMxUbF6cuXbF9ITQIT7ZL6kDS/tfHcg=;
 b=gOT3/80xVmPygrdW51qOV9Rhigt0eWCyy6PJBzHPggx85ESrE2bZGIPMbm4F/WTdUv43+UHZvaDo2r23tnneOGc+88bb/hChL3ov3jQyVqdjvDnLzTbHeAZRbn5zOA7CY/L+k0gZmqw2KSiyZrr9xpDdFG93hjW8dXTjTW3OIhc4w1hLCT1LPkp0lCfIwFi66/i/H1EFbA+59J+U/rwcQFNPM5X0dRGXSa5yg22r/6UTUDjGrK0eNvfh1msdK1B1kEMaSrPA4a8uW0ntFO9571jeulH55FeXbj1SbQBNZPxw8lh5i66ifcVrXaHFL8JA8wpGaON8ZiSJqWtipn6EAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCOdL4mRN/flQMxUbF6cuXbF9ITQIT7ZL6kDS/tfHcg=;
 b=DDd0FhFUa57zD6NHUt0xeEPM5kI4h/+WT0ejuZQXmbJZB/yGpNlUEUueWP8JQ0Zw2tUNmJzC3BynrNnjgez9rvfexY1fWwG+EgvXb2sQuCicZUNR1ttOVJdTGgS0crY+sj/ImXeeFC/sfF4XS3/NAUyUgLYicyCwS88kjdlLynLjJiYPd8y/HttJTUpusXuPzBft/ijxjQA3tlzZUS65F1tZvoYEuDIIZlB9i4DAd9lDWhoaXPPQGLiXnocE3dBFRZb9JrqlunN/xq6SdWgiVu8P4ela2s+tqOKiWfyfTldyke9DzjgTuvFckPtuN30du/MEDKJWayTq+hBp50YGlQ==
Received: from AM9PR02MB7706.eurprd02.prod.outlook.com (2603:10a6:20b:43d::23)
 by DBAPR02MB6197.eurprd02.prod.outlook.com (2603:10a6:10:187::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 11:31:48 +0000
Received: from AM9PR02MB7706.eurprd02.prod.outlook.com
 ([fe80::bdf4:43ab:afab:8bd4]) by AM9PR02MB7706.eurprd02.prod.outlook.com
 ([fe80::bdf4:43ab:afab:8bd4%7]) with mapi id 15.20.7270.024; Mon, 12 Feb 2024
 11:31:48 +0000
From: Moti Haimovski <mhaimovski@habana.ai>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 0/2] drm/xe: support VM sharing between apps
Thread-Topic: [PATCH 0/2] drm/xe: support VM sharing between apps
Thread-Index: AQHaWa9k/fYNp2qUG0yzqWsvmEBKP7EGmI9Q
Date: Mon, 12 Feb 2024 11:31:48 +0000
Message-ID: <AM9PR02MB77060CFFC035F6B6840635A4D1482@AM9PR02MB7706.eurprd02.prod.outlook.com>
References: <20240206141820.264977-1-mhaimovski@habana.ai>
 <3c73749869887da822c71f604b68c48e2199cc80.camel@linux.intel.com>
In-Reply-To: <3c73749869887da822c71f604b68c48e2199cc80.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR02MB7706:EE_|DBAPR02MB6197:EE_
x-ms-office365-filtering-correlation-id: fc017811-9940-4085-9871-08dc2bbe334b
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r+S3oapYqKKhqmA8uXB9BCQBX4HZDSZLynC4uCz73yXgljmUcfX2ZO8IQAhj+lC7QBbLYFP3HE/Ee9vmO6iPhrwCAihtRYossZfuM75awluO90zs9UCe9SfJmlk5xpUAAz+p//LfOmrh2tScy2XswDGAErpSfFxbgLBSZgUH0gzcGuR3/MUxoptFbtf71IseFLvyQuJQcMtpNJDyMhUEGpWK1n5asCvGL85elbJoM45/6DhiQOjI064+jU6VhG4IxQrghfoaVxeGPiMVPYzDJgImrxGRvK/HBqEMbikU44NYPBy1VPTDpwCThn/eUNHIHjpSRxuJRQBSwUhKCl5Tpkr0zKR4uBx7LCi8sd8XHN/xErosZHewdST0IUKXc4jIph2u/NnXczdaNnVyQjTj4Q0Taa8bIsonvCEEtwBO6oh4V6psg4RhJ2CwGcIqML4bCWgGUp/pVMa0RvFIlJFhYIo8lEjcvvDC2MO9jIvm55wygAG9ulYA+4oON5SDQ2l1CqT+YEV3YI34WG6jZQG91C8EamyohVqkLZsO3scE2xIhEBLGQREElwKOA9TaMr4RBkHq3JhOqKT+KQg8OSCOASZzLM7qdjig3Tfj1kbdR5nLFeE+1tEylXIMd0GtQfoo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB7706.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39840400004)(396003)(230273577357003)(230473577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(9686003)(966005)(478600001)(55016003)(41300700001)(8676002)(8936002)(4326008)(52536014)(5660300002)(2906002)(110136005)(7696005)(38070700009)(54906003)(66476007)(6506007)(316002)(53546011)(66946007)(76116006)(66446008)(64756008)(66556008)(71200400001)(83380400001)(66574015)(122000001)(86362001)(26005)(82960400001)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejBlc1Zqa2syUEVQcm4xcHBKc3NiWStSQlA5SFJiQlVSMWdFQStnSnVrRXkr?=
 =?utf-8?B?cFhtc1Q0VFFncE1rN21LTWthZTBneUlteWxRNlhKa2FaZ0FPbHlXZGVqalRB?=
 =?utf-8?B?ZFY4S1hQbnIwTkFsamZVUkd5NEZ2WndoNzZoMWJ5TG9jRFRtNUp5ajRPNE5N?=
 =?utf-8?B?VUpEYkFDUmxaVlJZN0l6T1lleDFJbzVydkxJUjlEd09OdjNTMWNnNXJmaVl4?=
 =?utf-8?B?V3ZJNml3Sld3VnhSTlM4Mm5taHY4MWduOXVBM2V2ZHgzZ1Z0RmZ2cStId1E0?=
 =?utf-8?B?ZHV6a1p4L2duQTNIVzR4cERBWlRQWkVpTnRlN2paOTJkcWRpeGFIOVo2TlZK?=
 =?utf-8?B?anI2ei9FcktqVTVpVzM4d2p2WTUxRS9IbzVSdXhOZDRvTzJtNWxLd2d0RFQ0?=
 =?utf-8?B?cEMxeExCNk4yMURpQVdNZDdycjd0WENqekxPSHlsS1IvVjFLRndUcjUyUnFS?=
 =?utf-8?B?azZtcXFqNUFGMEhhdkZPU1NJU2dESkVyS3VaZ21ucHcwR1QxZlQ0dmxheHdp?=
 =?utf-8?B?Tk82YzcvSXlBSFBaRkNlbzlKRlhnWlYzS0JlWVJkdVNQUWZXQlc1VDk1ako4?=
 =?utf-8?B?dW8yaC9mbi9rRUdvL1JHdWJwVTNReFdFTmZXR2lBbDdDclVidzJnS2ozZnA2?=
 =?utf-8?B?aVNtSTk0MHVTWkZYQVNPdlNRNkhYTzFhdDkxbUZrMldXRjlxQzVlY3poaG41?=
 =?utf-8?B?OENkTjRPd01iamF4U0hMT2x1by9YRTVGRTVkeThEdENoMTM0RDdUaGlUZC9D?=
 =?utf-8?B?WlpUMHhwSGxKVDJBWjIrTzNjRjY4ZFRCMXlGTDZTaENITGN1YTVIc09zaUU0?=
 =?utf-8?B?dGhSeTZkTkFud21CV3BwY3B1bnRMd0NEZWd0UDhSZGRpSkxkcHh1QkRWekxP?=
 =?utf-8?B?SUZ5Z2dUdFR4UkVUUlRDSFkxb3pjeG9UcHo2RE53ek41Y1dDMzV1elppa1Az?=
 =?utf-8?B?V2pCdmhGUHFIclByWmRhbjdHZzlkMjFJY0lEUGt2cHF5YlpvRk5nR3h6RHBw?=
 =?utf-8?B?N2NyUUpENHc4d3o3dkN1aEVzNXQ2aWw3NDZXcDhHOC8vdE9CaHVTb2NpbzRj?=
 =?utf-8?B?UzdlV1NublNOT24xZmY2QWlySGNkTjh5Y0c2Rmo1c2hLNmNFMUVlYkpXUTRi?=
 =?utf-8?B?aUhhMy9VNyttSmtGT2Mrd0RlcHdFUUxBQU40eFpGa0NNUTV2VGFqRGtYcmkx?=
 =?utf-8?B?STBDZStmYnNFU3B2dVVXVmJWNkxTeFFUS3JaeXF1emJkZ3lnMFcxMzNQd0dn?=
 =?utf-8?B?V0piRWU2UGNTMVNVVU96R1kreTdEdTByUUNZVG14N09EVGJjN09aMmZuSWxo?=
 =?utf-8?B?a3h0S2VOSWxuWnZCWnFaN1ZvZ0ZHdUkvZzExWFZNS09Sa1lrQWlJV3RIQ2Ns?=
 =?utf-8?B?UkNoWFdDUk1zR3lkeVhKU29zaE41MExYalpoSkpBNkllYm1OMnk1eXYxbGxE?=
 =?utf-8?B?aG5XQVBUMVcvc3V5K081WnFOdk1WWCswaHBmbk02ZmJtNE9HOEtqNG5Db3Vs?=
 =?utf-8?B?RmVrblFuS3cvUHd4YVhZQ09tb1FHc3Z2a2ovRUdGMHNpdFpFSXhhNEpSU2pB?=
 =?utf-8?B?dGYxcnB0SndnWk4rTXhBL0lIWGdndlZCSHFxZkQ4UGtSSC9ZbmMyN08wM2RO?=
 =?utf-8?B?bEpSbDdmZGVzZDhLOUpFRnRBRStUWVo4dmlvczRUV0ZZM25DeXUyK2xrQ0Nj?=
 =?utf-8?B?WGJoTDVFTlVTNk1FMmY5Ni9aVWFWc2hlWGlCMjI4a2s5ZWRVSXNyUkZjREdp?=
 =?utf-8?B?ZXZoOHRmekRoYVAybGJOSlpYMElLbjBuWmgzVyt5dno4UGNIMFBkWFB0aUtk?=
 =?utf-8?B?K2pWNzloQjhHYytaWThPdmE5TU9OQnB5YUZkRWx3M0FEa3pRS09VRENGVnFz?=
 =?utf-8?B?bjg2NzY1aEdncGhPMDFtcTA5aFdWQktQUFcvTzB1SXg1SUNjdFVRL0lpajFJ?=
 =?utf-8?B?MDQ1YlkrRFQyLzg3OHE4NGs0dEZoaUxTM0JRSXBrYjhNUlp4MkxyTHlDNjhF?=
 =?utf-8?B?Z2ZneGpVY3lzQnN1QThZVnhJam53SVRISDVCaDJSWE9NZXRVaXVreTdRRkY3?=
 =?utf-8?B?R1BtWU1aUHZlOTZkbWNoRDV1bHpiL1Y1Z2RPM09pc01lVVpLMVlEVC9YUjB5?=
 =?utf-8?Q?i17j9B0+66TlYoO0U5qQACB8A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FII/MEMAxOQcJEQYyOSRv4Ovd8MmWGAm2Ln74PnrZz9bw6oL2fsPmEPMm1/xyzOI+k8dp3jTNjLSB+LOSZy4U1+51rcT+FTYF/2R3EFclnU9jFmIMw9dBzQ+UrjUCbvjvg1vd/xeS4fx/ZT6iYdh8CrNKLjhcSryzLz4iJT+RF/vg0J5GrneK+j9t7Vu6F6XBPncxhlxlruVBNLsyuHFvPL32PmnN2VVyA0TK9HrngY9hLPKjGwkdCg3ysLXkq65EtfOdbZsRGb4lTF54/8GFklsQxIG9vfPVuzU6SJ5VJY96A6eM7SZgYIfnFskJ0C+geOOfDursmhWiM7vFjeqJwrbRf1CjrjmGOc+TqAXGOG2pWcqoWYR2OxLO5uxTRLSXN9FnO0J6S00Kk8iBcIgNsgl7yQmCUXecfWdzyxC9Nx297GcmkuXX2wDOaoAPWdslXx9ktpe6pIzx4PgH/54u6UFOeEkSnmNRmFobb5EuhgXYslFh6mys1+/oYGfVUS8rwGjBg7r3NF4kimM5iOXo/OAnvRdrhGOggBieApNkpuJyOPMiqjcnqZNMD2AV2dea4UdrXx58jlR7BeuZrsxURnOpZnL8OknQ9uBv5QT7lxmGNc9KUW+QanvCjBwkvgx
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7706.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc017811-9940-4085-9871-08dc2bbe334b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 11:31:48.4007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EsmQl8qjVC6VKL06U8PMX52KNWutx8Cp5DggvcfqlktlhFjGq5KDVF+50qC7DnEcJF59DD08YxaiK5eQUwLavQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6197
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNzczNzU1MjpGUEtleTEucHJpdjrZ3wmZfo30/UkJ7AubT42rQ35e8I0rnoqoqWbWz8Xskdd9px9Pb2XzIqh7DPJsIvkYp0elpr5xtmV0gSkw98nfZLPCXAZD9IwLgHeLebv3egXI29MsDJmjIAFs5PQ8KmF5ANXB9PoJUHK26TBsEQ9I+75OQXKJs8HS1KZBOWaF448cqzrMG3SpOCVcZBOpIcmlyb7FWcc7cuUg22cdX+HPaHMXH/TgI8j5S6EumOt52ycCk/T1I2MMUpDcde/Q+vqnvlhjgS3wn78odZOPMG+EJnLTNh74BnCyfV+lEdiluwSGlnYWQvMGZiG4u58Z9N16Jfpf9j/sevggHzvfpFw8
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.51.233
X-Mailcontrol-Refers-To: 41CBWTro063485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=nCOdL4mRN/flQMxUbF6cuXbF9ITQIT7ZL6kDS/tfHcg=;
 b=eKs+S/M3NNeR2ZHvEMlIQxHcUVTUnWNFMaJ3ytT/4/ocarsm1phbfqZW1kFXsZ9KStR8E413EO/xQ/hrcnVlyU/Q8khsZ66CESqQWgfCOo3lKNtJxrB2I0/H36z4gha78qzQl0sW3//6zO8cGTS/XfrIXjBZ3PV35b0Gr0sXC9QLZaKwGJbcKYBlAfieQICQkC6se0RdWWH2HLxYakITRdhMGIrKC/Jm9cdg0G6TSv1dBKBkF2VRadUihBWeF6dAFCZPjmKeLoyLYuFXV5q9AdKVBMiTzykJZsYe2uu6NN9/fQxr73reJK53zebWTB3ZzH2b5RY6qs7Ez6sPfVTbHg==
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

SEksDQogUGxlYXNlIHNlZSBJbmxpbmUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgNyBGZWJydWFyeSAyMDI0IDEyOjIxDQo+IFRvOiBNb3Rp
IEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEuYWk+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+Ow0KPiBtYXR0aGV3LmJyb3N0QGludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDAvMl0gZHJtL3hlOiBzdXBwb3J0IFZNIHNoYXJpbmcgYmV0d2VlbiBhcHBzDQo+IA0KPiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tLiBMZWFybg0KPiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IEhpLCBNb3RpDQo+IA0KPiANCj4g
DQo+IE9uIFR1ZSwgMjAyNC0wMi0wNiBhdCAxNjoxOCArMDIwMCwgTW90aSBIYWltb3Zza2kgd3Jv
dGU6DQo+ID4gVGhpcyBmaXJzdCBwYXRjaCBzZXQgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBzaGFy
aW5nIGEgVk0gKG9yIGNvbnRleHQpDQo+ID4gYmV0d2VlbiBhcHBsaWNhdGlvbnMgdGhhdCB1c2Ug
ZGlmZmVyZW50IHJlc291cmNlcyBvbiB0aGUgc2FtZSBYZQ0KPiA+IGRldmljZS4NCj4gPg0KPiA+
IFRoZSBmaXJzdCBwYXRjaCBhZGRzIGEgcmVmY291bnQgdG8gdGhlIFZNIGluIG9yZGVyIHN1cHBv
cnQgbWFuYWdpbmcgaXQNCj4gPiBieSBtdWx0aXBsZSB1c2Vycy9hcHBzLg0KPiA+DQo+ID4gVGhl
IHNlY29uZCBwYXRjaCBleHBvcnRzIHRoZSBWTSBhcyBhIEZEIGluIG9yZGVyIHRvIGFsbG93IG90
aGVyIGFwcHMNCj4gPiB0byB1c2UgaXQuDQo+ID4NCj4gPiBGb2xsb3ctdXAgc2VyaWVzIHdpbGwg
aW5jbHVkZSB0aGUgZHJpdmVyIGNvZGUgdG8gcHJvdmlkZSBmdWxsDQo+ID4gZnVuY3Rpb25hbGl0
eSBmb3IgdGhpcyBmZWF0dXJlLg0KPiA+DQo+ID4gQmhhcmF0IEphdWhhcmkgKDEpOg0KPiA+ICAg
ZHJtL3hlOiBzdXBwb3J0IHRvIGV4cG9ydCBWTSBhcyBmZA0KPiA+DQo+ID4gTW90aSBIYWltb3Zz
a2kgKDEpOg0KPiA+ICAgZHJtL3hlOiBhZGQgcmVmIGNvdW50IHRvIHhlX2ZpbGUNCj4gPg0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgfMKgIDUyICsrKysrKysrKyst
LQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggICAgICAgfMKgwqAgNiArKw0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfMKgwqAgMyArDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgICB8IDEyMQ0KPiA+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCAgICAg
ICAgICAgfMKgwqAgMiArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oICAg
ICB8wqAgMjggKysrKysrKw0KPiA+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAgICAg
ICAgfMKgIDI3ICsrKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDIzMiBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBEbyB3ZSBoYXZlIGFueSB1c2VyLXNwYWNlIGRy
aXZlcnMgb3IgYXBwbGljYXRpb25zIGF2YWlsYWJsZSBmb3IgcmV2aWV3IHRoYXQNCj4gZXhlcmNp
c2VzIHRoaXM/IChXZSBtdXN0IGhhdmUgZm9yIHRoZSB1QVBJIGNoYW5nZXMgYmVmb3JlIHB1c2hp
bmcgdG8gZHJtLQ0KPiB4ZS1uZXh0KQ0KDQpZZXMgd2UgZG8sIGl0IHdpbGwgYmUgdXBsb2FkZWQg
aW4gc2V2ZXJhbCB3ZWVrcyBhZnRlciB0aGlzIHBhdGNoIGlzIGFwcHJvdmVkIGFzIGl0IA0KRGVw
ZW5kcyBvbiBpdC4NCg0KPiANCj4gT24gdGhlIHJlZmNvdW50IHRvIHhlX2ZpbGUsIEkgc2VlIHRo
YXQgYXMgYSBiaXQgZGFuZ2Vyb3VzLiBJZiB0aGUgeGVfZmlsZSBpcyBhbGl2ZQ0KPiBidXQgdGhl
IGZpbGUgY2xvc2VkLCBJIGZpZ3VyZSB0aGF0IG9wZW5zIHVwIGZvciBoYXJkLSB0by10cmFjay1k
b3duIHByb2JsZW1zLg0KPiBJcyB0aGVyZSBhIHdheSB3ZSBjb3VsZCBsb29rIGF0IHJlZmNvdW50
aW5nIGF0IGEgbG93ZXIgbGV2ZWw/DQo+IA0KR290IHlvdXIgcG9pbnQsIGlmIGEgdXNlciBleHBv
cnRzIGEgVk0gYW5kIHRoZSAiZm9yZ2V0cyIgdG8gY2xvc2UgaXRzIGV4cG9ydGVkIEZEIHRoZW4N
CkFsbCB0aGUgdXNlciByZXNvdXJjZXMgd2lsbCBqdXN0IGhhbmcgdGhlcmUuDQpJIHdpbGwgd29y
ayBvbiBhIHNvbHV0aW9uIHRoYXQgd2lsbCBvbmx5IGNvbnN1bWUgdGhlIGV4cG9ydGVkIFZNICh1
bnRpbCBmcmVlZCBieSBjbG9zaW5nIGl0cyBGRCkuDQoNCj4gL1Rob21hcw0KPiANCg0K
