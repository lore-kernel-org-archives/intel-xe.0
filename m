Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56579C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 04:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A90D10E101;
	Fri, 18 Jul 2025 04:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9msQnNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE12310E8C7
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 04:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752812392; x=1784348392;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C8vJkYpikq3HMpoSA3JMK1StBZg5HssE4x3QXoY0dgo=;
 b=H9msQnNASwcuKYBkHFGWtZHcL/D0TxSAzMhCWepGHcFd3ZOG2jj4dbOx
 R1HRcfL2fjex+mlPRyZm8Dw5Lr2oJmZhTQUsZBNXatBKKluyHffvPEKgJ
 NpT0X6hmT8RsVL4zrnafXl46YJcvJsumUVi/AEBR/4ZQL7K5I+z2ucP6L
 wnR4lMGoHSWrOepfHdN6rgZbxAVqe1T5G1tRNkoTv6waMMw1JrZYMw9fd
 YPZZKXSrsBwOrIm4kO4oN/fcFBKI4EPfbhphnlB/Gwy4aQT78Rqgxt8Hq
 TtUyrdOLSNjP/u6todILN97Pqq0Wq1LVshf7y5R3559dvnlSuzUWUCls+ Q==;
X-CSE-ConnectionGUID: 09BFm9YfRzqLudFdyu7NGQ==
X-CSE-MsgGUID: GVyRTviUReKwO2DsYUXHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="77639540"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="77639540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:19:52 -0700
X-CSE-ConnectionGUID: Fs81dYnGS9CD7+GI2Or5Ng==
X-CSE-MsgGUID: UfVkUelLSXCsG8RzWR86tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="158315441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:19:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:19:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 21:19:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFttzg5XwsA+4UzojvvMlMsCupZFEoGjQDb2JiMBxpoGm539nDGWkpUSGF04/y7b6rLqJ6XpHyAS5mjTMKXTE3AdzIWd2rRYPrwhdjxeqpwOoShpPfEjfrX7fmXfWcxN2gP0PzXEZDdBf1ZpsoOz2nyuwDP4Eb++kP6BpP94DITaMtbiijmvjyb2Al2EdALsHnM/ryDYfIuMCI0JHTePBWWjDgnjED+01skyM8+EvcEtAsJ1IjS5B+AYdveKHr3D++3IkDl027xYTMv/B7ytrIbwytW4kxg01ITjtY+qb6a+/DsRpc93llYZWHTyOW2IBcwy/sm7OSUeK+fa93/OaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMuZxgh+iaXLB+gPCYBNGz6NFJvPlS/SlxBQUweuuUY=;
 b=kuEtkzKJvgRefy7MOWBVMP5X75WHdi6E+3Lu31wlqGEufdcOS9OF89H1/grkPxnoAuUfpzNI/WO0VjF0C72Q5xCHryT34sNeCXfLBaWOU6VyW8eefvPTOwNDBR6m1kZJ9amzHLpSMcxZYnheObzTDurLY9lnwXi6qSetK5aoaug1DPR9e30sD9iktvGX3AdZsTNfPIZhS74HSm7LOCNhXyp1ijNSPcd9LgKXlOD/Pd95kA1QfOgLLC5cSZUKL0K6j6m0GUNgzFq0wK1s7VzS5voydYt+58cwq3J4CZ2LSC4HIgyea1hj97N2y9ijPbpbHKPzhUl0Iz2VeO/KOeG0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Fri, 18 Jul
 2025 04:19:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 04:19:46 +0000
