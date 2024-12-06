Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094A5E77170
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 02:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C908610E02D;
	Fri,  6 Dec 2024 02:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc8VtU1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96B110E02D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 02:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733451046; x=1764987046;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VXWaHn4JozDgttsBQ201VMkMXWhwY2NURHSPbffUAsM=;
 b=Tc8VtU1hifGb5S/L+XYKj7de6ItJOut4nunMoHnl3P7PaHutsnnQQ/6w
 FySAB9dPPz7UhVg3FXKPt1fGAQ6+qakBYL1mLDd0Q4EfgKvhyK0WtZ/0a
 i2iAUKXFEFqQex1UOWmBMn1nBg37V/UjBtxaLqz1si8uRe2Rjt/EvNx4N
 3DIwXsAbYsFdj49eXQc8LI9A727QF0PmY1eymdznsVknuZBmypXzpjFn5
 otNRsutxoyCX77vJ6+aAOX0s8PNAQytF+pzoEJvhMsFU0SkO/XtKMAx5P
 e4d6T289vAq8niDThK1PC81Cr0Fucigmq0UtEyLzR9OU9tr+vNfVnO+t6 A==;
X-CSE-ConnectionGUID: qUP6a/zzRtSRVK1h41BNmA==
X-CSE-MsgGUID: dmhkh6IaQ0+4My2dmPb8DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33847635"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="33847635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 18:10:46 -0800
X-CSE-ConnectionGUID: 3XdAHu1RSlyQYdXg6B9fPg==
X-CSE-MsgGUID: /b9LbjxeS66sTXAOR+cUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99310365"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 18:10:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 18:10:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 18:10:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 18:10:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dud2c0vJMO0s8hnayPZ2aTMvOBNrd1CufFGqOfsa2cHJmsr+9C6YMz7B6bBgRhwXOHG+LOrfTay+5sBBK4D4w6gZzVkLRJxsgJmrJE+qBoktUt3Hh7s3z/+RLuYGe3uJP0V8IykqULu2fWm2yM/GtTamE77YLdbIWLs4eG2F/g6VZh9dt2HTii63Hi3NGGVCMkJrL2E3HRorsII50qqkE5TIjP5CuJJw7MqHYYqBUTz8UZA8efkksppJTYS7GS0DVo5Kwa8N6h8T3Td6LibpIt8Xon+oHfevRNZF+V1O4N0GsZIR0eO0H31uXcznZz+O2botLkWCbFfr6xKfqGp43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKLkt0jUFYEbrUZhkjnTFCE4Uy2gnRP4BS+Wzs6Z4vs=;
 b=hkUuKQdptRjhcdPVaDptpZaqDx50eCFgm7oHxIvk2Dc/TvPGcjGHWZNZBhRXlUQhdv+Hs7AkklLMhpq9Z9RdIPzWHwdIP27hPdk5YwGqMK3VkO/iFgatJ6lY1estX3FXHPy5xhubAWQuMzic/5yMoCFDAI82Uu5mzalxSWIO8p3l7ElVY3cBdcORX4Iqc8pQAbKk334kXXLUCGaLXEVZATkQX25Xmgn4g73Jk8hBc/xXJmwrPeK3Q5DA0c8pKUTqW22DvArVNfVHS+3bDL+iu7hEBQHYFzUyh0oja5P0cnJ3hu1jH3sDP5BmqKD/wB1erIb8gdO9Uh9oSkl5HksgWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 02:10:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 02:10:42 +0000
