Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2C0C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA10F10E6EE;
	Wed, 30 Jul 2025 21:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFrhj69B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA42B10E236
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753912507; x=1785448507;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7ml1kocHT8PDlTQxzaWblxr+ENhMdUDnbzQD1rTy2wQ=;
 b=lFrhj69BMKbqMKOrDemrN/HrJx3DvTTpvdE0moqeFoW1lYZO2eoE+x3c
 o0hZZozJIrSintAqX91+X1BtUKdKtiWlf0JSIOgdKlvcbr1gOgKjaYAy3
 v4mTFUKWRDfYDIkKZNHtNE7qt7MAfyvV7tx+cjpBio5RDr6jMHQ9SDT8X
 zZmCwhuT4X43gzIyKqcs/JN09Z72l2i4nw//ns38k6OW38cb6CZpvtadJ
 rrX/40eexw3+0ONIMhcI22xHxJ3p4BFrDy5hb9HYFgzb/nOpA0STRaaEs
 Bqd80l3jpVTpuVYr1wOPahwln9M9UyGD1N1cpMGMIF8KlwTXl94b3r8GV A==;
X-CSE-ConnectionGUID: I765vFRhTL6tTAMu/Bv5yQ==
X-CSE-MsgGUID: dLr3K1qTR9OqA+NJttZrMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56192514"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="56192514"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:54:51 -0700
X-CSE-ConnectionGUID: e1wA7QQQTeabPSz/w5amCw==
X-CSE-MsgGUID: raxxHdpQQc6TpOXBUInQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="162360387"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:54:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:54:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:54:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfvcJUGef2DTvH1qQhAYxZI0yZqoYXEWildUT+NvR9VoItDosw3tx/aPC/PM3qmHMQ6aIJ8gVgMBwC4bE8AwjvFxYwXqQYBGosxYcCV1foZ4H4jJfxIn24tsYnGmMc5HKJAPhtOVyaOvbPQnOH4jPWbENaWPVNVi3cCET4SR8fZOrnD3F/vYNlS3E2zrQko2J5qTNmEzZ/xu2XGLQPZXJxO0g990cFjzZXxNrMlzO+1Z86xFaybELSf2gOi8zA0pzTpSyU+neEpzhyBkzVDb2JS9A7DcvAGu8Oe/1kksvNXl9ppSPzaoNh1E69S1VbeM+I0VnBKSUB33vBHBj064pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze94pqQni3Avqw4khGYywiyq7McHo2rZ96CrK/jyJXw=;
 b=jOuvu2xgIDrEuz1rOHL1KYgP46aryMBiMqiFBUdKYoMeCFmSlqKKUJ7UiSHCDRcFBTCojrbpQj5xeNC7AgTz5K60XzZhcqF7+WQhsU7fRCsrDWRlt81NyaaYbbN5AmkkM7AXgLky7Z2mmHXQrotk3cjNiy/vZH9/pF9a5o6QMqDI040MHHQSb107pjC1+uNa8+vvXfFXkrLyCLc6zdqHm6kRfw9TVJH2EkdFV0h+ZOKxFm2GrhJqYd51QqlwqjhQufGINgFUWNvCCy+sZ62Z4CixZY/3auQ6JWiAxGJ4agGLASU3lvZi3set5HauVLPsQsH0zI7kAeZo8g+REMs1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 21:54:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 21:54:48 +0000
Date: Wed, 30 Jul 2025 23:54:43 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v7 9/9] drm/xe/vf: Rebase exec queue parallel commands
 during migration recovery
