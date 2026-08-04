Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B80C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 12:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3C10EA34;
	Tue,  4 Aug 2026 12:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBKbJJ/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5610EA34
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785848169; x=1817384169;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k5/iSRP+3zQt+iiR2SKJjXBL6LMfRVqTPuY7R7ic8Io=;
 b=GBKbJJ/vnWqEVxi/AfJv51+RZBIsI3OFmQymBbtzcSSXiGILcZwCW3DL
 bOa/933IhQz/4ZZJ+ate4RTuvnirqXG+UFHyQx/dmP1QBhvruEbHUZ432
 pg6Oq+LKWBq4BnQiOZQ4H2f7sAgMb3K0aMjfsKX260127ES/3TAmfUe+e
 BZpv1wJEoL51pAKRw4wozxJ/KlE/rQO7N+YhhGgPB1bLHwEvemP6DbRNn
 W+SEWful4+ARLeUO77Pl/du37S78W8hNq4njchOVDAqvRv8XDWU+DRRQM
 xPXEpPSL9Et5ex9tac0tKEJpXUaWZ58RQmOOwaEsEBxvMaYLJYI25iVfP g==;
X-CSE-ConnectionGUID: ALB7D+kSQUmqP7hYq3trqg==
X-CSE-MsgGUID: DYdoKVJtT8ysSxxzgcuuwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103936022"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="103936022"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 05:56:06 -0700
X-CSE-ConnectionGUID: IfPYcwgDRTK1wQF/HbdCAQ==
X-CSE-MsgGUID: SMXQu1Q4RlWPS+SYnnS18Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="286141668"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 05:55:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 05:55:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 05:55:53 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 05:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqkbVL9J6wG8cCjnCfDjNYv7k7kWMm2rP+SjkjRNP47pyCK6+PTKEcjR99UYGrFfPkOsXPRpbd+44CtC7mfJJ+VYxIhbf2OFfeB8j2weqjO08cHSBaA5QsOhbJJ1GtTacsuG8c/6GETlnaKJguhGmn7hh3Msq1uCD/WWpnqORqPI35jrgpRGHME6Z2Y+y63lRv0GCedosDMRLtuKpIN7RXMMyLJvkuikjpwmMN236xGTvqMDO9WdEuAfm6ZeHXTUbapK64EVyxsRWg/f6KYa1l98XARWbW260uDk1111SadZdoJTp5PqqflUqQA+v1+y0G2tcKxQw+sVzyhLYabSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmmXa8I8DN8rYuN7pv1BtylNIgfaWvzNEZDrf+Ji+r0=;
 b=D737UIkLLWbvYhO/if0Jw9wNv/a9t+JyOCbXiAxCPjeLb6+3rffqj6AnRMu6wjODVh/wIxBfOHPOe8C1qr4Tk0xhwHkT+bevUJRfSNy5h++Cbevbf+ukXWsrqtpqwiGkUkDqlwfjcP/agnwBZ1ykJrclztvsTA+6sJmtLAGtR6HTUg192Hfa7XmGOcO07/6635MZUwKkqCpWDDKaqfQ/lcnH8CA0xzfgJkyuBBt7rjkQE9kDeNWCcdQtDOjdcEqh2ODQ0/F26ZRTQqclsfdi09hQn8RI4UFzcEwobNh8rSFZvX41F8Pmricr9vOmGjIzZjxg0gPinVAmNyEQwiDzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:55:50 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 12:55:50 +0000
