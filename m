Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0323CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B91110E0A0;
	Wed, 27 Aug 2025 18:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOS2eaWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C84E10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756317639; x=1787853639;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OOOEEfXPkbmH/JDUUdr2S9WAs3nNv4LgejK/j8fuXto=;
 b=XOS2eaWpg3HiUxrD1oBHR9KDanlHlYaoXMiGiDGEr0FOkLmyWSjjjgH8
 OXOyCJUl33MAKgneYDiO+32uj8onGY4ouOg8rZtmQVWH2L8vjoEPi2rdH
 3sP7UN/iaXhqefNBow109PCzvZlItsO/rKNTcsD433hB+FF2sfGGEuwOP
 XF9RtBnD42tqn/igvrAeSo+Me+7I8vbhk0b+aGUFOxFRF5QgYUBmH+2A3
 Yc+Fj1sQcXpEmgErLq/Q/1gdI36biR7MD05z/QJCxWJXPcw1NuordoNA6
 kcX9BhhMKqRwS9g9+Jpuw95UNfZ/J1GldlgW1QeM7vdTb28TQ2+USal1N w==;
X-CSE-ConnectionGUID: XcYo85ObThyRxzR2kZGV2w==
X-CSE-MsgGUID: 7ORrSw/iQ2avqMu/fKezmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58428432"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58428432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:00:39 -0700
X-CSE-ConnectionGUID: qe7/CsnCTH2hgZ7eFqOlQw==
X-CSE-MsgGUID: EfoLnNIxS2u4OR9G8DTApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200802449"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:00:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 11:00:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 11:00:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 11:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlZlebbfpTq3HqaqLDywqF8m+Ba3p6IsTUHXpaL4Aii4WjtIcaKeTIWn6uPCunIjtrhs1z7hlTMuA+5iqZF8uMUCf4+sj4AI9J5opEKqGaqbCn0qvhHOuw/rMGzARzOOxIuaysbJ2/vQrYBoq1FAKYNNif2I2HU7Q7FBcslIB+sIjUnx8yJSOdqjqbI7mRzBt5vLncmMU64UwsihP/tTshepr1KzYElcWuCq687kSnNIkkUI+vmynMvzXPVbnWV2YB0fadczThpsitVJgc149hWO9cUn7qJUuDQ0SPkpxcw/hbKFYPgcAPNLmetgXY0gtxraOOLqEUb8398XjBOmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyydTqjmOqvlxXpWptKhLF/B0sRmAaHe2qObL186yIA=;
 b=CIWtWrwuO3NXosFDDbrHU4dAa1f4vSOPdbx4hKrrb8+7OxR8511VnXivh6jBzcdaAdG0j7CAOGiyOagCU3ic7Qr9eyBdF2udUJqbtidToQfkXExK7RwLWY8nVCc8LJxAYwdlm4Za1QMNbMT/sudL5BycBpozvkXmk+czyIsylpzYPGMXTNzUY8HfbECC/U2znTrfMsE75srQSAfGsv1CgoItRweTnhsftzlmUMjVYpuIInmouHLINz8S0X0nkqyWFvPxkUU+2Sz5RekEx/U/hMHjkW73OKm23wmgdnlHBvoFB2TN/g+6yMSalw2xHyOHCmDFzXCIEv4n48JJgOEbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 27 Aug
 2025 18:00:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 18:00:34 +0000
