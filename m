Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE976C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 19:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F29510E085;
	Thu, 23 Jan 2025 19:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp/GhxwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E03F10E085
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737660488; x=1769196488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XIAIPNqDyje8WPcC5q48TkHOhZ4h0+i5KPPQ72/bEJc=;
 b=Fp/GhxwE2HOux2c+YGCQcNFuOjR4PQJjVC8JFIWDJybUEAO0t6WodC6s
 nXT6Fa/Fcj7SLHbKcBrkuhdWO1hsuyNLHtrA4XfpkpDv3GikWtJvGUQv+
 fs81BVBZf84mOwnaK3DPA5EqFBbqXJQgAov88mvIQr6No4lCFwNp91yzK
 QqHCq2Yb1kQkcvkmUBvJ5ZH/SY0ZTxsafhrm/iV/lJ9FmTlqwyCP7SRzX
 QV2GeOij5jK4TSPAHndxtPKcLI/Oxd/kEj5JwsMbNKnT9pxdQVvewiJuz
 mg0kvX8s5IlQeuxP5Sg2IuXUO8P8BCip03tggfX1TZsNy3xCjf9PiEZL3 A==;
X-CSE-ConnectionGUID: x5HGbsNOQ2aOPmJj9d/4Mw==
X-CSE-MsgGUID: PPlWCuhiSs69mu5hgIBoIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55727235"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="55727235"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 11:27:56 -0800
X-CSE-ConnectionGUID: GFfVWxvNQaaN7PE+/Do/xw==
X-CSE-MsgGUID: DKGHlcT7SYuoqXiYkug7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112188344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 11:27:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 11:27:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 11:27:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 11:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWI8Nb7d75W5JR7TNSDwdGGXaQKNLK18rkZnc+5dlSHnlMxb08BdCnYL4KcXi0nVuN3AAOL50KmEkuOBKToKgTkuqEEHAjUS2IdeF8nklinJ0aG1/yUa1yvQztX4mpXjqnLWslpAK3jpzG0LzJ9M+5DDekx9sWzdWUkB/h6Ezy2gsl6RAx1fKld8Co1mp3ZoC93UCrRYWw3p/wPKbYpNI+o/TYndyBYYAizNjZiKGJ8vCHeUOwQMHaT9mK66kV6z6kpuyeyNw2Y/YyOMRBHhyl7n3cXg5jxasrFSWvY7M1LNyHqWRJ2/+JWzgOg2gZ3B6U1nogpn7k2QBvzf2a/2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLn50Wj8uKu1pHHBdV0DMkDXpivioKKeE/WXQwKL0/k=;
 b=od0LViHy7YWZXZ+n1UDyMAWT+HrHw0S9kI/+Bu3JIg8V2a73doJIteDsq8fJe4dAqMxQwuMkhm0996W3J7CiZ9W1fJkJoImORKqk58Rf2nY5xRHTPwLl85UcKEZm1OLDRDPVH8en6bRLadLtQWSLdOFA1QQu/dn1g4qksUBekVr3Uk2SW9lQxxVvxAWoRyNrp1fm4pSpmVCQBrv3l6xZhFEbL2Vz+ixi49ShTaF36acsZsLycu7tv/oLz3r8/Yr2AfyOKRn+1xDkQhsZfSm2If2UxU3jvnA6FoTmQwPzLUPITeYp9z/45oz6LIgcTh9QiZafsPD0vvUDYWS5oAc8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 19:27:51 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 19:27:51 +0000
