Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38978E73146
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 08:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E625C89A1E;
	Mon,  2 Feb 2026 08:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsKtt6q1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF8089A1E
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770021823; x=1801557823;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j8lc03JBip4zMe7VmQ9RU+jbq1Ee0HFdcjokiPdSriE=;
 b=YsKtt6q1wqK/+bt57+DekQm5YCd+tCZ9MlAGupgKEhkzkRfIzaii2RYu
 dhGKE4kNGNAMjx55+LXDW5PWZ6yU/lYqKQ2AjJ8WkOwkoQM8+vwuTzlly
 09poTy7C1wp4PgyconMyKhY2ng5m4OI8RUj801vZ/xtTJ5/H5XcdMhOE0
 7FKi+y0yPeJHZMZ4dHhXdZV5LbDQ5QG7djdwBWYXVUReAcDQ/unt1R0to
 g/EGFsYToFZrwKWvSgHMVHB6tMNcfZK2AzYmS5iGjlj7kyvXlrdnrxH4W
 NCb6aodA9zxuV2kLRyxS5saqz9lQR1y+Mj3MPhvcXFr2b+3qy1ejTWJV4 w==;
X-CSE-ConnectionGUID: dR7qTJ6GSUmrbjXG0FyvYQ==
X-CSE-MsgGUID: j8Q3O+3kQoiD4bAOgluqCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71076242"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71076242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:43:40 -0800
X-CSE-ConnectionGUID: LL+YO71cSqqC+lbTsrbD3Q==
X-CSE-MsgGUID: XCnKfTk0S121aolrO5wB0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209251807"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:43:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:43:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 00:43:38 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 00:43:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1URxsc3TyhZMJwcxdPRsbYdabhrV25rwOzDfzMhwgzYNVAB+fBkPxXlbz2dD6jKHCsfVd6+UUlvQGp4rNqBXsff8wSwYOQHvpkUyU3FwGoGD8b3knL86TTJ6gL2nfNHsPXuq2JijVn083n9QyTowB+JifxvyNXs1GOEsZTWa9lSDcrrLKaKNNI+TI9HJ9DpOxRDmENF3rv7VG8UkS6CecCTR28obKWXi/5CgGbG01wi+c5s88xYihfPLSZf6D8d0WcHRV+n/fFc7e2fnk0fa1yhDbivjpv5C/t1aLX+uEHD9CsJHpvZArjL5ECCxIs5rp8v8O1boVAvXuKpAIccGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUs/+JYIX5CGx8OZ0+/pTPCUQgyw1W6iyToFAgHzDFA=;
 b=jhQcnlum5BaBDEMUDCCihDMhr+0EKlnScUjeUc8jB/O9iQDQC7jmMr+VxpMd+/xv3mlbERXaa0yhJQhrWr3U9R/g95FwvvDH7xmRQrYbV7gexy7GkW2ULevNMb59/q2bH2PEXExbqZmN88Cz/YS/32ZkSyBQbsLWCMfeQjtZ09oiYxovlncE8orPHKqJzc8yIbh5AsW2ZKvzMzR8MbAEgLlwSyVanbikWswt5vs2Jon1s4ryzMU2isgQyh54ZEKMItzHoE2aGUt2qryYlLFAs3EbZbMxhrePbsJ57VpRzFuN5yttdcdww4Gf2Op33ejosA5i5W9fvJ9z2TODPIrqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH2PR11MB8813.namprd11.prod.outlook.com (2603:10b6:610:282::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 08:43:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:43:36 +0000
Date: Mon, 2 Feb 2026 09:43:33 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Message-ID: <20260202084333.43nnxe2zpqaxcjuo@intel.com>
References: <20260130155522.2738547-1-piotr.piorkowski@intel.com>
 <DM4PR11MB5456EABC995F7621BE2AEB76EA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <DM4PR11MB54566BB2DC2FE8DB2BE2609CEA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB54566BB2DC2FE8DB2BE2609CEA9FA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: DUZPR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH2PR11MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 865917a8-8d14-47ae-04c8-08de623727c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnlWMWg1b3RnbzRxRGJybWJWNHVBZE1EemQ5dklNRHJvQURCQ3NoeStrNWpx?=
 =?utf-8?B?Zm96VHJWOXQyTjlBNVFiZjVXRm4wMEVkVjdUdXB5V0p2MHV1MVFmSFRPMm1Z?=
 =?utf-8?B?TEw3NE1nWDFMZnlOM09UZ01BdzdEeWZDdFJPc2o1M3NPT0V0dG0vdlJqT0o5?=
 =?utf-8?B?ZTUzSndWNE9aOGE0eHUva1NHYmlHOXRKZXpRMVZXUWNGYnQ0YlozNnlOMmc5?=
 =?utf-8?B?aTYyUUx6RDNodVBmTFhnYnBzUUtiM1lXT1IzYkEyOTExUzJvTFlwNndyeTIx?=
 =?utf-8?B?YjJuc3E5MUg4VjYzaENOVUFyb0pRNmtiQzFjMmZDY2tDS1JpQ3FoOVNnM2ZJ?=
 =?utf-8?B?ZWswV3NBazZ5dTVyRldnQndNRzZFOWVqdVFhbVpDVFBTWGZkRGx3WERKYVNy?=
 =?utf-8?B?QU1VSk40a2VYSHZwOXVCRzhRUzVteS9qeWRqU2Q2djZMVzgzVHlzRmtzQVhX?=
 =?utf-8?B?cDNaSmNiRUVLVmRUejZRc09MWjUzaGUzOVJ0SWltZEl0Z0tSc3hETE9EY3Vo?=
 =?utf-8?B?RkNDUStBamdKOGM4eUo2R1lWM0ZNMlhPOUpmc3pFNEZ0d1RkWmc1TVAvZjBC?=
 =?utf-8?B?dGRZbEY3bitZRmV4VmdWMVpEaCt2RGw2T0JxSGlrSjVKU1M4bFhjR3pZZkp6?=
 =?utf-8?B?RElsZjh3MTlONlVmdHlVYy9qNHpCNm1HbUlReEplOG9NbzVOc0phVlJtYmdD?=
 =?utf-8?B?SVpJSU0xc3pycEhiaVNyUHh4cHgxcnZlaFViam1HTVNlbHBNNnJiZkYzVGRm?=
 =?utf-8?B?UW05Uzl6MFhqRTl5VzBvUDdiMXpiaGhGcXlRSmtxSWptcDU1akdPSHN1cWRy?=
 =?utf-8?B?RnZWSE12eEtMTnJoRGZ6SDFaclVscEw1Q2t2RDl6b25KRk5tSG4rZmI5RVhH?=
 =?utf-8?B?ZjdjVGpSMDRlU21BQ0xRcFlNYWRlb1hCNEgybDVUQWdENEhTZittVWppQTgv?=
 =?utf-8?B?RnBpdXhaSmF1cHdZSTZVcmlITTZWcWFFS1lRYitLYzg5Z3dQcHVXZkQ4dW9N?=
 =?utf-8?B?aDlwaXhSQ1NYckNncENLL0wyZzR3RVY0VnFJVU5ZODlCRDBKbEMxalJ4eWc2?=
 =?utf-8?B?cGVCSmU0Ly9pWHVyTGoxVmc1N0E2cUtjeW1yTk16S2lMUmtHeFI3a1Y4a0JM?=
 =?utf-8?B?YkYzdjVMYjVtR2J4ckxNdWlhNDZ5VytaOFVZTUQzeWxUaUJsazBiTkdrSE5o?=
 =?utf-8?B?aTVxV3poZGVoRVhJdm9rSnREdDdtMmJCNTQwTFdVdkRKdTJKQzFwY3hYR3JJ?=
 =?utf-8?B?SlAyYXRJN0VERGh2QzNONjFYbjBITUZ0VWJvNWFCRUZsUE41M2NZVjNHUEN6?=
 =?utf-8?B?SUVjVC9YaGhMOUZtM1l3Nkd3cUpaSWRJMG8xTGdvcTZTTGNhYjFDTFJpNE9s?=
 =?utf-8?B?TVA2OHI0eVJJRE4rcHhCK3kzLzFzODJWbnkxckwraUpHN3I5anFCRjZvZTRm?=
 =?utf-8?B?SjdaenpLTkQ3R1lRd1czZG9EMWcrYVNLdWcyZ2RiZTRZeEFQM3YxNlpZT3Bn?=
 =?utf-8?B?THl2NzMzYkY2Y3VpM2wvZVpieWtEUWJ4TkI5WnRQanExN1kyZFB2SGZvQkNN?=
 =?utf-8?B?S1pFblcxaWU0QTB1a1VGM1E2MnlyTVBWLzRuT210SDd1QVBEa2haTTFkSWtt?=
 =?utf-8?B?QWsrcElGeWtKTXJVa2hzLy85UVNUYWhhN1BCMWZvdkxJY2thOVU2QUxMMm91?=
 =?utf-8?B?QkV3LzRLRURSNDliMHZaMEF5ekdXd0R1eGVFS3k1US80b1FvWlBjMEhOTWcw?=
 =?utf-8?B?bTV2dEFPRlRuQ2ZDdjk4dS9jb3dlOTBxZDcxV3RtRXFkQkw2VENOT25CMXFo?=
 =?utf-8?B?QnVQa1c3Q3NkSlp5c1o1ZlFSNVhvR0VjNzRwK2J3YWhjTEM3NkhkM3JDV0JD?=
 =?utf-8?B?NlBVSHlKQWYvZU9iOHpiZER3NkVHK1drWmdVWDBkMkxwN1hueXVZTW9ab2Zq?=
 =?utf-8?B?RjBsQjE5c1dNQ21EU0xsUldxUDYwakZ2TVlhSko5QWsweGFQVTRoTG8xUmhR?=
 =?utf-8?B?dE5wNDVuWUh6YitZeDB6STJTY0hxWjJqYmFUTzdraTRlT0ZWWXdXSTk0SUVN?=
 =?utf-8?B?UXRUZkdEZVJaS2Y4RG9qYXZiQjRBelBEWndzeU9DK0JZNlQyQ3p0NnVvV2dZ?=
 =?utf-8?Q?WD2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXlZdTlyMGN4MGxNTXBEbTB5OTkvZTNJT3VhQ25wMmhveE95UTBDTWRkYnBw?=
 =?utf-8?B?LzZoQld5cmtXRUJmYjI3MjZodnZGZ3BITzFFTUJMZG8zbHBGVnNLY2oxdVo4?=
 =?utf-8?B?aTZ6Wk14bFdiampwNkhXaVJpSXl1T0VRNzRvb2VBR0JNYjVZN1NHRUY1dTd2?=
 =?utf-8?B?bEdQaFRIcTR3Skk5ZTR1RlFFK3Z0SWwrSVRJOHNNcTE0UW80TVk2dFpIMU93?=
 =?utf-8?B?MEVaaWVJb3dWaU9IVW0va1pnU3d2YmhjMGpzODJ2SEtMQWdQY2s4cE94N3A2?=
 =?utf-8?B?WjB1emlUU3Q1Qk8zSlBMdGl1ajJsRk5iRExZbmRjanBNTksvcUQyUHh3NXNF?=
 =?utf-8?B?MkpEWDRBWmFGeDlRcmIyYzJKWmdhS3MxbDk0RkFXbkJaSFY5UE02eEhRNG5K?=
 =?utf-8?B?R3Jrd1NSOTZtMUNrT1V2eWlvS3lvT1dTSUdYLy9WWTRCNWplekJ2T2NISmFP?=
 =?utf-8?B?SzA4VmtwNVNJdklOUGF1OTNDdS9zSGNWZTdEZVhLc0J0SkM4UEpsYTBaM2l2?=
 =?utf-8?B?Skh2bVZjbGpwb1VoeGtjaEw5QjNXM0F5L1djS2ZSOVAwR004QVVidWZZbmhx?=
 =?utf-8?B?WGZpN0UvOXh0K1g0YVQxaE5WYVZLbnEyMVNjdlV6cVUzWG9mSGNJMVhraWRF?=
 =?utf-8?B?dnJtejFwRDZYbGpHZ0orTFhpQlQrSnFsSDduSjAvd1lLYTNiZENmY21ocDB0?=
 =?utf-8?B?b1M0OUw4cE9aOTlnZUs2TzlweWVRK0JUcHp4MXJTelFTWGFSUlJtaFlxNTVC?=
 =?utf-8?B?VzBSZlZMWnFyMzF1bFFqZHhGbFQzaWRSditHQWRUbWtJb2RrSEN1eG5iNUh6?=
 =?utf-8?B?OVV6R2xMQ3FpK0hWSjNKcXRPeTB2UVRkUTQ0RUdPQm9KRjVoc3FtWHhTS2Vt?=
 =?utf-8?B?RjRoaExuekhWQXl0eFdVM2tPUjBUNnVVcmQ1ZkJVUW9zR0syWFRUOE1pZW4y?=
 =?utf-8?B?bWNDVmQwQytVKzUwc25KeEJ2dFY2a1lUZXdJQllhbkNNS2xNdEphL05KQ0sv?=
 =?utf-8?B?T0VpV21LcGNCb0ZyemFlOXcyZmVCbjhjR2xRVmpmNW82VzhzTnlOWlYvSjZs?=
 =?utf-8?B?R05KclQ0R1FLbzBiMkNQREVacUZwZThNZm5yOWIvZ1U1blIva3BBdXRrclhW?=
 =?utf-8?B?c0RDL2s0eVNyZkJ0M0tucEREZWZlYThxeC93ZUNCZENxYUdUMUlKc1dFN3U5?=
 =?utf-8?B?R1NoM3I3QVdEWU85eFA4RDJRTHFEVU1MUzNUSHZKMUZ1NUZRK3l5QlN4Z1hr?=
 =?utf-8?B?dnpIaUV6NkQzbjJPT2h3K21ialFZdFpkNDRmZ3lMRXE3TTJERk5zVCtwQk0z?=
 =?utf-8?B?dmdDaXJvRTYwdnJYWnV1YllvSjVrZ3BLSDJrMTYvWCtCcXNTTnRNY3Z6NGdW?=
 =?utf-8?B?MGJXaGpONTZNOEFsc1RCcHRZeWtLcGJGaVZXdjhYNGpGVjJuUlFjUjUrUjhJ?=
 =?utf-8?B?YXl5QmRTMzFBT01CSVRSZWxtWlB1UytkZmVLaEhmR083QkFNSGdxTFBtQklK?=
 =?utf-8?B?MmoxRU9xWW1zY205b3BvYmtqQnFMQlpnODdBQjFZOWN6QllHTUFzV1krSU1p?=
 =?utf-8?B?UnVHcHJHRGNNTXpCbk1sZjVMY0RLTUZPb1lhS1B2UFBlYjMvYUl4WndiKzBv?=
 =?utf-8?B?U01TbjVKQXNOT0NNem9uYjROdHg2OWYzV3lSakk0Y3dzc05HaEUzeWtqRk80?=
 =?utf-8?B?NzAyUU1PMHMvalFwUGlNSm5tNFhWazRkOFNWeVQvQXdqV2dzRnUvNTBEcnlu?=
 =?utf-8?B?dlErVldudFNBTXVNSG4xUTkrb0h1NWp1QkNQM29ZS3haVjJ4SHFYeTA0dkVK?=
 =?utf-8?B?cmQ4aGI0c29RTENwUXdNYmhCT2Q4N0pHSURVeHNycjJJOFlQbHNEaG9hbTkr?=
 =?utf-8?B?TWJ1UCt1aWFTRWk2RTUyZUhXMUcyNW1lSjlrZ2R2bVlteDlPTTdCRzYvbng5?=
 =?utf-8?B?UEVoaWIraWpZUmxPamlkRkF1dTE1RkhNQWJIRGdDS0VRcmN0WWYxRXNkamta?=
 =?utf-8?B?SFVNN21FQkQzNWZQWE9RTmJiRkUrUGdhUnprVDZiNlk4a0I4d0IwNEp2bWhX?=
 =?utf-8?B?ZEVvL1ptMHRhcWk4M1hXU3NMS0tIWm9rcDVqMjZDZ2YyeWIycFBBWDlOVVY4?=
 =?utf-8?B?cVZNakRIOGhpVWdDUFg2YllWNk53QzlyaENkc1l2cC9nUzVzZVBTQUtBdnVW?=
 =?utf-8?B?Q2VaYlp3R0xqdkpuR2pkQjBoZlpZbjk2MHRTRHFrWWtXR0V1TnBVVkZIWHRa?=
 =?utf-8?B?dDRwNFJ4WEdIazM4cW8yb04rZysydnU0ZmpIU2hzVlZaUGZIdDB5eENhVm9C?=
 =?utf-8?B?cGYvcDNsdWIxQUNFT0JIZnZ1Tlc1SEdPemQvVTNITDJmdWFndmVGdjg1dGx0?=
 =?utf-8?Q?nbBfhCwh5sJkTzeQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 865917a8-8d14-47ae-04c8-08de623727c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:43:36.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB559oXDeKy7f7I4KwY547oMvSsZbeL9N7SclcG7YBhUAEgM5YUhqQTFrivI1rpxZkndpDtOo9ZkhAoxjvgaet3ABGPftXgYwXsFBP7Ljus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8813
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

Lin, Shuicheng <shuicheng.lin@intel.com> wrote on pią [2026-sty-30 19:20:08 +0100]:
> On Fri, Jan 30, 2026 10:09 AM Shuicheng Lin wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lin,
> > Shuicheng
> > Sent: Friday, January 30, 2026 10:09 AM
> > To: Piorkowski, Piotr <piotr.piorkowski@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: Piorkowski, Piotr <piotr.piorkowski@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>
> > Subject: RE: [PATCH v1] drm/xe/vf: Avoid reading media version when media
> > GT is disabled
> > 
> > On Fri, Jan 30, 2026 7:55 AM Piotr Piórkowski wrote:
> > > Subject: [PATCH v1] drm/xe/vf: Avoid reading media version when media
> > > GT is disabled
> > 
> > The change also affects pf, maybe drop vf in the title?
> > 

You're right. My change also affects PF, which wasn't my goal.
I'll move these changes directly to the VF path.
These changes do not make sense on PF, because reading the registers
does not hurt us. The problem arises when we try to communicate with
Media GuC on VF, which has not even been loaded by PF.
> > >
> > > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > >
> > > When the media GT is not allowed, a VF must not attempt to read the
> > > media version from the GuC. The GuC may not be loaded, and any attempt
> > > to communicate with it would result in a timeout and a VF probe failure:
> > >
> > > (...)
> > > [ 1912.406046] xe 0000:01:00.1: [drm] *ERROR* Tile0: GT1: GuC mmio
> > > request 0x5507: no reply 0x5507 [ 1912.407277] xe 0000:01:00.1: [drm]
> > > *ERROR* Tile0: GT1: [GUC COMMUNICATION] MMIO send failed (-
> > > ETIMEDOUT) [ 1912.408689] xe 0000:01:00.1: [drm] *ERROR* VF: Tile0:
> > > GT1: Failed to reset GuC state (-ETIMEDOUT) [ 1912.413986] xe
> > > 0000:01:00.1: probe with driver xe failed with error -110
> > >
> > > Let's skip reading the media version for VFs when the media GT is not
> > allowed.
> > >
> > > Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT
> > > types")
> > > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index b5e8935fff1d..6ac1baabab4e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -644,6 +644,10 @@ static int handle_gmdid(struct xe_device *xe,
> > >  			ver / 100, ver % 100);
> > >  	}
> > >
> > > +	/* Don't try read media ver if media GT is not allowed */
> > 
> > Nit: "try read" should be "try to read".

ok

> > 
> > > +	if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev)))
> > > +		return 0;
> > > +
> > 
> > I am curious if primary gt is disabled, will it also have similar issue?
> > If not, what cause the difference?
> > Thanks.
> 
> I should try it first.
> Primary gt cannot be disabled currently.
> "
> [49365.389692] xe 0000:03:00.0: [drm] Primary GT disabled via configfs
> [49365.389695] xe 0000:03:00.0: [drm] *ERROR* Cannot probe device with without a primary GT
> "

In the case of VF, the primary GT would have the same problem,
but we are not considering disabling primary GT.


Thanks
Piotr

> 
> Shuicheng
> 
> > 
> > Shuicheng
> > 
> > >  	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> > >  	if (ret)
> > >  		return ret;
> > > --
> > > 2.34.1
> 

-- 