Date: Tue, 4 Aug 2026 14:55:41 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
Message-ID: <anHhTWNh1SYSBo1R@fdugast-desk>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724232601.1753977-12-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b975a1-190a-47fa-cd5d-08def227b61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LrQCKj5EJI0G7ju0zFHF6yxmiRo/wofuc7yaJgUtECdDNI7FokcSpRG5vrxryoJCuchqcHHOGViWlUeTich6KIzF0blcvAhcUVf0wVIlQx2zcWWPvhwDtg+yvUG0HZHDqUCTWEdbBBg0yfKPgkJJdzRTkKrK4tLw37iXUc5IDZEKZoNMEW+Fj4/e2f7TXJjZi62fu/7iE9b13HvBXb+DBkJuz4wufkua3DfH0H/dv5SVK8k/24OYGnJrQ4MchZ1uVCXbAf+lh+saJ/qoJBg+wKnmGZOYouuXUr14CscgoVY5SWGRYJ+Xx92BlNccMnBv7zqz1DkzwNMVrH35CaeqgEmobUMtAfgY/jiH2hqYSVELappe9qDrhjO/TC65utHCVBFf295K4YQBreDTLBPsnp7npn2792rEsD9LdCqFOetJ2B6n+zftz4uTWWWCi63ZZPeyd28YNsxflgp4drYf/CfW/g4bw5uS3pyMSsUE4rkojXpLQ8la1f57scyINoRj/ISC5mAgFjElQZEG/YaWQbSst1OgRo4S0vg/cSvnQpxQjyOwz2BFYwvmzzZTd1kakfTe/7TVtrpl5A3Qbs4Zi/orCmlWwzUHBzbvrqF3mSXcDRl5OTb5wPu/M5sWNogUz05UnzCgJBHD0gEDhLAi9fla8tQXuZpQ8ICRI0f8pJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFXS1dFdHQxa1ZqdlRVM0R4S3dYK29KVmV3RDdXZ0UrS2dyUThzMC9DYitt?=
 =?utf-8?B?cVRDNG14STIwVTNnUDFGYzJiZ3VvSWNGb0xTNUdOY2N0aGIzUjl5aFl3emlj?=
 =?utf-8?B?SlgwNEMyM1Nyb1dVWnlxT1Y0VTFyOXh0cVZjUm1TcE5zQk81ZTJpQmJwa0pC?=
 =?utf-8?B?MmNtVjQyTjVLS1pTVGhXRkJmQzRFSjlCSjhsRXk2Um92UEt4T3NrbHdpZjBV?=
 =?utf-8?B?dkdsREppYmJOQ21yaVB5VmIyMjUzWlJ0SVFnTUNBbDBVRGZDNnlDVjZ4a2x6?=
 =?utf-8?B?YWdGSVpabXNoemZOMzdKZGRERkxlNGovSWpocmZ1cGFCZm9icC9sK2ZSOHFS?=
 =?utf-8?B?QnlqbEpORmR5ZWV6NnVFaU9GYVdqY05iSzMwTi9rTkFDRysyUG1qOFdmc2Fo?=
 =?utf-8?B?N1MvakJDWEhmSncxSTdtVWRMRisyeitZNGpNTlVrRXozemFOcWRubHhScjk0?=
 =?utf-8?B?L3hjQXpsNCt4ZXgyMGJTaUpxN05mR0hUeVlQWGJzRTBxSkovZ1czMm1zU21L?=
 =?utf-8?B?RDdSSkEwaStneUt0RnFWb1dLSy9PTExCR1dKSHlFTGFrMWJTNzZXUzNZdWJv?=
 =?utf-8?B?bSs5eWwraUVJQ1Y0T0x5T1hQbnZqcXg3T28xVVR4VU1qQVBpdER5Yng2SlJk?=
 =?utf-8?B?OXlsdlZseUpuZHA5Nk1jOWh3RXRzeGhwK0daTVloYzBQUDNNTXd0VTZCN3Nw?=
 =?utf-8?B?UG5NME1nRWwzbHZhSkFOcmgwb1VLOXhQQTRNdEtMQnViUUlqRlhBMUlZeVBL?=
 =?utf-8?B?OXFKT0VTcm0wSFl4Zjh1cmwydXdvSGVvdFAvOWpiLzZ6NXE0VjZGaVlYUEcx?=
 =?utf-8?B?Q0pWbDlCRlJodEtYcVVPQ0Q2MDdZUXIwNjlhQ1BsUVdjMGJXL3FtMVd0N0xH?=
 =?utf-8?B?WTFYbDRYMlF4SUxQTWlZcGRLbXowS09DYjF6VC9kQUFIdWVuVmdxb0dRRzRB?=
 =?utf-8?B?V0pYaWxoRzhiUEsrdzc5RHVxRi83amlIbFNiK1hRcUc3blNXK3VsblhudjhJ?=
 =?utf-8?B?YzJDRjcvZzlCMkY1V1o2eWRJcHYyTFdIcXdMNDQwTjRrdnYyYndXaVNUS09k?=
 =?utf-8?B?ZFlBM1Z5UzhDRXptaVJOcGV1ZkxlTThGL3cwQkNRUTRFRE44dlNOUFhUM296?=
 =?utf-8?B?SE5Bb1F0aVFzL2FtTk1reE1tWU8xbjFsU0xNMFY5dklTTExMK2ROeW1VNjUr?=
 =?utf-8?B?amZMYXAyRU9OY0VvcnhBa0E5MGJWaWp3UitoSzhCLzFrK3JBRVVBWFNjeXZu?=
 =?utf-8?B?dUxjMThoa3RoSjBvdjZOaHFBemdkSjE4TTA1ZXJQV01iZmxwd2h6V0hIUFRJ?=
 =?utf-8?B?dDAxY3NjUy9IckVnbVZ1Qzh2R0JtTzYxeUtqR0VWVkJERVhicGxWZjIralow?=
 =?utf-8?B?TGJoa3AwMVVYVnMwbGlDWFBiWjJQOUNNcTEwOXBiNFdSSDNTSHFUcVQ4V3pt?=
 =?utf-8?B?M1BSQmpqTThIeHlzbHRVRE54RmVnK0ZYai9GYlNIQmVtUGJzZkU2ZkJmeC9I?=
 =?utf-8?B?VlVlWDNoSURZWDZMaXliaVVrczFQVDgwLzJYd2NtUnhGUXpEZGl3NnhpQXpO?=
 =?utf-8?B?eUptanp6WFpFRjM4empaNTVvZUpWRmxkejZCKzQvLzhZV0ZhZGNMaUVoV2M0?=
 =?utf-8?B?YVFLd0o2cTArL0ZVckhYUTZvZ1dwZ3FxdjBmWE4rNUJpc3FXVkFwZ3AzRDQr?=
 =?utf-8?B?SmkxYk84V2JnUmVWTVdkYkNtUXpzM29HNStpcU56VXd1ZkU1UUUreFg0YzJ2?=
 =?utf-8?B?ME4vT2JZZXVGSnZzbjRCemN1a0hWb0oxSXJYTjJQTVpVazhQODdGQnlDUW9P?=
 =?utf-8?B?SythZ0Q4NHRRazBEQXBEcUUyd09tbXozc2VOeHVTQTF2MXMraERNaVN2SW9M?=
 =?utf-8?B?cGVoYlJobGd2dW5keUhMWlhDeml4N3lrQVBYS3AvWEs3M3BvV2dsMTN1aXd3?=
 =?utf-8?B?bVQwVGZpMXkxK29udDcveFNzdzNzOVpkdi80YUp4aWhkRlFHUHRoSzg1N0Fu?=
 =?utf-8?B?SnN0RkRLU2xYY3hRZFJEVTI4SXZLMEVid0RZVmdxTWhxWnN3c2Y4MWkwanQz?=
 =?utf-8?B?NnRjZk54bFBpWjBVUkdpRDhVUFVYM0xLdTdIM2l6S0dUMXZDM2ZyR3VYRWZK?=
 =?utf-8?B?SXRxWEtsWGR1TTlDZnFOQlppK2YzL1JCd1ZBZjJpeTVrelVabk5xaFVQMFV0?=
 =?utf-8?B?T1BOSjQxWVp1VUR2OVhST3YyUzg3T1NPTWptYmdEQkoxNVo3alZqVitBc1RR?=
 =?utf-8?B?TkM4RWxZU09XUUdPZ200c0JXRUw2SVVkVTZPZlRoMXgwYnZRS2Z5czhOcHkx?=
 =?utf-8?B?U3lxSmdVSk1paWZMN0oyMm1yakhpUDAzRjNGcjZ3MFBqNW91UGFzQk9OYXly?=
 =?utf-8?Q?jP/JNF+zeDfExCI0=3D?=
