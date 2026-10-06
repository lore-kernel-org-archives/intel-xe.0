Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291D1CA5FFE
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 05:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CF210E030;
	Tue,  6 Oct 2026 05:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTdmwPoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D5E10E030
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 05:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791265116; x=1822801116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fNye2TxsBrzq4v9VKbU4pzPBdEiZI0mFxp83GK8Xf0c=;
 b=JTdmwPoEe85Wp4i9GhgbyPF9mK8lRVQ3tuHwCrCr4zmC7qZB9zLdlfga
 Dx52tXhukwAp8ypq4ZdN5gLVAk8T8K7dOeCpuabhoRPMThfMTkAcxyX8N
 /t8KiV/OjNL1nEC5mJOQq5JkQcu/AQb3EMkeBAht+SJsnUQLxeXnKPw22
 32fqP90XNb0jYgnvBejVorvdp9BCpACDi7/HF8F1YBb6ovvgoYi1sO6Qk
 etNLQQoYo1TaXzd62n+4enJlj+JQCriDF3vKwtqGyIs7zw/AEezjFMU9t
 Xfp0ga7abCjJ/dD1H2Neq/uXJW6T0FuYmp12fUsHS/LrJnpNCdlDiVLbi A==;
X-CSE-ConnectionGUID: zUIk8nlwR0aIFSqwLatNwg==
X-CSE-MsgGUID: i+kl+7AMR5udEuNsTq8Ezw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="117463032"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="117463032"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 22:38:35 -0700
X-CSE-ConnectionGUID: uOgFDjQwSiG/5kFhrVx66w==
X-CSE-MsgGUID: R1bACXr9S/qlz8zIjgEWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="280346339"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 22:38:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 22:38:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 22:38:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 22:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wY7JH79SctBAmLLwPL55w1uznZRdDOSdp968V7kFWFRstZMoRR4XIdVh95H3db33nwX5RjxMWnX8AMrGHN/wzx2/Or4ttj8lNTQ5DetZVkOzHr+FTW49DnYP+wqI8m6UYe8oZLg+kZ7R4UCjotdXfl1XqoyANzglZYAREcr6Klc6D8Rn/D+MvnEAeORWKqOy5inm+pIb9qViBS/JfbfATXU8RTDyivigwn3ZBKz5MmkvFkEYDXO+vAYR1OlyNJCQcs0QHdPMAihcCVgw7dwQR4B7Ufa9O8L+9NvtvAAPl1BW2ZYV3n+u5QIJ4PiOnf157vQO7NoQBngkjlTqdjhsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5iLxtQlQO9XmbCgnuirJD9eOS7mveC+FoNBRacU7lU=;
 b=a0qTNxVIyNEX83d93JFola03y/YJm2ESGchwBzmfzgepPiTCrFNbIofaDswSzOxppw65+VVfajzPo1gOSyFmlF92uUdh06JtCaxlLA2Gtg/Phmm4n1qBIWpSKrJDwYFGDDwqMoPR5pBLHD3AoCvbTc6HdxCkrQx/LO2BbIV3iGiQdMJg/Ul9c3oWKr2Xd22m/kcMdAkz1YvxubOWjfjSuSRPaF1xJNE+281SvorGzdn0bj8tjCrL046OXjNVC4F39Kp9Zp/VyzR4FydrPBmdlFTfby2ifcwn1ZMNebGrYfQibZXkPB9djtsdScFn3WdyHRWuwZgPd9RVngVjhhQBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA3PR11MB8966.namprd11.prod.outlook.com
 (2603:10b6:208:572::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 05:38:27 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 05:38:26 +0000
Message-ID: <b848ad69-0bb9-4b73-bb7f-5cd22a43feb3@intel.com>
Date: Tue, 6 Oct 2026 11:08:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/oa: Zero OA buffer at allocation
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA3PR11MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: b2dbbe65-db26-499f-5f14-08df236c0a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fa0sPMC6WPrFIVoi6LNpvD7AY1KeDlsFjFQR9nM0GktVQnt6yh4ALok01OX7CX5ml8TNQf/TNkestg8i44qUILORsFUJIXhbGIctSa+hATq3Swh23pEkPrL1wbKs2XG/65+zBgYA3uA5VK1sYoevvKkPOf8jh+hHjmKD2DueQKxaTPjcwQZ3LVX/nH3iwwcddh0MqqmIC7S5c3ltv++zoinNByaNrbrWrte/KMdYNXGJPK9yoTd3bmAKYPUyzS36RBhmIdtkep0mh5tXmK4so3KW0M/h6c7DZxe1Wo/glKn3GE82bw22vd25eSSnXezhA1l9bo91U/nH47aaaOZGfqhXg5HSqMa2uIoNtxB7om4sFAR8qQ8RSq7WoNvFTKn61Vc+y4DN/MV98bFYk3XWqT3OQTJXzns2OGR1wxA5E9pGtwlR3K4oVf+9pjqe5vHRvTNinRHtfKTJirwG3nI1T7PzI+k7b8isQyPZHTOM1OO27ztkHcLDDAAYTOwNM/cxZNVb0xVQiT3c1toIEJTcXkFNVRJi95ev+lCuGNXfVUG6mF3m+JPr/czeeQ94TdLh6EwBrF6oLU5DWZAecck+xhg0+4R5/xiyt60mSNz3qBYmALysosVIVFQF4aTsXdr02m89ORnHqCP+J3zFnpgwJOE1Uwl5GUL695tlMyT+OVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGkvSk5Jem1HdEtSVUdQbUtPTG1ObjBWcXluUGVYTVcyQ3Z3T0NiUmh4dnNH?=
 =?utf-8?B?MmtCRWE2MW42M2dmcmlFazVYaE5PS2tCNXBiaThpaW9Fem4xL2xxV3Qyc3NM?=
 =?utf-8?B?UXpFL0FZS1lUOS9RSFI2NzVUUjlPSGJuZGFYSGU0RXhtZlp4UzY5dWVYL2dj?=
 =?utf-8?B?MnY4bE1rMTg3SDFVeFMrbVFrSTJsR3E1Slg5SUx6UU9BR2pRemYrWUU1eTFW?=
 =?utf-8?B?dVVwMC8zL1Y3S3AxdVpIaWJGcjdFVGVyQzNSak1HRXhMeHg4aEd6ekhDZ2t6?=
 =?utf-8?B?NEhUelNvck5idWJVTmFaaldPZDdGKzhvd05xcjFQZm80cUJ5cVRBVDN3cERO?=
 =?utf-8?B?dzU1TVVyNmlXRjB5bVA1YTQ3Ym5QaGhSRnppOTNGdW1ISmViRE1NbENoM3BF?=
 =?utf-8?B?Ry9YK0twb21ySVh2SjM0MzdSQkNyajFrR2k0bFA3dnIzaWExNFVFOFBlbHJJ?=
 =?utf-8?B?NHQzemhmYS9NdDhkMm1zS21LZFBQazFrUThDMFhWbGRhZG5oZzlHRnN2WEZ1?=
 =?utf-8?B?c3ZId2dpQWwwaFdzWGwyZDdRNjVkckZYZ0NRL0c5LzZ5dWE1T2lRSm5OT1NK?=
 =?utf-8?B?TUVLazB3Q1Yvdzdld0FVT2gxWFE4NkxzWkRvZXBKdlg2Q2tvUm5tK01icHhO?=
 =?utf-8?B?Z0FxS0JZRkZmZEJxVnhqRUJSa0ladzRSdG1PUmVJZXpKM0cyTkI5T1o4SHJN?=
 =?utf-8?B?d2ViWVRHa2laWTJTK3JyQjJ2NzRUL055MmxGdnY0cko1Szlpd29kZ1RUNEMx?=
 =?utf-8?B?bmI2OU5IcVIzYkMyWXpsTXJCNncrRVVEZUZVL0I3RzFnbTRrL2RkMjE4SXEv?=
 =?utf-8?B?MkFuZ2NnMWNwSE9nMktIWkhEWForZU5Mb2NBeVljOU0xM1QycHFBc2dZUmZa?=
 =?utf-8?B?Ykt3Z3U4ME5oL1FNOXdzMm9Kc2dqcURjNkpUcC9xMXJWNkpFNWZSbWlqR0tS?=
 =?utf-8?B?TUd0YUdZUUVwV0k2TkNXNGV3R0JHak1Kc3ltS3FRVGEzeStSa3dQWExBck5v?=
 =?utf-8?B?WXdUVjJWZGZqVFR3Znd3NzBOL2hrUXdMVEp0VElUSi8xUFB3QWxtbzIyMjlq?=
 =?utf-8?B?Tkd6UDkxMFkyY0dmMER3TzUxM1luOHp6VE1ySXJBTm96Z2FzODhSbkpyK1pP?=
 =?utf-8?B?YnQ0WlFkQXV1VVJUMmFDeElnZS9wc25laUgvbzNJUGIzbmRVQ1cxSHlEQVlS?=
 =?utf-8?B?U2wrMUZmbC9YUDVCSWt3TnVVNkpyVzlPWXFBYnU0ZjI4eEFDUVZKNVA5NHZL?=
 =?utf-8?B?N2tZYndYS2V6VEpWc3V6NXhnUEdvbUtDTythK0FFK1Fnekk3dEpBUHlLbWpP?=
 =?utf-8?B?VlFvczJLM09ld0lLRnY4TkM4K2Q3SXY0ajJKWjNTbXNFSE05QmJ5QUt3V1VT?=
 =?utf-8?B?QVg2bFB4bml6R0FQcm1UbGhTK1owR29RZVVuZDVIUjg2eFhTdmU0a2IzdEI0?=
 =?utf-8?B?VTAyQm1DbUwzQXJrVWljRi9KYVVDa1Z6T2EzTnZJbyt2TGhKaXZOUSt4eUpO?=
 =?utf-8?B?S0xjV01iZzdrQ2tITnlCMERjWkVNTkJ5MGJsd1gwSHcrRzYvVmN6bmM0eVc5?=
 =?utf-8?B?b0NiNEFsM1lYcG8vcHlQMzZZZHBIR0dSOGluTUZiSkQwdEpYZGJERjlFSXJa?=
 =?utf-8?B?US82WTRNNWNrWUcvSzlGNE0vTTN1d0RGcGlOWGdZaTZ2cFpoZWJVNVoxaWx2?=
 =?utf-8?B?S3hLWnRMN05RWllHTVlvUDhNbExpRHJtOVF1eVVUZVRmZGl1RFIyVkliMk5Z?=
 =?utf-8?B?UTNMVEw0MHNnZGRpS0pDeFp1T0Rqalg2Y2hVZ1VRSndGc2F0SEFabDlVTEl0?=
 =?utf-8?B?M0dnZDZ3TlBLWVN2bmkyc2NmZGRuWUkyRjQ0cVd3a0Y2dkRlN3U2Q3dxcC9V?=
 =?utf-8?B?RnNXdW5QelU4VWYvU09kY0x5ang0MXNwS2MwRzZXazV1c1JxWCtiS0M4YjVs?=
 =?utf-8?B?WkUvOCtOY0c4bU5qalNVTHNZMjZEakpkNWVmWEFadGZYUE5zbTNNQWVPbDVu?=
 =?utf-8?B?NHgyN1ViV1lPR1MrMjdtRkJiN2tyRnNJTjlMMjBMRHhCWHJzcHU1TDFrVjBG?=
 =?utf-8?B?a2hmcGVRT2hNZXBzT1UreC8rUURqQ0RVUGRYRFRjMlJYSXdsMndCdjZpUkh5?=
 =?utf-8?B?RnU0OVAxL0NablBzMFIzNk9HOE4xOHZtaGh1MGt2SjZ6Sm9TYkNrVndTNmxD?=
 =?utf-8?B?MUNWSFVRemxWWGtzdDY0TjNtM3FkaWRRcEJBYWVhdC9QYXphTzg5V2NjVUt6?=
 =?utf-8?B?aEVnQmxvbFBaUXE2dUc3T2laWGZja1dHc2FSWk5GWE9kNHJXaGNwUjJmUTAy?=
 =?utf-8?B?SHBsSzNiSFUwbjRxZ1pKT1FoOVM0WnhhbzZWZ3c4a1pLRWhKVm84K1NyVElo?=
 =?utf-8?Q?aenE1eKGdelsfiiA=3D?=
X-Exchange-RoutingPolicyChecked: zyWhgMuBsRCL+gq+63zIIE01hgeQF2hExapkzIhtqQqjxvhNc4R78IQxwuXFuFkjeSn7QpTdh5vaT4+Npf2LyPi9/5WPA7T3lhkPGPgfHC7J0dr+qYz3zET9WveNRpZSbLJYlGnzBVsFE2MtNYfz9CADiy5DC3QbIyx4FNsoXOs9TsafqAQwwpeKVtf5VIy2iKzls6RJNM5XaWwZS6BxWXIAwrvVtSgQ6XWxNikvHU8k9PiO/H05WokrdGoc59Ny0W0putt2cwt0krUlOpLzVbr+4QFt44LqECYUAf6dOW954wyen8+0nWIHLw1uoUooMthtF8QIDf8rtDPuVvGNBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2dbbe65-db26-499f-5f14-08df236c0a73
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 05:38:25.3719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oweak93thIzWFZ3fkHwzDjb91utzOj3uEr4rJ48OHvGiC3FrMYx1V76F2Jt/qNAx3aWOl5qgOBAJ8ZjwD/4UKZvF5VptbkovUX5SzxHvGc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966
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



On 06-10-2026 07:33, Bommu Krishnaiah wrote:
> ttm_bo_type_kernel BOs are not guaranteed to be zeroed on allocation and
> may contain data from previously freed pages. Since the OA buffer is
> mmap'able by userspace, this can expose stale kernel memory contents.
> 
> Streams opened with DRM_XE_OA_PROPERTY_OA_DISABLED allocate the OA
> buffer without calling xe_oa_init_oa_buffer(). Zero the buffer at
> allocation to prevent information disclosure through mmap.
> 
> The existing zeroing in xe_oa_init_oa_buffer() remains necessary for
> zero report-id/timestamp detection on enable/re-enable.
> 
> Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
> Assisted-by: LLM
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a3484e943c55..3bb8bbef4c37 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> +	/*
> +	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
> +	 * hold stale data from previously freed pages. Since the OA buffer is
> +	 * mmap'able by userspace, clear it here to avoid leaking kernel memory.
> +	 */
> +	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
> +
>   	stream->oa_buffer.bo = bo;
>   
>   	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);

