Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB978F5545F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 05:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565AF10E14E;
	Wed, 25 Feb 2026 05:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOc8qgTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AE410E14E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 05:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771997743; x=1803533743;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q7GiK5ijjp9fXWfz1dQhVJ+YPO8q/TNJVuTEkS+OxzQ=;
 b=OOc8qgTIj8m1hon7RtVb1PRiwysI2sd69wL9H48ceVvAuWUXj7cgK5te
 xmhZwldi9lfxxeQJ7KXJyPg/p3YTshjHbMQeXkKjb6bKvuj/76SlDdoKl
 67xalnisGLiWuFpc4uXlq25ip9a369FcwbPMTGij9Mwe1Cfe70e+fU/DG
 UB92gYiClNFA8+6qgiegxor3T0P0BF0L4kpbHgPveUH1zbSMzh9fHJ8uz
 ToMcSNHYVk1VcdIrshCPwbTUwznMP1v4sbaBvwtL22CYFTTS2kA2cculW
 A87ETC2v2h9fsGSy1/ySeE4B/HIPNF1aJBGYDkj23/C9VIQxfjVHc9BFX g==;
X-CSE-ConnectionGUID: k7aIL+uvRvGs6Nc+CBqzzQ==
X-CSE-MsgGUID: bjbsVmIjTrmJYJrZyHbTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90443814"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="90443814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 21:35:42 -0800
X-CSE-ConnectionGUID: iG3Y64HTTjS3ydKOWmbXPA==
X-CSE-MsgGUID: NtXWnDX5SHWNPPTN3Shryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="213855433"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 21:35:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 21:35:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 21:35:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 21:35:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBbOK0hFSTHtZFvP6zwLMmJ0tnHme0xgpA/3TCYAPa6pu+jB89ClUpyR+89NKMDwBf1DW1UZglEJ1Gb9CxiwlkmNmGlX6OseY1h+Zb70H3wh1bax5tqQO3CCAeEHpXO6MfceRFKDyDdD2X7U3icsTSaH+Y8EZqDAL/GHThXtT58sE2SXE/wgp4qWQkU8GPeD1OK4/lYdZoeHwwP3mbFjtNq12CsJKXI2DrbR2j5LqoM+kVx+IhIUj6sYohC2qR8tQMpmvkgtBQq7zc/Flf6R1iQBtMS1RtqFS952FaE75v05C9GP6N/3oQ/qygcYNE+ChzAxl5SkAFpNSXnkNn0jQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6ezCY3g8KETiNeWaYNJIgIq3eF02W5IPYGAcF/chQ8=;
 b=wzyHf86rxxWXfjFK4/QZYv8bZl3aWbWRQuER9W7CWBJZ35nZzqbp62a44uPs2OtSKVaxUgm6wAJup/RC86E0YpcnZXiD7znPnnUoabxGDBZNH98HObPCIodzycWu3cifT1/tQLipmCL1oC5g9KoiPbmo19IfFuAp6TebEVQPurA5AZA8V7eUfRPITTvmEnqf39Hch3BN++rM7pQ/yuR4xVfm3FtisfH9jjVuItf3I5otD+pcrmyMEOAqxKfb1vkKgtHeIRTiI+uTNWi6UAH5inmruPht0/p8EzMMVwTf44Bp+lhXiFzDF2j3uYdGI1tTj6NcOEP2NvT42ZITNcVmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 05:35:37 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 05:35:37 +0000
