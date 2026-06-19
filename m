Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D2ACD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 13:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216410E0B8;
	Fri, 19 Jun 2026 13:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ks38JK3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB87610E0B8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781877577; x=1813413577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kGEyuCvkVmIPpDGMn/PsQZYh/PfeEfpoTi7FIkx9kzM=;
 b=Ks38JK3TZP+bcTXvN52z3jyKrQ8tjt8HIf7N1E5+7vp4FNUlu9mXRnog
 wiz1jZaO2TNn6ykLXqCRARuqklWy9b9XmMjFt1jjhdTkPazv18UUrA52l
 Z5nRntEDhEPEdUk43SdD0INwCAcFBxBLa+Ul4q2jX+PGpjbSNUCMGPNL9
 ov9l7F7WZ+cCSkdJvUW9dKP8hdFkPcQCpgGfIVLaTqPQ7XWUTa8m9nHlW
 TmnPnyJyS/MbglLZuUWqqJwMZ1396vkf6iUeiQC2s21thToeeajfmDsi9
 TMNHqt6/C9aYnC4txix3MrSglVsXNXWOpMf+AAocEOBiVUBbkc7FdEpjP g==;
X-CSE-ConnectionGUID: 1CeI8fckQAWMJ6oSUb2PDA==
X-CSE-MsgGUID: MzxUNfiRQ3KuSuabJ7njew==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94117978"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="94117978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 06:59:36 -0700
X-CSE-ConnectionGUID: dA5ueOinTRupMB67Ij3QNQ==
X-CSE-MsgGUID: dw2kWOgfTJG6WhMv30Z2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="246295530"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 06:59:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 06:59:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 06:59:35 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 06:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmxPRexg0EdFyyWNiEx9ujjmkJUOBXUX8fBQsB2z1YttiOVCWdQqXS5nGtocngQKn6kDGoOR/BKJG+us+7SGZkjEjVVojOuc9dtSuA+uPILuvCpsYvMk/Mx0v+C6B/IVSwpt+C/ePRtjAU1vIC0Mq+F5rjppJaK4/kJexG5qRodjtzA8yholSfpOSHLBRmI4YyfJVRjOUj8FNgdARraTmXy+ZlUXclchtqBfZd3nAgo2mwkbyMAs+VsMmWgH2ihA6VwDcWiRWV3iRBOxsbNbpjSeGPhBRgMJ1tj3qgmGkEbJjty3jG/VIXEO/eAaIaR5jUwhBT5Dm6rrAabz/0bmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oBN6Cv+Auas73QXtJfSONV1q5cklM5C76IzMgqJKtk=;
 b=sDxjXUxFzp+i5ABmF5XwjbXBeU9KF6js0bEjUDazGlHZub7XnGnsi6e1FyJsCftV+i3p41VLvaOHC6TvaqPhsUvK0C0gh2gvVSQetoPCyiH03aMlGaMVojweuxg0kpMXcW8zfVVsZ/ni8BgPWt15GUJDQWnMDsezpXL8cffWQ9ihh8XSzv7EFGg8Ws0MFuCX5hhG+b9cLYiL4qJ9H2nF/14uLwj70hIUfCDpTH31q8WqgnGV5bzgqz7x4XvMXnUezDwOrZo7UrrnhWVl4+RTXM0lAwtAoWxg6IqilKQnGFvHeuIrMKojZG9tk76h9L/C/fDiPiqWQLYTD87rn3MVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 13:59:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 13:59:32 +0000
