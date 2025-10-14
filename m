Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4235ACCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 06:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754210E1A4;
	Tue, 14 Oct 2025 06:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD+paCGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8929410E1E9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 06:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760422681; x=1791958681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jq6H4K1KzYNSWdqALWyeAi8bis9jQCoX60mZr/ETtDA=;
 b=CD+paCGxBepe+9q/bb0QP97MpkWYNcUYApSboBDfxUl0edpJyvpHHIj4
 uVygOy+yQsPemMsm8fyOVA9whHdbO1EI/GXB6sKCaNDTEk+cI+nfzgz1j
 TI+ZoabR01XFmHXkgcMMx2hxwT7SncpTCSqHZncBh9Ba/lULtg8JL7vIL
 coxM/WVrIgMiOa1QkDu5XkTs3X343TZXkT1iNc/vMbt8eZkb/3jETjqDz
 70ogX/rfhooopdJ7vve8Mn6Axkmvt3x+e/kBerYC1sKrNdlrwUF0r9Ohz
 NTnF09MqbK+oM/FRAftjTcdVziAHw7NAXNsC2V7OTMBI/ZaRNjZoVjo5i w==;
X-CSE-ConnectionGUID: 35XqBeiUQECdwmSCF9OICg==
X-CSE-MsgGUID: cVJVZrxvSlaX7Pw7J5KduQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62505268"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62505268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:18:00 -0700
X-CSE-ConnectionGUID: DTRR3itoRqucCu217klvmQ==
X-CSE-MsgGUID: KjoPxsEwTlSfrpZRWguySA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212766466"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:17:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:17:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 23:17:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ntynx80uTQZH/kxcEOdNMcFCjVHIxybRKqoKg8diIfyzmFhOB6nVOfnFtFwGDXT9gkBPJ5Uc5eSuvAgzT58XvUsf+0jpiqMB7r08qK3UNxGLII1HaMLdJqc+UksiIhpBXG0nivfuGvE01/N8pa/RRKETyFme1aUjjrRYBNSyQQUoDW3gjC0H1pxn0la7bQP0XMoKU90RJZVQURpJ8a1khQeiabUAxdeUUF6UEDRSkxydXZz1GG35iM2tIr1jNwiQ6njJtRyi4K59prsibktZyrU9WHmB7J3pjMCYKJ5BQ5gv23yEpfKjVsNawtCz09aD8TADAtINOWpsuivyMv4vew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vy0+p/PDJ5EfF1RitNzpjgfzl8ACSY/XO0OMq93JIc=;
 b=Fj54RnmYJA1WT3zyp9GpLFwY1ssw1jcOIvZODj0cFgwgmYXTswZ0WKhex8Da3SveHznppXucmzzAPw9d6VxQZF9BNtnPiIFHxUb4nGt30IeHVmovH1eK2B/1zAR7yS/CvQxPg6pQ2kdgwyTzDjBkESlyRhPELc/eoSK+dSnielGa9vF4hTgc6h5hKhRdpPYOw6Gp4Bl37USuFvr1Sp9/m+D4/KmzX+byaedwtIBxnNdmVNVp+bCi8bCfuG7NrmjwW1/i0Tx/xeUuM4+PXpkPOJ4DQg2WRsgEEVNK5LbHeOgdoVz4O8o0bSYLL7JS+3Ha4pG4H3Rb0Eg990h/c91cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 06:17:56 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 06:17:55 +0000
