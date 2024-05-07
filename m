Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA44C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 08:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885D210EA12;
	Tue,  7 May 2024 08:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCSmy6cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED8C10EA12
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715070495; x=1746606495;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CDj6zW6hF67HeAV+bArAOPYe1aFXx6a8K87YhQHziiA=;
 b=KCSmy6cLv8p0lR+lUIHqVJxK5csK1rPZiQHFmq95U3+97Sw6ztIlEXwP
 v6b52eT2XBFga9kwIR7qMxpQNdF4Ntk+XJ8Zem5WwzRwlyJ3VqtAor0AV
 iFy+Kz4bX8l4CeIiPqehjJr0+5/nxXeJENoUkKsiz1Fk4coOMCzIFH9gL
 iDNKY+5lYlpbI71DgHNg4BMDjHMcsOpeqeMbRG0ra96dJIk8mrWm4HZqa
 lj5i/qAMO5/dxvtPjzYWtkSE5cO1NrEfxMwyCwUXMRaFNSYDUeAJ31NdD
 9eeZ70L3IjS8hG6PgaeW2niC0t3+PSwnTssjvRA5IPD5+c2NjyVe6iJC+ Q==;
X-CSE-ConnectionGUID: /rCzxDwITdqjqAvu1nBISg==
X-CSE-MsgGUID: VCQxdJxnTLORhp/gIFrCRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10779619"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="10779619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 01:28:06 -0700
X-CSE-ConnectionGUID: UtnsEoTuR4aARkuLz8S1BA==
X-CSE-MsgGUID: v+YuxForSoOqYuqkPNmOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="33271905"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 01:28:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 01:28:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 01:28:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 01:28:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 01:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB0ZOgETR0vOP9x3FJstAVMsFkosT8xH+PbDfdVrOP/p3AoGHepC0VuH/IaU4XvFORfRxzOmwfIjvTIdXEIQMQOE8y+oHjhmdWk3M92/wte0Dr+nNQ085+3QVoy6lq+sUmuTtuZYYKEnSaZnVU/XiriOJM3JhxIYoe6dgSzmSI0h8ptGBAjwVra3vabVbvHAGnTzsJM57FE5QVW2V1skfrXqsb8Ul6p87fCLYb2yjOy90LWMv+fDgcs/NRKg7CPaHurYp5hNWbkQCjFOLvYfsMsx51AyfvctsRjp8zr/S6nBheslc0+2rXb/YxiWIBwybLBW2Oxsty8MECs661AK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SdTLJxxEYTfPhbAUT5mEadkGsUYf8bpDBB0SApbtrk=;
 b=RI9KjcH9xzuY/2KjSyWjSUSBtSgJaVm+VhgsKZLG9UxGnKDgVmoHkyycXiWDSN2l/sg0upfjGgGMeovhkHoPsedgMwe1MSp/QhvZa0JuKOnHkQ49vZidqIayCD6NugmnxwygHYokUnxsD7gpGjwC8T09c7x9aaujQtfbxWyaY4oRmyDhK/FFfHu+6bOvjkxm/MeUCHx/keVU6+FLp81lWd4CPfLQa9SHr23wnuLMFMY6i+vGkJmFtBUATFvFc1aOoG+s4o2KG/UPKwnoHck67tPa9snvfyXg+Loe8ejCMk1J0XWT0RK+JJW3dDstj+LEAdGMKKZpRitdzxLEKTmdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 08:28:01 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 08:28:01 +0000
