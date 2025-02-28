Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92731C282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D41C10E374;
	Fri, 28 Feb 2025 19:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5f4fqeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EE710E374
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740770560; x=1772306560;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qCValpNrCxeFOv8P5TLaUzilk80D32foU9p9k10qSn8=;
 b=b5f4fqeuIU++7rOCJwNAIy95etvSaU+wuw42/PWEI3+qZliAJ4WUsbFc
 j8doBflfho2RKnRJrHyANH7OwWcTmY/5nhNL3VnfMWm3Z37wvp8FreHKI
 6BxEUPreLG/NWEYEds7D5Chzuxat7NKPifBdJUyG3f2PUlkTxzqGMzlxo
 ZaeeIBqbSPKuCLeW92jjDymRxsWzmnToAGRSIks35Vk/vjvgXLqbvDNzz
 0ZoDLpQsdhdNYcX8pwZMtkKWJMETKNnnr5gVyNLaRlEkDJ74BSwdouB4A
 sp9t6T1VMIMZ7JSyj9XchAc87wN3+XspieEYaq3vbw6OW/lw8LIBH4J89 A==;
X-CSE-ConnectionGUID: k9lMViU7TAKlN/cLe5lgDA==
X-CSE-MsgGUID: 4sbuKRPBSv+7+EyF9nDLlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41630692"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41630692"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:22:39 -0800
X-CSE-ConnectionGUID: UUzikS9SQnynoDe1ZtwWRA==
X-CSE-MsgGUID: KJLmodniQPGqYyoUF9pTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="122554992"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 11:22:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 11:22:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 11:22:38 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:22:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhVC6VTLEkTC0gVbomoRbQSnItkLCwyunIKjWJ6RGwH8+LWibejE4xbozSS3DLrSUX/r3dsLgGqAehf0Ol3Z6FRMF5Ke5bQRvAqu2sYfQhtHSSZe072enXi+S03AzBxFlmj5FbecWrU96PW41n/zoFm4AR/ZmUZJNJi0ihRdS5wbRAFbEEdOom68z6ggyA3gi8NPEv4Y6WWNQplSskK0xid5Levjplp5pzzIKNuCex8ii1fCiNAwi3E3QhX7NnGn4lvga0xXqeMvXnVQTFmzddIjWPP6Dr2keT5Qd94XBdZEIugj1QEYGl/mkETUe/PfilfxmNwSZTU/kweVKw8B3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lsIYbOYVJhbjvpHmvu6cn2K5Q36WVX0R9ZjhrHcAYI=;
 b=a+vCYeMbIh/PXhuMEA4hS6P8EqpwHf2POyUKMPKo8Jysy8Q/kgmOTjwGlMd4MBNGb/GNaa8pgsoEpUYLwM3gZrc/jaDRE2iFs5n1VOji+EBaWCtyCafHLB6ZHBkeQDsJvmxD3cTF7tvTeyA1uESK3MBWSwqX4cpDSGPPMwXZ2H1ARXpH/yrbNfQm/toVB0mQC2wGHp0CQ/+p6hIUtjezOsmL0NB6ZkE3Ijq8cxDZKfV5rcyJ4iPbJTt8S9dND7d19BzUO9sOFYBpR5+CNEQPckHxp3DHOKxNNC2QO+AyZBXlHLNfmc92rLdwuvbQncymC8xXMIBrjmAHGnlOWGquYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 19:22:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:22:08 +0000
