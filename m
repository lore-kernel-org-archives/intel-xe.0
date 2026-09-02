Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD6C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B9F10F301;
	Wed,  2 Sep 2026 18:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJrwCJG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2110F300;
 Wed,  2 Sep 2026 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788372017; x=1819908017;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uLh5XHAgPasxDIqhOI1aTq38sAgyUtY2Y2PmviiI2RI=;
 b=aJrwCJG8gEwekRgSZxV3lxFuVT3iXF81VXc36Mli3IJ0T/q9VtrGUtpO
 vuGGouYkVSCtJMA+a2J3nFrLl7HsIA6vJ3TmZXPwsdMH1rRvuhrxqUS0O
 gdL102MmfTALoUSluzQOKSxjr3L7tAL2cEc95bEZgobNnYuG8kELNbpyu
 ONHO3GJ+N7DVd14PpvKa+iGuLg4qPJKBOX+BvWjhibXWrVV79FogBxKLS
 VDaXS090TJkq0Iys+CKJy+WTCyk8rLo9y+99kPsx5I5R4m9Wwe39yNj5v
 vWeP0UOHuOly7D0EC4ZeTI5g+X2JnFCSxaqYGUG/AAIkt+qBZMmtAbY0X g==;
X-CSE-ConnectionGUID: tPz0RjxKSJCKLxiaCuCLkg==
X-CSE-MsgGUID: vm4V/W9xRsGpTRYmFIxUrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106361790"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106361790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:00:16 -0700
X-CSE-ConnectionGUID: KJEYJbsPT7C/Czn2/nGl0Q==
X-CSE-MsgGUID: hNNCb0umSv2mItgfYv8sXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="270038470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:00:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:00:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:00:15 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6YV7674yIjhEt7uaRPvFNCCSbDqubJMPuSJBQXh3+ZtdQqjA1n6KMTr+/XL9KW7mgagmEn1z+8DjPTyqQ+Y5vHJ97FynO0LqmAu9+f1klZPP7Ja+soau5mtGZLoIY2cxmJmrtRi7sRou5UDqUzO7BE+WbjMhlPg8b+qqHMrkT8lOWBvZW11LTyRf01YUVn0ck9Wd2w/MiGBc6CPGM1IOQ8hIXMZucS6RSel/K8O2LSjOF5veJL7J0U4lFK2qKLVo4xgxLXw0iYuD29XGSgH+MsYn3eZ/8hNO+hp33XkjWieS3OrHA+oB1vSozAAHQ+qZkMaIzOFAZPVneP6jmGD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saIR+S98hNfORqekXwhj6Gjj9ZT24pMEdQD8z2cowlE=;
 b=TlS6ygwDIpPBh9wS0V3WiZSiFZDifIIfX8Ay1ZAAp1TvD6BpPh/7Aias8GweTaiOz3o62CxSzgPLL5bhVMkBSBT22s4cakOUqqNKn5EYERHEoeJvbfsuIAoZhYhuvTO4eizQiBI171+lEx/i4d5Z7G48NHN2m4w8NCVaVtENFVgOFQlo7u415LjTNai3sfRE2wpujgd1GV/b5UULCSOwZe+jMRvhzkH2dfLeqLM0HBAadNQB2aCU5POpqUjwnoG4aqmGi0YyTF2gYaOU3CRYAJ85ywIlZS4OcpGuUTsuqGDKaDPnI48rXo+JjVcG6aNfEYpDrriSxKDGLi2RQ7xdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by SJ5PPF06F7EC6B5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::807) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:00:13 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0360.006; Wed, 2 Sep 2026
 18:00:13 +0000
