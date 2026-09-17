Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6297AC982CF
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 13:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115FE10E40A;
	Thu, 17 Sep 2026 13:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGrz+Sxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17ED10E40A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789651307; x=1821187307;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8cBf3TkjkoixcsbDbJlv6AfRWzNlJMs2bYI5bBWxft4=;
 b=aGrz+Sxmbl8xmFIGOLGBV1KXLD2n/QgrTnx+fnkJCZaYkqNVfVlG+fvb
 D4v1TYD/yMHiHLwO4tac1dHNXHoXKb/xRmzUvnnJA291qu3dQc9vanRJI
 GE9JdbSM07crLHw866kd50jGawFsf3ZND/tmIjizFu5AD/MXbkB6S7M0g
 qukx7Ki3SxQuZ1FyHR7v4vtRlkczMniUHh4riFyHn0LJ1qcKM3QV2/H/K
 OhgsI1ywCeBGKHf0/7UDDXyKp1eAt8uapybPb68josZa9+0B/aMmx11qp
 usiGC79pPe156L96kAjLXmYM9wgF/Ofh00K9HST6Ffnn2zHFDwiktJKyX w==;
X-CSE-ConnectionGUID: 0Q4lcyhyScyjmdFgXdsQVg==
X-CSE-MsgGUID: inkxEk7NQ/iZzAPx6EVQ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93901565"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93901565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:21:46 -0700
X-CSE-ConnectionGUID: 3CggV33kTHmDPt3nuBDgVg==
X-CSE-MsgGUID: VmlyzAvaTaeeM8ArfP4slA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270490811"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:21:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:21:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 06:21:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:21:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofYvoUkZ1RjNGSAawASiPSvph+GxXHFqNxzo6j7AUOVCXWl5eGDV9XMOmRWXiIQZaC8fZsQ+SWXqs6d4s7ZhwYD+x+t8nKpHS9l2iyleFn0WodVdcHj2cRmzMk4EDKgtRPngJPlMogqmINWRDMNZNdlpsUdAtyHUeu66EYYeAltV+nOdJyyjhOdcmljTacWQEOP+U2M4Ex//M8aoobxI839nnuWseJjBy2WqCHxI5E45oJy/hP9dSatFgWf0QwlPnHGwgWeDGJI6S9gMOOd5hTKUwMJaH5RjTpzYpkn/eBllBobzXb69QaJ4IS1m73K1QbYfIjODLsNqVEmRX6Wqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/x/kzyheRXwLJcous7l1VH7eFidGTDGUBigmabZSiQ=;
 b=CDaDLMPZ8k8+smi93i6mH6YKE3YGpbTZefAJplzWjCkZKizHOq7oz5yOmyEaRwxoR/pZuiiBdvvUTp8XNNQkVE8l6S7SE95AiiXILmhQYGkdySI+aobSRGQi6SY9EqIpvUxabono0RConVOSBEo7GISpDEkJHsPRQZSGL7mM48FpXbWNQt+CwA9IQn3pLEukRTgEPBmXWKvaNvM0oDgFFE/Z/iReuMjfI262tSZxdanWCt4Z1Wg1YqnfiMd/y9d78K6ofxoPfySpPJs9yE7CFsoaqR8c5Po9Epa6sBQqRh9XVoEaxkIvbzc86slMiY2ughQJXB/c5BizAkYDwb9tHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 13:19:58 +0000
