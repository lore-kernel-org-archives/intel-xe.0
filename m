Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4217CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F4C10E7D3;
	Wed, 24 Sep 2025 20:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg5y8eAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4AD10E7D3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758745301; x=1790281301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vSh91V+FCC/kf2ofYhZitc6gKc7btzrFEHxaHN2SzI8=;
 b=Xg5y8eARsTFZ3Wd9y+E/acLwEkNUuon7CQthhAYEUpqk5Y4O7tEc1dUW
 A+tVqs3+/ePnA0/txyYzpYy67gHPcMLrOp1rzH2PlGGtjWI5V9dSZ7Goy
 gyPuhwaZgTAZZQdhnhddw7FQnD/0s1YdFOnAfJXmOKfzecImBWCVGOyYk
 9qqXQflzh7682grA9jcNpXVidZ956cnI3wk/lG+WtKQ9rMvhsuAkNKxWu
 mFZdLovFpIJRe0g/hIPP2QyeVBmlFKXE9HQQyZO7nIzuyiYe0UilZQSeh
 KzPY3rcgptbwAzJfPT6PgFnn6xDOc1B6dkedf8BbN8LESbRiazccZEeVy A==;
X-CSE-ConnectionGUID: b9P8nk0vRdSVLxn8wQtf5w==
X-CSE-MsgGUID: VwXePu7aQJOBU+1g0+miXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64695464"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="64695464"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:21:40 -0700
X-CSE-ConnectionGUID: nTx5AyLVQo2fdEv2Q/Ftkg==
X-CSE-MsgGUID: NacKdr3LQriJylH17Kag2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176730929"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:21:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:21:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:21:38 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1xJRLDjquM4OyKpf2GwvLr5ZV2mpae9LbtgM3mDfxEjkU6oisW6nglZd1UNGlPm8rW8wxu+kuU4TVVfTrHaYrgxsJhtT4ekRX5umPMuwi7vLNCJMx68OhPvtzq19vpmKysCgm0SZt5aXU8I6jIz7hyjvxnqBVLuLS39oK92wUq0BLI5CUzr63WrhLZwzirhDVRCQ1zDIZKdJrDqXhPwW+3vwedCF/E4VVipjQIPZwGjlegBEADg3WHWwcvteLd3lhpxQgX94R7HdG5YgyraXXjCUDx4EM+v2Y7itf/v7AUADAd6wpcA+XdSm7m1IxXOcXvHqdxmNO9QzisQp8KMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdjL1wvlxzVQEXwoKyz7etG9FPvZVH8jMS8pDRvGlNk=;
 b=Q+N34JUyZJq017DAAH8WPlrFVGeTeXmaHFZANb8IRP3oztNulmjciaC/ueVuZQWF8uH9bR8FgLfr1THqIH5ZL3vtyEnm9imN5QkCAk0TwXx95ZCyjOIhmabq8FIxFBpkLklRzeKxtUIMwa/CtjQi757FkuWOVouJre8TcCqFoLvwipV74vfUzH5Xczzhg14TGa9BMJryP1Zgmsmy36apjEwuNL4EeuT4vV8kYrP6FmUwcBZYKuMUwgYfcjqZYM6lhXpx86wEu4ZD6PQ5IwZzbgRWaTObX1a4dHlkQpVMXi0+Fse5X4xaFNqR0uXBKIaxJBNj2gOIYX6Qb5fG55DiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 20:21:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:21:35 +0000
