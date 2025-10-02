Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D721CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 07:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6078D10E041;
	Thu,  2 Oct 2025 07:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Temr5fnk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1C010E041
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759390630; x=1790926630;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BvdpwyZulO4LKxkyCpR72vGl0ebLW4PdSasE+VIdCaw=;
 b=Temr5fnk50wLV+/VUAFyOn0FnpcMlD355hafRP0ZvibQwKghv0NvgPPM
 EOsFkui8FVspOsOH6/M3qtdtQF9yOjz1yg+DB6ZCWq9UCRes0f+nqAlnu
 W6bvbrJy0UFutAK4N9u+vnjkJuFytqI3BKYebgcxTL0mgYEHflA0CcHAJ
 vivOnYGdoOatsoZkdjVIxpX2PLFkM7qXS7iLvGcPpuSozZNj756ObJ7U9
 Xs2avLZ9yGFcYJi+KNxuJCewGMO9joPRmIx59gShCJHiwQT3G6haTLGYX
 BzJKIxVsPRgpnmOtjp9QVCLokp/NKPYk9oDEhNWxGjiDi9gcYizF9n9PU w==;
X-CSE-ConnectionGUID: nQAA8ytCQAO0TPPzNAJ3lA==
X-CSE-MsgGUID: SDsbfce0SUuJZkvvPmsBUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72779937"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="72779937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 00:37:10 -0700
X-CSE-ConnectionGUID: FEaxmVcxRIGbrEtMZsJx0w==
X-CSE-MsgGUID: u0vy5M5nRkGGtes/KxwumA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="209694515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 00:37:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 00:37:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 00:37:09 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 00:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDAQddfiTMOD7isVnmpF1n6c13QDZLwyOx7/UMmnhyFb5LvsXpj2i4yYl1bGjWdU+R97OBLETX9ehP04KGscdLluI9LeKfCo2Y8eJEgGFFYWZQvDPeYBIUVIjqFRzm4PSgS7e/A7qnlvjBg199cnvoUI+SHA5WmPE5TLvgMTxsfN/IYM+CaZwz5anMinOxb7XZApMDCUo7t0P5naTeKonymrJpcD3qRRzaSqcYezA0hVo9SSyedFl4BzGYI4Uo6fB3yuai92CFAy9OZ0a4HS2F8nadhMxRZzH46WgcW6eVuYCmGtqorhAaAB6IN7jiHkZp1EIOMS7J8bp34krA9P0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAhsh5SS0ewgI23w6UV278IEEBGiieaBE8nBX2TP5YM=;
 b=X1TUKbvG/9OHbsYXF/FHWtspwBGHaIcipmrAvWpDemuS3Xb2PIaU8Ne3j9JLK471kW5XPWlS2WWIy5/9tsETykeQPULMHZH5MPJliSQr9MLfX9LICyKV0anNjXTvgf2K0ONOJKe2KEObQbgk/5atjS0SeQnncDbewQu8FqOQABVh2UKP/LsYuDctCVr8zOpjriky3HyEu1FPW3fAnEeYTsjwJnu//t4Rt0tpZPNrBysMFLgezDpCTrk+ZuGnMrnVid6ueh27XsLT3geCqBSxhVuedgOBynku4triLI7lSZayg62D+h9W9KU7icOcAO6BaaGBLYs1z2O0veVdN9zeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 2 Oct
 2025 07:36:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 07:36:58 +0000
Date: Thu, 2 Oct 2025 00:36:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 29/36] drm/xe: Move queue init before LRC creation
Message-ID: <aN4rl7zRKf5ex/fF@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-30-matthew.brost@intel.com>
 <1d5a68ac-290a-487e-a02a-a9e61167d538@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d5a68ac-290a-487e-a02a-a9e61167d538@intel.com>
