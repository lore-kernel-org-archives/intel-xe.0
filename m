Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C15C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 11:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671CC10E826;
	Thu,  6 Feb 2025 11:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPtp/srL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943A110E826
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738840860; x=1770376860;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DcVLN/xDuX2p0IvhGcaWpEswVsjr9oxCAdFNc95qCyI=;
 b=HPtp/srL/Ba0Oe5Wyyrr5BoafYvgz2ino4q88m3rMKoH+C2LJvbZtfor
 xSAJOqGlcVrEazGSB7CWmjlnEl/eeBAWrFpVz/dl5hJ9w/DggBZOHdSZK
 sAHWv4Cb+zKAYjNUI67oTjE2DT5i7doIGfDnFL1GGoic8BbXYQnDFJDK6
 ob6W67b8gygpxAJ3PPEF2oUCVcq/ThNFG98nxSWtQzdVXzmV5l6eYUBhk
 S8kUg3toNce4X3zrTF2Q1iIt99UEafFW/uo/IhB2TyY2lwXtQGcVEDkYJ
 xdi08ooevkvPvCqIvKK/2gdjmIPHoHHtfsSJD94OwE3DAphXlmkWjKSwl Q==;
X-CSE-ConnectionGUID: zyapza5BQ/C9rfaVqzA7NA==
X-CSE-MsgGUID: dQWT8/6JRMyB5q3fo5jS7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39332864"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39332864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:20:59 -0800
X-CSE-ConnectionGUID: vB4ct9IPR3qiF9Z3aXgwcg==
X-CSE-MsgGUID: +1QTNLPzSK2ar2AcH8m/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115799622"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 03:20:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 03:20:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 03:20:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 03:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4floLdYN9KpCNTmZqGPhrhWjCe89Z8hD9Oz9I2bIs2oDT1oOe+DAF51ot2JyldFAle7EB2VHX/ZB/h8J7M2NGBL6A7u57IoIGtRy8y03XVydquORgU23L0jHlodJ7GJOPAhD4GLsUdeFKV6wztvtmOwlIKiwIDc6O3CelDob4+O5Sz0gQvQUVUHn0dVwNp+GZpSE4TGxlXWwgzyQE04SFu885M883R4zQtP5/ox8wCOZozA01lOknJP03v4rtx0qpVzNbyRHTMcEu/pBcKNpdNFxZWtdA9R/Gc8Pkx4RKjLtjZN1a0pN3Upoh991h2Ldc94NxcsBebOr8qIML45Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXRgv4wSIVx148xc6oWbiEL1Cg2CfBoW+sW/gScqMGA=;
 b=QtnXTx1EMjimx1OuOwpqY6DwJGaFBpLNx4EJSzIYgiQuglrfF1LQ5oc2FXRrM41MueoA4bGikfZS33P58d+cPmSBsw3Rx8jLnzqjmMQpRhDxGglMLAJm82i9ZqTtzJ/cPu06b92eHlsZEId/8dZ4SyE9b7l4bVBL9AvBi26iaJIfNABS1WhhqoNPsOwkwGfdneeOUawDPQhbEQ9Cb/G4OYbfR8hUwLcTL5WTMjumIvRKbwAEcCRv5/IKwzwbtQKeUVQVzRMmgQmQEJ5mZ+N2+HghV9iiw6+1K0PiNhGKLUM6XVGA8wzEr70r225Ov11XjGRLMjSzXJn0g41vIWE+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 11:20:28 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%6]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 11:20:28 +0000
Message-ID: <e28bdf20-467e-4928-824b-28bb19a3b771@intel.com>
Date: Thu, 6 Feb 2025 16:50:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/xe/pf: Enable per-function engine activity
 stats
