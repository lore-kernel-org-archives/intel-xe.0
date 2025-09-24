Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83222CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 06:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E610E6A3;
	Wed, 24 Sep 2025 06:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9DezXYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884910E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758695813; x=1790231813;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n1yCt+FB2khgRPYnVKRfR8JUvI+M6w8lwe4SkVaWmY4=;
 b=Y9DezXYTF5wa0ImPKI2WgCDTdeBRpuACMPRPOzOx0o7XlyRMvHvR3/HC
 oWNsNjbXuWZscFwybPEHlob7n0pneoRLFg6yaOAkqNw2BHrMhrfHtWzhy
 EvTMkqTX/7cxIjX6AWhEqz9rZxA3tfdZkLJGT3ZVOHXv2ITBrS/CHSian
 7HOBlusnctPiffMzoN3c55oh3mFDVn0WL3y6/TXwehUeZWfCa56J3Norw
 NjPdQbBgy1lwgWwSzwv+iZUucOSB+RE5VSgB33cwRijdqOV01H2VhQrXS
 frLYx8F8macjtW1fELQYFJN0/jOVz+6IAXbn3nV5ug0OREpRTS0fJqTIb g==;
X-CSE-ConnectionGUID: wZQ/r33LTvmnH2cAlenSGw==
X-CSE-MsgGUID: iF/FBLjCQ+2fmOrENEux9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60026014"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60026014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:36:53 -0700
X-CSE-ConnectionGUID: a0nj/QIRTsCOKUOXD0RFdg==
X-CSE-MsgGUID: Os8uB/p0RXGYy/m1VpVDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176536686"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:36:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 23 Sep 2025 23:36:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 23 Sep 2025 23:36:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 23:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+7pGlGdq4pjlJZiWs6FEvKpCn9+tmng/z8PA/VGfMVqu1+yTaDZcVQKv/LsIZxFF08DMmYSMcJCDYmefORuNR/OnRPCu2uZ5ExrOpshFMaKGZmqvTsFk/6zr6O7o9QOMw/eU/A3v/j7hMAMFpWF4N0ji9KzrdD4ouImNkEKbK1FPUm7EOuv6EGZYp60KPzlNnphcfVG050IHk0ML6ud0Ml+WHvh9bRni4Qg9DndGwMFqBHsDI/IBS9YeEfar5prp6b72+UJGzQ9rMbgRV0SbxukD+5Zu5WJVJODpejfEdPBD5fWxnX10GbIF6+4iGFC7z7sR7UFpFTzaSvHyA260Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5NN8Jum+keSjBtaZn9Dw1Shm1LP/yaQnzyrv41PyIE=;
 b=ttcm5KP+a/cQGxnUnImh8GjtOYnZwOcuecQM/EwmSDm3BfYXjPw1gfb61SIdI3dKP/mo5PX/Mung/CBGhXD/S3vV2rNx+tYH2K/ra9ZitwSnG24nnjC0m8400xoQtLmA2zNFL69utWhQztZezgK+x9exNBoahHsrTF+APL97zOnOf+xF9M0atWBLjaDi0BIh00RuKVwbw5Ms/+MOwTBRxrxGGVobvRGJkLphTuut7WkVgWhto2w/IY3P7yzeGn/x6XBGxjOa7JnDiIo1sg0QV6r9LYU+uJe7lnt4RROH7Salm9WipirvCQ87E+FjaSKmqmRsvKTp25Wyhjg51sMkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 06:36:28 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9137.021; Wed, 24 Sep 2025
 06:36:28 +0000
