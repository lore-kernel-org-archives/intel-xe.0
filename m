Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEF2D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 18:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB80F10E093;
	Thu, 14 Nov 2024 18:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7W7ZMN/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8825F10E093
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731609997; x=1763145997;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=71liJA7XJ1TY2tmtUl7weLAHT+MxVoS13MYv/PQ/fVw=;
 b=n7W7ZMN/iT42u3q1bYaQuKOsXdyfoSYa0QhXhxJK9PBNpZpCLV8dXvUV
 MK6dwXYwHMTMiUVFgD/fvHFLZ6kC/VGi0oADNIviwGvxoUDPteA3mhmLn
 DXf1c0vJwgaWff+Jo+7NIptjK5h+wR+mY1RwLQknQ/gcEtSgmhBZgDPSI
 hAMYAbA5/s9maOMlUvwsKoZdp/UypKApjm6HXDpthGpFZ2XNaiJt6f10V
 qCo3KL3huKWng/qw3JAmPl8Haxl11j1TWbwgtCefgKyJRWUxqehoXJisV
 fnh0aMT99oZvcG7TrHQJp9fxv1WoL9q6ktHM/C9zYzg0Vu4ATHDLn+Nvu w==;
X-CSE-ConnectionGUID: gKE9QaOFSqCZs3nrlLCDtA==
X-CSE-MsgGUID: VrFak9wZR0WkvCLOrzhvsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56975749"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56975749"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:46:37 -0800
X-CSE-ConnectionGUID: bAkdDuuVQreR/k0G8hAitg==
X-CSE-MsgGUID: 4LAJwyv4SsKu6dyb2DY47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="92743366"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 10:46:37 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 10:46:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 10:46:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 10:46:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGOjFnazpnTs2rHhexnJnGhcfY645TtVt77thfcuS+NJeYB45wMbcA0dWIfqDYQIRDkNX1rDllRTEaI9g7oTH/iK4uHm3NfSrVu7vwViyO4J1yTA+J7pYA1cKdQZN/91lmPCj3gFpVlzAgypJ/AKpsuID24EjtCcGMR7t77Ik+tjZIzjzZLhllkTzRXJvhX6tQQHaYReRkOb+SLejjhkS/qYTwFRz6BA8dWUMBFaPANSa5fy4uDHwjAflXx+MKcWY0hhKwzakSb/e754na20kTYvlUTEGZe+oMnNgW4q2zl2kKK9su8scCo58HDn+gS/ypW+AFOikAZZB8MCu5PChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ6MUOHhG5VIbZzEFtVecLWIK0DdfLTNzS17PRy+dRk=;
 b=GmZl+7jP8b1hlD3NjN+jebwMR8B2m+wyAi+w3LJeBA9fcE52LYR7OlJijjR88327QrS91VnYjjZz0ZTzW2ZNrmp9vZhJdjEVD6NQzXlP2RC/FQBv1VJhrzUK/5XBlxlYumjHasAHfav9J2Ut+K+p0LKKzT//EpmRl0Vfu5v5Y+8kSpV3SKpIoSTsRXMeo4SpUgVobVINUXoTUd4SM1aSsNsFAHCpPxU88dDx1ae1Z+xgmhNhOZonF6GjrpD5r3eHCDmV7KHfZVZfnERV/NZehuqHAsROaVDrTiXC3Wb9fNkM0nJGpowM5gthlfljh+223SkOYQpNGzh2/R6LAfuegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Thu, 14 Nov
 2024 18:46:33 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 18:46:32 +0000
