Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE33CA9EC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6892610E17E;
	Tue, 13 Oct 2026 00:57:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2E610E17E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 00:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791853051; x=1823389051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8z8ohqnHjMpNYwX/jew/O+nZDoM2AgYWx175Vgi6CUE=;
 b=hjMdsD+e/xyIftkMilAAJ3q1RVlS4RrI/UMONVyC4fcWGzlPFN8K2z+i
 Vxsyx3RfISgolAaIuX8RLJYEaPBjfDPbQ3HwF+ADRktar0AvVvqLyNZ3X
 exQD6LoEEe3GW1sTE5uDAAqyGiEUzeghVALN9HNiTqmn+6t3IWZy/jKLu
 Rxhk7TrNS0fEHhlap9cpn/QAAb3n7k0u46j5MQoY9mQOMaGPSe5MLQg9x
 PqjdLjFY6JNUwI5juu+kdd36bYwC2djfnH+kR8U+gIMejAQqbGbFs04gI
 lte7ErMq6ErhFY6DUKawUvwRLxhIR0V8QiZ2qH7ZrtRigQh9LO4xDRnMr A==;
X-CSE-ConnectionGUID: F8KFeEn2St6YjJKyA5Fo9Q==
X-CSE-MsgGUID: CRrYxtDrT96hvy16ABkDtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="585619"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="585619"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:57:31 -0700
X-CSE-ConnectionGUID: Fq46Gs9UQ8mLw5uX0rW/EA==
X-CSE-MsgGUID: /rF/GonwQay2ciyHoqoTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1480044"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:57:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:57:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:57:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:57:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHOGKp9wguj3CKZdeiW4jqk2hA8Ul20fBvMy+HqmLvvoE8O/m+yZ7HjhQFpyu06Ls/ZmM/CiNswcgtjPcjes86a7PsiQ7FuSdCxG38qFq9Jyn/Kc1IbospI3uSnD0rYOORuEUuYh28+gAGmf+Adrw8CrTcPtaIihPtnYGMjqHVl0cErMwXveSsxWZJUuQiUQT3UcMN8ZBYng7N7guB0XhTQAHddGvwvNmFXAfGF1yT4+IryQg/ec92KJE3TxAr/p9PywK6oWr+X7kb1W+kCYMxlrUBgFyybkk+lw7+anftcg+bHktNI/JZXiJkj1GZXVLTjHC5dJRpnmKeqxM8gWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPvjWAjd3YEx+1RHPaBJAIvW73dEqEE9npO9Wue6d/8=;
 b=Xez3giUHcoWyURcSiXaEkYf+2QqHrUTl+wem3tva+3wvm7wE7tZPoCl6mK33jMNgPlG9VuJTMQf/Y6/CRlhuurLq8jRg2oEKhqV+LytSYU1wMARoUJxX5VXb0OTo+C80e11VKkSc+x3JBAKvP70kq9ISyow0s3t1Mta7KE/6OOeTSHKq7qsvBYRiBqnu0wCYY7RlTYfrYc6TrpTPOc9BD8qEHrufFoZ6PuoBIZIbgjec+L1mJ/tMYrDrBY70ntfBZ3owcemQa+dfBkpomYYfB7ds8Z7HDt3THywdC+qJDI2tQDjAELIiLREsCUjlwSIoEu69y42hKxuREMybJe31KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:57:27 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 00:57:27 +0000
