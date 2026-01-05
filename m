Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A7CD0402
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 20:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EFF8825E;
	Mon,  5 Jan 2026 20:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJbj44FC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3389343
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767646318; x=1799182318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UF6ZiStO7+F0Mw83IjLMSEOySiQPPAUgYza92TO82lw=;
 b=iJbj44FChJENMTay9ltR5mtMhFiTLZPK14AtWCWXZz6/AXS2YSdalxKf
 0tyqjkcf+196MbnPniuJIkLCyJ3Bt4/JJkL5+ic2Cd7opIU2kH1QNd7wW
 789l6oknlBgKAI+69DA2RE2BI1Y4lw243y3LUPXoadwaV0hFnhz1Pq+cc
 Q0UyCoC/Pgy4RJiPp66aI/74jMA7rjUaMuShN8m9LlG09oU8NJWCD99iB
 xWSXqY0lO8vhRWF/oFaOM9DLF8isArnnBTUG3VReetvS3agLnjro0p1GE
 5e9Ti1vB/Z3lJODYjuZyLR8OyowY7q0IV7lcD8Fg9xjmWJXTwY66pATTU A==;
X-CSE-ConnectionGUID: /9MLspZcRG2IKO8Onlp28A==
X-CSE-MsgGUID: OSXKTcbVQV+wrhAPxUW3NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69092713"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69092713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:51:58 -0800
X-CSE-ConnectionGUID: GlDqti/LSsmEDjOmEb5EFg==
X-CSE-MsgGUID: 6n5n/JvuSZCCfrkbrHMyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="239968989"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:51:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 12:51:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 12:51:57 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 12:51:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWxGQCdjt0IwBJeunyzbOX3qVacm9ep8qF3dVeRaAp8KuFmxlqihJ592rzwAQpyfGdA4qLNzJDd4ReeG5crgevruznBbRnA3ew+D778c0FtioaxF8+jLIm0dxT7ukBLOu0xsZcHNJH1RMOZkz3vunUdkVK4B279qxnju/d1OByE5Qv+hCwCBCWRs0xRP1KIFykxxVW3QBlqAhFxXlH1PUNQQL5VbpQLmravDP2uSy9yUnUJJNprJ2lly1V812ZBU47gm8UhCba6+6woYFjUZ5RxpbSLh+pQUtciKZzncKb7NlkUAgK3FSh+ReHeVfBMiIxFCmMzm8kQ1NA0OPzbJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnYr0/GA8CMu+p0VRRKCA21ASIaNSUIbm5jg7/4WvNo=;
 b=aPX0da96zhuQngfRwdvEFdzhvyFVwLajVSKUsa4affiWEoqz+p3SVnnlGlbf78OPwpSzRoArhs47Z3d/2fyuYQUv1/lUGdUaPLTZ8GIp1jmNPV9J74SJqWNVtmM0Gh7tPFKV0BojYjyebwFNhbU3bMjlnUf534iXw10csv8Gk1to0lqlblY5+0uBvOtmVqMtnFgWeDUAuZBQngH5eMPpJfpiHLFoA1XRfqwpyzz7+rxRxtiS16WIw79nvblI93wTAm9plezaEATDX3PxNhl3I9zmrlOT8byuBfj8q8rEbOravrvdIwmwHGAdbGwW4Lzq3tffDM6IKzvKAYVYIVIYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:51:49 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 20:51:49 +0000