Message-ID: <84165a0e-b234-4d0d-aed0-4bee61b97569@intel.com>
Date: Tue, 14 Oct 2025 11:47:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] drm/xe/xe3: Add support for graphics IP versions
 30.04 & 30.05
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-1-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-1-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 81626c47-5091-4b3c-8cef-08de0ae969f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUFjeGNJZDY2cSthMFJnNUpBY001TXdoOEZvL1Rvd3ZUTURQUmw5bXRPaG9M?=
 =?utf-8?B?cEJEc0NlNHNDTU1rL0w5YndoWjlkRzhrL2pjVXBzZWVsSEpPOWVVYWxITkpO?=
 =?utf-8?B?cThOdWwvVjhKZ1hURHRtc3ZtS1gvOVhaUGwwWE80N3Y3N0lNbnZJdlgrQktT?=
 =?utf-8?B?a2U0VFNHR0hVZXJGdm5jRjhQYVNqQ2JQNlhBRFI1dUdpT3lUVHU0d3Z4bnBF?=
 =?utf-8?B?R0tqUkhBSlZmNEVYS25pbXdjb1lTYW94WlVTWlE5ODNPVDVaVFRYano1bHF1?=
 =?utf-8?B?WlhscGxNUVdpZVFSN3ZCbTN5V2trTVZ2SThGUkJDMU5CeVJhdExYNmRTTnlx?=
 =?utf-8?B?S25kbnljSHpZUm4vamJ4aDl6cVBIL3pQWTZ6WGJETWM1QjNqUnpTdVZrRjk2?=
 =?utf-8?B?S3l5M2ErVnVkZzVWSHJXOW1mTmw3aEI4ZjIrNm0rK0FsTUx4U0MzZDZtTDdO?=
 =?utf-8?B?Z1ZPSjZDRDNScmJCVHZXQmF1NkJQeVZSNVdMZVFkS01GazI3c0VEZDloUFdv?=
 =?utf-8?B?SHFQMkhYa2k0a29oU2lHMUhqVzNaejdxZksyQ3BNSVVwYkIzcTA0aWsyN1lD?=
 =?utf-8?B?UFN1VUU2cno4N0FmTFVpWGgvUm8xVjVEamJoTEx3NmE2NXB5RVlTaHMyWDI0?=
 =?utf-8?B?RmJBd1VueUNlWldjdEtIVHRTRGV0SzdjcnNScllvaFNMMWZsWm90U3N1ZWJ3?=
 =?utf-8?B?cDdEa1NBcUZqbnhoZ1JLZHVFYml6aGs3eEVDcDNSbFR2QmNtKzE0VFB6MEZt?=
 =?utf-8?B?Q29EWW9SeVRta0d4RGhIMHAyc3ZBelhmS0VXRWRjbit6eEtjem5VMVFQODNl?=
 =?utf-8?B?cE5lT3FEbWt3ZnZicGVmL2VQbzdwOFVQbWhibjhtTkVxY25lUGpIUCttOWQv?=
 =?utf-8?B?VVJyR2wzekpxSFRiMEZ2NndlNHBvTUNLckhabitqRHNGL2tkL1FZY1BpUWNE?=
 =?utf-8?B?K0h4VUtmT1RSbCtKY0ZTMTJsRXlPZFUvcnVZa1VXUHJwM0p0b0hqMFpzS0hH?=
 =?utf-8?B?c3d0Q1l2b0RPUGFvd0pVUVUxNDBvbXNtTWdPVXpweUxEdnBDM1lZUG10T3JT?=
 =?utf-8?B?cXl0ZWJ2S1MvYWtiZUpkZXdRcllJWFdnMmhPYnd4MU1sSkhBWUllcW4vbm5y?=
 =?utf-8?B?ZWZNeGJ5KzNDZGdaeFE3Y2NJRUNESlo2ZTMrdC9wbmozVkxJOTdHczVmdDBu?=
 =?utf-8?B?TGxyYXRUWEcxUWJEbTMyMHRtNkpnUEN2eWlTUHdpK1E2WFRSZDJEMEFyS2lQ?=
 =?utf-8?B?SlhvYkx5Smsya2dkTGgvVnczZ1hEcXlaTFpLUWsrNnVxemFOOWpBL05wUkN4?=
 =?utf-8?B?NldEUUJaWFlNaEZ2K0xueUhNdmFVRlZXdVE4THMxcHFraXlDcnJ2M0tPbWtr?=
 =?utf-8?B?K21BQVl1N05UUk9COFN1OXlZcEdXMG9XRktjNldwdTc4YnhSZVdVNjFTcHdQ?=
 =?utf-8?B?ZXFEdTNYdThyVEpLNW0weXdzYmZmWmZnY055UUhReHV5MkpSRHoyNWpSVmx6?=
 =?utf-8?B?QVNhNFhIK3NPZWZGMnRjV2JZdytxckZRTEtQZGt3Ynd6QWRIMWk3WThCb0p1?=
 =?utf-8?B?SmJFL2xlRlB5WFZwZGltL3g2aEFRSVdQUHFhS3ozQVVxUi9yS1JhRDRZNTA2?=
 =?utf-8?B?b2tTNys1L0x4bGMxdFJkY3ZWTWdVSHdGRFFqeG9Ic2hkYXprLzJ3QzFvQWpv?=
 =?utf-8?B?NHNUcUZXZWo5YjJPUmdkU3pPU2FneUxJMmlMR1BSUDdKSk40RUZYRktidWpw?=
 =?utf-8?B?QzhtZXFYTGd3bFg0NXRFbzVLbFJaYWxSMnQ4T1F3UHNSWEtwY3pLcWVHSXZj?=
 =?utf-8?B?NzJhVUFzVWhYL3poWGQ5RjAvVXgrRlRjZmRUcXNEaitFSnpRMTNZNjlCdzk4?=
 =?utf-8?B?amNVbzc0OHZKR1orWDhUTW5ZQm5IeG1Edkc3Sit3dHpxdWVZMVlCUjQ1MDF1?=
 =?utf-8?Q?gdRn8Eforx47j+ZcqE4yIrsAfH3XfwFR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUFuY3loWXpBaEwyVTVMS1B1ckpzckZEK1RyNnE1c1BRYTNIa2pjUU9oM1FO?=
 =?utf-8?B?L2xMNTNwMDJHNE5yUTJvbFNnUnBUSk1lVFQxL0toNkpGc0Ryb25WOGVCcEVV?=
 =?utf-8?B?d3BWek1VQnhnNExKd2gzbHpLUzkrQXplQ1ErRjQ0U1k3b1dYM2VDaUZJVC9z?=
 =?utf-8?B?UXg3Qzl0ejJEaWQ4Qk5lcjRhdytTdVRveGtiWnZLeFRlRXVSWm9HNnhUS21x?=
 =?utf-8?B?aDFRRzZMa1l1N0Vwd1JiVm1HVlRSTDF1SVlxU0FrdW9lc0JqZ3dhZFJIOGhD?=
 =?utf-8?B?UUJKd2J2WVVBUGZraS85blM4WU9kSkE4dVlSNmJ6d2ZoS3NsZldlZFprQnhY?=
 =?utf-8?B?SXZGa1hKblVDeHcrMEptRDAzeVE0SVRqY0ZzK3JIUklZRDRNVmN4OWo0TVpC?=
 =?utf-8?B?UjJJcTZuNlFMa3VtR0FvRmJVd3ozWDBtaFBVRzJuWTRnb2M4TTdxdVRiMHZQ?=
 =?utf-8?B?OVZoYytNbWNiaGFEcUJzRUkwOW5relZrZVVUbkQ1bU81bWFNNDU2dFR3eGhN?=
 =?utf-8?B?aTZRRGJUdjRYdkFhdU1ja0M3WndQdXFPeEwzTkxkVmNXVjV4V3ZyRU9tdUln?=
 =?utf-8?B?eXBZT0ZmYjNSa3Rud2lrVmZuN0N5OUthb1hWUjJBRDFNK3FZeHJtOVQwNTFS?=
 =?utf-8?B?WlBjNzBuK1ZLNnBsYjNqQUZxNElweEZ3ZE1mTXVRYnhhUnJDNlBlSFVKN1VO?=
 =?utf-8?B?cjBzTHZaNUxmSk9FR2MrRFh1aWFBbUtEMjFqRENxaDBTWjhXY3J0MlJNdDV5?=
 =?utf-8?B?bVo2Q21uMEl3MVl5dC9IOUIrdHRSYTBwL1ovMlVQS1JBQzZUUXNSNHJTZ21t?=
 =?utf-8?B?U0lzUnZRT1kwZDBENUdwdVZDdGl1YXZUZVJBeHMxNXNsZlh6SC9JdGl6U1JS?=
 =?utf-8?B?TUVWa1dHcmd2QXVOMkIzRWJkaGMrV05GTnRlaVF4OVoyNlFoV0p1VE5YWjQ3?=
 =?utf-8?B?WWFzeE9jbFhrRy92QlJyZ0RrWGdEUkVjRDJ5QlhQY2JKcXJGYjJMeHJlK2JQ?=
 =?utf-8?B?TU9IazNDb2ZwV3owS3d1U3dreS9WZ0Z1SFhvR2R6TWhsOXlwMjNXLy9IMnpi?=
 =?utf-8?B?VjQ5Y1c5R0V5RkhXM1c3OUhocW9xa2lVejNNQjl3WGNHWnA2bGxkb3VOWXYr?=
 =?utf-8?B?SGlhaEZQbWNwWUdGSndxRlpEK0J4UU0vZllHUVBuYWh2bXBBalc0SG1ESFRX?=
 =?utf-8?B?OEovWndkb044S0pFYWoxcVZQU29ndkVFV3l4M044NW91WVBMZGdzMzV4WFgr?=
 =?utf-8?B?bW43aThHblhKNEJnTjdhMjEvQ25ja2xRUkZaOTlzek01N0wzekYzcnNEdnFC?=
 =?utf-8?B?cnVNRW1rbWZDeW9GMVZsUEpmb2sxcHA0ckduWlFFL2NQWXpCaFB2YUFubTdT?=
 =?utf-8?B?TysvOG84YzdlNDNxZWZzRm9lRzZ5VTJmeGYzOWV5dDI3LzI1Z1hJL1VHMmtO?=
 =?utf-8?B?dlZ5VXNxUFdrSGdEaTAxaE5DRWNJV2FCenNNQ3I3L25UM0hKYmpuTDhSWVpI?=
 =?utf-8?B?OGVZNGZwQ1UvWGNBZHZVL0ttd2xBaUh3eTRzazhHaTN2eXNvYS8wZ25KZ1pS?=
 =?utf-8?B?QmFOTE04cHloUGQyMDBMejc2ODZYaXk4bTVPT0VjQ1cyOTNqYS8zakFFUVgx?=
 =?utf-8?B?bWEyUUxsam9keG1MYUU0UEowMCtyTUs0RkQyZGNGMWRRdlhuVXBvSU1Gbzcz?=
 =?utf-8?B?N0hBWk9rMGMzVEQ1dUg0OHV6VUl1UDVTNXYrMHlndmd0Tmpya05SSk1PWXFH?=
 =?utf-8?B?TW55UXFOOStkVkhTZENNdWxuOXRWczJwaHlPYkVOVFBFTGZsQ2o0Ymg0VXgx?=
 =?utf-8?B?MjNZVnpYdWtodGkrZFZqb2ZSd1pjdkxpbGM3MzUyUTJJb2xJRGEyVGhqYVhG?=
 =?utf-8?B?UUc2ZDZ2RUNyUjA5dVZMd3o1dFlsMWxxNEExNzMvcUt4SUFPSUFUR1lxb1BN?=
 =?utf-8?B?Qm9zQm5zVnJ3Vm1NUnlxY0c0cG1aMDhtUkF6ZituZGg1dllrTWJ1SURmK1BT?=
 =?utf-8?B?QnlpUldpMmRNODFvZmRpZGRRU3oxRnNONTBpUElKTTlMY0sxMTdnUGxlL2RM?=
 =?utf-8?B?Vi9iVVBVT3ZJeXU2bFFUMGRjZCtCVW1XRjNNazIvdy9IS0VQc1B6cFpaRTd2?=
 =?utf-8?B?MCtJa0ZtbFg4TVlLSExWb0Z2Ui93NXVzSTJXdGxHeUNSd0lobzAvbUg4a1Uw?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81626c47-5091-4b3c-8cef-08de0ae969f2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:17:55.8441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmIoQCnOTZY54J6TGkW7bKT5UaG4lN2oQLzZJZ7Ls0Q2s4j3yU5Qq0oed/m/MjBHuN0NYOz5PX1i+tDpm0r7En1Qc8l0kzckwTcer3KxI6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
