Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8392606A331
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NI5UMxZp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mcdHuiOR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4A110E826;
	Fri, 13 Nov 2026 20:09:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D14D10E826
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794600569; x=1826136569;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ic5VoUGQXGRMf7KTSI90O2q8TfRAsdx/qZKTQfnAYkw=;
 b=NI5UMxZpIWOnMqZJUXPwJV8dbKg+Mwj/6eS8CvuChEXSqVGMl4ca5Y8g
 J9+FRJXRCIRHtn7qvxvrq8kC4OnLWhm1xqMFMHE+tk01uarzsD6aRHdhS
 tXLb9ktPFvrIEfEGw7Vr/+iYvWoHCmIRKIRhdjz1PypSq2v9HtZOd2Tph
 hsnJuKICqAT2I3mE2ypz04GjECCREsEExs4QzsENL0mPry76k2r9Q3KUT
 MNjNWglc4Gr+3N05tv4oJjFF3fD3Ee/MUJqqfmKKPP4pg3v/6Nrm7uKMv
 jHY7A1N5gTsGiN1T8uNL+YQm+Js1vToworWPmR8uqLq4VOPL9bvftKwvw Q==;
X-CSE-ConnectionGUID: FyFioNKsScy5q1831v7v8Q==
X-CSE-MsgGUID: B+BdB2heSBOh+R76I7q7/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3450747"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3450747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 12:09:28 -0800
X-CSE-ConnectionGUID: LqlTrlm9SXqD0qRpXjQqHA==
X-CSE-MsgGUID: 2ECtFtnmSQaKPTYkAxXwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9177556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 12:09:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 12:09:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 12:09:27 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 12:09:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3KdhoXdRX+vn6JfuMit671NTaxAZ8fAEjbP4ubQWTwmmZlQrQpa1XKq7C6O2jZ39JWD9ZvNDhTgX6+SuRTL5KDOXeDrgF1qdRb4ck8unbrhSv+rQ4RsNKVwZ4TalojtSfRyxNYpwH3PAtVnkG6NGQ5gccveMDJrTbKvPc9YtnuM/bcTBBOn4mYpf+T0MNE1UEJyO/VedQqx43jWqwAwnv+nJoql0NKRMxEZ6FIJc6ppyUEN+z2F3zt9RAdHvpOIsuz01hGLAjikH9ZFOnxnqCdY19meLq11PIeAxxkCYU7utCSli8X0EdgidBGBzb1dlT0j/z++nyb42EtrSgikQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VCd+yR/Cb8v7vtZZJbwR0z8hB8Cm2reze8ePojp7rY=;
 b=sAT81LAljWF7jIOx5EjY4OYOat2B1YxzPQXFIyybyEnjPtmf5oszXyTd6Bl0f4/53W3PlYHccgGuVK3HfXMsTHKTFtfY0WQGPz1eH3YS4kzT72BKt7KL3xDx/CPq+ecXKuPJH3B9GqC8rM8QgzjZCaVW3jgND02IyAmgRD6igyP/BMAQxWkEfk2M5QgbyfglM8/c2UlHDesUDKPV+7GYLqGmMj11HnLmhwbdA59o7rdff2OCnts1laKa3C28xRL0/v0rQUo+w8X2NzVXlXOHAP5i+MSujOO9BVCuVf2iEv7I/izk/intgWCHpisJovqZPnNY13p5ZGLg9nEc2ISoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VCd+yR/Cb8v7vtZZJbwR0z8hB8Cm2reze8ePojp7rY=;
 b=mcdHuiORjrMemttoGNxTqG6tEnm/bYPGDt2yQGs4e1wGZBoPbO8hek811NVDTrOt2OUFZeFR4hKoSS4n7tMwAR8EQRpUaqWf3ljmJjE7DpA4XTjGNRwE55tFulFpDoxlqg77AEhn1dPWmsyVn6UcIqQliFMxPk4ZqCA+1P4hGvE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by LV2PR11MB940045.namprd11.prod.outlook.com
 (2603:10b6:408:3b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 19:17:51 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:17:51 +0000
Message-ID: <c0029489-3522-4d0f-8516-305fb48cdd05@intel.com>
Date: Fri, 13 Nov 2026 11:17:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add sysfs to disable RPe
To: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
 <8dfa8e4b-89af-4955-afb7-79cc01529445@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <8dfa8e4b-89af-4955-afb7-79cc01529445@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:303:8f::35) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|LV2PR11MB940045:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c832fe6-5f10-4877-dc1a-08df41bacfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|261021123027099003|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021121427099003|261009223027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: TFWmEuvRla4c25tXCzvNbGI3sZop6bQubalbHG5FUfVTHTYDvw4Ag/C4HJAI0DoEBZrmtG2LPA2jrGptWAIuMOPivhGvXL/gYSofo45ypnukuYJGbMlsE+OLcZQiviWNuHYoRdeIRPsgobHJFryuGc1PkhlFzp8Pi1w7Mg2PSRVm9Lb9FHzCR3HYxzkTaWwFK3jInbRxmeafKoWNoq+kZH1je2jV+Gi+S7GEBybgJ2C4aKB9ox4hkchX8RfVzI1FJCZL10rE5hbvcKxSagF5rwtOBwqtwzSij5CPij1I+TOuJjDTuXVMqFlHn0YK48MO1ig6DKpr59FgMsICLz0JePUPf2BlkaefKhbhxRE6iniwFippMKAHWTW2A7SYhCqQqpb03T79qOltJe5lCzQca4VsfuXpqIAQiHPnj1PdEnehuCVPSNdoSHfmaa3X4lSuSJob/370nUw0HBazIkES7Grh0hfLlbyh4YKXDayxwYOAVqZrF+BZRHL8Ux8cGIJ8/dYqlAL6wFiJBLXshCJ9ITclSOv3tV1ovT4h8d4S0F6EivLkbZvJLoPe4pQfZ/nzPBM6QanmakAPMff4rk+uOqMKf0+mS2DNwsyWVWqmtm0RDTTc1bDSnlQdFfsof/brumDgEpWOPOE/rhkRYiKQv3HMA/r0eXxjzS8ygKEQzCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB183078.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026121527099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dndXNU5qT2xPK1l1b3prM0t5UnY4YjB0MEJleFZaTEpoOXpXVDdOb0c0Skd6?=
 =?utf-8?B?eXYyM1J5WU0vSUxHeDYvUmRRUVdvMHBRL1AweWV6TmZEaU43TEF2YVFMcVBM?=
 =?utf-8?B?Qnh2MG9oTE84ZCsrN2tvcHdod2cxSG5BTlh4M016eWVuQ1d1WDc3YnRieWs2?=
 =?utf-8?B?dGZiTXpuOVkyYytITHZMZ3J6bTlmbzlBUWVRcDhXZXg4SlViN3dsVW9rTkZy?=
 =?utf-8?B?R1p3WmlwODVZWTdIdmJYWHJDSDNDOXhPbHlZcVJNMmQ3d1N1SlZnSmJtSll5?=
 =?utf-8?B?OGdmZW9vRzBlY2xCdGVCdWwzNWo2SmM2QU5NWnJHN083VWIvN2JObTlBQy9z?=
 =?utf-8?B?cFpzaXdIaHpDQ05SS2dkWENCQkc3bE5nV3pKN2FLMXpiVlVYRlF0TVRSOXZT?=
 =?utf-8?B?dEUzRy9DZ0dCaE03cmxZWWVhQ21LN09sbi83R1l0SHFxN291dmtnM3VGWWxy?=
 =?utf-8?B?OEgwL0Z0RFlDLzk0U0NVWjVtQ0xwOXByenpiVFVsQVlnNWZoNFJlWm5LMkpr?=
 =?utf-8?B?VzVDQTVUNTNxZzFYKzFVMFJaMXNRM1ZZR09zUit0V1ZPMm1VemFpUEZSMlVv?=
 =?utf-8?B?SVM3MzlSazJNU0xFeHQrbnZJQnBWOEpmNnFtR0FCVHpLdkVoMDJxd05lVWgv?=
 =?utf-8?B?aFlxaEpoREZXVmJPM3RUdHI4YXllM1VxVjdMUTRna3lrTkFHaUpXK0pEQitQ?=
 =?utf-8?B?SFgrWm8xa1phbnVBWWl2RURvVEkvbEppelRUYVdVNjlnbldVa1JmanNBbGRU?=
 =?utf-8?B?VkExcDJSRXc5UitVY0pBa2tETGVuVzZ5dXF0QjBtRysvSjFkVDltVWVVNnJJ?=
 =?utf-8?B?UFQzVC92MjJIVXBsSVJOS0tGZWE5MFgyUWYyMGxZT2dQSnJjZWNOUVBrTXhp?=
 =?utf-8?B?Rm9rTU94SkhUcEZhbXJ2SGMwTUIrSDlJU00zblFVT1g0dzg5R25hQ1Y1QjlV?=
 =?utf-8?B?bFAwTGladExYOTgvY2pFN2dMTjFKdTVveEhCVVRHOTBmd29taFdOZXdPRlAw?=
 =?utf-8?B?ZStOTVFpcTgyZU1ENThJMWpOdTNBZkV6dDkxM1lWcGNUMnc0ekJTbGRLNVFx?=
 =?utf-8?B?NE56NkRFbEE4VU5OU04wM2dCMGFYa3dnSWVRRXRiQStpL0V2aVVGaVd6dUta?=
 =?utf-8?B?bUNjczBIaDA2clpkVXpKWGtEOWZzZm9ZcGZ2Z01WK3JsMFEzSHFwOFJGTks3?=
 =?utf-8?B?cDVCSllDOUNUWWtVNTYzc2JuNDJpKytscXlUcDMyUSs3Qlk0MHdsbU1ia2dF?=
 =?utf-8?B?djU2RFlMcTZJNUVhLzZFVjlGQzd0dHZ5QlFnT0lDOW93dDk2MXdRSjJpZTh2?=
 =?utf-8?B?bG5hU3FtL3p2VjB2SEp5OXpYbzIzWUxpRkJxV1p0c1NIUTJHVkJwU09RZnIx?=
 =?utf-8?B?dlFkWmRqWUJhNFNTbHh6eFcvNzRrMi90U3o2bmltY2RwbW1ZSGNrR3hFTzVs?=
 =?utf-8?B?TXJ0VWJXTmNLRmMyaVNURjB0VVhPdzdueUFVTTMxVE12RXZYK1ZyVW51ZFRu?=
 =?utf-8?B?THNPbTBWWjkrdUNIOVp3K1p0MmJqN1pyM2s5TWVqZUV1a3cwTWdLczQxZHpF?=
 =?utf-8?B?UDl2eXdIKzZ5dE1QVVFMSVJzZXRJQ0lDWFFaSmlISXljenZSTWZSUWgwVTNq?=
 =?utf-8?B?dVFOOCt2dnl4djdBTXg2MVZQbitRVEJ3U1l6YVhRb0ZMNnVtUk1XUy81THFv?=
 =?utf-8?B?K3RkUkxSV0w3Qmt1Q2dpa0JWTDNUNEFPaXNVcFJrYlhvWlhUN1plRTJaamM4?=
 =?utf-8?B?OHVzMFEwWlNGNjBqYjJneURRNlgrRGtWa2txM0IrZGNtVEtFeWVzSGx1eTAw?=
 =?utf-8?B?M3pzYU1SUC8xVnVSTkdLWFpzS1owKytYZ09CZ0JKVlg4NDVwd0VRMEZRY0cz?=
 =?utf-8?B?cHc2Z2hNM05rMm1UM21oWE9xL3VWaHJJMDVxRURxaDJ0anJNeUxEdmhMbXd2?=
 =?utf-8?B?OVN3cVZBdGtQTzBRcHVidjhjM2JDSjRjUWNqS2l0OXB1bkFmcm9uRXVaZDZu?=
 =?utf-8?B?ZG9LTU9CSkdNNW9Ec1E2bWpLZy9rTnIzZmg1Y3BiQjRla3FvcmEwREo5SG5o?=
 =?utf-8?B?aGxodzVzRW1vbWZLL3o4MFhIYTdEb3RBVjREQUVaZ2hRa0ZPdzVMMUVLYm83?=
 =?utf-8?B?OENWUXUxbDF4VWxjajlhekVVeXJqQkVBTkh2SHJ3VUp1aEFGSFBlaTdPR054?=
 =?utf-8?B?aGM5Y1kwVjBkck9La2ZuajhWQVg3bFIyeVdYVHVsdnZPbnorNHE1YjB2RVBD?=
 =?utf-8?B?ajdiWjJXRXZ2TFMxZ3l3YmlqL0RaanJKQjhVME10ZlZKTHZTZXNYbS9pSzRZ?=
 =?utf-8?B?b3ZyeTdoZ0ExYzVNenBzNjNqT254d01DSi8rTTdlL0dFdlFnK1B2YzBFTWx2?=
 =?utf-8?Q?NC2tIRXGUlsohvj8=3D?=
