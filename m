Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C74CE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 22:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C810E2A7;
	Thu, 19 Dec 2024 22:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlZoxZvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A285110E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734646628; x=1766182628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m/4ErPI81oMmDi/aFC5B+lJzVBTXHzAJzMzE2ohQdg0=;
 b=TlZoxZvwiyr/GJlONMJT4JOkOw4dTXKxV3kfjzH9j5P1t+sDBLmZXyEU
 w1KuCVdQFx4OxFz8eIVoJXjZfzAOaa9Ci8KvK2ZYUsEfTMLAq4gU2njH3
 eKkR7vPDj1bv7a8pE7DgvgObahrOfVTlQIa/ZHXmeSZnK1MLnbuHQzR/Y
 b5lmwJSDoOLZYZt/XTNOl9xEFMQPwbQCQWjBqumYuiZybmjCdWVCF2G8Y
 L6Yl8yF4ygIJUZGTH/nmrkWkFxQ7VObTZ0Fb9s/4AlrKNKCWH2tyDIffy
 8ErrMLa7rWDQiW57ZeC7a98k3RmeQmfRpIVFySWXH4D9rUlRilps+wOy7 Q==;
X-CSE-ConnectionGUID: 7BFRsj3pRauQUs7ntxEm3A==
X-CSE-MsgGUID: l1DDskRJRN6ON2SmmdIHew==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35334093"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35334093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 14:17:08 -0800
X-CSE-ConnectionGUID: uA4uGbNGRlCtkGBODhhbhg==
X-CSE-MsgGUID: AekmfrTQSyylbi4qlUr3uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98155166"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 14:17:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 14:17:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 14:17:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 14:17:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDtWhgqzFE0Pq9u+UkyfQHsxDDDwbVcyHGHiex/IvQB1tm9W1ffKBznyUcQ+InZNsWGuA0IVv8hLxl6BHQ5KG7j4KzEqclrV/5mexri5vXMOAKPC6Pc/A+CnnpP5BKVzpIcAWWMZO6o+g0WiEjFmlwUK7E1oEW4Uz4JJgpE6E8RXV25lzufKuyNhNXqDgVWcQXyWq/AFcf3neQ059Rk/onc4rR6jrRYcIqeTJThjGX512ookaJiC43z+FR/Knt77zSyIlJhl2oFo4EuIG7xboTrvO2SXeQAWu+3mW2Rb+hDZNVkcBE16nmpVCTxVYR8q5/9lMk3Mc40q3Y1c+rBajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3DvwYmPqUP1Z6NzE9OmZO9Dk3/0vxNYRmSgWyZnYgc=;
 b=Ohrd2HUyGxVg+1e4XlFL6zCoyY5MbCFeQcYuwEHn10TsgjH+MACsUjV+VwuIGQFfM3lLJNgraT4J9ibehuCcxbKvSGzAHLoOcs55BC9JuzYzN78DRWPj53GUxnFs1gqUrNGY1OidUt7AGRP/YDB7qGlnbKKjF23VaqWCEgXUXqF+zFm+uj2v7SUVTeeoiNrSs7a9jQQoiS/zlLDxTMPl8R/wkjVy2xLcCKmSbtBjqSRNVmibYkwkg/szpus7tbN2obhUHJN4ontg5hYv3wvHWZlHjJbr3InW3JLE5K2/5ZmWfogSNbp/othDWbdjhOTYu/PV4dzMeZYucf5B0oZrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 22:17:05 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:17:05 +0000
