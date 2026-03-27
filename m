Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8431E10F286F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 21:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DF310ED03;
	Fri, 27 Mar 2026 21:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiLog3r2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74810ED03
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774645368; x=1806181368;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=os683Bi2lidDt4wANyf9Sa/c9QRhl95WE71drbbi0sU=;
 b=DiLog3r2d/wxmCMb8gLa1X5e1ErrZDxAT3G3BQwSeczE5SSTmf/MjWQJ
 190gQ43DKB8/l8oIujw/GkBU/Xjd2IEKZeFljXOiaQvb84Kz+ul6H8FV1
 2VF8/0v+BH9JrE/sb5bOvEiV86UMtyvLuriZJYWIlGdGldy9YkQtbARuO
 IdRMAAhtH0UXAgP4VbCbymeDz6kbwIpNzc6byJ6Up2Q0ns9q0A7BU8wcB
 JBIPcBPcgJkS2WCezdr6hYAgxuFFI9Anl67996K5MjxaO+LNkEK8M7uK/
 FQu2U5ndzBfBHjbNGnoLjq9gPQM2Ngpc0fEi5ZqWjRNg/WN4b28P6hNh3 A==;
X-CSE-ConnectionGUID: rAA0FPv6S6ujjtIu1u6DrA==
X-CSE-MsgGUID: 5G7HQQ6xSv+8a2cm20jx2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87114125"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87114125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 14:02:48 -0700
X-CSE-ConnectionGUID: TcYxnw3NRbuD264q81Oz0w==
X-CSE-MsgGUID: FCVTMXX8RVa2HrMtmRac4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="225682642"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 14:02:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 14:02:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 14:02:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 14:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZElKqIVIxZ0dbzntm8KD6Dgl6wSiFhkx94bAtnUgvlxpRT7hrbfQwEmaxrnnnNxv5HLeaq4KkCFVHBqyo6Z3qSIjXtIVTHc/hkiToa0LELygv5I86pRC8p5+J5sb6CqoWk52pBo8oUcrH/1Ys6xeUromeffRoyPD5wzPIqf20t8+YZSkg+y2zTsIMW7gMmucqTxSg4mDD6s9h+gOfMDJ1P0BzvPO/2Lx8I39kgqD2T6TF3Bu8xG8QmeOuz1s+svh7EEFMyVZfIGST9RHX1XQ5zS8WyU8NxV79iuqb0WoXkMynySDkUAifzEI291IaKOXJSU8T2ipIW6m7dRDDPCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/weQgi2qsWhYthYoZjMFA7NiY3lnHy7TgFHTk29K9qo=;
 b=cUCeYGwnzHge69YX4Y9roripAL5ufOqEFuodsi0SdHxblh/ZuwfWgn0/YNW6ilsnzm5CbLtVXZuXRogavkZ5ocVd84DH+pPj6alCxxb6ez4wna4kbEPwDj/7CHLYyL7cNkV/jQ0gUIe5trVWq1ajSwZ867IAJ9prd4sxNv8c9rv74LESVXejo3P7hJyI59FWgamFvHZlYLCCT4PHwHQWZZc1EEAUXI6KVap08v64iMuqlMba83+3TZ+fCrge5fh9mrJP9VePiYcG4hsY8a0+/zWsgeilIsodgp8xZuN8gnO7C6ZQzXJouqAEJ/zYguX0BMxMWJ7imd3abVSnf96ySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Fri, 27 Mar
 2026 21:02:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 21:02:42 +0000
