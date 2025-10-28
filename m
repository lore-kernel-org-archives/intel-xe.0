Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE78CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 09:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051B10E09B;
	Tue, 28 Oct 2025 09:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWdPX7t5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDD410E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761643814; x=1793179814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sdXlR7n1bMIByvsvy/AmiSXfy/Q3ICrb9Ljc6y9Dddo=;
 b=dWdPX7t5NY7DZ6sX6mAIN7aTgnNKJDZv+H1IFutuSK13aRWXRlE6B7UP
 HqwhOOXnVqf6m10nbUv0V+kNZ+8vAZAN/oWwK0//pMB921IXi6IGtT98T
 zA+euJOv+UOaPVDkBv05Q/4XVeJ0sIxckO4Do12EI8GWj1Hj3w2MNUw0/
 dAoRgpXlTw38SApnsRRwn4dAc1MiXzFS4HcwdYppm6gBR9efyRgm5JM0J
 b9pQ//1FMm5CX7rrngnCaxO6HG8jHoA4aGFXzqGF7+T/DjYFQ2Wu/nCby
 k33z+Qwp4EAlMcNJpK1cFr7vszV8ucskrLjyO69df6uiUmn2+2scBXJAr A==;
X-CSE-ConnectionGUID: DsqR4I6iRPyktT3i1QPDrg==
X-CSE-MsgGUID: o4ifyybASqSF+Kt15fbKJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63440625"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63440625"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:30:14 -0700
X-CSE-ConnectionGUID: 1TJCm/fIQHiqrOAamWlUgQ==
X-CSE-MsgGUID: IDJOT+vASa+DI8fBOGgDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189353235"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:30:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:30:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 02:30:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2nhZLaKGt20IYeDKy/AGIZsICfT/odhoBaEaMUHx0rRIHqhYS5Obc3evNonnuZDlTfZcygkESfEvNbpL6tpPB3Vx62TeG0pxobad9bOmlrvO3xtpHT52YEdb2xVhROp9KTMrLc8Yc1gofZOq7n1yxIP7DMD/Bp2ODyfgCTmM/HV8d3Gu/3lrrET2njUKobdarktTE75sgKL6trilMJs+K+9yEd4rEzMG88UrFhjjfYblEU9XWQBkkxuaw126dkFJw4R4ApPT/NEFkVxLK7Ds08Iy2U39qE02zhzzX7lfyilgL7vGovH1yorltAD2r7+8kONc5N5V2U1bpCD8eWHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7Q6Ed9fhxA5ClfgqViZqgJP/txmWy732YsgCHWcljg=;
 b=JRizJdFp5aI8OuFmxevcf/1e7KVBM9TBWeFH2UUtXDt/r3qldExZu2X2xZvRkP8kkZSDL+h59ISCDMqGxDuT152pgz+teesqgv2Xct5rqA9QcjfLgBtPpe4IxHRt6Xs4sz1rvf455CDoEYt4t8rvKKkgwWNEtopwuc36nRS7+bteAWFUuk36nd1WIoSMq8UV54MAujzAd1UGAmO5fiD5LBiCtifLsqnJ25BTCDk9afpTUcYjvK35IeTJsAWXw4L5pqs6B7p0Vb0K9kHXDBDv2vtK0vyZieiwOlfjluiEXOek43ENUeXPEphmMX6hldaMdyWzTpGYOuyXMP36PfqLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 09:30:11 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 09:30:11 +0000