Date: Mon, 12 Oct 2026 20:57:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v10 00/16] drm/xe/hwmon: Update hwmon thermal mailbox
Message-ID: <as2B6WPZk4xsCo3_@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012130401.443473-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: eec05117-e606-4ad4-6fcf-08df28c4f357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: hhP0pKMc8tSyMBtWQniRKKiYCAZGWZbcwERzXDu51j+ZZ9SaOLEauK6reog8IFeMw2fsB+NXYmC/myAMF/zRvMN/ebhg+nnYwrAa3QFYpay8cYH3VIQwiGrzedt/Y8FE7DrHl/n23e2LyjGm1ZjoqJfEpQUENNgdlCI+isytc+BpPBXugzP1xrDGvtcRypEIgJ+SMiYq56ztm56Nl8At4K4lZ1CEpg8oxXvFy+s0AIpAMl1nBjIMJe4NDpu+6dzozQXzm3BMglHRdnhrovwbxwstk6H2j4SudD8N8rSbycvZLLIzb+xx5WRMkKmXzVCfa1eKCTESjH7l3CUTsZAdk4TRU2kPX8xcKWx/4frNIUOyrVoAL0e3wWuxp7yXNVE813ky3M/Nu64yBHm5xk4Q0VAP5HOY0Rl1jrrex21Ut2H76IktkNFNTHBoLcUygPodkliv1+8NuwSh685ElTw1IUVtDXIw965jj98r7fU0FDIjMItcOPab0d1oM8pD1O+vVtr5lLCYj7BLJzsSdOU2ck4MuhXk42ostS8nB5CGWspduDIcBH+pyIoG4YttumGRsfDYtaJhvvb/m8LhN5JCccY9Zy8f/2UNmbzxhog7AXZXZS/1Bw+UiOu5PG3CXiSCItDXdqhjGNl/CPwBCnFs/A6sFMvFCLcy5mRuc/yorNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbwOSMbKFE6cEu5cPZcBemcLRuGKqjh0SbMQHOIzKU9l/pzkFKZqHL9AEkKd?=
 =?us-ascii?Q?XCfFqNB1ur7YBp8qDVZamdLJDTs9EkvAVsDAUAd9kfy0H/RN9XGmdRzfSXCW?=
 =?us-ascii?Q?EzSGCj3RWYMy6l8tdmwazi98fY4GupEkb5NcklF8YdFa+Ff0Zp9IFL9ahnwF?=
 =?us-ascii?Q?BbDCoOU7Hxr1nIXnTw6C232veyZISoTpafonqLFWxqYSFyK72NoEDymG53kJ?=
 =?us-ascii?Q?EsLnBT6X0/oq7IUl34g/AsvNO/TzZkJyeZyd00m5ipoRRrAOpmHi1tZrAtiT?=
 =?us-ascii?Q?FsHpL7ExxLMwMql7IND4rZogpB9UM+jUiq85aqZ/VmoCs5NXRHAeR8uKwLmj?=
 =?us-ascii?Q?WtdbCgzAmlfaTvLdi9qmEthESr+c8/O03jNi/zKU9rGYlmm6BtftWCN7wdLL?=
 =?us-ascii?Q?wPLKmsfCHWhPFy4d8hLv4Q3Rj8gM3YNswv88pyy3cWTZfLWd4zGQKgJZ3pzR?=
 =?us-ascii?Q?a7lzYnCCt4kkkw99wXiYooYEqbG/KaET8A6OvCvuIcnWvmb709snqe4Fjv8P?=
 =?us-ascii?Q?HojVj7rBMKERAa2WSnyrIHFtyseCmmkeAsxRZ8NYc4L1nkV11WyfQPJdifmo?=
 =?us-ascii?Q?9rENbgpm8m/rs//F8kKUah0PATxrdjgtZL7SiNKvNXCYzhIbmDEOBP/PEeQ8?=
 =?us-ascii?Q?JUhONxQCsdhsVjVF9gvO/xRPxZR6rlXx+zDtHIdc9DKDCLXEiKCQW12HDTJo?=
 =?us-ascii?Q?4b3vxQlu9A/oiJHnJEJsAsOfYH3QnY2xjNm97sG18WPuKPYra26rL1SelBNZ?=
 =?us-ascii?Q?Nanm6BOlOQDXl3NbfpOxPfiDD3fZWhVrFxKToq8jAVewXTWeT64gy19+BwGV?=
 =?us-ascii?Q?WiLm1yFgif4rKmbg+Cx1W7H9yOTLiof63qHZy86Tw1IntOsUpGtOrptzW804?=
 =?us-ascii?Q?xp+aMJKnd/peJu58kORuCYw+SLNgdUKBwBQ3NedXhHd3ivFOp6V1BPwWiqHO?=
 =?us-ascii?Q?gCbf+JDNzYYdMEukDb/uqcOLZzsIWLDa1j/OVtuuMmVNZr9cWKTmiltjkiv1?=
 =?us-ascii?Q?Dzv8o0NRu1QVonw+gY8fPivcNtWwWg3Kf1luDeKWNin3s3pxYTns032gzMAq?=
 =?us-ascii?Q?hYeaCeiy0YnTp1Z6C4dc0BNwnJxYKdHRTrQCgXp7aEuRpI9/l7V8wkiMu3ZS?=
 =?us-ascii?Q?pETPrYBOZLrtB3qyzZir7U+xxF80VWTmOExo64fGGgDVeyiT7SwtnZcV7Tsx?=
 =?us-ascii?Q?rAqtvwWd9AwPS21KAdVC+U2ys7EkbdDRDrchbz6kF8QqeuwBHglcFBJm1Sbh?=
 =?us-ascii?Q?eFBH2KEpzIa2ZEcfOaDP5BaXydHQZtHoAq+UrU1M7hQv58MaFLNAQmA5Q1mZ?=
 =?us-ascii?Q?2f94xZoXZuf8QXr9f5SjRQVhgwlTxjpba7TCVdJptLhAatqKHvk7qn6HgriB?=
 =?us-ascii?Q?tSFp40bDZOQ5DQHxrG3/AN/pJ/kDGgs/mDjPDx2TWFxZksetZPCTm06WPAUD?=
 =?us-ascii?Q?vss5plCg+sl9ZhiAHdfg90ev5msP+teVNrka7pZ9mopfptGXa8r2xETlti92?=
 =?us-ascii?Q?vRwi1ymiZHef0+o6iGD9Xx84o2/BH7kuD2cHXMNbNZ5OTA0zYyLzjl49WRgK?=
 =?us-ascii?Q?T6tTWypBQXZpl1xOPTfWx4nal1hA8uL/LG2B+NX5dnHN72M6huOqzrauJZZh?=
 =?us-ascii?Q?1NjrNCllNjUtbZ0XKtWNXa/NyuEwuMDel/kLOPTNedm9SHf+yHbHfycT2/Qo?=
 =?us-ascii?Q?CejR37Nv0FmWhvHY0E/r7p/mxQSik3EzYamQkdhYntnrlqNNOeN9Y1jXIIFK?=
 =?us-ascii?Q?oSaB+/N1EO+ozLw3jaTeKQyQIiOq2EQ=3D?=
