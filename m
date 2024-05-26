Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DCAC25B75
	for <intel-xe@archiver.kernel.org>; Sun, 26 May 2024 13:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E287F10EAD3;
	Sun, 26 May 2024 13:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="KztjS2t4";
	dkim-atps=neutral
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F1810EAD3
 for <intel-xe@lists.freedesktop.org>; Sun, 26 May 2024 13:11:40 +0000 (UTC)
Received: from rly11d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly11d.srv.mailcontrol.com (MailControl) with ESMTP id 44QDBVR6033212
 for <intel-xe@lists.freedesktop.org>; Sun, 26 May 2024 14:11:31 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly11d.srv.mailcontrol.com (MailControl) id 44QDAsef014785
 for intel-xe@lists.freedesktop.org; Sun, 26 May 2024 14:10:54 +0100
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2232.outbound.protection.outlook.com [104.47.11.232])
 by rly11d-eth0.srv.mailcontrol.com (envelope-sender fkassabri@habana.ai)
 (MIMEDefang) with ESMTP id 44QDAk5e010184 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 26 May 2024 14:10:54 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StBFzOJatyODlCBX+zks8Mqw7W0jjuiUzNFMwXY0UtOf5E6Vd4AA/fFd6wskHYQaYBMhr3mPpIl4YKVIPMYWzKG5bkKfCacrOt6u70339LQl2+YaKC75ywTB7D5Vx7RwtLP7cMW/vq1xXClhYw/V/ofzcPNPyb0eSIc7r0mQf3pdpJps/d6rg0hqtLBTlwbtHeNtCwRtgB4uEIM5e/VbeO4Jds1k1iNKjFfVC/O5a291lW4w6X8p4VGj5KuXu7yTO0Kj6QEF5oX3LJSwHVx2gjwRE7yZtVY3RC7lPaAtIa0sfNBIas3rxM1wF1i79G9vXJT9NE6F3NjLnTDLzAXR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcQECSsN0fHgrjDnS0KZI24487pHc8u+PogGiYzuySY=;
 b=AB7Xpwk9kaJN/kwSb56Lq0EnSbw78R/FUqF7suAVB/NrPNofkdBj5bO9h/TylFpT1NNYuS9hJ9yLzI21RcFsKT3p0OTpmbpaB7TEAfyYQpUOY5aH67GFkZRaM6MgJRurMQdEwdlaG/FBlxuitqPo6AXag/DFD/5pPPvAFC4LzaqV+5rJF9pmuk7lcizBLhqEeWtKxJj96rPmhwdbTnHZP9hwlcj8imW2cspXHjQXVwqFyRfbCEXN/1CMQWTNgv7aBU3rBjhRu69fn1eKZmrEHE8tjm/A7EemdkiPxi7LEyOcuz8GWuKCQ4Zk9uDVA+88dkz2ReJe1osnlbojvVE2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcQECSsN0fHgrjDnS0KZI24487pHc8u+PogGiYzuySY=;
 b=KztjS2t4qzZimxi99Ry0yLeBKxRU2X9K5MHTKg++UcEI9QuhHImyMkCojDJk5SWVoVdv6O7Nl+tqp2p8xmPwZ9DuU0YvmWRp3ltq/gJJ4EYBMzFQEbv8CzXc7FfYIjQ65wewFovpzmXrMgq6sumPFgLuQwwOorIn8wqf2m9eVyXxPKCk319yo/mAGTxfwvlWR0t2OQAuds9vB+sag4UEeqx4ezLVjuLCMPy+DqQb0xjzp9CX2zv8wUnO55KZcfIZtk034AhZ5NQ8uotvfkdVGntZXgOS2haaIIRNmZcMz/L67J3I5q6TbX8u6ZbyH/ylK+AkJmxpfvoXgEo+sRemWg==
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com (2603:10a6:208:fe::20)
 by AS8PR02MB7093.eurprd02.prod.outlook.com (2603:10a6:20b:2e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Sun, 26 May
 2024 13:10:44 +0000
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::157b:473:91f9:cacc]) by AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::157b:473:91f9:cacc%6]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 13:10:43 +0000
From: Farah Kassabri <fkassabri@habana.ai>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH] drm/xe: Add device CXL capabilities identification
Thread-Topic: [PATCH] drm/xe: Add device CXL capabilities identification
Thread-Index: AQHar1gC2KKHJwMuwEey5pP3bYc+57GpfYqA
Date: Sun, 26 May 2024 13:10:43 +0000
Message-ID: <95df096c-58b3-48d4-9055-eb89baaed2d4@habana.ai>
References: <20240526082405.658908-1-fkassabri@habana.ai>
 <af704f09-d34b-443a-be00-4764720ec743@intel.com>