Message-ID: <j3rmz5kioxa4iyqv33u433zqibntvriitbml2tvwf7llho4la7@y6gtk7uqinep>
References: <20250719073745.74251-1-tomasz.lis@intel.com>
 <20250719073745.74251-10-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250719073745.74251-10-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR07CA0252.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1777e1-6421-4366-7365-08ddcfb3b3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVRsOU82eHZKdjRiTHV6MFh3aGsveWRmUnBJZUtBVnBRTTVwTFRQaG5USmYy?=
 =?utf-8?B?UEw5VmlqZGQ1QnBYYVN5U3hCbjlqQU5MTDhlZnV4WnFPdGtMZzVnYm9YRG93?=
 =?utf-8?B?OFJYZnorci8rdkQvTVBDVWxPMmlLRWVJNW5FbFlIZjBCQXR6UzFQRGxXUHlZ?=
 =?utf-8?B?ak0rRUVlclVEZUh2djA2c1ZZWWhFamhCVHNnVENzUkRoUHRvR2V1N2p2bXNB?=
 =?utf-8?B?b3Fkak4xV2ZENGhIK3VSQnNlSHBCSHc4WTJaRy92eC9MbC84bGx4MDUyL2lR?=
 =?utf-8?B?eFpvUmFZNGRQTFhtNm5lQ1Rpc1RSanppdExERXhISHhoRURRc1NlcGRxOVhZ?=
 =?utf-8?B?b3NRZUh1d2lETGxkVzJNK25LOVZmKzJzMWliVks4bVJYYkMwdXgyYmd0OFlE?=
 =?utf-8?B?c0huVFRXRXpoaDN4eWV0MkFKQ20yUzJRb1lFenNqQ3FacjU5eCtMOEprRDdC?=
 =?utf-8?B?S0xPTiswOE5wNm1GK1RoRHVjREFObi9KaitYNTAvMEp2UjU3VlEyV0M4K0U1?=
 =?utf-8?B?d25kMnFEaEdrdi8rSDRJNEVJUWpydEdpclhRNVJ4b0pnTkhxS0VxdU91RWJX?=
 =?utf-8?B?Tys4MzRaQU9YSlBja3o5a1k3bU9iYnVIdnNUNkJUNnBkWXFSYXlER1V4bnhM?=
 =?utf-8?B?Z0tlVVpaMmwwLy9zY2p3TloyTkQwY212WlV4dE9QRkpwUGdyNThkSm1uUXZD?=
 =?utf-8?B?amM4VHZicXhNLzZQOHA1SkJsZ0NPOXdkS2tFV0tQUjFWMEZHY1gzQk04QVdG?=
 =?utf-8?B?K0ZXNFdwVk1SM1B0NnB2Nm5GMUljTXJnZU5PQkJHQkRna01PejF5MEF1QVVL?=
 =?utf-8?B?VTYxSWtlUDQrUVN6Mit2R05DSDNHKzAvdW5OU1V4MERyYzZWZVNneVFqYTlM?=
 =?utf-8?B?V1h1QWhvM1UxZHdEci9JVm5DVlNmOXhiSXlTL0R2YTJtSWxtS2ptNTBvdklQ?=
 =?utf-8?B?Rzhwb0x4Qkw1SThpR0J3L3Btc01oWkV5T2VVSUhNL09wMDBzcU55UDQ4dUtS?=
 =?utf-8?B?TnlKTGE1ckp0VnFvNndhdVhvMDJORVVVeU9aQjJLWm1Jeks3eThEN1lLalNq?=
 =?utf-8?B?YUZBSEJnZ3JqSGRqQXVXZ25LeEkwU1pLRFpjTGozYldYZ2VGVVZFbXQzZmZ2?=
 =?utf-8?B?azJPZHJoVlNtdExnTHhFS3U1ZldKYXlmVXZBSUtnNHY1ckYxelFHdTZaY0VY?=
 =?utf-8?B?cXpqNnUvWk5JV3cyQ05FZlowdUtzMVpPRUg0UEFKbjFYOG1zeTVHZWVEd1Mx?=
 =?utf-8?B?TG93RHRsQVJZQjJOZGdWVkl6QXlUOFYrNzMvZWc2YUJVL2VJVm1nb3FWc1RJ?=
 =?utf-8?B?KzJ4NWtSUTU5Ymg1VWNUcXpzcTZPa2VqWEhqdEVvS3JGS0dlY3VMaWM0cTNZ?=
 =?utf-8?B?RXF3aTMyT2NXZCt6eFNMUWJyMTdWbXlvZjRYOWxmdkQ2RWdEREFhMkxQWWhp?=
 =?utf-8?B?WGUxMXdubEJ5c21EWHRGc0VYbEJoVEJkSlpFUWdJZ2hndk5oWk1lYnZOR2xS?=
 =?utf-8?B?cG82OEpIQ1JiWGIxUVRtNU1JRlJIOWxsRFZYS1htMU9EK1hGbVpBSWN0di95?=
 =?utf-8?B?NS93dytlWTVrcWtuemF0RFc4TmYwS3RkRWljMkZ2OThBNlB3SmZYaDl1RE1j?=
 =?utf-8?B?RVVHTHZGYTE4YmVVRVZZL1dhL1pTclNGWldSZXFuOVdkSkNMMHFvWTJlMUlN?=
 =?utf-8?B?T3pyMmsrWlJMNUhGNXIxYitVVEM1cWcyZ3JVeUwyZ0RhbUp4ditLK0pjS0wx?=
 =?utf-8?B?TkpZMG5FUjJleGp0Y1p3VWhBYzM3aUdBQkE5b01qNmRkMDM4dXFvOFdGUDlK?=
 =?utf-8?B?UUVka0pRZ2Ura3ljQldwVDRrQ21pMzBGTUpCV0RUTlhSZjkySDZmZ2VtWUlE?=
 =?utf-8?B?b21KOHBSakhFeWRvQ2ZzYWJ2ODBmMDZhV3R3ZGY5WWREM0FTU25oWklZVWho?=
 =?utf-8?Q?7HbOmHLE1ks=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEw4WHRIY1NVaEVVc1VMbUh3MFIvN1RwcTN0Mm51K1pKM0p6VmtTa2JPenl6?=
 =?utf-8?B?UEM3OFlwRXJKa2JMMnBkd0llQ1dkWXJzamFWdUJhcE1yd0pjM3RTVVJjVzdw?=
 =?utf-8?B?MmtqS0Z2ckEyTVBPa2Q0Q1pjNHpvNE8zODlnZkpJWEVtMjVXd1dUY0FtWkhN?=
 =?utf-8?B?TEJrcHNxOE5jbW1oS1A0eEMyVU4zcldOcU1QVTlxNjdoY1VPUXRJKzc0Z0NP?=
 =?utf-8?B?dmVRV1ZWR1prNlFaOGMxSGNLaHh1ajlZVnZ5dW8zWDNIaXR4Rndzb3FSTFNx?=
 =?utf-8?B?R1lDL2krd3psaFI0WmlQQzd1bWQ0UW1NQWc3WEUvYmFTUXk2NW9qL1pUeWhI?=
 =?utf-8?B?cm80MkVNMXVPK0FmeUYzcjVvdHBSeFZoMWNSMXJkQ0s1TkJXZThOYXU1RDFj?=
 =?utf-8?B?dWhlWEtVc2xmSFB0Qmc4TFhqeW1IQUdieElMRUQvTSsrYm5Pc0JJblZPYTJ5?=
 =?utf-8?B?aG9WVHZuVFhHWE5JWWJDaGwzZTNUOVAvNDZudlptRTJLSWhpN0tGN2tEeUt2?=
 =?utf-8?B?N0UwcEV3dGdDUS9QNVlYY1ZPenRmT0ZWeW9kd0RuR3FKT2dPYXdXTk9BbUU2?=
 =?utf-8?B?ZTgzeENJVGNaUWFFVVEwZU1xTVNaOGV6aWpGYWVGbUdvOE8ybXJNemxEckdU?=
 =?utf-8?B?ZngvZkd2SXhDTmlrcVNDZHR6eWRWeDBFaHkwOC9mcnFpOTFabEtQUnFjWjFR?=
 =?utf-8?B?ZEN3S3Z3dnNmOS9QdDdHcmx1ZU9zcHdEWlY2cHhYdFl4MElGa1BSUXJSem95?=
 =?utf-8?B?NTVSRFh1T1ZFeHhOUWEvclp6Y0tNNnA2S0R3UHBzVlV5NERlMkxxaUFjVy9k?=
 =?utf-8?B?dmJpcEhjSzUwdElZTGtaZHFQMWtnTjY4VFJvU2VOUE9DTDRwNE15S3FuWVJB?=
 =?utf-8?B?MzQ5VmtlSG5zNWlacllvZlRxZExrRHVta1YwQTNwL0d3TjloZFY2QTFBWDhL?=
 =?utf-8?B?N0xkcUFwL09QL21iVml1bURLNnZCQmZQbWZGTUZNM3VPUkNvb3pVQ2JTTkZG?=
 =?utf-8?B?aHQ5VEFjSEZURkp4eDBwenVJRGJhTFVXazM0Mkc5N1UvMGdMWllSbEtmOCtO?=
 =?utf-8?B?SUliMzVFMjBHMVdDMEZ5UFJHMHFQNkNrb3BsWkc5dXJpUnJ4THk1WTNxempB?=
 =?utf-8?B?WE1tbWdpY2dtU294ejk2SGczR1czUkxNZ3N4MlArYUtYOTJOTFFxUlpRS3M0?=
 =?utf-8?B?T3RXcmdROStHMnB0T0J6ZVc0NGNKRjhoeHpYSEJMRFV3LzlqRGZ6QTlpRkRr?=
 =?utf-8?B?SFRNYWpyYjZLelY0Q3VWL29ZdGZrTFhkblNPblRWdmJxZm9PSjloSkR0QmEw?=
 =?utf-8?B?TVlrZGRDc09ybUExN1UrZHV3K04yZWtlNVNYRmFTRTNTUkVtbTJSSDJ4ejAy?=
 =?utf-8?B?L3I5M3FyYlVkWHNlNkRzU0V6YnpYamhmWTZGZ1lIWGxNeTFOb0gwdWZVWG5Y?=
 =?utf-8?B?cXoxdGpaa0FqWEtNNzFLK01Xek5haG0venNMTGNCTkxmbVBudWFuekl4ZmNM?=
 =?utf-8?B?Z0JNOWlvN3hNK3hUemo2K051VnZUOEx6TXZRSGxib0FSajM3ZzQ0UnBhdXFy?=
 =?utf-8?B?MS9pdnl2ZFF6elZDM3QzM2sxNEdTdmRuUjAzdmFmUFZ4dHRtQXlFV2lFc1pE?=
 =?utf-8?B?ZWpxQjl3SldZYnZxTStFQ2RqS3dseDNUZ2JBMnpmd1hpVXZ2WlVOM0IrdXpo?=
 =?utf-8?B?WnBHVjNRNDlCTktjQlhOOWpBSitvWFRVa24vcUlBZ21KMm9xaVRDWkhGSTdZ?=
 =?utf-8?B?M2xjMEQxMElWd1l0d2RteDJhcitGcXpaWkIvdEVLdlF6K01IamFzak13NTdR?=
 =?utf-8?B?bHNwbXI4a0tMTHVLYkFxRk4rZFlEM1M3eHdFbHhESWRYaVY2N2ZNNmZabFFz?=
 =?utf-8?B?K0xzcW5BY1lobmFUejVoa3Z3V0JWdUVaRTJzNC9tOWxIRUNMd0pKV3l3SDRx?=
 =?utf-8?B?bVk1dm5ncHRKb1VQSmJFVTl5NUtzT0xZTmtBQndCSjJGdENuR0F1TVFHWmRG?=
 =?utf-8?B?RU90MDhsM1Z3UGs2QnpCYmY4b1VtYmxnVzBqbUIwT1lDYmJHMHROOEJOM1Vv?=
 =?utf-8?B?SHFBeTlkQWIrQUR5K2dXcGVVN1VtRmdzaUovUTVmbDBaR1NCQldHc2hkZi9F?=
 =?utf-8?B?MHpiUU85c2VMdUZxSWMrQlBoaWZseGI2bzI0Y2R5YlNWaCtSaGt2aStMcksv?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1777e1-6421-4366-7365-08ddcfb3b3a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:54:47.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzPppsWuLVhbbGD5LY/AMBiSTKlH/46n9NRRMsJCwSJhYxMamHUBLdcb6CzzVFiPd1IFx1l6dhs1nBXypB3j8eq1TanhoMgAwEYH4vVUEoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
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