Date: Thu, 17 Jul 2025 21:21:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 3/5] drm/pagemap: DMA map folios when possible
Message-ID: <aHnLzJATRPmharpX@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717133928.526111-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb7f391-d445-426f-4903-08ddc5b2544f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmdSWTJ2UWErcnNFbmtUSGRYaVkrd3FoSkpiVkN2eUtublA0V2l6aFlqZTFZ?=
 =?utf-8?B?TmlJd01jYmRRclpRUW1rOURhaWVwd0xrYnZjN3hPQmp4dG9wQUMwZXlnVExs?=
 =?utf-8?B?Vnh2ZUZENDF6ZW1LbmlRYlB2cVVqSis3aTBXS2s4Y0o5am5hZWxOMnVBMHJL?=
 =?utf-8?B?YytCTXBram1HQmdJUEVncno5MlhtQTVOMkxJWHRhVk5oQ2M1a3BmV2hLMVd5?=
 =?utf-8?B?cFNQNDVreHVsbVhhTEwzY0F0T1hjYUlLRHdUbEtLcFRrVjVIT0xGZGYwY2Zk?=
 =?utf-8?B?UkpDeHhSOHl0QkRzaUN6djVGNHFHUVc0MUJpNThrZ1p3RmRVMVpvRm14NmdQ?=
 =?utf-8?B?WGdQNThuMmptU0pKTzJnYjJNWXl6VDFHK25NeFJVNVdyRTExdEpoOGp2K2ZY?=
 =?utf-8?B?NWlSTjJ5WC9xejNnbzVsSFZsNmJQcXVPd05DR3F2ZlJwaWhtZi9STDRFSGFa?=
 =?utf-8?B?TlJkUnpJM0tMM0J0eGNTSUZSR0MwZEgwcjB1NmJLZWRyYlltYmNZdzRtOU1V?=
 =?utf-8?B?aW5OV2kvb0p6bEVBMzFJRFlkMUpoTEZRU0haUkpLbmIyYWZUWXNNdGZYemRx?=
 =?utf-8?B?c3Z5dWVoZ3Q4MXFqNHZ4NURTQko2a3k4WlFuV1JiZjRtV2tvOUFsVEp2NVov?=
 =?utf-8?B?dVVyNk1FeVBBTWhJTW4xY2pRT3lUM0JkUW5MY28xZzhqQkNjdHRJd2NvTU1Z?=
 =?utf-8?B?MUpsR0xkalJCcVdtSFRIZ0xjbVluYWRlaEJ4NzNjd3NMd2phMUlJckxzUkk3?=
 =?utf-8?B?bTQ3eng1MXdRTzliS1piQUtweTlqR0FOQzRRVTlYY1FLOVRwL05oeFQrVnpn?=
 =?utf-8?B?VGFDa3NVU2d4VGR4ZnZTeGpYRjZhY2lLM205dXA3L2lVVGNITVFZNXIvK2Vh?=
 =?utf-8?B?aGl3WGI4SFFiY1BEZUhrQitFb1dDakNkT2ljTzhXVVpoeU9wdEY2VDNVd1E2?=
 =?utf-8?B?cFk1a05GYTh0VmJtU2NJZUJqWldvQzFGR3hBT1FNV0l4dVZZQVdWVlhaQXMy?=
 =?utf-8?B?WGpndkZ0djFtbDUzWjg1ZC91Q0V3c2pGS01aaWJOTlJzMHZUbUhJM0Z4aUgv?=
 =?utf-8?B?cStXcTcxTXBrR24zWG1YVWsyTndoaFY2OUVIRTB2bEN2eHhtNXZyTzk3TlAx?=
 =?utf-8?B?aUpFbnozSHlWd0trdmQ1aWJPT2Y5NFliY1lMZ05jQ2xNVlVEdTFjdmVpVTBh?=
 =?utf-8?B?ZHpBMzBibElGdXY3cVpTWVVVd0dlOS9MdW9ta25jdjU2UkdNamNhNkN1Y1Az?=
 =?utf-8?B?QWE2QVl2a1MxZDhUK1V0NVJ0SVFtSFF5OTRLVWtTK2YwQ2Z3OXhLemxCTkpU?=
 =?utf-8?B?UFRkaFZ4Y216TnFsMzNNeis4MGcwT1g4bi9mdjlmRHlPV2lDaUF2Qi9vbW9G?=
 =?utf-8?B?Q1orU0pBcmdWM3ZUbVhMNWFIYW1NTElyaVNrOWJaamhyUVhYOURDQkxDQ2o0?=
 =?utf-8?B?Skd5SjlJQytKK0wyZzZIK0NGcEpkbFlSazNrSDVNbEtJYXppQ1JGUHpVemo2?=
 =?utf-8?B?K3NuL1pTZlhmSHoyd2xMdW5majF1M1YxT3hTZlYvOTZ2bVNkSzNlT2d3dnZ4?=
 =?utf-8?B?N1VGWFBjbjZIQjczSzhQKzhMVnJOeEMxdVFOVXJlOWNlT0x1dURocFBLcnZs?=
 =?utf-8?B?WE9mVk1sTitkMWFMZlBVUDVSbUZwVGxBYmtsdFFsWVc5amR4TUpZMU1FWGFn?=
 =?utf-8?B?alpYdVZtaWlVcU1EQ1lNREZWcFdrdXdyVEdwUmdldzhLNWZ0OUxMSUZOYXh5?=
 =?utf-8?B?MHJkV0puWDkyVkFacWdpVUJLTXY0VXVneE9HVHd6a2RiaTFJTlhNeFVHaXVW?=
 =?utf-8?B?YVk4TGExS09TSVoyMXRoa0RHT0srMTdmTWpHdHBieW9DUUhXaXhSb25GSUdJ?=
 =?utf-8?B?ZGw5aVlsSEV1TmdOVjRSYnc5WnhZMjJFUU9jZnRNRXRjWWhMdCs5eGozMkps?=
 =?utf-8?Q?lAAJmbZusR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlN1SFA5ci83dER0Q1lGcXFiWXZaeWRWZmVsVjJ4TUhxTktHU24ralZjL1NL?=
 =?utf-8?B?MDYxSnpRVWJaNjR6SklPZG9uWTVja3VXTGNxOHNDaWlFSzNzWmpRbWNMMUk0?=
 =?utf-8?B?UFhjbk40U1FPTEt5QTViNlMrSnNPNFE2MCtjemE0RHhBdWtJUUVOTG1iRXVT?=
 =?utf-8?B?eXpYblViVWo3TFM5aS9Od0RkbjlHU0xzTGMrK1lkMEFOOUkvMjZFSFluSjBH?=
 =?utf-8?B?cjlGUldJUmhwdFV1RXBza0VFdzl6MTRmWEtndW0zazRmcVBQdXRjWCtJVjJa?=
 =?utf-8?B?a1R2VlUzWmppaDc5Zmk5eHM0SFdRVzloaVBuMVZIQXBvQ1VpbzJ0RnVITThy?=
 =?utf-8?B?eWdBb1NhZjByUGQyMmM5a1dUM1dnbm5RWitydjNzSDBmblJ3MXFUNG9uQlc3?=
 =?utf-8?B?RWtzdWx3TGVraVNxcXZzNHNEeEhKZTNrSG81U01saDB2S1lLZS8zUkVuVWFX?=
 =?utf-8?B?eFp6SzJDK09wNnpXQS9YajNReCtSL2xxWlFuVnhndW9HL0JoblhBY1BlYlJE?=
 =?utf-8?B?SHgycEp2UzlyUEJxVWV2Q0hvWnBtZ2trZk0wRWtEa1Q0RktENVdTYTFsdHUy?=
 =?utf-8?B?aTF5aEJmZlgyUnE0cHd3RDlGVEw1SkZXcm40OWlMcEJRbUZ2K0JrbjJxVFho?=
 =?utf-8?B?Qmtab0d6eURocytjY21ma2ZseWdVN0M3NnJNYm1pZmpIZWpYaHllbEhFTWRm?=
 =?utf-8?B?L3FHdXFIeTRjbW5ERmovYTltYytvMXVxeHkvY0R4aXVzaHpIekJoSERHOTVS?=
 =?utf-8?B?czVXbEZFMmdKQlZJMGY5WjE5TUJmdHBoS0VVWEU3SlJ3V0Z3eUVLeWVKcFR6?=
 =?utf-8?B?L1NGOGpCakN0ZWcrK0o5Vlh0ZXJ0dU9IeURSdytmZGYya1BwMUI1U24wbTZC?=
 =?utf-8?B?T3NaMkdvR29IMVZTek85VDRaSXVBa3hNVW9FYTRYWkFVN05zallJV3FaY0lZ?=
 =?utf-8?B?L0pubU9JVldmZTY4NGhobmoxVjZHbzBKRDRZd2F4S09NUjJPVWhvRE5LQXRL?=
 =?utf-8?B?ZW1wT3dhRllISXEvNkVlRWdSQXhGTjNyNDNaSXlWbWhDSjI2MnJienJmUkpq?=
 =?utf-8?B?VGJYcVQ3b2NGZE04Z3ZmQ3p1V3pmY1NaY0w2WmJXVUQwSDBQWHhTUHUzYmdU?=
 =?utf-8?B?c21VM3ZQSXlVZFNZNkt3OGZLL1BmZ1NOdWRsdmt0TGRnZ0JWV3k5TUk0eGl2?=
 =?utf-8?B?ei9hbmVkcDJjdnAveGU2QWpNaDlQN0pHN0NJR0ZnbHdKNGJWa05mSlJQVTJn?=
 =?utf-8?B?Qkk2NG9pQ0tDYnZiY0FaYmE0c0dQYlZFZG9GK3ZRYTVtUnI2aSt1cDJ2c2Zm?=
 =?utf-8?B?eHZrS3ZaK3owdDM5bm9STlU4QlVKTllqWjRkRmZEaTNUYnZURFljOCtsdWZk?=
 =?utf-8?B?cUpVUU4xR0MyeDAvVTF4Wm4zdm95UFRLdS9SUUZJUU5lZ0ptZHFzdlpSbjBP?=
 =?utf-8?B?TjMzMFdTcjFSa3V6Z1M1ZkFhWUIrMERVblJPSEU1NjN1OHBpQXI3MEt2cG56?=
 =?utf-8?B?Unk5dkRnK20zN1VnSUVWcFRqRkMxZHdoZUgzM2tKbkVFNGhCZGh4VTdOOGdr?=
 =?utf-8?B?YUd4ZTM3MW51d0t1SEszZEhyZmtFckhTcnBXUE1ja3pNK3IvUUNITXdpRncy?=
 =?utf-8?B?K3BvTjFJbzg5NGF6MDMxY2RwbUhIYlNhbXcxbmd0disvMi85NjNNWmJWN0J2?=
 =?utf-8?B?aUFETDgrVUxFeXQ1Rm5XcDV1VUlqbW0zb2VrRVpSWm4xbXo2MG1FVlh0MVho?=
 =?utf-8?B?ak56bitBcXBVUzRoTjd4MU05bHh1b3pZR25aRXg2MTc4c1htYzBXb1NzS0ha?=
 =?utf-8?B?RmhhT3pSTFdGOHBMSlZQTkRITWJKMXpzSk82N3h6VW1iWEpCSjhjdnZZK1dx?=
 =?utf-8?B?SXhRVGN1Y2lsckNQeUppd1Blc0lJNXhoa2pOb3lNTDJtZDFiRUZwZFZmb3VY?=
 =?utf-8?B?YXZWS3ZUTUtWNkx5QVNoVDVoZm0zTUZ2NXJZL0lreGtvZm9rOG5IbWlsa2RX?=
 =?utf-8?B?ZXNIc2hTT0paSURiS2lIQmhWR3V0ODdGNWZTSU1rdzExR1lJR0lkYnhPa09L?=
 =?utf-8?B?b0g1Rmx3dEw0bXE2VC9vOEhxQmx4Uk1ZenExWmZvTVdnQml6dFNUeWFQM1BL?=
 =?utf-8?B?RWFZRWJVL2xjd1I2OXdzWEJTTWMwMmhKTXJPQzRtUDlibzRVaUdiSnEyazZE?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb7f391-d445-426f-4903-08ddc5b2544f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 04:19:46.8305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Fsqtw4Qgyc9hf2dkqNV19fE8iNdClmV5mrbSsFNi1ZItWC2ox07dEYBok0OZ70wkuazVIrN72FzGghfRPzn0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
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