Message-ID: <14753c79-df95-4c14-b78b-cbee2670dac4@intel.com>
Date: Wed, 25 Feb 2026 11:05:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
To: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
 <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
 <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dea36b-6410-4826-7b9e-08de742fb451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2NZMGNrY2JiK3lOUzBOSU1ZVlMyanZxWGpjWkRHS0RzL3lzTy9rS2lnNE5z?=
 =?utf-8?B?V0gxVmVRcXJnZ1E0blR6M0tZRGVISVEvZ2Y1MVlubXFNYjBIUy9Cd0ZTL3BQ?=
 =?utf-8?B?WFU5QndVWGs1eHZqanBhcURmQ0kyN3ZNQkppR3lqa3FtMnRwVGlEUnY4Z3B6?=
 =?utf-8?B?a1BmdGlXZkVhQTVUeFE0NVlJZlZpQ0hOeUlWMjlpaG5mUkhvMitkQS9reEg3?=
 =?utf-8?B?eVhTa2N1SnZyVEhyNnNQclBLcFRMdVA5YlZjVWVQVll4ekFLa2cyNVg4eUZy?=
 =?utf-8?B?cThDcVQxbnd4MXVyUVQ4T3NRQlBqN2ZvbmlDQnllYnRhM1Q0SGxvSjArRlBY?=
 =?utf-8?B?dS9FczJ6NW4vZ053azFsRTF5ZDZCZExEdkUzTnl3bFpYcVFLWTdNZVRtWGN5?=
 =?utf-8?B?ZmlIdkRSOWV0ckh3M3NjYkJhVnJybHROWmpRenBvU25ReU9vaW5ZU3oxREpy?=
 =?utf-8?B?ZVFaNzB2MkpiZWxvTzBIY2hRTWlSY3dlWmkzc3pHNnpUbXRla0JhTzkrQXdR?=
 =?utf-8?B?NDRERGNoZXJaNHo3aTdkekRqRmhiSVpuMUJkd3pKRnVOd0srYVdQekdSQmpG?=
 =?utf-8?B?QnltQWo1b2ovc1o5eEtXQzlabDNrUWgzemlWUFVwZjRYLzFNdk05M0Znd1ds?=
 =?utf-8?B?bHloMDRCNkhPNERueVQ1dFA0WHduY0ZlUVJOSCtVbkkzd1duUUxHVndFRjlH?=
 =?utf-8?B?MHB0ZittZnVsT21QQW84NXQrTGVSQ1YzQ1dqdmc5MmpickhlSEp0bVNnUWJS?=
 =?utf-8?B?WW4xOEM3ZGVlbkFxTjlUbWZPTEdMQU9Va1ZMWTFBbG02Rmkzd2tWNTRBdFBu?=
 =?utf-8?B?MDFFdnF1TFlmZWliN1ZucUl1MEN0M2NuQ3R0dG5lWXppd0NEZVpaV3BjV3I3?=
 =?utf-8?B?TTk0c3YxYzJHNXlMSDloS2I3WXpzMXZEWE1YdFlpWXZ4WlF0RmRJM3ZoSDJs?=
 =?utf-8?B?ZWJPYXczWE5vV2FyRjU4ZXdzMThaQ3Y3TTl0ZFp4elNUMlhod2tod1hoZHpI?=
 =?utf-8?B?QzV6b1paTGlHQWVqYkE0ZHA0YzhyV2MzUnMxRXlSK3phQjZqY0FKbkFqTm1T?=
 =?utf-8?B?OVN0U0pqZFV2NjFDbzVKejlMWis1eDVIUlZCbllyVXFnTjJmKzZLQWNFVWEw?=
 =?utf-8?B?MGNNRjQ0Yk5IejN2SGJZOXF3NjFNZk50Z25DR1lVYjBaNStCZ3Z6T3g5TXRt?=
 =?utf-8?B?Y3pqZHhRK0FjZjhoVnV3Y1FEMVFnY0dldVh0Q1g1TXNzcVFKckZTVTF6c3g3?=
 =?utf-8?B?VVM3bzBIa00ySGF6ZU5HdElUbEd3Nkk4dlptSkNkRFlCS2ZvUkxvV3dUSDVR?=
 =?utf-8?B?N0pVYWZidWRWekt2ZVZmTFJGVU9MVk9BeVpFcHJoSnhuQnVySVJ1amk2bjZu?=
 =?utf-8?B?NkRMbGJkM2Z6ZytkTEJvbitKWTlSczlFaWM3d3NQclF3R3FpQUVNengwblFQ?=
 =?utf-8?B?eldxVjQyWUhWUVpyM3NQSlpUZW9hSWhWR08veE1QNVNWSlZzcDZFM1pQc1hS?=
 =?utf-8?B?UFB2TzMzaFVDanArT3NoTDRHR0lxYVZ0U1JWcEdnUE1jaEo4Mm5oZ24vbWxn?=
 =?utf-8?B?cWlQUTNiUjlJdVdUWVMwWSs5RDAxYlNaaVBTVFlxaW9MdkdpeEFwVm5tV3cy?=
 =?utf-8?B?c1pheDR6Q0Y0ZDhNZUltUE0rd1FVaXlPSmlCVDdxNU4wbndCb0F4UEVWWm5r?=
 =?utf-8?B?ZmEzbGNoZ0JnMTVOSHRrbFlhZElNSHJERm5DTDBxTk9zOEd1Z3JRSUNBanNJ?=
 =?utf-8?B?Z1U3ZkhBNkV4NUxWc0RoQzFJZHRXSUlIQ096U21td0tsTklJVTk3V05hOFF0?=
 =?utf-8?B?dnJlTDhJNTdpbC9FS0ZLMXhEdEJZdnVxL203RFZhSHRPbWZUWk9ESno1VlBo?=
 =?utf-8?B?aTE1MERkQUJIZmp4MTJjZkI3MGprc0NLNkRaUzJ0RnFuZUhscCtBUkVZYnZ3?=
 =?utf-8?B?Y2t0YkZUeTFmQzhFdGJRTEVxOWIrVlUxdXNKZU1RZFg3aFo3MDU5LysvSGdI?=
 =?utf-8?B?OUcyd3lhMVBNall2VE1RTVIzeWxGMHdMTk50OUpFTGRLQi8xSDBMaEV3aWgx?=
 =?utf-8?Q?FccgVR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNwc3lZVlZickJncjBWYmJYL0dOclZxUHNQSDZvUEZJcHh0bjRUTWFTaHJx?=
 =?utf-8?B?NnN3ZG5CT1FDNy9oRlo3R09EZUs5UlJib2R0N1Y5SUp3ckFLZHBqblFjQjQx?=
 =?utf-8?B?UndsS2dyRWhIWHNaNWNGN3V5M085RUliRU1aU1NBMFRnQ2ZQRGtKU2lzWEg4?=
 =?utf-8?B?WTBmdVNBOC9yMmprZHlvWUR6YmtjSzI1eXFWOWNOUW1pNHBqVTVIQnNxU0Rw?=
 =?utf-8?B?U2dFck1QN29kTXl1VkpmZmdHUGxUUmozdERseEtxRjF0UVowbzZTWTBIZzhB?=
 =?utf-8?B?THZYcUtadGxadUZQMGtMa1V4V2QwNzVqQWE0bXh0K2FwSER0RWlGZmQwVm1P?=
 =?utf-8?B?Zkt6bUtYZ1Jrcmg4bkJMM0NKMFF1MThMUTBoY1BwWE1QcDVEQ1ZvMFlldkcz?=
 =?utf-8?B?dExEUUZmQTd2UWtGR1lSb1ZnMXQrQUVCVE1HcldBYkJETDdkM2tVWDdWano3?=
 =?utf-8?B?V2RFZDR0ZXRabFdrMTRiSGVzMXEzU3ZEYnZkLzE5UE4wQkcrTnV6VEExQjkr?=
 =?utf-8?B?Y0E0ZkVSSXBURW5OTlNSNDluNXEwUlhvaEJiYVJvYUN0VkgybmpENHJDNkVV?=
 =?utf-8?B?RFpXT2FtM0VvQXpHQVRuZUx5dk1XT0JLUmRIOWdjTjhRNWVFcHB5d1FlbmhN?=
 =?utf-8?B?ZjNyRUNkUnh3NWJRM1hWM0k1MW5tVmdVZzJHRHcxc2pEU3ZGMm1mT0g1d0Fj?=
 =?utf-8?B?aHdKYkpRbndqZ0N5U2kvZlBoRmdoZTIyUCtRcU1LYjhvcmdoNWRoazB1MDc5?=
 =?utf-8?B?MTNENVFrY2ZCcDYrQkFtall1bEc4QzQ3SVcyeXgvVFpieFpRSzVKd1BJdElV?=
 =?utf-8?B?K3JFVHh5dmFyQ2dwZXl6V2R6U3MvZVlSR1FXdldNV3R6U2NtWkd0ODZkTlM1?=
 =?utf-8?B?RWl0ZXpOZ3UzVXhqc3BwOE1QcTMwWm1TVzY1NWtYaytobXJOZmxrMEl5MzBq?=
 =?utf-8?B?b2E5N0dQenNjYzNlSFZpU3lzSUh0ZnJNZDdPRGZWbEJ4T1lGMVg4RmlSMS9Z?=
 =?utf-8?B?UlV3U1J1TThzUUpMcElrcWdiYVFDZ1dXVU1ZL0xFK3RHcjJ3MXhPUFdUOE91?=
 =?utf-8?B?eVhIOVU1UUhXNjBrd0FBL0o4QkJ1djM5b0UwS0NDNjNqS2pYZ3JmSksvZ1RI?=
 =?utf-8?B?SHMyL01Uc3QxYnU3bzBaWGt5aFQ2RElVaHJjUzhjb2lNYUhnQkVhZkQ0M1NS?=
 =?utf-8?B?Wkp1TW9Sc1o2M091TzlhajFRU0R6MDNDaG10N2p2aEhLc1FEUVlyMFB5ZXh0?=
 =?utf-8?B?SVdhbUd2bjhMZk5tSzh5eXhWYzRGYm0rY2hORUtrQUpyR3ZrdEQxTXU1Yzdn?=
 =?utf-8?B?OXRULzUwY29xV3lKYW1pWi9LZWRpRWk2OHlPeU9JTnBVcVJtRUtJRCt4Sjl5?=
 =?utf-8?B?QW9LWlFMZUNocG52MGREVzY5QW9uZGFoNFhVVDhVTDJ6TC9ISFBIcFIvNGRk?=
 =?utf-8?B?TnFNa05tWFpIUXMyajZna2RDWFdDbEwzQS9xOEdKdXY5MHRtVndjM1NOUUxS?=
 =?utf-8?B?MW5XVk1HZHRGbTEyNjVXOG9QeW5pNnozQWhFaFJsMjRId1BjaXYySWVYL01H?=
 =?utf-8?B?UW0ySERuZThMbVFqTDlJYW0vb1BVejhDZjBRRmY0VzZkWExuSGRkbzlSUU81?=
 =?utf-8?B?NGNsdU84L3hiRmNVZWh5ZEVxbDVHc1lBenFXNkJUNmttdXlqZE5NSWRhNTBI?=
 =?utf-8?B?dXBlWXp0NXk2eWxrSUVaWjBZMzFObjNwNG0ya3M3b1A1WnlzWDEvUy95Z3pD?=
 =?utf-8?B?WjAxUWtPVUQ2Sm9SL21qbyswaG9QNXVhVDc5RXVjQ1BaY05icGhaLzlzeVR3?=
 =?utf-8?B?TDhQbDFoaFhvd2FoNXdpTEVwcVNXUlprWEk5d0ZaeVIvVXdyTzJEWFRlL3Nw?=
 =?utf-8?B?YjR3emNOTXNEa1EvdFBDRkhVTHhwc2lCNDV0NVN3ZXN6cFByYURGVDNTMUo5?=
 =?utf-8?B?aFJxK01EaTNUdytPY2VRdWlGMnlVcktIRVh6a3J4Yzlic0ZVdlc3S05kK201?=
 =?utf-8?B?bUE3cUM0VnhTVW9ZN0pzbTF4RnZBSTVzanhTa1Nkd2hjY002RFFVd3cvK2VV?=
 =?utf-8?B?SWJUaFFsdlk2cUN5cFZZTVVHSDRpb2RvMFU1L0QyaU1CRUVpWm5JNFZCaFNx?=
 =?utf-8?B?YmNudUF5aUVsckpSK01kUG5ueTdySGVydmtHdXpRcHkwOWg0T3FCVURoZjNI?=
 =?utf-8?B?cTVERFRiWE01UlROSTI3aHA5ajZyVXNQUmdqWm83VDhpZlVmc0dvVTRSeDFh?=
 =?utf-8?B?QVNhU1l0Q2dVckZzZ2hnZWtBVGwwUm9IK2JIYWpheExmbHc0QUNZNSt3Vkps?=
 =?utf-8?B?c1dwZHZQTmZIdVFNOU1WelRLSEJnZWo1Q0pLanRqSnNDaEVnMUVyQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dea36b-6410-4826-7b9e-08de742fb451
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 05:35:37.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQvwcHkQ+4ETXtq5jjUuJYSPFNLajVS1+qfkYsjAJDmgUzsAngw0eb3F76zp3P2CcP7X28gLRLH1UsSB2788Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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


