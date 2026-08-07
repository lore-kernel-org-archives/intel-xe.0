Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2FAC5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1979910F4A1;
	Fri,  7 Aug 2026 12:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2Qjo6Hd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3254610F4A9
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786105902; x=1817641902;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o6BZ1SojlMbr3fVruxWrtK4Ziru86+iwaCUlj3eJeZE=;
 b=T2Qjo6Hdt9zDhzKMjrCnngjYW0LehQrzuAHxXn8aUifGOojg2LyUKc5p
 A9azX86IVrSJWr95KkEf8AzUlTa85AHT8eAaBMn2SWR0aZkEmPXScMK7S
 MgtHN1dQ6I7I1ANfb1nYPmJ0dFDO/mwuqZwpxjwEGoyJ/xkxoF7t2+Cop
 SCns8tCLvkUtK2Jo/VvC1uPjk1228ft9ZQVzaVqE451gG5/eB+I21XTGz
 dlbzV/tOOOBFGLQcoIJItI0RNB0U7bZJeuzFYy0usQAW9YXsQWjIbaZaR
 o9sq3uB/gC+S4OSInIxsDHlmrQlsAh2n0BsBkMF77rPVNPM9xy5eQr7Y7 w==;
X-CSE-ConnectionGUID: +oT2J80bRZK9oFN24CaSfA==
X-CSE-MsgGUID: fhILBz/dS2u2Z3dcnTa9IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85682464"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="85682464"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:31:41 -0700
X-CSE-ConnectionGUID: cTbg+vOiS1icWb7X7lUnEg==
X-CSE-MsgGUID: gAfUlblwQhKXzCALoSz2Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="262434917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:31:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:31:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 05:31:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vitnOiNU28i1sAKjvOSTg3pdlu/bj9Btm/twi+fb9Wp1WRfq1O955ZDty1hy6hRnEqq4Mabwa8DfOdwPyvAviEyX0KSOolxpMxwOFNw3Pha65iTiLJGvTKLBjkj1RyuEXbNEaeqQ30C8syg1lCS1M16TKzKmgMXri3mEIkomqaPVju/WOv3bVIx97d80emyY2xXN78lIN50F2XnyG7uEs/cyVdpS56fw6oj9kvmqsWOGRJIFVy+9nmT3g+VH8jXnRM2kwKtQ4626fvgfjkpK0lbaDPp1k0DtR8kXC3u5mSI9xS3qxN2DCpSHIMzMEXrguJfvJFrhDc80RaK1Mu8vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjW4/zICHZfdKi9iFU7nsd4FF/Stp8+R9Sc2ID2cn1E=;
 b=mhVOdslr17GDafYIcJrUUElSi61ixU95O9u0598p5NTC4N6XEsnVd5bdqdrLKR7ZJePyRk1QoA8gkhZffvBvJEC5jBiEbPg7yy20YNgmkaxGCql1/aqj1a558EJbAa7oxrQXl9gOVaJrcbRWg4K6PlPRNG9xA0q6WG2QuU/ZqArWwjy4iBM7VTXgv/WEV6fwXW2Bf9aVLL2ycEJa4OlFXLz2LXXznkG99Km+N3mc/DxGltttr2DXMMANUFY10YNDLy2gm41QSgQCbbkIQh01HWViEtFd3xURLiiTKuEw4QRjTQ/FiamYYGKFfljclwUIqkeR+trHDhwrCiEHAMoukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 12:31:33 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 12:31:32 +0000