Message-ID: <ceacec3e-fe14-46c9-ad35-5ddb5e53ce92@intel.com>
Date: Mon, 5 Jan 2026 22:53:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
To: Matt Roper <matthew.d.roper@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
 <176763926313.9480.16817172111730313247@intel.com>
 <cbed73c3-db1d-4d2b-8d6b-39e6d32ab795@intel.com>
 <20260105202439.GO1180203@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20260105202439.GO1180203@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SN7PR11MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 20307a0c-b718-47a6-860d-08de4c9c3f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHlrR2VlRkRSVy9LMkFTV2VpTXpaWUVFQ3JnL3ZRc0Q3QjBQNnV6YU1GTHV3?=
 =?utf-8?B?QlZMczRoL1RWRDZpcmdFTTlCbEhrOVVydHl2bmtxbFM0YmtkWnJaRzlNVmRz?=
 =?utf-8?B?VFBYQ3FpNjc4MFdPTU42aVFpS2t0RXlWMXNkME5xb3ZrQUloM2JVSWViM1JQ?=
 =?utf-8?B?R3RtUlpmYlZFT0dMb0wzcE9nWWw2RU14VVRGOXZCaFJLL2FkMDJ3aWlNdkFh?=
 =?utf-8?B?NFVUYlRMWFZubVc2QmhyekhsMERqbFExTHpQSzVHenpzNWdHbHFWMU1jMjNt?=
 =?utf-8?B?b1ZuWW03eFJSai9WS05YZ3JLWUhNK0wwNDVPakg4UDhzSjhKS1hURjFMK1JS?=
 =?utf-8?B?UmlDWXVIZkZGSW1LeXZHZ1V1cVNnZCtxOWM0K3MzV3gvU1c3bE5zdjNWYmFa?=
 =?utf-8?B?dUpoSzdRTjN4cENOSkNvZHJzTmlkYWNxTDJoa0V4TlNIemIwZUdFWkxVRDZB?=
 =?utf-8?B?cC9GU0dXdFhuMmpSVkJyanlXajB4SjJXbWFSTEJzUVU3bkZYUkg2SGpNbnp6?=
 =?utf-8?B?b3VVY21RY01FR2ovMkRqekQ2WUpWQ3JxcGdXTGw3M1FjYkxVWldYMXJpd2xy?=
 =?utf-8?B?b3Y1S2RTbHRZdnBPcnlPU3I4bkNzNTNnTDRWcUhQNkorL2czOVlTc0RKalVG?=
 =?utf-8?B?MC8yTmx5ZFpLR3FOTWZvYWpFSVJGTDIxbnJOU0JnWjFyMVlhYThoNU16UVhs?=
 =?utf-8?B?NVdseFBVQ0NiOTQzaXRPK3pOMDhpMGVWSEFnTllxdDczWkNWZGRUM1ZGSTJK?=
 =?utf-8?B?SFQzU05COVM0YWw0UXRZNEJ1RmJkZHVJazB1ekF3NSsxUXh3dmg0Y0dYNTFR?=
 =?utf-8?B?MDNjVTdyZGlzWlA1YktCSTg1dUdjMDFLNnJLMGtjTUU1MHBoaVFIckUvOFJa?=
 =?utf-8?B?OE03VVFPSGcvUVpya1V5WUNDamd2UGxnL0JETmIwTXZ0am9NaGd0MUtSTVJy?=
 =?utf-8?B?QlBpY1BwZkF2a2h0WDZuem9nRmlFQnByVjBhcGRYUk1iaXgwdU80cE5qUTFF?=
 =?utf-8?B?NEw3UkcwUGE5ZWVBZzBxWkJMbGlQM0lidlVaMkhpZG1BVTlhQmI3NjNOSnFV?=
 =?utf-8?B?eFFNV0V4WUFBdW5EYUd1RC9nSzlLVlowZzRMdldGeFQ5bm1NRmRmL1hRc2tv?=
 =?utf-8?B?QUdRRHZ3RFNlbjI0bUxBbEZJSVp3OUE0R0VMNjBUL0NBbzg3TnNEUWtKUHFy?=
 =?utf-8?B?RThoVTUrOHJkTys1ekZIZW9mWXVRbytBRnVYOXZVaDY5VmdoRjNNckFQdkFq?=
 =?utf-8?B?VkE1aUMrNG4xUkJMaWlQNFNMOGJBbXBSNWZXYWhhZG5mWTYxcHlSTVVaeGZu?=
 =?utf-8?B?Q1Z3ZElLZGhGd3hBODhXd0RQenY2TGtjQjBMTmVBTWpCa3puQVE0Tmd6QlhM?=
 =?utf-8?B?NU9jYkYyR1NoSmxjYVNLZzVVMFpmaURKTHphZExtVVhkd1NmZkV6OVBuVmha?=
 =?utf-8?B?QWtwbEZOSTY1RnF1SVI2a2VrTUM0ZzU3L3FNc3FOZFdpbUtrampOVWM4Qld3?=
 =?utf-8?B?bEduQk05TTAxTDlEeW5HUU9qOFdXcHV3NWQ4cVJiRk9EbTRvZUtWOEhTa3FD?=
 =?utf-8?B?ci96d0RjTUZ2UzdJODI2OFZQa0MxaGd3RVgxTnc5ZkI0aUw2ZUthL08zazNj?=
 =?utf-8?B?YjVoUjdpSUcrWG45RlVDN3ZDTHBYcEdrWDJTYmE0eTYvUTN4N3ZnakRPODF2?=
 =?utf-8?B?K3pZeExOM3MzQnd3RVkxZkxvZXl2R2c1c0MxYTdxSklLRzNOKzFDTXpvWlli?=
 =?utf-8?B?QmQ1R01LTDZKa2FvalB2THhrZTBxN2tNNnBGZlBZSE45RksyNXBKL1piL2JL?=
 =?utf-8?B?RSs1azBHWVQ3VkhYODhtRm50ZUlWQmdxVVkrRVBsaWpwdWdha3crdEJPU2Vp?=
 =?utf-8?B?RjBOZDVXdTRIYk1RMzVJNXlOQlhHOGJGRHlJcDNqV09TL0o0N2czNlhxNjZB?=
 =?utf-8?Q?NQR5HlyM0+JUpSQOuQ26pa7H+ckgIAC+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWhibjQ4dmF3RHkwTjI2dTZaUWZCY051ZitXMEJndTVSSWZLM3h2UDNkVlI2?=
 =?utf-8?B?eHlVK2FyRzZVTzFlTlU0TUdsa2prVldPOXhiN0R1ODZPOTY4RWw2cTdDK1Va?=
 =?utf-8?B?eXRTcUdwb2ZpYmJ1ZHZ5azE0ZkdEZWZ6ZFc0NU95aXVyQzFLMk5Xa21ZdUk3?=
 =?utf-8?B?NzE1ZjI4OHJtOXVsWGJ1NWxCQkhxb0JCZjhqT0p0QVZLdmdHaDFjS0NtdGYv?=
 =?utf-8?B?RWcxSWV2Qnp5Q3Ntd1hLSHlKVXhUMGtyNmtzdHVjWFIwZTROS3ozNm1kd1NR?=
 =?utf-8?B?ZERGbk1ERkY0a3BLU2oyR1EyTitHMWhwRm95dnFrLzM3MnRKOC84SHlIYkVR?=
 =?utf-8?B?VWN1NVJtQlZoU01vRkk4bXJLcDNXMm5Ea3JWWkVSSlkxS2FlWUlBOTVEWXBH?=
 =?utf-8?B?aDBVSmFrWG9HcXllT1dKK1Q3aGwrbkgyai93UHVQeWM4SmJDOU51ZTRWOUFD?=
 =?utf-8?B?UmIyTVpZYkNvUVFJOGVObmFlMzhsUFlKeW0vdXByRjlCdS9UckgySHZCaDZu?=
 =?utf-8?B?c3ExbFIxdnQ1QlVXa3lUcGRjc1RrOEhPRTZyeE1aZkxXNHRla1pBWnJYcklD?=
 =?utf-8?B?alNIbWpmTkozeGxYc1IrTmhLMG5CS2ppN2dGNDd1dk5PeEFabC9GbVh3d24y?=
 =?utf-8?B?d25VcVVKc0xXSCtLb0pEdzZOamF6aDExbUZ3dW5LTHNFSzZjWWtYeDMwTHRX?=
 =?utf-8?B?WnN6YmFYOVhuKzdhamxxNnBQcWU3VmFVVU0xa3V5TFhqeFAxblZnWmZNTUlz?=
 =?utf-8?B?K2E3OW5KN1drZTBXZVMxOVJNeFpIYjk4VnliOWg5cjk5U3JOK0RHU1I5dnpX?=
 =?utf-8?B?YVRaTkpJNXpYSitjdnJFV25odGdNZ3l4YzRMTDB3bjZxWGFObTVoVERJMm02?=
 =?utf-8?B?V0hEeGIwaU1DUnUxZVlVZmVlMUZlMUhwYlh0cVc3MHBSMC9vdmtRTVRiOW0w?=
 =?utf-8?B?dXJWbmJWQlFiaXJUUTRxRzJRQ2FnVzlmdkZsQjFuTGdKcm5sSFJZMEZMY01u?=
 =?utf-8?B?NzhMeGoxQlpyOVVXb25HNHRGZU5tMWpUUWdkaWVoaGxZUG5CeEZkeitvY2xm?=
 =?utf-8?B?bjQ1Y3BHa3ZPdDNhSWVBcmtMZDZsU1VSSTZUWmxVUUZsQkp6RHhyRWFZeGw1?=
 =?utf-8?B?bnN4NHBNYzF3aG54OHhzVWpnYzdKZXFMQWFFY1VSaWRML1BCeFVmNHd4T3k2?=
 =?utf-8?B?c0twMTlDbGhkanNSUUNzZXQ1NmtJd1pOeXh3aDhyZEFidEFNTjBMMnpCVTVB?=
 =?utf-8?B?ME5sS3U4U0ZrbjFxcW9JNzNuNWNxU3VZVm5tckFtc3ZEUUtqSjVkTWN3Tnl0?=
 =?utf-8?B?R1IvSGRlNm8xb1NDUFNQNldBMDFYK1JEdXhsM2NtMi96N1lqa3RGZWNjOTJU?=
 =?utf-8?B?MFJudVhsemRjckxlcFV1OEN3Y0VPVFpvV0FEM0xFeWVhK2hKNDQ5N2lGT2NT?=
 =?utf-8?B?YTNpTGtxVUF5RWZmRW9pSFNjUXpOOFBsQ2Y2dzdTeUdydFJZZkM5MjRNb3cw?=
 =?utf-8?B?S2JNejlXYkhEbGpNbWg0RnJhTGQ5RWhJbUJVY2RacXFlRjJQNHRNRHlYZHcw?=
 =?utf-8?B?eVI5MnoxR2VZd29McWZzbU02MGY0Y3pQazJpTUlVVGdxUTIrMUNsaEdNaVNy?=
 =?utf-8?B?TnR3SHgxMmdnaG80RUlXZzhoL2RNWVFWMitka1Era1FUaE9KMkN5cktNbWsw?=
 =?utf-8?B?eXF4b0d1dExndTNSM2xpOWpuVGFRblQ1WkM1cnJzN2RMaWJpZnl4RGNWVTdM?=
 =?utf-8?B?SnlUczVmWitKK0IxZU5IaStoYmR1Z0J1eEhBbENjbW16UURsTWlES3NoZ0hR?=
 =?utf-8?B?Y2NuMFk1OVhqTkpKV2ZHMVdMenVHbnNJQW1zTUgxWUxsNEZZR1BGTzByS0Jr?=
 =?utf-8?B?b3pqbWozRGdzQnFhalAxZ1RFRW53Qk1qQWxXUUpLMWRhVDVjaUgyWjRweTBo?=
 =?utf-8?B?ZWJheEpJcUtGbGgxcmsrbnNCL2xWbWxhRk1ZaHU2Rnk1RFRzdzdrQnNmZlVQ?=
 =?utf-8?B?SFpqK3Q5WE85K2JIVUxCRno1eE80SmRGZFJnMkxxMjdQQVE4aDF1SUhBRkFN?=
 =?utf-8?B?UExERGhxWWNZb2VXVkdHNS9JWmV4a2p6ZkxhOXBWUmlhRlRaT0pDejh1eWx1?=
 =?utf-8?B?UUlaVmxtWm4veE5Gb0RXTHIwSk82LzlVcFZIRDlCcDh5Z3pEZ2MrZFkwRjhl?=
 =?utf-8?B?SDc3RW9aNXlCYVJ0Q3RwWGlyeCtJek5yTit0T2JpcTAreWhVRElreWloRXJR?=
 =?utf-8?B?N3dDQmJLcTFpWkR2SmFueW9nOUhtQXRtbEE0ZDJNTkRKZGlGT1BhMGlTMld6?=
 =?utf-8?B?Nzl4QWZFQUZJdWdJU0Qzc1lxRHp0SEd5ei85ZDNXSExjZURFZ3JudnM0U0Qy?=
 =?utf-8?Q?6gCXyIPhWE3nJz+A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20307a0c-b718-47a6-860d-08de4c9c3f54
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:51:49.6946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puAQLXdc7XS3IjJ3k/IEutWFdO71TbflzX5n0MQcPM0AJw+4dBfV3+bW0dIajpWseiK/kTuuSMZTHGEYAN7mIfyYRkSQTslrJFXK1nnMNQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
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

