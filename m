Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDCBCCF2C2
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6B10E3AC;
	Fri, 16 Oct 2026 18:36:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6B10E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792175760; x=1823711760;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ji2bQsNjFPU0+d43mpkLu4dJuV0QOlFvIWEmXngMUH0=;
 b=fdtMpuen/ES2j2M8rAU9gXwxnRbMHyL0oHYPKvBhw3XV2XaB3ZKS7n+s
 47iLsvfz6AIf75C5NKoxvOWst8/AtFJHZhIP6HxWcdiCu1qLtWijuKJYd
 tITaW3PpD1FnlxxKl4nas93VPz1M42KBougJ1AhBxZM5d0/ZyB90qwcK4
 odPSxKIAFURNYy1mx4377djR85Cz0WA+/kMR3EuwR1iPrnBxuv2ArqAwO
 bnsLuSZWlrGLY5pkoDiEFvflxXg7486jC9ZHuyAfwhrSaqlipJFXBa06J
 XaBIiT1qAlHK/porVfn3joSkPGWTiDSGnEjmhvhH4NT04ZBm5YDpfvnqq Q==;
X-CSE-ConnectionGUID: 3I5LIhcmT4iO6RepMbOjxQ==
X-CSE-MsgGUID: GKenYcx0QEuL3n30QAMQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="832323"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="832323"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:36:00 -0700
X-CSE-ConnectionGUID: ad/+QB5LR+K+wPLKx7l04w==
X-CSE-MsgGUID: aliQ4b+TTcqivT5J8NGdRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2384184"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:36:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:35:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:35:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ER9/qFxuVk28cuKZou1hrlAZMkn7yG+GsoMhoyeQPT+LhXlgGEZ1bq4GKPcbSr0/2bb2Dcr5UjU9bwdgn4tCoDmn9lWSHQWdJsQh+Dh74QnfzhlbZFnlNOPeNGRhDl6fCmWF2qY/3/sfMs6mtamGVpXETMsgr2oq5nUlIq4eSsYhFlME74KE0Or66TvEmP1Qp+/zMNPz38T/gNVkHdm9FPch5WwHSr6oUgjgGqgcck2XRGGqj8zJTOZDJ7BuH2VwqPHCrt51DdjE/f6HpyAIoL2cqaci5JzXUwFDjac3u5Notfi00iw/ZICZ55U1sdeoMJZm7jFJV3fh0xcrhlIqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E3Ze9Aw9nkerS4yHQxSB8hvFkheL+Bh1FIwehEdUZ4=;
 b=jGOGuxp6cNKwSaW5V3ujC3w9dqbi3/SvuwcymcijFjiaVM3cNW3jPov+VW1ZrJiAXmygkJmfH/zNNrB044bJF1LpfHtxb8JKmzKHZozw/Vh30om4045gIaskCvX2vHv0+A1IqbQ6CTzDtACknaxvzeCgMVgk7ZUCt7xWs1Bct55PIh3xmJZ9bNx4+yw+IGYGetg4R5ia4uj/BJUe173Sp/zzPByTPxCFfeDrojt3fg7IbXeq/mdIGyJFOF/wemu4IxyJqgFiO6/SxZgWHpUuJ+jpEBeH8QqkBsiwwip/ebVVpv62uZYwaL3jozgMRuqyVXkDdl8sGI743NCblIxQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:35:57 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:35:57 +0000
