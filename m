Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1310CC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 10:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09A610E633;
	Wed, 17 Jan 2024 10:09:29 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8710E633
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 10:09:28 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly12d.srv.mailcontrol.com (MailControl) with ESMTP id 40HA9Pas176562
 for intel-xe@lists.freedesktop.org; Wed, 17 Jan 2024 10:09:25 GMT
Received: from rly12d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender dliberman@habana.ai) (MIMEDefang) with ESMTP id
 40HA9NUN176172 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Wed, 17 Jan 2024 10:09:25 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly12d.srv.mailcontrol.com (MailControl) id 40HA8ksU167802
 for intel-xe@lists.freedesktop.org; Wed, 17 Jan 2024 10:08:46 GMT
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by rly12d-eth0.srv.mailcontrol.com (envelope-sender dliberman@habana.ai)
 (MIMEDefang) with ESMTP id 40HA8jbF167319 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Wed, 17 Jan 2024 10:08:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1JMm0gR0uyJKfsk2GanHwM67bD6hKbn3IgrVJt/jXjcZOgObl1EKjX/rP6+SweFIfnup6TexFeFuC2it9nE51x242rr9qx7H7/zxitonr99lwPQhXS+CGPJZG33TRppUatfBRPkDEguhYRz0BaY4GKYQM4PqUa25huhl4H4MM1MO8I3ATWoaKroLoYuiBGazuHVKU5zScUSJBpBcA9Ok51YvfTCeEJONsmPvuV6QevUIESFoVOG0DDPPG5Y/iJAQY17DKMe83vt26nncuV+SZjSPM6Gi1py7D8sWpGvixdC2oRYlXyE4YFBdSr+Qlq7/2WCCwW/Eh83Jd5kyBOFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhCwR1pg3648pnXe5bLPBalLN8sczW1e+zMhebAYAQQ=;
 b=Q1Fs9TpPMv+LrbGdpTxU1ciLmj5V8DKH+JegHwgNqaJ+V1o/K9lxx6QrVjGMB24erjAR0X8yeAJcyRMODgxGRAuOHTtKfz7JJ4XKG7pMt1amahpxlGPkErpw347qeavk2EHV1nV/dqON7XwEUyTy6/X1ehZ1ox11Gryn/GY4aeBUlKtHR4bxpUQlGCXX4GP2PUPbUoMsfj6deVzXDnREZEj3MCuIYUUo4gmeULyyiK7idfMfTfMWsVJBfWssE4CyximsAWdh+YnER2+rhqa68haVFu0KIo5UpkumFEiRSH4w9IRe6CzXTRtEMOU2Tycz08cfw2T98BaJdvhfs2pNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhCwR1pg3648pnXe5bLPBalLN8sczW1e+zMhebAYAQQ=;
 b=L+08cQFikaUzLx3/sYe9Y43RLPQxUQ7iNXz+ADDIBWcUk2FHhcSGc2W4Zxo02nzjd8A0vv+jCUXD0nF3is0Tq+cnz8db1uWUerlyeO+76SEqwEkZ2hmgPnp5C55H8zfOjum3jUVHBtoiE+Twb+mEApQ8akphOHbhMcWd5Sj0pGwAv+7SxAXYJRwnWB8mzGH1AtxZik3EB4ZceaoXYUwSZAAlHkEj9NDgOpzEfpjsM/aMOwiCFA4/kz6Cks1Nha6KkjO4Er99wwQSujOfzelyW5Qzcn8Yw3TXCXg6/u8OSKq4R23WVnMU0Ho1SsrQ17pQXB7EgGwt0+MgB15Xbw7voQ==
