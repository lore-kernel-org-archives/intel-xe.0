Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81DECD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 12:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8672F10E057;
	Thu, 13 Nov 2025 12:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Egt12W94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3A10E057
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763037574; x=1794573574;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Hek29Im+IdwyEn5lNwt61MgMHDwfPyWSNUmsAtoEM/w=;
 b=Egt12W94uU9n2lfAM5kRaSjQVLO1tpDYTRt4LHruIS239VOFw5qZudWp
 Iew2BeSco924lMC2x58x4cPPAq7NaIlZ2bgT+4p6eoJJav4S59pFIG6+/
 ux02ymwz2ESY90SB13EV6LQhhyA7vH85R/y9bJyRGG/0Uovo71KbilHr3
 JXqxQHsAk91o0fnEcpdW02mF2b+K6gTe8RaagNevdJ8lgtqfHSd6+EJs/
 4HKuZoFb7+OEoBzLBjuCytLMaCX96YwC9neBpSwpxU7xLQldq20HaI8M6
 nbjTEZclRFEy1M79jOLbC20M8Ft/2eXdiqgPJhWbi8Xh5IIKyafj+HmHm g==;
X-CSE-ConnectionGUID: GadYO1v7TMyO5orSWCLJGg==
X-CSE-MsgGUID: f5C8aXgnQPaMBxcnR00gbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65152155"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65152155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:39:34 -0800
X-CSE-ConnectionGUID: Gmfa1ogBRuWvuXcfNPXi1Q==
X-CSE-MsgGUID: i3JYXRdHSzW1StNvhGxaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189141280"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:39:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:39:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 04:39:33 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:39:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9pbWA8EX4jGccJd1D64vG7Nvm9jJak9hgHwznpvueeB/GqJrYDdmtVoA9c0uuvMleAvwav149QBvdC/V1xSe0KefCGrPK8E8QMG8JcxqeerBFgdT1misgZgaHzYzwgf5rp4B9S9cIn2QW5zBEaECqR5iyRjsQDiTxg39RNubqEENFYzMY3vfxi4ZfPs3RNN4z25lfgm7A0fJvd1B1dfMGuO+nXYGGEG2YNKiTZgsvs0J/sob/vF97/czLAieBYn11EfxP2Y1U26SA4Eyh2ynUQSKhdUtvRfxUeLv7BKyRpOT4vK+Az308abYR2tJwysT7KiLC/yu8kMcoP9+XlVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=290COkOAZ66KbNWbuS4Z4evblld4MqZ42uxvvmXirZg=;
 b=pCj7SdPYXkNiy22ulGxF8sUiJUaNm7dedQS0jXkydErDBfagtDV2AOvXiNPlLJ4k9gkL1IgzaBwPMMGxZ61AZ4PDwGHRHVMoayRLN6hXG1AXefkrzABPE7vVWP7ICel2yfOawlJDR+FqO0tVfJpEyxJOTsvI65D47uFUfkrq1S4K++8KduuKf+rxGVydiPbiQOiyXlqnQ/RrzNK3psJuNe/of4hXD49BlK/sjvh7wCV+/LJ9Q91IxDJGYL1E1z7I4KF0aUrnnL7KXGy28129W7PcGPpwMWbUg4w7BdSUOFWJ5P7o5GDKwQZWqs9/Q4qj5zYBnUEuvC5Oa8mk01Hjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 12:39:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:39:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-39-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-39-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 07/30] drm/xe/gt_idle: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 09:39:07 -0300
