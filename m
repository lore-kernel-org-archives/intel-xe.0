Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A2D12687
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 23:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA5F10E68F;
	Tue,  2 Dec 2025 23:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqduwf7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F19810E68F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764716532; x=1796252532;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nWPIWHye+qWXgDtDrx6DKuHYlNX21HZDj6esib6oLKQ=;
 b=bqduwf7tdT/Fp0CYOudiEZXM1vqqi2uhrvwCBDjJ4sFeCO/ygCflWdJL
 h8xwmlEetZLTWXa93+IEU3MTSoG2/FLf4COIAnKBYft/9SzlOvaInQC22
 mV+noLYZUaJkz4CSEJLZnHJP1lCMVChUU03Gi/6tWmYDBuanf+tFQelnW
 4YA15exsz+j4CqlfTOiGCpobsk2vZvfYvFcz1Wb2DrCmKrV4iBKfNzmG6
 vC/icy/fai/zHMwsbp9Drk935AXcvAKDI4W/v84+o7A3ptLxT7SeNeof9
 hA7xV9f3YURzTaElqgnP4Q8ctoQc/tZeb3kjI4m7VMtMdMvbnaZHbxRVu A==;
X-CSE-ConnectionGUID: +sTmwQPhQt2/YLAFthA7aQ==
X-CSE-MsgGUID: U3B7nG6RTSGicmkaupFDng==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66776177"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66776177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 15:02:12 -0800
X-CSE-ConnectionGUID: YAhB1wOQRhiWSXPnTmVkSg==
X-CSE-MsgGUID: h2in7sKIQuuG2QIuM3UWZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="193799947"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 15:02:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:02:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 15:02:11 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:02:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z44YYUT3DbvMLzLcYDvsII3hh9+9VrfiTaDJVadEP4R1ahuOyDA61bg2Bsj7ihanPSmBWoz3TDdZkF5t1H2/i14voSrdIsiU7DiMCD2zwr/vIsvIVRM70RwyyeALw6yO/iWmEbKnoQv4zJx9dtgkdm4SGp61LrdXV38M34h8atASGfM83BPKf0VNAysnOXKQLzFjS3Pq3gNex/8JE3TyUwS78//7dSTiynvd3CskWG7iVUh3pEv0mWmVu6LzOZMiMLtQmJhBbvVL/+KhH108K/G9mSVfOz61wV6CmCqd+yEGHjbG0IF2T5lyK+6AR8q6qmRuni6X7FiQlUstBUqarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SWyLRFLUd7/9JhDs7VPuKp8Ts0GuNWeXeOOPB+p2eE=;
 b=nNPqADPs7rMr37lm440bb3Qfdp0JSI4VZ38WciJjdoCIIqmQTDqZW7ULY5mk+BURnKa4BCmUe2X8MprnNL5LAHdnc9ByVaCaQH0z+aMeVK1ayQfOuJH1oAB3ejaquzWonP8onyXzpaRPF9Av58De3x0HVjCrW1Hbx22CLWIG+B9LPy74pfzaVZbND35iVBqhXnm4McUQ1fHNKa/Uuko36NsFhaqT/vteHMlKdPCIqHHNbY2p/piEBk+/KLNK4JX1AkncftYIefUBRX4ng/QV1sdUNmbEnV9XN6pPGMb6VyRnSgt7/GLq2z2BosICn7CzgWRTX2t7l0/ONeGJhmFbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN2PR11MB4565.namprd11.prod.outlook.com (2603:10b6:208:26a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 23:02:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:02:07 +0000
Message-ID: <dbbf51ac-243c-44a2-bd16-1ff5b3c8b208@intel.com>
Date: Tue, 2 Dec 2025 15:02:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/xe/sriov: Initialize scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
 <0254302e-35cf-4721-84d8-d0c95c2e6d62@intel.com>
 <fca9ea53-f64c-43de-8348-a3ba350689c0@intel.com>
 <0d646a89-2a40-4785-8206-499a9a32dcec@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0d646a89-2a40-4785-8206-499a9a32dcec@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN2PR11MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: 990a4bec-1d60-4e0b-a9da-08de31f6d0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R290RE96Z1pjSzVZUGN5Z3FTNnMyN1VWRG9sZnZ3cHBSeCt1cXNCNHVpVm13?=
 =?utf-8?B?MGFJZUdoUDRsazR5VmtMcmNpbVp3UWtkbnJBNWlpSTVaNHlHR1lSSEtWbHRv?=
 =?utf-8?B?ZEhOejFBL1NiV3RKSS9GQVAwcWNLZ0xnMTNTeDUwR25iOW5pc2V3K1M3WmJK?=
 =?utf-8?B?Z0tTQk15WHNCSkx2M2l3Z1pJeU4xRFA3Y255MXh6bDRtQzU3OUppMkh1cU5D?=
 =?utf-8?B?aWhxeXFyNDJyYmFJWTlid2ZMV1VEWmV1QjVKcXBBM2Y2L3BIK2VLci9iZEdW?=
 =?utf-8?B?aTZYTG50VE8vZ1hVbDZGUEY1N1JuV0liNnNtZnlvRFpMaU9CZ0lPQ3dWc0FH?=
 =?utf-8?B?SHpHMFN3dXBEUmdUL1dMY0REcmJuT3U4MGs1QVErSXJpTUhpNXVEZ09rM2FC?=
 =?utf-8?B?Ri8vVEFURFBsamROd054Vk1pTUhUeXpJWnhTelZNai84YWwvNmRUTmR3OTly?=
 =?utf-8?B?VWN3T1VwSmd2aUNvTk1SMHV3ZitQMmNvNDZTeENjQmZJS3d2dkRoQkZuVWw3?=
 =?utf-8?B?WGlWNEhFcGw2V1J0RUFjbEVkOXd1SjVXNi80QTJ4ajF3bkdNc25JRElRdXdL?=
 =?utf-8?B?OEcwVXpXYStVYlpQWjVJbnhsSC9uL2U2UHFZZ0FMWlp3RlNXdVNEbG5Kamt1?=
 =?utf-8?B?MlJrT1Z4TGMyRjhReVZMSG45eDNIYndnTXVlU21OR00zbTZTd2xhQ1B6WGN3?=
 =?utf-8?B?UGtsWSt1WnpJZXpjOFZqWkpWaGRSTlZFTUdGcm96MWtodUlqcnJOUm9JdE1W?=
 =?utf-8?B?dTJncnZpako3Mjl1anprVnIydGRGeDVJQWtFWFJ5K3hzdElyUnNQQWdnMTJB?=
 =?utf-8?B?dVhxTXcycm04aW13NVBIcVlRTUNmNCt6QlZsb2lQRTZPQWllRXorVkZ3aExC?=
 =?utf-8?B?ckZHcWx2b1NTTThmQWNjdVl0cUJZdExPSFVWSlpaTG0yaUFGZU1VUWtEZkNq?=
 =?utf-8?B?b2RCYjZYRENxVWk4T2tnckVNZVF0K3lLWkk1ejhjSjNXS3djKzcwWGJDRnY5?=
 =?utf-8?B?V1RrbDdERUxMSGJwWCtRejNxaUUxYlhLU0g4NzlYUzFlbVdpcGNLZXRRQWUy?=
 =?utf-8?B?aFNtZ3BtdGp3Z0JLMmk3blZKS0pxYzVRdlRLMzF5TzZISEVoZWhtUlp6OFpq?=
 =?utf-8?B?L2cyTXVySmZ6Y0hSczZ1dkV4SDZjUGNCREh5WmNVZFA4ZTF5VGs2c2RzRno1?=
 =?utf-8?B?bUk5UjM1ZjNHQUhkeFVvNWJ3bkZISmtWeXV3ZUVzbU5wTnZuOUUwMVdneWE4?=
 =?utf-8?B?aVJ1NkhnWDJuNFNRcE1EYkdlbTByZkZhSFFldkh5T3REZXU5cUY4TWRzYnhl?=
 =?utf-8?B?aFRaaHdpNzBFbm5wUE9XVTlySVdHSU01NjlRUnVpQ29jTkFkVXNIMVlYbE50?=
 =?utf-8?B?dmZrMDZIK2VXcUdnQmM2OW52K3g5Q25wN2hpTFdRbk80cnM4Y1NhRnR2OFBt?=
 =?utf-8?B?RDZOUi84ZzdFRkhrbFhkOS9kQVRUdUZWVUdLTjBJT3NNZzNRZHQxR295S1o0?=
 =?utf-8?B?NWJpVmhleGN2TjBQSDVTNkx6YjM5R1pndWkwYlFyd0pyQXFzSi9MbmMxekNz?=
 =?utf-8?B?MEYrZStFNlI5OWx0NEJUek8vRXpON01oNVJORUJvSHJLY1lmTlJObWliNTZZ?=
 =?utf-8?B?aUpCYlV0SnkzWkgvZjh5T1NIbGg2NVNadkU1RERGV0hwS1k5TmJmNGx6K2ZP?=
 =?utf-8?B?eG12REplcm1tTldsb0pmaTBJeE9Ca0hVSUk3cEhhWERzZE9IU0l0SE1xcTVj?=
 =?utf-8?B?SGYxaEtKeWt3b0docGZjQ2JFcVV5YzlGWDN5ZG1xWjFtbnEvbCtmT2RwQlY1?=
 =?utf-8?B?amFkZW9ZM0dUNDVUZXdkRVZ2d1NGM01EQXdWUnNGOENnQjJON2ttdHBKVVJR?=
 =?utf-8?B?YXZibGx1Si9EYmtVNEd2b1VWNmpHdlJLTU9GU1oyOUtQbjlDMjJjWEVZOFpm?=
 =?utf-8?Q?3czqKRJf9eFrzSMWUW1IKuN+ean/Hs8O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzlpVkd1MFJyRHV2YVI0dkI1U2ZmeGhLb0wrV0ZCUkVscy91cjBtaTlETkkv?=
 =?utf-8?B?N2JYM1l2UEZNcGJnL2tueld4L0hhTHVSMUZWZHNac3hDQi9SQVlGUjBBaURY?=
 =?utf-8?B?YWl6MllubDQvdWREclFRQ2pOQ05WOGg5alNyNjhxUTVUMHZkZWhxUzFWOTdB?=
 =?utf-8?B?Yjd1NTEwdkVpNkV1NkJ4b05pc243S2dkdWttV0NlNTNESldGd2tsZjFRWjgx?=
 =?utf-8?B?ZGVzZmdWeDRyN282WVBBZTBoVGZCYStGVkZwU2NQYk11aHBveWtReDBLZkwz?=
 =?utf-8?B?N0lJY0VyYWQ0OHM2WGsrUHdsYkFjSHlNei9GamMxa3NoWEVwRGxkdTE0WDJX?=
 =?utf-8?B?REd1bGFSRHIycDU0d25vdUFjUmVvQXR0V2xKajlIL2Z3djhsRWtFb0dBUGFY?=
 =?utf-8?B?ekJEekNSb012VHhkREh5SHI2blU3WGQ0MmlRTVV3NW9aVlp4Q1QwYUc3djJD?=
 =?utf-8?B?akpxWVFxUWwxWFQ0MGZ5QTNReHB1Y0lRTU5oWGFpdTljeUVMUU5zaHBVc1h6?=
 =?utf-8?B?SVVHOXU3aGVnR1NUQ0MyTWRPbytwcldOWWE0QUkyZnp1aXNqbzNCbGZPSmZk?=
 =?utf-8?B?bWlnaWhJOXMxL3VXOVp2Nk1VeklkbU53SXArUngwTWUxbDBpM3N3VHZ5OEpt?=
 =?utf-8?B?Tkw3UzdTM3lKSmZNV3FKVUNkbXJxSVpvVm1ib0I3UUM3akwxMnhjdDZxS3pp?=
 =?utf-8?B?SS83cDg0TDd5c0xFRWpxT05OV0pJNzN4SUlab1BlSnd4K295dk00bTM4Uzkz?=
 =?utf-8?B?ck4wVTJjUXJXQm83eW8zRklFQjJwQ24yZlNrT2Rsam5ySjNtdWJwMzBKekxr?=
 =?utf-8?B?ZlVaeHdjeXh4clVMMlZLZy80SUZNYXBVQWJrNUN6dm8wdGNHZUZFbXdxVHp4?=
 =?utf-8?B?dmFFR1ZhQzJLaE9rSlNBY0hyL0FTaU1lOE4xR3laK0haemNNRDV5L0liUDNH?=
 =?utf-8?B?N2JiSWtIbDZKTEczSEpOVVIxL0UyZzJRdkttbWJPM2F0N2JPUlRnbFBRZ1F3?=
 =?utf-8?B?UjNwR3B2UHNPbUFJSWJzaEhROWowaTBtQ3hPenUwbWVHMm9tVWphdDBqZGJ2?=
 =?utf-8?B?WGNXUDV1WmpTWXQwdDhWT0lJY3VkYlZpUGcycWRGUWJPbDBJZEQ3cmtWaENn?=
 =?utf-8?B?alJQUHVvb0p1NWVnb1J4TnJrVHdZSmdwOTJkcFdOVnpOOVZuS2oyMnFSLzhN?=
 =?utf-8?B?OExjQm9hSCs3ak1XSDIwcDcvMTMzallocVdxcGdZMGtGdFBsTjJwbVZKR2VB?=
 =?utf-8?B?dDV1cjJVU3luQzM4WEVFanlic1BkT09jTDNFR1VVNlRQWW8xVHBGbkJZNFI1?=
 =?utf-8?B?NnNMcmdZK0NHckRNUCs4T1lGTlI4QmovYjcvdGRhM2N1d2lqVWFLWThxRnhI?=
 =?utf-8?B?Q2pwWklBUW5FYUgxbUZPOGh4RWVLbHBqVk1hT1I2MXBQc09mbXhYbTQ3SExq?=
 =?utf-8?B?bXZaZTg1eGdQWnhqbGNqbGNvZlRUZkhoWjdjSDU1WDd5dHl1NTVXUnVJY1Ni?=
 =?utf-8?B?WXVBQjlYeWZpSnZDKzlKNWQzWlhRc3RMSVdpM3NrWkwzLzRvNVFBZklpckNx?=
 =?utf-8?B?bzRIY3hUUndlRTdOTlJ3NjZwYlFPdVMyeWlnUUF5YnJ3ZXIrTk03SXZna3o2?=
 =?utf-8?B?TlVSYTE1Rm80TlBjd3MvSVV0ZXBmTE9lblNiV0FEcmc2dnJtWGpkdDhQcFJ6?=
 =?utf-8?B?VmF2dXRQeWRBVlBhYlVPRmRhcGZjTW85b0ZCVFlLRnlPT3A1UEFwQXNjdjJx?=
 =?utf-8?B?OHBkTG9qOU9kMEtNL1Q2WHI4a3J1cWJnMjFnNmNqSkhyT1VPQkN4WUM1aWh0?=
 =?utf-8?B?NGVnOFhFMUNKb0I4VVBMUjBMbmhYZFFFeklOTE1kcnBRbUFMa3pmeStRSHh4?=
 =?utf-8?B?cGJWbzBwWDU1YmJQdUVyaDFxei9ydWJvOVlqbmtFRWJ3VkE1dVVqVkZUaUVt?=
 =?utf-8?B?YnZVbUhYZ0ZLc0VMMTV1dVNyRDhjYk1UT1crUG8zdEhqUlRKYllmZEI0MnM0?=
 =?utf-8?B?VlRBM1duQ2NLVTFoelFuZWxKOC8yU1dhUkozUnJSQ2NiRHM0STBHcXB5RkF6?=
 =?utf-8?B?cHJjU01ZVDVncDU3cHJQdnNRcHZ4NnlJSDZJMVhzOTZQTS9LV2NPSk5KWnFK?=
 =?utf-8?B?M2YzdlZ6R2RCVXZkQ2JqWHhTNkhpRHhGemRuQW9mbWIzUmlzVXJqOVlYK1o3?=
 =?utf-8?Q?2MZMYH6jY9P9lNQTe6h9/T0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 990a4bec-1d60-4e0b-a9da-08de31f6d0f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:02:07.4121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ltVa0cTR1SWp4b+sognO2hFPO6MrPL/YdIjzpBZn6WN1XXTD6Ql9bauIwLJ3b9LFmTdrW3w93EDZszkerfg7Ttoa8Mfsyt5ybHqt4ppit0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4565
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



On 12/2/2025 1:08 PM, Michal Wajdeczko wrote:
>
> On 12/2/2025 12:33 AM, Daniele Ceraolo Spurio wrote:
>>
>> On 12/1/2025 2:37 PM, Michal Wajdeczko wrote:
>>> Hi Daniele,
>>>
>>> some initial comments to keep you busy ;)
>>>
>>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>>> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
>>>> feature that allows the driver to define groups of engines that are
>>>> independently scheduled across VFs, which allows different VFs to be
>>>> active on the HW at the same time on different groups.
>>>>
>>>> This is intended for specific scenarios where the admin knows that the
>>>> VFs are not going to fully utilize the HW and therefore assigning all of
>>>> it to a single VF would lead to part of it being permanently idle.
>>>> We do not allow the admin to decide how to divide the engines across
>>>> groups, but we instead support specific configurations that are designed
>>>> for specific use-cases. During PF initialization we detect which
>>>> configurations are possible on a given GT and create the relevant
>>>> groups. Since the GuC expect a mask for each class for each group, that
>>>> is what we save when we init the configs.
>>>>
>>>> Right now we only have one use-case on the media GT. If the VFs are
>>>> running a frame render + encoding at a not-too-high resolution (e.g.
>>>> 1080@30fps) the render can produce frames faster than the video engine
>>>> can encode them, which means that the maximum number of parallel VFs is
>>>> limited by the VCS bandwidth. Since our products can have multiple VCS
>>>> engines, allowing multiple VFs to be active on the different VCS engines
>>>> at the same time allows us to run more parallel VFs on the same HW.
>>>> Given that engines in the same media slice share some resources (e.g.
>>>> SFC), we assign each media slice to a different scheduling group. We
>>>> refer to this configuration as "media_slices", given that each slice
>>>> gets its own group.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   5 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 135 ++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>>>>    .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  14 ++
>>>>    4 files changed, 155 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> index 0714c758b9c1..62dda1c24e77 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>>> @@ -14,6 +14,7 @@
>>>>    #include "xe_gt_sriov_pf_control.h"
>>>>    #include "xe_gt_sriov_pf_helpers.h"
>>>>    #include "xe_gt_sriov_pf_migration.h"
>>>> +#include "xe_gt_sriov_pf_policy.h"
>>>>    #include "xe_gt_sriov_pf_service.h"
>>>>    #include "xe_gt_sriov_printk.h"
>>>>    #include "xe_guc_submit.h"
>>>> @@ -123,6 +124,10 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>>>>        if (err)
>>>>            return err;
>>>>    +    err = xe_gt_sriov_pf_policy_init(gt);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>        err = xe_gt_sriov_pf_migration_init(gt);
>>>>        if (err)
>>>>            return err;
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>> index 4445f660e6d1..9b878578ea90 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>> @@ -5,11 +5,14 @@
>>>>      #include "abi/guc_actions_sriov_abi.h"
>>>>    +#include <drm/drm_managed.h>
>>> system headers shall be included before our local headers
>> ok
>>
>>>> +
>>>>    #include "xe_bo.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_sriov_pf_helpers.h"
>>>>    #include "xe_gt_sriov_pf_policy.h"
>>>>    #include "xe_gt_sriov_printk.h"
>>>> +#include "xe_guc.h"
>>>>    #include "xe_guc_buf.h"
>>>>    #include "xe_guc_ct.h"
>>>>    #include "xe_guc_klv_helpers.h"
>>>> @@ -351,6 +354,125 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>>>>        return value;
>>>>    }
>>>>    +#define MAX_MEDIA_SLICES (hweight32(XE_HW_ENGINE_VECS_MASK))
>>> redundant ( )
>>>
>>> and maybe such macro should be placed in xe_hw_engine_types.h
>>> with proper comment why it works:
>>>
>>>      /*
>>>       * Each media slice has 1x VECS
>>>       * Max number of VECS instances gives us a max number of slices
>>>       */
>> ok
>>
>>>> +static int pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
>>>> +{
>>>> +    u8 slice_to_group[MAX_MEDIA_SLICES];
>>>> +    struct xe_hw_engine *hwe = NULL;
>>> do we need to initialize this here?
>>> it will be initialized by for_each_hw_engine, no?
>>>
>>>> +    enum xe_hw_engine_id id;
>>>> +    u32 vcs_mask = VCS_MASK(gt);
>>>> +    u32 vecs_mask = VECS_MASK(gt);
>>>> +    u32 gsc_mask = GSCCS_MASK(gt);
>>> we try to define vars in rev-xmas-tree order
>>>
>>>> +    u32 *values;
>>>> +    u8 slice;
>>>> +    u8 groups;
>>> I guess for those two generic counters we don't need to use explicitly sized int
>>>
>>>> +
>>>> +    xe_gt_assert(gt, xe_gt_is_media_type(gt));
>>>> +
>>>> +    /* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
>>>> +    for (slice = 0, groups = 0;
>>>> +         gsc_mask || vcs_mask || vecs_mask;
>>>> +         slice++, gsc_mask = 0, vcs_mask >>= 2, vecs_mask >>= 1) {
>>>> +        if (unlikely(slice >= MAX_MEDIA_SLICES)) {
>>> maybe this 'for' loop should be just for 'slice = [0, MAX)'
>>>
>>>> +            xe_gt_sriov_err(gt, "Too many media slices (%u) during EGS setup\n",
>>>> +                    slice);
>>> then after this loop we can have asserts that no engine instances are left behind
>>>
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>>>> +            slice_to_group[slice] = groups++;
>>>> +    }
>>> like this:
>>>
>>>      for (slice = 0; slice < MAX_MEDIA_SLICES; slice++ ) {
>>>
>>>          if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>>>              slice_to_group[slice] = groups++;
>>>
>>>          vcs_mask >>= 2;
>>>          vecs_mask >>= 1;
>>>          gsc_mask >>= 1;
>>>      }
>>>
>>>      xe_gt_assert(gt, !vcs_mask)
>>>      xe_gt_assert(gt, !vecs_mask)
>>>      xe_gt_assert(gt, !gsc_mask)
>> sure, will change
>>
>>>> +
>>>> +    /* We need at least 2 slices to split them up */
>>> shouldn't we also check that each group has both VCS and VECS?
>> It's not really necessary, having a group that only has a VCS or a VECS is a valid scenario. For example, the main use-case we have right now (remote desktop) only cares about VCS, so not having a VECS in a group wouldn't impact it.
>>
>>>> +    if (groups < 2) {
>>>> +        *masks = NULL;
>>>> +        *num_masks = 0;
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * The GuC expects and array with GUC_MAX_ENGINE_CLASSES entries for
>>> typo: an array ?
>> yup
>>
>>>> +     * each group.
>>>> +     */
>>>> +    values = drmm_kzalloc(&gt_to_xe(gt)->drm,
>>>> +                  GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
>>>> +                  GFP_KERNEL);
>>>> +    if (!values)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    for_each_hw_engine(hwe, gt, id) {
>>>> +        u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>> +        u8 entry;
>>>> +
>>>> +        switch (hwe->class) {
>>>> +        case XE_ENGINE_CLASS_VIDEO_DECODE:
>>>> +            slice = hwe->instance / 2;
>>> hmm, this seems to duplicate previous loop where we had:
>>>
>>>              vcs_mask >>= 2;
>>>
>>> maybe these two loops can be combined?
>> The issue is that there is an allocation in the middle, which is required in the second loop and sized based on the results of the first loop. I could always allocate enough memory for all the possible groups (i.e. MAX_MEDIA_SLICES), no matter how many there actually are, but I'm not sure if that is better than the double loop. I'm ok with switching if you think that's a better solution.
> if you can try, then yes please, but if that's too much - we can rework this later if needed
>
>>>> +            break;
>>>> +        case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>>>> +            slice = hwe->instance;
>>>> +            break;
>>>> +        case XE_ENGINE_CLASS_OTHER:
>>>> +            slice = 0;
>>>> +            break;
>>>> +        default:
>>>> +            xe_gt_sriov_err(gt, "unknown media gt class %u (%s) during EGS setup\n",
>>>> +                    hwe->class, hwe->name);
>>> this also seems like an attempt to catch our coding error,
>>> so plain assert should be sufficient
>> ok
>>
>>>> +            drmm_kfree(&gt_to_xe(gt)->drm, values);
>>> do we need to bother with this kfree ?
>>> it's managed allocation and any error from here will lead to abort the probe anyway
>> will drop
>>
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        entry = (slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES) + guc_class;
>>> redundant ( )
>>>
>>>> +        values[entry] |= BIT(hwe->logical_instance);
>>>> +    }
>>>> +
>>>> +    *masks = values;
>>>> +    *num_masks = GUC_MAX_ENGINE_CLASSES * groups;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int pf_init_sched_groups(struct xe_gt *gt)
>>>> +{
>>>> +    int err;
>>>> +    int m;
>>>> +
>>>> +    xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>>>> +
>>>> +    if (GUC_SUBMIT_VER(&gt->uc.guc) < MAKE_GUC_VER(1, 26, 0))
>>>> +        return 0;
>>>> +
>>>> +    for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>>>> +        u32 *masks = NULL;
>>>> +        u32 num_masks = 0;
>>>> +
>>>> +        switch (m) {
>>>> +        case XE_SRIOV_SCHED_GROUPS_NONE:
>>>> +            break;
>>>> +        case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>>>> +            /* this mode only has groups on the media GT */
>>> then having array of all modes on every GT seems non-optimal
>> My thought here comes from the fact that the sysfs controls are per-device, not per-gt, so we need a list of modes that will be usable in that interface. My decision was to have a single list of modes that applies to both GTs.
>> To have separate lists of modes per GT we'll then also need to have a device-level list of modes that maps to the per-gt lists, which IMO makes things more complicated. It's not like we're wasting a huge amount of memory anyway.
> but how this sysfs device-level uabi could look like?
>
> for now we have just two options: either EGS is not avail/used, or it's configured to single fixed preset config (if one is available)
> we can't have or select any more configs per-GT as VF will not be able to detect any other variant (it can only see if EGS is on/off)

Regarding the variants, the idea is that a VF will be curated to run on 
the specific mode. So the VF doesn't actually need to check the mode, 
the check is only there to catch programming errors where a VF 
incorrectly tries to enable multi-lrc (which is disabled for all EGS modes).

>
> but that's on the GT level, so in theory we can combine individual GT-modes into some device level combo
>
> my understanding is that on the sysfs we will expose something like this (if EGS config is available):
>
> for current media_slice only case:
>
> ├── .scheduling_groups
>      ├── mode				# RW: none [media_slice]
>      ├── current -> available/media_slice
>      ├── available
>          ├── media_slice
>          │   ├── group0			# RO: rcs0 ccs0 ...
>          │   ├── group1			# RO: vcs0 vcs1 vecs0
>          │   └── group2			# RO: vcs2 vcs2 vecs1
>
> but if we could create some EGS config also on the GT0 then this could be expanded to:
>
> ├── .scheduling_groups
>      ├── mode				# RW: none compute [media] compute_media
>      ├── current -> available/media
>      ├── available
>          ├── compute
>          │   ├── group0			# RO: ccs0 ...
>          │   ├── group1			# RO: ccs1 ...
>          │   └── group2			# RO: vcs0 vcs1 vecs0 vcs2 vcs2 vecs1
>          ├── media
>          │   ├── group0			# RO: rcs0 ccs0 ...
>          │   ├── group1			# RO: vcs0 vcs1 vecs0
>          │   └── group2			# RO: vcs2 vcs2 vecs1
>          ├── compute_media
>          │   ├── group0			# RO: ccs0 ...
>          │   ├── group1			# RO: ccs1 ...
>          │   ├── group2			# RO: vcs0 vcs1 vecs0
>          │   └── group3			# RO: vcs2 vcs2 vecs1
>
>
> but maybe it's too early to discuss this ...

My idea was that the groups would always apply to both GTs, so the 
media_slices group has an empty config on GT0 (which automatically maps 
to all engines) while on GT1 it has a valid config.
But anyway I agree that it is too early, if we ever need to split the 
GT0 and GT1 configs we can do it at a later point when we do actually 
have known use-cases.

>
>
>>>> +            if (xe_gt_is_media_type(gt)) {
>>>> +                err = pf_sched_group_media_slices(gt, &masks, &num_masks);
>>>> +                if (err)
>>>> +                    return err;
>>>> +            }
>>>> +            break;
>>>> +        default:
>>>> +            xe_gt_sriov_err(gt, "unknown sched group mode %u\n", m);
>>> this looks more like a coding error, so maybe use just assert?
>> ok
>>
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>>>> +
>>>> +        if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
>>>> +            gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>>>> +
>>>> +        gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
>>>> +        gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>>>    {
>>>>        pf_sanitize_sched_if_idle(gt);
>>>> @@ -401,6 +523,19 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>>>        return err ? -ENXIO : 0;
>>>>    }
>>>>    +/**
>>>> + * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
>>>> + * @gt: the &xe_gt
>>>> + *
>>>> + * This function can only be called on PF. This function does not touch the HW.
>>> but must be called after checking HW engine fuses, right?
>> yes, I'll expand the doc.
>>
>>>> + *
>>>> + * Return: 0 on success or a negative error code on failure.
>>>> + */
>>>> +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
>>>> +{
>>>> +    return pf_init_sched_groups(gt);
>>>> +}
>>>> +
>>>>    static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>>>>    {
>>>>        drm_printf(p, "%s:\t%s\n",
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>> index 2a5dc33dc6d7..c9c04d1b7f50 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>>    int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>>    u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>>>    +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>>>    void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>>>    int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>>>>    int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>>>> index 4de532af135e..3b915801c01b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>>>> @@ -8,16 +8,30 @@
>>>>      #include <linux/types.h>
>>>>    
>>> we expect all enums (and enumerators) to have proper kernel-doc
>> will add
>>
>>>> +enum xe_sriov_sched_group_modes {
>>>> +    XE_SRIOV_SCHED_GROUPS_NONE = 0, /* disabled */
>>> do we really need this?
>> This makes things much easier in the follow up patches, because we don't have to treat the disabling as a special case. If the user want to disabled the feature we map it to this enum and then just handle it as any other mode.
>>
>>>> +    XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES, /* separate groups for each media slice */
>>>> +    XE_SRIOV_SCHED_GROUPS_MODES_COUNT
>>> while it looks handy solution to count enumerators,
>>> now COUNT pretends to be a valid mode enumerator while it is not
>>>
>>> maybe just provide separate #define for it?
>> IMO this is safer for future enum extensions.
> missing enumerators in 'switch' can be captured by the compiler

I was more worried about the for loops.

>
>> Also, we do it this way all over the driver, including in SRIOV code (e.g. XE_SRIOV_VF_CCS_CTX_COUNT).
> it wasn't me to let this in ;)

it is still the standard in the driver though.

>
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>>>>     * @sched_if_idle: controls strict scheduling policy.
>>>>     * @reset_engine: controls engines reset on VF switch policy.
>>>>     * @sample_period: adverse events sampling period (in milliseconds).
>>>> + * @sched_groups: available scheduling group configurations and current mode.
>>> don't forget to describe inner members
>>>
>>> and there is no 'current' now
>> oops, that comes later
>>
>>>>     */
>>>>    struct xe_gt_sriov_guc_policies {
>>>>        bool sched_if_idle;
>>>>        bool reset_engine;
>>>>        u32 sample_period;
>>>> +    struct {
>>>> +        u32 supported_modes;
>>>> +        struct {
>>>> +            u32 *masks;
>>>> +            u32 num_masks;
>>>> +        } modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
>>> hmm, for the NONE mode, all groups must be 0, so why bother with .masks/.num fields for it?
>> Again for follow up. To disable the groups we need to send the KLV with no data. The way I've done it is that we just set the mode to XE_SRIOV_SCHED_GROUPS_NONE and the underlying code will automatically handle it because the mask is null, without having to know that this particular setting is actually turning the feature off. See __pf_provision_sched_groups in the next patch.
> but why make it so hidden/secret (and to some extend error-prone)
>
> disabling EGS is an explicit activity, IMO it shouldn't be done due to lack of some bits (that might be not intentional)

I don't think this is hidden/secret. The GuC specs says that to disable 
EGS we need to send the same KLV we do to enable it, just without any 
data. IMO this means that we can use the exact same code paths for both 
enable and disable, just with NULL data in the disable case. The only 
way we can end up disabling the feature by mistake is if a mode has 
empty masks when it shouldn't, in which case the whole thing is 
completely broken because that mode wouldn't work at all and we should 
fix that.

>
>> Also, I was thinking that for sysfs we could allow the code to set XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES on both GTs and since on GT0 that's not a supported mode it will automatically map to empty masks/num_masks, which will tell the GuC to keep the feature disabled.
> not quite happy, but if you insist, will not block on that

Thanks! we can rework later if needed, but I believe that at least for 
now it makes the code simpler.

Daniele

>
>> Daniele
>>
>>> maybe all we need is:
>>>
>>>      struct {
>>>          const char *name;
>>>          u32 *config;
>>>      } modes[];
>>>
>>> then:
>>>
>>>      supported_modes := iterate over modes array and look for non-null config/name
>>>
>>>      none := supported_modes is empty
>>>
>>>      current := pointer to modes[] or NULL
>>>
>>>> +    } sched_groups;
>>>>    };
>>>>      /**