Message-ID: <9a3615ab-8cf5-4fb1-ae2c-bdb5c3467337@intel.com>
Date: Thu, 14 Nov 2024 10:46:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/xe/pxp: Add VCS inline termination support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-4-daniele.ceraolospurio@intel.com>
 <5aad84d8-b884-4f34-9f79-d4403916f304@intel.com>
 <36752865-b12b-4ed1-9679-550b49875e24@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <36752865-b12b-4ed1-9679-550b49875e24@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 361ac93c-21ff-404c-d369-08dd04dca8bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGpDeUNZWWUrMWJXV3E5aDNENnNySm1JYkFSUEdseEd2T05jaElpSUFCMHpt?=
 =?utf-8?B?Q2FDVUVNdkN0dDdHZ3BURUFvMWhmcmRIMEdtckJaOWJwUi9xRm9BN1Fqc1ly?=
 =?utf-8?B?Q2lHamphbENYVFp1Q2xET0oxNU9Ma3FOV0lHWExBR1RiZXU4Z1VXc241bWs1?=
 =?utf-8?B?dWx3Zis5ZEMvdXA5Wlp6eFNnelVnRTlpZWlhVElMOUFxNjdOS1lhdi92L0VY?=
 =?utf-8?B?V28wK09OcU5RTm05ZWRqMHVaenF6VmV5MEkxS1ZnVVEwRXJqNTluZ3FXME05?=
 =?utf-8?B?WjNNNjBTUGppcElYdi9ER3d3dVBZNXZUdFJBcnI1YVhoY3dpSXFmTmhqMkl6?=
 =?utf-8?B?RFRHTncybTZkZWF0SjVzaEQvS2JnMTQ3YkNRcFBFSVBHRUxWSmt0Skl3R3Qr?=
 =?utf-8?B?NyszQTducHN4TjNTeG01Z1BGVnh0Z01LTURqdTBWTVBSQ2N6Tkt6ZnJ1OHlm?=
 =?utf-8?B?Q2Njak1rU2V3Si9GT3c4WllyU043azBsRjZLRThwQk9LRVd3M0dJanlVaGtu?=
 =?utf-8?B?OVA2Umd2TVF1TndyNk50cWhucmkxd3VURXRBMFhpZG0zbUEvMW1DNldIN3Ew?=
 =?utf-8?B?WTlteEV2VXVlUUV4WWV0R3ltc3NYa1NDYmZVajV4MFJteHJuOGJiU0E1N01Y?=
 =?utf-8?B?L3lLUGdwQzExenEwL2diMCtqOCt0ci8wLzRyOGtzR053WjhnejREWFNWNzNU?=
 =?utf-8?B?bmk1a2c5WjVVcktBNDErdHJUdUJNcFBkRWRJRE9Ja2pFcm9hQ0NBTVB3QTIy?=
 =?utf-8?B?Z0RxcGo4Vk96cE12R3h3bjdoaG0rek0xYmR4bkpNa09uWVR6WDgrUVhMVGNV?=
 =?utf-8?B?c0JnRndwakhWYnVhZ3Vnajg1bUhSdkN4K2lFdXArczFsOStJTDd1NS9RY2c4?=
 =?utf-8?B?c3pQOTUxc1cwbUdwTDlBVHVXZWVKZTNaVXJ2U2cycm1SRWdUSER3THMwbHZ5?=
 =?utf-8?B?MGlFa1lObk9CK2p4RGc5amJQY1luaGFlUjE0K1ZFNlYxRlJBUHRFM000Vi9C?=
 =?utf-8?B?bUxIMkFQNjkzUUJFRHpKMkxNTkdjOTZpRndSdlc4NU9aSHp0SVpkeUhqUmdt?=
 =?utf-8?B?aHdob1FGU21BNUk3L2hrMzFmS1g4ZlhyNGZIalZ3ejFHRlFUcHdiM2VVTDds?=
 =?utf-8?B?T3QwZlBhdURuZFBTSGdScm9WZzY3Ri9LRmhvdG10M2YxdjVYWGtnQURId3NG?=
 =?utf-8?B?MzV5a2g3R1A0WDI1cytjM25kQmpDNWJvc2krY0JmMXoyMGdWRXV2KzlXOW5k?=
 =?utf-8?B?eGFxUGtXTW9tNFMxcVNrQmM4TGpLWkxUSDhNUFJqQm52RHNOR3FuU01PMk1W?=
 =?utf-8?B?RUN3Uk82R1g0Q2ZGbXdqZng4YW1Sdkk1SThIRjhSQjB3NkpjZnlHVDJlZ0Rh?=
 =?utf-8?B?OUU0d01kVmM0WUlmVVk5czh4OU5CaFR2WFpodWVaUUFrZllyNDRtN1NGSDF5?=
 =?utf-8?B?WHBBZ3FiQWdCUitRdTVhMTRIYTc2amFLNGh4emh6U082TWEzUkhKNjdKc210?=
 =?utf-8?B?bU53TDdnR0ZaMkJaaGZETXRHUGJEdy9WSnp1czNjV3M0ZnRmVVBQbFlRMWh2?=
 =?utf-8?B?TTd0QVN2N3NHK29RdmIxVmNEQjgxYzRUMjJqM3M3N09ZUWZXbldaOUJraDl6?=
 =?utf-8?B?KzRDZWFwNUt1SUhGODkxQXRjeDdTZkNDVFZFd3JtRzhoR1VueXFmc1BLS1FO?=
 =?utf-8?B?LzJxMmxYM0Mxb1hBS2JMNVhvQWY1TCtrdVBXSE05MXNxME55M3VNK0VnMjJx?=
 =?utf-8?Q?2Gg5ME6zGYG5Xt0uPiceCcnDvMmBcrqk+3hhRvb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJOTE41bDhDeHc2SnVBUkgzQ2hWUGF0cGpkTncrVEdHOUpYYjI3TmpNT3Yz?=
 =?utf-8?B?YUZYNEorV1pHR2gxNUszS3Y0cjdHeG8vSVN5b0ZSUlRaNlFvQUdHekZnbFA5?=
 =?utf-8?B?UytKRVE0OVRiMWwrd0w0MXdLWVh0RG93c3o4aFkraldYL3FBaUlFYmZ5YnVF?=
 =?utf-8?B?VG9PUDU3aHRVc0FYV0JQWk5WL2I3bS9YcDV6RERqMzZvUW1IU2E5ZTVYZDFm?=
 =?utf-8?B?MFJpTFNFZFpqZmEvZjF3MndGMGEvd0dxTmt6SUNsaEhCQzhtbElRRDFQKzNk?=
 =?utf-8?B?OUw1N0ZsOUg3aTMrUE5lS2w4aEFmSlptTUtEWlhoWkU1OURmTS9wWGxrVU5I?=
 =?utf-8?B?V01BUzlDbWE5NTBURHRXYzc2UVBaa01hdFAxZ2k0VG1vUVN0cG81Z25FTjUz?=
 =?utf-8?B?a0tKcHFtL1VwUHJXR3NTTVlSVkJLUmNrUEgwK204Yi8yQ2l6ZTFENS82ejVm?=
 =?utf-8?B?SlZ2RjFqZnl5WFdMVlF4Z3AxU3FuZVgzTUo2eHMwcmpFNjBsZ1BKRHlUNVZI?=
 =?utf-8?B?K0JqcXFRR0dNWHhmQm9GR3AxekpZYkJGczlUTlNYN2QwWTRYaVBHbU1BeHZl?=
 =?utf-8?B?UXFlTE5BQ2k2dFl0UDVOZUU5QU02Y3BXZWtPVVpwYW9ra3BsVTRlUXpYY25G?=
 =?utf-8?B?NVI4MDhTUE93RVo3Sm5CdWNPbXVlTldQQnZTa2dIem1RT21JeUNtZmN5MmxO?=
 =?utf-8?B?cnhSTFJLMDhhOVpYVnJSRFhIU2xNd0xjd2JId1VNNXo3YjQxMVpGQ0JiZC9p?=
 =?utf-8?B?Vnoxd0xRRTJGU3V6aURaUitpQ0d1Vy9sb3FaelFWcHRyVFd1U1lXRXpZcE4x?=
 =?utf-8?B?TEVMSnN1L2RsamUwbFpKaWlNTm56RStYZzZXZTlDQjJPY2FRYVl0ckNUM1FX?=
 =?utf-8?B?TVBPdVJzT3ZsSmdtUjRUR2NyRzBoOEI0SDZKYnNmOW5sOFpTVHhOMWM4SS9k?=
 =?utf-8?B?T3N4bjkwWkc3Y24yNm5jZmFGWEhEWG15MHF0N0t6aWlHa0N1SGdGTUVQZzZ2?=
 =?utf-8?B?QXRteW94WjRselljc0ZtcXNzUmNsd0ZpdDZ1dDhjaXllcDVnUWM3alNZZytl?=
 =?utf-8?B?VzhjaDAyQjJROFZCNHJ5bTVZQlpLdkdSSTNkTXpzMDdGVmdGNllVVVVQejIy?=
 =?utf-8?B?WHJrL0ZtWHBVY0ovWUIydks4VEs5WENXSUZrSjJ0UjY1SmhXcFZ2OW54NDVO?=
 =?utf-8?B?TngxSUt5WW4wcFZNRTZrNVlXbTFMeEtuM0h6S1FqWkFmSHBYWHRrcFhEUGU4?=
 =?utf-8?B?OWVYNEJBT3JWbDJSWlZVeW1lem41NUpXVDZlQllLSURSeWN6VjhKOFp3b1Fs?=
 =?utf-8?B?bmd4MUR6U0RwWjV4MGgwV2VIRDcvNXdsMTcyZ09ob2l1N2Y2SVkzbklYa3dI?=
 =?utf-8?B?d0RGeVVTc1lHdmdQRG9XUnlSQWd1bWs0UmZhaDQ1UVRqcG1BeGd0MFpkcmpu?=
 =?utf-8?B?d3FUQTNVOGk0bGJNLzcxYWdheFFzamh4U3dHSXl3VnFqVXQ1Mnh1WW96dTdS?=
 =?utf-8?B?SThEdWZndGlLSXNxNFhMWWh6VWd3ZlljZ2k4V2h5TUZiaEhoTDhSLzJTT3ZT?=
 =?utf-8?B?SEFGTnBaMGlqQ3lSZHczMTlQYytHc0RDSWk4MmtYSzJwaGh2K0NuTVlDVzZm?=
 =?utf-8?B?UGJHdzZvaWNEK3F4cndEUXhYdVI1T1pKbUtTZkdJV0tBWGpqZzdqZVpRVVh4?=
 =?utf-8?B?cmx1Y2JnTTVQZjJnUVp6RGtFbCtWN1lEeW9iM2FLUEl2bjJJMHlFU2J2TUwv?=
 =?utf-8?B?K2IyYjlDVmpzRUFYdWdBbnVHNUJjR0VlV2dVNW13RUZtcEVzUGtSNWFqd2NO?=
 =?utf-8?B?NXY5Q3dyUUx1NGxwaDBVM2dWbXMyNjRpNUlaSEU2MzVYWlFEME5WRFdOTDAv?=
 =?utf-8?B?SVV2Y0VrUVpiZEs0bVh5SWpkUzZJRnowWnkweldmLy9nQlkwdUN3YTNoNWxy?=
 =?utf-8?B?c01WbFpuTFdScGZjcHl1Yk9mREVadXAyb3FKdEdYY1cvTXZlMkprTCtnMVlu?=
 =?utf-8?B?dlFVL09LbjhBTUMzM2dpWXQ4YUlyOXpTQVJVSVdzQWdhb3lVdG0rOGhQL0p2?=
 =?utf-8?B?b3hJbmF6Tnphc1N0RkJRTFpCOVdGNDNZbVovM0ZxYXMrT25EcEdoU2czdjNr?=
 =?utf-8?B?cVFMb2hOTXdKQklwVUU1cUNvWTFpZkdpWEtUdnNJZ2JTUFMxMGVVYUMzdVdp?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 361ac93c-21ff-404c-d369-08dd04dca8bf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 18:46:32.8743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ED10hSDjk59ni5m31SmAEaVrnFTOJlIO5TPd50PFjj9IOL8FA/5deQcwQlsLV78yXZ+8q2DBDipj8Sks+qk2UU88wQe1U1zUmJCh8Z7M1LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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

