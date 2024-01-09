Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2667C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 07:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BCF10E027;
	Tue,  9 Jan 2024 07:34:17 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77D10E027
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 07:34:15 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly15d.srv.mailcontrol.com (MailControl) with ESMTP id 4097YD6f279536;
 Tue, 9 Jan 2024 07:34:13 GMT
Received: from rly15d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 4097YCsp279064
 (TLS bits=256 verify=OK); Tue, 09 Jan 2024 07:34:13 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly15d.srv.mailcontrol.com (MailControl) id 4097XsjA273212;
 Tue, 9 Jan 2024 07:33:54 GMT
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by rly15d-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 4097XqvA272734
 (TLS bits=256 verify=OK); Tue, 09 Jan 2024 07:33:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo0cUhg/+b+sAysNMxR3yEEO2F/1jfepnc9fWg9W2CrZCyo5KObEEy+f1KoA+dTprBYfloG68c4bxXGoDqbhdLN7940iqyvJZnP/FuYVbzQZgZSewjxh7sDuS6ed2uk3kqCMvl774m65v/UHMKnOJRdc+pXZuWEdBQdUyVC9bzWlI50BD67+5eEvplS9urOAje2/x5sqXcB24mZpTlkB589xkNKzz6p8Rn0HrQOvXvLVoV9vtrVjGao9CEAd2ZMlOzJcfuEaNIE7Aeg/TZxmFB4M+hmot7a4Qd800ikbcpltlvsuCQ+3FtArnCmx+1vsOwROHGdbUDDVONZDVe2gzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLMRFbrnKydmNdgNG4J71/HX7uS29Ym2DXx8Uf5btyk=;
 b=aYHnrt5jhmKSXzodp4cmXOeBw23/qQsZOak5WdaSaWBD9nUG/gAG1rQjP2HztzLxbd3w1V4jPIKFbvGTQA1f4eZvIaFiUD1R3+tjW0m8jL7cb4ayfZ+zWPtCtE56tgkSH4hshUlNh42E0ODi6E7Sdx4oGreB8QgHbtsDlA+Wb3MAsD+1xVi9v8Z2gKcGwdqGa4WmrkYdkqqIKUxRijM2uox0tqDRFRq+8KHDGAmOFHTnvkdONn4A3yo/DK3MIvB3AkI1NZgVBbALTFU3GnDTpOMkMAPG11QLg6q1zn4Clz5TGocfmr3Pk3DPJdf2vT/YesUDbKV6E/Q9AHb5gLXyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLMRFbrnKydmNdgNG4J71/HX7uS29Ym2DXx8Uf5btyk=;
 b=hKqT6b44C9QjebSwEzAGH9O4SdaIxTTIYM8jsdnbRh3LT+mYCoPpzCPlPnBNwhE6gz+CuRxI5OpvItd+avEPv0VlaL1dW+7t5BGavCWQoF9VCF7yjvSoPl+RNbcYKeCbuvekB1E5vlYVYrprgy4l7TZKg6l85BfwS9dcwSYjo+HE/aUfTfDnIwGLChLjk0fDGUJdf1tr1iuNKB8/zD8pCoietGsj1R5Q+XDe+/Da7mz+xPRYOiArMmLi/mKhRWqtlw4cA9eTp+RAJsqZNadCKXwkOFh4T1W0P3HUl/KqYxZoRvpqh6UaFZxFYWxQ/8uTPgR4iyY2Ur66KGqXNqgysQ==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AS2PR02MB10101.eurprd02.prod.outlook.com (2603:10a6:20b:649::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 07:33:50 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::9d33:6bfd:8955:fb98]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::9d33:6bfd:8955:fb98%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:33:50 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Koby Elbaz <kelbaz@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl handler
 of the mmio debugfs file
Thread-Topic: [PATCH v4 2/2] drm/xe: restore xe_mmio_ioctl as the ioctl
 handler of the mmio debugfs file
Thread-Index: AQHaPhRHHgyPn2A/602drG1V0OTDGbDRIDaA
Date: Tue, 9 Jan 2024 07:33:50 +0000
Message-ID: <8dbb85f4-a02a-410e-9a1d-9dba14583261@habana.ai>
References: <20240103071243.1978967-1-kelbaz@habana.ai>
 <20240103071243.1978967-2-kelbaz@habana.ai>
