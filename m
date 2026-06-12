Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3559BCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 22:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE9010E420;
	Fri, 12 Jun 2026 22:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qt6Dcvzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAF610E420
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781302089; x=1812838089;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6/2C/34eJUA77ZC3TIiik8RO8EHeh77zp1/Ms6z7E/Y=;
 b=Qt6DcvzlhVY7azBLl2OoubApUpr/XveVEO/VjaCILnh6uAa9qy+KxrGg
 8WzGh6aj0XloaSYmNz0cTFk/OUCLum58HQVmUimc8LlL5eycASqwPsyDZ
 RJxHeTJEvOjvF1z6PeyyTtcrSUaZRqYNUkX6Y+N8H3TqT02o/Qde3lscA
 mlANx6/DrlwtdgYayIiBpn55WnHSzyr87N/ttuXyCGYo6U2IujWQjtT2a
 kIuajgN5mm7TSfV/6BDD9oOS6WlJ2EHCmYcsr0e0GASPbJGgVtPKZRF+x
 mhhjSjuNAbzYw4jOIeTsD62d/AEPMCL8LjajSQ9oHlUvD46iJwuPf8tNz g==;
X-CSE-ConnectionGUID: xbsvEHxiR6ypiPbC6LdALw==
X-CSE-MsgGUID: 9Z7YW0VqTiOyFEkrv+BCtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82183984"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="82183984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 15:08:08 -0700
X-CSE-ConnectionGUID: kQMTwrkLRtm8SCBk3qnsGw==
X-CSE-MsgGUID: PnFevX3FQPG9NaLzIK/MxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="240575063"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 15:08:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 15:08:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 15:08:07 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 15:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke77NjAlmL/bSnEIpgdV9wPWfUbQbESuVLRy4oBN9rOEkBSQuo40hPbJpWBJTpkRxPWs5aoYVV9cbbYxL/d0/S3cDVF96mT/RJU8LbA0iED6Ce93zeD+mLzr1UtHKqZRRUV3GKNT9su//zSuuzlVzTvAhu+fOXdIGUYFRCAqOyQsGWdEUcVnlNTI+cxvq5c8oSX0qikCgfqRIw9s14GPwH0nAkqi/J8Z4w4iz4mbI5+j6kMUUKF0471ag3gnp21JT7gU2y6Ti694tL85jOZMzi5hIyX9EbaeftVwjv3k0ivqcNO20L1AZD6TjHP8BweGi5gblaoQsB5LdZQ4rQ16pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMPn8+xPgo1zrohjAfaaaOPfgGmx3ofTHVWAql3bczU=;
 b=DtlM2StrQOpEgY1yxGKoVwFF0ZeVmYG/p9nal0XMwMhWwjxZqDJEC9G8uZzB9nyyMzkQgozw4u7EYwLr1mys39vNSX6FVP5ux3cx6ZEjnEdP6IW93wzZAFtjVWASfShtv596jL5c6LFA5PO1u/i3+FY2Qb7akKyhega5oL8DJRYV44thQYKtkZV3Kh2taKeFBgbR0URUdNAXT5mB9XcG1un0PGvIfMEWjSnZHAJQadsQEJv3/+R+r8uU2qMKOTSycuJKxzsmGQVXcWxU5QHdrah7/mC0N1o5BxWQJTViU3GaLJI09DnhqlU8kHtkazhqH1jvrB0jTTBObVI3VXS1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CHXPR11MB9649.namprd11.prod.outlook.com (2603:10b6:610:2fb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 22:08:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 22:07:59 +0000
Date: Fri, 12 Jun 2026 15:07:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <stuart.summers@intel.com>, <ayaz.siddiqui@intel.com>,
 <daniele.ceraolospurio@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Suppress Memory CAT error messages on race
 condition
Message-ID: <aiyDPW4wfJxuBFSs@gsse-cloud1.jf.intel.com>
References: <20260612205317.269228-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612205317.269228-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:303:dc::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CHXPR11MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: a0238f2a-18c5-4215-7641-08dec8cf10b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 3eA5r+AMKWMPhhKNE3SfSMEAp+DxPZ16n7Z/axVYoalJ1uqXQaMxl1mYXOVYyUtQjuKj3+Og63GKJVgcmpRnBieoOJeL4ie0et+TzM0oHwa6+qAFe/cVpEXGKXE2UCtvwmjxW/eTLHrilpM9BmEdKbXWPhscXOJsIfNbVUi+xeGTTPVDJ0l03pSv+W0C8SD+BmOSdMeyl1lGQXXEfgK8bmZCICdfI2IO9n9u0GYBbViZ2qDmTD7O6tu1SVbZ4soMi/0gHLeQ6YUiCzb2DX8T6OQ/AA6XCseF0U1zziJv71purrUmgtfblofORofArpMW0laOJvM/N6UDso8ni2Nglxc33Tdnme5tn0b8k4pSiA7xwHgE2WeSqoELr0d7ifgc2XUzj0Z45HFbReT0FNEQ0mL353X8cyLlBUVXud9TIQRyIbDUH9ECx78H1PgFj4WHu8ITEnr9jiQZGsEgcJNadMDIhI9L7uXfwsVmP7ZIKErYu/AM4CsQDbEis3aFqA+purwtYdexeirJ0BR5B38MPVswMiGcoo0w1eJM7USnGba1DTAXmEPvyc15uH+S7OX5HtSLYoSeikkAICifWfhLburkCoCXEN5UFqt1lvt8ItGYjbVH2m8JfHao8yCdKMieDw/ZEFOfOh0/mp5ZAcapiebTSe+Fqm4Q9o6wwkbMW0Yb3OoFtMTdxonb5Hhab5N6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRQenFQWXlzN094bkJXUVVCMEFQTk9OaDZyZnBGei81MUE3Y29LUnFBZTNW?=
 =?utf-8?B?bjVOSkN2YndZcllaT2xDUmE3ZExNRlJmenU1cDFrNk10VWRPSEl3MUdtTGR4?=
 =?utf-8?B?aVFnMjU2VUhDcjBTRmNFUnJkME12ZEVnQ3U5d1NtT3ZuYUR2aTJ6NFVWVS9q?=
 =?utf-8?B?aG9keVVua3QxeC9aVmsvZ1Y2bDNGT0dWWWttY2lnaWlnWDJ2WGxya0Q3TzU2?=
 =?utf-8?B?MVA1a3N2NndYaEVVMG5FOElkU2IreXNqQ2ZaZnFNbnFqb2tLcCtjY3YzdHBT?=
 =?utf-8?B?ZWFxcGVDekNnbnZUMkJtbEhlWURiS0xtcFdUcUNwNVdnNEsxb3BTc0ZQTVI4?=
 =?utf-8?B?RXNkcllHbWhmWndqeGNZeGlkMHZzQ0x1dG44bHk5WlRwNDY4SW5kOEhqTVc2?=
 =?utf-8?B?b3h5S1JPbEIzNEUvZXNEV3A1SWtWRG82UCtCTUYwYzl0ODdrSmY5V1U4UFhi?=
 =?utf-8?B?L09weVRyZm5BUzNXM1lpeXQwcUdubW1KdmkrdXIwdm9mVEsrWnBzM0NHc2tR?=
 =?utf-8?B?SXlETXloeE9zcFpUbmNwUWE3Z3pFNjBla1NVamZwbnQxbFF2TUo1Ny9YNFFR?=
 =?utf-8?B?b25CaGpQUjNoMlo4ancycjJLTzRraGlIR3pjYkFXRU1qVmJ4ZlNhUDJDR1F0?=
 =?utf-8?B?STN4U2xCMHRkNFJ1RnRoU29vWW5GY2thdnBDQjZtck8xTnZSWGdJbWZWOXMw?=
 =?utf-8?B?N2pNWGNQZE4rQW1qYlczaWxIZG1zYkJLcmpaSFVwSVl2RG40blZ6UHBMSFQ4?=
 =?utf-8?B?eC9mTHhoSFdZRVJaa0VHV0R1TmZxU3VSS3VveDMrK0ZUMUxpK2U3VThGOTlZ?=
 =?utf-8?B?YkpyTm5WTGJtMGVyTVlPU2xUelhBT3hTODhBY3QrK254NVk3SjNkMUlody9l?=
 =?utf-8?B?T0tpUCtWd3BkQkxDV1JQaGZmME8wTHlqOW9kRUxYamNrcnQwdE1RU3ptU2NC?=
 =?utf-8?B?dTFJSFF3OExBZXU5SzZxS1pPdnQ5YnJXb0ZxYkVveVB6SjZ3WFhVTGZDV2lm?=
 =?utf-8?B?R3FqY2tFOEdSaVd6VWljK2FQczBVeFZRdXVNeklEZFFaak13YloycjdMWkNl?=
 =?utf-8?B?YmhJL1F3QnpIeVljblFaZTRwalEwTDU0VllVRHQrRGtTWEd0V0orb002Qity?=
 =?utf-8?B?eHQ1a01wR3o3c3MzOFF2dmlmQXZCaXBwcXRFWGZQczVkVGZqanM2MGNXM1Zi?=
 =?utf-8?B?VTFJNm1LUUc1OCtxdjF2bHkrVmJvZUlDcSszc3Fqb3lZQzFFcnkvOWY4MUZV?=
 =?utf-8?B?cnBpdnpBaFJqU1NDV0FTSXJhTjlOVmRWUnlySTZXSUJZMGloUCtIWCtTSU01?=
 =?utf-8?B?MmtDRnl5bU1COWRiTW44cDBqeDZLdGt0ZUF6OVlCTWZWLzNIZENYVWlkT29u?=
 =?utf-8?B?OGhROFNyNDNJM0QrdjJIZEJsbHN0dkJEb2thb0huWW45V0VCdFdNZFFzZDJQ?=
 =?utf-8?B?M1VrSjF5R1orRElRcUNiTTlnRXM2MkpSMjgxSHFTc2psbkZRSXU1WTR6N3ZT?=
 =?utf-8?B?eWZJK09xMzQyRFE5UXBlNE8vVXAraWdOazA5b0Fva2ExV3BNMDlnYklQUUZZ?=
 =?utf-8?B?VG5OLzZvSzRiWW1GY0ZnNDRJek50Mk8wTUQyWGNMcDdjTHFZbmNQZkRDTEJk?=
 =?utf-8?B?bGhVdllaRTZPRDNWY0d2NUh5NmxiY2hzUXJ6SGhXWFNHSjkyZjEvYUdvOUtH?=
 =?utf-8?B?VWUvK1MyNDVucW50SEVLVzFWbmN0ZzhUaXIzR3hXRzhhbzR1a3ZWdmljaTBh?=
 =?utf-8?B?MVdhOHpwR2VEQlBQcFhmTWp0QXhFelY1Rlg4Rm81ckZuZHlMcEk0TVFubGNB?=
 =?utf-8?B?cmh1UVpjWS9TWDB4NUVDSWtXTHlYYlhEZG5wcStKVjN0dVljK05UMHl2NkFN?=
 =?utf-8?B?TzFKK1dDOFNWbzd4U0hRS2dUcURaNjVURkZTcmVzSy9BUkEzYUF1SmdGcVNI?=
 =?utf-8?B?Slc3ZmxNSXpmemt4eThlc0RzVTdYZjBnZEFmUUQrdjgrZTc0ZXNrdytVRENW?=
 =?utf-8?B?WlZpWmVEQUlkbk9xZjk5Uk9nLzQ2ZmMvb1NsdDh6WDRNQ3B3M29tbUxwZTlx?=
 =?utf-8?B?aWliWjk0YTNET082MDMvVjBHNlhLWWl6SXFacmZzV0c3c3JCclFUdWd3NkJY?=
 =?utf-8?B?eUpRRW5ORk1rK2M2VDNhbS80Y3hVSnNqMm1HTjRNNUlKTS9LQ1NvT2pVSkJE?=
 =?utf-8?B?VXB4eTRiaG5WQ2w3R3FDalJPZGNDVjF3UjJuS254aDhJNm8xWnZrY0VhYW1n?=
 =?utf-8?B?eXliWTRWNU8xOHV0REJ0SjR5U3k0K0FYY0kycTZtL1h5ajBveEpERGVDeGVW?=
 =?utf-8?B?d2xEQ3NqNC9Oa1hOM2M1UC9SUDh1K1RKT1R1RjBQSEc1S0FDcjQzT1E1RWhi?=
 =?utf-8?Q?arUmij6UBBxHUX6Q=3D?=
X-Exchange-RoutingPolicyChecked: cDTtZtcubmGDi44yqlXovFrhj9tGPNZCbOgkx2nq6+cI7FMJc1OapXetsolden3tvz7omAdjjx9z1WMqwUnghTxdmnj0eEM2EzBvwTMpKmnBDJytljnGVCOEXpLl+x92C+mdl7zVLaNsSKzvVQW45nHVcNeDIW5D3seaPxLHLrk1HufMJK/2EDBs1okmN6vKl6P4yaxO3kUU9jw7gCfzuBP62LVtL6FDX/jTpTSwNswL2sb73DuMu0UZD5Byr3FTYycb231KFVESDS5lpaHcKrBKEvnQAY6SX44b49opshBIWW/z+nCWD4DoDL/fvuKRFGBvmDf8TmZ7YdFe5Iex3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0238f2a-18c5-4215-7641-08dec8cf10b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 22:07:59.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkRDN1jndMNQwcFd5dx46E5mz4K5DGQ6/n4iIILpAGWcC/tML0bqAsF0JDqSwM3jw4+wGs+TrDwvKi0u37v4bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9649
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

On Sat, Jun 13, 2026 at 04:53:17AM +0800, Jonathan Cavitt wrote:
> There is a brief window of time between queue group start and stop where
> if the KMD issues a page fault response to GuC, the GuC will be unable
> to respond properly because the queue will have been evicted from

This doesn’t sound correct. TDR stops the DRM scheduler, but it doesn’t
typically halt hardware execution, as it samples the LRC timestamp to
determine whether the queue(s) need to be kicked off the hardware—see
check_timeout() in xe_guc_submit.c. During the window between stop and
start, the GuC should continue to respond to page fault responses, and
the GPU page fault handler should be free to run.

We also have global events such as PM resume, VF migration, GT resets,
or wedging where we stop and start. In the first two cases, the hardware
is idle; in the latter two, we completely blow away the hardware state.

Can you explain the reproducer for this issue? Is the stop/start race
you’re trying to fix related to a TDR-based stop/start or a global
event?

> hardware.  This is expected, as multi queue groups run asynchronously
> and thus offer no strict ordering guarantees.
> 
> Temporarily prevent this message from being sent while a multi queue is
> being evicted.

No. We need to root cause what is going on here.

Matt

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 20 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_types.h  |  5 +++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afe5d99cdd8b..5468bcc940f2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -602,6 +602,8 @@ static void xe_guc_exec_queue_group_stop(struct xe_exec_queue *q)
>  	list_for_each_entry(eq, &tmp, multi_queue.link)
>  		xe_sched_submission_stop(&eq->guc->sched);
>  
> +	atomic_inc(&exec_queue_to_guc(q)->submission_state.multi_queue_evicted);
> +
>  	mutex_lock(&group->list_lock);
>  	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
>  		/*
> @@ -633,6 +635,8 @@ static void xe_guc_exec_queue_group_start(struct xe_exec_queue *q)
>  	list_for_each_entry(eq, &group->list, multi_queue.link)
>  		xe_sched_submission_start(&eq->guc->sched);
>  	mutex_unlock(&group->list_lock);
> +
> +	atomic_dec(&exec_queue_to_guc(q)->submission_state.multi_queue_evicted);
>  }
>  
>  static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
> @@ -1677,7 +1681,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		xe_guc_exec_queue_group_start(q);
>  	else
>  		xe_sched_submission_start(sched);
> +	return DRM_GPU_SCHED_STAT_NO_HANG;
> +
>  handle_vf_resume:
> +	/*
> +	 * multi_queue_evicted is normally decremented by
> +	 * xe_guc_exec_queue_group_start, but since we aren't running that in
> +	 * this error path, we need to decrement it separately here.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q))
> +		atomic_dec(&guc->submission_state.multi_queue_evicted);
> +
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> @@ -2990,8 +3004,12 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  		/*
>  		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
>  		 * context. In such case only PF will be notified about that fault.
> +		 *
> +		 * This fault may be expected if it comes from a multi queue post
> +		 * eviction, so don't report those.
>  		 */
> -		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
> +		if (!atomic_read(&guc->submission_state.multi_queue_evicted))
> +			xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..d19e9a899e61 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -91,6 +91,11 @@ struct xe_guc {
>  		 * an operation which is sensitive to resets.
>  		 */
>  		atomic_t reset_blocked;
> +		/**
> +		 * @submission_state.multi_queue_evicted: A multi queue exec queue
> +		 * is currently in the process of being evicted.
> +		 */
> +		atomic_t multi_queue_evicted;
>  		/** @submission_state.lock: protects submission state */
>  		struct mutex lock;
>  		/** @submission_state.enabled: submission is enabled */
> -- 
> 2.53.0
> 