X-Exchange-RoutingPolicyChecked: YHcVqcsa9kJ9DW+6LEiCQjcuj28rqJE0V8Tct/VL2N81YFsSBHVLc8l2olFNeqiv39m93h+ObqufDcle/II5QC/a2uw5fPD1WNbfjucfjq4Sh/ih1qTaDIjFJCeT5cQhNbVcvAQnsWnt1KT9yxEsbd0IisSKWr2cV8vH7TK965jKbKnAyQvbK/KKaCdbMk297dN0ugiYzvoeSBNcbQpFLcKg0edzXAfVb48aHezNsbj2Qmeid0vlG612osFXriGaXn0JkR82GUxUvJEKsz3WTx+Ne1yArwGbwjUDoQ1eR5ReIzzD95PXc3gON8HVTEyBYvRke/WUhMcuSJAJGedj5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b975a1-190a-47fa-cd5d-08def227b61c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:55:50.8376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgpQz/eeV+UUoOnUgyd0bphCzn/gi6ldu36y1R2irA6w3YugiDE2SgB1LuD9Fnj7FDCPYxTjyn0j1Y6Cj7Hgjr6LugivjizCCOMNBVCwP4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

LGTM, just a couple of nits below.

On Fri, Jul 24, 2026 at 04:26:00PM -0700, Matthew Brost wrote:
> Pagefault storms can generate long chains of acknowledgments back to the
> GuC. Sending each ack as a full CT submission forces a barrier,
> descriptor update and doorbell per fault.
> 
> Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the

