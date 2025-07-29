Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761B5C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 19:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B9B10E02F;
	Tue, 29 Jul 2025 19:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVrlHL2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A4A10E02F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753816822; x=1785352822;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rLtwrwpjk82hpD23hIaa+mJj1wq9MADnHqXAPOG58bY=;
 b=IVrlHL2U6t71h6wbbohj2RQQAdJYtdEP9tCZbOQTP37ufYHaaUz62d+7
 gmo0DS32v2pleQhUmqcVouXHiqTgldylYCMDJMa3wcFtyvm+mLewvlqIS
 gEvyC4JWJaqyNGWMFiixnSN9K1qkAlWcRcu3xz/CkIjLYjXUdVoyBCH0A
 2U5tetYthU5juIhoy4sUKet/lq6EE9D/Gx77H1H1/Tl6lfrTDDTceDZ1y
 YjpZMCvoSpnHfDfvS8hX31s+WY9xRwCciUjImGRcGLa4F1h0vXwDXk6zr
 j85e995g8G/RFgEC8D8Lvj8kCHiehirlMjp7VTmSJbKUAprIC664c+Qw5 w==;
X-CSE-ConnectionGUID: 8vbw8ChvTByixje+trvZ1Q==
X-CSE-MsgGUID: zspaVohzTpyzyIgvxeT+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56074375"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56074375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 12:20:21 -0700
X-CSE-ConnectionGUID: FmoFgpgDSyOZcmcf2SvABw==
X-CSE-MsgGUID: Dsi4RdarQkuGfGx/JRKIBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162050997"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 12:20:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 12:20:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 12:20:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 12:20:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ar+R/ITrEXxWU8BRp+vbCrS8/i51Ww1rHGULTL0Bw0Xuq8H3RLmiDOBG52lB7BA0oTZcv1zceXuffGr9uTocmZzdhlK5vbHB0fOhelXuGvyih9CcDsMj0ttNtafUpowiSRk7BeSyF2z/hJR+cFmZcMvHA8pP6LJ9mYKB7MQsPsyjbKblZomZ8qlWmv/rvin9z1x9Db6bLRJ2JcY5c0UEnBj1N0PKdDu0aSBl9Y4XEBm/dy4kh1kugMegpTxGCLiJ5GYB4O03dfCYM+TJev0ehI/hKVMAg6bWAElCRDvFaK8xdY1RK5mT/7SMlWWdVggLr1T4IrWabW0zkB0vETCqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzglN5+SxXdE0LXP9jjfvR/cORoWLhRPY8vXUsTk8nw=;
 b=Jy3wMnIj75uJvriy+/lWXuspz5BgMEPV/4oolcSOP0bNAKJU69YQgXEwQGOg/CJr9v4SQwVommoFFJ26Mw/siGureSCHA5t5DzkEf96YPbd6kNVkMd73WlCYAaMR0+MJizE4KxHkJZxPw1R1YsquahEOrzsCZjbMcVcYUUWMqn+YT4iDt9WI5R9clNxzJOTJoCQ2iTjYXPbsm8eCm1LcRRlBuqHPzd3DC1jc+vYhAfqColhw5MtLZ6RazCPc9C428xE9V/wHPf2LQws5OmhuBjDsv6b3ri2+UyEGujoWPxkkUmUrLu35WkKB76gDfdhAFMf4Mju4Xx2OZ11H5yA3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Tue, 29 Jul
 2025 19:19:43 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 19:19:43 +0000
