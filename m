Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722FDCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 20:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318BD10E0A8;
	Fri, 31 Oct 2025 20:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TR7lAAy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5D10E0A8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761941419; x=1793477419;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9wMFIIBBZ92RK+6wkWyf6TFifzeR3KowpHA1BDjcLhA=;
 b=TR7lAAy1HAPUZ9NBSNSN7vkNYuHFOT8hrN5qXuou4Q6JEOJUm+Tw0Abu
 fSYQdYZAVxamXbsb0rifHWI43pFAsSub82FfaGdP/YYWD5X7DsLXe5zZ4
 saPpChnyjB3BsPbQ3WMvDUvdezD5VbZbcU2989JjHfAfF2qg1f9oeMbSI
 1fayZp3W0cX5FkcmNb42K6MgN4f1D3g6VzdlIT06tDA7hxP/7Q+yVlJ4e
 HM/0V/RVGTCcuKz2lH5y663GxyExO6Rfd4RrOKn+y6qq6S6fTuOvsjw8W
 RmWWATm+ZSpNHANU3AvvVfMBHQTJTIr3G9546SgLjVa5sC8jI5lFVf0jc g==;
X-CSE-ConnectionGUID: 3jj9k9dGTRGPSvCTyEXALw==
X-CSE-MsgGUID: qN3CXj7CTSu1HqT06m6TGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86736861"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="86736861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 13:10:19 -0700
X-CSE-ConnectionGUID: YdXNuG+UQ5qGK0Yf43SNmQ==
X-CSE-MsgGUID: +LuWhAkpS/CjP9XkByYXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217158606"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 13:10:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 13:10:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 13:10:18 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 13:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy2y+f9xKLDbIcOjNbXHc7zVCa14k827y83+/AjoTTKqM2qhvMQaLP/6nbd52d+oZCosCHpEBoZrWzZHCS50BocEfOj9KGT3zzBLfHnxrW/kngGpKqdx+OXnjDw7QOrCDATC1ZLX4NC4t2TNWd4MhFUv01SHQ9uBW+udIWIgwqYIEww996l1HGc+AxTS5If9DxHgnZr1bQjOlM6xVRkcOmaZ9ScrPNhENSDQBQYW2/tzfJfRY36/N5ZBlH25Bbwwh4ulDQtcjAs9qVRa+AUdninDE05HB3v7F8HNIhFNGezCeiQOjAMrrI8cQbRhAGYmBFzh9V/otdfrZHbBiC2j3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02njA/YZXJUUoba4hVlR6k33GSeRJbSarVfKELbY3a4=;
 b=dXR5SnnT/fAn0+P1vhpsFfcxvgLqKnPLqVUTZc0QqJVLBEre2Fv4rEyiaKNufyDeFDpD5PER2UFiV7fJPLbw4jP0rQXehQZrpzuY39+XnJvTvpVgCiSCwNfrwpmlvSplBjEKbdIDHyNBrsHi41Z1t8Y/oDN3TmGWrqzzofanbiukFJWtUSeboPEMKY7m2D2GRmB5eUhR7WbhPrkDTmEEpcPbwmmRoB2jcLh9C0/1xpSjsYtloZzaW9wPX1QuuTClcIS7Jzw7HaMahFIeII0QA7+rgXkzSEl/yMxjJE8LjfM59M15J3iUcv2rBBhGqUY9j0uG9ameVfEig3q90nf0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 20:10:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 20:10:15 +0000