Date: Fri, 27 Mar 2026 14:02:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Document GT statistics
Message-ID: <acbwbyspL0KAIWCf@gsse-cloud1.jf.intel.com>
References: <20260327202749.222794-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327202749.222794-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: 99827259-5f9c-46ce-32b4-08de8c442fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 7/z/tQ1z29txpd6q3gX0uLUvzqwnLSqsETco7ytvfy7tiIw7RfCKvI+X4rLWmn22CFQs4qG728NK9se/SscdmPLrjrDe6uK669hlACz+HYfgk97eULlXg8u0t3ghakiAK4JJVjXeGVurZ4HAj6VymQxK1CAioFlv41+CdGv1jtVhjc24ZhfP2536zpv3hfb5bOpDC/T8Mk1biDvey/g5SYzsPBQvxNs1Uohpukg9gBrUBkimQXu8W9uJliVNAyCUAPCK/fXIpWQQEX/a5eUQLl0Jw5gAKjtSWQjh3P5RHkVJYJElds99lJXf+tSozoFDFjsHN8RyXxnld6QqtWucvtIC6dMHFe0YJDa+pi7+h87kDK4jyB7pY0CMA2+WUAEqD98hx5Ye//dAf4IrrEldrodQTUzlwwO1/7iEnno5qczljUrdyyE+1YdgYdW+alRAR80qfFovwyMIAr0w1YGJqk8n0jiC+aTLGoxhDU5vlhHHILhB83JLMBh8UfULE8EFOg/GBBaw9IpbuVWP0pqDjCaKCnMSJti86BgG2cgi1tudge6wk5+X2U5OOWZE/nvQsyVL89wXKLCtv0jYgUCiD/7ATgtCDl5ByQOtRgn1uSnCQy6PYxKnQ85GN7FtRfGo1haFDLFPTP+3LetFZ3ap2r2vz6T0sUZ3XyIRzYafZpoQ4LqlqHk50eXCwj4FZd3V1+RJ2vCP5qi9G/zWaB6pKERGHq7ysDpJRrtUTw7mtNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRpQWZ6QzVSODUzRll0T0hzZTR5MVJQeE9ZTUFraE05eFBVTnBGcGpESlVH?=
 =?utf-8?B?WUhNS3hPazV3NXpsbzhaS0xvRUtPVGE4NGVKZFlDUzBHWjhXQkV6SmxRZFlm?=
 =?utf-8?B?L3YraEhlZWRUOFNnTThUNjVraysrTnNvTWhlRmF3cm5TQ09yMUJ4VVBnTHoy?=
 =?utf-8?B?WmpLYnNoL1V0eUEyS1BNVmFScXg5SzE2akI2WlJCcUN2Uy9mSmF2ek9pb1Nq?=
 =?utf-8?B?VittVVkwOUVIcFNlb1NhTFFORHk1YmFzNFprUTNDQ3E2YXFVelIwZGZoK09t?=
 =?utf-8?B?bVJsQWVHeUNCVStNYnpkdE9rdTdZYnNEaitVYUNVK09iZ1JzTnRLWnFUSGdo?=
 =?utf-8?B?aGVudmllejRGckZaVzRSczl4dEErTkpyaHp5SDlDZXJMb0ZDWUV4SXh0R2Yr?=
 =?utf-8?B?bXRMc3B3MzNRRHd6Z0oxYyt0enBDWE9DRXZlK3VCemh1elVCbUpPd00xVHFo?=
 =?utf-8?B?L2h4cWljb0lVeS9mbTNaYkF0UkJ6NzhLcG1EM1F6di8rMXpGZDgraVgzWFgr?=
 =?utf-8?B?K3JHUGxUREQvSzVCZHdFS21LY1JOTlVtakhFaVp0VzhqTW9ycEphUCt2aEdr?=
 =?utf-8?B?cFQwL05iRkN5aGNtQXJ1ZVZkQjM1SmphblZFcXlBbGdyNXZYM0F3WUVsQWNL?=
 =?utf-8?B?UkREQmNEV1lFTGNCZUkwU0gzRW1raHBmK2E0dUNCM1NLL1BUUUN6dCs1NEQ1?=
 =?utf-8?B?Wmo0ek10Z3paWXVtN2NFTEZ3R3lVUjd3a3RiUUx5T1hNb0dzRHlBZmY1dTlY?=
 =?utf-8?B?anFHSDhZL2V3eHduazFMNGp3TXlmRFkwb1BOeEV0Yi9WSTNxUDNuZFJnNXo1?=
 =?utf-8?B?eWlleUVmUUJPdjNjWVBuekZqRi9FNXp6ME1RTGYrbVcwSk94U2hxVitzWjc3?=
 =?utf-8?B?aE1MTVd3L1EvYWMrR1hEdmJ2aHVTRGxoVFMrNlRKbVgyRml0dkl1eFBnenpQ?=
 =?utf-8?B?RDlTZFYwSnhGY1lQSk1iRzNuR0x2WktiZjFtYkFkNmc3Vkl6STBIeE9Eb1Vh?=
 =?utf-8?B?RmFFbS9ablRaRExrNkJRSStoeTMxVDRKOHcyenpadk5xNUY1MlRsUWVOVjAw?=
 =?utf-8?B?cVdDY1lnTTV2ZEwyYjVPbWlnSVdLSzI2VVJoK3NzWmVlMWJpcytmbytnRS9y?=
 =?utf-8?B?UFdzQVJTNkFZaUwvMmFTSjJLaEhTY09iNExTdGZpdW94WmhpbFZuQWlEc3Zy?=
 =?utf-8?B?WnJZZTB1MGxHQzJSM1FnUU1NSzl6TkJTL0daZERBWDZ6VTE0M0NGZnhmSDAr?=
 =?utf-8?B?MjNlcWI4WFpVdjlTeERWQkpsSVllamN6b21pb0xESGlSMnhQMTRaUUMrRWVt?=
 =?utf-8?B?R1NvODlXMU1RVGZOOUMxbXk5YStheE5HSWxIbU1LVmQyclRqKzlkQ1RFdzd3?=
 =?utf-8?B?OE9HbzI5b0I1T2VwMEFQbFBhd0pSYTM1ZGMwMnVBNS9qZmREajRRaUNtWUxN?=
 =?utf-8?B?dkRPZG5rRVVuMkpOaHJNV2h2Q1pwMEpGbXZSeFdKck5UdUE3bzJjUkprY0lG?=
 =?utf-8?B?citnMHRwQTBSallvdUlvNEhoMGNYQWI5TW1vNHo3b012ZVhCSFBoejkxWUZu?=
 =?utf-8?B?Z2FEYk1WMHN0Y0VlYms5SjhaM1VPa09qb01FcFFiSVp2eU5tWVBQMDZJRDgy?=
 =?utf-8?B?WGVxNEpmcG9GQk9BMHMzc09HTVlaTW1kZUR5bUs5WEdnVk1yQnNPaE1QSFVl?=
 =?utf-8?B?cEtuMWN6aTdrVkZrNmQwRWdLSEVKR2c5cEM3bm5pWTI4S1hjL0U3RzhRQXAz?=
 =?utf-8?B?VWlCU2xheGljT0l2TGNyOHgyYVNzb1BuSzNwTlBlT3Y1andORFA4eUVNSUVM?=
 =?utf-8?B?UklpTElpTU9xb3BUYWg1ZzFTTWV0U3ZjQWJ6OVNhSTl0QmlYUWZpRnZPanJs?=
 =?utf-8?B?K2JPNGxBeGt6dllwRzNFYXEydEdUQVV0NUtJUUFvTytYYlFUNG1yT09vTlVY?=
 =?utf-8?B?VHgwS2o3OTlzRkNPYXZaVDlEK0FXYWJEYVhHeXNoWnRKQXRobW9CbzNld0dN?=
 =?utf-8?B?V3Rjck5FMjNhVU41bzMvSDhoNmFzMlg3aHZBdmJ0Zk1WTk5hTExzeGNuOWZU?=
 =?utf-8?B?WjNGZHJwQldmT2xJSWltbWYxYVAxRW1MSVVidUg4QS9OVm5HNHpSeFBmamRw?=
 =?utf-8?B?YWdKNE5pN1pZdDNMbkIzWjdPejNvNENmQkwyWm9jcnRBTHgrSGdOcEdzVW9K?=
 =?utf-8?B?VGVjdDgzd1BscU1qeTkrODNHYmVCc3R3SHVRL0E0WERLbk5WQ2tpdFJnRTMz?=
 =?utf-8?B?RENpQkNvd0FPaFJlR25VdDA2RC95L01kWDl1VGlLbGdnRmZna1VBV25WTkpm?=
 =?utf-8?B?SXREdEIwSFZ0RFhnQnJIbkxWKzZBUFYyQ1FBODVoV2ZLVXJuUDdMOHBxMERa?=
 =?utf-8?Q?60K5Q+NqSf0E8fbA=3D?=
