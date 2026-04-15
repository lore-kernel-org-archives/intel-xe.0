Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D89F43848
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA2110E24B;
	Wed, 15 Apr 2026 16:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGJ/Oaz3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC09D10E24B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776269244; x=1807805244;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzpaFrE0b1DpNulkTH0SMnrZNFhx6pfnZgF9psHz0WA=;
 b=KGJ/Oaz3kEL8DPVvO9unCkyjR40dkB9h2EN8XC78Xg1bNjLJZo+in8+W
 fDrUxI2mheLo0EphV3DSIpD0wVNglt93XvfBVZ0HRZYY325pYD4GaAE8A
 ydQnJIWPZvX5dYm/kEsE0L8Q1yK6Qy8eWYnqj29FnbRZP1DAl1ZnItdgJ
 8ajQ4Ur3gUqQ69PxLwPfZCh/ow7XuYBKS6tCeGGV78xsAhcKHFns76NzC
 91VOU+VRNoXvRSGLvYCNI8Yp7+ovFnu60deSjhyuNTekg9XOURH/zG+tk
 mMxaq504BIIKgE2m76AdgbS6Ow/xo/CBfnrQl0SY8KCyYJTttRnJJpfVC w==;
X-CSE-ConnectionGUID: UjP8CzkXQ8mHqjS8MBh8kw==
X-CSE-MsgGUID: nq+boqFIRhmC70wVLWLFgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77129791"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77129791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:07:22 -0700
X-CSE-ConnectionGUID: vHGLMWPVS8qPbSFeQOFX0w==
X-CSE-MsgGUID: V7VbsaW6RvSJeVeGdsrUwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234853310"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:07:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:06:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:06:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:06:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkBc65B4nLzjWTdj50d9p24HiFz//BGON2gwdn2MkqqcU9mIfLjVY6Wkdf/FwJ6FYZhRuiF+ofAUonzuPi56j1/vbz16GJavuWDs2BAYPCdEatwG4+QsIyaVbKeu4iCmQ7mU5WnI2POITmUY3duYNOY2uHx09roVZvbjkzqlYlZyc4270f/ZJ+q9OA/iDwnuqdM5l2yhkC/JDg6wWxUBL3M7Zbi3iEpLw3GI3hVCoJUiSZdmFRy/RmqsmfAAWvQoXtRvxrrwxQrnARcUDhvWnj9ybRD6I0C1bIiI1DA1nTKFZB//JTb6T3cYbI3kjPi0rdeFnc5+c4oeMm0xd/9SCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T53P4Itcwy1V/YcdetbF4X+LrVn8q7BkayIxK/oYmM=;
 b=GTPNSkn3WSTgpDTvsL9xq/AueqvokMeYTzH9Y+/0rPswa3Vzk9cPre8RMzZKl5ThiDkw4TijWwwTula1ADdspfWbXj1iPei4N8b752LdhxFcq9WMha3ZOnKGOOPVCsI0R+kljlVJXz6NMiln5uFxJYOkWu5I8wTcl+2Xg07P++hxXNdqKOcEOjc/9B2gU1zWpJlIQBkyvZ2QgaOtLrfyd8VcAEPLPhL16FjPgGjQHSMIb3wt46lqKFbQiF1O7M9gTRWwGcvvGUtRkePvKNih9t57UUmPnAgqcyY2DfFjiGzAQ9oYSYDXVkFMerUADSRst5PUqtbbTtZ3sNVq36woiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 16:06:54 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:06:54 +0000
