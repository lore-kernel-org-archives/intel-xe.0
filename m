Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57915C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 23:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1711C10E1FF;
	Fri, 31 Jan 2025 23:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tq55LZSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EA610E1FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 23:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738367624; x=1769903624;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Huq03XNCvjz2buDAXfVEKhXLBRg54s6o3c+5pA6ZKk8=;
 b=Tq55LZSVMs+CEpkwZNyfPYhF383th+PzxeuFNLTMxyt4QRtemXMArYT1
 VHo4CHg3lPks27KRp/8DK4cSFIUaitZ1Su0zKeTqxquvSwsDJMNaRrLLe
 IYndUskBLiU42ZpoFKCX0VdAcQm28TFe5CBRiB4H91YV5tXdrkCyKLS2I
 lXurQowFVs3+haR/LeQzIzb/wlk43P66uYwGqNzI37sKypt6kjmaJt4YX
 WMTYeUTa0m1RW2UBOsnoLDf6VwFBnFEL1mL8i2SFR3hUBiTuTn59evSc9
 w1R11XUfn9XsvTILN4QAn216omDseoJ++guCIbefkiIt8iDW26ZgdSsNB Q==;
X-CSE-ConnectionGUID: xMvCyJBvRhK/HzY70z2BPA==
X-CSE-MsgGUID: R74BJlyHQuu6sI+zlQ+H3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38972293"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38972293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 15:53:44 -0800
X-CSE-ConnectionGUID: ciA02I/ORWiftZZjyRMV4g==
X-CSE-MsgGUID: EGqdcVifSjm0SLYGRgS7ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114906583"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 15:53:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 15:53:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 15:53:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 15:53:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHABauNd33F37yUZ3RdIXN01hflAhW5LUQdw+n2QA3WHrpQs0uHIKunKq7BHpEEJFjOAoB8l91pHbDGsK7s/Etfp5n15OV1UOzatTDzL8ph+JRoHCM1VbRS5KvhxEV8Qm/OdKedQnZeoJnBU4Rw0cuD0I9npFQwlZS4MbEfdERhwSYqheEJdLVaGDTrONje1dZpQW4PI9jUjiq/8dVjhMYvKc3eaeKPNZ+z1KmDvptNHqaawwatXm4VFK2Hc+g/GW/18qEVtNL83kxzpXIE9LZckUbQdT2SIY3OEse0xXVBEqHNJ8LC59Npb2OhifSDRapgOEYD7e6QrvPN1XSAl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXtm3V3vNxzwMQBg5DjS9mfO8vFOs/Oc+7wQCwFv7Ok=;
 b=vanZYfaSpaxtKhczaG6Uf6BRpP40tV8BMe5xbRCpXditbPm9cdhyQv2QUyZkewu1jFbL40SgcaVZ2R4vlGzRxNQMESLP84nY/RgLYBZxjlS6RAUlfvdBh18Z2EBTOqjUTzR0AWYc1UZyH4d7zFB2pScgfIVVh/kcOcdgYvUGvGg+L3JE3DpDJ+A9jopj8fLftoWS8DpvFUGL1/66e+e6viI4ws8HW797Jkmu8JWSt1kLKPUSHRHVKwjw63y2rvfydxYdueLO6h2KpH0gj97JWVdkFo4xBCRJfbsZiyfXtS2QMvYT2uX6xh2/SlHD8qTOYnB+oJQUP/HGI4+H9OQTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 23:53:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 23:53:27 +0000
