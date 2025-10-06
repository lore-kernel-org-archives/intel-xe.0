Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C109CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 21:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB63410E697;
	Mon,  6 Oct 2025 21:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Enlltmt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B0D10E670
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759786423; x=1791322423;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8E1c0C4JjhVY+L511QyNSKS7x0AIzrFaiYOjRLP3JYo=;
 b=Enlltmt8KFioGOUmE7TQ+5y23Cw1ge3T4Odc1MGflqW14gcwA6QyjgEg
 XLJZCMXPf0biefyGIzRSUnfpmNehe41X4ClWy9550F79cXs5Jw9iUElk5
 IYJ4F5J9UGtu4FHGrcbUdgMVhMbs7wPstFvpOjBJj1Fvq+HZ5k1mN04YU
 obo1tV2XcAMTg2D17LfeSHmOS7wA4+6IWfJ70s5EPJuhTj707JGWPYk9m
 fTa2x1KrwaxfizoWOaea/8sMeAvYqywqfjbAsShbEqqxUBYyrZWzsEzQN
 ygpyVLAG3hdYWLsGELlmhOQCqVOix7suTiSZP3e23Nd6GFJ/zF3BykcCw Q==;
X-CSE-ConnectionGUID: 6moY+d3ASuWfYxZjE9TJKw==
X-CSE-MsgGUID: iTrmB2UDT+SB1UXM8JM6ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65817915"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="65817915"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:33:43 -0700
X-CSE-ConnectionGUID: Xgd70refQA2XL+YjD8xFCw==
X-CSE-MsgGUID: fkNQskAiRXOCgh07SYtDXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="217065664"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:33:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:33:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 14:33:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+1swz9H55LMP2zegz4CmaJV7NOBJ/hoQFTjAbLfE1WIDQUzrKwnBw4NAGZbyTESWYk2O8383tex/QKZpINjRtTASng3x7aw5KjZ7E7kdcdABFgX448QxvpQ8kKHAmlk1fafMZE9P0BsFvFQtqqPokVnTOyZRzxYiWBO2//LFjLokXeh9rjws+9QWJkG5s/Qfpldb9HVNYN8FhHbgqmqzhUXPcZCoA8PQ53N9ozstyOhd0gfUZ+qfDXFHE0cAAQJ+ZP1Xi2THn29hEs65S8bbsaWxhWDoStiAXcud1j5M0ceQSUu0IcpL6h3gW8ZGBtKdm55CwH0CLMiohGUgMdNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAs6ZZqb4aXxOKLDkj5b4TFEfEGEKX/YxEzLJN382SI=;
 b=nIzYlGj7N603B+vkxf2bbICEENgF/Nb8XFvHCqWc+5CL3UbSmbUq7RLHAPXd4HvxaHLfLH6IDjOo9Z8S2GRez1H6JcRL7VdRJ+WgZLCwuh5N4hKDG1fz18qOmKhSuojuUANCwrhCcv+l7V53l2exqODmMPTgAGnPZrIuE3EpKdJHUwQ2bjGa1D5eZMndB0yV/FaEwico5nRe8klIRZkcKTV/nwKUP2RNvkzfKNQ9q4j1KYfV5JkjLt7WDDEiOlABwakbSznB4jjr2O+UhpvEGuyWnkg2Pc0nr0prsL+7muMzcUOSIsbuMBLX69aR1jzwNkhQ9DAfG+JRpYuLpXtHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:33:34 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 21:33:34 +0000
