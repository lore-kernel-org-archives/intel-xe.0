Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD4DFEEF55
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 22:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864610E4D9;
	Tue,  7 Apr 2026 22:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0qrqGNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA38910E4D9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 22:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775600291; x=1807136291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KAE69dTFwIxEUGt83ei/OHZRm+KiMWyn8E2ulM9zZK4=;
 b=N0qrqGNHJlOqnlsVxYQiexdOSAJJTgA0SMRLDpc6OfjYlSIHTw5xXP9T
 avuEbEpxYpZUpIE3F6eZmc7+/WLJzF+F/nAEkPWJyFGhMu4nmmoDcpPxl
 qH7FDEptmnEhlEOEO3zKuD0nlHBhCv7iBl6kFncxbzVgRHo8bsE/EqWzs
 BMpVzE2RpnCTQ82BeS+bHMJgGgUG0zPMq4v3/lkdXajQEMrgifV8gyk5N
 rvMBo6ae+XIse0y2mdVSOiWTBEsBXZeLK5CGuX5Tun55uKYscY6ID6+p/
 k6I2gjLTZzf9w35C7XSZqwbpg79WmWwIviwlhn9HQ0GiB7a1zphmJC7hx A==;
X-CSE-ConnectionGUID: h4C80HXRSbqj5cVEXASC6A==
X-CSE-MsgGUID: H6G+hnpvQqq1bdUdTCmJJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76295152"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76295152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:18:10 -0700
X-CSE-ConnectionGUID: u3HsFryEQU2mt9GK7qF9FQ==
X-CSE-MsgGUID: 0AIKpggsT6uqLT3EH1Q6uQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:18:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:18:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 15:18:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9M6bBQRrsb77cpFd7/N1IOMJq12sF59slNc8t9O//4Jl7fGkcQo0pIPRSp6LZ+mCIAbH758wFhFGa4/t1q3NpLgTCiau52iZfZIvja+lkHZl/L+PpCooH/IhLO2o0ptd6rn9MsxjgRm6w4VL2PMCHJGskk0d1aL7aIIdV5LXmdGcyg4XkteecwbSjLydbws34CLy/ubovX3uib3dLPjGyuMO1bBGUK8a0vWLY7wMRsAdiTps+BiPKPOKIpX4+1h52OGFYp7NSdNcXyRypPiq93s2ok4MVuqixsYvcqyhxGMeH1g3XOcj71aD6IfsfosXFBc6+EMfqBR74xQjULemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJA2ulnvsaC+SCgQ6WBAqHFnvk3Xi3ueZrTrNwLeshQ=;
 b=eH1IVZM84mIDlZVetHOrDwCb7sy4l9jw4Xj1BcI+Nl2yH51B2NMR57wNMwQ/JFoYRRdLY6gqq8FVhuMyueZga48EOs4W7q71BG1I9KLFoiHHK+Lf7BhoMw44v2Q1iYc8h7ebeX1QwOpTdeXuglnzcQCtIZSmJd4bNJ5JMRHTdhwnDM0iiZ5X+0GYdvFPfaWmBRY4SJUa+U55D8R8f83z4uhbrf1YmpmwmoFYPfqDTHSinUbRppqhU9vey8K6pPmfxDfmiLWi1KyeHMBQBthVBl+zxjwFbLcCn6w2YaKZrN8UBLwV3OcVyZ8mTLnVXOdtV0fo6Hy6iq/3BeOlOyf3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 22:18:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 22:18:07 +0000
