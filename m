Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF93BCDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 21:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7637810E2B7;
	Thu, 25 Jun 2026 21:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlI9SDjc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBF810E2B7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 21:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782423745; x=1813959745;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MD5Uc/eU3c9qbuA4NPBcXXCRK15ucU0WsWbzGiI7B4Q=;
 b=nlI9SDjcM9WxzZngqs8ejtb+LKT1hV/rLhQQOLy+4UVdwaSVsuaXctzw
 JTxi5YIXkbG7DxdQQ0SwvtBQqoulhHqOMiy9ikLsnHZrzYlspzgSUQok9
 nxK10GWHAVVgC398zozJGTQrXQjaMcAYVeT12+AQCV9cM+CjNCnl9gQdQ
 S/5kF3OS8sKHXtWpbjvaq5GECdMPO3KeSb8iNaBjSaQCbUO4mOQAO79j9
 qREZ403y3pentv/K2V7UivZ7rEq/1Zh9fXvpLZhGczxqT7xrNGPzYVMeh
 TNgKr1FvnNNvVegD+oJ13gbOHtOOLWLbC3jtsuHGvdxi9ulv/3uYh7ah4 g==;
X-CSE-ConnectionGUID: 1Ws5Iby4RyisD1lUTrZU9g==
X-CSE-MsgGUID: azYlbjaPQZCY2TsjMSDb7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="82986665"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="82986665"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 14:42:25 -0700
X-CSE-ConnectionGUID: DZ5LqdOhSMaKYndC3GhRcQ==
X-CSE-MsgGUID: hVKDrPq4QR+LW07DU7QFGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="252988373"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 14:42:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 14:42:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 14:42:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 14:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+iqxc3AhN3GYiyGquiB1RtYcmzvvMPh8qd+lB+B8dHj12+zjZ278mXRbVYWyejneJSiJRQtIxNfuCLOMIS7XZtZtKfYdPEdW9ZzzLEtwCFNGW6w1qlVecIv2EfRsF70OCLkP2TRmE1VGPgqrO9Q9nKVHnRJwvIDzU+JlsE3gRhcPJW6WquIFok5TG9PlhnIBbr/NMwz0adFrQz1oaqI2UvX5NmcJ7zS94TZla++cAVQUo26vwp+6LWiemH5vJ76PUwxl2vabO0I4fJMxH24O5kA+/3gs/v5DX9HQnF1m4gcxnNFPj9scaDbTrxCNpBjwIEN+HxD57AV0kd0W66NIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2MTJ4ndpGjEYlniVw1PXzMknvevTcNG6+mQnrcssqg=;
 b=sRaFrORpiszCaaICFY2HAuRQaQKCzIrNXFcSlFQkE5qX6M70LxVxCeqWkj0q2rVCmgUgbKBdwFuCeaGkR/mjEwUzwo+BF+EO6J2HGKCPBEAiASZ8yQFXUTdTUSbUCV/CMf6uTH5QnFWXfobZm2nKu7c8qh9eStApGzDbosxUNvDF+fKhf84EwTdxHcciylj7VtyW9SscTsgU+/pFIeYCAm7UAddhYsKeob6KUkgXS3lOqBL3fARJstXWyVcu0Y6ngHwvBMttxTvphEBPxbirAz3/E8HcUZ96nwKYd33wt7vwOnjW/YEFxnuQt24zXRyaqPM5I7fDgGJE8KfVDdx4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 21:42:21 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 21:42:21 +0000
