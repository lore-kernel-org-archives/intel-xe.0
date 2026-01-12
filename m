Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41987CF45CD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 21:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FB610E115;
	Mon, 12 Jan 2026 21:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMHfiUoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F209C10E034;
 Mon, 12 Jan 2026 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768255175; x=1799791175;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SIAF1IT5Qxz5Y9jUqnAFwtwo5QpbR2PAQTz/5db5aYc=;
 b=GMHfiUohNT/XsApF1bHtXy+QLbXildfqLiekD2U202f1u0yBs1RIHWfu
 4kCaJapXbsRDbjaov4CzlaSnsL3taC9y47Y53Puyo7lVV4t+eo9yvTD1g
 vA7APVz/wzIW6oeRdqM2CGrHaHqr+QDOvEwnGoQ4349uMBNL/8lDdN+lE
 KCY/MIM4Akuj/DMzx8Ga1Gbcliz3sHeu8sLvEIRXJLaHzBhfbu2oc2rIq
 fll30xnMrZasz4pmLCtL6cb0r+ClgOvx++hMWxhYGC9fXT0DCsBC0tGp4
 M6VCuhq9PVAfz1YfM6ob4P5zDS6a6OpKsVN5NDR91f6THKMSjA/Hjt66I A==;
X-CSE-ConnectionGUID: dRbDoaATRNq5s5D5y9RNCA==
X-CSE-MsgGUID: 1Fgguw16TQWwPkjDaxE+kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69696250"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69696250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 13:59:34 -0800
X-CSE-ConnectionGUID: fEekhP5eSaau4kJ4m9JyGA==
X-CSE-MsgGUID: jmzAJmEvTPCNK5dLZE9HFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208358776"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 13:59:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:59:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 13:59:34 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:59:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUlXTUlad2fsEiHBQmVhK2UUq7ZQH7XApdY/FPBhUVNe0VC05jdHnoRwpHrTKduSJRjlU88ZJGg45Dc7VCNVUQ1FPNeSPKF0KG8Pi0B+Ab8BGSzpITwXA95TGTs6ze4d9wcQhmSIGSTsvtTSXsQgWwjOfyYlHvJRbGBbgyz73gqJLWgQ6gapFDusnsCnecqnXh2Dxo3AlAPQzbV/1TpWSGXMr0s1lKhRmB0HlD+Jz53CNlKUNQruiVBHBTAZXyL8vLpdtJeAUWDQ4gyKTDhqt46U2+Ct6YcG1e67YbNQpXuPrgrEo8RIexRaQu/VjohtPZNuLIVCAwM4Da1Tnq61bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDywJmr4jN1Yr7Nn3INikm4yBwav4729tfhmGtdcYcY=;
 b=Y9weIKjt5V7l1NjKXslP33uyI/NJ54YgKbuC3astkgjIuhUmQ2bq9AXVmBjRi7Hf8Zt0xQGSpufAAIt08+mZCmA1RhhzNnixYR33fgPaWFyZusuow+JpqYt4LsumWTBoU3AI0KnUXnVVZLunDU6wBNyS6Lnn47ghe3yt4GdnIsZ0kcX5kqgSFlNjllizyLWiE2asS/nWT9KIL5Jo7yHH+sFtL4WlMq6rdA536ruoOkdus5eoa8vxDxqWNRSkFbJ9NP3F8VogEHG4xEExMbaIjALt2fXznP+nVk34BXMusNC7iTseepmaUxbjcL1OJd54E+rFBvBBXtkPuFCvTzdADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 21:59:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 21:59:30 +0000
Date: Mon, 12 Jan 2026 16:59:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
CC: <intel-xe@lists.freedesktop.org>,
 <intel-gfx-trybot@lists.freedesktop.org>, <jani.saarinen@intel.com>,
 <suresh.kumar.kurmi@intel.com>, <mohammed.thasleem@intel.com>