On 05/01/2026 22:24, Matt Roper wrote:
> On Mon, Jan 05, 2026 at 10:04:15PM +0200, Lionel Landwerlin wrote:
>> On 05/01/2026 20:54, Gustavo Sousa wrote:
>>> Quoting Lionel Landwerlin (2026-01-05 12:02:22-03:00)
>>>> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>>>> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access")
>>>>
>>>> A recommended tuning setting for both gen12 and Xe_HP platforms
>>>> requires that we grant userspace r/w access to the
>>>> COMMON_SLICE_CHICKEN3 register.
>>>>
>>>> Bspec: 73993, 73994, 31870, 68331
>>>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_reg_whitelist.c | 5 +++++
>>>> 1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>> index 1391cb6ec9c62..4dcbc42574bf5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>> @@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>>>             XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>>>             XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
>>>>           },
>>>> +        { XE_RTP_NAME("allow_common_slice_chicken3"),
>>>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>>> With XE_RTP_END_VERSION_UNDEFINED, this spans to any current and future
>>> GT containig graphics version 12 or higher.  I believe we need to limit
>>> this to 12.74.
>>>
>>> --
>>> Gustavo Sousa
>>
>> The problem is that UMD still wants to enable this performance feature from
>> this register.
>>
>> On Windows there is a way for the UMD to request the programming of the bit
>> without the allowlist on Xe2+.
>>
>> But there is no such mechanism on Linux.
> In that case, we should poke the hardware people to get this register
> added to the performance tuning guide for Xe2 (i.e., bspec page 72161).
> The tagging there will indicate which platform(s) the feature is
> considered beneficial and safe for, and the driver can follow the
> guidance.


The answer is likely going to be : "do like windows"

That works for me too, when I create a GEM context, adding a flag to 
have Xe do some MMIO programming for me.

Just now this is a discussion with Xe devs to know what shape it should 
take.


-Lionel


>
> Using XE_RTP_END_VERSION_UNDEFINED for a whitelist is dangerous because
> the register may change in the future to include dangerous/sensitive
> settings that userspace should not have access to.  In extreme cases,
> the register could even go away completely on a future genration of the
> IP and the offset could be recycled for a completely different purpose;
> with an unrestricted upper bound here we might be exposing something
> that we really shouldn't be.
>
> In general, we're never expected to whitelist registers across several
> IP generations.  If there's something that userspace has a legitimate
> need to access, then it's supposed to get added to the hardware's
> built-in whitelist so that software doesn't have to manage it going
> forward.  I'm not sure why that hasn't happened in this case; it looks
> like there was some discussion about this on internal ticket
> 18015615957, but the discussion seems to have slipped through the cracks
> and neither a bspec update (indicating the register should continue to
> be whitelisted) nor a hardware change (automatically whitelisting it
> and/or providing an alternate interface) have materialized.
>
>
> Matt
>
>>
>> -Lionel
>>
>>
>>>> +                       ENGINE_CLASS(RENDER)),
>>>> +          XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN3, 0))
>>>> +        },
>>>>           { XE_RTP_NAME("1806527549"),
>>>>             XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>>>             XE_RTP_ACTIONS(WHITELIST(HIZ_CHICKEN, 0))
>>>> -- 
>>>> 2.43.0
>>>>

