Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B3DC5DF88
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 04:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054B010E250;
	Fri, 21 Aug 2026 04:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UF9etbHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3D610E250
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 04:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787284804; x=1818820804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2yvnOLqDGQOz31XccLlN+9BulUG9db4AoxE0osVn8ng=;
 b=UF9etbHrKFBayLbcuJ7gUON44lmQkyo3TYH7zwkdJjV3oR4THRKZdX59
 rPDMbjZFetuVQ1qdJK5eCaHKFj3jBUQ54+5xMxADlyZ9GdxVSC6hyPDwB
 FKbTgQbl7SEfPQjPc9kh8FpatkgZ9SizXfyom+924Wz0oz2LXVsilNWJ+
 yaFygf+IOIAS6S5EyhP50qEVPqJJ+pDGzSdQ72Ezb1y5vbEkLKKSUFbJu
 nzRGEPi2OAmRB77/UL138sEIkfYsIxYe0uap69Ghb1Gej8THu3wma+VgO
 SqK2zMWLedZQwtjx4gqploZYZPqlCGz1wod+lynifKNTFX/Yp70yke48B Q==;
X-CSE-ConnectionGUID: 0L/wTe6zRFKLBeJgOfk2fA==
X-CSE-MsgGUID: McywrzT/TPuwVZFYvkla2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86950090"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="86950090"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:00:04 -0700
X-CSE-ConnectionGUID: EERCRvk6Tleygpe2NXFuAw==
X-CSE-MsgGUID: ek0dmv3DQjCAKtw+N0Ennw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="261944925"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:00:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 21:00:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 21:00:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 21:00:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlhpDeEh2z9kjw/CE2YUyX9QX6sqdEqcED7+mZU5BXUQDR28DB/M5iPVuYo4dG1sA5/3eanSPk2Anf5v2Vet2Fe8IlZwslA+d3cc1r01tmryXNAsT4SsAihOmk8NU8cu6XuhcU5gf0tDyCfrFLw4LYaEWiGtH9nnG3qBfE1gJLA6OEmQX3py29s6u+XCXjUF5ZjQQmA17IigBfxqmvNV9Ndd4uVW3cQjFOMBKr4GdIdQm5OWczJF23ILoaqmCjUlj3VLEp6KPrnace2/RZVQZOQPGdtc+hKEbXa+gQ66sMKjGrhepgoEx8d8OY5TwLd2NTYOZR+Vya451bKPVI4itw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flLza7ZmxqWgrfDvpVEOmPCCjoY+uzhuhGYNzZfocME=;
 b=yXJa2WJT1yKGTnEgaF8DZma01HsWySe18xj91oDgaxyS6X27wIOPxuj59r3rHRq/bI9JdrlRIhsfigqsQXhjVBKD9WIQR74W+HvFwC5LrH8Qg4ZqgI47vhE+AmOTY12qeZfUjGmu4V+Jw+HQUTIdHZcSRJ3LuP4JAt26vX2HjA8XU+2HtpG2sNgdn9XF4P9oQqSdlM95EpsCwE+NsWIZmTTIzmUtjY9Fes7HcLTs+fYhwbyddKkIfiYN2HNq2g6z3xRHHSFxmwlWrWuFtkhb1jbmKqnVu7c9AvvyhrLefSRAa92T20CpOEjPwC52p3CIfJv+aRKpc9PK3c6Y3KsxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB9796.namprd11.prod.outlook.com (2603:10b6:8:363::14)
 by DSVPR11MB9743.namprd11.prod.outlook.com (2603:10b6:8:34d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 04:00:01 +0000
Received: from DS3PR11MB9796.namprd11.prod.outlook.com
 ([fe80::cd8:425c:ab55:7316]) by DS3PR11MB9796.namprd11.prod.outlook.com
 ([fe80::cd8:425c:ab55:7316%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 04:00:01 +0000
Message-ID: <32cd50ec-22fb-49b8-8206-6c370d86caf0@intel.com>
Date: Fri, 21 Aug 2026 09:29:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_gt_idle: fix vecs config for powergating info
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20260818050041.448014-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260818050041.448014-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB9796:EE_|DSVPR11MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b5f355-ba29-4ae3-9b56-08deff38a6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: gjsTB1QpoI2rX2oKhTfC6VasAfFNB8WqFXMLwijC9yMnxWQxZbNht3RzMT3FTyz+NQlk3+fAwhxQ8I+L65bw2PNvQw8GuGe5p04x0EOBlGL66z7E3EWUAuYKWEfGYDvVjIPMxf5NIMl6V7cLmFeIT+sH3K5iVmRINfU0mGa9Zmwu+LFl+875SpT7oh3dA5wBXjodx5jAK0ctC4/5BdOvUQQKCzGo4APFMFcVfoD2aSxSYlRfkb/f5dh0bTKzYzgDhxrSrJcDzkSgKwEMCnGCyWHNeU3phKOjBDN8ZPzYj7eKzoeaVf/qE8DdJfkY3xb9cHI2IiMvWYUyDpSNCmD10iLW+YE14zOwJ5/WIydCQ+ZEUW5jjecdjjC94xCGY2Oen3moq/87LDXA4RD4avjhj6Ywhvtqi41PxCMBZ58CoKksIJ2673tJc9D81zOPJYKirrXPhsL/EUpPqSc6VhKV4Pc9a61mqz0pjU5cLRDKYnInD5zEiUSNEzgVYq8vLfKEk/Z/zj4KGmsOU4q4h/ROLYnPDy7jt/BJlyl2kRKeXIwhdhsTd0Qg28DUXA5InNRZ/wYfVtes2Qd+onYKO33Fhz/sysxlZWIzB7ut3+ymMlQZDWmA8o25BUgwqqUoZMU/va3/WtjxVo+wdbI1s0fwi8Py8KxtdNqR6J7fjITyKv0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB9796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1N5d0ordHYxcy9ValA0MHhhR0dtKzRJYTY1dUJxM0UyaGhDem1xU0puSnNk?=
 =?utf-8?B?UnBVK1pqYUM1Q3p6elpPQzd2WmlHWXl6Z0YxejA3RUxIaUMyaUplT1F1cjlL?=
 =?utf-8?B?MThtMkdvcUk2QTVoYTZ1R0VYTndaL2YyR0ZDUUNhL2dRT242dy96Yjl1T3lY?=
 =?utf-8?B?c21PNTRqQjVyWkc5S1lnWGk1MGhLcWpJb05hQy9aQlpIKzNQcXptMlFiaXdC?=
 =?utf-8?B?SFc0Q1dIeFI2eUhFSmFGVDZheXYvSGs4aXU4S040RUpUNGU0U3IxR3NPdE5n?=
 =?utf-8?B?R1NwVWRiNGcrNU01cVZmb2hXQXhTcEU4dktnZHRIOS90bWVKbS9TMzFDeGRQ?=
 =?utf-8?B?Y3pDdWQ1L0dNK1M1aytVSlRKQzVoRHJpcGhGdm8yTEl0NFUvTUpVbzdveCt1?=
 =?utf-8?B?ZUozbnZvMzhaOU5GTlMrNlVmMDZRSnYrRC9QdjJCNkpPYUV5bm01dElIZVF0?=
 =?utf-8?B?MVkraHVQYlFnemVGZXIyajFWSVNFTTVYOWt2T1RKcENnaTdpSDZqcXdkSm84?=
 =?utf-8?B?TkJSK2ZsY3poUnRmbTlDanRsQnRDcmhTTUVFcEorWTlWWVE5OTVJRjFyZEpW?=
 =?utf-8?B?VEx5OTc5SVp6MXZHbmxHYkZFVEJRbER4bkdITVkvM05ZT3Y3ZlVWRnBqY1Nu?=
 =?utf-8?B?aWpzNjlTMTFQSG85NVZINk0rd2JYckdMbzFUa0wyMmF1N3NhZXRJcWJuZmND?=
 =?utf-8?B?dHArWFVPOHptanA2TXovZEVyOUZvM1pWUEFmbUdLdG04QVl3TGkxLzdqS3Vm?=
 =?utf-8?B?dk9qR3h2eDVjWlhZL2drZ2NqWlRob01pZjBPdHRyQ081c1lQeVBiMU5ueFFx?=
 =?utf-8?B?bktOMVJYQjBxbzBKWmFkYnFDUFIwY2pvcU9JWUpGWGsyOEE0VzMzbTk1ZFRI?=
 =?utf-8?B?U1VEQ3VUK04wb3BGTTlBdDFUS0l4ZzJrTzhaTm4vcXBQeUhSV3FsRGlwakdE?=
 =?utf-8?B?L242UDZLUTBlUlFrY0FTNXlRYzI5ZUU5Y0UyRk1SUE56eWg0TG9FamVMMDJ5?=
 =?utf-8?B?YXJRM3JleEN3YjVVdVpqNEtLelFGS3ZhUlA2a3hTMklmOFhveFpqbHU3eUE3?=
 =?utf-8?B?UUkvR3QzUUl6dE5zL0QzT3pnVmx6SWxXZnkvcVRhbmp3alV5OS9xQzJaNVd4?=
 =?utf-8?B?UTBmTWYyUE56RTdLVG41ckJKeDBNamtYZ2lSZ1NGai9TdUNSbm9wRG5yVXUz?=
 =?utf-8?B?Z0RHdnovaURpRm1hV3h3VWFSOVBCVjBmL29weGE0ZU1YOHc4bUx0d1N6dzg1?=
 =?utf-8?B?aGVNc3krVk1hVzFUbFIvYTNGRE45VDJkdWhOTUFWZ3dNaDA2U1NoTkQ5RXVU?=
 =?utf-8?B?VHlrOHlIdEpkRTduMTRnUXNOQzdEWlNhMzl2RlB4alo4QW5WWksrd296bDdX?=
 =?utf-8?B?ZS9xSEFaWGF1SERTNGhXR0dHMGhHbkU1bjBUTHVHVG5xUEJLaXM1czZVb1J3?=
 =?utf-8?B?SnVKTW13U2NDMXZ6dGxkaXFQKzg5M1JZSHVvV09Ha0M2ZGFNMDBhMEl5V3dQ?=
 =?utf-8?B?SjJrMzA4bGdGN3N1UUh3L1p1cmtRWEZ6Mzc3M1paZ25xYWdxQzU1dnpDUmZm?=
 =?utf-8?B?MEE1b1R2NVByeGpkZkkwQkpNQzFRcVJxOG5vSEo2Zlo4dEpycmkxbmZidjVN?=
 =?utf-8?B?elkvdFV2TDRqMWNYWkxvYnpxT0cwR2tpR21JQ1BlRGdiZTZjcjFZSFpIMDlI?=
 =?utf-8?B?bWVScUt5VCswMkJsZUN5blgwd3AwQnlkblQybnhVRUcvZlRhZnFibFhsbE5L?=
 =?utf-8?B?TUN6dzVtYUIrdmZwSTR0VFRrWkxwb1UrUk9TcXBQWXpoR01FMGY0TFJtc2Zx?=
 =?utf-8?B?ZmQwUk11NDdKdk1RZkJFSHVnMnFIZTlaVmRKSDFVeERFdHExaEo2a29oSjc2?=
 =?utf-8?B?QWxwZmJqSHFjTkVpZ0J6WGlUbHUzYTRjdEt0T3BkdStHSlNlUlBHMGtBTHZp?=
 =?utf-8?B?cUk3akJ2ZDF3RzRDSVFnQUViRGR1WXlMWk9nWXBKM0p2V1RENHhmb1l0cXNH?=
 =?utf-8?B?Y0VqT3RRU2JTY01vQUdmZ1U5NlFzdENEWGtKUTBTd0pIN0E2Wm1DNDhxczJm?=
 =?utf-8?B?L0I1cWxIeWJlRCtPM215dDdJRUFnb1RLbHB4emhydldRY0pYUklhUEtYemU3?=
 =?utf-8?B?UlV5elRFQzQ0M1VlTUNYd3B2Y0k0bUV1VWpUVVI0KzFXUEJZNERmTGhwbmdU?=
 =?utf-8?B?VWc4ZThEOXhiOVdyQy8zYTNlTkt2eVJZM1FtdmYraS8wMGF5V2RCODhHaUZJ?=
 =?utf-8?B?eWREQlVTUFFVOXJrUUZGSThKUmNNNEFjRERzS1cwVGpmV1FTd0grNWxQVGNv?=
 =?utf-8?B?dlB1NXpJcDZnZVhRaHRzSUl1dEtzbFFqT0RFV1M3cnNoRzM1Nm5OUT09?=
X-Exchange-RoutingPolicyChecked: EBT5cTfpPACnxZY4LyH6ONbysy2kDlTS97nwUsWiJC9JElklDl/ldi1iF72FkMRXK6rOmY/stkj8/lKI2CnssKuxEgvhDyrQvatFs4bTnu6wx5X+6RygI7+yaq5Wz8XGhJrQWGiVaLHObaZAiU9xBk3eToQw+VGbO4iTQVtFS/bAkOGWhLd1a0GI31cVb00RUpIj4VC25r50NTd27V+M01ypqZPYyPSqiD0oTkV5LmS7ST6OOxmp1SAJ56iEyEoHylmTYik0eMDeAc9jxl06anpNW7OjUnMIx7VsAHnaoffkdo0TJxurasQFD2BGKQHTPYL4GFt2DQnvBfJPXgt5RA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b5f355-ba29-4ae3-9b56-08deff38a6b2
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 04:00:01.3837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnZx0Qq0RD0zNPQXaDZds+Ma3WQbLBgnVkIL+39YAwxwtNXEYIwYhGusKJ6RJ2RWhh8rxO9G+5yy4Fr6YZrBbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9743
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


On 18-08-2026 10:30, Ashutosh Dixit wrote:
> vecs configuration for newer platforms (media version >= 35) is
> different. Fix powergating info for these platforms.
>
> Bspec: 67103, 77977
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
> v2: Restrict to two media slices (Badal Nilawar)
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c | 45 +++++++++++++++++++++++----------
>   1 file changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 04b24e1c8b78e..98bd4d87ba184 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -208,26 +208,34 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   	/*
>   	 * Media Slices
>   	 *
> -	 * Slice 0: VCS0, VCS1, VECS0
> -	 * Slice 1: VCS2, VCS3, VECS1
> -	 * Slice 2: VCS4, VCS5, VECS2
> -	 * Slice 3: VCS6, VCS7, VECS3
> +	 * Prior to MEDIA_VER 35		Post MEDIA_VER 35
> +	 *
> +	 * Slice 0: VCS0, VCS1, VECS0, VECS2	Slice 0: VCS0, VCS1, VECS0, VECS1
> +	 * Slice 1: VCS2, VCS3, VECS1, VECS3	Slice 1: VCS2, VCS3, VECS2, VECS3
>   	 */
> -	static const struct {
> +	struct media_slice {
>   		u64 engines;
>   		u32 status_bit;
> -	} media_slices[] = {
> +	};
> +
> +	static const struct media_slice media_slices_pre_35[] = {
>   		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> -		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
> +		  BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS2)),
> +		 MEDIA_SLICE0_AWAKE_STATUS},
>   
>   		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> -		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
> +		   BIT(XE_HW_ENGINE_VECS1) | BIT(XE_HW_ENGINE_VECS3)),
> +		 MEDIA_SLICE1_AWAKE_STATUS},
> +	};
>   
> -		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
> -		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
> +	static const struct media_slice media_slices_post_35[] = {
> +		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> +		  BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1)),
> +		 MEDIA_SLICE0_AWAKE_STATUS},
>   
> -		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
> -		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
> +		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> +		   BIT(XE_HW_ENGINE_VECS2) | BIT(XE_HW_ENGINE_VECS3)),
> +		 MEDIA_SLICE1_AWAKE_STATUS},
>   	};

Looks good to me.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   
>   	if (xe->info.platform == XE_PVC) {
> @@ -261,10 +269,21 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   
>   	/* Print media CPG status only if media is present */
>   	if (vcs_mask || vecs_mask) {
> +		const struct media_slice *media_slices;
> +		int num_media_slices;
> +
> +		if (MEDIA_VERx100(gt_to_xe(gt)) < 3500) {
> +			media_slices = media_slices_pre_35;
> +			num_media_slices = ARRAY_SIZE(media_slices_pre_35);
> +		} else {
> +			media_slices = media_slices_post_35;
> +			num_media_slices = ARRAY_SIZE(media_slices_post_35);
> +		}
> +
>   		drm_printf(p, "Media Power Gating Enabled: %s\n",
>   			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>   
> -		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> +		for (n = 0; n < num_media_slices; n++)
>   			if (gt->info.engine_mask & media_slices[n].engines)
>   				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
>   					   str_up_down(pg_status & media_slices[n].status_bit));
