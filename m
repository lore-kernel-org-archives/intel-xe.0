Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6968C7114A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BC210E5F1;
	Wed, 28 Aug 2024 21:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrG8B8uQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEAB10E5F2
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724880320; x=1756416320;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AXmaXctmz9FbFBYVPVRCf535r8EbcZGsebl30lHiv1s=;
 b=UrG8B8uQLvGPvENtDeRUFIpQhv2mZcMgpR5mTiM/0HOmN4n0S2Qehaso
 TUhTa3tI6iPtuh8XLQqj3rEISgEYflfHcSP6imGpZ1Qq9H5nOg79P4Gju
 6Nb8n3TtiucGfNmtToMpuhD282ihSTa5y6EN6kAOgXWJyq7jxAhkXGJjs
 7JHPFva+R+2kATdwmdTjSZLJtZSg0fRfKzDic5mApcjaiF96eSrzPwdkz
 YCu/6YHhEbcca9oPnoJ9QCaUpegU1FaCMr/pr4HX8euuUHHByjwqKoZ+Q
 ES9wlALEbEq4JC6z4qSEyK9TvC/CG2hGiwHVDDsvebY+J0X9vbXvM6sar Q==;
X-CSE-ConnectionGUID: 8RqxE0QLRXOEpEqZJslrUQ==
X-CSE-MsgGUID: mPVn2txbSZaIqe2GogjXnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23247107"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23247107"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:25:15 -0700
X-CSE-ConnectionGUID: HiB5+nHvTfmBwy7HxhlGdw==
X-CSE-MsgGUID: cq9twuodTTmETypnA/4gwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="94087483"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 14:25:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 14:25:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 14:25:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 14:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gctDk8qbaBWy62It31ajVsCLNb1vApw8aVH7Nv39Lwc37bBhL0Ynwa7UFKNsqZCrDH8utGPry18vPKRhCEj8Bb6X2mt1ICYfianer5CK3V+v57F00c5Y8wdgXFqsQx/LCPGuydppvGcDSjb6NkNbTTdfSXzhpXwci66/ufyzAPlot2nVIoE5vXurn6MJtHUvGZLFeFy/Zwy6ZzXLb9yu3anHNTrpm7AjwVIV6bRRp8J4QIhyR7I5pmvr4QXLqwzbEu784kEfUPtHZSDWawPfi/5Z987W9xFr/RBLxA34vINSnN5738v2TZwh5/2vEV0Kfl02INP9uoTVEtqMj9Tv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Updko0j/e0nmHOLHfYa0zA/pHfEZsnNGeFElAaprt0=;
 b=E221EFQmu21zPcp86bJtkpu8EIkRiTKczr+MEyjvcY740+c/IfZw1JTClsPVipYA7PUU/dFfRNxFrYvQ4u6uWSdByKCMRtvAvpFE2Ggbmmf0QBfWc3GDqtZ4wcRYFHgIiRrYtmCfv8yS8aGwtVD7DnziACzZgvOwD/NQS4EPFo5WelrFsFuaVJU8WFh2j5c1kL9lazPwCiLz0XzBZOfuw0oXLjPgFb5LOny9fY+Eb25W5iaQZIr8RGHoYCHZaQaXIQUzN4jn6jRJa2D3GU7PQ6bRAhvrKswzcfryZDwdtDFu12v4TTE+Gnik9vbj9Huv0OzlAx3J7LXHyHbB0IdkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 21:25:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 21:25:12 +0000
