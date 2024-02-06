Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B878CC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 17:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73700112BE3;
	Tue,  6 Feb 2024 17:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="VWA9+t7K";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="TeUHg8H6";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C99A112CF3
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 17:17:31 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly32b.srv.mailcontrol.com (MailControl) with ESMTP id 416HHQ9V125031
 for intel-xe@lists.freedesktop.org; Tue, 6 Feb 2024 17:17:26 GMT
Received: from rly32b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender kelbaz@habana.ai) (MIMEDefang) with ESMTP id
 416HHOCj124609 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Tue, 06 Feb 2024 17:17:26 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) id 416HGg7a117607
 for intel-xe@lists.freedesktop.org; Tue, 6 Feb 2024 17:16:42 GMT
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by rly32b-eth0.srv.mailcontrol.com (envelope-sender kelbaz@habana.ai)
 (MIMEDefang) with ESMTP id 416HGYKD114679 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Tue, 06 Feb 2024 17:16:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEaHIe3v/xSn6hhHsl6jCYeNNQZ0E/+Tikmc4tcq3vE1KZv0B/AA7ELSsrJOfhJ6NM1rCbY/8F5wmwGJLH/ESYfH3cA6M2zRjcM4vyvNeNrpDkH8+tI+UET/CL7F96bZT/I0TIXNQ2bTHt4jeYq8eYh6/2cksSxv8+DODIRG7JJ3wWyzzUtfkmzOgh6NBPx+WVvIRJfAq6zmpPBALJ3bLWmKQ5kpF/4vM5/SUPZFzndQZABiR4v65EgFz15GckFhqyJ6z66haZRLbzxP+VHy49lwp3rv25u0tZL3QuxwmbXxyq32xFv8i8expbVrVbUPbnfKk0oxWIDCcB8IHq6eTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+V28P8IBWGo1LkbWAaquK6b0AXood1VSkqbe9SqxMiw=;
 b=JG8ils1yBtyipkrxhR+yC+x2RQXNnkZfrMf1KVoaGFkfYFFeCMxJodKq6qOEgFH2mHWRmeaUYieTPTj0p2P5AIpgfzLmEoEgl0NH8oHu/qGYvuMlnh1sQsthBBWxBNA2Zge42jYJzi58j1vzmM58R7XghtH5PNpI3bUIKSbuagChtH9ZkB8ypIwnPqvDCS9Gn8wANQqRaF6m4crV7Y5w/YFd5XCOZI5XhLyhjdJiY2OgV6EJkRxlMBvpY2YdOv4bIlQu9x8rvxz4QyMAC5F9r5HyHnG6w4Ej9wIDHfysRQOEvw4I8PBvrdKse3XNA3IMqnO36O8oDCaNXrDkkdICTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+V28P8IBWGo1LkbWAaquK6b0AXood1VSkqbe9SqxMiw=;
 b=VWA9+t7K546JeunCqqdz+q8Hn0NLzvdmwZwuQp10Cssr7HDaLOjx+RX2kIVQtzmYSJIYDM5jF4DjZynaTu8PT0YVSlTGIaesb4a9kdIyCP2PLeSllfco6c9SFI7AyJwnS/VOQZyrh6lTqnTjHWEg1odh7Cl2YZuy8TCMfwMduzGDqaUYCw5J9Miu5OchcO6IXP238W7YF6zZYm14ErkmZ9qdjBD9Iv7RZrKniTxflLPVBSKqg5tPAf2x/z7GVnX5+0eK9eRVUHqXSAEkQG8HwWE5gbeXBR18cGjcY6Gdsr4iRwfRB0abBs6/5Zw7SOSBksGEPw6UbvlAc1JDJDDYBQ==
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com (2603:10a6:10:345::21)
 by DU0PR02MB9546.eurprd02.prod.outlook.com (2603:10a6:10:41f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 17:16:23 +0000
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::1652:fd49:d66f:ca07]) by DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::1652:fd49:d66f:ca07%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 17:16:23 +0000
From: Koby Elbaz <kelbaz@habana.ai>
To: "Summers, Stuart" <stuart.summers@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Thread-Topic: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Thread-Index: AQHaVIAfkN+NpFEElku7+JY+JlPajLD0WxiAgAk8UQA=
Date: Tue, 6 Feb 2024 17:16:23 +0000
Message-ID: <6d0d6a8b-7794-44ce-adb2-8c8d7b7bae49@habana.ai>
References: <20240131195953.852641-1-kelbaz@habana.ai>
 <41d1faeb0cc7e8a0ffe9f3258c22ca3ef566ea34.camel@intel.com>
