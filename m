Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ADCC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 18:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B0910E9E6;
	Fri, 27 Jun 2025 18:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHeorX9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813910E9E6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751048028; x=1782584028;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o64aJTGG4J7NH/+dmqaJoU799aXH7CYEAcf0SUh3Yjo=;
 b=fHeorX9YaE1Sxtd8jYkvBi9+zN794YxLBHXsndST+5i99PYqnDc89g6w
 Z9MYVEWVnfK2WTAX4LGaYr86chTSiif9j8AjT1Nfq0vxo4VNLAfFulnbP
 N+XzVb+xhos6K5oQMyq1//XnB0ByvekyiZpLWtJuDICBNVVu1arDVIEuR
 ZZ7eheRTz11KTBTQUwS7nzc8JCM+W5eEBxJc1/Nv+6jWyPHCWkhnAiBxF
 cPaxw9K7FHk2qk7xUZ7VZ7/wwZzktHn0VPh5ypnInZT6hCyZv5aZIF0Tz
 GPQo30P2AUPu49hNscdrJnNwz6SwWrgxb4pn+M+UhdAp8Ae3qx82G0VFJ g==;
X-CSE-ConnectionGUID: Kz/6FO/SQAGac5aRfPhgNw==
X-CSE-MsgGUID: jhzWraDFSmKC3Eb/I3nWTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64810387"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="64810387"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:13:47 -0700
X-CSE-ConnectionGUID: Wp/nGY2vQWyWlvgwjwHvZQ==
X-CSE-MsgGUID: 5xo93pDSSqeAVfPe2Cl4FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="158602405"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:13:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:13:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 11:13:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxRNK5tT0DszlUYmAbWSYAKZ5VFGN3lYm1EP/dAC2I3Cir1b/8E1JnlYkzXx/Ue9jEYO0YYHVJ8QJjiBNWycr6kTN5mob1TjtICKFX+9cxdqRq0fQ5pnhj2IRDZil0S2azYaRYypb6YgNu89SQX5rGdeHowX64Dqe4LveCiT5qS7FlK6BgZIk78KVUraupTe6DS6Xc8KqbSuTjldCmEwWWvC/d7aHEQBDgQJ0uGCDqZHC7q6gfiope7bWtNLCW7mqdcHj/vdHHl+dAu614GijukrDd2vJkXZnu4sKQVo/Zbp0B2C9an5TuWntCEPuBgzLPv/Dw0fSMwIIWMZTlNBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5+eN/l/62ZGY5kraBkgtZR16WZI6EbteNUU2OVbssw=;
 b=mEfGOXh7UivHlor4a0ri+z0nG0Vd2y+t7u5IXj3mQ2fMuZTjnRhqxdHlU6il2irKZ8SGp7E47PljddA1zllHUpSHCgL/Y2e109qVRB7OdKegK7LZFJO50OVwe1vTRfv2D5gX5uOVrV9FrYXBlxa6YAy7TaysdyCDPk7WSpE8tS0NtSs9pufH/+QbjpJA7mTaE9wF3uDAbKz7hA04ZFL2fgYguIC96lxeLVBOieNE/m2+mis4qcZZ18smGXvUT+ixvZzCwRt3ccNzlaCRR/wq77JdaGT12u6pST3Sbm9hXI0tW+yWK1RL3ZVgFfwVlRMD6YkZMElNSGz865HqrsNW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 18:13:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 18:13:30 +0000