Date: Fri, 31 Jan 2025 17:53:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Don't try to trigger a full GT reset if VF
Message-ID: <jdh3cve7w2owjmelwjsm7tya33zfgd6h455wmgwhkydeefxuwu@pgwdo5zhykgv>
References: <20250131182502.852-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131182502.852-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 90aaf275-5dbd-4824-3918-08dd425274fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUZpcTNDVXU3dmxlRk14WjBpTWd0ZXBDekFtNzJsMzQzU0g4T2tDbFBzNWZS?=
 =?utf-8?B?dlZoQWxCUEI5TURFNk15MnlrYXhBYmpsR2FtRTR5aG84K3FxYms0MkVKZFhK?=
 =?utf-8?B?STVvSUQ4MFRrRC9DaDRsTHZKTzhTZStndWtGN2NQYk4rRm1wZ0NCUkdEV0Zm?=
 =?utf-8?B?KzVlS3REMXh4YlBsdUxXalFKYS9QTjlLMHJjVjB3VXROcyswYWxxZ0c5VjF2?=
 =?utf-8?B?TFZQS3FYQ2w0cnUxMzJpRzFFcnFyR0lwTStGZHczMVRXYkxoNnVEQVZOdkJh?=
 =?utf-8?B?QWJJWUZ5Y25ZYU1UZWs1T2tuRTdJY2lLSlFPNUNUSVRQS2VtNFVXZy9UU3dB?=
 =?utf-8?B?QklaQVNLUDlJSHRETVIxeERSazFyUWh6L3pXTnY0VW1JV2ZyZ0RIQUlYVEZa?=
 =?utf-8?B?SEc3QmprbU5Qa3JydlZFMTVrekY4OXMvZE50NW9KbWNoVzl2TUVBb2VYTmFS?=
 =?utf-8?B?U3czbjY1QWhZTzVIcmhUbW9rekxtMXJqM1AvK1RuZnJyeHQyY3Vva29ZRDAz?=
 =?utf-8?B?Y0tRbXp4R0gwQXVnajhOWGN5TWd2ekFXOTNMSlltaG5uallTSmUvMFp0M21D?=
 =?utf-8?B?VUVqTTR2ZE9YWTNVTkhRVWhPZ2Jjd0JrYmN4M2lNRm04OHRQQ2tveEhPMExm?=
 =?utf-8?B?Vlorc0cyeHdTU1JEZk5tNGZ1WExFdmhDaUkzUkdrMmFqTTd1U2tydE1uWVhC?=
 =?utf-8?B?TkJOL2l2Rkh3RkdUZG9ZT3VCUUxHeGpZTjVIamwvUEVvL00vYlNjcHdlNk12?=
 =?utf-8?B?dkEwRzFHWDVpcnNTNCs3aGtXVG9aaitrYWljQVNSTWc4Y2dSdVdHbmF6VEw0?=
 =?utf-8?B?SDFSK2s1YS9aTXMrVTRBODk5WlVydFJZdisvV1ZiRHNIRnVNUThiajBDcWY2?=
 =?utf-8?B?YkdWNnQvclhwSjlVUXQvVGZUZmNFVytHRE51ZlJCMlRuV01TaXFLSWgyNGFC?=
 =?utf-8?B?USsvN1dDaG9SdTMzbUluaklldnZmSGVhYTZINzRJZmxIWi8weWFtaG4rblRa?=
 =?utf-8?B?TGEwREh6aUpwSmdRcHFvZi9YQnhrSmtQdkQvaHEwSVYwdVU0WXdrSTg3V0Fs?=
 =?utf-8?B?RUJhWjI3NzJ5RHhHUmlwRGh6M0U1WmRkMnJNWnI1NW5UOTlWWC8wSTVmYUgv?=
 =?utf-8?B?NGNDUTRaOElNWGtkbGMxMWRvUVJvODdFNFV3VlVhYlU2SXM1MlA1VlRqRlo3?=
 =?utf-8?B?Zzl1ajBKSGVpZWdHTTNkM2h6a2VBYmozQ3hkZEFLZTgvdzdSRWhVRnptRnBw?=
 =?utf-8?B?dnJwbVZYSWxuTms4ZFM5eVVGaXR1Nm5kbUxGY2xQcWM3WlJEc0U0T3c4dlJP?=
 =?utf-8?B?RkFLWXlVZGc4NFFXbU1PYmdxL2Ixci95cWlydnZpeFJHenR0aXYySFFqZkgz?=
 =?utf-8?B?Q0NqNVp4M3cyUWx4b1FzRVpzbnZTYzg4czlSeXJaam8xcnR4blVVd1J6ZnVn?=
 =?utf-8?B?aUlkOXdYbVgrK1BHY0d1Z004eXVxUmhNVGVuTFF1UzEydjZVb3p4b0pvVjRo?=
 =?utf-8?B?TVFHbVJ6dWhiZUZ6cUZXVnlhUkVGY2drZHdLVmVIL21DV0F6ajVCU21TYXJ0?=
 =?utf-8?B?K2xwbkNtNEhRdFd0T0t5MVViSFJKMVZ4RlhEN1RUVGlJM3YzSXRCZFduOXUx?=
 =?utf-8?B?bWJGSkhFV0p1eGwybkFhRTR0R2ZIM1pNdjdOTHk2Q0UvdGJ1Q09wMy9lQzFF?=
 =?utf-8?B?dERXSTIzU1NzQkNtN3BmdGN0OTFNSGdPWHNadllPeEV3UUpReEdyblBURnRR?=
 =?utf-8?B?OUd0dk1xTk82T1Mvend5WG5Xd2E0eUs2RStSZm1tYjFGOHlrRFA0S3BXZmt4?=
 =?utf-8?B?VjdIdk5mWVV6RzFoRVdMdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBVdS80bnhCZzVKSncvT2UyRDg0UDlHTWF0UVhxTWJVOWxwK2VONjVHTFlB?=
 =?utf-8?B?ZkZ1N2NTMklFckh3ZXlWVXh1Unc4TGpIZEFBV0U4Tnd4dWduN3VjeVZBNDJK?=
 =?utf-8?B?dXQzQ2NRRFlkKzgzaHhNTG9vRFVxWTAzc3JDZzluWGRVWGFOY0xUTWpzc0w2?=
 =?utf-8?B?eWNhVXJSMGhOS1UzWE9YdW5UNWZJMHhtK1VSTFVCTmx4VzRPTzRwQVQzc2xr?=
 =?utf-8?B?OEpGemZ3bXhWY2J0L3dYelVmT3FqUGxzVy82SndoZDVuSEptY0s1Q3h6ZldY?=
 =?utf-8?B?b0NYUlVlWitqd0VwV0NWb0dHOGNBZnlqK2N5a09iV2hXRktsd3NTSUd5L2t3?=
 =?utf-8?B?SmlJZXRVWmpQNk9jTUZybWFURWp0OTd2V3MvMDl5N0FDYmJPSURKNmR5U3c1?=
 =?utf-8?B?WWxNQktOYXRsWU5ZbW1ERkQ1YmduVVhiVkZsQnA2M2l6THhtb1RpM05UQ1Fj?=
 =?utf-8?B?MlViWnQwdURaRDQxNno3ZkhoME5RazhEcTY1RlY3Y2tvVFAyR0RvTG5VdGpN?=
 =?utf-8?B?TkRNN29sQk5ZZDk4U1k3SDVZWmRVUzYyWlFsb1RLdU5hNHlWc0s1L0E4MitD?=
 =?utf-8?B?N3RITzFXdEEwVzJRaXY5Q0RCWXExU1Z4c3MxMU5mN1BUZDM2SU9NQjErb0dp?=
 =?utf-8?B?d3FwczcvK0hsMVBmZCtSTEpHK3FOL3VXT1VDZmxnSWd4UEE5aE1kY29acjlI?=
 =?utf-8?B?c1B3YnRpMUFsM0Q5OXBvSTB5bk5uRXVNaHpwZFpmSFBxUmlqN0RKbGtCRUpH?=
 =?utf-8?B?eG9lY1VVNllDb2x5Z2RPdzJYMHZnZ1UxanB2K3gvSjI2dTdxRXVKbGcvZWlR?=
 =?utf-8?B?S0Z5ZlNuZDBFZmhXYVZuUzNLenphQnNjVERzK2dpMFNscnlacDlGRDVvZjdM?=
 =?utf-8?B?bkY4bEJTTGEwWUtzQ0NhbmM4R2FyZmlJLzBVNjhWRXRrd3MrYnBCN1p2ZGFI?=
 =?utf-8?B?bGtPUU44RlI2Y042NFhzdzN1OUZDL0hRQmVaaG5yWkdpbHpRMncvcklnTHJm?=
 =?utf-8?B?TjkzWXR3NlBxWmszdEVyVHZQSE00NTNpanZoTTllMkJEZUJYUDZjaVorVVd6?=
 =?utf-8?B?aWdlK2RyMzgzS3V2Q1BWVGZzQUtGL0EyR0MvQjZ2YXlDUmdXMjJRb2JzSnhL?=
 =?utf-8?B?Q1pDaXcxSUs5WndwalB5V1cwV1JOa3l5R1QwSE9pK0llNWNhMjNGNFcyK3BH?=
 =?utf-8?B?UW9LUmdzeVB3L0pHWTBMTS9FYnY0RmpOam1yQ2hjVnJiSVRkTWdCRHh4MGls?=
 =?utf-8?B?NkpZK3Vkbll2SDRKQzBBNk5rUGdQcWROTERxbWV3WHNaa1g1UmZzSE9UYllC?=
 =?utf-8?B?RlZQU0t5V0ZjaTluZ2pxUVk3QWpielpBU1B1T3VhM290QWh3Z3Q0SDlnbWZ5?=
 =?utf-8?B?UlJ5aHlKRVBGdlJUUHRmZTVMVmpLMCsxS1A2OXVIc0loaWs1RThnZGZYcFZ3?=
 =?utf-8?B?R2dmWEY5VFZqbkhZc0ZON04vUEZSa2k0TzJjRllzYmVBUlRIUit0bmtYbDFC?=
 =?utf-8?B?TEl1c2RMdDJuakhHcXhDemg4WTFOT2ZkN3RKRXhzUEo3TjJFN2VPUW5nOENF?=
 =?utf-8?B?MlRiWnkrNnpucXFLdFFWdTRkUDZFU2VkSW5sN25sc0NrL29lMFhrTVI5dnNB?=
 =?utf-8?B?R1NaQ2pBQVBxbTlicWhFRmhQdlZteUxaekJVajI2YWZSQy9IZDV3dkFadHVI?=
 =?utf-8?B?Vk1BMVRSbTN3Q0xWaFJXWThjZXZWbFRmWnVWc0MweDZvajV5WHVrczNpZm1H?=
 =?utf-8?B?dkZISXhJUC9Id3d2RDhnS0FNSkNSd1JBL3FlOXdITnJzcXdBSDkvYmcyeXdR?=
 =?utf-8?B?V0E2SnZ4VkMrVXdGOVNTdERyN0pEWStwdkVtY21mL3pqcmNHOEtmS1lHK1hr?=
 =?utf-8?B?enE4NGpPR1NOeVhMRTB5ckVjWG4xYnFIK1pxMURFblIrYW1BZE1IUXkwYWV3?=
 =?utf-8?B?azVvTEZ2cHZaYS9GbWwzdnU1aUlBV01MQktSRFd0ZGJ1YlVqTmZrQ2hCdTBh?=
 =?utf-8?B?MmliaTFOZkJYL0ZMMUUxSFFoUm5mS3QvdldGdUd3L1pPMzVZaDlCdlNkK1pM?=
 =?utf-8?B?Z0gxMU5GNHN1V1Yyemhkd05JSjNyYk5KNXVOR3dDU2U3d05ITGF0YWxpeTRm?=
 =?utf-8?B?RG5EWjRpcW5KMmpmc0FJaFBrbm5jdkplMzUvbm10SG1GanhtdUVtNWlOTWlU?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90aaf275-5dbd-4824-3918-08dd425274fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 23:53:27.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NJbFpz8MQXwWgxcS19HqJLk5TJvBfHzEgeRMabAfss6ZIUxPdFmV8Ucz0NDatsIw4m8nLMY1+9bRUoiJ8sNmIPfEypC7XUZhWc2h5qDOVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