In-Reply-To: <41d1faeb0cc7e8a0ffe9f3258c22ca3ef566ea34.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB7873:EE_|DU0PR02MB9546:EE_
x-ms-office365-filtering-correlation-id: 9177c65b-3c28-4301-2ef1-08dc27375815
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X4qZ3qEBCjGAo6U8SaQyCHNQXjRb5Uki3+RHo1XcXcPJ+jt4VYmSvxO9irFGyi/CdPPGGuvYgZl4kh7QIdFVm2HURPx4HGmxojlTfuageuDSBEbQgoy6iA0Xd1uG2q7cpoLxFrkg8hs5+j5ACIh+ZDQZ6D1JlpQlwP/2GCxE4Clf4hOxHDyQU890xRbOeZVNaAzyZo4SG8ij16xMwqP6HCZOBIqQEjK/dlNnnJHiUqhXalo22GzM6Btff3pjoD5DagLMFICD22xIW7OSEZULRqVjHu7t6/hgetX1dvvanelxKqYzRgXRTWtGAyKX7vLEp5byqS+JNhVwXsf6dd3AEd45gSeXf5rn7tT9ZL4S0TbWk5nupDcRtmRC1qEvQ9u3qLgoSE+M6I5cy9JaY+BwgUZeMYGy6u6KXNZ/arpiM2k3hphxubr0O/7Gkbb8jizsa1Wy7wdgrzuVjeMmdA6AB8X9Y0XfZeOo2TPeGMko7NGBUFECCQ8Bp4h3ZtH2Sn3s4Jxo2P5vZAajzukEMBvPYAj0CjUzi4pxN3CaMMpiisF+JaKf5zZtLA28LzrOPkOrSK9O3vGTfMAJExLq4aaraP1behC4XsrUV591q0Cff2qNwhmw8tCtM3HfmLeK4b/9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB7873.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39850400004)(376002)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(122000001)(31686004)(38100700002)(82960400001)(83380400001)(26005)(2616005)(966005)(6486002)(86362001)(31696002)(6506007)(71200400001)(478600001)(6512007)(53546011)(36756003)(91956017)(76116006)(316002)(38070700009)(41300700001)(66476007)(66946007)(66446008)(110136005)(64756008)(66556008)(8676002)(4326008)(8936002)(2906002)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHV2VkRqU2lCdTNTVTZnKzRoRWRyUlViZzBuWHNCT1R4UmRlTG1xMEs3VzEy?=
 =?utf-8?B?MmpZZGI1eklQZEdZOFUxNjRhL0RWMjN6QnM2NDVrQzhNUkFjR1oxbENqQnZt?=
 =?utf-8?B?MVMwSVUzZUVlVTdLZ1Joem1FRVMxVVJYN1ErSzFhRk9EbThrTTZDQjJVeHNo?=
 =?utf-8?B?Z290V2RlbE9CK2o1TWlKZTFsaDRlZEdiQnBlY29jOTBwRkpGRFVSY3ErNEJj?=
 =?utf-8?B?eEllNEFXQkYzTmRlak01R1pFeElKU2F0Sy9DVVp1cWZ0alp1U0dIK29nR2tM?=
 =?utf-8?B?dE9KSVNONU5zelQ0OXR0Z09VZHFsSUYraHVUN2Q2VG5OZ2J3TnVVaDl0c25Z?=
 =?utf-8?B?ZHZLMlRtT0pTeWdmZVFjYm5FSnZlZkFSdTAzbE1WcjJRLzNyajZ0MzJOYWow?=
 =?utf-8?B?YklCaUJHaFR6UlFWaDE5blBtQlBpdnBPK3VRdmpZWndzMUNmangxd0FmSFp1?=
 =?utf-8?B?aFpxUmZqZGFvQnJtMHN2dkMvakMwR1VpWkljeFNWMHRlbk9KdlBLd2dVRGlt?=
 =?utf-8?B?OURVS1JaNzJjdVhKaVl4dmdETnI0U0hFWHIyL0t1RWNyTHFxWHFiUlZWMmJB?=
 =?utf-8?B?VjJXMDZxckdpcUowY1VYanl1cXo2OC94bmRjSWRCcGg2ZDNkTit2d1M4Vkd4?=
 =?utf-8?B?V2hWUUl1ckIvZ1FNdk9sdUk0U2tGQitONVd3WTQyREFLbFFxeGZidVdjRCtt?=
 =?utf-8?B?aEVWeit4a203TGQzK3VBUmxtVEpGRVgrQ2F4bjdsL1VTSHZNSDM0Z3lvTmgr?=
 =?utf-8?B?NEUwS2tncUk3L29LdGFUY29YYURwUUtGbDNLd0hzZlBtRGpxeXZ4L3U5V0NV?=
 =?utf-8?B?aHVvcEVkRkJQVERTdENoNUkwL05GMUdsRWo3OFQzeHNNdTZrb1hQZDVYN0pZ?=
 =?utf-8?B?SGN1WXBuekVLU3l0N3FaTHFLa01kMU56MWpKZW4rVnZ2VklSVWpaQy8vSFg4?=
 =?utf-8?B?aHd1VzgyTTJjd3hWVUVrZ0U1UjRobSthNzVVM29YcmFPSkRESyt0VVJQYTVj?=
 =?utf-8?B?aXZqc1JXVm56eVJOZkZOT3E2VWVLUW05c0hWSWJQalVlTFBaTlpscmlRSzdo?=
 =?utf-8?B?SmFCcUZ5Nmlxa1RWTlJqSm52RWExMjVvazY3YkhMRGo2S0FoZ2crNlpOSVJz?=
 =?utf-8?B?cTVpajNpNCttTHJRSGFESHVvekhFcWIwUEtzM0xKY004K2hUUmZVZWdMUFVj?=
 =?utf-8?B?L2VjQTg4V0NzRUdZUDA2dVErSHg0Qm51YVExQlZkOXd0RGpQYW5hL2puVDZZ?=
 =?utf-8?B?NHY0Y2d5ZUN3ZkxJRzRqL1huQ0FDNHR0RWxNSmVhUFBmTmRjT3ArUUFNVFVT?=
 =?utf-8?B?SzViRitjUXhFZytXNE90QnRJN3prUmdibVVvOUNybnlTM2Eya082VEExL0Np?=
 =?utf-8?B?QjZobjJCQWo1Y2FVMjBXN0UwWW1TSUJWdTdaYUVjWFFDN09uV2J3WTZTdXEv?=
 =?utf-8?B?d1psd0JpZGQyODVpQnJWRzQ4dzNQME8yVkhad04zZllMYXpZNzIzcnpqd0FC?=
 =?utf-8?B?UFFETUVsS2REK05kajZ3UytYTUczY2IwRURVTFZSZ0RzQ1FtZXk0emRBaldK?=
 =?utf-8?B?cCtQVVhWWTAyWVFxVElHeUpvWW1JQkRMZllvR3BwZzgzWkQxVHNYRnh2RHVW?=
 =?utf-8?B?Yzk3MWc2a1JkMytZaDZJK05sV0U1Z3VCTER1T1RNSXRJSXpKYU80N1haMjdr?=
 =?utf-8?B?eTZJbzVuRlBwV08xQlJJekZlV3F1a1pJQUh0UDVYUk1pRjR1Y2swRGVFYTBv?=
 =?utf-8?B?dVMrRUJHZ0dPaTNuSGtaeSsyTUFQR0JDK0JVbEd6ZERtcXd1Nnc0VnRXZHly?=
 =?utf-8?B?Ulorb2psUEN2VmdnaGVkYVF3bW9TY2N1YTRodWo5TERMWEEyQTgyMFpTMWpS?=
 =?utf-8?B?dVpXWGNZc0Z6R1hPWGE1OFNoUnNHdmFybG96OVExRDhTVzVIcUVpUSs0c2xz?=
 =?utf-8?B?bEtmcUhla1FyaXZDdlFDYnFVcXZBRVh3RFNBd2tXRTVhSGVuSkxtdmtZd2Nk?=
 =?utf-8?B?T3p0d1FxbnVLSDZ6a2ZrU0I5cm9Vd3l2amNQS3d0TnZKMTAxZXFaZ1VMNWVn?=
 =?utf-8?B?c1lrOHVRQUpaeEg4eFJRZllEc1dHbHR2WEFvR2svbFJyelJUWkx0Sk5Jb25M?=
 =?utf-8?Q?B0sw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C78DE05C685384A9F50E48A121784BF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: A8/GsYw2S9JAI88oNMOs46G9Hw00HFVS6C42RsDriuYvnJ6Ku/5wEHVsTZRxzohlVJ9wG3Wyrx6K86xxTPO63wgTyp5uS02mdXPL4rGNwm1EFL8KqvremB4lO4PLO0Xy9s081uUUAagBWITbBCaWPsnag8w0/I68WJJVaR8lx8rTSMTnHBPHGqHaNGENZorTah6a7ejNZjhsPN+JfzVnbhfHSMgrYY8LIDbUYG9IslTS1c/rK9ZuFsMtW77LgwtjyeYO8dVJDy5si7hlxKANm9k3GtDDnCAFfq+lO4NdFmOsvR1Z9hAP3cFWGl7PhyIE2NUNmCeUx1Goj+WQwAiuD3VT8DZzKDILu4UJCKmjqBHAktsqvIuLTF0Ety7Ooz73C57po3tdlJusQvSp8IttqElHPnmQgHLMLN2LEd8Kbo80YygsQd248o8GyNVfHS0XeUStHQuQiX4O43LdIMtzuGSmZC0FYbdTRaGECcNmz+hWSJsWldZ+wkgjfRYruKebXtqDouGk3DtTHPZm3BhTm3WoDxMkgBzExOeixjuxe6DujY/qXSeFe5y17wYfAz/Wt06c+wxf4C8lfbkof6LdczbjSwrVnRLk/tGlhmdaSHeFTsT5vHKpkbsdX0JugESK
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB7873.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9177c65b-3c28-4301-2ef1-08dc27375815
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 17:16:23.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2iEyPfmE0JsHGpc8nm272UpszzwxkyEZ3Jy/ZJAkPljJ6/1ZrYmqKw3QMw44gd/YtXGq0IRm2k7XP9zIvBGGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9546
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNzIzOTg0NjpGUEtleTEucHJpdjpKYWfWGyVH1Z72TzUMs8mCv9d2v8eFQfX+HB1tRz2LvQ6gjUMqkFj8UpB6nD8ZUaco1oNtWk5TgDCWJjb/5VDHe8mY2VRF9+Rj7kLbfEJPDvEoMfPEsJ0kGNFwAW32PfN7Ad3a4X3nRd0K1cFRA0GSwYbw1qhmgqkY1nBy4ASNKbPpSsyj2Fd7ALUj3Kj2UFjVAMzlfqAIJj21dmDhNcsDUX7o/goCpaUHGH9C1jEgT0a11MuKTnk99D8bKY+qbrlJaNKFEpMuYqSzrhk4cTszCTuW1xNsmLueD3ouDbo4hnqmxjmHFR70KwqQdqAv0IAgKTux/IgrJ+AiwQEjzUwU
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.18.105
X-Mailcontrol-Refers-To: 416HHOCj124609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=+V28P8IBWGo1LkbWAaquK6b0AXood1VSkqbe9SqxMiw=;
 b=TeUHg8H6vsmDPjyOOJeci7VcAQFaJUgwufSDiT6XPJLS9R8knYB1G0A+rwVpqU6FxKTWCiZKVzBusnnhycd/HZKcu6q1ccMzUPUyHtlpG+6UrxrBQWgMc+R/WZUr9nCeVmMgLMWeJc7gfUx7qhFnyf5TF9f3Y24vi+QkVna2abc7Pz1eTaELaQ67OYONSmSV7ZOlqKkWrdWC9J6+e/DKFG2NjewkxsMZHNVCPKvU1lGWk3jBqKv3LePAPcrE0KwQt+HkGq+/xsARyQHt+nAM2l5J3HY25CZTA8x2AgLhZTVFLQ01nVfjTYSeATwcSWpcUsMxyGqLzSalUejaBtAAAA==
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

