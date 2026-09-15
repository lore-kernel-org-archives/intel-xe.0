Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DF3C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 12:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B619610F38B;
	Tue, 15 Sep 2026 12:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+7wtVGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C8910F38B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789473824; x=1821009824;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/im3xIUI19WO3CaGIYCPg3AD6fR+vwg18f1TTaOxBms=;
 b=f+7wtVGtRXAYYXP0kG9olaLyJjAqiS9Y6s6/KLOMisi04VoRITXuf4HE
 KtiQAxTPJu7KrAr924scgNVatGE8nxNAiuk/8rk7Hbr4f7xOjcVS3z3i0
 1vBgM9nTbFjryWVp5RbuwrXIFIbr3Iho29icHZRuycf5wIVdjXYNYL6du
 ONya1xZGUDn68FrdhrPeFJhMPiwnvIDeoRT4kYbgZepL93HYorZKAsR5V
 X8DfYucJEdPEHmIlbYOPvVnfzgOMRb3rZddt+kqD/FS1ACYgU3xvuLZFL
 aQDczsc1bJmxaPBV+198r2pYL9UQqzq819anZS2Nt8kERDvVwMjprd1Qj w==;
X-CSE-ConnectionGUID: w2Jc+/0CRmGQKZQb7wlfvA==
X-CSE-MsgGUID: ZMBz9aUxRoatHDaW4BVMaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89849494"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89849494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:03:44 -0700
X-CSE-ConnectionGUID: kP+ffeUfSaW2vlSokK7NSA==
X-CSE-MsgGUID: /Ju8IOZrTXO5zji8vLfFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="274936630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:03:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:03:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 05:03:42 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dszgEv1V2h3Go4gDhZsbhjw2VjL5MON0u/NAbF7BATGs8gSv2cG22HfnRpwT2JKeu/D66MPHRFTtVXztSEqiU/pmt+mJw7bdSHmTagVblYf5x+h5TpLrKSHmIemdgqQXGKtFScifEtiWRZpyJvbwwllZKMYNsfGUynCEpbeK3y7TyyNPHomYKqT4ZG7fOex1cfiTneKCk0fa+lse2TFWGGY0HdG2RG0Wa5yWO5wzl0n4rPdOCgxFfi3Syo7dTi/EXQHgVLQ9S+8Eo/Q9fuotj3N2M85KDqb/uOUKZICCC9rbjAH8+0Llt+MVokXkn/CfZMesiScpVOkFb6hqNmIqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xbf0+UKwG+G1pro7eWvrMtQ99uWsfd2RoAzTm8jW5Ls=;
 b=hoikvh1w3wpK2PQ95qx8DtNwzPrAj+4sxiKqCQAyROuhlcY0s1/MYVEmG1Kuia+0AaInmRuxMaGqu9jk6mAyT2k7muDaOKctH80+x1A/6DRkGXK43UA+gec+4+MaD+3k/F7A8zIR1V8uXu0cEcMJTv53SacKz4vfPDXNzssWg68kOgNVB6ljtcHivixewPf5crds0ICpYsIwf4h+0O0dd8B5qmbO4QgqOIBnbGulI7jP1wHOBw7jJZdlB5L3lGDBz2Eb43DhIag0wKpot06Vrd6xSp7o/djx3TPOdpH6spijlvNoedsZt4TJYGPvKSqWCWkfBvlkOj/YsWauWzmyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 12:03:33 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 12:03:33 +0000