X-Exchange-RoutingPolicyChecked: GlS+qlZZ9mbvJQXTQxutoCLcKuC6QbV3Mbpen6cGA2AmZuKBsZ0AWOOKFRFsO2BKgo6kmF8xoKY8st5kdLr09IISKkGv5JIn1UgcqnUj2X+YAUF7/jXYyBLh0KJJYPYafivEiRqnXH76VPdqPE+woXuOmT5dgXkT5Rovk3b8SebY66pdCdy7BXRGyUJqdL7ZJqvwawtNqIsMB8oONvcutf73zuG/S5VZMd9+VsIaBkonABt86ri38RzekQM3HNYbb4LgcFa2kCoim+8Tlaw7pGo0zUlN/m5NA7watSFdPlA6pYZIpvGtuCxeNq24P1g0QdXeXnak+N1OyAGbrRpwiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c832fe6-5f10-4877-dc1a-08df41bacfcb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:17:51.6536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB7CaCWuWMYtkBlRHSVs099tYFsDX/l1wODgQT2KWsdSvXGp5tKRC9ExB9HFCrr5xt0EnWIXr1V6Ej3wo0PyEHLzNmR9QWxCsXgxBv3VScE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB940045
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/13/2026 6:52 AM, Anirban, Sk wrote:
> Hi Vinay,
>
> On 12-11-2026 02:51, Vinay Belgaumkar wrote:
>> When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
>> default. This frequency is desgined for optimal perf/power ratio. 
>> However,
>> certain use cases may want to run at lower frequencies. This sysfs 
>> allows
>> user to disable use of default RPe behavior.
>>
>> Efficient frequency will now be controlled by this interface alone. 
>> Setting
>> min_freq < efficient will not affect the flag. Disabling use_rpe will 
>> cause
> imo it will be better to convey that setting min_freq < RPe will not 
> disable the flag anymore
>> GuC to bring back min_freq to whatever level it was set before and 
>> enabling
>> it will bring up the min_Freq to rpe_freq.
>>
>> $ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
>> 1
>>
>> Cc: Sk Anirban <sk.anirban@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_freq.c      | 34 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 47 +++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>>   4 files changed, 77 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index a40dd074106f..f9542848c1d2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -242,6 +242,39 @@ static ssize_t power_profile_store(struct 
>> kobject *kobj,
>>   }
>>   static struct kobj_attribute attr_power_profile = 
>> __ATTR_RW(power_profile);
>>   +static ssize_t use_rpe_show(struct kobject *kobj,
>> +                struct kobj_attribute *attr,
>> +                char *buff)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_guc_pc *pc = dev_to_pc(dev);
>> +
>> +    return sysfs_emit(buff, "%u\n", pc->use_rpe);
>> +}
>> +
>> +static ssize_t use_rpe_store(struct kobject *kobj,
>> +                 struct kobj_attribute *attr,
>> +                 const char *buff, size_t count)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_guc_pc *pc = dev_to_pc(dev);
>> +    int err;
>> +    u32 val;
>> +
>> +    err = kstrtou32(buff, 0, &val);
>> +    if (err)
>> +        return err;
>> +
>> +    if (val > 1)
>> +        return -EINVAL;
>> +
>> +    guard(xe_pm_runtime)(dev_to_xe(dev));
>> +    err = xe_guc_pc_set_use_rpe(pc, val);
>> +
>> +    return err ?: count;
>> +}
>> +static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);
>> +
>>   static const struct attribute *freq_attrs[] = {
>>       &attr_act_freq.attr,
>>       &attr_cur_freq.attr,
>> @@ -252,6 +285,7 @@ static const struct attribute *freq_attrs[] = {
>>       &attr_min_freq.attr,
>>       &attr_max_freq.attr,
>>       &attr_power_profile.attr,
>> +    &attr_use_rpe.attr,
>>       NULL
>>   };
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 9558d7196a51..8f7044b49e13 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -344,6 +344,21 @@ static void pc_set_cur_freq(struct xe_guc_pc 
>> *pc, u32 freq)
>>       pc_set_manual_rp_ctrl(pc, false);
>>   }
>>   +static int pc_set_ignore_eff_freq(struct xe_guc_pc *pc, u32 val)
>> +{
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    int ret;
>> +
>> +    xe_device_assert_mem_access(pc_to_xe(pc));
>> +
>> +    ret = pc_action_set_param(pc, 
>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
> Once this param is set, does it stay stable on the GuC side when the 
> user later changes min/max freq, or can it get reset? I recall hitting 
> a case where it got reset, though I don't remember the exact condition.
GuC does not change this flag by itself for any reason.
>> +    if (ret)
>> +        xe_gt_err_once(gt, "Failed to set ignore_eff_freq to %u, 
>> %pe\n",
>> +                   val, ERR_PTR(ret));
> Double error logging,pc_action_set_param() also will display error in 
> case of failure.
Ok.
>
> Also do we need to set min_freq to RPn here, as we are doing in i915.
This is not needed. When we disable eff_freq flag, GuC brings min to the 
value which had been set before. We don't need to de-escalate from KMD 
side. We may need to fix this on i915 as well.
>
>> +
>> +    return ret;
>> +}
>> +
>>   static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   {
>>       /*
>> @@ -353,13 +368,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, 
>> u32 freq)
>>       if (freq < pc->rpn_freq || freq > pc->rp0_freq)
>>           return -EINVAL;
>>   -    /*
>> -     * GuC policy is to elevate minimum frequency to the efficient 
>> levels
>> -     * Our goal is to have the admin choices respected.
>> -     */
>> -    pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -                freq < xe_guc_pc_get_rpe_freq(pc));
>> -
>>       return pc_action_set_param(pc,
>>                      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>                      freq);
>> @@ -1166,6 +1174,26 @@ static int pc_action_set_strategy(struct 
>> xe_guc_pc *pc, u32 val)
>>       return ret;
>>   }
>
> It's a non static function, better to use description maybe.

