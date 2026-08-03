Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82160C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0D710E092;
	Mon,  3 Aug 2026 21:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp1Jz7pQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC9B10E092
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 21:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785793277; x=1817329277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UcjVf+ChsJGya275w0TI1tI8+FjsOjoLgKS4JlQkwOQ=;
 b=Pp1Jz7pQJp4b2D2oRrs32IvecsxuN9NDSVtysuJSOaCZ8Ig1yW1P24Hx
 ftLU19D7ux9T4FofaPkQ+OR7jjdgDh3h+Oe/Xg6tmemHMF31PbmMeeNZz
 VeJsvm7aDumneKa+Cnr1HFx3PBUzQ5CzL135/MSBDWFbY7RrIoih+cJQK
 K+0nK6XNGHXMBYzuR94MulSPyXhoRpZ60pf4oQvtOTRF8Z5gAMON2eYeR
 wB3JuenDpnT3MWOYSiTk4Bnx8IF8IcJTzoyyVKpHo5TaAXtCg5BKHa9Nz
 dnAd+WrofIGl5HcG86Jzfcx628/NDgCMQ2+4voJGvuts2BTdfVaFheRY0 Q==;
X-CSE-ConnectionGUID: cJmBQ673RZCkcaXMsGcgLw==
X-CSE-MsgGUID: BKkkHSB4SACgSrLyYgxTDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86419375"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86419375"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:41:16 -0700
X-CSE-ConnectionGUID: ahQyatMRRqeJee7CJeMh2Q==
X-CSE-MsgGUID: ibe46+DBRJmd6L5eFFUfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="299550692"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:41:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 14:41:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 14:41:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 14:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYjnxc0ZQO+gqKr1LobQuwz2cbPTe9h62OQzUVp6/ShyIkT1C4oV+CItWNqPN0cOd8rf44+aEaOmeYs72jsXTIQWftSTDfYJRvsGx7upgIQ91RJjvfeAM/85g6zs2OXChBIAdz25W+bCGz492L467U/25oo802p1fdMz1aq3Gqg84UMzMB2jYlf1jDG1HqS8EggAcAD2kGFpfqC1qffAmRvRZLQY1RhpxzgcruZnhToRKVmjkhEy//L2o8Bk2NODG16eRKwKnj3uTwK8L3aWvBeQUCxwh+5K1mi7DiLBYatkS2HvluRSqegruPLItpxRy6iY+uOt0/ICP0rYFXKfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G48gbXpcQ/iM6ilHc6BjMwDExNV3ZdtTwi17ibhdV58=;
 b=KTurRKfIuo2wr+OVW7tvf1dkSUkXwfa8Hlvdfbtn086iS9pB9dRAbOoKACJQtMGtjS7Jvb+v5OqZ6quO2sZ3Dh/UJT+0X1tRvkZyBYKy98yHHblUrOLF9eeGQxoQh8kqbPzwSPhhuyDFVfkEiy7SfnEugpGgFstMomprkEizNzy8DuDnFGuz+TWzNl6nBeoUVBf9Dd7S9muK+edGFXk7igV5qZLZPzMfMhO5QR5XRc3gymjRH0QWMtkss4Uw7sXijApDcGkDh/LxOUnTWzScJY9DQ6uMrunNpyatMFVmrZnEwHvUaOBd7LQpcNHhGV3b11TzhUfrwdlVJrHAcoAalA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 21:41:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 21:41:12 +0000