Message-ID: <8f1777ef-60dd-4d85-9421-b655f5c8efde@intel.com>
Date: Fri, 7 Aug 2026 18:01:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt
 <yoni.levitt@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL1PR11MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: d24bf292-9ff7-4dc3-89b1-08def47fcf2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6juAydq0twYBq0mJfIyWZBX5KmY2dAECpVpzhpJY13MjsTC6zZMJIYih0wqHZALEQ+V82vvwmFXM3TMG5mrasmo+FdiFREsUsEHHKU0rphAt67whIEoHDYa83TX9zet6l/mnljMblafnLQBb7eAk3/+JqN6XPPWz/9Dwx4hswgUPqQkXGtJPItX1vSWl5iU4ErMaZQSqaEAGMaS76oU1o0woEo0BTU6Uv5TJVg2KXLa1kBSKm/hJ61hCuxeCsSuOa6MLrS7BTtpYPemBZNcSdyrM3mMwjQNfWDDxCnI6VKE+lAAGqCTK2v40kZovU423eZYcTEdaoxegt5x6smlgj+Bmf2sqF7sx7XlxmNOP3KLxx51vpGGNIqb3exEbQv0qnCUoJ4SnCvcHv1kdiPkV6Ou/i2n/6SlsUJbfGZfrkvVXvKYhTLHKtog5cRX5WxLSeE894nEnv7l6KerbcZs36+tNpzWl/WP2zZKvvFp9VXDToz6fJWQ+f7o5yK8lgtguiIBu2DA79yB0JIbzpipBHZM69KVul4Z6f9N++OLBmNKstR3k+Hu3wV1Z0/GA13GzqL9nqPwF3qc3oake6sllCEUHz5zeA74vwj1KLAqtDemSogMhl9XjKwyuqnHTR+vQE0kyQ09qaUEwIIVm0EmgzfGOIITXVOFqQHGFs1wNH0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hFeXNCSUpGT2NBV3JjZzZFa3ZoNmk0YmZ5U1RmRVJ2YXhwbFU0ZDc0SUJQ?=
 =?utf-8?B?QVp5c0xzRUtKK0F3UWdiZnVJcUhRSjl1VzRPSEZpWDQzZTFDenFkbEF3RVBj?=
 =?utf-8?B?czhKemtlanptV1ZhZXh0RWhZTnhmc0M2SGN6NTI2c2FyWmZaYmc4UlArMTBz?=
 =?utf-8?B?OW5lRkxxK3Z0bW9EUU9oL2lhaTJPNUMzVXozN2pYemJ5YjB1aUJocUFCY0Ew?=
 =?utf-8?B?TGU0cklkRWtCR1pZS2VHdjRMS0hqbXNwcU1OSW9rRHhKSkhqeU82eXJablRj?=
 =?utf-8?B?RzVKMXNCbTB5YlJKTGNtTmxKdk8reUtXeHlXeUFvb2ZkdzI3bW5GVFFEQTdr?=
 =?utf-8?B?cytTZ29WeERzN2ZWSEtSNWxZNWFvMVhtWEk0VWUyYXp1a09zN3MrbmdMTnBl?=
 =?utf-8?B?cUxLOFdMckQ0UDVaUXIxN01LallFNjJzVUt6dmNXdkNwbG44SWFEb0VmY3JO?=
 =?utf-8?B?SWhnaDFZZTVLRkl1bFhrUDF5WVRYWHdsMkhDdTVRdmdiQjN5bFVYcFNwYlI0?=
 =?utf-8?B?NmlIYmRUYXlCOG1RRFc4RmdRc1I2K2g3MWF4dmZ6cmFxWmxKb2ZZQ1Y4RjJP?=
 =?utf-8?B?YjlGWUNzRkQ3SFZGTkVQUXZ3VWowbFV2ZnNtZlV2dHdXNm9obHA5bDlxcWFX?=
 =?utf-8?B?aGtEMWVqWTVyTUQ2TGdDVjYyU1NkNnE5c2F3T0ltZjg5UUlLYk1FUHFlYjJF?=
 =?utf-8?B?L3R4aXFCUDJNMVV1MTlIQnV6VkIyeU01aFFXQTNlVlVWOW4zVUdDZVpDWW1S?=
 =?utf-8?B?STczQTdERHBudURjRE9wSmx3Tjd3bGEzZk5HMnVSUHBkZmlDWVNIQTJuc2FH?=
 =?utf-8?B?ZzQyaGp5SDBqRmkzdVFGaG83K1Fab29qZ295b3AwUVQxNWU3SzRueENTU3Bq?=
 =?utf-8?B?UWNIbkNjTm5FcHJMa0RObW01M1NDdUtnaDBEUCtDY3RVV3lMOE1ocUR2a1dF?=
 =?utf-8?B?dGkxdmhmOEN1UklxL3YyNG5uMmlORDdSV0s3b25FNzd0aEl1eTVNSUM1T2VO?=
 =?utf-8?B?YW1LNWtiKzQ5VDBKT2V0bXU0WllCNjluSjRIYUhJZ2JzUzFvcU95OE1QNlVD?=
 =?utf-8?B?R0E2SU5PU3pDQlUwTzY3YXJvbkpDcktZMHNzWXEzMGlML3FhMVpmMmhRZFg2?=
 =?utf-8?B?Tkk5M25ER2Y4b2VwOXFoK3FyclZQb0ltdURIR0hhbXRrc3NmR3Nsb0Eyc2FB?=
 =?utf-8?B?ZkpmUFpNNEprUzluUU8wVnEwL2V0TGpuK1dTdkNvSGlqUjBnU096VFN0ekxs?=
 =?utf-8?B?ckRHYWVMVGVBcXhNQVJlbGNCVHNwaEwyNHAweGlaQ1gxVHQ3bnliTHkrcTNm?=
 =?utf-8?B?ejE1dHpXR01wL3dZNVdjRXpveEx2MmZvVCtNS1VvclBubDlEVTJnVjh6RXpS?=
 =?utf-8?B?elhFT05BazdrZ0lab0xteXhhSTY5RW4zbU84d2JNWjQ3ZzNKZk1QcWJvRTRP?=
 =?utf-8?B?TXVLcXphdTU2OERsQlJidVJnU3lFaXByb1l2K00wbnA1UnJBK2tTeFhEeDdI?=
 =?utf-8?B?R1hMeEtrSFg3NzM5cjFES2V3UHQ4K1dBaXNuRWp1SlpmRWlMd1IvWmdxR0kw?=
 =?utf-8?B?Sk1iYlJIczhkRUNCVUVqRE9GZEFpLzdpN0p2QlNEazh4RmtLN2VuZzVmb0pU?=
 =?utf-8?B?eUpUekxUUytIKzEwcUJwYVZhaGRVSHJKUVhyWmdNNGdhVGVwWFE3R1h4Yzk2?=
 =?utf-8?B?S3ZTV2VkcHdXNklrelgwNFB4MURNdHlXVkVaYm1YS29ycUpPcmFFdXAyL2dl?=
 =?utf-8?B?OXF1eW8yMzZ0NXhOdmxWV3B2ZjRaRWVKbDIrMDV0aWFiVDhUVmlka0loWWw1?=
 =?utf-8?B?WThoaXFTUTVjY0treTFCWjNTSjRBWnFtOFV1R25BREVDdnFqVkMwNWhEVVgr?=
 =?utf-8?B?Z0JkUTFJVjM2QUZ0OSthR1hNSjVndTNnRUpvNHc0RGFvejJZeUwrOWZ2UVJJ?=
 =?utf-8?B?R1FNb3RZNmxiVE9jSEFqcFQwamkyeHo0V1NGWVRvNzFDdzJHUEJveCtSNXI3?=
 =?utf-8?B?c3BQWTlGZFVwQWpjUHpacFVFanhKUHdvK09uY2hpMXdrTVBrZ2RDWmRhUTVR?=
 =?utf-8?B?aHpwdHQxdG9HTnBBWHBkTlpZYXZTZzBUZFlGbFo0a0UrWEZiRVRIdXhPNFlW?=
 =?utf-8?B?TTFvWGNCSzNzMmFHczZxSjZ0c3NZeUlzWkREWnZZZzdzUnlmWWJ1endGV3JL?=
 =?utf-8?B?TWlST3FKM0J2aTUxUGFvdGdjRHhpMGxBVTBFdDFpdFM5QjdGZlBuL3RtUnBa?=
 =?utf-8?B?OTgrdUhBUW1HbjVjbXZ1a0FSbjQ1Qjl4ZndyRFVzZ2lwUFhGeURWZ21FeTZL?=
 =?utf-8?B?bXF0SVBJYjFRaHBLRTFDbzV4WHZYMnJ5V05kclhPaTZ2YmlPRFVSMitTeHRy?=
 =?utf-8?Q?tORfSEH2/a6gX3xQ=3D?=