On 24-02-2026 22:06, Matthew Brost wrote:
> On Tue, Feb 24, 2026 at 08:37:44PM +0530, Yadav, Arvind wrote:
>> On 24-02-2026 18:18, Thomas Hellström wrote:
>>> On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
>>>> Track purgeable state per-VMA instead of using a coarse shared
>>>> BO check. This prevents purging shared BOs until all VMAs across
>>>> all VMs are marked DONTNEED.
>>>>
>>>> Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
>>>> a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
>>>> handle state transitions when VMAs are destroyed - if all
>>>> remaining VMAs are DONTNEED the BO can become purgeable, or if
>>>> no VMAs remain it transitions to WILLNEED.
>>>>
>>>> The per-VMA purgeable_state field stores the madvise hint for
>>>> each mapping. Shared BOs can only be purged when all VMAs
>>>> unanimously indicate DONTNEED.
>>>>
>>>> One thing to note: when the last VMA goes away, we default back to
>>>> WILLNEED. DONTNEED is a per-mapping hint, and without any mappings
>>>> there is no remaining madvise state to justify purging. This prevents
>>>> BOs from becoming purgeable solely due to being temporarily unmapped.
>>>>
>>>> v3:
>>>>     - This addresses Thomas Hellström's feedback: "loop over all vmas
>>>>       attached to the bo and check that they all say WONTNEED. This
>>>> will
>>>>       also need a check at VMA unbinding"
>>>>
>>>> v4:
>>>>     - @madv_purgeable atomic_t → u32 change across all relevant
>>>>       patches (Matt)
>>>>
>>>> v5:
>>>>     - Call xe_bo_recheck_purgeable_on_vma_unbind() from
>>>> xe_vma_destroy()
>>>>       right after drm_gpuva_unlink() where we already hold the BO lock,
>>>>       drop the trylock-based late destroy path (Matt)
>>>>     - Move purgeable_state into xe_vma_mem_attr with the other madvise
>>>>       attributes (Matt)
>>>>     - Drop READ_ONCE since the BO lock already protects us (Matt)
>>>>     - Keep returning false when there are no VMAs - otherwise we'd mark
>>>>       BOs purgeable without any user hint (Matt)
>>>>     - Use xe_bo_set_purgeable_state() instead of direct
>>>> initialization(Matt)
>>>>     - use xe_assert instead of drm_war (Thomas)
>>> Typo.
>>
>> Noted,
>>
>>> There were also a couple of review issues in my reply here:
>>>
>>> https://patchwork.freedesktop.org/patch/699451/?series=156651&rev=5
>>>
>>> that were never addressed or at least commented upon.
>>>
>>> The comment there on retaining purgeable state after the last vma is
>>> unmapped could be discussed, though.
>>>
>>> Let's say we unmap a vma marking a bo purgeable. It then becomes either
>>> purged or non-purgeable.
>>>
>>> Then an app tries to access it either using a new vma or CPU map. Then
>>> it will typically succeed, or might occasionally fail if the bo
>>> happened to be purged in between.
>>>
>>> How do we handle new vma map requests and cpu-faults to a bo in
>>> purgeable state? Do we block those?
>>
>> @Thomas,
>>
>> The implementation already blocks new access to purged BOs:
>>   1. New VMA mappings (Patch 0005): vma_lock_and_validate() rejects MAP
>> operations to purged BOs with -EINVAL via the check_purged flag.
>>   2. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and xe_gem_mmap_offset()
>> return errors (-EFAULT / VM_FAULT_SIGBUS) when accessing purged BOs.
>>   3 . "Once purged, always purged": Even when the last VMA is unmapped,
>> xe_bo_recompute_purgeable_state() preserves the PURGED state - it never
>> transitions back to WILLNEED or DONTNEED (see early return at the top of the
>> function).
>>
>> The only way forward for the application is to destroy the purged BO and
>> create a new one.
>>
>> Regarding the 'no VMAs → WILLNEED' logic: this only applies to non-purged
>> BOs that happen to be temporarily unmapped. Purged BOs remain permanently
>> invalid.
> So I think xe_bo_all_vmas_dontneed() isn't 100% correct...
>
> I think should return an enum...
>
> enum xe_bo_vmas_purge_state {	/* Maybe a better name? */
> 	XE_BO_VMAS_STATE_DONTNEED = 0,
> 	XE_BO_VMAS_STATE_WILLNEED = 1,
> 	XE_BO_VMAS_STATE_NO_VMAS = 2,
> };
>
>
> Then in xe_bo_recompute_purgeable_state() something like this:
>
> void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> {
> 	enum xe_bo_vma_purge_state state;
>
> 	if (!bo)
> 		return;
>
> 	xe_bo_assert_held(bo);
>
> 	/*
> 	 * Once purged, always purged. Cannot transition back to WILLNEED.
> 	 * This matches i915 semantics where purged BOs are permanently invalid.
> 	 */
> 	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> 		return;
>
> 	state = xe_bo_all_vmas_dontneed(bo);
> 	if (state == XE_BO_VMAS_STATE_DONTNEED) {
> 		/* All VMAs are DONTNEED - mark BO purgeable */
> 		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
> 			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> 	} else if (state == XE_BO_VMAS_STATE_WILLNEED) {
> 		/* At least one VMA is WILLNEED - BO must not be purgeable */
> 		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
> 			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
> 	}
> }
>
> I think would avoid the last unbind unintentionally flipping from
> DONTNEED -> WILLNEED.
>
> What do you both of you (Thomas, Arvind) think?


