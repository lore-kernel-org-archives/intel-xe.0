Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4214CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 18:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A889310E61D;
	Tue, 21 Oct 2025 18:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjLuhSKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C144810E61D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761070436; x=1792606436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z8doMzE3hDr5KgYZhoLgFs7nOXbuRooqHZR9s8VSI7M=;
 b=BjLuhSKTCz09oOnBNGnBLy16Q1Z0k6Sx8mzaF2Qpi5i3LTkwkPs0lO63
 t2PXQ/BrP3UgbgoYkLSifA6FjvRNJ+2bWixjfqhz/hyq4qS3dD/YyX6kB
 tCbI5OUMOJKmLI5VeBMsioDPN7RJ0RxxmB8/cYQWucGhxdxinC1n7Pd73
 PV4QDo/E8+fghJAMd4L15qeYUD9aoqfCYrBMN0SNNXw4C/uCIvYNR8lqd
 d/goZBa2oX4UXysLyclbSIrJlgfcn8aAlqlXVixeCR5fOvbNo0vo6FTcH
 4Y0St3SeT2ZACQlkZ/6X1c2iBIljnA02XY5JrkTAirWPXRKqbM/RlKZh5 w==;
X-CSE-ConnectionGUID: S7gOWvz8T9OhKhgi+93fbg==
X-CSE-MsgGUID: 31ikob7pQPOt2FIvFIZj+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88675188"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="88675188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:13:55 -0700
X-CSE-ConnectionGUID: C3flfUZHRLyzdTn7hTVqmg==
X-CSE-MsgGUID: lGt3JlaOTqGR3gMfQSkWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="214294196"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:13:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 11:13:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 11:13:54 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 11:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4JGJEzfJOZ2l1YEQob0GF9CruiMNKgn2HVtltNGCiNGLRRMMVRi9UPxqhSLUnqbud5DhX0dkhsRiMZH6u4QysiR+E4tW1Tn02+W5FoEe5vgD5b5TY66RO2L34SIf3w1GaYrb4MrJHp9W+ZDN1YjyRheYz0DNpc0mn7fElTLJqqcXjL4kQ/uVYc4Gb7hbco3dk1pN2Sp+pztHg0/esAc2hS0DO8idXz0CIMcTZPTykMn0QgDl5rj2GOx5IjoeU2jRP2HYxS9AwOHEOydaTaA0C9wBSpFg4dX/BHJnZUwDVFUfNd4RxGt0+FJI0HoHyFXANAZC0b1fpPZc5DgpjksKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYGRCT7NmAGZsUlimwzVfqYKNDLGj21ccX5Mb4WIIjY=;
 b=ZqGhQuqNYeIIWKYKw9cSCa3ixWQqOzXQYyBBuDGTZryhV9g7ESm3/HBPtwg83pb0kMKzbCCrNAnYmn8hbdJrPO5K5ue+o9kv60OBPYbuim+I0ZJiXiEL8MukONyF3VkiIuyhDbVVBvnOG97y1Q10/s/vXnxcfZrvjlNO9BlpaPKbEoAL+6Kq8zow1dkC0AIw6pUdYUprantsDs9LyDWB/yQCmVnO2IjjcgToxKea2I9aQsFC2jExHfnwjGxNC30ABymccWajVUhDhkGbUaUy0mbpBvBNXFUND2ox7XSHTBdzYLAjAseEJH4CaTZcnetnvSl2S3kkITphhw0wVC6mzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 18:13:52 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 18:13:52 +0000