Message-ID: <f723a730-6fde-4d65-ad29-b86018cbc768@intel.com>
Date: Thu, 19 Dec 2024 14:17:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Make GSCCS disabling message less alarming
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Eero Tamminen <eero.t.tamminen@intel.com>
References: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
 <d7eca832-4b1d-4622-894d-c8d99e0dd39f@intel.com>
 <3b515ac4-9404-458d-a734-831d84accff2@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3b515ac4-9404-458d-a734-831d84accff2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0286.namprd04.prod.outlook.com
 (2603:10b6:303:89::21) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: d43b8b6c-99a6-4296-d37d-08dd207adee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFFMSTVsWTNpSW1WeWhDU0R0U2xTcnVOMTNlM3pONWVFL0ZlREpWakZ5dEZn?=
 =?utf-8?B?aTI3NkM0U2ZDRXRuRnM3R09LQ3E5U3ZScndxUEF6QUNQRGFPRnIzUTJRNnYz?=
 =?utf-8?B?S2JRWGNJK2o5akNLdG54dkQ0eWhKMkIraEl5Y3AwVzdKSHk5U1Rudmw1ZkxI?=
 =?utf-8?B?WjNldW5LVUloUHgwRW10STZUMnBTZXY0b2xTbDVtbVZIVGltcTZVWHJLSE9L?=
 =?utf-8?B?NmZuNEhjK2pyMFMyM0xkWGhoWk8vVkR0OURFVllXL1gvZEdxK1UyVDJ1Z1FL?=
 =?utf-8?B?NXZ0c3NDS09MNlhrdEdPR2tmb0Uxd2dCbGppQlFrNnFXODJ6NTBFVFlpNDBJ?=
 =?utf-8?B?V1B2eVB2WEpNdFF5VnNOS0J6ZWpBQVJsZHJiNGxxSndTYVpDV1F4OFB1ZFFi?=
 =?utf-8?B?WHpOVjVLS2kvZ1NmdWpUWGFNcm9WcldIR0pJTzFiQ096OUxKRElGTUFPbTFk?=
 =?utf-8?B?cUk0Y1BkQnFjQXJXU0ZIZExEdWw2SHVmbWRxNEdsSEFsOUwxYmxUVWpqVm1V?=
 =?utf-8?B?OVpGbjlWRWNXMk5YQ3UzVjEybGNkM2lVR2NUU3p3OHU4VHFpaTlTUUlPTXVy?=
 =?utf-8?B?S0x4NnBtd1ByajVWWWRlclAyT2FDbmV0b1lJTUpVcjV4UlBBdGtFbzVMeHl1?=
 =?utf-8?B?bmU0VFBkNGozNDZzYzY0dWRYTit1RXI0ZUZIOUlBbVNmbWhnSlhBbjQ1cXkx?=
 =?utf-8?B?YUoycHBCVjY0YUx5akt3dWlqRnZ2SXR6M0NZbVpOK3lSMURxWXhFcEU2N1Rq?=
 =?utf-8?B?NXZsWEYxbTZYSU02anVycXYzMzIvbTN5c0YwVmFoWlJOUk5Ud1VLZDNTVUEr?=
 =?utf-8?B?SGJZaTJ1M2lKWEIweWd3OThRN2ZieTdyb0oyb1RKWkI1YnIvMnNDVHFGaWFl?=
 =?utf-8?B?TU5FbXNzNVJsNWtFSU5nd1B6QTgxaVc4b00vN1l1cmdTSlVLS1JWa1Q3T1RC?=
 =?utf-8?B?azBLbzd6RjlTc01KZzRtYW5Wc3VHazRmSk9EcGEzTVdJQkxkYmt5WU9LMVJu?=
 =?utf-8?B?U1BlZ2lkbktEeDh5VEZhUGlqb0xZMDlUek0vN3BkZzhmNERvbGtOdUJxR250?=
 =?utf-8?B?RTVkbERyL2Z5NHBqaEx6VlJKMUNERUt3T0lvWmtzSEFWUG5nZUhBaVFzQXM5?=
 =?utf-8?B?bGNuSEFxdEcyaHJVbXRuakN5dkllR1lJelZITGFMT3p2dzdtVGI0TkJlMDcz?=
 =?utf-8?B?VTJmSkhJR3RmclE1dzhIV05ZMVJYRnArYk9GOGZtM2gyUUJmQ3IzT0xWaU0w?=
 =?utf-8?B?bmw3SjV4TzVrRVkwejlsNFNwdUZJZXZXUm9xTUVBbkV4S3VIRDNXZUFhd3Br?=
 =?utf-8?B?ME41TG11cFNZaXZxd3g2QThrcUVtWEdTYlJBWVJuK0VrdWl6MGJrL3RkUDRD?=
 =?utf-8?B?aCtibTdMb1lvM05DM0UvRng5R1gvSkw4Q1FDbHpTUGN3dWUxL3F1NmRLNHoy?=
 =?utf-8?B?QkxIazhocnRIYnkyNjI5eUlrOW0rbjhVOG1Ubm5FandUU0twc2NwTW1BaWFK?=
 =?utf-8?B?OEx5cVZ3azZZMlFYdEUvdXlnekNONFExNWhEQ2duS0lYVEdLQU1MN2VnNjA5?=
 =?utf-8?B?K2xjL0EvRG5IaVdkRWR6Zm1ESUc1YjI4VDF1SVNzMDRpcE9KSVZIQkpaRGgv?=
 =?utf-8?B?eVVtUW41UUpEd3VOSy9nR3d3cnFSU2RscE1UL1diVG53VHJtRit6UU9vc2hU?=
 =?utf-8?B?djJNNTRyZC90TlNYUmJGdjV0SEVWa1NOanh0QmlnUndiMVJpUEw5K0hjLzlQ?=
 =?utf-8?B?S2ZxQjd3TzRhUkhab2pnS29IQUtOYTRmcXdHOXdPakw2a0QvWnVTZWcwTWxS?=
 =?utf-8?B?OEFPMS9DeWRrYk9aekxsUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L29kQWdpUW81VDFkTWJob1RITzUvTHpsek96S28xRU1QWVA4c09nMTY3OU5a?=
 =?utf-8?B?ZVlaVHcvTEhvWGhILzdpaE90RlZKaitYWGQvZGRCS09YVUoxRGsvTCt2Vjl5?=
 =?utf-8?B?elBJZVNjZld0L2UwNVRoTFlwSUZ6U3JhMUZ6cWR0dS84bmZ4dlFDZ25ZU0p2?=
 =?utf-8?B?SCsvaHFyak5VT1lybXJqTExRYTlJUDJsbi9CYVI1UUJnTWNPMFNGUW5rVVdP?=
 =?utf-8?B?NHpCRFU1R3QrcU1CL1d6cTIvSThGd0tFdUVUTXJ3ZXlJVVNrRk5pK2liQ05C?=
 =?utf-8?B?eUhzcHBOY3poOCs4ZjRsL1d5bEZReVlTYjhuSUtmMFg3Nlg0TWZwbDZ4WDdx?=
 =?utf-8?B?Y2E4N3FTOUNYMU9rMWs0TGU1ckFXRUlWcEV2ZW9wU3FVdWpYRDh2NVVUWmlM?=
 =?utf-8?B?eGVaVEVheVJRUisyRUg3Mnh5NTk2N0I1cTBMNm03ZWkwdmNTNG9hSVBTd0Vr?=
 =?utf-8?B?M2tQZ3JKK2VrSHFINUpQaHFiOVhLR3VLVEM3RGdmRDdMMC9uMDM2UkxMdGhP?=
 =?utf-8?B?RGc2UEgrTDBPQWhZcHNIc3UxcTBKRmZlV0s5Q25YRHVHRFhaS2FrOGVxQWVi?=
 =?utf-8?B?b1B4czBKWDBtek9yZ09DNVNjcENscG8zMk5lRDNyTzJCSlZvVmpWNDE0bTIv?=
 =?utf-8?B?WjZkVENKb0xBcXJ6T2pQZUhZNGtJMjlLejZJUUdpMFZXY2VXYitXejRKY09R?=
 =?utf-8?B?VlJrejNGUXhKY2pLRjgrUWR1anZaMy9NV2RTTmsyZ1Z2cnIvY3BFaFdOQ2FK?=
 =?utf-8?B?UFFxdExIUTRyQmh5anJUM3JCTjJJR1ZDdGNSektubUg4QlhpWFB2ODVWMHpY?=
 =?utf-8?B?K2c3RUxvRjE2bENQRHJaRlZmV0RMRmptU09SOEVud2plaFQ0QTdhcFZzb1NO?=
 =?utf-8?B?SElqRTdUclA1Tyt4enBDd0FWQmF3L2IwK3ZmUktkM3lYcFNBb3NvRG4rTEdk?=
 =?utf-8?B?dFpRaloyVGlZYkJBRHJVbjVCc3VBbUVGVUlBbkg5VUJXaUhVYVlSODlsY3RB?=
 =?utf-8?B?SFV4VEZveW9wbXN2Z29GMktYNStpWHp5cGtjL1d4d1EyYzVnczY1VndwR3Na?=
 =?utf-8?B?VkhLQ2JHS041RFF3cStHOEtxQnQ0cy9sSGZybmtkQXZzNmVuZ2IwS1B6c0pV?=
 =?utf-8?B?aFZIdUlBMVp0NnhmRVR6SVVqT2VIRUxaNis1NmFJd2RpWXlKVjFhYk9XZDh3?=
 =?utf-8?B?em92WDY2QkZQbExaRERVQVhTZTgySkJ2UzZuN2VBU0Ivc3R6TTBqbkQ5eFlP?=
 =?utf-8?B?V2xWdXZVTndoQ3NpR1k1Q29PbHpDSENFTlN5RTg3ai9EWDhkRENNM0lFYk9Q?=
 =?utf-8?B?K2cwQUxyRWlRWVZ6UmtPcGFFQmQ5aEpOMit1WGVTQkJ1NVd6cHYvdGFjN3M5?=
 =?utf-8?B?K3htc2ZOV1BxQVduQWZEd3laSW0vd082QnczSkh0ZXpQT3IydXJmMUx3OHU5?=
 =?utf-8?B?N1YvZ1FINENsY08xQWJZUU1Qc3l6VWxqSDdJTnIyOFo1Y284VzZWa0w1QTdW?=
 =?utf-8?B?bVpNbmJBME9OUVhrdWtCS2R6dUxxdzdLd2tpbU14aEExRVczRGVtc2NaNUR0?=
 =?utf-8?B?SVpPeXQ4S240aTBzNTVpcEZ2ZTVWT1pKY25IM1IvSW9odmw1Tkp0OW9RQ1kz?=
 =?utf-8?B?Y1VIcE9NdjRpN2xmRFA4S3F4TzdpOUVWdUVkeURKSnhseFphRE9mcWpPd010?=
 =?utf-8?B?ZHJJMDZFUFFQZzJ1b0xLdmFmQ3RCT1JscXV0bTl4aW8vT21PM1M4ckdIaDNv?=
 =?utf-8?B?amtBNGFmTkRROFFVWkVUOW00YmFDb1g2Q0hyVUtHQ3ZCSFB5WlA5NE1HR2du?=
 =?utf-8?B?OUJCR1ltY0FEa2Yxc1lYZWZoK1BjajBacDVScmdxR1UyNWsyd2FwK2pCS2E1?=
 =?utf-8?B?a1FMV25ZMXA2dExkbElGeTJvWEorWFVhbXZFdURZbUxOUm9hd0JvU0xBUGJJ?=
 =?utf-8?B?bEl0MFBHNWphVk1aTzRCckxPQ1lXV0hKSVpSZUN3d202ZU55eEFIbmdlZTM1?=
 =?utf-8?B?MVJzWUJ3aWVNZEV3MTEzT0c1eWJHdEpTUGRQcU45SUVtYms2Ny8ybm13eHdY?=
 =?utf-8?B?YnlReXYvY0FOYmdhc3g2Zkd2bi81bVF5Y3FZOVkrNW1hS0pVa29HdkxRamIx?=
 =?utf-8?B?OWI5OEhyd0dVZUpxQVN5VTN4V0JkQ1pBSVp6NDRDa09lbFVYZGY3YnBOenp6?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d43b8b6c-99a6-4296-d37d-08dd207adee3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:17:05.5925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM5Ti2vIgdQrInFk8AmxRkKt/Ytdc2bIPeESJOqajh3HEyqhNIhxw9I7rvwn0A5+S0aXHWa/OWBRRMG3Z7EpabureO+2HYHqPgCYB8QaKKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
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

