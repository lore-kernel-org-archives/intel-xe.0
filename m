Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7691061B18
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 18:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179410E1E7;
	Mon, 30 Mar 2026 18:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgF1ZVAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A36210E1E7
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774894468; x=1806430468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EjEOc23kA9sCLCuPRV5LXquPtOOdgT/q4+F9enIxzqw=;
 b=FgF1ZVAcbhSn0J0QEf1mhf2rjlNfHyiGYnCEuBMGfVMMieVgEQxNHMeb
 dYMVPnQv7B6xC+lgcynIQ4AwWZcsjuL08CFt0OHDuAdhm1kbKnZY4u9fq
 4dSi2P/FgjUVE39CanGgHyW0MaBzAqYNZmkCOfjlo3gh0vhcMmTbNq77k
 6RBwMrFNtY2ER82167QdrjfoAjjJOTt4MgVSx4HMTjQtcDRywaLB4PXnE
 ABj7ZVorhocDlBiBf9WyL6/XYGnptLsz6zKaPJuBhD/pBUCIQWZTcNPCe
 0YltJ8/HrxmFeZI6lCh4pHIkuyCiktbX3zA81t4sAHkPNiK6Fd+5cx2U9 Q==;
X-CSE-ConnectionGUID: yLXWiyViTdShCdfBOtnqww==
X-CSE-MsgGUID: 3LG3Q+2ySmuQuEqTn0Z56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75071100"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75071100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 11:14:27 -0700
X-CSE-ConnectionGUID: CW/NgRUlRGCRUgvhqgvYIg==
X-CSE-MsgGUID: k4ZTutqKTbaxGdoD0zSNHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="226013087"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 11:14:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 11:14:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 11:14:26 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 11:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JElroB1+dqvGNkTcnWJxtHAkt3ZZIsbOcukd0vS+Ec0h+NQ5fzeNL6rdrPKqMR7WlujU3kybI89osKH0BfJ26zrOYYOrOcPhHhFh6mK8fw6y5QbznbikTUVSTsGXvSjkT5Ugzk6ZtndUkvXiYVsWatL0uxUBvyjFsUp4cbzaZgViwSDEFswP2y+98aZx+s5LiLAcu3H66Us0aOpsmBIatrRiKew4GJaLKbqjuIaedWo/lR2mdheXJpfVdwp6wKMK8dtwiQwhqWFCfnGVZxcMXWmdRRlPCaCLRGIOkrna0FBq+xUGWnVR700TO2xvXLDY4hw2ZJNk7krFXELUIK4/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEo5PgRpJeK8xQZWsyurlFCzHej+xNxCPGWtYZ//ZWs=;
 b=HcDnhyKtFOSOw/gQ0riW6AhupFqsQSXsqVfEm1EKLpK1QU64j/sMZ8jOg7NLFjV+g5I2M/07aOeV1vghaC1J1bUXvRV3xT+3tm4tFGQ70ul869sgakaYyC7CmMI6rapR6x/PLSC3l6Rrbv3JIf0oQ+rpHaP7oNrBLRep1rEhXs41M7321Iw7SsnmsjxZVmfBkSWkMeyvVJNUxJQCb82v7DwxdRg1Ws+goVabzC0YXWitF2a1pU3Oh9Ypbp4DDWsv50TO0QzsW0937IsrsRPtKEDjFXaFYjHm0ZPhNT2q+McakQV5qGrg1moNNOmX+xic3xRnaXcEEdpNAAmvnrT/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 18:14:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 18:14:24 +0000
Date: Mon, 30 Mar 2026 11:14:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v13 0/7] drm/xe/xe_sysctrl: Add system controller
 component for Xe3p dGPU platforms
