Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4687C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732C610E14B;
	Fri, 28 Aug 2026 15:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kA/b59Kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044BF10E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930649; x=1819466649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ILa+5F9dZEVk+3kpsOy0VXnjlch1EWMgdJUwp+/0ROo=;
 b=kA/b59Knw4r7UZVG7hbMLkngbYG/76I1LTgwGYLptft1ENThEZ82KvVw
 7A6OSXtdV5tCxCbch8Tq7DbNfilDZyQ1WQhKe2qRGMgdkuoh/LqS2p/U4
 53dTBqSR+OQ3bGxzmrQDcLjNBR9rK1dhDz430wclftjbfDjGXJZo+iHQZ
 01RBBjAhyelg0pZ5B0VdTgy7lT0jdJP7Tk9b59mzW/BoCITa8jqwnXRZS
 j/BxWN1zZnou/Ufb8aTPMudifAdfc3YqMBZngml6rEl4S4d2QsDfT/P1P
 GRPoXlJlIZI3TaIYgtDM2Z98C6fryM/M2EjYbIBpCRWcNybcOA2Tdm6Go A==;
X-CSE-ConnectionGUID: QREEPpPSQiWgIu7vRf78TQ==
X-CSE-MsgGUID: zYA5sP/CS4enCKLsGf4TIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99600744"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99600744"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:24:08 -0700
X-CSE-ConnectionGUID: VJaD46wjQVWQr++vk5NTXg==
X-CSE-MsgGUID: LkvsLCTbSASqV03xH2k+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="271988772"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:24:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:24:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:24:08 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQBWouV/T0hSqlJFggIc1lKXbIU9yitQ+D6ps2YRqMWqI99+eqID2a5gBdR5QpVKmNXbEYZohc0gNDPj54TUvr1bwmsfkbKUXTUxg3wtxEHrokClldt7IvXNFMgxiq9/Rni7F9+qjR3nBf5QdzQoYR9UC2QJ/MYXLAO1gc8a3HbPLft/z85i6xaW6jDdjTOKtubuixcbWXZSAfpcxHX4h7DohFmzAHeqQhggaQQHgJyw8M5+r671c2HZ1Lm/OZh3ma29kkwluFOt4sBCSOBzKofqeDiyBGyeXoxM7Cf4PPice8ynTfGtTYL1SoKjunupt3iEkRTNHMElCo4aOxLkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku9NJjyoGOfPEs+Enog9XNzGeghx18bucruuFJMm/eU=;
 b=TBYYS1Wlw4oHe9Kf25oYtZnrWd+poiM1M48t3orUImLuPQ9F4fhmrU8RSJwbCia+qB1Uy4SgDpJV3CyhnUEMIsOQEWLEYZdDTg0MdNEmE7fBTdoTk4L+0VeJVwFndYmrpR2ohyjV+KXEw6QyXSOqEZqvA0/oq+7Ay+5sxpFQk+sXGIvizS8vihJw149YCffYgfVen18Ywa3Rc1EF6PD1Hhk0gmz77WHRejks+rtfFRVJb/eGbPPz1fzd0TojtH8W/S4POS0DKPoW3x+6w8ezsmU/5cdtK4M6z+Y/aSBI+BLz4clSRFapHt3gXKplVfc8oPDwbXX79FIw+tN19Nzwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:24:01 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:24:01 +0000