To: <intel-xe@lists.freedesktop.org>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-9-riana.tauro@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250206104358.3436519-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 9708b75c-6602-4643-2835-08dd46a04278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU9pdzRIVHNEN2JSNXUybXFrcnJuazlRaVlYYnpFQmtqemdERk5IeVFpa2h1?=
 =?utf-8?B?b1JQK1Z1aUpncmUrckRmbGp6NktDZ0dYSDhPSE9lRTBXZ0NEazJPdnV3a1Ra?=
 =?utf-8?B?WGYvMkJIVk9kUDEycGQ1bzhoR1E3RFR2VFNlSzB0UldFVS9wSjBkUFpOS1Z6?=
 =?utf-8?B?T1VxMmp2SmFVTWE5azJMNE1rdGd6UXVqNkplZmdGZjNFL0JSeEY2a21SMU40?=
 =?utf-8?B?VHdXb2xPTjdZUzMzQVVqNjMxSkdNaTVJQ05NdGNxUzZHSkxsc2hOWmJ4ODlp?=
 =?utf-8?B?RjlWWFpKZlJzRnA2UnY4WkVubFVyalg2Q3J2TDVhMzV4dStLck91cHF0blBz?=
 =?utf-8?B?K2o4Wk5iRDZCb2piZFRqa0d5cHNFaHcwOWhJQUJ6TmNCRVZPRnZ3Wk1BVHF1?=
 =?utf-8?B?Znl1dExMNXZNTWJiMWZUUnJENDFFOXRxNXBTcHhDVzhsVXRFYXU2TVRuTUdl?=
 =?utf-8?B?R2RJcXdHNjJNWGEydHdvMEtnUlZuQXdNYS9uUlVFMVFoakJKQ09rZmxLYnJD?=
 =?utf-8?B?TWlHUGVjeWg5VVZaT2FKQ3YwNWlSOEM4UE96eFZKNjV5NW4xWnI0TlFCaHR1?=
 =?utf-8?B?UVVOeHN6OUJseTM0V0YwTUxtWDFrNG9jc0JjV2txNEhlTDdsNHR6bjl2K3BU?=
 =?utf-8?B?S2NIazloelZob3ptKzJ6R0psaDJ2cWJDS0hacis1WEMrMDF4RUZ6eHN0Q0Fi?=
 =?utf-8?B?RlpMZTB0ZW5QZ3lVZGJiOGlQeFB3bkxLMkh5TW5sck9VU3ptWGF0VnZIOG5k?=
 =?utf-8?B?SXltWFdLbitwR3RhdEE2c2NQVFMyM1JvdFEzQWpsZW9HWHVEYmZOTERyVW45?=
 =?utf-8?B?Smp2NjI4VXlkRExZUXZWaGROOGdPWnBKcnlNK2RwanhhWkJJL2lVc1pBNVk5?=
 =?utf-8?B?L1RJM2RkdXBnUXI3Y2hPQ2FUaFd2a0YwNkRLK3crZEpHVlBKYXY5N3ptV25T?=
 =?utf-8?B?bHhKSkdpdFBMWGh4ZjNTemdRMHkzbi9RdmxycUdObHB2MDdWOFlmUkpnUUpn?=
 =?utf-8?B?UVRIaU9iTEJtd29IbFRYb0dLMGlyeFd6ZnpXMmlObXVXSGFMb2ZrTjE0UHNx?=
 =?utf-8?B?ZTRVc3EzdmN5T0RWNkhkRFU3SlhXNDhpTzJJSVc3YkRXd2RGM3hJVUlrTHlN?=
 =?utf-8?B?RFBUaytJNVVFZEZvbUZScEI3WVZ6aHNOYjRhQTVJUy9XRG9kY2JsY3ZZN29Q?=
 =?utf-8?B?dFZ6Tk4rV2pOZDVFSUpFTGdZa3IzM01jVEhrMXUxTlZXZWlWeVFRT3QvSWpu?=
 =?utf-8?B?S2RZT3VGeTU4SjNTbVU0UkEvWDJvYnVvZzhpQWdtQWRFSE42L3Azck9uc2ZJ?=
 =?utf-8?B?NVhpeWZxVUdRVjNwMUwzRGJHRXorSnVZdVpwcHkvOGEwL2VWUzEzSTZOZjZC?=
 =?utf-8?B?Wjh5RDRSUTZxT2pvNUhQNEFIVDNUUTdXWnorUnFOSnR1N1VPOGFJZE12ME4r?=
 =?utf-8?B?emxFTHdnMXE4K3JrQ3U1SU1jaHBlWjBBS20vZENFcFNEaDIrdlpWRW1GODQ0?=
 =?utf-8?B?eGJ2RDFNZlk3aVNObCs3ZEdFSlhpMURuRFRITWxVcXJoWWM3TkZDbDJwTEJ5?=
 =?utf-8?B?eVBFUnl0SE0xOFlCU1l1UjFRY3drMXlFSG1pLy85SlNLcytvY0UwblZJc1JV?=
 =?utf-8?B?K21sUEk3VnhCT20rMlgvY0NtdmYwMjVtc0dNYzFKMm8xdzh0RTZkVlEzU1A0?=
 =?utf-8?B?cHovYTU0RHQ1RXRnT3YvOERtSWhPY05CSHQxeG5kWmZjbFNKbTRWZThtTlBH?=
 =?utf-8?B?Rm1oWEs0Qi9meW9KQXhuNmZpcTkvUXNoTEwyYVNoNk12MlJTK2JDUi9mWDhV?=
 =?utf-8?B?S3ZoTWhjWVRaU290YUR3YktWTHJHcWhORHlOREloMXZOdWdndlBWSjFHanVo?=
 =?utf-8?Q?uLcoVU67STGZr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3owMlpuamkyYlRLWmZuS1JINnBFd2dISjBOelNudEVDaTNwTXJQaXFxWnFW?=
 =?utf-8?B?Q29aSkRsaDBaQ2JBMS9LNXBlanRjYVRnbk94YUUxT1JRSU9YbVJML0JlcnN3?=
 =?utf-8?B?VXZTaStDSFR2TmtJM3JvMkdmeVM2MVBRbE1hdG9SNE15S05OQUp3UVZMVFhh?=
 =?utf-8?B?VmxWZEJNMFBKMVBld3dxbnFMZzd6VDlBaDMyUlJkT0NNY1pxZ2FISlhWUFNl?=
 =?utf-8?B?MUNuUE85ZDQ0QzBXNjhIVm84WlFhTStEWjRzaUg1ek1ncEl3a3Y2VnZqdUcz?=
 =?utf-8?B?aEtkVE8xVHRMcmNYa0tNa0FXSlFDZWk1SDNjQkZBakkrMDFxVGlxNSs5QTlX?=
 =?utf-8?B?dXdhRk9rRElNU3ZtRXFNaFFpd1UrQlo0M2dia0x0N0V3dlcwdTBpc0FTNWhG?=
 =?utf-8?B?R1huWnk5SENVWitoVHZxd0VOVVd0OGp1WXpxa2FLUkl3U0MwVFFyQ3dxbER3?=
 =?utf-8?B?cHg0OG93N01Fem9qKzA4b1hlbFZQSGs1WXF6NXh2ZjRlRmxoQ2lPa3FFQlQw?=
 =?utf-8?B?bUhneHpxTDRPYUYyeXdpenBEeUh0Q3h3Z3RZY09hSkxKWXYyeHVraVRzZTE4?=
 =?utf-8?B?aTdvaDNGTmNEZHpIN3VScEVTeXh6ak1jdXVoSzhYaDBRTzB0dlNJbUQwdzBU?=
 =?utf-8?B?WHF2aFdwOGxiUEorQnc4SUVFYmJvMHh4MkVkb2tidi9GcjR4YkxmNEhPN0R2?=
 =?utf-8?B?VDFBWnNOY0ZSaDQ3M0RhZkRRVjRad29OL3NpeEVGRXRxT29NVHgzcm1xaGlO?=
 =?utf-8?B?V1hWZmhJR1JqbGM3aS9rSGtVZUJNY1JBanNNSHpwU2ZETWh6OTJnUmk1cGNz?=
 =?utf-8?B?QVd1ajN6bWpmbFRDbHNQSERBRzRMVVA5bHpCa05raGFuclRnM08rSHIwRm9s?=
 =?utf-8?B?Yi9CcnZVMysrNlBWWTJkR1NCZWNVSVdRZ00wRmY1ZHJ2cUYzRFpOczJFT0lN?=
 =?utf-8?B?UjJXaDBQU0RXQjJBaGc4MGVnMmY2QVI5TWQyTmZ0S0MzY2k2UG9ISUFhUVBi?=
 =?utf-8?B?c1FGVE9TZEMvUm94STFsV3B0bjZqVXV1VmJsRUZ5SzNXTUhBREt6QlFkdzBW?=
 =?utf-8?B?REhIYWhyR01OV0lOTDJzTzdOTUlqV2ZzU0VqN1cvakFRUXBPQm5kc1NqRElE?=
 =?utf-8?B?cDBaK0RuTU1yOFlYY0s2eUFsaXRQRUh2dkl4OWoyWCsrZXNnY0NPTlBjNEkv?=
 =?utf-8?B?Wmh6L0NtSDcwKzhXRkdzS3JIWUN0cy9pcVRZSmZaNG1QM0V5MzlvVWErK3FN?=
 =?utf-8?B?QStza2UyNUI4VmJuaTFkZUhVL1I1QkkxbGFXdlFJVC9QK0hzZUN3YVQwU3RT?=
 =?utf-8?B?NlZtQVRPYmtzemV5bFVKZ0ZRdCtsb0RPY01Xd2gwcnpjQ0FHaEVMaStEU3Q4?=
 =?utf-8?B?SmQ4M01uMWhjbitDb1c5K2g2YXcrMXhCNkMyWVV6K2doVWRaMnJRQnpDbkln?=
 =?utf-8?B?cEhhajAxcUd3enNBMUpSOE9zMzNqUFZxSzBpSW9EY0xhNXhVWlZWL1BBaDl5?=
 =?utf-8?B?YU5hQlBqTnFPWlBzS2kwaWJDK2VrR1EyWDhLNUxqKzlWKzRWd3JVWnlQU29X?=
 =?utf-8?B?TlVMRTF1N3FzaVZPVldZVUI0SFFFZUN4VHlMelA3RjVBTE51QkRPeXVCYmNa?=
 =?utf-8?B?T1pnTnJxWnUraUxRL1Fvd3A1ZkJaMDlQa1hSenhBYjJFMENGejZadGxCaWtu?=
 =?utf-8?B?MzFIL2ovK0xTbGkyRVIvV2Y3K01BbDJGSjUwRGUxdzZxNU9vUi9WaEJSRlJG?=
 =?utf-8?B?OUV0K3ppZ2NWUG90U2Vhak1RRFhTa001WURqSERGN3V2OE5QZEJRb2lKOE9s?=
 =?utf-8?B?VWZ3M2pPMlAxRURacm15cDdwakt3aFRLQXVFVnhkL3dKOFZlL2d4YW1HMTZO?=
 =?utf-8?B?bEhPSVovTU5EWnREelo3SENoOFpLWFcwejhmL0JCOHJudE5TSk9sY001c25K?=
 =?utf-8?B?a2QrUCtFZkJCakNoZUw4dUJabm5TTzVHakExYklSYWNCcWZ1T0I0MmZZYW1U?=
 =?utf-8?B?cThGbjJPWHM2ZnU1NEJjWGp4L2RFcXFXSHUyOHJsVWVJOXpSd0JCbHpzTTBE?=
 =?utf-8?B?b2F0SHVxc3BNVytOOWxKZnRveW1qc0Z6ZUkwSFhTTlB3blYrdUhZVkZIR3ZL?=
 =?utf-8?Q?T83qZxGFTdBlikya+kB4LC+oQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9708b75c-6602-4643-2835-08dd46a04278
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:20:28.3782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFs3bKXC0fteLqtjyyMd0Vxr7tQP+HcbD4I2scisu/TqFhE6LNs5r6eDWHloCinXWhvlANBasAd0HC4RGTS8Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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