Message-ID: <6d00a237-1785-4593-a4f9-2efee92482a1@intel.com>
Date: Tue, 15 Sep 2026 14:03:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] drm/xe/ggtt: Avoid integer overflow when
 validating VF GGTT range
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
 <20260915071159.51402-17-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260915071159.51402-17-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::24) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CH3PR11MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 8192d6d1-ec4c-4d14-1438-08df13215d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 0E8kQaYfTrlMEzXT+xpaFz+v0MMt+RZg7zP3nBH79cEFP3c/iADXFmQU6XXKxiSn/oZHXVeuFEhVVfmVjIABafxB4gWPPUA3cSCo+AKA349B6UCP8LrlOZu/e9Z23OojEwVmw27iTAAaoBNG8ert7kDYBChPqqVXvCxw8sXUUFZ+YZZeuXzZuxNAqnU2ZdzFBiOzAwOjI1krt9uPwusTjSxY1BVSPWUnuRu0WZ3CCndcIHMpVyBYPUprk5xv6N/ipKA8RY19yP8M9AJosSOVQXCik0DWvcU0y7z61KYy85w9IFqdPmxrqw3LmYdN/Xh3kbstYDaseTof6CRAPXtGuC7as3Uvv3n/VYedOrevBNF2V31vzFa99iAgCFqA4Jz89X4Ifrn94KbMRhp5VfOvw+HwvAL/hoS5srVWEm+0B4/WjYkUknA5nUkNG4+QUGis+W8F5HifXdhHokpID3EPDqwjXPNk0OAJqBt1xQ+5RvsWBkH16oI9zMkTPd5BTfLTQZcwsnwIModxBhoDWJ/jqDH/rtYbOELSQ7mxDmV0Ggoy3NwOppEM0g1r61Ct3zM3BnJJYzl2NWtJeFkEVaB7q+bsbShHcipOFtRQi43+EImTUFWtoexXmZhZqk/Fdu2ugLiHV9ALfYBoavq5Dpfy178gR+4L8gVjenT8RFNVjFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGhwSExXc01DRUlqUWxNZjg1UVJ2REkxM0xJTjVGVUVCcW81RW5zaGF6NHJS?=
 =?utf-8?B?ayt0Ty9UbTZkWE11Z3VNL2VYeEhFdTIvY3FtcHRyb1gyT1lHVUFhZEs1RHoz?=
 =?utf-8?B?OE5aa1BuQ25COEpYVVg1enA3RUErUklZdDVXOUNIQ0tZM1ZKeUlLWTl6bExH?=
 =?utf-8?B?TGF4RXRLUUpONC9NdC9uS01EdEljNVQ4amV0b2ppcjIwYlVzc0VPU3hmWXVq?=
 =?utf-8?B?UkZndW1xMWN1S1Z3NmF6bWtpTlN0dENOYTZGZlVLYXZDNTVhZFZLUGw1QW55?=
 =?utf-8?B?TFRBa2pGZW13SkkwQTJYVnQrQUpxQ0NxTklFQTk4TjdOZDFQSHJGRkR5MFht?=
 =?utf-8?B?UXlYdUtPRFNTcUNBclBaZENkR3NaRDRiLzc4TzRRTklFMDdCMmVraytpa3RF?=
 =?utf-8?B?M1FSdmFzbWt1Z3hDUk4wMXQvd0l2RHNyREhYTHJVQlpGOVNuNklWc2V6MEc0?=
 =?utf-8?B?Y3VPVHpjZnhpOFFydjlIWHR5bEFLK3JtcWNtVVV4WWxBRUx6WTYrSFpQSU93?=
 =?utf-8?B?R1JsbEsweEs3aWJ4S0lsQVg0NFlxWmNUbnQyUXBzMXI5Q3BpRzV1R05TOUJV?=
 =?utf-8?B?c3dIUUJjd1Q2M0hKMXBqMCt4Wkl2UGRDaCtrbDNJcHU5alRnTDJLaGxEemxD?=
 =?utf-8?B?cVJKR1NIbERQamdLYjRsMENKNnZXbzlSMzRaVXBJdjFkT2ZWSE5KTHJQR2kr?=
 =?utf-8?B?OStMckh2YnAwSU03eFpjeDBmM2lMQmo3bmtSUGRJOUtPd1piVGQ3MXd5Y0pM?=
 =?utf-8?B?djhjbjNxV3pxVHJTTGlldDFseDJYTUhwZmxaVlVuL1VwczZiRnZ2VG4xQVE0?=
 =?utf-8?B?R2xxbERkYXBvZTU0RTFDQmJtMjNYM1V5R3Q1ZHhjNTNleEl2SGxBUXEzYWdo?=
 =?utf-8?B?T3Y1UkV6cXBFektTVWxMOXhVakRicnlGaHJsUnV2Tnd2bSs1SVROS0xKUDQw?=
 =?utf-8?B?TWFtMTFQOE5pWU5ZYjBTamhVRXg1dXl4aHo3NFE1ZFdYYmVaNVAyaG9vTzJ0?=
 =?utf-8?B?cmk5cHZzaWk2eHV0T2hFOVBKbSt0OEZub01Bc0Vqb3JLVFNQNWwzKzJQeno4?=
 =?utf-8?B?cGtPZHJSUzVRZjl2Nk1zOWErc2IwOEMvVDRNUHhYUFYxeVRZWVlsQkdWQVNq?=
 =?utf-8?B?RHYzUy92a2NUN0svNUdVem9ialBxNUxaZjVBMFF2UXlIRk0rd05OekN5VXdD?=
 =?utf-8?B?VnU0aXcyaitLT09QN081bWxibG9ndEhYQ01uVnBqL1FpQU0yaGZVL3RDN05Y?=
 =?utf-8?B?amdQQmRPWjVhVjhhMDIxMzZBODNxZy96Q3JybmdxNTRVbCsyN1cvMUMvL3da?=
 =?utf-8?B?bEtUMmZIWTdoNEhoYldtWVFCeTBRdTNFSUNkM1pzYWg2ZndxYUxGdFFnbDd2?=
 =?utf-8?B?NlNEM1Bsd0h3L08yanJYZlZIeVdUVVpET3BmOSs4aG42TnJIZFY5cGRSVVZ4?=
 =?utf-8?B?UTZWTDltVHJUUU5XakgyWDZyMFcrRnYwMHh5NGZ1aU84d1lrV2F6OW9aYlY2?=
 =?utf-8?B?TW1uSjZ5Nk0zYThMTGZGQmQrMjVnbDRZclE0ZDZYemJ5cmtVbmJKckY0VWZr?=
 =?utf-8?B?ak82Q21zQVdoZll6QVp1QzNPaWdrblI4SkxlK3JtZ3ZQZUw1WFFCdnlHVTZY?=
 =?utf-8?B?U1RJNVY4Y1dUdnBFcGZ5cHhxUUpFeG1SWkR1ZEVuZVpyK3BvQklXVmcyUXNF?=
 =?utf-8?B?aEZ2OGFxREVYNit2cHBYTDA2TXB3cFh2cTRjNWt5M1lnQkVzTGQwT25LTEQ4?=
 =?utf-8?B?L2lhVC9kblJBNnc5VjNhT2pSQklCMmRrNHJhU0s2U1pFNTBCQmVrRXlFM05u?=
 =?utf-8?B?MDc3SWwvWVJkY3doWStiSjNZL0ptd1VOUjduRklrRGYzQUcwcGwzZ0pkTjhH?=
 =?utf-8?B?TCtnWSt4SW16bkdaTkpWZ3ozeG1HVjJieVQ2NDJRVzFPSUtSRnhuY090aWRE?=
 =?utf-8?B?NDdnMXNoL3AxMGxBUURrU2cwb3VjQ0UzKzZkODZVcWxNTmdkK2VQdkk0alhR?=
 =?utf-8?B?aGRtSWFFWUtqN0pKMG44MnAzdXNIMnhrUFR3SzcwYzdBK1JIaEZ2YXd2RmtL?=
 =?utf-8?B?eTFTMzlzWjk3V1FzZ2ZGN3dITGo3eXdTOFRUSVFCcDNHbzB6Y3NjTGY4VWRm?=
 =?utf-8?B?ZGZFVTNxWXJycEpWWitVNkJEU3VIMXRBU25DeWdtL2Q5d2phM3Z3Ym1QaXd6?=
 =?utf-8?B?WTJTTDdWNDl1bXFxc1RQZHZRZ3lzeGpaTmsrRnpKYTc2YWU0WERFWE5vSkxE?=
 =?utf-8?B?a2tZR1RFYmZFOTRyelk3TWRTMjV5N0thdDBkZ2FkQm56eEgyVUJjT0RZOTlY?=
 =?utf-8?B?VExPUVhnWHdnZ2M5NEozbE9ScjI4QUEyV3YrZm80amR6cEEwTm5aYmNMRWV3?=
 =?utf-8?Q?MUSec7s5zD+BPqyo=3D?=
