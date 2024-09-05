Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1ECCD5BA2
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 10:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57E610E84C;
	Thu,  5 Sep 2024 10:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/JXuSdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B592C10E84C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725530972; x=1757066972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ibT005XcSxVFzcpS+cU7vfNBt1wATdW2JZ99rC01bL0=;
 b=Y/JXuSdCB4/p3zwLWd6rQEfouxmlempo16v2DxpUMVpCfJDUjvEKRd7t
 JNeXu59octytBrmmDaRpmkYWVX2YfdAz/JYGbMbkSlVwhFzzYum19HLn7
 cWspXNpgyavhayl5+i27fhIBsD9pDDzsf9KkzohLXabHed6X1t1gdphB0
 fZu1L3T4d7h0yUqqOarFN/d+oQIP0V30zw3DYQaQW25Gp8eExNHyiF23p
 JqRDXq+cLYTD2m+gLqXI2L/oeGR0VmQ+ff05OWgWERXsMS+qhm/eUsKnY
 wSGD5/ACC9TT8QLLYCe8YWuq6usxGDr4xmnlJdQAaJMSOcNPsW+A3U1BM w==;
X-CSE-ConnectionGUID: 4KK1tuUWR+6qK5mHiHTDLw==
X-CSE-MsgGUID: 2FpWEiR0S8aiDCbowJS/lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24399141"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24399141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 03:09:32 -0700
X-CSE-ConnectionGUID: wpPstzlTS8ewxJ1MCihBXg==
X-CSE-MsgGUID: 46LAydaSSmKtcqvtsGXrFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="66312085"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 03:09:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 03:09:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 03:09:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 03:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9NZ5yJ98fKT746vwJTh75mNgn4Ga2K9leuTfMoNFswplxPDBAoI7xuENZf/342MCINRyWKbu6sR9y3sOo0dm+YN0PvOPelZDJAaR9CUdizrJhsrN1UfOrVP3qZBOnHrG6BQ1pk2v0a5EbHVlxYbxVD5W+yBhEFFuI0+lrp0yx6SN3A0NM1HNBEAHgY1r/ZuN++8NViQZA32Fb4WqdcbY7GAQyml6eMlXVY9u4G/U0Q82dW39NTxfLtAVzLFltnziDdudE0c0728tVmIORailLKV7cW1rU0ISaJcpdSgJeqRg8Zk37R+Z6dw24BEmaxLMK/XebfJd+3P8LvDcxcyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BICalpFHA7wsmH/7P7Tf2D3yLfkgLvFW+GStWE9sUvY=;
 b=I7ZEoIEYSPPlbbfPMVaMYe2B1wdO+xifP780UFugt0lk9UdmHfxOTTB7kVoOgX+9cP+LW7XF93Gc3/JEv07l1pa8Zap0tLzUfmjhHIphP1L0Z4r0L5SXoVeoVYLtbxFTjwCN4GCgWdk3xLUajXfH9gPJ27dbUD2eZy7xlDFB/3NIms/lWqDHi2bRm9josDBDv0Yt/tF5ezouhG4vN/KaCQNIHPWnmAXyx+7JOuXqZ0NAhd6lCOHF+5LQJPEhtNb+Wj4KGw5N/hMrONkqjGj+sY3uTIc/3dz7pZKVk3uT2kJEP+mB4YuNQlPW50o22l1AQ3Z+uugk79K5WlhRdLLS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 10:09:26 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 10:09:26 +0000