Message-ID: <2fb6ee84-c5a3-4889-ab42-93e84e6d9694@intel.com>
Date: Thu, 25 Jun 2026 14:42:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
 <13a16602-9bce-472e-a89f-d205f0d2afc0@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <13a16602-9bce-472e-a89f-d205f0d2afc0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef4cc8a-1e79-4aef-812e-08ded302a0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: NzhmcuysU7GaGN98++HIUHCPZKm7f0gZZed9rcmvSHZYMqfLOhoEI9vsZMdHqenLSchr5s7KjvMveztwS0lUpq75TWDZpqisOTmdcn7Pb7Kgyg3bxVsfAaSxCjZsYXeW5p/82OmrR2t6knQ9l2229ur27AEINl6WjNiKlJ7WKkVIVVKiofaBm17syTnoS1B8569Q9LQI+hX9Sx4bypUiz+diF5o5xaJTZ0ex5R8HtH5BOlivRaPUd/fberdBEXF9yWzcD7JGCAhEekdM2fdeH80yDW+TEaL8BfXqglrntEczOO7BoDLOEO426lQd9MPHMGOFxZlGUTFfnGyrwxPrg/gMHkliWUUVsBI5Dn8JBp0Mt8ImBUNAIrWfkeOKMYhQs2hBjOdCwZ/a37HX0ClvfwT1YrdTmhSdMQU1dVBxvXLWNDKrNrGZ8h5OP7seNWR8At5JaDui0OuQSjMOgJi4lYuiW91onJYzsvqSK9ReTzTJRRClSjrOterqikma8FVpBRGMM5LbC6Gmivo8cVIw0WfK6f3+GvP3ZutAoAFUvtX8bpaHz9hzhJ6zmxQq7CYzUn1RCSxRN7dFIKfFtDi6sLr4TrZjSvo8Vwt+cWqR4oM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BzZDRoOTdzQ0JRL3ZSNFVsRU5NSGtvOGNFUU5OR3I5b2J0aG14VnVnVkJB?=
 =?utf-8?B?NlhhTDBlaEpXTzhRZ3A1elF6cjBDNUVzQWtSZFBBMWMvUE9VcndMeU4vYWtO?=
 =?utf-8?B?aHFZdDhoSnljdGgwSzNyYVJ4SmphaENld0VSekxWWFJpNSt0ZU90REtCamxv?=
 =?utf-8?B?M1JYZENTWGpKNHk3VkhsTlpUTHR6azFDK1I0N2ljRUlmOGttRUdyMDAyVzB6?=
 =?utf-8?B?aDJHUGlZZ3d4eTVJM01pSkFSZ2hVWXhtMU9WQjR3TThJYVJERjBVY0RGMGpP?=
 =?utf-8?B?ZEJXOWVHQ0VmeCtTQVcxUERIZ0ROcHR2dFc4UUY1bVl0VUJyUjlRdVNaSU5Y?=
 =?utf-8?B?U2VvV25Lc0hOS2hFUitvc3lsdEErV25FY2ZrTTFNNi96TS9VSzd3bTY2T21u?=
 =?utf-8?B?S29FRERCSkZtMFhsVW14SFc0UTZ3d1hrZ0lwYTk3ZTB0NjE1R1EraU1uNFkv?=
 =?utf-8?B?Y29wTlZGeVNYd0ljMmphZlJMYkY0RlEyWVkxS0FrbVpRaTl3K2w5ZFlQTC9v?=
 =?utf-8?B?QWRvWjZhVy9PMlNSRWpsRnRjNHU5OG1JelBBZ1VhTkx6Q1ZLcEloKzFCNWNC?=
 =?utf-8?B?ejNwNFhVQ05PaStXZXpqRUIzWFJxMGtxbXlPUnJ3aGFhcHRsaTB4QWkyRzFG?=
 =?utf-8?B?V1J6Z2RXSk5qODJ4U0xEWnAwWlAwRDVLc04xdmJLTHNUMU9xL1RpeXEwK2ZR?=
 =?utf-8?B?UkNLbmRSQm55UDYxMm1lRnlPMTVWMUJCQWFZdVZtZk16SjFkRUplSjFlR2Yx?=
 =?utf-8?B?R3ZKMzUvc0sxU0kxTW8yVTM2dSs3L0ZnVDZFMDhxVFk0dmxnanRNcDZpYldw?=
 =?utf-8?B?NzNqNVR2MnFqdDlDaXZPVEF3OUV6Zzdlci9uOXMyZkc3QmJaVW40blU4Zm05?=
 =?utf-8?B?ZVkxRktNdUV2YlpBMXFtYzdQeE1yT00zUDloSkxyWlpoeHJhTklGMFN5V3ZH?=
 =?utf-8?B?L1NYTHhSOGNZSytocGEySnA0Uk93bVBmL1lsdTY0d3QrNmlFa2ZXYVZ6aW5U?=
 =?utf-8?B?ZS9pbTQwV2JGL044QXRtTUlheWFQaTFOZTh3WEZjMmdnSDcxSmMrcjZSNzBU?=
 =?utf-8?B?YXlCUzlUa2FOSXhIRFpaUHd0bVNkb1V5eEkvTmtvVjViVVZpNksxUHAzSG9q?=
 =?utf-8?B?WVZXM2xyNzZPT0tnUFg4SEpHQ2VlM2FubjVkbDV0YnpETDRkd0w0YURHMEx0?=
 =?utf-8?B?U1BxUEFtRy9kNnU1TmwvTnhEdW1HL0VTNktUREJ0YUxRbGoyVG94R05McUlU?=
 =?utf-8?B?SU8rNjJjWUNCZ2V2SnFtWHVFbisxZ1NhTUZMMVZSRURjM0U1Z3AxSFFHUEp3?=
 =?utf-8?B?S0RzNC9hTXM5TnBxMS9yL2FGYXNLSHJhVUp3YWJDNy84VFNXWHRkVFZsZ1Fz?=
 =?utf-8?B?UG1kWjBSOWVLUXB1TGRDdHl3bTgyVyt1ZDlzVlVqcUJ3WG9qTjlhTFFnbmZs?=
 =?utf-8?B?NlFrMy9kU1llQ09Da3BxdVhLSERNY0dCTG5HbGRSaTNZeUFTV2YrbTJreDhj?=
 =?utf-8?B?dktMNGhMV3J3N2JTRDNHTjNML25MN2ZnUkNIWFFrWkUwSXB5UldFM1RtdHcw?=
 =?utf-8?B?SHJjblJUdk9qVk80RUh5VWkrRHFqUWVqTHQ5U1RQYTJ6cUJiNjk2VDhOU2JN?=
 =?utf-8?B?YUNvTlBTb0d5dFNtWlJZWTljWG53V0x0RzhYam5HTHBmZjhMSXRPL3ZxRGt3?=
 =?utf-8?B?YzFUQVExeUVGakd6aUVVN0tpeHpsYkhaL2pFditMNDhsN2ZDUFBEWFlpQlhR?=
 =?utf-8?B?QXFDMDVESnFQNW5wZ1J1NjRTT3hKOS8zNEgxd0tzUXpZalhmaldnaWdKamhW?=
 =?utf-8?B?R0lyRERMMTFaTEdaYm5rMkZhQjBvUHpNMDVaT1UrRHVxNDV4TEFoSGRsUGs2?=
 =?utf-8?B?aGxoUFhoYUxxQUNBQWdRZ3AzNmFhUXQxRUFVUlJ2R3BqQVlrbUpNQ2ZlV0Fu?=
 =?utf-8?B?aEVVamNuNGxrakhydXFSTlZJRXQvU3VwQUpSbE5xVHBkOGNjMlh4Y2d4dXY0?=
 =?utf-8?B?NXFoVDJUU0lvbVBiL0lSM1Q0dFdSOTBwWlN6Z2QwbG81Z1FHR3MycGV2OXdh?=
 =?utf-8?B?cEhadSswSy9WcGV3M1pyS2tNY0prSnZpaHNWdkF1Qk0zcHB0aW9QV001ckpX?=
 =?utf-8?B?S2RTazkweTcxWkJPazhHU1lITFVtblV1OEQ0bUx3RjJlLzFKWjVxNmVVRjFz?=
 =?utf-8?B?NTZvR1dvRlhCMjZBekRiTEwyWHVnczNsWDJBY2RGNGRCRU1MTDBMVEhPaEpw?=
 =?utf-8?B?Y2ZvK0dGcGVsU0E0SFJIZFFuZzdxaVcydEo0NUc4LzFmT0VuNHlhanMrK0wx?=
 =?utf-8?B?dGNZSGJMT2hjVlZ1Zmk1V3hob1lqbE9XeEkrN010YWZoRUhuQkthRThVU0NI?=
 =?utf-8?Q?IclTGWHzsVzua3nE=3D?=
