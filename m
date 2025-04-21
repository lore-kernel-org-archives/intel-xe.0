Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C07C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 04:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F3910E1EE;
	Mon, 21 Apr 2025 04:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcSFghft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C42110E1EE
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745208606; x=1776744606;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4w+isn/SresZvocdEP9Ij06Wo4jAjEM55usT3MMSXg=;
 b=bcSFghftsB4RBlcmd1N0T+qKh+5OwjMze5DPLXroxRW5OzI606JytHJx
 fuAdswRRAuminljSCXoUmJ99+0WLGh2tuUdpCUEP3x/+VuSeQ1QWhnC1U
 06MoYW2O/uFzIKqytdJycoQVbUfuWAzj6RAJMutYkhV+Vf2yILuGpccHQ
 PR3R263QHtWzPuqR1iYjpD2ePKF0cMxyYHzsNEXIijYVZqqIL8kx0WX7H
 sk+aC6DeSTc9gHvWd5YCc/LTuEWS17Zb/fgs45X1nrIuZKHBjGhNycgcE
 mdH1V0ZdoZ/mxB6aB9vI2YJsIL26DGvZDdTdQWcJ5LTPjWfeNEuXjQEDF g==;
X-CSE-ConnectionGUID: EywY7VLZSfuqgVmQKTKV/g==
X-CSE-MsgGUID: Rid0lEXUQ3yb5BeGons68w==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="64146294"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="64146294"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:10:04 -0700
X-CSE-ConnectionGUID: gBKTQ45OTJ66UiJl6oTeSQ==
X-CSE-MsgGUID: XoleCrirR7q1nIOCvWc6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="132134946"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:10:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 21:10:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 21:10:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 21:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfq/fuoznNnH4+SPTnJwVkdvM+JfXcsXwsivywNkyvw3BoIGAWVRIQpz0PEAf9tLuu//9M2XwajfUVdocxJ4uqUtVUzPknVae1A9LZeKXFMBW4UpP7A1D9PM0O0IIk+M+m3mxd7aDKBEKeU6aRgX9Rx2ioD0c5AoQrA2jH2b4ojTNG5E4oXwwG7JXPfJWgFDYGVIr8iiBcb6cdnLDAE/euvEriVNMSnnGzHu/Tmtytm1ngRyvaYcI48iw8h9GTYzgP7m83YeGnnCgeF3uuw6LuTLwixMjpMGTXj6vYzGuRyHN3QCNvIbrOvI6W1fjMhlQd/UcGRIH7gXSoar5/TJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsqFNyCBMhrdxyFOw5VBe7MEbskQxQhhFwbFBfTy+RI=;
 b=h3p5S2EEfw6VkIVGEnVBZO3Iiqm/YBg/Jd/MN/FxlsoeUMogdRdrY4tOKc6Kyl106If87DsZP00fp/rlQy4Rd4V28+dEjH2SPtx27G+sUuOJKkr1Fd9j7FmmJyXu9EGnvYXjnqeotsGu4dgJfQ1uwf2pm6DD8uDVqPMJ6VdQMXaA3ZrHqYir7tY6qoeL2sbuZo9JyBdH9tKCExO5ycDV23ppsBoiOleN0iadKEn7gzSq0ChPhHprVNNFbWUYm5WY3MyBXGyp2DxqS5hjQfdTphYbTz9o/2ClB7xT3aPoXZ23zWiZKLzVhTUVyoEE0u6f5+4XPPIaBaSm6bNKOP4TYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 04:09:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:09:46 +0000