Message-ID: <71e0a4ed-3030-4551-b33f-4223fcc9a44d@intel.com>
Date: Thu, 5 Sep 2024 15:39:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pciids: separate ARL and MTL PCI IDs
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>
References: <cover.1725443121.git.jani.nikula@intel.com>
 <a30cb0da7694a8eccceba66d676ac59aa0e96176.1725443121.git.jani.nikula@intel.com>
 <3241416b-92d0-4ca2-9329-43ffee85819b@intel.com> <87mskmr19g.fsf@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <87mskmr19g.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e73457-7737-43ab-2067-08dccd92d2c1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzVvZ1VsVUZhZVVpeWpvUTAzekdiUEthSjBremdpamNuZHdZV09mUWJSQVMv?=
 =?utf-8?B?aUxodTdaQXZmdVlYVFhTRi9RU3cwVERMdG9mdjdUNVBZaytGV3JMRW5XM2xo?=
 =?utf-8?B?QTBqSmFZejhZZllLTkJLQmZsc2dPa0NVQWVSMlBTNFkzQ0ZtVjF1czhGdDNi?=
 =?utf-8?B?NGZQZkpIUTk2MkJEazI4UW9TLzhBcjhkaXhZRUdTWTlwQ1pGbWVGdnFaQllm?=
 =?utf-8?B?M01odnJDRm83cmlLK2RNUFZNY1F5b1VGMTRPOHozVzBqY3hUdzR3YmFCbDB2?=
 =?utf-8?B?RUFDQmxSQnlXdENNckd2Z1g4ZkcvS1QxOFJFU01WNENaMkoxU0tqVjExa05F?=
 =?utf-8?B?L21MZDN3aVI3MlNZY1pnZEx0NTNzWWtmSGRMUkpwL0xTRGZDZUl1cnJnV2Rt?=
 =?utf-8?B?ekg4SXMyTnVpSmd2dWVIbUh1aDVDMERuVEMvZUo5Sm5iU0NwenVMV294andt?=
 =?utf-8?B?UzNIcWJ1Rlg1NjBqVjJUajBPUHJ0MEw0MzdObmp6OTlGWTY0TXowQUQ1eUdm?=
 =?utf-8?B?ak1QVW5Lc1ZVTUVXZXh4VTRrMGpKbGJkQWlqQmVrTUJwL054YTJBRjJ1RGFB?=
 =?utf-8?B?ejVldGxQMkdKZTR1c09KRGd0ZW9RV1lrOWlISUcxd3hFbDB5Skk1enhWOEQw?=
 =?utf-8?B?cUx1dW9YMEpEODRxWWJ4d3lQUzVWbjlOZzV3MzhDcFc4VHpoWDhZdmplN215?=
 =?utf-8?B?eHgvNWVyTVczUncrUzZraXR3elVVRzUzMEZTWXRoNmEvcS9PTVBveWJ6VWhL?=
 =?utf-8?B?YWNmQ1JjZmdPM01UbXpKdnhUdWVPVTNmTHFIUlFvbmVSRG51ZW9KTVovTVdr?=
 =?utf-8?B?L25zYlg4WWlxQ293dG1Ub3FoRS9GeWVTNlVUbXA1WVVualJBN3VwSFZwNXc3?=
 =?utf-8?B?OERTUGMvZlpPTDAxTTBYVUloTFVUNVRNNU05akN5NVNwNUdNYWlzYnVpWHM2?=
 =?utf-8?B?VHFOUEhUaS9za21KSjhvUld5VS9sdjVjYkY1ODl3QlZaTzN6VmdaaEE1VnR6?=
 =?utf-8?B?bFJ1c3NpOHR3Nm0ySnB5NFJTOTFXVkxlOHJWNkcwMjErL3NYak5BRHJNU0hy?=
 =?utf-8?B?T2d3cFVybWVUaWlPWUNoMU04SlNUMTM1VDZnN0gyZ2hFOU9vbDFVMHE2cnU2?=
 =?utf-8?B?ZDc1bmRNTFJIMzZzYkJVQkQxaHMxOXpaY1dqUWoyNGRsL0hFcjRFQXRKdkt4?=
 =?utf-8?B?eUVCeGpSY2FDbnJycW9QVk9Vdlc3UHVtYWwxaFlCK09UWlZ6dDhaTFE2UVR1?=
 =?utf-8?B?clRpUHozT3NTRnZPamJISkxhNW13MXErbXY1TGZYQVFNeFRLYkUyK3pFZTNU?=
 =?utf-8?B?R251a0dWSVhWTmYrcmtodHk1anpid3Q5LyszK1dqS3BVRmw3TEFOeWVqc2tY?=
 =?utf-8?B?SVBVdkhrT25RbGF5VHRuNGllajl3dkJFOFQ1aXZOZU5YaEovZWt0U1UrRWwv?=
 =?utf-8?B?YlJVR09xVjNnbWZuUVlzZUZqRUV3akJ1QWk1dmRGQ1pBdUFFZVJQTjFZL2ky?=
 =?utf-8?B?b09wb2Z5ZDlFQmlkOXlnd2lmeURhcVBoNjF3b0REUzBaRDdZYTUwVW12ek1n?=
 =?utf-8?B?Z3NwajcyenhPSGw4SzJRZjhIbzdMeEhuMGVvN052cU1wOXJkVkZVK1dJQXdJ?=
 =?utf-8?B?SUt4OUdPRGp0ZHZmaldJS09VV0F0ZkZSYURkRU40Z05ZWDVvZEgwOVlXQ0J1?=
 =?utf-8?B?QXZ0MzhrbGJFdHBXZHB2RlZNeWtET1I4RGZOMElFMGFlblVidGxMWkJXamhs?=
 =?utf-8?B?K0dzZkMrS0FITzNyZkprMkx6aXdvT0VudGhOdDJ6Y0d5V1hERDgybnhsM1dD?=
 =?utf-8?B?cmFCWHNld25yZWI2OUgvZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFkbWNySHNBYm5yU0dOSUVqbFZhYklheXJyM252bGV6a2l6WGcxWmdJbkZq?=
 =?utf-8?B?aEVIaDhmUEJ0ZDZpdHFscUI5bmJqRWpsYzQ4QUNFKzZHbU1Eb1RIajdhNmFR?=
 =?utf-8?B?bXdPZnhkVm1vVEJaQVZpekliSlExTmhuWE1zY2tCSFM4SHo3TTFUY05ieVo4?=
 =?utf-8?B?N3pzd0tSaHBuUit4NFlrVkN5UVp2WWZJM2llcDBSdmxrZnR0TXhmUzZWOEVO?=
 =?utf-8?B?SW1uTU53YmxMTkk2aW9qRWoxeTdWOWUweExBQnV1N2RJbE1SSzRMT3lOZjdX?=
 =?utf-8?B?bWsvMVYvTDUxKzVjVFhSRENQL3RqTmxTQWRNbEdBbXREd3dnaTBqWHl5Rjgr?=
 =?utf-8?B?b2ZUNmVFU2FqRTYzRWd0NmF4amJteVc1NVB2cFdkKy9qWWhhL3pScW8zeXpu?=
 =?utf-8?B?WmVOd0ZXMEc5Mk9QMVJkYzZnWW9xS2dqRnFZMWFnZFpJZ2FPbVJqMWI4ZVpL?=
 =?utf-8?B?dnllYXA0THBLY2hZRUxPZmRtSGVxNWNSUjg4cWc3UzR0S1BzMTlzc2g2SHRM?=
 =?utf-8?B?MnJUMlFBMS92bkxDMXZ5eEpZSjZDUHNnYXpQQW50bjlwRWZMbzRiQk80R216?=
 =?utf-8?B?WVMzT1ZtSnJtS2RJWWd6aUZ0QTJYc2RmL2UrNTc5cHNzNGsxUnM0OGc0WEpK?=
 =?utf-8?B?SzZTL2pNeXZoR1RNcU9STGhDaXcrdHNpNDJHMVcwMGUvK29wWDV4aSsrSGNv?=
 =?utf-8?B?b1pVN1EyTExjS1FlQ1N6dlJuTHBUckJ3VVA0MWJERzRNa1RBYnc3LzdBRmFY?=
 =?utf-8?B?eU9SZFZDaUJiTURJc3JORVJIT1VONUltdjMxYVUzZlREY2hrdStMeDBSTGdo?=
 =?utf-8?B?VUJKMTNrQS9tWkZJZmtJSVBMM2VTTFNJbHk5WmZCRDg4Z0hZUldxcGcvMVRH?=
 =?utf-8?B?MEhSeUVMdkNuNDRLOFk0Sk1ONThjdFFpQzcxdU10dVZCTkVPMTlNLzREam5h?=
 =?utf-8?B?VEY2RWtOVHVWR0JpZ0dJR3dtYU92OWs1aFZGaW9Cc1V0d2k3N0NaeFJvb3hL?=
 =?utf-8?B?QnBpbkt1emxWTHN4cU1RTE1XK2JRSlRMSFI1N040RGdLc1FrcCtkazVqK3ll?=
 =?utf-8?B?ZWFmMHprNzIxVEVsWlFBSjR4WkprYUp2aTJXZi9vVVRBelVMdXNLK2VyWE1r?=
 =?utf-8?B?ZHBadTl3b1lKNkJoaWpIaUZ2ck9ZWG1GaGhwMUI0NDVKMTJQZnVQd1RrQlVn?=
 =?utf-8?B?T2xnenhjam1uY0tzY05KMkhsM1YzQlBCZTVrSURmYXdWcTBtTTVvWm8vRmtT?=
 =?utf-8?B?czJjbml4RkVEY1Q2ckFQZUZTaFBYRXZjZC9Fc3ZaUWhxN3FmRXJhbnlESEth?=
 =?utf-8?B?ODUrS0drN2crUUtZN0h4d2NTUTh3RGZxQlBEamg3K01pOUZ3QnhDLy9FZWEy?=
 =?utf-8?B?aEhWdEY5cUd3cUxUb09EQzlyY1M3TXpFeklpdkw3UlJMaTh3ckhUTzZYeWZY?=
 =?utf-8?B?Vld5WVJhRlEvNUI0N1poOGhhY1pEWUx2QXZ3R0VLT2luMWVFUVhPOEFEVVUr?=
 =?utf-8?B?c05hZlFzL1BYUG1aUGh5aHVEL3ZTZnFmMjYxblhFK04rMFVhQnl5RWY3dkgr?=
 =?utf-8?B?aytFSklVTTV1c3hsMXVsYXl4aEoxdkxrVWxSTlBzTnduNzhuZWpEd1NHcTMr?=
 =?utf-8?B?Q1BMMGpSZmRyanZyQ0VHeUZUV3ZQUFp0WEFLdmZzWFVOclZRU3VyYzFKblNZ?=
 =?utf-8?B?eWMxRkFCRmQ5SFRNQmpUWGxsZlc5cUNXUDM2M055TzlPNkFWWUYvTStjT0xF?=
 =?utf-8?B?MDd6NGxSaytETXJyT2Q4bTdpMHBMTC95cFJGb0s1TWQ3aUd1TDltRmk1V0M2?=
 =?utf-8?B?RXR0akdyc0pJRWdMWWplRk44aUxDbkpNYmFrWGRLWlFRdVNaL2RjSjROZk15?=
 =?utf-8?B?YWVNUnJyZk5waHU2bGQxNUNBQ0dXS3hOc1RBOEZJams0NmptNitEYnh2SUR0?=
 =?utf-8?B?b2pHQ1NDUTFtcUIwU20rUW5iRW9XOEZOWFNoa1E3cnJhQ08vVVBmM0xnT1du?=
 =?utf-8?B?cEdDOTRvWk5UVjVCVVdqQW1WU2crVUVrVEhsYTByWFkwNDVQOUVlZDI4ck1a?=
 =?utf-8?B?UlJkRnh3OS92WVhKTkwwK245ei9NSkhVR2NxZ2xaYVc1OE0ycEVCV2U3V09w?=
 =?utf-8?B?TGFkbitXZUVoWGRERmVjNHJheWxPRzJwMm9ZaE5CWExGYnFuTEc0VnFjS2h1?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e73457-7737-43ab-2067-08dccd92d2c1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 10:09:26.7480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln/Z2dqzd4E24M5ct3RkPFYzV+W4DeokmK/g0gpPfTQQ26gFMXClVoK8Lh9u8bW29zhwR4K5jQetPDGewBNfk7JZb5cmhlj3Gk8dtnvkwiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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


