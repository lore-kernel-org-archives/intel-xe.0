Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D803C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 10:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D1210E1A3;
	Fri, 31 Jan 2025 10:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGno0/Tx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E28810E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738318192; x=1769854192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U+wBhEch3oQxZMSH1Dx7dp898QVxNXxU6/RqpRb4hg0=;
 b=iGno0/TxcAZALwwsfQF7wnMKUapvBQS/rMyqajfGPnps0dFBU9iGiut/
 FSyoQOf1nJJjk5lSQQ5/I3n+w7mtEmNwMI5mLYV/G2NseK0XJZHEC2lHw
 hFlZbvu1LJKeW7xfZk/Qqu9kSmFYxYGE5CQpzwubHMNuxGIf8fFEMKQJj
 CX0gCLwny+v2dHn3dyBfGWuvhmucCY5RLNfxiHaT8puEUasoIXAhMZBBt
 KiruWBa3HiuHw4KYoQ6zrsoM6DN5mRn8U0rKWdBxRSVhOOkIf8ewsDqSc
 IN2DbdoJqDyhcnpZs5rJnIF/+yL4QoFgH/ZkxfTKqJ78joD8eSE39/LtW Q==;
X-CSE-ConnectionGUID: IFJwrz0+TmCUM8rdezuaqQ==
X-CSE-MsgGUID: sYOvE1GSSBun37+3chFXwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42806966"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="42806966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 02:09:52 -0800
X-CSE-ConnectionGUID: 14ccVnUnQkGlux4KlSyEww==
X-CSE-MsgGUID: yDhTqi6cSauy3sBBfNuR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="109735690"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 02:09:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 02:09:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 02:09:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 02:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHNyj8ChfpLVhej8ACDbffkMYUs7KASdEIUyzSKZ3jXWtIHpxETDBqynloHa7zn+tSzNOScbHi3kLM31DCoetST2uEhd3SGQdAWC4XCOg7ynnhd0WCKZHZ3LcOqqgD1vEObW3PZJ3b1uZDB8zJJ5Z7A8fh1BxW7ftxH/VHtbu+cvOFTvtnC6vQbLUk0NCZg2RA0n1GmlYSvpHWy3LFX6haSsdCkewUS9Wjf4CKu8zKidePFLXN8dMccTJfokIfav56cjjXFJt11AWUbprNUvIs7HTFN6rRxpYRtrbSxbcPRW/i4l2I+VcEavlDEROAHQAsVY0DeWqXsyB6ilwZSLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhxR4RE53tkL0D/3otv0CevXPD3R/Oeq5LklDQ1oFs8=;
 b=ESjq62xPk09PjwaX6HyTFXSM/NqpsfvKw4gnRATUMJ5qe8OAbaa0FNWd5xIe0XfSLYnT1uPtF1foV0F5r/bi8RssFG7EAAuoiYCp5DENeeVDcIIgE/Wbz6ymLghYEHIkCvmQEvavaIDcWcnKpEPJHQ82/adtuz4U97vanLfe5e9O1xnIg31UiPlmIbC84+IeQdayU7dmaQuELYmkiIFUMI84HoL8MkwR/JllNU6NJijoEkk+VLXhzlDmMk1lnQ+ziZjYJweITDjDqF8PAK0omefANamze+kIjc+cxVrleJPzZXNx+9i+ZlkkWGdqiDWxYt/CyEKREQXnr/HfliPefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 10:09:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 10:09:38 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/2] drm/xe: Move VRAM manager to struct xe_vram_region