On Sat, Jul 19, 2025 at 09:37:45AM +0200, Tomasz Lis wrote:
> Parallel exec queues have an additional command streamer buffer which holds
> a GGTT reference to data within context status. The GGTT references have to
> be fixed after VF migration.
> 
> v2: Properly handle nop entry, verify if parsing goes ok
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 43 +++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 84bc352f6f12..9eb0fd863218 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -693,6 +693,44 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> +static void wq_items_rebase(struct xe_exec_queue *q)

Should we propagate errors up?
And perhaps fail the entire fixup (and wedge the driver)?
And I guess same thing applies to other post-migration fixup places, if
we ever find ourselves in an unexpected situation, with
driver-controlled fields containing undefined values post migration
(like in this case - places where we break out of the loop early, before
reaching wqi_tail).

> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> +	int i = q->guc->wqi_head;
> +
> +	/* the ring starts after a header struct */
> +	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
> +
> +	while ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
> +		u32 len_dw, type, val;
> +
> +		if (i < 0 || i > 2 * WQ_SIZE)
> +			break;

Perhaps drm_WARN_ON_ONCE?

> +
> +		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) + 0, WQ_SIZE / sizeof(u32));
> +		len_dw = FIELD_GET(WQ_LEN_MASK, val);
> +		type = FIELD_GET(WQ_TYPE_MASK, val);
> +
> +		if (len_dw >= WQ_SIZE / sizeof(u32))
> +			break;

Same here.

> +
> +		if (type == WQ_TYPE_MULTI_LRC) {
> +			val = xe_lrc_descriptor(q->lrc[0]);
> +			xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) + 1,
> +					   WQ_SIZE / sizeof(u32), val);
> +		} else if (type != WQ_TYPE_NOOP) {
> +			break;

And I guess same thing applies here.
I know that we would print out the error at the end if we don't reach
the tail, but that alone doesn't really tell us what went wrong.

> +		}
> +
> +		i += (len_dw + 1) * sizeof(u32);
> +	}
> +
> +	if (i != q->guc->wqi_tail)

i % WQ_SIZE? We're incrementing "i" beyond WQ_SIZE, but wqi_tail always
stays bounded within that range.

Thanks,
-Michał

> +		xe_gt_err(q->gt, "Exec queue fixups incomplete - wqi parse failed\n");
> +}
> +
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q)
>  {
> @@ -2506,7 +2544,10 @@ void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
>  	unsigned long index;
>  
>  	mutex_lock(&guc->submission_state.lock);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		xe_exec_queue_contexts_hwsp_rebase(q, scratch);
> +		if (xe_exec_queue_is_parallel(q))
> +			wq_items_rebase(q);
> +	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> -- 
> 2.25.1
> 