Message-ID: <c126ec6f-3ae2-4d08-85ae-1c090f4b3721@intel.com>
Date: Thu, 5 Dec 2024 18:10:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] drm/xe/pxp: Allocate PXP execution resources
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-3-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB4784:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e9fcde-1f7d-4019-b9fe-08dd159b2ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm1aT3VqcU4vbjZ5UEMzKzFyT3NBekkyZU5RTjRrdytWb1MxTmhiZ2JQWUk5?=
 =?utf-8?B?RC9PR01VRDRFd0Z0Y3I0WFBhd0NncGJVa1VDRHg4VFRQSW5NM3BkZDR2MWVX?=
 =?utf-8?B?dktTUFpHWGJUbDVrVmtLMGdUck5QOGtTLytTN2dIYzFrR3dJTmQ3eENaVy9K?=
 =?utf-8?B?T2R5a0FwaXN3bG1iMUNQY0x1UXlKS2hmRUVLenNuREdWTE1HMCtMOFJSckoz?=
 =?utf-8?B?MEF4cXRScXRFaTJJdFRjTmhTYythckV1MnBTWHkxaUpLR01QVlNiekJwbXBo?=
 =?utf-8?B?YlBqa2xibWxyYUdMaWkrWnQvK05KZzlxbTh2T2pwblFwYUVkcEFRSFFUZXR3?=
 =?utf-8?B?MUlhN3BzUG9TTzAxTERjUTFTSUU4aUFDQmJsWW54WE5GQ1dUUENxQ1lZK1Vv?=
 =?utf-8?B?dTFkWk8vd0tOampuajcrV2pYZGNlSThKaHBLSmNWTmVBQmJjY3JqbzVSS2FF?=
 =?utf-8?B?THNhRFgyQU5sRElvWHArVWZhaW9wTC9qOUZleXd3b09sRHBoOUl4S1BaaS8r?=
 =?utf-8?B?cUo3aGQ3MVE1NDRzdURBRDlFYld4dVhnL1AwTU9lcmhmTWRqK09DbWdxOFlu?=
 =?utf-8?B?Z3NjejAzUTU0eWg5QUFxZldVRFh4OHRDaGcxVXM4RnpKamFsS2wwSDYwakw3?=
 =?utf-8?B?VENxbm9EcHlYb2kwQ3lpM3czNk1kTFVaSm5ZUy9xczdWVmdFRHNnMUpxaHg2?=
 =?utf-8?B?VWEyOWs1TXhVcS8zSUpoWEdWTzBNVURMcVdkUndTa0twbHZtU0VCSlJnMS9r?=
 =?utf-8?B?UjZyVTNZTVgyb2JnV0J6aTROU250ajZidTlFRDdMS2QycFcyalZOWWU0ditv?=
 =?utf-8?B?VTBVMFA1VkZOOGt6Rm10Q21LT3hpRkxtL1ZOSk1YVGxsQmJHYTdOM0Y3RHBm?=
 =?utf-8?B?MmtWUFhJcUI4cGYwZ3lXR25yVldxM2tlRy8yT294TDIrcG55eGk2RnRxRU8v?=
 =?utf-8?B?TU5oNjVodGZLbmxwd1JGMG4wY3ZBSHdON3hCdTl6TjJWb1czVFNaZlV4VGx2?=
 =?utf-8?B?RDZNc0hLdThuZUNFTVRRSEJqVG8zQTV0V2dWQnlMS3B0UGtmdHk1MExna095?=
 =?utf-8?B?YlNIN21RMDRxaUZNWkV2UmVvMmhUVEUrNDJveU0xNHZlRkRWeVovbkdiTVZ6?=
 =?utf-8?B?QmVCRTZtSVZ1ZmtPRmhrZmF5OVlrditJSkpRNFVyWUlGOCtPQzl3RlNKY1E4?=
 =?utf-8?B?TzBRanRIVTgwTFZveEJXTGd3dHFmR04vcWsycWp6TDg5NnVJZEFxSDlvMVpQ?=
 =?utf-8?B?T0Y3QlRZYlVXOTJBOUxDckRIZkViY2VOUmVWZXF0b2dYQ1gvWkluc3hPSXZo?=
 =?utf-8?B?QUdCay85ZURoUDBwT1BrSVpWT3VBOUJ5MDJjd0JVZDFHRUdURitLdGZKaFI0?=
 =?utf-8?B?TDZVengwcGl0VFhiR2NETGJHNUQ0dGJKcGNuTEdTN0F5TVlUbGNRWmhjWTVC?=
 =?utf-8?B?cXRhTnJrSHRlZko2ZHd1Zi9FQm9SbWVZbzJESzBBSjlxT2oxbUhwSk9OcDVy?=
 =?utf-8?B?bUxWWG8yWmJ2VTduRmdzbXFYR2RwUC9OVFZSM1dZSjJTdjk5cmR1WmZvbUxk?=
 =?utf-8?B?Tk1NSWQzQ2d1cGwrVWVVNHcwZVFIN2xUUjdpY08rQW1aRy8zdVVRdDZybXk4?=
 =?utf-8?B?bWlrNmR6Mm83TWRTQ29DYVovaCtJcHkyZFJxd3MwM1FwKzBLTG5VT2dlSnl4?=
 =?utf-8?B?SWI0b0pzSnV0VzFYcm80WmhIOWtLM2xPbC9OM2JYOWVtaXdZUVdaRFMxNXo3?=
 =?utf-8?B?THVQVHgyOVpKSngwWC8za2NtVEdnNFFraVBpVFlGby91RDJpS2VmeWpETzdZ?=
 =?utf-8?B?VENHbmdFUm0xYXl6SkEyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzM3UXNnNDI1RzdFYXlxeUhZL2FsQzg3V2lZdlAvenNLb21TSkIwNzgwMUtC?=
 =?utf-8?B?NmptNFEvSEdYWXIvaGNtVWFUTUkzUlhiZ2ZjOWE3QStoYTFTTHF1L1pGZzZW?=
 =?utf-8?B?UE9WK3BMVXdpYkhGNEpNSmVUdWJUd2YwNXd6ZWFuTUFtdWFnT3FlSkplV2ps?=
 =?utf-8?B?WmdLL1kwRGxJTWd2NzUwcjVKU1o5YVAyUk1FV2k1RjYrWlNMNm4weHdKS0N5?=
 =?utf-8?B?MVN6SFVGN2hpR2oybjNjODFXcWVybjhSV0Z1Mm9ZMWFacXBEMHN6amNZMEpM?=
 =?utf-8?B?b2Q0TWtiUFE1QU1UMVR3K1FkWUZMMEFEbWtOZTBzQTBxcG8wQ25KUHFSOEpr?=
 =?utf-8?B?NHdMSnFLRjZHUS9nemF3SjJqaFFickVoeWNuUUVUdDc1NDBkRFpIVjEwNklW?=
 =?utf-8?B?MWFRNDRDVzVJUUVyTlRSeHM2R2Z1LzhMZEEvQyt6ajFiWEFTWGM1Q21KTmtS?=
 =?utf-8?B?OTloOEtHVkRMRU9GTWpPY0hEK3F4MzgxRFpyMmxDNXQ0SVNHVS9OckxDaEJ5?=
 =?utf-8?B?NWwxOGVwY2ZjUUxqcUF1c3Z1NEI2VEdDcGwzMGQzSnFNSUVnN2UxQ1hGM1Yy?=
 =?utf-8?B?VkUwRmlMVzYwUGE0aDJxY0RsQm9GMUxSRDRrYjQ4djN4VGdkZWdUcllzQXBq?=
 =?utf-8?B?U3oyUDlSdnF1WklTaFV2YkdGRmdKRjgrUTRCd1pPWE9yL2ZlbUxweWlpalIx?=
 =?utf-8?B?dDFHVzdDc1VlMGZIQlV0VS95bC9vWmxNOGo0OXRHZ1F3aURDa2wyZTQ5OEt0?=
 =?utf-8?B?OCtwZitRbEZWcVRzQ0R5SytLc2NKR09EbWxkK2tQb3R6UHEzejkyN3lyVGNP?=
 =?utf-8?B?YVZVeTdSOGxEVXlKNWdmODBaMXUxdU93UGFhVyt0SHlraHFMZkJtN29pODFl?=
 =?utf-8?B?Z1VEY0N2bmswVGZ3QURHcVBBYWFhSEo5VkVTL2ZJQmQ4S1k1dFE3alJjc29y?=
 =?utf-8?B?cXRCb0JUUDY2Y1F1WitSdmtJalFwaU8ya1pxa29NQWoyK2FGVTBFVmIzZ3g0?=
 =?utf-8?B?a28zbFZ6U3ZvV1hOL3dGTUhQVWdvZmg0bXRUc0dhM2YrTkJ2M1g0WXNTdS9R?=
 =?utf-8?B?ZHZoVWdWd3B4aVk4WmxubVlBQ3lpNllTRzEzSjFqWExPTzFzZ1B4bHBrRk5j?=
 =?utf-8?B?T2xraGo0NnpMYnV0NXdFbkJHVFlNY0xad1ZLb1l5clEwRVhYbEZTUzc0MHps?=
 =?utf-8?B?a1B3S0dOdWVnSm94eTdIK2tHUnQvL1VTbml2MFFoaUxjRWk5NTJLVFEvc1RD?=
 =?utf-8?B?TVpDOFRhMlM2aTJ6WkZxL3ByWHY0K1VmQUMvd2hnNUFxQVlJTVM2QWNkSFQ1?=
 =?utf-8?B?MTZudkgrMW1GUURtd3hteGJROU5ZR1pQSDZkbHNBejg1UU9RRmxPclpuNER0?=
 =?utf-8?B?b29Nc2NPQ0QxU1FtZUxEVGRiWE05ZlRlUWRxeGEyZkE1NGhKWUNHbkN1bDlL?=
 =?utf-8?B?bFVNSDVDZDU4VUVUTGRySHRYZ2hUblErUitRVTluckVsdUJzend4VTE0QXkz?=
 =?utf-8?B?amNCL1Z4clpXN1hGYi9LZHJqOG1XOVVUcDV4ZnpiRDJ6b29EUjdrL2xobHBa?=
 =?utf-8?B?dTFFc0EvR0ZjTzN4UjB4c3NCcGJFVVJIV3dDN3ZiSFZMUGo4UFpVaVV2VFQy?=
 =?utf-8?B?VGdBa05tUXFoWjNkaXUyTDk0YXFKZ0dNQnpEVFlYS0JxMEdXYWFkRnBldlBz?=
 =?utf-8?B?TmRJZDh2ck5ITzlaMXp3bWd6bGN5SXFFZWZhbmFHZGlaZFkrajRzWUFkQUJx?=
 =?utf-8?B?RUYwY2F1cUIrMVlaTWoyRTRzc1FIa0FJUUI0bnFTSjlPbWYreTRXOUxtb3dl?=
 =?utf-8?B?SlRkaDQ0MUdaWGVhSFgvZkpSakowcDk1d3pTZXZpYkFQT0FQaEJpMjRibURn?=
 =?utf-8?B?eWtRN0dlWnA1a3gxYThPbDRHQjUvTEhLWmhHU2xtT054di8ySXJYUUZCdjlD?=
 =?utf-8?B?SHhMVlU3YitXdkQzMVI2a0hIcW81NmJuV1lkQjVVYm1MNEh3RmZ4eWhFVHh3?=
 =?utf-8?B?RkJBVmVBcDEwZXlQODZIVENVL0tRVVNuKzJCWlVTY0RWaXk1MDRYaXlXNmJs?=
 =?utf-8?B?QS9mRitrRFZ6SUhYakgwY1E4aXNDSThKSW4wbDN0RzYyQ1NtYit0TGdFSW5F?=
 =?utf-8?B?czNKTGMveXJwR2hoVjRDdW9oYytGbFNxNitObk0wWnR0V0FjaHJNK0M4UkpY?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e9fcde-1f7d-4019-b9fe-08dd159b2ff1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 02:10:42.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5juGQnIVvJoZ9j6UM9cJp/1ca3Z3K94pe81tOOpaHjSHteutD5TPBqX5yRmmAkSyvLDs6/+prYcx/bQL9CCc/Q9tMo21SFAFh37uDBeiWYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> PXP requires submissions to the HW for the following operations