Message-ID: <a11812cc-bf0e-488f-9701-317ee9807699@intel.com>
Date: Fri, 28 Feb 2025 11:22:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250214172503.502320-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN2PR11MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e8c0bc-0b09-4aab-2a73-08dd582d311a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NpZXJMdHdTWHV6a1NHbGEyeEZrVGY2NEl0d2x1WmxVZ3hEdzBlazhSQk5X?=
 =?utf-8?B?dlVKb1gwbkpCbDB5S1RieVJRUkNpTUdkay9oS2EraWpjQjlvSmw3TWE3YW5C?=
 =?utf-8?B?R0g3Yzk3ZzMvMlJuZEcwb2NlWlBmM2tJLzB6UC95UjVHV2IyejlXT0orSkxt?=
 =?utf-8?B?ZmhMaW9iZW1QR1R6THlpNXhXSlMzc3VCYUh0cktRVDlRVDRROHJCYlQ2WitX?=
 =?utf-8?B?Zk95emF6QVRPOTk0UlFuTzlvRUFlaS9UMjF0Y2UvelZhdXNWcXp0VThabGdj?=
 =?utf-8?B?QWIzVmdlUHRDN1JsNTJDRVpBV1lGcno3elNUZU9PQzdSZWZJMUxoSUhNem9O?=
 =?utf-8?B?ejM3OXhIYU40cnNIY0t3UmJsbWVqWnkvY042OFE0Sk9VUjNkNHo5S250c3d2?=
 =?utf-8?B?L3dvaGlCbmY0bEMxVktIYUNaQUQrZ1NRQ1Q5M2Q0QzRTS0JISElHS0ppekh1?=
 =?utf-8?B?bTRiUHF5bk5WOEVweWVEekdrbzNQcEJweEtUUENsNHBLQzliYXpoanNkV01F?=
 =?utf-8?B?VVVROXcvMjhlc1cxUVhEMVpZWUVWMnNaamlzOS9QOTdPc0dUa2FkNktrQmtk?=
 =?utf-8?B?VXZMandhMzYwR0hKU0dtK3VQSEJEaUdOdy9EOHNWd0dWTzJDOVVBY1owN0Ro?=
 =?utf-8?B?clFRNVhIdUtIMWFTc0N0UzM0S0hXZ1ROdkNkY253ZHVHTXdGcThpbmZvY0Zy?=
 =?utf-8?B?b1BhZUNnQmtRRk5yWDZuN1N1SDl4ZWVmbFFBemdEU1hFeU9HZFJqLy91V3Z4?=
 =?utf-8?B?NHloTkVnOVk4b1hBR2FlQ3BTYklmbEFVVVJaK2ZHcFN2VTFFcHZTRUZjZVhz?=
 =?utf-8?B?aHh1T3p2UGZRaVp3TGRJdTRBM2JENWhhMGpIQ1gvYldDQ05PZDUyOWZiS21t?=
 =?utf-8?B?VHVFZkNsNE1LTDdLdzMvTDJRTnlRT3FmZnJzWjl4MWhtWm5UaHRXQXVRb3U2?=
 =?utf-8?B?RlJucVJjQkhSanVQclF5YnduU1daZDRobExPRTlMREYyWDZvSTRrejUwWTJM?=
 =?utf-8?B?bjZGbnpZMHJkVFRscFhqMXE3eTdvSzMvbWZpQWtuZ0lDWTJhTWJPTm9iZU1m?=
 =?utf-8?B?WjFFbmQ0RGI1bmlhd25VZDhxeUJBZWZqMlZqNllUMlU0RVBRWHJyVy9CYUZm?=
 =?utf-8?B?cEQwaEhrK3lla0ljWTg4L0xOU0hpYkpFVkVJQS9oSEtwYnFUclRGUlhnMFZL?=
 =?utf-8?B?SEdWaHFuUXhOTXdlMWh6YnEyZ21naGZGa2IzcXJGUGs1Y3c4dml5cmlXeGZN?=
 =?utf-8?B?UGdOQ3J0c0dOb29EbEdPWXZ2V08va095b2E4NEJrN3BJV3lVSFFCK1VuTkZD?=
 =?utf-8?B?a2dWV1FJYk9aT2NIL1VRQlR4NUtSVjU3QTBIYk4yMGo4TVo0L1l2L1IwU3lj?=
 =?utf-8?B?MCtBSHNzN3g4aGVJb1VDS3hMVGJDNHQ0MXkyOTF5VWRqTUhjOFl5a2dhRkZS?=
 =?utf-8?B?dnVndmV5YWRUc2xtUU9nSDBSWUMzb2wralJVWWZvKytQWWNrdnhaWlZXcjRL?=
 =?utf-8?B?ZENVUDdIWEEzMVV1WTRobE1ZWkFVSkZuTmEvYXoxME5rZllSRHl0M2MyQzVC?=
 =?utf-8?B?Y3R3Q3pFaTdMcHFZY3Rjc2lCclI0ejVReTBvbEYxbnBsTzhEVlc1OEJ1c1dz?=
 =?utf-8?B?ZUI3N3NiNHUyUHVxM3hhcER3ekt6OFpHZkRMMFdHbkJRT3NKYWlsU0w0d01z?=
 =?utf-8?B?UFh0dWVsM2dWK0poQjlvVzJtL2J5eC9QT3djM2VzTFJtL0ZOSVBjQmhrdVR4?=
 =?utf-8?B?M2QybS9aUmdIRmttZXhVUkxQSi9WWWs5aFBRT2ExODJkTTRXZHk0dCtSQ3dE?=
 =?utf-8?B?YXQrRG9qL1NZMU1aVkwzVE9CWUV1c3Vnd3lra3Urb2JMUFM3QWRPR2tSTkZX?=
 =?utf-8?Q?oJNLof1L/QgPF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFWNG83VTc5WHNRM251Z2pVd3ZkN0JzMmdDb1ZWNTIwQ1h5Y1hMcWRZSWg3?=
 =?utf-8?B?M051UGQycXZUeFIyL2k4UUp6TEM1WGtxSGEyb3BMa293eGpMQzU5dHRaN0sw?=
 =?utf-8?B?N0VkQjhrUXFMM05BSjhGYkdBSHlzUzVNc0lMRHdCVC9oUGV4dFl3c2JhMVBL?=
 =?utf-8?B?aCt4SUZPM2Ivd0FkWHFSQ09TSW1oV2N4Q25pdEZGem94NVRYeGpSTXJoRnRU?=
 =?utf-8?B?dmlWcHE0MXl0d3RmMDJBUmlxOW02SDZ0aktXYUNUalBFL3JJY2c5VlN6Mjhq?=
 =?utf-8?B?NXNBTHlMTFdQUkwwMkpoa2o4NDFGVm9YUG9WbXFoSGdQb0VFNEw1bzJLU1Iz?=
 =?utf-8?B?Q0d0YXZKcFZqZjAyTC9wZE1ISmwwYklFanRtU2V6WUZZWUY0b05oM3NCNm9U?=
 =?utf-8?B?Zk1zV1hkNDZqY01RWFFLbmJIZk1YRjJMRThXZjljbEN4OThocExxenUxOHQz?=
 =?utf-8?B?NmZpSVBPbzViclFHdFFaditocU1zaUg0aFpKQ3BKRysrb21CL1hwNklsRnFn?=
 =?utf-8?B?alhnZjBUSGQ5Uk1keWV0TlNZRlJIdTdJVWlBNmdvN0tjUVc3R2RXdFd5cWtG?=
 =?utf-8?B?bUtWVU1FNmZzcEUxV3I4dGFwTktCN2JHWjNvV25qMHo0WnNlYys4UEErSEd3?=
 =?utf-8?B?U1h4cGtxcFBEQjNlWUEwVE40M01DSFlyczBtQ1BkZ2JuMmpYTThxaWdBNjNK?=
 =?utf-8?B?RngwbnFYS0VUVTRqekZLRVVqSExTSHlOSXdrVkJONVg3S1M1K3pkZ3ZHY0Fh?=
 =?utf-8?B?QWdlWTBGbkVFVnFzZk5yYjQvUHpVZDlETStsaU5Rd2ZzeXc5U09DTWRnQ0o1?=
 =?utf-8?B?VkxIVmFnaytKNVJ4NlJKTTAyeS9iMi9RNVlGK1NOVXRoY1VIZmRhR0lmeDJN?=
 =?utf-8?B?MkRyQzI1U2gxcVZoMnpuVkRsSVE4c3RuTHVUVEpRVUJMWUFlcjZKUmJaSFVO?=
 =?utf-8?B?ZVE5bzVIOGEyNlhVWVpTMHBueW1lVHBVanFpMHVET0cvZ1BZVTZZU1VMTGRB?=
 =?utf-8?B?L0hmL04vZHRWTW83cDlKTThUV3hyL1NnTk83YlJuSVJqWkhQUnAzUHp6VFZa?=
 =?utf-8?B?L2tSZXhtZnBZVlUvZjRIY0FmUE5sNE9GR3BSVHlFZDh2MDlBVlpYa2tQTGJE?=
 =?utf-8?B?cWQ1OEpmVi9KWG4xcVRaaVR3UzJhMkhxR05qODRzRklKd25tT2UrckdiM0Ew?=
 =?utf-8?B?cllrRmVkdk96NGFEREV3Mlh3VlNUSnlaYkxvT1ZJeWRoYVRpbGY0UnBEckpZ?=
 =?utf-8?B?dzRuU2RaZUJ0ZUszZkNsOVRrcVBnOVBiZHR4VWxGc3FEd3NkczZUN3Vocllo?=
 =?utf-8?B?L24rREJ6NDU0QjBqRlloY0dia0JMT2VHay9QT0piYitqWEJKcGtGVVdDNytj?=
 =?utf-8?B?NFpSbVBZR2ZtcHQyOWlYdDJINVgvUDE2UGczSXZYQWtId0s4Mk50NGhjREI1?=
 =?utf-8?B?aXo4elhkWnZQR1JSLy9uKys5dzgraDV1VXhBMXQ0cHlsTGNldHB1UXZ4cFZJ?=
 =?utf-8?B?MS92NlB4dUtVWXdiYWtVR1lOeCsrZm1CMTNKckR6bkdFb1V6NW5sTTNNc2hC?=
 =?utf-8?B?bUhYS2dLNXlseWlPdTRqcGdwODRUUXdhV1NIVFowUUJFYTdxU0MyYXQ0dXNX?=
 =?utf-8?B?MGpSRkRybGxoSWhPMTZydG50RDNIOTY1Z2dyQzJ4R1pxUDhUd0RzZlB5dURO?=
 =?utf-8?B?eGl0MC90bEZkNUVpb1JuYXdYdWFUUGJQSG1meXk2TDYwSlROdmhaUTB4V3U2?=
 =?utf-8?B?K0xpNG00b2oyTThibWxWazZ5MnAzNVhYMXNtZHVVTk5yZHNHcTdmQWRBemxl?=
 =?utf-8?B?WnBWZEhyODI0RmQrTG1CZ0ZPcTdJK2lEOXNlT1N4UXlpMVlGVlgxK2VhRjBu?=
 =?utf-8?B?YW5JbmNnU1o1Mkd5QURZTjFlemo2RS9NdVZNWTdxMlVyQytJUmQzWUQvR1pa?=
 =?utf-8?B?bUJnUWxVU1RBU0IzSTh4YjB5cVQveG1nWktBZmR1Qzc0QVRPUklYRThJK051?=
 =?utf-8?B?ZEZhUXgxa0JQTFVxMkE5L3RYUlFOdnN4WW9rVnhGQ2o0cUpaaTNVa2RkS1hH?=
 =?utf-8?B?cTFCcWxxc1VFUTAvR3NHV3JXYkJHSzRYWHpWOFhyOE04QTdYRDZ4MTZCVEEx?=
 =?utf-8?B?ak5xTHA5dGQ0ZllMYjBhVnNlaGpaTndvTXUyakhENUF4SXZsSFhwcWQ3WEw5?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e8c0bc-0b09-4aab-2a73-08dd582d311a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:22:07.9021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG0gT987ePvQhtLK4Uygn74z3kzw3lHi71hK+56K2KTwI+1HCvjmsIWONZhCQ0fXd3FgDLi9QHAkyZiH1AlVIIx6oXAe9zSu+MZfkIfFWpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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

