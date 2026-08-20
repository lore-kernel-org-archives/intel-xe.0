Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63248C5DF85
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 16:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6710E20A;
	Thu, 20 Aug 2026 16:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGbQVDMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8DC10E20A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787243856; x=1818779856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JvzPfA0NW+ovMRYPX+orRDViDQEVBYzh8OzNfSTXrBw=;
 b=ZGbQVDMvpZGL6//tPgwVOfZ48Sblj+uq/lrDhLpFT+qIuWNtStzvz0wF
 Y8kQfvJ9ib8J8ed6kQ7ybVO2w6N9tkxuzu9vVWFm3W69vTcQHlleQqLe3
 iYlzGXPoCUfESu7YhljzianaFkdXZMrvZks1LLt+7lB5ahFmY4mBEUjPr
 ki7l7a8P3H57ocJBwMV+1mYTd0mkaR7bLm+GUccJBBLIcEr9sUy5DCg2n
 sspWENta4a52MJ/i+ElPTGv9uEsZHMoMLUQ3hGQA8h3r/0yOqDYU2Job7
 xF3MLki2eWSI+Vz9dMt0ETRe4CzsST1pKJtcSp5JzC2nsxGLzuX343EEy g==;
X-CSE-ConnectionGUID: nTHA64EXQnOrhSdaUHFetA==
X-CSE-MsgGUID: ZSCoy63uRxGq0goTFI2Xog==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86905869"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="86905869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 09:37:34 -0700
X-CSE-ConnectionGUID: PWxjCvbbSPqFRe2PUPMuFQ==
X-CSE-MsgGUID: doQzP7v2TXaz0Igwij2Fgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="269572630"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 09:37:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 09:37:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 09:37:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 09:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsK4zYUjZb91URx8VMJQd3f8dJTkxnQb4EP7NJPdN0wsR3A2MfDunisSTjAgzQwRessZXL8RjqmHJseei+nT3LmncIo8MgskF+tZ449optf9Zk7ohewcTPZK+eVk0g/oE2U8mRXCHg4WhPBzaDqIjkh22NFzGQSRn4Wzm8XOqAOxH74zi7c8d95x38eH3aW2VyPi94mHwSwS9ASROax0oL32SJ+iFUCc7AXvc0KWTPH4F1W83N8Sy+xESBG+U/RP2pBWYSus0NQFmKnMbIwe/vE8FjoBopyPo0MYxdZezauRy7ebkz8haJPWTom28B6Vjkvwo3AQZmDZXKzjxjiyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX7ojZPEyt28l6fU5itq2Ln7Sg19+TKNgkbiIHZamBo=;
 b=oao9rOd2ZhAwqgZ9mLquX3D4XxtsGZ5lbcvEbyMrvRlcclA+bGKOqiiWXXO4ME2JZSxyNyqdx/mtbOQbmNiXSpdwqRhLQyJquKwOkS6fbsJnMtV+L8zL1vrVu0hXcfEzAMVKSwDLt+6lKcvmGMzVsXZhn/50knf/y8QBan86EJ8xBvinCaFeaHEjEkdXkeuK8/QwpUBPWAl//QmNWUFmb+srY0VStjROVj/ioG+bMj5q+8xp1HXfuH/jJgqD6Hb5DCMyubPwqLOeyB23DkHugRb56AvUSqCdtjmaKZtOkpVClaRBxx4nfW1GHKGSbT+5Jb47m3moKJatvkrX0bNc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH8PR11MB9506.namprd11.prod.outlook.com (2603:10b6:610:2bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 16:37:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 16:37:30 +0000
