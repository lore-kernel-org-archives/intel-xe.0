Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB7C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 16:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5317910EA55;
	Fri, 28 Mar 2025 16:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfBL/nEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784C610EA55
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743178129; x=1774714129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VxQigCQckFCTlsa5uXlhf2FSyXq9HUHZTlDosPE/5+g=;
 b=IfBL/nEQsp3ZmPSKa+0YyKPwTydqQNU28eykjNS40emarMATAGEutGhF
 CC/W/TV1U8xdzBEHOZEBzSuDMk7KxDTXZRlB6kno+F8EHG6Bt2tHgN9L1
 5q3aBWadcsTpqvJXxSxkUTx5QFosJBfX9sjhlhvB5zAluGRYHs2YAeZpK
 drDqtTljOMqzjtfrj4aphVP8u/Ey/g1jTSSSSaIghdnoTR9E0t9lPcmSA
 F+o9/bIzEXnfEn3kFSN1JoAOGRcyfmRqIkOxY8t7SF15OjF4HyWaPeAWt
 hBTpjwUCKouZSneKjN2CLgxrG6954128ZhYt//RorisZSQViNfokJ4RG+ A==;
X-CSE-ConnectionGUID: QTX7KTF1RMOj3fkoypNiwg==
X-CSE-MsgGUID: FBHe0wW1QiiyKvAhrMT28g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="69909280"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="69909280"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:08:44 -0700
X-CSE-ConnectionGUID: UtnHi6T7RLeqT9JvHHIiDQ==
X-CSE-MsgGUID: OxyqGHGaRbWiFzFiX3+j4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="126402796"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 09:08:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 09:08:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 09:08:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 09:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ud/dI/dK5T+u4azsrGBF4DOvo/qwQcUgU+ihI0Vf2c9cht4aFngTPoPNxRYbE7RovFHfbQDdGjYkqQVZdUaas2/A6HHJAhEIz+l4QFXqwKwF8wfxpXfE3H9MtL06E10CcJcsp5EhYF/yC19xMSWRNOXU/t89B+JF6Zib9PYu5de6ABKGn6iipngp5lkAlbjdTj0OW0Yz56GL/s/6YCd0pnQWzuxnBglU9eqgEZpVmRLH006TqBQtjOxdRTTCr3K3pu5e661mLWIwLUmkGrpjd5Nk3+99vo31/TQ25wA39/wLgF/D8mrgsl1WCr14TcTXII3VRfDRM9LmD5BXO5/zKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiyKFuiogiD3RC4L7xIhaCPqqtjUbDkWfgbc45KX6cw=;
 b=dG0fEKKujCHfY3xqryHrpXZxHoULVXE3DGXkBOYQKkabP/wurFZH91E17FsE5NbuLomDDAddQCywA9NIt+0gD4x4Rpco4ZQO3Vuv5kG16OWoCa05Apgh74QRYGkjdMz4uzL/UrB8a+M6KaWldouYQ8ixKRUxmaATwTTgK2E8lB4kT7t1+pfSHqjy5J9ZMy8RZOoVyoAoBY606ESGPy/WQ3T8p34o/PboMsUFTaDbVllpG9pOM1clotplWp3zncILWNVvYWHhqnyLIov6Y0AL1L9zHmOT7yUQJ0k70ZnNad0EwTwBOXG+n8XvTlO7+3X5iHXvcpwzQ8jCOPDV8JDGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 16:08:39 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 16:08:39 +0000
