Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66189C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 12:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2481310E873;
	Thu, 15 May 2025 12:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcslH0/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F6D10E873
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747313797; x=1778849797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O0GZ71/q8ADURquXmt3Mv+zkgXs4nGDcW0Y6tqICKmA=;
 b=RcslH0/453SRksjJ2l99LJPSX62c+O2JKt82PgJ5MGsDozuNlvt5rOWz
 qirCapoiGMxO/Yu7wQMBSIq3ymtA8kK1QWAemXc8C7xgdtD5GpWkC20uC
 e93lCJlz8bQQwSIfHj7cuaJSLFmcXQVQqEO8dDOixOcPRadzEaDg2nMlc
 5Im8AvAvi8CEJYnLwlyOV3kRuDT8Q3n5ds08MNgu2K6ZjXZPZmbijUcIl
 uuBX0g0wJRdEVnPBRyiwt0k6OOQ+Az24LlDrtMIjHIwA9s3pSiTh+TpWq
 qEgqiayeuxjV8XnnBgL/N6kK6HmoeYydU7qqpIQv+GziztyCHRXV2kF+o w==;
X-CSE-ConnectionGUID: KdBvkjcISPODCyK+TVJVhQ==
X-CSE-MsgGUID: VfDc+X0BSEyHiTDT8NT+Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60584723"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="60584723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 05:56:37 -0700
X-CSE-ConnectionGUID: lRH/ZT/ASKOb+HFOwH/0Pw==
X-CSE-MsgGUID: XzY47JpIQGu6odTWoDIUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="169427134"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 05:56:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 05:56:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 05:56:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 05:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD3ISsQiJzKrzh+xCjEaqzltAn80JLPtuD8++YVyQa0YLXX6mplxIntOmV1txKDirB5sjcWzS9VW4A2ZQ27ITYkjIJ/g5i+M5J/gwlVOhbBG7AOdoBOe0nPB3ZEimSBgopd366JTBItkDfajeaoTxavb7b8jyCnPbgWG97J4Rf18UtKMtNDD8evhOMMhGMazCiXccUrVZLbBXOVfGPmWTrulDtU3Zzj9PE5XbUDSUmyS0Qi/XygsiLj7ZvWth8eONIJBVZ3bsXrHC7C1c7yV4UCEf7EUwV0wrrgn/HE7mltw24jIvr/2G411m9Xuy0dfNEN9TuoPD1jAR+vTD/iTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T82avpPfvnlgJQHZ8LJtkJ4CI9B6ukVc/3ena+wG74A=;
 b=ETkWQSwSjKJODLicz7WgWWDtzxTIfgOv80NHljFXH3pLJ7/VFiSqZL0+CAOkEobR8q1xgNcjoMV4yO+pKQUO4gye2bG8BtSlZt2Bat26kLO/5MuWLVk/9t9fa8TZvc+6ute5cdpGC+N4XDzquizgk5+UqZn2pqkf3fbUBnaSIcAZ2eui4ee6KSLWi+V3oExW+KPKNb7fTijI8vLQUsLcAk4yaYOM7wMcJKn7zTOVnzgmoRWIi0JT1laxOcImJ9dJJO0yqhGASdCOQENkCOV4g1DubRdtx0jIaPuB2N91fmBUMem25vNisHkJ8xjzuKKrqaLQMvPa/QKYUQ2e1mS98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 12:56:34 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 12:56:34 +0000
