Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB400C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 06:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B58F10E39C;
	Fri, 11 Sep 2026 06:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vyiblm/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7312410E39C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 06:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789108779; x=1820644779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wQlVdquAULfxd+NYT0/fj8JmmOe1D9NnscsFaMPNJPM=;
 b=Vyiblm/w/69KcCFPsQSnUug5C2RSjE0DckHxVwBl0fbMpf1W5ks+9Yjw
 Q906BIMTvxRx6JIsopVgExy5fSDyjM4JPHrGr4OkvKUxEvEPLXZ+SDeS7
 0eBJbjPrgaFsVCxELE+kxEdHJw9Gm8quvDjD4o/6/nDWXrn2ebNlEBJQY
 wlznrBczsJFzhHym4keSsgIIgQl1Ji0ReJejsjMZbbUKsU/BcZZqMPHre
 YUyIXfeuhTBa5VWwM1FO1pFfm7ijx2ufpRUsReX3/2tA/dnakrDPPpC0J
 3vM/dqFRllf2Ykevck1MAYY75bbW4BunDF4g8Lun+06v4YMqPEa4n15xq A==;
X-CSE-ConnectionGUID: lfn8KcpNTWOxM9tA7ECQ6w==
X-CSE-MsgGUID: Ei8NXM2tT+yFwUOLcNzGiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77128774"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="77128774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:39:39 -0700
X-CSE-ConnectionGUID: NW9Hi/EwTZS6zPHz4LibvA==
X-CSE-MsgGUID: rbPBpfDbQiqAmVTdCo5fVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="270465958"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 23:39:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:39:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 23:39:38 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 23:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2YIJ+eX2tWx+KFmzfF/G71V2/nHpSLG0WP8C9M1OthQxC4DOVZXCb0lTYnhFmO1fOD7u9NpFwEazD/YixmjzxCm/w06OeVkzno6aE1enJ/dj7uXtSGWHOr3UB5Z8EUynD416/alq0afBw7wZXJxIKN0muAfPyQjp/qYbT0Pv9BmNEQO+kKdz3gvaupStUweDa3GFtsWjICotYKgQcGtGDLn82bD74PPRgsrvYtqXWPzS186whR4eYJ42p93iDWj5vEkri5lUuVXvbPVQQDHOOJQcN9aZ+vYisLJG1KV4nFNbUqsj2QRwWSM+FPajUeHavexfY/wRLcYGv1V5FLTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQvXf759dqWWhplHHN89vPIIRQBNSWZtDdu9GTOe3EM=;
 b=JatEeiIV8decTAiZ9cEWJGrOMrjpjRCh+0VmW4NVLnuIq/2Mj+6sDRk3WMcvXmGF3Oh5Rvw8tRGxfmRj4TaLuoDDW/nCrLjt6GobjxhYswb2DG/RRrS34vMnAiuEeqIe26Tn6DrPTVxCwTIS1CzffNeG540vo8aGOvojfHCv/1xvSYweI7paPsmJ2DYADuwZu1vrdGhIg/8oeKcbk71YnYa9tiG0sEuk5/tZmIUvYY1BAnekU9SBLpAvDKRjPlwhSIhqtEidN9l0bV+7fMAn4gNQWcSzUvTsHFV3ncTm0Cc+P/lSdcsIdN7ryGArN6gVhpFKGUmooYkiskFJkT/QBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH9PR11MB801465.namprd11.prod.outlook.com
 (2603:10b6:610:311::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 06:39:35 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 06:39:35 +0000
Message-ID: <dec5d189-2c92-4e5f-bf24-4c1d907fcc7b@intel.com>
Date: Fri, 11 Sep 2026 12:09:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-10-riana.tauro@intel.com>
 <8c546a9c-4c59-4345-b430-dba6eb6a2244@intel.com>
 <57ba2a0a-a4eb-4e97-9fea-003cd494c9f2@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <57ba2a0a-a4eb-4e97-9fea-003cd494c9f2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH9PR11MB801465:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f017908-ac8b-4dad-af36-08df0fcf715e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Dzu9Ygrr9tlJRfV2u4aaouaLqpRWXuFlVfGwy8V7I7bG2EL0spYHBk1vwTRthquJ8wWTJveXnRPRpt5m7hRYVChaXXiieqFgtQdePaeLcTp4KdQwcbPIvQJyEtc4owJ4Th0mW6QHxrMMul0VANDbbkWUvyrHl+bvPVikKJr4LBb5FyrmvNgQWzRJoeOaVK+RboAKoPFhmWU8eS4aai8C5BnXglVxsrYKYvYWqC1O1itAw2WpTylCN8/SKcwkcjxi6urqbWqprZ7kjTXnh/Jx79Nzc9TQ70qnYmshPgH5X8GMYZB2QHgOIuejDdGg8wlXm8yiYKmFCeB8vzbbxz2d/TCWvzxFZCzfE1ukHNhd4FG4SKE7p/I0VlJAcSebngW1Ia3+XrIzX76u6YFpk3Ho9RXMf3ZdMzFaIbWrW/ttoOZfRhqjfl0RR4bVYqXpTSssCxHSt6BsqAAjvQXH1Wn3WcdgLDG0Cp6qxstQLX5xtwLTTFjLeoJpTlL1YUMiAeizweg9dfq5x2/8VBZQs3uBBYXXVG6cIsh3MO5YBVfsz9yUd50/JHXKfrF9eoRwcfWVlIN8X29jQrwV7CD9Q7ue734Ao8fYXCwb57d+JxLqkXF2MPfGNVQq6fH3IescH170tWol4deac70A8V/Q8fvyCaCYfF8nc2DlpFu0nefNhz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdGNldNdWZoVVdhc1JqNzVXU0lJSlorSm5LelBwZTZ1elZFYytSd0MxejBM?=
 =?utf-8?B?dU5XbnQ2MVl3cEdtSVdDR2M4NC9VTkdJRmlJMGpPeGo3LzZoY2ZrYjE2NHFt?=
 =?utf-8?B?WVhCcDg2dCtJdHplZFBmYWx3RzIySHlNN0hOTWIvVjBNaWtKN0tGVys5cUNN?=
 =?utf-8?B?Mk12SFMxaS9MOEpIQnF1TkJsSFUrTnNsZDA1ZzR6ckRVbHY0NEdtdTg2aEE3?=
 =?utf-8?B?ampEMG9mcXNUTDRTRVBwNTlMbVllRk9uV2ZIcVgxbzdsRW01WDFISWVvM3p0?=
 =?utf-8?B?aTNuVk5LbkJGRXo0MXVxUU9VNUlmNTlsL2UvR256V0o1dzZUM2Z3T3g5dVZr?=
 =?utf-8?B?SGl3NHcxNFNWUGx6RDF6UDRqejdUd1c0bW0xK0hjVGJjMXFNT044QzMvME04?=
 =?utf-8?B?Y09KMFd1V3JlbDFFckxXdUw2QWRqYVBTSWljQWE4MUJZeXFIbWc1enV4VXcw?=
 =?utf-8?B?M2hDVGl3OVh2YXBWWUFoWXY4Q01vKzQxSVY4WGovMTZDL0dPa1l6c2dyc1JY?=
 =?utf-8?B?WVFtNzJCc2M1MmdlR2pRcTZSdm40MHpaTUoycUJUTzUzYkVvNlpFQmJQZTZh?=
 =?utf-8?B?ZkQ2c01yeUhKNk13MW13cHkwdDMwSG5DbW5EWTRwRHRvelVNVHhwVXhxT0VW?=
 =?utf-8?B?dlFFVEllL1VUNUFpTzhDVkVjUlZIMXdoWlNlYjZXYkI4dERCdDA5MkEzbFhC?=
 =?utf-8?B?bHZ2VlpiV0g0ZmhRTmRIcHRUcVYvOUpVT21mVVZqT2JSQ3hoT1I4U2ppZG1s?=
 =?utf-8?B?OWt6VURlNDUwb1huZE1oZ2FIT0hZYkgydWU1Z0tqYkxWazVhTFI3MFh6enQy?=
 =?utf-8?B?S29tczRWZHpLZ1FRRzluQ1VXYzJMUWNFYkpwTkpRRFZIUE9uMnhWcGt4SzVY?=
 =?utf-8?B?eUptYkQ5YVYyWEZuemJpYVdZdE5wVUpnTWpnNEZsZTFabHloWDBDcXBFaWFi?=
 =?utf-8?B?cUpyNTVVQTA0UjRQOGFJUk1kN0N3Wk9ZVG5WNExpUHBOOEhGZUozS0RwYlVx?=
 =?utf-8?B?VGFKajBwZVFvUHZIOHpKSU9RNjdkT3Fsb0tSUlVpRjN0eEIrY1BlRmhZOVor?=
 =?utf-8?B?Z3N1alBnRHFuVzNCQUtLWFQzdVBiVUFub3FKVlh5ZitZZkdRZHdYOE8zbTh6?=
 =?utf-8?B?UlpxVHlBTk9oUWRNOW8zSzFyZmt2WE5HWk5TVGw2M2VvT0hDTU0vQWNGeXIv?=
 =?utf-8?B?NjFtUFpUK1hLUkpJbUc2Z2RkWG9GWWVkY3IwczhEQi95YUw3ODZRWmRlWCsr?=
 =?utf-8?B?UENVcnp2N1ZCUmR2QW9nUzR2dWo3RXhPMEMySzhWMklBWHBKWCtxcHh6a1Nv?=
 =?utf-8?B?NldWUEZVV0pqN1NMSlNLRE9rS3ZkR2xGd3FRTkdaUW1KSnNGODhWQnJnbk1z?=
 =?utf-8?B?L2lSZUlhck4zL05rem0wSEJtQzdUVmxodHFza0VkS2RvM2JKTDRpV2VCbGJp?=
 =?utf-8?B?K2JpYnBMQ0REL1JtUWx3a1A1RWpUcnUyWXBRYW5zZHMrUTlBcWVHVEJ0NFRH?=
 =?utf-8?B?b056dGRlVWZBVEZVbDJDRytKQ3BvdVlHbk1aR0NuRjNpREtxV1REcUlRSjFL?=
 =?utf-8?B?TWVWTnhMMC9UZFplRFpZU1ZUOG16OVNPSEcvdW1Uak5FeHJwS3lJUXlKLzAv?=
 =?utf-8?B?N3pFd2hrL3B4NExoK25SckdHRS9kN05VU1Zya0FMUTNRM2k4ZmJrTHNkV2Ft?=
 =?utf-8?B?WDJEQTJ6bVNXYy95cUl3NjNoZy9yTVhhTGpFb3VEM1o5SFExZWx0Q3N5amlp?=
 =?utf-8?B?RUNZcXVkckZPSGtod2twb2Z2bXVCdy9aZXh6Z3pORkk2ZjFjeTloUElDTjRN?=
 =?utf-8?B?NFNudnUwbkJsMzFGOGFkS2dxTHpzcXlESEZ6d3c0VFRuaDZnd2h5RUVjQWQy?=
 =?utf-8?B?RlJOb2QxMlJFWFFJZEwxdStvSXZyazFVcjMxdGRGSjFFZWxkQUdWNVA0MmZJ?=
 =?utf-8?B?aUZpaXUxeVV4U2cyVW1QZ1RmZllhaktJZFlGREl4NTFOOW5kOG5JMW1pKzhz?=
 =?utf-8?B?UU1HVVpacm5KVG0zRWtmYmhUWlBub0ZnS29STysyUjZ0a29LbWNNUFVuVFVh?=
 =?utf-8?B?YmU5ZDE5WStyOUdwbG1Sd01FTzNYUVc5eDR4VG1oWVI3QXhPVDlqRFdjbjRw?=
 =?utf-8?B?blN2RXR3dEM0UVlsQVA3MDllQThoKzFQT2RRRm9WUHE3TFVOLzBLc1ExWWwy?=
 =?utf-8?B?UGtpdTM0TWVKRHF3QlNWOGQ4c0FXNTBXZmttMGx4SzFzNzhieEk4am15UkpO?=
 =?utf-8?B?L0xFUHdZQ0RRbHFTMFlWZW9EQmZlcXB2ak5EMTFPOTJGRURDT0FUT21xMDUr?=
 =?utf-8?B?Y0dZUThWMW96d1J1ZDZOVDF0MEMyZDM0N3NqbHBVbWNJZ09FblliWFF5RnBI?=
 =?utf-8?Q?KXgZnRyeJlgqXF8Y=3D?=
X-Exchange-RoutingPolicyChecked: XHNoQrq+le4HJw18SoRZVGVuJDNUEjFnVzkEbrc2XJrqziTiF7gQdUjCO52wFgKaI+9Mxp1gB2lPTM75DTn6LxwNcKnK8Sydy7WisKf9AK9QOzVCm4jap45yXSLJ2dd/F6IaSIc2rsBwrSxxAUbq/GI4NxY+wXSYJdlr6zqvsi1LiM8MNxqjvQuiChYmOGPHsEL0bpmObk1kZl8CxXNDHwbQaKOT6TpSI3mffzYnR1AogdL+nL+Oy6LupFEbIH+VhBqI7LwAjtAG/josvYzgTdU745oC6sXpFuWyjNK2RNPoOGhguDG1jswbWIggEsGaIbEut2j6lXp/cDnn1RSWSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f017908-ac8b-4dad-af36-08df0fcf715e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:39:34.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ1FU1P1C+38sruirMO12HIL7+QQN/Wo4/UXL0uyLE6/ffzFa7ZtzsmArHA3Ear+mzgV1sosD8IkHn81A/rqHoyvS5PmKUPN8CjRHFgf6s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB801465
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



On 11-09-2026 11:41, Tauro, Riana wrote:
> 
> On 07-09-2026 23:55, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 07-09-2026 15:17, Riana Tauro wrote:
>>> Add support to query page offline list and queue from firmware
>>> during module load. The page offline list command retrieves pages that
>>> are already offlined by the firmware. The page offline queue command
>>> retrieves the pages pending to be offlined by the firmware.
>>>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: rebase
>>>      store total pages once per response (Sashiko)
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 105 ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  43 +++++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>>   3 files changed, 152 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 94ffd0852938..648e46df831d 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -326,6 +326,108 @@ static bool ras_counter_is_valid(struct 
>>> xe_device *xe, struct xe_ras_error_class
>>>       return true;
>>>   }
>>>   +static void get_queued_pages(struct xe_device *xe)
>>> +{
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_page_offline_queue response = {0};
>>> +    u32 count = 0, total_pages = 0;
>>> +    size_t rlen;
>>> +    int ret, i;
>>> +
>>> +    /* Supported only on platforms with system controller */
>>> +    if (!xe->info.has_sysctrl)
>>> +        return;
>>
>> move to caller, single check helps for both get_queued_pages and 
>> get_offlined_list.
> 
> This is already part of caller.  Added here in case there is a re-use.
> 
>>
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>>> +                  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
>>> +                  sizeof(response));
>>> +
>>> +    do {
>>> +        memset(&response, 0, sizeof(response));
>>> +
>>> +        ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +        if (ret) {
>>> +            xe_log_err(xe, SYSCTRL, ret, "failed to get page offline 
>>> queue\n");
>>> +            return;
>>> +        }
>>> +        if (rlen != sizeof(response)) {
>>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +                   "unexpected page offline queue response length 
>>> %zu (expected %zu)\n",
>>> +                   rlen, sizeof(response));
>>> +            return;
>>> +        }
>>> +
>>
>> How about helper function for below part avoids code duplication ?
> 
> I did try it before sending this. But due to difference in request/ 
> response structures it is not very clean.
> And there is max_entries cached in the next patch in offline list.
> 

Look at below code snippet, if it makes sense to use it. Ignore it if 
feels overkill.

/**
  * struct xe_ras_pages_response - Common page-address response payload
  */
struct xe_ras_page_response {
     /** @total_pages: Total number of pages */
     u32 total_pages;
     /** @pages_returned: Number of pages returned in this response */
     u32 pages_returned;
     /** @page_addresses: Array of page addresses (4KB aligned) */
     u64 page_addresses[XE_RAS_NUM_PAGES];
     /** @additional_data: Indicates if more data is available */
     u8 additional_data;
     /** @reserved: Reserved for future use */
     u8 reserved[3];
} __packed;

/**
  * struct xe_ras_offline_list_response - Response from get offline list 
command
  */
struct xe_ras_offline_list_response {
     /** @max_entries: Total no of pages that can be stored in flash */
     u32 max_entries;
     /** @pages: Permanently offlined page-address payload */
     struct xe_ras_pages_response pages;
} __packed;


#define xe_ras_page_offline_queue xe_ras_page_response

static int get_offline_pages(struct xe_device *xe, u32 cmd, bool 
offline_pending, void *request, size_t req_size, u32 *req_index,
void *response, size_t resp_size, struct xe_ras_page_response *pages,
const char *print_str)

{
}

static void get_queued_pages(struct xe_device *xe)
{
     struct xe_ras_pages_response response = {0};

     get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, true,
               NULL, 0, NULL,
               &response, sizeof(response), &response, "queue");
}

static void get_offlined_list(struct xe_device *xe)
{
     struct xe_ras_offline_list_response response = {0};
     struct xe_ras_offline_list_request request = {0};
     struct xe_ras_state *state = &xe->ras.state;

     if (!get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, false,
                    &request, sizeof(request), &request.index,
                    &response, sizeof(response), &response.pages, "list") &&
         !state->max_pages)
         state->max_pages = response.max_entries;
}