X-Exchange-RoutingPolicyChecked: Goh7uTjWe48xg9lIArDsyouqCkww9ozfHkq9KRKbAPf2q6N1mVbAsu7GGpKBoG+RQO8DI/zjmDrp5/CgPEHDCO+Tl9iayUK/zMWzBJS3QyqMrrqThnGzO8DK0z51gfNTBOlbZUnKizjOqshzQeOThFrfFimK53l28WJpoaqbbAjQpkGuB8dcyXvG3K/ScNreGmhJZxNSdZTQTJXeaJvadz3dtbZGoMAUSl+p9nVUzqqHxGm7GU2Q71BBIa1Kmlo4nZpQ2g4BS+ZavsxoQg9GysE5FuwUTNCiNccSDeURPYx6kJwVm/AGp8tP47BJpNCjlSTsmfIGUtGhMZKQvGF26w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d24bf292-9ff7-4dc3-89b1-08def47fcf2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:31:32.3121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QD3LT2lDBK9fDcdMoItu/SdTnlQVcmbV/KoeIWAA0xOx1kA7Um4B0RRQ+/hFqubz3Xsxa/7UUrf72bdZ6OuWrys/C7OvXwjrB6M61PouhxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
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


On 30-07-2026 08:50 pm, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault situation and serves as the primary handle
> for triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>      prepare to decorate dmesg with comp/loc (Michal)
> ---
>   Documentation/gpu/xe/index.rst        |   1 +
>   Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.h           |  20 +++
>   6 files changed, 354 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67ada1d6c2fb..7ac3954737f9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_late_bind_fw.o \
> +	xe_log.o \
>   	xe_lrc.o \
>   	xe_mem_pool.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..99717fdf74a6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> + * that names one *recognised Xe fault situation* -- nothing more. It is the
> + * primary handle used for triage: a SIGID maps to a human description and a
> + * recommended first action. A coarse first-order action is documented in-tree
> + * per SIGID (see "First-order action" below) so the id is actionable on its
> + * own; published end-user documentation refines it with finer, cross-product
> + * detail. The driver's only job is to emit the right SIGID next to the usual
> + * human-readable text.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is (and is not)
> + * ----------------------------
> + *
> + * A SIGID names *which situation* is being reported. It deliberately does not
> + * encode the detailed reason or the outcome. Those are carried alongside it::
> + *
> + *   SIGID    -> which recognised situation is being reported
> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> + *   errno    -> the failing operation's error, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same situation can be reported at
> + * different severities depending on the instance and the recovery taken, so a
> + * SIGID is never tied to one severity; the reporting site chooses it by calling
> + * the matching xe_log_*() helper (see xe_log.h).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised situation *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
> + *
> + * If a site does not match any defined situation, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new situation is genuinely worth triaging, add it to the list below.
> + *
> + * Scope: software-emitted signatures only
> + * ---------------------------------------
> + *
> + * This header enumerates only the situations that the *driver itself* detects
> + * and reports from software: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately *not* enumerated here --
> + * minting a driver-side id for a firmware/hardware-reported error would only
> + * duplicate an identifier the reporting layer already owns. The two
> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the situations were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused.
> + *
> + * A retired situation is deprecated in place, never re-purposed.
> + *
> + * First-order action (resolution buckets)
> + * ---------------------------------------
> + *
> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> + * *resolution bucket*: the first thing an operator should do on seeing it. The
> + * bucket is a stable, driver-owned hint; external documentation may refine it,
> + * but the in-tree value always stands on its own. Every new SIGID must pick a
> + * bucket, which forces the question "what should someone do about this?" to be
> + * answered up front. The buckets are::
> + *
> + *   COLLECT  -- capture logs and open a bug report
> + *   RETRY    -- transient or already recovered; watch for recurrence
> + *   UPDATE   -- a firmware update / flash is required
> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> + *
> + * The bucket is documentation only -- it is recorded per SIGID in the enum
> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault situations only --
> + * important, operator-relevant faults and events. They are not a replacement
> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> + * using them for ordinary logging would dilute the fault stream. Not every
> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> + * a published situation.
> + *
> + * dmesg vs. the machine record
> + * ----------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> + * text may change freely, and lines may be dropped. The durable record for
> + * tooling is the CPER record carrying the same SIGID (generation is a planned
> + * follow-up).
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_GPU_START			100
> +#define INTEL_SIGID_GPU_END			999
> +
> +#define INTEL_SIGID_GPU_XE_START		100

INTEL_SIGID_GPU_START	and  INTEL_SIGID_GPU_XE_START having same value, which is misleading

> +#define INTEL_SIGID_GPU_XE_END			299
> +
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure. [COLLECT]
> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> + *
> + * The situations the driver detects and reports in software. Values are
> + * numbered sequentially, are only ever appended, and are never renumbered or
> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
> + * Error Signatures (SIGID)`_ section).
> + *
> + * Firmware- and hardware-originated signatures are not listed here; they are
> + * logged as reported by those layers.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..70a41bdf1a01
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	default:
> +		return "";

Please add case CPER_SEV_INFORMATIONAL:

                             return "";

                 default:

                         WARN_ONCE(...)

                         return"";

> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
Typo "identifier"
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode

Info <6> case should not be "*ERROR*" OR

<6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode right?

Thanks,

-/Mallesh

> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