Message-ID: <54016352-a8de-442b-835c-260bf38a944d@intel.com>
Date: Fri, 19 Jun 2026 15:59:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <michael.j.ruhl@intel.com>,
 <matthew.d.roper@intel.com>, <soham.purkait@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
 <20260619114018.667995-3-karthik.poosa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260619114018.667995-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000524.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66e) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: d1763ea7-9c1a-43ce-705f-08dece0afc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|6133799003|5023799004|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: bqph0EZ0zsv8ZcavdhX/I53ZORfkLMXgj7eWymkfmrpwVYkn/2vUrkN2o76ii4NK9lwWPIuWZVgGeqzkBjVEeuODWsnlT6roNlQGCf4pkghCpqJyHcp3C0iOkbjhNkQbeN9H18N30M8dkaFKtY6vlo1fdxWUhjso+jXaqVfM2LhtF8++GC161fkwCrMiJ0W9VK6Fos3THgzriUtYWI66mNil7w3yCTAp0X7g5dajBR6BUXLwGYNzEZd9lNhZZp7DXixP5ylt595rQVIFHb6LUHJjKVfm+OsnHO8nwAS4woHiS5z748CV5p3uuwn3+0NH5yOe/iWhPZDq+Pvon6/NIQK+9o7KZ/eKKkNSxW5ysuNPw1vZYaqbUnEnj0jJ67j5td0GpduQLwWIbYVudvPYwraR4Z+eZ8nCR7mvy5Sj6/aSNlg/EW1vy0xn1fEnpnqgfDLK49zf2GRiru1L+/iYv+LmcELyaZMg03G/1i9P9M0imX+Q7CRAbyBioBQE1Gq6krlEmRsRw6RrduPU/NJIYWFQuXuf0/8sYDv3fzY+3Sg81Mgb7lpnnnU9rABRACqeOVt0J4Kz4bTWWVPpdhLf+I/LSgi2PdTaklgsG7p+w3XTJnF9vnNkeM8gv2t9qPomQZCSSJE1HSyK/rfCsMEcdNV9tNwCexPmtRcQgrotgZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(6133799003)(5023799004)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGFkbTIreUdCME1xcFN0dWV6WnNVbnQ2WUhLL3ZsYXJMWWgzblNLcTRvVVpy?=
 =?utf-8?B?YXl4RDhodjl2MEpMcjR1QXUzZENIa1hDWXVGT3V4T1NoUkM0WmFhVlBIOVJk?=
 =?utf-8?B?TFMxYzJjU2NXSHV0dkgyend1T0dIOU5iekZBQks3Y0U3NWdVR3hDeW1LOVdP?=
 =?utf-8?B?VzRlVDZ4VW5LTUptS3JIM0dlTWJVa3hkZ1VFazBGQjFOT2ErK2RRTkZzeGd6?=
 =?utf-8?B?L3d0aXE3YWhZcWk1R2FPYUwxM0E4QnpvZ3poSm9YOWM3YUkzNE5xbUV3aWda?=
 =?utf-8?B?Z0Z4NWtkVjNzMHE2RWtaZ3I2VDJGRGYybGVxbmJCcmIrNkcxc2VXbktBcy9W?=
 =?utf-8?B?dlRTUlZtaGIxMTZ0MFJkaDhEUDdpc1FrWHB3dThqUE0yR2lrdXBBT2R3czZP?=
 =?utf-8?B?Z0RuUjIrMm02RkJEOGl4dUs5WEFJMDArTGZ5VitValNrMXdLNENLd0hTcTJ3?=
 =?utf-8?B?YTJrWXdtOG9pMXBlTkN4TzdocThWOTJ2ekNtcUdBOVVTd0JvcldnRVlFdmNa?=
 =?utf-8?B?WkJWL0hBbE9CU1JQQXBaRm5oTWtoeG8xYVRZdUVmcmh1VXpDYTVHVkR4MUZN?=
 =?utf-8?B?QkRKeVZoNTczSU8ycmttWkl1S0JzMXNJOW1kM1lHYS9HclZsTXBsNUZpMFFr?=
 =?utf-8?B?UFY1UTllb2pzOFV5bjJvTUI4WTl6RmE5UFJXK0RhWjhDaUVuUDYrSE5PMUxk?=
 =?utf-8?B?WFVvczRuY0FvTW1Wby9wSkY1MkxVQjEvOExocnBFWE5janRnVTFHTHpsaWFw?=
 =?utf-8?B?ZU1aQzJMODhpWUJQVDZoZ05na1E1ZldOUHVubTRkQnE0ajVsdnR0T3N5THFp?=
 =?utf-8?B?S2hEa2JjK0NHcldGdEQ3TFc3MVFVK2hVLzB4WnhRU2paMjcrbmx3VzdDWDB3?=
 =?utf-8?B?a2dLbVd4eFZLaVVTMWNqazR3cGU1YytoSjhFR1VIaHZVZEtnUFlXMWtRaWJ6?=
 =?utf-8?B?YzNOWmdINWxramNYMUlhM09qME9HZDQwd011NjdCOFVEa0pLdS90aitiQzVG?=
 =?utf-8?B?WnVNaXZ3UTlGMy9tbUJ1WWx3UHNDS3MveDRqTG13NjhNeS8rV3BYTThpR0p4?=
 =?utf-8?B?MXh5eEdKcWxrLzFYVmtFS21WaVJLa0pmRVA3QUwzbk9yenpqNmJ6YVVtRTZF?=
 =?utf-8?B?QXRTWFoxSjNYYVlBbzVFQ1JTcUZIcEN4L3lrYXRRVUhPd3lONFF0QjM2YmFm?=
 =?utf-8?B?czZjVXpnSmtCOUxRZ0ZqVFV0djdpVlEreHBWSk94LzVKdHZWN3lmVk5nWEVw?=
 =?utf-8?B?VURLRklqQU9uUnQ2d09Cdmc5YlZLOEkxK25STUdxWk9iTEFQMlpwNFlPYjQx?=
 =?utf-8?B?UXg4SHRpcFRDYTYxVTZ1TTR4K1cyL1J6YW5JMityaWpIaWRNbXRBTDlScnk1?=
 =?utf-8?B?Z3hGc0JTNDZlKzVQNzZKZTBPYTJ3eGtMQWphWjNKcFAwTGRLQUVXa2lqb01t?=
 =?utf-8?B?bDZLbUd2ZW5VODBzRnRsZ1FrMHIrNUZ1TUxGZFVRbDFQMVQ1M3JzUW9sSmlM?=
 =?utf-8?B?aXhIVzU2cE1mbVNFNDNmcVk5Unhxc3k2QXc3bTNTVGxPeUhXZk1uVlVLelFs?=
 =?utf-8?B?TTFLOXhYcXpITnpmYmtLYUYyblNCOGQwSjI2Unkyc2I1bFR2MWduYm50R1Rm?=
 =?utf-8?B?cWNkbU1YcnpsZk9ldmt5eXdoU29XY0VkNzI2aUlEYXVveE1nbHFIT2ZXYi9w?=
 =?utf-8?B?cnFCbWtseVRIVnhTZXN6THdNcjJRR1FDRjhjakl1Z3hONDJSdTkzMnFvZEox?=
 =?utf-8?B?Z0N5VWVVT2JtTzFqcDlGRGdKUUdxWVNVSHhZRGE4bWV1Q0ZxOE4zRElZQTJ6?=
 =?utf-8?B?dVhLaTF1MzNHUnZDUlJIY09IZ1FPeVVVU1lycVpaOFhJa1hManlLSTdwbzZs?=
 =?utf-8?B?SUpLWmdDTmJ2KzVyQlZlL2UvbmxhYkpCMUpKMVNGYzAxd0JTeU1uS1JnTmNP?=
 =?utf-8?B?WHJNTDUvZ2xmUG56V2FaRzV4L3ZzM0pyYTZvalUvd1hBL1FhNCtCbHUycU5L?=
 =?utf-8?B?M0E2Q25GQzZyNmwwM3RoZ0EydmNUZE5CVjgvdThHUnNqUXNhUTNrQ3l3RnFH?=
 =?utf-8?B?eDJtK1A0QjNYczJ1ZHRCVlpRODE3RHlRWHo5ZUVrckw4ejRGN0xQVlhzSkZ5?=
 =?utf-8?B?RXBhaEVWa1dvaDFMenNCdFRJNC84QjlwV2FCODMwT2g1bzBKMk9HOHd6d0Ir?=
 =?utf-8?B?WXRyOG9ib2RXRlUranova1BlaHFiUURjUGxZcXY4bkcyK2hZcXp6WEpKN0RU?=
 =?utf-8?B?UmNnSjlLWE5rUE01M3FLbnIzWWZaR2ZXdGttQk1rNm5JMThkcmlkZ1pYUnE4?=
 =?utf-8?B?aFdqdXVoU2RFNzNqWG1qUGtYOCt0Rk8yclFkQVV6SktrUHpJR2F5eUhIWHFM?=
 =?utf-8?Q?PB09U/giul4K4SrA=3D?=