Message-ID: <10a458a4-8c28-48f0-847a-1213c74a7e8e@intel.com>
Date: Wed, 15 Apr 2026 09:06:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] drm/xe/uc_fw: Allow re-initializing firmware
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-2-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406140722.154445-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0153.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::46) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c3f061-f058-421e-0a17-08de9b0902fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ecTHHqetCpZLe+34TF968xznDzXYhTNp71LalDOnyvGeh2hDl8v7LlTrECcMfQqEPwRURIgjzsCi48Kd5bAhj05TlZXeNhZQKAeYWH3p74D94169mnZH/bn57V9+SpZEak6kuHv1wX99pDrkb4yamnAbCFxXmN088r9Ex7gJupMynk5f6n0qH0BUBXLpFt0eHFA3H85E2LejFgBw57y8xqkd0OfJw0EGSw0H61Y32flaoYdku3JCyMd/8kzOHnR4jWYIu7rQjqmYcL8EDFVg9SfVbDUp71/FDPikYW3YOEQAHEG9005EYTmKBtI8mamyDnTI5YdtbUEhscQm1NDkbLeaVWe3BO0ZEDmeGHE+oFbrPSq9dueddnglmZ/4K/9vgfunnY+G2MubslvHLsgAEDFI+6lgbab3niSnwcdld1nr0pFomGgqPIPmrGs25ftRC2V2Q9bYGgFKt8zEudptQfAvthVK9fZ29bTr2UbGp31IJLSH9LpMC14YVu3xXPBX3jFjzBmhUNgKD2qpYAdxJbE/SVLn5xi2sjXacQNV3PVyWFe4iyqAtWJ4CGibxBeK+5ldvpcXUBol651SNdyHO8A18FimYKOq536C8PsVnsb2GDSDe/XMCHhhyPDFv6hCTmcb0bGjloCCNwOGp4qZUQsLNyCj2+Ua25tdYiYxpBZxIUw1rE9C8mQ3G8vdD6HguX3ZQ0vxoZKORwF9GFleHzW65Ta5lbB+m7hIXDR2Czc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1NDQk44MDZxVHFOZFdPTmdmZ3Flc1NlUWc3VFExMlVTQzZHVnNjWWxFanBh?=
 =?utf-8?B?VnVxQUhNb2dEZGUvU1M0WVdjSFJVQ3lndzNGUlcxWnZyYjlaYkFEVnNJY0ls?=
 =?utf-8?B?NGZFM2tkZW4rbElnek5UcHBPUWpOL1ZOeDIwODFIMk1RbmlvaHNXVFZyVXhk?=
 =?utf-8?B?alBoMTlYZzg1bHhNUjV4WC9UWEVSZUxyTjVzd3M0NFNFNW5lVVlCaUxnWHEr?=
 =?utf-8?B?bDdST0tXY2lBSWM2U1FQOGQ3d3g1QlVPV0c1Z1BrRGVrVk45SDdIVW5iVUUv?=
 =?utf-8?B?WlNVVlQweThxT0lrem9qQlp3T3Y4RjZIUWJGN0dROTJWL2N0bTJzTk00Q0Jq?=
 =?utf-8?B?b01MMHlDdG53WlE0ZzlTY3E4bXBFQ0lHazlqTitQKzhjdXBBU2d3SFpVNVlT?=
 =?utf-8?B?SHhqYVFkclErd2ZrR1VxRnY4ZXN5UVZkQndBd0VFaXJYTmloODFYei94aDJD?=
 =?utf-8?B?cXlzVG9JUXRDOXBVRk5tR3hteGltQWkwUjBVaHNJa1piVUNGNXRQU1c0SGVV?=
 =?utf-8?B?ZU9ZeUJKVWo1dmRtKzhBa3pkQXUrUUNWN3VBckQxOGVYWVJNZ291TFFxOUxn?=
 =?utf-8?B?R2tvbDlFL1hSZ2NDdGh5WU1Mc0R5ME9hVGlKUkhzZHFWRkcxZWlSM1hML2tB?=
 =?utf-8?B?akp5RHZhTXkzdWxoQ0RobTM4dGIxdjZDeW9RY3NjbGUwKzJRZDRBMUJ2OS9p?=
 =?utf-8?B?UmRrUXl4MUNCREtQRnp6cWRvWTVZS2JVWGYvTlZVNGFsUVVERHpQRWZmM3BY?=
 =?utf-8?B?RDVWME5LQy9vRXgvYU1FaVJYSU9jMUEyTGZIaEs2R2dFY2l2cFBxbE96Wkto?=
 =?utf-8?B?YlRLcUl2dGpSR3M0eGg3bEhuNVlUd3VPRm1PekNlbmFXTmN2dUJ4VjFTeDk0?=
 =?utf-8?B?WldiL283ajZDcTN1a1I2Q0tyYTRPNmRUYWEvcjE2bUlEYy9CYnovTW5USXBV?=
 =?utf-8?B?STJja3MveEJsOEJ3YkNvOUdGL3V1TGdCbFJRMjFwc0w1UTZKc0RZeGNIM3Ni?=
 =?utf-8?B?eitXa0JlWnIzbkcrdU1ST1NCM1hTU01odDlJMjB6OHhaR0RPMGFmb25hamFx?=
 =?utf-8?B?QkljRGE2NmRZSjdaZlFQcEp1UnN1R2Q0VjkzV1lCZzZsQ0RLUWNSTGtFNGpO?=
 =?utf-8?B?cEJadlJDdHJXZnFJRDVjTzF2TCtMdVpXNUNMMytuT1JhRVl6RzkzakVPRFNq?=
 =?utf-8?B?L2gwTCswTTZ1R3VxamJKNlJsNHB2d2taZW5NQU1CbUljOEpNVlkzSnB2VU4z?=
 =?utf-8?B?UXo4RFFUcFlicTdSWE1jZ00zdEwrVmk4WUxmaEgvZHJZb2VTd0pYczliSDFn?=
 =?utf-8?B?cXBycVBzQmhJQjVyL2tNWk05M1pPZWJSN0tRNWtlNGNlS0RuRXRIazY5VS9i?=
 =?utf-8?B?dXVrWW02eHRyWE9uZXYwL2pOd3h2T0lGalo1MzhzNXZtRk9IUGxJU052VVpH?=
 =?utf-8?B?L05QNnQxV1U3dU1pcVF4bGJxZTZheUw0Y2ZNaXVzQVJTQXpUZHBBeXEvZVd0?=
 =?utf-8?B?ZytoUDdiaEt2elNOV0wzQ2ljR0Z4bU5pQ1Q4VW5kakk4M3U4a25ucGRSMWY2?=
 =?utf-8?B?LzdFNU1GZ1AydEZaK0tOM05TbnRzSnZOUmZBWkh5akZ6Y1l6VjRweXN6MUtt?=
 =?utf-8?B?SS9HL3RyWFlQZ08rSStzOHo4dEs5VVJDQm1mb3FjNEQxTi8rSHhWM3U1YlQ3?=
 =?utf-8?B?aHlOdXZTNlFSRnVLYXNIN3lGalloQ0ovWlVTbmRLYTFFZ2UwWW9MN05nTjl2?=
 =?utf-8?B?b3UxdUh3VExKYTk0L0dNMnRSTHZIZlB4bWF5Z3NINVd4OWdBM0tVb0lESW5k?=
 =?utf-8?B?anZ4SlJvR1BWR0htTFF2UXB1Tk9MT0ZzTWRkakd6NlFUcHJuQ2IxTjdHUC9U?=
 =?utf-8?B?NGlCZkR3Zm55MFNGZUIwaVNTZUowV3RJZStMUHJoMTZNOXFlOXdqRlZQQ2NY?=
 =?utf-8?B?NjlGajFTVmJNYWJzNWZhYXN2ckdjWUtuTHppTGtZd1Y3WUlPRkxUZjdidERu?=
 =?utf-8?B?eHIwRWw2K1NEdnBnU09ieTg1M2RwcmdOdXFRZmM0YnFlNFU3V3M3OEZITUFa?=
 =?utf-8?B?aTZYOHNmcjFJbE1Jd1FPSUxXem9HOVQzV3ZmV3dSQ1czOTM5TE92d2pzSS9k?=
 =?utf-8?B?bGVKbENVYklyeUZNamo1aHpOV1ptbzhBU2VoTjhVZUJjS3RYeG91UnI3M2pV?=
 =?utf-8?B?RTRzQ0MyUmdGVXhqdUVaMUV1eHpRNkhJUEQwMEc3ZExrdnFrRlE1UlJOVWIy?=
 =?utf-8?B?eFduUXpCZm51dWJqaE9XVmJUYzdlM0l2ZVE4ZmMvZGxJV2diak9tZ2hpMnJ2?=
 =?utf-8?B?enhwRllXRzROVnRmR29rMnJNUHRGZDdhdEJzSUpxNkFTaWl1YmhRYU5GUmZW?=
 =?utf-8?Q?6XhfYvCH4epTAOPs=3D?=
