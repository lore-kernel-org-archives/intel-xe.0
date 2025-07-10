Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF4FC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 17:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C526E10E939;
	Thu, 10 Jul 2025 17:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaY1pkII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FC510E940
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 17:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752168444; x=1783704444;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zVBNtxR5XVaHwQcTINy7MiqxJXu9RbgI8N6HEqbsza0=;
 b=PaY1pkIIf2smbPyKPg5xDrFGTfrkuXVAP4O1JODSzuPBUdDHXTj171xx
 w8LUzPoprAVBJ++r0pR+qof+GLEhMRY19R97yuMO3UdBpG6Lz6ezP0HOM
 wvcH8VvwHiFLTjP3btkVFqtY7bcNMtWXLhPGmyyklLysUyl9jlaWPFwQS
 D+daie9fDzCfBqKWeZCLLyygs2w2YVku/Wj1LO+Oj7vS0IthLngOEAZ01
 MbqZNNjeD1vCNN3RKldtiuXJZuI0TpTg+oWhcdvwPd/X8Qo/o0DuSvV7v
 WJwkg5JVwCT4tkJQAzxRycRdAPUepyX1qHaD05urNC0+aUsedhJ+Veazu A==;
X-CSE-ConnectionGUID: yo+Tth0fSvmrXyJgdUaxGg==
X-CSE-MsgGUID: wEjGMFEFTXOFpeR43abSrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54551982"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54551982"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:27:17 -0700
X-CSE-ConnectionGUID: GvDb5AmUR7mGUO/ae0kd1Q==
X-CSE-MsgGUID: oSKVxkzgRGO5p3LBoNZZFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156248489"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:27:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:27:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 10:27:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHlNmlqoeKZuaOlKYeIXfEgornUiN+pFHc27aIouGspQPOv6KKrzjy4G19EAvxs6ex4o8jFSsIOb69uzGjnvOOhom3erk3FmCpfT3Sq6Tghdwv0kwJ7P/8siGJz5CSo8aNaXzGDAw4l10YkAoN1gr9FE0XIS78vZJmS0mD9UiqN9iUmiZ59ZYGKQToHo6oHibmvE/sDdXSf5SqUSVt5KafyuZW99ffvTkuZZs/1asS5+BPJaBhlKHd59DqBo+CVnj2GHlO+jYoV0gQ0acyzMaIIrO7xq9DqTURjc7/1I+VsYw/nei1+gXBW8/GC4U1L5feTV0R0I4aygltnE9JaEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObXNxFqynfn/Yh1YwQbHzX9IHCVuyPkuiBONQ0++EuI=;
 b=OUfR0IH1KcLbEICT3JbCeyKiEeTMasMihaiuqzhvaP/o/WOKEvqw6FydaQ6wIYl6y1xilCF3ix0QWQKTkPT4NktXxmpH122d8e7dJLyzFAwcJiQ8ITeiVOlekUwan+t5TdZtoL2bvDsbUvlnvtTNiV+KtOJYDW1pqMRjIWcnxv9xBsqzOlgiu682Izt63F0P//rqCu6ZKmYO31twar3ZpZJTtHUU2vRsxMpGlbSdJOs6fGE0qVVQUZ/CQwtIqvw0NSWit2IhbWxueEACY9AO4wA1LOE1+xvxhzL8CjLXSn01+Szx2OWTGQdqJjiRv9xXuZ35dwYIUNt+4j5rHjk4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 17:27:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 17:27:09 +0000