Message-ID: <acq9eht7kbBtBCfO@soc-5CG1426VCC.clients.intel.com>
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbc0dd4-6264-4216-3c6b-08de8e882c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: amY04dV687LcEtM3uJr+CBYZnstmiq37ZQG3tty12ZmBPXpijQKPSZQfIOwb6ywa/2cXbJRFkKzNwLrCgoavu2VHgWfiCSyJlX3h7AFTOdO1/woBL00pclHEKCmz3Enxh+BfaJ8ldeojNbEXpFH0s6VnVKE1XwhoJQ/pC+9Ief6c4K5T/eT5mo22wRNzVSo8UvMKTJN7b/25qm5zxGweMR02sSSuVtbrwg/LX2QvG7bVlD5eGSnOW/iOQpGGOIlurVtKpOV86wSBVxlDtrz5aOPv7IlXAqBQgiR+2vQxWbJffcizBpUuuHGkVtpuEjED+aMaJeNdIv8j8FDQNlHS3GN5pO6pt8j9uXiadokM8L14OCj48ntqELeE/UpB3u5lyftdJA0wOZkjNU8qaBX+oK6N0xcOLawZie59oDU6qPFJK10+a0tlaqywtirzA6PoLKcNqwQO9g8LYXIeWrjE4+6hBg0JCi8Zk1+Y60ADhPi1AgoNBXDTjIRZ5DyB2Q7qUyWPlUzDZpRZvcA0f3hrJDFRHbLfT6jAkNpGnuVLwmFRBgqnxkWfrgnrAv68CRd1A7xJsfmaJu5n5UVJfAeWi6C6KR1Dz6UaHhRmNIgxqlUBCEZz71+ewpd0LzR4lk5Y2rgbN+Jb6cTdD5v9SLP74q+Z3swaejhKD/Pb9r4kVelsVmc3hvccMmWzZug4jo5lrUC665cPE42xkZWhQu6oFiWPMWrO01B+29biT1KYw9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXdmQTFFK1ZJTHAvWGVpcjY1Y2gzYkUxRytrOG9rU0lwVWxxb00zSVFwa1Q2?=
 =?utf-8?B?OTBkK25UR3dsQkdocHZac2ZGWUoxeDVXN21adDdMdnlZZEF6ZHY4R3FyZTNZ?=
 =?utf-8?B?N0VrZHVudysxUUdvcWJSUHlqTktSY3BMNk5oeHgwejBWWFJ5OWwydmtvcVZE?=
 =?utf-8?B?SEFhMUxJMi9GTXF2K1Z1MlduWHZYaTZQcFhsamdreG5kL1lmalkwNEw4NzBK?=
 =?utf-8?B?Wk1GT3RsV0JBbWIyVzIwNnVBZ3FFNTJLRlNEN0xheituU0svL3prR0VNd1pS?=
 =?utf-8?B?ckJDd1VHQmJJRWdsWGVOM1RLMWVha3FZYjhOWThZcFFEYWhIU2VLTytlWndJ?=
 =?utf-8?B?SmxOS2YvTmZENVlvS2QzM3lLV2xHY3pNUkl4L0p2T2o0Vlc2b3dPUENFZjQv?=
 =?utf-8?B?MFl4WlZQZlJWRE0wVGRrY3JrbzRkUitRZk5QMmplV2tPcldYNFJGNTlTeGRH?=
 =?utf-8?B?aThpWVVqcTBCN1NkNlJJWG5sVmQwWEZucy8zUDNGNStOdWdhSkJ0QUJWWkxP?=
 =?utf-8?B?dVhFTDQ2ZXNpOVJXM3FJb1MzemhpbmRwVDkxcHhRbGloMHk3WDhkdkozSnNL?=
 =?utf-8?B?RSt1bElBcHZnMXpWR3MrdTR0SkZGaEhhc1VtOFlLZit2QUpvNGM3R3JHZ1g5?=
 =?utf-8?B?U1ZRclVQcm1hd0RVL2xNajcya3Fock0vSzFwZWZpTGNmR3lQRnBtM3NtUlph?=
 =?utf-8?B?R0J5QjhsOENNdEFzQ2wzZUQvZHFvL0xRUXFxZ3V0VFNFTFBmc3JvemFVWFpR?=
 =?utf-8?B?VnFwNUx6QlBmdmlCOC9pazB5QklWVC82WHU3SUtFTkw0SmRvK1VsK1NWTnJi?=
 =?utf-8?B?R2tsL2lUVlEzcjZVSHV5cWJ4cFVDOXBwNkJtTkZxU3pnQmt6QURhaU93ZkxD?=
 =?utf-8?B?RXg0c3lUeml0aUVDSSttOUxEaVlyVHdUQTNkdE1HM0xCNHBWd09KZGI0L200?=
 =?utf-8?B?ckN2b3hFbU80UjdLUGNiTTArbmhISWtsSGh4enpwUVpVZEtRVUl0bkw4ZmlC?=
 =?utf-8?B?VVlFMXZDM1dwODk1K052SVNIM2VhcnhDMzNSNERVaFFMa1psdjFDdGh0V0Mw?=
 =?utf-8?B?dkVCL2pOQkt6K1Q1MW9JSDJkaDNtUThaWnFDeEJwbitNajZOR1hIc2MwSjNn?=
 =?utf-8?B?TWM1aXFrektOaFEzUHhVTTVVZDFIQ2xtK3NBeExMT0d5SWpVblAyejBDTms5?=
 =?utf-8?B?ek5KYldJK1loTmVWenFxK05Sd09IKzVtSUdrT2J4T0VZdDVtdTE4N1ZjLzE2?=
 =?utf-8?B?aTNYSktFLzBLbnNrMzl5eWc0TEMwaU9mTy9CRFJPd1NXZ055QWVNcFFhQlZ3?=
 =?utf-8?B?V3hkNWtPUm42bkdNbGZTUEJXdmFiYVZ6bmpyOGdoT3hobHNGeElYSm0yR3NX?=
 =?utf-8?B?Yk5jVUxyS1BIczZDQTFid1RhQllpbDJQQWVTemd0NkhaQ2p2UVhCck0zeE1r?=
 =?utf-8?B?U0xJT0pFSy9kK3Z1WWRYMWpqN0QxOGlJeHJNaEk5SXIrTVo1YVVMVEhndFZX?=
 =?utf-8?B?QldiRTMvNTlMSkVqMU03WWFDTFBQTHA4T3dMQ2RTc1B0Wm1NMStrR01QVzJy?=
 =?utf-8?B?YXkrVHZlbHdyU1V5TzVrVnhTNUs4OWVGVUpUYjdMMGcrOVdFaE5OODNuNFlE?=
 =?utf-8?B?c0hDZlNLV3M0Nk9FYWZpdjRJVll3b2F4d0JIWVVlTlBBZDlJOFhYbGVVSGtD?=
 =?utf-8?B?NXV1c2xQSHFXbnJ6YjVlRGZ0aUNLMTVYWkREV1RQOUxjQVFkQ1RmQTdZOE5l?=
 =?utf-8?B?NmpHM0NReW1CaDVibmxjVWRidFZHZTdTNDdpbUN1aEZVVTRlY1FoK1ZldzdU?=
 =?utf-8?B?ZnArWWJ4ek82STd3bktNS3hNeDFsazdFOVdKbndLUy9JZm9MSFVKS1dIZUtX?=
 =?utf-8?B?TUQ3YjczYjlpazZiazk1ZDRzbW9VdThrQWNzd2h2MldwL1RyWG4wTVFhNG9o?=
 =?utf-8?B?Rlh0bVIxR1VLMmFxK1FqMTcvSEdHMGsrZWd4eGRpUVBmS0tFYTlJT08wa0NE?=
 =?utf-8?B?aFFiR09UN0NXblpTUzlFVE5jVjV0dWFRakxmY25QcHpobnZJK09CaUJNNGsx?=
 =?utf-8?B?c2xmaTRhYmdnMHZYSzFGMEtuVHFYOXZvZXZicG5qNWFvNW5rSkxVM2c2dlha?=
 =?utf-8?B?Ry9VaWo4SzU3WmFMU0N0MU5TZGxWM3VlU2kzaFhpY09OcFpsRHJVL0huYTN1?=
 =?utf-8?B?Z0xoaVRRR3N5N3MzTmxxNTNyMk1OQ0t4bHFNaE8rTTFPWGRRVnJwR1VPRHpU?=
 =?utf-8?B?bWgzZlliNXU3S3JTa21kMGFNRjJlMzVJVUYwYXJLYjhwNmRkU2wydlNPYm4r?=
 =?utf-8?B?R2FRSkcxa3BNdVkwTS9NZHVxNHlNTTg5Y3NKOFJoQlBtcjU3M1ZaQUw2K2FJ?=
 =?utf-8?Q?fqUrFf+mo0Yz/GGjKsCKcwqoe+KcQqW6jT3A5?=