Date: Fri, 28 Aug 2026 11:23:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>
Subject: Re: [PATCH v2 03/11] drm/xe/cper: Add CPER structures and trace event
Message-ID: <apGoDJkNRAmB1w2r@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-16-badal.nilawar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825175916.1103841-16-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 45802b14-c91b-4c6f-ff81-08df05186356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kOO/f4Pg6JqSUcPYH7opDRKVTYuHtLtCVEEzB/QppfmuXCUFJ1Jz//3vH9BNuieZ+fLSYEpdDSf+xlqYfxbWLDMaWyUYtZGYDyx7GnaK9dlABk+uTM6yv0r+mDmEolyWETZSUqBvqSx6rMk1uZw0KfgniFJFjK8BEW7r/PyyQ5RVczcUaK4yRMatfKQtJoJeid1QODGUQ9OLf1v0m9UixvvrVNQ9xbUAluPZfUZAHIwB4P07YusCpSXfVBy452PGeToRlkpBeT7/j2Z8r3lrqdkPpWJmx9av8tpJgZiOIu8L492gIyD5ZA4woehi4UFZclH4KvTr4Klh0vljtz0jp8WNuq9h57uIVpisJj2KOK6r3ni0KJf4OC2SbqBMV6zqevgkpIip/cx6J6mBQ9j2DksoWpUl+7u4diasM0mlNTKfgGvAHYuWN7Or/igseSrwUn+HA5qvMOdx30wwY6W6Pt4ukvDRYvWn2LyoCr3nfx825ASSYQlbrICUUBCFJFFEguF0OheurVWdm5bSzsU5NKQW7ALjHSMj2To8kS//uBe60FGtEyfCaGKVhHs8nfH+j7vawc4h+YbHxZVKCVeCmNrOMMTeQkjJP2ouMduj0T5wh2xchrnrKX7488N0ihCJPPYqLNGHXHvSSIMiocMSIIt/kG5WHlRz1kU0zlDu9YU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hwU1hmeTlSRW9GUzA5bHBKWmRIWkZEbDNaZ0tUTmNCenJJWDY2cVlhNlNo?=
 =?utf-8?B?NGtoZ2dmcUJFbDZiaXVIeVpscTVyYVJiWFN0ajBZdXRGWmlKUi9OcFo4TGts?=
 =?utf-8?B?OTJKK2x4bWhIM3lONnVFNHhaMzUrdzVsVlBqKzZZb3lRbmNiakU4OVYrbTlS?=
 =?utf-8?B?QzdxTTk2VXU5bkgvNHlCZlNJV1E3RXFoVkNFbjVzQ1hSMkxpOEZOdnVKRW1u?=
 =?utf-8?B?SXZmSU1zdzgza1FqSm5Cb0tGeVhJWVNMUG44WGdNcDBZZ2JxbGpQUElGYVpz?=
 =?utf-8?B?Mm4xT3cvRjk5RXVXZm1GSmQwQmZoTmtJamtNVTdmYUJ0NlNwdmZpMXVadVJp?=
 =?utf-8?B?cWc0Y2dxMEJiZ2FReDVnOTRYYXVqQnk0cGhLZjV4dFNCWGYvUVRTUGdjNHdI?=
 =?utf-8?B?S3hBVUdZS2xGcCthREM3QzhwZWhEVXd0RVdZc3VQQ2w2ZVRCN0pFN2tCUW5m?=
 =?utf-8?B?OUtLWnBKd1R4d1R6cW10di9CNG1GY2pBMGoxNFpSdUxqR1FSV0hhZjBNUUpJ?=
 =?utf-8?B?ZEJ2aWN2NlFIeEs3OTl6NTBHWjVXRGFYMk1uOGZhYUNuYmZWMi8vaG9lblIz?=
 =?utf-8?B?cithQzZRSWN5MDNqVVBGWmVKWi9mdlVNZHJHVTdNUEUyMGVsZEkrOHF5MkVL?=
 =?utf-8?B?Z1FvMXN2VGVuY2lPeWxmZ1Q2anp5cWlBQ3B6elJNREViTmFWMmkvdlFNLzRx?=
 =?utf-8?B?VXlXTWRsOXRYMGg4TWZwNXY1WWhhNTVyZDFJZ0FXa3diYXQ0ci9ROVlseVlI?=
 =?utf-8?B?MG9TU2x3cVFMWUxwaTVuU1I1N2tKUkhFb0pDUWo1TmY1UlFoNTFaSzg1SlJr?=
 =?utf-8?B?RnNGaEgxRWdTaUFGcXFUc2hmbGNFRnBLeWprOUdsaHBTNVRMVzhZa00vZVM1?=
 =?utf-8?B?RUo0dm9KQmN6V09sSU50SWxndm9IbkJRbGk4TXQ2aWNFdjNQRHpGRzA0Ujhp?=
 =?utf-8?B?OU9zajdWUnczUTA4azR6MUczbndiSmhrZk85S1VWWEtKeEVuRmZENjlyTHIw?=
 =?utf-8?B?bUM2cUdnWVlNQ1hGZmVKY0ZtLzhSMXdrb1Qwa1BrdGpNOXlYTWh3MHEwaEE4?=
 =?utf-8?B?Y3VvTW5tMW80QVBMalYwUDZ2SkhqZ09EL1p4YXYvNnY3dFpEQ29Qdk04K2Rr?=
 =?utf-8?B?b0w4Y1ZsdENSTFB5cnQ2Y3ZmSUFOV202UmhIT083OWhNakdRMGdBNXJNend2?=
 =?utf-8?B?djRZdlRyMk9wY0gyV2VVd1hDZnhRcEs1TkRFQUE4M1BvdHp3OEc2UHJtUEtY?=
 =?utf-8?B?dU1TOWFsVm56a2o5bEtpeFl1U2RaTEdKbTVlSjdVcEQ5Y0tGOWJONDhMVzc4?=
 =?utf-8?B?WExwTFFZTkFtZ0ZheVhXajMvL0hoN2FldGVFbG1FdUdOVTlJcVJLR0cxQ1Fi?=
 =?utf-8?B?bXRFYlYyM3RNN2cycldycWVZM2gxVFJNQ0J2K21jVlZ4R2ZPVDBoZE96ZG5m?=
 =?utf-8?B?dWIrTzhVa1hvakFMN3BDU1YyQ1AwekNWRFlhTU1EYmdySUR0M2JGSzZIL091?=
 =?utf-8?B?Yjl0dk1KdThqZlZMUTRucGR3T3RuTkFlYk1pZnhpSndnZWJSMHg5dUVVNGFy?=
 =?utf-8?B?UkMxR1RNeUFLbTljK2xuVHhFeXVtS2o0SEJhbU9VWnJMODJ3RjlsUEJpL3pL?=
 =?utf-8?B?WDFZTzhzRll2dHJUSDFxcFBUM2VQME9jMWJScXBndnBZd1VRaWhic0N6WlVq?=
 =?utf-8?B?YzJBWTI5TG9QRW5wVTRJMTRHQTVXSjBQbjByTlJBYWp5eG1CaUJlVW51czFp?=
 =?utf-8?B?aDVoUE9JRVdaYjlkZkdYZXlKNDBVRmdQRTZYNTFlbTVYOTZqalorRTh6eTNk?=
 =?utf-8?B?K3RIcVBRUjFuamMzR2s2WTdRVXliSUV2WUk4N2FOalhMMG4reTdCcnNNMDZC?=
 =?utf-8?B?UTZsTEpMRnZQalpWV0N0KzBXRE1mRFZEZE5IOWVWTmFQV1dSQ1hIZjJVN3Ir?=
 =?utf-8?B?NjNremk3aDY5anNTRHFVNEdtUzFic1hjUHZmU3JWeWpHelFXMW9kNEQ4TXBm?=
 =?utf-8?B?NEc4ajN6dy9wbENNYkordllGSGFlK2d6T2NaOGlnU0xUMDh6Tkx0OXF5NXRG?=
 =?utf-8?B?dVR3ZEpUTUMrdUE2eEtDZVpZRzJYejhONnFIZ2l4bDIwL0pHTzBRUkZNYXo0?=
 =?utf-8?B?aWRGS1Y1UWEvMExzNDZ6cW1HZ3NXbDREZWhoaVI1RVVDOHRUSnRtMHJhL2NU?=
 =?utf-8?B?ZjhSMXk2QXdLSkVsRkpyUEEzQjlhc2xjNThvZktWTDZoMkVRdDlRY2lWRVFh?=
 =?utf-8?B?QmlabVo0TWV2UERFQ2J4dXkreUJEdm92cUpSOGY0UGVoMGZORHhvdUEza2ZF?=
 =?utf-8?B?TGg0TGNXTjQyOVJYREFqUmpKbit2UWpKYmR3VHVXRk04SXQyak04QT09?=