T24gMzEvMDEvMjAyNCAyMjoxNCwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOg0KPiBPbiBXZWQsIDIw
MjQtMDEtMzEgYXQgMjE6NTkgKzAyMDAsIEtvYnkgRWxiYXogd3JvdGU6DQo+PiBOb3cgdGhhdCB0
aGUgZm9ybWVyIG1taW8gaGFuZGxlcnMgYXJlIGZ1bGx5IHJlbW92ZWQsIHRoaXMNCj4+IGRlYnVn
ZnMgZmlsZSB3aWxsIGJlIHVzZWQgZm9yIG1taW8gYWNjZXNzIChyZWFkL3dyaXRlKQ0KPj4gdGhy
b3VnaCB0aGUgZGVidWdmcyBpb2N0bCBmaWxlIG9wZXJhdGlvbi4NCj4gU29ycnkgSSBkb24ndCBr
bm93IHRoZSBoaXN0b3J5IGhlcmUgb2YgdjAtdjUsIGJ1dCBvbmUgcXVlc3Rpb24sIHdpdGgNCj4g
aWd0LWdwdS10b29scy90b29scy9pbnRlbF9yZWcgd2UgY2FuIHJlYWQgYW5kIHdyaXRlIE1NSU8g
cmVnaXN0ZXJzDQo+IHdpdGhvdXQgbmVlZGluZyB0byBoYXZlIHRoZSBkcml2ZXIgbG9hZGVkIGF0
IGFsbCAoaS5lLiBzdHJhaWdodCB0aHJvdWdoDQo+IHRoZSBCQVJzKS4gV2h5IGRvIHdlIHdhbnQg
dG8gYWxzbyBwdXQgdGhpcyBjYXBhYmlsaXR5IGluIHRoZSB4ZSBkZWJ1Z2ZzDQo+IHRoZW4/DQo+
DQo+IFRoYW5rcywNCj4gU3R1YXJ0DQoNCkhpIFN0dWFydCwNClNvcnJ5IGZvciB0aGUgbGF0ZSBy
ZXNwb25zZSwNClRvIHNvbWUgZXh0ZW50IHdlIGNhbiB1c2UgaXQsIGhvd2V2ZXIsIGl0IGRvZXMg
bm90IHNhdGlzZnkgb3VyIA0KZGV2ZWxvcG1lbnQgbmVlZHMuDQpNb3Jlb3ZlciwgdGhpcyBjaGFu
Z2Ugd2FzIHJlY2VudGx5IGFncmVlZCB1cG9uIHRocm91Z2hvdXQgdGhlIHJlbW92YWwgb2YgDQp0
aGUgZm9ybWVyIG1taW8taW9jdGwgY29kZToNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTIzNDAzLw0KDQoNClRoYW5rcywNCktvYnkgRWxiYXoNCg0KPg0KPj4gU2ln
bmVkLW9mZi1ieTogS29ieSBFbGJheiA8a2VsYmF6QGhhYmFuYS5haT4NCj4+IC0tLQ0KPj4gIMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYyB8IDEyICsrKysrKysrKysrKw0KPj4gIMKg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGVidWdmcy5jDQo+PiBpbmRleCAwMWRiNWIyN2JlYzUuLjIxYjIyNTdhYTNhOCAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4+IEBAIC05OCwxMiArOTgsMjIgQEAgc3RhdGljIGlu
dCBmb3JjZXdha2VfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPj4gc3RydWN0IGZpbGUg
KmZpbGUpDQo+PiAgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPj4gIMKgfQ0KPj4gICANCj4+
ICtzdGF0aWMgbG9uZyB4ZV9kZWJ1Z2ZzX21taW9faW9jdGwoc3RydWN0IGZpbGUgKmYsIHVuc2ln
bmVkIGludCBjbWQsDQo+PiB1bnNpZ25lZCBsb25nIGFyZykNCj4+ICt7DQo+PiArwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAgwqBzdGF0aWMgY29uc3Qgc3RydWN0IGZp
bGVfb3BlcmF0aW9ucyBmb3JjZXdha2VfYWxsX2ZvcHMgPSB7DQo+PiAgwqDCoMKgwqDCoMKgwqDC
oC5vd25lciA9IFRISVNfTU9EVUxFLA0KPj4gIMKgwqDCoMKgwqDCoMKgwqAub3BlbiA9IGZvcmNl
d2FrZV9vcGVuLA0KPj4gIMKgwqDCoMKgwqDCoMKgwqAucmVsZWFzZSA9IGZvcmNld2FrZV9yZWxl
YXNlLA0KPj4gIMKgfTsNCj4+ICAgDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJh
dGlvbnMgbW1pb19mb3BzID0gew0KPj4gK8KgwqDCoMKgwqDCoMKgLm93bmVyID0gVEhJU19NT0RV
TEUsDQo+PiArwqDCoMKgwqDCoMKgwqAudW5sb2NrZWRfaW9jdGwgPSB4ZV9kZWJ1Z2ZzX21taW9f
aW9jdGwsDQo+PiArfTsNCj4+ICsNCj4+ICDCoHZvaWQgeGVfZGVidWdmc19yZWdpc3RlcihzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSkNCj4+ICDCoHsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHR0
bV9kZXZpY2UgKmJkZXYgPSAmeGUtPnR0bTsNCj4+IEBAIC0xNDIsNiArMTUyLDggQEAgdm9pZCB4
ZV9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gIMKgwqDCoMKgwqDC
oMKgwqBmb3JfZWFjaF9ndChndCwgeGUsIGlkKQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3RfZGVidWdmc19yZWdpc3RlcihndCk7DQo+PiAgIA0KPj4gK8KgwqDCoMKg
wqDCoMKgZGVidWdmc19jcmVhdGVfZmlsZSgibW1pbyIsIDA2NDQsIHJvb3QsIHhlLCAmbW1pb19m
b3BzKTsNCj4+ICsNCj4+ICDCoCNpZmRlZiBDT05GSUdfRkFVTFRfSU5KRUNUSU9ODQo+PiAgwqDC
oMKgwqDCoMKgwqDCoGZhdWx0X2NyZWF0ZV9kZWJ1Z2ZzX2F0dHIoImZhaWxfZ3RfcmVzZXQiLCBy
b290LA0KPj4gJmd0X3Jlc2V0X2ZhaWx1cmUpOw0KPj4gIMKgI2VuZGlmDQoNCg0K