Message-ID: <dab8b427-41eb-46b2-929d-436b3866b7b5@intel.com>
Date: Wed, 24 Sep 2025 22:21:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-13-matthew.brost@intel.com>
 <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
 <aNRLmmK5yqXa3xNb@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNRLmmK5yqXa3xNb@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 29acc538-1054-45f0-8d93-08ddfba7f586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkR4ejQ1MEFYeC9NVDFQdzR0WFkzbXFqZHM0RENEVndpQWFhUFNYajU2VExO?=
 =?utf-8?B?THorbEhKUDFEM3crUHIwUFF3MXZXZVZ0Z0tYR1F3cGpZVEFISlh2VFl2YWtq?=
 =?utf-8?B?VWxKWi9Cc2NDbVpscEY4MFJNNjJ5QXR6c2lITXdsNHpJYTNEUjNNTk5vQndz?=
 =?utf-8?B?bHBYdCtRV1duM05VczU4RExHUDdNYmNGM2hmMnNxWG1oY2paRHNTeU4yWVB0?=
 =?utf-8?B?eG15K0JaSEd6V05RTGszVERjMytzazJpVWd3cFJhK1M2SFpOVllsTFQ3dTEr?=
 =?utf-8?B?aXhYMEtSampCOVFvcU5lUzV4VTJ4ZkR6NTQ1U0x5UmxQOEF5U0lDUDhrZXl5?=
 =?utf-8?B?M0pNT3ZNdjROZ2FiR3p4SmttcEU5V0M3QmNlNUs2MUNuSXo3OWZlQmdseFdq?=
 =?utf-8?B?MDlFcFVPZkVDdGIxVW9aTnQzQkRTL25mSk9RSTB5Wmh3MnBZV2FrNFplcmlx?=
 =?utf-8?B?dERUMGhCR3ZObmlhK2I5WGVMZjFCZzBKRDVxbmxteW5NbXVRZEVlSStudVJw?=
 =?utf-8?B?ZnRmTmhLS1dRbVIzeEl1aTVXMEg5U0RpTHQzRU1aVEFWV2xDMlB3eGE2YXp1?=
 =?utf-8?B?MWVneFUvRU5VR2YxSjVOQXZoYjhOVHE0Q2wwK1kwVzdSVHRWSm5TdDRsZzFz?=
 =?utf-8?B?SFZKU0lsY2VCU3BMT3NjRU54Rmh4L3NpU0JySlFaY2ZsM1g5eC9ZZE9FYTJC?=
 =?utf-8?B?RHZKY1YvR3BiT1AwYWlDa1VML3gxZ29KR1RZY0wwL21CWXNOV0NsbEsxQU90?=
 =?utf-8?B?M1pkZkd5NkRqY2tuNlZZVzVYK2taREpkRzl6UFZsdkdHa0ZZWW1rbUYrTDNF?=
 =?utf-8?B?MERNOE9iaUNyMmV2b29FTXJRWXA2MTA2WFBac09LNko1Vkg1aHpWMnhGYnYz?=
 =?utf-8?B?cU84ZktpQ1FEM0l1WEIxOVFjbGpaWUxtVzJqaXZZNUJaclFTTXgySFhBWTdE?=
 =?utf-8?B?ODNpMmlXTEhjTy94a1FFclBVNCtNNUVtTlZPKzJxRzZiTTJDaTJDQ25HKzFE?=
 =?utf-8?B?VXRVNE9FZG96cGw3MExhdjU3QnY3d05yeUpFTHNLaURoUk5BWjhwZUtiakw1?=
 =?utf-8?B?MzNCWW1PS3JEMktvWHYzTW1qRlBIeVJIWjM4d1NaQlh6STBFc2FnQUdjbURy?=
 =?utf-8?B?SWJ2YXRiaGdKOUc3eGNrUG5IZG9CRnJ3dFlENlNvWDkyMkZBNG5MaGdtb0sz?=
 =?utf-8?B?QnhvK29DUm9CZGF0enNaWkh6cFNDeGpoZWF4cXIxMEZvd2ZqUFQwcGFLTERT?=
 =?utf-8?B?dDVGM01rVEhwbjFJcE1lWkJHT1pwV1RhL08waENKRWY5YTczVEFiNENMOWxE?=
 =?utf-8?B?M3RkWEpBQjkyVmpYVGQ4LzZvTDZlQUwxRXhXWUYzdW1FMmNQOC93VWY0cFBY?=
 =?utf-8?B?cTZ4dkJFM2EzczRHMzUrNkN4aW9qdHZxMGQrWHhmbm5IbGxEalIvUDF5MGpY?=
 =?utf-8?B?TWxtOWJBTTdsSDFQS2VTSGFVZm0yM20zR1cyWXVVZ215bnp5bHFEZXlGZXJj?=
 =?utf-8?B?bExaYkJ1OWVpeGNwTnJrdWsvRk0xS1grNE9mdkpqUDkzYVZla0dKbzc0dHA4?=
 =?utf-8?B?cGZadFNyWkJFOVRQUzVlVHpsMTNOd0tUUzUveFc2bTRtVzArOVdIckcvcm9C?=
 =?utf-8?B?eWw5Y2pDbTNGZENlWWVFOURma1hQb0VycjBVK1lzeC9BZ1QxZHdrWDE3dFZI?=
 =?utf-8?B?cWNmM25JTTlZbWIyZ2xZOHVUODRCc0xIb2FlVVpkVjNubHhlblR1UnFkelhZ?=
 =?utf-8?B?VEdhVVJTQTJnanhFM1VML1YzenNIQW00VmJ0bnNwN3dsRWh6TVhDSllrRWly?=
 =?utf-8?Q?/5mTveME/HejpJVMyR8w6PYZII4nOd40Q/nak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkdQd0NNbGFxRDk1c1EvZkNaVDB4dWlRSXBsdy83aWhVV1R0Yy9FN001YS9B?=
 =?utf-8?B?MDNUVTJLZGxUN0ZqWmNDaGhLZ0JSM0ZKTTBZZEMxbjNUVklhU2FHeEp2R0RX?=
 =?utf-8?B?NHpOMXhvK0FDeWxveXJkclpFUnhPS2QrVHNDcnBvRXIyWHpoaVl1YWM3bzJ5?=
 =?utf-8?B?MDVLMlMyZWYweFJmaEd5RkpRWTRCb2pxYWZ4SHJqOTkwZDg5bk1GZ09SOHVw?=
 =?utf-8?B?UmRrNzNrZFRkc3BKcDhVVittMnlOWk5VMFpJNWMzNldYOHBQZkVsMDhpSXU3?=
 =?utf-8?B?clJhanBjN0YzMEhXVFFXci9pbXovYThBcHhCd2lpNEg0WE81QldaVkZoTXpE?=
 =?utf-8?B?VHk1OWd1VGU3ZmFqa3czeCtwc2o5OGdlekFyQ1A4V2J1ZUlsT0R4eDBjck8x?=
 =?utf-8?B?RDlTZCtzNlNNR01IR0l0S205RWtWOVlsQmNXVDRjSmFBdmx4ZVl2UytRYnh6?=
 =?utf-8?B?VnBRalZvUStleGdJaWVXVjBFMklWaTF3L2N3SVk2M0ZoSElWeWRjYW9jdzFn?=
 =?utf-8?B?dW1YYm13Tzhzck81L0ZDQmVEbnZLV3A1RG42ZStmbU85Ymx3VzV2ZDF0S0FX?=
 =?utf-8?B?emN1MFFvK1N5MEhqNlFxQ21Pcmp0cWF3N3cyajFNa1NFa21laWlkT0ZjczJ0?=
 =?utf-8?B?OHlieHllakZMZHk2ZWIyMFN0Z0VEZVJjRDg4cXY5ZSt3OGg0bTVnUm5DRG5x?=
 =?utf-8?B?Wmx3MzQ4aEFNbWtBSTBLdVpZL0tpWUZkT082dmg4dFpQMHcwbjJyREpqaytO?=
 =?utf-8?B?ZFhpS3I5bHh5Z2NmOVlDKytCNVR4MS9DWWd3ZDMxQUlMbGhVTWNRbjdIZXRj?=
 =?utf-8?B?QVRDUWprajdpWEVCZlJIazJNSUdJVmhIc0tBcUQzT3A0VnhhNFBNTW9qYkhD?=
 =?utf-8?B?b3dDUC9VR0pFZjhHVytSQUhyT0dQVmd6YkhPazFQNWFNYXdZVjJiME5OVVZ0?=
 =?utf-8?B?VndqRC9BUWdCbTJNQVNvaEQ5Sk1EV2RwZm9OWld1VlYrU1J6Ukx6aTJ3MC9P?=
 =?utf-8?B?dndoTzFGM010TDh5MlE2RnhIOXZlQU5oU2RoamJOYTdRRnd4akM0V2xiS2Mx?=
 =?utf-8?B?ZGhhallpU0k4TWcya1lyTnBGNzFHcGhhcFliSGNzK2p1dHBxYTU1WTVhNHdv?=
 =?utf-8?B?VDZEY0hDYmIvaTdPMmtxTzdzZUMyQTk4ZjlzcUlHVGdGMjVaa1hkcWlZc09C?=
 =?utf-8?B?dWowSW40WlRNdlB4T01oRDZzd2k2cld0OWl2a1BNblJtMkJYNGtaQWUxdnY4?=
 =?utf-8?B?Y290d2k5cmh1YUk2SmxYRHpXOHpGQWxlenFTY1N1aU1RTVBwYUY5SmdqTys5?=
 =?utf-8?B?Y2tSU2NoYzhJNWd1a0hrVTNYQXpwSm9URWkvTm1rM0haZTNlT3dkU281bitx?=
 =?utf-8?B?cG1RU3Jiek9IUmhFR3NtRUlpeUhQZE9ORUFaRDVpaFc0TXAwUE15WnR2MzN4?=
 =?utf-8?B?aEVEVitBdG1xa0lHV1poUXJ4dkhYaFZOaElKRUhyR2QwV3RpL1phQml0NzlZ?=
 =?utf-8?B?bmVSNlBjOG5OeHNtZzBKZnd1UXBoTURoRkg3bUJIM2FuS1NMQ1ZBODlCV3Iv?=
 =?utf-8?B?VlFJZTA3MmxGdWZXb0ovRjc1amZwejU3Y0E5UGwzQzYxcmN0Mit1MytrSjJU?=
 =?utf-8?B?QUdMNHNDdktMdXNoM0YraHk1dExlbHl5MGkvRUdLMkJvSWI1NHVpLytwSnA3?=
 =?utf-8?B?TGtVbCtxMjRHZjltZ3NMbFlXbWRHM1hGWGtwWWNzaG94L3NleXliUDBQaHhO?=
 =?utf-8?B?TGRQUVRRK3NsZmQ5V3hTb251emlFMzIzWmNib3NUSmJvWU5xYnNVdk1tcDAr?=
 =?utf-8?B?dGYwV0hGYnpub1JoMU9wWHRodmxtYTZUZ1cyS01SZGMwbk9qNW5xOWlaT1lt?=
 =?utf-8?B?WG1LNWtCRHdVLzQxb0NnSG5tNndENVJPRW50YjJYRm5aTm5mU0VOQjBKRkVJ?=
 =?utf-8?B?QWEyVkErbEtxNTRQcGE0R2pDWXpqaWNtRnhPT1E2ZlhiOE5KVUZBc09MZWpo?=
 =?utf-8?B?THB0SWtheG9IZTd3QmhUTTNqVVBDSG9TaVNFVzJTUlNOODYra0pVcVl5SXhQ?=
 =?utf-8?B?YjJpNkErZ3YvRlg3MGpCUjduNkxiT3JaeGg4ZTZIQ1M2TXM2Qkk5NWhlV3Zs?=
 =?utf-8?B?SnJnK25jcFRkNmpGdWFBM2NMU2d3MUd6NTRxVTl5QldsWFBUd3dmUzA1Z1ll?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29acc538-1054-45f0-8d93-08ddfba7f586
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:21:35.8731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxrSPpJF+DVfUSMIrCwvRQi9D7lpwIN0sywaFWxjMn4ezD9CP55xHN08bDcdkd6S6dJO5o6vclP2wZ/L52rNMGzsiZ02LK6FtsrgdaH5sxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
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