Message-ID: <0f864b57-02db-4841-8ba8-9207fb9dfc1e@intel.com>
Date: Tue, 7 May 2024 13:57:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pf: Implement pci_driver.sriov_configure
 callback
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20240506184121.2615-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240506184121.2615-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 418a771a-fba7-4409-bcce-08dc6e6f9b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZENCYTJablpTQWlkdXEzeHpkME5oSTNZZ3QvZngwdnBTWEVwSWdhbXRMZ1l3?=
 =?utf-8?B?amNacVNOTldhcEUyUlVIUEpwRnNWNnB0eXpKeXlHUHdOV1YvTGx1d3RMM1d4?=
 =?utf-8?B?K1BvLy9XTnZ3bnJrUTZNS0s4ZVFwQ1REcGRYcnRKQ1VOT29HYWZlbUIwdjZu?=
 =?utf-8?B?dGFEMmtoRTdXOVJnUWdXNmxxeW1PeDhzUDh3Tnoyb0FlQjFuZmZmdG8zSUJJ?=
 =?utf-8?B?S25Cakk0QU8zcUVwK3Vibk8zTUlxSGNnUG4yc01UODZNTWdad0pEaXN1UGpU?=
 =?utf-8?B?Q0VaNlErLzZyckgzMzJqbGMrZFpKWjhRZ0VXR3puVis4SFA1NTZwaktVSyto?=
 =?utf-8?B?R05LVEg4UUt3bU41QVY0MlU2WUx1dDZHSG5rREJqaExlN0ZJNmRuUExGeFJ4?=
 =?utf-8?B?K3Fwand5anlLMHlyZnJXRlpSRDNYWjdKL3NpMGYzdkRFaWhFNVVRMWFpU0JK?=
 =?utf-8?B?TjV4MDhUdjlObHUvSENIcnIveDdiLys3Z1JrL1QvWVNDUmFDNlNCeVBxRkdD?=
 =?utf-8?B?VEp0QXFUNThRY3R1cFFRMWNWTXdGWTg3MDY5Umd0VEk2ZXdDd0dIa0phV3J0?=
 =?utf-8?B?aVJGMFArUDF5YXgxeXY4a3ZrbHdLWVpEdDhEODYva3ZMN042WUxTVG1JMm00?=
 =?utf-8?B?SGxrTnhwYXdPUEo1NW9Wdk40c2pXemJhblRkQytselFKbERDK2RqOXhBaWhG?=
 =?utf-8?B?T0p2QTJPNTlvQ3ZKenJVVDNrNUtQS0MrM3hHNmZLUnM2Q1U2bXRxUSs0MzBB?=
 =?utf-8?B?UjRQZnpnY3BDRE00Tk0wbjdzazdlbXRZOE9zRFIvMVlidXp2YkFZdjVRbFE1?=
 =?utf-8?B?STUydDZFR3V4cEt5cC9SSEtBOEdJTnE1ZVplN1B2Y1g0UTRPaXhhUDA3L3hn?=
 =?utf-8?B?dlQ4dlJCYjNwYWt4SWpmdWdXOGsvdHdUNzZyVW91YURwQzdlNVNtREc3TUJC?=
 =?utf-8?B?REVBUWxvWDdPdG9qZ3MydWk1ZDFML2dSUmpMYmhSejJjdGNadHhjbDl5cWZO?=
 =?utf-8?B?QzBmdTcxelFCd3ltQXRGMFhpc1dkdzZ0eCtid0ZSQ2I3UEZIRTRkeTBLcmRt?=
 =?utf-8?B?aHdSS203anFSRkJPUFJiTjA0OW5qd1JFcVZMdlY0R3FFbllkdklXYmg5ZzZ2?=
 =?utf-8?B?QzFUM0RURWN0SXNqRFZKZzRBY0ZLVTd0MlcxeUNBbXBvak9MY293V01scUlj?=
 =?utf-8?B?Q25wQzM3RDdlUi9pa1V4WUZ3TlhSUDB1QmRxQU83TnViQnZFTy9wSXJ1OWVU?=
 =?utf-8?B?L1l2QnhSblNDSmFDcy92OVhLTVorN2FtTjlMaG5INXhHY0twQ3dXWDJRWGIz?=
 =?utf-8?B?VXdPeS92b2tFdWdsSGdrUjFpM1Z1V3RhSG5xRVFOdmdrVjl2UDJydmNOUFVa?=
 =?utf-8?B?VXNmRklTd0lCUDN5VDNzbEN0R1hpQlcwRHlsdU95cS9wOVNYVXNNVTl2S2U4?=
 =?utf-8?B?Vzl6T3BqRHlaMHNwRWZaL2RYYXlFYVFISGxHVk1tK01jVzhpZFZaK281MFpB?=
 =?utf-8?B?am5pMDJUb0NkUHRBaGpRTEdFV2RtZzlZLzFYTTNBc042YU9weWdTZkdXVzE3?=
 =?utf-8?B?cXY2OWpqWEd0SUFvOGd2L0FHZDBSNzFXbHlRS3VNdmtDR29ER3dqS2N0TDBy?=
 =?utf-8?B?RnNJd0tLa1R2SDdNM0R4WHkzQW0xdFVWNGhxbU96TUV1bFBBL3VlU0FQZjhH?=
 =?utf-8?B?UXhTazdXS3ZwRnR3dytJbWlVbGpsRjYyNUZJOEU0Ujk5OSttd1NmYWNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExEb0E2azcxYlJHWVF5aGpidWRCWWRWT0pOamxYSUZWc0ZsZGg0bDVGMHlZ?=
 =?utf-8?B?TmY3YXJwcEVKUXNlZkhKNzJwd01qK0xyaUMzdUtab3RraW1WM3k1QWJnODZM?=
 =?utf-8?B?aGNWZEx6OGVsUzFrbkt5QjNIcTlRb2k1WXFET0tjeDhsWnh3bzVxc0Rmaklr?=
 =?utf-8?B?NVpsZTc4eDRoMHJJcm1MMHVsS0ROeFJMcnNkVHpRQjdzdjVVa2tybmRXTWts?=
 =?utf-8?B?SVA2YTFpckRMM3d3VlowaldJbFIvUUpxQy9uK3RuVW5tbzJHQ0t3eEdPZmNJ?=
 =?utf-8?B?bk01c3FuRnFpTGIyMFFCRC9yM2F4UDBBQS9sYUN1ZkxiYkl2VE9YczFJQ0xR?=
 =?utf-8?B?MC9KbVlxRkd0bkt2MUozZi9KNWFkdEEwVHBmWWU4K1ZQYzlZU2FTSk00Rllo?=
 =?utf-8?B?Y0pvQ3cxaXgxcCszZFBpSUxUM2NSOWVPakJmeWhOVkJiKzJvL3B6QWVQOFU5?=
 =?utf-8?B?czBKRWJLUHNOU1hPQjduUTdtZzdkRzdOWElCM1BLa3RFNmoxZWxmRnBkUVIz?=
 =?utf-8?B?d1dpdFFYSGNUNWRIUGJrdHcwbVY3UjRhaGMxaU9FSHRveG96M1NRY2NLUkw0?=
 =?utf-8?B?WjNPTVFZZ2lHNVFpVCs0azVQSUxGZjFVeCt0SFNCRDNTa2FUdmVaVTF4cjF3?=
 =?utf-8?B?alhueFNoUHQrRlliK2lmR1VnUG55T3NtZ0NQdTJPSzZEMCtDeFRkWG1wQ2hl?=
 =?utf-8?B?eU1wSkh6dlo3T2pGS3JuVzZhR2E4MWZRYkdVQWllUGNZNE83WThFcmdsU3V6?=
 =?utf-8?B?Zyt2dml0Y2ZqK1pveU5nVXZ3d1hNVTJoV2M4UURZQ3pTQVJRUHRiK2R2Mkdk?=
 =?utf-8?B?cWczWmY3Z1ZvZ1RObVBnY2ExK3ZBWEhhOExzZXVLb0htZUM4S3E4MXozOUh6?=
 =?utf-8?B?eHV6eERnb1BTVGtlWlQ3UUoxS3FadFd0YU9jNTZkVkxOQXdUL1pDM2NlU3Nt?=
 =?utf-8?B?alZOc0xvYXNsOTNEeVVldFVxbENCQmd4MmE1MGRkalQ4cHBhWEp1MXRqck5X?=
 =?utf-8?B?WTdZN1FodEo1elliSlduNW1pMDlnZXdwblFYYkJJbmx1UmZrTy9pS2FnK1JR?=
 =?utf-8?B?TmNhOXEwNkFWKzBlOVRIL0lkYkQxeTBtcHBYWmdMbFNjeko1Q0ZEYTF2c1BG?=
 =?utf-8?B?c3N0L2VPYWx1cXpZL2lWa2Q1T1VvL3dteWxhUTA1eXhodTdnSTRQVEEwMlg1?=
 =?utf-8?B?dUk0Y1dPUlBwRkZmUG9hNGYvT3JIWHFYLzkxak05WUZuVFdvNGxoc3lLMUpN?=
 =?utf-8?B?YXFUeEc4L0NiTCtCRHZDdDgxeHBLRHJoZGFWMUMwdHNabjhodUJJV3l5QmxN?=
 =?utf-8?B?RnZJaUZKNEMzNWFjeU5yWnNxL2ptczcyUGdsNS9VOWJmd0JXKytkSUFDV2tw?=
 =?utf-8?B?bjMzVTlmZ3c5b0twWlo4eTU4dU8zY2pXRTlyTi9ySC9zS3JBNXA1YnFNakFJ?=
 =?utf-8?B?VkdDZWhJR2hyamxJQnJxK3VVdWNNYTVCQ3VsVzg1YkVEYXlPc0wyWTBMWW9B?=
 =?utf-8?B?dmVTTzV0K0lBbFdtSUNRTXdJdVVpeHJKaExCR0ljSzlBczJJZ2c5WEI5OXFD?=
 =?utf-8?B?VzA4aldTenl1VlBTcmUreXRRclZQTFVULzdSMnB5SXQxYkFnSUdGQklidnMy?=
 =?utf-8?B?ZEZKbjV2U3ZBS1U4Y2lVL1lNd2Z3M2g5QUY0VS9FR093YVdIaTNwQWlFV1Ax?=
 =?utf-8?B?bExxSVprNytwS1lUUGd6MTB5cmlIZTlubVY0ZlN3OGtVNU1kZFdsY3YyN2Jn?=
 =?utf-8?B?dFZVR0xxRzdGQmIyTElkTER4YzJPUXFJS2xuVHZSWm5Idm02WFljMWxyNHVF?=
 =?utf-8?B?a0xlN0QzRTVmYmlpbmhGVDlwQ01PMVhPMGtVa3dodVB1SGRXTGwyTkN4VWZG?=
 =?utf-8?B?c0JieWJNcTNHTDQ5aVdCNDhha2h2L1Bvd1B3cnZZTHhhNE9EK0Zoa3FqeVBs?=
 =?utf-8?B?MGtFV0FHMWp2NnFpanYyTWhldkdZT3lnRmpGY0lqSUdzTHdlaVJ3Zk1PY3l3?=
 =?utf-8?B?RG83OStUQWlyWWZscEJNeVhBcTlpdkdOSGd3YlU5KzJhQUt3RXhRbzFBSkJV?=
 =?utf-8?B?V2FlMTRKZHl1SnF0TTU5NlNOdFp2bjFLNG5oSGg1bXJQbm9MeGtNbHFmZW05?=
 =?utf-8?B?Q2NDaTJQZkpSa3VRemR6c3hBY1lqVnBkYjhPZVpSNGkrZm1kQkg3eFdRWHZ4?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 418a771a-fba7-4409-bcce-08dc6e6f9b62
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 08:28:01.1248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZRnF31O9Ip1BE2Ssxft9CprNxPQpfLE79WoTbF1Y7aCb8V+mDrYoeJbPHvRM0iHwke/GP/A2zkf3ZU+mrekGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
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