Message-ID: <6b5850d5-879f-4ea0-ad29-63ef0d8474d1@intel.com>
Date: Tue, 7 Apr 2026 15:18:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260403204433.5765-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260403204433.5765-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d80dda-edfc-4e94-b394-08de94f38b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 6Jz8QWZSLlk0v6TRZOrsKyQJi2PN1PAXLRn+yls8lvW+fJOxBwcHpuLNG3rsGMDD9q2cjpLkHIe/y+p3nMPhdnZXQoSg8K+zSSD4C9/26r+n5r8Ce1lJ+HwzLaycnCU99dVEWcC0sBIdzmel/brQXdVjd73PaSGrI97c7DHTfHR658LgYH9fd4ljcNRxmHMkk4cnlD05kgLanJdZzyImjNaeWpg/LPanB2XmaG6QCwMTpTnRW8Z6cdEsJYbaivydf7IBL+rC7r74mptjIrF+iTwnJqwlARjvbiIsvKG17WLb3YvOMTgUl9djYat7ax0BgJtxcQUR43IUM2aBpMZswjlAjmBS2Wanl/Zt9B3XOyameq6VAogl7H3Wwzr20Gyjwhvl6ed9cYdR9W9+mGdY0AUGcmr2CTE70ys9NwMXJ0K1viI1XNWSiEWhAzCmDZtNuZbEcxB21fQF6YR7GHPNO/ok3y5sq3d4v4osXffFA33BX1hBenj/CBmB6cslkGIJlgpJzhp7g+RXzwhjNJA9Mnj8qvXBzcNzMydu63mDWqzf+F6j6RfLWasgyfpHRz796TBvTcIFd3lgl4yadNSGcDbjKqHH+hYf3TLdfQqET9K4sShnEB4NM1dNl6Bvh7uhKo9ETq2GBCy4iBTWfUCLqESj+iuAZCqYbkcuoK6yIajvUbN9WHEFwazSpQbyaXoI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldsbXNZOUd4Wk5FVkpxNER5eW5aaFl5dEVtNGVQMzl0WGRsb2tkRDVlSUU4?=
 =?utf-8?B?QUNHTjJITE12RTc5UG1lQzZMYlc2WWM0aThYdXgxT01ZN0NJL0wzZ1FQTE14?=
 =?utf-8?B?elN0RHN0a3kzUkh6SlN4eXh0dnBuLy9DTWpKOWxQYlRuSUpidkVldjNEZXlM?=
 =?utf-8?B?WUM1NEo1R2NQNWZEWEJqWngvTEdNQWEzV3ZZQlliUFBXWHFZejlnalJIYnBQ?=
 =?utf-8?B?WEhmUVErRUdqVlFpMlpTa1F5K3MvSXJaL1FkTnJsWkc1WmRyMFVRYVZDU2VY?=
 =?utf-8?B?cE1WanA4QlV0U1VaeUR2d2wzZmNaODBVYnZIZ3d5YWEzbTY2TmdNL1h2TlVZ?=
 =?utf-8?B?ZjNiZzF4M2xUaGZtQkpkZG04bDFTZlhQQlBnL3gyVzBMOGx1cXprdnVMNTMw?=
 =?utf-8?B?YWxOc3Bsb1lrTk1GUS9xN1JOT2VIZ0Yya0ZubnFIWmZ6R2JtQUd4S21aN1o2?=
 =?utf-8?B?SExKekk5VVhtemdWN21GaU1HbFRka3dRY0FBcXRxY1FZZm1uUWpHRUVZYWNH?=
 =?utf-8?B?bVQrTXdyc21HaVV0K0hhMTAxNXM5c0FqYUNJUldBbjVDN1hYME5QaEtjRURm?=
 =?utf-8?B?cXhBQVI4NUR6akx0SG90YlRURjFsZ2JldHYzZHovdTV1bTAwQTZuUExQUjZx?=
 =?utf-8?B?eUhPRUErbWZyVkgwZWlqNGtGYWU3Z2lWaFRYUFRJQndQRkRpOVJ6MG5KV3JP?=
 =?utf-8?B?eGtqaGhPQVZYL2tzS1BsUC9rVmxOOXlwNUZkME1LOGYweVJwdXZoTktXVFp3?=
 =?utf-8?B?K0VkZDY0eXNUVDJkaE1hT3hFeEtaTTA2c1dnM0RUYUYyTktHSmFFQ2ZxZ2Jq?=
 =?utf-8?B?NnlEWjNMSkw3QU4zN3RHZ2JtV25UT015WUJ1dUhsMjUyeW8zR3B5amRBc20r?=
 =?utf-8?B?bkNnN3NnaFNOT24xbEQxODBIZ01Qc0VyRmdSMmdOaFdSd2JQMGZCeFhrNVVl?=
 =?utf-8?B?TVdJWE5HSUt4ejVmYkVHNlRmTXdWZDFLY3F1VnpLZm5YNWJFNVpxVGFqWDdM?=
 =?utf-8?B?UHZGdFdFcDBVdzNyYS9iTnE1M0hXMFF6RXlvMEo0d1JCakV2T21ueFAramNB?=
 =?utf-8?B?WG1FNmo1c1JCM3BGcGYzTm1iS3VNWDZ5V2p6MEltWXVNcWRQbEtiR0V5UXhB?=
 =?utf-8?B?akxuZmI5b29TbXp5bHU1MlJpQ1NERXpaVjJpVjBpY3R1V2ZYVkNucEdyd2J4?=
 =?utf-8?B?aG9BY1ZBUUNaZzBwcDlreXIvank4QkJMc2dERE01Wk1KZDA4V0QxZnF0clVr?=
 =?utf-8?B?STNJdTV0SEh1Q3doSSsyd1ZKTmx5QmlzRWxEWDlFOGhKS3YwUG9YNTg4b09H?=
 =?utf-8?B?c2xRTDNaaUh0a2pWWW0zRDVFbjc3L3hpZzNNMVA3ZDZTNVdNaU0xZ3QyWGdr?=
 =?utf-8?B?QWI3VGthUXpDelVGbGpva0NSekRxc0ozR096aDc0a3djZm5renRweGZQeTRk?=
 =?utf-8?B?QmJ6bHJVZDFBbW9MbWl6OW96RlVCNS9KTHRhV3Z1NjRNVTE4czBqUlM4QVFX?=
 =?utf-8?B?S3REY0dxVEZiZmkvYW5zbEFnRGczTDI2OVRkT1ZScXc1YXRHcmZ2K2lPZGJM?=
 =?utf-8?B?MnNnNmJzVkx1NlVPNUVOWmd5TzVoYWdaQTdvdVc4NzFCN0lGcFhzMmVxSkxr?=
 =?utf-8?B?NlVnNU5abzJlVXB4b1dTVVFoNXBERFhJV1lVdjhJVWpBTHRWTDJLYXMvUmZr?=
 =?utf-8?B?RUpUaFV4NWlMcGs5ZUg2NnZFU3pHTFJpODQ2NTZ1SWMxQUJ3WDRrS2QzTFNz?=
 =?utf-8?B?SWtMVW11ME1HRXVmVjh2N2M2ZEQzVzhKNm9kUnFlSWQ2TjZzaFFHNnNtZnp1?=
 =?utf-8?B?VFZlZzV5MUZWRWVoenYyMm1nV0NubGFQYTlLTk9mQmtJTGEyYVFEWjgwdWxJ?=
 =?utf-8?B?UU0zZEJKY0s0OUE2R1JkSmxWSlh0Zjg0aEo2UUlWN1oxTnh0b3JDU1VPcFFy?=
 =?utf-8?B?b2NDOFFDVzI2QTBJS2tocFA1MDZZMTJoN1FUa1kzdmJ5SDdSeW1hV01EVUdB?=
 =?utf-8?B?VUhNb0tzcWF0cVdXZGtOOEFOQkJwS2NuSVdPNno1TERqYSs3OTZuM1gwWVRi?=
 =?utf-8?B?M1dCdGlDeXF0bTkwekFXd1ppcU9nSEhkN1MwQzhaRzZuWVRjQXREOGFtUEcr?=
 =?utf-8?B?d1Z1dVMwRjFCRGs5OUNXbVh2VTh5WTF6TWc3clZhNHVLTkdTMWZ3ckkxNmtz?=
 =?utf-8?B?WFFVemRMckxvQWkrOUJuT28wcWJmc3FDSUVsTlZFcmVMbGxNZ1J2Y3ZsNHh4?=
 =?utf-8?B?RVc3WHV3Y29WNU5aSkw1bTF1M1c2Wi9YSDBHeFo1U2krZU43WG1Qc0dCMENR?=
 =?utf-8?B?ZUd1VjlBTUZPMHpiQndjcVJxUDdtYkZPajBvQlpnQzdYR1A5a2tJenRWdExv?=
 =?utf-8?Q?isxu6EEktcIy+p5g=3D?=
