Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F0ECA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 09:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7749C10E3C8;
	Tue, 12 Sep 2023 09:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FB810E21C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694509876; x=1726045876;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N1FxeXQKacHphNAwpBhqg8bJgFHFLlrk+ynt7pza3Ik=;
 b=X5mlOgCBh5wMYi8qH8mm6oWXUno4ff0UqTkUAU20nZNryb9aNqCfPC1/
 ug8qTrCXbXDW1BHf2FuxXfKHqV0nhIVLgHfLBWlBsCzlKsOsoUwOERIH3
 rxMVG+pMvR78+JETigRsnJzQBtMYEkqdKRni+MFS7tQ8Egpg34ZThCtse
 0rMtcdUrt81v4Q9TLOeYkm/N3fAlkrK+yHvYCH/JtbQnYtYHgg5+E+f4u
 xSBssOZzmYVfrP26GhFvhJy+r8gUprrBZVoA6fUlTt+Vjn3FkmeBSA1+p
 CONgzsFHWMvyhm0tDjgsWc1o89rwT0Sy3zfJBx0U9hMrpRh/66TI9Yebk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442335739"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="442335739"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 02:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="737068789"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="737068789"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 02:11:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 02:11:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 02:11:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 02:11:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 02:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvR6tES1XdM0torMUOmBZ2xvXu9HshQJE+883nZrJF5tNVdu1shmG0SYAgAde0Ij48J6c0DKtwWKsUaHtowZX4g64ZVVH7EPQ5EWzC43K4s9LYP6S6gl8ZON9RuUpah6mkXKaN2RY20Gew4CwgQSiLA03hyP2E9tIfktsTOE777GcWIaWJBrmN/hOxRMC0x7nFBwhwEsagHcRcjEFMxDD8j6qZfNIBW9n4DOzZx1wrDC9KUM5//VxAETszVKYC4XSW9+TPdJVKeRUqe0PA5aWxGyTcU8n2B6IzYOdFo6ezbJdru5LN4jOegq9iFfwUTyo50U02H++NJsMionzUs/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Sz1ioO7RfdjqcPbq6Jp3lHYmihKaRSkOg8qaf/K/Q=;
 b=D3uNwlBybYs+J/GSKbUrhE259ScF9WoYJlOmf5D78nFb2bh+FFFHX1OwM6GuqBwDppLQc4IFuLw/6wbiqWi07hve+4mt+k+KtGdUcZDrV/NkQY7qaLy4/na6G8DGAFn6b2ibesj2rEMJp7bw1Ga9kQPRIiP2JosEHOqA7lE6mdU/XmccswZhaBtmFNk6w1ZWsm6X1JX6dOiS1KQq8YzYtm3rcBT9qe28wHWOXsAqO2p3VBLWUbPqSc2P6KLqj0FgoyG9FO5SVUApsGTcCSEuS38ThKhFjs42SQ/Vw03ybrOL/BGHWuI2QZ0ytsr7zP1L7t42hYiPTk7s0OL0MSEvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Tue, 12 Sep
 2023 09:11:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:11:10 +0000
