Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41399C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E3F10F2B6;
	Wed,  2 Sep 2026 16:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9fcHViV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204E410F2B5;
 Wed,  2 Sep 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788365775; x=1819901775;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=76fXrqgsa2gkr/T9kgQwXdZ6ilrP2L4UCzVXDRoOeFg=;
 b=S9fcHViVq1uvqw7Zn2+6I9vdVtsiTfcIsl3Lgh2zWEoHv61/GrFtZhWb
 JNY/3O9HMf4zBQ50YdQvx2vC9K8Z+0bD9E4GXoHpHFunIWdLJahB5Mpla
 kGsJAM+wjC2AKPGIYg0r40/SkvmjHZWcA5XWNrpf9iHs6+mISvULCgjXF
 wwH8U/g3zF2G0mYzq+oQHxbRhI+IMif/0CEJMdlIc74PpUDy6H/RnSd2B
 rhz+1LXJBxvNsz6KpsXeDIVPgH4JECqkkb6QCFaS9Wef4M4l1Gs7YYl0M
 m7O2CE0L/2wcm8XBeG0K1YZ6TIuXsmLioRaTVTzgGlqnqWyYLrycPIUgm Q==;
X-CSE-ConnectionGUID: X9Lj2ZAjTMSeZ6gKK110oQ==
X-CSE-MsgGUID: mH6hTToVSWuk6JxPy+WEUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100345859"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100345859"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:16:14 -0700
X-CSE-ConnectionGUID: Dicn1ba/Rtyps4YH6H5Ojw==
X-CSE-MsgGUID: 7KaLgAWYR3OoHz8iniqtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273620314"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:16:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:16:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 09:16:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXC54WwUFNwDZusL3Z3HrCcyNQHgbY/1tJuhcXqgWSWBjTeGDLmcqJVAZ3egluc7c92gt2f4SWf6gaitW/qstAKbidgUL3DyG3p5zxsCNCzbRvXbAN95dsLCjpedSSnu2iSPR7TuK7dtTRCA0XKyMMGAKXQiy2ph+WrZx5hEY6liKJGvraPpepA89fqow1aPhUyY4H7e5q02p/8uD45YmRQ+NZaogCHGD8Klgl7nbfKtRY3k2HX4n40JSWFR6Sy4ezLzkyIQoc8kRMPSqxbOStqojxjRPuWBiW3nOaUvTW8/dfsLKQCaj1oQMePoLokYZjKORvTNjBhqGkeQ/AVKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjlLDeMErybr5Xe1WYrHbxEqGHlMe8Fu/AmLtDKxXi4=;
 b=aj7O2GiOHvDtH7HaQaz6Xc7bOCHXYYfLCvT/OZE++x3pr4dbLnaD1ZCwxvIcG/sLkrizVhDxNpeDH4fvs7mkOEWodAMdq28vOrIWDhxr6OxJylA5lp0eUPDMHhKMP+RXhO31yoQS92wKwsn4HMTKdnd+mh1Zt/48EAvYWL3g31J/magcD7wpwE+ke2atlvG22ULIVa7ActhSvkSxCLwfkYxGOFvzgL1jJsbdsKU1Euk8OIKd8uLtY+RT2wZM3ho+aq+W93X0E5fl34lSZiSlZf4WHgrljmHGtYbNeN4PCwckNT1v+h9+WG3V7kNEH+CrFETCjQF32PDw4sG5lF8U+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:08 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0360.006; Wed, 2 Sep 2026
 16:16:07 +0000