On 11/6/2024 15:49, Daniele Ceraolo Spurio wrote:
> On 10/4/24 15:25, John Harrison wrote:
>> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>>> The key termination is done with a specific submission to the VCS
>>> engine.
>>>
>>> Note that this patch is meant to be squashed with the follow-up patches
>>> that implement the other pieces of the termination flow. It is separate
>>> for now for ease of review.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>>>   .../gpu/drm/xe/instructions/xe_mfx_commands.h |  29 +++++
>>>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
>>>   drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
>>>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 108 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   2 +
>>>   drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
>>>   7 files changed, 149 insertions(+), 3 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h 
>>> b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>>> index fd2ce7ace510..e559969468c4 100644
>>> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>>> @@ -16,6 +16,7 @@
>>>   #define XE_INSTR_CMD_TYPE        GENMASK(31, 29)
>>>   #define   XE_INSTR_MI REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>>>   #define   XE_INSTR_GSC REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
>>> +#define   XE_INSTR_VIDEOPIPE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>>>   #define   XE_INSTR_GFXPIPE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>>>   #define   XE_INSTR_GFX_STATE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
>>>   diff --git a/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h 
>>> b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>>> new file mode 100644
>>> index 000000000000..686ca3b1d9e8
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>>> @@ -0,0 +1,29 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_MFX_COMMANDS_H_
>>> +#define _XE_MFX_COMMANDS_H_
>>> +
>>> +#include "instructions/xe_instr_defs.h"
>>> +
>>> +#define MFX_CMD_SUBTYPE        REG_GENMASK(28, 27) /* A.K.A cmd 
>>> pipe */
>>> +#define MFX_CMD_OPCODE        REG_GENMASK(26, 24)
>>> +#define MFX_CMD_SUB_OPCODE    REG_GENMASK(23, 16)
>>> +#define MFX_FLAGS_AND_LEN    REG_GENMASK(15, 0)
>>> +
>>> +#define XE_MFX_INSTR(subtype, op, sub_op, flags) \
>>> +    (XE_INSTR_VIDEOPIPE | \
>>> +     REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
>>> +     REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
>>> +     REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op) | \
>>> +     REG_FIELD_PREP(MFX_FLAGS_AND_LEN, flags))
>>> +
>>> +#define MFX_WAIT                XE_MFX_INSTR(1, 0, 0, 0)
>>> +#define MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG    REG_BIT(9)
>>> +#define MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG    REG_BIT(8)
>>> +
>>> +#define CRYPTO_KEY_EXCHANGE            XE_MFX_INSTR(2, 6, 9, 0)
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h 
>>> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>> index 10ec2920d31b..167fb0f742de 100644
>>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>> @@ -48,6 +48,7 @@
>>>   #define   MI_LRI_LEN(x)            (((x) & 0xff) + 1)
>>>     #define MI_FLUSH_DW            __MI_INSTR(0x26)
>>> +#define   MI_FLUSH_DW_PROTECTED_MEM_EN    REG_BIT(22)
>>>   #define   MI_FLUSH_DW_STORE_INDEX    REG_BIT(21)
>>>   #define   MI_INVALIDATE_TLB        REG_BIT(18)
>>>   #define   MI_FLUSH_DW_CCS        REG_BIT(16)
>>> @@ -66,4 +67,8 @@
>>>     #define MI_BATCH_BUFFER_START        __MI_INSTR(0x31)
>>>   +#define MI_SET_APPID            __MI_INSTR(0x0e)
>>> +#define MI_SET_APPID_SESSION_ID_MASK    REG_GENMASK(6, 0)
>>> +#define MI_SET_APPID_SESSION_ID(x) 
>>> REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>> index c24542e89318..d411c3fbcbc6 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>> @@ -20,7 +20,8 @@ struct xe_lrc;
>>>   struct xe_lrc_snapshot;
>>>   struct xe_vm;
>>>   -#define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>>> +#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>>> +#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>>>     struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct 
>>> xe_vm *vm,
>>>                    u32 ring_size);
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c 
>>> b/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> index b777b0765c8a..3b69dcc0a00f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> @@ -6,14 +6,20 @@
>>>   #include "xe_pxp_submit.h"
>>>     #include <drm/xe_drm.h>
>>> +#include <linux/delay.h>
>>>     #include "xe_device_types.h"
>>> +#include "xe_bb.h"
>>>   #include "xe_bo.h"
>>>   #include "xe_exec_queue.h"
>>>   #include "xe_gsc_submit.h"
>>>   #include "xe_gt.h"
>>> +#include "xe_lrc.h"
>>>   #include "xe_pxp_types.h"
>>> +#include "xe_sched_job.h"
>>>   #include "xe_vm.h"
>>> +#include "instructions/xe_mfx_commands.h"
>>> +#include "instructions/xe_mi_commands.h"
>>>   #include "regs/xe_gt_regs.h"
>>>     /*
>>> @@ -199,3 +205,105 @@ void xe_pxp_destroy_execution_resources(struct 
>>> xe_pxp *pxp)
>>>       destroy_vcs_execution_resources(pxp);
>>>   }
>>>   +#define emit_cmd(xe_, map_, offset_, val_) \
>>> +    xe_map_wr(xe_, map_, (offset_) * sizeof(u32), u32, val_)
>>> +
>>> +/* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
>> completed
>>
>>> +#define MFX_WAIT_PXP (MFX_WAIT | \
>>> +              MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
>>> +              MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
>> Why define an XE_MFX_INSTR macro that takes a flags word only to 
>> manually OR the flags in outside of the macro?
>
> Maybe flags is a misnomer here, but I couldn't think of anything 
> clearer. Some commands have bits that are always set within that flags 
> field, so for those we would add them at definition time; other 
> commands, like MFX_WAIT, do instead have optional flags, which we can 
> set as needed in the code.
>
> Given that I haven't defined any XE_MFX_INSTR command that requires a 
> value in the flags field, I'll just remove that field from the 
> XE_MFX_INSTR macro for now to make things clearer.
>
>
>>
>>> +static u32 pxp_emit_wait(struct xe_device *xe, struct iosys_map 
>>> *batch, u32 offset)
>>> +{
>>> +    /* wait for cmds to go through */
>>> +    emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
>>> +    emit_cmd(xe, batch, offset++, 0);
>> This zero is just padding to ensure 64bit alignment of future 
>> instructions?
>
> yes
>
>
>>
>>> +
>>> +    return offset;
>>> +}
>>> +
>>> +static u32 pxp_emit_session_selection(struct xe_device *xe, struct 
>>> iosys_map *batch,
>>> +                      u32 offset, u32 idx)
>>> +{
>>> +    offset = pxp_emit_wait(xe, batch, offset);
>>> +
>>> +    /* pxp off */
>>> +    emit_cmd(xe, batch, offset++, MI_FLUSH_DW | MI_FLUSH_IMM_DW);
>>> +    emit_cmd(xe, batch, offset++, 0);
>>> +    emit_cmd(xe, batch, offset++, 0);
>>> +    emit_cmd(xe, batch, offset++, 0);
>>> +
>>> +    /* select session */
>>> +    emit_cmd(xe, batch, offset++, MI_SET_APPID | 
>>> MI_SET_APPID_SESSION_ID(idx));
>>> +    emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
>> Seems odd to define a helper function to emit this instruction and 
>> then only use it for some instances.
>
>
> I didn't want the extra padding here or to make the function 
> conditionally add it only when needed. I'll just add it, it's not like 
> we don't have enough memory (the BO is 1 page and we only use a few 
> dwords for the termination).
I guess what we really want is an emit function that looks at the size 
of the instruction being added and pre-pads as appropriate. Then you 
don't need to worry about optional padding after an instruction 
depending upon what may or may not happen next! But probably not worth 
the complication. As you say, a few extra words of padding in a 
non-critical buffer is no biggie.