X-Exchange-RoutingPolicyChecked: tcVbehb1kpATiHiIL8z823jU2SokxdCfh7c+gpq3fCBJASOsfnx4VFGhDX7sF1WW4AMrhxmly69LQmtZZn6PXhd5e01yhUAT/d4GuMwUilGm1bTtP89ewed/hjsFj26SoO0i66QX313arVxwaZgoUJIL66hTsOQBnw7gebWDOLJ5XbW4smP7stiSMrZmn0+kyfqNUS/feStbSM3XkLZrlbegwRqrgBLhZqUKw6cAJBi1xC6znehg7koBLuyecHogbbMLQyZ52DruWvdb/5gGRCDZ4IV66TbrM028l0ehOn0CXAIpXMcMlZzRUYgVSE2MQh0edTpGQgY/B+/rmpf9/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: eec05117-e606-4ad4-6fcf-08df28c4f357
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 00:57:27.6827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afG+WJw8K9H7c0g8q3OB4ZupMpeVkykWWK0fBIoirkoh6LcaDQe81ImcH3odJe27iL4Vk2Ho+mBRcDEnah6CbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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

On Mon, Oct 12, 2026 at 06:33:46PM +0530, Karthik Poosa wrote:
> This series adds CRI-specific temperature sensor handling to the Xe
> hwmon implementation and fixes couple of hwmon issues.
> 
> CRI platforms may report unavailable temperature sensors and support
> a variable number of VRAM temperature channels depending on platform
> configuration. This series adds the required sensor presence checks and
> uses platform-reported thermal configuration data to expose only valid
> temperature-related hwmon attributes.
> 
> The series also corrects the telemetry group selection used for memory
> controller temperature reporting.
> 
> v2:
>  - Address review comments from Sashiko, Badal and Raag.
>  - Enable IEEE 754 temperature decoding for MMIO temperature registers.
>   - Split sensor validity check into mailbox vs MMIO handling; add
>     is_temp_available() / is_temp_is_visible().
>  - Temporarily disable memory controller and PCIe temperatures on CRI.
> 
> v3:
>   - Detect unavailable temperature sensors: rephrase a debug log.
>   - Decode mailbox temperatures as 8-bit sign-magnitude values instead of
>     s8.
>   - Use VRAM temperature sensor count from thermal config on CRI: address
>     review comments from sashiko-bot@kernel.org and Rodrigo.
>   - Decode CRI temperature registers as IEEE-754: reject temperatures that
>     overflow long on 32-bit systems.
> 
> v4:
>   - Address review comments and issues report from Rodrigo and
>     sashiko-bot@kernel.org.
>   - Decode mailbox temperatures as 8-bit sign-magnitude values.
>   - Cache sensor availability during registration.
>   - Enable memory controller and pcie sensors for CRI.
>   - Derive the VRAM channel count from the CRI MSU enable mask.
>   - Use CRI-specific package and VRAM temperature registers.
>   - Handle the CRI memory controller and pcie sensor offsets as per CRI.
> 
> v5:
>  - Remove the unintended IGT prefix from the patch titles.
> 
> v6:
>  - Address issues reported by sashiko-bot@kernel.org.
>  - Add VRAM individual channel CRI_VRAM_TEMPERATURE_N register for CRI.
> 
> v7:
>  - Address review comments from Rodrigo.
>     - Use ret instead of count in patch 1.
>     - Return true for platforms without temperature sentinels support.
>     - Rename has_mbx_temp_sentinel to has_temp_sentinel.
>     - Add a info flag for pcie sensor offset.
>     - Simplify temperature channels config.
> 
> v8:
>  - Address review comment from Sashiko.
>  - Revert the unconditional validation of temperature readings on
>    non-sentinel platforms.
>    This avoids creating spurious VRAM temperature channels when the
>    corresponding sensors are unavailable.
> 
> v9:
>  - Address review comment from Rodrigo.
>  - Use helper for pcie sensor offset instead of info field.
> 
> v10:
>  - Address review comments from sashiko.