Date: Fri, 31 Oct 2025 13:10:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Introduce RESFIX start marker support
Message-ID: <aQUXpd0HkcFg2iZ0@lstrano-desk.jf.intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
 <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
 <aPqSDVJ4QR7kzT07@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPqSDVJ4QR7kzT07@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b68845-e188-4745-e5e5-08de18b9818d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTZCaGZSbUZIWHp2WE5XU2QyTmFTT2N0WWhEc0Uyc012QmN2cmJaZDJzdkla?=
 =?utf-8?B?NzFLb2ZEYnl4bHowOWRhcVJNWitROHZ6UWFWYlRlYnU3bXp5QkVtbEllTWo4?=
 =?utf-8?B?ejlkSU9vTVE1RHhDTXFJTzhseGxIZ1FSekd0T2daV01PSFRYNlJWc082WHd2?=
 =?utf-8?B?ZDZwazZMQlRlc21HYkJHc1BZdlYyTVRaRDh3MmdEQW9XQlgxaWlIYnZVTWdp?=
 =?utf-8?B?bDVuS3JtbmFabDVSNXdWUWgrSjVlWS9rRzB0enA0UHU5eHZiYXRzZWpCNGpZ?=
 =?utf-8?B?RUM1Nkc2OEQ2cFBNSExBakJMOXVFdzQyRENtcEVjek5KRUZPMWxQMmk0UkNm?=
 =?utf-8?B?TWFNU21lZGFGcWNPVm9SUFFiL3ZkUnNMY240T0lWVjJIaTlxRGozOUM0NWNh?=
 =?utf-8?B?YSs4NWZTRFlOanJsTlE3UXNFYkNWOTNqcFZ4WXZWbXJkQWFPTDRTR1RDNVZi?=
 =?utf-8?B?VlR3TVhLckQ0SnhzamNEanMwUm9xVThHMVQ4eW5RRnA0YnpPRDdZb1pUd1lZ?=
 =?utf-8?B?d2hxYisyanNDMThhVGhBUURPK3I3Zm1SM1dwdlc5RDMrU0FZb0g1REVybXAz?=
 =?utf-8?B?WXE3VHZHa3R1NkdvcUxST2dmRFJYQ2RzQ01zT1dvMkI0SXp1L05WamJUQ003?=
 =?utf-8?B?aW9sU1BKd25JUFlLT1Q5dTlCMFZlcHdmQ3R6YmR0VnJVczUvaFdoejM4R1V3?=
 =?utf-8?B?M2NaczVtdENFRGlrZk9PN1ltVXdHSlViTnk0YVNQTm4wNlprWmdIUFVIV1F5?=
 =?utf-8?B?SmV4Z3FDUE9HcUZqOWtkTWV0VmtzVUc0K1piTUxia0s0Unl6QXI3RHo2RGVw?=
 =?utf-8?B?VU85dktETEY4U2tPdWhDdzlBMWJzZ1dnQzJYM0FLSzFNZjVYVmVpSUZHWTZv?=
 =?utf-8?B?WjhEMUp2S25GbEU3cnVmcUNxY3FOSUF4MDZJQXpXcTNra1N2d0ZHSThLVTBw?=
 =?utf-8?B?ODdoSXF3VCsyMDZ6WU56bUZGTXNJOWhtTDNCZ3BMRTFiODFTaS85cW5XREVV?=
 =?utf-8?B?enJTd2Z5bjVCL0FsWWptZ002RVZHY2lqbEJrSTliVnZWb0MxYjRQVmVoV2pB?=
 =?utf-8?B?M0EyVnFINkx2b2REVUg1VzREQ0xrbWtOTGc2VVZJMnVNWHN0WVpTOHlxUGtE?=
 =?utf-8?B?MlVKL2xCUkxZcmNvanhUdnEyNDJnc1EvS3JNK081TGRoaWhNRW9NdElJeDlm?=
 =?utf-8?B?R0dBUEhxcUNjVnBYYm4rQjdLcGpRWWl6Y3VJbmt2bkN0UXZKTDNmMWh2a3BD?=
 =?utf-8?B?Y1YzWkhMWHhRcXF0TzByemdZT2Nya1AxZENYaW9CS1ZBSUVMdFVDQmF4OUQz?=
 =?utf-8?B?VkdRaHBSd3NPd3RQL0d2WGQwZDk4KzdCVE5HZ0h4N05lV1d6SDdscVdOa21v?=
 =?utf-8?B?RWxsK3NRRHBPc2hORUtkNjNaaTAyTVhoam5wdkphdVZ3cXl3aWJBd29tSzJW?=
 =?utf-8?B?Rlo1S3FVcDZ0aWRXaGZ4c0RwYmhBbGFiRWx5Rm1qNDM1azhMUHZTaVZ3VDZS?=
 =?utf-8?B?ZlVlU3p4aTlpUi82WjZQRm5tcnpSYTZtQnNoVkNqMDRiUGpCRWpYUjVWVVI0?=
 =?utf-8?B?Z25UMDdjZlFkc0tpUXV4WENKRFd5QW5sMFRQbVcrc3d2RlhCZWdzK1NQTCtr?=
 =?utf-8?B?NVV6SXlkTmF3VUdSNnFMUmJqQUp5cTNnZi9vQlBvRzN1b3ZNaHlmWUZFNzZn?=
 =?utf-8?B?QTBJaDIyUnovcXNOQlIzZW9vSi9xR1lOdDBBTGtqMWE5c1dHUTdaU0ZBWGs4?=
 =?utf-8?B?Qkk1K2xtWGdkUURsT0lJUXRDSkNoYjgvOG11b3gyMkt0c1RMK21SR2RTK2dQ?=
 =?utf-8?B?bHZSdEYrTzJ5RjVBWTRKekVramRHejZVVU1iUmtsUGV3eVhuUmNmU3B6T0lT?=
 =?utf-8?B?bis4TEtLOFRSZDFGQU53emFHZ0N6MG9XWWdicHFFR1orR3d1ZDdYLzZTM2Zu?=
 =?utf-8?Q?1T4nDsIh0X0wSgExSda0QDVPB87cGVQ0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW0wb2JKZmdrT1dldmJ4UkR0T3lzMFg2MDRRSDFUZXB5ejNmSnIzQXV4ZjBz?=
 =?utf-8?B?NTFBbk51ZXVqWjZZL0huWkNhUEVyUGNueFg3RGRZUjVReWlyWkRqbUdodk9N?=
 =?utf-8?B?eDlsREVRdmZ5UWdORlVHTmVyNGltM2V2Qkp3U0g2TTd4V2NGdmgwRUgrdUcv?=
 =?utf-8?B?WmlrTC9ORHlpdzBLbFVBc1ZVNFhpaEw1eUhhaDlnNGJUeXVGRjR5NFp6Sm5W?=
 =?utf-8?B?SkNTVjBraDVBd1lUSnZTYVlkRjdXbjk0MUl4aG55WSt0dkZodE13a3lXWnFY?=
 =?utf-8?B?TWgvNGxxcWs1YUE3WjQ2YzZmSXNnUlhBanBvSjhDa05kWTMyd3VyTXJJZkpT?=
 =?utf-8?B?Vnpkdkpzb3pOTkJUVFFhTkdscHY5NE4wZFVNUk84RWhWUG1sSk1pSUxNMk9K?=
 =?utf-8?B?dDcvdE4xQmFYS2VoaEdrRE9oTk8yUFV5WUNKVmNLaUVLVFF1NC85dkV2THRi?=
 =?utf-8?B?N2F0aEJ6dkMvYXJMYzZXL0J6bncrQUZDdHFEblhXOEN1OElmOHVnNnZNUHMv?=
 =?utf-8?B?bXpkOGwwL2FneGZSa005cUN4b2dmRUN1VEpFZ1NXSDdDSUVhSTV0bWw0dkt5?=
 =?utf-8?B?TGVxNUtPQUZSM0VhdXc0Mkh3eEFXS1laK25aaUE2UWpaWXpTaUpNRzloT0xV?=
 =?utf-8?B?ZTc2aklPdXkxeWZKQkVUUEtnRnJ0RDRNa1RvRWxnN1pnMVlGMzA4bTFvMUI3?=
 =?utf-8?B?SUNzUVBTQUZGa3N3MWJmQWZpK25vZEhkdEZhQXJSOFhkT0RMYlNzS3RtVzZv?=
 =?utf-8?B?ODJyUVIvMjhVaVpENFFrV01LTVhIMm5yL1VHOVZKeHBBRGJXUE5wNCtEdzNC?=
 =?utf-8?B?aUcyTm5qYmJOUHZoeWJzb3llWkxmZFVhbjJvby9Ba1hDZlFsNkdzamM5WTd4?=
 =?utf-8?B?MHJ6R3RicHVSVG5NTmRySjk0a21jejA4ZjF3L1Vma2NHMnAxVmgzdzlyL2hJ?=
 =?utf-8?B?d1JKOVBUUTBoN09mN1RURnRVbkE2eTFRTXNFSUFGK0dZa3YzbzZNVVlWSUZ6?=
 =?utf-8?B?MUlXTURVbllwdnFPeG1ieWZPTXFnQ2FoR01JMTdabkN1U1dGZlNqMWVlUTRX?=
 =?utf-8?B?bE9QK2F3Wm5HTFhhMSs1SmhndGdlOUhzVE4wMEcvaURRUG5MU2QzV25WTXds?=
 =?utf-8?B?TWZZT2l0T1JEQXBGUFV2elh5T0VUM3VoYkJKTVNPUDl2TFdxN25hTGV2SEZ2?=
 =?utf-8?B?cWE0RHUzcW8xdHlwRmNTN1hmL0JqK0owMTRyZlJlWHIyTHpvRnZJcjJoY0dh?=
 =?utf-8?B?VzJLVFUySUMrZXZqL3UzdnNqaGlxR0EwZFRLTUd6cWU1ek1FOUxNT0JEeDcv?=
 =?utf-8?B?R0NJc0VnNlhuT25JbXNwZkxadk80dFVENUZRV1FaQnB0YTRrMUQrOHRsMGNr?=
 =?utf-8?B?Mm9IOWxIVWJreC9qYjV4dGhjN2hhaXBXR3ZEYTMwSVdCNHlWb2E4VjRUOXJs?=
 =?utf-8?B?YkJvUWU1aWpuK0J2R2NMVWJJQ0FvOGx5R1h6enQvK1lIcXBPWFU1L3FEUnRE?=
 =?utf-8?B?S3lqc3k3V1puZnh2OFh3dzljUDZ5ZllJYnp0dGlxcExPcWJkVzhrc2c0N2sx?=
 =?utf-8?B?aEx4V2xvdHZiU3lpWU5OL1Nxd2k0eHlQd0dRQ2NzVVlFY0RlOWZ6VGhRbWRi?=
 =?utf-8?B?bUZFd0RwSjl6YzkrYWVlVzZndE5GTm8yZGZRWHFSSHo2bmNHYUF5b2IyaTUy?=
 =?utf-8?B?Ty9sTElIb3ZVejJEaGk1Q0d2bHZjWDBZbU1jQ3FSaFNTY0ZOZWdNdXFnbzJJ?=
 =?utf-8?B?ZWh5OUVuc01HNVM0NjlIU1p2Q282Vjdxc1kxbEFiNHg2b3lsVHQ3bmNhZWha?=
 =?utf-8?B?Mkdhb3VUR1hmT09rVncwM1BoMzNwdXdkZ3pPL2tXM3pZSXIxOXlRT2l1a0V4?=
 =?utf-8?B?U1pYTWRpNUJwZjJ5dXIvNDVJVHpESUc1cjZGcW4xdFA1TW02dlUwazBBYUpp?=
 =?utf-8?B?WUJpRTYvZ1BPK052RVVVV3E4VzFoRjZ4V3NRMTJkelVBcFpoMi9zTHFOMzhx?=
 =?utf-8?B?N01VVmF4WlU2Q1Y0cEE5elhQQzRIV25rQ0M1VUIrNXVoeG14ZFNuWm03eDdQ?=
 =?utf-8?B?TVJLL3FPWnErY2NXNURtZDFyM0kyMmVTR1NCNFZSSk5rancyc0V1K1FrQ0Fa?=
 =?utf-8?B?K1NtRDl4TlNzUEcyRnFKRVdBZ1A4dnczN1N0YzlIL2s3Yyt2Rzk5cW9oZGpr?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b68845-e188-4745-e5e5-08de18b9818d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 20:10:15.6958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQ2UbRwRi7N6cUqVIsSGOugO5gKbyP9eGjUf49Pe9dVQqq5UkOC3vcCkT8YwVgAZicrTG4Pt5mHMHoMcYXqBmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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

