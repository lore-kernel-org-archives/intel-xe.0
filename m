Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051EC5320D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC9210E7EC;
	Fri, 16 Aug 2024 15:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c32Wpqwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FAA10E7EB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820602; x=1755356602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8kOzBVSy2X/0z7Gd8XWIVE10orJ7EsJfYMCfjvJC5c0=;
 b=c32WpqwycI8tmyLAS8McghQTp3gIQuGozUtL5BSjjO2whpCcrT5Ap+z2
 BR6n6D6XRMvmypcRtyTy8W13Hf2wPawSqm8PsWhJFWJvTukifZ2l69Sc9
 3r4GiZVGFuJz5SWvV0qhmPJ2YrPFMDqGbcvM8E6vXtPqJkmoCt3fTyVTC
 NIhaju9lWBNTJW9z/aQ8retSKLEPqI+EjGD/XufHyZ/sLN/EDfpC0mLKH
 13BehtR3qRD8Bimz0Cs4olq8aZ/8djjozfOTfI2DSjpHtvJ4DPGLoPM61
 2vbhLouzHrxK1PzBW3d05+RYO0kByyfY0RW6amTGYKor8MVEeAREZDMsX A==;
X-CSE-ConnectionGUID: s2uha7nyTHyS4grsnfqEnA==
X-CSE-MsgGUID: 9OxR5eDgQ3eHjf1ZfB0U1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13054398"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="13054398"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:21 -0700
X-CSE-ConnectionGUID: H4I0oimlRfqHgGEyrYCjIg==
X-CSE-MsgGUID: BeIEYa33SRmBNywpSHJb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59384230"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MacjDN8U7iWMqfy7mVglVjQliN4cDF7+AHvvg6x3VQJkXXnvfjYEd9reh8wR2WCcIGTMK5WRDRKddKcEyqt4fnSNwMcWD0JBZIOirEqmdbj/ALYxJ3fqzAVaylR99shZtb4kqgi3iC0vqcFHB6ZPt4/kJ4VyJXh0AeDj58R2d2E3jQ9TA4QAUPexbY8YQzPD42yF9l583+f6aON2c+Mq4wvaxatMWeIjq2h2Hhjr6PnWxQvqyEOWDJRWmCJlBLnLCJnmQNhTdkSeDManL6uha4iU7doXJxa+g6Ps+kaLzBd4Tp8vW1N6GvZg0tXqEiCnbfVRCpyzng+j2XLYAcjIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXFt6taclsJ8BRG03RC3Swhx0zzZ8XxwGGHLeZyIcFQ=;
 b=wOT5KY+hpTyrb/1+LCICw3G2UH04jNZEg2LmknwohKhX0rIadqRXAmKj3FsQkvxMt+6aNIcCCI1MqcKH2mN9EEWm3canjb3XOxEhpvRV/XeRry4s4wy1FJGA5dj0Y/8dHwz1uCKU1WZSooXRZffdlxhDdNjFWoVte+Kv1CpVkkKejcPnmaiWP9aiIIAvb77kmbLnstYoztkC3QUZVqzjCyXoDn5FRSHqHiUlgAMz9P3bCVp8j0Pygh0GEi5kM6bX6pafqplkzEzYfcqdlBMc/lJXDf8cJOJu4nt1OnGBt4ftVT1czV8ydcy5MXqWtqZ6/iHyaBbJZ62Oq7vjvfcDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:03:17 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:03:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 16 Aug 2024 11:02:43 -0400
