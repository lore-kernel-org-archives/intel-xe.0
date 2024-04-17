Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C998C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 05:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED8511312E;
	Wed, 17 Apr 2024 05:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QfPtAW5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333311312D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 05:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713330060; x=1744866060;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=3GlRc1/FBsb8WOhNVyksJpAKFg0PpFlQLhEk+ZohMLM=;
 b=QfPtAW5yrjcO0Dihv7kvaKiGoJLmBW8adESU7IhbHcHBCVgsGUbcnJpB
 M/c49/QINtiU1SHwHEY9oM4Yw1/PIl88XtZQUTKtfzmHhoKGhgZlhsmq0
 3C+PHqs4c9lyPp33v6/r7QfTmXcJJlvoovG3HKEzHXLUzSunjJbhqSIBF
 X0CKC9B7xeoz4e7dmqlUA7UuoLBXPfVbmU+F9SObpMZ2o0+2+iXidCpJL
 t1DUsazYrd4O+3o4OelLKfEhTTGPpoRsUQxKgtof/dFsrZxlL8AszdeIW
 xk/LtmweZi1x08c4nSvE+IVLU9n1OCQefn6JiAsvw3FZ6c0+JC2Hiu9V+ w==;
X-CSE-ConnectionGUID: MT+yPKtVTc+TAVhz8JOIrA==
X-CSE-MsgGUID: /oAMV9ijTrmjG2C8hw58Kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20224347"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208,217";a="20224347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 22:00:59 -0700
X-CSE-ConnectionGUID: 8Q8sDXyNTGGvEgrwKm5Xow==
X-CSE-MsgGUID: uZsnkM3GRAWfcI5G13ZjpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208,217";a="27056993"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 22:00:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:00:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:00:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 22:00:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 22:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwYfo9tDNCikfMBTynlcVoh+c7rCkFY9+DhrXMpCtLAmRv3oU15Bv+92i9pcXsea0BQBNLk5hLGComvFoydFO9bqEPRJ8tzNhJBe53ZbAz9BQtQpqlDRF9JPrCPogQkvLc+xBYoPob2dOc7RGqSVIZcEyuqcxSBjxC5KUxd/+lHGXFSiBcYibvA7h1unA6a5zZ9XI2mHpHDdkiir/5ok4x1kcsRokK8smAi/3SV1t1oP0QzsLfJHcP3eLDwDIbN/gTB25Og2MGSgRci9+TGW3a03zCZCVkr1Jv1blv+wCvt6T5ONVejTsx0SQMmMENXMxydFikKiuluSp95naOFpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oE+hm8+YAnMO4XqugLGtA41qafJWL9eujmj/47KpVE=;
 b=gR6vhnbqFhBw1TBXZJjAWjjQpDLNby8Ggpyyh3ltD+wFKio2SORk7viujX8vtFtTAS68BwaQsTwQSG2kwp1iLY+4tTmmtyQyz/aABFi8983R9b4iytoInSIGUU3jN42Fh1zmYKJcmEzhUfKyP53asil8eRefgQxFoC/1YutZ7UGfM6UUK6frYFhdD20iORq3543aWPYmEa7pBHSKzCvFyU866jOvilsyelIkHCgB6DY93dAF1jxigYUcb0QoguQFl0nGP2B4//6SEFyKljlTJeYrKoDVovKwPWOavcOAnkWJ+EnJ2TJ1qIsDX6HL40oEPPKox9nPR+AFbwRVGfOwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 17 Apr
 2024 05:00:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 05:00:29 +0000
Content-Type: multipart/alternative;
 boundary="------------cy9dEZlcUNFZXOETuPhGui8E"
Message-ID: <169808bc-96bb-429f-9908-26889ddd3862@intel.com>
Date: Wed, 17 Apr 2024 10:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Cleanup_and_fixe?=
 =?UTF-8?Q?s_in_drmm=5Fadd=5Faction=5For=5Freset_usage_=28rev5=29?=
To: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
 <171332141117.1463550.2132835873101754416@8e613ede5ea5>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <171332141117.1463550.2132835873101754416@8e613ede5ea5>