Subject: Re: [CI v2 0/2] acpi: pm: s2idle: LPS0 changes
Message-ID: <aWVuvvOVWUb1_xJO@intel.com>
References: <20260110154405.2825339-1-michal.grzelak@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260110154405.2825339-1-michal.grzelak@intel.com>
X-ClientProxiedBy: BYAPR01CA0043.prod.exchangelabs.com (2603:10b6:a03:94::20)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3bd90b-7309-4d53-9632-08de5225dcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzRJclVHaFJ6OFRBa1hZdVpVeWx0dUxPcWk3MVlKUzlpaGc2RU9TRXZoOFly?=
 =?utf-8?B?azV0aG90dEZWSlQ1d2ZUMnBJNUtCTDZ4WFB2bGNEVmpCRzUxUzIvdXNhaWxF?=
 =?utf-8?B?cTArbEpIWElZTW1Ydkcwb3RVdjJlLy8zanZKb0JOOTlOc05EMWIza1dmSHBY?=
 =?utf-8?B?ajdWRFNaMzhtVnhkWHUyeHV0Rno4WDJRd1MxSkdCWDIvc1B6bUljS1g4eHZm?=
 =?utf-8?B?bGhsc1Z6SnVETTF3YmlydmRScUlsTE5OSTdIMnhrQzlOWFJqdE5TRHBXOUZ1?=
 =?utf-8?B?dytyY1ltU1Z4STIyUkFHRGpUUTY1RnJNOXBEMGZMRnk0LzJ5Tm5NYU5meHRw?=
 =?utf-8?B?dFJ0L1BNVy9ZWFV1UER1OEhSRzhOVkhMU0lkaTEvKzh4MXI4ZmV2UVRlSFAw?=
 =?utf-8?B?ZmNIczhCRjhnN3pGUGRtblNidytxaG1vZ2FBVXNoemhKWk5ad2pxdmEzSjht?=
 =?utf-8?B?bUZINXIvZFptNS9lUnljMEhaK1JiSnhLbVQ4Tmw5ZW9vNi9EUFpyeXBvTU8z?=
 =?utf-8?B?TlpvaVB0QXhIWkM2SWRYRFNTWmo4aEJOL3RmclB1andheGRCQjZLTjZ4K0FB?=
 =?utf-8?B?VFBzekluRFpPc0YrZ0hJcFFhR0loQlZuK0Vad0UxVW5Ucm90SXMzcVJKS3Js?=
 =?utf-8?B?K3dtWXREQjd4WlRPUWRKaHI3Ni8xSFJpL0NxdmF1UDFjSTdBT1FqTlJCU0da?=
 =?utf-8?B?NFFaTUVScHVJbys1cmpkLzdBWk50Nk1xaDZCWmZWWTBVWU1FRWxzdVd6M2px?=
 =?utf-8?B?RitkdHBuN3VscVY4aGVvNitFMGM1T3gzT0lHNUp4ZS9MOXJoVVNVYW52dUFT?=
 =?utf-8?B?VDNOaGErZHkzWjJyVEJlYnExWHc2dGJMSlhLdHBobGFJYy9CUEdQWXBUOVhG?=
 =?utf-8?B?cHViQ1ZUT0RCOENjamFtazhkZnQ2UHVtWndBRDVHdUJMemczbFdQQ0k1S1Ns?=
 =?utf-8?B?LzgveWpHbjFTdGkwMEF2OG1RV2x3VW1vZEY4TkswTE03RzNZMHB0S2x6TlR1?=
 =?utf-8?B?TVVaTEwvMm5kWklzVnp5d3NrbHNKdjUySkgyZ2VEc1VPeGFnbnl0enlZM0tN?=
 =?utf-8?B?T1VLbFVJeGJzb0U0bXdlUElpaHVWWWdlOW5PbFluQ242aitBZmV1dFdsL0tQ?=
 =?utf-8?B?dmhuNnRFQnRLTFZRakpJbStGcU1lYkFjSGcxTVErTm5KSVM0d1pBeFhLRGZO?=
 =?utf-8?B?WnF2UmFQTllwVm9xblpzM1RqdmpyTFhHOGtQVUpGSjh6ZkhmNjVFUFJOTVJy?=
 =?utf-8?B?S1R1U1BlSGU1SldOVWFIOE9GQ2xIVVB0L0VlM29MTlEyUUpSWllWL0NTdlVp?=
 =?utf-8?B?dmU5MjV4dTVWMi80R1U0NHVVU25qUjI0dGw3SmFhcDFCbUhpUkM3dmZKb3Ar?=
 =?utf-8?B?RHArTng2RVF1VUZxbVEzc2JIcC94bTg5c2MyMmNoNXBMQjYrcm1wclRvakVZ?=
 =?utf-8?B?NXowRnNiZ2JVQXJIZEFxV3pzaHZvQjZ4MVp3cXRkWHR6Y1dMVW1wdFNvUkpL?=
 =?utf-8?B?NVB6ZFBXSXRIVmplOWJMcTlrRnFCR044WUpMcThnM2RFaGV4dlFJRm9iN1Ay?=
 =?utf-8?B?cDJyVExnVW5XYmZJSmhFUWR0Tk9jZGE4K055V3p0aXptMldqWm8xdjJMM1Jh?=
 =?utf-8?B?c1RJRnVXeEVTRjJ3WTBwdHpPQjZ3cE9zM3hYQ051UHZ3OXVLelplNmx6U0V2?=
 =?utf-8?B?b3hMSmJ1cmFGb3FPOWNjR1J6aFBwL0FObXBXMUVwTFVtNExjQjkrYTVOUU56?=
 =?utf-8?B?SkZQcXJ1aEVzaFc3Y3RHZ2ZOSmdhVVQzNTMrZzBlNXFmTndKUkxmMzc3NnNj?=
 =?utf-8?B?eGFYWDh4SmYxekRXWW9UOExGOGk2UGZEMUUyQWJlb0g4d2Vka3hCSjR3enlx?=
 =?utf-8?B?QTAwVUY0ZjJCNjBwc0MyMks1UmoyMmxyOUgzTWtNMFI3c2JSZytMejA0TTBP?=
 =?utf-8?Q?WVvBASxnARjOe08ovqmxnk5Kp231y55A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzdURVl5akYrVjJ1NHBQWVA2OFFYU1NEWmduckRucUplaHdESDByWmJBTkJE?=
 =?utf-8?B?WkdWNDJpc3hzVGJFOENucDdHdHdISVZ5aDRHWk5FeWkrYmhZdW1NYXFUNDZL?=
 =?utf-8?B?YzZDTENDRUxWSlYzUmtwSS9pY1N3TFlmUjkyb3BzbytyRjY2VFcxOUlhRnhE?=
 =?utf-8?B?c1ZsaitjSDVwZHpzQXAxckgzSWlGM2MycE9Hck5mN3VEU2c1U0xJWlVHTVpl?=
 =?utf-8?B?b0RzVmYwdHVCc3I0QjhxZEozaUZJNFNyOUJXVVNHd3JZa0xJQXBuNks2c1Vm?=
 =?utf-8?B?RmpkZjgrR3BIcXg2S3VpTGkyci9wWkk5NE5RSHZkMmtYQ2hUQ3NGNTVJQVpz?=
 =?utf-8?B?ZzlrakgxS1RITWJHWFdzZ1JaUXBJODlVNjYwMUl5aUFITDJQQnViMEV4am9m?=
 =?utf-8?B?ZDZ2NkxvK1VpckFhNVFGbnlNUXpEYmdFTTBoMEtQNytmUlNZbUFTZVFLZ3Bh?=
 =?utf-8?B?YUozUWR3d2VWMzFveitVQ3FMb2ZEbURLZEVLakx5aVdBck5RTmNVSWQxVEtm?=
 =?utf-8?B?VVZQeXFWT05OZWx2RHJ2VVRPZkhHZWhONlFEOGhpeXdMdDFwZTV2SlJqZW1t?=
 =?utf-8?B?eDZHcDA3bVFpSGNSQWREMjFoZUVERWhEM3o5Q1cyb2VVbWdqT1BrMmh2eity?=
 =?utf-8?B?bDAzUVBpN09tWnlwbi9tbHdTN2gwbEIyUk9KbklKYzhmeVB4VklSRHpmRXZl?=
 =?utf-8?B?cmNpVjNtR0RRM0FCM3dXdU1vZVNoUm5qdmpUQUVScnUxaWR1aEI2MHJlc1Jj?=
 =?utf-8?B?Zit2K3VaVDFhbk1ZczFVSlNIN3JpRGV1U1hzV2JDUWxqZDUyWHNWQU1ZZVg4?=
 =?utf-8?B?RCtpUDBtbmVWKzhyRFZ6RlpwN2tBTEEveXRsOFFZUDFid3RCL2x1SHUzQTFi?=
 =?utf-8?B?VldZeWtrc3ViUjhpM1UwQUlZN0x4ME1iaU9oUUNSbUtHUDhETUNEdmFvVWY0?=
 =?utf-8?B?Z1NLWVM1VkozVXRjTURBeW1sQzlzMlptL2wxWFVpYXdBQXVFamd4d21PbGpq?=
 =?utf-8?B?K2VmZ1JsYmNremhJRkFZdDBNT3RJNklxcFhaemtiME0rRUk3WEhCODlZRlJY?=
 =?utf-8?B?QmROeUFPUGtSMDZZTWZDeTdvcVdnRmZVblAvNEcrd2xrTkJObXpveU5BNU9X?=
 =?utf-8?B?cmtlSEJoSTE5SGg3QWZ3Nm9penJLcUNPQjlqT2E1OXNadjdjZ2dabWU4dW1a?=
 =?utf-8?B?NlZ4Q29DdnpSR2hlN2FKUVZkeHp4bnE1NEhZNTdUTzBsTFZjVEM0SXlXY05H?=
 =?utf-8?B?aDVWcml6RFJzVXNLcTJPcEV6RFZxbTQxRG5YSkdHbFFOdjFHUlIrQk9BaWd3?=
 =?utf-8?B?dm9DVldQRTl6eUNqVE4vZjR6bWFLT2htbVZ5Z2lxRGhqeFk4MG9EMTRYRzhH?=
 =?utf-8?B?cHV4YTFoSWpyTGxieUM3TUZRUWt3NE8rM1JTRWV2NzFXai9rVjBxbUhhRDBN?=
 =?utf-8?B?ZnpjY3p6SjJ4R2pRNVlybWRUWGxLMytHSWROSE0wUFZGZWw5NnViUGxnK3Fi?=
 =?utf-8?B?eWg5TE1id3VObUtncjlqdFdQNUE0bGptNFVFMXE0bVlaQ1BtQlowS0ovZ05z?=
 =?utf-8?B?Q1JzVUljUUF1NGJBdzE1THhSL0ZLL2VqREJjR29TSXo3b1pvMUpua2NoQWN5?=
 =?utf-8?B?NmxBNERnOE5BbVpuT2d4c3RhajBuK2dycVhzSW9BcTRCY09rV1JxdTgyY0c2?=
 =?utf-8?B?WXpKU3NRY09ubVljcEJhM2xqT0xmTHNNa1o5VnlQUFQrTU9XL3dYL3RMR0Y1?=
 =?utf-8?B?ZDlCOURiQVZLbWxRVS9SM0huaUgwaXM3NkNHUC9WdE1oamJJTHRnalpuQkVh?=
 =?utf-8?B?YS9SVkZMMVhaUGkwbENFTnhGSE5MZ1QxNEltb2VETU1lTm1PMU9EVUxKZjUz?=
 =?utf-8?B?Tm1pdlVJYTcycjF3ajh5a3FDVlI2bEhaaVUvUVNRMThZZXA0bEx1a05vdnBM?=
 =?utf-8?B?WEs3bUdmTnkzY2RNL1BWdWQxRWlMVnhGNmU5Mk5Cb2podFRvN1MweFNWUVpF?=
 =?utf-8?B?a2F5emRldzRqS0xWd2lDWnhrSC9NaFFlWmdidlhjd1JqaXZSY3pvNnhrdW1E?=
 =?utf-8?B?cTR6UGY4S1lQTjZNaHRmV3FXN0JDYm16bEtBVy94L3EzUWJ1dVZHTlBnVllF?=
 =?utf-8?B?QTFGSkVUb2NJK2lTY3RiRzhhaDdBaTY4cktjL01EOGlZZlRiWDZ0SGI3SEV1?=
 =?utf-8?B?K2RPY25zUDB6TGdpTURWbXREOFFuMjI3VXMzZGpVU1krWHVSRHJ3RkNyNndo?=
 =?utf-8?B?eGVkaWViaVpHVVB5SXN3TkhhYm1DTXNESk9EQjdVd0V6TDg1NmlhYTNJT3I1?=
 =?utf-8?B?MTFGWllwcUFBY0NWOVB6ZEFYN01pbFpiNnE2WDIzb3MvaU5kZ3ZYQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3bd90b-7309-4d53-9632-08de5225dcbf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 21:59:30.6202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ogqTTy8pLeh0KPn4/0AARi/zyFANV86jhURCKkVViXPYAGNTH0wGrCjHTL7HCl4aLuNg4eFVOY0qoFJ3NFELA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
X-OriginatorOrg: intel.com
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

On Sat, Jan 10, 2026 at 04:44:03PM +0100, Michał Grzelak wrote:
> These series is a continuation of [1] and tests Rafael's changes.
> 
> [1] https://lore.kernel.org/intel-xe/20260109223442.2622647-1-michal.grzelak@intel.com/

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7035

Thanks for the patches and diligence here.
Let's try to remove the first patch with a rebase next week and keep monitoring
the evolution on the second patch, as well as work to get a proper FW fix...

> 
> BR,
> Michał
> 
> Rafael J. Wysocki (2):
>   ACPI: PM: s2idle: Add missing checks to acpi_s2idle_begin_lps0()
>   ACPI: PM: s2idle: Add module parameter for LPS0 constraints checking
> 
>  drivers/acpi/x86/s2idle.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> -- 
> 2.45.2
> 