Message-ID: <242399d9-5945-4230-b897-b7ff32c0f72e@intel.com>
Date: Tue, 29 Jul 2025 12:19:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-4-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250722013553.1266218-4-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: fadc4683-20cd-4c93-a95b-08ddced4df24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWJtcW0xWkVGWERBYUFCQlVOWjN2VlVIeVhyb3dWSTdVSlNZZEVUUTE0a1dT?=
 =?utf-8?B?VEtoWmxsRjBhYlZSOG1kclI5SVlaTGtiaVhiVHV5MVJzL1Jtc3FmOXBkTXkx?=
 =?utf-8?B?WlBFRWpFdkJseXFHdVRINmh4bHBkTG41cHlYZXp1NlYzeVBnMmY2R0hscExn?=
 =?utf-8?B?Q0xDbFVCZG1Bd3VJZERpVnBDM0lOcllXVU1ZczhYcEVTWUVoa09Sd1RucW9o?=
 =?utf-8?B?MmpuMExKYjhwbk5ycjZOZUFWMmgxL0lQaENvY2I4TDI0dlBWUmhEV1NvWjZC?=
 =?utf-8?B?NDhoZGt1TTBqeVBKanFaN3hQRG5ITnFYWWE5akhGWVdwT2dLRmYyQUhyMEQr?=
 =?utf-8?B?aThmZi9CNWIwNCtaaElORDBYbzFEaDhOdUlOZmxjeWE5MGxsWE4zTE9OK1Zs?=
 =?utf-8?B?cnRrVHFHa2lhYnBkMTVMcUdJMG9mbHJlQ21wYjFaSXBJdG92YWZRZkxGdjd0?=
 =?utf-8?B?WStveDlwbExlV2NDQkpJb3NOT3p6NG1LSlRoMDlvbEd6ZHVKUkl5b3QxamRI?=
 =?utf-8?B?SmN2a1NFeDdsdXJnYTJaY0xCZ2pwVjg4MXdRWVk1NkJMMzJLb1NsNUtxQWd3?=
 =?utf-8?B?UTdONUVhMHFML0w1QlhXckNmV09HS3NZbTJ1TnBsTy9iQlRkSHVCTU9LeDFB?=
 =?utf-8?B?WUZzWkw5QkN6aGVUcjJSVmZjRFEzWmxnUkhjR2pMUjVNNXRYS05XVzJTYm1M?=
 =?utf-8?B?aGtSYzJLbWRHZ0FiNnJGSHRUUStsU3NxalYxY283RDc1OGpOOXlyaTRiNTlz?=
 =?utf-8?B?dlFYdUJ4WW00T0xPckZRcEZFenlOY3VCR3NKdERpbTY5blZsS1B2c2hWb0JQ?=
 =?utf-8?B?YkMyeEVmbzRMMmRKOEZsOGZXNGYzN0trUzdvZnhUa0ErZzh6cW5pN1RBQ240?=
 =?utf-8?B?MnpuUVA5OUd5cTZBTHFyT3RPOUZ1dEVNMXYrMlFxS3dwTWhBSTAyL1RYcTNT?=
 =?utf-8?B?K1E3R3lMbFdWUDBlQjVJNlB4Q2xianpOTVhNM002cEVaMTNTdFYxR2pLQ2sv?=
 =?utf-8?B?RitPZ3haTzZDUWRMa0UweDJmU2N5ZzMzb2VPaFcxY1RWZ252VlJpeHVoYTRv?=
 =?utf-8?B?YXJVZDVHVU1SUDV3Vi9iUUw4WW01R3JTSHJ0bStubk8zVXFOQm1iSlcxKzBj?=
 =?utf-8?B?NU03Z3NrNDZBcGJjZFFlR0RrOWZEVUsySlpReUxqTEtQRVRrNkNlbEwraFlr?=
 =?utf-8?B?TmNDakVlNHowQ0VOVlkvQTk5N0dKWnVyemtuVHk2Q3ZIMCtLeWRkOG93MXo2?=
 =?utf-8?B?Q21KM3MwcHFMeklaN2x6QXNRWTY2QmdwVmwrUlhDVng4ZFB1TXZkdm9PYjJ2?=
 =?utf-8?B?Q2trTU8xZ2JLOHpoVWxBVVlYdFBya2FlOEt3M0wyekRhcHB1d1VES2xJNjlL?=
 =?utf-8?B?K3l4Ulh4cnUySWRrSVp6d0Nla1piYTd1Y2tzVVlUeDZINWRibm5mV3NoQmNk?=
 =?utf-8?B?MkphcjBXclA5VUo0TWlZLzlIcElPTzhkc21GanVoR0UzMTJoTXBtWXYrOGVq?=
 =?utf-8?B?U0llaTlzSlpBSzJCME5IL3dSdUEyNFJ6RVdFa2V0NlBLVHZBSW9mU3cwNVZC?=
 =?utf-8?B?VmhuWW9sWVZhWjdjVEtNbVVpUU1DcVdMaVBWV2d2eE5wbitGMUphdFprWEsz?=
 =?utf-8?B?dWxHY1l3TTd3SUF6UzUyeU05dHNleGMyMGJueHJwemtxM21pV0pyVHdTU1I5?=
 =?utf-8?B?eWg2NWhsbkI5Y2thbWlGVS9ObkExdnJXekRYUkE0Wnlxa2d5b010cFE1UGxX?=
 =?utf-8?B?TWNwSEVuN1N3U0wvWEFQKzQxYWI0UEFTZ29yWGJiQzZLeUh6RHVmSTU3dWht?=
 =?utf-8?B?NndickxCTkJQeGlhV3JGOXF4bHYyRjdYZHdMVDRreVQwbHE3aVpSd0xCdU9a?=
 =?utf-8?B?NjRITkRrN2UzMm9oZUEyMEpoNlh1RUJtK2MxYklFdGFhRUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRXWndyWTdKbFA5eDRiOGkzWTBQMWo0Z3orbDZBOFkxbVk1SUJhbDdHenc2?=
 =?utf-8?B?RnI5NEpYUVV4S1NhR0UyQk1abUZ1cFZwdHhvcXNDVjZJWjBTNVR6OWM3VzFr?=
 =?utf-8?B?QVRjK1cvZ2JRalZmYVFYVnlMVGV2T3JMTXF4UTl2NzJYMW1zZmRPSlZEekhi?=
 =?utf-8?B?ZkhhOTJ4VDhQaCtsREg1RG9mRTc2OWxFR0NYTFBkbklEN0syMGY5RDZoMVpt?=
 =?utf-8?B?TG82aFBFcGY2K2pxVUJvc25xRTZ0T2N6dnNvSHBXRklLYVJyQW5tVVd6Tmh0?=
 =?utf-8?B?cnJyVG14SEYrQjV2VmJNckVJSy83RWNoQkROeGpGNU5CTzdLdzN3MEVBQnVH?=
 =?utf-8?B?TmQ1NFlKVS8wbnNVUVJvQ2tMNGZRL2x2aVYvUFMyci9tdmdIKzdCRTA5VXQ3?=
 =?utf-8?B?dFlSWkZaK3hvT2dPQmR6U0tWNGdWdll5ME1yZlhubzlrb050NlV6YzZ3NW5V?=
 =?utf-8?B?cGg5dzJjUmFaN1V0R2tXY0ExZmtESy9jUUk5QVVjcDdhSnRSeUVhWFhPakxT?=
 =?utf-8?B?RHhiYnhEVHJ6eVVpM2UzOThkV2JnYkJwYzFuWnlDdDl4azVNNWlrV3h2bDdT?=
 =?utf-8?B?OVdxNmtrR1crUGs3dkRnSlFmMFJSQVpDR3FDMlZZa0lBWDdZQXg2V2tjUk9D?=
 =?utf-8?B?NExQNzlkaTdvd2tXak1TQjc3K0ZXdVRSQ2wvb05VKzBxWTMzWlRXUllEWlhk?=
 =?utf-8?B?WkI2c0xzUGlrV1R0NFA1cDhPRnFrVFdvZElRS25KU25obHYzSWwwSjZwOUNy?=
 =?utf-8?B?MUh6V09oM0VGVm1XYzQvbXA5YWZrdEhKTjA1b3R2VzVtR0JCZkhFZTJmMVNT?=
 =?utf-8?B?bnRPME9MRFNBUWFoRnJBS29ZdW4vZXNKYUJSMnpvclZvczFpNjZJdExPaHdz?=
 =?utf-8?B?ZVI3aGVGUHVrMHR3ZzQ4Y1RSM2RST214Q0NtdkZwWFFmaytIcG8rMTFVS1Z6?=
 =?utf-8?B?L2dXQS8vZmFtRnVnbmJ4eklnZS9VUWtOb0FrVlhMNWNQV2l2eXVkT0dTYUtL?=
 =?utf-8?B?N25COU9hMWc5T09LWVVVYkVLYXJ5QWpjQ2lxT1psMzRGTGtQZTh5Y0pqNVRv?=
 =?utf-8?B?TkxsZWNwWG5zdklmc1NCaHQwUzJaUW9aV3JFeDZmMmN5ZGhsYVlNUm5abTgx?=
 =?utf-8?B?OEJkelN6NEZpRWdmbUFmdElORTVXQzZQNWhLRExXUTVwWXBkcTFwU29sMDdp?=
 =?utf-8?B?bnEvK3MzUVg4d2ZjVGFSWXU4RzFETmRjSmpHNUJ1ZTdTTWtYNHdIQmV0V0N5?=
 =?utf-8?B?YjR1WU9ZWG1vbVZWMVFSM29iVGNNN0tKWURlekRHWFNVRW0zQm9BRTNDcmxZ?=
 =?utf-8?B?d3doaFhPdmQ2ZDJpenIzRUNKYVpRY0tCTnFVU0ZqRWFvRmRtbUdyVjNXa2d4?=
 =?utf-8?B?SGdhWlQ0TVdYd2g5OWNBNmFwT0UzZmsxK25sc0IzQ0wyZWQwMnVRaHAzOWtI?=
 =?utf-8?B?V0Noemo4eFF6K1F4VTFxR3BObEgyb1M2Sy9JbjFZWG84VlNHQldOTSttbFA1?=
 =?utf-8?B?REdtZXFDT0gxWm9LRVA3OHVtU0FUM29HaU1DM2wxSGxTc0lORkhMYTZJcWl0?=
 =?utf-8?B?M3JqWHIzZExkUFAwZ2hxZm9sR0RzY0Y3ZHJ5UFE0K0VWWXpMb1FZRzhoSW9P?=
 =?utf-8?B?YXZLVjNCdDhHRzZ5UmNpTVZETW95SzJNM2toSjlkWlcvQ0pueUFKQkNrKzM2?=
 =?utf-8?B?Nkt3dlhKOWJmWC9rakVWMHVqTEh3VjgwMFQrV09zMk4wRzNpMFE4Tzc0ZUQz?=
 =?utf-8?B?ZzFYenVla2dlbEE3MHFGelpFMXNWbzA5UWpMc1U0dmNKRzZBZ3pVOEdzZ25G?=
 =?utf-8?B?cTUraGFlLytXNk9KcTRiQ2FQYTBpM2ptamIwTVl1dEFxYlhtVkROVldyQlIr?=
 =?utf-8?B?ZE1IK2FxZXpObmE0R3JQTXMvYWNiVUhrT2ZEaDV4TUpWSUVPYmdydTdxZ1R2?=
 =?utf-8?B?alphQWNDTTBDR01NcDRjSUsvaGZKWWZYMmZwTUZHSzhNZkRFbEFnOGNSMkRy?=
 =?utf-8?B?dldvenNRRWFldWlWTk8wRExsalFLeTdDd2hiR2p1akcwK21TUzN6RzNyR1Bu?=
 =?utf-8?B?TFoxdDNwcFN0ZzNjS0xDMGNNekpFRUxUak9EQjV6U3RoYWNhY1Q0Qy9VT0xq?=
 =?utf-8?B?YVArVTJCVi9jdUVUTTc2d3lvMnAvWUdJUFhuZUdUem0wV3ZPb3lHc25mN1Ux?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fadc4683-20cd-4c93-a95b-08ddced4df24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 19:19:42.9756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMzSNFU0VHsBdbHIHBXPgNTyx/8f23fYP/oYJDP17XTU2Erz+GBMYwwxPgc43hd5r/STQJEWS0LCimLnu8MHHeJHBW1ImfL3MULDo0q9p2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
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