Message-ID: <1af7bdef-0602-4f1f-aaca-2e68a5b94685@intel.com>
Date: Thu, 23 Jan 2025 11:27:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
 <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
 <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
 <a8ac03e2-43c1-488d-a821-902aba7caa25@intel.com>
 <75d315bc086d8382c6cb89a65b1be0b65547e0a1.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <75d315bc086d8382c6cb89a65b1be0b65547e0a1.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:303:2b::24) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaca31e-11a1-4b15-6ce4-08dd3be406c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um9XVUdCb0gwSHl5emRwTGdBekFnNU1HdzdXMXo4TGdCSHZ4Q3lCUzVPY29S?=
 =?utf-8?B?RVdIUEV0STliM2xsNm5pVlJoMWtJdmJvTzlWeHE3czZDaFJtT2RuY0VsNEpJ?=
 =?utf-8?B?L21yWnlidXRYcS9hU1FJQlhpeXZhckIxY2NHaVlnOW1WMFBkalRFbWJabUJX?=
 =?utf-8?B?aEZteFdiaDBvdlFiOUVLZDJTbExjVjZnejNKZFllQ2tqdEtwRWdvWDdaWlFt?=
 =?utf-8?B?bjVUT0FpQWVZdXZvdlB3WnRCUlJRaVhPNFBJenR0U1dPYTV2TE9hOW9YSEFU?=
 =?utf-8?B?NnNkcDI5b2l6YitnT3ArdWZOb0gvTnorR3BCVXdybFJqUFhYNmtwK3liU2I2?=
 =?utf-8?B?UWxvK29FM09DcjF0a2VOTE1VKzllRzFMMUhSWngxRnRzbDI3dHpoVHk4Y1dS?=
 =?utf-8?B?SHRVR1dmREU5RnAxcEczRHdjbkcxT2duMTRTZGhJanVRZlM3S1NTR0JDUktB?=
 =?utf-8?B?RktDSUNxbHp0OVVVdEVmbm5tYnZZUjgrYmVWQ0kwNENTd1ZBV1Z0WGZtNDc0?=
 =?utf-8?B?WUFvSzNYV0RnOTQ4dWFuemlEVDNrWVFtZmJSZi9DTjl2TnFsWXFiS3dtNUtY?=
 =?utf-8?B?SHJoRFhqMUUza1QwTlVCelRPcHJPODVodGJZR3g1NGJJVk9tM2dDSG5vaVJ6?=
 =?utf-8?B?UGlRdXhSckQ1aE92V0o5T3U4TkZuSFVNWmt4Z2k2d1crQkx0L3lzZVdQVWdH?=
 =?utf-8?B?VDBCRWU1Q1EvUzdscVVVT0djcDdkM3JKRXBrSlRYQzlCL3ZXTkg2YkhqYVlB?=
 =?utf-8?B?V2ZBUHA2WUc0SWx5U2tOcHVWZGpJRytHdEFRaVMyV25VN0tZVzRwL1g5azhM?=
 =?utf-8?B?a3RuOENvVU1rTjJkSW0wamVWUC9iaXpadGFSZGxBbzNlVFJLWnYvL3JORHBG?=
 =?utf-8?B?WFlsSU5LSVZpc2luRUpZTDl3QkZLK2RycXNJMGxGcXlPdUV6K3d5YkhTMG9M?=
 =?utf-8?B?YVc0ZG54bWJXWlhsWDRsNEVmS01XbmhqL0pGeWh1bHEvTmRFQ1ZQSWlWcnBQ?=
 =?utf-8?B?RE9ab0hCRGt6V0d5ckpYTlJwenVrQTduZHN2VDUxL1RoNWJRWUZyV01qMnUy?=
 =?utf-8?B?cGZnVEdSWmVSQ1dKclZlMG9ES3RaSU9oWkNUcHZCejd4WWNOMjJlZnZWSzNY?=
 =?utf-8?B?elJoOVN6RFJ1VVpDWkNCaTAyWXdUSWhyV1NiMEVoVmNRdkhmT0l2SXRUTjhH?=
 =?utf-8?B?ZlFoSVNGbkR5NU5jM28wb2kyQjF4TnBISkhsRFU1ME5Ga2xmdEZyYzcyd2wy?=
 =?utf-8?B?dXUrcUJVcStJbUlSUDdOZkR4RVY4T3Z6VzlpU2JlM3ZJbzhTZGVnY255V1Z3?=
 =?utf-8?B?RzVHMUdQZXNITWozSTZWUExuejArenFmRTMzancyWERVRWZWMnBpMk9iQVFo?=
 =?utf-8?B?TGFyTGd2RElzaFM1dzFlT1psbmRNRVpIRGVjbjRKQTIrNkdSZ0JzZDA4Tmp0?=
 =?utf-8?B?Wjd4S21GdjRPMC9Iai9IL3ZYdVMzUlNHR0ROSVdTSDlzZkdOTG93ZzB0eEZL?=
 =?utf-8?B?YVp1U1FjRUY4L0JmZUI0ZjhUNVZ0clJiSS9YRkkySGxWak5UdXJUMUlFU3hm?=
 =?utf-8?B?R1dYeFBYT29seU9ocEFhQldtM1BhM1JzaUVNNmh6am83VWhxalhvekxrVkYz?=
 =?utf-8?B?Mm9vdWIvS05GM0lYQWNoVEs1QVY0cWoyWnNSa3RBM1RGL3IzVWw0b3NjVmxW?=
 =?utf-8?B?b0FSSGVFS3o3dWpZQngwSGNubms0L0xrbjZCMS91MDlOeDE1RllKS0lDV0hD?=
 =?utf-8?B?cWo4YmI3VnpvUGxBQ0FkYVYrMzlJa0o1SmJxM2RUVE9RRmN0VGZpc3l4Y3Rs?=
 =?utf-8?B?R2lyR2hLNHdKTzRIY04rOU9rd25Bb3lIN2toelE1N3lkK3J2WGVjNk9oTUcz?=
 =?utf-8?Q?wzTTPWP/rJc6F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtnRUlvNWQwNTV5c29qU0RyV2J1VSt4OG9IUHBIWHhnNVVnWmtzNjVnSUhD?=
 =?utf-8?B?ZFpmTDhCdUd5ZlNJYlV6NlVnb3BGdUw5TjRpQ0cyOGlpYUswMXdyTmxJUzJI?=
 =?utf-8?B?N2VmaXJ3N2hySUMvYUJBNDRqVWtFTkpBaGFzcWRIZnBWajNQV3FTek9XRHoz?=
 =?utf-8?B?UDBORkpSd2ltY3l2a2FML0JDeDVGS1BFY3JrR3JRRXNsTUVXVWxuV0dMMk90?=
 =?utf-8?B?dXJPU044M1drRThBajR2d1M4SGNqVzhGbWF6SkhObGw2VzZZNjM0cXNuRVZY?=
 =?utf-8?B?V2hkempOdVJTRVZ2NHFaMHRQVElaUEtROThrZnk1bkFFT1ZtaUtGUWhIK2lS?=
 =?utf-8?B?T0o0eW1aYWlabnZ5aXkzYUlROGhEN3NuL0M2d0o1NVpiYmhkNmxMWjMvRnBr?=
 =?utf-8?B?cFVRUi93VDIyWmdOUVQxN2VyTzFjbkFrSXpFeWN1T2kwVTJwTS83S09kVEwx?=
 =?utf-8?B?OVdnMDRQZW9JbWtKQmpSTUVBSlpreUxRMEdjNk5PemM3YUlTVXVJVExTM2NZ?=
 =?utf-8?B?T2duREFPdGhCdFdyelpUbmlNUUYybXhVZzYxTHBwNGk4bGJZVGtzQlU3RDFN?=
 =?utf-8?B?WXNJbWV0VGZ1dzJoeHJJWTlIM0pOdS9XRzZEMmVremE1VWZGdi8wcHpaTDFS?=
 =?utf-8?B?RU9sSU0zV25MVjk0UE9FdzJSOWRtWkREd0RFV2UxeEV4VFdVQi91MG5xZ05q?=
 =?utf-8?B?VlpwTiswb2RmakNPRytsVFlBTGpURXBmeWhRRmJ3SGU1T3hsdmQ5SEdlaFdO?=
 =?utf-8?B?OHdUekhXcTN4bzd6Vm12YlZmRmd0dmZhRHVnWngzNXJ6V1dWOTU1MWNxbTJp?=
 =?utf-8?B?YThTRTlOcHVVcDlTbmo5YUhwYmV1ZjJWeUFYbzZQWnlRbEVGb2Q5SEtGQjRr?=
 =?utf-8?B?NUVvaWt5YnQ0UmJqa2F5eVNBRWtVRzV3RXlLWTBENldDSzRvRjkyemYzZm44?=
 =?utf-8?B?aTBnZ01DSUVLcW1GMDIxenJMbUwzc1RBNEF3enU5S0lWZllGTUpWdnFWUGlx?=
 =?utf-8?B?WGRUZlUyYzU5WVBRYkNOVC80QzkwSXBKdkZIODd5NFE2TjJxdGdIYWRzVlhZ?=
 =?utf-8?B?Sm1UL1o1VW1YbnJ4d3NjaGJNQk5qSWc4ckNmeGJneVlCNGQ1bTZmK1orYU9D?=
 =?utf-8?B?Nk1HSXEwRmpienNVOVFBdmFVaGg3bStzV1lRbUgxYWQ0ZU1xUjVJSjJSUGVR?=
 =?utf-8?B?VVI5cjdtVUFudkUvd0l1T1dmWHhDbCtZOWljakhoV0dFL0FzMkE3QUxQT0Fu?=
 =?utf-8?B?SERIOTdzK0pGWldHK29UQ3pkNjA2L3Z3QW1Ha08yL21yQ0ZGQjhZUHp3elR1?=
 =?utf-8?B?S0l6ZHNOZUU4aDBPWDhJS2o3NEN2WDB6WVA1Z0plSWVBRG5xcVRhSG1Sd0M0?=
 =?utf-8?B?SVdxVU9SNTZBakV1MHl3Y2ZJcERZNW9JdEYzaW1aUzdEb2IvcjVUeFdaNmk5?=
 =?utf-8?B?cjlQeUxUQ0l4MVVuTnV3KzZTNmd0R2E5clp4MzBhRVVETHQ2bGk3WXpqR1Fs?=
 =?utf-8?B?UWVOS1RKLzFGb0I3VUl4UHRrc2RjWXloMm5uYkRyTk93MjIyNm16aUFWY1lk?=
 =?utf-8?B?QlZUQjdkNzVZVVNQdmdISE1uNUp1M1ViS2tZUnJuNVBLMnZwU2NlUnlaR3JD?=
 =?utf-8?B?b3VVVDdQYStwYUNrNTJzbnJOYnlpankwaDhIVjlySW9MMnRnMDhtNityTEZ5?=
 =?utf-8?B?T3owbmxQRFhIcitYZ1drQllBOFlTcGUvSkVqSDB1bXpwVHJtSDlndTZMUXQv?=
 =?utf-8?B?bm1VVy9MdUtOWXRzeUR0MWxtampnZVJlUW5NREY5eitjWmZVbjgxTzNIRzNk?=
 =?utf-8?B?cWlWSWdpenBLeDNrSHJoSUFqa1phQmtiZGFVZENDR1ZIZlUvT05TTFVNSTF2?=
 =?utf-8?B?Y25nU1hnRXcySGJVVGNvWnVoakVtc2E0L0JoZEhnS2NBWW1qRTJxNkcyN2Nh?=
 =?utf-8?B?VlRWQVhuNkEyMUNKSE5IdHBpcUdyRnlHS1pHTE01a2Q4SWFseDhySW9xZCtK?=
 =?utf-8?B?bU5BYUZGVml6VEN5bDlMR3JSNUgxRkhkWVU2S2tqeU11UG1PUWw1dzcycVFE?=
 =?utf-8?B?SGNBVzVId3RXaERvZUd6OTJ4dmJGNXpsTVQ2N2dLVjRZbDBTU2ZPL2tUSGlI?=
 =?utf-8?B?bmxUYTZXT3VNSnFlOTBGVDFhVkRIc1h6VUJmZmZqUDUrRHkyZDVDbi9oOFFw?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaca31e-11a1-4b15-6ce4-08dd3be406c2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:27:50.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cbn1dWWTxvxgoZ+n5wEPAmBCnoIqVM1ekeRTY11Xc/WQDb1L5ub4uAKoPHi0BM5c79i1MsQmv6QcB/sa4OQ1O+rMGPtiRPjSjs9LB6YLQn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