Message-ID: <0b13339b-066f-4e0f-a2c3-63c2484d3508@intel.com>
Date: Mon, 6 Oct 2025 23:33:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/30] drm/xe: Move queue init before LRC creation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-24-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006111038.2234860-24-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0050.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::15) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS0PR11MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 19597e80-0b2d-45ec-2f09-08de052000d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkpsNWcwNG9ZTG43NlNMMzlXSWp0MkIxZ2J3ZWkzZG1KdWxhYlMwWjRxWWlz?=
 =?utf-8?B?Mkdwd3FhR3JBWnBIRnIwVU9DU2FhRlhxSnJ4Q3QyRTZBOHQ5ZzZlWDZIRzFw?=
 =?utf-8?B?ZWdaMUVWSWRIK2E1TENzTU9kNzI5MGhPenFZWWlhWnZpRGU1dE5kazR4QlFY?=
 =?utf-8?B?S3J0QTFlS2Y4S0R6a2xsOTVUSkg0M1dzNEVmRHF3SUIwbjBzU1FUU3hrRUNY?=
 =?utf-8?B?bk9SeWFCdVpMaHFOS0JQbDV0dWpnbUduOXI2RU9OVVVqYnhYdnJ1MStHekhh?=
 =?utf-8?B?WS9lUVlTVnNiSnU4cWdiVE53Vnp2VGVlb3g2bms2K0tOblM1WnpMZCtMTU1Z?=
 =?utf-8?B?b25veW80WUFOVEcrc1AzdlpkbWcvNkdaVVNBZ1ZTNVQxblVnWmNiNTliT0w3?=
 =?utf-8?B?Q0lDYk03TUlPQURFYzNmTExlYldXeXJMcENGZ2hMZ3kxeXF6eVJHOCtLbmFi?=
 =?utf-8?B?dUorOWVHMTNnc2tKT01pd1YzWVJrbTZycEE4M2lxTlpSamtML3VqalRlb2Qx?=
 =?utf-8?B?ckdyQU43dC9xVlFMWDg0OE5ndElmV0RiemJSYVh5VVFDRncyZDVkYUpyYnh0?=
 =?utf-8?B?Z1VRc2o5UmM1U0NUVURPVEhuTjZ2WHVXLy9kYitkeWlYUzNHMWpram9ZUUhG?=
 =?utf-8?B?TThsZTN0dC9lUFRSMnhnT09ZTUNrSHlMVnJPWnkzb3BjRTJKWjNxaWhmaFh2?=
 =?utf-8?B?dFZkdFdjMFRXMXN1d1FrZ2RjWDlpODB1TFFvamk5aU9UZUZzU0k0bjRzSFhZ?=
 =?utf-8?B?VGhiUE9ldTE5VlVyb0FjR0JYSkUxOXczT3k4RFdKVTlMZUV6L3VvcGdpSC92?=
 =?utf-8?B?TGIrU1lyOFovcXZPTXZMNXNUUGhmRFprdlRkL2lML25TQlZUVVhma0RINFRr?=
 =?utf-8?B?djRjMk5yNUl4UnQ4NHBDdy9GZGVsMTZDemxtVGNBUmlhMDZSUlhyQ2R6cTJM?=
 =?utf-8?B?MG4yMFBLNWtUTllYTTYrTnNER3VyVk1UWlZ4TDlHY3RPaVhmSmxlbzJSRENI?=
 =?utf-8?B?U2JXemZQRmlxdmJQVC9yNGJjOXoxbkdrQTdtVFJrR1JWU1NrcFQvcms1TXg2?=
 =?utf-8?B?RkF6T2xBSWFrVUhuNERGa3Q1eWtMbENvZTk0ZUtKMTZuZ1YydjJYN29LOVZh?=
 =?utf-8?B?ZDY4azYya2lKK203NkZwbFJtZ29jdkVpOEVzNlRHdHlHRUxGTG9OQmdxTVcw?=
 =?utf-8?B?Z3RudHZPczU0NzRndnUxQzVPZkxHUVZzVXlIeWs0Y1NjbzFySzh5T215Yzcy?=
 =?utf-8?B?T2I1UFRERDRRUGREa1dCY2RnR2crR2VzaG9PZXpXdWpvbm12aCtVSC9YdUNa?=
 =?utf-8?B?Mm9QY3h0K1VjWFF0SmFDK0NXYXRUS3o4K2JyalI5OFg4RmlYbzljS0VJc2gr?=
 =?utf-8?B?Uk5temwwcW5TUndCb3BQWWxxZFh6alRKSWZ3MXMrak1mVDVjQWRmNjM4U1pZ?=
 =?utf-8?B?M2EwbDM4Nk84Y2NkZlpuclBRRGFKRkZMVkxpU1M0dWFSbFhBaEFsVHI0WmxT?=
 =?utf-8?B?LzJReTVLc2hwektWd3IvSGNhYUtyOXBUMjVpZGszNkJlMmY3Sjgwa0Vvc01x?=
 =?utf-8?B?S3FUYStacVVtSHdtV21DWTB4NFcra3lrY3YwamNhdFhFVXJCR2RsL2FGSkF4?=
 =?utf-8?B?WkM2WWgwQUkrTThZR05nWDAxc2pZVXhUN1FFMGt2ZHRMQWFHYVh4OEVCbmJW?=
 =?utf-8?B?blMrck9FTlBhZ0YzS0x0VDB2MEU0c3FZbnN2RzNIeHRQd2dIUUZtUlNiNXpl?=
 =?utf-8?B?Zk9iL3dUTS9Ub2hQT0ZNVWlseERidVNCRG10QlB4Y2xJbmVEMG5sUFVNMEJo?=
 =?utf-8?B?TkNwdnpqcGxpS2kycVZhUGovNTFwSkZXc0JPMm80TTdYM28zMmYvK0FOd1Vz?=
 =?utf-8?B?VnpNM001ZUZMTm1jYjArNkxPaXVLUm1OWkFzaExqTkpwNmNGYVVTU1JjYnQx?=
 =?utf-8?Q?P+aZ3tSZ09vcmyaeG9CYDmqd3h3Azf7y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhIMC9ZK2JmNmdVSWE3cDcveWdyUDB6QUNiakh0bExqcG5pa0NVVi9VZzFQ?=
 =?utf-8?B?bEtCV0JYdDRWMjhlUzdXb283bENOenlzRy9LTnIyMXhMdGxqby9JcW14Um1W?=
 =?utf-8?B?TThSVkZvMmVXR2kxV2pLOStpdldQL2NtR1JnS2x2VzNtcnZHSE9jRk9XUTha?=
 =?utf-8?B?MWFXa05UMUgzb3pURWMyWkNKMGxnVUR3Y0QxamxPN1FPaDVoWitzZE9BNXpG?=
 =?utf-8?B?dTcwcnd3M3gwQkh2bUlubTdwU1FYUlV3OE5TSXpOUUZ3L21NdFVXODhoZnZo?=
 =?utf-8?B?Q1FrS1JsdjlKV1hDUzBQVzZIY09kSzNQNllCdmJxQzU4TGpycVZ6TExiNmxi?=
 =?utf-8?B?YmZGbC8xc2EwNzdnSHM2T21MVmdVSWdVazczV1lNLzR5eDFFWTIyN1pRUzFR?=
 =?utf-8?B?SFNvZXVoTUVZdW1CY3NCQW5DUGp0WXlqUEE0dzJsUmVGUGN5NTFNSEZjUmU3?=
 =?utf-8?B?bVlsendPSVQwOW0rYUVCOW9BUGRIeFNNWUEzVi83TmZtaU5kWWxUTjQwbHNi?=
 =?utf-8?B?R1VhTncyQk9pOGZPU0tqYmFVdm5FVzJRVy9aOHRadlZtZTIxTTZPZ1d6QVBo?=
 =?utf-8?B?Q283K3g5WUFUTStHKzZ0T3dVbTFUTWRWWEVMU1pvUVJBb1oybTJzeXVtVmVr?=
 =?utf-8?B?V3NpMkxqQ2RsMW9XTU03VWtEQmxXOEVySWhjWGtFRGhFOWVUZ3RQR3BaWEt4?=
 =?utf-8?B?MUtZWWplTURoSWVaa3NtaGIxMU5ndy9TYWRxL2ZlOUI0VE1ta2ltbHBabXl6?=
 =?utf-8?B?dDYrTnB6RktnZ29QK3NjRjZHYmF2VnhPcHlCdU1tTzFnZmNPY21laXV0YkZ6?=
 =?utf-8?B?dlMwd0lYdVUyQTFkRmtzRGVvR2s0S1RUNFNxNlhHYUNDWjVsRFVOclovdTY1?=
 =?utf-8?B?bzlhNVRibnJ5eUxISVF4YjM2WDVMY25SUU4reU5pUTY4VkNjSEloQU9iSnl5?=
 =?utf-8?B?dmlNeElaQU5reVRXbmQzNUgvTjk5bmRpcGt3MEZMTVdQRnRwU1V1Wmx4dEZ3?=
 =?utf-8?B?Vzl5QnBQa2dmSnZrb1E1WkZNUjRKTkhycjhXOGlZVlVTS25KNWpvdGs3dWN3?=
 =?utf-8?B?Q0ZzK0pPL0Vob1dKdVZINHRxRUhKVnhxQklxY3BKdlNwTitGMGd0cy81VkhG?=
 =?utf-8?B?bG82MlJWREF0b1NJNDVMMHpsYjZGOHp6azErcG94UVQvV0R4NnEyMXBXeGFr?=
 =?utf-8?B?blMzdnFVbjBnVHFaZHpEV3ZQZ2F4Tm9yZEpvejJqWHI2Qnhib0h5NFJURDFN?=
 =?utf-8?B?djMrVjRNUUpKS2E5SkxGUGV2UytwdzN0YmFSZDUvWklwcFdwbHoyc01lMEkv?=
 =?utf-8?B?UTFSR0VVTGRSQXRidHhTbDRGWVgzTkdUOG00MkYwTk1IM1Q2VERRZklCZjd5?=
 =?utf-8?B?aFBIeGNBOFdvRThieHk4d3FDeGozOVBTZjlQRGE4aHlEMjY4Q1ZRTDFXd05Z?=
 =?utf-8?B?N2ovZTFuRjhnaDdJNkxWS1lpdHFXank0Unp1VktDaVZHcEg5NEc0Lzk4enZO?=
 =?utf-8?B?RG5SZDl2M1FzUDJBbGUxOGV4Q3BhZjhvWUhjUnlhVmJUZnFhNVIzbi94SHJP?=
 =?utf-8?B?RFg4elR2MEdwRmo4UkpZbkEvemp1THM2bi9FZjhMOGNtN2xtdVFVZFZPa1NO?=
 =?utf-8?B?MW1RU0ZQR3hPQTBoZVQzT0tYQWw5c2QrNjUvN1FtVWVVQ3EvdzNxM0J1b3hD?=
 =?utf-8?B?dlhGNURSN1MyN05mTmxEK3Zac2p3RGFGc3Q2d2lvQzFGcXB2b05WTG1PYnZx?=
 =?utf-8?B?Y1pZTlpPY0QwMVc5ektuNEllZktZYWlSM1U4YTB6d1VNTHA1ZzNUSWs5Z0NC?=
 =?utf-8?B?NHo3YTN0RzFXNDhFbmloQk5LVU1kbFBzMkozSnhtRnBNS3NhdWpSblRYWVBH?=
 =?utf-8?B?Z1k0bTBGQmt3dnRLcUFzREhGdzVLSFlmL2M3amRvMHpFMU14VG1HVjJsN0ZH?=
 =?utf-8?B?aW5qUElVZ2FFSi8yK3J5R2NsNFdvbGpoak5DUzhLc3JCUGFIa25TcXNVQTVY?=
 =?utf-8?B?Uzdmem9tUHliWisxUnAwanRPUzRzcDRuTHZ1RkYzTTlPeVNOMko5Z0hLMUVr?=
 =?utf-8?B?dU0rNUVoY1ZlVzJyOU1TQU9sKzkxMDlka0RGelBnMm5GZzcrd1dDRG03T2Jh?=
 =?utf-8?Q?hGEL7KWnXOh1bEdrU+KX5uKL1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19597e80-0b2d-45ec-2f09-08de052000d1
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:33:34.5828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxky08tQRAv8yTlxEwSVL/Bz9QJMB5PZOB36yqBJA/a9iTUGucj+9MACT+JG+kHXIE5Qm3V3fmAIJ6Xc8oK6DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
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