X-Exchange-RoutingPolicyChecked: YCupacoRgprreW8ZPZRbQ+KrU2jh5FRXFRgMaFZ88c1M/R15C70tpVEPCIOhUt4jPbzJgHKAkh1q23Qfy0pbhL78Ly6QQBANpp79mAtLQoOrHoEAh7RKlbADKx/0M9eKljFOHHJkTBb9raqaxPGcvKGYoXwJhP1RGHdDl4UE/DHbYdHXjqjI5/6Z5C2WJQQPHCjCYtMiP1b2WljUGPrd4z3fayopJ9vshsTWTndbIKhGUx2uTTslPt00GV5owYMHEaqKppYJ0nv0wJnWr1oGSdCOL9CFz32Ys8KM0zRL2LxMdh5dI67nAlWn5Z0Zcl3DIQPij2QfNoYIlhtRt65oiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45802b14-c91b-4c6f-ff81-08df05186356
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:24:01.6930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkrOn6xCfHmKkFtfTVwMD15JeeH6sZxnTR5DBPC80bv+u2CbcrxJ7vhWogjWtb6o00ZoH8634UQ90aB6fZQrmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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

On Tue, Aug 25, 2026 at 11:29:20PM +0530, Badal Nilawar wrote:
> Define packed data structures and Intel-specific GUID macros needed
> to build Intel GPU CPER (Common Platform Error Record) non-standard
> records.
> 
> Add xe_error_cper trace event to log the assembled CPER record bytes.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_cper_types.h | 186 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_trace_cper.c |   9 ++
>  drivers/gpu/drm/xe/xe_trace_cper.h |  66 ++++++++++
>  4 files changed, 262 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 92134709d998..3ed60697f3f3 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -136,6 +136,7 @@ xe-y += xe_bb.o \
>  	xe_tlb_inval_job.o \
>  	xe_trace.o \
>  	xe_trace_bo.o \
> +	xe_trace_cper.o \
>  	xe_trace_guc.o \
>  	xe_trace_lrc.o \
>  	xe_ttm_stolen_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> new file mode 100644
> index 000000000000..82167ea4eb16
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -0,0 +1,186 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_TYPES_H_
> +#define _XE_CPER_TYPES_H_
> +
> +#include <linux/cper.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +/* Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
> + *
> + * All values below are generated deterministically by the shell script
> + * in the [Generation Script] section. Re-run that script to verify.
> + * Do NOT hand-edit the byte values.
> + */
> +
> +/* Creator IDs */
> +#define INTEL_CPER_CREATOR_XEKMD \
> +	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
> +		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
> +
> +#define INTEL_CPER_CREATOR_AMC \
> +	GUID_INIT(0x215803da, 0xfc7a, 0x5925, \
> +		  0xb7, 0x8b, 0x1f, 0xc1, 0x19, 0x61, 0x58, 0xd1)
> +
> +/* Notification Types */
> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
> +
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
> +/* Section Types */
> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)