On 1/23/2025 10:56, Souza, Jose wrote:
> On Thu, 2025-01-23 at 10:30 -0800, John Harrison wrote:
>> On 1/23/2025 10:24, Souza, Jose wrote:
>>> On Thu, 2025-01-23 at 10:18 -0800, John Harrison wrote:
>>>> On 1/23/2025 09:59, José Roberto de Souza wrote:
>>>>> The GT tile is already available but was added again in commit
>>>>> c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),
>>>>> so here deleting it.
>>>>>
>>>>> Here a devcoredump example with the duplicated information:
>>>>>
>>>>> **** Xe Device Coredump ****
>>>>> Reason: Timedout job - seqno=4294967170, lrc_seqno=4294967170, guc_id=13, flags=0x0
>>>>> kernel: 6.13.0-zeh-xe+
>>>>> module: xe
>>>>> Snapshot time: 1737573530.243521319
>>>>> Uptime: 2588.041930284
>>>>> Process: deqp-vk [8850]
>>>>> PCI ID: 0x64a0
>>>>> PCI revision: 0x04
>>>>> GT id: 0
>>>>> 	Tile: 0
>>>>> 	Type: main
>>>>> 	IP ver: 20.4.4
>>>>> 	CS reference clock: 19200000
>>>>> GT id: 1
>>>>> 	Tile: 0
>>>>> 	Type: media
>>>>> 	IP ver: 20.0.4
>>>>> 	CS reference clock: 19200000
>>>> This is an overview of all GTs/tiles in the device within the global
>>>> section.
>>>>
>>>>> **** GT #0 ****
>>>> This is a section header telling you that everything which follows is
>>>> inside GT0.
>>>>
>>>> It is not duplicated information. And if you remove it then you now have
>>>> the information of all GTs back to back with no indication of which GT
>>>> they actually belong to.
>>> Can't you get this information from Name + class + instance? if not that should be placed in one of the sections below.
>> No. I was trying to do that originally and determined it was impossible
>> to do reliably for all current and future platforms. Hence the section
>> header was added.
>>
>> It is also much, much, much better to be explicit about debug
>> information than force people to guess based on heuristics or tribal
>> knowledge.
>>
>>> So this should be placed in one of this sections:
>> No. It is not information within a context or within a hardware engine.
>> It is the reverse. All the following contexts, hardware engines, etc.
>> are within the GT.
>>
>> And when you have multiple GTs in a single dump then you need a definite
>> delimiter to say that all the following is now in a different GT to what
>> came before.
> Can't I do a exec over a exec_queue created over engines in different tiles?
> I think we are allowed, so having tile and gt in '**** HW Engines ****' would be better.
Not that I am aware of. The whole point of the 'hw engine' section is 
that it is related to a command streamer. And those cannot bridge GTs.