Message-ID: <176303754752.3698.16791433923735329173@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3d1f0d-aaa6-43b6-3965-08de22b1acd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG5wSlNMd1pYWWcxb21MSVF3Y3ZzM0ZQM3VtL212M2I4UmJaM2xaM0FoZ2ZC?=
 =?utf-8?B?SUh1YWZHdFdhMjhXd2VYWU5YckNPR1NCZzRPWHNoZzYzZ21PS2VEUEFQUjdy?=
 =?utf-8?B?aW9ScWRzQ0d2dUl1SW9jdnhJYjlNSjNTM2d6RzcrczFndjhtSHJBZCtPa2Fj?=
 =?utf-8?B?cFk4Q0taT256Tm9OR1ZCUkpJUDNaUGVhVzQvWUJsYWpmeklGM2RVK0RoZmVV?=
 =?utf-8?B?bXpNeDFabWNnTHpVUCtZY1c4czk4aXJoV3VJSVU3cVJLckxEQ0FZTUJaY0U4?=
 =?utf-8?B?NldNaW9xNVExV3FlQ09LcTF5ZGtzSTUyRExtSHJvbHVtS1JwOUJPQ29BWTJF?=
 =?utf-8?B?a0pwa3FzUml2bE1vbXlDUzZUVUhjUnU2cEZPUkZ5WUVOWlBVanlDUGovdFVy?=
 =?utf-8?B?Tll5Mlh4anBBdHFxcUNlb0toMEh4bUF2M2QzNzFMTW42OFZlUGowRXdocUFE?=
 =?utf-8?B?RjJ0RDZieTVnbnBsaWh6NkVNVmVFV29UZFE1VkVVRzlDNjlJak9ZcWdSOXdD?=
 =?utf-8?B?RllEOEo1bHkxVG54ZXIrNFFsMGJKRkdoYitUQnFzQ3ByMElXV3pUcWV1MFBw?=
 =?utf-8?B?S1BLdmxKelJTQkxrU0JBek5ES3RDYk4rczRFUXoyMGZrSXBBMmRqRHU0QWZV?=
 =?utf-8?B?WWlzcXdpaEJPYjdBcG5jNmNjNXljcDZZNzRsRFNZMnZUSWZaaXZIejE0OUdW?=
 =?utf-8?B?Z1R5VG9sbERjMzZyYjdzc2hORURadnpab3dGU0dOLzA3Z1pkRHZWajlFSUxG?=
 =?utf-8?B?WkN2dHVYQXRWamlPcFdhODlWOTN2bFJOQzIxMWVsbUtLYkJQbUswdlV4TS9Y?=
 =?utf-8?B?TlZOSzVRK1pKRzMvdXBDYnIwaUpJTFlOeHM2M1ByUmQzTVFYUms0T3lxS2FG?=
 =?utf-8?B?WUxmL2hPbjhkRkxoT2ljZE92T1ZoTWZoOTZ2MTQ2VUVoWTFyZkY2cFo2OXNr?=
 =?utf-8?B?Q05IdUQxNkU0RVZ5TWlubmJTSER4QlEza25EMXVEcEFlZTVFeEYrUjUvYlNB?=
 =?utf-8?B?dUx2VWhsa1hLaG5aT1I2Q1ZjdmRzSWgwVzhWMFJqUE9mUWFIclhrZUQ3dG54?=
 =?utf-8?B?RVRJUld1Umo3RmhPeEt0M01OWmJXc2lKanVKbGVjS3J3dEdPSmRjOTVnaUhL?=
 =?utf-8?B?MU5odE9jbTMza29tRWQ0blZOZXIrYitNbTliS2xFZEJJNkRWcnVlVENRbFF2?=
 =?utf-8?B?QjcwWXNwaHIvOGtyYzViQTBLMzltd0FXNjltdkJDV285WktuMUZuaG1QQWJC?=
 =?utf-8?B?RVRQck5MRnYycXd2OUlyNTVxOHlLT2pMc3ZrR3M4RkRPT1p2QTRMS0xkNVRD?=
 =?utf-8?B?ZFNtd056R1pEOEFJMWlmdGxVVWxMU2VnWng1UjVIRHMyenV3RXhtWEo5a1Z2?=
 =?utf-8?B?UUlUZncrc0JwM1VGRy9CVldQaEd5bk84eHlvUTVXMjE0bXREaGRPSThSNnJB?=
 =?utf-8?B?b2Z0bjdndTU5WlBNSlRaSk9oZEdtL3AwRGV1T3lhTmphNzc4Q0JMOWw5Wm1I?=
 =?utf-8?B?UVc0eDZEQ2RyMFUyLyszem4zaTk4SHd1Ym82M3UzNy9GTUU4WHNBeisxR3dy?=
 =?utf-8?B?QVd0WnBTNFJDSWhpMUtCQ1ZGUTNady8vSEZtLzZWMTZ0ZUtLY3Fkenl1c04w?=
 =?utf-8?B?dXViSk8zVjJYdWNxRWM5clB0bWtueklSSGo2bk40dFQ4RDBJNHhnTjdteEZD?=
 =?utf-8?B?NElhcjg5VFFLcmRpMlROb2FVTTg4MG5EdStlUTU4dUJ0RnROQXphTExXcmFV?=
 =?utf-8?B?d09DZHhCcGNlby9ZcFpIRzdDVU8wMFhVOGJTNHppTURJUk8vOURpQUtzQmUw?=
 =?utf-8?B?MXVEaHh0VkVtMTczdGpPUlJ3Smx3czhJaGRIa0o1OTBlTytqcUdzQkJRb0Zh?=
 =?utf-8?B?Q09FbFN1dW14a0o2NWxpTEJOSUxnRm43Rkg4QjN5NDcrRnlvUVY4UnA4YjFQ?=
 =?utf-8?Q?++k7Fgp+HcEr6d86KEtc52lfIayndbC4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHlzWTJhYm9WOGRidS8yL1RDK1R5MDAxbUVHeGRkVCtGcktjK2NwZXcyZDMx?=
 =?utf-8?B?TTh5cndnUjJYTUJ2L0c0eXF3Ri9TSzZpdmdXQTBGMHYwYzMzT25rT3BHNU1x?=
 =?utf-8?B?K0FTMitjN3BRR0tPQmNwNG80UmFsa3BHL3ZTRldIZUttcFpGL2VIcUNTL2NH?=
 =?utf-8?B?UDZzTFFUVFZMRUFFTTVGZWppUGxrbkp5cnR2Q0Z6L1VmN3I1SGtEWFk5aVMr?=
 =?utf-8?B?NGptSGVhL0xlQkxhYUpITzdZOTlSS0ovcDFyRTRoYnlxTmE0VGw3Zi9TeENh?=
 =?utf-8?B?dmhieXhXK3pzZGVKZmErbkljckpXV2lqdHdaUklzdERNbEcxbFpwU05LOFhs?=
 =?utf-8?B?cTlDTkhIY0RBWmdOelVncXpNYXMzbVp1djRUanpDK1RTdEtaS3l2TDhvVU45?=
 =?utf-8?B?Yy9jL2tMK012QU5DUm1BYTJEVzE5RXp2cUZTWVpKUVJaY3ovb05vUXZNb1BX?=
 =?utf-8?B?UGhhWlpENk1ReG45YVZOSTE3aTZGTXNvUTE0VnNqZ0JsWkdDbzhhWWRCVWhE?=
 =?utf-8?B?S0RqMEFMaHFjclEycXVOV1VCWlZ1TWhJY3lIR3RCbU84bXU4c091L0hOUHhx?=
 =?utf-8?B?OHVQVmtMaENhM21qNFBpNjl0eGVreVR5T0EzeWMrTTlVUHg0cks4Q2FKYkE3?=
 =?utf-8?B?NlYxcjJkVjh3WTZqQnFtZ0xoUWdlL1dCNm9mcDUramdsejg3WnBxNTlqcFcw?=
 =?utf-8?B?RjBYaTJxS2lsYVIvNU5KeUl3MnQ3UDdDcjh6TlQ0aFdTVXFCT1NxNWlSTW5I?=
 =?utf-8?B?bzMvWGo1em9oUjcybndZdGRERnVNdVV1MGk3MkdLdHJjcis0cUZzOEpQdUFq?=
 =?utf-8?B?QnFzekk5eWxJcWxKMVNkTVFVaWQ4T0s3Mm03WnVnMDY3MGZHT0lndzZQWUNy?=
 =?utf-8?B?dUErTWl5OWxGbERUeng3NmFqVTNOemxiMHJBclBpZlR1c0RPaW1JSjdrSk50?=
 =?utf-8?B?NU8rQjFkbGdlSzRXUDRKVmRuZWZ6ZU1YZUtCbWpkMXd5bVB6ZnJMUXZsRGxs?=
 =?utf-8?B?U3cvSGh1UnN2Vi8zbHN4b1pTYkxxeVhkQXBOUWp3dFFrS3Z4VkYzbmcxbm5i?=
 =?utf-8?B?MEhNUGp6dG45QVlWMVZRWnBiVE1SRGdjTGUxWW03UmY4bHFOOHNrWHZzc3o1?=
 =?utf-8?B?WldIdjFlNDNjSlE4YVFoZ1IyS2tpY0IxWXhzeW44cmZDNE05U0thV2NrWjB4?=
 =?utf-8?B?d2N4aVc2Rk1YQUc0UkV4M01RcUkzdnNOUFg5dW1rSWhzY3kyT3ZFNk5LcVlP?=
 =?utf-8?B?cGtYV2grNmVodXljZ2ZoN1BlempRMU52MVRFRC91WnNHalhVZEhNYnl2Rmth?=
 =?utf-8?B?dUpZZ054ZTBmdWJ5bXh1eUx1bHNwNGR0VnRPdkFIcWM5YkRmaFNzY1J3dzFi?=
 =?utf-8?B?b0RrTWtRRWJ1NnBJT1hRd05LUVFtQUV5NDRVbkZVQWF3cFVmNlJjQjk0SjA5?=
 =?utf-8?B?NFBhbGREZEZWZ3JDYStsdzF2Y2Z5U3FZVng1VGpqZDRXd3EzRXlXbmErK1E0?=
 =?utf-8?B?QXNPVnkzV3NUTWhlT1BDbFBUWTBTK3RQOEJVQ3FTRlF2d0lPcGdPM2tLQVVB?=
 =?utf-8?B?STdEZmpmVk5UUWdQUVZSVldQQUFadjN6ZXo4T2dGZHVOTmNCUDhtS2ttVUMr?=
 =?utf-8?B?d3pUUkRUVjB5U3A4U3FMV1RZSk14elcwOWQyazc4UDdReVRXc0diZVhEZTNS?=
 =?utf-8?B?cFRiTmk0MHJHcEdHREFrMW5xektadnhSd2pRNlBiWWhxREJEL01scUpabThX?=
 =?utf-8?B?cWpqelBSM2IxbWdRajEvVFVOcHMyNU1XTnU2RTdySXgzTVdUL0luNjUyaHpG?=
 =?utf-8?B?NlBTTWtHY3pkVVdZUTREYS9sbHpTay9zWm1yOEhtbzRiVjhlRlFzT2xoY1FB?=
 =?utf-8?B?RnRCTHRBV1Bkd3lCc3RoaFdCZ3BSaXF5S2NHTWVzeHlrNVFIMzhwandvNUdN?=
 =?utf-8?B?ZHVDcmR5bGZ5ZWVMTEdnMVEwZEozMUtreXcxSFNYM2tpdDRaRGxkS0M0L2RJ?=
 =?utf-8?B?QnljM1JCU1RtNnZTNlRGQ0lvYURQU0xtYm5SQUxrYXNwSm1ZaWxPdDJINVBx?=
 =?utf-8?B?bldpQ01nRElLSmZYZUg2MUQwQmFIcENDNFR3QTlya0dIc0NEanhKdG0wdkFa?=
 =?utf-8?B?UHlqSDNyZ2FFRk4zVk00bzBQOVU4cHZTRjlUV21BSkRaSE1NYWc0Zjk5ZzRq?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3d1f0d-aaa6-43b6-3965-08de22b1acd9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:39:23.8794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5RefXn+CBA0tf188I11TRv9LA53/IM8lN5lDl9sP3bLb0K39ek2K4CktzbjOFYUvKp02qjAV7csjG1jxhwk4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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