Message-ID: <217f9b75-f08d-4fe6-8f53-10308e8503a8@intel.com>
Date: Wed, 28 Aug 2024 14:25:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/gsc: Add debugfs to print GSC info
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
 <20240813231148.1663731-5-daniele.ceraolospurio@intel.com>
 <2a8a0825-96e4-47ba-86ac-d9416c4d8e6a@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <2a8a0825-96e4-47ba-86ac-d9416c4d8e6a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ce9332-4ddb-46a0-c450-08dcc7a7e675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enI4U2l1T3lTdU92cXhkZDNJeE80MnlCb1dIL3AwSGtrRGdmemJWamRSOHFz?=
 =?utf-8?B?b2dWa3FRNE9qTjE1UFl3d04zWmsybmJKaUhSWjRncDhDayt5QmgyZ3JtV2I4?=
 =?utf-8?B?NzVMZGJZV05URUR4UzdXSE04c2NMRURQRS9rcXZQSGcwN2hpME9HS2YrUGRn?=
 =?utf-8?B?UEdtT3Y2K09PbndmRUYraTRBNEpaTlV4SlpRcFR6TDExY3Y4SFpVYUFDeENt?=
 =?utf-8?B?RFQwUllJcG96bTJQbjVDcXNYaFBQM0kycWoxL0lnMWsxd1lwTlY0YUMrM2tu?=
 =?utf-8?B?c25aSitJWTExdm1mbDJjeWMxTDJEQzNRZko4TW1kUTVGblRJSUpiRVA4bktP?=
 =?utf-8?B?cjRxUzVIUk53bGdRbnZnMjlRSlFiWndSMVVGczY1MWQ3M1FGMXNjcVFKKzU2?=
 =?utf-8?B?WjVZb094UDhrRWxaQ2Y4aEM3WW9UcllvUlc0aFZRazFOVmIveGhsRVlhY01m?=
 =?utf-8?B?eVFjZ0pOUU96UWExRS8ybG9nOWV2Z1dWWDdqcUtaWFhXbnFudmJCQkNnWUtR?=
 =?utf-8?B?WWVSbjlBRDdBRE5lVFdkcHJJM3BNck9kemlkaHZrS2pKMVBlQjgxYUlpckV6?=
 =?utf-8?B?ZHpZZmREZW9BZFpQT3ROVU1BNERLRW95MDhkQ1RObmJaYlA1NWJmOEtRTEFv?=
 =?utf-8?B?RlhqU1BrTU4zZzRMejNlaklMWXpCcjBJK1JpUjIydkhQTDhrRFR3bGVBYUk1?=
 =?utf-8?B?VUtnNk5NRGxwK3czU2pUSnNYNkFxZTQxRitBQklNV1AzVjY3bHNCWERkbmcz?=
 =?utf-8?B?Y0c1V3lWS0RJK0wxR2gyMlExbmxDUThxNldqN0xWWlIyclRnUXV0S3U5VVNr?=
 =?utf-8?B?elJOZnVYZmplK2dqd3lkUkY3bjFmN2Q2RjZ1V3FHYUU2K2V2SWdUWENqaTR4?=
 =?utf-8?B?aTA3N3pTYkJFbUgwcVhobXlETi9sTWlsMytUeCtmSW5lZHF6dnlka3l1cWRs?=
 =?utf-8?B?My9rNytZVjBLQ3hJMHh0TjZBVllnRm45S3ZNdHQrQUlicS9YUUFOSlZjR3pX?=
 =?utf-8?B?bUJpSSs0VkZjNDN5VFJrdldxMTZJSGk4ZzExSE5ia1k2dFNWalljd254Z3JY?=
 =?utf-8?B?MFpQOFc0ZjhVbmJ0a1dxTTF3S1hlOENCWXFqU1FXQVdaWHB4RGRTRmozZlQ2?=
 =?utf-8?B?eGkrQ2h6OWVqTStFN1IxZmNsNGI2bkEwWVBKQUFIaExscnJWMU85MFhrSlFQ?=
 =?utf-8?B?MnlOVEd3MUNKVWNhd04yTDRyQ1BCeEZIbHRZUk5CWDM3MjRxQW14cWRjcXlO?=
 =?utf-8?B?a2E3WmVPdEI1M3lqcC96Z0xReDBxbTNDWnVaY3k4RkxQL3J4d1k1U2dEZE9W?=
 =?utf-8?B?dEhhckpPdU1TVGtGL1FONXBsSXZBSFgxTk1tdTRJRis0em41di8xUVVDNkZE?=
 =?utf-8?B?VDBkQzYwZ29pL0M4cFB0VVg0dmtFaWtBa1Y3dFl5VmZNcmVYdWh1ellZTElV?=
 =?utf-8?B?KzRHT0oyTE9JQWxoSTl1cEZKa0xEOG9Id2kxNHR1U1ZoV1Z0V3VCNDNBZ0VB?=
 =?utf-8?B?R2xmUjlOTnBieGpXK1dVS3JjYndBbEx6c01KU09ORFN3U2c1NVRveVZ4V0cr?=
 =?utf-8?B?dEgwSmlwb1FqOE5NTDJ6OFd3cWtEaWR2V1pxb3FoREJXREl4VW5CRE04U0x1?=
 =?utf-8?B?SEhFOTdEU2tWUTRRRzAyZnpjbHlkell0SzFEZmlyK296UWNUWXpMS0ZqR2Fq?=
 =?utf-8?B?VmhkUmFVV1pTZG54MVdNaFNUc0ZRSDNWNXBrMjdHKzgvR2kyTUhFSDFaUHRK?=
 =?utf-8?B?dTdWbFlDdVcrZEFLRzVQYml3L2xDRHJFQjNKMCt4b0xBc21VRnBaVlAzZVMy?=
 =?utf-8?B?YVB5NDJWWmZESjRONmFBdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZKOVlCbTlkRVBvNDkvMEVKcWRtSUFIUGlnU3MwWHRUdHkycWdHOGozRlN3?=
 =?utf-8?B?c1pweTg3bEIybGptZ2tQZ0lYeU8zdWJ5N0t0VEt4bzVudzkrdEIxRFc0bCs1?=
 =?utf-8?B?U1VadUtmSkpYZGgyalErS0ZEMXpVbGVWbXhCRWNOb0xqNDZqRWVveHIzRVY4?=
 =?utf-8?B?NmtGV3UyNkVmaEIwVEdHcFp2VE02WFMvRUM2VUpxTDd2bHp1NnJlTW9PTnlD?=
 =?utf-8?B?VmZJSXl6M2dsbVVzZFpZVEVtN2VXbDVabHgwRnBWNWV2b2wvT2o3TG1GNmRu?=
 =?utf-8?B?cXFERFFRelp3eVk2V1BUSXN2YzZVaGdSTjRmcnc3aFlwMGhqcUV5emhscmFG?=
 =?utf-8?B?VUJBU010bGkzQ2Q2RjMybkhKbzA5b1AwbVl5OTE2OWM0NVRBQVY5VExqTG1D?=
 =?utf-8?B?L3ptU2hqS2xYMENLU2NqSXNlWDByK1hPTkJJR2s2Z2Y0VmVLNWF3QlNQQVpa?=
 =?utf-8?B?MFJiWnhXajNzMVZaL2pDeDZzVlorUmpHYXNBZk9kVjNLS1J0TGZVZVhieFdw?=
 =?utf-8?B?V00zaHZMVitBb0U4OXpCeFZzRGRzenVrdmd3TUxJeE1WSDF4bWNTS1NycHcr?=
 =?utf-8?B?alQyblJnT1hVdGkxN3ZIT0FtaXhSNVZSSmw0RHBHaW1qYnJ0TU1jL0J1RzR2?=
 =?utf-8?B?ZzVkZTRYaldXYzA0YUhzWC9qZjd3QnUwOXVqZGJITVJ5T1ppMzVyQkRzdUd5?=
 =?utf-8?B?Mmh4bzArUmhTYWhHbVNmRU55cGxTK2J4dFdnSTJHQUVqTEdKd0pIdEtia0Ev?=
 =?utf-8?B?MDBYclJvRjBCVGxGL0Y1MDhiWkdVOUtUVzRsWng0MjVsSUkvMlJSVlpGSGdU?=
 =?utf-8?B?R3M2OHkwa1RYV20vSFVmZm1ZR1lOL3RlYW5JK28vU01sZyt4cWhqcWsxTm9h?=
 =?utf-8?B?Q09QSkNGTEQzOU95YlNyV1FzSlA5b0FnYjU3akJaT2d3cVNwZ3RlWVhIZlFu?=
 =?utf-8?B?aU5pQndBbUUrR0hPTnZhaU9jUVlCUjh5RmYzQmg4YmtqakhtdS9Heng1Qiti?=
 =?utf-8?B?Ym4xOVhsUlVqQkY0bG9wZ1lFSm5WekkzQXdIcHFvd3pmcDNEc3BnVDYvVXo5?=
 =?utf-8?B?M2pTa1lZb0RsaHZvb2pzeDYwbW5PUVM4RXlKM21FV0NMczVSSDZnNXY4bVkr?=
 =?utf-8?B?eGJUalNvR1MxQSttN1BTM0JONlVYOWx1eVJaUkFDbmllRjNqdTlrUVRTSnQr?=
 =?utf-8?B?K0lkdkZQWG1YSERIMno5NUxFNjl3OS9keXVCRVVHUzQzMHE4a0JsZytUa2JF?=
 =?utf-8?B?TFdRcHdIb2daYnJYcitjQTI2ckZOdnhUQmlUT1krZ24zRDU3UjM0eVZZM2JC?=
 =?utf-8?B?TjQvcnorSmxwY05ydFhOcDJ4RitaZVBYS21WOXhnc0hGb3p4M1IxZXhhMHF5?=
 =?utf-8?B?TkkwOGdFbjNPUmpDNFpwa0QwSWpKd2pqUVA0cEF6V2hBT09PTTJhTHM5UC8w?=
 =?utf-8?B?QlN0Y1VTU3NERURpK2tlME1Cczd2am1XNy9Da2tTd1lvaEYyVDloZy9sYUNQ?=
 =?utf-8?B?RFNvY1hWTmYvVHlRYzVFQkcyTi92amp4MWtONlRGeWJ2VlFBZlZWRU1GVmln?=
 =?utf-8?B?R3Q4b0lVMVNWc3JHTzhSWCthUS9wbzY3QncwUkJQUUd0YnpFUHRsTG9JUXhB?=
 =?utf-8?B?blhvU1QzR2FpRHp2Mk1sK3llbVF0cFF2cEliQ0hIME5JRGxBQ2NKaWt5bTdp?=
 =?utf-8?B?ZFZHL1BRN2l6UW91YTJBaDVRTHFkR0VSM0xPSzFTTStTNnNpSkR5MTQ2L1ZR?=
 =?utf-8?B?L1Z2Q2Nic3phY3h6M1lXYTVXWGJJMjY3QTFHWVdrdUw4OE1BeVVpRkpuK1pl?=
 =?utf-8?B?YTBXRVBCeDRyOU5qcjhqWCsrc3hGQ2pFSEl0bENTdStKSXdkWWlqZ25DOG40?=
 =?utf-8?B?NFJTMTh1aUtHK21UdGRSelJEWm1wano1Y0hWeU10dFo1cXg2VlE2L0pvWWQ1?=
 =?utf-8?B?QzlRSkhhUk5STjZSWEVROW5QQk9kc2l4WHpKZHpSZW5RRGVxRGtDaEJkdjdD?=
 =?utf-8?B?ZE5KdEF6S1A0akVWYnpENWJMcFpsLzdBc3RGZGtpbXBpNnAxdEVPMDlZSmlt?=
 =?utf-8?B?QWhyeldaTWhSYlJTVjlyZ3pBZlc2d05URGw0ZE5SdU0vM2VWUTAzRk9lcEpn?=
 =?utf-8?B?SWx4bytXUTFZNGdhYUhSbkE1SkhJdEJycXgxOEwwbjBsTHIrdFllYzZCczVS?=
 =?utf-8?Q?LRcQ1P99dDJ5R42SZcgXeh8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ce9332-4ddb-46a0-c450-08dcc7a7e675
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 21:25:12.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NulAGS0uRChXAuPAV+0KFPz/i5oKsi3+q/lSOAAc4hFejO/7qjG+6aagEWGQrnYDR0UrPn04TG0j9pFzR6XBbKo+jgdk44Q1VokwoZtBWag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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



On 8/23/2024 6:02 PM, Julia Filipchuk wrote:
> LGTM
>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>
>> +	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
>> +		local[i].data = gsc;
> Behavior looks correct. This array is length 1 here so the mapping
> works. Would a manual assignment be more clear for intended mapping?
>
> local[0].data = gsc;

The idea is that this way we can just add new entries to the table if we 
need to without having to update the code here to manually set data for 
each entry.

Daniele

>
>
>