Date: Thu, 20 Aug 2026 09:37:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Anoop Vijay <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <aoctQ2m314GQeaih@soc-5CG1426VCC.clients.intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-5-anoop.c.vijay@intel.com>
 <an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com>
 <026e7bf1-080f-4d95-965b-83c2afaf6660@intel.com>
 <aoYZY8fMaqT8NNFk@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aoYZY8fMaqT8NNFk@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH8PR11MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: fe84f3de-a52b-411e-3691-08defed953f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ew9acA6Apgp0fOMnHTMBN3lUYnoKj+LVAEdUi9kl+oQrDvOXZaVVTDhrhUceY8L/YkfyADGz1XhRHDJQ29u+oTblEZ3dz8JnvQ8oWTYx68QyMTZ2FV/CDEv6SorHAWQpX76QNexJlzixnf2PZEcmzAvc7/sHQDOZRLr9ubNxZ+p88KfsENdwpwog1+aa/NJLh4moDWVLxj0B/6TTOeKXx3QKjiPpph8ui86PCR+mcG3xUijpyTRMa4QQxVlE35iySezTgjc8WCNBJrDrhITz0v5uIO1FoCnnUPau85hjgvfVdPmG3J1fOkiDNWdMk3LsZu2wAkLttQRFp84+lOFQJ/+q1K1rlDUn1twGfAfqazK/99cAxIY3VOU4KgHzyEwlQKiJ2f+TZHFoycD7mgtAM8QbGD/K0Ytg+kS4H+zsSn6zlZdhi56uXy4exwjxssGfgVnwI5uwYZrte/cTDVitnwWVxREe57oNob2aekP7wGJZ8SmaGBI5PLjr+eYkr4DzwACjhS1nZuRLQ0B0SphuwScwgNg5Wf0jQRIh3sMVfFNmwwHzW586jZFe1lP4oDdz3FvV7j2xc0ZdYc+3D9KGUPWOrT7/bc2VV/YnnW2mI20tSiJ2OY/bGFdZ1RJaByBm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVXT1hvem1FSG1ud2ZBMkp0Yy9YQ1hac3NwMGc3N3MyUlBGWXUrTGdneEtz?=
 =?utf-8?B?bGgzM0I3d3JIaDF0NEh4TUFKb282OHR4T3NMaUlYci9MaUV3N0RuL2NhRDJh?=
 =?utf-8?B?dVdZRkdJbTdlVkRwT3J2ODVMSVlURUN3N01ZcENVZ1VNenhoektkZTluR3Mr?=
 =?utf-8?B?SGlzMStWeUdoZlozK3lka0xYRHJ6WVU5SGN4ZWxHSW43TVlqMmFYMFlVeGpK?=
 =?utf-8?B?SXJNMUhQV3dhenlyZlVETngvRGVWeWFOaTFteS9EVTFqQ1NLUTRxZTdMSFdm?=
 =?utf-8?B?UEx5V3laUDBpTUwrTkptbDhPNnV6Z3NrZWhobmhGUWRKRFZlRzluRmJuZURI?=
 =?utf-8?B?Z0tPak5NWDl4OTEvUHJ4QUNSR1EyM3MzYmViS2owVlJDNGd1WVYxQzNmRVFa?=
 =?utf-8?B?WENvTERrWWJrK1lTSzdwRGxMMVhRaG9RUXNvZHRsZGQ1S2hVQitTeFE2aWx0?=
 =?utf-8?B?ZzhaVk04ZXJTdW5CdjdWNFFGcVRMZHYxRTBHUmxLSjFFcGxSU1BqbXNEZjd5?=
 =?utf-8?B?ZFNxbXhTbGc1VDJ0bnF4Snp3dkJucWFlTnNqSVBublhSUjZkT2xILzhTMzZ2?=
 =?utf-8?B?MzdaZnVoNmJXcDFFQW5jM0hGQU81Q28rYVJnelFQUXpONjFHZVB5bVVRbmps?=
 =?utf-8?B?NzVBdmowRFZYalNFcUFDZ0o1UDVZRHpxSUZwWmFYSlV0akVtUDdZRzBwbTVq?=
 =?utf-8?B?N3p1U0ttQ1ByWmdGcWkwdkNWUzNpeFh5d1RpRGwrNEN3ZjNydGRkTjQ4ZVZ1?=
 =?utf-8?B?a3E1cDdTTHVKcnVCMkw1RlVRb1I2cG1JNEtncGlia0pmVzdkRUtrL3RaWnNi?=
 =?utf-8?B?V1RRZEpiMDllL2Q3bmZISStPdko4ajZLY2hsK1hRMzQ1bzNkWFRHZ1g3RFRP?=
 =?utf-8?B?d2M1VjBPZW1uM1lZQkgzdUx3aWNMcURtQVdITld0RDJCWVFxeUIyUXY3QkZ6?=
 =?utf-8?B?eTNUd2krWkE5TktrZXFjTkR4Qi9oaGJMTTdrS1NWOXpTUUpGdmhqU2Ixd0h2?=
 =?utf-8?B?Q3dLT2loendLbkMzejVvdUtRdmhOTDFvNG81SGpyaUZQT01tV1FFSCs1TUlB?=
 =?utf-8?B?dnY1UnhHUlRkZGZpWklsL2lIWXJYMU9oREJFcTJHNnhtODJqeHZGTTVkd1Jz?=
 =?utf-8?B?Wk5PZnJrMEZTMCsxb1dKVGVjN1FpZ3BUaWVRUWRKOHBrNERRWWRzZXVjRThq?=
 =?utf-8?B?QnROV0VzWEkrdG44TDRhVjlRcEtZQ0pOUnpwQ3VYbXc5QzJ6U2VleU5lU3pD?=
 =?utf-8?B?ZGNvb3RwdXZwbG9aZGc0L2FJWW03VzVnSDhKdFU4enM0aTEzR3Jxdy93ZzRq?=
 =?utf-8?B?dTA1NjNlTHFwS1FPSVBhNmlWSncxc1BwUGduSWNFbVlmeE5vbGxxeFF4UmJP?=
 =?utf-8?B?Vlh6a0phRnpzbHNEY0NHTlpzWlpCR3dLd2V6UlMxZ0Q5M1ppMFRQZnRLaC9F?=
 =?utf-8?B?RHhGdW5LR2RDQS9nMCtkZ0lMNUpHelQ0ZURPK2xaa2NNWDhXNU4yOVZrZGJC?=
 =?utf-8?B?bCtLMHUyZTZxVDRXSzgxSSt3QUZWL0VTOHJZTEZvenFxLzZ6OXJlRkc4cVV4?=
 =?utf-8?B?dXlEOFBFc0o1Z0NDVXR6SmVBdjYwZDUrN3djK3Y4VVJEQzgwL0VmK0FKeDBh?=
 =?utf-8?B?TnkxZEZURnU4VmdtcldxRWN5UGd0UjBVN2k0VmRYM1kxOFVpQnNxUjlsSFZW?=
 =?utf-8?B?V0RTSVY1ei8wclY3UEZtMEZVUCt2Mys0WitqOW1DRnlEWjZrS1RBanRhWWNR?=
 =?utf-8?B?dlVtZ0M1cXRjSGNhT2RPRWcrMVFaQmd4ejFHTEFkTmhMak9ZNVl6L3Zod3Mw?=
 =?utf-8?B?aFRFbTZhV2c3OVFHZDNhNjFrTzFvK240b0l1UW8xYlFLSUpYV3FDclUyVlFr?=
 =?utf-8?B?MTBxdHJScVdkVkZKZDlwZXkvZHh0d1piVUpOaXBRb25oN0xrUWd6YVJDT0RM?=
 =?utf-8?B?eGl6UHVQQUNWQ3FJTlZmejl0aHZEVko2dmgwa1p5akRoQ1RtbWZ0OXI3d0lh?=
 =?utf-8?B?QUllcW9KYTV0TmRncmdWT3Vac3dwMkNSY3ZoYUxYQzRiYi9UTEhic0NJNkxu?=
 =?utf-8?B?QituQlNWb2ZQbE9Uc1kzcmdQczE3YkJadFo0SXYwNlFveU1Tdno4RUZLN3Rp?=
 =?utf-8?B?Rm9VZzBLRkNqNG9uejM1LytHbHk2SEVtTXNwTVg4Z254R0VUdXF6ZlR2SDlL?=
 =?utf-8?B?TUVUZVUzT0RsQ2k3RjdjM2ZBc0s0c3paZGJoN29YU0swMEYrZW1rSk5vbzg3?=
 =?utf-8?B?UW9KRVR2SVNsQ09BakRjRHFWeitrZDE2Z211VytXakZMaHlsK3BDTTFJMlRr?=
 =?utf-8?B?N3ltQUtOdWt4UVFlanNTUVRsd0xuVkpqSXFCRUZaQ2pxZUxVcSs1V2pLSWdZ?=
 =?utf-8?Q?OAq8KS4Kfb1OgpgM=3D?=