Date: Fri, 27 Jun 2025 11:15:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Message-ID: <aF7frlGMm0HSQN93@lstrano-desk.jf.intel.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
 <aFwF53I_d8OkwI3_@intel.com>
 <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
 <IA3PR11MB898706D0EC2F50C11BCE2F64D045A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <SJ1PR11MB6204C011AD05706EF7CCFEDF8145A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <aF7bog/C/FNcdfDe@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aF7bog/C/FNcdfDe@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4fba79-afbe-4873-659f-08ddb5a65214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHl4amxEK2xRRk9qeUgySW9WNG5jdktPRGQyczF6US94cHRjb1d0RlZRTDlZ?=
 =?utf-8?B?ZzJiZW8vZGQxK3Q5SW1mRzFyNEd1aHpERldpUURxeFQ1QmFZQXpWTTh4ZnE4?=
 =?utf-8?B?VGg2OUViRUJlSnRTeTRwRENneEhJVUNiK3laYmVwVzNXaVcxSDBlcElxTWFH?=
 =?utf-8?B?U2R3NUtGQ0JrL3dpekhHMjR2eXpaQ3ZmUlpGKzNvejVVS01TZk1sZWN2YWxv?=
 =?utf-8?B?MW04eWU3cWJaWmNudThXaUZKZERoQ29FTFZhdUNmcXd6MEZSZFNFU0lVSTBE?=
 =?utf-8?B?blo4Z0orYTdWdVZuUytWKzU2VXdhZDNxaGlvNGhscFNSODJrZ3FTd0x1dXZ3?=
 =?utf-8?B?SHVLTlBrQWplZ3IyN3cvQklWa3EyK1VQQ2lIZElxOHBCcHhQRk9YVnkxbk8x?=
 =?utf-8?B?Zk9HZzBGaE02YjMzSGh5WlZ2SWF4N2xCTG5zMytFOVBSMVpxbEJzVTM3UG1N?=
 =?utf-8?B?YWdQUjE3bEc4RmErS2ZFSzFBMGFGNmZKaEE1TWFWekg1RWF6aks0WUREdy9K?=
 =?utf-8?B?VVcxenBiVXdvalJjNWxnbTBXMHp1Y3JjNjNqdzhSbjR0Rmw4LzlYVlNudHZK?=
 =?utf-8?B?MXNJN3MxeElkSzlSb2NSeVZpZUlBelY5b2RwNEVrVDREays0Q3JJVjVRd2Nk?=
 =?utf-8?B?anVJR3ZWL1Z1SHNEKy9pR2pZdHI1RnA5RU1yc0MrbElFY0FMUGFPcDNTdXVz?=
 =?utf-8?B?NlZTcFJ0amsvOTVxMGs3K2RaZFcxYXJmb3FaQUNTb0VWU2FnOWJmUG9mblV6?=
 =?utf-8?B?T3cxYXViZHhtQVRwaCtmY1d2YWZFaVBpU0VxSkdaYkpBWm5VdndvdEpVTTEz?=
 =?utf-8?B?SzJNWWlGMGFtRjVOdnM0elFIZUQwZG5KMk50eEJoTm9VQVdPYy9WeUxaRGsy?=
 =?utf-8?B?NWg0ZTBoSWJub0hET2VxOTZadG9zYUxKM08va1lFSGg4ZnVuLy9UN0IxRndL?=
 =?utf-8?B?U0VFNjV2Y0Jrc1VET2JKS3VkTm9nN3pIT09JL05VdzErbWpTYmcrVUhjY1NR?=
 =?utf-8?B?aVo5Uy9iOXBieUZKUmQ4R2hEOUVzM3JubDdSWFpXaHhUTk96K20zMWlja2U4?=
 =?utf-8?B?cUI2dHpXdkprelVsdU0yQTZFczFsT1FNZWt3TzM0WWJ2REF3UTFTYThZUGJR?=
 =?utf-8?B?UE9tSXZGVjZDTDk5Q1V4c0ROOEFMbFJ3YXZZcUQ3NFRudDNMTDBqTXozNnNy?=
 =?utf-8?B?ajdhRW0vRTFoRUJjcUVmUFlpYnhxbXJlOFRZdzltSkQyZTJscFkrUXRGblFD?=
 =?utf-8?B?SVJ3eCs4Q2dOc2xaeDdqdHdWSFFCc3pRV05SOWZ2ZndCWndQeTB0cUFvNmtX?=
 =?utf-8?B?V1JaYTlYcVkxd0E5QjRERHBTam1LNWZ0U2p4alVDRDdaclFab0h5VHA2aVRY?=
 =?utf-8?B?cWpnRWxxMUNUZUxlUTJnTXVHZWNuS2p2Vy95MjBQUUdtcU0zWTR3cUhhM2R3?=
 =?utf-8?B?Nk8zL1lEWHpUbXhVeENpRVpCWFVCT2FIcmlJbGh3QlJBcEFCUktjODFScGlq?=
 =?utf-8?B?eldEd0o3Vk53TVJkaTIxTWtVcFl4VFRMKzNENWxWbnVneWJwODFDL3pzSFU0?=
 =?utf-8?B?cTdvRWpydVVQNHAvL1pDWVFxTUNwVms5TDFJcElYeWp5cFJZcHYzUWZNS1pp?=
 =?utf-8?B?Rmw3WDFYWjRCalYwWDZrRUtDaEhUaTBxSGc3RU84NW1Ib1VyVU9LMFN3cHJz?=
 =?utf-8?B?WUhQMW42dytNOUFROE12aUtYWk9ZTE5qZDVhZGZpdUx1N0ZlSGlQSk0xcUVY?=
 =?utf-8?B?S3lpNE9TUlluUUliOWQxQVBPQVh6WlNpOGMzakpEYU9qZ1hjcGIrR3JUNWtY?=
 =?utf-8?B?bXBpMVlkL2hQRHcyeVRnWEhMNENSTDd6dVNBZVdKYytoS01CVUpvbkQvR2xG?=
 =?utf-8?B?UUpIMjU5SkNMQW1wNjdUaWVKdU11VWIxMDd1TjhLOWt0V3BwODRpejVieldO?=
 =?utf-8?Q?H24Pm8Sd0IU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTFoMC9xVFBUbEhVOG5SK2FOaDJJVHd6dDZLYklQSDR6ZlQ2T3N2dm5udU43?=
 =?utf-8?B?VWpOVWk2bWlMRy9ZMWZHaWJ5VnBmcElRU1U4WG5SdUZNaGcyZjEzUDNpTnBn?=
 =?utf-8?B?REJUYytJMlJhUllIcEdJQ2N5ZlJqQTVvR1ZINXJVRWVwUFJhMEZYNkNSS0Vw?=
 =?utf-8?B?cU1CNjdzcGh3SWJONWl0d2J5VjBKS3AvNWZLSXNpZ2JpVytwTHBFcTBwcEVl?=
 =?utf-8?B?b01vUnZ5TFd6bE9BZis4ZEhrYTNqZThqVWZhcnoyaHRCNURrNTVZcjNYcEVW?=
 =?utf-8?B?dmw0UG1CM3FjQ29tTTYzZk9tRE1hN1RZSXdOODZyTEtxL1Z0Mnp3Sml5Nmdp?=
 =?utf-8?B?ZTBsMlNVRnVtNm1MQ0NqY2FnK0tseTIxYi94dnNoM3UvYzZFK1lOUmovOVMz?=
 =?utf-8?B?TE9NbkQzR2tGcWFIR0Izdk14c0tNS3BGOWVnOHBmNUV0Mk44MjEzQkdhNlVY?=
 =?utf-8?B?cENCZklQZ0huVU5rTURQTnNzdllKVHdYLytEMTJvb0R5NG94QkIwVTVDMHVo?=
 =?utf-8?B?NU8vUklVem5wZzBJY045RnVlMWJMZE1wbmRLVzZkUDlSN1JiR0Q3UmlvMG5G?=
 =?utf-8?B?ZWF1bFl2K2ZKbjBCbzRxL2N1akRrci9yMy90MkVEek9ETm0yOGx0blhBTVFU?=
 =?utf-8?B?L21wZE1CanpldEpPdFUrQys2Rzc3TDdNMVRhR0JvVGpxcWpXRnlXN3ZiZ3o0?=
 =?utf-8?B?LzRMTzAvMGI1TjJIRzcwUnhxMzgybnRFWVBYMmlDWmZyVDA5NS93TUgvMGFQ?=
 =?utf-8?B?M21STXZmSVhsaUJzTDExbUxseXRpUGV5VENvVjhnSEVmbkdqaEFNdFpqZDJj?=
 =?utf-8?B?cFNqMkkvV09JQ0F3NVVhRHROcWFQWDVIblpTbEVKTUFLSzB1cnFYMlIxMnQ2?=
 =?utf-8?B?L0tvTWl6TkdReERjQnhDTFdmM2NPV1MrbW9iYjRnTEtUNThKSXY3TnVwenEr?=
 =?utf-8?B?TGJReGdJSFhvMFFScjhzL3RQSHdmZVczazZPczhSSW9OczJ5MmJ3eXoyZXFU?=
 =?utf-8?B?SUhVWlFsM1VvRXZtWjdMVDRaM1pneTR3VHhKRmlhRS8rZjhEelU5YmhMb1dE?=
 =?utf-8?B?aGt4WFFNRFRhUGd0ZlNuYmhtTkdTQ1QwR0RDdjIvQkJxd0luclhQL2lIeXdi?=
 =?utf-8?B?U3RkV3BMK2UzRld1ejdqamxHeFZsODY3b2tKcFZXTENWTXJlYllQbkJNRGdi?=
 =?utf-8?B?QkphVnp3c2o1ejd6ZkQrWmVyN0orTGxqM0FDZUIwK1ZkUDBRM05OTnZLbk5o?=
 =?utf-8?B?SWJ0dXJXU2hyZVNvZVZjTTQ4ZmNZL1FScHpuMjRRaHB1eHBxTkppOUdVTDZ2?=
 =?utf-8?B?b0xLZ2M5M3RNSzM2MTRrbnF4RGR2SitFU25BN3RDTy9SMG5GQ1JpajBabGo2?=
 =?utf-8?B?K0U5cEcrRW4ySzVRaEdwS1J4RFAzVmdnUG42QUtKVW9LemZzdFNZYUNMd3Vt?=
 =?utf-8?B?cGZKQXNIL0JLdThHYmZmMzhUSEZwcmprOWVEM2svNTlOb3JZN3MybWEvdUEz?=
 =?utf-8?B?dlZUL1JieFkyY29GRTV3TmhyOGlMZ01rUldQZGJVa0JkV2dqdmxyVE56N29z?=
 =?utf-8?B?YTgxNndyQzhqMytFcW1FMDRYMjR3Z0hTNHY2NDRjbGxrVzJ1dXpwMWliYlVj?=
 =?utf-8?B?SGJKQjBnQlB5MkhRSG9WNHlPT1R1NWEzZzJXWjVPVzRWdCtnZm02N2RIOXJ2?=
 =?utf-8?B?T3NmalJ1V3c2ejlpUUZud2NJcHpxVjVlY1BnWFE2RnhSVUY5WVBac0Z0amNO?=
 =?utf-8?B?WFZOOHJub2RRczM4bjVhdEVTZE8zck9uZG9XdmN1SmJuZ0x6RW5kTzFjTmJh?=
 =?utf-8?B?TzVySkF5cHQ1eHE3OHBUaDBvRkRzeDkwQ2NLKzRGN3QxRG9GeE9iS3NjTHAr?=
 =?utf-8?B?WG80cmQvLy9ua2R2VE1mcEZvbzk4bjRCWkFkMEF6aGZURmEwQVd6N2J2Zmg5?=
 =?utf-8?B?Q0N4QjhwWDRxbFFEYUhKWFBkTjV0Yk9BVVp1MWFIclVnT1hyaERGTm9HeU9Q?=
 =?utf-8?B?dnJaYTRQNk02Vk9oTU5reDI4amsrS0toYThjdVFvVTRzVldWMTBzTHV1SzF4?=
 =?utf-8?B?NkhIS3Q0V01WOUs1aTMxYkY4a3V4MDBsSVdqaGs4clB3MTdxSXVEUmxhOXBG?=
 =?utf-8?B?NkpkWjRPNlVsc2Z5bCtqOUgyZ0NJYmVUcmxhcnF5TEd0T1lhWWhxRE1lTmRz?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4fba79-afbe-4873-659f-08ddb5a65214
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 18:13:30.4270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHm/AkhwDHuAH0AL7ei2tRXKNVFXm8fFIjAtpXjJRpJEhl9F7nnZwotOQj3K4zCBTIVxqmxpdWZv++M8PpqlPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On Fri, Jun 27, 2025 at 10:57:54AM -0700, Matthew Brost wrote:

Opps, typo.

> On Fri, Jun 27, 2025 at 03:37:34AM -0600, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > > Sent: 27 June 2025 13:44
> > > To: Brost, Matthew <matthew.brost@intel.com>
> > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Upadhyay, Tejas
> > > <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org;
> > > joonas.lahtinen@linux.intel.com; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: RE: [PATCH] drm/xe/uapi: Add
> > > DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > > 
> > > Hi Matt,
> > > >
> > > > Hi Matt and Rodrigo,
> > > >
> > > > > On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> > > > > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device
> > > > query
> > > > > flag
> > > > > > which indicates whether a device supports DIS_NULL_QUERY (Disable
> > > > > > null anyhit shader query mechanism). The intent is for UMDs to use
> > > > > > this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to
> > > > > > disable null query mechanism for anyhit shader by setting
> > > > > > DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> > > > > >
> > > > > > v2:
> > > > > >    - Use xe_rtp_match_first_render_or_compute() api to check
> > > > > >      render_or_compute. (Tejas)
> > > > > >    - Validate args->flags (Tejas/Matthew)
> > > > > >    - Add proper kernel-doc for both
> > > > DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> > > > > >      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> > > > >
> > > > > Matt asked for full spelling of DISABLE, no?!
> > > >
> > > > Thank you for clarifying the uAPI naming convention.
> > > > I will update it.
> > > >
> > > > >
> > > > > Also, where are the UMD patches/merge-requests for this? And their ack?
> > > > >
> > > > From the Mesa team (Palli, Tapani) is going to send the corresponding
> > > > Mesa patch.
> > > > Meanwhile, I floated this patch.
> > > >
> > > > > Thanks,
> > > > > Rodrigo.
> > > > >
> > > > > >
> > > > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
> > > > > >  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
> > > > > >  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
> > > > > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > index fee22358cc09..ef8b49d2242a 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > @@ -26,6 +26,9 @@
> > > > > >  #include "xe_trace.h"
> > > > > >  #include "xe_vm.h"
> > > > > >  #include "xe_pxp.h"
> > > > > > +#include "xe_gt_mcr.h"
> > > > > > +#include "regs/xe_gt_regs.h"
> > > > > > +#include "xe_rtp.h"
> > > > > >
> > > > > >  enum xe_exec_queue_sched_prop {
> > > > > >  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> > > > > > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct
> > > > > > drm_device
> > > > > *dev, void *data,
> > > > > >  	u32 len;
> > > > > >  	int err;
> > > > > >
> > > > > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > > > > ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > > > > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > > > > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > > > > > +DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
> > > > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > > >  		return -EINVAL;
> > > > > >
> > > > > > @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct
> > > > > > drm_device
> > > > > *dev, void *data,
> > > > > >  		}
> > > > > >  	}
> > > > > >
> > > > > > +	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
> > > > > > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> > > > > > +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> > > > > > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL,
> > > DIS_NULL_QUERY);
> > > > > > +
> > > >
> > > > Also, as per Matt's suggestion in rev1, I'm exploring the WA BB
> > > > program to set this.
> > > >
> > > 
> > > If we move this implementation from the exec queue creation time to
> > > the submission time and write a WW BB program, then this register will be set
> > > for every exec queue submission.
> > > Let's say if submission happens 3 times, then register gets written 3 times,
> > > which seems unnecessary.
> > > 
> 
> No, completetly unnecessary, we have been over this. See below.
> 