John.

>
>> John.
>>
>>> GuC ID: 13
>>> 	Name: ccs13
>>> 	Class: 5
>>> 	Logical mask: 0x1
>>> 	Width: 1
>>> 	Ref: 2
>>> 	Timeout: 5000 (ms)
>>> 	Timeslice: 1000 (us)
>>> 	Preempt timeout: 640000 (us)
>>> 	HW Context Desc: 0x025e0000
>>> 	HW Ring address: 0x025dc000
>>> 	HW Indirect Ring State: 0x025e3000
>>> 	LRC Head: (memory) 152
>>> 	LRC Tail: (internal) 296, (memory) 296
>>> 	Ring start: (memory) 0x025dc000
>>> 	Start seqno: (memory) -126
>>> 	Seqno: (memory) -127
>>> 	Timestamp: 0x0000035e
>>> 	Job Timestamp: 0x0000035e
>>> 	Schedule State: 0x441
>>> 	Flags: 0x0
>>>
>>> **** HW Engines ****
>>> ccs0 (physical), logical instance=0
>>> 	Capture_source: GuC
>>> 	Coverage: full-capture
>>> 	Forcewake: domain 0x2, ref 1
>>> 	Reserved: no
>>> 	FORCEWAKE_GT: 0x00010000
>>> 	RCU_MODE: 0x00000001
>>> 	HWSTAM: 0xffffffff
>>> 	RING_HWS_PGA: 0x018db000
>>> 	RING_HEAD: 0x000000ec
>>> 	RING_TAIL: 0x00000128
>>> 	RING_CTL: 0x00003001
>>> 	RING_MI_MODE: 0x00001000
>>> 	RING_MODE: 0x00000008
>>> 	RING_ESR: 0x00000000
>>> 	RING_EMR: 0xffffffff
>>> 	RING_EIR: 0x00000000
>>> 	RING_IMR: 0x00000000
>>> 	IPEHR: 0x7a000a04
>>> 	RING_INSTDONE: 0xffdefffe
>>>
>>>> John.
>>>>
>>>>
>>>>> 	Tile: 0
>>>>>
>>>>> **** GuC Log ****
>>>>> ....
>>>>>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_devcoredump.c | 3 ---
>>>>>     1 file changed, 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> index 1c86e6456d60f..2996945ffee39 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> @@ -111,9 +111,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>>     	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
>>>>>     	xe_device_snapshot_print(xe, &p);
>>>>>     
>>>>> -	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>>>> -	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>>>> -
>>>>>     	drm_puts(&p, "\n**** GuC Log ****\n");
>>>>>     	xe_guc_log_snapshot_print(ss->guc.log, &p);
>>>>>     	drm_puts(&p, "\n**** GuC CT ****\n");