On Thu, Oct 23, 2025 at 01:37:33PM -0700, Matthew Brost wrote:
> On Thu, Oct 23, 2025 at 09:06:11PM +0530, Satyanarayana K V P wrote:
> > Post migration, a marker is sent to the GUC prior to the start of resource
> > fixups to indicate start of resource fixups. The same marker is sent along
> > with RESFIX_DONE notification so that GUC can avoid submitting jobs to HW
> > in case of double migration.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > ---
> > V1 -> V2:
> > - Squashed "Enable RESFIX start marker only on supported GUC
> > versions" commit into a single commit. (Matt B)
> > ---
> >  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 ++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 87 +++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 42 ++++++++-
> >  drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 ++
> >  5 files changed, 169 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > index 0b28659d94e9..b9141497bfd5 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > @@ -656,4 +656,42 @@
> >  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> >  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
> >  
> > +/**
> > + * DOC: VF2GUC_NOTIFY_RESFIX_START
> > + *
> > + * This action is used by VF to notify the GuC that the VF KMD will be starting
> > + * post-migration recovery steps.
> > + *
> > + * This message must be sent as `MMIO HXG Message`_.
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | DATA0 = MBZ                                                  |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | DATA0 = MBZ                                                  |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START          0x550Fu
> > +
> > +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN     GUC_HXG_REQUEST_MSG_MIN_LEN
> > +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MBZ   GUC_HXG_REQUEST_MSG_0_DATA0
> > +
> > +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN    GUC_HXG_RESPONSE_MSG_MIN_LEN
> > +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ  GUC_HXG_RESPONSE_MSG_0_DATA0
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index d0b102ab6ce8..8c1448d6c81d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -299,12 +299,55 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  		*found = gt->sriov.vf.guc_version;
> >  }
> >  
> > -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> > +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
> >  {
> >  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> >  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> >  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> > +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> > +	};
> > +	int ret;
> > +
> > +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> > +
> > +	return ret > 0 ? -EPROTO : ret;
> > +}
> > +
> > +/**
> > + * vf_notify_resfix_start - Notify GuC about start of resource fixups.
> > + * @gt: the &xe_gt struct instance linked to target GuC
> > + * @marker: marker to identify the migration.
> > + *
> > + * Returns: 0 if the operation completed successfully, or a negative error
> > + * code otherwise.
> > + */
> > +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> > +{
> > +	struct xe_guc *guc = &gt->uc.guc;
> > +	int err;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	err = guc_action_vf_notify_resfix_start(guc, marker);
> > +	if (unlikely(err))
> > +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
> > +				ERR_PTR(err));
> > +	else
> > +		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup start\n");
> > +
> > +	return err;
> > +}
> > +
> > +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> > +{
> > +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> > +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> > +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> > +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> >  	};
> >  	int ret;
> >  
> > @@ -316,18 +359,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> >  /**
> >   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> >   * @gt: the &xe_gt struct instance linked to target GuC
> > + * @marker: marker to identify the migration.
> >   *
> >   * Returns: 0 if the operation completed successfully, or a negative error
> >   * code otherwise.
> >   */
> > -static int vf_notify_resfix_done(struct xe_gt *gt)
> > +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
> >  {
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	err = guc_action_vf_notify_resfix_done(guc);
> > +	err = guc_action_vf_notify_resfix_done(guc, marker);
> >  	if (unlikely(err))
> >  		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> >  				ERR_PTR(err));
> > @@ -1183,7 +1227,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
> >  	xe_guc_submit_pause_abort(&gt->uc.guc);
> >  }
> >  
> > -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> > +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
> >  {
> >  	bool skip_resfix = false;
> >  
> > @@ -1206,12 +1250,27 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> >  	 */
> >  	xe_irq_resume(gt_to_xe(gt));
> >  
> > -	return vf_notify_resfix_done(gt);
> > +	return vf_notify_resfix_done(gt, marker);
> > +}
> > +
> > +static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > +	return xe->sriov.vf.migration.resfix_marker_enabled;
> > +}
> > +
> > +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +	return ++gt->sriov.vf.migration.resfix_marker;
> >  }
> >  
> >  static void vf_post_migration_recovery(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	u16 marker = 0;
> >  	int err;
> >  	bool retry;
> >  
> > @@ -1227,13 +1286,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  		goto fail;
> >  	}
> >  
> > +	/*
> > +	 * Increment the startup marker again if it overflows, since GUC
> > +	 * requires a non-zero marker to be set.
> > +	 */
> > +	if (vf_resfix_start_marker_supported(gt)) {
> > +		marker = vf_post_migration_resfix_start_marker(gt);
> > +		if (!marker)
> > +			marker = vf_post_migration_resfix_start_marker(gt);
> 
> Nit: Maybe just don't zero in vf_post_migration_resfix_start_marker.
> 
> > +	}
> > +
> > +	err = vf_notify_resfix_start(gt, marker);
> > +	if (err)
> > +		goto fail;
> > +
> >  	err = vf_post_migration_fixups(gt);
> >  	if (err)
> >  		goto fail;
> >  
> >  	vf_post_migration_rearm(gt);
> >  
> > -	err = vf_post_migration_notify_resfix_done(gt);
> > +	err = vf_post_migration_notify_resfix_done(gt, marker);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> >  
> 
> Nit: You missed my comment skipping kickstart if err == -EAGAIN but I
> think that harmless, in existing code, and can be done in a follow up.