Message-ID: <f95b87cf-4782-442b-8ab1-3c73354e67fe@intel.com>
Date: Tue, 21 Oct 2025 20:13:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Revert logic of vf.migration.enabled
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251021181250.1541639-1-tomasz.lis@intel.com>
 <20251021181250.1541639-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021181250.1541639-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0045.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2b1348-4839-4f5c-bcb2-08de10cd96d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3dVL252SHRLbmhsWjlJVkdvY21XMUx6QVRKRXpQNUpjYlNMWkdvaVN0Nk5q?=
 =?utf-8?B?ajkrZTQ3SnJ1KzFZMWlpbEd4ZTlWTS83eVZpZUpVTUZFNWNtSkpjbXpkL1d4?=
 =?utf-8?B?MkFqZ0JyZllvWExZb2o0dHViTDBBY2JvSjZXQitMd3U4WFRuczJPM3B4TG96?=
 =?utf-8?B?UkdrK0JWNFc1aHBIeFEwNC9uK3FCK0M1c0YzN3Rab29DR0w4THRIOHlHZjlv?=
 =?utf-8?B?Wk43RDZKWG1lVTF1RVFlTUZZOG05V1RUMGRUOVdzYlBDcG9ON2R1SVF1clhr?=
 =?utf-8?B?eDRlM2gweE9aaUN2c3B2TjhwYXc4cFlZR2w0N1FhdThET2xDYkZUc3YvSnBC?=
 =?utf-8?B?MmVPZzFSWERqdW4vaXM1cFNxYXg2WkpWS3JIcTVZUTZiNHphVmRaZU14dy9w?=
 =?utf-8?B?cEVmKzM4VGZuTjhRWXFSZ3o3dFA0L0prcFRlanh4VlBSakRPU0JmdFduN1lp?=
 =?utf-8?B?dWQ5VWNCa01aMm1jRlBaSmNVQy9HTVYrUnZtQWN0MjN4MHhaUWhQQWRKK1Zn?=
 =?utf-8?B?ZVo4dWY5Q1ZPK2l2UjZIS0M0d1puL3UreGYzS3A2Sm1pUnV6L3ZoYUh5bkRY?=
 =?utf-8?B?TWZ0c0FYREVxYjBzWi8yR0J1bGtJMy9leSsxc0VOd0owNE8veEJzM05PcjVB?=
 =?utf-8?B?N3dBWWpZRjM1SWNsUVJwbWFiNStyOWk0aEZTSTU4bTVKQnRnS0RFYmlEay9X?=
 =?utf-8?B?SEJxQURYdFNXMWFIRlRmWUtXUWdBQUVQMDRrWS8wRkt6UVVjSlR3emZ5RDFj?=
 =?utf-8?B?YnFOdlNNVmlGVUdWQ2hHcWJGT1NIdnpaaXJGcHIxdTdicHVpaXVvRkZ5b0Fk?=
 =?utf-8?B?WmpDVGtVcE5OdUNnUDVFV2hCMG9WRXJkcTQrZ0tiVUd4N3hINTZvT0c5Rllu?=
 =?utf-8?B?aDZMeXpBTzJHaVFDVHMxbnNvU1pOeUtCc2hVNTlFYkV5OWMramo3Z1pERC9N?=
 =?utf-8?B?MFlTeDB0S1EwcWNCUUx4emcydnJpbWpVbkNHVnNZc2xtYVB0SjUyMHZReVcr?=
 =?utf-8?B?RVFzMEpLQ0dHQko3S1ZySWtTMEh1djRWQ2ZueXplZFNKSENOeEpYQUVkUVlK?=
 =?utf-8?B?NmZ4T0ovNWdVczFCYyt2Y0xnV3BYWGVjU1hROWpLU25kcEU2SCtYN1hXV1E4?=
 =?utf-8?B?K1RGVkJEOVRZR1lMTWw3U0k3dDIrRzVFM1BmMlNhZnl5SnlkSXpiSlJDeENX?=
 =?utf-8?B?aGwycjVwRWJReW9DUDVGNWovSm5EaUEwcVp0ZE1rQ0c5MTJjYTJyZjhsU0lp?=
 =?utf-8?B?ZU5yakFqZGVrZjRZWGZGbW5ySDIyQlB3WGZMMERyY1JNWFBBMGFwSzlNem1x?=
 =?utf-8?B?dHM4UUIrb3VmcFFSSGdJbGNXeVdXZE0yaTYrMjNtTDF2dFRYcHRtc1JtMWNq?=
 =?utf-8?B?Q25QWUZWQVU0R2pVS0JkNjJjWDU4RVhnSHV0RnVjR3NPeEM4cEFQb1hXYkQr?=
 =?utf-8?B?cHUwbnFnYmtNbGNIN3dZSmVpTll1Nm9HbGptMVdJUlhyMjRBcGpseXV1WUlP?=
 =?utf-8?B?SmxSdHN2eHBlVjhKd256SzNDSm1USG91OGJQSmdrc1NRa0VLOXlITHF1aEp3?=
 =?utf-8?B?b2JkWXJFMFlFTi9LUzNTUExGRDlnWU1hckt6RUNQL3NySjRqZzRUZUZZZVlx?=
 =?utf-8?B?Ulg1ZGk2U1BDNHI3SVJPNnU2WDNObHJmdkJKdmxpWDBLR2dtenpidHQrNlFa?=
 =?utf-8?B?NjFTNktlVGNFemwwVWp4R0tlbVRHOXNPN2V3RWJyRk9ick1XeEFINFFNaHFL?=
 =?utf-8?B?ZXhCRVJQYTVuNndFaksrVHVCdWxFYWl6aU9HWHYvcUlyTFBJSGdqRkFPcmIw?=
 =?utf-8?B?akwrd3lQSnJHUkJSVm9WZVdVdWM5VHdpdXJWRFdOWSs1ZytRY2ljRElrdmV5?=
 =?utf-8?B?dER5ZmtFV0hGeUtzSndLWWN6MW9tdUwzUmtZQ0VMdCt2SlY2Yk81YmpGUnBV?=
 =?utf-8?Q?sO2Zm4T5K5UW9XORmnFxF9ZCsrO5o8Ck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBVRUV3aWN2M1ZZWTZPdjBka2ZhWUpWT1Z4ajk3RWdzNklaUkpxaEFkNStQ?=
 =?utf-8?B?WGcrYk16R2dCZUdKMnZRYmJhK1ZvRzA3OFhVNDZDVUVZWDR3d3RHczF4czJu?=
 =?utf-8?B?MTNhUUljUFkxN1VsQ0tiSlJsTHBSNXZ4azJ6bHlDQUNoLzVtSm02S3ZBSG9U?=
 =?utf-8?B?eXFYOG5JQlhURzZpK1Rvc3RiY3lDUXo1MlQ5SkZIaFMrdVBZT0lqUTFtUWtt?=
 =?utf-8?B?Z1dqT3pLV1ArTCsxMmtnRHkrUFNVVlR5MFlYems1VnFXMmdIOEViMnV1dC9J?=
 =?utf-8?B?azBJRE9JaTVQRTlwL2RDSEp6aThRYS9XeDVwbFhtTU1lT1BKdlRkZWVHRTFE?=
 =?utf-8?B?T1VlN1cxSFEzcGVlQWZ6MFZMNDY0Uy94K1VFOG04Vks5czJxTnV3R0U1bnVN?=
 =?utf-8?B?ZnBibzZMTlJ5aFQzVFAzRnl5VytPRjl3WXFyc0h3TFAxN2tiTjBCRWNOMlNC?=
 =?utf-8?B?K3UyUitlb1BzeUxlc3lwM0lDQUZnRWdaVlp2aGh5SEhOSW5RQTBMZ0M0bmtr?=
 =?utf-8?B?eUNqTjJybmFuL2l1MHAwSEIyRy9TNkRySmpyY1BMYVNJaU1Fa3dUU3Q3NW9C?=
 =?utf-8?B?WWNjTEkvOUFnK00rWUFtVzBGbjlHWWdpVzVUVWRWc0NGQWlwSUpONXp3TUd6?=
 =?utf-8?B?V3EwZldtOHd6UEVPTWNsY25CazVnZDdEZ0xCUm5KWW9ZK256VENrZDNuR293?=
 =?utf-8?B?VGw5ZmFKR2dXZDJZcGdhZUN4OERVaTA5aU5NanBrSmNnVUdHdEFFMllQbzBa?=
 =?utf-8?B?eWZ6QzMwQjN0UzF2VGtReDhWaU05cnBIRGRxekhMNXNEeUdCTlR2aW13eEx5?=
 =?utf-8?B?OCtBTEp6OWFhR3d3T3VQQ0lBYVpQWWhYUEtvTTVJM2owbVkrclV2S09yekxm?=
 =?utf-8?B?bkdzZUtWZHhNVExwRDc3Qm9MQTBNZjJkUVlHOVZvdldsbXBLcWVRUWRVZlI5?=
 =?utf-8?B?Tldic0tiRjJDaFY1SzJIRysrTHdWZlJ0Vm5hcmtFUzRMS3lnOWNoUkpiS1FE?=
 =?utf-8?B?T2d2RmJnZEt0bnJ4MEJUQ3c0cTNVK3hRZHhwMUxZNUpkckU2OFArbGF0MWpz?=
 =?utf-8?B?b1ZhbytqaGQ4cEFYeDgzY2pRTVVOZkZOblFOeTc1QkF5OWRpelVkZXZtemJl?=
 =?utf-8?B?a0gwaXBickQwTENpODYwc1IrVlN5NDZoWHVhRUxjMFFVbXFBR014dXA2bkJm?=
 =?utf-8?B?anF0ekl2dnVncCtyVjNDUVdZT01WMkpybHZoaHNON0RXMDJhL0ZWWmc1VVYz?=
 =?utf-8?B?TGpodlVxT3BqdEM5UjlZN0hmaVk3VUNWbVVQYkQvak1RZ2RhUE9LZWViNS9w?=
 =?utf-8?B?Sm9JV2N2bEtMSzJsbjdwM1hRQ1hSUEhGOEhTRE1hei9SMUY0U0htWU5UdjRC?=
 =?utf-8?B?Z0xGV3FXUEJsWkFNNE5oNTdFT0FqTEFZTHU0K2kwck50c0owNHArTkU4a0JK?=
 =?utf-8?B?QVg4MUNtK0xOWHhXQ0NuK3lMUWdVMTlCUVBXL0hKNDJUbzBPTlh1MGtBazRx?=
 =?utf-8?B?VlZrUHluTlBGWmF1d3dNYWp6ZmozM3Y5QjErazMwUDhQUHhVTWlmV01rTFgz?=
 =?utf-8?B?NUpnSGZmUzVKclM1U0NSbHRVVnlQSnp1NjVEOWJQcTd4aGdkTVpxSXVMb3E5?=
 =?utf-8?B?RGdieE9zOUwxMnNuc0pwUW5uRk5WTEErWHNEY3lBNWJQM0oveTZCK2J2dlJp?=
 =?utf-8?B?czVnODlIQWJNU0hpWGlxRWYzanpzeDFZTlBsOUJBUWl3RnQ2Y1JGckZUV2ZS?=
 =?utf-8?B?M2tNaDdzd0RvSkNTTHlpbFIwajh2YkpuNGVXSGhQb2lJVTc4YUNVK0podFh3?=
 =?utf-8?B?MGoyalA0Z3JIU2dxVDhVdS9NRTFGWVgxQm1QUmFvcHg4RHMwc3k3T3FadnJp?=
 =?utf-8?B?WDMzcHZmZzZxTXNxL2RneHN3Z1hWTlc0eVE4V1NPbmFZZkdhMHUrYnVSNlNZ?=
 =?utf-8?B?Vm9qNGdvNlNtVURvR0MvbWFxejhkS3hVZTRDelpZRWZta01WQXNlWFNnRktp?=
 =?utf-8?B?SkhybDVUNDdScndIYnV3TklNZVhwdThvL0RodjNiZ3g2REhvb0NEMWFZUGpM?=
 =?utf-8?B?THdaRnVIdmM1NFpNOW1IUFplTC9aTlhpYk4wQXJIcDdOR2p4Q3FsN01sSXdz?=
 =?utf-8?B?aVJuVVVXUi9yS2o2RjRESGVSK2lXenVtLy9tek5WVlZCZnJJb0V2Q3JJMmls?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2b1348-4839-4f5c-bcb2-08de10cd96d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:13:52.0204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsrB/pNlt9wodA24HpIur+XrtvHcnvy+nXFEWdYdgxJJ9HZPWHXDZ8R2Rw11UX9KP+9cVrc0jQljCAofzyiIAf5SNxNAtcIcRqgj+nzPzJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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