X-Exchange-RoutingPolicyChecked: mwOM2PYqOKaSlMrEeL0bRqIIZqRtJ3/144riaB6MDS7HUTuR9QhGNDnxKdN4wSx4eeobcOF0m0sgtstJy/cjSzsXoMkXmcnNeAFXPZSPK2+PX3UaUJQmZ+VLkugeTBw63PktOSXfgUPn/7SnwUtJ0geHhXM5TXkTX5QzQl1zk68WR48FGUOyBuF//gkTic5/OORUKx3XgZd428CGqPXMFPTJ6e+pbGjbNylH6wOvL+1+1sQEuMvwC5BP4zmz6qKbU3KpDizj7bAJ/X/9Bh9+RIX543P4e3xFFOPpfRhdAuaa3qNcvPMISUu4hKuUboXZur5fDidVVcqlS3uXu/1cqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c3f061-f058-421e-0a17-08de9b0902fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:06:54.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyscIJORgFKO/2ubBAT0OPVD1OOBC1bWRQuC9LAPYlLCmauL1TVAhDzboXyPGQWhIJOK7l2VCQEggSvG1J1UOnGFRMRsWj2aYYYMHjLLNjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
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



On 4/6/2026 7:07 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing firmware without
> reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
> already exists but since it's contents are on VRAM, they are lost on PCIe
> FLR. Copy the firmware back to it's bo and mark it as loadable as part of
> re-initialization.

