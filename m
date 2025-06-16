Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031F4C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6CA10E031;
	Mon, 16 Jun 2025 07:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6QLgOZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9953310E031
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059203; x=1781595203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=asp5YAvhE1ZqV5URyceHKBfhLlgr61PHKm5n5RElQzI=;
 b=j6QLgOZ96cNSWp909fO/9rxhjzRi9fIBt/Fu075UziNt9BFVHRpuk5fT
 Cyrf499T4fEu9H8VH/P9JlXWztWC5EYpzNk4CJyaPC7FkBXHa5vcR28TF
 pTesdxcXWVvpgbFMiDPNUVlh2il0BFDNeSGysQCjCdWgHar+5wC5Awusd
 nl/0dHGWtgpBbOiGQxYvaON2dpP7G1AfSPJhGJ9+gOQ05ZgK0MBTZynG8
 FVx16iZBvI3bJx5mGpu+qzCQthHK8vxXUkcR8DK54FCFrQib5WwdiMjRN
 /ve0qVyTKasW9LW+Qx8GwJoGtLf4sODMfhz3jYkKE7PZa/JCU26gwAXmx A==;
X-CSE-ConnectionGUID: QkU8ZyuNQ8SFT2VKDEeZfQ==
X-CSE-MsgGUID: viJQ/+NjTVucEoJU9UG2sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52175787"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52175787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:33:23 -0700
X-CSE-ConnectionGUID: KY3CBjWMQBaxbLdVBXymig==
X-CSE-MsgGUID: Gka+e3dmTzWFLI+6KmsH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153267469"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:33:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:33:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 00:33:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOOhU+PpnIGjBfEHepUAjf5/9fmAcSD+Qc5zOP5DH1ZQnPpNy7JkgRF1Y1+4L2Gn/H8nX1lKOiV2/5I47XMPs0dYJh58AK7sC6Xy/4gEU9QK9eOLyQNxZTWFCWBBnWpK7F73uCvpjcqU+dfcL7tnjXk4mncHKHAxNAsj3JiQEzVeFRMRqS2RL0xeHPvyyT7DMDrSggtHIPcZqW0I0m22tzvKm7Ld73zJBIolEYR73Dbz3NyDXvwHlz0GDyVl9e02Co6A90wzK+mf3PejNPDJ8BEiu08x4ZyA/JrJ84hI3vllhR9OkNdQ3vXfWeOFweEQWiMM1BVvz+zniSMM48md6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE1h4Ms+W0cV//ZRrHtU/8MDIKNsrg4fnB6nxi12zmU=;
 b=C35/CicG44q/zk3QuKalOul3Gx9p2gyXLSXLrgjG4xxotLlYWL85BU0/TG2kPGygGy9X/13d5FVqigCLapaTgKnt1bLcupwlC2XlJlR1E9g1VoyOq5IhAab2hSvw0u8gGaheIbSujhPGSCRrniRq8mOqsej+PFB1J7lvz1F1dm9uh7yWCKQfsiiE+O0sgpKfFkz+1ZW5ftBH9bi66HlvLjmlW9/QuTReVrBk674R0nEHuGV/WwwAISZolbISYiwzRsoO2itLeLJI0ZyiTS6XO9Nw8WgC5uOLHSoQY5ISSA7ugW18Ij1ZHlVqajS7ptiuvKI5CfEBJWOgZErHworvOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7406.namprd11.prod.outlook.com
 (2603:10b6:8:136::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:33:16 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 07:33:16 +0000
Message-ID: <a7284910-025f-4938-8cd7-02451a0f16f9@intel.com>
Date: Mon, 16 Jun 2025 13:03:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-3-matthew.brost@intel.com>
 <6c3ce96c-7817-482d-835d-3925b9b52111@intel.com>
 <aE/I4T51X7GYc7ZE@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aE/I4T51X7GYc7ZE@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 430fbd73-7e6d-4e10-3db4-08ddaca80ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnlJSXMrSkJNVVFyRm1SZHJrOS9rbVZqLzU1MTNBN0dSKytuZFhwMnF2RUNX?=
 =?utf-8?B?NHNRWFJkN1JTTHA2RDZ5WHpoTUhnVmxQdkJSOE13a2xDLzJEUmVRUy9vRnZ0?=
 =?utf-8?B?Mk1ZdFQ1eWNiVEdlNXc2MGVPVFFQSWJocWNPLzRqUmdrUkcxRXJqUUd5M0h4?=
 =?utf-8?B?TTN2dzNwUmJtV21JbTlPYW1IQUNRRXZPdkFzaFVpU2p4M3BuL01sOFh0TGJ3?=
 =?utf-8?B?ejh0VloreFM4VDFwMXlkeElxK0F3anp3U21hVi9jV0J6ZTVSUGVkMnlEY2M1?=
 =?utf-8?B?K3RmSGJ3djhLQTBpakxMNE5mcm4zNTI1TzhrN1V1U2NlNGNsd0hWN2UvSE5S?=
 =?utf-8?B?MmFjYWRhVXRFdEFUbmRmbDQ5eXZubytoOTh5QWRkRWhraEhjdmtkb1BESkNE?=
 =?utf-8?B?WXpTb1VNNGtJZUVhb040VmhmOUNMVE9mdUx2a0taNXpWUXRKbDlheXFPVWxT?=
 =?utf-8?B?N3p4SjlIeTdIam5LczZjNjRmMUdzakw0ZXhIVW85QWNFbjZmTW5RbkZqcXoz?=
 =?utf-8?B?dEtVK2VsTWtTaGRXVC9hWTI0d1NpT3RjN0JQRUJYd2lEVUo2WGxqTzNVMmNZ?=
 =?utf-8?B?d0tQRWd6L0gzTjR2K2RGZjREQmZoUi95YkNvK1pBL1VpU2J1M3hNbWViMSs3?=
 =?utf-8?B?eUp4bGJORXpSWTZ2N1VjVUpvUDlTS0doaW84OTloWE80dnhZNkEraG4rL3Bt?=
 =?utf-8?B?dlJJZHdJQTNFNWdwV3RFbG9zQ1hJeFZTVmg1RGhNa2FWMUg2eW4rbUZSYmtZ?=
 =?utf-8?B?eVRSdkxMRVh1dG5sNmdtQVRSWUxVelVibUc3MUpudTV0WDVaQXpHNGZrcEVH?=
 =?utf-8?B?WHRoU0E5SFdZTHpwSWJtcUpPa3RuK1BGaE02Ui8ydE53NXBUMWFOblZvVXVy?=
 =?utf-8?B?RVU4RTF0ZjhyZUQxUkdHZGVWZEpyMUhYM01iM2lQdlhYazFQV3BZaCtVd1Bj?=
 =?utf-8?B?Z2trYXFrc3lPaGlHeDdFQVh6b0orL3U5ZXVYYWs1STVSZUFHcDVUL2E2aG9B?=
 =?utf-8?B?V1pPOUVXT1Rld00xVHdCRmRaNUlrOUdJRDZQK3dpL3pFenF3UWQxYUw3YnlV?=
 =?utf-8?B?R3R2Q0w0S0hYM2dPUWpVdUtiMkFkTS90Zk9tSFFyc2UyK2NITHlSRXdUdFV2?=
 =?utf-8?B?Q3EzWTZTM0RHQTNFcUN1WmxtOUVEWFRIOXlzaVFtdklUNDQyRXlPRlA5cDlT?=
 =?utf-8?B?VkNNcFJQTjgwbEhvN2VDYUZVMHk1UkxPSTlLUFM4MzJmblNMZzFXOEpYOHJa?=
 =?utf-8?B?N3RTZ0l5TlRIM09vZzBQNFd2dldVSFdUWWlpc2d4SE1kaUZ5cFlibDhFU1Ny?=
 =?utf-8?B?ZVl3TnlwVGtoaGVvbHFWblIxT3RBMDBHMENiSy9tZlFsM1piaFdNdkFsRTFa?=
 =?utf-8?B?MVNCN3krQ3RvVVU4RWtuckVNbG9YUFpMbzZTZlpDekRUQkVLbFVaUGgyMFdi?=
 =?utf-8?B?R29UdG5zNDVpUU5jWXp6WDZRM2VmY3ZDM3BEQ0VDTkVpNW56Nmw3aW1uU1NM?=
 =?utf-8?B?TExLNEZiTlZtMmVoRWY1cEVkU1dNUTIvRTJEaE92NU00Zk85S3JNUDN0ZlFD?=
 =?utf-8?B?NkhzZ2E2YllNd0pUaHJ6eUhVVkFqWnc5N2p6R0ptcUR0cXdyMHZWNFlkWWZl?=
 =?utf-8?B?OEJYamZNWjdKQ3E3ODVuM3ZTSThiUUhsZVZla3RMMVFzZlF0dno1OXZYaFlB?=
 =?utf-8?B?bEttZ0RwMHI4ckxUaHBhcFNLNWhzWUUzd3B1MFJ2V2J0S0krWlNEbnRZVlMv?=
 =?utf-8?B?dCs3cm5OZlV5Zkd0VXljQXRZMWxxbk9qL2dXQU1WMVRTWG1xaVM5Q3lEWm5l?=
 =?utf-8?B?dkR1TWlnL2piVGdWMm8vUXNrRmhrQUV3RXROMHRsZFZ6K0ZsL0I3SWFyZWFO?=
 =?utf-8?B?L2pTbDB1TzY2cnE3ZGM1MWZQeFYvS25iNVRPZ001UjBrRytwRFA3dnpRUTlU?=
 =?utf-8?Q?nbFtCRJ6i/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElMOEpHOUVPdHRRVGVXazRkQ0kra21rWHppSXNjNUJtajJFRkErWFhvM29F?=
 =?utf-8?B?TDBmcGNrekJmVkFuKzJLa0IyZlVWNVZFVXVxSUY5MGtoWE15Ry9mWTV0Rld3?=
 =?utf-8?B?THlaeDdRSlRZV3Fwc1YyVk9uLzgzMHZ1NTh3YjFzMGUxMzFWS0wwZUhFeWsw?=
 =?utf-8?B?c0ZqdmgzL3pxekZYV1cyVUx0ME1lbXo0VkJtK0xNWWRrMEduZEJLZUdEY3Nh?=
 =?utf-8?B?Wm9UOTZ0RzdER1NBYWR4TTJaN3M5b0kwcjgvWHBPVzc1Mzhkd1RrbUZmL3dP?=
 =?utf-8?B?MW95bTF3YWpCSzNIZGo4dk9nbksrbndyRGgvMUF0YWpaRjJ5dlZybHRwanhT?=
 =?utf-8?B?TkoxTVpidTFMRkJudytmOWJPZG9kbHVHa013bWpoL2x3bmNzdEp6V1lBejB5?=
 =?utf-8?B?em14UUFHMURNK1hsbjRraHpNT3MzYUVzZnB2TENwc1RYRjNLOW5FSzVncHdn?=
 =?utf-8?B?cTVvdllWQmtjVzJqeEVUVEFSdklpalpHNGt2cGM1eXZtdmowdHcwUGoxUHVW?=
 =?utf-8?B?S2VnQ00xckxxN1N4NUEvaXd5Z0JSeUNBK0FmUDBmM3VkSE1YcWJKQi9sMS9u?=
 =?utf-8?B?L0dTMzRMYnhzYlo2cG55OS9Wd1ZHdnd2cG1sWmNaRU5sbmRuWG9vNTRIcmNn?=
 =?utf-8?B?ZnQ0ekYxQWk1NjV2NzNJWXJ1V0lUQmFnRWJCNXoxbzF6TDQ4dWNsVU9iRzVn?=
 =?utf-8?B?V3lUa1hsa3lOZUNaOTk3UmNCMTlva0V0eXZSUE9BUnFUSm5VTVhBYVNhR3dl?=
 =?utf-8?B?L1BnRWtpQi9qRW5pc1JNdW5JZHpka2VLcFFTc2VTa1hlSFp6bGQ5QW1UYnpq?=
 =?utf-8?B?ZDltRWhENjhXVlplVFFQVlVxUUtPTm9WNit5akxzL3lzZlVWZ2xpUStZM2pV?=
 =?utf-8?B?cGliZU1RcmM5Y3BxeDJvUjVGUkhpNWdESVJSWk5ackFYWnpac0drbzQ4YzF2?=
 =?utf-8?B?TjZTWDBmeXcyMzYwbXZsekptQmtLTFA0ZTNPUzN5WGsyT2llcGZwZGtRMlJj?=
 =?utf-8?B?QWdVZDJzQytRaGdrMGhwSzVpMUFjRzAzQkxnZlo0emo5MEVadDd4b29tZUY3?=
 =?utf-8?B?cTZyVXEvUjY4OFRyUFAzZXlVSXppSTB4WUh4N1Q2NHkwbldmSFZveUpXVy9J?=
 =?utf-8?B?L0VuTFN0SmwzSHlKYUVGRmYzMkhTOG82QkRyNFBoc2pJZ3d6M241V2dCNFN0?=
 =?utf-8?B?Y1hRUzk5VXhhSWJhMkdCclV4WFBxWWhqaVdNd09MaGRKZCtaR1JFWGN4VTNC?=
 =?utf-8?B?eHZoWTU3bXh0azlBdGFvNDRWZG5obTFNNnBuazR4T1FDNzUyc21QOHNXSWdI?=
 =?utf-8?B?ZzRtODBzU2drenF5TUpaZElyUmNpQ05RaVlOWWRaV3ovUVQ0Zkt2bHFwSllu?=
 =?utf-8?B?N2dNOHcvZ1UvaGQ3TWo3N1dtMXlMRjFsUUJXd2o4T0xENm1JYTFEUzQzRFJa?=
 =?utf-8?B?NnhsQ1N5aGcwMk1ZTEQ4SW5zdS9abjJTZ2dKSm1OcytSV0w1c1phTnhnLzBK?=
 =?utf-8?B?aEpJOG5PRkJCSDJLSXd3VkZlNk1NdG1rL2U5UXhZMWdvVVhrUCtGNDlGTmRJ?=
 =?utf-8?B?U2QydE1HSHdPMnU1Z1lBb1BFMnI5TElQUzR3RThYM1oyNVNubVNnNjRBYnVY?=
 =?utf-8?B?d1UyWkw1UmhCZW56ZGxSTUVPcFMzT3lBRE0vQ3FPYUhJbXNRTFRrUm4rME1M?=
 =?utf-8?B?OXEyRkZRYllETW5EYy9aUUZPMzY0Y1ZJWG1YVU1XRjMyT1NkZWErVFZUTVNx?=
 =?utf-8?B?ZHFpVmMvUFVSSXZaN2xqN3A4MDZ5Y1JDaUdid0pvQTdxZmU2L2ZVYWt5THlW?=
 =?utf-8?B?Q3RYcDdNaWlEbStCcDF1b0x4dUR3dGhKb2hySGFBcDRQU1lTTnFVd2RDekpa?=
 =?utf-8?B?eXdWMDdtdUYrbWJEOG05N1ptbTEvYlcyN1VWWU1ZTEEycmxIQVBLRUY1ZWlH?=
 =?utf-8?B?TVA2YnM0WjhNVXZtQTlYN2YzRDVmRzRna1hyeDVyWVBoOHBBWGNJUkFNbHpG?=
 =?utf-8?B?TmRYditZQ3dqb28wdXZBcDNwem5GWVJYSW1DQ1JrQzZTZkhnK0NMeXZDY0lw?=
 =?utf-8?B?MGZxS2x6RnFPWk02RTZ3cUFqd3JKcGNkdTBHS0FrYm5rMmR2ZnNDSWErejB3?=
 =?utf-8?B?OE8xZ0hHVktCMWVYLzVRRHI4L0gyeGl3cjN2akEvVWZ1alE4WTlwK2tvZjhu?=
 =?utf-8?Q?2zCSCTJGKuXx72tPe3CLxUE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 430fbd73-7e6d-4e10-3db4-08ddaca80ece
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:33:16.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdGjNeJ+MGdQ5mDMm07oS2KlkYHxV7tMewwosJpg2lS4TIdjKirLLdYEX9W9nCy47HfQHyOOWWqJfIFo5OLmSn228vkXg7zx0mImY2zGsdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
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



On 16-06-2025 13:03, Matthew Brost wrote:
> On Mon, Jun 16, 2025 at 12:44:38PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 16-06-2025 12:00, Matthew Brost wrote:
>>> If a range or VMA is invalidated and scratch page is disabled, there
>>> is no reason to issue a TLB invalidation on unbind, skip TLB
>>> innvalidation is this condition is true. This is an opportunistic check
>>> as it is done without the notifier lock, thus it possible for the range
>>> to be invalidated after this check is performed.
>>>
>>> This should improve performance of the SVM garbage collector, for
>>> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
>>> ~20s to ~9.5s on a BMG.
>>>
>>> v2:
>>>    - Use helper for valid check (Thomas)
>>> v3:
>>>    - Avoid skipping TLB invalidation if PTEs are removed at a higher
>>>      level than the range
>>>    - Never skip TLB invalidations for VMA
>>>    - Drop Himal's RB
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pt.c | 31 ++++++++++++++++++++++++++++++-
>>>    1 file changed, 30 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 9c30111e8786..b6df8995e8c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -1995,6 +1995,32 @@ static int unbind_op_prepare(struct xe_tile *tile,
>>>    	return 0;
>>>    }
>>> +static bool
>>> +xe_pt_op_check_range_skip_invalidation(struct xe_vm_pgtable_update_op *pt_op,
>>> +				       struct xe_svm_range *range)
>>> +{
>>> +	struct xe_vm_pgtable_update *update = pt_op->entries;
>>> +
>>> +	XE_WARN_ON(!pt_op->num_entries);
>>> +
>>> +	/*
>>> +	 * We can't skip the invalidation if we are removing PTEs that span more
>>> +	 * than the range, do some checks to ensure we are removing PTEs that
>>> +	 * are invalid.
>>> +	 */
>>> +
>>> +	if (pt_op->num_entries > 1)
>>> +		return false;
>>> +
>>> +	if (update->pt->level == 0)
>>> +		return true;
>>> +
>>> +	if (update->pt->level == 1)
>>> +		return xe_svm_range_size(range) >= SZ_2M;
>>
>>> = or == ? Dont think ranges can be greater than 2 MiB.
>>
> 
> This is future-proofing. For example, if we add a SZ_8M entry because
> profiling an application shows it helps, this code won't break. I also
> assume we will never fault in 1G ranges, so there's no need for a
> level-2 or 1G check.

Makes sense. Looks good to me see no issue here.

> 
> Matt
> 
>>> +
>>> +	return false;
>>> +}
>>> +
>>>    static int unbind_range_prepare(struct xe_vm *vm,
>>>    				struct xe_tile *tile,
>>>    				struct xe_vm_pgtable_update_ops *pt_update_ops,
>>> @@ -2023,7 +2049,10 @@ static int unbind_range_prepare(struct xe_vm *vm,
>>>    					 range->base.itree.last + 1);
>>>    	++pt_update_ops->current_op;
>>>    	pt_update_ops->needs_svm_lock = true;
>>> -	pt_update_ops->needs_invalidation = true;
>>> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
>>> +		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
>>> +					    range->tile_invalidated) ||
>>> +		!xe_pt_op_check_range_skip_invalidation(pt_op, range);
>>>    	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
>>>    				    pt_op->num_entries);
>>
>>

