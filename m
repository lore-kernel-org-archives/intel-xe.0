Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8A3CA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 05:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1C08825B;
	Wed, 17 Sep 2025 05:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaGpHsgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B9010E041
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 05:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758086965; x=1789622965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=aNG3aMq6eW90EkJQanGH5nvcXF9meBKoHJ0LoBdOkHg=;
 b=WaGpHsgp7mLFR4e79TUuVB+XxUB1iwpKIsD+/nX/LoyZ+th+PI+QIN2E
 lwsQvCRj1U94PdolUWRi4VH201UDI3ELNAh/LysDeEUWrV9MlSX+GE5UA
 GvPUZY7ptz82B4tQWMdh+1XwY8y+i2g86b4MLfJxnZVoEff2PihWTRIcm
 5kNXTedzzdPyL8tmv2sUYwxoNgPNW1SidQUXNkxD62jtco0RRcTzgM7ls
 Dlx8fXhzWQJ9EuKWhWp0C29yV7Z8UwvL+m9wH5xMnmj6oeofMQVK1YqjX
 eqfLODAwW/IO6Rh06UjI34uAvIZjCy34QLGAssNLb/ccl4t+81pLn4GKC Q==;
X-CSE-ConnectionGUID: C6MQ54neShuzzboSJkJoqQ==
X-CSE-MsgGUID: oB74L3wgTgiIIJ9/2eKRvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60250325"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208,217";a="60250325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:29:24 -0700
X-CSE-ConnectionGUID: jYyBs4V9QDmLK6dyrcnkFg==
X-CSE-MsgGUID: QoY7kSmhR0mDsF0JZwQHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
 d="scan'208,217";a="206101850"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:29:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:29:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 22:29:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTnXVL6QyPnR51826J57qn6Up2DFh3fhZZBz01jYlFawHwQEoZThJSt4J2Su+0CY0ALUpTWjGMqyylgJDEA5854BR8F0GVU+E3vaul+fmJ3TaY37I2BdBqqoHKYLvxYnaSpXmTQCjuScU81vGLguzuPRvHAgt7PCTmZRIKgSEJ8IH3L0AukrmyFpnQbo0irCB3hbQgjGcYuE3NXNcLjIjX3EQR8f/+Lrd5mfRdEF+bywQ79UNQe2i5AbCXJPqgQhqehEsWPBWM8qZ3s8Os3LRUHTB79fVa3BXypMjOQOfmBuQwEwWVfg9uFFehflh4RBMuo91bqaPsIQ/ihqJXMzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibAAooUuYmrMpf5lB8v5r6G02BfHkBGaLB2TyEE4Z8s=;
 b=BUvCtEdRtiq95kJiNJ+mczwU1WvCrl/AUjZaOZCVeg3JHW9GUU2XyAVEH59u9xH5RIaF2fnCzIYNGq1MN4Z6BNSrg3nd0IQWJt5cY6+KmH/Oe/br1L5QByX5TlKBSo6uYa6PMxOifeztso3kKzkwoeb/QYQ8le8K2u2Dk3EnDuNzRA8RKzaAbaliQRUmQunR6NfDgfuiHbZpo3yBna6pSHV2t+xbl7cRA8uwuZKTC0V45qcVJGZgiMbwuvPIvWYvgqWgrZ/ohpuIsnZv8RQ7z06ieLtsUK/eedJ0P5gokdhoGjj2XVrqRslt+61VAGIeigMBAbIrSyaLX0zvYF4clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 05:29:20 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 05:29:20 +0000
Content-Type: multipart/alternative;
 boundary="------------XhF744liliamazp3glyZMF8t"