Message-ID: <95949039-1583-4168-a7e3-2c84a867ee64@intel.com>
Date: Thu, 15 May 2025 14:56:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-4-tomasz.lis@intel.com>
 <c0204677-8262-4157-bdcc-bf20e3bb55c6@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <c0204677-8262-4157-bdcc-bf20e3bb55c6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0297.eurprd07.prod.outlook.com
 (2603:10a6:800:130::25) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ca342d-8723-48e7-c75f-08dd93afeb87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1Z3YWwxR212RE5pQ3J0OTkyQkRoSU9Ya0Y5R3dRNjlYazQ4U0x2L283Wnp3?=
 =?utf-8?B?VlZRNmhESllVNHJPdk85ZnRNSXZldTlQVzU3RzdjSmZ1L3dQYXl5bGszTWxE?=
 =?utf-8?B?UXZVbUIzMDJzTWkzWG5CWWtmU3I1THpFaElORC9WcVdnUGZxakh6RGF3L0RZ?=
 =?utf-8?B?dnlIYjhaVGJzRHBvWFY5L1lYZXdPeFU3WC92dFRwT1VFUkdiYWpqR2FwR2Nl?=
 =?utf-8?B?cXlBeHcrNURVbHkzV2JRalB6b3ZDUHBFZE1QWDh6OVF5YStlRHR3N3JTV2lp?=
 =?utf-8?B?T0VWZG14b3haYzhPNGM0OSt5MFpxWUd0TEUycFh3UE9va05TZnRxMUdSTDdN?=
 =?utf-8?B?MVZ2UWdpV1FEeEJjazZjWlZNRk9GeUx5UTRjejlFRE1tNjhtbk13Q2JXMUxx?=
 =?utf-8?B?VjVzR0Iydk5QWmFjNCszVVVwWG1aTFM1eTJyRW9UZWEzYjF3S20rMlZQNklJ?=
 =?utf-8?B?ZzdpRmNwbG83dXI4aHRTcFhYbTMyVXRCWU5tTlhSem5ORU5Gb0oxNHNDTlJK?=
 =?utf-8?B?b2xQbE1JeEZqVW8velhvUmFTcUgrcW9sL081d200c3o1OVRvS3BQUWhzVk1M?=
 =?utf-8?B?WERTR0NWZjBUNmNTZXZCdnR0MTFnRUNvcnNOTG1PU0xva1dsMXNOU2dIQUE3?=
 =?utf-8?B?akhzZW9VUE5VUUpieGlNdmtOeGtjcWkzYU9UeEpTV0NRekpSclRhZE9HaVlz?=
 =?utf-8?B?dmtMMUlVMk9WMEY5YWh6Y3RlZFB4dXk1SGQ1ZVZrVEFUUWF0YWtTOWRld2JI?=
 =?utf-8?B?bE9NU0F4OEx0b1B5MkIrTWtrdEVNV3Q4LzZJQWc4SFIvY0RVTERXQzhVMXp5?=
 =?utf-8?B?Q241emRMV3pHdUhoeCs5UTZVK1FST1JpdC9raGFubktjbXlnMWFtdnpsVFJk?=
 =?utf-8?B?d0t6cUFwOUtQT0pBQkdnK0V0SXpWd0lqQWc3ckZyOWk3RXpoM2k3Y0VWa2hC?=
 =?utf-8?B?Y0V2Mm51a3VjOUlCUHlkbkozSWxKZUdQTnVvOUxwR3p3NUZKZXBPYmVjUkhq?=
 =?utf-8?B?aGN6akdFbWZaWTdGRkZCeW1MbkxzdDA0ZUtzRVhEUDNyQmxNQ3dJTG5Ub1RQ?=
 =?utf-8?B?Q21aMVcyUzVocXdlUm05OGJqcTVYdnFoVi9NNHcvNXl2VS9ML0dkczBEK05F?=
 =?utf-8?B?TjNhL0RNSGdMeml3YnkzbnIyekV5Y0hqaXlXYmVKQTE0R0ZKbzM0aW4wamZk?=
 =?utf-8?B?NlpaNWI4MEZjWjBFLzZyR05KSlMxd1JHSGlpNjJMTWxTV1VoRUlNTHFTODk5?=
 =?utf-8?B?eVljbXJPRnFIQjdvOHVIdFZYMmNUdDJ5M0dSMFBWMDJVV1gyYVo5VUJ0clRE?=
 =?utf-8?B?UGdCa3A0bTRDR3ZYNU4zTVdUQ3hSK2taRG9UaitVdTdtR3lDRk9nejF5MmRl?=
 =?utf-8?B?ZEUxQmNPdXduRzI0R200OXprTHdvZGw2ai9CTm0reDg5aHNEMitjMnpTdjBT?=
 =?utf-8?B?NWovTlcvbldibmFSUzBoNG4xSUFRelhpTGRmTHliSFAwVk1LUzR5U0p0akxY?=
 =?utf-8?B?Nlgxd3EvTmlGNEYyT3VVNUhKR0dkN2Z0NXgrVTNpbUt6dDlrQzdYWnJHOGVs?=
 =?utf-8?B?bWszckg3NlU5bUVoc1B6dXNDVHlTZlp2R2lTcVhIZWE4SDJBTytQT0JOSUo2?=
 =?utf-8?B?K1dCaEhNb0FRS3ovMFR1bEdDYjJjcmhTQlZkVzloMWRCSlRudmR2bkRvREN2?=
 =?utf-8?B?RUUyS3dQNjA0NldiMk5ZYWg5Q2lCUy9HeEZVWjBFdHZkWnBmZmVsSU5nTnFL?=
 =?utf-8?B?MEhQcXIwZkhXdzI0Q0hHOFlRNEt1VGhtbHliTDZya1puY3JhU3VHZHYxSG40?=
 =?utf-8?B?eTl6QTFtbHlnQTlEK0dWMXJwd1E0V3lBVDIzNXJHcXBKcGJVQnVzdE54Rm84?=
 =?utf-8?B?L1BJZzVYakU4QjJnYVhDMC9zdzYzbVRwM1FDRm5zVlZkQndQZXdrMk5SM3R4?=
 =?utf-8?Q?vS33DKdsYfM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2Y5aUJpSDFRQUhtVFB6N0piR2gzaEZnSWg4NUh1R3FRSFQzbWpOTzd4SS9t?=
 =?utf-8?B?TnpaVDhGODRQenlEVjFjV3JyMFJDR0VERFdHZ0xzNG9jVmIwaEVDeXZJbzlI?=
 =?utf-8?B?NDlsMHU5WWFzL1JMbzU5ZmZmVzkvSjllS3I4b1lWczFnNUdBNThIYlllMWxW?=
 =?utf-8?B?TVg0ZkJEVGF3UDUyUlZ2SWpYKzR4ZDd2Q1JTZFNrajFIQWFqNzA2UVJyM3di?=
 =?utf-8?B?YUUyejVBOGxYaCtxR2RnZXZ0TE1McXN0MCtZREp4WXpxK1BXU2JHVmJEMHMr?=
 =?utf-8?B?Ny9Ya3VRVG1WWVUxeFlQaEFTWXg3bWZqVDFtYlg0SWRIazhsR0lrK1Jtci8z?=
 =?utf-8?B?R1V4YTZsb2VJQ2EySzRQaGJ0NXMzWUt6WjE4Yk5VekxYL1ord3ZmUGRsS3Qw?=
 =?utf-8?B?SVJSMWJDNys3RmdtMExGSzArdUtQTStuQ2lhaitJd2dXYitNd2tJWTZYRjcy?=
 =?utf-8?B?MDZoRUplNjdnaStaeUN6OWtGY3R5TUhFN2wvKzdMMmVuc1lETmk4aWpxcUJo?=
 =?utf-8?B?bXdXR3V1VUJ5bGJBOFVlbFoxZWRSSi8vcHhaVzBqQ0RmNUFETUVyUGd1NExU?=
 =?utf-8?B?Q3piZXA2ZDF3c2R5SUNtTzU3ZWdtMGxGUHpYN1ZBRi9ySG91MExPaDJxRXRr?=
 =?utf-8?B?M0dodzQ5MW9ZSDY1OExwbDRhT2RPUkk2amFIUCtzUHlramZlSWhIb0VZMzdW?=
 =?utf-8?B?K2I1cjFCRTk0YVVEN3U5bE9aZHlhcUJ5bDhncFVZbFFVR3puTGpnMENBSzlJ?=
 =?utf-8?B?RldPZU0wa3d6SURhckl6aTQra0EyQWJ3L0lqd2xOYkh4UzBnY0Q5ajgrdVZJ?=
 =?utf-8?B?N0daTGQrMFAzM2NtSHZwMnB5QkVldUY3WU8yRWRlbGl4dk5XL05FdmJIOEhl?=
 =?utf-8?B?Y1V3a3NpeDY1ZlFFZlV2TWpQYXdTdmpPdmZSSUgvL2krS1U1Q3NRa3pyUXMw?=
 =?utf-8?B?c1kyZGdYQWJ6dnNxdkNNaU9uOXJTeEFCV0RTL3NzbUl6VXk3K01zQWRUN3RI?=
 =?utf-8?B?ckxGaWM2dWxjelZHVU40ZUlnUUZUSUhuT0hPNVorc0kvc1prUHhBU1BBV2ZT?=
 =?utf-8?B?cU5zWUpLNVhic0tVem8raHZwenBTN2hELzViZXRaSjlvUVA3dnRnVDltaTRk?=
 =?utf-8?B?YlpSaGRNV0FZUUc2SVRSNnVPSlBidjFOc0xaMGx6bmlsMmxkOWEvRjU1RzNF?=
 =?utf-8?B?NGpOcVdSa3JTS0prT21hR3V3UmxSN081WVFQYzJoVDNSbW5DZHBCb2pVT3VI?=
 =?utf-8?B?S1JsL3lVODk0NFRNallndERkMThFY1VrbzdNdmxjUVp5aDR6SU5UZHlrSS9t?=
 =?utf-8?B?NGc4emllWncyOUNJS0JwVDFVck4ySVRveGF0WmhWV3RIWFJZaHVkNkFXSXIv?=
 =?utf-8?B?elpNMmIrb1lOd1hLTWhVOVhJWGlITU4yVTRPb1NpUEFSVmcyWXNTT2RtdjlO?=
 =?utf-8?B?U21XMlpFQVNHMjhoZWdjdWZxV1UvQlNFd0psV0Noc2FZRGc0Z09mOWxYcFVY?=
 =?utf-8?B?di9nT3ZVc3hDUFNoZ0tIa1ZzcDR2MGUrbklINERxZ202MDJXS3piZW1TYVpn?=
 =?utf-8?B?bTVlR3Z3VmpGRW1MalhEaFJ0V1BPcGZnSFBaS05QRllMK0dVTXFrbUFKQ21v?=
 =?utf-8?B?c3QzZzBRZVRXeXNxbTc0NkVmWTh4b3Zuaml5NjQwaHIyUkRwZ3ZyY0Zsbnp3?=
 =?utf-8?B?a1RqR3BsNDM5Ym5GZEphZDB5cytsVWpzUWsyb3IyOWFSb1B1cTJqbzZ1RnlF?=
 =?utf-8?B?SzRadUR2R09tMzlyUDNWQWV1eFZqamhzZmdyTmVpYWxuNzFRVzhxdnNKUllw?=
 =?utf-8?B?c1ZyVHAxVTZNSWprbE9jL0d3MlpXT3JRMFA4S2l6K3doVXMyZTF2VDhHb3dI?=
 =?utf-8?B?bVVQUlpCcEIxUDByL3JoTGFvMW9OWkJ3NGZ6MTFJNG50TllYTGFKQ2U2V1JQ?=
 =?utf-8?B?Y1NCbXVFazZwNVRWRDIwSzR1czhlMjE3ODJLYytyQjZHTFBRT2RXWklFcThS?=
 =?utf-8?B?MUF6bTZuUTdMc09tZTN4YlYzZFVmQWhSaTUzd3JsMHo0SUE1STdHMVVNQnJs?=
 =?utf-8?B?dlJaWStJQXMxQXAwOXN2RDBrclp2UjdqKzdSSjc5YzFzeCt1aW4wbjZ2aHNG?=
 =?utf-8?Q?iH+B6xEXWLLqIMgDrhiH6i/Gw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ca342d-8723-48e7-c75f-08dd93afeb87
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 12:56:33.9604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi9tZDvzQLOS5/v/+/GGM6o0nfsiyvqwLFT/NqxZ6ntKCj93hIDT2J9UAN0sklkX5DTlr4yXInm5vjSK3Ifh+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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