X-Exchange-RoutingPolicyChecked: uywgtnZti2NeGb4lF4wd+pGXZdMYA6IeErPj6bbxBUfcquY+zjPALeT5lrlTzQgBVx/adOP2ocKgmdb50zbGA288W8/oH9lRbRG7ivVA1OCpI0rZ+qGRe4RPQM21ujtC/ZNID0R88nDhCoJ10L/TONXwlB61XsuwN5Q/9c3/KU4Fs/gHQ/WyJW19Q0sli4LM6jrat8HJFQkmLULpRyzu9KWO8OnL33HM5FTbgiPOuKCPxyd4O5lp3+oHITb/IygVEZtXSoQYYcYFb0liqTu5K/mPLLkAKGdGj4CliQGMayKNLB0BrFWFVrJ4ArSlMc3pFQBdKu8mJeChwhKaYRe21w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbc0dd4-6264-4216-3c6b-08de8e882c28
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:14:24.2708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiUZk24GlQ67qWAAYxwzJtBCgMDjfH/c588coig5Jx03pStyjPCpgWsOWAaYVwG2EbesEKhOQnFZQuCCWBOi4iUi3zZD8YWpUHuk5C2KXmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

On Fri, Mar 27, 2026 at 06:18:37AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>This patch series introduces initial support for System Controller
>(sysctrl) component on Intel Xe3p discrete GPU platforms.
>
>System Controller is a firmware-managed entity responsible for selected
>platform-level management functions delegated by driver. Interaction
>with System Controller is performed via a mailbox interface.
>
>This series adds foundational infrastructure required to detect and
>initialize System Controller interface and to exchange commands and
>responses with firmware, including support for fragmented message
>transfers for larger payloads.
>
>This establishes base for subsequent System Controller feature
>enablement and firmware command handling.
>
...
>
>-- 
>2.43.0
>

This is now pushed,

Thanks,
Umesh