Message-ID: <dc4de0b6-f2ff-4979-8a03-ba4bbed26d39@intel.com>
Date: Wed, 17 Sep 2025 10:59:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_pc: Add ignore efficient frequency support
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20250916140543.3055778-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250916140543.3055778-2-sk.anirban@intel.com>
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dec1adb-3e7f-4b41-cb36-08ddf5ab270e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZTVU5zNDY0dk5pM3F6STZKNGRhenpTL1pxVHAwOUMrUDhGVFQxZmo4ZENk?=
 =?utf-8?B?OXdWS1l4L0pQU2tPenR4c3EyK1R6RzhYcWJnK2tZMElUS0NYenhUVnRRK2V4?=
 =?utf-8?B?RW5PUERrZS96cHBhT29ZMndRNDYyN3V2cnEvZ0hTMGZaS1lSRWVzT3lCcXNV?=
 =?utf-8?B?aGlIWG4wZ3dNK0ltTDJOTlVnNHRZNll5YnBnWkJKM1RPVUpXNU1za1NMZHRi?=
 =?utf-8?B?RE14TUZ0YVJiVmkyVFlPTWVCK2FYeTNhNkc3bExPb1Bma1QrNDhBWkZlUXZJ?=
 =?utf-8?B?U21YMFRiMkEvdnNkM25GUCtHSFNnVlU3SlhGQ1A0Q1FPLzVnNEVIR1c4R0RI?=
 =?utf-8?B?MENJcXJUaWJDYW9vTEZ1ZkNUd3NhQnhqOFBnbDV1L1VNb0ZWRm90dis1eVNJ?=
 =?utf-8?B?NUVkMmdiNjZmd013Q3hkQXMzTVlPSEJYK25HYTg1OHZ0cGZFUXdNTE44RVJr?=
 =?utf-8?B?YWRyc1V0cDZIVDhBbGVJcWhwMXk2VEhNMW5GUjJrTzJ1Z2JBTDdUQWhVNW9Y?=
 =?utf-8?B?TG9iWU1zKzBvVURHN1hXc1pPbkxtdThHdzlNUlg0WG92d28yUlFESjJ5d0NV?=
 =?utf-8?B?cUt0REVsdUFZT3hjSS9hREliL2ZUd2NmZnBQK3pXVzBtajlNK0hVbGxTUTJU?=
 =?utf-8?B?MGRBcytudEFmSjZmNnczMmE0dTQva2tYYzh2Q3VxVy8vL2g3RDNrNTRsNlNF?=
 =?utf-8?B?MEQ2ak1PUDlucE1UYXNUbTlDSlQ3U3dFV1lCKzhscGFTNDJRdGIvWVpEbjFQ?=
 =?utf-8?B?azhZMmZjK05CNlRBTEVBdkh3VW1TRnN3eEpJU2NqL09tWk9mTFAyRGhOSjRn?=
 =?utf-8?B?U05LVHBBQys1RlRCeHRWWHJ5cExLNlk3dndGWnRjcklPSWp0YjlXYkhidnhG?=
 =?utf-8?B?TnpMdUw3SFFOVDZOWTh1dTFKZkIxeURrU2ZJd3hJZDhWN2VmeHkrSHkvTGNO?=
 =?utf-8?B?c1drMlhBNmI2S1hEMit3RFNtbndjUlhWM3J5TU94VXZ4bmEzRTNqclBjNHh1?=
 =?utf-8?B?Y0dPUlZPemhxejh4T1V6M044MndBTTFzNE54Z2o5U3VjUTBaalczYUtjUkxI?=
 =?utf-8?B?MzNvdVhDMUFNRmJPd1JNaGd2M0VFTjg1ZW1wb1AzaHdQZDlTUGFTWFBxbkxs?=
 =?utf-8?B?dHA1dS8wS0VPUEVLNnpsWkY1ZWllVzE5UWtpRkI5QzdYaU5IRVBYbGxsN2NO?=
 =?utf-8?B?cFI4SzFiL0JCQ0piSDZuREJKZjA0QU9uMjY0bDhFS2lzY0RhWTFaR0ttWmRH?=
 =?utf-8?B?MEtLOU1aZFNJOG1kVVJ3TkJlNkFONTRhaVk1bE1wVDluRWlEdjhscU9pL2ZJ?=
 =?utf-8?B?M3NlWTB5a09RcUNWcUMwb3c4RUZIRFdZbDhKZ1k1NlBIMGJJUzhGSnZPbnFF?=
 =?utf-8?B?OCsxRVg5cHYzQUJUNk9UbUYzU3NGRmljNjZTN3JWY2cwTEc3UThsbm93eFJk?=
 =?utf-8?B?TFFtWHlKNTdxZXhYcVQ0d1FpWFhvZXZWbVcydk9zQmozYWNjaVp3aWdRK2cv?=
 =?utf-8?B?Z0FlRmVTeUdvbkkxaDN0dFF4K0FXSXJtNmNZR0o2Z1pOcnAyS0RZQnc5RThW?=
 =?utf-8?B?UGluaWI1cUVOVGYxaitBcVFFQkh0eit0N1VFNkE5UEltc3V1a21rRHZxRmVT?=
 =?utf-8?B?alhpSWhnOVlLY2pTcnl2VFMzRE0zelpCSFFXcXVOc25YS2Y0cVcvVTNlOEp3?=
 =?utf-8?B?SDFUSWlRc0dLKzNZc1E5dHNQcFN5S3BSWmhIT0FNT1ZKN1JPWURkOVB0Vmtr?=
 =?utf-8?B?SUZuS3NoY3dPUUJ4ME8xdytKeDZRYTdlQWQvTWZIeXd5UW4vcHlmWEVlaC9w?=
 =?utf-8?B?L1J0Tk1Bc2xuRjh5YUNaTU41djQ1MTB4Kzh1eTNHUUJaNW9kYVJGalNHWDIr?=
 =?utf-8?B?VjUxVnU0M0o3T1FwcStGSWdaS0tUQm13SGg3RHI4d3VhRnlCRmxUeXdlM3BR?=
 =?utf-8?Q?HkLayTtDJu0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVHbmRFcnNFVVhaTDl2M3ppUVVwYUVZUU5JVE5GSUYzRURvbWZyZDVscGJ1?=
 =?utf-8?B?V3E5M2pjTGFFeHVhTGFWVUJJSWdlVTR0UG5sR2JONlB1bkw1ZWNpUVRzZlU5?=
 =?utf-8?B?MWgrWXZ3MGMwak5oOFNqQnlwalRTV080dGw1b05pNnprazR3bDBmZGhRK0x0?=
 =?utf-8?B?T3AxeVVBNmtZRXIvVGo3b1BZeGJIR0xnd3I3a2RWKzc1c3Uwa01CS3lIcTUx?=
 =?utf-8?B?dnNsb3d4S3B3NVh6cElQY052UDQ3UHJMWWJFeUhsUXJRTHhlRkpETmt0djBD?=
 =?utf-8?B?OXN4VlJRWDd2eDBlSWk2bDQvMTRPbElHazJVMWVtSjc1eHRGT2xNVXRmQ1Ra?=
 =?utf-8?B?dlZac0FuMWRJRmNJMS9jV2U2RHZXTStBNkk1dlJnOXdPNWZ5d0JWSEtzUEti?=
 =?utf-8?B?Y2JjV0ZPaG1mOXdUM2pyT0t5ei9UaWZPUmlOemZnWE9oSmIycGc5bElXbXg3?=
 =?utf-8?B?YW1vSnFjVlZEU3ZXdTBSYlpIWkdUaTRxSFdPTXc2QnBHU0RaUHI2WURlQ3NL?=
 =?utf-8?B?bVBIMkJXbUs1a0lIK3V5d2JLc2lmbTVBSlpWeStJdUFEbTZRM1c3aFgvblVZ?=
 =?utf-8?B?dVNiN1FzM2YvRTNvZ2R4QUpLbUxzZ1BvU3lyb3R4Nm11a1VubXl5NFRSN0tp?=
 =?utf-8?B?QjVZYTNacjlsL0FwLzNPN2xtN3AvM3pxbkVtc2MvWHhqQ2JBVkM0ekFFeGNI?=
 =?utf-8?B?QjNFZkJHR3JNMjdDUFpYUjd4dHUrRytPdkc4OVI5amMya2xwclBzWDZtYzE0?=
 =?utf-8?B?eExTdTNTRXpnNUhWSWhMVmZQdlpWYzA5RzBXT2xkdjhlOGdpSHp3VUVlZk9j?=
 =?utf-8?B?NTVRYXBna2JhUkI2V2FuQ0w2NDRVbnk2TkVJQmZFUHA2NCtNTEJnK3Z3SEZl?=
 =?utf-8?B?RmdUbmVzM056TmVDMGFRNHM0N01hKzQxYVJRR040c2RLdS9jeXh5Y0t6N2wx?=
 =?utf-8?B?NG1HWkkyeEtEaVJOV3VNUkcxTHg3Rmo1TENpa01JVXV1V0ZSZnl3VkRDTksy?=
 =?utf-8?B?OWh0WTFVVVBocENyT0xCODR1T0plMlEza1F4RmZTV3E4VklFZFBHQ2JyWlJw?=
 =?utf-8?B?QWkrb2gxdy8weTI5MEwwWTZabkllWlFIUjZmV2RieG1GRDR6Tm1OVE9xdUlB?=
 =?utf-8?B?ZGJzOXJndTRsQVh5ZG1VMDhGOXllVHZVS3JZMDJpam1sY2FMWFZ3MFpMVUVi?=
 =?utf-8?B?alJ3L0JiMS9GSVlmeEowNThtbXRJM09HMXd4anEwcVdXNnVtMUpHQUlMeEVr?=
 =?utf-8?B?cGl0Ym9FNEMxdTFETFIxc3J1OEt5TGlmeHpvclhPeUlTSzl3cWFkbXNlRFRs?=
 =?utf-8?B?QkFPdGJFYlMxOFVTaEZFMmZSREdORjNhVEpJTWZvV1Z0Z0VVYXZkQU4yUklr?=
 =?utf-8?B?Mk83emJlSk5wUXR4TmxydjFqOFdjVTRWMzYzQnZWWUEvWmdyNUZzVTZTU3pX?=
 =?utf-8?B?cGNiS28zaVNManIwSDd4ajFqN01rRWxWc2dBdnhEVDR5RHl1NFNlOXRtbUFQ?=
 =?utf-8?B?WGUzMGFXZGN2RUxxTVZRQzhOSjNSamh1bktMbTlTSzg1RjAyUjRkdEhpdGlh?=
 =?utf-8?B?MXpDQnQ1SFo3c1hBRENMdlZ0ek8vY0pXaklIK0NHZTk5QTJZckQ5S3hrdjNp?=
 =?utf-8?B?NHZRVjFMK3BBSm9LMXFyMWR2Wk1nM1ZOb2s1MFJOZTgvSjhreXVtbHllR3lW?=
 =?utf-8?B?bmZkdG1uWUNqcElyNnJkN0QxVnFubW1zY094TkRSUzAybEcwWElYdlBzY0sv?=
 =?utf-8?B?QkQ1Nk1XNncxL2o3d1Z2RHcwN3hnNEZmL2RydXRVblFLSEZaclZVM21oclJF?=
 =?utf-8?B?M3ZYVDBMUEJXQnFjakYzVU1rSUJWZGdsL0dGQUZSVENld2Y2Q1o0OXo0ZUJC?=
 =?utf-8?B?TWJuditrNDNZSURvb0xLcWFQRFQ5dUM1R0VXOEtYSzFDQjhVV0hwcXJrNHh4?=
 =?utf-8?B?eERBSzVvNjI4RXBOb1dRTUMzQ3FvT1huWDZDMVk0RVkxNlFoL1RxTUhaV2Rk?=
 =?utf-8?B?RXJLU1RyeTQ3ZGkvSFJQMldFS1dpa1lWU2U5cWx5andZWmp3UVdWRFlVOE9C?=
 =?utf-8?B?THRrZGl1Y1pKZ016UFhjUFFOQ0c2MGgrSFJpYUxJWXRjVVdTOHUxNUtYaDlZ?=
 =?utf-8?B?a1g5RXkxTGNYMUcrWFVyVHlJMlI0aEtRNy9wSnhjZG1kMjFnaWdXNFZtdHZl?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dec1adb-3e7f-4b41-cb36-08ddf5ab270e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:29:20.5129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6N+gRiiUeKXwjpCenejrmqx16qwp1p1AIOwujFsiHw3rlZ5ddyoCGOtXgHSwm6HNcySiWjrM2AO4WtjajYPP6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
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