Will do. Thanks,

Vinay.

>
> Thanks,
> Anirban
>
>> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
>> +{
>> +    int ret;
>> +
>> +    guard(mutex)(&pc->freq_lock);
>> +
>> +    /* If use_rpe == 1, ignore_eff_freq = false */
>> +    ret = pc_set_ignore_eff_freq(pc, !val);
>> +    if (ret) {
>> +        xe_gt_err_once(pc_to_gt(pc),
>> +                   "Failed to set use_rpe to %d: %pe\n",
>> +                   !val, ERR_PTR(ret));
>> +        return ret;
>> +    }
>> +
>> +    pc->use_rpe = val;
>> +
>> +    return ret;
>> +}
>> +
>>   static const char *power_profile_to_string(struct xe_guc_pc *pc)
>>   {
>>       switch (pc->power_profile) {
>> @@ -1314,6 +1342,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>       if (ret)
>>           return ret;
>>   +    ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
>> +    if (unlikely(ret))
>> +        return ret;
>> +
>>       ret = pc_init_freqs(pc);
>>       if (ret)
>>           return ret;
>> @@ -1400,6 +1432,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>       pc->bo = bo;
>>         pc->power_profile = SLPC_POWER_PROFILE_BASE;
>> +    pc->use_rpe = true;
>>         return devm_add_action_or_reset(xe->drm.dev, 
>> xe_guc_pc_fini_hw, pc);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 1025a2b15f5f..dc52f349a6a2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -31,6 +31,7 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, 
>> u32 *freq);
>>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char 
>> *buf);
>>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
>> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val);
>>     enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 711bbcdcb0d3..61654ee7d8d6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -35,6 +35,8 @@ struct xe_guc_pc {
>>       bool freq_ready;
>>       /** @power_profile: Base or power_saving profile */
>>       u32 power_profile;
>> +    /** @use_rpe: Toggle use of efficient frequency */
>> +    u32 use_rpe;
>>   };
>>     #endif    /* _XE_GUC_PC_TYPES_H_ */