Date: Wed, 27 Aug 2025 11:00:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aK9HvoHppU9sXdCo@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <aK8kauwpALcoSxwr@fdugast-desk>
 <aK8sbZxVd+MlS1ZX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK8sbZxVd+MlS1ZX@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd7821b-80fc-4277-975e-08dde5939ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVRGR0FsMTgzdVpScTVlRXdTbm5LaFB4T0Q4K2pEeEx6NEtvS1A1ZUpmR2o2?=
 =?utf-8?B?cjQvcE5KM3E1WkxZVDAwMVJhZHZ2SlVmYXlVUnZ6Y1NtbXdhQlRoSEJ2b1lp?=
 =?utf-8?B?M1Y0d0gxckgrWUJmU3daZUc3bnpBNnZOQ2VGbG1OSys4Z3lyTEtja0hMR3lX?=
 =?utf-8?B?NGc4ZWNTd1diSnRXank4aGVldDlWVHZZTDkrN3VBVFZDbmk3ZTdmeW9TR2JF?=
 =?utf-8?B?cC9NRmN6TUlvREdTNGlITVVjZWlGdXg1RFhGSjhLd0U0QXRqZ3lzdERzbkpL?=
 =?utf-8?B?bTFMY3dzeTFGQ0IyODVJZkNYUVd3WFdTcXpFV3pDUVl3bkUzVzBBbXhCZ0ZW?=
 =?utf-8?B?M0cxS3craHJnbzRKUDJIa2ZTVDJlSHFTVlAyaGlkV0h4VmlMUGwyMkZxTm1X?=
 =?utf-8?B?WTU1U0tXU3AyblR4MXVobWtvYlJWNFdWeHlmNitJMkphT2Z2NXlOVHc0NG5G?=
 =?utf-8?B?bHJrT0VVa0V2aTkzdmxISG5hVjFZeTAxVGxjMnJodHBsT2NoUHFEN2RzUWZw?=
 =?utf-8?B?WVhXVmlqS0d2NDdRUTJyeVc1Q3ZMektXMFhRZWhQVmI2RzJHOVd0N25ucEJU?=
 =?utf-8?B?MW9uK1VwM1A2OFM3bHZFd3NnRmFITmNpeUFLM3Jza1lBeTI3Q1ZlVjVnY0Jo?=
 =?utf-8?B?dGIxQkt0ZTN2UlF2bHpsR0pNZ3VTNmZXY3ZSYUJtSDBkeTFWWExLaVpPdVpj?=
 =?utf-8?B?dnFwT01LOE1adFVqbS9vZ3MyajdvVWd3K0hGOHBwZzhlYm9mUFJFVzNqSWRU?=
 =?utf-8?B?aUlSbXZ1T1N3ZmlNVHc5MHVwNFJEN3F5WThCZHVaZkNGSkJLbGVVZnVpSTNz?=
 =?utf-8?B?N3hJMnZvbi9vdmh5OXFnNDRQUDAxUUpLM2FUWHh5NzdkSEVJSElYWTc0NENw?=
 =?utf-8?B?WmhjK0duQk5ETHEzd09WQU54RFBtREJvaXRyNTRKM21jbmFxOExuM2pWYlow?=
 =?utf-8?B?RmxKSlkwV3l2RWMyTTBrb2M1V3FiV1B3NGRyTjQwSnVuUGpZWlJVZjEwaGk4?=
 =?utf-8?B?ZFdNK1RSanBKTXpvOEQ2UmRkVVZHOWx0L09NcUpOUUdXNGJ6NFZSdzBjZS9m?=
 =?utf-8?B?R0JoTXhOL2lxU2VBcGpUZWJiNUdSNy9lcktTcUg2Uk1seDh2SExyR2RzRHdp?=
 =?utf-8?B?TEYrdDA2MXBKRUY4U2M2Y29xcVFTazJQL2YxMlROeEZOWXByVDg5YXBSVXVZ?=
 =?utf-8?B?bVlIQ1ZyaEVCSzdLVE5aODlQN0doTEFhMUV6Y3NQWU9jV1R5c2xFQnVyZzNw?=
 =?utf-8?B?NENFOEtEY3VUaWxheHU1VnZkaUlOMmtpODhITE80TDdRZ1FFanNCeS9rdDYx?=
 =?utf-8?B?ZHBhM0puODFBbnNCRE9rRWo4YmIybEt3REMvakFLUDJNYzdtYnptTVhkaVRJ?=
 =?utf-8?B?dEViSnloVWZ1VHJiNEE3amg1SkpwcDZQN014TytubU1XQnJqZ3luTXh3SktH?=
 =?utf-8?B?bmV5R0x2ZWJlK3BxU0VHOFppanlVL1pHcmVLOWRicmNIR1MyNGdQSXB3dTZX?=
 =?utf-8?B?VzlTQzB1YXBBZWFDb2ZvSG13QlVPSzJaRDYxckgvaUN1ZEozb0dJM080Wmsx?=
 =?utf-8?B?SW1Yb2FsekVjc2lvR3JyVjdxYXNHZC9CdWE5cWxoMU1ITlgwWUFtc3Z5WUVE?=
 =?utf-8?B?ZUlLOGw2UmttUHB4UlhZcEl2REtycC9yakkrdU0wRjh1SWx3MU5xbkdPMS9I?=
 =?utf-8?B?eXRibW11eEcyZHRTelJwR0RlSnZBM1VmK1V3ZHJ4b1pDdVNpUnRVaFpIWEdT?=
 =?utf-8?B?NHVPK1haQURrTXNsM21DM2Y3TWkyQ1pqTUtkTnhTNlJIY3ozMEtDTC9leVZS?=
 =?utf-8?B?MHhVSktqeW9aNzJDSUxmdlhWdVp1cjEvbzhSRWtUek9OY1FRMEUrandJSTEw?=
 =?utf-8?B?emFKRFh1d3lUUG8rS2hwVUdFc3FsT2hSczFZVGRXUDJWWFQyT3ZtMzFBN3NC?=
 =?utf-8?Q?UtBTX/M7T9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVxTk1iTW1pVUd0UCtGcnlwUmxpRVpDSWE1OWwxd2ZEWnFERUswZ082bnJ3?=
 =?utf-8?B?WjRHVDBETWJaLzJzQUxta0krVTNLOHdIUG01UmpSTC9kRmVNYldEZ1ZuR0Ew?=
 =?utf-8?B?cGJoNW5GdVZFUUpvZVVaUnhMbDJvNTY1TkRqMjUzNGZTZzF5blNUYVNjQU9w?=
 =?utf-8?B?VXNMZlZCZlVCK0h0Y0FHazI2dWpLczBZdmFZUG10Z3k0TVNhK3c5N294YWtI?=
 =?utf-8?B?Zkd1VHQrNHNWb0QxVTQveU4zVFNVYjlwb2thd2o3enpuL3BZdUoydHRZYjhu?=
 =?utf-8?B?REprZkp2YXhtTE9wZm1BeExXbVhyU0RQV21FVVFveDV0dmx5bnhyNFdPcTB5?=
 =?utf-8?B?U01scUIyZklnMUp1T0dqRVRmemErbEpaQ2djaVI1NjVUb3RGNVJEUlNSOWNh?=
 =?utf-8?B?dk1JTzEvcGtjTDlRbnNPS0I4b3JhT2dGU2t5VnA1dkxmZUd2a015c0tXenlU?=
 =?utf-8?B?cGlIYUhsL3VabkkyWGhoWTJ1RTN6Vm84bUQxNHNKZGFjdy9Qc3A4aGRtUDZt?=
 =?utf-8?B?U1pOMDZpaTIvclBTTjRadndaOUNSdGJzaTd0RXBubUNrN0EyTmJvMlhyUlBk?=
 =?utf-8?B?UjEyY2NwNHNTc3ZoOG1QUDdzMUtVNlV0T0lpZVZ6M1Q4enVRSTlmNGNsOWxM?=
 =?utf-8?B?ZG94U3RObFJjUEhxYVE3VzdBQmhXVDFGMGZJSDVhYWUyMmlGZE95eFBYQUJJ?=
 =?utf-8?B?U3BVNzdOdDRTVE43Mk5EeDI4ajZJMzJZc2NyWnloR2luNXBkcnJIQjlVN0Jm?=
 =?utf-8?B?TnZlWnhNSm1qOExKSHBYeUtidmxBd1o0WVl0Mllnek5oWVNOV0VXemE4dWNL?=
 =?utf-8?B?cnIzc3Q0RTE2UHB4aEZUVzJqeXhYMkEvMHZqUUR0VENEMVltdjcwSDdoaWpm?=
 =?utf-8?B?b2dZZS9kUU5mL2l5MXFVcEt3MVYvZ1kxKzJZUzZacDJpYWVIVWdzNTZRN1Fn?=
 =?utf-8?B?dzBZTXkzNzVVZmhva2JIWDBZSGd2TFBPeXRkRFlqS0ozNFhxYzVYcXB6b1pN?=
 =?utf-8?B?Z0h2OHJXYUJoTGUvMHQ1NDFqcHVzOW10ems4TSs4OXFFa0V0ZjZQSzhDMzBQ?=
 =?utf-8?B?aEtTTE16M3IwbXlVY2JFbmJ1QUFUK3I2cnViMzllekdibEJ1M21sa1JPRkMz?=
 =?utf-8?B?RVZqQmVLOUNoSjU4dmxCU3JSNStQV2tGeGY2aDZsSkoyYlhacXVPaHZib1Q1?=
 =?utf-8?B?aTRFY0E3ejB5Njk0WmdlYXFnTElYTHpoc1hydExHTEl2ZENwZm5TbEZHNEpI?=
 =?utf-8?B?ZWlVR1RReFkrWGQxS241aTNZNTluV1pLUnBvOVBGb2ZqZTNRQXhYa3gxa05I?=
 =?utf-8?B?VFA5cCtyUC8zeGh2N2NnQmhyTC9JQVJ6SHBWMlpoTWxjcVFnSitPUERERTFj?=
 =?utf-8?B?MHA1N2toSGs4bkxpNkZnUnZndTZuYmUzc2t6ZTF6NDcxNXVlZEdiRDc5RWxD?=
 =?utf-8?B?Zlg5UmRFeElZZ1lOUDFrd3JRVGJFNlpZaXk5L0kyMEwrZ3JxQWw0Ukt0Ri93?=
 =?utf-8?B?YmpzeUM0QndIdU9YZFB6SkZUczNjOTZvOHhibHBJSG9tYWc4aHBtVFVKWkNl?=
 =?utf-8?B?UjVET1p2K0V3NDVKWktEZnZWWGlYWjRhOTMzZjViZXBYRERtT2tucFlqUUwr?=
 =?utf-8?B?R24yOGRtV1haMnB2MnpUMXk4U1FWMnlaQzUwM1JHVWhPQXJBb212dDBxT3Yw?=
 =?utf-8?B?MFNlYmlLaHQ1UnpheENsOHlPeithY2E5S3liVG9xRmgzT2dodEV6YkJrUlRR?=
 =?utf-8?B?Qm1lcENHMm9sTytlM0p0enV3MDNvYTY5SFdHZUVJSWFpMjZ4Y2FhOUdOZ2w1?=
 =?utf-8?B?bHFwUCt4d1lyMlQxVHNYbkVFSkVjUmlxSTNKcTA2Mi9hWGNFek5waVp5WnBj?=
 =?utf-8?B?QzRIWi9WU284bC8xQ0hPS1haNUJReStyL2IrbEJPZmtKY1Q4SloxZmwwRm9I?=
 =?utf-8?B?QWJnZ3BrRStQVDF3dUNQVUZ5RzZNVkhkeFZkaHZseGdkVjhCMWQwYkgyVVhq?=
 =?utf-8?B?MDdid3NKT3ZkWHNyNm5TZlNsWTBWam1WOEdLbno4bGUzUHZTaGdNUlNRMzZB?=
 =?utf-8?B?RXk3bWgxQkVodEVPOGdXdG8wbmJJenlSVSt6a1p2a2ZoTmxGN0FVRjJkNkdn?=
 =?utf-8?B?SndYTDBiNjBwY2lkRjE3WDVBbHliby9uOWRWRkFYV0ovaGZBWThTUExtcFRN?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd7821b-80fc-4277-975e-08dde5939ea0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 18:00:34.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kQxhwTLriPCyWk5bD6j/syIKW6CkuaQAuT0egZHGWHM21VU6WiFjI3dlYmy66UMYaJzpIYZmlN+P3+FfMC+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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