Quoting Matt Roper (2025-11-10 20:20:25-03:00)
>Use scope-based cleanup for runtime PM and forcewake in the GT idle
>code.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_idle.c | 32 +++++++++-----------------------
> 1 file changed, 9 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_id=
le.c
>index bdc9d9877ec4..6a63b7ad69a7 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.c
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>@@ -103,7 +103,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>         struct xe_gt_idle *gtidle =3D &gt->gtidle;
>         struct xe_mmio *mmio =3D &gt->mmio;
>         u32 vcs_mask, vecs_mask;
>-        unsigned int fw_ref;
>         int i, j;
>=20
>         if (IS_SRIOV_VF(xe))
>@@ -135,7 +134,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>                 }
>         }
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>         if (xe->info.skip_guc_pc) {
>                 /*
>                  * GuC sets the hysteresis value when GuC PC is enabled
>@@ -146,13 +145,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>         }
>=20
>         xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable)=
;
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> void xe_gt_idle_disable_pg(struct xe_gt *gt)
> {
>         struct xe_gt_idle *gtidle =3D &gt->gtidle;
>-        unsigned int fw_ref;
>=20
>         if (IS_SRIOV_VF(gt_to_xe(gt)))
>                 return;
>@@ -160,9 +157,8 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>         xe_device_assert_mem_access(gt_to_xe(gt));
>         gtidle->powergate_enable =3D 0;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>         xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_en=
able);
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> /**
>@@ -181,7 +177,6 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_p=
rinter *p)
>         enum xe_gt_idle_state state;
>         u32 pg_enabled, pg_status =3D 0;
>         u32 vcs_mask, vecs_mask;
>-        unsigned int fw_ref;
>         int n;
>         /*
>          * Media Slices
>@@ -218,14 +213,12 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm=
_printer *p)
>=20
>         /* Do not wake the GT to read powergating status */
>         if (state !=3D GT_IDLE_C6) {
>-                fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-                if (!fw_ref)
>+                CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+                if (!fw_ref.domains)
>                         return -ETIMEDOUT;
>=20
>                 pg_enabled =3D xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE=
);
>                 pg_status =3D xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_=
STATUS);
>-
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         }
>=20
>         if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>@@ -265,9 +258,8 @@ static ssize_t name_show(struct kobject *kobj,
>         struct xe_guc_pc *pc =3D gtidle_to_pc(gtidle);
>         ssize_t ret;
>=20
>-        xe_pm_runtime_get(pc_to_xe(pc));
>+        guard(xe_pm_runtime)(pc_to_xe(pc));
>         ret =3D sysfs_emit(buff, "%s\n", gtidle->name);
>-        xe_pm_runtime_put(pc_to_xe(pc));
>=20
>         return ret;
> }
>@@ -281,9 +273,8 @@ static ssize_t idle_status_show(struct kobject *kobj,
>         struct xe_guc_pc *pc =3D gtidle_to_pc(gtidle);
>         enum xe_gt_idle_state state;
>=20
>-        xe_pm_runtime_get(pc_to_xe(pc));
>+        guard(xe_pm_runtime)(pc_to_xe(pc));
>         state =3D gtidle->idle_status(pc);
>-        xe_pm_runtime_put(pc_to_xe(pc));
>=20
>         return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));

For this and also idle_residency_ms_show(): I wonder if would prefer to
use scoped_guard() before calling into sysfs_emit()...

Anyways,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> }
>@@ -311,9 +302,8 @@ static ssize_t idle_residency_ms_show(struct kobject *=
kobj,
>         struct xe_guc_pc *pc =3D gtidle_to_pc(gtidle);
>         u64 residency;
>=20
>-        xe_pm_runtime_get(pc_to_xe(pc));
>+        guard(xe_pm_runtime)(pc_to_xe(pc));
>         residency =3D xe_gt_idle_residency_msec(gtidle);
>-        xe_pm_runtime_put(pc_to_xe(pc));
>=20
>         return sysfs_emit(buff, "%llu\n", residency);
> }
>@@ -396,21 +386,17 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>=20
> int xe_gt_idle_disable_c6(struct xe_gt *gt)
> {
>-        unsigned int fw_ref;
>-
>         xe_device_assert_mem_access(gt_to_xe(gt));
>=20
>         if (IS_SRIOV_VF(gt_to_xe(gt)))
>                 return 0;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
>         xe_mmio_write32(&gt->mmio, RC_STATE, 0);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>         return 0;
> }
>--=20
>2.51.1
>