In-Reply-To: <af704f09-d34b-443a-be00-4764720ec743@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB5235:EE_|AS8PR02MB7093:EE_
x-ms-office365-filtering-correlation-id: 04544fd3-93e4-418d-53b0-08dc7d854010
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?cDRCVjc4OGJsK3BCN0Z5ZVJxZUFkcEFJeUtENnpoTUZlR2NKbXlITmpwU2RK?=
 =?utf-8?B?QUEzV05Ld0pkNTlvejRkbWVsY0hZRk05a29yM21BT2dQWTJCc3p3VTZYYWJW?=
 =?utf-8?B?NnkrSVlpaTcvdGpZRzZiTGJSWXVPaDlIcjBxWmR3L1VManFscndvdVhIUmFx?=
 =?utf-8?B?RTdyOHJXUnRuQTlua2E1aTBPWjJnNnBNN1FhcVN3ak9zTXluSEk4Z05GTVpk?=
 =?utf-8?B?VmM1bXhZVVlnMyticUhOUGh1bysrNUpPRGJ5TTg3ci84dkdJNTUzb1VRdlY1?=
 =?utf-8?B?RzZsZnF2TGJVd3FnOVpTL3k1ejZjUjM2OHlqZ2xKM3BMKzllaWZ2REdkcmdv?=
 =?utf-8?B?dFdPTVBWSkJXWHQ1R2tEQm5DelR4dkJCZU9TdnlySHYxZVlVTlAxcVBUN2lN?=
 =?utf-8?B?OXl0NlNmeDVLNWVQeWFjTi9DU2pSSmxlRjZnSkx6NkRuTEkxRjV2MzQxMSsx?=
 =?utf-8?B?TDZUZ3pWV1dRTnNqYldPaG1IZHljNHp0QTdRRlRVVWFoZnpIQmJYV1QrdnY4?=
 =?utf-8?B?TXNOa1FHc2VxRXlISmtSVTRMNHRLK1g0YUE5RVluOVAzUDJnWVI0TlN1UjRS?=
 =?utf-8?B?eU5DTmtlR1ZEemhlWTZsaGppMFlDNThGaFN0cno0eWVzRCtjdWVsZitqeVMy?=
 =?utf-8?B?azJ6bzBxZ3NjZHJBcEJJc1JIVnkyWWZFYmFXMm1kTmtQQURDMU9HSlJGRFV3?=
 =?utf-8?B?d0xYbDQ3R1hNNUlZNHFLR3hFNDFYd3lKNG5pNSs4S292MnlVT3ZMMSt5VDhr?=
 =?utf-8?B?dnI1citQTXg3ZE9sbzlyangyZDlHUkFZZ3Z3KzlwT0JnTENUQXJKK0hLa21s?=
 =?utf-8?B?ZWJPRy9laU0rTllyeEtURjI0YjRPeU0xNzVvaG9hYURSQ0ZHTkhYSGV2d21G?=
 =?utf-8?B?bUQzVVR1QTVITXdUMHVmMDZGK3pia0cvWUV2T01BbzhQM1hhL1JtNjZlcmFW?=
 =?utf-8?B?Q1hicWJzR2ZYb1FGTnFDOFJnczNqZ09oSWp5bkc3R3p5em9rbVJJT3dLUGpC?=
 =?utf-8?B?YlN0eWxRWnoxQmtXMlkxTzVPbW10MWJxOEkrUTljMWlxMjROV1N5ZGRVdXFV?=
 =?utf-8?B?RDdNT2s1akM0SWJCQTZJdmlrcXBYSm1rcWlxZFRobEpRbFdobTNKODVkekFD?=
 =?utf-8?B?NDRuMGtrWk5kckxNK1JHenRicU54NDlQVWEzNHZlZ01GcDBtaHJ0NEgremxW?=
 =?utf-8?B?bkRnd29CaVdEamdGN242MXl1VjJkUDREOGF6M2ZNbFF1TVA0Z3JsTFhaR2hu?=
 =?utf-8?B?K0NiQmJQRW9wMDJKTEs3ODc2MWdxeFRwa0JDZ3Y1TDJHRlJ0NjhDZzIva0tU?=
 =?utf-8?B?R1B4RzFodXFzMlA1aGZNNTE1SEVwOFp6dGNpN2g5ZnhmQmFFVmZkYXdEdTI4?=
 =?utf-8?B?MnNqZC9ObWVUZ0IzbkJtWkRTQkZnTXNJQjlCeDR0QnVuMXRaTDdlT1d4NVpx?=
 =?utf-8?B?akRPSVQ5dm5wK3I5RGxTV25OYnhOVHlDVzZnSjNpUjk2Y1dTZmRkMnVObXI5?=
 =?utf-8?B?ZzhuM1J5RVFSV1RTQ2NncE5yNmN1eVg0ckdxVXltdjVTRnVlY01WT0UvTC9r?=
 =?utf-8?B?ZEowNVlnQ0llcnN2TXJBY0dWZzV1UzlCZHVwdFc3Mlpjd3FVREhNaW15R2lY?=
 =?utf-8?B?YWpqM3R3NFROSDBHNHU3N2NPY1RleWJmZWFQNm4xZDFFYUlDckdNZjVtUkRh?=
 =?utf-8?B?QmZKT01QZE9mZWhiZTNROENEN0FBMGM2cVlvL0o0OXRMQUgvNTducC9ybWpD?=
 =?utf-8?B?UVQwUStpNkhKSjVROUZzR3FGbDJ0UzFVTkk4Q2MrUFNXeVVCTXc0N2ZVd0FR?=
 =?utf-8?B?SWlWVERVVjBpTkw3VWlmUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB5235.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TCtDQ2RTV0pERFZqQk9WWWxKNVRQam5BVE5DWjU1VHB2LzJVRlJpVWxpWTRV?=
 =?utf-8?B?Y0E0NDZOcHRIekdldkJZTUprVzJXa1J0YnFWVE1NRFpRQnhMOGU2eDZrNWo1?=
 =?utf-8?B?WW0reDJOVWErVVpUNFRBckZTVzBaK1JYOFpSYXdVOG85dHVyTG1LMmlZYUIx?=
 =?utf-8?B?RFlpRThpU2J4Y01FMEF0QmR6aG01OHlVVnZjVjZsZTJZWERrQVhXRHRaODlu?=
 =?utf-8?B?am1LbUVCb2l0dVBxR2xLRXovMi94VkpiVEJhUnl1ZTdpcjlEdmovRy81c0xw?=
 =?utf-8?B?OUtnN0xnb215VitlYWdPVFdUM3BQck03QXFpdmJzbHJIVCtnaFZGd1JQNUVB?=
 =?utf-8?B?ZUIxNXN2RTZYS1Rtdi9NNzYrNkE1aDQrZUdzVzFqQkIwc2Y2Qm1mNFY3VmI1?=
 =?utf-8?B?Y09vbVRsdFhyUTZycDZwTTBkMHptVVNvZzd5NjJkK01SWk1lRlBXTHhkNmNa?=
 =?utf-8?B?alRKd0pDOTQvS3JaZWVPSlZyMXoxYmFFUU9ENkcwaENZb0dHOUxnT0lNVmxB?=
 =?utf-8?B?SHQ3T0hzYjZsTkFuTW1oOExjSnVORHlkdWhCSWtjOWZIQmUxZmREY1B2eWpp?=
 =?utf-8?B?UFZWcGVCRE9ZTUNCSzIxYjhtU3E4MlZTT1FUMjhGOG8rVDF6TjQ5QTJGSFZJ?=
 =?utf-8?B?SlBSYzgvUS90SWlFM2N3SUlEVUg3S2kwb21ta2JXbm5ZUDdLRnZOUlkwZzVp?=
 =?utf-8?B?ZmJ3RGlMbmV6RVlTN25aNEZWQnA1N3hFeGo1RjRQNXFWbVppUEVoT3FRM1Ax?=
 =?utf-8?B?UUpPSGc0bm13RUxnY2ZHYk9KMVpLUHdWcHc0YWVjaUU3eE0rQ1VWalkvdkhQ?=
 =?utf-8?B?TnFla3ROWkRxY2lGbjN6cjI3Q2Q4MFcrWGMxZ0tkRVdNN1FlRXVzNjRDcThM?=
 =?utf-8?B?Ukx0MnQ4V0RkL0lHbHR5c0l3bXcrY2tNUDVMK25wdnFsRldTSVJYYVJheFFt?=
 =?utf-8?B?MERiRXpwc0xGeU5EOE1IeklYM1pxUFlTbkNoUG41QWxadnNpRXV4TUlLeVVr?=
 =?utf-8?B?NmtNMnlNYzd0TkRLRnN3Z01KZFFJUnpNZSt2WXdXRmpBMnFQWDgyR1l6QlhJ?=
 =?utf-8?B?clpaNWN4b2l1K3Z6VTFYWHhEeUxqbEkzQ25iTkNzM25TVGhJVzlmOVUyUzFJ?=
 =?utf-8?B?am1OMW1nY050YmY2L0oySjk2RWJkVU1NWGVPQmEyYTQrK0x2U25vMDdCZUpB?=
 =?utf-8?B?NG1TanhPeDhWU0lNQTUzQzF5N0FmZWVseVhMbFpYaDZkWlJKZUJJYzN5RmR5?=
 =?utf-8?B?VmxlV0E5TStPMGxkVUs5VU44eHBHdEZDR0xHaE5WQkdLSmNORTNVVEg1dGZC?=
 =?utf-8?B?VU1zZllic251MXMvSnkvdW5WQWtMUXp1VHVxN0NCNUZGZkFOaXB4NFNmRTFO?=
 =?utf-8?B?ckh4UVAxTGxQNGxaMGdicUI2Znl1eGFPZmhlT3B1K0RCSFV1bVcwdlFNTk0w?=
 =?utf-8?B?ZVBZT1JHaG52M0R1SGdZN3BYc0xZdFo0SjBGMENPUTRsK2NZMGlGQ0R1NUI4?=
 =?utf-8?B?REVHWUl4UndIM3NDZGVUTXFYN2xteXgzbm95SnhyUElRQ1R2aW96S2NsYlVn?=
 =?utf-8?B?UVQyRDFHNnVKNFAxcFRqc3ZpWU5KNmZrTWhyZU1NQUQ0cEZlTjVPVy8rSGEy?=
 =?utf-8?B?dVFGQmJ6NUdzM0JSc3V4NHFKb25UY1h5Q0o2RUxtdjByTE8wRE9EZkw1MWFI?=
 =?utf-8?B?blUyeDdobWhPb25ieXBXRzJmR01pWFY0Z0d5OVFiZ1YvYzJ1RzcyUE04Y1NO?=
 =?utf-8?B?RXp2bE5LSDBjWkwxZUpEcDA5enpFN0dnR1ppSENtbUFaL0IvRnVITU1qNmdl?=
 =?utf-8?B?VWlSRzkvZ2hsV1A1OFB4RktxYVpFSDBGUklpZ3ZLV21hZmRROGx3ZnJodDdB?=
 =?utf-8?B?TGZZa2ZGbU43TVlSdjNGaE5STlcvbnJiQ20rUlRUcGJGWWoxb1VybmJqd1hG?=
 =?utf-8?B?bEpoK1ZJdE5ZZ1FhY1dCREh5RTR1aG1SdVk4cmRtL2J3RzZXRXV5UXplWGsw?=
 =?utf-8?B?aHRmUmdONTJiTmRkaiswZUVtVjJVZXVtcUlqczRyUitENlNIMng0cldhcHZN?=
 =?utf-8?B?U1I4b3RUUHJ0YkFsL25QNEdsT3MrVVBKNTAwSUEyTlNvQ2FxaUFNL2VQV0Rn?=
 =?utf-8?Q?2eKlQdj59JEbB4Q/d2aQ2QUuk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C00D9EC683060744931D950457183472@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Dgh5hvbrDqeff1vjD8X/csHBrk8djnOyoXnraP/iLmZj86VMBh4NtzvqLZfpxKoCueOOYaiXLcwFE7wVmpWIZpIdhEKye/rSaaHTd+4ldAogsH2WNN7c0CyxKNrNeyqtPkE0rlOVa/b0OB6+w0xDfyRyUokoiqsVh4VxQogU0kEt/EZmfMdemyIKMF+4YH5FHJYkM+dP7fpPY/T/e68L2f62IHJapi/PFOtESnUlocOHndQGGgry9JThDquZHbtkeFA5PbRq8cK56J8OAS2/ngbM7cuWEa0yUmso44LbbMswPbb7LKf90eQ9MFsHE8F0MBqzFtTWWJPWA3vrWO/3LvJ8xDGftuAQFt7kMDAjPB7Hb4BYSrJS2YmDT2E5f1fuFnjA7KZjxVZRr18GsnnEknUvnmCf1P5j/rfBo/eixe+6Q6sdd0p8a+Y7Bmsf8mtQE/nqx69MrXIJT1Ta0SsZm5xfRDVkI3sbTgd6+6gS35KMRy3GZ53XJfJXS2bBg4UWHnATN9vauSUjXm+am7bkLqJo/HuHZrc2Z6MSFqlNUmAit6dNCsC4o/LJeIB/KzrADUW+8G2gm0K4Bg26C+YlafYlxA89l8uMX1cpbn3SyEnnoy0IO8mEfW7JKE3nVhKH
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB5235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04544fd3-93e4-418d-53b0-08dc7d854010
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2024 13:10:43.8127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVdsdZfVS8jI+mXfxask4lN09HI+eqPmkRWdd6gK7TRFA6SdMvAdji4SfGhMXcXz6oojJqdDu/y2++ZkaJk31A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7093
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxNjcyOTA5NDpGUEtleTEucHJpdjo8wwGfs4RxA4YjICHdG5XATfXlEIKdXJBzAZpSJxRV0Wmzha3ZAcNRvM6tV4NW3UmRZC7MKvqi9u/SyqswfnrwOyLlFocDTv/m+vHuvTyKVOZ5zp7YkdUGhZ0sPRxxQhHsyeHPt/wSX2RVgTVLq5aALu9LY1ZaiXqBy2pQADJ21xqes6gjZ5eGe8v7EsuPtxKvYo5EPhktUCbWG09P9MY2i+tVL9+TsA4zdZf7pQP2Tnu7Wuu6ut2wXUO1JLEzXCKKfDMZrRwmGtHuPl3w4vpMWGwI2otxPmR93y+LACvPEcs3pTebg8JrQLcMUpVIdRcOO1axuweLlpr5NrppM8y5
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.68.1.121
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