Message-ID: <a8646a39-e14c-4d48-b085-8b227ce763d1@intel.com>
Date: Wed, 2 Sep 2026 21:45:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 1/4] drm/i915/display: Enable periodic AS SDP skip frames
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-2-uma.shankar@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260831213421.1804635-2-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: a9003ada-722d-4930-fa97-08df090d7ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: XbflZZzV6LSVwxtF9LeQPDLmI10R+LyF2HzLnLKohg1jLG7PgnB3lQq6GEOhxnyORT+OwCHZL8o2RwPE4YfjCIqeZlO0061TH/gtLnLK6/7mTL8zhcs82DNfpjXAF9ea8nSApyh2wx76dgul6DD+VM+xMVED3xVipuiTDyO+Y9C9MBU14LCWZONn3FRKstwkW3DwrEPYw324PsGEMsqM4lXsOcJfuXSDD/U84LMFzVA0lcXlIK6FWUTW9MDBiQuygiacNOX981PUgPIOFwjR6Y6mY6zIh234mKjc0LZr/ezthif+3u38sGVPXS2GI38k0o3ytwwE/h6xRq9dGaYB1vLAnW7jLsBNIRhGCyBJS0fAObVkpY8EqN4lKD2JrB+PKohxyS7xxjffNXDSi3bolp/q73msfS7zvzS9IZQknXmqRb4l4DaByY1xuhwUdPregLvooHBpfzfm11a68SV20WWICohO9tH8IJqVgS7ZEmfuerP+FCB0F9oaWMg8N5XjAByV39sC5xyeDGRhxW/g6ZI1y4RPU0yvA2c1IFYaykGDjZhrS1PHzOClOjdblbm9TxoGLJYNKoG0e4MOG6MpTpgPbj9U40ZUObtmCEcZ5lQSeN7aD1RMDHZ1fHAQq0W3yHAXGuXruCW1BtRdb3GhUvfCg0MnixjshNCuIkcJZ00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVxYktJNjM1SXMwSDJxYllJdHlQSjUxY0FWV3pFQkFFeXcxZjJJZGFMNmdm?=
 =?utf-8?B?RU55aTRxTVFHcDFpcE1CbHlZYThodTg1K2ZUclUxWWI0TmNLZ2M0cm9ERlVJ?=
 =?utf-8?B?MTI0R1BxZWZvWkFQbXZaK09CTU1DLy8wWVlZNGhLZ3pRRjUxTVU2WnJQK05D?=
 =?utf-8?B?eHV4S3pZcFdMSWFrTUVHdlNpK2R5QVZZZGNkMkh3enEzczZtTlprenBEeDRK?=
 =?utf-8?B?dXVyNU4ybmdRbllMekpiOXZ1SzVnQThJaXM1bVJJVzlyb0U2bVAxOXN3OHpn?=
 =?utf-8?B?Z0JPMTRIRUFFTUNzYzdGeTVBTmh6Z0tIbU14b25qdWdGMTYrbEtxbmVPWTRy?=
 =?utf-8?B?dlM0TkhpWXd6cWNlUGVxZXh4QlJFeVpWYXZ5SGExbksvYVdKRFBXYS8rYW11?=
 =?utf-8?B?OWhwTE13WEdzNkUwUStZTUp5RzFOeEYwdHFKaVdJTjdXdHV0ZXdIQWJObHJ4?=
 =?utf-8?B?QmN0dUtFWjFyTWQyT2RndGNQZ3EzS2Y5dEJicUx0Q0J0M1ZoQkFrL1dxVVdX?=
 =?utf-8?B?SGthMUhFMjJxbVJkbXhINm92Nk1PenJRZTJPSEs2SGNUd0VOaDc2U05PWDNv?=
 =?utf-8?B?c2NrUEdrakVUVzBpWWhpZnQ3a3VWeGNRMDA2MTZ0M3J5aFlmMkpzbFBRak1R?=
 =?utf-8?B?TGJJV2IwQVUrc09CR2h5Vis4VmVER3psTjNZSlBCSXJxaDAwNiswZzdVcTBJ?=
 =?utf-8?B?bWtNMGw3YTZ4NGNoU1B4YUhIYzdTaWd2WkhMVCt3K0pMYTByU0NYNzNTTVFq?=
 =?utf-8?B?TGI4R2ZZelRmUW1yWkdqRTljWWZ2dXpiUVZKMlhZa3NCcStNUXR3R2dDSU51?=
 =?utf-8?B?RTFmMVlHTHI5emtBQkdYRFFSZUxZK2xlVktZRnpKVU4yZkgrNi9iQ2gwWk0x?=
 =?utf-8?B?Z3ZCZnJyWE5iL09LTUFvZXplZDhQTTF5YmpNYWFyZjNuSTJ3UTR6bFRhL3h1?=
 =?utf-8?B?WnM1ZDhrU01HTE1KanlMRm0yQ3Q3OEJ6ZG5nd0JnSGo1b3VZQ3BYUU1SRmZr?=
 =?utf-8?B?Nzd0VlBZVE5UVUFuOEFKSXVTaFFFVVIvVVdqT2dMMTh5TEFPQlErbFlpVXIr?=
 =?utf-8?B?WURDdFpWczNEVHpQK3ByZ2NqNzYxcVlzczRmNjBxRytHazV4c3B5YVJDNktO?=
 =?utf-8?B?ZHpPTlcwVUNZV2FPTXZtK1hlaFhIdytocHdRSG15OWJTRzI4LzRuNUkzOEZ5?=
 =?utf-8?B?OThFcGJWZTd6b0hyTzZaM1VnbENYS3FQZm80cnd4M1dzK0huT0hVUnF6THhr?=
 =?utf-8?B?R2wzS0RFTFc5NHpQTHhYREp5Z1JxL2U4NEhRNEx1VEluR1pDUmt1dHJVTGUv?=
 =?utf-8?B?cjhhcWxtSXhxdFlEbk91WE9kaEkyNVFKNkZkZEZySUJ0N1YvdmJ4QTlYam95?=
 =?utf-8?B?cmJpOWVVTHI3MDFUMGIwTUhJRkhzMzBCRW1nNFZESVQrZ05ydmRMN0ZaNUhv?=
 =?utf-8?B?d1dyRkRGWHBTaXNRc1kyWi91TWQ0RTZQNHdXS1BRaXV4RzdMZTd2cTRqM2ZC?=
 =?utf-8?B?ajY5aUh4ZDZ4dUZNeHF1L0d0QjYxYWVjQndrZnQzZHNvam02QmhlVXNCSm5I?=
 =?utf-8?B?bDlNbGNXb1pNb1pjNlRPN3o0WTlwQ1VQdkNCWDRFWGVPNDBKSTlxNUVyd3lq?=
 =?utf-8?B?VndDQjIzZHlCdEpLWmZkNGUxdzRPUGRPWVF2bUNTZGl6NGFGZlI3WXRFdVNT?=
 =?utf-8?B?ejgrU0tRbjdLcGJmRWRXVUZWVUtwLzh5QXROOVdtUXB0ZFdSUi9LejVRQ1ha?=
 =?utf-8?B?a21FdjcrenlnNFd5TmpoZDRWK1FaUGcvVXFpVnN0bmx0NzB5eEtFTUpHRW5M?=
 =?utf-8?B?amcvODBESDU1bTJtSlIwZ2puNjZqcndTN2NZSkpyRkRaUy9lSTZiYzFmcyt3?=
 =?utf-8?B?aTI2czdtZ2x6VVB2RWpkSkRGd1VhQjdWVzJ5eGN2amxZOHh3OGFqbko4Sml0?=
 =?utf-8?B?ZDRuUzVvd01WNnl2TDZHUExoOElWNHJCSGpWV3hxSkVRb0dOa0t0UTd3dzFG?=
 =?utf-8?B?ZE5neHB1WHEvT2c5bGwrbGtDT3RrbVp1VXVrVHBBY3RzUDlWZ2llR1BBbkw5?=
 =?utf-8?B?dCs0YTZRMjU1MXA0R0ZjdkRQOS9XZk5VTENDdVVLbTBSZlpsOUhQT3E1Ym9X?=
 =?utf-8?B?V3pGN0VCQjlmVnBaeEhlZUMrRFdBc05ncU1EN2FqZnNEQ0F4OGFob2NBSzlV?=
 =?utf-8?B?WEF6MFZnVEJhZXNlT0oxUHRhVUFvdEtFWTE4ZHVkZHN6a3BodEdsdUExQzFi?=
 =?utf-8?B?aTA3L1RlTk0va2JQUDRsN3FzM3FGUEREbmQwTHNGUG5ocExaNUUxcnBXUG5B?=
 =?utf-8?B?ZlpxeW9sOXVXZW1LaXo1a2NTVW83am9RcCticHpsMVZ1K1VpOHQ1NDgvUlp4?=
 =?utf-8?Q?EVH2rX7pZDu8w3HeB7azlUV37aZ+BV6nSkwqn?=