X-Exchange-RoutingPolicyChecked: r8pUtDPcOMi32RMRjbl9jI/c8cSBWKA8xvcwW3w4SFKr8xvV3BBr10KIXZMGt0eOM+OdEPHrZGBdLLtGwCKvHWf+kMqt5blkhogbrSeBSGfy283LLphus4/DvF+1IP0oAWsOdIwsDzRN3k54cEEaXxepu8gbCedPqFn8nyzwesblcJREOOZNznorM8WnliSMylbXsmnt8kKvrKHmZ8XxJEJsZrVAjEgc0XEkTuzQbL3ulb+SOzDJoH5we8XbJu9OkV/sQjXcnnJv5x0JgdkcHyHVos6sORKCZwkDz2NV+rBjsFr2876jYalpEa5yxqfUtkxs4OrlDo/cZvRD+ekRrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d80dda-edfc-4e94-b394-08de94f38b56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 22:18:06.9800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpKVFOfdAmWhQzL2Idn/6tin9BFcXxW3EDMJQVJbvfUsVoxRya4EozpKuMuXjln6hmNlD4KW2KMpGwp4fSzgDfdtQURxYtUiI3CQPEPnBtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
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



On 4/3/2026 1:44 PM, Michal Wajdeczko wrote:
> We only have support for G2H NO_RESPONSE_BUSY messages over MMIO,
> but it turned out that GuC also uses that type of messages in CTB.
>
> The following error was recently observed on BMG after adding VGT
> policy updates to the GT restart sequence:
>
>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95
>   ...
>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: Timed out wait for G2H, fence 21965, action 5502, done no
>   [] xe 0000:03:00.0: [drm] PF: Tile0: GT1: Failed to push 1 policy KLV (-ETIME)
>   [] xe 0000:03:00.0: [drm] Tile0: GT1: { key 0x8004 : no value } # engine_group_config
>
> where type=3 was this unrecognized NO_RESPONSE_BUSY message.
>
> Note that GuC might send the real RESPONSE message right after
> the BUSY message, so we must be prepared to update our g2h_fence
> data twice before sender actually wakes up and clears the flags.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Link: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a11cff7a20be..19305acb98e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -186,6 +186,7 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
>   struct g2h_fence {
>   	u32 *response_buffer;
>   	u32 seqno;
> +	/* fields below this point are setup based on the response */
>   	u32 response_data;
>   	u16 response_len;
>   	u16 error;
> @@ -193,6 +194,7 @@ struct g2h_fence {
>   	u16 reason;
>   	bool cancel;
>   	bool retry;
> +	bool wait;
>   	bool fail;
>   	bool done;
>   };
> @@ -204,6 +206,11 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>   	g2h_fence->seqno = ~0x0;
>   }
>   
> +static void g2h_fence_void(struct g2h_fence *g2h_fence)