On 12/19/2024 13:06, Daniele Ceraolo Spurio wrote:
> On 12/18/2024 5:51 PM, John Harrison wrote:
>> On 12/18/2024 17:09, Daniele Ceraolo Spurio wrote:
>>> The GSCCS is only used to transport messages from the driver to the GSC
>>> FW; therefore, we can disable it if we're not using the FW, which is
>>> the case on both BMG and PTL. However, the current wording of the 
>>> logged
>>> message could be interpreted as a problem, so reword to make it clearer
>>> it is not an error and lower it debug verbosity as users don't really
>>> need to know about it.
>>>
>>> Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3866
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index 4294aa600192..ac9c666a9652 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -775,7 +775,7 @@ static void check_gsc_availability(struct xe_gt 
>>> *gt)
>>>           xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
>>>           xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
>>>   -        drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>>> +        drm_dbg(&xe->drm, "GSC FW not used, disabling gsccs\n");
>> This message would also be hit in the case where the firmware is 
>> supposed to be present but isn't. E.g. on a LNL but without the right 
>> firmware package installed? But presumably in that case, there would 
>> already have been an earlier message about missing firmware files?
>
> Right now if the firmware is missing we abort the driver load, so we 
> don't even get this far. If that were to change (and the code here 
> does for this purpose support the case where the FW is defined but 
> missing) I'd expect we'd get an earlier error about the missing blob.
>
> Daniele
Sounds good.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
>>
>> John.
>>
>>>       }
>>>   }
>>
>