Actually the above comment is wrong too. We always need to run the
kickstart again to GuC submission backend state resets itself. Sorry for
the noise.

Matt

> 
> Anyways patch looks functionaly correct to me:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 420b0e6089de..ccd850313328 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -60,6 +60,11 @@ struct xe_gt_sriov_vf_migration {
> >  	bool recovery_inprogress;
> >  	/** @ggtt_need_fixes: VF GGTT needs fixes */
> >  	bool ggtt_need_fixes;
> > +	/**
> > +	 * @resfix_marker: Marker sent to Guc prior to starting the
> > +	 * post‑migration.
> > +	 */
> > +	u16 resfix_marker;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index 39c829daa97c..10d6e43fffce 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -55,7 +55,21 @@
> >   * When the VF driver is ready to continue operation on the newly connected
> >   * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> >   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> > - * CTB messages and scheduling workloads from the VF::
> > + * CTB messages and scheduling workloads from the VF.
> > + *
> > + * In scenarios involving double migration, the VF KMD may encounter situations
> > + * where it is instructed to re-migrate before having the opportunity to send
> > + * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
> > + * prior migration is still underway, but the VF KMD is migrated again.
> > + * Consequently, this may lead to the possibility of sending two migration
> > + * notifications (i.e., pending fix-up for the first migration and a second
> > + * notification for the new migration). Upon receiving the first RES_FIX
> > + * notification, the GuC will resume VF submission on the GPU, potentially
> > + * resulting in undefined behavior, such as system hangs or crashes.
> > + *
> > + * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
> > + * sent along with marker and when GUC receives the same marker with
> > + * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::
> >   *
> >   *      PF                             GuC                              VF
> >   *     [ ]                              |                               |
> > @@ -102,6 +116,11 @@
> >   *      |                              [ ]        new VF provisioning  [ ]
> >   *      |                              [ ]---------------------------> [ ]
> >   *      |                               |                              [ ]
> > + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> > + *      |                              [ ] <---------------------------[ ]
> > + *      |                              [ ]                             [ ]
> > + *      |                              [ ]                     success [ ]
> > + *      |                              [ ]---------------------------> [ ]
> >   *      |                               |       VF driver applies post [ ]
> >   *      |                               |      migration fixups -------[ ]
> >   *      |                               |                       |      [ ]
> > @@ -169,6 +188,26 @@ static void vf_migration_init_early(struct xe_device *xe)
> >  
> >  }
> >  
> > +static void vf_resfix_start_marker_init_early(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +	struct xe_uc_fw_version guc_version;
> > +
> > +	if (xe->sriov.vf.migration.disabled)
> > +		return;
> > +
> > +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> > +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
> > +		xe_sriov_notice(xe,
> > +				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
> > +				guc_version.major, guc_version.minor, guc_version.patch);
> > +		return;
> > +	}
> > +
> > +	xe->sriov.vf.migration.resfix_marker_enabled = true;
> > +	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
> > +}
> > +
> >  /**
> >   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
> >   * @xe: the &xe_device to initialize
> > @@ -176,6 +215,7 @@ static void vf_migration_init_early(struct xe_device *xe)
> >  void xe_sriov_vf_init_early(struct xe_device *xe)
> >  {
> >  	vf_migration_init_early(xe);
> > +	vf_resfix_start_marker_init_early(xe);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > index d5f72d667817..626c11a6dd1b 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > @@ -38,6 +38,11 @@ struct xe_device_vf {
> >  		 * was turned off due to missing prerequisites
> >  		 */
> >  		bool disabled;
> > +		/**
> > +		 * @migration.resfix_marker_enabled: flag indicating if resfix marker
> > +		 * support was enabled or not due to missing prerequisites.
> > +		 */
> > +		bool resfix_marker_enabled;
> >  	} migration;
> >  
> >  	/** @ccs: VF CCS state data */
> > -- 
> > 2.51.0
> > 
