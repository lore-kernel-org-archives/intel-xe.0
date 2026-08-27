Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C81FC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC5410E3DA;
	Thu, 27 Aug 2026 10:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAi0gxP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF4310E3DA
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787827002; x=1819363002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XZvMv9Y5a+FS04DcWf07KuXJgrfd8QB+3d/BCOLaOXY=;
 b=PAi0gxP6z6VS2jBS29wAvmlgAu2GS9z3VyovpWREgJLLcpP2kEwXUYqu
 YyC0cB87jNrYbobEetFAaC6HzrDFx69m0YFtQ16EhTboCm9J7uXyRiM7k
 F5q4VThw9waUZegQEy1Oj7z3m/+m4CxFnoKX+Qd5/4kaK5SLVc+8aDXUg
 BBH8WYO2RbX1ksgNFLcpiw+uUJTk4NGVGS0ZCWJ/4rXrq8x0shPmyG499
 idZxcXU6PXr+2OGBLEx3oZ2q9tEQSRpB9A3E8IffapaO8yNw9AypDL2OE
 dZR1e39wWoQ4cq35yIyEl64yMC77m/3r4TJ4DLX/Zu3N59Qp2IGuBBL39 A==;
X-CSE-ConnectionGUID: C4W0AWssT8OLB0+ZA6yGqw==
X-CSE-MsgGUID: fNUBCY01Sb6Nlv1prhaIrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99840870"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99840870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:36:42 -0700
X-CSE-ConnectionGUID: XfBYN+fvTASdDfKAhDF/Cw==
X-CSE-MsgGUID: eFQaT7g7SemMQ/xdLWhLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="297722087"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:36:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:36:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:36:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:36:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQp3ahx6wNM9Vt+1+QRwUFn5PNFK+4ty7pXEPVs2Iu7imiAA2ixtSgSJxGeQFEvYBQctpEO/v/rAYh7iAbtSzvLg6e3KfOf5C6GYC2WTo/4CnaAcJ2PL/s1qDCMLISPHNcWJ39PKWAriEFgdu4KUYPjnPYOViqd3LrY/OJXxh0gSH1JgJGygJK0ionLkpZPIg0RLEczW63z6+nsWuaOKVEz5H6SgTn01pWxql8oX/F+DZPDEdvmcGaCRD2m8aK+WFP9/Y4bmeN+7AAfNP84ZgrL6Z56PgRXNFe+8l3URXsaHS26e1jVT7+2CXdnOPE1LObhntXZmf2CCCMvp3Q4bJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7GNEWQihsVBERBBJNr+lKbc3wB7Xd0qUY9GwA0BM+g=;
 b=ZmXYTk3mHifx93VXfnoVIZGh8a3jyzaDJ9wPrGroJYF6V9nyTfkArC9pijN+QHIYGYhJ4fLV1yV2cHGZsV0Lq5O/2x+3s8BPjWRVG7pwBoF0YW9Tpyq8VokuLh3Gd3QOfu7h2MS4shA6uh2Kvke+P90z59yAz3FXIY4j3VYSDrnFPSzg7KpdIARyey89NZLuBrM5L1jWosiIodG33ss7lTMZNdOeRyJ6ZZKdnwDlBZ0IB/ySJRjpiR5W10rZtsJpw6i10cT3r782MxMY7p+Sdm45Zs9qoye6DMsngq2feygyTMP9fJLbI06iSvDrP1znk5EBm0Ek8G+dKLy9B8IIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PR11MB256287.namprd11.prod.outlook.com (2603:10b6:8:50c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 10:36:40 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 10:36:39 +0000
Message-ID: <b9eedc21-e1b5-4a2c-9ad7-ec3acd732c3c@intel.com>
Date: Thu, 27 Aug 2026 16:06:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] drm/xe/hwmon: Update fan info after late binding
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-10-karthik.poosa@intel.com>
 <e61ad993-aee9-42ca-ae19-b777e94d197d@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <e61ad993-aee9-42ca-ae19-b777e94d197d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0266.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::13) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PR11MB256287:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c02209a-c620-42c4-a755-08df0427139e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|18092099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T6eAKty74vPuun6jX/Tz2A5sKHYdAVG7wkyDaz93beKpVNfQWVyJ3RJeqU8ZTp0w5mO0kKSq65u2ozOQ/aZYNh4eLy7wDrKtBw8Nc0DTwVJdUt0KNnG/UYP+tfXOnDwt8KxHp42C12n04R22+RDn1PDzrqOdSD8c+iZiWdODTIZ5V2SWeOHnxYdAh1ApSTU0ZlhiU/BlXP+mnWI2Ko2zQCeyr1W4jSkf6AqjshtQbcjn2HvT4tPCeXjdxSmOxpSTKHIpoHL2R/xHaozIgGW1ydDqrul39pyZlFSETX0ryrxA7wOz14aZgiRUj4975omo3E/8If999art31pJ8d+x4w5h34t3oiAneioQ2iMYRJJ3rIzLvPT50JSHcKU4CvzjBUHKajJrsqIbz721r7tZWfVwU1FkXX/dmZ2pXjKZLN2oPshT/wd6+E7PwcR35M107TCSGMiTukfzgPBQBte2XSRaclM9bKLH/1PmISHM3sKJ1bWE6chh1KIuQJ8A1XyuJjl+Z9RayUOPrWYrh31u1IW8ZDDFe65EHbQSHJ3xhKq/06x7Uba2N8ElDkrBXgM2NXnogjYmdUJ+fDsc2yJXx3Az4KrxYuJnWrShdumJvcD2Tei31kPpbuSf2tD58EgSTO22XQLYeOXn6u+o7+DnlLT1qpZtSBrtrhvQEIxv+qI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(18092099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNVVW9SRHh3cEhRK1lqK2NqejVHdE5CdEpPOFZVdnNqM0trVU9hYmNTUHlE?=
 =?utf-8?B?VGdxS2pmQ25JeU5xVzB6YmszNFZ6aFMxeXd5bVNDaDM4aXVHNVZoS09WaHdr?=
 =?utf-8?B?dWhHWVNhUnpISFRuUndwVEJIcFFUYWNwaEJXZnVYQUtMbDJTZ0N0QVdGK3Fl?=
 =?utf-8?B?L0Q3WGh0UHBOKy83cG5KS3dNc2VBQmlkamRTcGxPTzdybkFLU2pPbG9hNGhz?=
 =?utf-8?B?L3JReWQ5cUxDU002SHN2MmdWcmNtQzNjVzhycWtrM3dpSjNwSzRPcDVyVUox?=
 =?utf-8?B?RTdmZFMzUGs0VDVhaGxvVTY3cENTKy9ZbUtibkF0b1h4MWNxYTFNbWtoK09v?=
 =?utf-8?B?Y2VYUWpZNEVtY2l2NG1DRVJqNFNzdXNJZDZleXU2MjVwdEVqSS9xZzZ2QWo1?=
 =?utf-8?B?eVl2ZTdvdm5Jdi9EZE1McjlpU293TjJkYldNZjdreTUzbmJTNGQ4RU9wdVJX?=
 =?utf-8?B?Z2k5dEM5KzNGTWNxaGdtTjBWYTlJNnM4eDVTMFpPY3pMM3NoMHNJdDFxajhD?=
 =?utf-8?B?cUZGeElCa0lZQWRtdWdiN3RJME1qbkpBK2FBdXJ2ZXVDQlpXa1FMVlFnVlZ0?=
 =?utf-8?B?b3pXZ1pyM2FWZTlZVjFUSjdYaXEzWFNRSFpzS2o4a3NrNkJrcWVvdjZ3eUp2?=
 =?utf-8?B?YTZSeWt5bW9wYVcwSXExMHR1R0JIZkJCTHQyVlM1dHc3c2JBREIydzhDYmFp?=
 =?utf-8?B?NFNFKzFCbVIrVnYrU3BpdndLRm9xcVZMdVJkVFNaMjN6clhteCttNHl0Mmw4?=
 =?utf-8?B?azhsTXJZaFFNaGtrM1dEdHFrQTUwNkgwczVKZ2U3ckdGSFBDVkFONExicGFJ?=
 =?utf-8?B?YzlQdFEzZHVpWi8wZXZyQ3hoalpUWnlYUml2R0pySy9sV0dLQjFROFovSm04?=
 =?utf-8?B?U00wMXhXMnY3aUVEdXBabHhyeDB5ZkdlbVpiRDRTQytxMTI1TG9XZkdwb1lh?=
 =?utf-8?B?YWJuVHlxckJybTl0MS9raWpqek5yZXpUZCs5YWFGdmZaM2xIMWlSWTJidnhD?=
 =?utf-8?B?UGlVTGJiV0srK1ovSDRXQUVlbmFzZnBEaC9vckdLL1huZGMwM0poWWh2K2Rj?=
 =?utf-8?B?Yk9vU3FYcjlxOXl6TmlzWE1IdmNNVkp5ZWVTZDdSUE82YzhZOGNMSWdaTnp0?=
 =?utf-8?B?WGw1YjRucmY5MUZUejJLSHV5MHdwbWRjVHJidzVZRkFvd1hqOWY1SjI4d0tj?=
 =?utf-8?B?bjl6WHBtTVFuZVhuSGZtakhMcGNLSWY1L1R4cDExaXhxMkVzSmRSS3JoY3pY?=
 =?utf-8?B?dHhCK3lDMTFHUHBuTitTMlhDWVBML1ZJTWFmcmdiMEVQZUU5dTJNSmViTmYz?=
 =?utf-8?B?ZjU1dktTSjFMbCt2UnpYTWRpRHk5d3I3QUVUVU8zUjhYN1lwcW9BSmdySTB3?=
 =?utf-8?B?ekY3RGFxeURaNlZKY3Y5Y1V1RE9YR1NIQkQ5M01nc3A1Vml6SVNsMEhMdytR?=
 =?utf-8?B?SVhXMTdyNit1THI5Z08vUU9ORjV5dGIySC9OdmZVRUQzL2FlV3E0RTVMdE9I?=
 =?utf-8?B?cjVSTmdOMmhGNS9HNWtaKzFka0tOaFRnSkVXRzE2MTNNWVFwN2tmaDR5UlVj?=
 =?utf-8?B?TmE1MkNrME40cjJsQ2FjOENuU09SWmk0NWhZRHNZU0d6RWtVcmxzTWxvV2lT?=
 =?utf-8?B?V3pDQklvMVJEdXJiTStwRnhYYVlvb2xTVi90MWpEbTUxbzRydHJ4VERYN1hR?=
 =?utf-8?B?UHVWWVhpVEtVZjRnK1g5N1hvdk9TSTBxdklRdFNXYlQrNVBoa2xZZ1FXand2?=
 =?utf-8?B?amJkWTlpS3dpUlRySU8vL21xcXNKRE1jRDBuMTQ5eGhsNnhucGJxQi9Kblor?=
 =?utf-8?B?REdJQVR3YXB1WkswUGkrSkFReGt0NWNBVjU5TVZrV2R6NWtPbU4yQkhEakNh?=
 =?utf-8?B?b2p4YWRVZnF4VGZ2a0JWK1ZRMVI3K1JSQWJyM2RzSDBsZkJtMzZpbFB1ZFAv?=
 =?utf-8?B?R2tmUFhLbTJQMUR4d05hNTdBZ2ZFS3lNV2RRYktWT2xVSWo1WStrMStUMXZQ?=
 =?utf-8?B?aW9iZG9MaXZjNjcwWnNJbXpQcVJRTCt0bFR1d0lQUzhGL09YYnZNQ0lTMHp3?=
 =?utf-8?B?WmJOeG8yL2FpazdVTitjSFhNb1QyS3pKUnBmNW9sNFljOEk4bUJTQjFkRlE4?=
 =?utf-8?B?cFQ2QnRIOGxCYmVJR2gwclhoZTFLWWpqVDNKZ1RsejlMczI4RSswejdXNTBU?=
 =?utf-8?B?endabU9qT05WTlJzdjNsUVhRQkMzRHV3bkI2UnI1enRvaXd3c3VKdG9tQTRs?=
 =?utf-8?B?Q1pEK21Celd0ZDl2djR4Z0dPZTRwZml5eERNaGZGRllVTGlnbXN2UnREbXdn?=
 =?utf-8?B?aGUrUm01OGltS3VVTFZCWlJhVWl4RVpiYUlrVDBTdldyTEVQR2FCdz09?=
X-Exchange-RoutingPolicyChecked: Ds4eUTIo+YdM/msJVAz2PEoIUSEGi0mcXGGe7/CoNgVQtuDTS9pWrl/eS2qIfUr1vByiQEvgJkqzj4sU/f2Q3EBAMe4gU0a+f+VjJxo7UgeGqdJK0q/r/c0ZmDpAcRVG5bYpBMw+3blG9YrtbGYaiT18vO+por9eZFj8c2dXP3ZUyTYTwNUwKnR4SVJJq1gr9LIw6AG0O/ZJY889ecujhxwgsSyUb72WRNK722teWIvGwPfCCFXz63CaeTLNvFFbdgRKGimOKAxPQp64o92XQIoGlyaW2z5BGIRNBpD9j/wbQ7jHWCTevCubXffizmWh9+Ea204NEg+oFZ06/V2bvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c02209a-c620-42c4-a755-08df0427139e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:36:39.2989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Aq2u4setvMIMS0A4xFfUL16JwchWJOcIMGBat1x0VJ7plht2t70rBoNbMwv6zTBACqTtCaxOZtCK9njOhhHHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB256287
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


On 20-07-2026 11:50, Purkait, Soham wrote:
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Add xe_hwmon_fan_update_post_lb() to update fan info after late binding.
>> Add param is_init into xe_hwmon_read_fan_control_info() to avoid
>> resetting user pwm mode post-LB.
>> Call init path with is_init=true from preregistration.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-3
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c        | 50 +++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_hwmon.h        |  2 ++
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
>>   3 files changed, 51 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 65f356c741f5..518ba4438de4 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1848,7 +1848,7 @@ static const struct attribute_group 
>> hwmon_curve_attrgroup = {
>>       .is_visible = xe_hwmon_curve_attributes_visible,
>>   };
>>   -static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, 
>> bool is_init)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>       int point;
>> @@ -1901,8 +1901,13 @@ static int 
>> xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>>           }
>>   -        /* Set PWM enable mode to automatic i.e stock table in 
>> use. */
>> -        fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>> +        /*
>> +         * Set PWM enable mode to automatic i.e stock table in use, 
>> only during init.
>> +         * For late binding, the mode is already set by the user and 
>> should not be
>> +         * overridden.
>> +         */
>> +        if (is_init)
>> +            fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>>             /* Read minimum fan PWM */
>>           ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_FAN_MIN_PWM, fan,
>> @@ -2737,7 +2742,7 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_hwmon *hwmon)
>>                   xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>             /* Fan control tables initialization */
>> -        if (xe_hwmon_read_fan_control_info(hwmon))
>> +        if (xe_hwmon_read_fan_control_info(hwmon, true))
>>               xe_warn(hwmon->xe, "Fan control tables are not 
>> available\n");
>>       }
>>   @@ -2918,4 +2923,41 @@ void xe_hwmon_resume(struct xe_device *xe)
>>       mutex_unlock(&hwmon->hwmon_lock);
>>   }
>>   +/**
>> + * xe_hwmon_fan_update_post_lb - Update fan info after late binding
>> + * @xe: xe device instance
>> + *
>> + * This function reads the number of fans and their stock table 
>> after late binding.
>> + */
>> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe)
>> +{
>> +    struct xe_hwmon *hwmon = xe->hwmon;
>> +    int fan;
>> +    int num_fans;
> Should this be  u32 / u8?
Kept this as int because xe_pcode_read() needs atleast u32, I shall 
change this to u32.
>> +    if (!hwmon || !xe->info.has_fan_control)
>> +        return;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    /* Read number of fans */
>> +    if (xe_hwmon_get_num_fans(hwmon, &num_fans)) {
>> +        xe_warn(hwmon->xe, "Failed to read number of fans after LB\n");
>> +        goto unlock;
>> +    }
>> +    hwmon->num_fans = num_fans;
> Check the types to avoid type mismatch.
We can type cast to u8
>> +    xe_dbg(hwmon->xe, "Number of fans detected after LB: %u\n", 
>> hwmon->num_fans);
>> +
>> +    /* Read stock table */
>> +    for (fan = 0; fan < hwmon->num_fans; fan++) {
> This loop seems redundant.  xe_hwmon_read_fan_control_info() already 
> has this.
We need this here as well, since we want to read the fan control 
information after late binding.
>> +        if (xe_hwmon_read_fan_control_info(hwmon, false)) {
>> +            xe_warn(hwmon->xe, "Failed to read fan %d stock table 
>> after LB\n", fan);
>> +            continue;
>> +        }
>> +    }
>> +
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h 
>> b/drivers/gpu/drm/xe/xe_hwmon.h
>> index 6c6f30208508..7198d7a4a1be 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.h
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -14,10 +14,12 @@ struct xe_device;
>>   int xe_hwmon_register(struct xe_device *xe);
>>   void xe_hwmon_suspend(struct xe_device *xe);
>>   void xe_hwmon_resume(struct xe_device *xe);
>> +void xe_hwmon_fan_update_post_lb(struct xe_device *xe);
>>   #else
>>   static inline int xe_hwmon_register(struct xe_device *xe) { return 
>> 0; };
>>   static inline void xe_hwmon_suspend(struct xe_device *xe) {}
>>   static inline void xe_hwmon_resume(struct xe_device *xe) {}
>> +static inline void xe_hwmon_fan_update_post_lb(struct xe_device *xe) {}
>>   #endif
>>     #endif /* _XE_HWMON_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 768442ca7da6..34295418ef50 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -13,6 +13,7 @@
>>   #include <drm/drm_print.h>
>>     #include "xe_device.h"
>> +#include "xe_hwmon.h"
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> @@ -252,6 +253,8 @@ static void xe_late_bind_work(struct work_struct 
>> *work)
>>       if (!ret) {
>>           drm_dbg(&xe->drm, "Load %s firmware successful\n",
>>               fw_id_to_name[lbfw->id]);
>> +        if (fw_id_to_name[lbfw->id] == XE_LB_FW_FAN_CONTROL)
> Comparing a 'const char *' to an enum (0). Should this be : if 
> (lbfw->id == XE_LB_FW_FAN_CONTROL) ?
You are right. Will correct this.
>
> Thanks,
> soham
>> + xe_hwmon_fan_update_post_lb(late_bind_to_xe(late_bind));
>>           goto out;
>>       }