On Wed, Aug 27, 2025 at 09:03:57AM -0700, Matthew Brost wrote:
> On Wed, Aug 27, 2025 at 05:29:46PM +0200, Francois Dugast wrote:
> > On Tue, Aug 05, 2025 at 11:22:32PM -0700, Matthew Brost wrote:
> > > Stub out the new page fault layer and add kernel documentation. This is
> > > intended as a replacement for the GT page fault layer, enabling multiple
> > > producers to hook into a shared page fault consumer interface.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile             |   1 +
> > >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> > >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125 ++++++++++++++++++++++++
> > >  4 files changed, 208 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 8e0c3412a757..6fbebafe79c9 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> > >  	xe_nvm.o \
> > >  	xe_oa.o \
> > >  	xe_observation.o \
> > > +	xe_pagefault.o \
> > >  	xe_pat.o \
> > >  	xe_pci.o \
> > >  	xe_pcode.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > new file mode 100644
> > > index 000000000000..3ce0e8d74b9d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -0,0 +1,63 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_pagefault.h"
> > > +#include "xe_pagefault_types.h"
> > > +
> > > +/**
> > > + * DOC: Xe page faults
> > > + *
> > > + * Xe page faults are handled in two layers. The producer layer interacts with
> > > + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> > > + * then forwards them to the consumer. The consumer layer services the faults
> > > + * (e.g., memory migration, page table updates) and acknowledges the result back
> > > + * to the producer, which then forwards the results to the hardware or firmware.
> > > + * The consumer uses a page fault queue sized to absorb all potential faults and
> > > + * a multi-threaded worker to process them. Multiple producers are supported,
> > > + * with a single shared consumer.
> > 
> > I am not through with the series yet but xe_pagefault seems to be the
> > consumer code only, while the producer code will be located elsewhere
> > such as in xe_guc*. If so, might be good to write it here or in the
> > functions below.
> > 
> 
> I didn't want to mention the GuC specifically as it is intended to be
> generic. The GuC is a firmware, which is called out as potenial
> producers.
> 
> > > + */
> > > +
> > > +/**
> > > + * xe_pagefault_init() - Page fault init
> > > + * @xe: xe device instance
> > > + *
> > > + * Initialize Xe page fault state. Must be done after reading fuses.
> > > + *
> > > + * Return: 0 on Success, errno on failure
> > > + */
> > > +int xe_pagefault_init(struct xe_device *xe)
> > > +{
> > > +	/* TODO - implement */
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_pagefault_reset() - Page fault reset for a GT
> > > + * @xe: xe device instance
> > > + * @gt: GT being reset
> > > + *
> > > + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> > > + * the GT.
> > > + */
> > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > > +{
> > > +	/* TODO - implement */
> > > +}
> > > +
> > > +/**
> > > + * xe_pagefault_handler() - Page fault handler
> > > + * @xe: xe device instance
> > > + * @pf: Page fault
> > > + *
> > > + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> > > + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> > > + *
> > > + * Return: 0 on success, errno on failure
> > > + */
> > > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > > +{
> > > +	/* TODO - implement */
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> > > new file mode 100644
> > > index 000000000000..bd0cdf9ed37f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > > @@ -0,0 +1,19 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_PAGEFAULT_H_
> > > +#define _XE_PAGEFAULT_H_
> > > +
> > > +struct xe_device;
> > > +struct xe_gt;
> > > +struct xe_pagefault;
> > > +
> > > +int xe_pagefault_init(struct xe_device *xe);
> > > +
> > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > > +
> > > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > new file mode 100644
> > > index 000000000000..fcff84f93dd8
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > @@ -0,0 +1,125 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > > +#define _XE_PAGEFAULT_TYPES_H_
> > > +
> > > +#include <linux/workqueue.h>
> > > +
> > > +struct xe_pagefault;
> > > +struct xe_gt;
> > > +
> > > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > > +enum xe_pagefault_access_type {
> > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > > +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > > +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> > > +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> > > +};
> > > +
> > > +/** enum xe_pagefault_type - Xe page fault type */
> > > +enum xe_pagefault_type {
> > > +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > > +	XE_PAGEFAULT_TYPE_NOT_PRESENT		= 0,
> > > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> > > +	XE_PAGEFAULT_WRITE_ACCESS_VIOLATION	= 1,
> > > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access violation */
> > > +	XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION	= 2,
> > > +};
> > > +
> > > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > > +struct xe_pagefault_ops {
> > > +	/**
> > > +	 * @ack_fault: Ack fault
> > > +	 * @pf: Page fault
> > > +	 * @err: Error state of fault
> > > +	 *
> > > +	 * Page fault producer receives acknowledgment from the consumer and
> > > +	 * sends the result to the HW/FW interface.
> > > +	 */
> > > +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > > +};
> > > +
> > > +/**
> > > + * struct xe_pagefault - Xe page fault
> > > + *
> > > + * Generic page fault structure for communication between producer and consumer.
> > > + * Carefully sized to be 64 bytes.
> > > + */
> > > +struct xe_pagefault {
> > > +	/**
> > > +	 * @gt: GT of fault
> > > +	 *
> > > +	 * XXX: We may want to decouple the GT from individual faults, as it's
> > > +	 * unclear whether future platforms will always have a GT for all page
> > > +	 * fault producers. Internally, the GT is used for stats, identifying
> > > +	 * the appropriate VRAM region, and locating the migration queue.
> > > +	 * Leaving this as-is for now, but we can revisit later to see if we
> > > +	 * can convert it to use the Xe device pointer instead.
> > > +	 */
> > > +	struct xe_gt *gt;
> > > +	/**
> > > +	 * @consumer: State for the software handling the fault. Populated by
> > > +	 * the producer and may be modified by the consumer to communicate
> > > +	 * information back to the producer upon fault acknowledgment.
> > > +	 */
> > > +	struct {
> > > +		/** @consumer.page_addr: address of page fault */
> > > +		u64 page_addr;
> > > +		/** @consumer.asid: address space ID */
> > > +		u32 asid;
> > > +		/** @consumer.access_type: access type */
> > > +		u8 access_type;
> > 
> > For type safety we shoud use enum xe_pagefault_access_type instead of u8.
> > 
> > > +		/** @consumer.fault_type: fault type */
> > > +		u8 fault_type;
> > 
> > Same here with enum xe_pagefault_type instead of u8.
> > 
> 
> This structure is carefully sized to 64 bytes. Unsure if using enums
> here will throw off that sizing. I'll check on this, but I suspect it
> will, if it does I think u8 is the correct choice.
> 

Using an enum increases the size of structure. The page fault queue
aligns size to a pow2 so we go from 64 bytes to 128 bytes increasing
page fault queue size. I can add a comment around this too.

Matt

> > > +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> > > +		/** @consumer.fault_level: fault level */
> > > +		u8 fault_level;
> > > +		/** @consumer.engine_class: engine class */
> > > +		u8 engine_class;
> > > +		/** consumer.reserved: reserved bits for future expansion */
> > > +		u64 reserved;
> > > +	} consumer;
> > > +	/**
> > > +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > > +	 * by the producer and should not be modified—or even inspected—by the
> > > +	 * consumer, except for calling operations.
> > > +	 */
> > > +	struct {
> > > +		/** @producer.private: private pointer */
> > > +		void *private;
> > > +		/** @producer.ops: operations */
> > > +		const struct xe_pagefault_ops *ops;
> > > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> > > +		/**
> > > +		 * producer.msg: page fault message, used by producer in fault
> > 
> > s/producer.msg/@producer.msg/
> > 
> 
> +1
> 
> > > +		 * acknowledgement to formulate response to HW/FW interface.
> > 
> > s/acknowledgement/acknowledgment/
> > 
> 
> +1
> 
> > > +		 */
> > > +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > 
> > It is clear from patch #6 why it is more convenient to have this in
> > struct xe_pagefault rather than local to the producer but this seems
> > to go a bit against the elegant abstraction provided by this new page
> > fault layers. producer.private could store a struct with {guc,msg}
> > but that is probably overengineering so up to you.
> > 
> 
> You can't malloc (with GFP_KERNEL) the producer path, at least for the
> GuC as we are either in softIRQ context or under the CT lock which is
> the path of reclaim. The only option is have these fields populated in
> the stack xe_pagefault structure in the producer which then is copied
> into a preallocated page fault queue, sized to sink all possible faults
> on the device, on the consumer size. I can add kernel doc explaining
> this.
> 
> Matt
> 
> > Francois
> > 
> > > +	} producer;
> > > +};
> > > +
> > > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> > > +struct xe_pagefault_queue {
> > > +	/**
> > > +	 * @data: Data in queue containing struct xe_pagefault, protected by
> > > +	 * @lock
> > > +	 */
> > > +	void *data;
> > > +	/** @size: Size of queue in bytes */
> > > +	u32 size;
> > > +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> > > +	u32 head;
> > > +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> > > +	u32 tail;
> > > +	/** @lock: protects page fault queue */
> > > +	spinlock_t lock;
> > > +	/** @worker: to process page faults */
> > > +	struct work_struct worker;
> > > +};
> > > +
> > > +#endif
> > > -- 
> > > 2.34.1
> > > 