X-Exchange-RoutingPolicyChecked: JE2c916maVNbpF9uAcP4qCV48XxanxEtXyVhvI5roauVLi0DNaXLjoblao3AALC4nsI0uAew3/DRNTMbtxFPO3PRs0gnAHSpCOHPu+LPYtZCTOPQ8NVT+HFP9Lj6RR74cUgnCHS1ObdSO5Nj70PSiHF29XIl66jO+IhZll+8H7xlinwrUsPTBua34yCfCLTGhb+qwJUn3uQWA5YMXz5P3h/w8t+J26oYwmwfk4rMpKko/KTeCaQQLR9aW4VX235vGhMtugqHArXd9I8wPzhzRg6N6MF6jg+r8hqZYgFXkmY8sqNLIVCdegchztEnANpmNMK7J0oV0AlAtT7pWpnyfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef4cc8a-1e79-4aef-812e-08ded302a0ae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 21:42:21.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmRU2f9ut4unEBZxyUS81Zu1GXaKEXNaMw1f6mbvlfC6m1xLka9Ym+q2dAAHXZhyodwJMwYz5OOA/z2knq0FMIHZmxXivVYWsi1c+ym2rZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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



On 6/25/2026 2:21 PM, Michal Wajdeczko wrote:
>
> On 6/24/2026 11:56 AM, Michał Winiarski wrote:
>> Notifications about VF state are generally not considered critical
>> enough to warrant PF GT-level error
> hmm, but without that error we risk that we will not notice that
> we missed to implement handler for such notifications
>
>> and subsequent reset.
> hmm, actually this could be our "problem", as initial idea of returning
> an error from the CTB event handler was to print the whole CTB message
> for inspection and later we also added the capturing of the GuC log to
> figure out why this message was send and if it is legit, all this done
> by triggering a reset to leverage existing capture mechanism
>
> maybe we should change the CTB code instead and trigger a reset only
> under a debug config ? otherwise, if somehow we still have some gaps
> and GuC will keep sending some unrecognized notifications, we might
> enter an infinite reset loop
>
> @Daniele, how you see it?

The reset is not there just for the capturing. Our assumption is that we 
should never get a message that we do not recognize and/or can't 
process, so if we do get one then something has gone wrong; since we 
can't be sure of exactly what has gone wrong, we do a reset to 
re-initialize the state and start clean. Note that the addition of a new 
unsolicited G2H message to the GuC interface is considered backward 
incompatible, so the GuC usually implements an opt-in to keep the 
compatibility (i.e., the G2H message won't be sent unless the driver 
explicitly opts-in to receiving it); a recent example of this is the 
uncorrectable error notification 
(https://patchwork.freedesktop.org/patch/732697/?series=168465&rev=1).

If you think that we shouldn't do a reset in this case, then this patch 
does the correct thing by processing the error within the handler and 
not escalating it. Maybe we should make the message error-level though, 
so CI will flag it?

Daniele

>
>> Convert the error to dmesg log.
>>
>> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> index 058585f063a93..65f015d0ede51 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> @@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>>   	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>>   		break;
>>   	default:
>> -		return -ENOPKG;
>> +		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>>   	}
>>   	return 0;
>>   }