Message-ID: <728a7b75-3d33-474c-94fd-dd28ca6a02a6@intel.com>
Date: Wed, 2 Sep 2026 23:30:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 4/4] drm/i915/display: Gate periodic AS SDP skip frames
 behind a module parameter
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-5-uma.shankar@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260831213421.1804635-5-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|SJ5PPF06F7EC6B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e833c52-2d1a-425b-6443-08df091c0988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0+9y3Pm0edPDld7q0o1PGjZlMo2b/CXMir0vDlU1vvRnZ9UlqWWfi9oQMb1rRZ9RN1fYOm7vT8Fn9Q+Rz+1RUhHNJLUdk2LvHe87eSTDj04syMR4C/CC9oUEHcxuHNf/kQZJYJREeR+NW+gWcZS5Og56rF3tdmc9dTLNLtlVDp4yHn4SGFXA2VOScf76VXiyKrxbhSWze5Td0kfu2e7LJZskr/D997J66unuI7w910DzxiEvBv01hgvCIVPl7D/N9UVnrEytdjq2B/gEMXTe+Fn8eRvD77PNffg8vSMp8aINRrBDmq4lg5YoOAd9JFyiUnaAl6lkFmDkr3iSVbzllEuEL5jbWcNC3c3B52poWSkDuGlkB2nLhWXtIZX19UXnxExdrFcADiRIG96bWNFhFUeHdfBaYKWwhkthrKTq1XRs/Mg9qfXe+DpnKkTICc1ZdranRl//gptHxp0D0CQSMJS37h4arlC/NwHMVYBROJ+kK/hgZiyTvmKjB3DD0sn/JXcVRwR61XpR3IU35ouuYhLtBAriCyAldz7lkBE0tWhqAKGdfSrYCcQLstuVOxX1btLJszWCvePT+kpjcDmM6ssm/rgucU1B9rxQsTMMDEyoHs07DJwa+dxKe3Kz5mUEiOLiUK8r+BZHISZKzOTH8atDJEO3dtFdgnD+kRyby80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWNNNHAvM2Z6d3BqRWJNMUtCSGdhSjZ4OUFJMTVpdUtGVWtUeGxwMW0zR1I3?=
 =?utf-8?B?czE4bEZwdkFXclVKWnFDd2JEcXU2cGVhb0EyNXozZm43WHVkbi9NcEtNRjNu?=
 =?utf-8?B?bUplMU5LT3QvbDR6SElSZXNOd3lKUTZnZzh3d0h5UUtFUUZOMnRTZ0RsOE5l?=
 =?utf-8?B?QjdBTUYrYlZ5dlNFZVVXS1lucGtFSEV0eTh5Rk40ckJXcm9laTdBTVM4WFM5?=
 =?utf-8?B?aUZvQzdPU0NjZzU5UTJDdzBLQm91V09CcjJCdSt6alcvM0p0a2s3L0J3aVN0?=
 =?utf-8?B?bWhna3pHQTJVb2llTEh5cDZQUVZYbDBPNFQwQS9NSHVUV1FXSnlqL0tQenRk?=
 =?utf-8?B?NVZWUnlHV1lSQ25SbS9iMVNuaE1VbGEzRmdUY29CNy9icDBiQzFjOWJ4ZUpV?=
 =?utf-8?B?UDBpSXpWRTNhVkYvdjNVS3d0N3hHdjVRRjBwcjBJK2lUYW9TZHp4SnhXVHUz?=
 =?utf-8?B?QSt6dWtWajZjdGZ5V0NSZzFpdlM4VnZCRndoNWJPU2RnTVhsY3FGaktTS0tP?=
 =?utf-8?B?dE1uTDRrV2dxOU83aVJZVm9kcXE3RkVua3cxanBES2thZnR5UERKTVp4SEhH?=
 =?utf-8?B?MzFINXhRRkd0cjlPYzlLQ3FsN1p0RDVBREZ6WHFmYzZ2dDJ5akNSMEZaRDFS?=
 =?utf-8?B?RVBCeUY1VEVYV1o4cXRtRytCdXlLaXdBc3g1azNVTGFYTXpNZjFYeEFpZzEw?=
 =?utf-8?B?SWJERXAzMEhsTWd3RjBWdGNiditTekc1QXNoRlRWYzltZTZuQzJQRUprbEVQ?=
 =?utf-8?B?VkZZSENVN0x3dHY5L1ptY3Frd0J4ai9mTnc2QzVmUU1xYlFRSi9pckdPOTV0?=
 =?utf-8?B?QzRxVWtwVFRFS1F2d2N4aHNjVVk3a1hYODFkTzlVRWFZV1ErcUFQUzcvbzhX?=
 =?utf-8?B?OWFQUVBUZFdOSnVHUWJLeWI0TzZMcHJoczhCcUYrWGs5c0dKdWlhUjhPMmdr?=
 =?utf-8?B?VzQ1azJGR3AvWGdOMDNYZmdpeGQwMWhmSzh1bHdYYUhVczl5Wm1DdUlXblRQ?=
 =?utf-8?B?bGJSUjlUVGFIUlM2RTVSNnlDMDF4WFl6QmJPVGgvNkZLRDI1eDBST1BsRjNQ?=
 =?utf-8?B?WStzQVZUZGxNT1R1VGkyWWg3am1zZ0d0QTJDcDdnQ0dlaGZPSDE1T2NJcjJs?=
 =?utf-8?B?dVVLSzJCcHhXb3AxR2g3UzlwdWoxcXVGQkRJbEFMRUpLL0lXM2xEaDhOWXJS?=
 =?utf-8?B?Q2lxenc1UmNDOTR6dTViS3NOeXZteGNqUnkzeVBLc2hCbVR5VUEzQTQ1RlVn?=
 =?utf-8?B?NjNvaVZBN29taU9LR0lZU0JqZ1BNL2ZsYmlYZ0djRXpMY3RhampoRHZjSktR?=
 =?utf-8?B?K0dnN29IcWhHeHpKSWIyck4xRTFvaTEwZHZPd2JtL2o5ZXd1MzhGTTFQRjlm?=
 =?utf-8?B?TzFzU0h3eDJadmZkbWdLRCtSUzFaUlFPaVpmM0pLYjNPYWtmc3p1QjQzVHRJ?=
 =?utf-8?B?dkVraWdtWFZNSjdCNmExV0FjWlc3MkVJMDJtRkIrR2R4bkl3NzRLK3p1WmtQ?=
 =?utf-8?B?ek9ma0lPakMzNld5ZjVyckgrQy9QVmptY2xscWZLV25qVDlDaG1hUG1BMDhC?=
 =?utf-8?B?bWltaTRlWVRmbnkyNm02OEdGeS85TTkyYXpuS3lGZVlDbHBCemZlMS83ZVpV?=
 =?utf-8?B?MHFoa0VsQzhTN2QyRjE3OEttSnZPUTBxZWIxak5DQllPc2hmZjdsQVdnMmZE?=
 =?utf-8?B?L2Y3V3VxbCtMN3Q3Y0gxTHhHUEFydnJkOHVNMGVCU3VEamRORFZGV2drSzlU?=
 =?utf-8?B?SG1UNURNYTI1TGR5UnlielI0c2dDWkVhNnNoTXVzU09ZbnNnNXlaNmxacmt2?=
 =?utf-8?B?QjZHZE5TWE11ek9UVG52TDVOV2VBSkRmZWtUcEJOTGY5Z1pIOUpUVTloRlJW?=
 =?utf-8?B?RENMK3ZySi9GdWdIelUxQWYzS215Yi9zaUN4VWpOYXIzZG04RVBTUzI2c2c2?=
 =?utf-8?B?aXZvN2pJaTRnOE92aUJIL1BmMWhtdmVweTNyT3ZBWU5tSGRQcUFZbW1meSs2?=
 =?utf-8?B?RkxKdm02Y0wrMXFzWktKQkNQYjVOcHJXb08zNndxMFpQTjBUNW9qQi9JMzVo?=
 =?utf-8?B?aUV6aCs0bmx5VVdDRCtWdzJmZk04S2NadW9FWlhpdGgxSTQwMngveEU4Q3Zr?=
 =?utf-8?B?bnBUWEtKUlZ6SFFkS2lkcnF3dHFYaUZYMS9pcTdjaHFuNDBhMlRQRmxKZyt3?=
 =?utf-8?B?dTRtNU9HdEFscVVIc3Vtd3BPZDZIbU0rZW9GUE5mL2xuZlpjUFl0cVZ4MnN2?=
 =?utf-8?B?V2JTdFVGcGMrdGR1RzB5OHg1T1Rva0FOdER2NXBqM0Q0UWkwWFc2WFVuZDI4?=
 =?utf-8?B?M1ZFdW11aG95dmxyWVZRWFNFd2dJdzhiSlFwWW03MTNFR094OUQ2MG5sZkM5?=
 =?utf-8?Q?pHkdGJpkEO+17rQ4Fwpve16Bi973+2mwHF8P63wLHqkD9?=