for some reason I don't see CI results for this v10.

Could you please resubmit it?

Thanks,
Rodrigo.

> 
> Karthik Poosa (16):
>   drm/xe/hwmon: Handle pcode read failures of
>     xe_hwmon_pcode_rmw_power_limit
>   drm/xe/hwmon: Decode mailbox temperature as sign-magnitude
>   drm/xe/hwmon: Fix thermal sensor data handling
>   drm/xe/hwmon: Add helpers to validate thermal sensor readings
>   drm/xe/hwmon: Handle unavailable memory controller sensors
>   drm/xe/hwmon: Detect unavailable PCIe thermal sensors
>   drm/xe/hwmon: Consolidate temperature sensor availability checks
>   drm/xe/hwmon: Cache temperature availability to reduce probe time
>   drm/xe/hwmon: use CRI-specific package and VRAM temperature registers
>   drm/xe/hwmon: Add platform-aware VRAM thermal channel support
>   drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
>   drm/xe/hwmon: Update memory controller temperature offset for CRI
>   drm/xe/hwmon: add PCIe temperature support for CRI
>   drm/xe/hwmon: Simplify temperature channels config
>   drm/xe: Validate thermal sensor count  before reads
>   drm/xe/hwmon: Propagate all hardware read errors
> 
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h    |   4 +
>  drivers/gpu/drm/xe/xe_hwmon.c           | 525 ++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_pci.c             |   4 +
>  drivers/gpu/drm/xe/xe_pci_types.h       |   2 +
>  drivers/gpu/drm/xe/xe_pcode_api.h       |   2 -
>  6 files changed, 416 insertions(+), 125 deletions(-)
> 
> -- 
> 2.25.1
> 
