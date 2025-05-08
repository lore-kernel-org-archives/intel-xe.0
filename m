Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEACC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 06:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0208110E8C0;
	Thu,  8 May 2025 06:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQZQHM4b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B7910E8C0
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746686870; x=1778222870;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CkJAVhLP4mk8A/DLf7yHU8hswz+BsvwG6yKDiIA2D90=;
 b=GQZQHM4bW4lZLS/qCX3G9DKlkw5vFP14R/9RbiNr8s/AMn2q4w6l79sS
 Y94lDNqgbr8h7R9HQmiz67H4l0HquYPLE0ZTxFk/xxyxSS91gckyQaoGa
 RTi9KzgdTbPsD9tGDT2LFEafBvDb8sIYGHOYiDdSYXq/zOchf1vGDvqd2
 Xnxcz4yvNZPKJ0tlvZBCMhcdo07dvNOWDKodTbh3+As9+LivZg8U3I6jN
 Cr9p+rHNmugHaq+mQfXIhczj720n/g+yQxcCTdTPjZ3p3/lp+UcSukEYU
 IZnaun9bgOhviTnhmxnsZyzLc1033WvTZgmZ82VG2CRlm+piYYZ2BB4e2 w==;
X-CSE-ConnectionGUID: fTOY9tylSzKsC5Ii5B9deQ==
X-CSE-MsgGUID: 435HgSfgTNKYuqviqC/Pwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48536301"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48536301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:47:47 -0700
X-CSE-ConnectionGUID: gASaif9+R42GHTnCge0b6w==
X-CSE-MsgGUID: cwRTCL2cQyuiW6wANbYtqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="140960593"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:47:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:47:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:47:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDhGtEBqYHczQ91Ni74vQ9jqPgxByAUW4YuTgnfHUZMVyU/W1k0B8FOs0KqNnS9VVIW3401U7aT+8vP6dXiGurObeTSlBEuIGXIDt7ugrzBUdASOl2w4x4sEpiFN1rgJIn2CHtn7/ZurvfWXChT6/ideZe/ZEGwaWyHTOgVsCvbhOcHIFFEOOVcc18ksLABoDnjkJZyoLUm4EuNhF7l6SC5aPc8vhfbob5eoHYwuLTVA9DECEbKrdHGon040omIQXNN3bLqTBrQ+AvyGc1/w4oXxxsAE/jU+5R1mfPQZEu+M+lCjfH2Jq93LboQyQGkHDzZ7mqmTfSdENnm8/pGWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDAMGm9TbmJz9QRNFOULeGYDbwrmErFuJ8jteA5kmW8=;
 b=EKiBpFKZoSIKa0ox9CkQRLJJRNi2eXHrz1aG8ZEJ29hvmsemXuga3TuTIjZ76Y2y3MO2LwE50bZamwHDlsTKBxfpg9ItfFEc665t0K7NweWt8KR8e2aPTsROr5MXLR2KRjyTnoIb5DbyRI53N2tIDAvQI0wbeTng+g0niuHPYJ3FIFa5Mga6VWNmgCEybM5ixXhP5Yo8qsTLwNem5Eq0D/fbF84fOeQoE7MjzUi7SYdgWzrnEg8y82jw0ZIc58+XK6yR1o+D7u7BuZv1t+G7aVYpVvNzmArqyHayRrOffbXPUbVxbQ21iooNSVuoaXVMnSyHnedKCbWc/C0SABL5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 06:47:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 06:47:38 +0000
Date: Wed, 7 May 2025 23:49:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Add migrate performance kunit test
Message-ID: <aBxT4G5v9IyWrhoz@lstrano-desk.jf.intel.com>
References: <20250502093514.510621-1-dev@lankhorst.se>
 <20250502093514.510621-5-dev@lankhorst.se>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502093514.510621-5-dev@lankhorst.se>
