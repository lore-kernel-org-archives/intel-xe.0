Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E83CA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 05:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C314510E113;
	Wed, 17 Sep 2025 05:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5BTgicZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546DB10E113
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 05:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758088355; x=1789624355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2bumjnQHct3YrSbU83jGX6lzKJ770T7TdRLNV8PdlEQ=;
 b=j5BTgicZIwvH+kVfT5eTY7XeW6Qo/nUSitu4D9Z68SAbvkH2Y/EBfN/G
 KXPKd4y1ZA0XlyXS2QmyE9dkkjWMlCfordixSyCCNIGl49k9zI7SgzfjJ
 f2SE6MvJziXXLatcIDQD4A0UHQ+B5IMT3JpyeKUL0BerA8AOMtIt3TG1J
 7VvdReTdxKVATSKvqwiSyhKzsTNR6ua42aEbK6P6/FNtD3w8h/ZGVqTPH
 R9c6DDAd0qo7+eXYsHbi4c/xhP374dsPcSxc9vM+ttTmVUe42so0RQ75a
 nUfTryJAnnx3rvtUT/MO56u7gQy0W0mSvPbf9YlyiL+n0cfCuCg6F+0mi A==;
X-CSE-ConnectionGUID: 1aiwis/5TuijzTYtvBJ5Bw==
X-CSE-MsgGUID: i7oRpXw0S7C3CTlpqstLTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71067854"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="71067854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:52:35 -0700
X-CSE-ConnectionGUID: gxmxC5EXSbieBnxFSYODKQ==
X-CSE-MsgGUID: 1iHdocSIQAOVtSElo1FXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179437475"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:52:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:52:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 22:52:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:52:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9en1rKejuLnQtV6mbYiO07/vS2C6E7z0eFasxSZACEniQbzwa+n6qw/lo3Gu3ZLBQFCTL+3aYK7vhtJS3AUl/cjdyCdOj1XRA+pcBMBUTqQIFv2+lnC3fWu2pzbgx1ktYC0srdpVJ9pV5WC8LWUCTPvHpGQbsmWoeW0XsENj0K7SHRc047vR1LaNW3UFUKiDLV5a3vKZ39EpQnhb3IU4okC2+7c5JqYBP/unayAg2o7Kr+AI7c7zZo89CxYs3G/v9V8YWNSIhuiz93/1A072csXkzyl7Vs1Od2SH0IBT2rzlSvk/y2Y9Zh7T90gKdPqJd79bj/byJFBPZm6QzxbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CMGLkW9PmlYBYF4MT97ElKmYqoC6BZzEkyUOVFBD/U=;
 b=fiRK8o4RN7WXsaY9Gd+RspDjv0X46BXyxJlyRGEZyyAsiL2F3IaBoqiFGtlh0GPxQ7JlQpaOct+ILSCoVxyxRtEbAojbmyNoKmGcgVtbuznZIvmHQ0DzPgnz6KF25XIh1TApukY+mF6I+EJBYJWYtNXM5p6BpF3apyxI5vq91pvSE+A/2CcqIfnKmo3owFVK2GKwI60Lkqix5+nbxdx2c93cCdenfbSCli1SmZbCl4vhaqW+IDJ0yQzMP5rHeIDUuNlfHOfy0PuUiNLJBnyJTf24B2QE0VRQWtK2ECGcZNAw+CAB1SMKbCMDqdHBnDNIp23L0HAMudJsaA4kDHwCng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CY8PR11MB7874.namprd11.prod.outlook.com (2603:10b6:930:7c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 05:52:29 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 05:52:29 +0000
Message-ID: <07809716-c6f2-419f-98b1-43e482fab11b@intel.com>
Date: Wed, 17 Sep 2025 11:22:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_pc: Add ignore efficient frequency support
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20250916140543.3055778-2-sk.anirban@intel.com>
 <dc4de0b6-f2ff-4979-8a03-ba4bbed26d39@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <dc4de0b6-f2ff-4979-8a03-ba4bbed26d39@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CY8PR11MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: bed47548-3481-4a77-00ad-08ddf5ae62b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um4zVmx5ZXpRblJKWFkvbmN3MTZ1NjB0MjQrUk1oQ2FNcklBOGVQVitBZ2No?=
 =?utf-8?B?L29nKy9oYUxmZkNvK1A1L1BuMllGVWJTcXVsVHNCNXpERG1iMjMveGhXV3hU?=
 =?utf-8?B?RkY1KzEvY2FJSXpBQlNSNlAvdEs2Y3NWMmtiTDNxcktxalpUa1ZrRzJmcm1l?=
 =?utf-8?B?SW9TcFFtNGhCa1NHSHU2M0FXelU0MGtLRGNoUlNHVThxbnZqK2ZQZTkwT2Ru?=
 =?utf-8?B?YjZUdmIvVmJoRnRFMnNGYlROQlpkcHZ3clFZTWVMTTQwTnZMQmUzOXhwRUU2?=
 =?utf-8?B?MG90dXl3U2pXRm5mSXllWDRYQlRxUmZxMVBON0NId21wdStLeWtXWmpHZWdh?=
 =?utf-8?B?Wlo2b3lmSzZkSlVIdkVxSUVORzlEMmRLd3BBYnFyT3hKYU50TGphSTVLVXQv?=
 =?utf-8?B?QzNBMFFQek9xNzA4MkhqT2svYk10WU00dXVseDdxeEhJQ1JCSFFSbzFObDZ4?=
 =?utf-8?B?TVl1UnpNTCtLUk85Q211RFpsTU43WU5OYWpIUnEvc1ZJM1VGY0U5dkZ3dUIv?=
 =?utf-8?B?ZStSVWcwV1B5eUZYQW9MclNPTG5vOENGMXNqeGE4eGsxOHlOZUZpUTR2eFI0?=
 =?utf-8?B?QkpVYm0zbnpLUGVlSFdOcWtpdUhWdGJTWm53cDltMmxCazlXT2tRa1p6WVMr?=
 =?utf-8?B?QjhTeUIrdTZCY1Y2ZXN3MGN4dmZxc2NGSjZYTWF2d3dIZGdNY1lRRm5ISEs2?=
 =?utf-8?B?V3JSbXl2cmNaZ1o4aGZEUndnOVh4enVVK256amRSZVdaaFlCYmxUTVBMZDVl?=
 =?utf-8?B?aVd2ek1yeDdSMmNmQWxCWXdZVitzSG5lQktuTndZTmhPWHdNT3RySDZ3SHVn?=
 =?utf-8?B?S2FIUVV4TGt6WkdtNEJQYnpQWmtzZWlLUVFqRlJDbGVTZVdHbWl3WVRMSXIr?=
 =?utf-8?B?SVlwYTFFZzlMK3EzNWYvZitKaEgwSjQ0NEFaV05mTnJYQzFqT3dNK3ROT0xw?=
 =?utf-8?B?bjV6aFVoSzgrQ3lQc2RwclJiYW1QTWJoTDRQK01zVEowZSs3NE1BUittMkpX?=
 =?utf-8?B?QXF0Y2NVT2hhdVF4VHMxQkllc0xMT3VNb3l6Z1ZPODBmUG5sS2t4K1JPTFN2?=
 =?utf-8?B?MDB6ZDlnVVREby9nMjE0ZTk0RnJSNUZLM25JRDdxa29tVlB0aEN0TGtDN2ZZ?=
 =?utf-8?B?K2pjU2NBV1JINi9KVkR6ZE9WWWNzeTdQdDNINFlUYkNTZXkzN2NMeFpZU2VP?=
 =?utf-8?B?VWNvQThSZmsrVFg3TWJkU3lXRmFGUThrU1Q0TGpCS0wveVdBRmZ0TkNaeEJV?=
 =?utf-8?B?TUJNY1JKV2wyM0NFYzdMaklCMm8rWWpXYUxBN2pjK0xBSzFjWmFoK2l1NjFD?=
 =?utf-8?B?cVpYbno2UDQwdGVUK3EzWVZhRnAzQ2Y2UGZqdkJrZ28xMVY3am1HZkZvdFVl?=
 =?utf-8?B?YjRncmphdTBXNituWFNXU3M3N2JuRS9xZ1dodG5YOVpaclVxRUExckxqakpx?=
 =?utf-8?B?bVUyWVFVWGRMN3NhRkY2K0J4Nmk4VmpFeCtQc3U0eUVWdm9MS0NpYkhxdTN5?=
 =?utf-8?B?VTZGbS8rWU9rV3haMy9OdXUraS9kWCtIS3RJcFAweTJId1Q4MFZKQ0p0cXNq?=
 =?utf-8?B?UzRFVHhNNXB2dytHUmVvYXlNdHJ0ZHlrNGdNcStzSUJMemg0b2VNdzBPMTMz?=
 =?utf-8?B?TGxEMFpiNTlEbkRUN1poNXJlTGFaaXZWUkgvY0lXYlZOM1Yra3BpVEMzOVJv?=
 =?utf-8?B?WHFtaVNaTkQ5UG9uSXlxOFlpSGlIYnROc09lV1NOSVRsVFlRcXBGN0JxeVdZ?=
 =?utf-8?B?N1RPYWVpL050ZFk0ME9xMVBUVFFnQ2dUTmRxVy9BZUdMRnk0NklzU01uWTBv?=
 =?utf-8?B?R1I0eTE0T1BWdVVvV2dCdzBnUGg0YjYxT0IwYU5MWjhOakRreGRMbEJUL1po?=
 =?utf-8?B?ZVd0cnpCcXVCTWdkeUtFbzNjeVY1QldPWmtJeFB6ZW9nWVA1SStMSlpsVXFn?=
 =?utf-8?Q?zdPFW2JojZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkxMTUxZNFBPcit4MElHMVNIV3NicDNRY2RXczQ3MkY4VGk3N0F2dlg1UE9t?=
 =?utf-8?B?MnkvWlhWRW1PVHVqaWt2dHR6TklML3ZqbWNVdnlOMEErU3pQUHgvQjUvUVFx?=
 =?utf-8?B?dmNwQUQwMThSQUhkbGRJU3hWQkhaZWM0NkVXRzFlYkIwaFdkcW5EbGROWG85?=
 =?utf-8?B?cFlrdXZueTQ1a2Z2SGJRM1VIL2ZSU2lqaFdvRTgza3JkVzE1YklpdStPc2pq?=
 =?utf-8?B?MEJDNXVqWlpSMFFOWTY2K1V4N1BNeW5lQlE4bjNNZFdENTdodWFxVDhDOXBF?=
 =?utf-8?B?Ly82T2t6Z3NFOWQ2K3JUK3J0T2w3djBiVnNFbzlKc2wvcll1TTNPM25wMnpy?=
 =?utf-8?B?eml4dzJTMEZENUpoRWFtRkttV21sM1Nmbm1XZVpMTFFLNzBSLzVhR3lNWDgr?=
 =?utf-8?B?K1FONGt5TjJhR0dNa1pkRVA5R0RUekxpcDFKRFh6S2tKQWtBUG9tbHNGQk9Y?=
 =?utf-8?B?OVlXMEVlQ0FiSjV3Tm5maDlYRXRhZkJZR2RNdlgrcGU2S3JBT0hGYXM1Nk9P?=
 =?utf-8?B?cVdYdXFma3N4UldvTVBlOVVpbDdCSXMzUU41Yy84Ymw4eksxVnhnVHNyMy9i?=
 =?utf-8?B?UjJ5azJrSi9GTTlCOVAxOWdjZ3YzLy8yemNGckNROE5HTlNHTWNqeHlEQmNL?=
 =?utf-8?B?OWt3TGdHL28xaU1maE1SSjFZTXZxQWFmN1ZaNy83S1VtL25kNytmc0Y3Q0pD?=
 =?utf-8?B?cWpCN0R6VGVwY3Bwd3NDNlNjN3Z4RWNiZWFjeVdhR3FOblN1YUhVQWxyTXFo?=
 =?utf-8?B?eDkwNUpTV1MvZ1cwdTIyc0wwc0dyODBXOHo1aGJoc1B5alNBN3Exd0RhY3Jh?=
 =?utf-8?B?OVJZQ0pya2FzbEpFQWdpeCs4QmVKRU5YSDZCYXNvWUxmZEhZZnBMZzR0aUJp?=
 =?utf-8?B?YTFQSmdtWVFDNGxFTXBqMjI4U01pZXdSaDFuejg0aEVRdFZmTmpVZk4wZ09u?=
 =?utf-8?B?TWlvT3BoNWV2ZTRSMU5MOGc0NzdWbko0RVJyUjdaYmFyTnFjRXJWR2NkTDgz?=
 =?utf-8?B?STRRS3VGY3B3UWtNbXNZSmswSmxhVmRSck4vbWhUQm05dmpMb1dIb1JFWkc0?=
 =?utf-8?B?SFpUQ3ZDaHpOVE9tOE9CZDl2UVFaY3kxUHhHNXFLUDVtbUI0bnZYa3B4VHQr?=
 =?utf-8?B?WHFmL0hobXpmbnZEOW5hT1B3THNvOS9uRVhEV0ZoSy9Namx0WnN5UmFrQm9H?=
 =?utf-8?B?NG9HcDhCZm8rSUY2NHg3dndaYm02YU1Yc01hcmJIZUFlTTRWU3NReFVWb0Rh?=
 =?utf-8?B?T1dwT2JFdzhlMnBTRk15VHF2NjR0T0RNRWtjU1dKQmhIQWo0amMrNjgrMHU4?=
 =?utf-8?B?R0xuMXdIeXV2OFU4UVBzVmxLT1NnaVRWZ3hCQzM2M3RheSs1YXcrSTZ4dDJE?=
 =?utf-8?B?emxHRGcxY0krUXlKTVV5N0Z6cnBIN3B5TXM4dVhwRVl3QWpmZENRYjVFVS9a?=
 =?utf-8?B?b2Flb3BIUFpxWnpCOU50OTMxOVRNMGFqY3R4bmQrNGdhbHZTQWpuMVJBQ1Fp?=
 =?utf-8?B?MFlacklyTmFzTk5BT05RRyszTWpKejVGbnA0TFZxdDM5WFAxSk5FRG9wQzRG?=
 =?utf-8?B?WGJudHRDRjNORTk2YVpZSUEySmFwNnQvbEkwZDFtRGtCK2FjTjNlcit3R2h2?=
 =?utf-8?B?eHM1eVlyOUtMbkRqMDF6bTFWVnA4cjBaRVAraEw4aXJMU0ZqdlZzL3V2MWxO?=
 =?utf-8?B?eVl5ZDE1L0ZzR2owZlhxejlyWDlaN2VWUEpSY25qOUJoY1MrbHF3eHFQVTAy?=
 =?utf-8?B?c002QWJid24ra3lYa3V5TlBZU0hjazRlUm9MeWRtNi9lZUljMmxJNDQ5bVlT?=
 =?utf-8?B?MEplWGtWUVB5c3IrNFRVM0tpWVlHNy9jM0lJSnZSeElRaWloQmRiZndxdEMr?=
 =?utf-8?B?Q0grVlplM1J0WEJQY0wrcm1yMFJqbmFOb1kxQ2REZzRjejhJRTBLb2RZa25E?=
 =?utf-8?B?cFZtdXhVdmtsSWdiZzVOVUtaVUdQdkR2UitOK3M4RTVOR3IrRit6Ymk5ZjA2?=
 =?utf-8?B?YkRUNTZjRUo1NUU3YzRicTdTRThlekxhRnpKUGFDWHBnMzVaa3ZKSnlwVzcz?=
 =?utf-8?B?TGR6RG94MWR2b0tuOWkrVlkxcnNWbklVbDgxVGJCRWVtN3FvR29vWjQ5Z3Vx?=
 =?utf-8?Q?x1w6Opqt8GQyWdnnAAxmDbcID?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bed47548-3481-4a77-00ad-08ddf5ae62b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:52:28.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9NgxH6Q2Egu1L/w88v8VjJE2qAuCDi9fVOM9tyT4XkAY1qSmbFVRwSjCA9wFkZjc6S8WTxM55iJa7uZzVNrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7874
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

Hi,

On 17-09-2025 10:59, Nilawar, Badal wrote:
>
>
> On 16-09-2025 19:35, Sk Anirban wrote:
>> When setting the minimum frequency, GuC automatically adjusts it to
>> efficient levels, potentially overriding user requests.
>> This patch adds the slpc_ignore_eff_freq sysfs interface to disable
>> this behavior, allowing users to enforce their exact minimum frequency
>> settings.
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_freq.c      | 36 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 49 ++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>>   4 files changed, 86 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 4ff1b6b58d6b..fb16fa5c6a0f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -227,6 +227,41 @@ static ssize_t max_freq_store(struct kobject *kobj,
>>   }
>>   static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>>   
>> +static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
>> +					 struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +
>> +	return sysfs_emit(buf, "%u\n", pc->ignore_eff_freq);
>> +}
>> +
>> +static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>> +					  struct kobj_attribute *attr,
>> +					  const char *buff, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	u32 val;
>> +	ssize_t ret;
>> +
>> +	ret = kstrtou32(buff, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (val > 1)
>> +		return -EINVAL;
>> +
>> +	xe_pm_runtime_get(dev_to_xe(dev));
>> +	ret = xe_guc_pc_set_ignore_eff_freq(pc, val);
>> +	xe_pm_runtime_put(dev_to_xe(dev));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +static struct kobj_attribute attr_slpc_ignore_eff_freq = __ATTR_RW(slpc_ignore_eff_freq);
>> +
>>   static ssize_t power_profile_show(struct kobject *kobj,
>>   				  struct kobj_attribute *attr,
>>   				  char *buff)
>> @@ -263,6 +298,7 @@ static const struct attribute *freq_attrs[] = {
>>   	&attr_rpn_freq.attr,
>>   	&attr_min_freq.attr,
>>   	&attr_max_freq.attr,
>> +	&attr_slpc_ignore_eff_freq.attr,
>>   	&attr_power_profile.attr,
>>   	NULL
>>   };
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 53fdf59524c4..0229a89e3ff8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -336,6 +336,8 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>   
>>   static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   {
>> +	int ret;
>> +
>>   	/*
>>   	 * Let's only check for the rpn-rp0 range. If max < min,
>>   	 * min becomes a fixed request.
>> @@ -347,8 +349,10 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * GuC policy is to elevate minimum frequency to the efficient levels
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>> -	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
> This code already respects the user’s request by disabling efficient 
> frequency when the requested frequency is lower than RPE. So, why is 
> there a need for an additional sysfs entry to disable efficient frequency?
>
> Regards,
> Badal
Currently, the SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY parameter is only 
set when pc_set_min_freq() is called—and even then, only if the 
requested minimum frequency is below RPe. However, after the driver 
loads or when the requested frequency is above RPe, there's no way to 
manually enable this parameter. As a result, we see frequency 
fluctuations during IGT testing.

Thanks,
Anirban

>> +	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> +				  freq < pc->rpe_freq || pc->ignore_eff_freq);
>> +	if (ret)
>> +		xe_gt_err(pc_to_gt(pc), "Failed to set efficient freq\n");
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -737,6 +741,45 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>>   	return xe_guc_pc_set_max_freq_locked(pc, freq);
>>   }
>>   
>> +int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val)
>> +{
>> +	int ret;
>> +	u32 min_freq;
>> +
>> +	guard(mutex)(&pc->freq_lock);
>> +
>> +	if (!pc->freq_ready)
>> +		return -EAGAIN;
>> +
>> +	if (val) {
>> +		ret = xe_guc_pc_get_min_freq_locked(pc, &min_freq);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
>> +	if (ret) {
>> +		xe_gt_err(pc_to_gt(pc), "Failed to set ignore efficient freq(%d): %pe\n",
>> +			  val, ERR_PTR(ret));
>> +		return ret;
>> +	}
>> +
>> +	pc->ignore_eff_freq = val;
>> +
>> +	if (val) {
>> +		ret = pc_action_set_param(pc,
>> +					  SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +					  min_freq);
>> +		if (ret) {
>> +			xe_gt_err(pc_to_gt(pc), "Failed to set min freq to %u: %pe\n",
>> +				  min_freq, ERR_PTR(ret));
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_c_status - get the current GT C state
>>    * @pc: XE_GuC_PC instance
>> @@ -1382,6 +1425,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   	if (err)
>>   		return err;
>>   
>> +	pc->ignore_eff_freq = false;
>> +
>>   	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>>   					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>   					  XE_BO_FLAG_GGTT |
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0e31396f103c..3a87d0da609d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
>>   int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
>>   int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>> +int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val);
>>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
>>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..c3b44598507b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>>   	struct mutex freq_lock;
>>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>>   	bool freq_ready;
>> +	/** @ignore_eff_freq: Ignore efficient frequency */
>> +	bool ignore_eff_freq;
>>   	/** @power_profile: Base or power_saving profile */
>>   	u32 power_profile;
>>   };