Message-ID: <8e81c5a0-8bb7-41bd-bb38-db261b2f6a69@intel.com>
Date: Fri, 28 Mar 2025 09:08:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't print error about hwconfig when using
 execlists
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
References: <20250328154236.9216-1-stuart.summers@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250328154236.9216-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: f6df9a19-c7fc-4858-c49e-08dd6e12cd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWJOSzZqdkpQUW9hNTc5NmRtMlNFL0FkVTArdnJJbFhMSjI5RmJPT1ExL1hB?=
 =?utf-8?B?aG5jRXJQdEVyZVF2ZE91K09uUXRiLzBiQUFmMlpvUTFPUFg0eHZONHF0ZDcz?=
 =?utf-8?B?dUZ3SGUwd0pScndHdXhDVGhzR3hPSVZJdnlOS3Voc2E2bHlZZFRlaUk2RjFk?=
 =?utf-8?B?REVPaHI2NkJXaDhHcWs5MlM1Y0dqM29BV2FHamE2eFphbVVVN1VFaWJzaTRa?=
 =?utf-8?B?YzhCKytBMUIzK1htb3VxRG5UT3MrS3dEVUxYS3BtSVFRSkZhRGJGK3A4VTRE?=
 =?utf-8?B?YmxIMkNjMDNuS2xpRVAxQk9RQ3hZZHZPbHpJMXJTZC9XbWlGb2VaL2pNbUtS?=
 =?utf-8?B?QUtJU2N0RHRrU1lHUVhEWmx6QVRQVVZDSkEvdjYyTVNyRHpMWFBSUlVzWmJY?=
 =?utf-8?B?cXlMS1VOS0hlR1A2dS9qdjM5Y2NDTitaeHlnSGxoMGJlRmdiVDBYaGk5aVVy?=
 =?utf-8?B?NkFMaWtYY3ovTWhiYjgyY1ptYzB1OU9Ybm1kbVN3Q1FQaEhjRUwySnpMRlIy?=
 =?utf-8?B?c2ZzeE92dDdSS3JvcGE5QlFRN3pWTzlDb1RwMHBSOGdLVzlLKzlkeFdOSytS?=
 =?utf-8?B?Q3g2ZjZTRnJRZlF2NWRobS8wN0pGMVd1Z2tha2Nad3BwK1pla3VxRk9yNmRs?=
 =?utf-8?B?Tis4Mk94eCtmT1dTVExkTEFabnhGM1M2dWRlUjJaQjhtUmY1bnNjMlJrbU43?=
 =?utf-8?B?RGJBbFNkUjh0bnQ3Q3JqTzRJUHZRQ0FSLzRZSzBKUUVqKzZZUmt0dm1zVVM3?=
 =?utf-8?B?bWY3a0pYZFFCN1hMZjFVa2lHd0FZV1pneXhKQmZxWmNmOW9BNEpPblBJeDVN?=
 =?utf-8?B?dXlwVUl0Z0JyS2ZjUEtTU0g4WWlqeWxoeXZMeENtMFNXNjZkTmVEc0wrQXBR?=
 =?utf-8?B?S3RLZi9MYXd1bW5RamdkakgzcGhELzdRRGJWRTkyOG5MLzNZUXZpS2pSVzRx?=
 =?utf-8?B?dWtVNjZlSEZ2TlJjd1g1VXFQUkxueFk4VVdOZExNaWQ3elNKMC9FNVNhcWNO?=
 =?utf-8?B?RXZZbXNMWmZ5U0RTOFRQeGxzL1FscE0vRmxTV2JNaWJXSWNMMVNJVVF5MzJk?=
 =?utf-8?B?emF1eGJEc0lXTS95cG16QXlBNTlzRW5nSjlHV09iR2JhdlhiSGxmZGFVMjR4?=
 =?utf-8?B?NVozVERQRG1uWnBTQkluTmZjREhPQzhJY0RyRVRra3ZGZXIrL2xka0p4Z1pJ?=
 =?utf-8?B?RFlUdlZxNGVVbEErYkdkWXE0QnRQcnVpdWZpMG02clVKK1kvY2xQNVQvTFNV?=
 =?utf-8?B?UGpyc1h1VnpHNU5rdE1LS2dFM08raXBrUEFWS1lCWUdnWFpuY2tWSTE3VWEv?=
 =?utf-8?B?OFRRN0RDTFdZNVpDdVVlbmNlSXd3U3J6cWlrYno2eUxxTWdqcmFrM1BxMUNL?=
 =?utf-8?B?VkZMSW5iMDBiaFo2M3FWSGVveFJMRGRnaUpUVW5OaVdlU0p4bW9TQ2YrMnBK?=
 =?utf-8?B?YUtTQ2ljeTRBdm15Yko5QUlMaGRsZ1oxUTh0bkNZOW80VVRBQzBnRUZCdXlM?=
 =?utf-8?B?QlNzbkt5OVhWRHpQSlAvY3FrQ0JaS0x6K3QzTlQvNmxGZXgxQzdMd3ZOUGYw?=
 =?utf-8?B?SG1aR2dsWld1dUhmS3h4R25INDd2NG1ONWNoQVRxcDVnU01FV0lPOG0vZ29l?=
 =?utf-8?B?YitFdldUMkVtYXdVbWVBSTdoam5MRE9GQnlZMWZuZzhKR0s1QjZRWDRyVHJx?=
 =?utf-8?B?ZWMxd20ybG1EYjlQWEcvRkh4ZDlFcGRlQ0FrRXFLMkNlb3BPZDBlRUFiTWRr?=
 =?utf-8?B?YjZsek01dkUyZHpaWHFzY0ZPU2VQendrc3RzSzNycmF3b0s1ZVUvZ3V0bTNm?=
 =?utf-8?B?MDBkOXRKU3lNMmFOSG53bm1UOFl2cTBmTHdvL3d3bis5WFhXc2xBYU5kYW56?=
 =?utf-8?Q?Vp7zu4hpHJqJN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGhFSy9mOU9BVjNMcWR5ZjBZVUc2cTRsZVo0aHZsR3VFQ1g5TENRT2N5cXQ4?=
 =?utf-8?B?YlQ4Zzc0ZHNRMll6UzU2QkpMb21ZSnJTV0FlUWNXcTBoVGkzanBQZ2JhSkFj?=
 =?utf-8?B?MDdvTDdQc3hjeU4vajBQTlBpZkgzUGMrN21Sc1V5WWtUYUtZK2UwcUFqMmpv?=
 =?utf-8?B?cVRybXI2dXMrZHczcE5sOEhrZWhjSDF1QjRBZ21wUCtFUlJVV3NHSG5yMzM4?=
 =?utf-8?B?QXBSc2FDOEVEdEl3N2tMemxTazVLcGRtS0pDaUpRaFNUdTFoY3dZaGE0YTd0?=
 =?utf-8?B?ZWVIeE5qUFNBbThwUlRXcXo0aE1QNFc5aER5RE1LWk1RY25rRnFEUm9iTTdR?=
 =?utf-8?B?K1FDN1pqYXFJbnhBcUhzdEhvTmc4dlhiSE5WUEdhMFQvOHI2RU1HaXBvREd4?=
 =?utf-8?B?TDM1V0g1d1p2S3dkcmJ4cU5LaVZXcnNuMHRNMklCS0tpR0FZMXVUV1UxMGRq?=
 =?utf-8?B?aGNrZmg1YzNiVXFiOU5meEFQVExNTTNWbGlQQXdpYTRwSWExQTNwd3psWTRO?=
 =?utf-8?B?cHdJOHRaWWVJUHBBdW1VOGhQdFhlVHZjSkpQckF6NWp4UzVnUVdBcW1hUXRi?=
 =?utf-8?B?ZnFZR1p3QTk1NzgrYysrMklxTkNGL1dsRVBOMmxUcmlUWVFlcEVFNGtMRmVI?=
 =?utf-8?B?U1lnbHgyOW10eGxON1YvOUVaU0F3cHNjeG9XNFh0RE1BaDJtT09IcG92bWs0?=
 =?utf-8?B?OUhwY05UYUZXNWxMOG51eXF0MXV0MU9KQ3dBdHUvU0RQZkkyLzdZVnQreWpD?=
 =?utf-8?B?OXkwMnJEWDJiVVNIc1Z0amc4ZXFqQ0FEZ2VMaWZ6RDc2V01XTFV3T1FxUEs4?=
 =?utf-8?B?U0pLalJZa2xUYzhvYzRrMDQ2SXFWOTNTVFZjZHUxL2hEMldUdlorZjNyRXV3?=
 =?utf-8?B?NnY5MzBTVUp2VzRFME1sZWZBSUs4RHA2UVR0MlhYU1JmbWxhbUs5MVNjMlI3?=
 =?utf-8?B?MDNoQzdMUG1wb1V0SnJlWDNaY3B2T2ltVEJsa2JZeWc3L1BRRngrODJRVTRt?=
 =?utf-8?B?T3gyMkNYTWpRZFRaRWZPdDViZWxMellKa054Ym5ubWNSS0tPRHo2enpUR1pI?=
 =?utf-8?B?U0JqTDVQWWxDeXo3STVXempPSmloQ09hcTRUTzBzajRNWUpLMFNENXhQSklH?=
 =?utf-8?B?Mml5MDgyaW00MzhwS28zRUt2OERzbXk4clo2blZyUjZyUXMwWkU1OGRDd3pZ?=
 =?utf-8?B?ZmpaWVpDaHlaZkltYTIwcE5rUjZCQWpNSG1SWVZTSXBOZU9NdXNLUkZqWlBR?=
 =?utf-8?B?cStvVjdXTG1ramV6Z1JnZURSR2FVTWpZYjZmbmhKQ2NXWFFlcG5rQlc2ajBD?=
 =?utf-8?B?THNpTEdJaE52RGV1MnRESklxQmJnRnNCVjJUWk9jUkJUWmZWdmxMTHhBY1hs?=
 =?utf-8?B?cDBsWHRlRndFOGpCSThGUnVDb3FKZUtabjBZc1JaeVpjSTZmVDlSSHVySE1H?=
 =?utf-8?B?dmFOMHJxNjRudFdiSUtPZ0IzL2UyK0VnWHBLelE0WndYTlZYYUlLL0lTMjNK?=
 =?utf-8?B?ZmhGMzlSTFAvbWpRUExBU0lNckZGeWtPSHNaa0ViOEE4cGhNSS9STW5jYnh4?=
 =?utf-8?B?MVJ5dHhPWlVMK0RraTd0RERnakkyazJlQVM3Q2pyVllCR2NZMjdsa2FGK0Nj?=
 =?utf-8?B?dFJlU1ZMVzY2VDU1Z2FEeU1xWDBvQVltdU5LZkR5ZjlMV2pRdHp4aGphSHN6?=
 =?utf-8?B?QllWS2RGT2lFeml0b0NXRWNiT2EvUE5QczRLc1JLbmN0RDV5QitaeHV5UGxm?=
 =?utf-8?B?UjNNRWZqYmU2VU5ZVmNiODlDL1pOM21CNXE2RTduUFdvZCt5L0lFTXpDUEZD?=
 =?utf-8?B?UE96Z21XV09BUHhyWHN4ejJMVTgvSEdaTkhkbVA3S2x2QmltRjdCQmxNbk5q?=
 =?utf-8?B?K3pyNHUzNVVFcE9ITFJqeU04T0lYaEdwam9YUkxVSUhwbFc4SGV4RG9reU9a?=
 =?utf-8?B?L1JoUDNXMEtGU21QdlFnL3Mxb05vRjBXWUNtSDFDTnhSU3BWRERPSjJmWkcv?=
 =?utf-8?B?ZnRpQkgzOVhGelRiNTF2SkxyS3l1WXBzbDZQSnNxZzV0L0hUUDVlU0t5c0pr?=
 =?utf-8?B?Q0pFUTgzeUVjS2xxUE9tbEt6b3UrTE5ramZEeDRTQXVLeTVKWHo0SWl1SWpS?=
 =?utf-8?B?UFlsd1VjMDJHbVNvL2RzclZhSGROTldqRkRSV3U3aWRoTHJrUDhkTEVpalNW?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6df9a19-c7fc-4858-c49e-08dd6e12cd68
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 16:08:39.4072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evMNmMf4uBeNaN89xtvQNDAVYAHUFhoj/NV+nvDrAr4Ccr8W/iZabGTPQ3rXeVhtB8l7gDfv+Kt8+kOFHPe4xDG3YsXADRTTockZ8IPSsRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On 3/28/2025 8:42 AM, Stuart Summers wrote:
> This error message is only applicable for platforms using
> GuC submission - to warn the user if the GuC they are using
> or the platform they are running doesn't have this information
> to provide to userspace about the platform. When forcing
> execlist submission, which is something only used for debug,
> the user is running at their own risk and should understand
> the limitations of running without GuC.
>
> v2 (John/Lucas): Don't print an info message with execlists
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_mcr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 605aad3554e7..d4d9730f0d2c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -345,7 +345,8 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>   	 * Some older platforms don't have tables or don't have complete tables.
>   	 * Newer platforms should always have the required info.
>   	 */
> -	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000 &&
> +	    !gt_to_xe(gt)->info.force_execlist)
>   		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
>   
>   	if (gt_to_xe(gt)->info.platform == XE_PVC)

