Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3631DC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 09:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CF510E328;
	Wed,  1 Jul 2026 09:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PA5s/5ae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E02F10E328
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782897710; x=1814433710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c+Q9CW4aQhTvDHgKUPE6RupNnKncbxLxmhQXIJT306U=;
 b=PA5s/5aejAy3AOi+k5fvGfl76VduFOBxLrC8WHdEvgb7IheDew4pA+Kt
 Z6KqLBqx9zxjLwQB4T3dZB3QycrMBNyqVZZxfmCmhqyLJIZh249Kmnp/V
 3aRpyvP3PajcJegrQ8JFoK235Zzhp6ju3aYUeLF2hpiWh3f3nIMxcOPJa
 yit5AapZRe6/8F31mtIts68RNSiGhy+ext1IWBrFAERr9ADeI4PwaU/mb
 Dis1VjhMHsWnYgudSAU3i+RnNoInNNMjWzNflhFQ9JN6RL/KwhgfjA6BY
 pjYGdRmZwuhfgeMrOokO5FRZL1YZfswoRhsVwzR5/64NRMvp5OF1jCiyT g==;
X-CSE-ConnectionGUID: PP05PYmfQ/SJsz/LDrV9Xg==
X-CSE-MsgGUID: 5mLe78JVQHayg9NbwXQwXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71148793"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="71148793"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 02:21:50 -0700
X-CSE-ConnectionGUID: J796BsXdQRGox6n3CYqZHQ==
X-CSE-MsgGUID: AbcC9Wx0SJuSEHD7CBJkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="248534067"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 02:21:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 02:21:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 02:21:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 02:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApAtp29YHeJm9yAGwQ23MB7JC6TkhGljuhyYA5R4JJGNsCR+lORjKBMzRv3/3i6+v9R9CuSBcz+Hz+6OqHkUeGt09+LZolfapZYgrC5naDgylaqMIH0WTSFfxsfz1SQgGE7GdyWPJwTzWMfatH8sMSx9sGyDT/2x0Esgceo2BWrr+MPnP+R/WXHcWUec112K2Vo3zOxZfoL9tr8pI2RRTvsEf+0YK1hF+SEGKOo3Exh1GJoaCq1+eAmbapkkbhYN7Mrqp3TkmJMHeo1xkOYkFc2EOO1GqYNATFMWNw9N5GgzvPHN4WJdMZ+9swjOGnTzWOcz6igXpyfJkytCiR9frw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6ZKUy5G4CkjEKf4p7VDGwAQZP4yRE5LUgDa/LUSKaQ=;
 b=xvJfl+FvcwGJIC7nYJ1iq+uq6e0Z9dZEsagF8I8kcak+6lbu5vjq0b+iCA4QFsZp5ISvtLjRaOYGWnBJnDKt0XNUNJDCyXPEZPArjqzwcaRMqQMyLctimrNgZuTE17Df7kbIIwkvIHi7qw57SEkDXgRkj9qEm9gaJbcP7+ALB9Kqqj6FUyUEyZywMMhYZC30nKdYPQRPXpXVVmegL98814an4Tg2rfO5QVAe3SOaiwhaPS4rC1V+h8tuL7OU1dwmjjFH4n2D7VpBYREiGyEXFA3dKaUH4e14BzuEQ6JO1a2ZagKsIn22vHSIgVn9YuYrnF7sinaca0v0djhsGr+LEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY5PR11MB6091.namprd11.prod.outlook.com
 (2603:10b6:930:2d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:21:47 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 09:21:47 +0000
Message-ID: <159443cc-5c59-4a2e-a8c6-fdf2c53b12a9@intel.com>
Date: Wed, 1 Jul 2026 14:51:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vm: Fix BO prefetch with
 CONSULT_MEM_ADVISE_PREF_LOC
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
 <ajxHAYwu866e2i6m@gsse-cloud1.jf.intel.com>
 <ajxHTHe1UsIQYDUo@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ajxHTHe1UsIQYDUo@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 511bd925-5a9b-4fab-f6a3-08ded7522cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: uzZag7Qdd3+RW0BsiCgT94ZpdabjXu2SEaLXuJqu56QT3hLZC8pZx+MYkJT+0E1pETf/T+DUIXK6qVOtK5Zy4CEzlPzxlPo2MkaeCmDV5JbvKDJUrAywGTZYZYfm/9yeLaxyIc8fyMa1iuP09KF2Pdks4xk9XJmfnjXd9vEwFW7nR4eVTKKr7Gkuej8MWLklFWEhrPxnGxlpxKpX6wc+tt6syLRggSTnEursMddNsfJbFa7Gxfrwo8ia7QN8qz+ycq06tp5S4gHHeRDpi++4VWt7QbYYjtSrX9UjgsBWl00CoEjEFxTw/lFMWRaryZ+qo1xlMd9NjhK4/j+iF++rn1VAwdlLBFrEe+l5A7mpI2DetThK/S1RTOHH4Ip3vMnItVq65lpA8xP5mc15nd0OUlHv3jMoh8dMArLPXCC5elvs7clDih/QPG1NhVN/hGmXiyhT5nstFjG+0v4lFIvOnUCW7R7yO8HfcOuJ5/2erG7fpqo8Wt++NSawX4t4iESnLacPZiY6eiWe7AEaUd8cEAWXOyEZVQA8u5X7hOBsTqvJjXj73P6iVMFfJzK8Hy6BdUoAywfTOEQUNIDM/0NKhGb6lJ3v7XTbKcn7hiXCPLKZ5F0CF3ugH2xXF8dlomucKUE0jxJ36dymHU0DrJ7CzB4HKqEw7E1Jt5oZPoE4wTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFZLVm12NDJzTkNHeTdHckFyY2hPL2Y3QWRXSmxEYm1iZDRpbFFDR0dMR2Ru?=
 =?utf-8?B?Qm1TNFVWaXY5NHBlZVBicjZWb25KQUQvTTY3NkNpbEZEZUZ1OGx3UkFjQUlL?=
 =?utf-8?B?c3lneGhXYld1Wi9PdHFQVndGTXlTTjM0Y3c1aTNNMEZPUHpsNW9hK2xtbzNQ?=
 =?utf-8?B?VDZCR2tWTXNRaFZUejR3TlRYS3BhTXdDU004RXl1bytxV2d3aFIvYnZFZUtD?=
 =?utf-8?B?MGFsTjk3TFAxVThldG9WTDFEYnpoM3dPWTlEUDFORmJjWUFMUDdMM0NGTVZ5?=
 =?utf-8?B?VGhPWE54K3U2NVMvRXdrMjJGZHBsUFFpdGlqd3dIamxzSGxjNEYwc3J4RVpS?=
 =?utf-8?B?cXplanpvWjh6YUhMSGtidjlqR2ZoenArWFRmc1M5TDNQNlQyUmRackhTbFJq?=
 =?utf-8?B?N3ZFODZMVFNyamZ5VUhBTXZwdFBHL1JaaHBYK0tKc2ZLbVRHTzhmSW5BR3d5?=
 =?utf-8?B?cGlXS0JOeDliV090L2VEb3U0WURnMWJVR1ltZit4OWxIdXVTWFl4RUdWeGpX?=
 =?utf-8?B?MVlHUW5mYSs4ZDU4K1JmSjdEaDJZTDJjMFN2ZG94UVd1V0hOeCs1WFBJTXhq?=
 =?utf-8?B?YVY5SDg0RG5xdUtTeTVWaUpyUXdWMERoc2VSYnlpeUdQb3NpK3dYb3g2VVRJ?=
 =?utf-8?B?STNCWTBzUFMzZ2NHdi9OaGlVZTVlOGdsYWFxRDZYRWZFUjk0WEZXVUtKRnUr?=
 =?utf-8?B?bVVnZWpxWldYU25sQ25uYkc0SjlkeUNCRkJJanBpOTFOZElLejFsN0Zpa0hS?=
 =?utf-8?B?ZmZUUHlsU0FPTnpXL3hWK2lrR2FDSUFFaloxcGhkcDU3RXNJd1NEQllJMGEr?=
 =?utf-8?B?Y0JZd0pkVEhwaHVUbllpMVVONkhpdWVEMU9GRHBtcXo2dUZkdlg5cE9JZEhM?=
 =?utf-8?B?bndTV2JVQzk2VXFkVGVjUk13N1B2MVQraXNMZ3doUFR3Umx4MExrbmt2V2Vq?=
 =?utf-8?B?UGk4bE5uVzIxam1TMUp4eHdCNjdQWW9qekpTMGc0ZnJtakJQcDNHc2dEQkkz?=
 =?utf-8?B?Rm1LS1dSQVhFT0hRaVNPc2xKWXRoTWNaT3NWdE9vOXJRV1FxOWlFd2Ztb0g1?=
 =?utf-8?B?ODJpL0JFMXRvWVJ0aVR3L3pYM002RFE2ejdrUElkYTcxSXFOc2V1b1RFWWxi?=
 =?utf-8?B?cDE1MnZpTTZNZWhBOGE4VmRjTklsa3JLYjkvZEtWNzhrZUtCZ3pmbGtyaUU2?=
 =?utf-8?B?Ryt4L05XbkVSemx4ZDFWSW5WQ2dJK2pQUFNsUVNBOTZlUmZBZ2N1OVVpbllD?=
 =?utf-8?B?Vi9QZTBLWjROMldUdzBYVGRaRVdGTHBWQTVoNkZBL2RDK2Zob3V5M3ZaVEI3?=
 =?utf-8?B?TVhjbXVNTlNGM1YrYjU1UWxablJSNnBjTk9hSFM2UUZXUkQrdU5aRWtPWmVS?=
 =?utf-8?B?K2xhaG1WTzJPWWpPa2hqRFdkT3BscExMa2VDMjNJNFU4dmFWZ21wLy9Za3Jo?=
 =?utf-8?B?cmRpbSthbGVjVTloZklRK3ZsL25LbTE5YjZkSmlVK2xuVUNqVnlsUkIrWDZT?=
 =?utf-8?B?VDQ3UVowd0FXeUNLS2lZOWpvQVZGRVdBelFITTlkV3dKa3I3MGk1d2I1WW5R?=
 =?utf-8?B?ZTg3SVFySWRDZTR3Sy9TSVYvNmlCRFIvUWVDTTJtZ0daVkpQZ3Z3SmtZYk1w?=
 =?utf-8?B?YUJBNk9Vd20yR1ZVZGRVWlFsc3orK0kyM1NPMU93ODBVZjJsSVQvS25SVUpT?=
 =?utf-8?B?cGxZbW1nMC9WZnNpaDVMM2k2V2lwQUhzZERsSVRoWWhMSmZCbFhsdytXaHQr?=
 =?utf-8?B?a1B5UkxhNDVGMEQ3VHRSUW95S29NNGduVENQc3R1VldRaE56UzliTEFuSWFR?=
 =?utf-8?B?NHh4TnBzWG13QWZnZHFLeC9XTjh0VWJpcmFqMkhXd1RVRCtPc0tuMG4weHps?=
 =?utf-8?B?Mjdud2pVRS81aHVRa1MxRWl3eEtBVnl6ZmI3TWtxZUN1TmxZZ1R0Q1FoYld4?=
 =?utf-8?B?REZUMXQvSCttMUNTaG9OUkI3UEhaRldEY05WZHlJT3VBQnhUV2xiZlMyeVp0?=
 =?utf-8?B?RXIreEtrcFdidEk5NjZwRGpTVzdFRHpGa3ZrT3FzSG4vYmdQODlsKzMwdUEw?=
 =?utf-8?B?WTFLTDZ3dXE0TWd1RlNKL09PbytOL0V2RmpNZTE5UWhLUnZ1NTJmb21uTGMr?=
 =?utf-8?B?OE5MRlhGRnpacTdleXB3bE12QmkxalZKSk5YVE1QV0tUZ3lJRndLeWQ0VXpO?=
 =?utf-8?B?a3J3SGNIbjhRVURmVFh3MWpyT1ljbzBLSUJDT0RvRVJqR2R2OElwQ2lDQzRG?=
 =?utf-8?B?NzdzcWVJL01PSkx2aWNXZ3cyMTZGQW5seEZNUXpsVGpoTktOYXNjWHFvQmVB?=
 =?utf-8?B?U01nODNLa3ZWMCtNVU9tTVN6SkkyYkJPWVRwVnhPMXA3Qm1DOHBNaFFUcTJI?=
 =?utf-8?Q?44lz0nUsuMAFIZ+o=3D?=
X-Exchange-RoutingPolicyChecked: GthyjiBUCyQKGz9yQEVBpdgGLzL8AQe8b1E03onl8bM28EtiLQYr7o+YPBDDIIr0cFHgGHxV+gX5dZhfvamS9hjjw6fgEv5Cz+umpQBh/p520jqmC+yLs3zRy7jIl6VkfWDcZ2peglCNUQfQWs7ou2MOJuDDrVM9VovQNEXI2B777L7AgwjbxTLixHznkG7A+2L/3gwHJieL8nU3+N1Y92E8zF1hlMJjtLeQSAuLHTLV0KonhTcjNs1NvutzWYMRC3O+3pdxMYtg4krd5xQjMj+2ykRKqFCUW5Be9mAqtI7sHYzxkzsujWbtnPDpra33POGzokhwNtYL9m4yRc6hhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 511bd925-5a9b-4fab-f6a3-08ded7522cd8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:21:47.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkwdXaFKQARDEfnwqlu9vM26MGo1X5KdMIaiIO6GyR/zf/98dTrjzAAvar+Fsjw8v1Ir8YSaodvEH2taTnHTiIJ6Tz2+AQfeeucXNUXh8Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
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



On 25-06-2026 02:38, Matthew Brost wrote:
> On Wed, Jun 24, 2026 at 02:07:13PM -0700, Matthew Brost wrote:
>> On Wed, Jun 24, 2026 at 11:19:44PM +0530, Himal Prasad Ghimiray wrote:
>>> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for a BO VMA,
>>> the code used it as an index into region_to_mem_type[], causing an
>>> out-of-bounds access since the value is -1.
>>>
>>> Resolve the preferred location for BO VMAs directly: local VRAM on dGFX
>>> (using the BO's tile placement) or system memory on iGPU.
>>>
>>> Discovered using AI-assisted static analysis confirmed by Intel Product
>>> Security.
>>>
>>> v2:
>>> -Fix null dereference
>>>
>>> Reported-by: Martin Hodo <martin.hodo@intel.com>
>>> Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++-----
>>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 080c2fff0e95..32ded13491ca 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3255,11 +3255,26 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>>   						    .request_decompress = false,
>>>   						    .check_purged = true,
>>>   					    });
>>> -		if (!err && !xe_vma_has_no_bo(vma))
>>> -			err = xe_bo_migrate(xe_vma_bo(vma),
>>> -					    region_to_mem_type[region],
>>> -					    NULL,
>>> -					    exec);
>>> +		if (!err && !xe_vma_has_no_bo(vma)) {
>>> +			struct xe_bo *bo = xe_vma_bo(vma);
>>> +			u32 mem_type;
>>> +
>>> +			if (region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>>
>> Shouldn't logic more or less look like xe_vma_resolve_pagemap which
>> picks the region based on vma->attr.preferred_loc.devmem_fd?
>>
>> So roughly:
>>
>> mem_type = mem_type = bo->placements[i].mem_type;
>>
> 
> typo: s/bo->placements[i].mem_type/bo->placements[0].mem_type/;


Thanks, Matt for the review. For a BO VMA the preferred location always 
stays DEFAULT_DEVICE (madvise skips BO VMAs), so devmem_fd is never 
DEFAULT_SYSTEM and both approaches pick the same
placement. Extending madvise to BO VMAs would also need a design call
first, since preferred_loc is per-VMA  and a BO can be mapped by 
multiple VMAs, so preferences could conflict. I'd
prefer to keep this patch minimal, but happy to switch if you feel strongly.

> 
> Matt
> 
>> for (i = 0; i < bo->placement.num_placement; i++) {
>> 	if(mem_type_is_vram(bo->placements[i].mem_type) &&
>> 	   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE) {
>> 		mem_type = bo->placements[i].mem_type;
>> 		break;
>> 	} else if (!mem_type_is_vram(bo->placements[i].mem_type &&
>> 		   vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM) {
>> 		mem_type = bo->placements[i].mem_type;
>> 		break;
>> 	}
>> }
>>
>> Matt
>>
>>> +				unsigned int i;
>>> +
>>> +				mem_type = XE_PL_TT;
>>> +				for (i = 0; i < bo->placement.num_placement; i++) {
>>> +					if (mem_type_is_vram(bo->placements[i].mem_type)) {
>>> +						mem_type = bo->placements[i].mem_type;
>>> +						break;
>>> +					}
>>> +				}
>>> +			} else {
>>> +				mem_type = region_to_mem_type[region];
>>> +			}
>>> +
>>> +			err = xe_bo_migrate(bo, mem_type, NULL, exec);
>>> +		}
>>>   		break;
>>>   	}
>>>   	default:
>>> -- 
>>> 2.43.0
>>>