> Add graphics IP versions 30.04 & 30.05 and initial workarounds for these
> IP versions.
>
> BSpec: 74201
> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c        | 2 ++
>   drivers/gpu/drm/xe/xe_wa.c         | 6 +++---
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 7 +++++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 944c698808ace..c1e89689953b7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -149,6 +149,8 @@ static const struct xe_ip graphics_ips[] = {
>   	{ 3000, "Xe3_LPG", &graphics_xe2 },
>   	{ 3001, "Xe3_LPG", &graphics_xe2 },
>   	{ 3003, "Xe3_LPG", &graphics_xe2 },
> +	{ 3004, "Xe3_LPG", &graphics_xe2 },
> +	{ 3005, "Xe3_LPG", &graphics_xe2 },
>   };
>   
>   /* Pre-GMDID Media IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c60159a130014..24b6d4bb0b962 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -684,7 +684,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	},
>   	{ XE_RTP_NAME("13012615864"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
> -		       GRAPHICS_VERSION(3003),
> +		       GRAPHICS_VERSION_RANGE(3003, 3005),
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>   	},
> @@ -695,7 +695,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>   	},
>   	{ XE_RTP_NAME("14021402888"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3003, 3005), FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>   	},
>   	{ XE_RTP_NAME("18041344222"),
> @@ -913,7 +913,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   			     DIS_AUTOSTRIP))
>   	},
>   	{ XE_RTP_NAME("22021007897"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
>   	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>   	},
>   };
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f3a6d5d239cec..9aff2e56fd3e4 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -34,14 +34,17 @@
>   13011645652	GRAPHICS_VERSION(2004)
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
>   		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3004, 3005)
>   14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)

Any specific reason for keeping 3003 different from the range of (3004, 
3005)? Can we have a single range from (3003, 3005)? Same for the two 
additions below.

Other than this, there are a couple of new workarounds which are 
introduced for these IPs, but maybe we can add them once the initial 
upstreaming is finished, nothing major.

Apart from these two comments, LGTM, and,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>   		GRAPHICS_VERSION(2004)
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
>   		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3004, 3005)
>   22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
>   		GRAPHICS_VERSION(2004)
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
>   		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3004, 3005)
>   22019338487	MEDIA_VERSION(2000)
>   		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> @@ -63,11 +66,11 @@
>   16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>   		MEDIA_VERSION_RANGE(1301, 3000)
>   		MEDIA_VERSION(3002)
> -		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
>   16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
>   		MEDIA_VERSION_RANGE(1300, 3000)
>   		MEDIA_VERSION(3002)
> -		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
>   14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
>
