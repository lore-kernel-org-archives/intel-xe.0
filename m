Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300BF10A3D7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742E10E8EC;
	Thu, 26 Mar 2026 11:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faMAadR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803210E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774526345; x=1806062345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hy5THtma6CkXnUO/QLXVIAsVENsH45Om9PqH1Xlt54I=;
 b=faMAadR/tLkLT0p3OTAATo9yi1Cd+CVbTsoKQIDPUn1RhTeXoeieGHMc
 OVpfjh8MdiIK6M7xrEAcdcvM8VW3Wr9pWAYwoxIyypl0TI5Dfq4W3+UI8
 7fQa4N7qtAUcpBKbJ5szqP1kWk3PiHO4DXHjnqYrYJD+NvcMhFgULFR+O
 DNg1a4Q+oMAR5Q6Toeloflg6Sq/IpCVhHsOc86bE3UJAG9fFKsE26R4it
 wLY9q+45oQMmF5o4dTL30Byea9c4Qz/hV5flow1aLClCb/Km25lRHwmCz
 5WKq1j6fsgoSfS9RzR6HGnU07YqNJb5bfevZTyrUaDJA4xKciht1hlcRL w==;
X-CSE-ConnectionGUID: Ct4jYt7sTQSrjSj2nQma0A==
X-CSE-MsgGUID: 7/B99jHwQXyUdWEfteCPvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78178083"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78178083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:59:05 -0700
X-CSE-ConnectionGUID: dq7zaNi9Rs64DduKohXsDg==
X-CSE-MsgGUID: xc9U1tr8QvCwdzbMXrYMMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229431353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:59:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 04:59:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 04:59:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 04:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Evk7UOhAgVYaYLSjCHhvYdi5L/MssPdBtp7sIShWb2shHWrl+YNItLQVlDTbIDRAcmNNzNARIW4T8MpkBoMlC8y8jfko96UuvGSE6ayJ1YsytlZxYxsNTyo6bqJGTKyu8JtHI5gF3Ng3yoA2PECndlIvJ7nJxiRP68vRwdWNUFTpIRu8Nrg7VhdBlXdcSeAyIMr4puCgD1/JyeSv6ZS6/boCjIHUx/wUh2D0sRn4+CqPsnaKrolMIHExakCutcFY/tkOoqFpeqjc2skjjwElJmcQ/SK/68dCDS3zYBa5Y0mA8PqSSTvQDaFUPZKeTb2BH1gxXZIPZdYF23Cd38yuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoOOGhqmpxgF55HfShl8rnUFRXkoZ/B0SwSlVYf5HeE=;
 b=D06jFsmELd6D4WW8NCRmHrOyGD5+tq7KMdUwNYG6VpzKSspXsDo/YSyxEKQ46zMv7B0WUefRpWxObU46zHO7boIgwfCYR6WDCvf6QtEBX6C6eoApfwgDOSLjlou5S2f0GT3VoAjDCn04Ca1+BVv4+wP2UTKQnfAMCPqAEekTXOu9y5kKH+dFPMOTYnhHb2xarPIFndWjyZ8FTwKjYyztgmb/gbprLraFuxgCXYEafaX9Sxa38x8GuTe3DN1i7RP2MhH57L3JVXFinAu1A4XncCzmij1MVTvdv7vh3IjWVH4+QxbnuhFXetDknSrrRBbE3s93t51P5wh4aeQY4ZSG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:59:02 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 11:59:02 +0000