Message-ID: <6381a01c-aff6-4e16-a5bc-d889e688bf1d@intel.com>
Date: Mon, 21 Apr 2025 09:39:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/32] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops
 to take an increment value
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-7-himal.prasad.ghimiray@intel.com>
 <aABG9l2fSSBIKHYI@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aABG9l2fSSBIKHYI@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::34) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: c69ce0a0-f946-4f1b-e91c-08dd808a59fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZElVK0Y4aHpSYktPYUtRelJzRnZXcGZtU0thcFNiN0Z1MDhBUWUySEFidHlY?=
 =?utf-8?B?emQ0b0NhOUx4SkdDZmZxM3I0UW1VODhZU2JFZElCMi9vZFIvNG5rU3lvMXJm?=
 =?utf-8?B?TTVoeGNmOXQ2WHJaTlV6M2VFa205a1dVVW1lenBXTVpRTnhDNmJyUnp3MEV0?=
 =?utf-8?B?V3lVSWlBMmMwTGhUUlRBOHFwWTU0a2RUZVV6WXB1ME5Qc01CbnhQblZwSjhL?=
 =?utf-8?B?MnNUbWhvTHZZcFF5N0JqZmRwUDBoTUJTcEpydnJBOWZQejdTUDRxOWFEKzRm?=
 =?utf-8?B?QnJyc0hLbmM2a2FGMWJmS3N4LzkyMStPU3pIaHE3RzRmaXlFRklFWmhvREtJ?=
 =?utf-8?B?MHhmSnNDcEYvNm5jSDIzZG9hekFESVVINVJmcEZUSDN4Rjl4dFhGTGJ3dW4v?=
 =?utf-8?B?VVZPT2NFamZuN2dOcVFBS1UvQUFabVgzWklmUTl3Q0hiUGJVYU5lRGFpZmJM?=
 =?utf-8?B?Rkg2YzlnQ2tjNk8wc3o4OUs2cVdndWJRZjl6MWJtTUJRWFBJZlhEbnlQNjZ4?=
 =?utf-8?B?UVEyaXBOdDVjeCtPOExFR0wwSmhiOXpyWDNKaVI3RGxwN2FnRXBVUG96ZFo0?=
 =?utf-8?B?ajN5c3NVRzNManlkTi9QYTkwQXRDS0Z6S1FENVJhK01obHQ3NFNCNVZqRmx6?=
 =?utf-8?B?Q2VRVUVqejArVTh3K2pETk9mRnFmWFNsOFZ4MWc3STE2Q2VpTHhOZjMzWkdh?=
 =?utf-8?B?cjVQOUZPODlCSnlQb3R4bjV6bWVZUmNsNlpuK3lYdld2blN4TjdYZHVycnQ4?=
 =?utf-8?B?VWdHUUlUVHlrSWdmdkJDV1puRXUyNE9EbEo2aE9ucFJwWTNBTFgzUk1CME5D?=
 =?utf-8?B?Qmdib3RIekxneXdkQWx3UXVUbHR3WVptbHdkOUFiYjVDRnhSM0pJNGhKblB4?=
 =?utf-8?B?NWlIS29xODM5dzROODhkKzRUR0NWaUpYRW0yckhhSzBvRDV1bW9PdVdpNUVJ?=
 =?utf-8?B?KzhHeGpQclRwN3Z5bklkdW5QK0w2SENFYXRXU2I3RVZpenJncU5mQzdSZndz?=
 =?utf-8?B?VDZRdUllK3ZTbFRQNXRoNXp4WkhNbXQwSHZRQ0ZTbXJ5L3krYnFGOTFuMXBN?=
 =?utf-8?B?L1dxd09xb3dBdHl2dzcvdS84RGRQRk5GOGxIaUs0OEJRQlN5SUF6WHBQU01o?=
 =?utf-8?B?WXAxbjB0WlpqdERaOVBCZ21aTW1Ha2hwNU5OZ0JMS2VvWGpyTTB4YVZnWEVz?=
 =?utf-8?B?ZG95RlYrLys2ellvWHpPUGErbEJiS2Rqem9YVVBnL1pNZ2IyQTc5UHlFTVcz?=
 =?utf-8?B?WlNFSVFMVEV5Z3RVaVl0a2g4NnNMR2Q5WjJXSEgraTRXaWJPcWFhN3Q0VzFm?=
 =?utf-8?B?RmJXaWQva1lEb1BLMUR5K21ORXV6M2ZzK2x1cXpBZExEUXMrOEZUWFYvV09n?=
 =?utf-8?B?SzZaczRvRERoTGZuVUVLeDdERWJlSVpaekN3dkpEWGt6OEdUb0trMEc4dEZD?=
 =?utf-8?B?TmFtRjAyeC9QRzFubFRMT1pxdDljMlRzVThrS2JFUHpEemFQaDZmTzFsNldK?=
 =?utf-8?B?M3VOdGxPeHFVL1VSdUxHSW43UEtKQXhoWHU1U2M2dk80aDhlZVlBN0RqdzNF?=
 =?utf-8?B?d2p0TTJnQ2dOdVVHcDBGU0xVOFVOc0t6RUY1V28xTXMvNlJYYWxCUGZoS1lj?=
 =?utf-8?B?cnFpc1pNWjdmK3pvcEVZanljREJIRHBkdFpuS0srZTZrMHNyc1JKMWNYdDBl?=
 =?utf-8?B?L1l6TEc4cHBwRDQvRFd4ZTFTMGJrNlF4WUxZa21QY05naEM3RFVoNTdaZUw0?=
 =?utf-8?B?SVZpNThXZWFobmtqYzVrb0J6NWJVMUVZZEZWcWp6Ui9MWmorcWpMa3ovbzlI?=
 =?utf-8?B?cnI0QmhOaWthWVpGUDk2Z1ZoNW9Hc3FaRW1iZkc3dWFTQzFHQjg3VS9HVWF2?=
 =?utf-8?B?WDl1dzFwUDFiSklvcjAyeEtZcEM2OUVCcFN5OXlsOU5FNmVaUG5pRkZEUWpP?=
 =?utf-8?Q?9uf/jxWqQdo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnFSd01heDZGckJRZU54MXFBYzJLc1Q4UHoyK0Y2dzNBZ2RxaWZMazhOSGV6?=
 =?utf-8?B?eS94eFVQaTdMSTljZExUU1FleEV1QUJ4NEVoU1FnVG1xVGlaTHlwdUZreFdQ?=
 =?utf-8?B?Nlc0bXJGZVZNbk1pUk9yTjYvSnBJQmhuOWdmTlp4SjBRUDEvU1BrQVIwMzdm?=
 =?utf-8?B?TzM0enpwMXJSV1BoZmpuMUwxT1ptc2U4VVhlcTJhc3hBWUt1bmZxZTVDcTNX?=
 =?utf-8?B?Mnl2RWdBWnpiYW5Hc2ZQaTVwTHhRanBXUEM4SlRlN1ZheW15SkVIbnBxYVd3?=
 =?utf-8?B?QlhmME9oUjdOK3FPOGVxTVRsZ0FmWXN4clFGRG96eW5zdEQ0Qlp2TCtvVmhW?=
 =?utf-8?B?RGwyTHlrS3Y2VlB5Y3hvOTVlVjJxa0pqQ1lyK0c5eVJscGh2dnIxWkNzVWxN?=
 =?utf-8?B?SmVBRjVXeUY1Zit5ZkI2MDl4TzVSRmJoOEo4YTBYb1dBM1BUK0Fwd0Z2cFJj?=
 =?utf-8?B?Rmg2ZHVwVmVGbFFiL0lpMnVxWTlaTURjZFcyWXFvYTVyTUNIWjd5S2V2SnpS?=
 =?utf-8?B?eDJON3V5ZGdncCtuZmlQbGlhLy8vTUZBN1NJS2R2THBzY2ZrdHZVMmJtNUhw?=
 =?utf-8?B?V2IzQnJmVS90ZHNvU0xTdU1CaTJOeDRZVWxCdmdLdXo0a3M1dUdQTmNNM2lo?=
 =?utf-8?B?MGo0SGxmMldiTzdxa3lUY1Z3eEc5RHZmTW9DT0t3M1ZPWndpYitSUWRhTHh3?=
 =?utf-8?B?VUFZUHFucmpoNWh6dDBUdmF2TGhmNnNQbytsYVVVaEcrd0ZRaTNVeEJPaWZn?=
 =?utf-8?B?T21jWFlzb3NtclNoRE95U0lrbEZqc01uakI5QmFoUE9DTjdSUEtDejBadnJD?=
 =?utf-8?B?K3FIa2xPdWNYcUl4Yk5VZVR5MS9JaFVsRms0Qy9IMHhISXFPRXJIOXNGVW9m?=
 =?utf-8?B?bHpzalZHb1ZiUnEySkFqMloxUXF5WU83dW1VeTZvam1XN3VMdWhXTEYrSncx?=
 =?utf-8?B?Y20vc2pQVjR5aGc1dDF3R3pjY3h3b28rOCtjTXZnSXdtL1RIOUlTeFRiSkhT?=
 =?utf-8?B?TGF3eGppNWczb0p4NkJjNGE3WFowWW9YQklzdTNIVlZKTWhkQjRnWVlJTit4?=
 =?utf-8?B?bkxPVTBxM25ZdUdjVHFCSkRBRlVpQ0MweHM2ZGxySVphK2lVUmI0UnBNbkZG?=
 =?utf-8?B?SWw2bFVocG11SHV4Ky9EbjR5RXhvb0dMVHBlWFNSWU1KblBIVXExVTVTOUhk?=
 =?utf-8?B?ZlJkRzdtTVc4dk43Rm1EeFRhMm5Dd0RKMFdZak9YWnEyamVsVE11empaSHZG?=
 =?utf-8?B?aGxOU3JlWnVoSXF5SktQYkhzelVmU0ZHRTQ2K0ZKZythSUs4N0luMkx5cHg0?=
 =?utf-8?B?cUhjWit6YlZaL3MvaTlaeDJMUE5GcWg2RHVFWEJqS2NWdC96UzBETFRVZjBQ?=
 =?utf-8?B?dFI4OWcraDdaOEI0MjJ5Q1Y5TlE5bkVLaXFvUDQvOWZ4aWFCTU1rRHVYNmtR?=
 =?utf-8?B?REd3eVAzZ3Ryb3J1Mnpya2V2SUtGNUwwM0Y1VzNwYTMyY0hmdFJRR2pYUG1W?=
 =?utf-8?B?dmpheFFKRW55Ym12dEUyMDZZT1p0ekdoN1JrSXhOcTVBQjNsTlA4Z1VKaHRn?=
 =?utf-8?B?THlHN3BUdXlBUUNnZzByWDljT3MvME01TnZpRm5HelBrYlI3aFRZZlFZa1Ez?=
 =?utf-8?B?dnlNUXd0R2ttL0VUZXJVWmFBK3JmOGJ4V1NhYVgwTFBVaUJrZXNUaEFMV1E2?=
 =?utf-8?B?N2RHMGVSUE5zSEh6T0U3Y05UdWw5MWE1MnVCUEV1Rm1IM1lRb2ZIK2NobktI?=
 =?utf-8?B?TlFVeGt5c3pTSGlmYXhwK2oxK1ZyYjBkWHEzbjhRYUdrbHo4Z05pS053Q1o2?=
 =?utf-8?B?aUg5TWRjZGxFTkxaREVQSUorQmpLQ2FNc1hOYnVBdHp5ZjlqVkZlMXFqR1Vk?=
 =?utf-8?B?K0lKRHRnTXBFVHBsK09qSnhTN211cFZrc04rellXU1VRN3RtZVh6a0xwRk43?=
 =?utf-8?B?MFlSNERVZE9LZ3BIWkh0WVlmYW9MajhPMDJPT0JXcmJHVmlycEpSODlVL1Nm?=
 =?utf-8?B?SG8rUGxTT3lDbm43Y3NQTGFQZW1zNnBRZm44SGxiTkV6UnJxODYxcmR4bUsz?=
 =?utf-8?B?dkVFSDlXK1UxK1ZQUW1JQmZKbmRJdHlEY1hTVTNkZm9IZ0gvUEZvZmlFUVhv?=
 =?utf-8?B?RFJ5UmdWTkI5b2tCRVNvWTJhM3dhaVUrVVJHWXRHNnVPWjVKQU1EcTB0anNZ?=
 =?utf-8?Q?gZIUTm2Lp3emW09IjeL6w3w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c69ce0a0-f946-4f1b-e91c-08dd808a59fa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:09:46.2973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUq7rpldzL76IZEK8pDHJei6jnY8yDus4EhBlvbUfm0JCMErQupRlEtsvWth3ag9ccLczWPk++ggWa72JVZBpjeblo+yYqr70G3kx/caOLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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