Date: Mon, 3 Aug 2026 14:41:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <matthew.brost@intel.com>, <kamil.konieczny@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 2/3] drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
Message-ID: <anEK9q4E2aD+t2le@soc-5CG1426VCC.clients.intel.com>
References: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
 <20260731040004.1345502-7-gajendra.uttamchand@intel.com>
 <anEHW8g3v+qC4IkJ@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <anEHW8g3v+qC4IkJ@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: db81f4a0-6750-40b3-128b-08def1a7efd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|5023799004|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9HuxTYwzix/Wjcm0N7igbfycik6xsQd3hCAZrTc6ZBRLQ6xyXswIqemw0VhUDMqMTf3TE1V/Sy5CWYJX/AW4X/f/mBopBydg2/JWqV4JP7PVKndecH/xGWF8AFR7RpDf2z0Yev05Ge5ziwvBFS0BlDiAL+ARE0oph3ZYixiUeJEQzhKfTOt8m+eZYAHf2j1FkAbUtssrC4p8/5hl5KlQeT9M/gEE3WOW4v1hiE8jMCaCZ9ZaIygl6HmBJW7XTzFfcOF5EACN+VbrZRSQ9vKSObooUXWYlN7+ZfXGXS5/vl4IDl18RN0M6Oo13UH8prrypgAvRNr/vEzH6gEusouM+7CBddzSTIFv8BA/jKpmV5QbZu31EVa8Ksv/VcREZEk7G5Sfty00juj0UTeazFsMAy98vDCSguaCZaOFhiIw6Hx+m3br4UP1DHFjcVjXqFuYHCH6rHTk6JWL8k6D+EyNTiI2prVjA5Sy/M0ZF3pUmrrqzjVZQ+7OBqD9VtJk8VbQZI7812vqw2kLnhWC8O+B5fTD2yV65bYd7fc02JhZ1OZIKCE4YpcnvK6L812u14z+aBbjpzagljILBrKzOQFH1XaR4ZMJ7MYV5WO0G1+hKikxwiD5BfxsaqysgN82w5g3PMlBS3TTz2PlpeW6693b2/quAaI9MugMB8FlcxtbFOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzByOEJrWkZOTU1RUlJZZnE2WVh1R3dFblI5aGdQMDFPL0ZlaWRBeHlyNkVN?=
 =?utf-8?B?bDJYdHpxaVBaQ2Ztek40UDhHWlkrM3dHSTExOGxGWm9aUUE2ZTFzeGdmMGl2?=
 =?utf-8?B?eWNUN3NndTVYYXFJVTNKY1B2NjdXWUc1L09Lay9OTzJMbVpCZUVHdTFOT2ZO?=
 =?utf-8?B?SXJkWTYwOGIxQVBRSmMyZ01mZE5TRWRwek45REhjOCt5by9QNmpCRVhydm9v?=
 =?utf-8?B?S0RZN2NnMlBiaGxyZFpyZ3pCL09RSkwwQmlFZVJHRkhVY0JuNFBBQnV0S2NK?=
 =?utf-8?B?RnZMR2tneWp1cDY5OGpHQUIrcFQ2WWJENHRJT0tLNU1vVVUzV0Y5TUxnTkE5?=
 =?utf-8?B?TjVNYmk3bVhlV0FxUTcvVDVrK0oxRzlMY3NyWjBDT2FGcS9BMFV4K3BxUm13?=
 =?utf-8?B?a3JUUmJNem1YUkw0Z2V1cWZzMTVVSTZrWGRJaE1VVW4zQ0ZySUgvek54WEll?=
 =?utf-8?B?WG9nYVBxMHRlenJaS0h2cGs0bytaUzhYcXBtbkdEdnhmWWR4N1ZaK0JNYUFS?=
 =?utf-8?B?MUFOQThBZG9UektXWC81TTlGWFFnR29EaXJqemRiY3YySExZajBIQ0ZQUmJi?=
 =?utf-8?B?SHlOYnJLZTUrMS9MK2twblU3cnFFamNkdWMzUXE3eWxFakRuUFdRS3VpOGI4?=
 =?utf-8?B?ZnE0SVVkWHZJbjhTMXprTHNHMGg3UXQrSXdrVEFoOFltY0lMKzhkYkxSRnlG?=
 =?utf-8?B?NEZUK0Ivblk3REZLOXVVczkwcEpvSnhmL0J1ZUFLNUw5STRRcUJkOG40bWZM?=
 =?utf-8?B?OUY1NlhvU0dNUUJLVjdiaHRnUE9BNHRJZFF0ZUZDY2RWRDkzKzgyWEc1UGN4?=
 =?utf-8?B?Zk9CRDV0M3lJN0tYOEdzV1dYd0J3V2Z4U2VIYXlSYjFXczhYVzM5VXRWZWky?=
 =?utf-8?B?T0RpMEsvVFRrZkV3UGhZSW9CM2licXN3dEJiMEF1N0IrUlhrQ0VzcHdrTTlU?=
 =?utf-8?B?QjhsbklEcG5wdzJJRmZKemkxY1V4T093RmxMSDZTMCtOSGg2Mm13MDdXUWN3?=
 =?utf-8?B?VFB1dWUyc3d3cVFHcmtrSHZyVHRLYUMrZ2tHV2dyTFExRkdxaXcyUytUZ2Vz?=
 =?utf-8?B?SFd6Y3JvcDZCRmJUejN1NTR0K1Bzc1hVSEJ2TTZEeTYwVUhmUEJTUVhnOVh6?=
 =?utf-8?B?ODdVN3Q0YmdNRmVFM2RJWVNOTmRpaXRMbGYzZVppb1RIUmV2QkcyU24yczdX?=
 =?utf-8?B?OW15ZzNqby9vYnJjK1V5Z2RyYVF6QkdRcEJMRUpMRjNEUGxqZVB2NmF4Y1Uw?=
 =?utf-8?B?YmF2UWZFa3U5OFlza3hiZVpTUmRYcFQ3akN2TWQ2OWJoS2lPM1hYNk5hRmFY?=
 =?utf-8?B?YnptdUFnNUVGcTFYTWJ1OXpKRG5lU1gwV3ZoUGRHNEhINlRid3NXdXExZWVU?=
 =?utf-8?B?N3dCSEQ5TVc4ZlQzUkhCV01QUGlhdUJCTHh4OUM5VW11VS8yZ3YvTjIyNUc0?=
 =?utf-8?B?S2kvajJrandRWDJMbmhNMHRkTXJRNUNMeE9tb1NRZllmT0Z4ZHlwc2FFODlr?=
 =?utf-8?B?NDdUR0QzVnB2QXArQUhudUxBNW9qRFFTZktoWGlUUGVmRkt1VFF6eHM1VS9V?=
 =?utf-8?B?SGN3YUtSS3ZpUExPek9CcS9ucWRCbkxwdWRzeGR5TWs1WXVIR2VsQkFTdk0x?=
 =?utf-8?B?UUEyNDBzdlJISGJNVGN6VEsyR2ZBWWdzUklUMnd6N0NyUTdUM0cwUjVvbXNv?=
 =?utf-8?B?Z2lFTUt5aVo0N3daV1A5TjFTMFdraFV6djdnSXVEZ1Z6T012Nkw1VWlMOGQ1?=
 =?utf-8?B?WmEveXMyQWhoS290cXRLZzJCVTFwT01uSTJqMEFhQnlocTMyN3I0QXhnUmd2?=
 =?utf-8?B?M2NjSzl2Y0xTWUxMUEdWQzBJemRzNEhzTjhEQ3F5eEZ5WFBwTEZoRGE4eGUx?=
 =?utf-8?B?QlhZUUxMUURkT0FpUGRINWxJejN4S2REK1VjU1FNWEVHZm9KR25oKzFWa1ZF?=
 =?utf-8?B?RUcyRTBaOXV1Qzh1L05Wak9oWXZjWUM3Y2RaOHltT1NzaDI4N0JwYUF0RGNn?=
 =?utf-8?B?a2h4NkQ0dHk2Y0xUL1hjTUQwTVpWbDlQQ1gzUnh1aFM0T1E0RFdYcmhNVDJt?=
 =?utf-8?B?NVNTNkx5bWNnbE1jTHlxVWttMzM4MFU0czVrL0cxSU1TbEQ0Y0daeU8zZ1Zv?=
 =?utf-8?B?Yk84cUg1dW0yMVIzVkZEMFY2RDFYeko1OFVZKzZMMUxVVG1EUzdRdHZNT0w3?=
 =?utf-8?B?S3NnOW02eWUvTDdhclNTWDVHUURXNElYM080eEpzc1pzbTdlZ3pQQmU4cGda?=
 =?utf-8?B?NndEZjFjOUJhL0YyUEh5VFhoTWN3WXFWcjllVkRKdmpxYlZLN0xrK2ZGczBQ?=
 =?utf-8?B?cnVKczQ4MFN6MHhjM3Z2S05rSUJpNjY3R0xHbXBhNDFzc1N3QTE1Q0pjMDBT?=
 =?utf-8?Q?mMr+6oV1GvlGftAJElcgYT+d5EVj3MuIDRKk6?=