Wondering if calling the argument "defer_flush" instead of "write_only" would
be a better fit, and also hint the caller to call xe_guc_ct_send_flush().

> message into the H2G ring but defers publishing the descriptor and
> ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
> writes and notify GuC once per batch. Wire this into the pagefault
> producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
> wrappers.
> 
> To avoid excessive flush latency while still amortizing MMIO costs, use
> a simple periodic flush heuristic for GuC pagefault acks: batch most
> acks as write-only and force a publish at a fixed interval (e.g., every
> 16th ack), with a final flush at end-of-batch.
> 
> Also increase the H2G CTB size to 16K to better absorb bursts.
> 
> Assisted-by: ChatGPT:gpt-5 # Documentation
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c          | 95 +++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_ct.h          | 36 +++++++++-
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++-
>  drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
>  6 files changed, 170 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fe70c0fd85c5..686611ddabc8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -265,7 +265,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
>  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>  #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> @@ -939,7 +939,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>  
>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -		     u32 ct_fence_value, bool want_response)
> +		     u32 ct_fence_value, bool want_response, bool write_only)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -956,7 +956,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		u32 desc_tail = desc_read(xe, h2g, tail);
>  		u32 desc_head = desc_read(xe, h2g, head);
>  		u32 desc_status;
>  
> @@ -966,12 +965,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			goto corrupted;
>  		}
>  
> -		if (tail != desc_tail) {
> -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> -			goto corrupted;
> -		}

Could we keep that check when !write_only?