On 07-05-2024 00:11, Michal Wajdeczko wrote:
> The PCI subsystem already exposes the "sriov_numvfs" attribute
> that users can use to enable or disable SR-IOV VFs. Add custom
> implementation of the .sriov_configure callback defined by the
> pci_driver to perform additional steps, including fair VFs
> provisioning with the resources, as required by our platforms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #v2
> ---
> v2: check result of VFs provisioning (Piotr)
>      use xe_sriov_pf_get_totalvfs consistently (Piotr)
>      prefer VFID instead of plain a VF number (Piotr)
> v3: improve comment why PF takes extra RPM ref (Badal)
>      use _noresume variant for extra RPM ref (Rodrigo)
> ---
>   drivers/gpu/drm/xe/Makefile       |   1 +
>   drivers/gpu/drm/xe/xe_pci.c       |   4 +
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 143 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
>   4 files changed, 161 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b620389761d5..38da5a575deb 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
>   	xe_lmtt.o \
>   	xe_lmtt_2l.o \
>   	xe_lmtt_ml.o \
> +	xe_pci_sriov.o \
>   	xe_sriov_pf.o
>   
>   # include helpers for tests even when XE is built-in
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 912b59fe9567..353ec44592c3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -23,6 +23,7 @@
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> +#include "xe_pci_sriov.h"
>   #include "xe_pci_types.h"
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
> @@ -959,6 +960,9 @@ static struct pci_driver xe_pci_driver = {
>   	.probe = xe_pci_probe,
>   	.remove = xe_pci_remove,
>   	.shutdown = xe_pci_shutdown,
> +#ifdef CONFIG_PCI_IOV
> +	.sriov_configure = xe_pci_sriov_configure,
> +#endif
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> new file mode 100644
> index 000000000000..06d0fceb5114
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_pci_sriov.h"
> +#include "xe_pm.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_printk.h"
> +
> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0, err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	unsigned int n;
> +
> +	for_each_gt(gt, xe, id)
> +		for (n = 1; n <= num_vfs; n++)
> +			xe_gt_sriov_pf_config_release(gt, n, true);
> +}
> +
> +static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs > 0);
> +	xe_assert(xe, num_vfs <= total_vfs);
> +	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	/*
> +	 * We must hold additional reference to the runtime PM to keep PF in D0
> +	 * during VFs lifetime, as our VFs do not implement the PM capability.

Above is true even when PM capability is implemented in VFs.

As per PCIe specs
5.10.1 VF Device Power Management States
If a VF implements the PCI Power Management Capability, the Device 
behavior is undefined if the PF is placed in a lower power state than 
the VF. Software should avoid this situation by placing all VFs in lower 
power state before lowering their associated PF’s power state.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> +	 *
> +	 * With PF being in D0 state, all VFs will also behave as in D0 state.
> +	 * This will also keep GuC alive with all VFs' configurations.
> +	 *
> +	 * We will release this additional PM reference in pf_disable_vfs().
> +	 */