On 10/21/2025 8:12 PM, Tomasz Lis wrote:
> Convert `enabled` property into `disabled`.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> v2: removed writing false to what is already zeroed out (Michal)
> 
>  drivers/gpu/drm/xe/xe_sriov_vf.c       | 7 ++-----
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h | 6 +++---
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 911d5720917b..0d8135f3927c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -130,7 +130,7 @@
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> -	return xe->sriov.vf.migration.enabled;
> +	return !xe->sriov.vf.migration.disabled;
>  }
>  
>  static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> @@ -146,7 +146,7 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>  	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
>  	va_end(va_args);
>  
> -	xe->sriov.vf.migration.enabled = false;
> +	xe->sriov.vf.migration.disabled = true;
>  }
>  
>  static void vf_migration_init_early(struct xe_device *xe)
> @@ -172,9 +172,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>  						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>  						    guc_version.major, guc_version.minor);
>  	}
> -
> -	xe->sriov.vf.migration.enabled = true;
> -	xe_sriov_dbg(xe, "migration support enabled\n");
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 6a0fd0f5463e..d5f72d667817 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -34,10 +34,10 @@ struct xe_device_vf {
>  	/** @migration: VF Migration state data */
>  	struct {
>  		/**
> -		 * @migration.enabled: flag indicating if migration support
> -		 * was enabled or not due to missing prerequisites
> +		 * @migration.disabled: flag indicating if migration support
> +		 * was turned off due to missing prerequisites
>  		 */
> -		bool enabled;
> +		bool disabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */

