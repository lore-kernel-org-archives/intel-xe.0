Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5EFEE3F0B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 18:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864E510E02D;
	Tue, 12 Sep 2023 18:34:09 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0B810E02D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 18:34:06 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly08b.srv.mailcontrol.com (MailControl) with ESMTP id 38CIY2O1038127;
 Tue, 12 Sep 2023 19:34:02 +0100
Received: from rly08b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 38CIY1Mt036947
 (TLS bits=256 verify=OK); Tue, 12 Sep 2023 19:34:02 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly08b.srv.mailcontrol.com (MailControl) id 38CIXMUB033671;
 Tue, 12 Sep 2023 19:33:22 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by rly08b-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 38CIXKRg033522
 (TLS bits=256 verify=OK); Tue, 12 Sep 2023 19:33:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV3rEWNbid1jzFsAtyoMzxocOEmHS1pDNrZGUECLUfE7z/W/GTsGPSVXagp3zhwzjwyKlyPp4rnpQFX1QM9pmzonvVhm7HbwvtVBBbBx9uXPg2gB0VYvvc52nqykc4RP7eNvXFVJvA9/Mo1IHEQD9I8Pl6ZaF1GWbttwcwHv5cZXC55gIU816k5B/nK6FrxAewh4/XCoPdqE+/eDD7v95/a+EMr59rdnBetjHaAS3qYMEXtVRwXBfVSbfi9l1WMqcyq1a1UDLhcJT5BZ9rlhqMHe7zurVhXbxTL9b1HN9OIOZDxFxcwxnNhN9IQ5QUI/cpB/u7HeUUy/9AyX/0ZcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvucmMCWpfVvimLkaA5k6hsDXYWAOKwhkWYjE6lY84o=;
 b=MZ6JD/0QIcQ3JmYPPDCNfTWu81Oxf9Ab6sth5L3E0e15OOuWzTuZ490RUKjmKokUn8TYv3v+u0jMQzh/G2AJUE30c+tSE7+W+58LlqHg8o0HKHkAE6uc6355LEphI+7Bj/xgKgOE4FIVcMJy4J13LwbOIh7ZeLI+C3r2+6Uqx3Qtl+/h0ucwqW/3sC1aAD8rMH6+Sa5a++URoc5bd2lsfRPcdzA5GbTX4SInu3e7jn+hffpHipkafRKbinopGHm50a4yyzpc+Ddc8+akrCYps0YnMUXuhu6g/oBo6JCYJ7tvwal1/SAHxuf8ENn7e/FEBvRSgX4DBGj24ejFcghZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvucmMCWpfVvimLkaA5k6hsDXYWAOKwhkWYjE6lY84o=;
 b=DHrAhU84nc4zCYXhYwOoqsjiZ77ijv9Yjy7uGiWTU5DGY2Neko1xufTRcyl89vef6KLt/8qkugqIG4CI0lCzwa6XG/QmwQQept0s5mrXq7o3+ES9VRb0R3mIBhd+u4yjd8fBKXD90lqHWekT9/kDWmA83Gy0WG675hStHCN9mEsY0f6ajeqzJ9Ye9isFQ9i+ROiAAtIUA28hZnD4SXDs5LSrdbkVbM1uk3oGZAqeU9rH5h5RaPQdNgFSwR9PBS4JsRfDWJRfrZXNyNUlEdfxqh68lz+wXDosboiuYB0WMcFMFq1x++H774zdVq4p5VsWOLL+q8MrEoCzCL/mn+kaTA==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AS8PR02MB10434.eurprd02.prod.outlook.com (2603:10a6:20b:632::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 18:33:19 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 18:33:19 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
Thread-Index: AQHZ4cJ38SDN4jXuXEKkP+/AO6NU1bAURcqAgAC7nwCAAAn5AIABUGuAgACK+YCAACl6AIAAe20A
Date: Tue, 12 Sep 2023 18:33:18 +0000
Message-ID: <d763fd15-0732-8cd2-a24f-055a5855544a@habana.ai>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai> <87v8cfd4t7.fsf@intel.com>
In-Reply-To: <87v8cfd4t7.fsf@intel.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AS8PR02MB10434:EE_
x-ms-office365-filtering-correlation-id: 7671c5b7-bf25-4afe-7319-08dbb3bebc72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kamW4GQ14iTGKXeAx8cKHUkH4YDD8x7Zhu6x2J+Cs2kUthgcK3qCNL+32sjWdVwcfWlaDB+iFUVeewx4ydRUENCUPCjleDDY1RZYezErJm02FN1B6dBcvMAVxX94SHPvP0E22Py+cFjpnRtK88wrKjbGhTEaDcFE0LesVKoT37SKei1HPh9Vlp2XktxFrpZALY1h1nU5UY6VBpf4kGce/toRLXHSROidlUJYYU9z4GSnFs+eXCQgOse7FbQBhlwA6M7ERMnijtry6UcN4Ftkf+ZC+KcMJfBNCyLJ5j1ZfCZ15yJ3wTe4xPkIVPpOzykpG13BRTYeMeYC5uy/F15BThgsmFw1ai6Gg6jzcpgq1D0Rx4o/qufke5dYTe2bp6pfdQFZTOjaxiRvkPhSazvaPmSNaVFp9PXJQBupzMNd8qoRXSDu1Y2wJE4drooM1inLEd6etxTr1oh6UmIYXRdUBY/lVrnTqQlHiEzMPjUG1VJmYYN9o8pOtC6T0MSTFzi1oHTUX4dN2h6oMghExEU4kkZAH2LoOUrVkx2QrD6+aMHpfnmwDhJH74SLKgu60yjNF5gemkwtYmfWbqunsAMOBo+q36uZ+zA18I+gM1X6C06rixI2eLrTr+AKMqXyDufRB9d5PnBCzdgIcxEhRS3w0ycmdG0nEOjoB5BtG39AbUQNGhJmpuKuiTGksULxsra4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(346002)(366004)(396003)(136003)(186009)(1800799009)(451199024)(38070700005)(82960400001)(36756003)(38100700002)(83380400001)(122000001)(2906002)(4744005)(66446008)(66556008)(110136005)(71200400001)(53546011)(91956017)(54906003)(66476007)(66946007)(64756008)(76116006)(316002)(31696002)(6506007)(2616005)(31686004)(6512007)(86362001)(6486002)(478600001)(4326008)(8676002)(8936002)(5660300002)(26005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkJDNkQ1UjRZRDBvRHVLOGlPTTd2aEx2ajBoeVdtRGp4M2VvTmYxZUpFUENW?=
 =?utf-8?B?bzZUMmZQSnNEN2MwUnhlSTNrcEJGcXNGVFZDaUExeFpnWVpteHB6RVlzdXNJ?=
 =?utf-8?B?L0NEOWFGVnV1Q3N5Yjd5OUJKWFArbnNsUzZUbVFKbW9iSThxdmIrSWg3Nk03?=
 =?utf-8?B?ZGt6N3pyQWJRczI5SWRtbkYxaGsrM3BGOGxrZlBXaDNNV0cvbXpKdlQxNVhw?=
 =?utf-8?B?eGxvd0EzejRNcHNTTTJVLytKL2ZVdDdNdmF4TFAva3VjaElxTDFVbmxsaUtH?=
 =?utf-8?B?REF5V2k5RHNyTzZpZ2hVSzZYdVhNQWw4WlhuZkEzQ2ZkSHIxZTMxamhkZEhw?=
 =?utf-8?B?WG9meGFRSHVDNy9kT0lwWkFDLytrZWNzMWNCcXcrSmRlWXBIaVdYQzdiWVhw?=
 =?utf-8?B?NDFEZ1NLN1VockVxaXNmcGhZVDBOS3lydWJ4amc4NDNpTEhwRFdxNTdFUDcx?=
 =?utf-8?B?QU1zQ1BteCtsbXU1K2d5VkxhZ0VCejR1K1pZeXVnQ3MrRWpiS1JRVmFCSk5s?=
 =?utf-8?B?aTlrc0JPNGd2bmRtcWFYYjRyMDRYcHZnYms3Z1EweklLVzBCVWNqNFpaSnpl?=
 =?utf-8?B?YlFReGJubjdSMk5BTTNOcU9Ra1N6TzJRYTA2UW81bGwwQXZOS2xZU1pPWnh5?=
 =?utf-8?B?QjlkRjlDSkJneVBuY052NmZFMlV2Y2txQ3hZZ25ESGZxcFFwbUM5dUdDNGFR?=
 =?utf-8?B?eG8zWGNPbU52OGk2MndhUDI4N1Rpb2drSjI3SC94ak55QlQwRUtFRDdwL0Zh?=
 =?utf-8?B?L21CNE9oVUNFVndiK0E3aU1xVVhTSFhDU1N6MTdkWStQUGNxUXdvem9LRGFp?=
 =?utf-8?B?aUNKNjhmWWQ1N3ZuMU9wZ2o3N25ESDl4d0xENjFSWVhoUEJmMTU3TStJWmtI?=
 =?utf-8?B?R3hSRU53UjROZmI0Mm5NbE9lTzFmdmYvYzAvYkhpTTZ4REpqN3d2S1hpdzNR?=
 =?utf-8?B?Nms0dTg3cWxwczdaNWxNNWRmd3BXaUp3OGxWamJ2bWFzUHE4U1FucnU4T2h6?=
 =?utf-8?B?cTJFbHUrbjltRTNESExYV1k3b21XR1BiZFFBYXE1VXhiWkVUN1B4QzVhNkJP?=
 =?utf-8?B?QVNRWGc3cnJobXdjaVMxTDU5ZXkzeUExbzJWbUwwMWJyYjZyTDB1WEVRdXA1?=
 =?utf-8?B?dEt6WHdic0RQRmxWeUpYWXdiREVqam1HZ1psaHQ4bDUwMFVvMzFJdVhEZ3h2?=
 =?utf-8?B?OTVlL0VqLzBOZkVWQ2UvVThpR3Bhc0lnVHlVNnJZMzlBNERIb3RFMTNBTDdp?=
 =?utf-8?B?WnFRNXF5dkd3ajF0SG4xZnFPWXFtR2hWUjdVNUtTS05PSTZIZGQ5NEU4N3lU?=
 =?utf-8?B?UGt6cWNBZzRpTE5XVHpERERlOEE3cWE4NGFscTlNb3llbDBwN0d0NWl5MDBp?=
 =?utf-8?B?YVpEQkZCcXJOS0Z4OUgxaUpONTE0MzVDSWtVYSt3eGxvaStzcmp0NlZPRVlM?=
 =?utf-8?B?ZDlOQmxhVFhCeExCRCtDc05abzNtQmlPcitHb2RnanpPZWFzRUVUeGc3U1Vz?=
 =?utf-8?B?b2FadTJUNTliRkNKSHNibnl4Qm1GUWxGWmZjSnVaYlRHTFBzZjQrcTZIa1F5?=
 =?utf-8?B?N3ZaV05TTXBXbDE3VDJiVkFSem4rUDd6V2tOYzNvQTdCZGZBMktkdko3V05B?=
 =?utf-8?B?SWZIaHN4NC9TRVhQUWVJcENTNnVkbk1QRmJtUTUxYUZYVXgrdUhRWEdQamZI?=
 =?utf-8?B?VlU1dnpya3dNbUdvY3lqWWJja2ZYem5GN1J1YUZORCtNZlB6RWNncVd5WENV?=
 =?utf-8?B?SUhIdlNJcHZJb0FFUEprSjlIZGl1SC9hdi9PMWc1QllPMXBrTUZuemVabTRi?=
 =?utf-8?B?ZlBZS2RacGpkSjR1bmtPeHdQYW9ObUZTVnNlejNxODFDemkzaUd6NmxTRnZE?=
 =?utf-8?B?dDAwelc4MG41TExXb2xXRUs0U2pDZ1dmTHV2bzc2T0d4L3RndWEyZ0lOZzhD?=
 =?utf-8?B?VE5VdXV6QmxScm1nejhGdTg2c3dWdlFSVjEvQkZMRUpRczZmRnc4eGtyTVNK?=
 =?utf-8?B?NmZtVzgxQW4vKytNOHg0alZkalNDSm45MlpPYjV0REVKdFZrV0s1S0JEWjBW?=
 =?utf-8?B?cDQrVGp3ajF6L0JuVUVBTGNhT3pyS0dsVmxBS0tPeEI2RHBKSVRqS2ovMURN?=
 =?utf-8?Q?jvfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6309C9BDD56EBE4F9ED80457459A3438@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 26mraykEwAK1dAVwJO3g9JhVM6nX2lSiFdpBaU2xCDeXFgYPnlyMhWscfUWRCeHXq5P6UFKMXh75LSOAg1BMeO/YptvvS4TgbOgXCDa+9WdudyqKkTp1ZHfiAg73Ptn/lFEKhpGK/s0QUT8mHzeXcbAnpn8fpUnG7sz+GXIePx9xX2VHrU2/9ILdL6a8KR624Km6xnWwtqSZ5FlEF6plrXs5MJYtiPXgm2T9YzHml1xXA7mUYWdvK1H/xKU+og+tH+Jn4yb5PjJYNsb4L8LYnFOgJ8w3bkHwXVE9uFHE5uZ8qU9MkPcC/O5kmH33vHhulq24/ahdmXmnyFfktLvIQkNHWNr8+mjzghK38bVYK1V8hAs3i4F7bjHGWPqwDDKdG3kRuZ/kA9samSMvG5CxdbSiTKJnk6Zu6MPPfV7ri0H/ngn0J4KwMHBeasrL0Q4Y43HsXSGrEiFnRHTWETh1QzYZCksH9D7xTak3PK2UcufAfDWw5DSYfehFsZn8NqKxF/aAJeQIt1DOmu5abMoJ1RvNfjf2oaULr+PAkFSuJ0q1Lgk2K94n+43jyvM5OrPuZEeKXXEvfI+wq8rO+lCiEYF93Jbrk8Cx9TNEOiQVT9vEeSY9im9B2Reo2qHjJjoOmd8eS+W/CGofDDLq5jEk3swwMeBqW69NYT0T7U0V9Jd1dnTtAvrUSXZ27xjWP1OndLBn0tzyq16zQdiztrcCWPbc4eZH8rJjmOdl2YepJ8rofGhkspk0LJtiCfK3r7fto6pf7NhL2JDKpqFyDbokrcyIO/Z4OrZFNCZExXsQ9BUL58GWN4NPu7jSoYctVyrvq3HuvEQWwQbBNn+PL1KtYQ==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7671c5b7-bf25-4afe-7319-08dbb3bebc72
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 18:33:18.9527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7tCacsE71hfHF4afG/g/Yvdt+pwBabnbXugk5gs9FuDcnI3LOluJpHlQ8xcrTwYZd5HabC9VghKdqE9tsy/NOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10434
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NDU0MzY0MTpGUEtleTEucHJpdjpF8RCZDX/iCyjS0CJ0qmswmvxUgLJfPHIzrkliy8B3omEO8tTcSDJBeTFkjEBP6akTLnYzGIi8cKH5NFcD4IQOtkG+J9NITEHpE2A9aWirXMjFZJqBzqQWOKM4p0gav8prD8aAb9gR6cRSGfTof6dVLLkbCRQoWzCX63dyjlgyfkcPTMgB9SaQebHpmDwE3tVOv/OSI8OJDVre/sF1WQiMjZpAIkMkqD7sn80aYWYKPXD8fp6NuAqpn2SwoLpCsElxlN+FYpcghMRvGYyIyoFy/MyvDh3+4GXBD68Q3K8+W/0ZC6/V5OnLN/s0Z6iofMtyt7Zgjz4lYQ8Q+GxAg5W9
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.17.104
X-Mailcontrol-Refers-To: 38CIY1Mt036947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=rvucmMCWpfVvimLkaA5k6hsDXYWAOKwhkWYjE6lY84o=;
 b=EA16FZaR2Q5xRi+V3xzPbaj8HSZ9LRgwIAtNumEyw2nAoDMjLEQVL1uK5n/WOHGiDN2GJsvGDF0LlGn0svGQlgtS1qj4dtltej0uzcnsDLyehP2UAzYP03csntv1Q3oAO6Bs/chXl0lJh7ZDTdjlSXguQpklhtatRWPQ3+tQjljEaSxQ3GWByMNtaqN15vGIO2z4Nfp86c2/OyQk37bwGT1ygGCEGSEr3k+8ZSCf1ez5Lt2bG1852uNHItF0VfivLYO54/Hv+apTB5uIfvjxvlTcLSK2A8PcWoFwLHakqdSXHbMIWPUhfFPMqXHt9sKTc1X561wF112AGYSVj5dn/A==
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMTIvMDkvMjAyMyAxNDoxMSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIFR1ZSwgMTIgU2Vw
IDIwMjMsIE9maXIgQml0dG9uIDxvYml0dG9uQGhhYmFuYS5haT4gd3JvdGU6DQo+PiBPbiAxMi8w
OS8yMDIzIDM6MjUsIE1hdHQgUm9wZXIgd3JvdGU6DQo+PiBIZXkgTWF0dCwgSSB0b3RhbGx5IHVu
ZGVzcnN0YW5kIHlvdXIgY29uY2VybiwgSSBtaWdodCBoYXZlIGFub3RoZXINCj4+IHN1Z2dlc3Rp
b24uIFdlIGNhbiBjcmVhdGUgYW5vdGhlciBGRCBpbiBkZWJ1Z2ZzIGFuZCBtb3ZlIHRoaXMgaW9j
dGwNCj4+IHRoZXJlIChJIGNhbiB0YWtlIG93bmVyc2hpcCBvbiB0aGlzKSwgVGhpcyB3YXkgQUJJ
IGlzIG5vdCBhbiBpc3N1ZS4NCj4gDQo+IEZEIG9yIGlvY3RsIGluIGRlYnVnZnM/IE9yIGRvIHlv
dSBqdXN0IG1lYW4gYWRkaW5nIGEgZGVidWdmcyBmaWxlIGZvcg0KPiByZWdpc3RlciBhY2Nlc3M/
DQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQoNCkFkZCBhIG5ldyBmaWxlIGluIGRlYnVnZnMgdG8g
d2hpY2ggd2Ugd2lsbCBzZW5kIGRlYnVnIGlvY3RscyBzdWNoIGFzIHRoZSANCm1taW8gaW9jdGwu
DQoNCk9maXIuDQo=