Received: from DB9PR02MB9946.eurprd02.prod.outlook.com (2603:10a6:10:461::11)
 by DB3PR0202MB9204.eurprd02.prod.outlook.com (2603:10a6:10:429::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 10:08:43 +0000
Received: from DB9PR02MB9946.eurprd02.prod.outlook.com
 ([fe80::d9fc:5d73:317b:eac1]) by DB9PR02MB9946.eurprd02.prod.outlook.com
 ([fe80::d9fc:5d73:317b:eac1%6]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 10:08:43 +0000
From: Dani Liberman <dliberman@habana.ai>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/irq: allocate all possible msix interrupts
Thread-Topic: [PATCH] drm/xe/irq: allocate all possible msix interrupts
Thread-Index: AQHaSH0XWhuDno2dE06ED0xzwIJsuLDdEl4AgAC28wA=
Date: Wed, 17 Jan 2024 10:08:43 +0000
Message-ID: <27dc6fe6-12ef-4ea1-aa79-7562e0f7c853@habana.ai>
References: <20240116130736.1678104-1-dliberman@habana.ai>
 <hbmo7n4bzph5umwvza76svxb4uzo7pc534szbmen4u74wqbwc6@3swn4vsn4mfb>
In-Reply-To: <hbmo7n4bzph5umwvza76svxb4uzo7pc534szbmen4u74wqbwc6@3swn4vsn4mfb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB9946:EE_|DB3PR0202MB9204:EE_
x-ms-office365-filtering-correlation-id: bccc681a-6aeb-4fc3-ce2d-08dc17444922
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K5d4P5IB+MPcZ0pqy8QdPT5g7OqNq/BaASRkCnWA6GiVbqJ/BeNkZAKOpSf30DACRvICL5qz6Z1uoFTrMjg+jyIwVI9OFwle/sjyH5E6ZhZwa5DIYVuWXujhJhivwFZdeRzY2+NYnF8At1K5BNDJ24KOjvcSPM1MaoDE1JmV6FcVImygklYvXElhIl14j4OJ7XClYUhDW+OrD2tguwQX7FrgkOnePJWRsEJjGBUpO5ITzP4loYrLR2E663ZGseupBBXsX5cwE1Uq5mjUJHAQjCeU86K/3kz/ILx8yneAuHU5TWIiBj7o655rWPlzUYXCNr/YyXoDFhYkx1qCdKZN+6r+c8mXKfcD+dsz7fcbU+VDyWBXxu+6gu99lVlf9+CDpH/9grMItcWPLm75Lrwo5L+gxW0nhe0sow49kPEN4dRUo8KYUoTMlPyInGDN5hlnWC1XYrVK/yU2/7rkwNzcFKN4JDSukDlhVHScFybANO5Ego5c0PDnieBrdTMseGqcWHu4UCAFZAXKCnjTo3KzA/iJcFLh5Odj7mSBYmH1omu/681EnXaFqSVOOxhMnVv7j9U2Bm5HMQsexvuBJG2C/ex0OAZDuw+UfbrzY6LEYsPzr/is/ilPg1+2OYCMr6v9uPRjdIqSDXIebpGmDYDwzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB9946.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39850400004)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(122000001)(82960400001)(66446008)(6916009)(316002)(66476007)(66556008)(66946007)(76116006)(91956017)(64756008)(6486002)(478600001)(2906002)(5660300002)(8936002)(8676002)(4326008)(83380400001)(53546011)(41300700001)(6506007)(71200400001)(6512007)(26005)(2616005)(38070700009)(31686004)(36756003)(31696002)(86362001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU51dHdhOGYyY2tMM29xZCtlV2RwRjVwdWxLeStCZXRiWUVSVTU0STZ1R2Vs?=
 =?utf-8?B?MzZZZ2dOMDl4STZncllaM2VMWGFVdFp0RTBCdCswN3ROcVR4a2pmNndNd3cx?=
 =?utf-8?B?SHZEckNYVXNBR3JiRnFkaDhEcW1rRGZMTzA2eFVKMDJrdmFhbEFiK1gwazlh?=
 =?utf-8?B?RGFXaUNuTU12SUlKQVhPUXNNbFc1RDI4ZktGQ1orTWg2UWhHQjJUcysxVE9i?=
 =?utf-8?B?c2ZDMFBIaDlhMlVwR2p4T0I0b3RnazcwWmVtUS9xNXdjOS9acFVQenRsb0NR?=
 =?utf-8?B?N3VDN1IwT0h5S1BZZDJGMWM4N2xOTHp6YW1teEsxWnVtdHdtU25rR2tTemgw?=
 =?utf-8?B?NW9nbzJPWDY4Rk05NWdWNVJDYktXYWkzREV2NjhGc0t0NGR3OXMyWTc3VTdM?=
 =?utf-8?B?M3BEN3hGMkxJemxmbk9rVEUvVEJkUUFzaVRjQkVmMEsrM2NKQUFwY0V0UDhJ?=
 =?utf-8?B?blNtRUtVeHVVd1VkSzBHcGNWNUx1cXN1bDlUUFpoNVA3Qm43WU5xTjJrWWdU?=
 =?utf-8?B?cUt0SUtkbmRGNktXQ3ZycXlFZXlZWUpwcTc3UFlUMkE4ODdHSXJTZmZYOTho?=
 =?utf-8?B?VkNJNjJ3WE95VG1URUpuK3l0K0FmVlNFU3pqdWtKbWdmWG1yQmJYTXlMdHV6?=
 =?utf-8?B?S2pSV0F0cUVCRk52ZnZTODFsVmZLSjZoNUc5bXlURSthQXR4SGhrUHY4QVBk?=
 =?utf-8?B?R3dPeTVEeFcxTkM2cHNsd0dDa3BRVlViYmVOOFlJZGpIYi83dHhQS1lZRHFp?=
 =?utf-8?B?SzJrUDlHRjZJWHRod2JuejNBLzlmQkgrNkh5aFBsMEk2bnErUVd0dmNrdEFv?=
 =?utf-8?B?MlFFaXMzYmR1MnRtcFE4c29ORlQ0TXFnbUFldFdqTDhqMW5mUFJXWGdiVm9X?=
 =?utf-8?B?U3RoRTlITmYwWXBJU2R6MUNHUVd2TXlZZk9FV1lqNS9CZWdRTFB0ZDQxbzhV?=
 =?utf-8?B?QVE1djZMdVJpbUplcWR6QkRnWFFaWU9kSWdQL0Q2bDNhd2t2TWFjYnhGOWFz?=
 =?utf-8?B?bm5yakpUM2RDKzZXVjFuRlp1NHVlQll3ZEZrWFhQZjB5ZzBEWElhOTNjRWVB?=
 =?utf-8?B?NGtKa1pqU3Fvcmp6YmlzSEFzYUdTWG1tWHl0THA3U0JJS3lIeHl2UzU5UFQv?=
 =?utf-8?B?cHpDdVdNSjlucHN5QUFhZ2F2OUhaTkFNQ0cwNTFCTHpncFpWSUdRNGs2MTlY?=
 =?utf-8?B?azFSWnpZMnAzekkrYldwK0NRWXZhWEE3c1V6dzV2UDF0Y04yTktabzFyZmdT?=
 =?utf-8?B?c2kvNlc1ZXFWbDlUK3B0TlNHM1ZwY01ZWGRFclQ2UnhwZ3dVekx5Q3krSjF0?=
 =?utf-8?B?SktSSXErSGRMM0ljaG1xbUJ1bllENnBJd0xGNGZvQkhWWDJmdTZMY01hUXRB?=
 =?utf-8?B?OFBpUHh2dXhldFkxV0NCcVFERFdqUzVjamxRTXNENHBwdzY1V2p5RHgrdnJh?=
 =?utf-8?B?Z3lidjhvNHdqRkxnWkdCOVVFTzBHVEt4QWhIQ2U4NnlrQ0c1MXJWNEYvMFFJ?=
 =?utf-8?B?SklFSFgxU1FldmhydFdINndIMWU1amdGc3ZleXNpblM4VzNIaXVtSnJ4MzV3?=
 =?utf-8?B?VzFPTnhwa2QzSHVxUGFoYmF5UjBVUGlNbWNka3ZGR2toT1ZkSm9mYklzTnlV?=
 =?utf-8?B?eDQ2bmtaMGdMUHYwTm96SW9mdmc4bE84U3RXV2QxZ1VBME1vWWF5T0EyZUFB?=
 =?utf-8?B?THVMeXJkbTZNWEhxZlRrOVFUZHlEMGZsM0l2dUNwbE9RRmZnL2k2YzFmYzNl?=
 =?utf-8?B?QjRocFhzV3lRSlZPQjZYN0hiUFdpb1V0WDRieVoyVlJEMm1tdWVaUWFEUXMx?=
 =?utf-8?B?Q3JSV3VBVGpkaUpuaHo3emJ2cVovWGZMUnl6clBIaDdqcnJrUkZJNXJITWtG?=
 =?utf-8?B?S0dweEtkUGJvRDVxNGxEVTFSMGpXbDFyNm1obHZoanVWYlZZVlJGVUg2ZkMv?=
 =?utf-8?B?V0UvM2ZyWUIvdkZVMkFSRVdBODRiN0VlUGdZdXlhejNqd3pEYXNpZld1TTY5?=
 =?utf-8?B?anZDWlFHN011WWxpRVlHcDJIcy9zNHcrSTdseFdHSWt6aFJuemtEaTNGWEc2?=
 =?utf-8?B?RmhzN0hBczY4NFl5MGh6R0xWSDR6dnQ1bGk2cW1Hd2hPVHhnSEV3bWxHRWxM?=
 =?utf-8?Q?dhBA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDE2638C9B0650428A0A1AE1F376042B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AAy43I5sKlrPuEDMrRAlHVrFsoaj+WBKzteD+/YXawF0RcscOR33qG+YXEtGXAPuDgf9KgQjazHgIy+Mprj2ig5z0UehLymjfYqqwbR4DJYNHdHdHr3GHAhUDsv1QIsfNmDl8o2fts4qxL6Jqgjn58fCApwaJcwLeVdtRZetQYUDlE7yZVzt+ZQcJpkFy8CQ4LTu7C++k4Wm/2BK0GooDgCVlJBbxDSZOn3TXF+X08flbQr64dZBXMttLuo4ubCdjLiLIqPs0dkQ8Oz49zeaz1OcwKSo7bi+GvYzG9ILAj7ewkEfmiWF7bnZVcFOEOka8zJpmZ3ewFbalgj91/OEPwky6JYeSxhGCPiFKeMAUio9XK2Td1u97KfPWICkB01MQL3GfIC2HYAuweK6SNDGiDBciLCfeoGjpZQe+6Q3f4FjWTcSJw50Zl/l5gKsTy71ThKYYecsBTC0A+2BjKvISjwJM2R/xABoGSDDiTY7kT69YD/ESpvJOCgEHfjuh01i/NHoDFTr50/C90tzn0My9o+EwTC2v3YDuhaPYdY+J1/4MxYHRQR89KDbN7LCvS7tiFCvBPAbqNmV8DKva3Zykg38AnA7Ks5uWiHQ42ABg+wMmXKBcVjw8Nd8lKMjeSFI
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB9946.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccc681a-6aeb-4fc3-ce2d-08dc17444922
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 10:08:43.1797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /gpjKWgGGL4g9dJRm36SbUdMLQlPlxnnoqugxUz2AH6CmBl9yHEJ+pN6UWIIuvc5HMNqvn25HcO16lqe8ai9tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9204
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNTQ4NjE2NDpGUEtleTEucHJpdjrIQ/3e/cqYwBjAxcknYyCc0ZGQov+eTUukos+J2z/LgB5sMUFaVDyK5rtz73CGDFuHw9YWIBz2VBAH6iWRZT1uImCpeFoYs3kdv7zhq6MGkrdE5HOZdmbKVYLB0x/BhQosGYnLIJmqpE2GQepOL7FbwWnpQ1DG0g9j6yy5H7OOQlrN/eWLJBUhhDZhdXupmzYkLNJABcs9j166xJYwq8622YA77bg0xtv7eyT1Xb27U60p5wPzguDm8kYa5Vdp1nhuCuaFkoWAIWDDPqaU7JRiQYYgvQnbWNg900bE2K7SkH/5xBlge3uB8F3nk0EwX1tNx8iz33i8gghS56UHBMcQ
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.18.105
X-Mailcontrol-Refers-To: 40HA9NUN176172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=nhCwR1pg3648pnXe5bLPBalLN8sczW1e+zMhebAYAQQ=;
 b=C/6rGjzNOldsIDLBpO3LXCoJ3HBtV4HjTO6h9+He2YNxC9eozwNolXgev6ZjneTGZXI8JTjPd+EuluPNHnx5QE3pVZ/iQlvsAy2n+cp+ng1R6KDfxd6ZIRoZXjIH3hMErGCXTMjYv7W+tEIPJXmmvHQCQ4R5T4gjpj693XEeedhpE89UevSYz30zu6SZiaPfvORI5tet38t3JyYK1XO5owp6XoCJLQH75Pt8QEE1hwn0vptMGXfbtn2VMIWjbwro/395FWRWfZTEZ8UJL3fpqjbOy6HypN1OISw2JCytm2MsapQI2hErbO4bDfGQp9pU0je9FYOcqYGJwSxsmzoVzQ==
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMTcvMDEvMjAyNCAxOjEzLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+IE9uIFR1ZSwgSmFu
IDE2LCAyMDI0IGF0IDAzOjA3OjM2UE0gKzAyMDAsIERhbmkgTGliZXJtYW4gd3JvdGU6DQo+PiBG
b3IgZnV0dXJlIHBsYXRmb3JtcyB3aGljaCB3aWxsIHN1cHBvcnQgbXNpeCwgbmVlZCB0byBhbGxv
Y2F0ZSBhbGwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5eXl5eDQo+DQo+IEkg
dGhpbmsgdGhpcyBpcyB0b28gYnJvYWQuIElNTyBiZXR0ZXIgcmVwaHJhc2VkIGFzOg0KPg0KPiAi
SWYgcGxhdGZvcm0gc3VwcG9ydHMgTVNJWCwgZHJpdmVyIG5lZWRzIHRvIGFsbG9jYXRlIGFsbCBw
b3NzaWJsZQ0KPiBpbnRlcnJ1cHRzIi4NCg0KV2lsbCBmaXguDQoNCj4NCj4+IHBvc3NpYmxlIGlu
dGVycnVwdHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGFuaSBMaWJlcm1hbiA8ZGxpYmVybWFu
QGhhYmFuYS5haT4NCj4+IENjOiBPaGFkIFNoYXJhYmkgPG9zaGFyYWJpQGhhYmFuYS5haT4NCj4+
IC0tLQ0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jIHwgMTUgKysrKysrKysrKysrKy0t
DQo+PiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2lycS5jDQo+PiBpbmRleCA5MDdjOGZmMGZhMjEuLjYyNzIyODA5YTAxZCAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+PiBAQCAtNjYyLDcgKzY2Miw3IEBAIGludCB4ZV9p
cnFfaW5zdGFsbChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+IHsNCj4+IMKgwqDCoMKgc3RydWN0
IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KHhlLT5kcm0uZGV2KTsNCj4+IMKgwqDCoMKgaXJx
X2hhbmRsZXJfdCBpcnFfaGFuZGxlcjsNCj4+IC3CoMKgwqAgaW50IGVyciwgaXJxOw0KPj4gK8Kg
wqDCoCBpbnQgZXJyLCBpcnEsIG52ZWM7DQo+Pg0KPj4gwqDCoMKgwqBpcnFfaGFuZGxlciA9IHhl
X2lycV9oYW5kbGVyKHhlKTsNCj4+IMKgwqDCoMKgaWYgKCFpcnFfaGFuZGxlcikgew0KPj4gQEAg
LTY3Miw3ICs2NzIsMTggQEAgaW50IHhlX2lycV9pbnN0YWxsKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPj4NCj4+IMKgwqDCoMKgeGVfaXJxX3Jlc2V0KHhlKTsNCj4+DQo+PiAtwqDCoMKgIGVyciA9
IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhwZGV2LCAxLCAxLCBQQ0lfSVJRX01TSSB8IA0KPj4gUENJ
X0lSUV9NU0lYKTsNCj4+ICvCoMKgwqAgaWYgKHBkZXYtPm1zaXhfY2FwKSB7DQo+PiArwqDCoMKg
wqDCoMKgwqAgbnZlYyA9IHBjaV9tc2l4X3ZlY19jb3VudChwZGV2KTsNCj4NCj4gRnJvbSBEb2N1
bWVudGF0aW9uL1BDSS9tc2ktaG93dG8ucnN0Og0KPiDCoMKgwqDCoFRoZSBmb2xsb3dpbmcgb2xk
IEFQSXMgdG8gZW5hYmxlIGFuZCBkaXNhYmxlIE1TSSBvciBNU0ktWCANCj4gaW50ZXJydXB0cyBz
aG91bGQNCj4gwqDCoMKgwqBub3QgYmUgdXNlZCBpbiBuZXcgY29kZTo6DQo+DQo+IMKgwqDCoMKg
wqAgcGNpX2VuYWJsZV9tc2koKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRlcHJlY2F0
ZWQgKi8NCj4gwqDCoMKgwqDCoCBwY2lfZGlzYWJsZV9tc2koKcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiBkZXByZWNhdGVkICovDQo+IMKgwqDCoMKgwqAgcGNpX2VuYWJsZV9tc2l4X3Jhbmdl
KCnCoMKgwqDCoMKgwqAgLyogZGVwcmVjYXRlZCAqLw0KPiDCoMKgwqDCoMKgIHBjaV9lbmFibGVf
bXNpeF9leGFjdCgpwqDCoMKgwqDCoMKgIC8qIGRlcHJlY2F0ZWQgKi8NCj4gwqDCoMKgwqDCoCBw
Y2lfZGlzYWJsZV9tc2l4KCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRlcHJlY2F0ZWQgKi8N
Cj4NCj4gwqDCoMKgwqBBZGRpdGlvbmFsbHkgdGhlcmUgYXJlIEFQSXMgdG8gcHJvdmlkZSB0aGUg
bnVtYmVyIG9mIHN1cHBvcnRlZCBNU0kgDQo+IG9yIE1TSS1YDQo+IMKgwqDCoMKgdmVjdG9yczog
cGNpX21zaV92ZWNfY291bnQoKSBhbmQgcGNpX21zaXhfdmVjX2NvdW50KCkuwqAgSW4gZ2VuZXJh
bCANCj4gdGhlc2UNCj4gwqDCoMKgwqBzaG91bGQgYmUgYXZvaWRlZCBpbiBmYXZvciBvZiBsZXR0
aW5nIHBjaV9hbGxvY19pcnFfdmVjdG9ycygpIGNhcCB0aGUNCj4gwqDCoMKgwqBudW1iZXIgb2Yg
dmVjdG9ycy7CoCBJZiB5b3UgaGF2ZSBhIGxlZ2l0aW1hdGUgc3BlY2lhbCB1c2UgY2FzZSBmb3Ig
DQo+IHRoZSBjb3VudA0KPiDCoMKgwqDCoG9mIHZlY3RvcnMgd2UgbWlnaHQgaGF2ZSB0byByZXZp
c2l0IHRoYXQgZGVjaXNpb24gYW5kIGFkZCBhDQo+IMKgwqDCoMKgcGNpX25yX2lycV92ZWN0b3Jz
KCkgaGVscGVyIHRoYXQgaGFuZGxlcyBNU0kgYW5kIE1TSS1YIHRyYW5zcGFyZW50bHkuDQo+DQo+
DQo+IEZyb20gcGNpX2FsbG9jX2lycV92ZWN0b3JzKCkgZG9jdW1lbnRhdGlvbg0KPiBpdCBzZWVt
cyB5b3Ugb25seSB3YW50IHRvIHBhc3Mgc29tZXRoaW5nIG90aGVyIHRoYW4gMSB0bw0KPiBtYXhf
dmVjcz8NCkkndmUgcmVwbGllZCBpbiBhbm90aGVyIG1haWwuDQo+DQo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKG52ZWMgPD0gMCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2Vycigm
eGUtPmRybSwgIk1TSVg6IEZhaWxlZCBnZXR0aW5nIGNvdW50XG4iKTsNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPg0KPiBlcnJvciBkb2Vzbid0IHNlZW0gdmVy
eSBhcHByb3ByaWF0ZSBoZXJlLiBPbmx5IHJlYXNvbiBJIHNlZSBmb3IgdGhpcw0KPiBmYWlsaW5n
IGFmdGVyIGNoZWNraW5nIG1zaXhfY2FwIHdvdWxkIGJlIGlmIGtlcm5lbCB3YXMgYnVpbHQgd2l0
aG91dA0KPiBDT05GSUdfUENJX01TSSwgd2hpY2ggd291bGQgdGhlbiBiZSBFTk9TWVMuDQoNCldp
bGwgZml4Lg0KDQpEYW5pIExpYmVybWFuDQoNCj4NCj4gTHVjYXMgRGUgTWFyY2hpDQo+DQo+PiAr
wqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCB9IGVsc2Ugew0KPj4gK8KgwqDCoMKgwqDCoMKg
IC8qIGRldmljZSBzdXBwb3J0cyBvbmx5IG1zaSAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgIG52ZWMg
PSAxOw0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKgIGVyciA9IHBjaV9hbGxvY19pcnFf
dmVjdG9ycyhwZGV2LCBudmVjLCBudmVjLCBQQ0lfSVJRX01TSSB8IA0KPj4gUENJX0lSUV9NU0lY
KTsNCj4+IMKgwqDCoMKgaWYgKGVyciA8IDApIHsNCj4+IMKgwqDCoMKgwqDCoMKgIGRybV9lcnIo
JnhlLT5kcm0sICJNU0kvTVNJWDogRmFpbGVkIHRvIGVuYWJsZSBzdXBwb3J0ICVkXG4iLCANCj4+
IGVycik7DQo+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOw0KPj4gLS0gDQo+PiAyLjM0LjEN
Cj4+DQoNCg==