Message-ID: <7f92dbae-5b66-4fe0-9dcc-6cd2e2d5a4f0@intel.com>
Date: Fri, 16 Oct 2026 11:35:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261015165451.154495-6-vinay.belgaumkar@intel.com>
 <553c4753-6c38-471b-8e3a-c6b8c4407e29@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <553c4753-6c38-471b-8e3a-c6b8c4407e29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: bdcf4d4f-0df2-47c4-dd0d-08df2bb4519f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|4143699003|11063799006|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: CKwPcXjuDMVKCphEjUAtbf+VVPV4wb+zyK0lIoxVNXsV7VtHJZAXK0ZN6mSr/gIQBkdqHE6KP/c3zf2bd6qVUhFObVWRufWR7g7Ts8bS4nvQ02tpEfrqJRZgDFuvV/Uk0O6NYJxJ+H+X9Pdsp3KxD1eU/yifUVkvZEf5Orb5FJ9UyUwgy8YSn3sIOrv2tx2B0IIJKSmrYIdk/xl208gmIo8y3HJjiaCKe8aMnvS4mWzXq5DmD88ThKRU6teirvGXT25dYyZbQAdDDJkJmEhNoyYyMiZpQ8NcikWPtkktHikCUTELpGBd+t6Ty+mNrfEs0x1+CwpsLzeT9Fsk3oGvdC5oqDP5k/3GnMhMqomu/3ldsbbzSOvadX82P9MZ52Ci8FuoLO9nqrbWmu63thTE0WjH/Pi7BoFTlaXB6681rn2W0PhGAI0q50KPB+EE9ELjT+cNConHEuXrA3VGjd/Bg9wtMELafyHJG/9QV3BYCOZtnMxhO+UaJ++pWV+fWfmjNm8NTDOH6VWbRQVmEMIzWrAKWS9oaWRhnOOWnHY6RPtNeRTbYfyfIHp0Zvvou0DAumQ8xPgeEvOuSgAQ/QhooKY5k8iaHciXdIkr3ByR2iWNwLn1VOE4EY4cQxM3mbSQlC4VsHhllWzidEvBVwd5KxmaXjo0EmrY9mNzKFu2V1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnJ6RTNDVE1xU1BOKzhYRkpQeURKRUJKcjZvL3Y4Smk2UDloY0hrWFlocEVm?=
 =?utf-8?B?V1VTakdmVUVlTG9zUjF1VVl0elVyV3FSTllEQ04vTm5IbnFlZE51K3huOGZh?=
 =?utf-8?B?U1lUeTJNWFVsZG42RE9rR28rVkJ3alJRME1ZdXp2bEc2TWRKOFdjODliOU5V?=
 =?utf-8?B?dW50TndFeVdzUkVOWU9EZjdvMWNIZDVpUjJIOXF0WFhjSlVPWitYVm02YnRZ?=
 =?utf-8?B?UmlNVjlOTmRtZmRWK0lmVVN3SmttTG45ZXJWY1BXNEtmc1FhcStKajcvY3Bq?=
 =?utf-8?B?ZHlUc0phU1RxM3BLOTlIWWtwS25RaENiL0dLRXBpKzJkdTFZVlRlWVlVamUv?=
 =?utf-8?B?Wk9wc091bzk4b3VmS0RwNlpFd3VDcFpqY2dlbjhtY3YxemhyYUt4Uk9XSE5S?=
 =?utf-8?B?NXdsVGFiamZLeHR3cVh0TXZEcEtSQXNpYzd2ZDNrMFR1Wmk5OUdpY29OVDZ5?=
 =?utf-8?B?OWE2c25xR3BwSVg1ek5YUWttK1hTL3hzSXJaaFBPbUhWbDYxT1EzdzZEdS9D?=
 =?utf-8?B?SThBZmMxSysyeU9YL1ljWC9hQ0tadzFqdVlOVjFvT3ZZV3BhQytocVBIVkx5?=
 =?utf-8?B?QnBHdkxtRzFiV3JUamU3elJpdGFoUmpEUHJtTE9PbW40dzFVb0Z1Ynd3M0px?=
 =?utf-8?B?eDVxd1p2QW80c0xoV0d1b1NOdWt3TlgzSXV4VExHei9kUmZCeENqOW5KMm1q?=
 =?utf-8?B?YU53K2p2WXRGTzdHSFF3eXQzdnJialBqYURSUXBrY1ZnV0xPWDROUVRnaHdq?=
 =?utf-8?B?UFJUK2o0WTdib0FsU2RJOHFHQzhnS0FUVDBObUl4WUczcmgzQjNMSkFpa2VP?=
 =?utf-8?B?bWhaclhCOGxabllqTXNLa05mRnpnUDBnd3NHY3RvODNtczVoeCtiYURaeUo1?=
 =?utf-8?B?Rnp0SnZ5V3hwZ0UvVmRMT1BWdEFMUnVEWk1keXRtVEtldWtyNUw3enptNXNF?=
 =?utf-8?B?blRIa0E3UlBNaEZRcGd6SUx1Q1hJTHRsc2xFa1plMXBqODlnSzhFTkJ1SEM5?=
 =?utf-8?B?a3JFeURxdzhLVG5YSVdiT1NxWFlHMnBwQmFyeW9kTWp0NnlFczRxZHJ3bnp0?=
 =?utf-8?B?NUU4VG5kVHdqU1h2ZmdLWTNCb1RNVXZqZkd6eUVUNXU3TzR3TkZRUGxRQXZq?=
 =?utf-8?B?eG42SDRIc08rVnFJNDJhM015Q0lqOTRjaG5kQWtVdU5vdHlpYXZYUkd1U3hZ?=
 =?utf-8?B?TGRQOTlybEE0UWRHUEkxeWp0aUMxcWpwNGdvcFIzWkIyd1NmekNXcXZuSkNy?=
 =?utf-8?B?b1lpNG93TVZxU0pDSmtZdDREUWNnTy9wMzlYUE53d1FRRW1vSFlFY2dMYW5K?=
 =?utf-8?B?MFdSeGVVa2NMYjFiV1pWcFl1RE1IWFZ1YlpIaHBBTjlXVzR2NFNBOCtpNmNQ?=
 =?utf-8?B?WXdVMGRuVUh3blJjaG14U2x0WXo0bjFJbm5Ea3NwYy9yakxkaXhGWmpFNGln?=
 =?utf-8?B?TE8rNDhNdGMwL2t6RkIwQzMvUlIzRWVvWmVnVHcyOXkyeURmV1djSFpBeFRN?=
 =?utf-8?B?MEMxZy85RSt6bmlWL1g0QjFMcFpYMldHTGgwbE5OelZ3YkdNNy9yL2JBaFNH?=
 =?utf-8?B?Nmp3Y0VwOEVDN1dTN3RQSWFlTEdyWVdJdzg2ZXlxZzg1Y0FrWnNudVFFc1pH?=
 =?utf-8?B?Y09RNlJmSEN4dmtnd2JKb1YwK3ZVeC9pZDN4TTlyUkRtYkpvcFRDTHdCTm00?=
 =?utf-8?B?YlRCaTliTzltZEk3K05KeTEwazc2V054cTZKcDJlNHR6bmZNcTRZOHdhZkZG?=
 =?utf-8?B?a0ppby9OK3BraWIzRlJxVkowcDVScjkrRHNrMlFvbGVnNjVoRngxcThTdmxz?=
 =?utf-8?B?K0FuTmNMT3JpbWNlU01wSXQyZ2NiQ2t4K3Bhb2Zoam9NOXVSRFAyekVIcW9W?=
 =?utf-8?B?MHNSeGkzNytaaElONlRHL3djSWV2dnI4bVgyNHZwaGZ5UGNwM2ZXdEtxK0JU?=
 =?utf-8?B?RFlIL0tBVmZsKy9jd0dLOTBoVFdFL05sdE5hbmZmUGN3bGMrRXQzTEg5eTQ2?=
 =?utf-8?B?SG8xeXd1K25LaVVCS0FKNFFNNUhxUlpIelIxcjlwTyt3V2d5UUpnZ293Q055?=
 =?utf-8?B?STlWSzE4a0dFNUZzaStIY0hiUzlza0VRbDlwWjM2ZmVib1k4NnREblIzNFRm?=
 =?utf-8?B?OC85UVRTREExUGpUV3JnRnRqU1M4YklUalk1TU9oNWRjTXdEQ3NZak1UREE2?=
 =?utf-8?B?ZzFwOFZ1SC9RMWJXVEpkM0phaW82NTRpZnlRaEpDQkttdVRjcmhVRmprWHVW?=
 =?utf-8?B?WmR5RHppZ0VHNGlXT3gvM0VFS29mM1dqOGI4K3FoQ0dOZXlqeXppdTZXMnBh?=
 =?utf-8?B?TkJkbnluUk9hYUYwYVE0SVpMRWlHUTI2ckJHdHRCZlg1NmdlSVVjc2MxdmI0?=
 =?utf-8?Q?ctbZfijxKHjZFrWY=3D?=