>
> 1) Key invalidation, done via the VCS engine
> 2) Communication with the GSC FW for session management, done via the
>     GSCCS.
>
> Key invalidation submissions are serialized (only 1 termination can be
> serviced at a given time) and done via GGTT, so we can allocate a simple
> BO and a kernel queue for it.
>
> Submissions for session management are tied to a PXP client (identified
> by a unique host_session_id); from the GSC POV this is a user-accessible
> construct, so all related submission must be done via PPGTT. The driver
> does not currently support PPGTT submission from within the kernel, so
> to add this support, the following changes have been included:
>
> - a new type of kernel-owned VM (marked as GSC), required to ensure we
>    don't use fault mode on the engine and to mark the different lock
>    usage with lockdep.
> - a new function to map a BO into a VM from within the kernel.
>
> v2: improve comments and function name, remove unneeded include (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |   7 +
>   drivers/gpu/drm/xe/xe_exec_queue.c            |   3 +
>   drivers/gpu/drm/xe/xe_pxp.c                   |  23 +-
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 200 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  14 ++
>   drivers/gpu/drm/xe/xe_pxp_types.h             |  48 +++++
>   drivers/gpu/drm/xe/xe_vm.c                    | 119 ++++++++++-
>   drivers/gpu/drm/xe/xe_vm.h                    |   6 +
>   drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
>   10 files changed, 411 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c0bd3c814de..126c8f1ab673 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> +	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index 57520809e48d..f3c4cf10ba20 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -6,6 +6,7 @@
>   #ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
>   #define _ABI_GSC_PXP_COMMANDS_ABI_H
>   
> +#include <linux/sizes.h>
>   #include <linux/types.h>
>   
>   /* Heci client ID for PXP commands */
> @@ -13,6 +14,12 @@
>   
>   #define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
>   
> +/*
> + * A PXP sub-section in an HECI packet can be up to 64K big in each direction.
> + * This does not include the top-level GSC header.
> + */
> +#define PXP_MAX_PACKET_SIZE SZ_64K
> +
>   /*
>    * there are a lot of status codes for PXP, but we only define the cross-API
>    * common ones that we actually can handle in the kernel driver. Other failure
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index aab9e561153d..60418debc1ec 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -150,6 +150,9 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	struct xe_exec_queue *q;
>   	int err;
>   
> +	/* VMs for GSCCS queues (and only those) must have the XE_VM_FLAG_GSC flag */
> +	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));
> +
>   	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
>   				  extensions);
>   	if (IS_ERR(q))
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 1a4d12d37d96..89d71a69cdff 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
>   #include "xe_mmio.h"
> +#include "xe_pxp_submit.h"
>   #include "xe_pxp_types.h"
>   #include "xe_uc_fw.h"
>   #include "regs/xe_pxp_regs.h"
> @@ -50,6 +51,20 @@ static int kcr_pxp_enable(const struct xe_pxp *pxp)
>   	return kcr_pxp_set_status(pxp, true);
>   }
>   
> +static int kcr_pxp_disable(const struct xe_pxp *pxp)
> +{
> +	return kcr_pxp_set_status(pxp, false);
> +}
> +
> +static void pxp_fini(void *arg)
> +{
> +	struct xe_pxp *pxp = arg;
> +
> +	xe_pxp_destroy_execution_resources(pxp);
> +
> +	/* no need to explicitly disable KCR since we're going to do an FLR */
> +}
> +
>   /**
>    * xe_pxp_init - initialize PXP support
>    * @xe: the xe_device structure
> @@ -97,10 +112,16 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (err)
>   		goto out_free;
>   
> +	err = xe_pxp_allocate_execution_resources(pxp);
> +	if (err)
> +		goto out_kcr_disable;
> +
>   	xe->pxp = pxp;
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, pxp_fini, pxp);
>   
> +out_kcr_disable:
> +	kcr_pxp_disable(pxp);
>   out_free:
>   	drmm_kfree(&xe->drm, pxp);
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> new file mode 100644
> index 000000000000..196c0e5bbb17
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation.
> + */
> +
> +#include "xe_pxp_submit.h"
> +
> +#include <uapi/drm/xe_drm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_bo.h"
> +#include "xe_exec_queue.h"
> +#include "xe_gsc_submit.h"
> +#include "xe_gt.h"
> +#include "xe_pxp_types.h"
> +#include "xe_vm.h"
> +
> +/*
> + * The VCS is used for kernel-owned GGTT submissions to issue key termination.
> + * Terminations are serialized, so we only need a single queue and a single
> + * batch.
> + */
> +static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	struct xe_device *xe = pxp->xe;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_hw_engine *hwe;
> +	struct xe_exec_queue *q;
> +	struct xe_bo *bo;
> +	int err;
> +
> +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_VIDEO_DECODE, 0, true);
> +	if (!hwe)
> +		return -ENODEV;
> +
> +	q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	/*
> +	 * Each termination is 16 DWORDS, so 4K is enough to contain a
> +	 * termination for each sessions.
> +	 */
> +	bo = xe_bo_create_pin_map(xe, tile, 0, SZ_4K, ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto out_queue;
> +	}
> +
> +	pxp->vcs_exec.q = q;
> +	pxp->vcs_exec.bo = bo;
> +
> +	return 0;
> +
> +out_queue:
> +	xe_exec_queue_put(q);
> +	return err;
> +}
> +
> +static void destroy_vcs_execution_resources(struct xe_pxp *pxp)
> +{
> +	if (pxp->vcs_exec.bo)
> +		xe_bo_unpin_map_no_vm(pxp->vcs_exec.bo);
> +
> +	if (pxp->vcs_exec.q)
> +		xe_exec_queue_put(pxp->vcs_exec.q);
> +}
> +
> +#define PXP_BB_SIZE		XE_PAGE_SIZE
> +static int allocate_gsc_client_resources(struct xe_gt *gt,
> +					 struct xe_pxp_gsc_client_resources *gsc_res,
> +					 size_t inout_size)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_hw_engine *hwe;
> +	struct xe_vm *vm;
> +	struct xe_bo *bo;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +	long timeout;
> +	int err = 0;
> +
> +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, 0, true);
> +
> +	/* we shouldn't reach here if the GSC engine is not available */
> +	xe_assert(xe, hwe);
> +
> +	/* PXP instructions must be issued from PPGTT */
> +	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	/* We allocate a single object for the batch and the in/out memory */
> +	xe_vm_lock(vm, false);
> +	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto vm_out;
> +	}
> +
> +	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
> +	if (IS_ERR(fence)) {
> +		err = PTR_ERR(fence);
> +		goto bo_out;
> +	}
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout <= 0) {
> +		err = timeout ?: -ETIME;
> +		goto bo_out;
> +	}
> +
> +	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL |
> +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	if (IS_ERR(q)) {
> +		err = PTR_ERR(q);
> +		goto bo_out;
> +	}
> +
> +	gsc_res->vm = vm;
> +	gsc_res->bo = bo;
> +	gsc_res->inout_size = inout_size;
> +	gsc_res->batch = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
> +	gsc_res->msg_in = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE);
> +	gsc_res->msg_out = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE + inout_size);
> +	gsc_res->q = q;
> +
> +	/* initialize host-session-handle (for all Xe-to-gsc-firmware PXP cmds) */
> +	gsc_res->host_session_handle = xe_gsc_create_host_session_id();
> +
> +	return 0;
> +
> +bo_out:
> +	xe_bo_unpin_map_no_vm(bo);
> +vm_out:
> +	xe_vm_close_and_put(vm);
> +
> +	return err;
> +}
> +
> +static void destroy_gsc_client_resources(struct xe_pxp_gsc_client_resources *gsc_res)
> +{
> +	if (!gsc_res->q)
> +		return;
> +
> +	xe_exec_queue_put(gsc_res->q);
> +	xe_bo_unpin_map_no_vm(gsc_res->bo);
> +	xe_vm_close_and_put(gsc_res->vm);
> +}
> +
> +/**
> + * xe_pxp_allocate_execution_resources - Allocate PXP submission objects
> + * @pxp: the xe_pxp structure
> + *
> + * Allocates exec_queues objects for VCS and GSCCS submission. The GSCCS
> + * submissions are done via PPGTT, so this function allocates a VM for it and
> + * maps the object into it.
> + *
> + * Returns 0 if the allocation and mapping is successful, an errno value
> + * otherwise.
> + */
> +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	err = allocate_vcs_execution_resources(pxp);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * PXP commands can require a lot of BO space (see PXP_MAX_PACKET_SIZE),
> +	 * but we currently only support a subset of commands that are small
> +	 * (< 20 dwords), so a single page is enough for now.
> +	 */
> +	err = allocate_gsc_client_resources(pxp->gt, &pxp->gsc_res, XE_PAGE_SIZE);
> +	if (err)
> +		goto destroy_vcs_context;
> +
> +	return 0;
> +
> +destroy_vcs_context:
> +	destroy_vcs_execution_resources(pxp);
> +	return err;
> +}
> +
> +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
> +{
> +	destroy_gsc_client_resources(&pxp->gsc_res);
> +	destroy_vcs_execution_resources(pxp);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> new file mode 100644
> index 000000000000..fd21ac935be1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_SUBMIT_H__
> +#define __XE_PXP_SUBMIT_H__
> +
> +struct xe_pxp;
> +
> +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
> +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
> +
> +#endif /* __XE_PXP_SUBMIT_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 4639cf49d267..25db23180a30 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,8 +6,45 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/iosys-map.h>
> +#include <linux/types.h>
> +
> +struct xe_bo;
> +struct xe_exec_queue;
>   struct xe_device;
>   struct xe_gt;
> +struct xe_vm;
> +
> +/**
> + * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
> + * client. The GSC FW supports multiple GSC client active at the same time.
> + */
> +struct xe_pxp_gsc_client_resources {
> +	/**
> +	 * @host_session_handle: handle used to identify the client in messages
> +	 * sent to the GSC firmware.
> +	 */
> +	u64 host_session_handle;
> +	/** @vm: VM used for PXP submissions to the GSCCS */
> +	struct xe_vm *vm;
> +	/** @q: GSCCS exec queue for PXP submissions */
> +	struct xe_exec_queue *q;
> +
> +	/**
> +	 * @bo: BO used for submissions to the GSCCS and GSC FW. It includes
> +	 * space for the GSCCS batch and the input/output buffers read/written
> +	 * by the FW
> +	 */
> +	struct xe_bo *bo;
> +	/** @inout_size: size of each of the msg_in/out sections individually */
> +	u32 inout_size;
> +	/** @batch: iosys_map to the batch memory within the BO */
> +	struct iosys_map batch;
> +	/** @msg_in: iosys_map to the input memory within the BO */
> +	struct iosys_map msg_in;
> +	/** @msg_out: iosys_map to the output memory within the BO */
> +	struct iosys_map msg_out;
> +};
>   
>   /**
>    * struct xe_pxp - pxp state
> @@ -21,6 +58,17 @@ struct xe_pxp {
>   	 * (VDBOX, KCR and GSC)
>   	 */
>   	struct xe_gt *gt;
> +
> +	/** @vcs_exec: kernel-owned objects for PXP submissions to the VCS */
> +	struct {
> +		/** @vcs_exec.q: kernel-owned VCS exec queue used for PXP terminations */
> +		struct xe_exec_queue *q;
> +		/** @vcs_exec.bo: BO used for submissions to the VCS */
> +		struct xe_bo *bo;
> +	} vcs_exec;
> +
> +	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
> +	struct xe_pxp_gsc_client_resources gsc_res;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1d7faeba157e..eb95f654a88f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1382,6 +1382,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	struct xe_tile *tile;
>   	u8 id;
>   
> +	/*
> +	 * Since the GSCCS is not user-accessible, we don't expect a GSC VM to
> +	 * ever be in faulting mode.
> +	 */
> +	xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
> +
>   	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
>   	if (!vm)
>   		return ERR_PTR(-ENOMEM);
> @@ -1392,7 +1398,21 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	vm->flags = flags;
>   
> -	init_rwsem(&vm->lock);
> +	/**
> +	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
> +	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
> +	 * under a user-VM lock when the PXP session is started at exec_queue
> +	 * creation time. Those are different VMs and therefore there is no risk
> +	 * of deadlock, but we need to tell lockdep that this is the case or it
> +	 * will print a warning.
> +	 */
> +	if (flags & XE_VM_FLAG_GSC) {
> +		static struct lock_class_key gsc_vm_key;
> +
> +		__init_rwsem(&vm->lock, "gsc_vm", &gsc_vm_key);
> +	} else {
> +		init_rwsem(&vm->lock);
> +	}
>   	mutex_init(&vm->snap_mutex);
>   
>   	INIT_LIST_HEAD(&vm->rebind_list);
> @@ -2666,11 +2686,10 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
>   	for (i = 0; i < vops->num_syncs; i++)
>   		xe_sync_entry_signal(vops->syncs + i, fence);
>   	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
>   }
>   
> -static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops)
> +static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> +						   struct xe_vma_ops *vops)
>   {
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
> @@ -2683,21 +2702,21 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	drm_exec_until_all_locked(&exec) {
>   		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
>   		drm_exec_retry_on_contention(&exec);
> -		if (err)
> +		if (err) {
> +			fence = ERR_PTR(err);
>   			goto unlock;
> +		}
>   
>   		fence = ops_execute(vm, vops);
> -		if (IS_ERR(fence)) {
> -			err = PTR_ERR(fence);
> +		if (IS_ERR(fence))
>   			goto unlock;
> -		}
>   
>   		vm_bind_ioctl_ops_fini(vm, vops, fence);
>   	}
>   
>   unlock:
>   	drm_exec_fini(&exec);
> -	return err;
> +	return fence;
>   }
>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>   
> @@ -2929,6 +2948,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops;
>   	struct xe_vma_ops vops;
> +	struct dma_fence *fence;
>   	int err;
>   	int i;
>   
> @@ -3093,7 +3113,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (err)
>   		goto unwind_ops;
>   
> -	err = vm_bind_ioctl_ops_execute(vm, &vops);
> +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> +	if (IS_ERR(fence))
> +		err = PTR_ERR(fence);
> +	else
> +		dma_fence_put(fence);
>   
>   unwind_ops:
>   	if (err && err != -ENODATA)
> @@ -3127,6 +3151,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +/**
> + * xe_vm_bind_bo - bind a kernel BO to a VM
xe_vm_bind_bo -> xe_vm_bind_kernel_bo

With that fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> + * @vm: VM to bind the BO to
> + * @bo: BO to bind
> + * @q: exec queue to use for the bind (optional)
> + * @addr: address at which to bind the BO
> + * @cache_lvl: PAT cache level to use
> + *
> + * Execute a VM bind map operation on a kernel-owned BO to bind it into a
> + * kernel-owned VM.
> + *
> + * Returns a dma_fence to track the binding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl)
> +{
> +	struct xe_vma_ops vops;
> +	struct drm_gpuva_ops *ops = NULL;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	xe_bo_get(bo);
> +	xe_vm_get(vm);
> +	if (q)
> +		xe_exec_queue_get(q);
> +
> +	down_write(&vm->lock);
> +
> +	xe_vma_ops_init(&vops, vm, q, NULL, 0);
> +
> +	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> +				       vm->xe->pat.idx[cache_lvl]);
> +	if (IS_ERR(ops)) {
> +		err = PTR_ERR(ops);
> +		goto release_vm_lock;
> +	}
> +
> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> +	if (err)
> +		goto release_vm_lock;
> +
> +	xe_assert(vm->xe, !list_empty(&vops.list));
> +
> +	err = xe_vma_ops_alloc(&vops, false);
> +	if (err)
> +		goto unwind_ops;
> +
> +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> +	if (IS_ERR(fence))
> +		err = PTR_ERR(fence);
> +
> +unwind_ops:
> +	if (err && err != -ENODATA)
> +		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> +
> +	xe_vma_ops_fini(&vops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +
> +release_vm_lock:
> +	up_write(&vm->lock);
> +
> +	if (q)
> +		xe_exec_queue_put(q);
> +	xe_vm_put(vm);
> +	xe_bo_put(bo);
> +
> +	if (err)
> +		fence = ERR_PTR(err);
> +
> +	return fence;
> +}
> +
>   /**
>    * xe_vm_lock() - Lock the vm's dma_resv object
>    * @vm: The struct xe_vm whose lock is to be locked
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..0a2fa6c0815b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -18,6 +18,8 @@ struct drm_file;
>   
>   struct ttm_buffer_object;
>   
> +struct dma_fence;
> +
>   struct xe_exec_queue;
>   struct xe_file;
>   struct xe_sync_entry;
> @@ -247,6 +249,10 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>   			  unsigned int num_fences);
>   
> +struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl);
> +
>   /**
>    * xe_vm_resv() - Return's the vm's reservation object
>    * @vm: The vm
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7f9a303e51d8..52467b9b5348 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -164,6 +164,7 @@ struct xe_vm {
>   #define XE_VM_FLAG_BANNED		BIT(5)
>   #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
>   #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> +#define XE_VM_FLAG_GSC			BIT(8)
>   	unsigned long flags;
>   
>   	/** @composite_fence_ctx: context composite fence */