X-ClientProxiedBy: MW4PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:303:b6::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFCE18D981F:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f1d26f-de30-40db-20c5-08de018677af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWM0dTVhbWswWWEvSGVYQXgwOWsvT2w0U0FBWDUralR0R1VBY21YTGtST1BF?=
 =?utf-8?B?U2E4ekE4WHNQN0xhSHIzYTQvRU9PZHN0NXlsV3pLR0R1Vldncjd4NERzOFRJ?=
 =?utf-8?B?dmFreHgvbG5rclBVWFpjZEF3TFhPbS9SSkZzemRVV2c0bGhCbmZFbWlmNEdU?=
 =?utf-8?B?d0dFWm14ZnhsQjkrUjNGb0FYeElTZGpwYXNDckZvSU42WVdrY0haeU55WmpT?=
 =?utf-8?B?enBkSEdyZVdkL0NUWjNhWUtrSzRGSkZrendnOHF4UGNVVDJ3SG02WXN5OWNI?=
 =?utf-8?B?U2ZJcWZQZDBIMnVCQ3RVZDhVUkRhbUR4TkhvemdyZE5jZEJxWmJDcU5UYjlZ?=
 =?utf-8?B?T1dYN0I3WWdzM29DSUxTNS9MS092MnhxY3NiN3d2ejl6eERlU0dSOWZuUGJO?=
 =?utf-8?B?ZCtzbFdVSGtybnpKeURZbTFXanl6VEQ0bW1iWDRhZVNtaitRWm9lYlMzZVZ6?=
 =?utf-8?B?NXo1S1ZOQzRZZ1RkR0VMTnkvRUhwbit5M0NXYmErZnF5MG5KeVJMa2duMjh4?=
 =?utf-8?B?Sk1iQis4UW92aGlJZTgxcktseTNwdW41dlNNbXpKUXh6cmpBTkxScWRNcEpI?=
 =?utf-8?B?UlZ2ZEIrc0xDL0FUOXF1Y3J0dDd2R0ZmdzI4bGRKdTNpMVBBU3FHdnZzaHE4?=
 =?utf-8?B?dkQ2ck83OTVieElKb0FmTkpVMnJ4UmVaMHFDQlNZS1FNWlNzQlRGdmE2WjJI?=
 =?utf-8?B?bXZjWUdZeWFObWlzQk5hMkZndmsyOXpBdEVOdytLSTlOaUl1MkpTd3Z1eG5M?=
 =?utf-8?B?MUF2eFFrYWVmYzZQVXhINzhmTVMrYUcvQXFyczdQTXJZbHFQY1k0RWpCeUht?=
 =?utf-8?B?T0FkV1BxcFphM3pZRUM3RkxwQ3JWekg2MEgxcU9PaC85VHlPVzd0QWtXWUtQ?=
 =?utf-8?B?K2xYbXZKNE5VanhIczk1UHAyZXFCWW03YlgxSVhUbFdHeTFnak5mN3BDNUNF?=
 =?utf-8?B?Z2lJNy9uQ0ZwNUhrdG1qMU5IM0V0bDFMakdqLyt6NWVORGNHeWlDbWY2SlM4?=
 =?utf-8?B?TURONjdTTjVIcG9lSXJYcUJNZWQ5akY0eUh4VXQ2WmtLenFHdjBlbG9ZSy9W?=
 =?utf-8?B?NHZ1QkpUQ3ZHN1NJTmFLZDV0Q2tEL3lQaGg4OEZrS1lwSXFLZFVEdWZwRnZp?=
 =?utf-8?B?UDFocHZaT1RNMGx3cndhSmZDN0RjSzZNakw1VmUxR25IMjBrNXgzendGNk9I?=
 =?utf-8?B?d3dqNlpFL1hpNm1TN2UvUENZaVk2V0JVTXNGUUtHY3dWaG45S2lwejlpa0Ur?=
 =?utf-8?B?eXFUbGQxQkxMbVMxRGJINmhGRDlscVQ1VE5yTmg4Y0JBQ1ZSWlhmdnVWK3dz?=
 =?utf-8?B?NWtUbldkcGZaSjZpSlhkYytJMVo1b3FJaFZlQXNSdk1NazluRFRyR0ozMVY1?=
 =?utf-8?B?Q2NYbkFlR3dER0JKdytRNklJOTg1dlVCL1E2aS9nZFJNUHhBM0t2bXkyWHo5?=
 =?utf-8?B?MmNIR3BhQm94Q2d5WU92UnYxL3ByWGxWd0l6YmdJN0F3bzhGTU1YcklBZGJC?=
 =?utf-8?B?ZjB3dGpHTVIzb21PNlA0RHdPQ0Z4elhxSzNSajhtMUtET2M4cnRUSUlEaFVm?=
 =?utf-8?B?Wm1LWXUxcW1tMHZlZFdWYUk0OHEwRkxnWTJ6OFVyUkFPYXkzMGxhSUtYSUpl?=
 =?utf-8?B?SUlBWTdnM3RlRmVSbEI5U0pWcUFwd1dVZEdTZjZKdVFLQ1VMV3FLZWdXKzlr?=
 =?utf-8?B?K1FnaUVEOGthKzJHN3d5LzhzaUFZVi9RcTBQcElMNUllL2ZpT0I5Z2Q5eE82?=
 =?utf-8?B?dDVlZmVUditnYkRzWWR3R0YxR3NoSE9KbDdMUFpUWUwrZUR1UzhqTDJVd0Zy?=
 =?utf-8?B?ZnFxb0NTcmxpVUl1dmJITmNhZEpXbG9BdDFMUXk4THdaN3ExMmNFZnBvU3Nr?=
 =?utf-8?B?OHpnTEp5cHFvR3duQzVZSUZ0ZkJrcDFHSGNJYjZTQ21mSXJnWjMvMmt6c3Jk?=
 =?utf-8?Q?GRI03cvptKMyzq5smZidQ0K2XiHKqxt+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmwyOGNvWVhUZUZKUnJlcHhqcWhwdU0wNjNRM1cwK29LR09PNFp1cG1FbUJ3?=
 =?utf-8?B?aWViOE0zUk1ndWt5ZTRDalB6aUFJaVIwWFAweGxMTEhIQUVMWnFGbkU1TjVj?=
 =?utf-8?B?MG5mTzBoUjRZbUpITm5sUytkcFB6dVhWdWJEUy9wdXZWWnVZdVFkbm5TMXg1?=
 =?utf-8?B?cGViTnAydkhXbVhUNkxEYkFqY0pDa2R6N2x3cjhmYzg1bHp3UUE2Ky8xaWIr?=
 =?utf-8?B?S1dYbHRNdWZLVDJvM1E4RnJWcjRBeE1tMTFEeE5Qdyt6S1FrV1RBT2RwMzRT?=
 =?utf-8?B?UW5vdklpYmdpR25NSGJvSStsa1dQdmJRdW1pc0o0WnNxejF2L1Z4Mk55dUo3?=
 =?utf-8?B?RlEwY2U3VlJ0NzNqU0xZMTJPZzZ6U3A0N25ycHg1VmVGaG1odjkrSm9hVVND?=
 =?utf-8?B?bUhZZzllM2lRVjZCSDZ5SFZIUENJVVV3TWdWQm01dW8yb2ZOVWxoODE1WnR4?=
 =?utf-8?B?b0tBTVNHMjBac3ZDaG1yUGtEZDhLWWlFOXdjYW8wYTg0TTlPNm1ubUJaVVcv?=
 =?utf-8?B?MFJ5MEltTExJU1Jtc0VXa0xwSXpNU1BvcVd4cDZnSHY2ODhuTzROa1EyZUFU?=
 =?utf-8?B?NHArOUQ5d2pIU1Bxb2lhWGNHeDJyMUdSaUtFOU9CVE94TGZub0pMcVlPNFZB?=
 =?utf-8?B?Y0VSOEdDZ1kyemloYnhnQTdGUDJQY0VTSnd4YmZtY2hPNUs0OCswc1hVOEc5?=
 =?utf-8?B?SE1NSlphTTFzWmszZkF4dktsNUxBTGVralp1b0RSelpRMndxaWJIUVdBMEhH?=
 =?utf-8?B?aG00ZUJsOEhSZVh5QjVLNWErcWcybmVCTjBFYituMlNOcldTUVpZMTNneFE1?=
 =?utf-8?B?eElSTHA3R09NUlU1YVZYQzBhT0paU0J3R29nWXZJazdVQWYzeWdHWmpseGxE?=
 =?utf-8?B?V2grV1QwU0NtYWRVc1ZoM2RadGQvejJoUGRDUEloV3p4Y2pwUy9NRFU5K1Mw?=
 =?utf-8?B?L3hoa3hrMDZGRms5U2JneHJpcDJFQ1RjUjRvWTk0UEIvWnlkWSswRjZDcURR?=
 =?utf-8?B?dTFvNml0OFhrYjRnSTRkdkZnV2lCK293NjJwMFVwVzlhYm94amZ0UC9uaXQ4?=
 =?utf-8?B?Q1pKbzI2RWVpaVQ4V081dHl0K0pTbGxFdS91Y0RlV0sxVU5zdWhKcGRaY2NB?=
 =?utf-8?B?Q0xmU0dSbTNaWGlvbkUwK3RudEttZjV5bDhuNGJWMzJqc0hOY21ld1pseU1F?=
 =?utf-8?B?Y0V1WTlhMi9Md1pxamZLVkd4Mkpydk5hV05uOFd2VjhQZGtrQWZFcEhzQjBI?=
 =?utf-8?B?ZUNBWFVVdDRjNFFyeEpLeGI0ZVZFczBPbFo3VThBWmoxd3J1S1BnWjRIck1z?=
 =?utf-8?B?ZkFZcEhoU3BKQnNhNkxTUkhiK0lOL3ljUUk0OXVySkJ5V05MRENKUGphOCth?=
 =?utf-8?B?djZoU0VGMzZ0bWV6WVUrUkNtNmllNHFZNENGMGJNdm5EaWtMSmZUZlZxQTdo?=
 =?utf-8?B?WWpIMkpRcTJsSVpVZkhTODFmZ1BXVlJvbVEySnFHL2o3dlZWajJwem1rRTBJ?=
 =?utf-8?B?d3U3b1Vja3ZiemZndElsZ3NJQStCUDFMTEhhem90K21kOThvbDlnc0pyMFNI?=
 =?utf-8?B?blpBdUZCWGZTMEgvVnBHOUtPckZzRHVOdHQwV3RyYjUwNERKSUJFaHhuU3li?=
 =?utf-8?B?ejNBcW9CejU0S1NFVHRxQ3JBdENxRlRnZW44cEROd25nTHQ1R2NyYjJZRnJO?=
 =?utf-8?B?TUNQVnJzY0loUEZ4MEVqOFZINjJLT1pLeHhranNHVHlOOFAvVlNwVjh0aXBJ?=
 =?utf-8?B?NTZkeThkQTM4YTFHbHIvUGNwVlN1MnpPUkkvYkZmeXhEeElORGk2RW8rZ1Jq?=
 =?utf-8?B?bmUrSTVleTY0MXkrNkd0Q1ZoVWdqTEx0YzZmUTF6UHdTRGFxbjdRYlFlLzFX?=
 =?utf-8?B?OVJrT2tsMGxQclFFUmorK3hCenN0QmY5SS9ySjJyaCsrazhoZGFhV2pZV3l6?=
 =?utf-8?B?Sm9xRFp2MVd5aDdHamNIQXkzTEJydXJiZzBubU9BWDVDWXdrc0hGakV1Ukht?=
 =?utf-8?B?RDdaWExyclVXLzFJYUVZcFZjdXY4bU1KcGVCblFCV0hnMXFhclVUNk1xamxI?=
 =?utf-8?B?U1gzek05QjYvbzRhaExCeWJlLzhFK0FoK0l6UG9kWlJKZTdZTUFuTGtXL25n?=
 =?utf-8?B?ZVpWem95Mm5VTFptOWpsdTNmYlNYM0RCd1B3TmM2d2dHV2RGZUk0bTU1dmtj?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f1d26f-de30-40db-20c5-08de018677af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 07:36:57.9886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4X43QQVUxWlQWtDiWvHE33XfdU1nJJduqfMFqeKOS8gWFLI2FPc6BbsdJYSWBw9L7QHbdf0ORVMYlIYfKO3BkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
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