Received: from MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86]) by MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 13:19:58 +0000
Date: Thu, 17 Sep 2026 15:19:54 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/guc: Add simple KLV decoder helpers
Message-ID: <aqvo01vAUOxdgtbi@nostramo>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
 <20260916215827.13488-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916215827.13488-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: AS8PR04CA0197.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::22) To MN6PR11MB8148.namprd11.prod.outlook.com
 (2603:10b6:208:472::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8148:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: b058d87f-6333-42a8-01a6-08df14be5ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: MbGG9JWfvBvHcU1Vw0jd6iYrb2fxqLzLfcG32mN71q1cgrBZ0ouNyIKqqXl+kYSfQDr37+tmSbviZXJ/JIWyxBV2mNhX/hbWHh7mLsL3RPRef0cxI0TfXmB8QqvkYB3SOmEtSIZPqqbhimXlXGmkbZ02+jB+FnzVnzDqE/6HxriGCl7vu2ESvduq1ABAoKJS/hMEE9kWt3I9VdN5wszA3YT2a09SuJFhkudblmG2lUX1qRidWazY05XeOz+m01O04JDxbXostJEC0o0mo/IDIGlkVzzCEy0vzpPp0U4Qy67QV4uPhN5LK4fIfgq32aePmTic/0yzKB/YEOjD8oW38SzoQzSghfXxPpY4rI7HIZNbdDBWPq3BKGKRHQ7lwJJgihFbZE0iFK5n6Bq1fmrf34ew71yNJzcJ+v453hsHi51rGpEsM9uk7Ly7XusUL9IyAtT/dBeYCtjSiqBULz+nF4Ijm4qeycVOZ2YK1YxRuMpN+bMQ8pa2gh53zBCs+9zOgggJWj+uWLhMrNFe13HtIakDajqPLDdoyLnHkMN/L8bpX+Kmpa/MdfmYCAzDNlQo4JZ+tJ2E+aaXAkCzSfqktKtPJQsDt8SzqianHC1D0WO5dMN2zUZ/QNWW3pk6on8tjQGHGesM8wxnr2DzfMQ3AmDow5fg9Xsjf/lfIMSB01s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8148.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVZN2JvYjQyalUvRlJjYkxpZTBHUC8rb3VsczVPaEJ2UUhESGtCQ2t3cTNO?=
 =?utf-8?B?UjZ1cjZZZFlRK1VqbXNOMk5rV1RBcC9DY296cUlQd2ZPSmEwV3dzMW0zVGZl?=
 =?utf-8?B?R3NiZVdjaHIzRG14TE0rRDE1RkY2QVNwWHBiUXJpSzRUb3pZdlhnbHB6WGEw?=
 =?utf-8?B?aU0wMm1EL3BmWWx3QzgwSEhpdTF6QXFnSXlOUEZha0ZuckhIYnpsemdWZG9X?=
 =?utf-8?B?TGtiUUhHYWlLVEh2bktkUUpBOVNYM3VoeWlIUXNyeC9iV2wvbCsrMnluNTFY?=
 =?utf-8?B?K2Naa2NMcisxUzRHUFBtNzZhUHFCQ2VpdUowZ2c1YnQyZlAzR2l4VE4wSDJ6?=
 =?utf-8?B?N1lyZ2F5RDhjaDl5N0xLMkhvbXcrUTNuYlFsRkEvV2ZuSHdDMlZUdDVEQkcy?=
 =?utf-8?B?cC9BU3JxWHRMRloxbFBOY3NUN0d3ZzI1cllFME0xZUR5V1Y5TFlLNVpuLytI?=
 =?utf-8?B?MTlpRmFBTGF6cCs4cCtzVnlXYkV3N1UyVjAzMWlrOHJPMkVNa0pxejhDbWdO?=
 =?utf-8?B?aFJxQ0JLN0k3eDY3UWF4bUx2TmRSdEEvU1l3Qk5rM2hHUkNUTWVLOEZhZHJi?=
 =?utf-8?B?eC82MU5nVGlFNUQyblJPaVEvMis3SHpMcExadHVQQUZTek5ubGc5ZVR0ckEx?=
 =?utf-8?B?RmN2bjlUbWY4aW1xOEt3anA1VkxsUkpoYWlCNS9Wa2pMMHZqeldNWTlzOXhM?=
 =?utf-8?B?N1V3T2t5UHh6WWNXR3dCcUFYSWp6UVRrTkpZY3FYdWFNVHhtWEtYM1NnaUJJ?=
 =?utf-8?B?bHg3Y3BxZ3BPTEN4OXhVdi9NRjkyY01nN3d6TjllZnpBek1vZisrOVZscjNr?=
 =?utf-8?B?RHAyb1Y5SEpMaVlPMHR1ZHlYWitoNldGSi9NWXhMWmxQZ0VzUzd1SHhrYVRz?=
 =?utf-8?B?cmNhZHVYNUVidWZYdE5xd2o4U3JzV2t2RVR6QnBMa2NNTi9XK3dwVXhKeCs1?=
 =?utf-8?B?NHFMdWh0cURwQnNHZWlyNVBtQkFNcEI2MnhiU05lemFCSWg1MlB4aXU1YlNp?=
 =?utf-8?B?YnYrVlJ5QTBQMEV2enpPckpmY0lPdnVTeHQ0ZW03QytiQW4wOVRqNHZ0akE4?=
 =?utf-8?B?dWdrREJNcTh1Sm5JdDFRVk5UUGM2b2E5azV5dXBFcVNaVzNFUExlaUErQmJs?=
 =?utf-8?B?MnZ1QjNHYXV6T1JUcE1xRHBvQkpaay9TdXB1NEZLSzJTVW14WUo5eUdBR0R5?=
 =?utf-8?B?ZFNMbGFDOW5OTHp6alZNOEVleEZJVVNTUXcwRE9QQnBQWnVFWEl2MFZXY29r?=
 =?utf-8?B?MFFJSGRRZG1hVWsvM0RJaVRGSk4xMFpvbVpkL1FJSEErMWFtcjRPZk8vN2Ir?=
 =?utf-8?B?MHdzR0hSM25VL04vRkllOEFNZmZ2YU5TZy9rMjVVdFBBcWVXMWM1T1Z6Q0M3?=
 =?utf-8?B?T1VLZ1REeFBpeENQaWc0RWlEelhSTkVZQ3lsZkdoVVRUeUN6Z1YvN3Fwais1?=
 =?utf-8?B?Q3JJK3lMemFMQ3ZuZjJmZ2FPbzBuVGpweUV6NHIwcHBnRHRUUVdvYWcrOW9B?=
 =?utf-8?B?NnpNaGdwemUyd0dWbFFMVEdGWmI1RjNtYllQODgrSlRrK1Ezd1NQZ1MzT1Rm?=
 =?utf-8?B?NlV3cnhtbUp0R2xUMlA0aWp1cW9yVFYwS0trNmQraWwzakVBYk9GZEtkdm56?=
 =?utf-8?B?SlQvMjVXVnpjamF4RVpvUmoxeXhwUHFST0NZNFBpYTIxdHJ2L0VLelBQT203?=
 =?utf-8?B?NWdJaHRWZklDcFJBaTYxY3VBb09VcUhKTDNGVFplcGZyNlRydjlHVHBVb2FX?=
 =?utf-8?B?TE1yc0NYWHErRDJIcCtTTUdVT1ZUdUJTZ2RTSHdITk5OQmc4aGROZmI4Rldx?=
 =?utf-8?B?Q2tZUEpvc3M5QU1UYmRQOTQxU0xqWmV0UmpGUWkyQTNtNGtGbUpwL1pPTC9y?=
 =?utf-8?B?c1lTd0Jqc3hZK2ttMTlNVkhnQURWMUs5T0xXK2pCT0JOVW0yT2xxMFFSYUln?=
 =?utf-8?B?Mk9lR2lHTDNPRzdRdmFQUVFRamxLN2hLV2JkVzcrTm9RU1c2ay83ZEZaRVFt?=
 =?utf-8?B?S3NOKzVMWUhNZDMwMWEzUkh5Q0lGcUtOZnBZWExGYmhlZVQ3dWhNOHQ2UXY4?=
 =?utf-8?B?OW1xMFVrWlFkYmdnRzNhQm1MYW8rb1ZhYy9TVitzeWdscTBleHU2dTlKaEc4?=
 =?utf-8?B?aUxtcWdBSTBOYmp2V0JML2liWTlEUmJpUnZaVWFoV0ZWYm8waUZKZHRxWmVx?=
 =?utf-8?B?UDk5T2d6YXlleHhsVnVJNnR0bjJsZHk3VDF4VklMd1oxK1Uwd0loM2FCaFlJ?=
 =?utf-8?B?VDhtbkNwbDkvNUV0ZXg4M2F2UjhCbjBiZm50M2Q0dTNiK3VDOURsSXhqZzh5?=
 =?utf-8?B?SjM1UnNPOUJrWjBTY0VWdGdIRmNFUnhEbEdHa05haFdHVmhXVCs3U1dTY1Fl?=
 =?utf-8?Q?EFEs7HwZbk3tqHfs=3D?=
X-Exchange-RoutingPolicyChecked: sOqkLnuH3HN71z+zznfLqRYViP76wBvAhI3xapL2UphOIl/2XPd5BOuG4XcKPmqxjf/QLHEmaUXoGfVLGC3eqcJNh2ormgSjY6tg2yqc0EnBWissCTYOmRKJl+V1BZhUZbrpN8Pjrj6hGNebSAMULqgt37crH9QV69hjLqCD+IEGYdhm7JWUjo1zTfD7VXhIScH/wIeB+D9GcRfhPX8A+dtuYaWoH4J8wWgmilFHGLOmmwWeonQ6py3SJEuN3sO7cjRghmkLiYG3rIq+37dnonV7bzjXGQqV12TuETUB7flwQbBxNbuYlw18GOarFwX8FZ3C3wennOYcJ7xuX0li1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b058d87f-6333-42a8-01a6-08df14be5ecb
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 13:19:58.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3L9VC8Sw7hTGgVfDEPBBLH7MqzZdL9HzqO8PGVSofkT7K699uScEB/OvCNBwzQmg3unq9eYZSXh1Qe3YPNuU7zrHkrHRIh1rnink7BV0ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
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

On Wed, Sep 16, 2026 at 11:58:25PM +0200, Michal Wajdeczko wrote:
> Instead of retrieving data from the KLV dwords manually, add
> simple helpers that will do that together with sanity checks.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 79 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  5 ++
>  2 files changed, 84 insertions(+)