Date: Tue, 12 Sep 2023 11:11:03 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZQArJ0mDJRMWFgIk@fdugast-desk.home>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230912083635.7-3-francois.dugast@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4da3f2-eb32-4544-2711-08dbb37034a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+KgHT3VzST+YFnEqbwK+TobcKMaaicRSo2uw2f6bglrgkPiPGl8JQstxeZvdtjIWZ7Yi9molxyX19TLUne3h+KpK099IhDSiAK1a5X12LQEw/Fv1tGeSz/PO7dCRp8/jHN2526ksLIQrJi9/7anjeD1M0eXq68ISFMXZ3ltMfWsIyA1Bg5+RDJMwPfqakXOf0KJWO9/eT7ClfETdsuLzviBaJG3mSzL3uBQZH2i8oqUQPR5GHfOBc7U4i8wd0DUvcfFp1K3MjTjYA9fU7mme6LhGVR/AC59h8O+Qk+Q4nK/qqdOoJv28kSiDHUcckFnO8WwKbCYbod2GskUfc5JVf16tR2q+kNNT5fMDxQQmWbKyhiDTwrDMKjiTz7Y7HVxphh7geHLgpXXXRHqTieKGwRbQn1vszTMrjZnvToquLH9ksXH3TgrPJdzbwadpkHclA4FTubv3S5LnJ0MK9R0kAkh8aw1oZ0R2z94M3huzD/fpHClg5HrCNfgjFElSc/Os8g+lHf+C4IEtMxYgMofL7ooRO/OPgrT0TkH/l2OSckDyy3zdTHiwAXZW4qik1j8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(36916002)(36756003)(86362001)(38100700002)(82960400001)(26005)(2906002)(9686003)(6512007)(83380400001)(478600001)(6862004)(4326008)(6636002)(316002)(5660300002)(8676002)(8936002)(41300700001)(44832011)(54906003)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1NodjhVODgraEpmRXRxUG4vTzkyaU9VR3QvYi9VQysxSEFlczlOOEVWY3NE?=
 =?utf-8?B?bzlmVzBYM3piNmdsRk40Ym1qdzl1R0VTcmV5L3lQcmVwRDd6SDh2S3FBeFZS?=
 =?utf-8?B?ZkpWUUoyb2twcUFVbHBIOW5VZzhjenhCaTByd1VGS1ZnZ2NQSnR2RW1PVXFm?=
 =?utf-8?B?MXBvVkVhN1ZOS1pkMkJhOTZ6dldXbzRGZ3pqVFRRN0NWN1UwVDRNSlpSb3ZV?=
 =?utf-8?B?c0w5b1ZEWGlYOUwyTGlncGRoWGhhSitmYkIxUGRzOGw3RDh6TDRkNEZUbzhj?=
 =?utf-8?B?R0JTUlVicU5Fb3lrTjhqUUJBa210MlU5alY3Q2dLNnJaSXFDczI3bDBwVWxw?=
 =?utf-8?B?QlI4RlV1cmxhakJ2SkE2dUhGTkdXdy9KbURycURYVFhlVFh6QUZOT2xRM044?=
 =?utf-8?B?ZFI5VnVKS2NoTG41dC9EenpwZzMzK3BGWEtwbWt5M1RPRXl0RG9nOFZ2OTgy?=
 =?utf-8?B?dXVFcmlPQ2VxNk9sb3VVMGRNQ2lvdXdaL1FOWjlYT1JPTndrQ2dLRitFN0Vt?=
 =?utf-8?B?empVcnRlRmxxdjlSRitIaTUvVjRGWFlzS2s3a0toOWJaYTJyUzYrRkVmTE5y?=
 =?utf-8?B?eDFmQ3ZMb2tZSU1peHJCMWJMNDhoRkFOU3JyZVNueGJHTm5rU3RucUdNeTlE?=
 =?utf-8?B?dStQSDNlck0wdmp3UVdLOEVsenMvc2oxQmRJU3ZsS0NEL2NJRzl3b2NIRWoz?=
 =?utf-8?B?NnMwMFNWR3Fwc0xBUFdkWFYvUUoxazFlU3VrUlJCSEc0a2NUOHErTXNEa3lY?=
 =?utf-8?B?cU5IQkwySFlubGpGZzdTamRGSGpWMUU5bmE3TDREUjJvK2NKTGJIbWJDY0ZH?=
 =?utf-8?B?SHdNSjE1cXMrY0dsTUN6dDlqUTJZR2FpellnN2VxRmg2RDVMVm5hSEgwZnBK?=
 =?utf-8?B?RWMwSHJzQWhXSStvTHg0ZVRBR1B5VTFyQzMrSEZiMkR3NjR1ejVwaEl5ekZO?=
 =?utf-8?B?VThvV2VzeEgyMTlaUVAwWTdpQmxiZUxJaG9pWXUxYVFNR05uZnN1M1ZOREpo?=
 =?utf-8?B?blhKcnNZeFRHU0dKNGVDRE1CSGMvNWxZNDZpZUg4VndLSU0zaldHZTc0ZnNl?=
 =?utf-8?B?RmZOK2Fja05lQVFkbGxvc2NzTm1jU0NEUDJLNkdhMlphUGVBWTFKdGsxeG1X?=
 =?utf-8?B?VmF1dkRZTHg1YVR6encydDJJZUpwOGRYc09jL2VlYW9VT1ZEU3ZyVnBsQXll?=
 =?utf-8?B?aUZxbDBCbU0rR2FPRFhtY2NGODN2UVhYT2JIemQ5ZGlmSGMrVHQvU1ZWZW83?=
 =?utf-8?B?ZHhvRmtJL0ZOblA2MU84QUZOallFSlBUVlZNN2RMamJlVzNxa0ljTlJZMUVY?=
 =?utf-8?B?L3B2S1Z1eXJyQ3l3VUhYbHk0U1h0RkQycm5ybEhDRytzVXMwR0E3dWdlK2x0?=
 =?utf-8?B?UlZNUUhDNTZrSFNEK1ZyN0JqS1FKdW93U3g5VDFCUkJVRHJneGpCZWFRR2xH?=
 =?utf-8?B?L1VyMUNFSGRweVBzVlRzS2NWM1BDTUFMcUZ2dHpQRTUwcjVOcVVTdnNFMHB2?=
 =?utf-8?B?U21FbGpJblBvSDNnN09mU0xlb0ZJMEpFeUpIWFRQbGRva3c0eVpQZjM4WVJS?=
 =?utf-8?B?NmNqYXAwc2JTSDZLNnJEaXFzNWJveHFOMzNUdlRQK0Z3MzRwTUVteUpRNzho?=
 =?utf-8?B?RUx4azJrM1o1QjRZSUpmOWdCaWY2bmdDVktudFl5eC9xdDB6R1VxNCt4WTBm?=
 =?utf-8?B?alB0ZXYrWGZUU2UvMjFkSkRZcW85SVlLaUdzSEI1ZlNscGp2cVNFOWoxZVJa?=
 =?utf-8?B?RE9RdFBhMkxPZUg0UENDZ3dwdzlXSnB5R2xBQXg3UXFSdGxaZTdQSmh2NllG?=
 =?utf-8?B?aU9vRXNCMk03SWczNk5OTGQ3ajdVMEUybGhDRWlXbWZYYXRsQk9HZEplWXBh?=
 =?utf-8?B?cnUyZk5RZ2hWb1R3aEh1VXNmYzFvdVlWZFZoeWRUUUZNRGtGR3BVVzNCM05z?=
 =?utf-8?B?Q2FoaVprSTVDQkZuYldYV0Y0RWJmSnVSQ1hhTS9oWTlyd1I4eFZVVWlJZFhX?=
 =?utf-8?B?QjE4ay9vYS9SUEtid1ZGMU85djBaYjVIcEtEOXQxSnhpWExwdEdqUEZzVHQw?=
 =?utf-8?B?Z0FRWlFEbFZBYTcrczJpNnpFQWhtbExydUdZYmtZdkpHK3ZGOE5YY2xycHlT?=
 =?utf-8?B?U3ZoT0FGRmlsQnIwWUduR2pNbGJDd29oUURqa3FhSDhMQ3VnL1psWTR1cTQx?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4da3f2-eb32-4544-2711-08dbb37034a0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:11:10.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmrmyBE51uAhjpsll3JiLC1mlFtw47pXMw6XfQ9qfEiuiHruqHZoBPOAZjz9MC3CK1yyTjuIVLWCAYqxf5GH06Q7xTwc5PVKo0wF1zTTlrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Michal,