T24gNS8yNi8yMDI0IDEzOjMyLCBNaWNoYWwgV2FqZGVjemtvIHdyb3RlOg0KPiBbWW91IGRvbid0
IG9mdGVuIGdldCBlbWFpbCBmcm9tIG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tLiBMZWFybiB3
aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uIF0NCj4gDQo+IEhpIEZhcmFoLA0KPiANCj4gT24gMjYuMDUuMjAyNCAxMDoy
NCwgRmFyYWggS2Fzc2Ficmkgd3JvdGU6DQo+PiBBcyBmdXR1cmUgSW50ZWwgR1BVcyB3aWxsIHVz
ZSBDWEwgaW50ZXJmYWNlIHdpdGggdGhlIGhvc3QNCj4+IHNlcnZlcnMsIHRoaXMgcGF0Y2ggd2ls
bCBhZGQgY2hlY2sgaWYgdGhlIHhlIGRldmljZSBoYXMgQ1hMDQo+PiBjYXBhYmlsaXRpZXMgb3Ig
bm90LCBieSByZWFkaW5nIHRoZSBQQ0llIHN0YW5kYXJkIERWU0VDIHJlZ2lzdGVyDQo+PiBhbmQg
aWRlbnRpZnkgdGhlIENYTCB2ZW5kb3IgaWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRmFyYWgg
S2Fzc2FicmkgPGZrYXNzYWJyaUBoYWJhbmEuYWk+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlL01ha2VmaWxlICAgICAgICAgIHwgIDMgKystDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jeGwuYyAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2N4bC5oICAgICAgICAgIHwgMTQgKysrKysrKysrKysr
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyAgICAgICB8ICA1ICsrKysrDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8IDEwICsrKysrKysrKw0K
Pj4gICA1IGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jeGwuYw0KPj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2N4bC5oDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9NYWtlZmlsZQ0KPj4gaW5kZXggYzlmMDY3YjhmNTRkLi5mYWY0MGZmM2M2MmUgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9NYWtlZmlsZQ0KPj4gQEAgLTE0Niw3ICsxNDYsOCBAQCB4ZS15ICs9IHhlX2JiLm8g
XA0KPj4gICAgICAgIHhlX3ZyYW1fZnJlcS5vIFwNCj4+ICAgICAgICB4ZV93YWl0X3VzZXJfZmVu
Y2UubyBcDQo+PiAgICAgICAgeGVfd2EubyBcDQo+PiAtICAgICB4ZV93b3BjbS5vDQo+PiArICAg
ICB4ZV93b3BjbS5vIFwNCj4+ICsgICAgIHhlX2N4bC5vIFwNCj4gDQo+IHBsZWFzZSBrZWVwIC5v
IGxpc3Qgc29ydGVkIGFscGhhYmV0aWNhbGx5DQo+IA0KPj4NCj4+ICAgeGUtJChDT05GSUdfSE1N
X01JUlJPUikgKz0geGVfaG1tLm8NCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2N4bC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2N4bC5jDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kYTQ3YTc5ZWUyYzINCj4+IC0tLSAv
ZGV2L251bGwNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jeGwuYw0KPj4gQEAgLTAs
MCArMSwzMyBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4+ICsvKg0K
Pj4gKyAqIENvcHlyaWdodCDCqSAyMDI0IEludGVsIENvcnBvcmF0aW9uDQo+PiArICovDQo+PiAr
DQo+PiArI2luY2x1ZGUgInhlX2N4bC5oIg0KPj4gKw0KPj4gK2ludCB4ZV9pbml0X2N4bF9jYXBh
YmlsaXRpZXMoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPiAN
Cj4gcGxlYXNlIGFkZCBrZXJuZWwtZG9jIGZvciBhbnkgbmV3IHB1YmxpYyBmdW5jdGlvbg0KPiAN
Cj4gYW5kIGFzIHRoaXMgZnVuY3Rpb24gaXMgZGVmaW5lZCBpbiB4ZV9jeGwuKiB0aGVuIHVzZSAi
eGVfY3hsXyIgcHJlZml4DQo+IA0KPiBobW0sIGRvIHlvdSByZWFsbHkgbmVlZCB0byBleHBsaWNp
dGx5IHBhc3MgdGhlIHBkZXYgYXMgcGFyYW1ldGVyID8NCj4gaXNuJ3QgaXQgYWxyZWFkeSBzZXR1
cCBhbmQgYXZhaWxhYmxlIGFzIHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpID8NCj4gDQo+PiArew0K
Pj4gKyAgICAgaW50IGN4bF9kdnNlYywgcmM7DQo+IA0KPiBwY2lfZmluZF9kdnNlY19jYXBhYmls
aXR5KCkgYXMgZGVmaW5lZCBhcyByZXR1cm5pbmcgdTE2LCBzbyBtYXliZQ0KPiBjeGxfZHZzZWMg
Y2FuIGJlIHUxNiB0b28gPw0KPiANCj4+ICsgICAgIHUxNiBjdHJsOw0KPj4gKw0KPj4gKyAgICAg
Y3hsX2R2c2VjID0gcGNpX2ZpbmRfZHZzZWNfY2FwYWJpbGl0eShwZGV2LCBQQ0lfRFZTRUNfVkVO
RE9SX0lEX0NYTCwgQ1hMX0RWU0VDX1BDSUVfREVWSUNFKTsNCj4+ICsgICAgIGlmIChjeGxfZHZz
ZWMpIHsNCj4gDQo+IEkgZ3Vlc3MgdGhlIEJLTSBpcyB0byBkbyBhbiBlYXJseSByZXR1cm4gaWYg
Y29uZGl0aW9ucyBhcmUgbm90IG1ldA0KPiANCj4gICAgICAgICAgaWYgKCFjeGxfZHZzZWMpDQo+
ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiAgICAgICAgICAuLi4NCj4gICAgICAg
ICAgcmV0dXJuIDA7DQo+IA0KPj4gKyAgICAgICAgICAgICB4ZS0+aW5mby5oYXNfY3hsX2NhcCA9
IHRydWU7DQo+PiArICAgICAgICAgICAgIHhlLT5jeGwuZHZzZWMgPSBjeGxfZHZzZWM7DQo+PiAr
DQo+PiArICAgICAgICAgICAgIHJjID0gcGNpX3JlYWRfY29uZmlnX3dvcmQocGRldiwgY3hsX2R2
c2VjICsgQ1hMX0RWU0VDX0NUUkxfT0ZGU0VULCAmY3RybCk7DQo+PiArICAgICAgICAgICAgIGlm
IChyYyA8IDApIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBkcm1fZXJyKCZ4ZS0+ZHJtLCAi
RmFpbGVkIHRvIHJlYWQgZHZzZWMgY3RybCByZWdpc3RlclxuIik7DQo+IA0KPiBzaG91bGRuJ3Qg
d2UgdXNlICJEVlNFQyIgaW4gYW55IHVzZXIgZmFjaW5nIG1lc3NhZ2VzID8NCj4gYWxzbyBtYXli
ZSBwcmludGluZyB2YWx1ZSBvZiB0aGUgcmMgd291bGQgYmUgZ29vZCBoaW50IGZvciBkaWFnbm9z
dGljcyA/DQo+IA0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsgICAg
ICAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgICAgICBpZiAoY3RybCAmIENYTF9EVlNFQ19N
RU1fRU5BQkxFKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHhlLT5jeGwudHlwZSA9IChjdHJs
ICYgQklUKDApKSA/IDIgOiAzOw0KPj4gKyAgICAgICAgICAgICBlbHNlDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgeGUtPmN4bC50eXBlID0gMTsNCj4gDQo+IHNob3VsZG4ndCB3ZSBoYXZlIHNv
bWUgZGVmaW5lcyBmb3IgdGhlc2UgdHlwZXMsIG9yIHRoZSBwbGFuIGlzIHRvIGFsd2F5cw0KPiB1
c2UgcGxhaW4gbnVtYmVycyBldmVyeXdoZXJlID8NCj4gDQo+PiArDQo+PiArICAgICAgICAgICAg
IGRybV9kYmcoJnhlLT5kcm0sICJUaGUgZGV2aWNlIGhhcyBDWEwgY2FwYWJpbGl0eSwgdHlwZSAl
dVxuIiwgeGUtPmN4bC50eXBlKTsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAgIHJldHVybiAw
Ow0KPj4gK30NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY3hsLmggYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfY3hsLmgNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjk3MWM2ZTlhZGMyZg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2N4bC5oDQo+PiBAQCAtMCwwICsxLDE0IEBADQo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPj4gKy8qDQo+PiArICogQ29weXJp
Z2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4+ICsgKi8NCj4+ICsNCj4+ICsjaWZuZGVm
IF9YRV9DWExfSF8NCj4+ICsjZGVmaW5lIF9YRV9DWExfSF8NCj4+ICsNCj4+ICsjaW5jbHVkZSAi
eGVfZGV2aWNlLmgiDQo+PiArI2luY2x1ZGUgIi4uL2RyaXZlcnMvY3hsL2N4bHBjaS5oIg0KPiAN
Cj4geW91IGRvbid0IG5lZWQgdG8gaW5jbHVkZSB0aGVzZSBoZWFkZXJzIGhlcmUsDQo+IGp1c3Qg
YWRkIGZvcndhcmQgZGVjbGFyYXRpb246DQo+IA0KPiBzdHJ1Y3QgeGVfZGV2aWNlOw0KDQpJIG5l
ZWQgdGhlIGluY2x1ZGVzIGNhbm5vdCBqdXN0IGZvcndhcmQgZGVjbGFyYXRpb24uDQpmb3IgZXhh
bXBsZTogUENJX0RWU0VDX1ZFTkRPUl9JRF9DWEwgYW5kIG90aGVyIGRlZmluZXMgZXhpc3QgaW4g
Y3hscGNpLmgNCnRvX3BjaV9kZXYgbmVlZHMgdGhlIHhlX2RldmljZS5oIGFsc28gdGhlIGRybV9k
YmcvZXJyIC4uLi4NCkFzIHRvIGFsbCBvdGhlciBjb21tZW50cyBhZ3JlZWQgYW5kIGZpeGVkLg0K
DQpCUiwNCkZhcmFoDQo+IA0KPj4gKw0KPj4gK2ludCB4ZV9pbml0X2N4bF9jYXBhYmlsaXRpZXMo
c3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICsNCj4+ICsj
ZW5kaWYgLyogX1hFX0NYTF9IXyAqLw0KPiANCj4gaXQgd2FzIGRlY2lkZWQgdG8gbm90IHVzZSBp
bmNsdWRlIGd1YXJkIG5hbWUgaW4gY2xvc2luZyAjZW5kaWYNCj4gDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jDQo+PiBpbmRleCA1YWNmMmM5Mjc4OWYuLmNhMmU0N2E0N2IxMSAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5jDQo+PiBAQCAtNTAsNiArNTAsNyBAQA0KPj4gICAjaW5jbHVkZSAi
eGVfdHRtX3N5c19tZ3IuaCINCj4+ICAgI2luY2x1ZGUgInhlX3ZtLmgiDQo+PiAgICNpbmNsdWRl
ICJ4ZV93YWl0X3VzZXJfZmVuY2UuaCINCj4+ICsjaW5jbHVkZSAieGVfY3hsLmgiDQo+Pg0KPj4g
ICBzdGF0aWMgaW50IHhlX2ZpbGVfb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUpDQo+PiAgIHsNCj4+IEBAIC0zMTIsNiArMzEzLDEwIEBAIHN0cnVjdCB4
ZV9kZXZpY2UgKnhlX2RldmljZV9jcmVhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiAgICAg
ICAgaWYgKFdBUk5fT04oZXJyKSkNCj4+ICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPj4NCj4+
ICsgICAgIGVyciA9IHhlX2luaXRfY3hsX2NhcGFiaWxpdGllcyh4ZSwgcGRldik7DQo+PiArICAg
ICBpZiAoZXJyKQ0KPj4gKyAgICAgICAgICAgICBnb3RvIGVycjsNCj4+ICsNCj4+ICAgICAgICBy
ZXR1cm4geGU7DQo+Pg0KPj4gICBlcnI6DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oDQo+PiBpbmRleCBiYzk3OTkwZmQwMzIuLmFhZDU2YjgyOWNhNCAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+PiBAQCAtMjg1LDYgKzI4NSw4IEBAIHN0cnVj
dCB4ZV9kZXZpY2Ugew0KPj4gICAgICAgICAgICAgICAgdTggaGFzX2F0b21pY19lbmFibGVfcHRl
X2JpdDoxOw0KPj4gICAgICAgICAgICAgICAgLyoqIEBpbmZvLmhhc19kZXZpY2VfYXRvbWljc19v
bl9zbWVtOiBTdXBwb3J0cyBkZXZpY2UgYXRvbWljcyBvbiBTTUVNICovDQo+PiAgICAgICAgICAg
ICAgICB1OCBoYXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbToxOw0KPj4gKyAgICAgICAgICAgICAv
KiogQGluZm8uaGFzX2N4bF9jYXA6IGRldmljZSBoYXMgQ1hMIGNhcGFiaWxpdGllcyAqLw0KPj4g
KyAgICAgICAgICAgICB1OCBoYXNfY3hsX2NhcDoxOw0KPj4NCj4+ICAgI2lmIElTX0VOQUJMRUQo
Q09ORklHX0RSTV9YRV9ESVNQTEFZKQ0KPj4gICAgICAgICAgICAgICAgc3RydWN0IHsNCj4+IEBA
IC0zMjEsNiArMzIzLDE0IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPj4gICAgICAgICAgICAgICAg
c3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyIHN5c19tZ3I7DQo+PiAgICAgICAgfSBtZW07DQo+
Pg0KPj4gKyAgICAgLyoqIEBjeGw6IGN4bCBpbmZvIGZvciBkZXZpY2UgKi8NCj4+ICsgICAgIHN0
cnVjdCB7DQo+PiArICAgICAgICAgICAgIC8qKiBAY3hsLmR2c2VjOiBvZmZzZXQgdG8gZGV2aWNl
IERWU0VDICovDQo+PiArICAgICAgICAgICAgIGludCBkdnNlYzsNCj4gDQo+IGRvIHlvdSBuZWVk
IGZ1bGwgJ2ludCcgaGVyZSBvciBtYXliZSAndTE2JyBpcyBzdWZmaWNpZW50ID8NCj4gDQo+PiAr
ICAgICAgICAgICAgIC8qKiBAY3hsLnR5cGU6IGN4bCBkZXZpY2UgdHlwZSAqLw0KPiANCj4gc2hv
dWxkbid0IHdlIHVzZSAiQ1hMIiBpbiBkb2N1bWVudGF0aW9uID8NCj4gDQo+PiArICAgICAgICAg
ICAgIGludCB0eXBlOw0KPiANCj4gdTE2ID8NCj4gDQo+PiArICAgICB9IGN4bDsNCj4+ICsNCj4+
ICAgICAgICAvKiogQHNyaW92OiBkZXZpY2UgbGV2ZWwgdmlydHVhbGl6YXRpb24gZGF0YSAqLw0K
Pj4gICAgICAgIHN0cnVjdCB7DQo+PiAgICAgICAgICAgICAgICAvKiogQHNyaW92Ll9fbW9kZTog
U1ItSU9WIG1vZGUgKERvbid0IGFjY2VzcyBkaXJlY3RseSEpICovDQoNCg==