On Fri, Jan 31, 2025 at 07:25:02PM +0100, Michal Wajdeczko wrote:
>VFs don't have access to the GDRST(0x941c) register that driver
>uses to reset a GT. Attempt to trigger a reset using debugfs:
>
> $ cat /sys/kernel/debug/dri/0000:00:02.1/gt0/force_reset
>
>or due to a hang condition detected by the driver leads to:
>
> [ ] xe 0000:00:02.1: [drm] GT0: trying reset from force_reset [xe]
> [ ] xe 0000:00:02.1: [drm] GT0: reset queued
> [ ] xe 0000:00:02.1: [drm] GT0: reset started
> [ ] ------------[ cut here ]------------
> [ ] xe 0000:00:02.1: [drm] GT0: VF is trying to write 0x1 to an inaccessible register 0x941c+0x0
> [ ] WARNING: CPU: 3 PID: 3069 at drivers/gpu/drm/xe/xe_gt_sriov_vf.c:996 xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
> [ ] RIP: 0010:xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
> [ ] Call Trace:
> [ ]  <TASK>
> [ ]  ? show_regs+0x6c/0x80
> [ ]  ? __warn+0x93/0x1c0
> [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
> [ ]  ? report_bug+0x182/0x1b0
> [ ]  ? handle_bug+0x6e/0xb0
> [ ]  ? exc_invalid_op+0x18/0x80
> [ ]  ? asm_exc_invalid_op+0x1b/0x20
> [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
> [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
> [ ]  ? xe_gt_tlb_invalidation_reset+0xef/0x110 [xe]
> [ ]  ? __mutex_unlock_slowpath+0x41/0x2e0
> [ ]  xe_mmio_write32+0x64/0x150 [xe]
> [ ]  do_gt_reset+0x2f/0xa0 [xe]
> [ ]  gt_reset_worker+0x14e/0x1e0 [xe]
> [ ]  process_one_work+0x21c/0x740
> [ ]  worker_thread+0x1db/0x3c0
>
>Fix that by sending H2G VF_RESET(0x5507) action instead.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4078
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
>Cc: Michał Winiarski <michal.winiarski@intel.com>
>Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c          |  4 ++++
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 16 ++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
> 3 files changed, 21 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 01a4a852b8f4..9fb8f1e678dc 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -32,6 +32,7 @@
> #include "xe_gt_pagefault.h"
> #include "xe_gt_printk.h"
> #include "xe_gt_sriov_pf.h"
>+#include "xe_gt_sriov_vf.h"
> #include "xe_gt_sysfs.h"
> #include "xe_gt_tlb_invalidation.h"
> #include "xe_gt_topology.h"
>@@ -679,6 +680,9 @@ static int do_gt_reset(struct xe_gt *gt)
> {
> 	int err;
>
>+	if (IS_SRIOV_VF(gt_to_xe(gt)))
>+		return xe_gt_sriov_vf_reset(gt);
>+
> 	xe_gsc_wa_14015076503(gt, true);
>
> 	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>index 6671030439fd..4831549da319 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -58,6 +58,22 @@ static int vf_reset_guc_state(struct xe_gt *gt)
> 	return err;
> }
>
>+/**
>+ * xe_gt_sriov_vf_reset - Reset GuC VF internal state.
>+ * @gt: the &xe_gt
>+ *
>+ * It requires functional `GuC MMIO based communication`_.
>+ *
>+ * Return: 0 on success or a negative error code on failure.
>+ */
>+int xe_gt_sriov_vf_reset(struct xe_gt *gt)
>+{
>+	if (!xe_device_uc_enabled(gt_to_xe(gt)))

I don't think this condition is ever true when driver is loaded in VF
mode, is it? Anyway, looks good:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+		return -ENODEV;
>+
>+	return vf_reset_guc_state(gt);
>+}
>+
> static int guc_action_match_version(struct xe_guc *guc,
> 				    u32 wanted_branch, u32 wanted_major, u32 wanted_minor,
> 				    u32 *branch, u32 *major, u32 *minor, u32 *patch)
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>index 912d20814261..ba6c5d74e326 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>@@ -12,6 +12,7 @@ struct drm_printer;
> struct xe_gt;
> struct xe_reg;
>
>+int xe_gt_sriov_vf_reset(struct xe_gt *gt);
> int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>-- 
>2.47.1
>