X-Exchange-RoutingPolicyChecked: xjInDwAffS6axGm/Y75bQu3vT4MYqKV29ubPZq4Df4eN49sQqixWIixv3FLd4xFF79b6oIttcFXfQR5nha5GpwZ8gU8p/qKcB+lggkoPZW3pPRz1UY97XKIGhdXqHgiFGvBpuux5nmudVQCJ8Szv2EG3m4+xYG2DqNPOIcZnopGd0EMzphMtmmaA7ZpthCXUJorjRCXleAnx/qZPGWD88LKfAZSomuslUxxZ0UhxhUzBLrNxsLOV0qOseVjEc4Dt8luEy8qsjFKrnlRJ7WBAxai7Z1hoxZHuYZQIu3aEr/auKn/d01YGq78AeXKpU2ktGDBOcVKwCvxWknXTMARZoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9003ada-722d-4930-fa97-08df090d7ed0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:07.8283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8t6yDj3gSYqrmPivz+xPrNxIeAcK5w6QUHz4n3Rw47rpHg8jKxHm95WJUr4dPpzjuWQT/9yT8HeArFmrmwDLoYdao3EehuaIiRG5NXYvBgHKzuLDz1NX8MlJrJtw0k0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> When Panel Replay is active the transcoder timing generator runs at the
> panel's maximum refresh rate. To drive the panel down to its minimum
> refresh rate the Adaptive-Sync SDP (AS SDP) only needs to reach the panel
> once per minimum-rate frame, so transmitting it on every (maximum-rate)
> frame is redundant and shows up as repeated SDPs on the link.
>
> Xe3p_LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
> send a single AS SDP and then suppress it for a programmed number of
> frames. Program this counter so that one AS SDP is followed by
> (max_vrefresh / min_vrefresh - 1) idle frames, i.e. one AS SDP per
> slowest panel frame, allowing the link to be driven down to as low as
> 1Hz when the hardware supports it.
>
> The maximum and minimum refresh rates come from the panel's adaptive-sync
> monitor range, so the skip count is a function of the sink's capabilities
> and independent of the current content/flip rate. If the panel does not
> advertise a usable range the skip counter is left at zero, i.e. the
> feature is a no-op and AS SDP continues to be sent on every frame.
>
> Periodic AS SDP drives the panel down to its minimum refresh rate on its
> own, so it is only programmed when VRR is not actively driving the
> refresh rate.
>
> The skip-frame mechanism relies on the AS SDP still being transmitted
> (just less often) while Panel Replay is active, so when a non-zero
> skip-frame count is programmed both
> PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
> PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL are left cleared. The previous
> behaviour (honouring disable_as_sdp_when_pr_active and the DC3CO idle
> protocol) is retained for the non skip-frame case.
>
> v3: Fixed Sashiko review findings
>
> v2: Decoupled CMMRR dependency and using sink refresh rate range for
> skip frame claculations. This addresses Dibin's review feedback as well.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c     | 61 +++++++++++++++++--
>   drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
>   2 files changed, 58 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index f1383764b702..a6838e0fd3aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -375,6 +375,35 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
>   	}
>   }
>   
> +/*
> + * Periodic Adaptive-Sync SDP skip frames.
> + *
> + * While Panel Replay is active the transcoder timing generator runs at the
> + * panel's maximum refresh rate. To drive the panel down to its minimum
> + * refresh rate the Adaptive-Sync SDP only needs to reach the panel once per
> + * minimum-rate frame, so transmitting it on every (maximum-rate) frame is
> + * unnecessary and shows up as repeated SDPs on the link. Program the HW skip
> + * counter so that a single AS SDP is followed by
> + * (max_vrefresh / min_vrefresh - 1) idle frames, i.e. one AS SDP per slowest
> + * panel frame.
> + *
> + * The maximum and minimum refresh rates come from the panel's adaptive-sync
> + * monitor range, so this is independent of the current content/flip rate.
> + */
> +static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
> +{
> +	const struct drm_display_info *info =
> +		&intel_dp->attached_connector->base.display_info;
> +	int max_vrefresh = info->monitor_range.max_vfreq;
> +	int min_vrefresh = info->monitor_range.min_vfreq;
> +
> +	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
> +		return 0;
> +
> +	return min_t(u32, max_vrefresh / min_vrefresh - 1,
> +		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> @@ -399,16 +428,38 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   
>   		if (intel_dp->as_sdp_supported) {
>   			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +			u32 skip_frames = 0;
> +
> +			/*
> +			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
> +			 * periodic AS SDP is a Panel Replay feature that is only
> +			 * used when VRR is not actively driving the refresh rate.
> +			 */
> +			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
> +			    !crtc_state->vrr.enable)
> +				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
>   
>   			if (crtc_state->link_off_after_as_sdp_when_pr_active)
>   				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> -			if (crtc_state->disable_as_sdp_when_pr_active)
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   
> -			if (intel_display_power_dc3co_allowed(display))
> -				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			else
> +			/*
> +			 * Skip frames needs the AS SDP to keep flowing during PR
> +			 * active, so it is mutually exclusive with disabling AS SDP
> +			 * transmission in active and with the DC3CO idle protocol.
> +			 */
> +			if (skip_frames) {
> +				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> +				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
>   				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +			} else {
> +				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> +
> +				if (crtc_state->disable_as_sdp_when_pr_active)
> +					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +
> +				if (intel_display_power_dc3co_allowed(display))
> +					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +			}
>   
>   			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
>   				       pr_alpm_ctl);
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index 16a9e3af198d..bb577e7e3bbd 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -276,6 +276,8 @@
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2	REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 0)
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 1)
>   #define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 2)
> +#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK			REG_GENMASK(27, 16)
> +#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))
>   
>   #define _ALPM_CTL_A	0x60950
>   #define ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _ALPM_CTL_A)

LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