X-Exchange-RoutingPolicyChecked: feaVgGT3IeDbKreTxysGG0Ct7Xol6Dnx90+XyXREz/0RtHkxTOx514AV9cgDx1H39Ss4hCRFQ1nj+1tdN6s3k8VN+Z7WtbTFS/jQ9xMgSYjOwZhlBUZWpmpu6wCzb3urnV5fORMVqO34NfigI+EwsDd80v5tbOesAfxcf43VFZTXZeBPghExW3+nFg1IAOCHjy87WYXdGPmgoM7N1J059AaRIAwbJum+u5JkT5iK8iHpHJpgEgc2woQd1kvluIIzjnWSjxleyw+nrVnc+ROBnSEuyi0TlSNP/oHlavYqOon0ThTFlsaghrj8FtfSEzHk5hu0FF2Idf7QtvmrDIvgrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8192d6d1-ec4c-4d14-1438-08df13215d54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:03:33.1914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKIJxLCr0NVhDjLXKUaPiJqpBGwPxGephz2B0WlM/4UJpD9tImY+hRtTILYG0QFtmRwKx7m1vjF4kqDp9X5qU5DV4hPQuOuCh2HNNQctMpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8496
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



On 9/15/2026 9:12 AM, Satyanarayana K V P wrote:
> Use check_add_overflow() for the VF range check, and rearrange the
> subsequent clamping into the subtraction form so the expression
> does not overflow.
> 