Date: Fri, 31 Jan 2025 11:09:13 +0100
Message-ID: <20250131100913.659082-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131100913.659082-1-piotr.piorkowski@intel.com>
References: <20250131100913.659082-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: aede62e6-dae5-46dd-bdce-08dd41df5ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTZPK3lGaklBa3RoKzRVUFFCWDdVcklFTURIbkdwYXdwa21Mek9lSHRhUUtr?=
 =?utf-8?B?dTJCb1dSc053WGlHeldseG1pT01LRlZKSmRJc1N1YndTWDgzYWRFZ1hGdzFT?=
 =?utf-8?B?VjhoTkNwNitVUWVld3BqendTc04zU2VhWHFJeS9FSUJxdGMrajhrR0VoSkF4?=
 =?utf-8?B?NE1sS3NjbFVRdXVUdng1QXlRMXAzMmEvcTZSUmZOa1o0Q0oyeEg0WUR2Y2Nw?=
 =?utf-8?B?NGZyY2prLzBFd1hidXQrQVZUOVNyTU1LWjZEMUVvV0hpV1R0OXFrakRDVzU1?=
 =?utf-8?B?ekxkTDNMK2FtMnpLcGJrcHMvNVFScmN1Qm1rNGc0RE50MTVabnFRak95N094?=
 =?utf-8?B?Ym5hS3J4RnFBaUFVVVZuNS9Pbk9NRUVBUWZ5THZyOVpCY0xBdXlzWjdSenM0?=
 =?utf-8?B?WHpzbU13QXVCTXp5TFQvTVh3eXRkQ04yR0locmVMQ2R6MGVtWU9ydVY3dmZI?=
 =?utf-8?B?cURBdG5qU2JoRnZBRjFxTW5COVdZVGhidWpIM3piRndUK3U5SHRKcHdNSzV4?=
 =?utf-8?B?REJTbXZnaW81WGpZYmFXSW1YdjdEQWl3YTJRYTFPdlZMMUtoM3RjTnU3cCtv?=
 =?utf-8?B?amJsRXZrWDhabHkrUDgvcWNPLzJHeWhxUDM1T01UV2FiNDlld3BsOHprOWZu?=
 =?utf-8?B?RUxmNXgzQ0tzQzI3L2h1VmNxbmpxb1J4N0JwTFdMdFE5V0RJMVlCcWhvNS83?=
 =?utf-8?B?MnVySnlFclh1eUZ0OHZxNEhTejNRNnpxamFGNHJkRXlWNkYyaVk3N3d1TCtK?=
 =?utf-8?B?dVVXVDBxOS9tSC90TUNWVjF5Q1hKS25ia0l4OWFpYmdJa3Z2aHlGdUFSbkZm?=
 =?utf-8?B?ZXpmMHR5UTZlWE5PVUJvRzE2NDI4WlY1NHRsZ2dINWJxRk1CVWpnckhmNzNN?=
 =?utf-8?B?MkN0ZlZiRUt0TVN4czk3MEVaYXErOExmN1IrTlNTalhiN3pOS3FWdGpXM1o4?=
 =?utf-8?B?WEZnTFY2R3JsSy9IWXhyYU9IdGZmQ0xGN2x3ZnJuc2dUZUR1TEFYNWphbDVs?=
 =?utf-8?B?dVhwU3p3YnNURzdPRG9Hcy9adFlNT3g1WFF0NCtWd0VuMW5Na2lSWG8yZVBa?=
 =?utf-8?B?bW1UWXNHYVl6N2w0SE1lN3dpMnNZWFBjc1ZxcFlzTjZ1UWxpbndYMUpWUXFX?=
 =?utf-8?B?cVNEbXpTK0FQYmlrWjh5NC9oZDFRb2FYWU9qTWI1VUlYOGVoaGVQaklJR0Fm?=
 =?utf-8?B?cjdUemt6MHdXZ1l2UzZDOVE2ZFptYm13dkdDa1RWMnhmdTFjZEtHTXppTjFj?=
 =?utf-8?B?MEk0ZTRtMForR21TMmVIUmxQTWp2M1RFZkFiMHdleGRwKzNxS1IyY1BNd1li?=
 =?utf-8?B?a0ZZTDJOWFI1UjErdkRhWldSU2dlM2dJN0lNRnNxRHdpa2FhK0pPdVNoOU81?=
 =?utf-8?B?RU0zSzB1Y3U1S3RpV2ZhbGNSR1dwYm42cG5DZ2pWT05Dd2JtbjlHQUpGVDVU?=
 =?utf-8?B?VitDSFFTNWtKdnNvakttbDdlSkRNN2piaHVMcWp4UHJVQzRoYjNtTGJ4MFVW?=
 =?utf-8?B?WGlqbkcwcnZMTmJCellQRGtLM2lrRWZGT1FSSngwd3duRmpON21XR01aNzdD?=
 =?utf-8?B?MTN0MTNNTDdBSGVLdjhKNkRmeFhZN2xnQjg1ZG5oazZ0bFMweWZrTlhUbGVm?=
 =?utf-8?B?dXlrNW90amdTVGg2cHVEQUF4M3pDSDFZOEJGQmdmK3FvaktEcVJ3UkRLc2xj?=
 =?utf-8?B?UnQ3d0lMS2tYZmNIcmxxLzYwdlRxVzhMTVlDd3F3eHRZZzhTRlhqZklxbzJt?=
 =?utf-8?B?RFQzWjVsNTJrUk8xVjNSMk9PQlJhcVNIVzExMWliUUsydFE2SWhmY0MzZEZ2?=
 =?utf-8?B?Q0tQeUthU245TU15eEhTV1hyeWtWZTcvV3JJKzlTbnlPaFRSRzVyckFYNUVv?=
 =?utf-8?Q?KaJUqWzOz2Odg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2ZlRFVHM1FneFFOdjFPTEFTNlFKL093VkVTTHJZRWxRK2RpZHJFdkxBSFNv?=
 =?utf-8?B?ZUxtQXFZOCs5MUpySnZMVWxacCtCUUhTVDRhSnc0V3FpTmhoUTdDRTFWeE1M?=
 =?utf-8?B?Z2lhNGJWdkViSVN2UG1uL2ZUYU43UkhvcFU5c1Jpc3YwdWxVMGc4SmNNYVdo?=
 =?utf-8?B?VW44K0NZekVsdVg4dVh5QkQ4SXNZS2Z4bTg0cEh4S2JWbWxiODhHZ2d0OFB6?=
 =?utf-8?B?bVpnUzNjay9XZzVwYzZnb1BWMXhGWjNqUGNETDgzSnVobVUzckVsNG55cEY4?=
 =?utf-8?B?TENEalpXVll1ellWem5jUTg2QmFuUGxsd1BDcEdFVFRzWU9GRE11cjhRaEdr?=
 =?utf-8?B?WFFEMElDUXpJc25RV3hoZEJpc0JySmRBWkJ0L3g4NFFjcHRzVlpqVXFjTzly?=
 =?utf-8?B?Qm1OZHhuU2RmNWUxWlZqZ0YxSGFwVE5Lb3Z3blFpMHB3c0pBRVFSWTR2QkRr?=
 =?utf-8?B?UXFEMTZqTUpzVjQ4NjFZRmtvcHNqZ29JVWZFaFNSYTdwQzdpNm9LWXVXRWJL?=
 =?utf-8?B?RFFGS1N3c1VJM0s3VXdocUp1elhrL1plU3BwNjlNek9tWjFJNGtBTmFpOFov?=
 =?utf-8?B?anBuUTdOQTZjODEyUXkvOUZHMzdyMUVCNVlaVlVjVU1hdzJ0R2tNQ0U3aHhS?=
 =?utf-8?B?WFptdHNJYXlMQTVyVTNxUUMwdytOaFZRNjBkU3pGTHJsbFJza2xVc1N0K3E5?=
 =?utf-8?B?cExRNVBKOFQrK2p0cDB2TEdtKzZ0Tmg1ZTJMSFVLUmx6TlNqOUkzb0h0Wkt5?=
 =?utf-8?B?bms3VFptKzRHOUpZa0ZNbmk3bEIwRkhMcXZoSE9xY3M2NW5hUEpGUlpOUUNT?=
 =?utf-8?B?emtXaWZoUXdVY3RvYXV5Nnl4VWFia0hCSndKNUR6bDY3azlDeFNWbEtLNGpm?=
 =?utf-8?B?bkZCVG02SGZkUjRVWVpmZUEvcmVGcDlRUWhLTWhwcjQwMFJDYXhTbG95NXA2?=
 =?utf-8?B?WnhGVG1aaWFBWHlQeGxxOVhwUG9qREtQMUVPemhxWk9PelR0N2VYRlo4Wmkx?=
 =?utf-8?B?UVFsUlZIMWRSR0p5blR2a0Flb2sydGd4MnIrVXZIeHpJU3E2MTJFdTU0dWky?=
 =?utf-8?B?eUFFSTFlcGNmak9JZlE0MGpRaUl6WlRJTk5PT0ZialBEVkFWRGJ3blE1SkZL?=
 =?utf-8?B?VjZFSE8yYUxuMkFiaEJSdGNTRmNRaGNlUW4ydG04bkVjdHNWQlB4Z3d2ZExC?=
 =?utf-8?B?S2o4aENHY3hXRVZhQ2dabnhuNlh5Y3FHa3pvVEt5clFaSEJ5SzZ6UWo5Mm9J?=
 =?utf-8?B?TzJFS2tEY0FOUmZ1dHNBVmQxQ2dxUVFQN2ZPQm9GRFg5QTEyM2d1OWhxUGND?=
 =?utf-8?B?ME1aNThwalc3ZUd2QmVkd0d3VGVjc0hpWDRHRVFac3FvUDF5QlZRT3FZTncx?=
 =?utf-8?B?MndSeFZab3pXa0dhcGtTOU8xb3RJYkFKUDd4dXd1UU16VjRlckxEazRzNEgw?=
 =?utf-8?B?ZFUzb2NuNTZ1bmlnSytYVFNrNVZHRVArL1o4ZlJwZTlGWWM0QXgydThtdDJ1?=
 =?utf-8?B?S3VwMFhlclFGNDNaZ3F4VS9mTTd5RjBxWk56Sk5GRXNSSVFYdk5DNGdLd3lV?=
 =?utf-8?B?WWlGa09DR3hnM0RSQlF3cmphbWh5WFdaWHpkQjRITHVGZFdkT25QMGRmWmdX?=
 =?utf-8?B?N3RGT2gwbmRpWWVST1JpaVhrdGNINjZJMG1kUXBjRW1SNmgzcnJYdDU3NzFk?=
 =?utf-8?B?UVNnZzZpNUNzV1BuS2I4dXp5VzJiMkVLS0Y5MVYrV1hZMkZXZ1pRRS9BanA5?=
 =?utf-8?B?WDdDa0R6bFlNcGxXRmhZNDBhRmlpT1JwTTFTRmFHZTR3MXdHeGd1Q3BKQnNH?=
 =?utf-8?B?MXljck1wVVBKR0wzMmZDR3lzaEZEUEJhTTN2TllmZkVTTkdWd0c1LzJzd2xy?=
 =?utf-8?B?N1JHNjFUZUNUNzQwZ2FqeFRTNEtBa2FtYXRETHdRRjBuN29SK1hLWXFGaWlo?=
 =?utf-8?B?ZEFlWlBPMmFGVDVxMlVNV2hpTGl4am04YkJ6TEYrMUVWSkJ4bUU0SEpWeW9y?=
 =?utf-8?B?dFBtSXZKd2VTM3RLczU1Tm83U2tJb2lOb3I0dFVBL3lsV2xoVFZUeGd0OXpL?=
 =?utf-8?B?SmNxdG0xdHZLSlJ3N0Y4N1hMUjl4d2MwSGNWMFY1T0FGNkl6d05vTTdmaE81?=
 =?utf-8?B?cVNycVRqOUY4VVo2OXVoc2RRNDd6SUxJZ3NNNTU0M283VFZiUEUxdDdVUEFk?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aede62e6-dae5-46dd-bdce-08dd41df5ee8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:09:38.3066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNWR3bSIa+AP1vhPyhxoWDdcCfJW+OoQnrDA4BeXwN77SpFGCmO30FYKjlrKZja1OtSgiASXPPqEiIXNi8fOcWaG2y6edB+2maDYtqajqEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