In-Reply-To: <20240103071243.1978967-2-kelbaz@habana.ai>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AS2PR02MB10101:EE_
x-ms-office365-filtering-correlation-id: 4282392c-7116-4082-09ed-08dc10e552d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qtEfLVjvC6DYz3F1KV5TADb7a038XioTp7PdVtQS6hh0GvhkCV0scSRuImamCJ31P66m/cpOLrtbJXVs8GrXeebSHi4X13bM+rVJS8YYQlnELOnh9a4a9dKIBmKUJ5+IvYs6ji8UDZe4mpkJ8NTCq5fdVQb53h2kagrPL5382R6pKTi0d+vrJ4/Yh5C90L04TIEW54ozJk3GwWRLlWbT/dkjbyg26rWHuPLGDs8OvjTgCIH6xwlf0XLCezMKk+0CEIRw0+FWGf3VamD2YB31p4HrLhxaDf2jeWdPCLiTXoyMn2Eu7G3hyAElBUxu9M1mq+uVVjk7mH4iy+3Oz+BgRYzMQQVT8ZEgBws0R9mVSk2yBp1+JGOt7kcy+8F0OOWyP5a9M38W9Hi4hJ4mgjp3b2FZn+41C6vGwe3BNGvqGvF7sG1tFCVX41f2kYqdNztAdG7d7Gp5MBu60Iwc8k9K9/0ChogB8znrwRoOpJWSySQ8dXP+TAOo8oL2hAoVcnV4ZfAttIW1hRWHz1XvWGIu+xtXwVQ30Zx2cYrSyYzaXlGmPkeL6XF4ONQROR9BbwZ096aGPMl9d3oOPEfntJBN1rsIjoBCmSThNqsZKMV8gvqSrvGmIHa0dmAHUPEXGyaNgtqV1X7UyHIM/Q0paEwSe53aGEZSO1g6SsTeWSFntE4zjcdub9QkIFMRupfVzhD9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(6512007)(53546011)(2616005)(26005)(122000001)(38100700002)(8676002)(8936002)(4326008)(5660300002)(2906002)(6486002)(6506007)(478600001)(71200400001)(54906003)(110136005)(64756008)(66446008)(66476007)(66556008)(316002)(66946007)(76116006)(91956017)(41300700001)(38070700009)(82960400001)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjVDRXNpUUtSdW5DK1Z2SDBMdnNRVGZSOHlnSVk4bXBOWGhUeFAzNjdSU2VR?=
 =?utf-8?B?WStDWmpTSmFKQWRiejJDd01nZXlqZjRlNnE5R0VMWnVTT3VWcXFzczBRcE5j?=
 =?utf-8?B?SUFidlJyRWt1VGhJNHcyMG8rNGtIRG9tendnZTFrU1JSVEdNTmpuNVhiRjhS?=
 =?utf-8?B?YjQ2N095VzdJWDYyK080MWR0YUJEa3BmT1ZBWkh4dDRXbVJYWTZIanplV2k0?=
 =?utf-8?B?Y0wxVlpobDB0aUhPamRGT3RJOGZLenRCbjlYbEhsMGlSa3JRSGNvVlZCY29U?=
 =?utf-8?B?Tmk4UjhHSWpxdnl5ZUFTeTg4YzRtUThlUzJubHBwTnh5Y25FTHZmcWh3Ulkx?=
 =?utf-8?B?U0lVNmtLdHFydVFRWnhDWjdPb0xZZVhSWnh5YUpKcGdUaEN3ZTd5QmtCZ3NR?=
 =?utf-8?B?bVVmWlRBVnlLYThDMUt4d1VvaE4yWWpFMmwzVjJVZUlhbGxtSzhnMklseklM?=
 =?utf-8?B?eU0vRjFBeTh5SW0ra3FYYUptMmk5cy9EMW0wSVAyNlUyOTlzQ0VIbTRhVCti?=
 =?utf-8?B?Q2hjWXk3OGRzL1NnNElUc1U4Z0JhaVE4M3RQYzY4L1Uyc281WXZpY1ZrUWUx?=
 =?utf-8?B?dDUxd0tBVjhlYnptMXE5V1dBVXF6K3ZIR1Z4QW5xTlNUdkVTZGxyWTc0T28r?=
 =?utf-8?B?ZE9yQ2RndStIN2hJbHlTWjJmUThIUi9Ed0dlU096V0lJbHRYM2RDa1Nsangx?=
 =?utf-8?B?OVFtWko1bGtONkdFQWc4bmdXdjY1S2hVZ3U2Zi9CanJkd1Frc2x2Q0hHa2hG?=
 =?utf-8?B?VGcyUFBxT2dKYS9yT2l1V0Q4QnlqSWdBaTV0d1J3eSsxUkFrcUp0OXpKVnNh?=
 =?utf-8?B?UHIzZmFsSFlyUHJFMzQ2QUJnbjhsZVhiMDRoUitNMEduRk03d1c5aEczT2Rn?=
 =?utf-8?B?ampHWWJ6SnplOGdQMTdwUGM0ajJXck5PdVo0WmxCWlZCV09lcEJuWktvWGpZ?=
 =?utf-8?B?dmdOZzNZbWtYYmVRQmZmU01NYkVtWjBaeGlYb2JEQnE3SFAyR2JoN2ZpTTAz?=
 =?utf-8?B?THkxMHcxNGdqLzFGLytFVWtna21rRWlMNzhZM1NNc1R1bk1GSlJLUzN5TVI4?=
 =?utf-8?B?b2FFS1BXb3ZaemJWakhsTWROd2JSYmY0aGYzL1dQQWtrbFF6YkI3Y2xsWEN3?=
 =?utf-8?B?WFN2NHZVMkVmNFJoOHpUeCs0ZVRKSHdhN3pvYmRTVy9vVnJUZm9rZzAyaEp1?=
 =?utf-8?B?RXdiM2RhdERkZzVoT2NGMDJVWHBaalpJNVpsTmsxekkxejAvRlk1RWZhS1hh?=
 =?utf-8?B?WDdSS3ZHWkc4M0trekJRa2s4YmlxbUJqQUVtdklsdHBtblgvd2swQkNhWXhE?=
 =?utf-8?B?VHRyRFVlRFpaUHphQjBHZ0VYTHJQU3VKUHRGYkdPSGxhemJCK3NYTUxQT2JG?=
 =?utf-8?B?UHBzekVMVjRJUk53c0x6QWloS3MrNXdzdEpFZnh1ekYwTXJUVVJJWUZmMFpB?=
 =?utf-8?B?Y0R3RnozWE0vK2RUeUFocXJaTHNoa2xqdG5HV2lWa0p5WVpEUlhLMjZZNGFH?=
 =?utf-8?B?MnhKY0ZvSUdST1FVcTBHdzFlZytHOXdQbkRiUGlsYWJmTEd6STZQS2FqQkJY?=
 =?utf-8?B?ZUl0cHB4dnFYdjFHcjBDeFpBRGZzNmp6Q1Q3aW9nSXZ1UEREQk43SXlIbldW?=
 =?utf-8?B?TGlNdjhzS0JwcFBUOHNXTVd2M1NPYUR6MTBPKzQrRmNCUWREL1RoQTkvcjNj?=
 =?utf-8?B?SjkySkJqdWNDRWIxSDhPdVU2ZTFmOW9sK0FaWjk5VGMyQWlNQm5rR1Y1OERp?=
 =?utf-8?B?TUQ4R0FiRVA5c2x3TU5SNGM5bkpBM2JkR1A3ZFJpeDQyWEdPK013eE1mQStR?=
 =?utf-8?B?aG95RExwQjBqTTFlWmJrbFE4alEzRTZUbVcwcG9uSGF0V0l4bCsrNWpTWmdR?=
 =?utf-8?B?UFJONmlwMUZCK3VyOHFCWkx6YXRRUnVJekFuaXhFbmdtZlJmSWVib2dtTU9O?=
 =?utf-8?B?MlBRU3g0MGJwWmV4bE45aUZJNVRwY0lIejVwT0xkRjh4MmlwaXNMM2dYT1Bi?=
 =?utf-8?B?RDV3b1F4S1pBQjdjZTE4ZktOcFRxQ3ZCblhFSlVKcXk1Z2lPNi9sRkRwK1li?=
 =?utf-8?B?L2VJK3ZKZGVXL3piNzdyMzU3dGhuejlJU2R0Zy9INEZSQjFIeXVWeEtwYkND?=
 =?utf-8?Q?qCoU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A9573457E38C4B827E7CE314072FE6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xYwqkkeAtvmVNMjgoWtK7TRrHU9TDW8AER9eE4Ii87T0uaS2Hk2hxfzzBHo+HAClXKu9h9c48NIAhcaofloxy5e82zvV0XpcxrVPXVH62hZTz+Vfj5b18fulfbqf7qAlxGPwtB5U2PoyazjepFvNg15AqyGTZtA8hInXTLxsu3RsQIqEXW581P+Mn5NEXOBmwoXuVlI1J0XkdNDZ7VpWviTtwNUzUOs4ZmRM02rrfuuQTGYzwTDXM9YidEyLFzCaXYFtDSKyXc73rxvkL8a6EaVwFEnXHtWVl+m1loAmmdOTHfIzrSMygXS/Y5MzpD7O3TXaZEzumVT6J+tjNcAEYIaIIALhJCHFbCemfLGILflgn6Wux5dIG4KpwbSC64ZINvLhlQEoncuyiIJ23HJdOx/C0VMRIw1aqi820H1/yCAAUbPRR6TYoOIoC5oLCZ3UOAtcDNDtHrHySLg1ptctOlBftkGCM+Am8JiODH4Dt/1sZfLcDREIiWypCgoLBUgH8Hek1SLs3vYZuqSg0imMebybEbQwGM3lhHEjkODAXe1Ca2uLSlCv4YtmczSBYYKwnaUqj8NtbC6eevZvCaCCi+GFJDkl6ti+OiqUW99aGNsp5vsIf47PMUINehjUjX8F
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4282392c-7116-4082-09ed-08dc10e552d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 07:33:50.2391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5QxSXmngWTt3QyayRfCSm9cNPLc/8sqgMe7UIrHw6fT//SnkWaMOHgTmn8dv1o3VayRTS7SzMAATlPizeeYn2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10101
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNDc4NTY1MjpGUEtleTEucHJpdjqbgxN+QVFvWfPsKb7kKEzwBciMnw4R22oDzYhBdcsnqWD000QjsfdnZnBzq/5q5K5q8+Zcz1UaIzjG33lhqAqYfrtZA5ekzgH307qbBjNTG3VswGkJbM4UzgjX/gUI7D3PMvGSehinxC7ZEMryAr32FL4pjVhNKDJdizlSKg71s4e95hZOLC2MvsBDbq5KZGCqf1rGjFKFEUBN0lkKQAQ9CGMhgofOa0NQQVId2ZzAk42qqWOVW1SLoBQek9meWY3PSYkeFemsySJC0+HH9FcDHWPZXPAXaf9HNkyYsZZ5vzHxjtSrXkIZq5l7r1QTxjFSvvQcHf3LLoDLHWPuFXfl
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.17.105
X-Mailcontrol-Refers-To: 4097YCsp279064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=mLMRFbrnKydmNdgNG4J71/HX7uS29Ym2DXx8Uf5btyk=;
 b=qQrXC6giX5WbDw16fbVbGf/PhNPy8jrCGKvApn0nf12BrIW08+6pACCjKtnjqLoVgMxT/WIH6XihPyjFdw/DV4k/llisqsw0gIirB04xPspZEd8QwvRVD0ClK9yn4oqYbTAQzwB1AhqwwY1gpQeCkXpKBBj8Tq9qSi9huPhzyr+VM+lRjoayaAXWvr58A84AAZK8/IJq0LEqQ3/1H4nkZMnzd8zY/qFTSrGCOp0w6747bEZosNdkhtpxV9L6BbR8gDkmfalye9jYgW+2G9t7k3nrCOLZLF5dhoJOQLgifeg43gC4njfjXdD31w4Kzrls/zEm4A7phztSAlGxa+aOVQ==
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
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMDMvMDEvMjAyNCA5OjEyLCBLb2J5IEVsYmF6IHdyb3RlOg0KPiBUaGUgZHJtIG1taW8gaW9j
dGwgaGFuZGxlciAoeGVfbW1pb19pb2N0bCkgd2Fzbid0IG5lZWRlZCBhbnltb3JlLA0KPiBhbmQg
dGhlcmVmb3JlLCByZWNlbnRseSByZW1vdmVkLg0KPiBOZXZlcnRoZWxlc3MsIGl0IGlzIG5vdyBy
ZXN0b3JlZCBmb3IgZGVidWdnaW5nIHB1cnBvc2VzIHRvIGZ1bmN0aW9uDQo+IGFzIHRoZSBpb2N0
bCBoYW5kbGVyIG9mIHRoZSAnbW1pbycgZGVidWdmcyBmaWxlLg0KPiBOb3RlLCB0aGF0IHRoZSBu
b24tYWRtaW4gdXNlcidzIGxpbWl0ZWQgbW1pbyBhY2Nlc3MgKGFrYSwgd2hpdGVsaXN0KSwNCj4g
d2FzIHJlbW92ZWQgYmVpbmcgaXJyZWxldmFudCBhbnltb3JlLCBub3cgdGhhdCBhIHVzZXIgdXNp
bmcgZGVidWdmcw0KPiBtdXN0IGFueXdheSBoYXZlIHJvb3QgcGVybWlzc2lvbiB0byB1c2UgaXQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLb2J5IEVsYmF6IDxrZWxiYXpAaGFiYW5hLmFpPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jICAgICAgfCAxMDcgKysrKysr
KysrKysrKysrKysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNf
bW1pby5oIHwgIDQzICsrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNDkgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVidWdmc19tbWlvLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0K
PiBpbmRleCBjMjQ2MzdmZjA5ZDguLjUyNDU1ZTliNzFmOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGVidWdmcy5jDQo+IEBAIC0xMyw2ICsxMywxMCBAQA0KPiAgICNpbmNsdWRlICJ4ZV9kZXZpY2Uu
aCINCj4gICAjaW5jbHVkZSAieGVfZ3RfZGVidWdmcy5oIg0KPiAgICNpbmNsdWRlICJ4ZV9zdGVw
LmgiDQo+ICsjaW5jbHVkZSAieGVfZGVidWdmc19tbWlvLmgiDQo+ICsjaW5jbHVkZSAieGVfbW1p
by5oIg0KPiArI2luY2x1ZGUgInJlZ3MveGVfcmVncy5oIg0KPiArI2luY2x1ZGUgInJlZ3MveGVf
ZW5naW5lX3JlZ3MuaCINCj4gICANCj4gICAjaWZkZWYgQ09ORklHX0RSTV9YRV9ERUJVRw0KPiAg
ICNpbmNsdWRlICJ4ZV9ib19ldmljdC5oIg0KPiBAQCAtOTcsOCArMTAxLDEwOSBAQCBzdGF0aWMg
aW50IGZvcmNld2FrZV9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpm
aWxlKQ0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgbG9uZyB4ZV9kZWJ1
Z2ZzX21taW9faW9jdGwoc3RydWN0IGZpbGUgKmYsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVk
IGxvbmcgYXJnKQ0KPiArc3RhdGljIGludCBfeGVfZGVidWdmc19tbWlvX2lvY3RsKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgKmFyZ3MpDQo+
ICAgew0KPiArCXN0cnVjdCB4ZV9ndCAqZ3QgPSB4ZV9yb290X21taW9fZ3QoeGUpOw0KPiArCXVu
c2lnbmVkIGludCBiaXRzX2ZsYWcsIGJ5dGVzOw0KPiArCXN0cnVjdCB4ZV9yZWcgcmVnOw0KPiAr
CWludCByZXQgPSAwOw0KPiArDQo+ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZXh0ZW5z
aW9ucykgfHwNCj4gKwkgICAgWEVfSU9DVExfREJHKHhlLCBhcmdzLT5yZXNlcnZlZFswXSB8fCBh
cmdzLT5yZXNlcnZlZFsxXSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKFhF
X0lPQ1RMX0RCRyh4ZSwgYXJncy0+ZmxhZ3MgJiB+WEVfREVCVUdGU19NTUlPX1ZBTElEX0ZMQUdT
KSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCAh
KGFyZ3MtPmZsYWdzICYgWEVfREVCVUdGU19NTUlPX1dSSVRFKSAmJiBhcmdzLT52YWx1ZSkpDQo+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJYml0c19mbGFnID0gYXJncy0+ZmxhZ3MgJiBY
RV9ERUJVR0ZTX01NSU9fQklUU19NQVNLOw0KPiArCWJ5dGVzID0gMSA8PCBiaXRzX2ZsYWc7DQo+
ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+YWRkciArIGJ5dGVzID4geGUtPm1taW8uc2l6
ZSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBUT0RPOiBhbGxv
dyBkaXN0aW5jdGlvbiBiZXR3ZWVuIFhFX1JFRyAvIFhFX1JFR19FWFQgdG8NCj4gKwkgKiBoYW5k
bGUgcmVnaXN0ZXJzIGZyb20gYm90aCBNTUlPICYgTU1JT19FWFQgc3BhY2UuDQo+ICsJICovDQo+
ICsNCj4gKwkvKg0KPiArCSAqIFRPRE86IG1pZ3JhdGUgdG8geGVfZ3RfbWNyIHRvIGxvb2t1cCB0
aGUgbW1pbyByYW5nZSBhbmQgaGFuZGxlDQo+ICsJICogbXVsdGljYXN0IHJlZ2lzdGVycy4gU3Rl
ZXJpbmcgd291bGQgbmVlZCB1YXBpIGV4dGVuc2lvbi4NCj4gKwkgKi8NCj4gKwlyZWcgPSBYRV9S
RUcoYXJncy0+YWRkcik7DQo+ICsNCj4gKwl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0K
PiArCXhlX2ZvcmNlX3dha2VfZ2V0KGd0X3RvX2Z3KGd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+
ICsNCj4gKwlpZiAoYXJncy0+ZmxhZ3MgJiBYRV9ERUJVR0ZTX01NSU9fV1JJVEUpIHsNCj4gKwkJ
c3dpdGNoIChiaXRzX2ZsYWcpIHsNCj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fMzJCSVQ6DQo+
ICsJCQlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdzLT52YWx1ZSA+IFUzMl9NQVgpKSB7DQo+ICsJ
CQkJcmV0ID0gLUVJTlZBTDsNCj4gKwkJCQlnb3RvIGV4aXQ7DQo+ICsJCQl9DQo+ICsJCQl4ZV9t
bWlvX3dyaXRlMzIoZ3QsIHJlZywgYXJncy0+dmFsdWUpOw0KPiArCQkJYnJlYWs7DQo+ICsJCWRl
ZmF1bHQ6DQo+ICsJCQlkcm1fZGJnKCZ4ZS0+ZHJtLCAiSW52YWxpZCBNTUlPIGJpdCBzaXplIik7
DQo+ICsJCQlmYWxsdGhyb3VnaDsNCj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fOEJJVDogLyog
VE9ETyAqLw0KPiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18xNkJJVDogLyogVE9ETyAqLw0KPiAr
CQkJcmV0ID0gLUVPUE5PVFNVUFA7DQo+ICsJCQlnb3RvIGV4aXQ7DQo+ICsJCX0NCj4gKwl9DQo+
ICsNCj4gKwlpZiAoYXJncy0+ZmxhZ3MgJiBYRV9ERUJVR0ZTX01NSU9fUkVBRCkgew0KPiArCQlz
d2l0Y2ggKGJpdHNfZmxhZykgew0KPiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT18zMkJJVDoNCj4g
KwkJCWFyZ3MtPnZhbHVlID0geGVfbW1pb19yZWFkMzIoZ3QsIHJlZyk7DQo+ICsJCQlicmVhazsN
Cj4gKwkJY2FzZSBYRV9ERUJVR0ZTX01NSU9fNjRCSVQ6DQo+ICsJCQlhcmdzLT52YWx1ZSA9IHhl
X21taW9fcmVhZDY0XzJ4MzIoZ3QsIHJlZyk7DQo+ICsJCQlicmVhazsNCj4gKwkJZGVmYXVsdDoN
Cj4gKwkJCWRybV9kYmcoJnhlLT5kcm0sICJJbnZhbGlkIE1NSU8gYml0IHNpemUiKTsNCj4gKwkJ
CWZhbGx0aHJvdWdoOw0KPiArCQljYXNlIFhFX0RFQlVHRlNfTU1JT184QklUOiAvKiBUT0RPICov
DQo+ICsJCWNhc2UgWEVfREVCVUdGU19NTUlPXzE2QklUOiAvKiBUT0RPICovDQo+ICsJCQlyZXQg
PSAtRU9QTk9UU1VQUDsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArZXhpdDoNCj4gKwl4ZV9mb3Jj
ZV93YWtlX3B1dChndF90b19mdyhndCksIFhFX0ZPUkNFV0FLRV9BTEwpOw0KPiArCXhlX2Rldmlj
ZV9tZW1fYWNjZXNzX3B1dCh4ZSk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+
ICtzdGF0aWMgbG9uZyB4ZV9kZWJ1Z2ZzX21taW9faW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsIHVu
c2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQ0KPiArew0KPiArCXN0cnVjdCB4ZV9k
ZXZpY2UgKnhlID0gZmlsZV9pbm9kZShmaWxwKS0+aV9wcml2YXRlOw0KPiArCXN0cnVjdCB4ZV9k
ZWJ1Z2ZzX21taW9faW9jdGxfZGF0YSBtbWlvX2RhdGE7DQo+ICsJaW50IHJldDsNCj4gKw0KPiAr
CWlmIChjbWQgPT0gWEVfREVCVUdGU19NTUlPX0lPQ1RMKSB7DQo+ICsJCXJldCA9IGNvcHlfZnJv
bV91c2VyKCZtbWlvX2RhdGEsIChzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgX191
c2VyICopYXJnLA0KPiArCQkJCSAgICAgc2l6ZW9mKG1taW9fZGF0YSkpOw0KPiArCQlpZiAocmV0
KQ0KPiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKwkJcmV0ID0gX3hlX2RlYnVnZnNfbW1p
b19pb2N0bCh4ZSwgJm1taW9fZGF0YSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0
Ow0KPiArDQo+ICsJCXJldCA9IGNvcHlfdG9fdXNlcigoc3RydWN0IHhlX2RlYnVnZnNfbW1pb19p
b2N0bF9kYXRhIF9fdXNlciAqKWFyZywNCj4gKwkJCQkgICAmbW1pb19kYXRhLCBzaXplb2YobW1p
b19kYXRhKSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4gKwl9IGVs
c2Ugew0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+
ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNf
bW1pby5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWRmYjhmYTJjZTlhDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfbW1pby5oDQo+
IEBAIC0wLDAgKzEsNDMgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8N
Cj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICov
DQo+ICsNCj4gKyNpZm5kZWYgX1hFX0RFQlVHRlNfTU1JT19IXw0KPiArI2RlZmluZSBfWEVfREVC
VUdGU19NTUlPX0hfDQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0vZHJtLmg+DQo+ICsNCj4gKyNkZWZp
bmUgWEVfREVCVUdGU19NTUlPXzhCSVQJCTB4MA0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9f
MTZCSVQJCTB4MQ0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fMzJCSVQJCTB4Mg0KPiArI2Rl
ZmluZSBYRV9ERUJVR0ZTX01NSU9fNjRCSVQJCTB4Mw0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01N
SU9fQklUU19NQVNLCTB4Mw0KPiArI2RlZmluZSBYRV9ERUJVR0ZTX01NSU9fUkVBRAkJMHg0DQo+
ICsjZGVmaW5lIFhFX0RFQlVHRlNfTU1JT19XUklURQkJMHg4DQo+ICsNCj4gKyNkZWZpbmUgWEVf
REVCVUdGU19NTUlPX1ZBTElEX0ZMQUdTIChcDQo+ICsJWEVfREVCVUdGU19NTUlPX0JJVFNfTUFT
SyB8XA0KPiArCVhFX0RFQlVHRlNfTU1JT19SRUFEIHxcDQo+ICsJWEVfREVCVUdGU19NTUlPX1dS
SVRFKQ0KPiArDQo+ICtzdHJ1Y3QgeGVfZGVidWdmc19tbWlvX2lvY3RsX2RhdGEgew0KPiArCS8q
KiBAZXh0ZW5zaW9uczogUG9pbnRlciB0byB0aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwgaWYg
YW55ICovDQo+ICsJX191NjQgZXh0ZW5zaW9uczsNCj4gKw0KPiArCV9fdTMyIGFkZHI7DQo+ICsN
Cj4gKwlfX3UzMiBmbGFnczsNCj4gKw0KPiArCV9fdTY0IHZhbHVlOw0KPiArDQo+ICsJLyoqIEBy
ZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+ICsN
Cj4gKyNkZWZpbmUgWEVfREVCVUdGU19NTUlPX0lPQ1RMX05SCTB4MDANCj4gKw0KPiArI2RlZmlu
ZSBYRV9ERUJVR0ZTX01NSU9fSU9DVEwgXA0KPiArCV9JT1dSKDB4MjAsIFhFX0RFQlVHRlNfTU1J
T19JT0NUTF9OUiwgc3RydWN0IHhlX2RlYnVnZnNfbW1pb19pb2N0bF9kYXRhKQ0KPiArDQo+ICsj
ZW5kaWYgLyogX1hFX0RFQlVHRlNfTU1JT19IXyAqLw0KDQpGb3IgYm90aCBwYXRjaGVzLg0KDQpS
ZXZpZXdlZC1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPg0K