Reported-by?

> Fixes: e904c56ba6e0 ("drm/xe: Rewrite GGTT VF initialization")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7cac01cef1ee..d65929720704 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -8,6 +8,7 @@
>  #include <kunit/visibility.h>
>  #include <linux/fault-inject.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/overflow.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_drv.h>
> @@ -394,7 +395,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
> -	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
> +	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size, ggtt_end;

as you're touching this line, can we put wopcm in a separate one?

	u64 ggtt_start, ggtt_size, ggtt_end;
	u64 wopcm = xe_wopcm_size(xe);

>  	int err;
>  
>  	if (!IS_SRIOV_VF(xe)) {
> @@ -413,9 +414,11 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
>  
>  		if (ggtt_start < wopcm ||
> -		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
> -			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> -				    ggtt_start, ggtt_start + ggtt_size - 1);
> +		    check_add_overflow(ggtt_start, ggtt_size, &ggtt_end) ||
> +		    ggtt_end > GUC_GGTT_TOP) {
> +			xe_tile_err(ggtt->tile,
> +				    "Invalid GGTT configuration: base %#llx, size %#llx\n",
> +				    ggtt_start, ggtt_size);
>  			return -ERANGE;
>  		}
>  	}
> @@ -424,7 +427,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (xe_vram_needs_64k(xe))
>  		ggtt->flags |= XE_GGTT_FLAGS_64K;
>  
> -	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
> +	if (ggtt_size > GUC_GGTT_TOP - ggtt_start)

shouldn't this be moved to !IS_VF case above ?
and maybe it also requires check_add_overflow ?

>  		ggtt_size = GUC_GGTT_TOP - ggtt_start;
>  
>  	if (GRAPHICS_VERx100(xe) >= 1270)