X-Exchange-RoutingPolicyChecked: UycgDGyW8B/iO7VLVXeIkKGjdnPkBZmjOzXNCvxr+nPWmP1wCb/1X4vr4SubOooknv06YEBEVjaWJhNxFXa8Xl7qO94vjXvXY8o6xRief+aG27vctlBjyhGmRDM98tetHUIuN0HKnYdCPbESkiUzjETrgJf1gg5bj19ZB12+9JvGOUaQ+HxrgkeKbelZlitlURmtFdRi4kOrUiaCMQ3iY+W/dem0mCy7ySvbEYnjI3IbNZ3lsrWxFX1O7A2L8f0SMn6Aa25JwmTgbsNxq91c84t6RHtxV8TdPy0P6wTldJqS5DT77QFS5I1YslOM4rXkSmsaRoxlRuOHEXDHe/T+rQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe84f3de-a52b-411e-3691-08defed953f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 16:37:30.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CWAoxMH/LWXzlJ4gpW83b3m1PtIWhXfs3XCejYO4eCTjiwgudHE75rpk9FhehQSQbX0lqxPVPE51DwYsgOx4WcXzU8J2rGWuAMmLNjO8KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
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

On Wed, Aug 19, 2026 at 02:00:19PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, Aug 18, 2026 at 11:11:13PM +0530, Anoop Vijay wrote:
>>  On 15-08-2026 02:51, Umesh Nerlige Ramappa wrote:
>>
>>    On Fri, Aug 14, 2026 at 02:53:06AM -0700, Anoop, Vijay wrote:
>>
>>      From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>      Add xe_sysctrl_check_app_status() to query the state of a System
>>      Controller application using get_app_status_by_id mailbox command.
>>
>>      The helper maps xe_sysctrl_app_id values to firmware application
>>      IDs and returns the reported application state. Add a convenience
>>      wrapper to check diag firmware application readiness.
>>
>>      Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>      ---
>>      v2: (Badal)
>>      - Return SysCtrl firmware application states instead of errno for
>>       application lifecycle conditions
>>
>>      v3: (Riana, Badal)
>>      - Replace string-based app identifiers with enum xe_sysctrl_app_id
>>      - Use get_app_status_by_id (opcode 0x05)
>>      - Move mailbox definitions to xe_sysctrl_mailbox_types.h
>>      - Return enum xe_sysctrl_fw_status consistently
>>      - Map communication failures to COMM_FAILURE
>>      - Add INITIALIZED state and status helpers
>>      - Fix Diagnostics typo
>>
>>      v4: (Anshuman)
>>      - Make xe_sysctrl_check_app_status() internal
>>      - Remove unused app identifier
>>
>>      v5: (Anshuman)
>>      - Rename OOBMSM status helper to use xe_sysctrl_* prefix
>>      - Remove xe_is_diag_fw_ready() helper
>>
>>      v6: (Riana)
>>      - Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>>       header packing
>>      - Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>>      - Use hex constant for application ID
>>      - Move oCode application readiness helper to a separate patch
>>      - Add xe_sysctrl_is_diag_fw_ready() helper.
>>
>>      v7: (Umesh)
>>      - Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less
>>      platforms
>>      - Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to
>>      xe_sysctrl.c
>>      ---
>>      drivers/gpu/drm/xe/xe_sysctrl.c               | 80 +++++++++++++++++++
>>      drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>>      drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
>>      3 files changed, 128 insertions(+)
>>
>>      diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
>>      b/drivers/gpu/drm/xe/xe_sysctrl.c
>>      index 1db20be8158b..c53a26af3189 100644
>>      --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>>      +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>      @@ -13,9 +13,11 @@
>>      #include "xe_device.h"
>>      #include "xe_mmio.h"
>>      #include "xe_pm.h"
>>      +#include "xe_printk.h"
>>      #include "xe_soc_remapper.h"
>>      #include "xe_sysctrl.h"
>>      #include "xe_sysctrl_mailbox.h"
>>      +#include "xe_sysctrl_mailbox_types.h"
>>      #include "xe_sysctrl_types.h"
>>
>>      /**
>>      @@ -29,6 +31,20 @@
>>       * This module provides initialization and support code for
>>      interacting
>>       * with System Controller through the mailbox interface.
>>       */
>>      +
>>      +/* Application status flags reported in
>>      xe_sysctrl_app_status_resp.flags */
>>      +#define XE_SYSCTRL_APP_RESP_VALID    BIT(0)
>>      +#define XE_SYSCTRL_APP_RESP_BOOTED    BIT(1)
>>      +#define XE_SYSCTRL_APP_RESP_INITIALIZED    BIT(2)
>>      +
>>      +/*
>>      + * Known System Controller application identifiers, keyed by firmware
>>      + * application ID.
>>      + */
>>      +enum xe_sysctrl_app_id {
>>      +    XE_SYSCTRL_APP_DIAG    = 0x0D,
>>      +};
>>      +
>>      static void sysctrl_fini(void *arg)
>>      {
>>          struct xe_device *xe = arg;
>>      @@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>>
>>          xe_sysctrl_mailbox_init(sc);
>>      }
>>      +
>>      +static enum xe_sysctrl_fw_status
>>      +xe_sysctrl_check_app_status(struct xe_device *xe, enum
>>      xe_sysctrl_app_id app_id)
>>      +{
>>      +    struct xe_sysctrl_app_status_req req = {};
>>      +    struct xe_sysctrl_app_status_resp resp = {};
>>      +    struct xe_sysctrl_mailbox_command cmd = {};
>>      +    size_t out_len = 0;
>>      +    u32 flags;
>>      +    int ret;
>>      +
>>      +    if (!xe->info.has_sysctrl)
>>      +        return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>>      +
>>      +    req.app_id = (u8)app_id;
>>      +
>>      +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE,
>>      XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>>      +                  &req, sizeof(req), &resp, sizeof(resp));
>>      +
>>      +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>>      +    if (ret)
>>      +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>>      +
>>      +    if (out_len != sizeof(resp)) {
>>      +        xe_err(xe, "sysctrl: unexpected get app status response
>>      length %zu (expected %zu)\n",
>>      +               out_len, sizeof(resp));
>>      +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>>      +    }
>>      +
>>      +    flags = resp.flags;
>>      +
>>      +    if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>>      +        return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>>      +
>>      +    if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>>      +        return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>>      +
>>      +    if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>>      +        return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>>      +
>>      +    return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>>      +}
>>      +
>>      +/**
>>      + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully
>>      initialized
>>      + * @xe: xe device instance
>>      + *
>>      + * Returns true if diag firmware has reached the initialized state,
>>      indicating
>>      + * it is ready to handle requests. On platforms without System
>>      Controller
>>      + * support there is no System Controller mailbox to gate on, so diag
>>      firmware
>>      + * readiness is not tracked through this path; the function
>>      unconditionally
>>      + * returns true so callers are not blocked by this check on such
>>      platforms.
>>
>>    I am still not clear how the caller will handle the 2 scenarios - (1) SC
>>    is present, but diag app is not initialized vs (2) SC and mailbox are
>>    not available and hence Diag App is not supported. The caller will just
>>    see true in both cases.
>>
>>    Instead I would see this as 2 helpers:
>>
>>    xe_sysctrl_is_diag_fw_supported() that returns
>>    status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>>
>>    and
>>
>>    xe_sysctrl_is_diag_fw_ready() that returns
>>    status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>>
>>    That would be clearer to the caller.
>>
>>    Thanks,
>>    Umesh
>>
>>  All current/planned callers of xe_sysctrl_is_oobmsm_fw_ready() /
>>  xe_sysctrl_is_diag_fw_ready() (xe_vsec.c retry/gate logic,
>>  xe_sysctrl_debugfs.c RAS injection gate, xe_sysctrl_fwctl.c capability
>>  gate) only need a yes/no answer to "Can this functionality be used now?"
>>   and treat NOTSUPP and 'not yet initialized' the same way.
>
>Looking at all these callers in [1] and [2], I don't see a need for 
>NOTSUPP. Both fwctl and debugfs callers seem to gate init/registration 
>using has_sysctrl already.
>
>I dont' know about xe_vsec, but looking at the code, it has specific 
>implementation for different platforms, so it will not call the _ready 
>helper on unsupported platforms. @Michael for comments.
>
>We can just drop the XE_SYSCTRL_FIRMWARE_APP_NOTSUPP check in the 
>ready helpers.

Based on the xe_vsec patch - 
https://patchwork.freedesktop.org/patch/746022/

even xe_vsec has a platform specific implementation, so it would not 
result in the NOTSUPP case. We should be able to drop that in the 
helper.

>
>Thanks,
>Umesh
>
>[1] https://patchwork.freedesktop.org/series/171728/
>[2] https://patchwork.freedesktop.org/series/161655/
>>
>>  Folding NOTSUPP into 'ready' is intentional. It lets sysctrl-less
>>  platforms skip straight through.
>>
>>  Splitting into is_supported() + is_ready() wouldn't change any caller's
>>  behavior, but would require every caller to do '!supported() || ready()'
>>  check. This risks a caller checking only is_ready(), resulting in
>>  unnecessary retries or failures on a NOTSUPP platform.
>>
>>  Given the current usage, I'd prefer to keep the combined helper and add a
>>  more granular status/support helper in the future if a real consumer
>>  requires that distinction.
>>
>>  Thanks,
>>  Anoop
>>
>>      + *
>>      + * Return: true if diag firmware is initialized, or if System
>>      Controller is
>>      + * not present on this platform; false otherwise
>>      + */
>>      +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>>      +{
>>      +    enum xe_sysctrl_fw_status status =
>>      +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>>      +
>>      +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>>      +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>>      +}
>>      diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
>>      b/drivers/gpu/drm/xe/xe_sysctrl.h
>>      index 090dffb6d55f..8dc576796890 100644
>>      --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>>      +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>>      @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>>      int xe_sysctrl_init(struct xe_device *xe);
>>      void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>>      void xe_sysctrl_pm_resume(struct xe_device *xe);
>>      +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>>
>>      #endif
>>      diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>      b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>      index d0341538ad05..f1e4253fda4b 100644
>>      --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>      +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>      @@ -14,9 +14,11 @@
>>       * enum xe_sysctrl_group - System Controller command groups
>>       *
>>       * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>>      + * @XE_SYSCTRL_GROUP_CORE: Core group
>>       */
>>      enum xe_sysctrl_group {
>>          XE_SYSCTRL_GROUP_GFSP            = 0x01,
>>      +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
>>      };
>>
>>      /**
>>      @@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
>>          XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>      };
>>
>>      +/**
>>      + * enum xe_sysctrl_core_cmd - Commands supported by Core group
>>      + *
>>      + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status
>>      by ID
>>      + */
>>      +enum xe_sysctrl_core_cmd {
>>      +    XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
>>      +};
>>      +
>>      +/**
>>      + * struct xe_sysctrl_app_status_req - Get application status request
>>      + *
>>      + * @app_id: Application ID for which to retrieve status
>>      + */
>>      +struct xe_sysctrl_app_status_req {
>>      +    u8 app_id;
>>      +} __packed;
>>      +
>>      +/**
>>      + * struct xe_sysctrl_app_status_resp - Get application status
>>      response
>>      + * @flags: Application status flags interpreted by
>>      xe_sysctrl_check_app_status()
>>      + */
>>      +struct xe_sysctrl_app_status_resp {
>>      +    u32 flags;
>>      +} __packed;
>>      +
>>      +/**
>>      + * enum xe_sysctrl_fw_status - System Controller firmware application
>>      lifecycle states
>>      + *
>>      + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by
>>      firmware
>>      + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has
>>      not yet booted
>>      + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed,
>>      post-boot init pending
>>      + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully
>>      operational
>>      + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available
>>      on this device
>>      + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
>>      Controller firmware failed
>>      + */
>>      +enum xe_sysctrl_fw_status {
>>      +    XE_SYSCTRL_FIRMWARE_APP_INVALID,
>>      +    XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>>      +    XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>>      +    XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>>      +    XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>>      +    XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>>      +};
>>      +
>>      /**
>>       * struct xe_sysctrl_mailbox_command - System Controller mailbox
>>      command
>>       */
>>      --       2.43.0