Message-ID: <c92e43ca-0a62-4b06-9807-d80e1615cecc@intel.com>
Date: Thu, 26 Mar 2026 17:28:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-15-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260325120030.510480-15-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0140.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fee5c5-80bc-4f2e-75f8-08de8b2f1230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: o0EfLYXO/bP0CtlvegkYAGDP4sK+liIrPfb5Egka20YczPNnyuWxCFTQus+8eP3oJMIFEIcUVmXt1CR+gOyhGoaV5gHu1yKtVmma0lFNddqFoupTYqDG4TyZv+qy9d1dEQJ4f6TIVKEiFQUmzKr1fxuKqVnS9FybaqnlEFCRw1C6yhCFUjMvkOBMqOh77uvze9KYHxuLot1RFtCzyR3oMZ95QkZnJomW+OS2n552Pg2iZPRcHbDWuH6ZGqcnCHLza81+jQM4qnUmHRog+BPP/QtntX27GtCE2gVysvcqZjuESF2U1Ryw371zShWhwhCfz+DxTl3Y7i6bgiAeVCrisfyKXx6aghyZwmtKSDR+npw9SiQb7FP+phUKaSbaCBH9s2MuWhIAprZ7xxiWlqORt8jPTih11R4yo7XvAQ+bhrOhv5o0NLjtZrUvKOg92W8RjS27tlhs1LbicLxgp5Nn7ZnhClvQX7b2fGCZUnE3pmfJl1I7/uwDl/KmalR1dQJ2QOkgCNNcbcvVkUqmzryh2mKg0hU2cAqeZHwGr4heWxFbQ71cDt5SLwJzdkwPt6jkNivo5sxc3Iqj6njVKNfyics4ZWCNMv8mr07LYmuWeV/M81zD7VnisebPur3sEZbF4p5KSYEas+n2IbN16WFhv7Q3Ob5B91gKLwVDvL6pJqgL7m64LeUIqHnlEkxrEX9jxlt/z51dkPfCJ/QFIBRcPc83Ce8vuSGXn5udIIENl3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzR6WkZiU1FPRFhYUE1FYzNVVVVCSEYzYXhZeVJhdE5wTE5nR0oyTTRvNFUy?=
 =?utf-8?B?ZE83ZHoybWV6ekk2bFU1NU9ZbUIyVkovTTBkU1E0SytKamwrMHJlRFNtYUVj?=
 =?utf-8?B?a2MwbU93ZG5TSzdFRzJQQ241VjI1ZVowaG9ES3VFNG5kOHdrQUNjeFovSmVo?=
 =?utf-8?B?TUd6cmt2YWs0RDJvdi9LckZudWIrTGR0NG9sLzRMYjErZzQ2SS8zdTJ2MmU2?=
 =?utf-8?B?bFd0V3dTZkoyRFRXZng2eStmSEtYNHJ4YzlYSXkrS2dWVlVJMmlZK09SWmNi?=
 =?utf-8?B?SDdVTU85WE5RSUdrVjUzWlJ5bDdqQWhlZkVFaXNGK1VnSDBjV05nR292dTlp?=
 =?utf-8?B?b3EwWk4xQ0JicW1jRjMzc25pK20yU1J2N3BqVFhIL3pUb3l1dDNDRW1pY3hE?=
 =?utf-8?B?SDRRbUV3ZytEMnFGdEx0MngvS1pXRWZ1MlVoZlJKU09NWE1DZTRhRWNtWmlX?=
 =?utf-8?B?NkhiZ0VLUjN0UWw5OVFOSWhITUtHZHk1b2ZBMk00UFF2SHArSmFFbVpWZTNT?=
 =?utf-8?B?T1c5bmlxRGtrc3BGTHFFUlpjSUc0cmV5NGVEclh3bTNFbWpQVGdlZzdvazJQ?=
 =?utf-8?B?N1QwTkFmVTg4Rk1tWndCNjF2czF1bWRtOXlsQnBURDdNZWFOM3laM1FoQmRl?=
 =?utf-8?B?TlFEVTA2ZS9qRVBWTk9ZYmZEazcwb3VtdU9uMU41Z1pCU3RxTnRtR3VNckpx?=
 =?utf-8?B?WkEwZkh0RVBOSTgzOTg0NkNaaDN3MlpPZkdSV1I0MzlWSkxnZlBmcE1PWCtI?=
 =?utf-8?B?c3dZV2Q3b29takFnVjZxLzZLQytNazlycVlLKzhtQmYrNWRlU2IxNUpKbS9B?=
 =?utf-8?B?M2ZreWMzaTRhcFFpc2RVSWJ1MHcwRkZGUTUyUlVMUXFFWmRvZGV6VjEzSHgy?=
 =?utf-8?B?WU1LQ1NPYVZTc3c0Y1VTZFpmOW9PYXB6ZlVBTEJWVXZTK3lwNWlUbjM2eFVq?=
 =?utf-8?B?OWY1Z3BqdUdwSHZ5N090OTBUSTVBd1BiRzFjTFpjc0Y0SjU2SVliUmNrckN6?=
 =?utf-8?B?dERHQSsxMmc5M21yUlZ2bm5za3VMREx2K2ZzZlM0RkZoZUVXUHJPbFpkWktE?=
 =?utf-8?B?L1pyM0RFcVpaYm90ZWJMbElIRVhpVVVYUUFvdlpSQ1NaL2hLTnAwVFpHVkJF?=
 =?utf-8?B?SEs2REdIVzJuaERTMW9VZ2VkaHozVnJmL1E4by9rODNrMStCRjlseTZ0TzNV?=
 =?utf-8?B?Z0ZtdVdiNHhadThlRFZwVzQwMy9SUFpmdy8wZ3VaWlRPYnEyZnJIMVJOSFMr?=
 =?utf-8?B?TmwxNnRIb2IxRGhDbTE4Q2hhZkppOHhETEMxL0hYL0djemVpcXhVU0d6Tllr?=
 =?utf-8?B?RExlUDZkV1hMY0Vvam0vcmVjbjZWbml2OWpqcmhoampqMVZCanRLLzZBSnlV?=
 =?utf-8?B?TnJmQjNEeXppZUVlbmhnaHQ2SU1MNXB3anB1SDF4cjcwMmRsSDdsVGhNcTFp?=
 =?utf-8?B?K2hKelN6UGV6MCtDOUhPWHdZMFdvZEQxdzgzY2dweTlNbS82QTZwQmd6TFRH?=
 =?utf-8?B?aEhBQy93Y3NqUlZIcDVVamxvMXBjK090ZGZFN3pCaGMvZEl1WllzN3VnYSti?=
 =?utf-8?B?bHNpcSthZkxoSjFRNjdFVnlITUpEZ28ycnh2VFVMZkdiL0x2VFZMSDIvOXQ2?=
 =?utf-8?B?SDh1eXE5cFZMRXBGTHBCVU9UK2t1aXlDV3hhSWVXMlZyLzdOSmloQ05vbXFj?=
 =?utf-8?B?d1VLS0Zwa3dOdHdtTWlHVFVWKzg2Qjd5WHEzUDFSNU9sd0k5RXo4Tyt4dWow?=
 =?utf-8?B?OXZTSFVsYytBaWpEem5OZGl1WTMyVEpwMkZMblNvOTZ1ZVFNVk90WFJMMngy?=
 =?utf-8?B?SDR2czIvejAxcktnbHY4SnhsZHVuMDVnVGJpc25OdTR5RXJTc0Fuc01zcXp1?=
 =?utf-8?B?T29NUkZRSksyNFl2TldPRUxLa0l2Um0wdDhTZTNZeHIrand2MlRRaEc1WFpz?=
 =?utf-8?B?c2x2TSs4c3ZLNWhCbVlYcEpoTlN3SmNGWG9aNVk2bHRuNlFLL2hqOEdwS0RS?=
 =?utf-8?B?czk1MURDY0ViNFIwUXI2a2swOUFJWVVPaGFCSHNZWFhqaTI3TFAwaURuZzdN?=
 =?utf-8?B?dHQ0Rkt4OCtRN2djWVlzMFIzRi94VEthcFFSMDhHVE5Ba2RnaFludVZKMG5F?=
 =?utf-8?B?NDdHTUNaa3NQR1JMV243RzR2RkMxTXBvOExYZmhFUTNiekNPQ1l1dTJsMEVv?=
 =?utf-8?B?cnF2M3lKMVJuNFdWMUloS1l3c2YxQmlmVmhHTEVaMnpXTTVtQjV0dlJDaWxi?=
 =?utf-8?B?OXVOR0k0Q3Q5UWpUaUJUOGdCWGMvUVQweEFPOTRmK0VRaVFpb3FiSkl0Sk1i?=
 =?utf-8?B?NVAxdDJOY3ZTOEVSblhVWHJkTkk5ZUxtMW5pa2w0ZGx1cDJ4VmM5QT09?=