Message-ID: <20240816150243.87596-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 264a2ef3-853a-43af-af45-08dcbe048e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ynhjc0pzb05lajVwakYvUElMNHZRMldkTVF1Z1lMOW5jaS9sTFRURGRoUWJX?=
 =?utf-8?B?YjJUdFUvQk5sVnJwb2xub0pHbi9CeSsyL1dDWXk5MThaVFZla1pqMXFHLy85?=
 =?utf-8?B?RlNmQVRmK1dPVzhreUxvVzNNdUkxdDJFakpraVF2cmQ3UUZUL0pPcFFHYjh0?=
 =?utf-8?B?Tnc2RDR5cG8vc0lvSWk3dG1LeHN1ZEJQaHRIUEwxeWJocHNtc05sUTRudStx?=
 =?utf-8?B?U0ptQlJGdWk3elRtSmh1WG0xaVNqWlZ4WFlzQnB4TnVmUzUzU0tnVWIyYU92?=
 =?utf-8?B?NktqWlZhMWk3WW1jdEp4NmV3RjduWU5uaHd3Q0czYXBPd3BkT0xkTm9PL29i?=
 =?utf-8?B?VHZyTFFxRk44SUZiZFY0WEp2bzloV25PSTFPZVJlemhvVWdBOFIydC9OdUxC?=
 =?utf-8?B?aUhNSDNmZ1p6S0h3cGpYSW11UU5PeStBOVRKN2RVQ1hLcHpoVlQ1Ti9Tbzlq?=
 =?utf-8?B?bUZzYkgwZXJHajhVdC9tdzE3QzU2NzNhcUtQNElBUEN0dnh6NDlSWU9CTnRl?=
 =?utf-8?B?Vzc5Qkg5OUhPQlBUdjgwemI0ZlpFVjFUcG5tbzA3MWpxYVZNbWpKUUp6RlRq?=
 =?utf-8?B?N01YdENPNkMwVnM5SnJ6NnBTRjhJcFh5dFZjdGRNVUgxUEdmWE1rc2JDTXFw?=
 =?utf-8?B?Tmc3cWJjSkpaSU1pVGVqTFpZRE5TUFA3MTdaUUE5alF1alNBaFdWTkQvNUtF?=
 =?utf-8?B?bkRUdFFlWGlwcXNQdEZ0TGR6bDJIaThVcFJnZlUyNnd4dmV2N1duUXp2QmdF?=
 =?utf-8?B?cnN0OGRPN1pVemlQSUpTZ002K1E5MlpKWWxGcXBOVkRDZk5IS0Z0ZzYxcWJ4?=
 =?utf-8?B?RjZNa25aYldhckZTQm9HU0tBRlp6NlBoWGFJRmNEVzNUWDgremt5OUlNOGdB?=
 =?utf-8?B?S3dzV2Fqc1NYZU5zcjF3S2NXRVdpKzY3bHZnU3VRS3k3U1hIMzQ0QmpGeEhv?=
 =?utf-8?B?YVhpTm9LaDIyOEt4UnY3MmRSV2I3alprSW5OM1dhbytrVkU2WldiUUdCS2Rh?=
 =?utf-8?B?bkxBWWlQSnRlWkE1d2lqYXVrQXJ1NzF4alBmcEVzcURuY092NEJnSmxvZ0t0?=
 =?utf-8?B?aUhqbWFHQS80QjVNR2FJTUozbFZ5OFVwaWpCditLOXQ1b0RKakZXUk5vTkVi?=
 =?utf-8?B?TkkzclJKa2h2UjRycUdQS1JuNEVHVVFDWHpnQzhpQlEwZG5oWm4zVlhqMDhu?=
 =?utf-8?B?bmNldGRCK2lhQXErTHUxOVIza1p1OEg0NnE1Ly9wVzdsVDJTR0Z3NmdaNDlR?=
 =?utf-8?B?OHkxR1drVUdYT1lvQTBNU2ZWalVrOVRoRENQZVVyQW5OK0M5SzNkd2dZU2g2?=
 =?utf-8?B?VGFBRE5DME1zcHVYUzJjci84YmRHbUNWa2d6RitERlQ3ZnZMbWxPYnB3ZTBF?=
 =?utf-8?B?dklDQ0ZtOTRlVGV5dW16ZytJL01oN1ZHTktmTXZLYlB1ek1GOEVSNlJyM0lN?=
 =?utf-8?B?Mzh5MGpFcjZ0MEt2WllraXFveXdXRVIzRm5sWWx6cGxxOEVNUk1EMUxwVGR0?=
 =?utf-8?B?UVRkYVNxWHlVbEE4TFlKcjNHMGdVZnk4K2d5cGxhK2dtZXFLcXdMMnFPVlNF?=
 =?utf-8?B?aVNCRWtkMFgrZTFYQktwMElMVy9GV1RIbHZQeXhndyt2eFJsVFpVcFNaU0hJ?=
 =?utf-8?B?WW02MndNd3BaUFhLTUNpRDBleTBLTCttWnhSZ0IybFFIV3FtZ0ErZEFDbzh1?=
 =?utf-8?B?MllhcTYzWHovTHNwNVpCdVNDOFo0TWZQd3B0dlBGcCtnaS9VMDZreFF5ZlVJ?=
 =?utf-8?B?ZUdPTERWUnlWZ09UaHJzZXVpWDlRYTA3ek9hNlZnZU9nMHdrSlZPSHlpMU1P?=
 =?utf-8?B?ekpUVm0zRjhydHFlSDRodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhITUhlWWoxOUdlbDJtV2FZTFVXWDJuL2xIWjZvclc2M25hQXhJU21qbDVH?=
 =?utf-8?B?eTRjQXFEaHFtOWhLUjFUc0dwbmJwd2lSbGNRRTNLUGNvWWZaK2xheVlabnAy?=
 =?utf-8?B?OHFEYUFNeC9CN0p3bWpqRWpKeEpkZWIvcTJ5YktsSDhWSEJ1TnR2aUFTTC9C?=
 =?utf-8?B?TWF1SHh0SDBoTFJDQnBNRTF5VzVUc203UXZSSE9ZaFo3WmRzTHl3NHN3NW9t?=
 =?utf-8?B?MHBQV0lDWnA1bUU4YytpZHA2bk1HL2laclFDWUpLSnlIbjZhT3VyR2NEVDBZ?=
 =?utf-8?B?RythaVpoZXQrZGI5NTgvemRJZk4rdWg1c004U0xGNWpXWUNuK0RrdmFyQXZM?=
 =?utf-8?B?UUNHcHRSeXdXWFlIOWhqTjhWa0xzU3RUR3cyaUQ3ZWFIY1FDalRsWlM5SWJh?=
 =?utf-8?B?TmZ3WklRVWtKYmVkUUVxdGxwL1FYakNJTHdhRzMwM0pjL1loWGQ3NEt0b3g4?=
 =?utf-8?B?R241ajNTKzhxdnYxKzFPdDJCSzZyeXovWVdXRHhPQVN4SHpoZ2VLUU1FaENI?=
 =?utf-8?B?c05ZTTVuRUtLNVF4S21PWVIrODBJd293VjUxQTdaaHFOMkFyZ3hvODJHbTNR?=
 =?utf-8?B?QnlMZWNrUWpEMEh2OXhmQU9oYmZ1dHB3NVZsZ1RPSi9BbXhwQ1NSbHI3UWxO?=
 =?utf-8?B?NU1QUUFCa0NuclgrWDQxNTZjbmpzTG5CSFg3WkFHbTRUNUV3ZklkVzI5SVNL?=
 =?utf-8?B?UVN4RTBZVndWKzN3MnMxY29xdG9ZbHBFNy83by9EK08vWldGTFB0Y3NMa2lN?=
 =?utf-8?B?aFdRY1h2RVA4dFRiRlIwRGkvaW00SUFLd1h5S0IvcllzR3JURDZxNktpSkxN?=
 =?utf-8?B?MVZQR1JQUGdZNWYxRTRHMmVJemgvY055eUxnbVVmSVMxUitwRWd6YWJidi9u?=
 =?utf-8?B?VjZNUXo3bFJFaEVzRXFKK0RQR1dSODd4WjNaWi9YWVQyOW9MaHR6Qmpsdjcz?=
 =?utf-8?B?MlRtT3BYK3R4TkxDdFlEQ3NLRzVxOVFHb0hoUUF4eGZBZ2FLQXY3Yytibm5m?=
 =?utf-8?B?SzI3bS8vcEdva0xMaHc5OU9KcGI5RE8vWEY3Qnk3ZzNFc1hMbklObys3Umx1?=
 =?utf-8?B?NEg3dDQrTW5BMElrckZLMDJFNUx5VUNVNjREK3FFUFJrK05Zc2p4cTBiQWZm?=
 =?utf-8?B?QXI5S051VzRManN0dTNmMDlEZTlYUjc4ZlFvQjN4aVVGdm1RbXl1RStaNkJJ?=
 =?utf-8?B?OW1CQ2tTYTh5cDFXZXVWd1JFL3R5eE8xYWtMRUN2MWJzN2hjRmwwZjlNU1N1?=
 =?utf-8?B?T1djbDNyRUJabWtETytjNGZaTWtkdmJualRXZTRXRGJXR0hWdngweVdpaktU?=
 =?utf-8?B?TndFR1FpUm9zaGJGVXFFRnE2Q2xxTmxvNS9xVlRvZWs0bUtYTUhKYVpRYTlo?=
 =?utf-8?B?VVA2dllPNm1KSlZxcTRJUDhGUTFrY3VXQUhzdk5oQUtzMURJdVpqRVEwTUM2?=
 =?utf-8?B?YngydXNLQ2JLQXFrb0ZkZmY5azliQWVUQVRQRTZ1Z25FYjBUK25Cb1cydmND?=
 =?utf-8?B?WmpLR3NTYmF0RlVnbE0zcXpRd0Z0bHBhaDhScm9sbDhpL1Z4L09YSk9PMkNW?=
 =?utf-8?B?T09DeE9hUk9mRUZieDd5MlB3MmFRRVZ0eVM5Y28xdG1vbjc1dzdNNU5oMEZX?=
 =?utf-8?B?WkdTZkJKTDg5MXFkYWxtdjA0UGVyU0dqMnJvRzBXWG5wYTgvTXBOd00vOCtW?=
 =?utf-8?B?U3RIL1RnYUwrRnY4MVhYYTBnTXRnQnhHeHplZTdzaW0zRDlib0MyY3dEWmR4?=
 =?utf-8?B?YXRNeXhoaGtIWWs3cXlGeWdVVklEWCtwZFlCdEt1WC9FTEhrUmlDUjBpaVZS?=
 =?utf-8?B?ZTZ4N3JRYXExZkxRQjNRYlhKcEhNS3pMbXlway9QV0tOd0FwOUJvZi94aTJO?=
 =?utf-8?B?eS9NVXcyYTJvUU0vWThnT0h2YnZZOTdpMEJIYVRqOUgxWHJxWE5kUldVM3ln?=
 =?utf-8?B?QlBkNXhHUm5tOE95dndXMGlhL2RSaytETWMzTFBTWmFFM1lPM2RwZ3FhUVhC?=
 =?utf-8?B?VE81d2lneWxNMXRlalg0blpyS0pXYTlHTDBkK0JDV0ZxVXR5SytjdVlCdW9W?=
 =?utf-8?B?MXhaOXNyS25RalB6TGc3cDZLbHBCYklwVUFDMkxkS1dIMGI1c291cmxkSlJz?=
 =?utf-8?Q?1pAU02dTwbOpHC95/FO++85u7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264a2ef3-853a-43af-af45-08dcbe048e0c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:03:15.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZWFMPrne07ythGfpaKZcSAbU+j6yw22uVkMFO50fLOeUuxGoZKKfUQ1kFKQuzwdLUSYZa0YwOYHyz4Z1AwrzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)
v9: Based on the new xe_ggtt_node for the proper care of the lifetime
    of the object.
v10: Redo the lost v5 change. (Brost)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 107 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
 2 files changed, 79 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5c04c1bc8417..110acf828974 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	if (!node || !node->ggtt)
+		return;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto free_node;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		node->delayed_removal.invalidate = invalidate;
+		queue_work(ggtt->wq, &node->delayed_removal.work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -482,7 +547,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -499,46 +566,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-/**
- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	if (!node || !node->ggtt)
-		return;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-
-free_node:
-	xe_ggtt_node_fini(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 0e8822ae13fc..8b83610c6ee6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -47,6 +47,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -61,6 +63,16 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 /**
-- 
2.46.0