On 17-04-2025 05:40, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:46:53PM +0530, Himal Prasad Ghimiray wrote:
>> Prefetch for SVM ranges can have more than one operation to increment,
>> hence modify the function to accept an increment value as input.
>>
>> v2:
>>    - Call xe_vma_ops_incr_pt_update_ops only once for REMAP (Matthew Brost)
>>    - Add check for 0 ops
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
>>   1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 0c69ef6b5ec5..4d215c55a778 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -806,13 +806,16 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>   		kfree(vops->pt_update_ops[i].ops);
>>   }
>>   
>> -static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
>> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)
> 
> s/u8 inc_val/int inc_val
> 
> or maybe u32?
> 
> Just debugged a problem which the compute UMD + prefetch where the
> inc_val was 256, thus 0, so the binding step was skipped for prefetch.

Thanks for pointing this. I tested with prefetch up to 256 MiB  hence 
missed it. >
>   
> 
>>   {
>>   	int i;
>>   
>> +	if(!inc_val)
>> +		return;
>> +
>>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>>   		if (BIT(i) & tile_mask)
>> -			++vops->pt_update_ops[i].num_ops;
>> +			vops->pt_update_ops[i].num_ops += inc_val;
>>   }
>>   
>>   static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
>> @@ -842,7 +845,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
>>   
>>   	xe_vm_populate_rebind(op, vma, tile_mask);
>>   	list_add_tail(&op->link, &vops->list);
>> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
>> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>>   
>>   	return 0;
>>   }
>> @@ -977,7 +980,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>>   
>>   	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
>>   	list_add_tail(&op->link, &vops->list);
>> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
>> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>>   
>>   	return 0;
>>   }
>> @@ -1062,7 +1065,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>>   
>>   	xe_vm_populate_range_unbind(op, range);
>>   	list_add_tail(&op->link, &vops->list);
>> -	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
>> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
>>   
>>   	return 0;
>>   }
>> @@ -2493,7 +2496,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   			     !op->map.is_cpu_addr_mirror) ||
>>   			    op->map.invalidate_on_bind)
>>   				xe_vma_ops_incr_pt_update_ops(vops,
>> -							      op->tile_mask);
>> +							      op->tile_mask, 1);
>>   			break;
>>   		}
>>   		case DRM_GPUVA_OP_REMAP:
>> @@ -2502,6 +2505,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   				gpuva_to_vma(op->base.remap.unmap->va);
>>   			bool skip = xe_vma_is_cpu_addr_mirror(old);
>>   			u64 start = xe_vma_start(old), end = xe_vma_end(old);
>> +			u8 num_remap_ops = 0;
> 
> u8 actually works here as the max value is 3 but I'd change this to a
> u32 or int.
> 