On Tue, Sep 12, 2023 at 08:36:34AM +0000, Francois Dugast wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> As we are moving away from the controversial XE_BUG_ON macro,
> relying just on WARN_ON or drm_err does not cover the cases
> where we want to annotate functions with additional detailed
> debug checks to assert that all prerequisites are satisfied,
> without paying footprint or performance penalty on non-debug
> builds, where all misuses introduced during code integration
> were already fixed.
> 
> Introduce family of Xe assert macros that try to follow classic
> assert() utility and can be compiled out on non-debug builds.
> 
> Macros are based on drm_WARN, but unlikely to origin, disallow
> use in expressions since we will compile that code out.
> 
> As we are operating on the xe pointers, we can print additional
> information about the device, like tile or GT identifier, that
> is not available from generic WARN report:
> 
> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>     platform: 1 subplatform: 1
>     graphics: Xe_LP 12.00 step B0
>     media: Xe_M 12.00 step B0
>     display: enabled step D0
>     tile: 0 VRAM 0 B
>     GT: 0 type 1
> 
> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>     platform: 7 subplatform: 3
>     graphics: Xe_HPG 12.55 step A1
>     media: Xe_HPM 12.55 step A1
>     display: disabled step **
>     tile: 0 VRAM 14.0 GiB
>     GT: 0 type 1
> 
> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> [ ] Call Trace:
> [ ]  ? __warn+0x7b/0x160
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? report_bug+0x1c3/0x1d0
> [ ]  ? handle_bug+0x42/0x70
> [ ]  ? exc_invalid_op+0x14/0x70
> [ ]  ? asm_exc_invalid_op+0x16/0x20
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> [ ]  pci_device_probe+0x9e/0x160
> [ ]  really_probe+0x19d/0x400
> 
> v2: use lowercase names
> v3: apply xe coding style
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> new file mode 100644
> index 000000000000..b2d3c9b82b31
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -0,0 +1,177 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ASSERT_H_
> +#define _XE_ASSERT_H_
> +
> +#include <linux/string_helpers.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_step.h"
> +
> +/**
> + * DOC: Xe ASSERTs
> + *
> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> + * complex enough that some changes introduced while adding new functionality
> + * could break the existing code.
> + *
> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> + * to undesired increased driver footprint and may impact production driver
> + * performance as this additional code will be always present.
> + *
> + * To allow annotate functions with additional detailed debug checks to assert
> + * that all prerequisites are satisfied, without worrying about footprint or
> + * performance penalty on production builds where all potential misuses
> + * introduced during code integration were already fixed, we introduce family
> + * of Xe assert macros that try to follow classic assert() utility:
> + *
> + *  * &xe_assert
> + *  * &xe_tile_assert
> + *  * &xe_gt_assert
> + *
> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> + * warning is triggered when provided condition is false. Additionally all above
> + * assert macros cannot be used in expressions or as a condition, since
> + * underlying code will be compiled out on non-debug builds.
> + *
> + * Note that these macros are not intended for use to cover known gaps in the
> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> + * valid safe fallback.
> + *
> + * Also in cases where performance or footprint is not an issue, developers
> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> + * reports from production builds will contain meagningful diagnostics data.
> + *
> + * Below code shows how asserts could help in debug to catch unplanned use::
> + *
> + *	static void one_igfx(struct xe_device *xe)
> + *	{
> + *		xe_assert(xe, xe->info.is_dgfx == false);
> + *		xe_assert(xe, xe->info.tile_count == 1);
> + *	}
> + *
> + *	static void two_dgfx(struct xe_device *xe)
> + *	{
> + *		xe_assert(xe, xe->info.is_dgfx);
> + *		xe_assert(xe, xe->info.tile_count == 2);
> + *	}
> + *
> + *	void foo(struct xe_device *xe)
> + *	{
> + *		if (xe->info.dgfx)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + *
> + *	void bar(struct xe_device *xe)
> + *	{
> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> + *			return;
> + *
> + *		if (xe->info.tile_count == 2)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + */
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> +		       __stringify(condition), ## arg);						\
> +})
> +#else
> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	typecheck(struct xe_device *, xe);							\
> +	BUILD_BUG_ON_INVALID(condition);							\
> +})
> +#endif
> +
> +/**
> + * xe_assert - warn if condition is false when debugging.
> + * @xe: the &struct xe_device pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> + * that could be read from the &xe pointer if provided &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> +	struct xe_device *__xe = (xe);								\
> +	__xe_assert_msg(__xe, condition,							\
> +			"platform: %d subplatform: %d\n"					\
> +			"graphics: %s %u.%02u step %s\n"					\
> +			"media: %s %u.%02u step %s\n"						\
> +			"display: %s step %s\n"							\
> +			msg,									\
> +			__xe->info.platform, __xe->info.subplatform,				\
> +			__xe->info.graphics_name,						\
> +			__xe->info.graphics_verx100 / 100,					\
> +			__xe->info.graphics_verx100 % 100,					\
> +			xe_step_name(__xe->info.step.graphics),					\
> +			__xe->info.media_name,							\
> +			__xe->info.media_verx100 / 100,						\
> +			__xe->info.media_verx100 % 100,						\
> +			xe_step_name(__xe->info.step.media),					\
> +			str_enabled_disabled(__xe->info.enable_display),			\
> +			xe_step_name(__xe->info.step.display),					\
> +			## arg);								\
> +})
> +
> +/**
> + * xe_tile_assert - warn if condition is false when debugging.
> + * @tile: the &struct xe_tile pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> + * information that could be read from the &tile pointer if provided &condition
> + * is false.
> + *
> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> +	struct xe_tile *__tile = (tile);							\
> +	char __buf[10];										\

Just realized the build fails when CONFIG_DRM_XE_DEBUG=n due to:

	drivers/gpu/drm/xe/xe_assert.h:149:14: error: unused variable ‘__buf’ [-Werror=unused-variable]
	149 |         char __buf[10];

We probably need to make this variable also depend on CONFIG_DRM_XE_DEBUG.

Francois

> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> +})
> +
> +/**
> + * xe_gt_assert - warn if condition is false when debugging.
> + * @gt: the &struct xe_gt pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> + * information that could be safetely read from the &gt pointer if provided
> + * &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> +	struct xe_gt *__gt = (gt);								\
> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> +			   __gt->info.id, __gt->info.type, ## arg);				\
> +})
> +
> +#endif
> -- 
> 2.34.1
> 