On 14.05.2025 20:06, Michal Wajdeczko wrote:
>
> On 14.05.2025 00:49, Tomasz Lis wrote:
>> While applying post-migration fixups to VF, GuC will not respond
>> to any commands. This means submissions have no way of finishing.
>>
>> To avoid acquiring additional resources and then stalling
>> on hardware access, pause the submission work. This will
>> decrease the chance of depleting resources, and speed up
>> the recovery.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c    | 35 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c      | 40 +++++++++++++++++++++++++++
>>   5 files changed, 91 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> index 869b43a4151d..455ccaf17314 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> @@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
>>   	cancel_work_sync(&sched->work_process_msg);
>>   }
>>   
>> +/**
>> + * xe_sched_submission_stop_async - Stop further runs of submission tasks on a scheduler.
>> + * @sched: the &xe_gpu_scheduler struct instance
>> + *
>> + * This call disables further runs of scheduling work queue. It does not wait
> but does it hurt us if we will wait?

Yes! the hardware is not doing anything and will not be doing anything 
until we're done with recovery.

There are multiple places in submission where we could end up waiting 
for HW, and HW will not respond - deadlock.

Also, prolonging the recovery increases a chance of resource depletion. 
We are taking requests from user space, but until the HW is ready, we're 
just stacking them.

> it seems that we call this from the recovery worker that can sleep
> and potentially having a sched worker running in parallel won't help

If it's already running, it will either finish at some point or stall 
waiting for answer to some GuC request.

Won't be an issue as long as we make sure no critical locks are taken 
while it's stalled.

>> + * for any in-progress runs to finish, only makes sure no further runs happen
>> + * afterwards.
>> + */
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
>> +{
>> +	drm_sched_wqueue_stop(&sched->base);
>> +}
>> +
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
>>   {
>>   	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index c250ea773491..d78b4e8203f9 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>>   
>>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>>   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
>>   
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index fb125f940de8..8c119d4009b0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1814,6 +1814,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>>   
>>   }
>>   
>> +/**
>> + * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
>> + */
>> +void xe_guc_submit_pause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		xe_sched_submission_stop_async(&q->guc->sched);
>> +}
>> +
>>   static void guc_exec_queue_start(struct xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -1854,6 +1867,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +static void guc_exec_queue_unpause(struct xe_exec_queue *q)
>> +{
>> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> +
>> +	xe_sched_submission_start(sched);
>> +}
>> +
>> +/**
>> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
>> + */
>> +void xe_guc_submit_unpause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		guc_exec_queue_unpause(q);
>> +
>> +	wake_up_all(&guc->ct.wq);
>> +}
>> +
>>   static struct xe_exec_queue *
>>   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 9b71a986c6ca..f1cf271492ae 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
>>   void xe_guc_submit_stop(struct xe_guc *guc);
>>   int xe_guc_submit_start(struct xe_guc *guc);
>> +void xe_guc_submit_pause(struct xe_guc *guc);
>> +void xe_guc_submit_unpause(struct xe_guc *guc);
>>   void xe_guc_submit_wedge(struct xe_guc *guc);
>>   
>>   int xe_guc_read_stopped(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 940b81036321..69c1f41908d1 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -11,6 +11,8 @@
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_irq.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -134,6 +136,42 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>   
>> +/**
>> + * vf_post_migration_shutdown - Stop the driver activities after VF migration.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After this VM is migrated and assigned to a new VF, it is running on a new
>> + * hardware, and therefore many hardware-dependent states and related structures
>> + * require fixups. Without fixups, the hardware cannot do any work, and therefore
>> + * all GPU pipelines are stalled.
>> + * Stop some of kernel acivities to make the fixup process faster.
>> + */
>> +static void vf_post_migration_shutdown(struct xe_device *xe)
> why use another verbs?
>
> can't it be like it's done in guc submit: pause/unpause ?
pause/unpause doesn't match here. It's not supposed to be a wrapper for 
submission pause, but an aggregate function for tasks to be done at 
start/end of recovery (before/after fixups).
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_pause(&gt->uc.guc);
>> +}
>> +
>> +/**
>> + * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After we have finished with all post-migration fixups, restart the driver
>> + * activities to continue feeding the GPU with workloads.
>> + */
>> +static void vf_post_migration_kickstart(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_irq_resume(xe);
> this doesn't have it's counterpart in shutdown
>
> at least add some explanation why it's explicitly needed here

I thought the function description is clear enough; but ok, will 
emphasize the new hardware here.

-Tomasz

>
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_unpause(&gt->uc.guc);
>> +}
>> +
>>   /**
>>    * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>>    * @xe: the &xe_device struct instance
>> @@ -249,6 +287,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	xe_pm_runtime_get(xe);
>> +	vf_post_migration_shutdown(xe);
>>   	err = vf_post_migration_requery_guc(xe);
>>   	if (vf_post_migration_imminent(xe))
>>   		goto defer;
>> @@ -260,6 +299,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (need_fixups)
>>   		vf_post_migration_fixup_ctb(xe);
>>   
>> +	vf_post_migration_kickstart(xe);
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