s/unnecessary/necessary

Matt

> > > So, having implementation in the exec queue create time, the register will be
> > > updated only once, and we can disable it in the exec queue destroy.
> > > 
> > > What do you think? Could you please suggest?
> > 
> > Hi Nitin/Matt,
> > 
> > Are we talking below cases,
> > 
> > (if kept in WA_BB) :
> > User1 --> submits on rcs0 -> register will be updated for rcs0 (User2 will not be affected)
> > User2--> submits at the same time on rcs1 -> register will be updated for only rcs1 (User1 will not be affected)
> > 
> > (if kept in exec_queue_create/destroy) :
> > User1 --> creates exec_queue (register is written(not sure on which instance of rcs?) --> submits on rcs0 (User2 will be impacted if used same instance as User1, which isn't possible)
> > User2--> creates exec_queue (register is written(not sure on which instance of rcs, but for sure not the instance User1 is using?) -> submits at the same time on rcs1  (User1 will be impacted if used same instance as User2, which isn't possible)
> > 
> > If above cases are true then both look same, isn't it? Unless I am missing something.
> > 
> 
> Tejas — I'm not really following your examples, but no, writing at exec
> queue creation time is not the same as writing a WA BB.
> 
> This is a very basic process isolation concept that I would expect all
> KMD developers to understand. If not, then please take the time to learn
> it — this isn't something I should have to explain repeatedly. A quick
> Google search or a query to ChatGPT will explain process isolation quite
> well. With just four queries, I got an explanation for this exact
> problem, including why this must be part of the context state (i.e., the
> WA BB), since work gets switched on the hardware.
> 
> Here were my chatgpt queries:
> 
> "what is process isolation"
> 
> "in a computer chip why can't you set a global register wrt to process
> isolation"
> 
> "more in the context the register changes behavior of computer chip
> rather than data sharing"
> 
> "say in the context of kernel submitting work on behalf of a UMD which
> changes global register before each submit, why is that a bad idea"
> 
> Anyway, let me give an example of why the current implementation will
> not work:
> 
> Example:
> User1 wants DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY set.
> User2 wants DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY cleared.
> 
> If a global register is modified at exec queue creation time (i.e., it
> affects the entire GPU’s settings), then both users cannot have
> different behaviors — and we’re now broken.
> 
> The only way for User1 and User2 to have different settings is to make
> this part of the context state (WA BB), which dynamically modifies the
> registers as work from each user is scheduled on the hardware.
> 
> Matt
> 
> > Tejas
> > > 
> > > Thanks,
> > > Nitin
> > > 
> > > > > >  	q->xef = xe_file_get(xef);
> > > > > >
> > > > > >  	/* user id alloc must always be last in ioctl to prevent UAF */
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > > > > b/drivers/gpu/drm/xe/xe_query.c index e8e1743dcb1e..c5002b8c9ac0
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe,
> > > > > > struct
> > > > > drm_xe_device_query *query)
> > > > > >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > > >
> > > > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > > > > >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > > > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > > > > +
> > > 	(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > > > > |
> > > > > > +
> > > > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> > > > > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > > > > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> > > > > SZ_4K;
> > > > > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > index 8e8bbdec8c5c..7c30e707346c 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > > > > >   *      has low latency hint support
> > > > > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag
> > > is
> > > > > set if the
> > > > > >   *      device has CPU address mirroring support
> > > > > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is
> > > set
> > > > if
> > > > > the
> > > > > > + *      device has null query support for anyhit shader.
> > > > > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> > > > > alignment
> > > > > >   *    required by this device, typically SZ_4K or SZ_64K
> > > > > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > > > > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> > > > > 1)
> > > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > > > > 	(1 << 2)
> > > > > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > > 	(1 <<
> > > > > 3)
> > > > > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > > > > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > > > > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > > > > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > > > > >  	/** @vm_id: VM to use for this exec queue */
> > > > > >  	__u32 vm_id;
> > > > > >
> > > > > > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > > > > > +	 *	Flag is set if the device has low latency hint support
> > > > > > +	 */
> > > > > >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > > > > +
> > > > > > +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> > > > > > +	 *	flag is use to disable null query check for Anyhit shader
> > > > > > +	 */
> > > > > > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > > > > > +
> > > > > >  	/** @flags: flags to use for this exec queue */
> > > > > >  	__u32 flags;
> > > > > >
> > > > > > --
> > > > > > 2.25.1
> > > > > >
