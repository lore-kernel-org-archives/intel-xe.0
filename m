Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54644C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 17:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1687710E44D;
	Wed, 30 Jul 2025 17:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdHPNjRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E310E6B7
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753895562; x=1785431562;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4mMpqgwHHrmqKgfy/dnncssrfTnO1SYjgXkzaWQRmRo=;
 b=UdHPNjRWqOA9Jb7Tv49yHXB05b/y6QMraE2MbCPUhzcPrncA4UAVbIrb
 hxuhcUkUI/h3+PsUTh9BrNqXg2PVvMWKgdGbBmOSk1TJVtn1XkyVBUlYC
 a37OtVEFi9d71GF21E2UDz0wzIksPwMKRhEqy8e7vwRSAOol3KgXBtVAl
 0akmUI4tuHGFZPY7l/6eS21vR0LlDPKzAdXIWkyuc64i6UWq3xbrmh6dz
 rJDTGFVzLB3eGAwjqPGCwayL5firgePTIU+G/TG/WXr9c5SMFxVLoCRBp
 cLeuzQzBCFmf3wcfR18UAey82D0h1z3XQTiq10xGrervTDh2Ii+RvA/y1 g==;
X-CSE-ConnectionGUID: YdR9OYDEQbm85uFoRGChbg==
X-CSE-MsgGUID: 7Nvh2B6iSR6Rr+b0xqRk+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67285175"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67285175"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:12:25 -0700
X-CSE-ConnectionGUID: WCVQhi06Sgulb/gAPMu3Kw==
X-CSE-MsgGUID: jxkkwdh2QJW7qtSqud4oUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186737713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:12:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 10:12:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 10:12:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 10:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSu/HsOztIKQQzmbgMjL2lOocWHKixqoAOqhngKsmEf5mJfmx6dY8ctFGtSXB6X5YMB2dtSuW/HT/s9gBGCuL71HVMcpdQx3rDXEqFu/eDKOwB1xpanGxDpcNlGZV2al03K/FdN2SP5ANUO/O6RP8qctk7CDmMehTRT0e5SaP9PmCW//7TqZaIpHmrB3/EsH5k7yzpvVM1t6suWHVN8tsK8HBovlf1mGOHK5T+Tbd/jEAD8vsqDC1wwoXhYyAppqmrg1zDXNlBGq/B46IWpYh3xtysHwqdF/geEwivm4OfC8JCXqTHY5zKEzuZzjjklqWtgV+/u7o4IVZUlOoWo/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFtqZlRKwEkvu3T2vLAqXzioiAPK05NF0I1WzRI9Sgw=;
 b=nA6t3GRMAFChsb/vJzBK0ttA0H+ULkHY5PcW0CN0Y0laTf6/6GQV+NHQTcK7/u84qZs4uvWTpIBKuVf3HKh3cdOKKIqQ3uMi0gazhChdQTVlDGk+6BB3CY1iiqyBpSG+LwidRsGXiBV/QFBMI38UYl4r3PmeCzAEk+IBGx/EMdTLj2B07RhY4fbllcKTZJSd+LCJVuiKBSojCQHPyH+s5RXbujd6eRtjRG0JfuLKrH4K/pDeQhpAPOh37R3S/SuVIo6qdSwNdLNbRuoj651yzppKfNMQTjHitGa1FAKAI9K9ivfdNH6OJIBnQKi5/V1Ce3l7Rdi9tTlUMoJ6x9NlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 17:12:10 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 17:12:09 +0000