> Thanks
> Riana
> 
>>
>>
>>> +        for (i = 0; i < response.pages_returned && i < 
>>> XE_RAS_NUM_PAGES; i++)
>>> +            handle_page_offline(xe, response.page_addresses[i], true);
>>> +
>>> +        count += response.pages_returned;
>>> +        if (!response.pages_returned)
>>> +            break;
>>> +
>>> +        if (!total_pages)
>>> +            total_pages = response.total_pages;
>>> +
>>> +        if (count > total_pages) {
>>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +                   "Pages returned from queue exceed total pages %u, 
>>> returned %u\n",
>>> +                   total_pages, count);
>>> +            return;
>>> +        }
>>> +    } while (response.additional_data);
>>> +}
>>> +
>>> +static void get_offlined_list(struct xe_device *xe)
>>> +{
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_offline_list_response response = {0};
>>> +    struct xe_ras_offline_list_request request = {0};
>>> +    u32 count = 0, total_pages = 0;
>>> +    size_t rlen;
>>> +    int ret, i;
>>> +
>>> +    /* Supported only on platforms with system controller */
>>> +    if (!xe->info.has_sysctrl)
>>> +        return;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>> XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>>> +                  &request, sizeof(request), &response, 
>>> sizeof(response));
>>> +
>>> +    do {
>>> +        memset(&response, 0, sizeof(response));
>>> +        request.index = count;
>>> +
>>> +        ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +        if (ret) {
>>> +            xe_log_err(xe, SYSCTRL, ret, "failed to get page offline 
>>> list\n");
>>> +            return;
>>> +        }
>>> +
>>> +        if (rlen != sizeof(response)) {
>>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +                   "unexpected page offline list response length %zu 
>>> (expected %zu)\n",
>>> +                   rlen, sizeof(response));
>>> +            return;
>>> +        }
>>> +
>>> +        for (i = 0; i < response.pages_returned && i < 
>>> XE_RAS_NUM_PAGES; i++)
>>> +            handle_page_offline(xe, response.page_addresses[i], false);
>>> +
>>> +        count += response.pages_returned;
>>> +        if (!response.pages_returned)
>>> +            break;
>>> +
>>> +        if (!total_pages)
>>> +            total_pages = response.total_pages;
>>> +
>>> +        if (count > total_pages) {
>>> +            xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +                   "Pages returned from list exceed total pages %u, 
>>> returned %u\n",
>>> +                   total_pages, count);
>>> +            return;
>>> +        }
>>> +    } while (response.additional_data);
>>> +}
>>> +
>>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>>>   {
>>>       struct pci_dev *vsp;
>>> @@ -1040,6 +1142,9 @@ void xe_ras_init(struct xe_device *xe)
>>>       if (IS_ENABLED(CONFIG_PCIEAER))
>>>           ras_usp_aer_init(xe);
>>>   +    get_queued_pages(xe);
>>> +    get_offlined_list(xe);
>>> +
>>>       ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>       if (ret)
>>>           xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", 
>>> ret);
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>>> xe_ras_types.h
>>> index 20c74593ce05..7bfd86c9d135 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -10,6 +10,7 @@
>>>     #define XE_RAS_NUM_COUNTERS            16
>>>   #define XE_RAS_NUM_ERROR_ARR            3
>>> +#define XE_RAS_NUM_PAGES            25
>>>   /* Error bits in IEH global error status register */
>>>   #define XE_RAS_SOC_IEH_PUNIT            BIT(1)
>>>   /* Device memory error categories */
>>> @@ -330,6 +331,48 @@ struct xe_ras_page_offline_response {
>>>       u32 reserved;
>>>   } __packed;
>>>   +/**
>>> + * struct xe_ras_offline_list_request - Request for get offline list 
>>> command
>>> + */
>>> +struct xe_ras_offline_list_request {
>>> +    /** @index: Zero-based index into the offline page list */
>>> +    u32 index;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_offline_list_response - Response from get offline 
>>> list command
>>> + */
>>> +struct xe_ras_offline_list_response {
>>> +    /** @max_entries: Total no of pages that can be stored in flash */
>>> +    u32 max_entries;
>>> +    /** @total_pages: Total number of permanently offlined pages */
>>> +    u32 total_pages;
>>> +    /** @pages_returned: Number of pages returned in this response */
>>> +    u32 pages_returned;
>>> +    /** @page_addresses: Array of permanently offlined page 
>>> addresses (4KB aligned) */
>>> +    u64 page_addresses[XE_RAS_NUM_PAGES];
>>> +    /** @additional_data: Indicates if more data is available */
>>> +    u8 additional_data;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_page_offline_queue - Response from get offline 
>>> queue command
>>> + */
>>> +struct xe_ras_page_offline_queue {
>>> +    /** @total_pages: Total number of queued pages */
>>> +    u32 total_pages;
>>> +    /** @pages_returned: Number of pages returned in this response */
>>> +    u32 pages_returned;
>>> +    /** @page_addresses: Array of page addresses (4KB aligned) */
>>> +    u64 page_addresses[XE_RAS_NUM_PAGES];
>>> +    /** @additional_data: Indicates if more data is available */
>>> +    u8 additional_data;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +} __packed;
>>> +
>>>   /**
>>>    * struct xe_ras_get_health_request - Request structure for 
>>> obtaining gpu health
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/ 
>>> gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index 590dd408399c..a96aeb11d061 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -29,6 +29,8 @@ enum xe_sysctrl_group {
>>>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/ 
>>> decline a page
>>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined 
>>> pages from flash
>>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined 
>>> queued pages from firmware
>>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>>    */
>>> @@ -40,6 +42,8 @@ enum xe_sysctrl_gfsp_cmd {
>>>       XE_SYSCTRL_CMD_SET_THRESHOLD        = 0x06,
>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>>       XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>>> +    XE_SYSCTRL_CMD_GET_OFFLINE_LIST        = 0x09,
>>> +    XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE    = 0x0A,
>>>       XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>>       XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>   };
>>