X-ClientProxiedBy: PN3PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 292239ca-f90d-4d3c-1109-08dc5e9b4cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhgkZ4f+Ozn7qZgyIevFFY5GzSBuo/BsO9im3EfyAvr2FsKI1W9n2JRU9qqy0I/eZj5urf4WyTtWZ6Ch18WmMErXJI33026W8LjE13LN+xu7clXsSQLMaDOUj0OVz3hcjjNj2J/ijC6qbU4OECDdxT5XclQnRQwth69F9oYWkCBIE1YrfRsx3lDDTO+QvWy7l1zEBatcCAlBA0aJHiPm9lVCTtOakswWrQHWHUxaasXfna9jsUVaeBcReEs8hi1Qgz+KNLVM3jAMN/PPoALukVKMwKeQT0ybbhyZTjEterOjyU2NT3y9/F9qUiCoMuO1Jmc2XKCdpwwz/2DX532rywadMnUtwiGPMN0qiFEVfPTXhdTa7V0OxXZhrPH/zGMhEpidcbiaH/E6N7Wh+b6wCQ494OF0KFjSNDu3HpOEqNEiCSvw4AfMyfJPr3EoQ8D5jUuvl5YLOkz457yfXS5rMGtmztxn9TvQ3O0JdkzyXUIHmgRysMzYxkpiYU/ZxDdN1DxjdcXN7U8UA7gfNXeA2cISd/1e8yg/FVn/2vaJrO6V5SaHb7sJS2ObL+DQJat6/OA3eTYhv9mpvysI0FAIg0EN64rXfTyD36/HBcAHO4CSIuPR3oS++iDn1U8eu4ou
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVl0elA5YlNhTHliT0ovRzdmNmhQQWpyQnBPLzF3YzRXbjJnL1BnbCtjeXh2?=
 =?utf-8?B?NWNFNHIwWkNKN3FIS3hDRDVPSU1XeWR5Smk2Qzl2Z28zUjdnQXVZMmZkSVEx?=
 =?utf-8?B?MGI1bHJNMHMwL1FISkRBQ3dmWFhnZTNwVTgxSXVXNW1nTFgwSlZ5UlFEWkph?=
 =?utf-8?B?TXBQK1hLZjFtdi9GRmhqZEcydFVDZFFCUHI0bFVxbGFIaGNON1c5THdxVHBS?=
 =?utf-8?B?N3Q0TnVkK0hBbW5vZHN1SFR3QkI5MkpmaitUT1VRY3h0c0FSU3ZMQ01NKzdh?=
 =?utf-8?B?VlFKQ3NON0VLSXovZkxVdjZwTUxPYjlIYkk1T2xXZ25USWZRemF5YWVIOHIw?=
 =?utf-8?B?QkJWc0Ixd3pBZjJ6UlNDRkhWNVhuT0dVaVZnUHVaSGxpaHRnU2piZTcvZTJx?=
 =?utf-8?B?QkZQUGtXQWNaTmpIRUVXOVk0c2M3K05Qd0hUeFB0YlY4U2JZYXhSM09zYUZx?=
 =?utf-8?B?cERBRFA3S05xNkRsWHJHZC9DSmJYcjZKR25OangvaHc1UlJaSTdwV0l3bnRa?=
 =?utf-8?B?a0RLdytPUjNrMkNWOFRZRlE1cVpuSms5cmlmVERFa254cUlWaC9MVzJ3WHk5?=
 =?utf-8?B?elpuc1Y1YWNUZ1NKNnlQa1dMeEVMOUQxU2tkVXB2Smw5ZE1EOEhWalR3WXBT?=
 =?utf-8?B?MHNwWGhhK3VSTmFrVWxUTkZGUFpBcHFsRFU5eTNrK2c5L3RHQlQ1NjBwdlkz?=
 =?utf-8?B?cW5IVGw1UGNxNUtjb2VJenFMck9VbVBBRXk5a01MaGpXR2J1SmVwNWNzczU1?=
 =?utf-8?B?bktQaTVRNkxNZ3ZQZXVwMmZrcXNjb0o1WG1ESiswQlNjeExyeE5adzdscmpP?=
 =?utf-8?B?RWxQbk0yQk1FQlc3ZWlKb3JSbkh1VWxUSThLU2dYbHhWOUtSVnVWMngrb2NL?=
 =?utf-8?B?QUNYRE1aYVFsNWxHQUtWZ2M0VEcwRkk5UzZGODdoQUNXeGNoS1BPaFY5b2xt?=
 =?utf-8?B?V0cvSWZwVHFsMmwvU0J2cU9kUVlldzZIbi9rS3FndEZRcTFmeGZZcnVzbHc2?=
 =?utf-8?B?emdUNnd6SHhoOW9nbWd1N1Q0ejZQZTdyRkh1Tm9KRkQ0UWlaRFBncUR0QXdE?=
 =?utf-8?B?SHdHandvaEpuOStGQlN2clllQ0E1dFNSYnVzR1E3aThFRVJMTDNRZWc3ZDBv?=
 =?utf-8?B?ZFBDRmQyNjVSTU5udnpCd0tISnBsU2JJUjdZdHZZcmVlcmJsSnFOZzg2REJa?=
 =?utf-8?B?bjhvaE4zU2dFUDVoenpFc3krdFFaN281dmp2V1pCWWl4dkZCbmtvbXVsaWs2?=
 =?utf-8?B?c1M2Vm90bHZVUFNaWGtpL3ltQk1zQzE2aktpVzU1MDNqVXU3UmYzZ2kwZlZs?=
 =?utf-8?B?Y1NrTnBvdk55anAzOWMvNVZrd3cvQmxEaXZUc0hYbnRKY2N1bnI4cDVaRE1G?=
 =?utf-8?B?MDh0ak1vTVJwK0FNTk85Q1hZVGM5aGJZa1lsR25nZERRZWF6a2FHWGZFOElr?=
 =?utf-8?B?Nk11VmRoYzZ5RE1Xbkt0bGxxamFjU29IQUdIWFowbkJHQ1gwUUZJTXFCNi9k?=
 =?utf-8?B?c04zZTU2OHZNMXBtaWxVQmRzU05mZ1o0ZkVtSmxmT1Y0enpPVW95aU9NTFFX?=
 =?utf-8?B?OWhvdFMxVThiSjYvNUVQREY3eUV6QVcrUjV6MzlmdEVXWVpQeHBKNTZ3L2ls?=
 =?utf-8?B?djNZYUpidnVrU3dnUjNxMUcwUGpZWDhQamhBMTU3TEo0ek90RVFTNzdicEpY?=
 =?utf-8?B?N1p1VXVDNW11bmhIbVlla1NReCtsdGFmUTA2a1lBdW1DS0c4RGF0aXJyeDk4?=
 =?utf-8?B?MWg0N3gwcXd5SlA0YU16eHJoejRmZjhBY01EOEZQcm9nRTB6d2hLRTZNcnRL?=
 =?utf-8?B?WU10ajNtdEo3TEFmSWdLMis5T1dEK0FuWWw3NkZ6Z25seXRxd3FWWlZCdHFU?=
 =?utf-8?B?TDhPdEptczh1THVGUWpkSHl3K3l6NytqZUdDdG1GTDJ2QzhsR08zVE1uc2Fk?=
 =?utf-8?B?WUl6Tmc4eUczdCtRK1dXNjZiUmQzcXJwWUM4clcxZ0lXYmFDRno3NGtyVStC?=
 =?utf-8?B?aE5aSTJGeUg3dXFWaTJkbGxXOHFzRkQ4SlQ0R0tROTVWOWxyU1lnazFlMGtj?=
 =?utf-8?B?TFVURFRGZG5UUmhnVWVSbVVUYmZBcjJIdzdUbW1SRG5abkdkS3FkT0Y5Tjhp?=
 =?utf-8?B?UWtnTXVoVStVVGhXZlJsekllY3dMOWtmRG5nazVRejl4NkU1QlR3UmoxaVV1?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292239ca-f90d-4d3c-1109-08dc5e9b4cc5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 05:00:28.9996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKchshdFjBT0yOoIrDGTHfsXnHuGvFTFyKtD6M9aGJjWV4Sr4/8MXamIKwFb90oPD6tG2HjUre8iD6S+FoUjoP6LGnm8K6L/uq1WwUowuac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

--------------cy9dEZlcUNFZXOETuPhGui8E
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 17-04-2024 08:06, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Cleanup and fixes in drmm_add_action_or_reset usage (rev5)
> *URL:* 	https://patchwork.freedesktop.org/series/132150/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/index.html
>
>
>   CI Bug Log - changes from
>   xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full ->
>   xe-pw-132150v5_full
>
>
>     Summary
>
> *WARNING*
>
> Minor unknown changes coming with xe-pw-132150v5_full need to be verified
> manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-132150v5_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-132150v5_full:
>
>
>       IGT changes
>
>
>         Warnings
>
>   * igt@core_hotunplug@hotrebind:
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@core_hotunplug@hotrebind.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1352>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@core_hotunplug@hotrebind.html>
>