On 2/14/2025 09:25, Rodrigo Vivi wrote:
> In a rare situation of thermal limit during resume, GuC can
> be slow and run into delays like this:
>
> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>     		 [status = 0x8002F034, timeouts = 0]
> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>     		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
>     		 perf_limit_reasons = 0x1C001000]
> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> ------------[ cut here ]------------
> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>
> If this happens, this can block entirely the GPU to be used.
> However, GPU can still be used, although the GT frequencies might be
> messed up.
>
> Let's report the error, but not block the flow.
> But, instead of just giving up and moving on, let's re-attempt a wait
> with a very long second timeout.
>
> v2: Keep the precision comment (Jonathan)
>      Use a define for the regular SLPC reset timeout.
> v3: Improve messages (Vinay)
>      Only skip initialization if the second full-second wait failed.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
>   1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 02409eedb914..74cc13012532 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -20,6 +20,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_idle.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_throttle.h"
>   #include "xe_gt_types.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> @@ -50,6 +51,8 @@
>   #define LNL_MERT_FREQ_CAP	800
>   #define BMG_MERT_FREQ_CAP	2133
>   
> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> +
>   /**
>    * DOC: GuC Power Conservation (PC)
>    *
> @@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>   	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>   
>   static int wait_for_pc_state(struct xe_guc_pc *pc,
> -			     enum slpc_global_state state)
> +			     enum slpc_global_state state,
> +			     int timeout_ms)
>   {
> -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> +	int timeout_us = 1000 * timeout_ms;
>   	int slept, wait = 10;
>   
>   	xe_device_assert_mem_access(pc_to_xe(pc));
> @@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   	};
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	/* Blocking here to ensure the results are ready before reading them */
> @@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   	};
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>   	return freq;
>   }
>   
> +static u32 get_cur_freq(struct xe_gt *gt)
> +{
> +	u32 freq;
> +
> +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> +	return decode_freq(freq);
> +}
> +
>   /**
>    * xe_guc_pc_get_cur_freq - Get Current requested frequency
>    * @pc: The GuC PC
> @@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   		return -ETIMEDOUT;
>   	}
>   
> -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> -
> -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> -	*freq = decode_freq(*freq);
> +	*freq = get_cur_freq(gt);
>   
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
> @@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		goto out;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> -		xe_gt_err(gt, "GuC PC Start failed\n");
> -		ret = -EIO;
> -		goto out;
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS)) {
> +		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> +			   xe_gt_throttle_get_limit_reasons(gt));
> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
Shouldn't this be a define as well - SLPC_RESET_EXTENDED_TIMEOUT_MS or 
something?

More importantly, Is 1ms enough of an extra wait? If the GT freq is 
100MHz instead of 2GHz or some such then the expected max of 5ms could 
now be more like 100ms if not even longer (the slow down does not seem 
linear). As an example, the GuC load itself should be <10ms but with 
clamped frequencies we generally see over 500ms, sometimes over 1s.

> +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> +			/* Although GuC PC failed, do not block the usage of GPU */
> +			ret = 0;
I thought the new policy was that any subsystem failure should now be 
considered fatal and abort driver load? I recall a PXP start failure was 
recently upgrading to being fatal even though PXP is almost never used 
by any actual users. SLPC seems much more vital to the system than PXP!

John.

> +			goto out;
> +		}
>   	}
>   
>   	ret = pc_init_freqs(pc);