On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
> Add new debugfs entry "guc_log_lfd", prepared for output guc log
> in LFD(Log Format Descriptors) format.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 +++++++
>   drivers/gpu/drm/xe/xe_guc_log.c     | 32 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>   3 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 0b102ab46c4d..6cbc4240a3bd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -85,6 +85,12 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static int guc_log_lfd(struct xe_guc *guc, struct drm_printer *p)
> +{
> +	xe_guc_log_print_lfd(&guc->log, p);
> +	return 0;
> +}
> +
>   static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
>   {
>   	xe_guc_log_print_dmesg(&guc->log);
> @@ -121,6 +127,7 @@ static const struct drm_info_list slpc_debugfs_list[] = {
>   /* everything else should be added here */
>   static const struct drm_info_list pf_only_debugfs_list[] = {
>   	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
> +	{ "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
>   	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..d2256773aaf3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -9,6 +9,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "abi/guc_lfd_abi.h"
>   #include "regs/xe_guc_regs.h"
>   #include "xe_bo.h"
>   #include "xe_devcoredump.h"
> @@ -19,6 +20,12 @@
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   
> +static const struct guc_lfd_file_header default_guc_lfd_file_header = {
> +	.magic = GUC_LFD_DRIVER_KEY_STREAMING,
> +	.version.dw0 = FIELD_PREP_CONST(GUC_LFD_VERSION_MINOR, GUC_LFD_FORMAT_VERSION_MINOR) |
> +		       FIELD_PREP_CONST(GUC_LFD_VERSION_MAJOR, GUC_LFD_FORMAT_VERSION_MAJOR)
> +};
For the sake of two words, I'm not seeing that it is worth having this 
as a static global structure. You are going to need to either copy it to 
a local structure that you then fill in the 'lfd_stream' field of or 
only output the first part of the structure. Either option is messy.

> +
>   static struct xe_guc *
>   log_to_guc(struct xe_guc_log *log)
>   {
> @@ -216,6 +223,17 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>   	}
>   }
>   
> +static void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> +{
> +	if (!snapshot || !snapshot->size)
> +		return;
> +
> +	/* Output LFD file header */
> +	xe_print_blob_ascii85(p, "[LOG].data", 0, &default_guc_lfd_file_header, 0,
> +			      offsetof(struct guc_lfd_file_header, lfd_stream));
This is not an LFD format output. And a quick glance I am not seeing it 
being replaced in any of the later patches.

Also, all you are generating at this point is a header with no actual 
LFD blocks. That would not be a valid LFD stream. You should move this 
patch to much later in the series (if not the end) so you only start 
generating a file when it is a valid file.

> +}
> +
>   /**
>    * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>    * @log: GuC log structure
> @@ -251,6 +269,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>   	xe_guc_log_snapshot_free(snapshot);
>   }
>   
> +/**
> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
Is this a cut/paste comment from somewhere else?

John.

> + * @log: GuC log structure
> + * @p: the printer object to output to
> + */
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
> +{
> +	struct xe_guc_log_snapshot *snapshot;
> +
> +	snapshot = xe_guc_log_snapshot_capture(log, false);
> +	xe_guc_log_snapshot_print_lfd(snapshot, p);
> +	xe_guc_log_snapshot_free(snapshot);
> +}
> +
>   int xe_guc_log_init(struct xe_guc_log *log)
>   {
>   	struct xe_device *xe = log_to_xe(log);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index f1e2b0be90a9..0f6299886010 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -40,6 +40,7 @@ struct xe_device;
>   
>   int xe_guc_log_init(struct xe_guc_log *log);
>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>   void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);