On Thu, Oct 02, 2025 at 02:44:47AM +0200, Lis, Tomasz wrote:
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > A queue must be in the submission backend's tracking state before the
> > LRC is created to avoid a race condition where the LRC's GGTT addresses
> > are not properly fixed up during VF post-migration recovery.
> > 
> > Move the queue initialization—which adds the queue to the submission
> > backend's tracking state—before LRC creation.
> > 
> > v2:
> >   - Wait on VF GGTT fixes before creating LRC (testing)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
> >   drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
> >   drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
> >   drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
> >   7 files changed, 90 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 81f707d2c388..3db8e64d9d13 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -15,6 +15,7 @@
> >   #include "xe_dep_scheduler.h"
> >   #include "xe_device.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_sriov_vf.h"
> >   #include "xe_hw_engine_class_sysfs.h"
> >   #include "xe_hw_engine_group.h"
> >   #include "xe_hw_fence.h"
> > @@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> >   			flags |= XE_LRC_CREATE_RUNALONE;
> >   	}
> > +	err = q->ops->init(q);
> > +	if (err)
> > +		return err;
> > +
> > +	/*
> > +	 * This must occur after q->ops->init to avoid race conditions during VF
> > +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> > +	 * depend on the queue being present in the backend tracking structure.
> > +	 *
> > +	 * In addition to above, we must wait on inflight GGTT changes to
> > +	 * avoid writing out stale values here.
> > +	 */
> > +	xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> 
> So to avoid locks, we rely on the VF knowing it got migrated from the first
> moment after vCPU starts.
> 
> On `qemu`, we do have it this way - when vCPU starts the 'MIGRATED' memirq
> is already filled.
> 
> But what about other VM managers? What about future support of platforms
> without memirq?
> 
> I don't think the availability of information that we've got migrated from
> the first vCPU cycle is guaranteed by any specification.
> 