On 10/6/2025 1:10 PM, Matthew Brost wrote:
> A queue must be in the submission backend's tracking state before the
> LRC is created to avoid a race condition where the LRC's GGTT addresses
> are not properly fixed up during VF post-migration recovery.
>
> Move the queue initialization—which adds the queue to the submission
> backend's tracking state—before LRC creation.
>
> v2:
>   - Wait on VF GGTT fixes before creating LRC (testing)
> v5:
>   - Adjust comment in code (Tomasz)
>   - Reduce race window
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c        | 45 ++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
>   drivers/gpu/drm/xe/xe_lrc.h               | 10 +++++
>   7 files changed, 92 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7621089a47fe..90cbc95f8e2e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>   #include "xe_dep_scheduler.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_hw_engine_class_sysfs.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
> @@ -205,17 +206,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>   		flags |= XE_LRC_CREATE_USER_CTX;
>   
> +	err = q->ops->init(q);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * This must occur after q->ops->init to avoid race conditions during VF
> +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> +	 * depend on the queue being present in the backend tracking structure.
> +	 *
> +	 * In addition to above, we must wait on inflight GGTT changes to avoid
> +	 * writing out stale values here. Such wait provides a solid solution
> +	 * (without a race) only if the function can detect migration instantly
> +	 * from the moment vCPU resumes execution.
> +	 */
>   	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> -		if (IS_ERR(q->lrc[i])) {
> -			err = PTR_ERR(q->lrc[i]);
> +		struct xe_lrc *lrc;
> +
> +		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> +				    q->msix_vec, flags);
> +		if (IS_ERR(lrc)) {
> +			err = PTR_ERR(lrc);
>   			goto err_lrc;
>   		}
> -	}
>   
> -	err = q->ops->init(q);
> -	if (err)
> -		goto err_lrc;
> +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> +		WRITE_ONCE(q->lrc[i], lrc);
> +	}
>   
>   	return 0;
>   
> @@ -1121,9 +1139,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>   	int err = 0;
>   
>   	for (i = 0; i < q->width; ++i) {
> -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> +		struct xe_lrc *lrc;
> +
> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> +		lrc = READ_ONCE(q->lrc[i]);
> +		if (!lrc)
> +			continue;
> +
> +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> +		xe_lrc_update_hwctx_regs_with_address(lrc);
> +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>   		if (err)
>   			break;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f83d421ac9d3..769d05517f93 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	const struct drm_sched_init_args args = {
>   		.ops = &drm_sched_ops,
>   		.num_rqs = 1,
> -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>   		.hang_limit = XE_SCHED_HANG_LIMIT,
>   		.timeout = XE_SCHED_JOB_TIMEOUT,
>   		.name = q->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8074ffb924ce..bf1806e90370 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -487,6 +487,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>   				 shift, config->ggtt_base);
>   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>   	}
> +
> +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +	smp_wmb();	/* Ensure above write visible before wake */
> +	wake_up_all(&gt->sriov.vf.migration.wq);
> +
>   out:
>   	if (recovery)
>   		mutex_unlock(&ggtt->lock);
> @@ -745,7 +750,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   	    !gt->sriov.vf.migration.recovery_teardown) {
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		smp_wmb();	/* Ensure above write visable before wake */
> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		smp_wmb();	/* Ensure above writes visable before wake */
>   
>   		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>   
> @@ -1264,6 +1270,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   	gt->sriov.vf.migration.scratch = buf;
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
>   
>   	return 0;
>   }
> @@ -1312,3 +1319,33 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>   
>   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>   }
> +
> +static bool vf_valid_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * @gt: the &xe_gt
> + */
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
> +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> +					       vf_valid_ggtt(gt),
> +					       HZ * 5);
> +	XE_WARN_ON(!ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 8c9679414565..63102029d624 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>   
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index c1bd6fdd9ab1..f0bc45a782a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/rwsem.h>
>   #include <linux/types.h>
> +#include <linux/wait.h>
>   #include <linux/workqueue.h>
>   #include "xe_uc_fw_types.h"
>   
> @@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
>   	struct work_struct worker;
>   	/** @lock: Protects recovery_queued, teardown */
>   	spinlock_t lock;
> +	/** @wq: wait queue for migration fixes */
> +	wait_queue_head_t wq;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
>   	/** @recovery_teardown: VF post migration recovery is being torn down */
> @@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
>   	bool recovery_inprogress;
> +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> +	bool ggtt_need_fixes;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9dbdb0b54c8b..48d5133e76a6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1663,7 +1663,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			    q->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 21a3daab0154..c4a33b135101 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -76,6 +76,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>   	kref_put(&lrc->refcount, xe_lrc_destroy);
>   }
>   
> +/**
> + * xe_lrc_ring_size() - Xe LRC ring size
> + *
> + * Return: Size of LRC size

I remember commenting this before..

"Size of LRC ring buffer"

-Tomasz

> + */
> +static inline size_t xe_lrc_ring_size(void)
> +{
> +	return SZ_16K;
> +}
> +
>   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>   u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>   u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