On 9/5/2024 1:16 PM, Jani Nikula wrote:
> On Thu, 05 Sep 2024, "Chauhan, Shekhar" <shekhar.chauhan@intel.com> wrote:
>> On 9/4/2024 3:16 PM, Jani Nikula wrote:
>>> Avoid including PCI IDs for one platform to the PCI IDs of another. It's
>>> more clear to deal with them completely separately at the PCI ID macro
>>> level.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
LGTM,
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci.c   |  1 +
>>>    include/drm/intel/xe_pciids.h | 13 ++++++++-----
>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index b1cf21d77def..5c5eef2ae725 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -394,6 +394,7 @@ static const struct pci_device_id pciidlist[] = {
>>>    	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>>>    	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>>>    	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>>> +	XE_ARL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>> With this approach of segregating PCI IDs of two platforms, wouldn't it
>> make more sense to have two separate platform descriptors as well, say,
>> mtl_desc and a new one "arl_desc"?
> Not if they are exactly the same.
>
>>>    	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>>>    	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>>>    	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>>> index 334ab02ed6ca..67baa7c2246a 100644
>>> --- a/include/drm/intel/xe_pciids.h
>>> +++ b/include/drm/intel/xe_pciids.h
>>> @@ -176,16 +176,19 @@
>>>    	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>>>    	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>>>    
>>> -/* MTL / ARL */
>>> +/* ARL */
>>> +#define XE_ARL_IDS(MACRO__, ...)		\
>>> +	MACRO__(0x7D41, ## __VA_ARGS__),	\
>>> +	MACRO__(0x7D51, ## __VA_ARGS__),        \
>>> +	MACRO__(0x7D67, ## __VA_ARGS__),	\
>>> +	MACRO__(0x7DD1, ## __VA_ARGS__)
>>> +
>> Also, if we're following platform public release timelines, can we have
>> MTL block of PCI IDs above the ARL block?
> Can do if it matters.
No big deal if it doesn't matter much.
>
> BR,
> Jani.
>
>>> +/* MTL */
>>>    #define XE_MTL_IDS(MACRO__, ...)		\
>>>    	MACRO__(0x7D40, ## __VA_ARGS__),	\
>>> -	MACRO__(0x7D41, ## __VA_ARGS__),	\
>>>    	MACRO__(0x7D45, ## __VA_ARGS__),	\
>>> -	MACRO__(0x7D51, ## __VA_ARGS__),        \
>>>    	MACRO__(0x7D55, ## __VA_ARGS__),	\
>>>    	MACRO__(0x7D60, ## __VA_ARGS__),	\
>>> -	MACRO__(0x7D67, ## __VA_ARGS__),	\
>>> -	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>>>    	MACRO__(0x7DD5, ## __VA_ARGS__)
>>>    
>>>    /* PVC */

-- 
-shekhar