On 2/6/2025 4:13 PM, Riana Tauro wrote:
> Enable per-function engine activity stats when
> sriov_numvfs are set and disable when sriov_numvfs
> are set to 0.
> 
> Also restart engine stats when VF's are reprovisioned
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>   drivers/gpu/drm/xe/xe_pci_sriov.c          | 25 +++++++++++++++++++++
>   3 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b1d994d65589..25855dcb6e42 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -23,6 +23,7 @@
>   #include "xe_guc_buf.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_db_mgr.h"
> +#include "xe_guc_engine_activity.h"
>   #include "xe_guc_fwif.h"
>   #include "xe_guc_id_mgr.h"
>   #include "xe_guc_klv_helpers.h"
> @@ -1972,6 +1973,21 @@ static void pf_reset_config_thresholds(struct xe_gt *gt, struct xe_gt_sriov_conf
>   #undef reset_threshold_config
>   }
>   
> +/**
> + * xe_gt_sriov_pf_engine_stats - Enable/Disable engine stats for PF and VFs
Mismatch in doc and function name. will fix in new rev
> + * @gt: the &xe_gt
> + * @num_vfs: number of VFs to enable
> + * @enable: enable/disable
> + *
> + * Enable or disable engine stats for PF and VF
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable)
> +{
> +	return xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
> +}
> +
>   static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>   {
>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> @@ -2362,8 +2378,10 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>    */
>   void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>   {
> -	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> -	unsigned int fail = 0, skip = 0;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	u16 num_vfs = pci_num_vf(to_pci_dev(xe->drm.dev));
> +	unsigned int fail = 0, skip = 0, ret = 0;
>   
>   	for (n = 1; n <= total_vfs; n++) {
>   		if (xe_gt_sriov_pf_config_is_empty(gt, n))
> @@ -2372,6 +2390,10 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>   			fail++;
>   	}
>   
> +	ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, true);
> +	if (ret)
> +		xe_gt_sriov_dbg(gt, "Failed to enable engine stats for PF and VF's %d\n",
> +				ret);
>   	if (fail)
>   		xe_gt_sriov_notice(gt, "Failed to push %u of %u VF%s configurations\n",
>   				   fail, total_vfs - skip, str_plural(total_vfs));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index f894e9d4abba..a5585b178e6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -62,6 +62,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>   				  const void *buf, size_t size);
>   
>   bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable);
>   
>   void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index aaceee748287..612e64efb43c 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -62,6 +62,21 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>   			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>   }
>   
> +static int pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret = 0;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, enable);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
>   static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -94,6 +109,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   
>   	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>   		      num_vfs, total_vfs, str_plural(total_vfs));
> +
> +	err = pf_engine_activity_stats(xe, num_vfs, true);
> +	if (err < 0)
> +		xe_sriov_warn(xe, "Failed to enable function activity stats\n");
> +
>   	return num_vfs;
>   
>   failed:
> @@ -110,6 +130,7 @@ static int pf_disable_vfs(struct xe_device *xe)
>   	struct device *dev = xe->drm.dev;
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	u16 num_vfs = pci_num_vf(pdev);
> +	int err;
>   
>   	xe_assert(xe, IS_SRIOV_PF(xe));
>   	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> @@ -117,6 +138,10 @@ static int pf_disable_vfs(struct xe_device *xe)
>   	if (!num_vfs)
>   		return 0;
>   
> +	err = pf_engine_activity_stats(xe, num_vfs, false);
> +	if (err < 0)
> +		xe_sriov_warn(xe, "Failed to disable function activity stats\n");
> +
>   	pci_disable_sriov(pdev);
>   
>   	pf_reset_vfs(xe, num_vfs);