Date: Thu, 10 Jul 2025 10:28:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: Dont skip TLB invalidations on VF (rev2)
Message-ID: <aG/4VUxRaxd0tgMD@lstrano-desk.jf.intel.com>
References: <20250710045945.1023840-1-tejas.upadhyay@intel.com>
 <175213029764.149738.2636432185082133384@1538d3639d33>
 <SJ1PR11MB6204794AEECDC89B65425C848148A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SJ1PR11MB6204794AEECDC89B65425C848148A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:302:1::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 596a0fe7-9866-4e52-d03c-08ddbfd6ffb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmJabUVSRkFVemxLUFVFUHo3bFN5YjgyQzdld1VpelkwUkVtd0dkejM3aXRz?=
 =?utf-8?B?UXlSU3YvQWdBbU1TZGJiMFNhendueEVJSzJnV3hGVDZQQW01LzNiZEdoNFhJ?=
 =?utf-8?B?SVNzdXhkV2ZPKzdaeDJTRzBXT25rbnhNN2QxaUlCVnc4MFF3a3EyUk5adFI0?=
 =?utf-8?B?dGIzZ0FZU29nS3A4dGJNYS9ucTBPV1gvZ0hWMWFMbEx2RUdxekJoZzVpaitu?=
 =?utf-8?B?RFpkZ1RPNUpydFlua3l3SThEWWJ0RDJJYVlHbTJGL05tWGtXRVhid1VPcldn?=
 =?utf-8?B?aG1tMmlOWSswcWZYTHhnbXhaajdURDNiVUZLWCs4c0I5dWpmQ3lmNjJrUGhp?=
 =?utf-8?B?ZTBhcFBsMnEwdUxIeVArMDNFc1cyOC9ub3dGVERqNHpzVjZPbWN3VXdCaUZS?=
 =?utf-8?B?c25rRjVXN3Z0ZDQrY013Q2plSmtCUERSdjZObEJWcUhyTVFEWGNwVHlvdFd4?=
 =?utf-8?B?TFN3VDh0T2REQ1JkUjNYcDFOQndRcm1ySmd6Wk9VOTBBRjcyalRVNm9IL00x?=
 =?utf-8?B?NDdocVc5UGdUdHAwb1lZSnVwU1dGUGxlK3ZlTVNuSXB2dzhtZUtkV2dEVUhN?=
 =?utf-8?B?VWl4aithMEx3d2JQZENmZThocE9xem1FZVRFKzhOTmUwaktsTzl5Yko3aWRR?=
 =?utf-8?B?MWMxVkxGV1dUZlRvcitzN2pzMnBtV3czUENhZFVsNlV5NUJVOTBvR3owZTR5?=
 =?utf-8?B?bGQwVzdpayszT2xPK29EWVFZNlJCTUtnTTFtOGZwNDIvVzlOOFp3bHdsNzlu?=
 =?utf-8?B?emQrcUgreldseFcvQmlBOEgyTVU2M2hLU1hOOE1abThpQld1QUJGbWVkRTNB?=
 =?utf-8?B?UG5IUlo3aitZN0ZhRXIvek5ScytiY1ZlN0dueHY3WnVzaERqZDBHSzIyUXVE?=
 =?utf-8?B?MkhpelVKOHROckNrWFBBTW5Ia01lcFlXbEhlTUxRMjFJUFVBZE83dGFTUGRB?=
 =?utf-8?B?SGN2ZVJ6R2YvSXY3RXJvQUpOU0luaUR6aTVrNjNVTS9IT2xrV25KcE44WXNq?=
 =?utf-8?B?QTVlVXd3MDN2andra1pyZnRlMW50VUo3SDNKenp3dmh3TzJndUR3V25Sc3J1?=
 =?utf-8?B?VXNaeEJIYWsvbVpoVmpxbE9zUkJpVG13QTBtSEh6SCtUS3dSSEgxQjBIaTh5?=
 =?utf-8?B?UUt2bk55M2QzcFBzR20wVk4zK1N4MDhHaFlVVWs4K1dkL1RrelFrYmJMOC84?=
 =?utf-8?B?YXJjNy9hUFZnd3pkMGJLcnRsdE5CS2JJa0xEZjNXVTBhajJnRHdoZCs4SjVr?=
 =?utf-8?B?WW9OcU9UcmlHWXhobVE5VmNWbVVCYk5FSVkvTG5NMXVwV1lxRTN0NkpJdldy?=
 =?utf-8?B?SlcwMFp3NVdBdXp2M2hSTzJrMCswc1hzTk01V2kvcy9DYVBiVmJtbjc0ejZ3?=
 =?utf-8?B?TG5sVURDWmFFaDZCNUtKRzZmbGRuN3E3clc0RXJlQlBqWUl5TFNiZWRzNFRE?=
 =?utf-8?B?NUFzdVJ3UVd3dnBPa1FUekU5MitsYm9vYVphSUU1dEEvN2s3RGVGeUd0ZHZB?=
 =?utf-8?B?Nk8rWmo0UHkyZHI0cHlNZ1VuOTZCUEdTKzVvUzcyazNMZlR1YUN5cWI5ZG9j?=
 =?utf-8?B?aUFPckRoUVhuc3dqYm9YajMrQlhmcFhCZktlaGMvNTBtKzFEQmd4RVFzenMz?=
 =?utf-8?B?b1MvV2lQR05UV1JoRFBIUGRBMXpXQXU2b3h2UFFsMUUvYkZtdUNkVmxqekZ0?=
 =?utf-8?B?VmxzR2lrYk1nNUNCOE9wYmgrb3VUcEduZm4yaVM2ZFU1cmRYWVVlOE5YVVdG?=
 =?utf-8?B?bExoeWpUTndrK3JubFdQRlR3VWd1RjlRaGZWaDFuQitkaUZJK0JRcE9nVUNI?=
 =?utf-8?Q?35apiGHaS8q44YyPOc+0Wsj9qH6xVJjE8s/28=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTFtRGIvUVc4TmlrZGVyaFEyL1N4eEJvNUZTL1hqRDNTVGhZUW1mdTNDSVNr?=
 =?utf-8?B?Q3VsMkJPbXBiQ3VwaFBaa21MNE81bExTdHRCUy9pVEE3NXJoTklVVUI0SWx0?=
 =?utf-8?B?TmcxSTlmcHBKa2VTY3A1V0pSOFNlNC95dG9ya0dTWEdwdjlnVk5lNk40TmlQ?=
 =?utf-8?B?VmovTklTOEQrRUNRMGh4RVdOUk9SNkR1bUtWL2lvTXlSNVAycGIxQ0Frelo4?=
 =?utf-8?B?RU0zdUJzY2NZQUphU0ltdTZXTlhzVi9BK2xMbFJtdEZ1OS9iYjg1MDFYT1lG?=
 =?utf-8?B?U3d1M0toUlhIK0h3alFVTzFZbnp6d0lMd053dmNiamdzWUtJeVlQL1lPbFNF?=
 =?utf-8?B?cmt5SXM4Qmhob0pOYVlOYmpJM1BKbW1PbVpFSXh0SXpTMVA4c05zYW90b0hL?=
 =?utf-8?B?aUg2YVdzNUZGWGZEODNvdmZoRHYxeWhMQXRCU3dIckJSbzBrSVVkK0UyQzha?=
 =?utf-8?B?RWhrbWFlZUxOSWJzblpOL1gvRFBXY2U2VGx6ZzV2M2RNTVBzN1JDeVU2OWFs?=
 =?utf-8?B?NmpLMW8wWXhBOEdnY3kySEMvcm5WUC9mQkNFcHpSRjlCeFQzQkVZZFZHVTZo?=
 =?utf-8?B?czgyd1YxUEJFeWtyNnh5cXJQUG9lYy9zWUE5VjMyWjRHWnUycG9abEdGTzk1?=
 =?utf-8?B?TkFRZERGK0ZlSm1GOU5xc0pPS2NXa2N2ZlRld25NMWV5NlZUdjd4RlUvd24y?=
 =?utf-8?B?eUpua3RWSnZmam55Y0MxaVU2WGk0NHJ1d0tZTjVYMnZYTzNvMlZWaU9tSGc4?=
 =?utf-8?B?YUV3U1plWjVML0huWFBZSi9zcGp0RzJpZXRxeHdkMmMzV240SnBhUHZVUXQy?=
 =?utf-8?B?Y1BGM1lxT0xNa1FvZGFoNkF4eDhsVWE5by9meDA1bEQ0cnZYNGVLTk8weVBq?=
 =?utf-8?B?b0V6dVBBWWZLU29TRUsybFFCQkZGam03NFA4ZWNreXFLQ0dxQ3lLaFlVeDVK?=
 =?utf-8?B?MVpTdHUxSVZ1cERQZ0VqWFpwWU0wWHB1VnJSdldsdGp3THo1YU9ZcEtmdk9N?=
 =?utf-8?B?bVF0MittTlQ2cTNlZEhLa3U5TCtyNXpQd3g0Y2pXMFVsQ0VWdDBMbUdzTVI4?=
 =?utf-8?B?Tjlic3VzN0tHOUtNa1haRnVDTTFSdTVLVDhPbUdjelNQSnp4TWdNS2tWUWo0?=
 =?utf-8?B?VU5VM252VDJCeEx6ZFNCMkxIOXBTdzZiYUtyMzJoSWZxaStnMkxNZ056aEsx?=
 =?utf-8?B?SVFBaGM0Z21oNC9EQjZlZXN1cU5uRkd1VlcrTDdrSEdZZlZjMyt0ZXJ3bkRR?=
 =?utf-8?B?QTJ5cEw0ZzQ2b0I0NnNaZ1ErVzFFNTdXQThzSm90WHA2cytFUXpwUk1IK05M?=
 =?utf-8?B?VHFJNitLT2tjMHJDSGlsQ0FITkFkcjlOM09mZk5RRmJVcC9yc0ZvMWlLZDB6?=
 =?utf-8?B?VGlWRE1WRXFGK25NUlhlK2ZOa3FCbWd6ajhUM3B1cUg3ZnJXcWFyQUE0ZmRh?=
 =?utf-8?B?bWZCSGJjK3haOHMrdTNXTDJrUXFhaGZyakVhU0hUMHNrL2JNTlU0U2FGMUpl?=
 =?utf-8?B?N1VYZVdqb1FkMThjOUVCY00zeitUSmlWUS9ZdlV5YnpZVHJ3WlZyejJGVlR3?=
 =?utf-8?B?dVJlQnBPeUY1LytnQ2J1LzV0WXY1S2tzYmtZbUU5K25OaDlvSURiZVlIekFu?=
 =?utf-8?B?eDZTN0FIVU1ralp5QlBPalFNWHBLVGEvTE5KT1B2bmFFN0FaY2t0UjNSNTBM?=
 =?utf-8?B?OE5Kdk45SzFjK0piTzRaVWNVQU5WSnlLdUpFNkdpcHF1V3dXVE5XTlhyR25l?=
 =?utf-8?B?VjhCTEhDNDJNcjNScjJjTzd2djNNMnhxQjNCTTU4NTlTS1FmdXE0ejdjN2Nj?=
 =?utf-8?B?cWFxc2pWbXRtSHB5SHpVdnJIKzJLVjhHMWd5ZUlTbTN3dkFiRzB3ZzlOZG5W?=
 =?utf-8?B?K0d1ckpudXN5WTA3dEcyVEl3Y2FkbVpvOHlCbFppcVU4QXoySFBVVnQxaFA0?=
 =?utf-8?B?dWgra1I3SCtPeG40eW5wdEZ1VVpoWlZ3Sy9HT2x4Rkwzd1RJMTZLbVQxY1lF?=
 =?utf-8?B?K1pKbmdGNjRUNkU4NG9NUXNyZ0c4Tkdzck9qT3B5WGpTeEtDUzBwclYyY24v?=
 =?utf-8?B?QzBSVTZ3VzJ5Y3ppeXIyUE1kazJlUEZiRFRxK0NySEYxOHd1Um0zdDlhS0tK?=
 =?utf-8?B?elQxdldTRm92TFhMaTZ0VnBIcHBvL09PMHl2M3BkOTlQejFTN3pPcHdjVUlr?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 596a0fe7-9866-4e52-d03c-08ddbfd6ffb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 17:27:09.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEEnnkzyaffnINjA3D16aT4GkCiE/LVdabTjagm3HqUSnHm5pbCifHsq48oEdo79L3R1/l6+sl5O57QLHV9qQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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

On Thu, Jul 10, 2025 at 10:56:21AM +0000, Upadhyay, Tejas wrote:

I don't think anything here is related to the changes in this series.

I'd go ahead and merge.

Matt