John.

>
>
>>
>>> +
>>> +    /* pxp on */
>>> +    emit_cmd(xe, batch, offset++, MI_FLUSH_DW |
>>> +                      MI_FLUSH_DW_PROTECTED_MEM_EN |
>>> +                      MI_FLUSH_DW_OP_STOREDW | 
>>> MI_FLUSH_DW_STORE_INDEX |
>>> +                      MI_FLUSH_IMM_DW);
>>> +    emit_cmd(xe, batch, offset++, LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR |
>>> +                      MI_FLUSH_DW_USE_GTT);
>>> +    emit_cmd(xe, batch, offset++, 0);
>>> +    emit_cmd(xe, batch, offset++, 0);
>>> +
>>> +    offset = pxp_emit_wait(xe, batch, offset);
>>> +
>>> +    return offset;
>>> +}
>>> +
>>> +static u32 pxp_emit_inline_termination(struct xe_device *xe,
>>> +                       struct iosys_map *batch, u32 offset)
>>> +{
>>> +    /* session inline termination */
>>> +    emit_cmd(xe, batch, offset++, CRYPTO_KEY_EXCHANGE);
>>> +    emit_cmd(xe, batch, offset++, 0);
>>> +
>>> +    return offset;
>>> +}
>>> +
>>> +static u32 pxp_emit_session_termination(struct xe_device *xe, 
>>> struct iosys_map *batch,
>>> +                    u32 offset, u32 idx)
>>> +{
>>> +    offset = pxp_emit_session_selection(xe, batch, offset, idx);
>>> +    offset = pxp_emit_inline_termination(xe, batch, offset);
>>> +
>>> +    return offset;
>>> +}
>>> +
>>> +/**
>>> + * xe_pxp_submit_session_termination - submits a PXP inline 
>>> termination
>>> + * @pxp: the xe_pxp structure
>>> + * @id: the session to terminate
>>> + *
>>> + * Emit an inline termination via the VCS engine to terminate a 
>>> session.
>>> + *
>>> + * Returns 0 if the submission is successful, an errno value 
>>> otherwise.
>>> + */
>>> +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
>>> +{
>>> +    struct xe_sched_job *job;
>>> +    struct dma_fence *fence;
>>> +    long timeout;
>>> +    u32 offset = 0;
>>> +    u64 addr = xe_bo_ggtt_addr(pxp->vcs_exec.bo);
>>> +
>>> +    offset = pxp_emit_session_termination(pxp->xe, 
>>> &pxp->vcs_exec.bo->vmap, offset, id);
>>> +    offset = pxp_emit_wait(pxp->xe, &pxp->vcs_exec.bo->vmap, offset);
>>> +    emit_cmd(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, 
>>> MI_BATCH_BUFFER_END);
>>> +
>>> +    job =  xe_sched_job_create(pxp->vcs_exec.q, &addr);
>> Double space
>>
>>> +    if (IS_ERR(job))
>>> +        return PTR_ERR(job);
>>> +
>>> +    xe_sched_job_arm(job);
>>> +    fence = dma_fence_get(&job->drm.s_fence->finished);
>>> +    xe_sched_job_push(job);
>>> +
>>> +    timeout = dma_fence_wait_timeout(fence, false, HZ);
>>> +
>>> +    dma_fence_put(fence);
>>> +    if (timeout <= 0)
>>> +        return -EAGAIN;
>> Does it not matter what the error was? Why/how would this fail in a 
>> way that needs to be re-tried?
>>
>> Although looking at the later patches, the return value from this 
>> function is just treated as a pass/fail bool anyway. So why bother 
>> munging it at all?
>
>
> Timeout can be 0 on failure, so can't return that directly. I'll 
> change it to return timeout if negative and an error if it actually 
> timed out.
>
> Daniele
>
>
>>
>> John.
>>
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h 
>>> b/drivers/gpu/drm/xe/xe_pxp_submit.h
>>> index 1a971fadc081..4ee8c0acfed9 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
>>> @@ -13,4 +13,6 @@ struct xe_pxp;
>>>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>>>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>>>   +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>>> +
>>>   #endif /* __XE_PXP_SUBMIT_H__ */
>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c 
>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> index 0be4f489d3e1..a4b5a0f68a32 100644
>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> @@ -118,7 +118,7 @@ static int emit_flush_invalidate(u32 flag, u32 
>>> *dw, int i)
>>>       dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | 
>>> MI_FLUSH_IMM_DW |
>>>           MI_FLUSH_DW_STORE_INDEX;
>>>   -    dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
>>> +    dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | 
>>> MI_FLUSH_DW_USE_GTT;
>>>       dw[i++] = 0;
>>>       dw[i++] = ~0U;
>>>   @@ -156,7 +156,7 @@ static int emit_pipe_invalidate(u32 
>>> mask_flags, bool invalidate_tlb, u32 *dw,
>>>         flags &= ~mask_flags;
>>>   -    return emit_pipe_control(dw, i, 0, flags, 
>>> LRC_PPHWSP_SCRATCH_ADDR, 0);
>>> +    return emit_pipe_control(dw, i, 0, flags, 
>>> LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>>>   }
>>>     static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>>