Where all these numbers come from?

> +
> +#pragma pack(push, 1)
> +
> +/**
> + * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
> + *
> + * Fixed-size header for the Intel GPU error section of a CPER record.
> + * All multi-byte fields are little-endian; the structure is packed.
> + */
> +struct xe_cper_sec_intel_err_hdr {
> +	/** @error_class: Error classification (type, component, location, cause) */
> +	union {
> +		struct {
> +			/** @error_class.error_type: RAS error severity */
> +			u8  error_type;
> +			/** @error_class.error_component: IP block that raised the error */
> +			u8  error_component;
> +			/** @error_class.tile: Tile number */
> +			u8  tile;
> +			/** @error_class.instance: Instance within the tile */
> +			u32 instance;
> +			/** @error_class.cause: Error cause code */
> +			u32 cause;
> +			/** @error_class.reserved: Reserved, must be zero */
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @first_timestamp: Timestamp of the first occurrence of this error class */
> +	u64 first_timestamp;
> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
> +	u32 sig_id;
> +	/** @error_count: Number of times this error has been observed */
> +	u32 error_count;
> +	/** @valid_bits: Bitmask indicating which header fields are populated */
> +	union {
> +		struct {
> +			/** @valid_bits.location: @error_class field is valid */
> +			u16 location		: 1;
> +			/** @valid_bits.first_timestamp: @first_timestamp field is valid */
> +			u16 first_timestamp	: 1;
> +			/** @valid_bits.sig_id: @sig_id field is valid */
> +			u16 sig_id			: 1;
> +			/** @valid_bits.pci_bdf: @pci_bdf field is valid */
> +			u16 pci_bdf		: 1;
> +			/** @valid_bits.drv_version: @drv_version field is valid */
> +			u16 drv_version		: 1;
> +			/** @valid_bits.fw_id: @fw_id field is valid */
> +			u16 fw_id			: 1;
> +			/** @valid_bits.reserved: Reserved, must be zero */
> +			u16 reserved		: 10;
> +		} valid_bits;
> +		/** @validation_bits: Raw u16 view of all valid bits */
> +		u16 validation_bits;
> +	};
> +	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
> +	char pci_bdf[16];
> +	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
> +	char drv_version[25];
> +	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
> +	char fw_id[256];
> +	/** @reserved: Reserved for future use, must be zero */
> +	u8 reserved[5];
> +};
> +
> +/**
> + * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
> + *
> + * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
> + * is available. The @event_queue flexible array holds @event_queue_count
> + * packed &xe_intel_priv_event_entry records.
> + */
> +struct xe_cper_sec_intel_error_info {
> +	/** @error_class: Error classification (mirrors the header error_class) */
> +	union {
> +		struct {
> +			u8  error_type;
> +			u8  error_component;
> +			u8  tile;
> +			u32 instance;
> +			u32 cause;
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @error_count: Total number of errors recorded */
> +	u32 error_count;
> +	/** @event_queue_length: Total byte size of the @event_queue array */
> +	u32 event_queue_length;
> +	/** @event_queue_count: Number of entries in @event_queue */
> +	u32 event_queue_count;
> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
> +	u8 event_queue[];
> +};
> +
> +/**
> + * struct xe_intel_priv_event_entry - Single error event in the event queue
> + *
> + * Each entry is variable-length; @entry_length gives the byte size of
> + * @metadata only (not including @entry_length or @timestamp).
> + */
> +struct xe_intel_priv_event_entry {
> +	/** @entry_length: Byte length of the @metadata payload */
> +	u32 entry_length;
> +	/** @timestamp: Hardware timestamp of this event */
> +	u64 timestamp;
> +	/** @metadata: Event-specific payload bytes */
> +	u8  metadata[];
> +};
> +
> +/**
> + * struct xe_cper_nonstd_record - Fixed-size portion of an Intel GPU CPER record
> + *
> + * Contains the standard CPER record header, section descriptor, and the
> + * Intel error section header. A &xe_cper_sec_intel_error_info payload
> + * (with its flexible @event_queue array) is appended dynamically.
> + */
> +struct xe_cper_nonstd_record {
> +	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
> +	struct cper_record_header record_hdr;
> +	/** @section_desc: CPER section descriptor */
> +	struct cper_section_descriptor section_desc;
> +	/** @intel_hdr: Intel-specific error section header */
> +	struct xe_cper_sec_intel_err_hdr intel_hdr;
> +};
> +
> +#pragma pack(pop)
> +
> +/**
> + * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
> + *
> + * Used to resolve the platform_id field in a CPER section descriptor.
> + * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
> + * with name string "platform/8086:<dev_id_hex_lower>".
> + */
> +struct xe_platform_id_entry {
> +	/** @device_id: PCI device ID */
> +	u16       device_id;
> +	/** @platform_id: Corresponding UUIDv5 platform GUID */
> +	guid_t    platform_id;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.c b/drivers/gpu/drm/xe/xe_trace_cper.c
> new file mode 100644
> index 000000000000..caea8783ab7c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __CHECKER__
> +#define CREATE_TRACE_POINTS
> +#include "xe_trace_cper.h"
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_trace_cper.h
> new file mode 100644
> index 000000000000..6d2dbf504888
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM xe
> +
> +#if !defined(_XE_TRACE_CPER_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_TRACE_CPER_H_
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +#include "xe_cper_types.h"
> +#include "xe_device_types.h"
> +
> +#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
> +
> +TRACE_EVENT(xe_error_cper,
> +	TP_PROTO(struct xe_device *xe,
> +	    const guid_t *platform_id, const guid_t *fru_id,
> +	    const u8 severity,
> +	    const struct xe_cper_sec_intel_err_hdr *ihdr,
> +	    u32 cper_len, const u8 *cper),
> +	TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
> +
> +	TP_STRUCT__entry(
> +	    __string(dev, __dev_name_xe(xe))
> +	    __array(char, platform_id, UUID_SIZE)
> +	    __array(char, fru_id, UUID_SIZE)
> +	    __field(u8, sev)
> +	    __array(u8, ihdr_raw, sizeof(struct xe_cper_sec_intel_err_hdr))
> +	    __field(u32, cper_len)
> +	    __dynamic_array(u8, cper, cper_len)
> +	    ),
> +
> +	TP_fast_assign(
> +	    __assign_str(dev);
> +	    __entry->sev = severity;
> +	    memcpy(__entry->platform_id, platform_id, UUID_SIZE);
> +	    memcpy(__entry->fru_id, fru_id, UUID_SIZE);
> +	    memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_sec_intel_err_hdr));
> +	    __entry->cper_len = cper_len;
> +	    memcpy(__get_dynamic_array(cper), cper, cper_len);
> +	    ),
> +
> +	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU "
> +		"intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
> +		__get_str(dev), __entry->sev,
> +		__entry->platform_id, __entry->fru_id,
> +		__print_hex(__entry->ihdr_raw,
> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
> +		__entry->cper_len,
> +		__print_hex(__get_dynamic_array(cper),
> +		    __entry->cper_len))
> +);
> +
> +#endif
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_FILE xe_trace_cper
> +#include <trace/define_trace.h>
> -- 
> 2.54.0
> 