X-Exchange-RoutingPolicyChecked: SG2TbrJTpYw8KrJ2N9uSs4sPaBzzjWbaGekxziTjutoXziG+oS+DVexTJomWf4xgA0b29WFjwdMRy+jCcqdwK5jRFyKOeba6XGwtvTzywTJvXImz1TWuhTy09+QcSwyFpG6E2o13Id/PZzLHpo+D1pYjG2G8rXBHtiG8DLJoCHerSmUu2ekI5Y5bc++pltdz1K4O+5gWHMBoC5MZFAUIvCkNDC/OGqSu6CqQneLzHaUjdJaYPjAf0pt7pnOYdQZIae+A6dkuqzLii5saLslj8kxn5u96UmfSZKo50/sNzUiV8eVIKZMSuBi/Y/8YsZtSQALb4qIgfa/bMzOvGZL/KA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1763ea7-9c1a-43ce-705f-08dece0afc95
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:59:31.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ddrbh3A16xjplp5SA4unEWmKw1uqksey46Rb2MWgk8PuWwtNYLR//Yx/QQL5ieDPagNgJTvoFTM5RtuncTG8vPr0DkUAxITvpdGY7omk0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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



On 6/19/2026 1:40 PM, Karthik Poosa wrote:
> Introduce a pcode_info debugfs entry to report pcode details.
> This initial implementation exposes the pcode version.
> This can aid debugging when the pcode version is needed.
> 
> v2:
>  - Enable the debugfs only for supported platforms. (Micheal Ruhl)
> 
> v3:
>  - Move the platform check out of this patch, as it is not relevant here.
>    This patch solely enables debugfs; debugfs creation will be determined
>    based on the return value of get_pcode_version. (Karthik)
> 
> v4:
>  - Skip creating debugfs entries for SR-IOV VFs, as this is not
>    supported. (Matt)
>  - Reintroduce the platform check during debugfs creation to prevent
>    creating debugfs on unsupported platforms.