Could we just keep the firmware in SMEM instead? It's only accessed 
during FW load (unlike other GuC objects like the CTB that are accessed 
regularly), so it shouldn't be a massive penalty even if the memory 
access takes longer.

>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Add kernel doc (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 39 +++++++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
>   2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index df2aa196f6f9..fb168238ee7d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -715,13 +715,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>   	const struct firmware *fw = NULL;
>   	int err;
>   
> -	/*
> -	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
> -	 * before we're looked at the HW caps to see if we have uc support
> -	 */
>   	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
> -	xe_gt_assert(gt, !uc_fw->status);
> -	xe_gt_assert(gt, !uc_fw->path);
>   
>   	uc_fw_auto_select(xe, uc_fw);
>   
> @@ -834,6 +828,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>   	return err;
>   }
>   
> +static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
> +{
> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +
> +	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
> +}
> +
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   {
>   	const struct firmware *fw = NULL;
> @@ -857,6 +859,31 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   }
>   ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
>   
> +/**
> + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
> + * @uc_fw: uC firmware
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
> +{
> +	const struct firmware *fw = NULL;
> +	int err;

should probably bail early if the FW is not supported.

> +
> +	err = uc_fw_request(uc_fw, &fw);

I don't really like the idea of going through FW selection again, as 
this could technically cause us to switch to a different FW path or 
image. IMO here for native/PF we should do something like:

     if (!intel_uc_fw_is_available(uc_fw))
         return 0;

     xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
     old_fw_version = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
     fw = firmware_request_nowarn(&fw, uc_fw->path, dev);

     parse_headers(uc_fw, fw);
     new_fw_version = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
     if (old_fw_version != new_fw_version)
         return -ENOEXEC;

     uc_fw_reinit(uc_fw, fw->data);
     release_firmware(fw);

The firmware_request_nowarn() and parse_headers() are the same ones used 
in uc_fw_request, so it might be worth moving them to a common function 
(in which case we can use uc_fw_release instead of release_firmware to 
match).

Daniele

> +	if (err)
> +		return err;
> +
> +	/* no error and no firmware means nothing to copy */
> +	if (!fw)
> +		return 0;
> +
> +	uc_fw_reinit(uc_fw, fw->data);
> +	uc_fw_release(fw);
> +
> +	return err;
> +}
> +
>   static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
>   {
>   	return xe_bo_ggtt_addr(uc_fw->bo);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index bb281b72a677..9f469bf07d66 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -15,6 +15,7 @@
>   struct drm_printer;
>   
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
>   size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
>   int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);

