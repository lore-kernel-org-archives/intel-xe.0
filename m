Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45448EC1101
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 16:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378E10E3D2;
	Mon, 23 Feb 2026 16:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frBgs6C2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0524510E3C3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771863417; x=1803399417;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MwKAW94drGTM5Z47HTklUyNfYgvXEhk7TkOC5mSrlI8=;
 b=frBgs6C27+mDytSpr/DE0peWA3Cyg2/mm48u2E/SgmDYWo8eyWrzGB7n
 n17l9qMfQzLW37Cr7rSoL3agBtVrLQ5Z81xiGjMUCPLJWukoIhtIQBVBE
 Y6K1Hvz5uoBvaPSiztT5FMl7HopLbqcIvZzPGvDUhwaMtJGFCeOj362ny
 iPhex/Gze46QSirF97D4jVlFJZaUrc43bmd/LXANlyAHBAn0xZaq6k8Mq
 p+REu54/Q1d+HuN336CCm25dGcTsevjE97UqImTElkZPwa0krLRbhTJPF
 ZXPzVZp6wtyCVmE5xgRaZEZ6+qsU3S2ugJj9ZAEX7M7FCCQGLKgvq6tzl w==;
X-CSE-ConnectionGUID: AP3eUTJTSm679KredX6YJg==
X-CSE-MsgGUID: yGZUwC3jScaD0KTVmx+tzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72072138"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72072138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:16:57 -0800
X-CSE-ConnectionGUID: 0IlldB5hR5y7iBMDn2/gGA==
X-CSE-MsgGUID: MDCNSvN0SjKjIKT5l6/xeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220606688"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:16:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 08:16:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 08:16:55 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 08:16:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIFODdF2H1besqyLb/3H0kkFVrn6w/F6SDJ1deZ44UFjrrBzKvCbPADic1wTe0iWrx0mMTOYN5YscI/SUhGvzE3HwOOlcEumpxfX+H77+6Ov5u0OHK/ZNMhu/tbeWvJTBAEZ1SjJLCh4WcbevZZvfCH9Q9Wxk731Afk15KBkkPDh6KAoLAl9m47vAtO709ma/MJs8OVV8lLYRYSo1nvfRVBj1Ft2w1KDiRxwXy/xxzzUYjE/cT7ILcty2OOAt4NEdHUglg2MuvBIjgxTgWewG+ErrLfzv4HmjNH8C48cA6QeQsLE+1h2+XJhcOzov0JtoMnqfczvygE+L2KqN1885Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwKAW94drGTM5Z47HTklUyNfYgvXEhk7TkOC5mSrlI8=;
 b=U8/5+NgB+Onv3C7L30IPa0QFQ9uiluqnY+et4f3anh0zUJ+i3tunlalopmR63gLWfrJSMpJ7oS3agPAszoPbSWolAi3hs3kXdSMyVCev7ad29KsjrtvqZsSUyVGprOe7hlkVca5F/dZquDpgtlS3b3+q5kfegY4wU1+lMtoPNhec1lWfV54K8+446AhuB60FjSONrIX/8IdftGjTvuwGeg53RNp3U8aw5sbqnvmlv/EEqtFoowJMj9IoD3qRqIRG3OJwJ0UcGwGGyByfAvDA3hRhSAmp+JSayYzW8pgZf/gjgQwH/oXajNIw/XP4+xj1gVGkh+8Szf1dKShYQZKvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA3PR11MB9225.namprd11.prod.outlook.com (2603:10b6:208:570::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 16:16:47 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 16:16:46 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Update xe_drm.h documentation
Thread-Topic: [PATCH] drm/xe/uapi: Update xe_drm.h documentation
Thread-Index: AQHcltsAu+OrLknIYE+ubdHDSFf/yrWQkXbA
Date: Mon, 23 Feb 2026 16:16:45 +0000
Message-ID: <DM4PR11MB5456BEDA620CBC8838730ECCEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260205200330.1509354-2-shuicheng.lin@intel.com>
In-Reply-To: <20260205200330.1509354-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA3PR11MB9225:EE_
x-ms-office365-filtering-correlation-id: 2712f67b-66c0-4571-ab4e-08de72f6f0d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N1JvRE5LYVEzU0NGcjA2dEpqYldmZVdaSW1SRkVqT21Cak01VC81R0F5OHly?=
 =?utf-8?B?dXpzUGNVZExhMUNXR1pEakk0Tld0TWd2MHJTRVB2WDZYbmJheVZXZ2M2YTVO?=
 =?utf-8?B?K0ZwQ1hlTFllTHdGR2NTNTVGUWxiWEJwVVhKZENoQm1WWEhDOHBPdGQ5eXFQ?=
 =?utf-8?B?dnJiQjQ4cENXUHE5Wkh4Wjh2eVFEZjZZUjVwa2k4aEVBMnpWSHpTZEovOElF?=
 =?utf-8?B?OEtTV3ZhMGRsc2wxNlFycEtTMENsc2hHcWI0SkMwQks4RHdlVVhzSkdhN0d3?=
 =?utf-8?B?cTVramtWUDNvYUd0U0p1aHdZUlRybm1GRkNjUjA5QXJxN2tPV01GUmwwbHNj?=
 =?utf-8?B?YW12ZXM3alNVd1BZdTdUQkhJbVYxMGR1eG90NkwzK2lYR05QcjhsWjN6SU5D?=
 =?utf-8?B?blRFdFJyWWx3a1UrVnMySG4xS3lXRzRFWUZOZDNuSzhiK2lPVkZZRlh5SlYz?=
 =?utf-8?B?bHVpS0lScGEySFJyaGNVV2xZd1VZTmpYeG95T3lReEx3RXNzRzNMOFNZOWJR?=
 =?utf-8?B?RGhCTzkvTjRFMXBtMDZTWG9ZSmhhR050ZmhiTGR1cWY0VU9lYUphUG9DQlgx?=
 =?utf-8?B?QjZaNmFSVzAzZGpnZHpnWGhqRHFqTHE3b2JBSGtsN040V2pDSER6ME5Tczlk?=
 =?utf-8?B?ZVkvaFNuTTUyc0ZiRm5BdVR1b0JHRW9ZK3NYZ1pRakhPNlp0L05QajJyZlhQ?=
 =?utf-8?B?UURjMEt5UWJySVdKZjhiU1R1cnFFSHJQV2lTbTVHbnJNMUJQSytxRktJbnJ4?=
 =?utf-8?B?STRaMkFxcVkrcjgrcUZsWUVCWmNaK2Z4ZVdTNG5wSXVuNUdkUzdFVHJlTDRF?=
 =?utf-8?B?N0lMc2NzTEtZNk1iT3Y1VnhwTUVKak1lcEcveEtONEdiMXVDYnZiRmRhVFhH?=
 =?utf-8?B?MmF0S3A0SWt3NGRkMytpV3ZSQ2E1YkQrUTh3TlNEYTRjM1ZzdE9teURvS0FJ?=
 =?utf-8?B?OUMrOGI0YWwxQ3kzdXRsZE1hd2FIdzQ3N2M0THREMHdYQk8zWTRhQURSMVNr?=
 =?utf-8?B?d2htVWxRYVlKYnRHbWViaFJndysvQXBYMTI0SlJwZVFjR2ROdHVCQkMxOTBP?=
 =?utf-8?B?dm5mYUVtTzJkQWg1dHNWck1hNUk3eGtIS1hUUnA3YzRRQkRrVE5xRzZBTVdY?=
 =?utf-8?B?WGJVa2tRdU5zc3dpaUhBS0FXdVowVkdkbTlTT1I1YUovUlVMMUI3bFJ4Ry8r?=
 =?utf-8?B?ZSsybEJoVzZUaXQ5Vi9YdUlidEMzNnk1Z0hGdFdzU20rb1RvOHduZllUMnFM?=
 =?utf-8?B?VGFWMlkzZjk4TFZaUnAyU2YxOWRYcHJOUnMvcVVzSTJTSlVKSEhsaDhTZk16?=
 =?utf-8?B?MFFtaklOaGNzejNObHlxNlE1VVlZMGtZSDhTVFg5ajZQQ2w5MnhOTzlhSE9x?=
 =?utf-8?B?b3ZxZXp3S2JXWDJIQ2t4YUFOaExYeTdCV0orYXRuS08ydThZbnN3WG9vSVd4?=
 =?utf-8?B?bUJQTS8xTkVJVWFYN1NhR0tLR3dnWkk2SmFZcTFXeXdYblZaQ1h1WDMzbnNG?=
 =?utf-8?B?amRtallRWUcwOG1DeUpaRWRzS2xxclVXL1VVeDRhNDlDMXZBdENSVWVsbWJ4?=
 =?utf-8?B?T0xNNVlPcTJOZnhzRVkwaDlUZ3FVaG9NT2QwT3FYTXlCSGlSaUZKWHdLNHlM?=
 =?utf-8?B?YW5HTnVxMEE2aHlqT2FPeEJiZ3FJczNHd21tZmxOQVl5elpBYUh5VTdhL0Ex?=
 =?utf-8?B?NlVFZ1VyVGt5amdNdzg0TnBaRnYzZndabmJLZThtTEd3cllNay9KOTYrTkVh?=
 =?utf-8?B?L2hNcUxYbStzcGRDTGRzVkx2QUhLQytneDBzMGRVeTBMNVBKS2FuN1d3eVg3?=
 =?utf-8?B?NGFjQlB6TUdaVkhHQXFnb2VjZXlKd3dLa2F2dkgvZjBKak1kUittMEpNMW9N?=
 =?utf-8?B?bjZ1akxlVklacU01WmNTNXNGQkVtR3cyeFBySUE2Q2tNOFJQZzI3QngrZnlq?=
 =?utf-8?B?cjg4UUZ2VnB2UlIzZ3VNY0ptbnk0ZTV6R0JGcFJKTnhxU3V0KzdiUGp3a1dL?=
 =?utf-8?B?ZS9GdmVBUmZPcE0rVlNwcFhiZEkyTDd1M0NOMmowZExOS0VCT2hWK0FsY09E?=
 =?utf-8?B?SDBuc0NaeUJraXgwWDQ5bm10NGFBd2ZYWUtQU05MYlBpYzJRbllCL2Q2ODVS?=
 =?utf-8?B?Q3BHODl0eUZRYXlia29haEIvU3I0a09JclhTVXk0LzkwWDJmVHlnZHY2U0xJ?=
 =?utf-8?Q?XQFpv6V3pEF6Itq2rmD2Nc0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkR2aGtjT2tjTHlXb1J2VG5uNEgrT3NqWUF4ZEJkTWFVdjdkSy9aM1ZjWHg0?=
 =?utf-8?B?VmpGMms1QStFcVcyNzhxNnMxK2kvdFF6akYyQk5MalVQNmo2OUlZY0h4dVlh?=
 =?utf-8?B?TExjOHFxdUJ4RVNoeE1Gd1hOd2R3SjlHKzVZaUlxb3VSdnBwVmlqaWVHT3E1?=
 =?utf-8?B?MDdTei9uZm5XRmQ3UVczRStsVFg4MmFIVUkyTm16MnNNUDNrUzhiYVhLS013?=
 =?utf-8?B?em9lSDdEbjVDWmNOWnhnQ3FHOTZQNnJ1dGNZbXQxL2d2UUhCVEJVUEhYUndi?=
 =?utf-8?B?eVdxbGxZaGx3Uk5oZUFtZFFtSnlaQ0RSaU1IblhMVVR0OWlBT2JUMHdHWVVr?=
 =?utf-8?B?aTh5ZmZrTzI2bjdXRVlFVmN5Ukdid3ZRUWlTSWtSanhwVzV5aVdScndmM1lG?=
 =?utf-8?B?OUVjNkhrUWF3MElOekhSbHV3V21FWnRnY2hHenAxREY3MHhKK29UQnlTRGdB?=
 =?utf-8?B?VVJ2S2xDYTVGWTZSMldlWnN6VlM2cytTU3R2R2pMSGlQTUNtR2Mwc3AwbGNq?=
 =?utf-8?B?NjNxWnJ0Z0VsbENHMUU3U0VKQ1ZhelZVVG0yK1dUbHprV2VRSnIyUkdSU3pU?=
 =?utf-8?B?Wk54VnZqT2tFOENPZ0lBNm5SQ3JWQ2dONE1DL3hzM2tlOW45eXBNYnpDK3Bv?=
 =?utf-8?B?M0VBWDhoTUs4VmwyTWVxbE9GaHVOVDM3eExERGI2QllvTzBMMnZxN2JKbEVt?=
 =?utf-8?B?Z2xRUmZhVllMZVlHazVTRE9peWVmbmc3TFBsRzErSTRnQ1U5a0NCVjRQZmtt?=
 =?utf-8?B?UzFpWHJHYXlrclNBMmhqYzNQajhmRWtCSHVCb1VmRkFLVVVVa2c3cFQ2dW15?=
 =?utf-8?B?em95SjBYYWhnMGRZbERkeENnTnppSVlCTEhYblZKMU9RQW81bHRkRmtweEt6?=
 =?utf-8?B?NmhWQ2o0SWpaSklLY2E4bVF6eG1zWDF2N0YvcFpYVWZZK28xQXc5dTBYVlMr?=
 =?utf-8?B?YkdVdGZvSnNKa2Y5ZzBBZzh2MzZyM1J3bStRaTNpbWtLMjFmYzkzUnY4Wk9i?=
 =?utf-8?B?bGJsUG1SSHk5RnBzMGlsZ1d0Z01nZmVTZDkrVGY2R3lpY2FwVHBuQ0JaMzg4?=
 =?utf-8?B?U0hmdzRIOFlWak1lL2RMdllPeGp3cXFrSDU5S1hhUnUyMTBENXNSVjUyZGZS?=
 =?utf-8?B?UnZEUlB0cTRRZmNISnZleUdXMlFxcWY4bS9mTWdqRTRRMWViUmIzVTBjUVVY?=
 =?utf-8?B?bXZDejBJeEUrK0VsLzJuMkxCUk5YT2l5ZDlBb3ByK2ZpemJrQk1xWnpBQlRP?=
 =?utf-8?B?eEFvZE1LVnV5TFBVWmZoMGZwbmtCUnJXcXJiMzU5eTlTY1cxYmZoNy9JV2ox?=
 =?utf-8?B?anMxN05ZZ0N0Mzd3MTBoM1E2RHN4RTEyM0xpVHZkcG1wKzFaWmdZdDQ3WkhD?=
 =?utf-8?B?WkFUZEZ5dytxNXloYytiRHUxZUJCTkNXWDNKdllEWlpVYmlJcnRSSVZEQnVN?=
 =?utf-8?B?VVFoaDgxK09Wenl4cnBRWDRNL1ZGUmZocDNyR2VTWk40c21Vdy9sVkpnQ1Jw?=
 =?utf-8?B?NTkweWxTcS9URDB0OGNuMTVWczRsNmdoUUtaZlNzZlV6UjFOcWhHa3NxWEh5?=
 =?utf-8?B?NmFWa3pLcFVqSkJrSk1jeHpUeVh5cG9WenpIcWZZWm9TR2Eyc0J1eENpRmM5?=
 =?utf-8?B?ZWNadE5nelFHMktpMThkTDEvMzIrakhQSFZSSXJUUlYvOXJQbWlFTEg2NFhJ?=
 =?utf-8?B?STdkL0xBaTRsaFQ1RUk1MWlJMnpycitxU3BqZkxheDFCSDAvcTQrYUo1algv?=
 =?utf-8?B?OUltTzJ4eE0rdCttQ1VYakZJU1E1NUkwelpXZmdiejZ3WGh6YUdxS25KSHpL?=
 =?utf-8?B?ZzQyc0lhZVRua1BsWjByUlp6N3lDLzlIRTJ5b1U3RVQ3T1Noc2hZQUhpRGhu?=
 =?utf-8?B?NUJzenY3TXlDeDZ2bWlHMjFjUXNpeUZSckZFSkx3Sy9MWEltYTlHS1p1UUI0?=
 =?utf-8?B?V3VaZUR0RFRLbXpWaFFqZWVvbm81Z1VmL0ptOTZPK2lLQy9ibjNVZ2RuaWU0?=
 =?utf-8?B?Z1prVXo1TlhVR1JDZkEvWFJwRkVaZlZaYWJlbGJTdXZJUjk5THRTS3JhWmlt?=
 =?utf-8?B?bzZjMnU5RzE0YkY2L0xGOUlvNFRLZzczNlYxZlhNYlRDU0RBVUtaM0xwNXAr?=
 =?utf-8?B?Y05PTnkrV2IzSUlEcjhDd1lMaWZQb3UvRG02VE1oWklITWlNMk5hZGlVdG9a?=
 =?utf-8?B?QThHUEdoN1dBWVEyS1VMOXNZWWM0ZWxJc2J3ODNjb3BuRzhHV2llWExtb0dx?=
 =?utf-8?B?M1NaVVZTMTlLY05udndmckI3Mnd2TjN2RUxTalNXenMweXc2cGg3TS9oU2E0?=
 =?utf-8?B?dUpiQmt4WURIVEJwNkxoZHBsL1ZJWVc1ZEF0R1hZZExtQWNIdDY5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2712f67b-66c0-4571-ab4e-08de72f6f0d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 16:16:46.0503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FiuSOH824yzuP7QjD6CzmSOUYx5EOq6kzWMo7a4asSetb36JwfpS1+8XvQy3loba/8aQtgNZZKxbT6ZGw3fkDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9225
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

SGkgYWxsLA0KTWF5IEkgYXNrIHJldmlldyBvZiB0aGlzIHBhdGNoPw0KVGhhbmtzLg0KDQpCZXN0
IFJlZ2FyZHMNClNodWljaGVuZw0KDQpPbiBUaHUsIEZlYiA1LCAyMDI2IDEyOjA0IFBNIFNodWlj
aGVuZyBMaW4gd3JvdGU6DQo+IEFkZCBtaXNzaW5nIGlvY3RsL3F1ZXJ5IGl0ZW1zIGluIHRoZSB0
b3AtbGV2ZWwgY29tbWVudCBhbmQgZml4IG11bHRpcGxlIHR5cG9zDQo+IGluIFVBUEkgZG9jcyAo
bW1hcGluZy9tbWFwcGluZywgeDIvWGUyLCBtaXNzaW5nICJiZSIsICJ0aGUiLCAiZmxhZyIsDQo+
IENMT0NLX01PTk9UT05JQywgbmV2ZXIgZW5kaW5nLCBpb2N0bHMsIHV1aWQgZm9ybWF0KS4NCj4g
DQo+IEhlcmUgaXMgdGhlIGRldGFpbCBjaGFuZ2U6DQo+IDEuIEFkZCBtaXNzaW5nIGlvY3RsIGxp
c3QgZW50cnkgZm9yDQo+IERSTV9JT0NUTF9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWQ0KPiAy
LiBBZGQgbWlzc2luZyBxdWVyeSBsaXN0IGVudHJpZXM6IERSTV9YRV9ERVZJQ0VfUVVFUllfVUNf
RldfVkVSU0lPTiwNCj4gICAgRFJNX1hFX0RFVklDRV9RVUVSWV9PQV9VTklUUywgRFJNX1hFX0RF
VklDRV9RVUVSWV9FVV9TVEFMTA0KPiAzLiBGaXggIm1tYXBpbmciIC0+ICJtbWFwcGluZyINCj4g
NC4gQ2xhcmlmeSBWTSBmbGFnIGV4Y2VwdGlvbjogIngyL3hlMyIgLT4gIlhlMi9YZTMiDQo+IDUu
IEZpeCBncmFtbWFyOiAic2hvdWxkIG9ubHkgZXZlciB1c2VkIiAtPiAic2hvdWxkIG9ubHkgZXZl
ciBiZSB1c2VkIg0KPiA2LiBGaXggdHlwbzogIlR5cGUgb2YgdGhlIHRoaXMiIC0+ICJUeXBlIG9m
IHRoaXMiDQo+IDcuIFJlbW92ZSBzdGFsZSBEUk1fWEVfVUZFTkNFX1dBSVRfRkxBR19TT0ZUX09Q
IG1lbnRpb24gOC4gRml4IHdhaXQNCj4gZmxhZyB0eXBvIGFuZCBjbG9jayBuYW1lOiAiZmxhdCIg
LT4gImZsYWciLCAiTU9OT1RPTklDX0NMT0NLIg0KPiAgICAtPiAiQ0xPQ0tfTU9OT1RPTklDIg0K
PiA5LiBGaXggIm5ldmVyZW5kaW5nIiAtPiAibmV2ZXIgZW5kaW5nIg0KPiAxMC4gRml4ICJpb2N0
bOKAmXMiIC0+ICJpb2N0bHMiIGluIG9ic2VydmF0aW9uIGVudW0gY29tbWVudHMgMTEuIEZpeCBV
VUlEIGZvcm1hdA0KPiBzdHJpbmcgZXNjYXBpbmcgaW4gY29tbWVudCAoJTA4eC0lMDR4LSUwNHgt
JTA0eC0lMDEyeCkNCj4gDQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDI3ICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGluZGV4DQo+IDA3N2U2NmE2ODJlMi4uYzg2MTMxMDFi
MGE3IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTgzLDYgKzgzLDcgQEAgZXh0ZXJuICJDIiB7
DQo+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX09CU0VSVkFUSU9ODQo+ICAgKiAgLSAmRFJNX0lPQ1RM
X1hFX01BRFZJU0UNCj4gICAqICAtICZEUk1fSU9DVExfWEVfVk1fUVVFUllfTUVNX1JBTkdFX0FU
VFJTDQo+ICsgKiAgLSAmRFJNX0lPQ1RMX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZDQo+ICAg
Ki8NCj4gDQo+ICAvKg0KPiBAQCAtNzAzLDcgKzcwNCwxMCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X3B4cF9zdGF0dXMgew0KPiAgICogICAgYXR0cmlidXRlcy4NCj4gICAqICAtICVEUk1fWEVfREVW
SUNFX1FVRVJZX0dUX1RPUE9MT0dZDQo+ICAgKiAgLSAlRFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJ
TkVfQ1lDTEVTDQo+ICsgKiAgLSAlRFJNX1hFX0RFVklDRV9RVUVSWV9VQ19GV19WRVJTSU9ODQo+
ICsgKiAgLSAlRFJNX1hFX0RFVklDRV9RVUVSWV9PQV9VTklUUw0KPiAgICogIC0gJURSTV9YRV9E
RVZJQ0VfUVVFUllfUFhQX1NUQVRVUw0KPiArICogIC0gJURSTV9YRV9ERVZJQ0VfUVVFUllfRVVf
U1RBTEwNCj4gICAqDQo+ICAgKiBJZiBzaXplIGlzIHNldCB0byAwLCB0aGUgZHJpdmVyIGZpbGxz
IGl0IHdpdGggdGhlIHJlcXVpcmVkIHNpemUgZm9yDQo+ICAgKiB0aGUgcmVxdWVzdGVkIHR5cGUg
b2YgZGF0YSB0byBxdWVyeS4gSWYgc2l6ZSBpcyBlcXVhbCB0byB0aGUgcmVxdWlyZWQgQEAgLQ0K
PiA4ODYsNyArODkwLDcgQEAgc3RydWN0IGRybV94ZV9nZW1fY3JlYXRlIHsNCj4gICNkZWZpbmUg
RFJNX1hFX0dFTV9DUFVfQ0FDSElOR19XQyAgICAgICAgICAgICAgICAgICAgICAyDQo+ICAJLyoq
DQo+ICAJICogQGNwdV9jYWNoaW5nOiBUaGUgQ1BVIGNhY2hpbmcgbW9kZSB0byBzZWxlY3QgZm9y
IHRoaXMgb2JqZWN0LiBJZg0KPiAtCSAqIG1tYXBpbmcgdGhlIG9iamVjdCB0aGUgbW9kZSBzZWxl
Y3RlZCBoZXJlIHdpbGwgYWxzbyBiZSB1c2VkLiBUaGUNCj4gKwkgKiBtbWFwcGluZyB0aGUgb2Jq
ZWN0IHRoZSBtb2RlIHNlbGVjdGVkIGhlcmUgd2lsbCBhbHNvIGJlIHVzZWQuIFRoZQ0KPiAgCSAq
IGV4Y2VwdGlvbiBpcyB3aGVuIG1hcHBpbmcgc3lzdGVtIG1lbW9yeSAoaW5jbHVkaW5nIGRhdGEg
ZXZpY3RlZA0KPiAgCSAqIHRvIHN5c3RlbSkgb24gZGlzY3JldGUgR1BVcy4gVGhlIGNhY2hpbmcg
bW9kZSBzZWxlY3RlZCB3aWxsDQo+ICAJICogdGhlbiBiZSBvdmVycmlkZGVuIHRvIERSTV9YRV9H
RU1fQ1BVX0NBQ0hJTkdfV0IsIGFuZA0KPiBjb2hlcmVuY3kgQEAgLTk1Niw4ICs5NjAsOCBAQCBz
dHJ1Y3QgZHJtX3hlX2dlbV9tbWFwX29mZnNldCB7DQo+ICAgKiAgLSAlRFJNX1hFX1ZNX0NSRUFU
RV9GTEFHX1NDUkFUQ0hfUEFHRSAtIE1hcCB0aGUgd2hvbGUgdmlydHVhbA0KPiBhZGRyZXNzDQo+
ICAgKiAgICBzcGFjZSBvZiB0aGUgVk0gdG8gc2NyYXRjaCBwYWdlLiBBIHZtX2JpbmQgd291bGQg
b3ZlcndyaXRlIHRoZSBzY3JhdGNoDQo+ICAgKiAgICBwYWdlIG1hcHBpbmcuIFRoaXMgZmxhZyBp
cyBtdXR1YWxseSBleGNsdXNpdmUgd2l0aCB0aGUNCj4gLSAqICAgICVEUk1fWEVfVk1fQ1JFQVRF
X0ZMQUdfRkFVTFRfTU9ERSBmbGFnLCB3aXRoIGFuIGV4Y2VwdGlvbiBvZg0KPiBvbiB4MiBhbmQN
Cj4gLSAqICAgIHhlMyBwbGF0Zm9ybS4NCj4gKyAqICAgICVEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdf
RkFVTFRfTU9ERSBmbGFnLCB3aXRoIGFuIGV4Y2VwdGlvbiBvbg0KPiBYZTIgYW5kDQo+ICsgKiAg
ICBYZTMgcGxhdGZvcm1zLg0KPiAgICogIC0gJURSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RF
IC0gQW4gTFIsIG9yIExvbmcgUnVubmluZyBWTQ0KPiBhY2NlcHRzDQo+ICAgKiAgICBleGVjIHN1
Ym1pc3Npb25zIHRvIGl0cyBleGVjX3F1ZXVlcyB0aGF0IGRvbid0IGhhdmUgYW4gdXBwZXIgdGlt
ZQ0KPiAgICogICAgbGltaXQgb24gdGhlIGpvYiBleGVjdXRpb24gdGltZS4gQnV0IGV4ZWMgc3Vi
bWlzc2lvbnMgdG8gdGhlc2UNCj4gQEAgLTEwOTQsNyArMTA5OCw3IEBAIHN0cnVjdCBkcm1feGVf
dm1fYmluZF9vcCB7DQo+ICAJICoJcHBHVFQgV1QgLT4gQ09IX05PTkUNCj4gIAkgKglwcEdUVCBX
QiAtPiBDT0hfQVRfTEVBU1RfMVdBWQ0KPiAgCSAqDQo+IC0JICogSW4gcHJhY3RpY2UgVUMvV0Mv
V1Qgc2hvdWxkIG9ubHkgZXZlciB1c2VkIGZvciBzY2Fub3V0IHN1cmZhY2VzDQo+IG9uDQo+ICsJ
ICogSW4gcHJhY3RpY2UgVUMvV0MvV1Qgc2hvdWxkIG9ubHkgZXZlciBiZSB1c2VkIGZvciBzY2Fu
b3V0DQo+IHN1cmZhY2VzDQo+ICtvbg0KPiAgCSAqIHN1Y2ggcGxhdGZvcm1zIChvciBwZXJoYXBz
IGluIGdlbmVyYWwgZm9yIGRtYS1idWYgaWYgc2hhcmVkIHdpdGgNCj4gIAkgKiBhbm90aGVyIGRl
dmljZSkgc2luY2UgaXQgaXMgb25seSB0aGUgZGlzcGxheSBlbmdpbmUgdGhhdCBpcyBhY3R1YWxs
eQ0KPiAgCSAqIGluY29oZXJlbnQuICBFdmVyeXRoaW5nIGVsc2Ugc2hvdWxkIHR5cGljYWxseSB1
c2UgV0IgZ2l2ZW4gdGhhdCB3ZQ0KPiBAQCAtMTQ0MSw3ICsxNDQ1LDcgQEAgc3RydWN0IGRybV94
ZV9zeW5jIHsNCj4gICNkZWZpbmUgRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JKCQkweDANCj4gICNk
ZWZpbmUgRFJNX1hFX1NZTkNfVFlQRV9USU1FTElORV9TWU5DT0JKCTB4MQ0KPiAgI2RlZmluZSBE
Uk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0UJCTB4Mg0KPiAtCS8qKiBAdHlwZTogVHlwZSBvZiB0
aGUgdGhpcyBzeW5jIG9iamVjdCAqLw0KPiArCS8qKiBAdHlwZTogVHlwZSBvZiB0aGlzIHN5bmMg
b2JqZWN0ICovDQo+ICAJX191MzIgdHlwZTsNCj4gDQo+ICAjZGVmaW5lIERSTV9YRV9TWU5DX0ZM
QUdfU0lHTkFMCSgxIDw8IDApDQo+IEBAIC0xNTQ2LDcgKzE1NTAsNiBAQCBzdHJ1Y3QgZHJtX3hl
X2V4ZWMgew0KPiAgICoNCj4gICAqIGFuZCB0aGUgQGZsYWdzIGNhbiBiZToNCj4gICAqICAtICVE
Uk1fWEVfVUZFTkNFX1dBSVRfRkxBR19BQlNUSU1FDQo+IC0gKiAgLSAlRFJNX1hFX1VGRU5DRV9X
QUlUX0ZMQUdfU09GVF9PUA0KPiAgICoNCj4gICAqIFRoZSBAbWFzayB2YWx1ZXMgY2FuIGJlIGZv
ciBleGFtcGxlOg0KPiAgICogIC0gMHhmZnUgZm9yIHU4DQo+IEBAIC0xNTkwLDkgKzE1OTMsOSBA
QCBzdHJ1Y3QgZHJtX3hlX3dhaXRfdXNlcl9mZW5jZSB7DQo+ICAJICogV2l0aG91dCBEUk1fWEVf
VUZFTkNFX1dBSVRfRkxBR19BQlNUSU1FIGZsYWcgc2V0IChyZWxhdGl2ZQ0KPiB0aW1lb3V0KQ0K
PiAgCSAqIGl0IGNvbnRhaW5zIHRpbWVvdXQgZXhwcmVzc2VkIGluIG5hbm9zZWNvbmRzIHRvIHdh
aXQgKGZlbmNlIHdpbGwNCj4gIAkgKiBleHBpcmUgYXQgbm93KCkgKyB0aW1lb3V0KS4NCj4gLQkg
KiBXaGVuIERSTV9YRV9VRkVOQ0VfV0FJVF9GTEFHX0FCU1RJTUUgZmxhdCBpcyBzZXQgKGFic29s
dXRlDQo+IHRpbWVvdXQpIHdhaXQNCj4gLQkgKiB3aWxsIGVuZCBhdCB0aW1lb3V0ICh1c2VzIHN5
c3RlbSBNT05PVE9OSUNfQ0xPQ0spLg0KPiAtCSAqIFBhc3NpbmcgbmVnYXRpdmUgdGltZW91dCBs
ZWFkcyB0byBuZXZlcmVuZGluZyB3YWl0Lg0KPiArCSAqIFdoZW4gRFJNX1hFX1VGRU5DRV9XQUlU
X0ZMQUdfQUJTVElNRSBmbGFnIGlzIHNldCAoYWJzb2x1dGUNCj4gdGltZW91dCkgd2FpdA0KPiAr
CSAqIHdpbGwgZW5kIGF0IHRpbWVvdXQgKHVzZXMgc3lzdGVtIENMT0NLX01PTk9UT05JQykuDQo+
ICsJICogUGFzc2luZyBuZWdhdGl2ZSB0aW1lb3V0IGxlYWRzIHRvIG5ldmVyIGVuZGluZyB3YWl0
Lg0KPiAgCSAqDQo+ICAJICogT24gcmVsYXRpdmUgdGltZW91dCB0aGlzIHZhbHVlIGlzIHVwZGF0
ZWQgd2l0aCB0aW1lb3V0IGxlZnQNCj4gIAkgKiAoZm9yIHJlc3RhcnRpbmcgdGhlIGNhbGwgaW4g
Y2FzZSBvZiBzaWduYWwgZGVsaXZlcnkpLg0KPiBAQCAtMTY1NSwxMCArMTY1OCwxMCBAQCBzdHJ1
Y3QgZHJtX3hlX29ic2VydmF0aW9uX3BhcmFtIHsgIH07DQo+IA0KPiAgLyoqDQo+IC0gKiBlbnVt
IGRybV94ZV9vYnNlcnZhdGlvbl9pb2N0bHMgLSBPYnNlcnZhdGlvbiBzdHJlYW0gZmQgaW9jdGwn
cw0KPiArICogZW51bSBkcm1feGVfb2JzZXJ2YXRpb25faW9jdGxzIC0gT2JzZXJ2YXRpb24gc3Ry
ZWFtIGZkIGlvY3Rscw0KPiAgICoNCj4gICAqIEluZm9ybWF0aW9uIGV4Y2hhbmdlZCBiZXR3ZWVu
IHVzZXJzcGFjZSBhbmQga2VybmVsIGZvciBvYnNlcnZhdGlvbiBmZA0KPiAtICogaW9jdGwncyBp
cyBzdHJlYW0gdHlwZSBzcGVjaWZpYw0KPiArICogaW9jdGxzIGlzIHN0cmVhbSB0eXBlIHNwZWNp
ZmljDQo+ICAgKi8NCj4gIGVudW0gZHJtX3hlX29ic2VydmF0aW9uX2lvY3RscyB7DQo+ICAJLyoq
IEBEUk1fWEVfT0JTRVJWQVRJT05fSU9DVExfRU5BQkxFOiBFbmFibGUgZGF0YSBjYXB0dXJlDQo+
IGZvciBhbiBvYnNlcnZhdGlvbiBzdHJlYW0gKi8gQEAgLTE5MTYsNyArMTkxOSw3IEBAIHN0cnVj
dA0KPiBkcm1feGVfb2FfY29uZmlnIHsNCj4gIAkvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8g
dGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAqLw0KPiAgCV9fdTY0IGV4dGVuc2lv
bnM7DQo+IA0KPiAtCS8qKiBAdXVpZDogU3RyaW5nIGZvcm1hdHRlZCBsaWtlICIlXDA4eC0lXDA0
eC0lXDA0eC0lXDA0eC0NCj4gJVwwMTJ4IiAqLw0KPiArCS8qKiBAdXVpZDogU3RyaW5nIGZvcm1h
dHRlZCBsaWtlICIlMDh4LSUwNHgtJTA0eC0lMDR4LSUwMTJ4IiAqLw0KPiAgCWNoYXIgdXVpZFsz
Nl07DQo+IA0KPiAgCS8qKiBAbl9yZWdzOiBOdW1iZXIgb2YgcmVncyBpbiBAcmVnc19wdHIgKi8N
Cj4gLS0NCj4gMi41MC4xDQoNCg==