X-ClientProxiedBy: MW2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:907::39)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: ca96c1c6-a105-4a70-ae7c-08dd8dfc392b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZNbUZBR3lvcnA5QVkwZldIZVhoWUZsOERKaFpodi9mQmZ1MFdNWjAwaTRN?=
 =?utf-8?B?T25RYXQzQWwzQzBVeTJtL1VPandNeDhVOEVsWlBVVnI0c1lDMzFrMDFaTmRR?=
 =?utf-8?B?TXFxYkFkNVprUXdvMEgvOWNWclpuaEZ5OCtYcTA3aEZMeGJYRXRDWlNLSk9O?=
 =?utf-8?B?Rmd5ODlOa21JQTV3Nm9Ka2RUTTZ1Q1UwSncxK2FBSTIzZXhIODV5c1ArOVZB?=
 =?utf-8?B?NllyaFlUMUpPdktZR3hGL01lYkorNkJ4WFYxTldqaDVIb29KUGFZbWpUWkxt?=
 =?utf-8?B?TzFqZmRMWkY3eVJ2UDlEVENCdHRtY1dhbTZ1OUtzVXFYUVNyQ0xNMVh4Yjhm?=
 =?utf-8?B?YnQrZzlRTFJzNWx1bXA3MjEvU0drTy9OLzBvNGhmV1lkakZIeURKbXZmTDZP?=
 =?utf-8?B?dHZ3V2kzQjA5aUx4bHdFbmdKcDZFb0tPem9jS2d4dzkvb1Nta1MxNVluMkhs?=
 =?utf-8?B?c0FCVURPd2c5RnArR0E2dDhsZnZJSE5VNnFPYWJacDZXNlJnR3VsdG9UemxF?=
 =?utf-8?B?VW16eUtEQ2JnbERuMTNoYS9MZkhFSVBJYUsvVXRsSzJYZVlGS2NUY09qdFk4?=
 =?utf-8?B?Q2g0amI5a2NUZDJtOGlxalRWWndzZEFlMjk5TTdRektFTVVCNi8xc2JFWnlx?=
 =?utf-8?B?QVA2L005d0FTb0RUZ0NLK0VhNENuSi9WQy9NckNKL3l1dW1hVDRkaEJ6MDVW?=
 =?utf-8?B?ZHFwZlo3eHh4WDRnclFNVHJuaWg5cjBkR2xlRTREbmhEV1JKNWhmZTZlc2pS?=
 =?utf-8?B?WUhtL3QrT3RLZ09vcGFUOWZDQ21VemRYRHBxd0YrbGFJZWVia3JWZDJvODhT?=
 =?utf-8?B?MEN6QmVWZFdUTGl3dndCWVh6YkdkUlp6dzRnVGtvRXpydkNIV29lWHZIWVQw?=
 =?utf-8?B?anJDNm1kZHNubUc5bzFQdy96Q1krcmgyc3VraGYzRGpVWExLNGpvdVJDV0Vx?=
 =?utf-8?B?SlU1NVZSNll4bU44RCs3Tzhlb002VGlqRUhORFNYWEttNlhKVWN0Zmo0Rjk2?=
 =?utf-8?B?b3M3SkROTXByalBWSDB0c3RWbkZxRm05T0tCVldtTXgwVTdMM1BKU2svL0hw?=
 =?utf-8?B?cDVFaTF4d3dlS2VHTXA4SC9kMDBOL3N5TTNXM0xYa0ZoRCtlSWhRUTUyeGJ4?=
 =?utf-8?B?eUk0eno1SzZZV1JoUDlOS1J6dkU2U1JpdjhlMytPcjhKUEVCL0N0Ly9PamFL?=
 =?utf-8?B?WWpWQ1JJS2ZSUEhWYjNFMkxKblFwZ1VTTTNrUnljYXkxTlh5QmhFbkxmZk5O?=
 =?utf-8?B?LzF6SytpcXFGelluc2g3RlhpcmVEVzcwaUlWNG0wWnk0czVRS3MvdjA1eFF1?=
 =?utf-8?B?ZExURUN2b3hZOExyZnMvZzdPd1o5NlkyZExNSDVwcWM5Qy9YK2JKRnl3aGdz?=
 =?utf-8?B?YlhoV1NuUjltTXlHbERzY3I2TUh4Qlhma2FiYUpuUTFkenhjcHdJcUhCWEVH?=
 =?utf-8?B?anhXNW9QMFU1RzhBc3I4cmFPL09kSlVOTW9aMEpJOVhDeXJFVHVJSHNlNnhr?=
 =?utf-8?B?aG9ZZVduWGJQeEc5MU9pOWpFMVU5YVhmb2IrWHJiMzFGM01FZXdZYWNqQUkx?=
 =?utf-8?B?SEZpWkN1RG4rN2RXUUpKOG1zbGFFQ0N5dGFhekNOM21SaExoUTRSZUkxakhO?=
 =?utf-8?B?THZ0ZmVVMkY1dktsOTNuUWhiT2FDTkE3VVpEd1FlZkhxenlpWnZxWjhIVWho?=
 =?utf-8?B?WGJuTEhUMmc1cTU0dk5oWm5MZlkvSytqWTZGM295cFF3UGlGNzBQZUY3bHZq?=
 =?utf-8?B?YlZ0MWxJa2c5OGJiSG5DYU84V1RVQzgwcUZXY0J5UC9GQzNQU3ZOcUN2NHps?=
 =?utf-8?B?dG1KazJlZDZCa3duWEVqbWkvT1N0bXRPcnBKOGJPMVFpOUo2bDh3dEJURVdN?=
 =?utf-8?B?R21pcDNlTTV4RWVvTTQxVS9oVzJQRmV3RVlzUnFOYTBGKzBhY21tUXN3ZmFq?=
 =?utf-8?Q?IQUUz7C94/Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEJYS1BBMVdvT0txaStsT1gxQ1RBRnRmL2FSS25JdVp0VTJRNTR0bGYzMWlM?=
 =?utf-8?B?SEgrL1VzbkIzWGk2VWRRQmpNeCtsbmFXQ1QrWWcxQVNLandvekVUM1g1NnVB?=
 =?utf-8?B?NUlyU3EzMFBwYjdva1hvSFQ0L0hSaG1tKys4bU9YRVdIeHNsRklrbmpCQmsv?=
 =?utf-8?B?dWFTTmhZd0l6ZW1iZ3hiajFIRG16TDdJUmlHTkpIVjhCWk82TktSTDhLcy85?=
 =?utf-8?B?S1VRQzhzS2NjZ1N4RnlZYjJVZElWK0Z1MXVBdEJFQkE4R2xRQlBxZlBpZ0dF?=
 =?utf-8?B?WnNYdWtDd2YxVVhNaUFzc2Q2OHYveXRMcUJtSmNwNHJ5RWxFczVWSFB4THU2?=
 =?utf-8?B?Yy9BSE10MURBK25TZjVLaHFtS1VHSzlTLzI1UE4yVUtrOXN1SWx6S1hEdzMw?=
 =?utf-8?B?eCtZdG1neFBGN09qTlBKcDlHU2U5UWlSVzRyOTUxZFROMU9qNjQzaXlwMEJ1?=
 =?utf-8?B?dUcycWZoREpFYUt5OVNTTGdNZzhZVkdTdUdydjcwelMrQW1jWmtRdEhTVERF?=
 =?utf-8?B?NzVybjJ6TzFBam9LNi9hVmYzbC9nYVp1SmxKcTZxQ3NHeDFjeEdxeFVqTndU?=
 =?utf-8?B?R2pHckc0NXZGTTRLejlTbnl2b1NUdEJEVGpHcUp1WUJNOVZqYzQ2MERpQTJW?=
 =?utf-8?B?MzZxNEJMVGR1ak5EbytaN1Y1aFRFMW9JeXlXNUhHT2M4bmI4SVZydk84RXhq?=
 =?utf-8?B?QStFcXQwbGtvdFlzOTd2d1lTWTNEbTFDVVFyOHlFay9xbndVNTBTNzFueEdS?=
 =?utf-8?B?T2xZOGRibWR3eUNaM3I0UGdhdVlhMy9sYzdwclg2R3FKQWJnblRnL3V6cFQz?=
 =?utf-8?B?dzhJTGxsVXlEdDk5aUtSTGowaS9FaGtTNVlLOHY0bXMvVWR5SFF3M3lJRDFL?=
 =?utf-8?B?eEVOMWpWS1hPbzBWVFJENDQwTmMxN2tscmdxQUFRUFBMaktlNUR6cjFCVk1S?=
 =?utf-8?B?eUxpSFQra09VbGJ6K2FpV2kwNnBPMXc0eklrL0hmUEEvdkE2YXZIN2R2VXJ5?=
 =?utf-8?B?eStIQ3VsWU5WNFpiQlJ6S04xaURKQVdER1d6bVNwdnFZS2dJV3ZMZThLa0Vz?=
 =?utf-8?B?M2Z1VWN4bytRL1lwOHJISXJOdU8xOUVWN1l1Q2s2OW1haVh1TmFGa0duUUZz?=
 =?utf-8?B?dktLYlpKek91TmdLeW9XdWl0S0F5NDk0YUs0R1g5OUhWM2w4RVN2THhxaXJn?=
 =?utf-8?B?Szh1NEZsLzFzeXkvbW1VSUJIblNGTDJMR0l2Q3dwMm1OeGEzQVNhVll0OElp?=
 =?utf-8?B?a1Q2UXFsbjJ3UTRKbnpYczFaWnRoSFRSRnVVUEJLVEJrNWtJTkg0Y25FcVJ6?=
 =?utf-8?B?Zm8zMktPYmtNZGRzdkNpUVFEVEdNRmRQcGRQWjkxWnpSODU5cm1VUzd6NTJ5?=
 =?utf-8?B?QzN3TVBXTnhNZmtRVUtmcXhBZkFlbTdBVDRBU2FlU3IrRWJGRFZLS1c5bS84?=
 =?utf-8?B?end6TkJKbHVXNzcwZ3Y1N3VYUWFLR0JML2toUlp6THdzK3YwNU5qbXduQkZK?=
 =?utf-8?B?RnVzajdSMWJmWW8zaU8xRzZZTlhCc2tLaWVMS0RtU1ozZmZjVTNuOVJpSGhK?=
 =?utf-8?B?OFlNRVNtWHplOWZNN3J2WTJzVFBoQVJsRmNRaDd6ZjBjUHc2eXhCNVEzR1g5?=
 =?utf-8?B?aGpyZXRBQWVYUkY0OENYa3hVOXQzb21JK29DRE1SSUtrYWx1Nm9td3I5eVlR?=
 =?utf-8?B?NXZUYXkvNkR1NXpLcjBPYURyaCtBbmlDMUJVSkVMRnlMUGNsZkt6cWU2TERJ?=
 =?utf-8?B?Z2ZUUjhzWkJ0OUlnQjd2UjQ4bzk3Umw3RW1VQjNCd1QzT1FTdHdjdE9BbWtM?=
 =?utf-8?B?MlQ1NmFJaHgwTGFlSnZWRncyOVlod01ib3ZTVS8wMkh3ZkdKeVJnRnAvVUFL?=
 =?utf-8?B?cjcxUnZIaUk2VUNscVRMYmc3ZHgrSjl4SXNLSVVoamdEVis2VU9yL0Q1TVRt?=
 =?utf-8?B?NktidTh5akJ1d3lEWVhlY0pmcTZFZ2R5T3FYYnRRQ3U4UnJrV3ZZS2h4Si9w?=
 =?utf-8?B?TmZzc0VtdlhIM2NvYklWRGNkV3ZFSkMrMHB6d2lndkw4YXAvKzcxdlBnYzJL?=
 =?utf-8?B?NC9TajlEaXEvbzJTNm13NzhzakVocHc5RFRSaXZPSDV3UjIvQ1FJQjNnbEtZ?=
 =?utf-8?B?S2NiVmpJaXNWL1NSdGF0T0doL3RibE4xU2FuMEx3VXhjS1lVSCs1VXYxYWlY?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca96c1c6-a105-4a70-ae7c-08dd8dfc392b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:47:38.8539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAz8j/ij42ZnnJydhw+ZpxFV1GjOpO2PmNuVcH7KxmxPvc/IEbRcZvOz/joS3/QUJvJhjXCehfULi4N8ZkZPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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