Message-ID: <72a3a014-3e58-4a9f-8677-db9f12c3725c@intel.com>
Date: Wed, 24 Sep 2025 12:06:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/34] drm/xe/vf: Rebase CCS save/restore BB GGTT
 addresses
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-34-matthew.brost@intel.com>
 <5ff075e8-fb77-4f4d-bc03-9c06c99831c9@intel.com>
 <aNOQmwNz1AN2vBXd@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aNOQmwNz1AN2vBXd@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::14) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: c784e1b0-6faf-4e61-4c4d-08ddfb34b0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a081OGJhaW5Jdmh3aWhjZmdNcU04aUhRRVpxUndmTjJTY1pBV0FFU25JOGlF?=
 =?utf-8?B?RG5ONUViM3ljNDcySytKQkNXV2FNbjVHd3NFbzVTSkNFbGxhRnQrekc4d05D?=
 =?utf-8?B?SXlCek52V3B3NE5YbHBBbHB4cFRFSUlVUTNlUUtnZDBTZXN1aUtpYlkzK25h?=
 =?utf-8?B?RHBhSngzTGw1QVlYSFNTWlBZWkpoMVNwTUFoaXZrR1BGVmdRamwzbm9XaDFm?=
 =?utf-8?B?aDB2UlgxcVdxK0VXL2pRcHBZYUpjZGhhZldDLzVaazdaTklzdnJYazgyYkEv?=
 =?utf-8?B?TG5VSmNSeHNYdDBZdEN1dFErbjVzMWlvajJwakxSSmE5amlCMmtLWnFFZ1lQ?=
 =?utf-8?B?eHpRRXd5Vk16UWxoaUNyNCsrdkYwV3ZjOGp1VFozSEJYWHdoQm5WTm1pdUFD?=
 =?utf-8?B?L0dnWjdYOTd4MzdUS1lReWN2bkFUdGhPNFFGZ3EwTlNqRmZlcElHcnpGQ1cw?=
 =?utf-8?B?V2hITDJrK2NxR0twNGJ4c281cGpNQTFWMmkrZUVwTHFwSXNLVGNXd2dEcThV?=
 =?utf-8?B?TXJmeWV2UU53cDlWUXNsc3lITStCQ0cxbjFvcmVMV2lxelNvSTJqQk1GMGtD?=
 =?utf-8?B?aGhFZFlSd1loZmpZSXQ5ajhlVjFhd2xWTHVpb3loN0xGU25sb1htcGplMXlW?=
 =?utf-8?B?MmV2cU8yQzJuTWI5aGRTUWNJZUxYNUVBaktneUZOMUJrcFJKZUZsZTZ0Vy9M?=
 =?utf-8?B?ZHFZREdsdW95S05zRWdVaGp6dm1uMWJrUWl4SXhiZ056SzU3V1lBMXhKK29B?=
 =?utf-8?B?Tm15U1Jackd2Z2ZJQ2l5Wk5lWWVXVk4rR0ltbm1VMlFkbk45Y0M2OXo0V21t?=
 =?utf-8?B?MlhDSk5acUtqR0V5Y0RQNEVEWVFBQkEvbnFTaW0rMXpyRG41b0srSnN4VWV3?=
 =?utf-8?B?dHBTT2VuMkNIU0MxRmsxY3lpeDRVSXhZMFFKZmJSajNLaHJ1d25VZ1RCZ3p0?=
 =?utf-8?B?V1l4Zm9YSW4yYW1hVmZyd1BhNXduTzN2dEMzdlY5OEJMZnBhN3NydkpKVlJr?=
 =?utf-8?B?andqRmdTQ1YwNmpEYyt6ZVpNd0U0M3UyRi96M3RicGJ1TE1hci9LWFJFeUpE?=
 =?utf-8?B?Z2MvYWU1MlpTSktBVU5uai94UmVaV2tvb0JEZ3FEMW4zS2hSc1huOVJNcDdy?=
 =?utf-8?B?cElBNXI5V2hTdFBENVRJVDk1akdJa1pJUGxxb09HUlJabmo4bFpybHNDUk5B?=
 =?utf-8?B?Rzg2aXRyalI1Q0d6dmhzRnUyaGtGRFpObEg4UzltY0tjY0hMdC84WnlRRS9J?=
 =?utf-8?B?YjdKTWx0cUkwNWhuOHh4ZnpBZzlLam8yd3F4NGxpSm9MbzFwTnlHL1AvQTVh?=
 =?utf-8?B?eXBWcEx3RnZXVU14N2dZTmoveE9qT05tVnJIeWQwTjcxdmUrdGQ4RXR3OGtS?=
 =?utf-8?B?a0U5dTFQd2tyLzFOK3UyUHNZUFR0dkpYNk9iVjROOWZDWUJnb1hvVmltVU94?=
 =?utf-8?B?R1Yrd2ZrRjRDemw1R3BybkdJaTJuNHBtYWZNZW85NFppcm1SSzRQeU1RYnNs?=
 =?utf-8?B?d0dtclBERnYvRFkxWVlwa3I0RnRlOVQ1NzlUMTFVR2hxN09FNXIxZXFyVzly?=
 =?utf-8?B?RHIvbTQzbkxTQUtWVm1yNkJCUGJGaXFsZEVhQWExV09ZV2tuZzBXcHljUWNI?=
 =?utf-8?B?OTJIUFNkYy9ITGNTNU1ObUFDaU9ieEFza0Erb2R3T1FyNGlpV1ZGTzZCSE5K?=
 =?utf-8?B?MkhzejJaZjFJNEFCODVmRHhLTnM5VGU0OXZscXV5UjlsWDlVTGp6bnZLYkhj?=
 =?utf-8?B?UmJZekVBMFFORkRhOWVUQlJqd252YmF4OEFqSWRHVVY4SlBFdWRwVXRiejIv?=
 =?utf-8?B?VVhUNFBQdWUvbFhtUEJMcnZlVmsreEFvenpTd0pZUzFOZ0RIOGRvYStCOEc4?=
 =?utf-8?B?WUFrdUU4K2d1UEVRR1Q2NzZhSGc3ZGhMR0V3TGRvNXA0WGdjTnF6OFE2eDB0?=
 =?utf-8?Q?FHU+wjfo8Xs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eSs0M1lWV2NINkh1aUpkcWg4d0l0UXl6TXNDWWFiSTdqU25NZGQrdml0YlpN?=
 =?utf-8?B?eEN6WXNPQS85YVRaSUdEYWNLcFFnT0RMdG5ZaW5WdmZ4Z1JkTEw0a1E5SW5P?=
 =?utf-8?B?Lzl5TCsxLzVZcnorUW1YYmNIdm01SzhZMmJhUFRQejIwc1FtUjB5eUNseEZU?=
 =?utf-8?B?NkkxLzVndkxNYUxLRUMyODZOOExKTC9KMksvQ0RrK2IyeDVYSzJvaHo2dXVq?=
 =?utf-8?B?dWhsQTFHcTIvY0psR29ja3VObVI1Y1MxS2R6b3Z1QUdQUkF5TmVRUjZ5YTVX?=
 =?utf-8?B?VG1PY1hadEtWV2tESXBCUGY0ajJiOTFEdFNFTFVQM3JUN3IyRkwrSXcyc1ZM?=
 =?utf-8?B?a1NpSUhZRlJ1c3ZjRUwrMllPL09RVE1xb3VFV3lwTmdXMXhqRmE0OSt5WkhL?=
 =?utf-8?B?VG9ZbXlnOE1NNUJtWktIaSs0QnRqaTZoRUdwdEtrYlN3T0cySWtxYXJGMUdq?=
 =?utf-8?B?ZHc4MFpaQW8rNm5zZnFVc2c3dTB6MExHNUhsUU54ZTVtbnJLYkxFVW1KWmhF?=
 =?utf-8?B?OWNZcEFQN2pUWlR6anhzNll4MlRBV1RvaEloL2VyZWZRYWJ4Rkl6S052eS9B?=
 =?utf-8?B?N0pqK2FOcHJBUUhqUG9BakJ6K3g2K3NNQlZqbUpmcEE5UlBPRVJJNXVic2ly?=
 =?utf-8?B?Zld3ZHdob1h2N3RwODVhY0N1WjBpaldGbTVlWXQwWUx2ditwQ0hHOW1LcFNt?=
 =?utf-8?B?eWRPMXhYSWZWT25PZlVjN2prb2FONWtYNGMxOGpPK2FjckRnd1NEcVNta05n?=
 =?utf-8?B?alNMTHpEaVNXNEVaT3ZOT0VlTzFpSk8yZWI4K0YwTmdaYzVvT0tMaHJza1lB?=
 =?utf-8?B?QmlYMG1YUGh5SFlmd1pIM2dwSU5zKytJYVN2bHdkRkhPVUxiNGpyNEFndFlu?=
 =?utf-8?B?cUI3RU5CeEZLcCtOZzhwWlZTdVFENnhRRXlYOFU2QlJpNldSaWxWeWo5Vjhx?=
 =?utf-8?B?OVpxeHF1SDlndTEwWnJqRHRicy9pK2IzWk9pby9XdU9CUXN5MlRVNUdnUEJj?=
 =?utf-8?B?dzB0ZFFIZkhQSFFRMFpiZXg2VUpUUzJINnFjTlpZelpXNEVTWEphMWdKTkl6?=
 =?utf-8?B?bzF6OUFNUmgydXRma1hHQW9FOXNJUXZzOTNvMnMyZXl6SnhaWmZTbFZBaGgx?=
 =?utf-8?B?ajNrVnZwdFhKMEEyMEgyaFEzeTdWbjVIOE1hYWYwUzY4VVJyRG5BUThyNVBv?=
 =?utf-8?B?amQzNGVhUFdYeUxHemIvaGVGZnM2SSt6eWRIN0xaZjJIeVo0dTZ5YjV3eUVa?=
 =?utf-8?B?UjYwQklsUTBoM3JCdkRUMmtJbXh2S3haQzlyWUJ4NENpaFpJTHpxN3FxSmQx?=
 =?utf-8?B?MHFrWGo1NHRWZ0RCNm03TE43VUtXT3FnRzJkT0paaHNQNjVxa0xzK1doQS8v?=
 =?utf-8?B?TGRabitSUjJEQzlsTjdwTFJQRWxCYTZ1cXhaV2FqR0M1RDdYa1h1SGFLQXRR?=
 =?utf-8?B?T0l0RVMvWnNWTzU2dUhBUjREOUgrNmVrWUZyT29sSlhscjZCOVh3N1A0b3pr?=
 =?utf-8?B?TUtvZ0Q5MlBmWXFzYjZDbW8wdS8rZ2MzZitJdUlxaWlJc2JIV1FjUVhsYitC?=
 =?utf-8?B?WDJ1TndhZ3lhVndSa3hrcmxIdHlJZWVTcERoT0VNUjRDa0RLT2d2OTBxTThw?=
 =?utf-8?B?WUxoZitueUhQbW84MFZ2SWw0OVczVzNyUXBSOFRXc2ZvTGJvbFpEQUJEM1lq?=
 =?utf-8?B?N3VKaUYxQWJpQTJwZDBBZHgySWErbkt6UEZyN0RaOXk3RFRIc0FvciswcDNm?=
 =?utf-8?B?N3pDSDQwNjJjTFZFeXpKbnkvWXh6b3o0K0F4TW1KQTJENFgyak9IWDJISlAx?=
 =?utf-8?B?L0Mrd256VVNGL2VuTEpYNHRaU2hEa3NkeEo0c3J6Y0FaVFk3cS8yRS9PbGdt?=
 =?utf-8?B?VTJydDFJNHRpOURFK2lseExvR2hBbGQ4Y3pWaFlVNWFmS284UFNRZlNPb01l?=
 =?utf-8?B?a0oyM0FyZzFqa0wzMlRkTEJ5aGo3TjZFSkVoWXpOK1UvSitRZjlQb24xb0Vi?=
 =?utf-8?B?ZEV0YWJUQXowZS8vT1RiVThIeFJVTWptWnZ1MklVOVowYW55akYrNGF0Vnlo?=
 =?utf-8?B?Y2k5dENVMWROaVZ5cDNDbS9Ybk5TcUQyUWx0OXhTQnNBOFM5a2NJOFhSNHpP?=
 =?utf-8?B?YURQNVJjNEFaWmM4YmsyN2IrTXVEQTFjd08raWlTc08zVmFqK0dJK0szcVpL?=
 =?utf-8?Q?WTjPRPjSBx74WqSVH/2SsgQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c784e1b0-6faf-4e61-4c4d-08ddfb34b0fb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 06:36:28.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bp4Hy2COe58AE2z7q4HQ3Px3zvwOnmhMlBduIjiE+B7TarHN01Rl6mpN9srkf2rMlh27g+//bSnAkuc5/Bz7IX3+79c0GNf+PV07ZWqI4Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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