--------------XhF744liliamazp3glyZMF8t
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 16-09-2025 19:35, Sk Anirban wrote:
> When setting the minimum frequency, GuC automatically adjusts it to
> efficient levels, potentially overriding user requests.
> This patch adds the slpc_ignore_eff_freq sysfs interface to disable
> this behavior, allowing users to enforce their exact minimum frequency
> settings.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c      | 36 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 49 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>   4 files changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 4ff1b6b58d6b..fb16fa5c6a0f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -227,6 +227,41 @@ static ssize_t max_freq_store(struct kobject *kobj,
>   }
>   static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>   
> +static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
> +					 struct kobj_attribute *attr, char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%u\n", pc->ignore_eff_freq);
> +}
> +
> +static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
> +					  struct kobj_attribute *attr,
> +					  const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 val;
> +	ssize_t ret;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	xe_pm_runtime_get(dev_to_xe(dev));
> +	ret = xe_guc_pc_set_ignore_eff_freq(pc, val);
> +	xe_pm_runtime_put(dev_to_xe(dev));
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static struct kobj_attribute attr_slpc_ignore_eff_freq = __ATTR_RW(slpc_ignore_eff_freq);
> +
>   static ssize_t power_profile_show(struct kobject *kobj,
>   				  struct kobj_attribute *attr,
>   				  char *buff)
> @@ -263,6 +298,7 @@ static const struct attribute *freq_attrs[] = {
>   	&attr_rpn_freq.attr,
>   	&attr_min_freq.attr,
>   	&attr_max_freq.attr,
> +	&attr_slpc_ignore_eff_freq.attr,
>   	&attr_power_profile.attr,
>   	NULL
>   };
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 53fdf59524c4..0229a89e3ff8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -336,6 +336,8 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>   
>   static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   {
> +	int ret;
> +
>   	/*
>   	 * Let's only check for the rpn-rp0 range. If max < min,
>   	 * min becomes a fixed request.
> @@ -347,8 +349,10 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   	 * GuC policy is to elevate minimum frequency to the efficient levels
>   	 * Our goal is to have the admin choices respected.
>   	 */
> -	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);