>=20
>=20
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: 10 July 2025 12:22
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: =E2=9C=97 Xe.CI.Full: failure for drm/xe: Dont skip TLB invalida=
tions on VF (rev2)
>=20
> Patch Details
> Series:
> drm/xe: Dont skip TLB invalidations on VF (rev2)
> URL:
> https://patchwork.freedesktop.org/series/151319/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/index.html
> CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b=
0_FULL -> xe-pw-151319v2_FULL
> Summary
>=20
> FAILURE
>=20
> Serious unknown changes coming with xe-pw-151319v2_FULL absolutely need t=
o be
> verified manually.
>=20
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-151319v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org<mailto:I915-ci-infra@lists.freedesktop.org>) to =
allow them
> to document this new failure mode, which will reduce false positives in C=
I.
>=20
> Participating hosts (4 -> 4)
>=20
> No changes in participating hosts
>=20
> Possible new issues
>=20
> Here are the unknown changes that may have been introduced in xe-pw-15131=
9v2_FULL:
>=20
> IGT changes
> Possible regressions
>=20
>   *   igt@kms_color@deep-color:
>=20
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-8/igt@kms_color@deep-c=
olor.html> -> INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1319v2/shard-bmg-6/igt@kms_color@deep-color.html>
>=20
>   *   igt@kms_color@deep-color@pipe-a-hdmi-a-3-gamma:
>=20
>      *   shard-bmg: NOTRUN -> INCOMPLETE<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-bmg-6/igt@kms_color@deep-color@pipe-a-hdmi-a=
-3-gamma.html>
>=20
>   *   igt@kms_pipe_stress@stress-xrgb8888-untiled:
>=20
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-7/igt@kms_pipe_stress@=
stress-xrgb8888-untiled.html> -> FAIL<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-untiled=
.html>
>=20
> Regression does not belong to that changes here.  Will merge soon if no o=
bjections.
> Tejas
> New tests
>=20
> New tests have been introduced between xe-3385-7c6cc6e59baa15cc1b10fe5bba=
36219ae6d227b0_FULL and xe-pw-151319v2_FULL:
>=20
> New IGT tests (11)
>=20
>   *   igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>=20
>      *   Statuses : 1 skip(s)
>      *   Exec time: [0.00] s
>=20
>   *   igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.14] s
>=20
>   *   igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a2:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [4.23] s
>=20
>   *   igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.15] s
>=20
>   *   igt@kms_rmfb@close-fd@pipe-b-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.17] s
>=20
>   *   igt@kms_rmfb@close-fd@pipe-c-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.17] s
>=20
>   *   igt@kms_rmfb@close-fd@pipe-d-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.18] s
>=20
>   *   igt@kms_rmfb@rmfb-ioctl@pipe-a-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.16] s
>=20
>   *   igt@kms_rmfb@rmfb-ioctl@pipe-b-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.17] s
>=20
>   *   igt@kms_rmfb@rmfb-ioctl@pipe-c-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.18] s
>=20
>   *   igt@kms_rmfb@rmfb-ioctl@pipe-d-hdmi-a-1:
>=20
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.18] s
>=20
> Known issues
>=20
> Here are the changes found in xe-pw-151319v2_FULL that come from known is=
sues:
>=20
> IGT changes
> Issues hit
>=20
>   *   igt@fbdev@nullptr:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@fbdev@nul=
lptr.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2=
/shard-dg2-464/igt@fbdev@nullptr.html> (Intel XE#2134<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2134>)
>=20
>   *   igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@=
pipe-c-edp-1:
>=20
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-lnl-4/igt@kms_async_flips@=
async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html> -> FAIL<h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-lnl-2/igt@kms=
_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.ht=
ml> (Intel XE#911<https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>)=
 +3 other tests fail
>=20
>   *   igt@kms_async_flips@invalid-async-flip:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html>=
 (Intel XE#873<https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-434/igt@kms_async_flips@invalid-async-fli=
p.html> (Intel XE#873<https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
73>)
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-2/igt@kms_async_flips@invalid-async-flip.html>=
 (Intel XE#873<https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>=20
>   *   igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>=
 (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) =
+2 other tests skip
>=20
>   *   igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.htm=
l> (Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>=
 (Intel XE#2327<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-9=
0.html> (Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
16>)
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>=
 (Intel XE#1407<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>=20
>   *   igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>=20
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
85-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-9/igt@kms_big_fb@y-t=
iled-max-hw-stride-64bpp-rotate-0-hflip.html> -> DMESG-FAIL<https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-adlp-8/igt@kms_big_fb@y-til=
ed-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#4543<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543>) +10 other tests dmesg-fail
>=20
>   *   igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.htm=
l> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>=
) +9 other tests skip
>=20
>   *   igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
180.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1124>) +4 other tests skip
>=20
>   *   igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-=
rotate-180-hflip.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1124>) +2 other tests skip
>=20
>   *   igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>=20
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-1/igt@kms_bw@connected=
-linear-tiling-2-displays-1920x1080p.html> -> SKIP<https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151319v2/shard-bmg-6/igt@kms_bw@connected-linear-ti=
ling-2-displays-1920x1080p.html> (Intel XE#2314<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314> / Intel XE#2894<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2894>) +1 other test skip
>=20
>   *   igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1=
440p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/367>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x144=
0p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
367>) +3 other tests skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2560x144=
0p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
367>) +1 other test skip
>=20
>   *   igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3=
840x2160p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367>) +1 other test skip
>=20
>   *   igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ge=
n12-mc-ccs@pipe-c-hdmi-a-6.html> (Intel XE#787<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787>) +160 other tests skip
>=20
>   *   igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-c=
cs-cc.html> (Intel XE#2887<https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2887>) +4 other tests skip
>=20
>   *   igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc=
-ccs-cc@pipe-c-hdmi-a-1.html> (Intel XE#787<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787>) +11 other tests skip
>=20
>   *   igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html> (Intel XE#2907<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907>)
>=20
>   *   igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled=
-lnl-ccs@pipe-b-dp-2.html> (Intel XE#2652<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2652> / Intel XE#787<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/787>) +8 other tests skip
>=20
>   *   igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.=
html> (Intel XE#3432<https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
32>) +1 other test skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.=
html> (Intel XE#3432<https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
32>)
>=20
>   *   igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-cc=
s@pipe-d-hdmi-a-1.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787>) +7 other tests skip
>=20
>   *   igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-=
mtl-mc-ccs.html> (Intel XE#2887<https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2887>) +9 other tests skip
>=20
>   *   igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-=
4:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel XE#455<https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787>) +24 other tests skip
>=20
>   *   igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms_ccs@r=
andom-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html> -> INCOMPLETE<https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@r=
andom-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html> (Intel XE#1727<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2705<https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#3113<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel XE#4212<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel XE#4522<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522>)
>=20
>   *   igt@kms_chamelium_audio@hdmi-audio-edid:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio-edid.html=
> (Intel XE#2252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)=
 +6 other tests skip
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audio-ed=
id.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373>) +1 other test skip
>=20
>   *   igt@kms_chamelium_color@ctm-blue-to-red:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html=
> (Intel XE#2325<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>=20
>   *   igt@kms_chamelium_color@ctm-negative:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.=
html> (Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
>)
>=20
>   *   igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-1/igt@kms_chamelium_frames@hdmi-cmp-planar-f=
ormats.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373>) +1 other test skip
>=20
>   *   igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernat=
e.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73>) +2 other tests skip
>=20
>   *   igt@kms_content_protection@legacy:
>=20
>      *   shard-bmg: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@kms_content_protection@legacy.html> (Int=
el XE#1178<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +2 ot=
her tests fail
>=20
>   *   igt@kms_content_protection@legacy@pipe-a-dp-2:
>=20
>      *   shard-dg2-set2: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_content_protection@legacy@pip=
e-a-dp-2.html> (Intel XE#1178<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178>) +1 other test fail
>=20
>   *   igt@kms_content_protection@uevent@pipe-a-dp-4:
>=20
>      *   shard-dg2-set2: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_content_protection@uevent@pip=
e-a-dp-4.html> (Intel XE#1188<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188>)
>=20
>   *   igt@kms_cursor_crc@cursor-offscreen-512x170:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html> (Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/308>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.=
html> (Intel XE#2321<https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
21>)
>=20
>   *   igt@kms_cursor_crc@cursor-onscreen-32x10:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.htm=
l> (Intel XE#2320<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>=
) +1 other test skip
>=20
>   *   igt@kms_cursor_crc@cursor-random-128x42:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128x42.html=
> (Intel XE#1424<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>=20
>   *   igt@kms_cursor_crc@cursor-sliding-512x170:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512=
x170.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575>) +24 other tests skip
>=20
>   *   igt@kms_cursor_crc@cursor-sliding-64x64:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_curso=
r_crc@cursor-sliding-64x64.html> -> SKIP<https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x6=
4.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575>) +98 other tests skip
>=20
>   *   igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-at=
omic.html> (Intel XE#309<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/309>) +1 other test skip
>=20
>   *   igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>=20
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
85-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-8/igt@kms_cursor_leg=
acy@basic-flip-after-cursor-legacy.html> -> DMESG-WARN<https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151319v2/shard-adlp-8/igt@kms_cursor_legacy@bas=
ic-flip-after-cursor-legacy.html> (Intel XE#2953<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2953> / Intel XE#4173<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173>) +1 other test dmesg-warn
>=20
>   *   igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>=20
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-3/igt@kms_cursor_legac=
y@cursora-vs-flipb-varying-size.html> -> SKIP<https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151319v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-varying-size.html> (Intel XE#2291<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291>) +3 other tests skip
>=20
>   *   igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomi=
c.html> (Intel XE#2291<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2291>)
>=20
>   *   igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-s=
ize:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomi=
c-transitions-varying-size.html> (Intel XE#309<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309>) +2 other tests skip
>=20
>   *   igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transiti=
ons-varying-size:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html> (Intel XE#323<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before=
-cursor-atomic-transitions-varying-size.html> (Intel XE#2286<https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2286>) +1 other test skip
>=20
>   *   igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before=
-cursor-toggle.html> (Intel XE#323<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/323>)
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-befo=
re-cursor-toggle.html> (Intel XE#323<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/323>)
>=20
>   *   igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-6.html> (Intel XE#4494<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4494> / i915#3804<https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3804>)
>=20
>   *   igt@kms_dp_aux_dev:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-6/igt@kms_dp_aux_dev.html> (Intel XE#3009<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009>)
>=20
>   *   igt@kms_dsc@dsc-with-output-formats:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html> (I=
ntel XE#2244<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats.html> (I=
ntel XE#2244<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>=20
>   *   igt@kms_feature_discovery@psr2:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_feature_discovery@psr2.html> (Intel =
XE#2374<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>=20
>   *   igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank=
-interruptible.html> (Intel XE#310<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310>) +2 other tests skip
>=20
>   *   igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.=
html> (Intel XE#2316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16>)
>=20
>   *   igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_flip@=
2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html> -> INCOMPLETE<https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-436/igt@kms_fli=
p@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#2049<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel XE#2597<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1 other test incompl=
ete
>=20
>   *   igt@kms_flip@2x-nonexisting-fb:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb.html> (Intel =
XE#1421<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other=
 tests skip
>=20
>   *   igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>=20
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-4/igt@kms_flip@2x-sing=
le-buffer-flip-vs-dpms-off-vs-modeset.html> -> SKIP<https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset.html> (Intel XE#2316<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316>) +4 other tests skip
>=20
>   *   igt@kms_flip@flip-vs-rmfb:
>=20
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
85-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-8/igt@kms_flip@flip-=
vs-rmfb.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html> (Intel XE#4543<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> / Intel XE#5208<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>=20
>   *   igt@kms_flip@flip-vs-suspend-interruptible:
>=20
>      *   shard-adlp: NOTRUN -> DMESG-WARN<https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151319v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interru=
ptible.html> (Intel XE#4543<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4543>) +3 other tests dmesg-warn
>=20
>   *   igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
>=20
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
85-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-1/igt@kms_flip@plain=
-flip-interruptible@b-hdmi-a1.html> -> DMESG-WARN<https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151319v2/shard-adlp-6/igt@kms_flip@plain-flip-interr=
uptible@b-hdmi-a1.html> (Intel XE#4543<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543>) +11 other tests dmesg-warn
>=20
>   *   igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling=
:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_flip_=
scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html> -> SKIP<https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html> (Intel XE#2=
351<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#42=
08<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other test=
s skip
>=20
>   *   igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling=
:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to=
-16bpp-yftile-upscaling.html> (Intel XE#2293<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293> / Intel XE#2380<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2380>) +2 other tests skip
>=20
>   *   igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscali=
ng@pipe-a-valid-mode:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to=
-32bpp-yftile-downscaling@pipe-a-valid-mode.html> (Intel XE#2293<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293>) +2 other tests skip
>=20
>   *   igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling=
@pipe-a-valid-mode:
>=20
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
85-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-8/igt@kms_flip_scale=
d_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> -=
> DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard=
-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling=
@pipe-a-valid-mode.html> (Intel XE#4543<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543> / Intel XE#4921<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4921>) +3 other tests dmesg-fail
>=20
>   *   igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling=
:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-downscaling.html> (Intel XE#455<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455>) +9 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-=
primscrn-indfb-plflip-blt.html> (Intel XE#2351<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351> / Intel XE#4208<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208>) +7 other tests skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscr=
n-indfb-plflip-blt.html> (Intel XE#651<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651>) +2 other tests skip
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-prims=
crn-indfb-plflip-blt.html> (Intel XE#651<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651>) +1 other test skip
>=20
>   *   igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-prims=
crn-indfb-pgflip-blt.html> (Intel XE#656<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656>) +8 other tests skip
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscr=
n-indfb-pgflip-blt.html> (Intel XE#2311<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311>) +15 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc=
:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn=
-cur-indfb-draw-mmap-wc.html> (Intel XE#2312<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312>) +8 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-modesetfrom=
busy.html> (Intel XE#5390<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5390>) +4 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.=
html> (Intel XE#656<https://gitlab.freedesktop.org/drm/xe/kernel/issues/656=
>) +7 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt=
:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-scndscrn-cur-indfb-draw-blt.html> (Intel XE#651<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651>) +12 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tilin=
g-4.html> (Intel XE#1151<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1151>)
>=20
>   *   igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnds=
crn-shrfb-plflip-blt.html> (Intel XE#2313<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313>) +15 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.ht=
ml> (Intel XE#5426<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5426=
>)
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.=
html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
>) +2 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-offscr=
en-pri-shrfb-draw-blt.html> (Intel XE#653<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653>) +1 other test skip
>=20
>   *   igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-move.html> (Intel XE#653<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653>) +11 other tests skip
>=20
>   *   igt@kms_joiner@invalid-modeset-big-joiner:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.ht=
ml> (Intel XE#346<https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>=20
>   *   igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-=
1.html> (Intel XE#599<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
99>) +4 other tests skip
>=20
>   *   igt@kms_plane_lowres@tiling-yf:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html> (Intel =
XE#2393<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>=20
>   *   igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
>=20
>      *   shard-lnl: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-1/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1=
.html> (Intel XE#4658<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
658>) +3 other tests fail
>=20
>   *   igt@kms_plane_multiple@tiling-yf:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html> (Inte=
l XE#5020<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>=20
>   *   igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pip=
e-b:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-d=
ownscale-factor-0-5@pipe-b.html> (Intel XE#2763<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2763>) +4 other tests skip
>=20
>   *   igt@kms_pm_backlight@fade-with-dpms:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html> (I=
ntel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>=20
>   *   igt@kms_pm_dc@dc5-retention-flops:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html> (Int=
el XE#3309<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>=20
>   *   igt@kms_pm_dc@dc6-dpms:
>=20
>      *   shard-lnl: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-lnl-4/igt@kms_pm_dc@dc6-dp=
ms.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/s=
hard-lnl-6/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#718<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/718>) +1 other test fail
>=20
>   *   igt@kms_pm_dc@deep-pkgc:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-6/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#20=
07<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2505=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505>)
>      *   shard-lnl: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2029=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>)
>=20
>   *   igt@kms_pm_lpsp@kms-lpsp:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html> (Intel XE#249=
9<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>)
>=20
>   *   igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html> (I=
ntel XE#1439<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / In=
tel XE#836<https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>=20
>   *   igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-=
wait.html> (Intel XE#836<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/836>)
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wa=
it.html> (Intel XE#1439<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1439> / Intel XE#3141<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3141>)
>=20
>   *   igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-co=
ntinuous-exceed-sf.html> (Intel XE#2893<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893>)
>=20
>   *   igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-=
continuous-sf.html> (Intel XE#1489<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489>) +4 other tests skip
>=20
>   *   igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-=
sf:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html> (Intel XE#1489<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
>=20
>   *   igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-ed=
p-1:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-=
continuous-sf@pipe-a-edp-1.html> (Intel XE#4608<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4608>)
>=20
>   *   igt@kms_psr2_su@page_flip-p010:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html> (Inte=
l XE#1122<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html> (Intel =
XE#2387<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html> (Intel =
XE#1128<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>=20
>   *   igt@kms_psr@fbc-psr-cursor-plane-move:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-3/igt@kms_psr@fbc-psr-cursor-plane-move.html=
> (Intel XE#2850<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> =
/ Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1=
 other test skip
>=20
>   *   igt@kms_psr@fbc-psr2-suspend:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-8/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE=
#2234<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#=
2850<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +7 other te=
sts skip
>=20
>   *   igt@kms_psr@pr-sprite-blt:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html> (Inte=
l XE#2850<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel=
 XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5 other =
tests skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html> (Intel XE#14=
06<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>=20
>   *   igt@kms_rotation_crc@primary-rotation-90:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation=
-90.html> (Intel XE#3414<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414>)
>=20
>   *   igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>=20
>      *   shard-lnl: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect=
-x-180.html> (Intel XE#4689<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4689>)
>=20
>   *   igt@kms_rotation_crc@sprite-rotation-270:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-270.htm=
l> (Intel XE#3414<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>=
 / Intel XE#3904<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>=20
>   *   igt@kms_scaling_modes@scaling-mode-full:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html=
> (Intel XE#2413<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>=20
>   *   igt@xe_eudebug@sysfs-toggle:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@xe_eudebug@sysfs-toggle.html> (In=
tel XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +6 o=
ther tests skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-1/igt@xe_eudebug@sysfs-toggle.html> (Intel XE#=
4837<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3 other te=
sts skip
>=20
>   *   igt@xe_eudebug_online@single-step:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@xe_eudebug_online@single-step.html> (Int=
el XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +8 ot=
her tests skip
>=20
>   *   igt@xe_eudebug_online@single-step-one:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@xe_eudebug_online@single-step-one.html=
> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)=
 +2 other tests skip
>=20
>   *   igt@xe_eudebug_sriov@deny-sriov:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html> (Intel=
 XE#4518<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>=20
>   *   igt@xe_evict@evict-large-external-cm:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-4/igt@xe_evict@evict-large-external-cm.html> (=
Intel XE#688<https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 o=
ther test skip
>=20
>   *   igt@xe_evict@evict-small-cm:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-1/igt@xe_evict@evict-small-cm.html> (Intel X=
E#261<https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#6=
88<https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test =
skip
>=20
>   *   igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@xe_exec_b=
asic@multigpu-no-exec-bindexecqueue-userptr-rebind.html> -> SKIP<https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@xe_exec_ba=
sic@multigpu-no-exec-bindexecqueue-userptr-rebind.html> (Intel XE#1392<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>=20
>   *   igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic-defe=
r-bind.html> (Intel XE#1392<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392>)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-=
bind.html> (Intel XE#2322<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2322>) +4 other tests skip
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basic-defer-=
bind.html> (Intel XE#1392<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392>)
>=20
>   *   igt@xe_exec_basic@once-userptr-invalidate-race:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@xe_exec_b=
asic@once-userptr-invalidate-race.html> -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_exec_basic@once-userptr-=
invalidate-race.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208>) +201 other tests skip
>=20
>   *   igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-=
userptr-invalidate-race.html> (Intel XE#288<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288>) +5 other tests skip
>=20
>   *   igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-=
invalidate-race.html> (Intel XE#288<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/288>) +10 other tests skip
>=20
>   *   igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-bat=
ch-store-lr.html> (Intel XE#2360<https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2360>)
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-9/igt@xe_exec_mix_modes@exec-simple-batch-st=
ore-lr.html> (Intel XE#2360<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2360>)
>=20
>   *   igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-433/igt@xe_exec_system_allocator@many-exe=
cqueues-mmap-new-huge.html> (Intel XE#4915<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915>) +103 other tests skip
>=20
>   *   igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-2/igt@xe_exec_system_allocator@once-large-mmap=
-free-huge-nomemset.html> (Intel XE#4943<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4943>) +9 other tests skip
>=20
>   *   igt@xe_exec_system_allocator@process-many-execqueues-mmap-mlock-nom=
emset:
>=20
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@xe_exec_system_a=
llocator@process-many-execqueues-mmap-mlock-nomemset.html> -> ABORT<https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-7/igt@xe_exec_s=
ystem_allocator@process-many-execqueues-mmap-mlock-nomemset.html> (Intel XE=
#3970<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970>)
>=20
>   *   igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-1/igt@xe_exec_system_allocator@process-many-=
stride-new-race-nomemset.html> (Intel XE#4915<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4915>) +51 other tests skip
>=20
>   *   igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nom=
emset:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-=
shared-vm-many-mmap-shared-nomemset.html> (Intel XE#4208<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208>) +110 other tests skip
>=20
>   *   igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-fre=
e-huge:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-=
vm-many-stride-mmap-free-huge.html> (Intel XE#4943<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943>) +21 other tests skip
>=20
>   *   igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>=20
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@xe_exec_t=
hreads@threads-hang-fd-userptr-rebind.html> -> DMESG-WARN<https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@xe_exec_threads@t=
hreads-hang-fd-userptr-rebind.html> (Intel XE#3876<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3876>)
>=20
>   *   igt@xe_module_load@reload:
>=20
>      *   shard-dg2-set2: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_module_load@reload.html> (Inte=
l XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@xe_oa@invalid-create-userspace-config:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@xe_oa@invalid-create-userspace-co=
nfig.html> (Intel XE#2541<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541> / Intel XE#3573<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3573>) +1 other test skip
>=20
>   *   igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
>=20
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-adlp-3/igt@xe_oa@oa-unit-concurrent-oa-buffer-rea=
d.html> (Intel XE#2541<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541> / Intel XE#3573<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
573>) +1 other test skip
>=20
>   *   igt@xe_peer2peer@read:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@xe_peer2peer@read.html> (Intel XE#2427<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>=20
>   *   igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>=20
>      *   shard-dg2-set2: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram0=
1-gpub-system-p2p.html> (Intel XE#1173<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173>) +2 other tests fail
>=20
>   *   igt@xe_pm@d3cold-basic-exec:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-3/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#=
2284<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>=20
>   *   igt@xe_pm_residency@cpg-basic:
>=20
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html> (Intel X=
E#584<https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>=20
>   *   igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-ter=
mination-irq.html> (Intel XE#4733<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733>)
>=20
>   *   igt@xe_query@multigpu-query-invalid-cs-cycles:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-463/igt@xe_query@multigpu-query-invalid-c=
s-cycles.html> (Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944>)
>=20
>   *   igt@xe_query@multigpu-query-invalid-size:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.htm=
l> (Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>=20
>   *   igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-432/igt@xe_sriov_auto_provisioning@resour=
ces-released-on-vfs-disabling.html> (Intel XE#4130<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4130>)
>=20
>   *   igt@xe_sriov_flr@flr-twice:
>=20
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html> (Intel XE#4=
273<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>=20
>   *   igt@xe_sriov_scheduling@equal-throughput:
>=20
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-433/igt@xe_sriov_scheduling@equal-through=
put.html> (Intel XE#4351<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4351>)
>      *   shard-lnl: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput.htm=
l> (Intel XE#4351<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>=
)
>      *   shard-bmg: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.htm=
l> (Intel XE#4351<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>=
)
>=20
> Possible fixes
>=20
>   *   igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@intel_sys=
fs_debugfs@xe-debugfs-read-all-entries-display-on.html> (Intel XE#4208<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / Intel XE#4618<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4618>) -> PASS<https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@intel_sysfs_d=
ebugfs@xe-debugfs-read-all-entries-display-on.html> +1 other test pass
>=20
>   *   igt@kms_atomic@plane-overlay-legacy:
>=20
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-1/igt@kms_atom=
ic@plane-overlay-legacy.html> (Intel XE#2953<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953> / Intel XE#4173<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151319v2/shard-adlp-9/igt@kms_atomic@plane-overlay-legacy.html> +5=
 other tests pass
>=20
>   *   igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_atomi=
c_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#4208<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS<https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-463/igt@kms_atomic_=
transition@modeset-transition-nonblocking-fencing.html> +97 other tests pas=
s
>=20
>   *   igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>=20
>      *   shard-adlp: DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-2/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#4543<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> PASS<https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-adlp-6/igt@kms_big_fb=
@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> +4 other tests pas=
s
>=20
>   *   igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_bw@connected=
-linear-tiling-2-displays-2560x1440p.html> (Intel XE#2314<https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2314> / Intel XE#2894<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2894>) -> PASS<https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_bw@connected-linear-tili=
ng-2-displays-2560x1440p.html>
>=20
>   *   igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>=20
>      *   shard-dg2-set2: INCOMPLETE<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1727<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3113<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel XE#3124<https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3124>) -> PASS<https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-rc-ccs-cc.html>
>=20
>   *   igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>=20
>      *   shard-dg2-set2: INCOMPLETE<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#1727=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3124<=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) -> PASS<https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html>
>=20
>   *   igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>=20
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#=
1727<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3=
113<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS<http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>=20
>   *   igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-5/igt@kms_cursor_legac=
y@2x-nonblocking-modeset-vs-cursor-atomic.html> (Intel XE#2291<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS<https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_cursor_legacy@2x-n=
onblocking-modeset-vs-cursor-atomic.html> +1 other test pass
>=20
>   *   igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-s=
ize:
>=20
>      *   shard-bmg: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-4/igt@kms_cursor=
_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#53=
54<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>) -> PASS<https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>=20
>   *   igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>=20
>      *   shard-bmg: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-5/igt@kms_cursor_legac=
y@flip-vs-cursor-atomic-transitions.html> (Intel XE#1475<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1475>) -> PASS<https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cu=
rsor-atomic-transitions.html>
>=20
>   *   igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>=20
>      *   shard-bmg: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-4/igt@kms_cursor_legac=
y@flip-vs-cursor-legacy.html> (Intel XE#4633<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4633>) -> PASS<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.=
html>
>=20
>   *   igt@kms_dp_link_training@non-uhbr-sst:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_dp_link_trai=
ning@non-uhbr-sst.html> (Intel XE#4354<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4354>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151319v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html>
>=20
>   *   igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_flip@2x-flip=
-vs-dpms-on-nop-interruptible.html> (Intel XE#2316<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316>) -> PASS<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-in=
terruptible.html> +8 other tests pass
>=20
>   *   igt@kms_flip@flip-vs-rmfb-interruptible:
>=20
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-8/igt@kms_flip=
@flip-vs-rmfb-interruptible.html> (Intel XE#4543<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543> / Intel XE#5208<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5208>) -> PASS<https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151319v2/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.=
html>
>=20
>   *   igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>=20
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-2/igt@kms_flip=
@flip-vs-suspend@b-hdmi-a1.html> (Intel XE#4543<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543>) -> PASS<https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151319v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.h=
tml> +20 other tests pass
>=20
>   *   igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_front=
buffer_tracking@fbc-2p-primscrn-cur-indfb-move.html> (Intel XE#2351<https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> PASS<https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-cur-indfb-move.html> +15 other tests pass
>=20
>   *   igt@kms_hdr@static-toggle-dpms:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_hdr@static-t=
oggle-dpms.html> (Intel XE#1503<https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1503>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
319v2/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html>
>=20
>   *   igt@kms_plane_multiple@2x-tiling-x:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_plane_multip=
le@2x-tiling-x.html> (Intel XE#4596<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html>
>=20
>   *   igt@kms_pm_dc@dc6-dpms:
>=20
>      *   shard-adlp: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
85-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-adlp-8/igt@kms_pm_dc@dc6-=
dpms.html> (Intel XE#718<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/718>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/sh=
ard-adlp-8/igt@kms_pm_dc@dc6-dpms.html>
>=20
>   *   igt@kms_pm_dc@dc6-psr:
>=20
>      *   shard-lnl: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-lnl-7/igt@kms_pm_dc@dc6-ps=
r.html> (Intel XE#718<https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
18>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard=
-lnl-5/igt@kms_pm_dc@dc6-psr.html> +1 other test pass
>=20
>   *   igt@kms_vblank@ts-continuation-dpms-suspend:
>=20
>      *   shard-bmg: INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_vblank=
@ts-continuation-dpms-suspend.html> (Intel XE#4488<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4488>) -> PASS<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-su=
spend.html> +1 other test pass
>=20
>   *   igt@kms_vrr@negative-basic:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_vrr@negative=
-basic.html> (Intel XE#1499<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1499>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v=
2/shard-bmg-3/igt@kms_vrr@negative-basic.html>
>=20
>   *   igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-no-exec-null-defer-mmap.html> (Intel XE#1392<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392>) -> PASS<https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151319v2/shard-dg2-463/igt@xe_exec_basic@multigpu-n=
o-exec-null-defer-mmap.html> +4 other tests pass
>=20
>   *   igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_fault_=
injection@vm-create-fail-xe_exec_queue_create_bind.html> (Intel XE#4208<htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> PASS<https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@xe_fault_in=
jection@vm-create-fail-xe_exec_queue_create_bind.html> +226 other tests pas=
s
>=20
>   *   igt@xe_module_load@reload-no-display:
>=20
>      *   shard-dg2-set2: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_module=
_load@reload-no-display.html> (Intel XE#4208<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208>) -> PASS<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-dg2-463/igt@xe_module_load@reload-no-display.html>
>=20
> Warnings
>=20
>   *   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_addfb=
_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#4208<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html> (Intel XE#623<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/623>)
>=20
>   *   igt@kms_async_flips@invalid-async-flip-atomic:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_async=
_flips@invalid-async-flip-atomic.html> (Intel XE#4208<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_async_flips@invalid-async-=
flip-atomic.html> (Intel XE#3768<https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3768>)
>=20
>   *   igt@kms_big_fb@linear-32bpp-rotate-270:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_big_f=
b@linear-32bpp-rotate-270.html> (Intel XE#4208<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.h=
tml> (Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>=
) +3 other tests skip
>=20
>   *   igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_big_f=
b@x-tiled-16bpp-rotate-90.html> (Intel XE#316<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/316>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.htm=
l> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>=
)
>=20
>   *   igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@kms_big_f=
b@x-tiled-8bpp-rotate-90.html> (Intel XE#316<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/316>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151319v2/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>=
 (Intel XE#2351<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /=
 Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +=
1 other test skip
>=20
>   *   igt@kms_big_fb@y-tiled-addfb:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_big_f=
b@y-tiled-addfb.html> (Intel XE#2351<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351> / Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>=20
>   *   igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_big_f=
b@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#2351<https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_big_fb@y-tiled=
-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124>) +3 other tests skip
>=20
>   *   igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms_big_f=
b@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#1124<https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP<https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_big_fb@y-ti=
led-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#4208<https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208>) +5 other tests skip
>=20
>   *   igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_big_f=
b@yf-tiled-32bpp-rotate-180.html> (Intel XE#4208<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151319v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-1=
80.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124>) +8 other tests skip
>=20
>   *   igt@kms_big_fb@yf-tiled-addfb:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_big_f=
b@yf-tiled-addfb.html> (Intel XE#619<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/619>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#2351<=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms_big_f=
b@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1124<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP<https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_big_f=
b@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#2351<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other tests ski=
p
>=20
>   *   igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_bw@co=
nnected-linear-tiling-4-displays-2560x1440p.html> (Intel XE#2191<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP<https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_bw@connected-l=
inear-tiling-4-displays-2560x1440p.html> (Intel XE#4208<https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575>)
>=20
>   *   igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_bw@co=
nnected-linear-tiling-4-displays-3840x2160p.html> (Intel XE#4208<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_bw@connected-li=
near-tiling-4-displays-3840x2160p.html> (Intel XE#2191<https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2191>)
>=20
>   *   igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_bw@li=
near-tiling-1-displays-3840x2160p.html> (Intel XE#367<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/367>) -> SKIP<https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_bw@linear-tiling-1-display=
s-3840x2160p.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575>)
>=20
>   *   igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_bw@li=
near-tiling-3-displays-2560x1440p.html> (Intel XE#4208<https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151319v2/shard-dg2-434/igt@kms_bw@linear-tiling-3-displa=
ys-2560x1440p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367>) +1 other test skip
>=20
>   *   igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_ccs@b=
ad-rotation-90-4-tiled-bmg-ccs.html> (Intel XE#4208<https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled=
-bmg-ccs.html> (Intel XE#2907<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2907>) +2 other tests skip
>=20
>   *   igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_ccs@b=
ad-rotation-90-y-tiled-gen12-rc-ccs.html> (Intel XE#455<https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs.html> (Intel XE#2351<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351> / Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208>) +4 other tests skip
>=20
>   *   igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-lnl-ccs.html> (Intel XE#4208<https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html> (Intel XE#3442<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3442>)
>=20
>   *   igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@kms_ccs@c=
rc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html> (Intel XE#455<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_ccs@crc-sprite-plan=
es-basic-y-tiled-gen12-mc-ccs.html> (Intel XE#4208<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208>) +9 other tests skip
>=20
>   *   igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_ccs@m=
issing-ccs-buffer-y-tiled-gen12-mc-ccs.html> (Intel XE#2351<https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buff=
er-y-tiled-gen12-mc-ccs.html> (Intel XE#455<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787>) +1 other test skip
>=20
>   *   igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>=20
>      *   shard-dg2-set2: INCOMPLETE<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1727<https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2705<https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#4212<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4212> / Intel XE#4345<https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345> / Intel XE#4522<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4522>) -> INCOMPLETE<https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@random-ccs-d=
ata-4-tiled-dg2-mc-ccs.html> (Intel XE#1727<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727> / Intel XE#2705<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705> / Intel XE#3113<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113> / Intel XE#4212<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4212> / Intel XE#4345<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4345> / Intel XE#4522<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522>)
>=20
>   *   igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_ccs@r=
andom-ccs-data-4-tiled-mtl-mc-ccs.html> (Intel XE#4208<https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-ti=
led-mtl-mc-ccs.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/787>) +11 other tests skip
>=20
>   *   igt@kms_cdclk@mode-transition-all-outputs:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_cdclk=
@mode-transition-all-outputs.html> (Intel XE#4418<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4418>) -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-out=
puts.html> (Intel XE#2351<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351> / Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208>)
>=20
>   *   igt@kms_chamelium_color@ctm-0-75:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_chame=
lium_color@ctm-0-75.html> (Intel XE#306<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/306>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151319v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE=
#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575=
<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +2 other te=
sts skip
>=20
>   *   igt@kms_chamelium_color@ctm-limited-range:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_chame=
lium_color@ctm-limited-range.html> (Intel XE#4208<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151319v2/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-ra=
nge.html> (Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306>) +1 other test skip
>=20
>   *   igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_chame=
lium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel XE#4208<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373>) +15 other tests skip
>=20
>   *   igt@kms_chamelium_hpd@vga-hpd:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@kms_chame=
lium_hpd@vga-hpd.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#4208<=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +13 other tests s=
kip
>=20
>   *   igt@kms_content_protection@atomic:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_content_prot=
ection@atomic.html> (Intel XE#2341<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2341>) -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151319v2/shard-bmg-2/igt@kms_content_protection@atomic.html> (Intel XE#1178=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_conte=
nt_protection@atomic.html> (Intel XE#4208<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575>) -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151319v2/shard-dg2-434/igt@kms_content_protection@atomic.html> (Intel=
 XE#1178<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>=20
>   *   igt@kms_content_protection@dp-mst-lic-type-0:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_conte=
nt_protection@dp-mst-lic-type-0.html> (Intel XE#307<https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/307>) -> SKIP<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_content_protection@dp-mst-li=
c-type-0.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575>)
>=20
>   *   igt@kms_content_protection@lic-type-0:
>=20
>      *   shard-dg2-set2: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_conte=
nt_protection@lic-type-0.html> (Intel XE#1178<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178>) -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_content_protection@lic-type-0.htm=
l> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>=
 / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>      *   shard-bmg: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-7/igt@kms_content_prot=
ection@lic-type-0.html> (Intel XE#1178<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151319v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html> (Intel=
 XE#2341<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>=20
>   *   igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_curso=
r_crc@cursor-rapid-movement-512x512.html> (Intel XE#4208<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid=
-movement-512x512.html> (Intel XE#308<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308>) +2 other tests skip
>=20
>   *   igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html> (Intel XE#455<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151319v2/shard-dg2-464/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (Intel =
XE#2351<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel X=
E#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1 other =
test skip
>=20
>   *   igt@kms_dp_linktrain_fallback@dsc-fallback:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_dp_li=
nktrain_fallback@dsc-fallback.html> (Intel XE#4331<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4331>) -> SKIP<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208>)
>=20
>   *   igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_fbc_d=
irty_rect@fbc-dirty-rectangle-dirtyfb-tests.html> (Intel XE#4208<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_fbc_dirty_rect=
@fbc-dirty-rectangle-dirtyfb-tests.html> (Intel XE#4422<https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422>)
>=20
>   *   igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@kms_fbc_d=
irty_rect@fbc-dirty-rectangle-out-visible-area.html> (Intel XE#4422<https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4422>) -> SKIP<https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_fbc_dirty_r=
ect@fbc-dirty-rectangle-out-visible-area.html> (Intel XE#4208<https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@kms_feature_discovery@chamelium:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_featu=
re_discovery@chamelium.html> (Intel XE#701<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/701>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151319v2/shard-dg2-464/igt@kms_feature_discovery@chamelium.html> (In=
tel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i91=
5#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>=20
>   *   igt@kms_feature_discovery@dp-mst:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_featu=
re_discovery@dp-mst.html> (Intel XE#1137<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1137>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151319v2/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html> (Intel =
XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#25=
75<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>=20
>   *   igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscal=
ing:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_flip_=
scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html> (Intel XE#4=
208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_=
flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html> (Intel=
 XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other =
tests skip
>=20
>   *   igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscali=
ng:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_flip_=
scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html> (Intel XE#23=
51<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#420=
8<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html> (Intel XE=
#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other tes=
t skip
>=20
>   *   igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-u=
pscaling:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@kms_flip_=
scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel=
 XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP<h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html=
> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)=
 +4 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_front=
buffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#2351<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-434/igt@kms_frontbuffe=
r_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_frontbuffer_=
tracking@drrs-2p-pri-indfb-multidraw.html> (Intel XE#2312<https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP<https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151319v2/shard-bmg-3/igt@kms_frontbuffer_tracking@dr=
rs-2p-pri-indfb-multidraw.html> (Intel XE#2311<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311>) +13 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_front=
buffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html> (Intel XE#651<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP<https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html> (Intel XE#4208<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208>) +19 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc=
:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-7/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#5390<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) -> SKIP<https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#2312<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +7 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-5/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-onoff.html> (Intel XE#2312<https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP<https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-spr-indfb-onoff.html> (Intel XE#5390<https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390>) +5 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbc-tiling-y:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@kms_front=
buffer_tracking@fbc-tiling-y.html> (Intel XE#658<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/658>) -> SKIP<https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling=
-y.html> (Intel XE#2351<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351> / Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208>)
>=20
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#2311<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP<https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#2312<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312>) +16 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mma=
p-wc:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_front=
buffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#=
4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-463/igt@kms=
_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Int=
el XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +25 oth=
er tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_front=
buffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#651<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP<https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#2351<htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +7 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html> (Intel XE#2312<https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP<https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html> (Intel XE#2313<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +15 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_front=
buffer_tracking@fbcpsr-tiling-linear.html> (Intel XE#4208<https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_frontbuffer_tracking@=
fbcpsr-tiling-linear.html> (Intel XE#653<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653>) +28 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@plane-fbc-rte:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_front=
buffer_tracking@plane-fbc-rte.html> (Intel XE#4208<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html> (Intel XE#1158<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1158>)
>=20
>   *   igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_front=
buffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#2351<https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#653<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653>) +8 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@kms_front=
buffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html> (Intel XE#653<https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP<https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-shrfb-plflip-blt.html> (Intel XE#4208<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208>) +23 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-1/igt@kms_frontbuffer_=
tracking@psr-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#2313<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP<https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#2312<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312>) +13 other tests skip
>=20
>   *   igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms_front=
buffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#653<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP<https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_frontb=
uffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#2351<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +9 other tests ski=
p
>=20
>   *   igt@kms_hdr@invalid-hdr:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_hdr@i=
nvalid-hdr.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15131=
9v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html> (Intel XE#4208<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575>) +4 other tests skip
>=20
>   *   igt@kms_joiner@basic-big-joiner:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_joine=
r@basic-big-joiner.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151319v2/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html> (Intel XE=
#346<https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>=20
>   *   igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_joine=
r@switch-modeset-ultra-joiner-big-joiner.html> (Intel XE#2925<https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2925>) -> SKIP<https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_joiner@switch-mod=
eset-ultra-joiner-big-joiner.html> (Intel XE#4208<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_multi=
pipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#4208<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151319v2/shard-dg2-433/igt@kms_multipipe_modeset@bas=
ic-max-pipe-crc-check.html> (Intel XE#356<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/356>)
>=20
>   *   igt@kms_plane_cursor@primary:
>=20
>      *   shard-dg2-set2: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_plane=
_cursor@primary.html> (Intel XE#616<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/616>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151319v2/shard-dg2-464/igt@kms_plane_cursor@primary.html> (Intel XE#4208<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>=20
>   *   igt@kms_plane_multiple@2x-tiling-y:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-5/igt@kms_plane_multip=
le@2x-tiling-y.html> (Intel XE#4596<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html> (Intel XE#50=
21<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_plane=
_multiple@2x-tiling-y.html> (Intel XE#4208<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151319v2/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html> (Int=
el XE#5021<https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>=20
>   *   igt@kms_plane_multiple@2x-tiling-yf:
>=20
>      *   shard-bmg: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
5-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-bmg-1/igt@kms_plane_multip=
le@2x-tiling-yf.html> (Intel XE#5021<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5021>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151319v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html> (Intel XE#=
4596<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>=20
>   *   igt@kms_plane_multiple@tiling-yf:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms_plane=
_multiple@tiling-yf.html> (Intel XE#5020<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5020>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151319v2/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html> (Intel =
XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#25=
75<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>=20
>   *   igt@kms_pm_backlight@basic-brightness:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_pm_ba=
cklight@basic-brightness.html> (Intel XE#4208<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.htm=
l> (Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>=20
>   *   igt@kms_pm_backlight@brightness-with-dpms:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_pm_ba=
cklight@brightness-with-dpms.html> (Intel XE#4208<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-466/igt@kms_pm_backlight@brightness-with-=
dpms.html> (Intel XE#2938<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2938>)
>=20
>   *   igt@kms_pm_backlight@fade:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_pm_ba=
cklight@fade.html> (Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/870>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
319v2/shard-dg2-464/igt@kms_pm_backlight@fade.html> (Intel XE#4208<https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1 other test skip
>=20
>   *   igt@kms_pm_dc@dc3co-vpb-simulation:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_pm_dc=
@dc3co-vpb-simulation.html> (Intel XE#1122<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1122>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151319v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html> (In=
tel XE#2351<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Int=
el XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@kms_pm_dc@dc5-psr:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_pm_dc=
@dc5-psr.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15131=
9v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129<https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1129>)
>=20
>   *   igt@kms_pm_dc@dc6-dpms:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_pm_dc=
@dc6-dpms.html> (Intel XE#2351<https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351> / Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15131=
9v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908<https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/908>)
>=20
>   *   igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_psr2_=
sf@fbc-pr-plane-move-sf-dmg-area.html> (Intel XE#4208<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html> (Intel XE#1489<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1489>) +7 other tests skip
>=20
>   *   igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@kms_psr2_=
sf@psr2-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP<https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_psr2_sf@psr2-ov=
erlay-primary-update-sf-dmg-area.html> (Intel XE#4208<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208>) +7 other tests skip
>=20
>   *   igt@kms_psr2_su@frontbuffer-xrgb8888:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_psr2_=
su@frontbuffer-xrgb8888.html> (Intel XE#1122<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1122>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html>=
 (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@kms_psr2_su@page_flip-xrgb8888:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_psr2_=
su@page_flip-xrgb8888.html> (Intel XE#4208<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151319v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html> (In=
tel XE#1122<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>=20
>   *   igt@kms_psr@fbc-pr-cursor-blt:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@kms_psr@f=
bc-pr-cursor-blt.html> (Intel XE#2850<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850> / Intel XE#929<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151319v2/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html> (Intel XE#2351<h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +5 other tests ski=
p
>=20
>   *   igt@kms_psr@fbc-psr-sprite-plane-move:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_psr@f=
bc-psr-sprite-plane-move.html> (Intel XE#2351<https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351> / Intel XE#4208<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151319v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html=
> (Intel XE#2850<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> =
/ Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2=
 other tests skip
>=20
>   *   igt@kms_psr@fbc-psr-sprite-render:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_psr@f=
bc-psr-sprite-render.html> (Intel XE#4208<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151319v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html> (Inte=
l XE#2850<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel=
 XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14 other=
 tests skip
>=20
>   *   igt@kms_psr@fbc-psr2-primary-render:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@kms_psr@f=
bc-psr2-primary-render.html> (Intel XE#2850<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850> / Intel XE#929<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151319v2/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html> (Int=
el XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 ot=
her tests skip
>=20
>   *   igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_psr_s=
tress_test@flip-primary-invalidate-overlay.html> (Intel XE#2351<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#4208<https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-463/igt@kms_psr_stress_test@=
flip-primary-invalidate-overlay.html> (Intel XE#2939<https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2939>)
>=20
>   *   igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@kms_psr_s=
tress_test@invalidate-primary-flip-overlay.html> (Intel XE#2939<https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2939>) -> SKIP<https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_psr_stress_test=
@invalidate-primary-flip-overlay.html> (Intel XE#4208<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@kms_rotat=
ion_crc@primary-y-tiled-reflect-x-180.html> (Intel XE#1127<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1127>) -> SKIP<https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_rotation_crc@primary=
-y-tiled-reflect-x-180.html> (Intel XE#4208<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575>)
>=20
>   *   igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@kms_rotat=
ion_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#3414<https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3414>) -> SKIP<https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@kms_rotation_crc@primary-=
y-tiled-reflect-x-90.html> (Intel XE#4208<https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575>) +2 other tests skip
>=20
>   *   igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_rotat=
ion_crc@primary-yf-tiled-reflect-x-270.html> (Intel XE#4208<https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151319v2/shard-dg2-436/igt@kms_rotation_crc@primary=
-yf-tiled-reflect-x-270.html> (Intel XE#3414<https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414>)
>=20
>   *   igt@kms_vrr@cmrr:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_vrr@c=
mrr.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/sh=
ard-dg2-466/igt@kms_vrr@cmrr.html> (Intel XE#2168<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2168>)
>=20
>   *   igt@kms_vrr@flip-dpms:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@kms_vrr@f=
lip-dpms.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319=
v2/shard-dg2-434/igt@kms_vrr@flip-dpms.html> (Intel XE#455<https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455>) +8 other tests skip
>=20
>   *   igt@sriov_basic@enable-vfs-autoprobe-off:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@sriov_bas=
ic@enable-vfs-autoprobe-off.html> (Intel XE#4208<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208> / i915#2575<https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151319v2/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-of=
f.html> (Intel XE#1091<https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1091> / Intel XE#2849<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
849>)
>=20
>   *   igt@xe_compute_preempt@compute-preempt-many:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@xe_comput=
e_preempt@compute-preempt-many.html> (Intel XE#1280<https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1280> / Intel XE#455<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_compute_preempt@compute-preempt=
-many.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208>)
>=20
>   *   igt@xe_copy_basic@mem-copy-linear-0xfd:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@xe_copy_b=
asic@mem-copy-linear-0xfd.html> (Intel XE#1123<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1123>) -> SKIP<https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.h=
tml> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8>)
>=20
>   *   igt@xe_copy_basic@mem-copy-linear-0xfffe:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_copy_b=
asic@mem-copy-linear-0xfffe.html> (Intel XE#4208<https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151319v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xff=
fe.html> (Intel XE#1123<https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1123>) +1 other test skip
>=20
>   *   igt@xe_copy_basic@mem-set-linear-0x3fff:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@xe_copy_b=
asic@mem-set-linear-0x3fff.html> (Intel XE#1126<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1126>) -> SKIP<https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff=
.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208>)
>=20
>   *   igt@xe_copy_basic@mem-set-linear-0xfffe:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_copy_b=
asic@mem-set-linear-0xfffe.html> (Intel XE#4208<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151319v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe=
.html> (Intel XE#1126<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
126>)
>=20
>   *   igt@xe_eu_stall@invalid-event-report-count:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-434/igt@xe_eu_sta=
ll@invalid-event-report-count.html> (Intel XE#5419<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5419>) -> SKIP<https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_eu_stall@invalid-event-report=
-count.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208>) +2 other tests skip
>=20
>   *   igt@xe_eudebug@basic-close:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@xe_eudebu=
g@basic-close.html> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151319v2/shard-dg2-464/igt@xe_eudebug@basic-close.html> (Intel XE#4208<http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +15 other tests skip
>=20
>   *   igt@xe_eudebug@basic-vm-access-parameters:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_eudebu=
g@basic-vm-access-parameters.html> (Intel XE#4208<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parame=
ters.html> (Intel XE#4837<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837>) +16 other tests skip
>=20
>   *   igt@xe_exec_basic@multigpu-once-bindexecqueue:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-once-bindexecqueue.html> (Intel XE#1392<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392>) -> SKIP<https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208>) +1 other test skip
>=20
>   *   igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_exec_b=
asic@multigpu-once-bindexecqueue-rebind.html> (Intel XE#4208<https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@xe_exec_basic@multigpu=
-once-bindexecqueue-rebind.html> (Intel XE#1392<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392>)
>=20
>   *   igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@xe_exec_f=
ault_mode@once-invalid-userptr-fault.html> (Intel XE#288<https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288>) -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_exec_fault_mode@once-inv=
alid-userptr-fault.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208>) +25 other tests skip
>=20
>   *   igt@xe_exec_fault_mode@twice-userptr-prefetch:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_exec_f=
ault_mode@twice-userptr-prefetch.html> (Intel XE#4208<https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151319v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-user=
ptr-prefetch.html> (Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/288>) +29 other tests skip
>=20
>   *   igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_exec_m=
ix_modes@exec-spinner-interrupted-dma-fence.html> (Intel XE#4208<https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-432/igt@xe_exec_mix_modes@=
exec-spinner-interrupted-dma-fence.html> (Intel XE#2360<https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2360>) +1 other test skip
>=20
>   *   igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-d=
ontunmap-eocheck:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@xe_exec_s=
ystem_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html=
> (Intel XE#4915<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)=
 -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2=
-464/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dont=
unmap-eocheck.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208>) +248 other tests skip
>=20
>   *   igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck=
:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_exec_s=
ystem_allocator@threads-many-stride-mmap-remap-eocheck.html> (Intel XE#4208=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/shard-dg2-463/igt@xe_exec=
_system_allocator@threads-many-stride-mmap-remap-eocheck.html> (Intel XE#49=
15<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +269 other te=
sts skip
>=20
>   *   igt@xe_oa@closed-fd-and-unmapped-access:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-435/igt@xe_oa@clo=
sed-fd-and-unmapped-access.html> (Intel XE#2541<https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541> / Intel XE#3573<https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573>) -> SKIP<https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.=
html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08>) +6 other tests skip
>=20
>   *   igt@xe_oa@mi-rpc:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_oa@mi-=
rpc.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151319v2/s=
hard-dg2-434/igt@xe_oa@mi-rpc.html> (Intel XE#2541<https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2541> / Intel XE#3573<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573>) +4 other tests skip
>=20
>   *   igt@xe_oa@syncs-syncobj-wait:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@xe_oa@syn=
cs-syncobj-wait.html> (Intel XE#2541<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541> / Intel XE#3573<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573> / Intel XE#4501<https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4501>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151319v2/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait.html> (Intel XE#4208<ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@xe_oa@syncs-userptr-wait-cfg:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_oa@syn=
cs-userptr-wait-cfg.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151319v2/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html> (Intel =
XE#2541<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel X=
E#3573<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573> / Intel XE=
#4501<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501>) +2 other t=
ests skip
>=20
>   *   igt@xe_peer2peer@write:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_peer2p=
eer@write.html> (Intel XE#1061<https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1061> / Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208>) -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15131=
9v2/shard-dg2-434/igt@xe_peer2peer@write.html> (Intel XE#1173<https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1173>)
>=20
>   *   igt@xe_pm@s2idle-d3cold-basic-exec:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_pm@s2i=
dle-d3cold-basic-exec.html> (Intel XE#4208<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151319v2/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html> (In=
tel XE#2284<https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Int=
el XE#366<https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>=20
>   *   igt@xe_pm@s3-d3cold-basic-exec:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-433/igt@xe_pm@s3-=
d3cold-basic-exec.html> (Intel XE#2284<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284> / Intel XE#366<https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151319v2/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#4208=
<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
>   *   igt@xe_pm@vram-d3cold-threshold:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_pm@vra=
m-d3cold-threshold.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151319v2/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE=
#579<https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>=20
>   *   igt@xe_pmu@fn-engine-activity-sched-if-idle:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@xe_pmu@fn=
-engine-activity-sched-if-idle.html> (Intel XE#4650<https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4650>) -> SKIP<https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched=
-if-idle.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208>)
>=20
>   *   igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_pxp@px=
p-stale-bo-exec-post-suspend.html> (Intel XE#4208<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-sus=
pend.html> (Intel XE#4733<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733>) +2 other tests skip
>=20
>   *   igt@xe_pxp@pxp-termination-key-update-post-rpm:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-436/igt@xe_pxp@px=
p-termination-key-update-post-rpm.html> (Intel XE#4733<https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733>) -> SKIP<https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_pxp@pxp-termination-key-u=
pdate-post-rpm.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208>) +4 other tests skip
>=20
>   *   igt@xe_query@multigpu-query-config:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_query@=
multigpu-query-config.html> (Intel XE#4208<https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151319v2/shard-dg2-435/igt@xe_query@multigpu-query-config.html> (In=
tel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 oth=
er test skip
>=20
>   *   igt@xe_query@multigpu-query-uc-fw-version-guc:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-432/igt@xe_query@=
multigpu-query-uc-fw-version-guc.html> (Intel XE#944<https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944>) -> SKIP<https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-v=
ersion-guc.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208>) +1 other test skip
>=20
>   *   igt@xe_render_copy@render-stress-4-copies:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-433/igt@xe_render=
_copy@render-stress-4-copies.html> (Intel XE#4814<https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4814>) -> SKIP<https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_render_copy@render-stress-4-co=
pies.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208>) +1 other test skip
>=20
>   *   igt@xe_sriov_auto_provisioning@exclusive-ranges:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_sriov_=
auto_provisioning@exclusive-ranges.html> (Intel XE#4208<https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151319v2/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
exclusive-ranges.html> (Intel XE#4130<https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130>) +2 other tests skip
>=20
>   *   igt@xe_sriov_auto_provisioning@fair-allocation:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-463/igt@xe_sriov_=
auto_provisioning@fair-allocation.html> (Intel XE#4130<https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4130>) -> SKIP<https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151319v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@f=
air-allocation.html> (Intel XE#4208<https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208>)
>=20
>   *   igt@xe_sriov_flr@flr-each-isolation:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-464/igt@xe_sriov_=
flr@flr-each-isolation.html> (Intel XE#4208<https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151319v2/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html> (=
Intel XE#3342<https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>=20
>   *   igt@xe_sriov_flr@flr-vf1-clear:
>=20
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0/shard-dg2-466/igt@xe_sriov_=
flr@flr-vf1-clear.html> (Intel XE#3342<https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3342>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151319v2/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html> (Intel XE#4=
208<https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>=20
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>=20
> Build changes
>=20
>   *   IGT: IGT_8447 -> IGT_8448
>   *   Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -> xe-pw-15=
1319v2
>=20
> IGT_8447: 8447
> IGT_8448: 8448
> xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5=
bba36219ae6d227b0
> xe-pw-151319v2: 151319v2