Message-ID: <b89248aa-c2d9-409e-9f7c-3f2d75a55780@intel.com>
Date: Tue, 28 Oct 2025 10:30:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/xe: Handle MERT interrupts
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-10-bf11e61d9f49@intel.com>
 <20251022231912.GZ5409@mdroper-desk1.amr.corp.intel.com>
 <r4kyzbn3wh2w7zqp6h7oo764wm6gzfrl2t2lrf6t7bycxecgmx@wbyxazq5q4ym>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <r4kyzbn3wh2w7zqp6h7oo764wm6gzfrl2t2lrf6t7bycxecgmx@wbyxazq5q4ym>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::12) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca4cf3f-bba9-4bf7-8cbb-08de16049786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dko3Y2hLVzRWcDBBTE13bWw5QWl0T0ZyUmVlUjBLa3FjdHBnb3A1Ymd1a0w4?=
 =?utf-8?B?d0h2a28xdlJnUHFwM2pibllOKzQrVzY5L3ZPdHJ1dy9GZ0xnU1RLUXpOR0No?=
 =?utf-8?B?L29IMk9YNStZcm9sQ1piaC9rT0JvM0V5UDdzWGdhRnNtbTMvVEM5N3FTbDdJ?=
 =?utf-8?B?VnZ0cXFSdlVHNURvVEhuUE5CeXMzeXlFZWR1NmIrSk1EZXpvcTZYdTEwc3JE?=
 =?utf-8?B?RzVOZER0TGpzVk1hQ2VIdlc0dVVMVTljU0lkeXJ5SnV4TUQ2cVhIVmtSeXJD?=
 =?utf-8?B?b3g1aFc3VklRdEowcWNpcCtXRmFhRmlHQXFPWDI3aVpyNFA0MTJkOXJQM1B0?=
 =?utf-8?B?bEVkZjc1QjlYNlFiQWZJbm9xbitlcERod1greGxXZjJKSXh2dDd0YzdNYmpv?=
 =?utf-8?B?YUR4ZGdZZWxBK1FMWU5KRW5kY2ZPbVN3V1hmTGJNZHFFSjZhaXZFVENDZW9r?=
 =?utf-8?B?Y1dNb3Q4VW94S0VZZ0M2UTF1Y1JkNFNwU3VqcmxEYTRITHdLNTZjVTJIRmhR?=
 =?utf-8?B?ODlZMEtLeUZ6QzdXbElPdk94Q3pGcXRkeGZWL0d3RmFNekJ4VHA4NVZsTzhE?=
 =?utf-8?B?UnloYVFtUmZwOVd2bXRvRWxlUjNlZ2pCMkxWb1VacjFnUGxuWTQ5c1h6Z1lx?=
 =?utf-8?B?ODJUaDRhYm0xeGx1WTl3NEpiUHV2NHZuUU85aGxndnoxSUh0RzhkVEVjeksy?=
 =?utf-8?B?VEswRjlHWm1yTERxaXlzZnFUa0ovZjlKRms2RndmaTdtQkVMb1dYVzlmM3N3?=
 =?utf-8?B?NU1vOUlnaDEzUDNNak4vdnp6ZE1NV1NYczM5dmo4TExrODFmSGYwNW9oRUVV?=
 =?utf-8?B?eTdBNXdYWHArRkFWbFNaUFBiWVJnTlVYcHVZSTR2VUI0VDQ4UnZMMWZGK0Ex?=
 =?utf-8?B?TUU5ZWpMeUF3Y3NsbFIxT2N0TERNSUE3WDdQaDdFY1IreHdORWV2SjhsNmN3?=
 =?utf-8?B?cTg0VGdneEcxRU41b2lpdXV5bGhVZzJ1bDV2bFlGN1FkTHUwc3pJYkk2a2Jv?=
 =?utf-8?B?aUo0a2JyNERiOFdncElTVHR4SVV0RkZSMFFIVWt2OEdtcUpwYVBHWGwrTENS?=
 =?utf-8?B?azBlK0FKd3pBbWpLdXZwRUp0S0Y2ZHY3ZThzU1puNUFOaHphM2k3UWUza25u?=
 =?utf-8?B?RWI1aGZFY1YwSURWYk5QRXdZWnJ6cWdvQkNoK3NyS0FGNU0vR0piTEUzdy94?=
 =?utf-8?B?b1VRaWU4QkcwaTV2UVJGM0Q1YUY0UmNRLytRd0JPUHloUCs2dnp3VUtvV1Yz?=
 =?utf-8?B?dW4zaDZSYlhYL3JaRjkzTXo2M1dnTHJLb0pXTHgwdTFtUXhJc3F4ZWdOQUhn?=
 =?utf-8?B?ekFOYVVIaXpJL2V5UUNPRTkzeVp5RE9RMzczckQ1UUEvb0x3dHVtS3ZCQ1Ew?=
 =?utf-8?B?ZW9vejQ1YU56QkpqbDdHeWFGK1R2M3J2RzFYYyt1U1lua3BCSEVPYTNWak9l?=
 =?utf-8?B?RDhheEpjWG05MTh5REdCQkpiTmxoVFM5Vm5MMVBYUHNoSmswalY2REp4dTlK?=
 =?utf-8?B?bzJJeWRFMVUzYnptTG5QcWd6NXZ6cVAxRDNGZVRybEJ1UHdBWXY5LzQ0V2tV?=
 =?utf-8?B?NGltTlFkbEUxNEhsZ0dkS2h4YjdFSUtFemsvNTB1cUo5aDhMQk51WlhWb2hz?=
 =?utf-8?B?T0dkSURlRmZMMm1ncHVXTCtXeTJkV0o0SFhnUmhHM0V0YlhNZ3kvY3c2UGhE?=
 =?utf-8?B?V2RXUGowNTZkbldrc2Nlb3FOdWhDZDEyWHNUWGIvUFVtcmpud0VEUTFGQkt0?=
 =?utf-8?B?SlNlN1NuSnMydmxPRlUydVdQenJBS2FCOW5RdlExcDJZQmFyNGFQUHovTWhU?=
 =?utf-8?B?YllXTGp1Y3BzQ3VacVNGUWRhR0FReURJenVMdjRvN053Q3F5Y3FzWlFNMWV2?=
 =?utf-8?B?ZlA2MFkrRUFaQUFpNnZabkFFSTZsejBKMDNKeGdLTTBISTFEVksvYzBUNGE3?=
 =?utf-8?Q?wxQR8HhDxqpkgBiMEarxKxG7atTwsKAM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW9aL1Qyd0JDMVA1c21GVmg0ZjZmbWg1ajcyMWpZUUZRY1hEcjdTbS9CVnhh?=
 =?utf-8?B?ZG9XL3UreUJKRERvRjcyNUVZVmllMWFFdUFZTzFCS3JGLzJsY3h2OGhDTDBy?=
 =?utf-8?B?dHFONU5xM3VGbnN5TlRVS1dzRHVvZ3BaRkRaS1dUS0pRaC80UXhYL1I5dHhB?=
 =?utf-8?B?akYxd0YxTDRaN3BJSTRkWCtMbkY0VDRYZFlrU2pqTTZZSVlTL0xGWER6NXVn?=
 =?utf-8?B?Mk1nbzVMODBPdi85clFLdmhrQW1CMURSL2ludVBpeVh0eFQ1SkdOejQvanhJ?=
 =?utf-8?B?eVJ2bkRwUXdDWlhOeHg4eXljZWdadWtjOFZyeFFaclhmT0syb2s2YlBLWjBE?=
 =?utf-8?B?NVYxQ3ZSS2RDb1pVWGY0OVQ0OHRMVkFDU2VkckxydVQ0MFNVTU1laGFjQmRN?=
 =?utf-8?B?VFpMcUUrWUNzTVBadzBSSjRpL1Y4WDREREMzMThWOUxvUGl1TGVkZWVKUmpX?=
 =?utf-8?B?aHBXL1RHbGZLWVllNyt5ZlRHTVRNd2hqcHhpRWE1aWNKbHM1VENZSWdUN3Fi?=
 =?utf-8?B?UVVheksvWC9yeW4wRUE1MEdLM1dYZGV5eW9PZ1M3VHFsdDBtMWF1Y2ZxSkNa?=
 =?utf-8?B?SEVSN0tZUkxqVnlXZUVERWE3VjZFamMxK1dVcVBMdkVKUHAzckpVR1E0NXBR?=
 =?utf-8?B?TG1MRHJ6andaTGpRL0FnSXJaWjRuVlNUUFZXYjNCUmMzN0ZDYjRlclNzNjVo?=
 =?utf-8?B?ejljREx4SG5mUUE0Z3BkN1V2QkpFdWtlZUgxRHV3OEVWK2Q4dFdTSUFsSlF1?=
 =?utf-8?B?amdVRWpvZUo5eEpMcUg2K01IMHQ5YkxHcmVER01BQlVvb0tRRXJocStYZ1pv?=
 =?utf-8?B?QytubnNvTEpQMFlmT2dQN3Rwb0tGZklUb1ZZZGZ3QUFyL3Q2SHFoUnhYMFF4?=
 =?utf-8?B?SytLd1VsS09tSnMzcjh1WUpKd3pKbnA3QjNqM0dTMHB4Wm91Wkw3RGJHTVhF?=
 =?utf-8?B?bFIxaGxWWmFmMm93Z3l2bmxDMWY2c0pwMnFCRGYyZ290b1pWZ2hGN0JnVzVB?=
 =?utf-8?B?c0lnWlN4SlJ5R1FWOExCSkJoMnIyZGc4RkViOWNRdC92cGlRQ0ZBTmRPODNY?=
 =?utf-8?B?Um80czJuVGFoQm5OYzUyVlBxL2FsOEhkb21YekxsVVViRHRpOGdmckFRRytV?=
 =?utf-8?B?bFZwSXIzS0N5WFEzMEF2QVByOEVIYjlaOXJFNjhWQWZtZEtLVUhpZTAra0V4?=
 =?utf-8?B?dDMxb1U0dit1Q2FGZE11NlJVaUdWck1PV3k4eklRYytHMElSRExCbzF2TGdy?=
 =?utf-8?B?Rm81azY3NUQwSTRBU2E4TnBGdFZQTVB2THZYTEhXSlZYOE43WUlMQWVSUUJ2?=
 =?utf-8?B?bnB6eHVYQW1ycDhJU3h1cnpHWUJhbDBZRi85bWJkQkdpeXhUcGc4OEVmaHJ1?=
 =?utf-8?B?QmRPNWhtN0dmQXB0ZDNURUNtQUJYTnJWZkNDdm5kM3k0R3RibGR1eERsVmM2?=
 =?utf-8?B?VDRqYTJYSGQwNFpLL3I1U3h1QWdZWEdKOCtJM1VpU2REMXFTcmxYQU1nTmdo?=
 =?utf-8?B?ZFRxeVRGVlU3TkJ5YU5VTHgxY2I5T2cxaEZSeHIvMGdhY3JiRnFSV0xqRjcv?=
 =?utf-8?B?L1RTNFgrMkhhbGU1bnk1a1ZqZjh4MU5oRVhWTm1lN256b0p5UVM3c3hmS1Z0?=
 =?utf-8?B?U3FnK1hDU3d0TnluaXpsRzA3SEZRMnBFcVJ1UTdlaVpxTUd1M0ozNnBzeGMy?=
 =?utf-8?B?RS9NM1R4S05qVVgzYVc0WXcrRkFBV1g1ZGN2SVh5Szc5MWd2QXJqWXB2VTZD?=
 =?utf-8?B?aDNxQzVyankzUHN4d1pIK1BXY0NySUxjYjhwYWdxZGlNeHFXZHlaTWlQNjQx?=
 =?utf-8?B?UmhqbVdHYzZaclJkcmswS2daZmhUZmxNV3lONDFjTWVpc2VDUXBDVUZGdFJj?=
 =?utf-8?B?SGk2QUtJQWlCTUhhMllCb05BRStxMFFudjFaZTkyZDg3VWFvTEJzZk04dmhq?=
 =?utf-8?B?Ync4WGU0SkMxRTBhV1VLOEtxako0WkUyVmZVK2wxMDlGNDYxQmFCUGFhbnh1?=
 =?utf-8?B?Y0VzMDQ2Z2EzYkl5b2M2STdVNVBCTGVIZENoWTIwSHJLVEI0SnY1dWkzb3J5?=
 =?utf-8?B?d2hQaS80QjhjOUFPSnVmSXFzdlNheXJGZXJhQzJwRHp1MHE4a3NlL3F1ckZZ?=
 =?utf-8?B?RGJpVkw5aG4vNTJqMUpEUHJlMU5zeFVsL0l0UmJpOTlYK1R0d1UwWjNZVkJI?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca4cf3f-bba9-4bf7-8cbb-08de16049786
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:30:11.3915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX1SSZ0BvNk5W/6GLnuGNM3AKUHco6HhoDhqy1jSnfcCBtEbtrSytHWPRbe9f+CT3Qf4mo40od0Pf5jtxlO5Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
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


On 10/23/2025 16:42, Lucas De Marchi wrote:
> On Wed, Oct 22, 2025 at 04:19:12PM -0700, Matt Roper wrote:
>> On Tue, Oct 21, 2025 at 10:17:42PM -0700, Lucas De Marchi wrote:
>>> From: Lukasz Laguna <lukasz.laguna@intel.com>
>>>
>>> The MERT interrupts are indicated via bit 13 in the GFX master 
>>> interrupt
>>> register. Detect these interrupts and start supporting them.
>>
>> This patch doesn't actually do anything yet; I don't think it needs to
>> exist on its own.  Can we just squash it into patch #12 where the
>> interrupt starts being handled?
>
> yeah... while reviewing this before sending I checked "is this an
> interrupt we are actually doing nothing?". Then I noticed the patches on
> top build on it and accepted that as separate. But indeed, both are
> small enough that could just be one thing.
>
> thanks
> Lucas De Marchi

Good point, I'll squash it.

Thanks,
Lukasz