This patch doesn't introduce the error; rather, it reports it 
differently. The original failure remains the same and underscores the 
issue of stale sysfs directories persisting after a hot unbind, which 
can lead to complications during subsequent bind attempts.

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@core_hotunplug@hotrebind:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@core_hotunplug@hotrebind.html>
>         (Intel XE#1603
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-8/igt@core_hotunplug@hotrebind.html>
>  *
>
>     igt@core_hotunplug@hotrebind-lateclose:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@core_hotunplug@hotrebind-lateclose.html>
>         (Intel XE#1595
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595> /
>         Intel XE#1603
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html>
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html>
>         +1 other test fail
>  *
>
>     igt@xe_gt_freq@freq_low_max:
>
>       o {shard-lnl}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@xe_gt_freq@freq_low_max.html>
>  *
>
>     igt@xe_live_ktest@xe_mocs:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-132150v5_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#1125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324> /
>         Intel XE#358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/650>) +12
>         other tests fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#801
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +7
>         other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html>
>         (Intel XE#1185
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +14 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +51
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +74
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +16
>         other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +17
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-frame-dump:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +4
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +8
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +4
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html>
>         (Intel XE#422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/422> /
>         Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3
>         other tests dmesg-fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +61
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +16
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +19
>         other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +4
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane@pixel-format@pipe-b:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_plane@pixel-format@pipe-b.html>
>         (Intel XE#1331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331>) +2
>         other tests fail
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +9
>         other tests fail
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) +1
>         other test fail
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +8
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_pm_backlight@fade.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_pm_rpm@basic-rte:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html>
>         (Intel XE#1203
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203>)
>  *
>
>     igt@kms_pm_rpm@cursor-dpms:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_pm_rpm@cursor-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-stress-extra-wait:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@psr-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_psr@psr-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +17
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html>
>         (Intel XE#294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>) +1
>         other test fail
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_sysfs_edid_timing.html>
>         (Intel XE#1174
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +40
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_ccs@ctrl-surf-copy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>) +2
>         other tests skip
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1050
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-cm-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-large-multi-vm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_evict@evict-large-multi-vm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +9
>         other tests skip
>  *
>
>     igt@xe_evict@evict-small-external-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +26
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cm-gt-reset:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_exec_reset@cm-gt-reset.html>
>         (Intel XE#1068
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068>)
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
>         (Intel XE#1206
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206> /
>         Intel XE#1261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261> /
>         Intel XE#1356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>)
>  *
>
>     igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html>
>         (Intel XE#1206
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206> /
>         Intel XE#1356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>)
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_live_ktest@xe_bo.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@xe_mmap@small-bar.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@xe_module_load@reload.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +3
>         other tests dmesg-warn
>  *
>
>     igt@xe_noexec_ping_pong:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_noexec_ping_pong.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#379
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_peer2peer@read.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@d3-mmap-system:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_pm@d3-mmap-system.html>
>         (Intel XE#1221
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221>)
>  *
>
>     igt@xe_pm@d3hot-basic:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@d3hot-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_pm@d3hot-basic.html>
>         (Intel XE#355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/355>) +1
>         other test fail
>  *
>
>     igt@xe_pm@s2idle-multiple-execs:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +2
>         other tests dmesg-warn
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-exec-after:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s3-exec-after.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_pm@s3-exec-after.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>
>       o {shard-lnl}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         (Intel XE#1602
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>  *
>
>     {igt@kms_big_joiner@basic-force-joiner}:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_big_joiner@basic-force-joiner.html>
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-bottom:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>         (Intel XE#581
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/581>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@basic-plain-flip:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html>
>         (Intel XE#1150
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_flip@basic-plain-flip.html>
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html>
>         +8 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html>
>         (Intel XE#480
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/480>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html>
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         +74 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#1602
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         +3 other tests pass
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html>
>         (Intel XE#1330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-2/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64.html>
>         +7 other tests pass
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html>
>         (Intel XE#1471
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471> /
>         Intel XE#1495
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-4/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html>
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>
>       o {shard-lnl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html>
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_pm_dc@dc9-dpms.html>
>  *
>
>     igt@kms_pm_rpm@cursor-dpms:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html>
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (Intel XE#1605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>  *
>
>     igt@kms_vblank@wait-forked:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html>
>         (Intel XE#1602
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-7/igt@kms_vblank@wait-forked.html>
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/821>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html>
>  *
>
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
>
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html>
>         (Intel XE#1617
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html>
>         (Intel XE#1044
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html>
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
>
>       o {shard-lnl}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html>
>         (Intel XE#1537
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html>
>  *
>
>     igt@xe_exec_threads@threads-bal-userptr-rebind:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_exec_threads@threads-bal-userptr-rebind.html>
>         (Intel XE#1088
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088> /
>         Intel XE#1330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_exec_threads@threads-bal-userptr-rebind.html>
>  *
>
>     igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html>
>         (Intel XE#1206
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206> /
>         Intel XE#1261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261> /
>         Intel XE#1356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-basic:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-basic.html>
>         (Intel XE#1256
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-basic.html>
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html>
>  *
>
>     igt@xe_module_load@many-reload:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@many-reload.html>
>         (Intel XE#1554
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1554>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_module_load@many-reload.html>
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_module_load@reload.html>
>  *
>
>     igt@xe_pm@d3hot-basic-exec:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html>
>         (Intel XE#355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/355>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html>
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s2idle-basic.html>
>         (Intel XE#1044
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_pm@s2idle-basic.html>
>  *
>
>     igt@xe_pm@s3-basic:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_pm@s3-basic.html>
>         +1 other test pass
>  *
>
>     igt@xe_spin_batch@spin-fixed-duration:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration.html>
>  *
>
>     igt@xe_vm@large-userptr-binds-16777216:
>
>       o {shard-lnl}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html>
>         (Intel XE#1619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-7/igt@xe_vm@large-userptr-binds-16777216.html>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_vm@large-userptr-binds-16777216.html>
>         (Intel XE#1619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_vm@large-userptr-binds-16777216.html>
>  *
>
>     igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html>
>         (Intel XE#1440
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-8/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html>
>
>
>         Warnings
>
>  *
>
>     igt@core_hotunplug@hotreplug:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@core_hotunplug@hotreplug.html>
>         (Intel XE#1538
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html>
>         (Intel XE#1619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +3
>         other tests fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/intel/issues/3804>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804>)
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +16
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html>
>         (Intel XE#1151
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_plane_lowres@tiling-x:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         (Intel XE#380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/380> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#909
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr@fbc-pr-primary-page-flip:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-dpms:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html>
>         (Intel XE#1177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_psr@fbc-psr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_evict@evict-beng-small-multi-vm-cm:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_evict@evict-beng-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-small-multi-vm-cm:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_evict@evict-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5
>         other tests skip
>  *
>
>     igt@xe_pm@s2idle-basic-exec:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@xe_pm@s2idle-d3hot-basic-exec:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_7806 -> IGT_7807
>   * Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb ->
>     xe-pw-132150v5
>
> IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 
> 5f7597e990bea547bd1261170497e7476fb781bb
> xe-pw-132150v5: 132150v5
>
--------------cy9dEZlcUNFZXOETuPhGui8E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 17-04-2024 08:06, Patchwork wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:171332141117.1463550.213283587310=
1754416@8e613ede5ea5">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Cleanup and fixes in drmm_add_action_or_reset usage
              (rev5)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/132150/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/132150/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132150v5/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -&gt;
        xe-pw-132150v5_full</h1>
      <h2>Summary</h2>
      <p><strong>WARNING</strong></p>
      <p>Minor unknown changes coming with xe-pw-132150v5_full need to
        be verified<br>
        manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-132150v5_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-132150v5_full:</p>
      <h3>IGT changes</h3>
      <h4>Warnings</h4>
      <ul>
        <li>igt@core_hotunplug@hotrebind:
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@cor=
e_hotunplug@hotrebind.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-s=
end=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1352" moz-do-not-send=3D"true">Intel XE#1352</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard=
-adlp-1/igt@core_hotunplug@hotrebind.html" moz-do-not-send=3D"true">DMESG-F=
AIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">Th=
is patch doesn't introduce the error; rather, it reports it differently. </=
span><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-san=
s-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Ca=
ntarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Ari=
al, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe =
UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 25=
5); text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial; display: inline !important; float: none;">The =
original failure remains the same and underscores the issue of stale sysfs =
directories persisting after a hot unbind, which can lead to complications =
during subsequent bind attempts.</span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:171332141117.1463550.213283587310=
1754416@8e613ede5ea5">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotrebind:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@cor=
e_hotunplug@hotrebind.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603" moz-do-not-s=
end=3D"true">Intel XE#1603</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132150v5/shard-lnl-8/igt@core_hotunplug@hotrebind.htm=
l" moz-do-not-send=3D"true">DMESG-FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@hotrebind-lateclose:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@cor=
e_hotunplug@hotrebind-lateclose.html" moz-do-not-send=3D"true">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595" mo=
z-do-not-send=3D"true">Intel XE#1595</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1603" moz-do-not-send=3D"true">Intel XE#1603=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1321=
50v5/shard-lnl-3/igt@core_hotunplug@hotrebind-lateclose.html" moz-do-not-se=
nd=3D"true">DMESG-FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms=
_fbcon_fbt@fbc-suspend.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-3/i=
gt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send=3D"true">INCOMPLETE</a><=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms=
_psr@fbc-psr2-cursor-render@edp-1.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/sh=
ard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html" moz-do-not-send=3D=
"true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_low_max:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@xe_gt_freq@freq_low_max.=
html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_=
live_ktest@xe_mocs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@x=
e_live_ktest@xe_mocs.html" moz-do-not-send=3D"true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-132150v5_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@intel_hwmon@hwmon-write.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1125" moz-do-not-send=3D"true">Intel XE#1125</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_async_flips@async-fl=
ip-with-page-flip-events.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-no=
t-send=3D"true">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-=
not-send=3D"true">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/358" moz-do-not-send=3D"true">Intel XE#358</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hd=
mi-a-1-y:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_async_flips@async-fl=
ip-with-page-flip-events@pipe-a-hdmi-a-1-y.html" moz-do-not-send=3D"true">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1033" moz-do-not-send=3D"true">Intel XE#1033</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">In=
tel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hd=
mi-a-1-y:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_async_flips@async-fl=
ip-with-page-flip-events@pipe-b-hdmi-a-1-y.html" moz-do-not-send=3D"true">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1033" moz-do-not-send=3D"true">Intel XE#1033</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">In=
tel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/324" moz-do-not-send=3D"true">Intel XE#324</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hd=
mi-a-6-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_async_flips@asy=
nc-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/650" moz-do-not-send=3D"true">Intel XE#650</a>) +12 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hd=
mi-a-6-4-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_async_flips@asy=
nc-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/801" moz-do-not-send=3D"tru=
e">Intel XE#801</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hd=
mi-a-7-4-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_async_flips@asy=
nc-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1185" moz-do-not-send=3D"true">Intel XE#1185</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_big_fb@4-tiled-=
16bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-=
rotate-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/316" moz-do-not-send=3D"true">Intel XE#316</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@y-tiled-max-h=
w-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"=
 moz-do-not-send=3D"true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-as=
ync-flip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-d=
o-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send=3D"true">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz=
-do-not-send=3D"true">Intel XE#1231</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-addf=
b.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" =
moz-do-not-send=3D"true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-=
hw-stride-32bpp-rotate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-se=
nd=3D"true">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +14 o=
ther
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-asy=
nc-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_big_fb@yf-tiled=
-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124" moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_bw@linear-tilin=
g-2-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_bw@linear-tiling-2-d=
isplays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi=
-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_ccs@ccs-on-another-b=
o-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" m=
oz-do-not-send=3D"true">Intel XE#787</a>) +41 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a=
-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@kms_ccs@crc-primary=
-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#7=
87</a>) +51 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-=
hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#=
787</a>) +74 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-=
dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_ccs@crc-sprite-=
planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87" moz-do-not-send=3D"true">Intel XE#787</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_cdclk@plane-sca=
ling@pipe-b-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1152" moz-do-not-send=3D"true=
">Intel XE#1152</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_chamelium_color@ctm-=
0-50.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6" moz-do-not-send=3D"true">Intel XE#306</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_chamelium_edid@dp-ed=
id-resolution-list.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_chamelium_frame=
s@hdmi-frame-dump.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_content_protection@d=
p-mst-lic-type-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/307" moz-do-not-send=3D"true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_crc@cursor-on=
screen-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/308" moz-do-not-send=3D"true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_cursor_crc@cursor-su=
spend.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Int=
el XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/927" moz-do-not-send=3D"true">Intel XE#927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_cursor_crc@cursor-su=
spend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-s=
end=3D"true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/ig=
t@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132150v5/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
 moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282" m=
oz-do-not-send=3D"true">Intel XE#282</a>) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/ig=
t@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send=3D"=
true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132150v5/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-le=
gacy.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Inte=
l XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/282" moz-do-not-send=3D"true">Intel XE#282</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/910" moz-do-not-send=3D"true">Inte=
l XE#910</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_cursor_legacy@cursor=
b-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">Intel XE#=
309</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions-varying-size:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_legacy@short-=
busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"tr=
ue">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_dither@fb-8bpc-=
vs-panel-8bpc@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-=
do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>=
) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_feature_discovery@ch=
amelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/701" moz-do-not-send=3D"true">Intel XE#701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_feature_discovery@dp=
-mst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1137" moz-do-not-send=3D"true">Intel XE#1=
137</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms=
-off-vs-modeset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/310" moz-do-not-send=3D"true">Intel XE#310</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_flip@2x-flip-vs=
-suspend@cd-hdmi-a6-hdmi-a7.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_flip@flip-vs-suspend=
@b-hdmi-a1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true=
">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1608" moz-do-not-send=3D"true">Intel XE#1608</a>) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downsc=
aling:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_flip_scaled_crc@flip=
-32bpp-xtile-to-64bpp-xtile-downscaling.html" moz-do-not-send=3D"true">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/422" m=
oz-do-not-send=3D"true">Intel XE#422</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/616" moz-do-not-send=3D"true">Intel XE#616</=
a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rc=
ccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_flip_scaled_crc=
@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true=
">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms=
_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-64bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_flip_scaled_crc=
@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_flip_scaled_crc@flip=
-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-=
send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>) +3 other =
tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt=
:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_frontbuffer_tracking=
@drrs-2p-primscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656</a>)=
 +61 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-dra=
w-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Inte=
l XE#651</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_frontbuffer_tracking=
@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE=
#651</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#6=
53</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw=
-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_frontbuffer_tracking=
@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#=
653</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_getfb@getfb-reject-c=
cs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341=
" moz-do-not-send=3D"true">Intel XE#1341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@kms_hdr@static-togg=
le-suspend@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-sen=
d=3D"true">Intel XE#616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_pipe_crc_basic@suspe=
nd-read-crc@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do=
-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>=
) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format@pipe-b:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_plane@pixel-format@p=
ipe-b.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1331" moz-do-not-send=3D"true">Intel XE#=
1331</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@kms_plane_lowres@ti=
ling-x@pipe-a-hdmi-a-7.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-s=
end=3D"true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_plane_lowres@tiling-=
x@pipe-c-hdmi-a-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send=3D"true=
">Intel XE#616</a>) +9 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html" moz-do-not-send=3D=
"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-132150v5/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-=
a-dp-4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/361" moz-do-not-send=3D"true">Intel XE#=
361</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixe=
l-formats@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_plane_scaling@p=
lane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html" moz-=
do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/904" moz-do=
-not-send=3D"true">Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/909" moz-do-not-send=3D"true">Intel XE#909</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scali=
ng@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_plane_scaling@planes=
-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/305" moz-do-not-send=3D"true=
">Intel XE#305</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
25:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_plane_scaling@planes=
-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/305" moz-do-not-send=3D"true">Intel XE#305</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz=
-do-not-send=3D"true">Intel XE#455</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_pm_backlight@fade.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-=
do-not-send=3D"true">Intel XE#870</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1129" moz-do-not-send=3D"true">Intel XE#1129</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-=
not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-rte:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_pm_rpm@basic-rte.htm=
l" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1203" moz-do-not-send=3D"true">Intel XE#1203</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@kms_pm_rpm@cursor-dpms.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-4=
36/igt@kms_pm_rpm@cursor-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not=
-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1211" moz-do-not-send=3D"true">Intel XE#1211</a>) +2=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms=
_pm_rpm@modeset-stress-extra-wait.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/sh=
ard-adlp-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1211" moz-do-not-send=3D"tru=
e">Intel XE#1211</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-=
plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_psr2_su@page_flip-xr=
gb8888.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE=
#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@kms_psr@fbc-psr2-pr=
imary-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_psr@psr-suspend.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do=
-not-send=3D"true">Intel XE#929</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_psr_stress_test@inva=
lidate-primary-flip-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149" moz-do-not-s=
end=3D"true">Intel XE#1149</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_rmfb@close-fd@pipe-a=
-hdmi-a-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/294" moz-do-not-send=3D"true">Intel =
XE#294</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_rotation_crc@primary=
-y-tiled-reflect-x-0.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-se=
nd=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_rotation_crc@pr=
imary-y-tiled-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/327" moz-do-not-send=3D"true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_sysfs_edid_timing.ht=
ml" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1174" moz-do-not-send=3D"true">Intel XE#1174</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-132150v5/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe=
-c-hdmi-a-6.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send=3D"true">Inte=
l XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/ig=
t@kms_vblank@ts-continuation-suspend.html" moz-do-not-send=3D"true">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5=
/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html" moz-do-not-send=
=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1162" moz-do-not-send=3D"true">Intel XE#1162</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=
=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_vrr@flip-suspend.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-d=
o-not-send=3D"true">Intel XE#455</a>) +40 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_writeback@writeback-=
invalid-parameters.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-433/igt@kms_writeback@write=
back-invalid-parameters.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-=
do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/488" moz-do-not-send=3D"true">Intel XE#488</a>)=
 +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-compute-kernel:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@xe_compute@ccs-mode=
-compute-kernel.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1050" moz-do-not-send=3D"true"=
>Intel XE#1050</a>)</li>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_compute@ccs-mode-comp=
ute-kernel.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1447" moz-do-not-send=3D"true">Intel XE#1447</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@xe_evict@evict-beng-threads-large.html" moz-do-not-send=3D"true">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/=
shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send=
=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-cm-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/ig=
t@xe_evict@evict-cm-threads-large.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/sh=
ard-dg2-463/igt@xe_evict@evict-cm-threads-large.html" moz-do-not-send=3D"tr=
ue">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1473" moz-do-not-send=3D"true">Intel XE#1473</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/392" moz-do-not-send=3D"true">I=
ntel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_evict@evict-large-mul=
ti-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
61" moz-do-not-send=3D"true">Intel XE#261</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_evict@evict-small-ext=
ernal-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261" moz-do-not-send=3D"true">Intel XE#261</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel =
XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p=
>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@xe_evict_ccs@evict-overc=
ommit-standalone-nofree-reopen.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a>) +2 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@xe_exec_fault_mode@=
many-execqueues-basic-prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +3 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_exec_fault_mode@once-=
bindexecqueue-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +26 other te=
sts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-gt-reset:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_exec_reset@cm-gt-rese=
t.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1068" moz-do-not-send=3D"true">Intel XE#1068=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html" moz-do-not-=
send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132150v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-use=
rptr-invalidate-race.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206" moz-do-not-send=
=3D"true">Intel XE#1206</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1261" moz-do-not-send=3D"true">Intel XE#1261</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356" moz-do-not-s=
end=3D"true">Intel XE#1356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/ig=
t@xe_exec_threads@threads-mixed-fd-userptr-rebind.html" moz-do-not-send=3D"=
true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132150v5/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-re=
bind.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1206" moz-do-not-send=3D"true">Intel X=
E#1206</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1356" moz-do-not-send=3D"true">Intel XE#1356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_=
live_ktest@xe_bo.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe=
_live_ktest@xe_bo.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send=3D"tru=
e">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/ig=
t@xe_live_ktest@xe_migrate.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2=
-464/igt@xe_live_ktest@xe_migrate.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do=
-not-send=3D"true">Intel XE#1192</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@xe_mmap@small-bar.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512" moz-do-n=
ot-send=3D"true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/ig=
t@xe_module_load@reload.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-43=
5/igt@xe_module_load@reload.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_noexec_ping_pong:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_noexec_ping_pong.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379" moz-do=
-not-send=3D"true">Intel XE#379</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_peer2peer@read.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1061" moz-do-not-send=3D"true">Intel XE#1061</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-=
not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3-mmap-system:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_pm@d3-mmap-system.htm=
l" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1221" moz-do-not-send=3D"true">Intel XE#1221</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-basic:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_=
pm@d3hot-basic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_p=
m@d3hot-basic.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/355" moz-do-not-send=3D"true">In=
tel XE#355</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-multiple-execs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@xe_pm@s2idle-multiple-ex=
ecs.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"true">Intel=
 XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"true">In=
tel XE#1608</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_pm@s3-d3cold-basic-ex=
ec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"=
 moz-do-not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-exec-after:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_=
pm@s3-exec-after.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe=
_pm@s3-exec-after.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=
=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_query@multigpu-query-=
invalid-extension.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944" moz-do-not-send=3D"true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms=
_big_fb@4-tiled-64bpp-rotate-0.html" moz-do-not-send=3D"true">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602" moz=
-do-not-send=3D"true">Intel XE#1602</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-6/igt@kms_big_fb@4-tiled-=
64bpp-rotate-0.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_big_joiner@basic-force-joiner}:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_big_joiner@basic-force-joiner.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_big_joiner@bas=
ic-force-joiner.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms=
_cursor_edge_walk@256x256-top-bottom.html" moz-do-not-send=3D"true">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/581" moz-=
do-not-send=3D"true">Intel XE#581</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_cursor_edge_walk=
@256x256-top-bottom.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/ig=
t@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html" moz-do-not-send=3D"=
true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"tr=
ue">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/910" moz-do-not-send=3D"true">Intel XE#910</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt=
@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html" moz-do-not-send=3D"t=
rue">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-toggle.html" moz-do-not-send=3D"true">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">In=
tel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-132150v5/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.=
html" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-plain-flip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms=
_flip@basic-plain-flip.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150" moz-do-not-=
send=3D"true">Intel XE#1150</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330" moz-do-n=
ot-send=3D"true">Intel XE#1330</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_flip@basic-plain-fl=
ip.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_flip@flip-vs-rmfb-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177" moz-do-=
not-send=3D"true">Intel XE#1177</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/=
shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html" moz-do-not-send=
=3D"true">PASS</a> +8 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms=
_flip@plain-flip-fb-recreate-interruptible.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/480=
" moz-do-not-send=3D"true">Intel XE#480</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-4/igt@kms_flip@plain-=
flip-fb-recreate-interruptible.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms=
_flip@plain-flip-fb-recreate-interruptible@b-edp1.html" moz-do-not-send=3D"=
true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886" moz-do-not-send=3D"true">Intel XE#886</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-4/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@b-edp1.html" moz-do-not-send=3D"true"=
>PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscal=
ing:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html" moz-do-not=
-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-a=
dlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.htm=
l" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do=
-not-send=3D"true">PASS</a> +74 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw=
-render:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms=
_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html" moz-do=
-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1602" moz-do-not-send=3D"true">Intel XE#1602</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/sha=
rd-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-ren=
der.html" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms=
_plane_cursor@overlay@pipe-a-edp-1-size-64.html" moz-do-not-send=3D"true">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1330" moz-do-not-send=3D"true">Intel XE#1330</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-2/igt@kms_pla=
ne_cursor@overlay@pipe-a-edp-1-size-64.html" moz-do-not-send=3D"true">PASS<=
/a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms=
_plane_cursor@primary@pipe-a-edp-1-size-64.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/147=
1" moz-do-not-send=3D"true">Intel XE#1471</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1495" moz-do-not-send=3D"true">Intel XE=
#1495</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132150v5/shard-lnl-4/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.htm=
l" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixe=
l-formats:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms=
_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html" moz-=
do-not-send=3D"true">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@kms_plane_scaling@plane-scaler=
-with-clipping-clamping-pixel-formats.html" moz-do-not-send=3D"true">PASS</=
a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms=
_pm_dc@dc5-psr.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/718" moz-do-not-send=3D"true">I=
ntel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-132150v5/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send=3D"=
true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@kms_pm_dc@dc9-dpms.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send=3D"=
true">Intel XE#1204</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-132150v5/shard-dg2-436/igt@kms_pm_dc@dc9-dpms.html" moz-do-n=
ot-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor-dpms:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_pm_rpm@cursor-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"t=
rue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1211" moz-do-not-send=3D"true">Intel XE#1211</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/=
igt@kms_pm_rpm@cursor-dpms.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1211" moz-do-not-send=3D"true">Intel XE#1211</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-=
dg2-436/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send=3D"true">PASS</a>=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms=
_psr2_sf@overlay-plane-update-continuous-sf.html" moz-do-not-send=3D"true">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
05" moz-do-not-send=3D"true">Intel XE#1605</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-1/igt@kms_psr2_sf@=
overlay-plane-update-continuous-sf.html" moz-do-not-send=3D"true">PASS</a><=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-forked:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms=
_vblank@wait-forked.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602" moz-do-not-se=
nd=3D"true">Intel XE#1602</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132150v5/shard-lnl-7/igt@kms_vblank@wait-forked.html" =
moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@xe_evict@evict-large-multi-vm-cm.html" moz-do-not-send=3D"true">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/821" =
moz-do-not-send=3D"true">Intel XE#821</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-436/igt@xe_evict@evict-=
large-multi-vm-cm.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_=
exec_compute_mode@many-bindexecqueue-userptr.html" moz-do-not-send=3D"true"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1617" moz-do-not-send=3D"true">Intel XE#1617</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-2/igt@xe_ex=
ec_compute_mode@many-bindexecqueue-userptr.html" moz-do-not-send=3D"true">P=
ASS</a></li>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_=
exec_compute_mode@many-bindexecqueue-userptr.html" moz-do-not-send=3D"true"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1044" moz-do-not-send=3D"true">Intel XE#1044</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">=
Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-132150v5/shard-adlp-4/igt@xe_exec_compute_mode@many-bindexecqueue-=
userptr.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race=
-prefetch:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_=
exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html" moz-=
do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1537" moz-do-not-send=3D"true">Intel XE#1537</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/s=
hard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-p=
refetch.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-userptr-rebind:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_=
exec_threads@threads-bal-userptr-rebind.html" moz-do-not-send=3D"true">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1088" moz-do-not-send=3D"true">Intel XE#1088</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1330" moz-do-not-send=3D"true">Intel=
 XE#1330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132150v5/shard-adlp-1/igt@xe_exec_threads@threads-bal-userptr-rebind.ht=
ml" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/ig=
t@xe_exec_threads@threads-cm-fd-userptr-invalidate.html" moz-do-not-send=3D=
"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1206" moz-do-not-send=3D"true">Intel XE#1206</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1261" moz-do-not-send=3D"tru=
e">Intel XE#1261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1356" moz-do-not-send=3D"true">Intel XE#1356</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/=
igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html" moz-do-not-send=
=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/ig=
t@xe_exec_threads@threads-hang-fd-basic.html" moz-do-not-send=3D"true">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256" =
moz-do-not-send=3D"true">Intel XE#1256</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@xe_exec_thread=
s@threads-hang-fd-basic.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_=
gt_freq@freq_reset_multiple.html" moz-do-not-send=3D"true">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-ln=
l-6/igt@xe_gt_freq@freq_reset_multiple.html" moz-do-not-send=3D"true">PASS<=
/a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@many-reload:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
module_load@many-reload.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1554" moz-do-not=
-send=3D"true">Intel XE#1554</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_module_load@many-reloa=
d.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
module_load@reload.html" moz-do-not-send=3D"true">FAIL</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@=
xe_module_load@reload.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@xe_pm@d3hot-basic-exec.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/355" moz-do-not-sen=
d=3D"true">Intel XE#355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@xe_pm@d3hot-basic-exec.html" =
moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_=
pm@s2idle-basic.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1044" moz-do-not-send=3D=
"true">Intel XE#1044</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-se=
nd=3D"true">Intel XE#1358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_pm@s2idle-basic.html" moz=
-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_=
pm@s3-basic.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"tru=
e">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/i=
gt@xe_pm@s3-basic.html" moz-do-not-send=3D"true">PASS</a> +1 other test pas=
s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-fixed-duration:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_=
spin_batch@spin-fixed-duration.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081" moz-do-no=
t-send=3D"true">Intel XE#1081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_spin_batch@spin-fixed=
-duration.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@large-userptr-binds-16777216:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_=
vm@large-userptr-binds-16777216.html" moz-do-not-send=3D"true">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619" mo=
z-do-not-send=3D"true">Intel XE#1619</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-7/igt@xe_vm@large-userpt=
r-binds-16777216.html" moz-do-not-send=3D"true">PASS</a></li>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_=
vm@large-userptr-binds-16777216.html" moz-do-not-send=3D"true">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619" mo=
z-do-not-send=3D"true">Intel XE#1619</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_vm@large-userp=
tr-binds-16777216.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-h=
ammer:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_=
vm@munmap-style-unbind-either-side-partial-split-page-hammer.html" moz-do-n=
ot-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1440" moz-do-not-send=3D"true">Intel XE#1440</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-lnl-8=
/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html" =
moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@cor=
e_hotunplug@hotreplug.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-s=
end=3D"true">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@core_hotunplug@hotreplug.ht=
ml" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1538" moz-do-not-send=3D"true">Intel XE#1538</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/i=
gt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1177" moz-do-not-send=3D"true">Intel XE#1177</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-s=
end=3D"true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip=
:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-se=
nd=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1619" moz-do-not-send=3D"true">Intel XE#1619</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp=
-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz=
-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_big_fb@y-tiled-8bpp-rotate-180.html" moz-do-not-send=3D"true">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619" mo=
z-do-not-send=3D"true">Intel XE#1619</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_big_fb@y-tile=
d-8bpp-rotate-180.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send=3D"true=
">Intel XE#616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_=
big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send=3D"=
true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/616" moz-do-not-send=3D"true">Intel XE#616</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-6/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-=
not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1231" moz-do-not-send=3D"true">Intel XE#1231</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp=
-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.htm=
l" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324<=
/a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-f=
lip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1177" moz-do-not-send=3D"true">Intel XE#1177</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-n=
ot-send=3D"true">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) =
+2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
 moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_ccs@bad-pi=
xel-format-4-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not=
-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not=
-send=3D"true">Intel XE#787</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_ccs@bad-rotation-90-4-tiled-xe2-ccs.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_ccs@bad-rotati=
on-90-4-tiled-xe2-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1252" moz-do-not-send=3D"true">Intel XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_chamelium_frames@hdmi-crc-single.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do=
-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/s=
hard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13215=
0v5/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-single.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_chamelium_hpd@common-hpd-after-hibernate.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_chamelium=
_hpd@common-hpd-after-hibernate.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-n=
ot-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +3=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_cursor_crc@curs=
or-onscreen-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"t=
rue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308" moz-do-not-send=3D"true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-466/ig=
t@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"tr=
ue">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1162" moz-do-not-send=3D"true">Intel XE#1162</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-464/igt@=
kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
616" moz-do-not-send=3D"true">Intel XE#616</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send=3D"=
true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"tr=
ue">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-v=
arying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a>)</li>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms=
_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">Intel X=
E#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132150v5/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_cursor_legacy@cursorb-vs-flipb-legacy.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_cursor_legac=
y@cursorb-vs-flipb-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309" moz-do-not-send=3D"true">Intel XE#309</a>) +1 othe=
r test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/=
shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send=3D=
"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"t=
rue">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">I=
ntel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3804" moz-do-not-send=3D"true">i915#3804</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_dither=
@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3804" moz-do-not-send=3D"true">i915#3804</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_flip@2x-nonexisting-fb-interruptible.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" mo=
z-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@kms_flip@2x-nonex=
isting-fb-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310" moz-do-not-send=3D"true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html" moz-do-not-send=3D"true=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true"=
>Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132150v5/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@=
a-hdmi-a1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"true"=
>Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"tr=
ue">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-u=
pscaling:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-ad=
lp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-b=
lt:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1177" moz-do-not-send=3D"true">Intel XE#1177</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-=
offscren-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@kms_f=
rontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Inte=
l XE#656</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1177" moz-do-not-send=3D"true">Intel XE#1177</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-=
not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656</a>) +=
3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-dra=
w-blt:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-=
1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-=
not-send=3D"true">Intel XE#651</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-463/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=
=3D"true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-=
blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-se=
nd=3D"true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132150v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do=
-not-send=3D"true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms=
_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D=
"true">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@fbcdrrs-tiling-4.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@kms_frontbuffer_=
tracking@fbcdrrs-tiling-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151" moz-do-not-se=
nd=3D"true">Intel XE#1151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw=
-render:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adl=
p-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz=
-do-not-send=3D"true">Intel XE#653</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177" moz-d=
o-not-send=3D"true">Intel XE#1177</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v=
5/shard-adlp-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"t=
rue">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_hdmi_inject@inject-audio.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177" moz-do-not-se=
nd=3D"true">Intel XE#1177</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-=
adlp-9/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/417" moz-do-not-send=3D"true">Intel XE#417=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_plane@pla=
ne-panning-bottom-right-suspend.html" moz-do-not-send=3D"true">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" mo=
z-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214=
</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/ig=
t@kms_plane_lowres@tiling-x.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/s=
hard-dg2-464/igt@kms_plane_lowres@tiling-x.html" moz-do-not-send=3D"true">D=
MESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/324" moz-do-not-send=3D"true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-fo=
rmat:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html" moz-=
do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/380" moz-do-not-send=3D"true">Intel XE#380</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/904" moz-do-not-=
send=3D"true">Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/909" moz-do-not-send=3D"true">Intel XE#909</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-d=
g2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.h=
tml" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1=
195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/90=
4" moz-do-not-send=3D"true">Intel XE#904</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/909" moz-do-not-send=3D"true">Intel XE#9=
09</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-fo=
rmat@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdm=
i-a-6.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/904" moz-do-not-send=3D"true">Intel X=
E#904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
909" moz-do-not-send=3D"true">Intel XE#909</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-434/igt@kms_plane_=
scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html" =
moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/904" mo=
z-do-not-send=3D"true">Intel XE#904</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/909" moz-do-not-send=3D"true">Intel XE#909</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixe=
l-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/ig=
t@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/sh=
ard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel=
-formats.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">=
Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/909" moz-do-not-send=3D"true">Intel XE#909</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177" moz-do-not-s=
end=3D"true">Intel XE#1177</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard=
-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
2" moz-do-not-send=3D"true">Intel XE#1122</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE=
#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_psr2_sf@cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1177" moz-do-not-send=3D"true">Intel XE#1177</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-132150v5/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-ex=
ceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel X=
E#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_psr@fbc-pr-primary-page-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not=
-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_psr@fbc-pr-primary-pa=
ge-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929" moz-do-not-send=3D"true">Intel XE#929</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-dpms:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_psr@fbc-psr-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1177" moz-do-not-send=3D"tru=
e">Intel XE#1177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/i=
gt@kms_psr@fbc-psr-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +2 other =
tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_tv_load_detect@load-detect.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_tv_load_detect@load-det=
ect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/330=
" moz-do-not-send=3D"true">Intel XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms=
_vblank@ts-continuation-suspend.html" moz-do-not-send=3D"true">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034" mo=
z-do-not-send=3D"true">Intel XE#1034</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927" =
moz-do-not-send=3D"true">Intel XE#927</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_vblank@ts-co=
ntinuation-suspend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-se=
nd=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not=
-send=3D"true">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms=
_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"tr=
ue">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1034" moz-do-not-send=3D"true">Intel XE#1034</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"tru=
e">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-132150v5/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pi=
pe-a-hdmi-a-1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"t=
rue">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms=
_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@kms_write=
back@writeback-check-output-xrgb2101010.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
evict@evict-beng-small-multi-vm-cm.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_evict@evict-beng-=
small-multi-vm-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261" moz-do-not-send=3D"true">Intel XE#261</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/ig=
t@xe_evict@evict-mixed-many-threads-large.html" moz-do-not-send=3D"true">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
041" moz-do-not-send=3D"true">Intel XE#1041</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel =
XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/392" moz-do-not-send=3D"true">Intel XE#392</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-dg2-435/igt@xe_evict=
@evict-mixed-many-threads-large.html" moz-do-not-send=3D"true">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" mo=
z-do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392" =
moz-do-not-send=3D"true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-multi-vm-cm:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
evict@evict-small-multi-vm-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not=
-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132150v5/shard-adlp-1/igt@xe_evict@evict-small-mult=
i-vm-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/261" moz-do-not-send=3D"true">Intel XE#261</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel X=
E#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
exec_fault_mode@many-userptr-invalidate-race.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v5/shard-adlp-9/igt@xe_exec_fa=
ult_mode@many-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" mo=
z-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</=
a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@xe_=
pm@s2idle-basic-exec.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-se=
nd=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not=
-send=3D"true">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132150v5/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.h=
tml" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1=
214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/16=
08" moz-do-not-send=3D"true">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
pm@s2idle-d3hot-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132150v5/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exe=
c.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel X=
E#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1608" moz-do-not-send=3D"true">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_=
query@multigpu-query-hwconfig.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not=
-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-132150v5/shard-adlp-2/igt@xe_query@multigpu-query-h=
wconfig.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/944" moz-do-not-send=3D"true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_7806 -&gt; IGT_7807</li>
        <li>Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb
          -&gt; xe-pw-132150v5</li>
      </ul>
      <p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-1095-5f7597e990bea547bd1261170497e7476fb781bb:
        5f7597e990bea547bd1261170497e7476fb781bb<br>
        xe-pw-132150v5: 132150v5</p>
    </blockquote>
  </body>
</html>

--------------cy9dEZlcUNFZXOETuPhGui8E--