VRAM manager is related directly to struct xe_vram_region so it
should be inside this structure.
Let's move the VRAM to struct xe_vram_region.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h       | 5 ++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 drivers/gpu/drm/xe/xe_tile.c               | 6 +++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c7c285c6a6c9..a4d998add4c3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -104,6 +104,8 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @vram_mgr: VRAM TTM manager */
+	struct xe_ttm_vram_mgr *vram_mgr;
 };
 
 /**
@@ -198,9 +200,6 @@ struct xe_tile {
 		 */
 		struct xe_vram_region vram;
 
-		/** @mem.vram_mgr: VRAM TTM manager */
-		struct xe_ttm_vram_mgr *vram_mgr;
-
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..98e443faabdc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1560,7 +1560,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram.vram_mgr->manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 2825553b568f..b13a0ec7c296 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,8 +94,8 @@ static int xe_tile_alloc(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.ggtt->tile = tile;
 
-	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
-	if (!tile->mem.vram_mgr)
+	tile->mem.vram.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram.vram_mgr), GFP_KERNEL);
+	if (!tile->mem.vram.vram_mgr)
 		return -ENOMEM;
 
 	return 0;
@@ -139,7 +139,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	int err;
 
 	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
+		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram.vram_mgr);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-- 
2.34.1