X-MS-Exchange-AntiSpam-MessageData-1: S3/DnLAdQblDXw==
X-Exchange-RoutingPolicyChecked: BXGhJujFtSKDD3pi2tus1q1KClEpknEyq05LQv1Mzb+lgTD6f/T2LByn+LUEDEYDOXmrmvHW6TURbrypFS9BeyPshzXXMQVsY1miF6atMNHUKHZCAWlk4FKl01DgeQWnVA7gCpUjBKEzy7fuwJPO2o5kYrQ7UmW1+fTEYmxZKpbnxM0cgSqU7T5OWFDANL0Kxns1HWhWVLqCdj0XHijLdI+ftado4HodP2jzE0wOiokWW67vJ0WQi3i3HLmp0PJ0Tn3+xZTQqUh+nSaoUon05UCJFGo8dEHnkN24ATC3fBlfrJR9NZFnIZ02JfZr522jbBOSSx99GkMONzIat0jwnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e833c52-2d1a-425b-6443-08df091c0988
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:00:13.4494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tZxJ7tnZegRP8Dvr65O/EtR2r7xt08bzc4mFpw0gVojZYfWC6xcSJSjGkgWscEnbfi6T1DCEtSwQ1kk/xlouOWXtGcZGC3eZnIHKFaPHCXJb7rbzFoyu1rWbO/I4caN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF06F7EC6B5
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

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> Periodic AS SDP (skip frames) drives a Panel Replay panel down toward its
> minimum refresh rate. It is a new, panel- and platform-sensitive behaviour,
> so keep it opt-in rather than enabling it unconditionally.
>
> Add a display module parameter, periodic_assdp_enable, shared by both the
> i915 and xe drivers via the intel_display_params infrastructure. It defaults
> to false (feature disabled); set it to true to enable periodic AS SDP.
>
> Gate the feature at its single choke point, intel_pr_as_sdp_skip_frames():
> returning a zero skip count when the parameter is off makes both the
> PR_ALPM_CTL programming (intel_alpm_configure_pr_as_sdp()) and the DC3co
> force-disable predicate (intel_alpm_pr_as_sdp_skip_frames_enabled()) a no-op,
> so AS SDP continues to be sent on every frame as before.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c           | 5 +++++
>   drivers/gpu/drm/i915/display/intel_display_params.c | 6 ++++++
>   drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>   3 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index c784e77f610b..537cad13f0b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -392,11 +392,16 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
>    */
>   static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
>   {
> +	struct intel_display *display = to_intel_display(intel_dp);
>   	const struct drm_display_info *info =
>   		&intel_dp->attached_connector->base.display_info;
>   	int max_vrefresh = info->monitor_range.max_vfreq;
>   	int min_vrefresh = info->monitor_range.min_vfreq;
>   
> +	/* Off by default; gated by the periodic_assdp_enable module parameter. */
> +	if (!display->params.periodic_assdp_enable)
> +		return 0;
> +
>   	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b09..a845d29610cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -139,6 +139,12 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
>   	"(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
>   	"Default: -1");
>   
> +intel_display_param_named_unsafe(periodic_assdp_enable, bool, 0600,
> +	"Enable periodic Adaptive-Sync SDP (AS SDP skip frames) for Panel Replay "
> +	"to drive the panel down to its minimum refresh rate "
> +	"(0=disabled, 1=enabled) "
> +	"Default: 0");
> +
>   __maybe_unused
>   static void _param_print_bool(struct drm_printer *p, const char *driver_name,
>   			      const char *name, bool val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index b95ecf728daa..4d912aab4811 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -50,6 +50,7 @@ struct drm_printer;
>   	param(bool, psr_safest_params, false, 0400) \
>   	param(bool, enable_psr2_sel_fetch, true, 0400) \
>   	param(int, enable_dmc_wl, -1, 0400) \
> +	param(bool, periodic_assdp_enable, false, 0600) \
>   
>   #define MEMBER(T, member, ...) T member;
>   struct intel_display_params {

Wondering if we can rename the parameter to|enable_periodic_assdp| to match the existing params.
Also, I assume the|0600| write permission is intentional to allow runtime enable/disable for testing.

Other than this, LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>