> -
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> @@ -993,7 +986,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			      (h2g->info.size - tail) * sizeof(u32));
>  		h2g_reserve_space(ct, (h2g->info.size - tail));
>  		h2g->info.tail = 0;
> -		desc_write(xe, h2g, tail, h2g->info.tail);
> +		if (!write_only) {
> +			xe_device_wmb(xe);
> +			desc_write(xe, h2g, tail, h2g->info.tail);
> +		}
>  
>  		return -EAGAIN;
>  	}
> @@ -1024,14 +1020,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	/* Write H2G ensuring visible before descriptor update */
>  	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>  	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> -	xe_device_wmb(xe);
> -
>  	/* Update local copies */
>  	h2g->info.tail = (tail + full_len) % h2g->info.size;
>  	h2g_reserve_space(ct, full_len);
>  
>  	/* Update descriptor */
> -	desc_write(xe, h2g, tail, h2g->info.tail);
> +	if (!write_only) {
> +		xe_device_wmb(xe);
> +		desc_write(xe, h2g, tail, h2g->info.tail);
> +	}
>  
>  	/*
>  	 * desc_read() performs an VRAM read which serializes the CPU and drains
> @@ -1052,7 +1049,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
> -				struct g2h_fence *g2h_fence)
> +				struct g2h_fence *g2h_fence, bool write_only)
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	u16 seqno;
> @@ -1112,7 +1109,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	if (unlikely(ret))
>  		goto out_unlock;
>  
> -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
>  	if (unlikely(ret)) {
>  		if (ret == -EAGAIN)
>  			goto retry;
> @@ -1120,7 +1117,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	}
>  
>  	__g2h_reserve_space(ct, g2h_len, num_g2h);
> -	xe_guc_notify(ct_to_guc(ct));
> +	if (!write_only)
> +		xe_guc_notify(ct_to_guc(ct));
>  out_unlock:
>  	if (g2h_len)
>  		spin_unlock_irq(&ct->fast_lock);
> @@ -1196,7 +1194,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  
>  static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +			      struct g2h_fence *g2h_fence, bool write_only)
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	unsigned int sleep_period_ms = 1;
> @@ -1209,9 +1207,10 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  try_again:
>  	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> -				   g2h_fence);
> +				   g2h_fence, write_only);
>  
>  	if (unlikely(ret == -EBUSY)) {
> +		xe_guc_ct_send_flush(ct);
>  		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
>  						&sleep_period_ms, &sleep_total_ms))
>  			goto broken;
> @@ -1235,7 +1234,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
>  
>  	mutex_lock(&ct->lock);
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> +				 false);
>  	mutex_unlock(&ct->lock);
>  
>  	return ret;
> @@ -1283,25 +1283,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
> + * @ct: GuC CT object
> + * @action: payload dwords (HxG header dword is expected at @action[-1])
> + * @len: number of payload dwords in @action
> + * @write_only: defer publishing/doorbell for batching
> + *
> + * Sends a single H2G message to the GuC CT buffer while the caller already
> + * holds @ct->lock.
> + *
> + * If @write_only is false, the function completes the submission immediately:
> + * it makes the payload visible to the device, updates the H2G descriptor and
> + * rings the GuC doorbell.
> + *
> + * If @write_only is true, the message payload is copied into the H2G ring and
> + * the software tail is advanced, but the descriptor update and doorbell are
> + * deferred so multiple messages can be batched. In this mode, the caller must
> + * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
> + * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
> + * implementation may force a flush to ensure forward progress.
> + *
> + * Return: 0 on success, negative errno on failure.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
>  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h)
> +			  bool write_only)
>  {
>  	int ret;
>  
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
>  	if (ret == -EDEADLK)
>  		kick_reset(ct);
>  
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
> + * @ct: GuC CT instance
> + *
> + * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
> + * "write-only" mode (i.e., queue the message payloads but defer ringing the
> + * doorbell / updating the CT descriptor). This helper completes the submission
> + * by ensuring the payload writes are visible to the device, updating the H2G
> + * descriptor, and ringing the GuC CT doorbell.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	xe_device_wmb(xe);
> +	desc_write(xe, h2g, tail, h2g->info.tail);
> +	xe_guc_notify(ct_to_guc(ct));
> +}
> +
>  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  {
>  	int ret;
>  
>  	lockdep_assert_held(&ct->lock);
>  
> -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
>  	if (ret == -EDEADLK)
>  		kick_reset(ct);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 767365a33dee..b30c1f34be39 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		   u32 g2h_len, u32 num_g2h);
>  int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h);
> +			  bool write_only);
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer);
>  static inline int
> @@ -63,6 +63,8 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return xe_guc_ct_send_recv(ct, action, len, NULL);
>  }
>  
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
> +
>  /* This is only version of the send CT you can call from a G2H handler */
>  int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
>  			       u32 len);
> @@ -87,4 +89,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
>  	wake_up_all(&ct->wq);
>  }
>  
> +/**
> + * xe_guc_ct_lock() - take the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
> + * performed from contexts that want an explicit "CT locked" pair without
> + * exporting the lock itself.
> + *
> + * Return/Locking:
> + *   Acquires @ct->lock.
> + */
> +static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
> +__acquires(&ct->lock)
> +{
> +	mutex_lock(&ct->lock);

Now it would be cleaner to add "#include <linux/mutex.h>" in xe_guc_ct.h.

Francois

> +}
> +
> +/**
> + * xe_guc_ct_unlock() - release the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Counterpart to xe_guc_ct_lock().
> + *
> + * Locking:
> + *   Releases @ct->lock.
> + */
> +static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
> +__releases(&ct->lock)
> +{
> +	mutex_unlock(&ct->lock);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 2470faf3d5d8..8f8210a732e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -10,6 +10,22 @@
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  
> +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> +
> +static void guc_ack_fault_begin(void *private)
> +{
> +	struct xe_guc *guc = private;
> +
> +	xe_guc_ct_lock(&guc->ct);
> +
> +	BUILD_BUG_ON(((XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1) &
> +		     XE_GUC_PAGEFAULT_FLUSH_PERIOD) != 0);
> +
> +	/* Ack the 2nd, then 18th, etc... */
> +	guc->pagefault_ack_counter =
> +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1;
> +}
> +
>  static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  {
>  	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> @@ -36,12 +52,26 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_PDATA, pdata),
>  	};
>  	struct xe_guc *guc = pf->producer.private;
> +	bool write_only = guc->pagefault_ack_counter++ &
> +		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> +
> +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> +			      write_only);
> +}
> +
> +static void guc_ack_fault_end(void *private)
> +{
> +	struct xe_guc *guc = private;
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
> +		xe_guc_ct_send_flush(&guc->ct);
> +	xe_guc_ct_unlock(&guc->ct);
>  }
>  
>  static const struct xe_pagefault_ops guc_pagefault_ops = {
> +	.ack_fault_begin = guc_ack_fault_begin,
>  	.ack_fault = guc_ack_fault,
> +	.ack_fault_end = guc_ack_fault_end,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 31a2acb63ac3..3dbcb1331690 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -122,6 +122,12 @@ struct xe_guc {
>  	struct xe_reg notify_reg;
>  	/** @params: Control params for fw initialization */
>  	u32 params[GUC_CTL_MAX_DWORDS];
> +
> +	/**
> +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> +	 * pagefaults in a batch.
> +	 */
> +	u32 pagefault_ack_counter;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index caa39a024ae6..917884c49e1d 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -412,6 +412,10 @@ static bool xe_pagefault_try_chain(struct xe_pagefault_queue *pf_queue,
>  			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
>  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>  
> +			if (pf->producer.private !=
> +			    pf_work->cache.pf->producer.private)
> +				continue;
> +
>  			xe_gt_stats_incr(pf->gt,
>  					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
>  					 1);
> @@ -585,6 +589,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
>  	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> +		void *private = pf->producer.private;
>  		struct xe_gt *gt = pf->gt;
>  		u32 asid = pf->consumer.asid;
>  		int err = 0;
> @@ -622,11 +628,14 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>  		xe_assert(xe, pf == pf_work->cache.pf);
>  
> +		ops->ack_fault_begin(private);
>  		while (pf) {
>  			xe_assert(xe, pf->consumer.alloc_state ==
>  				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> +			xe_assert(xe, ops == pf->producer.ops);
> +			xe_assert(xe, gt == pf->gt);
>  
> -			pf->producer.ops->ack_fault(pf, err);
> +			ops->ack_fault(pf, err);
>  
>  			spin_lock_irq(&pf_queue->lock);
>  
> @@ -654,6 +663,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  					XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
>  			spin_unlock_irq(&pf_queue->lock);
>  		}
> +		ops->ack_fault_end(private);
>  
>  		if (time_after(jiffies, threshold)) {
>  			queue_work(xe->usm.pagefault_wq, w);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index a1fff0e47fa5..efeba5c3a58b 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -33,6 +33,13 @@ enum xe_pagefault_type {
>  
>  /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
>  struct xe_pagefault_ops {
> +	/**
> +	 * @ack_fault_begin: Ack fault begin
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer begins acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_begin)(void *private);
>  	/**
>  	 * @ack_fault: Ack fault
>  	 * @pf: Page fault
> @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
>  	 * sends the result to the HW/FW interface.
>  	 */
>  	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +	/**
> +	 * @ack_fault_end: Ack fault end
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer ends acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_end)(void *private);
>  };
>  
>  /**
> -- 
> 2.34.1
> 