I'm not convinced that g2h_fence_void is the correct function name here. 
Maybe g2h_fence_clear_response or something like that?

> +{
> +	memset_after(g2h_fence, 0, seqno);
> +}
> +
>   static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>   {
>   	g2h_fence->cancel = true;
> @@ -1331,6 +1338,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
>   	 * and g2h_fence_cancel.
>   	 */
> +wait_again:
>   	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
>   	if (!ret) {
>   		LNL_FLUSH_WORK(&ct->g2h_worker);
> @@ -1356,6 +1364,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		return -ETIME;
>   	}
>   
> +	if (g2h_fence.wait) {
> +		xe_gt_dbg(gt, "H2G action %#x busy...\n", action[0]);
> +		g2h_fence_void(&g2h_fence);
> +		mutex_unlock(&ct->lock);
> +		goto wait_again;
> +	}
>   	if (g2h_fence.retry) {
>   		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>   			  action[0], g2h_fence.reason);
> @@ -1508,7 +1522,12 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		return -EPROTO;
>   	}
>   
> -	g2h_fence = xa_erase(&ct->fence_lookup, fence);
> +	/* don't erase as we still expect a final response with the same fence */
> +	if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY)
> +		g2h_fence = xa_load(&ct->fence_lookup, fence);
> +	else
> +		g2h_fence = xa_erase(&ct->fence_lookup, fence);
> +
>   	if (unlikely(!g2h_fence)) {

if we hit this error with a NO_RESPONSE_BUSY we'll release the memory 
with the fence still in the xa, which seems wrong.

>   		/* Don't tear down channel, as send could've timed out */
>   		/* CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN); */
> @@ -1518,6 +1537,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	}
>   
>   	xe_gt_assert(gt, fence == g2h_fence->seqno);
> +	g2h_fence_void(g2h_fence);

Is this here because we might be parsing the G2H with the actual 
response before the waiter has had time to process the initial BUSY 
response? It might be worth adding a comment to explain that.

Daniele

>   
>   	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>   		g2h_fence->fail = true;
> @@ -1526,6 +1546,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>   		g2h_fence->retry = true;
>   		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
> +	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
> +		g2h_fence->wait = true;
> +		g2h_fence->reason = FIELD_GET(GUC_HXG_BUSY_MSG_0_COUNTER, hxg[0]);
>   	} else if (g2h_fence->response_buffer) {
>   		g2h_fence->response_len = hxg_len;
>   		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
> @@ -1533,7 +1556,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
>   	}
>   
> -	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> +	if (!g2h_fence->wait)
> +		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>   
>   	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
>   	WRITE_ONCE(g2h_fence->done, true);
> @@ -1570,6 +1594,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>   	case GUC_HXG_TYPE_RESPONSE_FAILURE:
>   	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>   		ret = parse_g2h_response(ct, msg, len);
>   		break;
>   	default:

