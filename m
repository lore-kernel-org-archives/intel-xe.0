Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53777C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E972F10E092;
	Mon,  3 Aug 2026 21:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebQwETEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968D110E7CD
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785792353; x=1817328353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RDEoyvl1UWynpsRxIcqBrMqOSaamh+wyKCt68F3DhH0=;
 b=ebQwETEXcOrsDsHkYH100L2p81DXwMT7iKEA1xSrH8MpuITTjc+kcA/q
 zSoPt8pGlEE0G4JP36hnZu5vRi9mnBUrH3B9K8Ukuj442z989k+qexOnB
 SYFZ6HWNe9ZgsUCYA6mJcZ2syjcpUa4ULagyIAAMIgNaaGkYGnRNPtSHq
 p8qDc6OfmfbfDGZsaPkSl84ZDXQ0tcCxmIzVmUURTBysT8Htd9YKgANtF
 XDxmhAc/LgdOziS3kSUDlf1wgrC1HAGMr623SnN3h92IsLWNN8kH69+Cl
 K7ka7azu9TNMFHyRnYoUh4sjdp68BF0PDCgHvlzk+qmpbytpFyQWeKJMh Q==;
X-CSE-ConnectionGUID: sTGO+0HeTIy3/H2j5njeHA==
X-CSE-MsgGUID: 6USbOhG1QdiI6J/8vizKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86214183"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86214183"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:25:52 -0700
X-CSE-ConnectionGUID: 8IW8zVRMQW2FN7IqdiA/kA==
X-CSE-MsgGUID: WacXALlqRDuWtvORUEi3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255038697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:25:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 14:25:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 14:25:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 14:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9R6uhmVzppYuY2dOesh6udhhlFDS5XII341e+UI8wxhsiZPNozKpeejokB8FnA6kBJJNvzK3SVQ4Vv2YDpEVMTdrH88ZXGE2+38VgnKP1ZsHjbrP27vf32P9rTKTVhobwFKlgMd2i+Qjr14flb8YaZv2I+EBjditC/d1EP5LQJAUkV6YLmpYco6qj2FYANHyRdHzItzZMbYY3MPNglvMLEQV0Qxa1gAT7FaVXYUSmKNdUZCnnITTZ1TsM5Q/bAEvrBR7/IvKrJ+d3Mza0GGUYDuhY4vIR5160182k6a3Q+1tqhdUDlc+YLmsQjNaX4LDbwwjiiAQ8wzBG6qyfJlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcOwAEILn8Iek/tcwHObu6AL2LOeEbawJKet0PFXe8w=;
 b=p/pDOriFlxc0i9NIDVmarg4Wae+6bWUhT8APMPU0RYtn2BUdQQJxpzLbheTC/rwYzVHWaOsY1MKtLr/MuaHtrmdaDdTO0Oy++7/VAcAbRaEsqcqG+jLlbzyOSM2DmzVnzO9AeDuO5ldgOHVJYDYAAqL1t9L0ZtPUrxM7K/BrBjcAZJacmy1D07IAZoKdW2i1FQHNtNyVXszmd7tGQzFLiY1PQqktjDqOPHDlcbTZGCOUfO8UHXZjoi50pPn1j2l86z4hZlyLsHv7FV0iIm3b0fJPMru9w+wVcbhAqZ406eg+tDpCR3mXJJhmr3rNNWmL2NjwvbqsFpKR8nBWHLejLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 21:25:49 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 21:25:49 +0000
Date: Mon, 3 Aug 2026 14:25:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <matthew.brost@intel.com>, <kamil.konieczny@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 2/3] drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
Message-ID: <anEHW8g3v+qC4IkJ@soc-5CG1426VCC.clients.intel.com>
References: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
 <20260731040004.1345502-7-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260731040004.1345502-7-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: ac10158d-3219-479c-ccd5-08def1a5c9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|5023799004|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: j6Col7qPTUh98v1vXgQK9QXqqrptiBVMOEGPI3NE52su/gZx5+ojj0ZiOwdrV/DDGMHe/oDYRO8F9xnlipo8XDeFT+NUBnxdrPgIO+46LSdne/ibaAr8Y3S8XNbwS7Aj6+0FtRvavSuSO0FBmzlspTd6iioYYNpsUzcW+moAXIZZi43EpTgTf20UcrS3CBvkujqX9yxHVhT3rN9nW0eTl5PdZ+eDDcQHdGKZNJgDUZ5F50Kg1MvnZCluRuSyPrkApb8F8cFYT/oHJTqsjJGl/DPnLbHaPeaZlmqXA6BVOrbkMgPYJ3av9zRF3pyBX+gmQzaUX9lCV9s9/Ooap5m9YQjrTHYUnDjBGqOzsWEnNl9IKVWpOCb+7PpSQFO24/vN12vEP7TNcT4D2mu+7b+wkJZ0sqs39/VL8B1NEmx4fFWMAcfLMlDHLu6ySY3RhxSVrzvZ3moOC4is+qZnGY6h7SICw3hxrUq2gzBEnudmDPk0E4dgSIBG9e2JGoVzAvBzvckonnp70C7WLZj7LdxQViBSbmVMd1N9I7YXfIZZrVxmiZs9moqnwJSxluJuXGx//ryBFIl51TtpprHqQh35fE2ssbVTQZgIfN8bUxbcKOm6P8G2ZO2WKdUjMYVNBxxO6UlQyeb4lJ0Kzv25i7jev0N/Oc+JOuNPdjVoEyUMy44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0tkcnpOTndTU09kWHJSUXQydmZxZ080VHp1bko3VXE3SHI4eXRTTHJEQ3Jl?=
 =?utf-8?B?SlFsb3RqZUJwelJTY2hZdEJpMExBQnVldHNWSk1XbkNzSFVVekpXazh2TVNS?=
 =?utf-8?B?STdpdnYrTGdZL0x3aUY5RWI3bVNQazJYTjRmL2pDMEJjOUVWaXhVKzdtcUJ4?=
 =?utf-8?B?dHhZUFpkWXBLV2JlVWFoVjVCb3ZOeVI5MHUxeDR2TXA1dVZsQ3kxUlAzazBj?=
 =?utf-8?B?aFZVYmp1SXl2VTdyQ0ZCdVJEOUs4OWFmN3JLL212TTRLaXFnSnMwSk9rSW8y?=
 =?utf-8?B?TldGTXJaVU1heXZkMStadHM1WUo3Y0ZteXJuQjNoKzVyNlYzZlY4Z2JDck92?=
 =?utf-8?B?akxkdU1rbG1nY1RBUXlhRENSbU5QQW54U1p3UVVyaS9ua2t2UnlhK0JiNnZH?=
 =?utf-8?B?ZkJ5d20zaVo2alNEL1E3aXhHNVdZNzZXbHdQcE1JZzk3b1pYY01zU2hmdjln?=
 =?utf-8?B?U00veER1aDlmVndERTJMcUxwaXZHaWVXNkNSQUZIdnQ0aXZSeVpJNHA1dmIz?=
 =?utf-8?B?cDN4SlFJc0dqRTVoVldzb2VNRWV4bnVsWmNZRm1BMHdrTDdtREtvOFFYbnNC?=
 =?utf-8?B?aU9zRC9YbjMyRC9YcXdublZSRkNhcHpzdGoxaDBpVFdrN0NHeFRodUpQWHRK?=
 =?utf-8?B?UGhqdXFVZVRYZE1aWENkRGRabEE3ekg1SHB6bVVpWTVjZmhtT0pId3VUTlB2?=
 =?utf-8?B?cGxNUDNIZWhDKzlENDdVQ20xT1kxMjJxdVZQclI4b29TRXRoVlJxT1l5elFM?=
 =?utf-8?B?dG90UFJ5OTl3cjd6aklXL0hpdmovL1dzRzI4VUNTbGRpRnlMdzFMV3RubDk5?=
 =?utf-8?B?R2l4NEtHV08vRmxnOVNLSnNsR05Xb3EzaG4yWjBFcjMrcHVSTFUrTmhBT0tE?=
 =?utf-8?B?dUpndzR2QkJ5bHdIQktDeEZnOVpQUnAraVRwS3BGNVBTVHRRZFFPRmdXeWtQ?=
 =?utf-8?B?ZUoyU0lxL0Ntc3ZYbThDaHE1bGQ2U09FMHY1NGZ5U1NtQjRSNkttSCs2dXVn?=
 =?utf-8?B?ZzdQcDRKZldZc09jSW1UaVVXcmIvVFZ1N1dud1dJVE5CcThJZ2hrT09tN2V2?=
 =?utf-8?B?OWsxWklrNGI0UElJZnJyY29sRTBWOTkvcGYxd0hCTks1T0FlWi9UdGVVR1RT?=
 =?utf-8?B?SzB1Tlo0R0tFcUY4dVdtVEVrRXQzV3g4Rk5wZ215TC82VnVtOVMvaHBqenNI?=
 =?utf-8?B?ZDZHcVd6bTlISCtmT1g1Y1ZsK2hKSG1iUjA0M3FyRDFJYVJxSXA4Y0dXZlJx?=
 =?utf-8?B?UXpVQWtlWW1MMFdZMmlzRE01N0c1VzVLUkZmYjlaOTdhclptK1RUc0crWUc5?=
 =?utf-8?B?eU52RTNSRHVERW9KYVRDWVNidDE2RUU1WHVyTEszc1dqTXdHQlM5a2luWlpL?=
 =?utf-8?B?ZzRHdTJvQ0lpTHNhV2piZy9CVXpBS2RYb1I0dHI4UjFpM0VzeUxJclNtbnJw?=
 =?utf-8?B?dWpabys1WlorS0xzWFlyU2YwdlBlNUVRaWwyenJNM1VpKzBCTFVEWitvSFlr?=
 =?utf-8?B?d044NTBTUklHcUljZUFWdC9KNWt4U1NIMVh0Z1NKTVl6cm4yQ0orVTQ3MURK?=
 =?utf-8?B?aWNJSERxckorYlhHeGdxR2RZZHpiVm92TGZwZzYvZWs1SVpobFAyMEMzUHFr?=
 =?utf-8?B?eEU1aHF1a0lyWC9NOHcvOWUyYTJhazZQamtiV3BZS0ZNVVQwTXZQT2lqVVp6?=
 =?utf-8?B?c3VFbU83OU5pL29BQzNSM1BQa3FmY1pJc25NbGhoRUxNMzBqQ0lYOElPdFZR?=
 =?utf-8?B?NVJwNFZLUkRVT0IyTnppZEE3emk2a1hCVm92TGJRVnJiSWhiTkRUdTdtbGNa?=
 =?utf-8?B?ZkNyRFk5MERlNDBSRjQrMG5Ndi9uUENtMng0VmJvbmFIZlRsM3hPbXEvcm9j?=
 =?utf-8?B?VFZ4Y0haa1hBQlJMVUY2RmRkRURSeUp0UW0zdmRJNGV2UGNVbWZmS1B0TUIr?=
 =?utf-8?B?VEtianIxUklVQnFIdHl4VDZKN3FVNktiNDZxOXBmZ3lzdmtUQVRsR1ZJZytH?=
 =?utf-8?B?ZTlhZ3luNjVxcTJsQnB2d3M4OFQzWjdxczUra09YVnBMdE0zQXVOdGR2REJu?=
 =?utf-8?B?RW9jUjdVYkZETDN2K3g1RWdlYm56ZnBnNXVjOHJaTXlkNzUyK21VNVZHV0M4?=
 =?utf-8?B?c25CNU9tNERLanJYaFp2eHVJNGJQWi9ZWHBEMDFjTUpUS3FOSlRyV2J0ekwz?=
 =?utf-8?B?dkJycjc3YktjOG41NjMwK0laWHg2NnVVN3FqOFBmVWFLcDNhelF5YWx2N2d3?=
 =?utf-8?B?NTljOHlRcThFc3NtZGZZa09ydVlHUVhLcjFGak82ZnVMeXMwUGNrdUtTQk9o?=
 =?utf-8?B?bE93Yy9lcGE3SW5KMW1sSjRodGVWam9JU3Y0SnVWQUNwSFdBajBNUG9RY0lD?=
 =?utf-8?Q?xoAYrM6vIkKnkUHXRAECQVBFOhi0h86UBkz72?=
X-Exchange-RoutingPolicyChecked: URcAE0CN28ehVHRsCkdeNoWQCZRbzPY7mQI+lVz6vbEtbl8n4E00Yy3KvvAS868XAL7PIyhwEprJ05sPRxeN75f10WZzzIv+bsENXAQbS7uKolD6zFDR5AOdQkEjiZnTi+ET2bfCWCzt17sOPaFOe8gxQxOeNvk5BOcHxiR0TnT0iTSAUUsDMm1i3JBAILUQ6z/oA8X7ZuDOnv/HEtpiOBDjb2HrHINkvCAPFuxXydWOcy71a0ROI42c1Opy1dalwXPzjejUvXYyLyMmy80try2Snu6XxtVMhWhMA/NBY/NfmSmovwRfeetTHx/devLENv9498DCKDHkeCl+9TaClA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac10158d-3219-479c-ccd5-08def1a5c9a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 21:25:49.1051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSJSHsGl/Ph2KvQNqwOzn2sBH1Uy5BsMQLA/Fql3zBxQF/lCodbh7v1ESTsYAMK5obTUrxEuOc8/FJnmpiuNvv8FQlpEM3acyP1rgcHdN7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
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

On Fri, Jul 31, 2026 at 04:00:07AM +0000, Gajendra Uttamchand wrote:
>xe_lrc_ctx_timestamp() reads the 64-bit CTX_TIMESTAMP value stored in
>the LRC as two independent 32-bit reads (ldw, then udw). The GPU can
>concurrently overwrite this location as part of a context-save, so a
>plain back-to-back read of the two dwords can observe a torn
>combination that matches neither the previous value (e.g. the
>CONTEXT_ACTIVE sentinel written on context-restore) nor the final
>saved timestamp written by hardware. Callers such as context_active()
>and xe_lrc_context_timestamp() rely on this value being coherent to
>decide whether the context is still active, so a torn read can lead to
>an incorrect/garbage timestamp being sampled or reported.
>
>Make xe_lrc_ctx_timestamp() robust against torn reads by reading the
>upper 32-bit half first and re-reading the lower/upper pair until the
>upper half stabilizes across two consecutive reads (bounded to a small
>retry limit), then combine them into the final 64-bit value.
>
>This fixes the problem at the source so all callers get a coherent
>timestamp, instead of patching individual callers.
>
>Assisted-by: GitHub-Copilot:claude-sonnet-5
>Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 27 +++++++++++++++++++++++----
> 1 file changed, 23 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 78d0456cf3c9..6f0247bdf8e4 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -874,14 +874,33 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> {
> 	struct xe_device *xe = lrc_to_xe(lrc);
> 	struct iosys_map map;
>-	u32 ldw, udw = 0;
>+	u32 ldw, udw = 0, old_ldw, old_udw;
>+	int retries;
>
>-	map = __xe_lrc_ctx_timestamp_map(lrc);
>-	ldw = xe_map_read32(xe, &map);
>+	if (!xe->info.has_64bit_timestamp) {
>+		map = __xe_lrc_ctx_timestamp_map(lrc);
>+		return xe_map_read32(xe, &map);
>+	}
>+
>+	for (retries = 5; retries; --retries) {
>+		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>+		old_udw = xe_map_read32(xe, &map);
>+
>+		map = __xe_lrc_ctx_timestamp_map(lrc);

The map can move out of the loop. You could define a new map_udw for the 
udw value.

>+		old_ldw = xe_map_read32(xe, &map);
>+
>+		smp_rmb();
>
>-	if (xe->info.has_64bit_timestamp) {
> 		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
> 		udw = xe_map_read32(xe, &map);
>+
>+		map = __xe_lrc_ctx_timestamp_map(lrc);
>+		ldw = xe_map_read32(xe, &map);
>+
>+		if (udw == old_udw && ldw == old_ldw)
>+			return (u64)udw << 32 | ldw;
>+
>+		cpu_relax();

cpu_relax() is not needed here and can be dropped.

After looking into this a bit more, I think it is best to use the 
iosys_map helpers instead of the xe_map_read32. Also note that xe_map_* 
helpers may be removed in future. The only value add that xe_map helpers 
provide is the pm_runtime check. I have added it below.

So this should look something like:

static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
{
	struct xe_device *xe = lrc_to_xe(lrc);
	struct iosys_map map;
	int retries;
	u64 val;

	xe_assert(xe, !xe_pm_runtime_suspended(xe));

	map = __xe_lrc_ctx_timestamp_map(lrc);
	if (!xe->info.has_64bit_timestamp)
		return iosys_map_rd(map, 0, u32);

	for (retries = 5; retries; --retries) {
		val = iosys_map_rd(map, 0, u64);
		if (iosys_map_rd(map, 0, u64) == val)
			break;
	}

	return val;
}

The barrier is also not required (or is handled by the iosys_map helpers 
internally when needed).

Thanks,
Umesh

> 	}
>
> 	return (u64)udw << 32 | ldw;
>--
>2.43.0
>