> +	xe_pm_runtime_get_noresume(xe);
> +
> +	err = pf_provision_vfs(xe, num_vfs);
> +	if (err < 0)
> +		goto failed;
> +
> +	err = pci_enable_sriov(pdev, num_vfs);
> +	if (err < 0)
> +		goto failed;
> +
> +	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> +		      num_vfs, total_vfs, str_plural(total_vfs));
> +	return num_vfs;
> +
> +failed:
> +	pf_unprovision_vfs(xe, num_vfs);
> +	xe_pm_runtime_put(xe);
> +
> +	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> +			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> +	return err;
> +}
> +
> +static int pf_disable_vfs(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u16 num_vfs = pci_num_vf(pdev);
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	if (!num_vfs)
> +		return 0;
> +
> +	pci_disable_sriov(pdev);
> +
> +	pf_unprovision_vfs(xe, num_vfs);
> +
> +	/* not needed anymore - see pf_enable_vfs() */
> +	xe_pm_runtime_put(xe);
> +
> +	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
> +	return 0;
> +}
> +
> +/**
> + * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
> + * @pdev: the &pci_dev
> + * @num_vfs: number of VFs to enable or zero to disable all VFs
> + *
> + * This is the Xe implementation of struct pci_driver.sriov_configure callback.
> + *
> + * This callback will be called by the PCI subsystem to enable or disable SR-IOV
> + * Virtual Functions (VFs) as requested by the used via the PCI sysfs interface.
> + *
> + * Return: number of configured VFs or a negative error code on failure.
> + */
> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	if (num_vfs < 0)
> +		return -EINVAL;
> +
> +	if (num_vfs > xe_sriov_pf_get_totalvfs(xe))
> +		return -ERANGE;
> +
> +	if (num_vfs && pci_num_vf(pdev))
> +		return -EBUSY;
> +
> +	xe_pm_runtime_get(xe);
> +	if (num_vfs > 0)
> +		ret = pf_enable_vfs(xe, num_vfs);
> +	else
> +		ret = pf_disable_vfs(xe);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> new file mode 100644
> index 000000000000..3b8bfbf7e1d9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_SRIOV_H_
> +#define _XE_PCI_SRIOV_H_
> +
> +struct pci_dev;
> +
> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +
> +#endif