On Thu, Jul 17, 2025 at 03:38:25PM +0200, Francois Dugast wrote:
> If the page is part of a folio, DMA map the whole folio at once instead of
> mapping individual pages one after the other. For example if 2MB folios
> are used instead of 4KB pages, this reduces the number of DMA mappings by
> 512.
> 
> The folio order (and consequently, the size) is persisted in the struct
> drm_pagemap_device_addr to be available at the time of unmapping.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 0ed66aaade14..de15d96f6393 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -220,20 +220,31 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  					 unsigned long npages,
>  					 enum dma_data_direction dir)
>  {
> -	unsigned long i;
> +	unsigned long i, j;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		struct folio *folio;
> +		unsigned int order;
>  
>  		if (!page)
> -			continue;
> +			goto next;
>  
>  		if (WARN_ON_ONCE(is_zone_device_page(page)))
>  			return -EFAULT;
>  
> -		device_addr[i].addr = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +		device_addr[i].addr = dma_map_page(dev, page, 0, page_size(page), dir);
> +		device_addr[i].order = order;

Again, proto, dir.

> +
>  		if (dma_mapping_error(dev, device_addr[i].addr))
>  			return -EFAULT;
> +
> +		for (j = 0; j < (0x1 << order) && i+j < npages; j++)
> +			device_addr[i+j].addr = device_addr[i].addr + j * PAGE_SIZE;

I wouldn’t do this here. The Xe SVM copy functions expect a fully
populated drm_pagemap_addr, but we can hack around that there for now.
I’d prefer to keep this layer as clean as possible.

With that in mind, I’d update the kernel doc for the copy_to_ram and
copy_from_ram functions to indicate that if drm_pagemap_addr is higher
order, the subsequent entries within the range of that order are
expected to be unpopulated.

> +next:
> +		i += 0x1 << order;

I wonder if there's a macro/function in Linux that does (0x1 << order).
If so, I'd use that. If not, add a local one to drm_pagemap.

Matt

>  	}
>  
>  	return 0;
> @@ -257,11 +268,14 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		if (!device_addr[i].addr || dma_mapping_error(dev, device_addr[i].addr))
> -			continue;
> +			goto next;
> +
> +		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE << device_addr[i].order, dir);
>  
> -		dma_unmap_page(dev, device_addr[i].addr, PAGE_SIZE, dir);
> +next:
> +		i += 0x1 << device_addr[i].order;
>  	}
>  }
>  
> -- 
> 2.43.0
> 