sure will use int.

> Otherwise LGTM.
> 
> Matt
> 
>>   
>>   			if (op->base.remap.prev)
>>   				start = op->base.remap.prev->va.addr +
>> @@ -2554,7 +2558,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					       (ULL)op->remap.start,
>>   					       (ULL)op->remap.range);
>>   				} else {
>> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +					num_remap_ops++;
>>   				}
>>   			}
>>   
>> @@ -2583,11 +2587,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					       (ULL)op->remap.start,
>>   					       (ULL)op->remap.range);
>>   				} else {
>> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +					num_remap_ops++;
>>   				}
>>   			}
>>   			if (!skip)
>> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +				num_remap_ops++;
>> +
>> +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, num_remap_ops);
>>   			break;
>>   		}
>>   		case DRM_GPUVA_OP_UNMAP:
>> @@ -2599,7 +2605,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   				return -EBUSY;
>>   
>>   			if (!xe_vma_is_cpu_addr_mirror(vma))
>> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>>   			break;
>>   		case DRM_GPUVA_OP_PREFETCH:
>>   			vma = gpuva_to_vma(op->base.prefetch.va);
>> @@ -2611,7 +2617,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   			}
>>   
>>   			if (!xe_vma_is_cpu_addr_mirror(vma))
>> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>> -- 
>> 2.34.1
>>