On 9/24/2025 9:50 PM, Matthew Brost wrote:
> On Wed, Sep 24, 2025 at 12:49:25PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 9/24/2025 3:15 AM, Matthew Brost wrote:
>>> VF recovery is a per-GT operation, so it makes sense to isolate it to a
>>
>> that was also my suggestion to make it per-GT, good to see it happen now
>>
> 
> +1
> 
>>> per-GT queue. Scheduling this operation on the same worker as the GT
>>> reset and TDR not only aligns with this design but also helps avoid race
>>> conditions, as those operations can also modify the queue state.
>>
>> but while the recovery is per-GT, we should still protect against that
>> one GT starts the recovery sooner then other GTs notice about it
>>
> 
> Yes. There is shared state in 2 places:
> 
>  - The GGTT shifting, this handled by [1] in my series.
>  - CCS restore on iGPU (PTL) handled by [2] [3] in my series.
> 
> [1] https://patchwork.freedesktop.org/patch/676394/?series=154627&rev=2
> [2] https://patchwork.freedesktop.org/patch/676393/?series=154627&rev=2
> [3] https://patchwork.freedesktop.org/patch/676397/?series=154627&rev=2
> 
>>>
>>> v2:
>>>  - Fix lockdep splat (Adam)
>>>  - Use xe_sriov_vf_migration_supported helper
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 170 ++++++++++++++-
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
>>>  drivers/gpu/drm/xe/xe_sriov_vf.c          | 242 +---------------------
>>>  drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
>>>  drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
>>>  6 files changed, 169 insertions(+), 258 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index c9d0e32e7a15..cfb71b749e52 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -25,11 +25,15 @@
>>>  #include "xe_guc.h"
>>>  #include "xe_guc_hxg_helpers.h"
>>>  #include "xe_guc_relay.h"
>>> +#include "xe_guc_submit.h"
>>> +#include "xe_irq.h"
>>>  #include "xe_lrc.h"
>>>  #include "xe_memirq.h"
>>>  #include "xe_mmio.h"
>>> +#include "xe_pm.h"
>>>  #include "xe_sriov.h"
>>>  #include "xe_sriov_vf.h"
>>> +#include "xe_tile_sriov_vf.h"
>>>  #include "xe_uc_fw.h"
>>>  #include "xe_wopcm.h"
>>>  
>>> @@ -314,7 +318,7 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>>   * Returns: 0 if the operation completed successfully, or a negative error
>>>   * code otherwise.
>>>   */
>>> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>>> +static int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>>>  {
>>>  	struct xe_guc *guc = &gt->uc.guc;
>>>  	int err;
>>> @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>>   * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
>>>   * @gt: the &xe_gt struct instance
>>>   */
>>> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>> +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>  {
>>>  	struct xe_hw_engine *hwe;
>>>  	enum xe_hw_engine_id id;
>>> @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>  		xe_default_lrc_update_memirq_regs_with_address(hwe);
>>>  }
>>>  
>>> +static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
>>
>> nit: if this is static then could be just:
>>
>> 	vf_start_migration_recovery(gt)
>>
> 
> Sure.
> 
>>> +{
>>> +	bool started;
>>> +
>>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +
>>> +	spin_lock(&gt->sriov.vf.migration.lock);
>>> +
>>> +	if (!gt->sriov.vf.migration.recovery_queued) {
>>> +		gt->sriov.vf.migration.recovery_queued = true;
>>> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>>> +
>>> +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>>> +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
>>> +				 "scheduled" : "already in progress");
>>
>> with this .recovery_queued flag, can we hit "already in progress" case?
>>
> 
> This was existing code so kept it but I'm really unclear how we can get

I can't find "recovery_queued" flag in upstream code

> multiple resfix IRQs without the prior resfix flow being completed.
> Maybe Tomasz can clear this one up? Ideally I'd like to remove multiple
> resfix IRQ handled code if this is not possible.
> 
>>> +	}
>>> +
>>> +	spin_unlock(&gt->sriov.vf.migration.lock);
>>> +}
>>> +
>>>  /**
>>>   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>>>   *   or just mark that a GuC is ready for it.
>>> @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>>>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>>  	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>>>  
>>> -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>>> -	/*
>>> -	 * We need to be certain that if all flags were set, at least one
>>> -	 * thread will notice that and schedule the recovery.
>>> -	 */
>>> -	smp_mb__after_atomic();
>>> -
>>>  	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
>>> -	xe_sriov_vf_start_migration_recovery(xe);
>>> +	xe_gt_sriov_vf_start_migration_recovery(gt);
>>>  }
>>>  
>>>  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>>> @@ -1175,6 +1192,139 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>>  		   pf_version->major, pf_version->minor);
>>>  }
>>>  
>>> +static void vf_post_migration_shutdown(struct xe_gt *gt)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
>>> +	gt->sriov.vf.migration.recovery_queued = false;
>>> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>> +
>>> +	xe_guc_submit_pause(&gt->uc.guc);
>>> +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
>>
>> this |= seem unneeded
>>
> 
> This is existing code copy / pasted and is removed in [4].
> 
> [4] https://patchwork.freedesktop.org/patch/676382/?series=154627&rev=2
> 
>>> +
>>> +	if (ret)
>>> +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
>>
>> is this the only possible reason? maybe worth to add %pe ?
>>
> 
> Again this existing code and will be removed in [4].
> 
> So with above statements, I'd prefer just to leave as is.
> 
>>> +}
>>> +
>>> +static size_t post_migration_scratch_size(struct xe_device *xe)
>>> +{
>>> +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>>> +}
>>> +
>>> +static int vf_post_migration_fixups(struct xe_gt *gt)
>>> +{
>>> +	s64 shift;
>>> +	void *buf;
>>> +	int err;
>>> +
>>> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
>>> +	if (!buf)
>>> +		return -ENOMEM;
>>> +
>>> +	err = xe_gt_sriov_vf_query_config(gt);
>>> +	if (err)
>>> +		goto out;
>>> +
>>> +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>>> +	if (shift) {
>>> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>>> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>>> +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>>> +		if (err)
>>> +			goto out;
>>> +	}
>>> +
>>> +out:
>>> +	kfree(buf);
>>> +	return err;
>>> +}
>>> +
>>> +static void vf_post_migration_kickstart(struct xe_gt *gt)
>>> +{
>>> +	/*
>>> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>>> +	 * must be working at this point, since the recovery did started,
>>> +	 * but the rest was not enabled using the procedure from spec.
>>> +	 */
>>> +	xe_irq_resume(gt_to_xe(gt));
>>> +
>>> +	xe_guc_submit_reset_unblock(&gt->uc.guc);
>>> +	xe_guc_submit_unpause(&gt->uc.guc);
>>> +}
>>> +
>>> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>>> +{
>>> +	bool skip_resfix = false;
>>> +
>>> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
>>> +	if (gt->sriov.vf.migration.recovery_queued) {
>>> +		skip_resfix = true;
>>> +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");
>>> +	} else {
>>> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>>> +	}
>>> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>> +
>>> +	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
>>
>> nit: this looks cleaner:
>>
>> 	if (skip_resfix)
>> 		return -EAGAIN;
>>
>> 	return xe_gt_sriov_vf_notify_resfix_done(gt);
>>
> 
> Sure.
> 
>>> +}
>>> +
>>> +static void vf_post_migration_recovery(struct xe_gt *gt)
>>> +{
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> +	int err;
>>> +
>>> +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>>> +
>>> +	xe_pm_runtime_get(xe);
>>> +	vf_post_migration_shutdown(gt);
>>> +
>>> +	if (!xe_sriov_vf_migration_supported(xe)) {
>>> +		xe_gt_sriov_err(gt, "migration is not supported\n");
>>> +		err = -ENOTRECOVERABLE;
>>> +		goto fail;
>>> +	}
>>> +
>>> +	err = vf_post_migration_fixups(gt);
>>> +	if (err)
>>> +		goto fail;
>>> +
>>> +	vf_post_migration_kickstart(gt);
>>> +	err = vf_post_migration_notify_resfix_done(gt);
>>> +	if (err && err != -EAGAIN)
>>> +		goto fail;
>>> +
>>> +	xe_pm_runtime_put(xe);
>>> +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>>> +	return;
>>> +fail:
>>> +	xe_pm_runtime_put(xe);
>>> +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
>>> +	xe_device_declare_wedged(xe);
>>> +}
>>> +
>>> +static void migration_worker_func(struct work_struct *w)
>>> +{
>>> +	struct xe_gt *gt = container_of(w, struct xe_gt,
>>> +					sriov.vf.migration.worker);
>>> +
>>> +	vf_post_migration_recovery(gt);
>>> +}
>>> +
>>> +/**
>>> + * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
>>> + * @gt: the &xe_gt
>>> + */
>>> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
>>> +{
>>> +	init_rwsem(&gt->sriov.vf.self_config.lock);
>>> +	spin_lock_init(&gt->sriov.vf.migration.lock);
>>> +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>>> +
>>> +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
>>> +		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
>>
>> we likely don't want to repeat that message on every GT
>>
> 
> So move this to xe_sriov_vf_init_early?

hmm, maybe it is even already there

> 
>>> +}
>>> +
>>>  /**
>>>   * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
>>>   * @gt: the &xe_gt
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index bb5f8eace19b..2ac6775b52f0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>>>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>>> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>  
>>> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
>>>  bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>>>  
>>>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 7b10b8e1e10e..53680a2f188a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -8,6 +8,7 @@
>>>  
>>>  #include <linux/rwsem.h>
>>>  #include <linux/types.h>
>>> +#include <linux/workqueue.h>
>>>  #include "xe_uc_fw_types.h"
>>>  
>>>  /**
>>> @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
>>>   * xe_gt_sriov_vf_migration - VF migration data.
>>>   */
>>>  struct xe_gt_sriov_vf_migration {
>>> +	/** @migration: VF migration recovery worker */
>>> +	struct work_struct worker;
>>> +	/** @lock: Protects recovery_queued */
>>> +	spinlock_t lock;
>>> +	/** @recovery_queued: VF post migration recovery in queued */
>>> +	bool recovery_queued;
>>>  	/** @recovery_inprogress: VF post migration recovery in progress */
>>>  	bool recovery_inprogress;
>>>  };
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> index da064a1e7419..7d91553c4acc 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> @@ -6,21 +6,12 @@
>>>  #include <drm/drm_debugfs.h>
>>>  #include <drm/drm_managed.h>
>>>  
>>> -#include "xe_assert.h"
>>> -#include "xe_device.h"
>>>  #include "xe_gt.h"
>>> -#include "xe_gt_sriov_printk.h"
>>>  #include "xe_gt_sriov_vf.h"
>>>  #include "xe_guc.h"
>>> -#include "xe_guc_submit.h"
>>> -#include "xe_irq.h"
>>> -#include "xe_lrc.h"
>>> -#include "xe_pm.h"
>>> -#include "xe_sriov.h"
>>>  #include "xe_sriov_printk.h"
>>>  #include "xe_sriov_vf.h"
>>>  #include "xe_sriov_vf_ccs.h"
>>> -#include "xe_tile_sriov_vf.h"
>>>  
>>>  /**
>>>   * DOC: VF restore procedure in PF KMD and VF KMD
>>> @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>>>  	xe->sriov.vf.migration.enabled = false;
>>>  }
>>>  
>>> -static void migration_worker_func(struct work_struct *w);
>>> -
>>>  static void vf_migration_init_early(struct xe_device *xe)
>>>  {
>>>  	/*
>>> @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>>>  						    guc_version.major, guc_version.minor);
>>>  	}
>>>  
>>> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>> -
>>>  	xe->sriov.vf.migration.enabled = true;
>>>  	xe_sriov_dbg(xe, "migration support enabled\n");
>>>  }
>>> @@ -200,238 +187,11 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>>  	unsigned int id;
>>>  
>>>  	for_each_gt(gt, xe, id)
>>> -		init_rwsem(&gt->sriov.vf.self_config.lock);
>>> +		xe_gt_sriov_vf_migration_init_early(gt);
>>
>> still, this should be called from gt_init_early kind of functions
>>
> 
> Kinda a nit that I'm not convinced is worth while to have
> xe_sriov_vf_init_early and then xe_gt_sriov_vf_migration_init_early
> called in gt_init_early...

we have global xe level initialization, something like:

	xe_device_init_early
		xe_sriov_vf_init_early
	xe_device_init
		xe_sriov_vf_init

then per-gt initialization, that follows the native flow, something like

	xe_gt_init_early
		xe_gt_sriov_vf_init_early
			xe_gt_sriov_vf_migration_init_early
	xe_gt_init
		xe_gt_sriov_vf_init
			xe_gt_sriov_vf_migration_init

IMO we shouldn't jump in sriov code from xe level to gt level init on our own

> 
> Matt
> 
>>>  
>>>  	vf_migration_init_early(xe);
>>>  }
>>>  
>>> -/**
>>> - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
>>> - * @xe: the &xe_device struct instance
>>> - *
>>> - * After this VM is migrated and assigned to a new VF, it is running on a new
>>> - * hardware, and therefore many hardware-dependent states and related structures
>>> - * require fixups. Without fixups, the hardware cannot do any work, and therefore
>>> - * all GPU pipelines are stalled.
>>> - * Stop some of kernel activities to make the fixup process faster.
>>> - */
>>> -static void vf_post_migration_shutdown(struct xe_device *xe)
>>> -{
>>> -	struct xe_gt *gt;
>>> -	unsigned int id;
>>> -	int ret = 0;
>>> -
>>> -	for_each_gt(gt, xe, id) {
>>> -		xe_guc_submit_pause(&gt->uc.guc);
>>> -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
>>> -	}
>>> -
>>> -	if (ret)
>>> -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
>>> -}
>>> -
>>> -/**
>>> - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
>>> - * @xe: the &xe_device struct instance
>>> - *
>>> - * After we have finished with all post-migration fixups, restart the driver
>>> - * activities to continue feeding the GPU with workloads.
>>> - */
>>> -static void vf_post_migration_kickstart(struct xe_device *xe)
>>> -{
>>> -	struct xe_gt *gt;
>>> -	unsigned int id;
>>> -
>>> -	/*
>>> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>>> -	 * must be working at this point, since the recovery did started,
>>> -	 * but the rest was not enabled using the procedure from spec.
>>> -	 */
>>> -	xe_irq_resume(xe);
>>> -
>>> -	for_each_gt(gt, xe, id) {
>>> -		xe_guc_submit_reset_unblock(&gt->uc.guc);
>>> -		xe_guc_submit_unpause(&gt->uc.guc);
>>> -	}
>>> -}
>>> -
>>> -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
>>> -{
>>> -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
>>> -}
>>> -
>>> -/*
>>> - * Notify GuCs marked in flags about resource fixups apply finished.
>>> - * @xe: the &xe_device struct instance
>>> - * @gt_flags: flags marking to which GTs the notification shall be sent
>>> - */
>>> -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
>>> -{
>>> -	struct xe_gt *gt;
>>> -	unsigned int id;
>>> -	int err = 0;
>>> -
>>> -	for_each_gt(gt, xe, id) {
>>> -		if (!test_bit(id, &gt_flags))
>>> -			continue;
>>> -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
>>> -		if (gt_vf_post_migration_needed(gt))
>>> -			continue;
>>> -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
>>> -		if (err)
>>> -			break;
>>> -		clear_bit(id, &gt_flags);
>>> -	}
>>> -
>>> -	if (gt_flags && !err)
>>> -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
>>> -	return err;
>>> -}
>>> -
>>> -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>>> -{
>>> -	struct xe_gt *gt;
>>> -	unsigned int id;
>>> -
>>> -	for_each_gt(gt, xe, id) {
>>> -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
>>> -			return id;
>>> -	}
>>> -	return -1;
>>> -}
>>> -
>>> -static size_t post_migration_scratch_size(struct xe_device *xe)
>>> -{
>>> -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>>> -}
>>> -
>>> -/**
>>> - * Perform post-migration fixups on a single GT.
>>> - *
>>> - * After migration, GuC needs to be re-queried for VF configuration to check
>>> - * if it matches previous provisioning. Most of VF provisioning shall be the
>>> - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
>>> - * range has changed, we have to perform fixups - shift all GGTT references
>>> - * used anywhere within the driver. After the fixups in this function succeed,
>>> - * it is allowed to ask the GuC bound to this GT to continue normal operation.
>>> - *
>>> - * Returns: 0 if the operation completed successfully, or a negative error
>>> - * code otherwise.
>>> - */
>>> -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>>> -{
>>> -	s64 shift;
>>> -	void *buf;
>>> -	int err;
>>> -
>>> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
>>> -	if (!buf)
>>> -		return -ENOMEM;
>>> -
>>> -	err = xe_gt_sriov_vf_query_config(gt);
>>> -	if (err)
>>> -		goto out;
>>> -
>>> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>>> -	if (shift) {
>>> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>>> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>>> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>>> -		if (err)
>>> -			goto out;
>>> -	}
>>> -
>>> -out:
>>> -	kfree(buf);
>>> -	return err;
>>> -}
>>> -
>>> -static void vf_post_migration_recovery(struct xe_device *xe)
>>> -{
>>> -	unsigned long fixed_gts = 0;
>>> -	int id, err;
>>> -
>>> -	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>> -	xe_pm_runtime_get(xe);
>>> -	vf_post_migration_shutdown(xe);
>>> -
>>> -	if (!xe_sriov_vf_migration_supported(xe)) {
>>> -		xe_sriov_err(xe, "migration is not supported\n");
>>> -		err = -ENOTRECOVERABLE;
>>> -		goto fail;
>>> -	}
>>> -
>>> -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
>>> -		struct xe_gt *gt = xe_device_get_gt(xe, id);
>>> -
>>> -		err = gt_vf_post_migration_fixups(gt);
>>> -		if (err)
>>> -			goto fail;
>>> -
>>> -		set_bit(id, &fixed_gts);
>>> -	}
>>> -
>>> -	vf_post_migration_kickstart(xe);
>>> -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
>>> -	if (err)
>>> -		goto fail;
>>> -
>>> -	xe_pm_runtime_put(xe);
>>> -	drm_notice(&xe->drm, "migration recovery ended\n");
>>> -	return;
>>> -fail:
>>> -	xe_pm_runtime_put(xe);
>>> -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
>>> -	xe_device_declare_wedged(xe);
>>> -}
>>> -
>>> -static void migration_worker_func(struct work_struct *w)
>>> -{
>>> -	struct xe_device *xe = container_of(w, struct xe_device,
>>> -					    sriov.vf.migration.worker);
>>> -
>>> -	vf_post_migration_recovery(xe);
>>> -}
>>> -
>>> -/*
>>> - * Check if post-restore recovery is coming on any of GTs.
>>> - * @xe: the &xe_device struct instance
>>> - *
>>> - * Return: True if migration recovery worker will soon be running. Any worker currently
>>> - * executing does not affect the result.
>>> - */
>>> -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
>>> -{
>>> -	struct xe_gt *gt;
>>> -	unsigned int id;
>>> -
>>> -	for_each_gt(gt, xe, id) {
>>> -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
>>> -			return true;
>>> -	}
>>> -	return false;
>>> -}
>>> -
>>> -/**
>>> - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
>>> - * @xe: the &xe_device to start recovery on
>>> - *
>>> - * This function shall be called only by VF.
>>> - */
>>> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
>>> -{
>>> -	bool started;
>>> -
>>> -	xe_assert(xe, IS_SRIOV_VF(xe));
>>> -
>>> -	if (!vf_ready_to_recovery_on_any_gts(xe))
>>> -		return;
>>> -
>>> -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
>>> -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
>>> -		 "scheduled" : "already in progress");
>>> -}
>>> -
>>>  /**
>>>   * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
>>>   * @xe: the &xe_device to initialize
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>>> index 9e752105ec2a..4df95266b261 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>>> @@ -13,7 +13,6 @@ struct xe_device;
>>>  
>>>  void xe_sriov_vf_init_early(struct xe_device *xe);
>>>  int xe_sriov_vf_init_late(struct xe_device *xe);
>>> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>>>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>>>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>> index 426cc5841958..6a0fd0f5463e 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>> @@ -33,10 +33,6 @@ struct xe_device_vf {
>>>  
>>>  	/** @migration: VF Migration state data */
>>>  	struct {
>>> -		/** @migration.worker: VF migration recovery worker */
>>> -		struct work_struct worker;
>>> -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>>> -		unsigned long gt_flags;
>>>  		/**
>>>  		 * @migration.enabled: flag indicating if migration support
>>>  		 * was enabled or not due to missing prerequisites
>>