It is guarnetted byt the design of Xe.

> 
> >   	for (i = 0; i < q->width; ++i) {
> > -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> > -		if (IS_ERR(q->lrc[i])) {
> > -			err = PTR_ERR(q->lrc[i]);
> > +		struct xe_lrc *lrc;
> > +
> > +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> > +				    q->msix_vec, flags);
> 
> If migration happened at this place, it is still possible to create a
> context with wrong GGTT references in the one LRC which was already filled
> but not integrated into the queue yet.
> 
> I don't think we can avoid races without a lock.
> 

There might be a small race here, let me think about this. I will say
this change xe_exec_threads --r threads-many-queues though. Locking is
definitely not the way solve this though - reclaim rules are in play
here which make locking difficult and convoluted cross layer locks will
always get nacked by myself and others.

Matt

> > +		if (IS_ERR(lrc)) {
> > +			err = PTR_ERR(lrc);
> >   			goto err_lrc;
> >   		}
> > -	}
> > -	err = q->ops->init(q);
> > -	if (err)
> > -		goto err_lrc;
> > +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> > +		WRITE_ONCE(q->lrc[i], lrc);
> > +	}
> >   	return 0;
> > @@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
> >   	int err = 0;
> >   	for (i = 0; i < q->width; ++i) {
> > -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> > -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> > -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> > +		struct xe_lrc *lrc;
> > +
> > +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> > +		lrc = READ_ONCE(q->lrc[i]);
> > +		if (!lrc)
> > +			continue;
> > +
> > +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> > +		xe_lrc_update_hwctx_regs_with_address(lrc);
> > +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> >   		if (err)
> >   			break;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index f83d421ac9d3..769d05517f93 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
> >   	const struct drm_sched_init_args args = {
> >   		.ops = &drm_sched_ops,
> >   		.num_rqs = 1,
> > -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> > +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
> >   		.hang_limit = XE_SCHED_HANG_LIMIT,
> >   		.timeout = XE_SCHED_JOB_TIMEOUT,
> >   		.name = q->hwe->name,
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 0d94867dce8e..42f9fd43b436 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -482,6 +482,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >   				 shift, config->ggtt_base);
> >   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> >   	}
> > +
> > +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> > +	smp_wmb();	/* Ensure above write visible before wake */
> > +	wake_up_all(&gt->sriov.vf.migration.wq);
> > +
> >   out:
> >   	up_write(config->lock);
> >   	return err;
> > @@ -820,7 +825,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >   	    !gt->sriov.vf.migration.recovery_teardown) {
> >   		gt->sriov.vf.migration.recovery_queued = true;
> >   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > -		smp_wmb();	/* Ensure above write visable before wake */
> > +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> > +		smp_wmb();	/* Ensure above writes visable before wake */
> typo in patch "Wakeup in GuC backend on VF post migration recovery"
> >   		wake_up_all(&gt->uc.guc.ct.wq);
> > @@ -1344,6 +1350,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
> >   		&tile->primary_gt->sriov.vf.self_config.__lock;
> >   	spin_lock_init(&gt->sriov.vf.migration.lock);
> >   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> > +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
> >   	return 0;
> >   }
> > @@ -1387,3 +1394,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> >   	return (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> >   		READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
> >   }
> > +
> > +static bool vf_valid_ggtt(struct xe_gt *gt)
> > +{
> > +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	if (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> > +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> > + * @gt: the &xe_gt
> > + */
> > +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> > +{
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> > +		return;
> > +
> > +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> > +					       vf_valid_ggtt(gt),
> > +					       HZ * 5);
> > +	XE_WARN_ON(!ret);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 71e1d566da81..20cc0c4c32e3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -40,4 +40,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> >   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> >   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> > +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index e135018cba1e..3c3e415199d1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -8,6 +8,7 @@
> >   #include <linux/rwsem.h>
> >   #include <linux/types.h>
> > +#include <linux/wait.h>
> >   #include <linux/workqueue.h>
> >   #include "xe_uc_fw_types.h"
> > @@ -61,6 +62,8 @@ struct xe_gt_sriov_vf_migration {
> >   	struct work_struct worker;
> >   	/** @lock: Protects recovery_queued, teardown */
> >   	spinlock_t lock;
> > +	/** @wq: wait queue for migration fixes */
> > +	wait_queue_head_t wq;
> >   	/** @scratch: Scratch memory for VF recovery */
> >   	void *scratch;
> >   	/** @recovery_teardown: VF post migration recovery is being torn down */
> > @@ -69,6 +72,8 @@ struct xe_gt_sriov_vf_migration {
> >   	bool recovery_queued;
> >   	/** @recovery_inprogress: VF post migration recovery in progress */
> >   	bool recovery_inprogress;
> > +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> > +	bool ggtt_need_fixes;
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 497a736c23c3..7fe3fb07e35e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> >   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> >   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> > -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> > +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> >   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> >   			    q->name, gt_to_xe(q->gt)->drm.dev);
> >   	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 188565465779..5fb6c74bdab5 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
> >   	kref_put(&lrc->refcount, xe_lrc_destroy);
> >   }
> > +/**
> > + * xe_lrc_ring_size() - Xe LRC ring size
> > + *
> > + * Return: Size of LRC size
> 
> Size of LRC ring buffer
> -Tomasz
> 
> > + */
> > +static inline size_t xe_lrc_ring_size(void)
> > +{
> > +	return SZ_16K;
> > +}
> > +
> >   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
> >   u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> >   u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