Message-ID: <4f3a7559-985d-4212-a4b1-6f6386375ca9@intel.com>
Date: Wed, 30 Jul 2025 10:12:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com> <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
 <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com> <aIpIu4UdcmVDCzur@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aIpIu4UdcmVDCzur@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 70050768-f580-4cf1-7b58-08ddcf8c37f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFBLekhRcDdTWjVNZjlxNk9sMEoyYlV6WU1oVGVodkJXRTJrRDdwMGxRTksz?=
 =?utf-8?B?c1BLNVFoeWJnU2F5QmdYZzBVRFpNZUV5bWtVSjBjTlNvS1ROSDNXWjZ2SE9r?=
 =?utf-8?B?WWpIWjBMSlh5M2RkVkZibm40NW5kSWNzVHdYOWpNdkh1UnR6WnoxcGdjUFpk?=
 =?utf-8?B?cyt3bjBwT1JrZC91cWJ2RUhkbVUvRytZYTU3Q05iZXFrdjA5RFVNb1ZWNUJw?=
 =?utf-8?B?bnFQNnZLTUlSSC9kdXVLMDRVTWJkWlA2cWFSTnNLWWhrTWpiSUt1UEtGRjkv?=
 =?utf-8?B?NEtMdGZBQ0JVdWEwNkpiWEhFbVJ5Q2JvUndmMnlZZkRqUlpqRVNJVnYvaFlZ?=
 =?utf-8?B?YkVaeDV3Q3diRXJLOG5wQmZKa2VQbkM5OWZGdWJDTEU1eTZlWEcrZWZOcGZu?=
 =?utf-8?B?M3FwS29ENDhGcmdPOEJiZUY4OEFrK1AwUkt0QmFjREd2anJCR0VTTGV6ZldP?=
 =?utf-8?B?dWtHakdWYkNqcmkwVmo1WGdIVTkxdUM5WGlheTZhcnB2dVR6R2tMamg5NU1Z?=
 =?utf-8?B?RG5UNTlaeVZBbGNnMU1EZEJVLzF1eGNOK2ZwK29ZZ1ZBc2lNakI5MHBVc3lx?=
 =?utf-8?B?MzgzcFlqOWRKZDFRSVo5Q1hCWlFBRzFLQmZmYU1kcFM3MTdCSTV3Vzh4TjJv?=
 =?utf-8?B?V1YwdktUc0tybEpxb3hGd1V3QXB1bFI3Rnl6YXFrcHlzNm04Y21La0VNOTRr?=
 =?utf-8?B?Z2VYZW9NUmpYcWlUd2QybW9DU3F0U2FkZ0tmSjVaMkxPRjNFY2FkZVdwSE92?=
 =?utf-8?B?RzVVajhXVGp1dzdwVUZoYWNPa1M0SFVkSlduLzlPZGZiVUVUTkFhTVFyb0ZT?=
 =?utf-8?B?NU9aRDVPc3paSTFCZm9pTGdQRkNydzBDN1VKeTRFNHR4cXJnYjJlRGo0LzBq?=
 =?utf-8?B?d2VOQ3RFaldsSU9Zb3dFRVl2QXQ2bXJCVTFadEpoRjRyYjFZVzB2RWErODBk?=
 =?utf-8?B?TEhNN0xvZ3dpOWsxZWZycitycjEzaVBuM3E5R2ZDQW9SME54cGF2M3FLb093?=
 =?utf-8?B?cGIzRldFY3NFNXk4QThCcWtBL0prWU9BWkVqbElYenloVjZJdUN3WUVkbHJI?=
 =?utf-8?B?VlRGWmM0dDdPejFvYnpjbmtuOXVtdCtwcVZXeVpKM1pnYWt4VzZKdGY2MVdY?=
 =?utf-8?B?dmpBSHZ3SytML1FPUkQ1RkpZMzJ2SHJrQmljekk3UjdKSEd1VzRXWGxDTzl1?=
 =?utf-8?B?a3hmWU5RZlFYSG13R2pYNjIzVHlhS2RTSmlXMUR5My80T0JIV1pETC82Y0JC?=
 =?utf-8?B?Y1czeHlIdEM5Z0lUU2V0azV3VkRla0xEY25FMVpuRmRCa1hIakQrV0JkeEdK?=
 =?utf-8?B?cFZ4VHlOczFmUG9hcDN0cFQrZXE1U2lPcnNXc0pBak1DZkZueWRFYzhwMXBY?=
 =?utf-8?B?QnlSMklBYzRLVEIvQU8zZ1MyRDRuMUdNcGJNRzBtRzRSZWtVeXhpWllOdFk3?=
 =?utf-8?B?YU1DSUdVS2VZclA3eUhNczJyUFFmaGJDRHZRTWpJMFlxckJqeTdTdWRBeWRX?=
 =?utf-8?B?bGpzY3dMVGpDN08rMTRMM1YyNGplU2Y1NkRuTDMrYUJyZ2c4MDBDQkswZ3Ir?=
 =?utf-8?B?Q0NRSy9UR2ljRXRWalZDUEllVkNKSUszQloybVRwSmt6YUVkUzQ3VmpkS3JT?=
 =?utf-8?B?ZW16R0VKNklKcm51T3VScFkrczBxQ2wzMnFVRmFMeG5ZQk1PSXNJTHZQNTJJ?=
 =?utf-8?B?Z3JwVGdtRjFKY1NTNUozUE13d0dycTBpZVNWM3Fqd3RkVEdnVUlTQi84UmtP?=
 =?utf-8?B?ZXYzVmg1OXN6blk2MG9sTmt3WVl5TGdyMmFQVzRuNkNXK1k5bkNZT2sreWE1?=
 =?utf-8?B?NEJQUUFEVmtqNHRBdEdUY3huaXV5WFJXTVRXbGMvYytEVktNVW9QWFNkMVgr?=
 =?utf-8?B?cFVFZUtQTXB3Qk1xNVk3TVpyQmcySHBLbXh1dEVQeEcyVkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS92TzNqRkEyNEN0MDdNRVhldDdqOTBEZGRnY3RTeHhOUm42SnludzRQTGNu?=
 =?utf-8?B?Mm9WZmg5REgwcTlzVU1SSFdxSW4zTjN0b1Zib3RRWnZRbWE2SHFkaGYrdUgr?=
 =?utf-8?B?Tm9xZVFXaDFtUTYyTHBGaUI2VkF2L3RCMkhxY0JJcEFMMUZDRFEvYko4WWIv?=
 =?utf-8?B?NWtEVzArZExqa0RneVV5N2FVdG9nV05YdmxyWE9ZdnFORzFEQWxncE45ZkFZ?=
 =?utf-8?B?aDhmOEZIbFVuSDZmYzYrakRmR21yWERLc3RoeGRibDVWZ1NjK0NMQWxkYUhT?=
 =?utf-8?B?SWR3SWlUUGs4SVdOSHA4aWpGbm9aU3M1UG9QZHEvNUZSME1BTHFaT2RhajFS?=
 =?utf-8?B?SVNudlBMVW1zNjlCcStmUnB0TTZZc1FjRGwvc3c3ZWhzb2VnbWkwVXVsSDIr?=
 =?utf-8?B?TTYyU2NseTdCeHh2VmQzV1ZjNWloSktpblZRRUtuQzNUWU8vekJ2MU9aa0Zr?=
 =?utf-8?B?Y1hVdFpKYjJlREJCUWZaekJiM3NlWERXY1NpUi9GTHNjN3ZGTS85ZDVMMG94?=
 =?utf-8?B?VGt3NGJVcHdhZVVIOWxDMUVDUDlpSlc0L1VGa3lWczRXaUVoa2Q3QnNOVWdn?=
 =?utf-8?B?aE9hY1NIRmNZbGMwZTJNWFVtOW5wNW5oTG9EOUczU2FYMnQ2MjVFNUMrczFr?=
 =?utf-8?B?WHZPSHpHQ2trVzB2anlHYzRiRWpLOVNzNVhzeVBEd1R1VTZneUNOZGVzYjFn?=
 =?utf-8?B?YkUwY0dMTUI0WUJkY0UyRDZhWWFCdG96M0dwYTVoTXVOa1RLdXdBOGtTT2p4?=
 =?utf-8?B?UDErblZFUEIyN1JJSWJFbUYySi9lMGFCUlZkRkJiTk03SGVLVmpxSGJaSStK?=
 =?utf-8?B?TDRzY2FNRXRqMnFtdVJWK2tITVQ3TXk1S2liaG80RmpVeUI2cFQrakp6SzNv?=
 =?utf-8?B?U3ZkOWp3M0ZtR2xxdzVZYkZPeDRmUFhZWlFZbUpISFhxY1VsK1lRMXBPK1BD?=
 =?utf-8?B?YjA4dU16bi9abFp2T3Z4VzBtRC9zTzVsNGVtRkhnUUs0M0hEV1dlZlBKN3Fu?=
 =?utf-8?B?OUFzeS9yU2pUamFHZUVtNkxzamtxNFRSQXFrQkx1dXduM2xsVHVPN2pEMjRl?=
 =?utf-8?B?eTl5YjQ4TWw5OU96RzFIY2E1RHkzcmQ3Q3pQbnZ2bnJ0RFpmbkdrVkV2RXF3?=
 =?utf-8?B?a3JnWW1zSHdac0R4eHZNOE1XbHB5SEovNUNxRkFrMzF5VjN0ZGovelkydmsr?=
 =?utf-8?B?YWtCNTVNSVZjcXF1UmoxWHBBbkR6ZUZDdWRCTE5zRHlsb2dONTgwdWdaQ2tU?=
 =?utf-8?B?ZHF5RG5rZCtpTnpDTG9XNkhyWkNZeFlqN0NEelI0cTluamhKM1FJSVlrL2dP?=
 =?utf-8?B?MWxYbjhiTEZnWFlsYUVsNC9xYm1jTkxGZDJMc0htNEFObGd2Mmx6cTE1dWNI?=
 =?utf-8?B?eUxZejE5QXYvRzAveUo3ODlBSVl1WUlxRHJrcHE5ZDBjSFpNY3htSSt3UWh1?=
 =?utf-8?B?ZW0rZG5FbGVZSEVkcUh1TWdkbFovRXlGVktubXNqZDRhUVp2NFpxU1JSN0tB?=
 =?utf-8?B?KytoZFdER2xEd3FDK1F0T3RxRVBCRVN0c3RGY1FGMFFlc2pGTittdXlETGli?=
 =?utf-8?B?VklVZG9WaFdZUmpId3BIMkdNdlpJbU9VcW5aZDI3S3VuRGYzVkVqeTJFVFdy?=
 =?utf-8?B?T0Jta0pQRjdUS244ZDNQVU1vRmMxU0N1eGlsaEZOUWJ4cDlnbHU2M3hZaUEx?=
 =?utf-8?B?MFZqT1g2ZkhlOEZXVGk2eEZEcjdvUFpxU2NtblFFKzRCZ1pNK2pwamxRL3lQ?=
 =?utf-8?B?dGxVOW52dk4xcmt4QzVYSnpmdlE4TGU5b2kvT0loK05wT3orTnh3cm1QeVJD?=
 =?utf-8?B?WVA2RFJTWGpiYmo3dmYvU2hUOWxQY1JvQVQ4UGN2VHJldHBGdzlXWFlBbGNn?=
 =?utf-8?B?bGZuUXdXWFVJQzBEUXFnaGxRS0RzMDJjUUsxSGdZN1RVWFJhRHQvaWRCSDN6?=
 =?utf-8?B?L0cwVW1DRGJqY0RmTDc1MVoyUXNINC9xZ0ErVlhLai9ZMjFTaExyaGZGam9z?=
 =?utf-8?B?VnVmeWN0dWE5dnVkYllmYWwzaStiTm9JNHJ2TGxkNjdtRkw5cldHWDlzQURQ?=
 =?utf-8?B?RzRmbWdFVDFRWmEzdDV1R3FSTVdkclc5YnhKTEZIemxiNU5rbk5IcnFYWUM3?=
 =?utf-8?B?YXd4RmhHZEdMWUNxdlFweW1MamhmY1oxNTV0NDNxcElrOXZOL1JCNVVXa3RS?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70050768-f580-4cf1-7b58-08ddcf8c37f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 17:12:09.8960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssOutieyJkLs5yIcdIXRGqKhrgTRyURT6rcRSPQ3C+NnDXy74ezHQ0IavRIoXeJnNzKfI5uupUoLBAX6XXuiuWKdleVTLohKq/Z7OMQQTWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On 7/30/2025 9:30 AM, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 10:23:22AM +0200, Michal Wajdeczko wrote:
>> On 7/30/2025 12:20 AM, John Harrison wrote:
>>> On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
>>>> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
>>>>> Since we already lookup for the real PCI device before we allow
>>>>> to create its directory config, we might also check if the found
>>>>> device matches our driver PCI ID list. This will prevent creation
>>>>> of the directory configs for the unsupported devices.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>> v2: rebased
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
>>>>>    1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>>>> index 5f145ccdf535..766775772eef 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>>>>>        .ct_owner    = THIS_MODULE,
>>>>>    };
>>>>>    +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>>>>> +{
>>>>> +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
>>>>> +    struct pci_driver *drv = to_pci_driver(driver);
>>>>> +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
>>>>> +    const struct pci_device_id *found = pci_match_id(ids, pdev);
>>>>> +
>>>>> +    return found ? (const void *)found->driver_data : NULL;
>>>>> +}
>>>>> +
>>>>>    static struct config_group *xe_config_make_device_group(struct config_group *group,
>>>>>                                const char *name)
>>>>>    {
>>>>>        unsigned int domain, bus, slot, function;
>>>>>        struct xe_config_group_device *dev;
>>>>> +    const struct xe_device_desc *match;
>>>>>        struct pci_dev *pdev;
>>>>>        char canonical[16];
>>>>>        int ret;
>>>>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>>>>        pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>>>>        if (!pdev)
>>>>>            return ERR_PTR(-ENODEV);
>>>>> +
>>>>> +    match = xe_match_desc(pdev);
>>>>> +
>>>>>        pci_dev_put(pdev);
>>>>>    +    if (!match)
>>>>> +        return ERR_PTR(-ECANCELED);
>>>> why ECANCELED instead of ENODEV?
>>> Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.
>> we can always return -EINVAL but user will have no clue what went wrong
>>
>> so the idea was:
>>
>> -EINVAL     when config directory name is malformed
>> -ENODEV     config directory name is correct but
>>              there is no such device under such BDF
>> -ECANCELED  when device exists but it is not covered by Xe driver
>>
>> since you both don't like -ECANCELED for this case, what about:
>>
>> -ECONNREFUSED /* Connection refused */
>> -EOPNOTSUPP   /* Operation not supported on transport endpoint */
>> -ENXIO        /* No such device or address */
> What about -ENODEV, but with debug messages to differentiate the cases?
>
> Otherwise -ENXIO seems the best of the alternatives here.
I'm confused by what is wrong with EINVAL. Are there many other paths 
that can return EINVAL for this operation? If not then how is any other 
return code any different from a user confusion point of view? But yes, 
I think at least a debug message to say "requested device is not 
supported by this driver" would be good.

John.


>>> John.
>>>
>>>>> +
>>>>>        dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>>>>        if (!dev)
>>>>>            return ERR_PTR(-ENOMEM);
>>>>> -- 
>>>>> 2.47.1
>>>>>