X-Exchange-RoutingPolicyChecked: OxfFFflnyl9Y4dRj8rCus5tu/G3rMj0aDJ7iGTO8be8lw97hbvulTTh6MflDbdNTWalGQyR/5OyXEPhJLLVDY28ijAhR+lUTmnuZ03n5XUJYr6HzSD/AFQZ48Zvr09JU94/XKVlaI1TuOTnmmqgS0wAro0mZSh8rlQ8W8iq3Maw0PlVlS8jiZsJHI58AEQqCG3kGq1tWVMCFIk8ICwe+24Q9VH5njb7oag3hjh5p2eytRIyExLkT6BV9J/s80lN2tkKDJEUqNfbaQdH3EQzztv19bmWYqbvKv67WnAjNVUE/ZvLPPKW+UfCucpaMPerjrh0MVS+Zh3DzUofGfoH7Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcf4d4f-0df2-47c4-dd0d-08df2bb4519f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:35:57.6138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66QPAq1Yonll+uKWz24O5+Jk/d9qdkeBrxWiOsDAVTCt9x/Rw3jKTASTMewd18GQv+UCSPsu/Zn34CXHR8ipZbWZld7tXc+QT2/lNmNdZ74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
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


On 10/16/2026 11:23 AM, Poosa, Karthik wrote:
>
> On 15-10-2026 22:24, Vinay Belgaumkar wrote:
>> We enable this flag during runtime suspend,
> i think there should be Fixes tag for this.
>
> Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we are 
> really allowing.")
ok.
>
>> need to set it back to
>> false early during resume to prevent any race with pci driver.
> What is race that seen without this ?

While D0 is being programmed in xe_pci_runtime_resume(), pci driver's 
internal auto suspend timer could expire and, since this d3cold flag is 
still true, pci driver could try to put vsp into D3. This is probably 
why we toggle this flag as the very first thing in the S3 resume 
function xe_pci_resume().

Thanks,

Vinay.

>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 57c6f778ca24..2269e51868c1 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1450,6 +1450,9 @@ static int xe_pci_runtime_resume(struct device 
>> *dev)
>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>>       int err;
>>   +    if (xe->d3cold.allowed)
>> +        d3cold_toggle(pdev, D3COLD_DISABLE);
>> +
>>       err = pci_set_power_state(pdev, PCI_D0);
>>       if (err)
>>           return err;