X-Exchange-RoutingPolicyChecked: J2F+eiK3Imw/cBGo1iP/VyqPqYDqmmZjMMs9kFwzL0ztoS5XJTdIROPqtVcXndDKJAJCRnQ9I+b/7GoWMUn4l88+tbH1k/JnH3nZRVlel7ESzo7HymAyuBmVGC4s1OIiP82oFTNDYocdX+6THP9S+wcid91ygdvcbti3roCTx5G57eR5k0dbV1lRkldDlXJuZX41TGhnrXnUPRYXt01KOISAVeo3nvZqGqGHQmw0vYxvRHrWl5h0HUxspFl4s1/O0tenJcviNnLoj1tpSscSt/CFyAgsxoTLOZ5XQpbJF/enqNhKmICsNtU8YX3r35tw8gW+fLKUuMXXCjSz4Y/MDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fee5c5-80bc-4f2e-75f8-08de8b2f1230
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:59:01.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jjcsf16/4gQrx6wrsjUulxq+BGNXVlKhG+fqSTdxIqEkYC37amqgWXFDVm0c2Np8rHJDVeWv+blLzX0zkT9NDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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


On 25-03-2026 17:30, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Add resume handling for System Controller to support system (S3/S4) and
> runtime power management transitions.
>
> On resume, restore SoC remapper configuration and mailbox interface to
> re‑establish communication with firmware.
>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v10: (Riana, Umesh)
> - Added sysctrl suspend/resume handling
>
> v11: (Badal)
> - Remove explicit SoC remapper disable on suspend
>
> v12: (Badal)
> - Drop empty sysctrl suspend handler
> ---
>   drivers/gpu/drm/xe/xe_pm.c      |  6 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
>   3 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 01185f10a883..d4672eb07476 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -26,6 +26,7 @@
>   #include "xe_pcode.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov_vf_ccs.h"
> +#include "xe_sysctrl.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   #include "xe_wa.h"
> @@ -259,6 +260,8 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_i2c_pm_resume(xe, true);
>   
> +	xe_sysctrl_pm_resume(xe);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id) {
> @@ -670,6 +673,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>   
> +	if (xe->d3cold.allowed)
> +		xe_sysctrl_pm_resume(xe);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 84e3b70043a1..96a961d470ef 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -82,3 +82,25 @@ int xe_sysctrl_init(struct xe_device *xe)
>   
>   	return 0;
>   }
> +
> +/**
> + * xe_sysctrl_pm_resume() - System Controller resume handler
> + * @xe: xe device instance
> + *
> + * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
> + * Restores SoC remapper configuration and reinitializes mailbox interface.
> + */
> +void xe_sysctrl_pm_resume(struct xe_device *xe)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	xe_sysctrl_mailbox_init(sc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index d5d8735038ae..f3b0f3716b2f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -17,5 +17,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   }
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_pm_resume(struct xe_device *xe);

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>   
>   #endif