X-Exchange-RoutingPolicyChecked: lPTTyoE1zOxpnUD4e6QSyNqumIlPJjH5bj6ebrMIC7zUOeMeL169y4UHlKViFNYi19DyeYIzCrRTKtJ5MwHMsEchvSR0SPNL3pK8w44R0KkMaN2kCqJP4mPWQwBXDqALT1RtL84fAhyxM9gNLrghKXRFwjZHqG7cKIy8G7NhfGsDPcLiF2YpMRBwXc4qbXCKcDBrLegG2xwIyBV96ZVHaTFHmRgvoPIXD4oNi550N0RwDJOmOc6/fkB3/cW0C9F3YZVwexIRfa929ZxDw/XL6d6qIZRDrl77WaQKKi3WoDg0ffIEKf2fFodeeanVpKWsQdX9GGAv6rQMs5LG96wfJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: db81f4a0-6750-40b3-128b-08def1a7efd6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 21:41:12.0844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkgLAPPV+UkKdS5kCdtuMciH0tMSKMRSncQETrfNU3LJwUr8XnBVSVvu60PHUARlT/uC0LXUc5/p9K/LU1mWHN1SWTzgsszxYTejX2i9szc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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

On Mon, Aug 03, 2026 at 02:25:47PM -0700, Umesh Nerlige Ramappa wrote:
>On Fri, Jul 31, 2026 at 04:00:07AM +0000, Gajendra Uttamchand wrote:
>>xe_lrc_ctx_timestamp() reads the 64-bit CTX_TIMESTAMP value stored in
>>the LRC as two independent 32-bit reads (ldw, then udw). The GPU can
>>concurrently overwrite this location as part of a context-save, so a
>>plain back-to-back read of the two dwords can observe a torn
>>combination that matches neither the previous value (e.g. the
>>CONTEXT_ACTIVE sentinel written on context-restore) nor the final
>>saved timestamp written by hardware. Callers such as context_active()
>>and xe_lrc_context_timestamp() rely on this value being coherent to
>>decide whether the context is still active, so a torn read can lead to
>>an incorrect/garbage timestamp being sampled or reported.
>>
>>Make xe_lrc_ctx_timestamp() robust against torn reads by reading the
>>upper 32-bit half first and re-reading the lower/upper pair until the
>>upper half stabilizes across two consecutive reads (bounded to a small
>>retry limit), then combine them into the final 64-bit value.
>>
>>This fixes the problem at the source so all callers get a coherent
>>timestamp, instead of patching individual callers.
>>
>>Assisted-by: GitHub-Copilot:claude-sonnet-5
>>Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_lrc.c | 27 +++++++++++++++++++++++----
>>1 file changed, 23 insertions(+), 4 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 78d0456cf3c9..6f0247bdf8e4 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -874,14 +874,33 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>>{
>>	struct xe_device *xe = lrc_to_xe(lrc);
>>	struct iosys_map map;
>>-	u32 ldw, udw = 0;
>>+	u32 ldw, udw = 0, old_ldw, old_udw;
>>+	int retries;
>>
>>-	map = __xe_lrc_ctx_timestamp_map(lrc);
>>-	ldw = xe_map_read32(xe, &map);
>>+	if (!xe->info.has_64bit_timestamp) {
>>+		map = __xe_lrc_ctx_timestamp_map(lrc);
>>+		return xe_map_read32(xe, &map);
>>+	}
>>+
>>+	for (retries = 5; retries; --retries) {
>>+		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>>+		old_udw = xe_map_read32(xe, &map);
>>+
>>+		map = __xe_lrc_ctx_timestamp_map(lrc);
>
>The map can move out of the loop. You could define a new map_udw for 
>the udw value.
>
>>+		old_ldw = xe_map_read32(xe, &map);
>>+
>>+		smp_rmb();
>>
>>-	if (xe->info.has_64bit_timestamp) {
>>		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>>		udw = xe_map_read32(xe, &map);
>>+
>>+		map = __xe_lrc_ctx_timestamp_map(lrc);
>>+		ldw = xe_map_read32(xe, &map);
>>+
>>+		if (udw == old_udw && ldw == old_ldw)
>>+			return (u64)udw << 32 | ldw;
>>+
>>+		cpu_relax();
>
>cpu_relax() is not needed here and can be dropped.
>
>After looking into this a bit more, I think it is best to use the 
>iosys_map helpers instead of the xe_map_read32. Also note that 
>xe_map_* helpers may be removed in future. The only value add that 
>xe_map helpers provide is the pm_runtime check. I have added it below.
>
>So this should look something like:
>
>static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>{
>	struct xe_device *xe = lrc_to_xe(lrc);
>	struct iosys_map map;
>	int retries;
>	u64 val;
>
>	xe_assert(xe, !xe_pm_runtime_suspended(xe));
>
>	map = __xe_lrc_ctx_timestamp_map(lrc);
>	if (!xe->info.has_64bit_timestamp)
>		return iosys_map_rd(map, 0, u32);
>
>	for (retries = 5; retries; --retries) {
>		val = iosys_map_rd(map, 0, u64);
>		if (iosys_map_rd(map, 0, u64) == val)
>			break;
>	}

&map when passing to iosys_map_rd

>
>	return val;
>}
>
>The barrier is also not required (or is handled by the iosys_map 
>helpers internally when needed).
>
>Thanks,
>Umesh
>
>>	}
>>
>>	return (u64)udw << 32 | ldw;
>>--
>>2.43.0
>>