@Matt,

Good catch—I missed that transition. You’re right: when the last VMA is 
unmapped from a DONTNEED BO, the current logic can flip it back to 
WILLNEED, which discards the user’s hint. That’s wrong.

   I like the enum approach to distinguish:
     -  *_DONTNEED: all VMAs are DONTNEED
     - *_WILLNEED: at least one VMA is WILLNEED
     - *_NO_VMAS: no VMAs present

With that, xe_bo_recompute_purgeable_state() can avoid changing state on 
NO_VMAS and preserve "once purged, always purged," matching i915 
semantics. This also addresses Thomas's earlier question about new 
VMA/CPU access to purgeable BOs—the enum makes it clear we only 
transition on explicit VMA state, not on absence of VMAs.

I'll rework xe_bo_all_vmas_dontneed() to return the enum and update the 
recompute path accordingly.


@Thomas,

Does this direction look good to you? If yes, I will send updated patch.

Thanks,
Arvind


>
> Matt
>
>> Thanks,
>> Arvind
>>> Thanks,
>>> Thomas
>>>
>>>
>>>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_svm.c        |  1 +
>>>>    drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
>>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 98
>>>> ++++++++++++++++++++++++++++--
>>>>    drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
>>>>    drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
>>>>    5 files changed, 116 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>>>> b/drivers/gpu/drm/xe/xe_svm.c
>>>> index cda3bf7e2418..329c77aa5c20 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>> @@ -318,6 +318,7 @@ static void xe_vma_set_default_attributes(struct
>>>> xe_vma *vma)
>>>>    		.preferred_loc.migration_policy =
>>>> DRM_XE_MIGRATE_ALL_PAGES,
>>>>    		.pat_index = vma->attr.default_pat_index,
>>>>    		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>>>> +		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
>>>>    	};
>>>>    	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 71cf3ce6c62b..e84b9e7cb5eb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -39,6 +39,7 @@
>>>>    #include "xe_tile.h"
>>>>    #include "xe_tlb_inval.h"
>>>>    #include "xe_trace_bo.h"
>>>> +#include "xe_vm_madvise.h"
>>>>    #include "xe_wa.h"
>>>>    static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>>> @@ -1085,6 +1086,7 @@ static struct xe_vma *xe_vma_create(struct
>>>> xe_vm *vm,
>>>>    static void xe_vma_destroy_late(struct xe_vma *vma)
>>>>    {
>>>>    	struct xe_vm *vm = xe_vma_vm(vma);
>>>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>>>    	if (vma->ufence) {
>>>>    		xe_sync_ufence_put(vma->ufence);
>>>> @@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct xe_vma
>>>> *vma)
>>>>    	} else if (xe_vma_is_null(vma) ||
>>>> xe_vma_is_cpu_addr_mirror(vma)) {
>>>>    		xe_vm_put(vm);
>>>>    	} else {
>>>> -		xe_bo_put(xe_vma_bo(vma));
>>>> +		xe_bo_put(bo);
>>>>    	}
>>>>    	xe_vma_free(vma);
>>>> @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct dma_fence
>>>> *fence,
>>>>    static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence
>>>> *fence)
>>>>    {
>>>>    	struct xe_vm *vm = xe_vma_vm(vma);
>>>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>>>    	lockdep_assert_held_write(&vm->lock);
>>>>    	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
>>>> @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct xe_vma *vma,
>>>> struct dma_fence *fence)
>>>>    		xe_assert(vm->xe, vma->gpuva.flags &
>>>> XE_VMA_DESTROYED);
>>>>    		xe_userptr_destroy(to_userptr_vma(vma));
>>>>    	} else if (!xe_vma_is_null(vma) &&
>>>> !xe_vma_is_cpu_addr_mirror(vma)) {
>>>> -		xe_bo_assert_held(xe_vma_bo(vma));
>>>> +		xe_bo_assert_held(bo);
>>>>    		drm_gpuva_unlink(&vma->gpuva);
>>>> +		xe_bo_recompute_purgeable_state(bo);
>>>>    	}
>>>>    	xe_vm_assert_held(vm);
>>>> @@ -2681,6 +2685,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
>>>> *vm, struct drm_gpuva_ops *ops,
>>>>    				.atomic_access =
>>>> DRM_XE_ATOMIC_UNDEFINED,
>>>>    				.default_pat_index = op-
>>>>> map.pat_index,
>>>>    				.pat_index = op->map.pat_index,
>>>> +				.purgeable_state =
>>>> XE_MADV_PURGEABLE_WILLNEED,
>>>>    			};
>>>>    			flags |= op->map.vma_flags &
>>>> XE_VMA_CREATE_MASK;
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> index d9cfba7bfe0b..c184426546a2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> @@ -12,6 +12,7 @@
>>>>    #include "xe_pat.h"
>>>>    #include "xe_pt.h"
>>>>    #include "xe_svm.h"
>>>> +#include "xe_vm.h"
>>>>    struct xe_vmas_in_madvise_range {
>>>>    	u64 addr;
>>>> @@ -183,6 +184,89 @@ static void madvise_pat_index(struct xe_device
>>>> *xe, struct xe_vm *vm,
>>>>    	}
>>>>    }
>>>> +/**
>>>> + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked
>>>> DONTNEED
>>>> + * @bo: Buffer object
>>>> + *
>>>> + * Check all VMAs across all VMs to determine if BO can be purged.
>>>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>>>> + *
>>>> + * Caller must hold BO dma-resv lock.
>>>> + *
>>>> + * Return: true if all VMAs are DONTNEED, false otherwise
>>>> + */
>>>> +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>>>> +{
>>>> +	struct drm_gpuvm_bo *vm_bo;
>>>> +	struct drm_gpuva *gpuva;
>>>> +	struct drm_gem_object *obj = &bo->ttm.base;
>>>> +	bool has_vmas = false;
>>>> +
>>>> +	xe_bo_assert_held(bo);
>>>> +
>>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>>>> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
>>>> +
>>>> +			has_vmas = true;
>>>> +
>>>> +			/* Any non-DONTNEED VMA prevents purging */
>>>> +			if (vma->attr.purgeable_state !=
>>>> XE_MADV_PURGEABLE_DONTNEED)
>>>> +				return false;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * No VMAs => no mapping-level DONTNEED hint.
>>>> +	 * Default to WILLNEED to avoid making BOs purgeable without
>>>> +	 * explicit user intent.
>>>> +	 */
>>>> +	if (!has_vmas)
>>>> +		return false;
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state
>>>> from VMAs
>>>> + * @bo: Buffer object
>>>> + *
>>>> + * Walk all VMAs to determine if BO should be purgeable or not.
>>>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>>>> + *
>>>> + * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM
>>>> lists,
>>>> + * VM lock must also be held (write) to prevent concurrent VMA
>>>> modifications.
>>>> + * This is satisfied at both call sites:
>>>> + * - xe_vma_destroy(): holds vm->lock write
>>>> + * - madvise_purgeable(): holds vm->lock write (from madvise ioctl
>>>> path)
>>>> + *
>>>> + * Return: nothing
>>>> + */
>>>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>>>> +{
>>>> +	if (!bo)
>>>> +		return;
>>>> +
>>>> +	xe_bo_assert_held(bo);
>>>> +
>>>> +	/*
>>>> +	 * Once purged, always purged. Cannot transition back to
>>>> WILLNEED.
>>>> +	 * This matches i915 semantics where purged BOs are
>>>> permanently invalid.
>>>> +	 */
>>>> +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>>>> +		return;
>>>> +
>>>> +	if (xe_bo_all_vmas_dontneed(bo)) {
>>>> +		/* All VMAs are DONTNEED - mark BO purgeable */
>>>> +		if (bo->madv_purgeable !=
>>>> XE_MADV_PURGEABLE_DONTNEED)
>>>> +			xe_bo_set_purgeable_state(bo,
>>>> XE_MADV_PURGEABLE_DONTNEED);
>>>> +	} else {
>>>> +		/* At least one VMA is WILLNEED - BO must not be
>>>> purgeable */
>>>> +		if (bo->madv_purgeable !=
>>>> XE_MADV_PURGEABLE_WILLNEED)
>>>> +			xe_bo_set_purgeable_state(bo,
>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>> +	}
>>>> +}
>>>> +
>>>>    /**
>>>>     * madvise_purgeable - Handle purgeable buffer object advice
>>>>     * @xe: XE device
>>>> @@ -231,14 +315,20 @@ static void __maybe_unused
>>>> madvise_purgeable(struct xe_device *xe,
>>>>    		switch (op->purge_state_val.val) {
>>>>    		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>>> -			xe_bo_set_purgeable_state(bo,
>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>> +			vmas[i]->attr.purgeable_state =
>>>> XE_MADV_PURGEABLE_WILLNEED;
>>>> +
>>>> +			/* Update BO purgeable state */
>>>> +			xe_bo_recompute_purgeable_state(bo);
>>>>    			break;
>>>>    		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>>> -			xe_bo_set_purgeable_state(bo,
>>>> XE_MADV_PURGEABLE_DONTNEED);
>>>> +			vmas[i]->attr.purgeable_state =
>>>> XE_MADV_PURGEABLE_DONTNEED;
>>>> +
>>>> +			/* Update BO purgeable state */
>>>> +			xe_bo_recompute_purgeable_state(bo);
>>>>    			break;
>>>>    		default:
>>>> -			drm_warn(&vm->xe->drm, "Invalid madvice
>>>> value = %d\n",
>>>> -				 op->purge_state_val.val);
>>>> +			/* Should never hit - values validated in
>>>> madvise_args_are_sane() */
>>>> +			xe_assert(vm->xe, 0);
>>>>    			return;
>>>>    		}
>>>>    	}
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> index b0e1fc445f23..39acd2689ca0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> @@ -8,8 +8,11 @@
>>>>    struct drm_device;
>>>>    struct drm_file;
>>>> +struct xe_bo;
>>>>    int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>>>    			struct drm_file *file);
>>>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> index 43203e90ee3e..fd563039e8f4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
>>>>    	 * same as default_pat_index unless overwritten by madvise.
>>>>    	 */
>>>>    	u16 pat_index;
>>>> +
>>>> +	/**
>>>> +	 * @purgeable_state: Purgeable hint for this VMA mapping
>>>> +	 *
>>>> +	 * Per-VMA purgeable state from madvise. Valid states are
>>>> WILLNEED (0)
>>>> +	 * or DONTNEED (1). Shared BOs require all VMAs to be
>>>> DONTNEED before
>>>> +	 * the BO can be purged. PURGED state exists only at BO
>>>> level.
>>>> +	 *
>>>> +	 * Protected by BO dma-resv lock. Set via
>>>> DRM_IOCTL_XE_MADVISE.
>>>> +	 */
>>>> +	u32 purgeable_state;
>>>>    };
>>>>    struct xe_vma {