This code already respects the user’s request by disabling efficient 
frequency when the requested frequency is lower than RPE. So, why is 
there a need for an additional sysfs entry to disable efficient frequency?

Regards, Badal

> +	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> +				  freq < pc->rpe_freq || pc->ignore_eff_freq);
> +	if (ret)
> +		xe_gt_err(pc_to_gt(pc), "Failed to set efficient freq\n");
>   
>   	return pc_action_set_param(pc,
>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -737,6 +741,45 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   	return xe_guc_pc_set_max_freq_locked(pc, freq);
>   }
>   
> +int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val)
> +{
> +	int ret;
> +	u32 min_freq;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	if (val) {
> +		ret = xe_guc_pc_get_min_freq_locked(pc, &min_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
> +	if (ret) {
> +		xe_gt_err(pc_to_gt(pc), "Failed to set ignore efficient freq(%d): %pe\n",
> +			  val, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	pc->ignore_eff_freq = val;
> +
> +	if (val) {
> +		ret = pc_action_set_param(pc,
> +					  SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +					  min_freq);
> +		if (ret) {
> +			xe_gt_err(pc_to_gt(pc), "Failed to set min freq to %u: %pe\n",
> +				  min_freq, ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_guc_pc_c_status - get the current GT C state
>    * @pc: XE_GuC_PC instance
> @@ -1382,6 +1425,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   	if (err)
>   		return err;
>   
> +	pc->ignore_eff_freq = false;
> +
>   	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>   					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>   					  XE_BO_FLAG_GGTT |
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..3a87d0da609d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
>   int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
>   int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
> +int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val);
>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..c3b44598507b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>   	struct mutex freq_lock;
>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>   	bool freq_ready;
> +	/** @ignore_eff_freq: Ignore efficient frequency */
> +	bool ignore_eff_freq;
>   	/** @power_profile: Base or power_saving profile */
>   	u32 power_profile;
>   };
--------------XhF744liliamazp3glyZMF8t
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16-09-2025 19:35, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250916140543.3055778-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">When setting the minimum frequency, GuC automatically adjusts it to
efficient levels, potentially overriding user requests.
This patch adds the slpc_ignore_eff_freq sysfs interface to disable
this behavior, allowing users to enforce their exact minimum frequency
settings.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20250916140543.3055778-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 36 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 49 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
 4 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 4ff1b6b58d6b..fb16fa5c6a0f 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -227,6 +227,41 @@ static ssize_t max_freq_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
 
+static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, &quot;%u\n&quot;, pc-&gt;ignore_eff_freq);
+}
+
+static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buff, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 val;
+	ssize_t ret;
+
+	ret = kstrtou32(buff, 0, &amp;val);
+	if (ret)
+		return ret;
+
+	if (val &gt; 1)
+		return -EINVAL;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	ret = xe_guc_pc_set_ignore_eff_freq(pc, val);
+	xe_pm_runtime_put(dev_to_xe(dev));
+	if (ret)
+		return ret;
+
+	return count;
+}
+static struct kobj_attribute attr_slpc_ignore_eff_freq = __ATTR_RW(slpc_ignore_eff_freq);
+
 static ssize_t power_profile_show(struct kobject *kobj,
 				  struct kobj_attribute *attr,
 				  char *buff)
@@ -263,6 +298,7 @@ static const struct attribute *freq_attrs[] = {
 	&amp;attr_rpn_freq.attr,
 	&amp;attr_min_freq.attr,
 	&amp;attr_max_freq.attr,
+	&amp;attr_slpc_ignore_eff_freq.attr,
 	&amp;attr_power_profile.attr,
 	NULL
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 53fdf59524c4..0229a89e3ff8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -336,6 +336,8 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
 
 static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
+	int ret;
+
 	/*
 	 * Let's only check for the rpn-rp0 range. If max &lt; min,
 	 * min becomes a fixed request.
@@ -347,8 +349,10 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * GuC policy is to elevate minimum frequency to the efficient levels
 	 * Our goal is to have the admin choices respected.
 	 */
-	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq &lt; pc-&gt;rpe_freq);</pre>
    </blockquote>
    <p><span style="color: rgb(13, 13, 13); font-family: Inter, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">This code already respects the user’s request by disabling efficient frequency when the requested frequency is lower than RPE. So, why is there a need for an additional sysfs entry to disable efficient frequency?</span></p>
    <p><span style="color: rgb(13, 13, 13); font-family: Inter, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Regards,
Badal</span></p>
    <blockquote type="cite" cite="mid:20250916140543.3055778-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
+				  freq &lt; pc-&gt;rpe_freq || pc-&gt;ignore_eff_freq);</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20250916140543.3055778-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	if (ret)
+		xe_gt_err(pc_to_gt(pc), &quot;Failed to set efficient freq\n&quot;);
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -737,6 +741,45 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 	return xe_guc_pc_set_max_freq_locked(pc, freq);
 }
 
+int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val)
+{
+	int ret;
+	u32 min_freq;
+
+	guard(mutex)(&amp;pc-&gt;freq_lock);
+
+	if (!pc-&gt;freq_ready)
+		return -EAGAIN;
+
+	if (val) {
+		ret = xe_guc_pc_get_min_freq_locked(pc, &amp;min_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
+	if (ret) {
+		xe_gt_err(pc_to_gt(pc), &quot;Failed to set ignore efficient freq(%d): %pe\n&quot;,
+			  val, ERR_PTR(ret));
+		return ret;
+	}
+
+	pc-&gt;ignore_eff_freq = val;
+
+	if (val) {
+		ret = pc_action_set_param(pc,
+					  SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					  min_freq);
+		if (ret) {
+			xe_gt_err(pc_to_gt(pc), &quot;Failed to set min freq to %u: %pe\n&quot;,
+				  min_freq, ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_c_status - get the current GT C state
  * @pc: XE_GuC_PC instance
@@ -1382,6 +1425,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	if (err)
 		return err;
 
+	pc-&gt;ignore_eff_freq = false;
+
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0e31396f103c..3a87d0da609d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
 int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
+int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val);
 int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
 void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..c3b44598507b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -37,6 +37,8 @@ struct xe_guc_pc {
 	struct mutex freq_lock;
 	/** @freq_ready: Only handle freq changes, if they are really ready */
 	bool freq_ready;
+	/** @ignore_eff_freq: Ignore efficient frequency */
+	bool ignore_eff_freq;
 	/** @power_profile: Base or power_saving profile */
 	u32 power_profile;
 };
</pre>
    </blockquote>
  </body>
</html>

--------------XhF744liliamazp3glyZMF8t--