On Fri, May 02, 2025 at 11:35:13AM +0200, Maarten Lankhorst wrote:
> Ever since we added migration, we didn't have concrete numbers on how
> performant our implementation is. We are currently writing pagetables,
> flushing, then writing data and flushing again. Lets see what happens
> when we fix this.
> 

I had the same idea—but in the context of SVM. Using 2M DMA mappings
(out of context here) or switching the paging engine to ULLS (in
context) was what interested me. This is a good start to build on.

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 235 ++++++++++++++++++++++++++
>  1 file changed, 235 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 12a3318b1a5d5..d8992ba71281b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -661,6 +661,128 @@ static struct xe_bo *migratable_bo_create_pin_map(struct kunit *test, struct xe_
>  	return bo;
>  }
>  
> +static bool handle_vm_fence(struct xe_device *xe, struct dma_fence *fence,
> +			    struct kunit *test)
> +{
> +	bool ret;
> +
> +	if (!fence)
> +		return false;
> +
> +	ret = sanity_fence_failed(xe, fence, "VM_BIND", test);
> +	if (!IS_ERR(fence))
> +		dma_fence_put(fence);
> +	return ret;
> +}
> +
> +#define BS_BO2BO MAX_PREEMPTDISABLE_TRANSFER
> +
> +static void write_bo2bo_copy(struct xe_tile *tile, struct xe_bo *batch,
> +			     u64 src_ofs, u64 dst_ofs, u64 size)
> +{
> +	struct xe_bb bb = {
> +		.cs = batch->vmap.vaddr,
> +		.len = 0,
> +	};
> +
> +	while (size) {
> +		u64 block = min(size, BS_BO2BO);
> +
> +		emit_copy(tile->primary_gt, &bb, src_ofs, dst_ofs, block, SZ_32K);
> +
> +		src_ofs += block;
> +		dst_ofs += block;
> +		size -= block;
> +	}
> +	bb.cs[bb.len++] = MI_BATCH_BUFFER_END;
> +	xe_gt_assert(tile->primary_gt, bb.len * 4 < batch->size);
> +}
> +
> +static void compare_bo2bo(struct kunit *test,
> +			  struct xe_tile *tile,
> +			  struct xe_vm *vm,
> +			  struct xe_exec_queue *q,
> +			  struct xe_bo *batch_bo, u64 batch_ofs,
> +			  struct xe_bo *src, u64 src_ofs,
> +			  struct xe_bo *dst, u64 dst_ofs,
> +			  const char *description)
> +{
> +	struct xe_device *xe = tile->xe;
> +	s64 t_migrate = 0, t_job = 0;
> +	int iter = 4;
> +
> +	for (int n = 0; n < iter; n++) {
> +		struct xe_sched_job *job;
> +		struct dma_fence *fence;
> +		u64 delta;
> +		ktime_t start;
> +
> +		start = ktime_get();
> +		job = xe_sched_job_create(q, &batch_ofs);
> +
> +		write_bo2bo_copy(tile, batch_bo, src_ofs, dst_ofs, src->size);
> +
> +		xe_sched_job_arm(job);
> +		fence = dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +
> +		sanity_fence_failed(xe, fence, description, test);
> +		if (IS_ERR(fence))
> +			return;
> +
> +		dma_fence_put(fence);
> +
> +		delta = ktime_to_us(ktime_sub(ktime_get(), start));
> +		drm_dbg(&xe->drm, "[%i] Job (%s) copy of %lu buffer took %llu µs\n", n, description, src->size >> 20, delta);

Can we calculate the bandwidth in addition to time? The same applies to
all debug statements.

Also, I think we should test small sizes too—e.g., less than 2M—to see
how small copies affect bandwidth. So >> 20 wouldn't work? How about
"npages %lu buffer", using src->size >> 12 (or a defined constant)?

> +		t_job += delta;
> +
> +		start = ktime_get();
> +		fence = xe_migrate_copy(tile->migrate, src, dst, src->ttm.resource, dst->ttm.resource, false);
> +		sanity_fence_failed(xe, fence, description, test);
> +		if (IS_ERR(fence))
> +			return;
> +
> +		dma_fence_put(fence);
> +		delta = ktime_to_us(ktime_sub(ktime_get(), start));
> +		drm_dbg(&xe->drm, "[%i] Job (%s) migration of %lu buffer took %llu µs\n", n, description, src->size >> 20, delta);
> +		t_migrate += delta;
> +
> +		cond_resched();
> +	}
> +
> +	drm_info(&xe->drm, "%s %lu MB buffer took on average %llu us for copy, %llu us for migrate\n", description, src->size >> 20, div_u64(t_job, iter), div_u64(t_migrate, iter));
> +}
> +
> +static void performance_tile(struct xe_device *xe,
> +			     struct xe_tile *tile,
> +			     struct kunit *test,
> +			     struct xe_vm *vm,
> +			     struct xe_exec_queue *q,
> +			     struct xe_bo *batch_bo, u64 batch_ofs,
> +			     struct xe_bo *sys_bo, u64 sys_ofs,
> +			     struct xe_bo *vram_bo, u64 vram_ofs,
> +			     struct xe_bo *alt_bo, u64 alt_ofs)
> +{
> +	drm_dbg(&xe->drm, "Using %u block size for copy, %u for migrate\n",
> +		BS_BO2BO, MAX_PREEMPTDISABLE_TRANSFER);
> +
> +	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
> +		      sys_bo, sys_ofs, vram_bo, vram_ofs,
> +		      "sysmem -> vram");
> +
> +	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
> +		      vram_bo, vram_ofs, sys_bo, sys_ofs,
> +		      "vram -> sysmem");
> +
> +	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
> +		      vram_bo, vram_ofs, alt_bo, alt_ofs,
> +		      "vram -> vram");
> +
> +	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
> +		      sys_bo, sys_ofs, sys_bo, sys_ofs,
> +		      "sysmem -> sysmem");
> +}
> +
>  static void bo_unpin_map_user(struct xe_bo *bo)
>  {
>  	if (!bo->vm)
> @@ -672,6 +794,116 @@ static void bo_unpin_map_user(struct xe_bo *bo)
>  	xe_bo_put(bo);
>  }
>  
> +static void performance_test_run_tile(struct xe_device *xe,
> +				      struct xe_tile *tile,
> +				      struct kunit *test)
> +{
> +	struct xe_bo *sys_bo, *vram_bo = NULL, *alt_bo = NULL, *batch_bo = NULL;
> +	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> +	struct xe_vm *vm;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +	u64 size = ALIGN(tile->mem.vram.usable_size / 3, SZ_2M);

I think we should loop over the code below—i.e., test different sizes
and measure the bandwidth for each. That would be interesting. Make it
table-driven—4K, 64K, etc. This would also help identify bottlenecks in
the code or hardware, giving us insight into what to optimize.

> +	u64 block = ALIGN(size, SZ_1G);
> +	bool failed = true;
> +
> +	vm = xe_vm_create(xe, XE_VM_FLAG_SET_TILE_ID(tile));
> +	if (IS_ERR(vm))
> +		goto out;
> +
> +	q = xe_migrate_create_queue(tile, vm);
> +	if (IS_ERR(q))
> +		goto free_vm;
> +
> +	xe_vm_lock(vm, false);
> +
> +	sys_bo = migratable_bo_create_pin_map(test, xe, vm, size, DRM_XE_GEM_CPU_CACHING_WC, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);

Line wrap issue. A couple other cases too.

Matt

> +	if (IS_ERR(sys_bo))
> +		goto free_q;
> +
> +	alt_bo = migratable_bo_create_pin_map(test, xe, vm, size,
> +					      DRM_XE_GEM_CPU_CACHING_WC,
> +					      bo_flags);
> +	if (IS_ERR(alt_bo))
> +		goto free_sysbo;
> +
> +	vram_bo = migratable_bo_create_pin_map(test, xe, vm, size,
> +					       DRM_XE_GEM_CPU_CACHING_WC,
> +					       bo_flags);
> +	if (IS_ERR(vram_bo))
> +		goto free_altbo;
> +
> +	batch_bo = migratable_bo_create_pin_map(test, xe, vm, SZ_2M, DRM_XE_GEM_CPU_CACHING_WC, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +	if (IS_ERR(batch_bo))
> +		goto free_vrambo;
> +
> +	xe_vm_unlock(vm);
> +
> +	failed = false;
> +
> +	fence = xe_vm_bind_kernel_bo(vm, batch_bo, NULL, SZ_2M, XE_CACHE_WT);
> +	failed |= handle_vm_fence(xe, fence, test);
> +
> +	fence = xe_vm_bind_kernel_bo(vm, sys_bo, NULL, block, XE_CACHE_WT);
> +	failed |= handle_vm_fence(xe, fence, test);
> +
> +	fence = xe_vm_bind_kernel_bo(vm, vram_bo, NULL, 2 * block, XE_CACHE_NONE);
> +	failed |= handle_vm_fence(xe, fence, test);
> +
> +	fence = xe_vm_bind_kernel_bo(vm, alt_bo, NULL, 3 * block, XE_CACHE_NONE);
> +	failed |= handle_vm_fence(xe, fence, test);
> +	if (failed)
> +		goto free_batchbo;
> +
> +	xe_vm_lock(vm, false);
> +
> +	performance_tile(xe, tile, test, vm, q,
> +			 batch_bo, SZ_2M, sys_bo, block,
> +			 vram_bo, 2 * block, alt_bo, 3 * block);
> +
> +free_batchbo:
> +	bo_unpin_map_user(batch_bo);
> +free_vrambo:
> +	bo_unpin_map_user(vram_bo);
> +free_altbo:
> +	bo_unpin_map_user(alt_bo);
> +free_sysbo:
> +	bo_unpin_map_user(sys_bo);
> +free_q:
> +	xe_vm_unlock(vm);
> +	xe_exec_queue_put(q);
> +free_vm:
> +	xe_vm_close_and_put(vm);
> +out:
> +	if (failed)
> +		KUNIT_FAIL(test, "Test setup failed\n");
> +}
> +
> +static void xe_migrate_performance_kunit(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	if (!IS_DGFX(xe)) {
> +		kunit_skip(test, "test requires VRAM\n");
> +		return;
> +	}
> +
> +	xe_pm_runtime_get(xe);
> +
> +	for_each_tile(tile, xe, id) {
> +		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
> +			kunit_skip(test, "Small bar device.\n");
> +			break;
> +		}
> +
> +		performance_test_run_tile(xe, tile, test);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
>  static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
>  				       struct kunit *test)
>  {
> @@ -740,6 +972,9 @@ static void xe_validate_ccs_kunit(struct kunit *test)
>  
>  static struct kunit_case xe_migrate_tests[] = {
>  	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param),
> +	KUNIT_CASE_PARAM_ATTR(xe_migrate_performance_kunit,
> +			      xe_pci_live_device_gen_param,
> +			      {.speed = KUNIT_SPEED_SLOW}),
>  	KUNIT_CASE_PARAM(xe_validate_ccs_kunit, xe_pci_live_device_gen_param),
>  	{}
>  };
> -- 
> 2.45.2
> 