On 24-09-2025 12:02, Matthew Brost wrote:
> On Wed, Sep 24, 2025 at 09:34:25AM +0530, K V P, Satyanarayana wrote:
>>
>>
>> On 24-09-2025 06:46, Matthew Brost wrote:
>>> Rebase the CCS save/restore BB's GGTT addresses during VF post-migration
>>> recovery by setting the software ring tail to zero, the LRC ring head to
>>> zero, and rewriting the jump-to-BB instructions.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c  |  4 ++++
>>>    drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 24 ++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>>>    3 files changed, 29 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 46d1d1fa91b2..d8d96dd76c73 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -34,6 +34,7 @@
>>>    #include "xe_pm.h"
>>>    #include "xe_sriov.h"
>>>    #include "xe_sriov_vf.h"
>>> +#include "xe_sriov_vf_ccs.h"
>>>    #include "xe_tile_sriov_vf.h"
>>>    #include "xe_tlb_inval.h"
>>>    #include "xe_uc_fw.h"
>>> @@ -1228,6 +1229,9 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>>>    	if (err)
>>>    		return err;
>>> +	if (xe_gt_is_main_type(gt))
>>> +		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
>>> +
>>>    	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>>>    	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>>>    	if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>> index 8dec616c37c9..bffad45e655f 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>> @@ -175,6 +175,15 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>>>    	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>>>    	u32 dw[10], i = 0;
>>> +	/*
>>> +	 * XXX: Save/restore fixes — for some reason, the GuC only accepts the
>>> +	 * save/restore context if the LRC head pointer is zero. This is evident
>>> +	 * from repeated VF migrations failing when the LRC head pointer is
>>> +	 * non-zero.
>>> +	 */
>>> +	lrc->ring.tail = 0;
>>> +	xe_lrc_set_ring_head(lrc, 0);
>>> +
>> On lrc_init(), the ring may be pre-populated with some GPU instructions.
>> Should not we keep them as it is? Making tail=0 will overwrite the
>> pre-populated GPU instructions (May be some WAs??).
>> -Satya.>   	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> 
> I’ve thought about that. W/A should be applied through a W/A BB
> mechanism, not via the ring. If I recall correctly, the original code
> for programming instructions in the ring came from Faith’s original Xe
> PoC code from over four years ago, which we’ve never really revisited.
> 
> In my opinion, that code should be removed.
> 
> I could include the removal in this series, but I’d prefer not to expand
> its scope. We can address it in a follow-up. I also don’t want this
> series to grow in complexity by retaining what is almost certainly
> useless code.
> 
> Matt
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>>
>>>    	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
>>>    	dw[i++] = lower_32_bits(addr);
>>> @@ -186,6 +195,21 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>>>    	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>>>    }
>>> +void xe_sriov_vf_ccs_rebase(struct xe_device *xe)
>>> +{
>>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>> +
>>> +	if (!IS_VF_CCS_READY(xe))
>>> +		return;
>>> +
>>> +	for_each_ccs_rw_ctx(ctx_id) {
>>> +		struct xe_sriov_vf_ccs_ctx *ctx =
>>> +			&xe->sriov.vf.ccs.contexts[ctx_id];
>>> +
>>> +		ccs_rw_update_ring(ctx);
>>> +	}
>>> +}
>>> +
>>>    static int register_save_restore_context(struct xe_sriov_vf_ccs_ctx *ctx)
>>>    {
>>>    	int ctx_type;
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>> index 0745c0ff0228..f8ca6efce9ee 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>> @@ -18,6 +18,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe);
>>>    int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>>>    int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>>>    int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>>> +void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
>>>    void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
>>>    static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>>