X-Exchange-RoutingPolicyChecked: QRDiQPTtgD7uNncR9zCQuB8+QwoaeZrOGZZajirNO50R19y3bDH9IX2RFvh95DlY/lGCfYnS/76BQTufV1N3XljsYwRRf3G3BOiD3vXatFsSf7p64+a/dsxBqdmawx6r1iezzcHhtDr4fIaNRqWjMRmiACGqJLoysDPrQPZMQbXu1ojmgwYbTrquMxXic6HnVrJsJQsd5Bfz/cCc7LyrY6Gh1xKvksQk1PpuEUORiqMuWN80wRiNAAm/pubQllKSxKg7IHtTD/cyYU9yzQRPuGm+Yhs+mTPHZ1UfalsOAwUiSPIeDqwf4iQ76/r2DlIArJFshdpH8fzT1ZiVG2b5iw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99827259-5f9c-46ce-32b4-08de8c442fe8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:02:42.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3lGcoVUq3WigutyQ8cWL1ooDieFfrNpqDHEnJuLKxPPSSmz7k34l2CqZNtJmiweW7Dat+muDYzAEW8XgzfQbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
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

On Fri, Mar 27, 2026 at 09:27:49PM +0100, Francois Dugast wrote:
> In the context of porting applications to SVM, the Xe GT statistics are
> used by application developers to validate expected behavior such as
> proper alignment, page fault count and migrations. As those statistics
> are made for kernel developers, they assume good understanding of driver
> internals, which is not always the case on the application side.
> Therefore, this commit documents the usage of GT statistics and clarifies
> the meaning of identifiers which correspond to the values exposed via
> debugfs. Documentation is close to identifiers declaration to make it
> easier to maintain when adding new entries in the future.
> 
> v2: Fix page reclaim list (PRL) entries (Matthew Brost)
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  Documentation/gpu/xe/index.rst         |   1 +
>  Documentation/gpu/xe/xe_gt_stats.rst   |  11 +++
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  41 +++++++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 118 +++++++++++++++++++++++++
>  4 files changed, 171 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_gt_stats.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index bc432c95d1a3..874ffcb6da3a 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -29,3 +29,4 @@ DG2, etc is provided to prototype the driver.
>     xe_device
>     xe-drm-usage-stats.rst
>     xe_configfs
> +   xe_gt_stats
> diff --git a/Documentation/gpu/xe/xe_gt_stats.rst b/Documentation/gpu/xe/xe_gt_stats.rst
> new file mode 100644
> index 000000000000..5ff806abaddb
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_gt_stats.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +================
> +Xe GT Statistics
> +================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_stats.c
> +   :doc: Xe GT Statistics
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_stats_types.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 59b3b23a54c8..789397514f3e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -9,6 +9,47 @@
>  #include "xe_device.h"
>  #include "xe_gt_stats.h"
>  
> +/**
> + * DOC: Xe GT Statistics
> + *
> + * Overview
> + * ========
> + *
> + * The Xe driver exposes per-GT statistics through the debugfs filesystem at::
> + *
> + *   /sys/kernel/debug/dri/<device>/gt<id>/stats
> + *
> + * This interface requires the kernel to be built with ``CONFIG_DEBUG_FS=y``.
> + *
> + * Reading statistics
> + * ==================
> + *
> + * Reading the file prints all available statistics, one per line, in
> + * ``name: value`` format::
> + *
> + *   $ cat /sys/kernel/debug/dri/0/gt0/stats
> + *   svm_pagefault_count: 0
> + *   tlb_inval_count: 1234
> + *   ...
> + *
> + * All values are 64-bit unsigned integers aggregated across all CPUs.
> + * Counters accumulate since the driver was loaded or since the last explicit
> + * reset.  Timing counters use microseconds as their unit; data volume counters
> + * use KiB.
> + *
> + * Resetting statistics
> + * ====================
> + *
> + * Writing a boolean true value to the file resets all counters to zero::
> + *
> + *   echo 1 > /sys/kernel/debug/dri/0/gt0/stats
> + *
> + * Any value accepted by ``kstrtobool()`` (e.g. ``1``, ``y``, ``yes``,
> + * ``on``) triggers the reset.  Resetting while the GPU is active may yield
> + * unpredictable intermediate values; it is recommended to reset only when
> + * the GPU is idle.
> + */
> +
>  static void xe_gt_stats_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_gt *gt = arg;
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index 081c787ddcb6..425491bed6c4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -8,6 +8,124 @@
>  
>  #include <linux/types.h>
>  
> +/**
> + * enum xe_gt_stats_id - GT statistics identifiers
> + * @XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT: Total SVM page faults handled.
> + * @XE_GT_STATS_ID_TLB_INVAL: Total GPU Translation Lookaside Buffer (TLB)
> + *   invalidations issued.
> + * @XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT: TLB invalidations issued during SVM
> + *   page-fault handling.
> + * @XE_GT_STATS_ID_SVM_TLB_INVAL_US: Cumulative time (µs) waiting for TLB
> + *   invalidations during SVM page-fault handling.
> + *
> + * @XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT: Buffer-object (non-SVM) page faults
> + *   handled.
> + * @XE_GT_STATS_ID_VMA_PAGEFAULT_KB: Size (KiB) of VMAs involved in
> + *   buffer-object page fault handling.
> + * @XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT: GPU prefetch faults for
> + *   addresses with no valid backing.
> + *
> + * @XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT: SVM page faults resolved by
> + *   mapping 4K pages.
> + * @XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT: SVM page faults resolved by
> + *   mapping 64K pages.
> + * @XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT: SVM page faults resolved by
> + *   mapping 2M pages.
> + * @XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT: Valid SVM page faults
> + *   at 4K page size, where the GPU mapping was already valid — resolved without
> + *   creating new mappings.
> + * @XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT: Valid SVM page faults at 64K
> + *   page size.
> + * @XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT: Valid SVM page faults at 2M
> + *   page size.
> + * @XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US: Cumulative time (µs) handling 4K SVM
> + *   page faults.
> + * @XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US: Cumulative time (µs) handling 64K
> + *   SVM page faults.
> + * @XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US: Cumulative time (µs) handling 2M SVM
> + *   page faults.
> + *
> + * @XE_GT_STATS_ID_SVM_4K_MIGRATE_COUNT: 4K pages moved from CPU to device
> + *   memory.
> + * @XE_GT_STATS_ID_SVM_64K_MIGRATE_COUNT: 64K pages moved from CPU to device
> + *   memory.
> + * @XE_GT_STATS_ID_SVM_2M_MIGRATE_COUNT: 2M pages moved from CPU to device
> + *   memory.
> + * @XE_GT_STATS_ID_SVM_4K_MIGRATE_US: Cumulative time (µs) moving 4K pages
> + *   from CPU to device memory.
> + * @XE_GT_STATS_ID_SVM_64K_MIGRATE_US: Cumulative time (µs) moving 64K pages
> + *   from CPU to device memory.
> + * @XE_GT_STATS_ID_SVM_2M_MIGRATE_US: Cumulative time (µs) moving 2M pages
> + *   from CPU to device memory.
> + *
> + * @XE_GT_STATS_ID_SVM_DEVICE_COPY_US: Cumulative time (µs) for memory copies to
> + *   device, across all page sizes.
> + * @XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US: Cumulative time (µs) for memory copies
> + *   of 4K pages to device.
> + * @XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US: Cumulative time (µs) for memory
> + *   copies of 64K pages to device.
> + * @XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US: Cumulative time (µs) for memory copies
> + *   of 2M pages to device.
> + * @XE_GT_STATS_ID_SVM_CPU_COPY_US: Cumulative time (µs) for memory copies to
> + *   CPU, across all page sizes.
> + * @XE_GT_STATS_ID_SVM_4K_CPU_COPY_US: Cumulative time (µs) for memory copies of
> + *   4K pages to CPU.
> + * @XE_GT_STATS_ID_SVM_64K_CPU_COPY_US: Cumulative time (µs) for memory copies
> + *   of 64K pages to CPU.
> + * @XE_GT_STATS_ID_SVM_2M_CPU_COPY_US: Cumulative time (µs) for memory copies of
> + *   2M pages to CPU.
> + * @XE_GT_STATS_ID_SVM_DEVICE_COPY_KB: Data (KiB) copied to device across all
> + *   page sizes.
> + * @XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB: Data (KiB) copied to device for 4K
> + *   pages.
> + * @XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB: Data (KiB) copied to device for
> + *   64K pages.
> + * @XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB: Data (KiB) copied to device for 2M
> + *   pages.
> + * @XE_GT_STATS_ID_SVM_CPU_COPY_KB: Data (KiB) copied to CPU across all page
> + *   sizes.
> + * @XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB: Data (KiB) copied to CPU for 4K pages.
> + * @XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB: Data (KiB) copied to CPU for 64K pages.
> + * @XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB: Data (KiB) copied to CPU for 2M pages.
> + *
> + * @XE_GT_STATS_ID_SVM_4K_GET_PAGES_US: Cumulative time (µs) getting CPU
> + *   memory pages for GPU access at 4K page size.
> + * @XE_GT_STATS_ID_SVM_64K_GET_PAGES_US: Cumulative time (µs) getting CPU
> + *   memory pages for GPU access at 64K page size.
> + * @XE_GT_STATS_ID_SVM_2M_GET_PAGES_US: Cumulative time (µs) getting CPU
> + *   memory pages for GPU access at 2M page size.
> + * @XE_GT_STATS_ID_SVM_4K_BIND_US: Cumulative time (µs) binding 4K pages
> + *   into the GPU page table.
> + * @XE_GT_STATS_ID_SVM_64K_BIND_US: Cumulative time (µs) binding 64K pages
> + *   into the GPU page table.
> + * @XE_GT_STATS_ID_SVM_2M_BIND_US: Cumulative time (µs) binding 2M pages
> + *   into the GPU page table.
> + *
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT: Times the
> + *   scheduler preempted a long-running (LR) GPU exec queue.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT: Times the scheduler
> + *   skipped suspend because the system was idle.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT: Times the driver
> + *   stalled waiting for prior GPU work to complete before scheduling more.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US: Cumulative time
> + *   (µs) spent preempting long-running (LR) GPU exec queues.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US: Cumulative time (µs)
> + *   stalled waiting for prior GPU work to complete.
> + *
> + * @XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT: 4K-page entries from the page reclaim
> + *   list that were processed.
> + * @XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT: 64K-page entries from the page reclaim
> + *   list that were processed.
> + * @XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT: 2M-page entries from the page reclaim
> + *   list that were processed.
> + * @XE_GT_STATS_ID_PRL_ISSUED_COUNT: Times a page reclamation was issued.
> + * @XE_GT_STATS_ID_PRL_ABORTED_COUNT: Times the page reclaim process was
> + *   aborted.
> + *
> + * @__XE_GT_STATS_NUM_IDS: Number of valid IDs; not a real counter.
> + *
> + * See Documentation/gpu/xe/xe_gt_stats.rst.
> + */
>  enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_TLB_INVAL,
> -- 
> 2.43.0
> 