nit: we can keep log under ---
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..cafe3deb04d5 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -31,6 +31,7 @@
>  #include "xe_tile_debugfs.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
> +#include "xe_pcode.h"

keep includes in alphabetical order

>  
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int pcode_info(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct pcode_version version;
> +	int ret = 0;
> +
> +	ret = get_pcode_version(xe, &version);
> +	if (ret) {
> +		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n", ret);

do we need this? and get_pcode_version() already prints an error on failure

and we already return this error code to the user

> +		return ret;
> +	}
> +	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
> +		   version.minor, version.engg);

use %u

> +	return 0;
> +}
> +
>  static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe;
> @@ -221,6 +239,10 @@ static const struct drm_info_list debugfs_list[] = {
>  	{ .name = "workarounds", .show = workaround_info, },
>  };
>  
> +static const struct drm_info_list pcode_info_debugfs[] = {
> +	{ .name = "pcode_info", .show = pcode_info, },
> +};
> +
>  static const struct drm_info_list debugfs_residencies[] = {
>  	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
>  	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
> @@ -567,6 +589,18 @@ void xe_debugfs_register(struct xe_device *xe)
>  					  &inject_csc_hw_error);
>  	}
>  
> +	/*
> +	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
> +	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
> +	 * PUNIT_VERSION_OFFSET.
> +	 * Attempting this access on other platforms must be verified before enabling support.
> +	 */
> +	if (!IS_SRIOV_VF(xe) &&
> +	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))

maybe move this comment/condition to some helper function

	bool has_pcode_version(xe)

> +		drm_debugfs_create_files(pcode_info_debugfs,
> +					 ARRAY_SIZE(pcode_info_debugfs),
> +					 root, minor);
> +
>  	debugfs_create_file("forcewake_all", 0400, root, xe,
>  			    &forcewake_all_fops);
>  

