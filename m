Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E72C3DA4B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 13:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8B810ED1C;
	Fri, 12 Jul 2024 13:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpwUN6e4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213E210ED1C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720792406; x=1752328406;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lw/RwMsGh5cXhxAQSmTKCL0aciQBbv1lSgZZaiD9/VQ=;
 b=gpwUN6e4G7pQnsfHU1ti1cECgGenFDNj/u8X+0DjN6YbGsbYhj2Az4IH
 Oy5nLdrf0UknQVNfnDwPwL6TJfGDbpDngwDeSfjuJpomAVoxStZpNpsZp
 utvw8uKS2GNPEXu/kaOQECff9wbrwmIc673sy2cx3FpjawpEqGXd/d3JI
 woziHWm+YQiQoKk0ITp0lPwmav2Iz+PsJ+lfztgRWalciYaoB62VCvc1h
 4UEXm9/zn4vxl3AC8thTY0ljXwCneIJr9SDCCUWiCARQBvMofVAaXsAfm
 k7CGdLqBUVBbuK2D7X7drNCfKZ3h5pkzZ3O9G0czVQ5xwDFGHT6jA1Bk/ Q==;
X-CSE-ConnectionGUID: y75ehxGyR7KdkdV7axs66w==
X-CSE-MsgGUID: 5MNm9MNtQNmjuG1lEbQm7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18182508"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18182508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 06:53:26 -0700
X-CSE-ConnectionGUID: MdnYzXOkS1+AhZlB/dc5FA==
X-CSE-MsgGUID: Z+NfZnblRBOJKP/1SLVpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48797817"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 06:53:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 06:53:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 06:53:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 06:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF0BfC1uunRLHvqx12eOSK2gmmnboBMyKDbgsqQmJ+/uPxFWogyJdkwC2oa1Yn3QYCoHlPROmcawr10dEveksieTYeOh7011L29kcQKvOpJljx2YSgc/xaG88aKY7uuVVOObVo2xNm5PHpp2/XbbVtsUiZSNmX4e/X6TuSOTDwQzFuvcRloDggjy8wilH4a95au6dpeVqIYS5OZM240Xtbg2HQ+kqKcc9QWkS95rYhtT054VynbJTtq6s6ZY/AxcyipiX8XBia9ZJ5ugkaiaq5skfFiwwW1Ly8DcjAbs3hCe7hJE/VAPAWFSlFxxPbn9TJy4MRCPV3GItRkaIcuSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9mGGsPN7iXFFiV5tr87aMmwmZG4Ev/5IlL5It+rrXc=;
 b=WVmEPF9p88NXWNoS/OlkMPd9vanu18UoGeRmV7vno9GfGkwqgbiwLCV+CcTh164sINOrIF6tcDmb9QtfsYiIYV77F6QWkJASlGDLm5Sur2IqoXPDUQeNdYbemFgcRqZBM98vi7RFH9Q0zCIwbhIqVy1RBnY4aUDZZNizxO1CotBI2UNrLHtHtE5fC9FGA6Zif+BWpoHo1Oc39iaZI1W/GzaoFkYiCYPLAI9VVvL5MmXAok1uOxe9TCZh8bGLnkzb9VJGTpPYmt6H1eTjryZk5kBG9OmzzTTfgHtYXLrqfH8XvGfQfMAiJbqG9ZH3zLlIBgdbEhlWx6k+oQzLKMCEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 13:53:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 13:53:22 +0000
Date: Fri, 12 Jul 2024 15:53:18 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
Message-ID: <20240712135318.zxhr6gvulkc3qdlk@intel.com>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <20240711192320.1198-2-michal.wajdeczko@intel.com>
 <CH0PR11MB54440F4C13371762AF17DAB1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <cba1695f-d537-47d7-aa7e-20c112c83846@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cba1695f-d537-47d7-aa7e-20c112c83846@intel.com>
X-ClientProxiedBy: ZR2P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c03644-5a02-448b-ce1f-08dca279fea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1dNZ0FXS21PQmtGaUc3NnQrcFBWM1ROQjRYZDR0bFp5MGlvLytRKzJBYkY3?=
 =?utf-8?B?Ym1qWFFaUEQybys2aENlamdLWnRQYVJ1RXRmeVViVjA2dTI3MEVHSFNhUE9Z?=
 =?utf-8?B?Zk9YS2owT0M0T0V3eFZKZll0NDRYb0xOcjVWMTBKRmFjdUdDT2xrdzhNWDRH?=
 =?utf-8?B?Y05VWDVaL3pEVHZXYUFUT0Mxa0o4UFVWYkFnT2N4dktISm1Dbmd2LzBvUFR6?=
 =?utf-8?B?M1FrTE0xMHByQkt6RmhFZkk5eFdUalJMMmRBTFMwVmtpNTI0UThrVUtDbEMr?=
 =?utf-8?B?aCtrRHhPY1Y4czZwSERzT0E3cmJHcEdiZXp4dS9WRFE2dVVrSFBRMGR3Tnp1?=
 =?utf-8?B?dGlCUG5ZR2RjemRXODF2bWVZYjZneWs2ZlA3VVErUXg4cmZidDNYU1NZTzI0?=
 =?utf-8?B?VURmVlJIeHNFWWlmRUVFVUl4VDRGTFh0dWNkK2sxcmo4OW5YSlZ0bGlDOVBx?=
 =?utf-8?B?dGVzMlVvMllieDRUKy9TTFZ1ckdrbFJxOVMxVkRaQVVEN2VJbzFlOWRnMmx0?=
 =?utf-8?B?QXp6c2JIWmJPTUZDUGU4L05mM1ptZUY3RDhpMlFMTm10bkl2b2ZPQ09OWGtv?=
 =?utf-8?B?OW5pb0xnUm53YUdsS3hTbVZLM3MrYzlHS2M2bk9ab3hOaTJwODNGQTNHNVg4?=
 =?utf-8?B?aHdrQzRwMjdHU29iQzZVeXRCUEdBa3BsMTlNdVZIczdTVDdjb2h1bVBUSGpo?=
 =?utf-8?B?dnBBOVVGVDNTVG81d3JjVXBHSmxJb2tKaUQ1YzFOOWZTWFlWTWc3RzZmaHpJ?=
 =?utf-8?B?YitiL1J3bGl0L2NDSEhkeFRkK3FXWEUrVlh2TUdSNXhNSThERWJ2dG5KdnE3?=
 =?utf-8?B?WVlLV3pCbjd6dlJDRGtWdkpGOWY3N3NFUWtKd050U1Q1Wm9BRlErYVlNUzhu?=
 =?utf-8?B?eXJ0WXAvMjhrQXpGMzVBdkVHaGlTRnVGNDNkaW5KUXI1OXlYL010cTFPdEtw?=
 =?utf-8?B?SGgyTE1pVXFKZXk0Y0hBVXExTDZxMWZxdDNUNEUrdlFjTndOdWpyZTV4L3Jn?=
 =?utf-8?B?ZW9nekdDSVRmMlk0VTVJS0F1TnFMaTd0eE5UUmNCTm1hZFNGbm9Pc2VacVhn?=
 =?utf-8?B?aS9OVVpFeVJ6dzVEYmkvNUdNUXFUekFIb0tRZFNNOWFuazJLbVovSWJtY3pD?=
 =?utf-8?B?amVwbzl0N21PK0Q3WUMrUDNtKzAycmtldVRoWjA2OEtOYUdvK1hHR3NhSjdB?=
 =?utf-8?B?QTByL3JDOGt4NjIzaUVCbEc2czNpYVJpRmFKdmI1akdEalBwKzF3ZjlzZ2g5?=
 =?utf-8?B?QVM2dEVrZFBzQ0NHL05XSFdvbkdYV2ZEUnNBaXVEdWVTcEJuelVka3Z3VStI?=
 =?utf-8?B?RWRpQStuK3pUWkRrQVFSWHpRYlcxdVl0TnorbWNPRC8rTWgzNitZNXFvR1BI?=
 =?utf-8?B?bkRyazZQUmlnT0k0Vy9YUERkSC9UOFR4V0JyYmpQMDBuT25WNlZJZk81UElE?=
 =?utf-8?B?MWtaZ0lKbkxtRG9RT0tueS9Odlo1TGczRDhGeWtVbzZBU3JxS3l1MFkxWXNE?=
 =?utf-8?B?RnlEazJEOWlUZU9KV2EwZjAwT3FjbnZ6Mjdqd3IvTFhPeGRXQVl3VnRvWU8y?=
 =?utf-8?B?YUJrNWVZc3N6a3BDb0VxeUtvMjBqVE9ZRWRHdlhham5VYXZtZnBYcmVNK2F6?=
 =?utf-8?B?VzJSL0pRQzhzY1lnV1pBRFliRWFzQXBPTVVPVWc0OUc0OW8zWUFqL0d1bzlU?=
 =?utf-8?B?R05iczRlYmcvemYySHk5ZmpDb1hNdUVpRDl1c21WcXhQN29lWFRTZzl0SndS?=
 =?utf-8?B?eElkTWJzM3g1TjBOeUdjL1pkRHl0Q3MzUmliWjltRjdKWUFmYUQrU0Q2K0dQ?=
 =?utf-8?B?TnM5aTdKcFVDNnFKQUduZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnE4NjU3QlRtQ1JERld1ZVdnY29ReTE1MFRSQXBOYW5WZEErQWhzejVKN01w?=
 =?utf-8?B?emlLZWxsMHV2c2pWR3ZKaUVGczRPVDZHV0xBcUNuY2tyR05sZWM3Ri9weVVu?=
 =?utf-8?B?NlI1WDhVSTlaSWdubUNJU00rRGVabGxObUo1UmVLbWpwSE1BVFh6OGpFMGE3?=
 =?utf-8?B?ZXU4akRoSkpyZGgzT1lvSFBoOTNacUJjQkxhVUJXc3hrMzd0NGxwOVlXeWVJ?=
 =?utf-8?B?UEdsZWpLbWlnU1d1SlloRjdxUHArdzlPYUNzMzhoTTlnQVpJNlZ3TnRyTU01?=
 =?utf-8?B?QUpkTVpMRUNCb2pKdHcxT3l5aTJta2NUd1JkaWFZdEgra0xVMzcwMWI2a2lw?=
 =?utf-8?B?QnVFUFRpMkpyS3Y4WTk2L3FmdU55OHI0b2loelRqZFJZczZ1UTdNNE0vL09y?=
 =?utf-8?B?RWNlcHFCRlZkVU1mdTFyL1AyY3Ezd3Zkd0JQVldza2lPaTR4WFRpVnk2Vklv?=
 =?utf-8?B?NWRnK1FsejR4UGpKNjAxUE1TcXRIWjdCdnFYWmN3UDBnUGErVHVoSWwyZHNE?=
 =?utf-8?B?VHdpR3VDMnRGNE4vOFA5d0FETHFhbXV6SVJWcHhPb0dnM1E1WkduQTdNeVVC?=
 =?utf-8?B?WDdQYkVzOUhraG1zYnh4NDN5WDVVNDREQWpXdXcxVmRiVVRYa1IwUFk0b09R?=
 =?utf-8?B?SUZmNnNVVEhCSFpGVmwvcGJ2SjlzMTZrSXFoNWtOYUFkcjJ2UjJ4N1VIYVg2?=
 =?utf-8?B?bklVdHFRNlJ1RVRUNkM3YVU0TkNLYThGb01lbzd6ZWZDZDRsTVo0TzVkU0Ro?=
 =?utf-8?B?c25LQU9kSm1OK0VGREVJTzZoUWxPelVyekNobUVITEg5anFoM0ZOQWpya1pn?=
 =?utf-8?B?YXZOYS9iUWxnZlRSU3BybEVzYUIrY2txUkt5dSs0L1g4cUdhdmcra2QrU1JW?=
 =?utf-8?B?MW14YWl4NlpZVGNCQkFHK0hldkVhUVNvalpvZUNRQUliMm1DRjhLSjUydEx6?=
 =?utf-8?B?UlNqUWJsSE8rVHBKN2ZZOFE3eThWZXhQZlcxWE1TNWlkcC9zNnFxZHdlNXBF?=
 =?utf-8?B?bnNRakVqSFdmMktJdkllMDNTeFM5ZnZrdElWbEhXblNyY1MrWGk4bjJTOFVs?=
 =?utf-8?B?R09wd2tweC80K3oyZzVJbU11VEJHa1lYMTBFVjZDZ2JUR0NUaDNaVnFxdzhv?=
 =?utf-8?B?U1ZRNTZIQWlHbW8raWZBQ2pLVFgyMlBOYUlwVUhwYno3TzJKZUcxbXdnWjhi?=
 =?utf-8?B?M2VOSWdvUTQzKzRxS3JTaTRUSFUvTjNRRkdpb3NTVlFRMjVjbEovcU9FQkRp?=
 =?utf-8?B?TkQ4d3FEQWt3bW1wVVk0bk5MMWE0QlhIRTBucDJVeXVZcUV5ZEtDbXJOZXVm?=
 =?utf-8?B?TVRHNitGQjRVcExOUmtWMXhyZjJzMWs0cXZlaVBtMFUzZ0R0WUROZTk0Yloy?=
 =?utf-8?B?NjFqWXZXbHdRcXFzNGJOUWhPZG1WL2xPc2tQemx1WXphY0dzZzkwbzBCZkRH?=
 =?utf-8?B?aDVCelNLa3U3NnJGZ1VMdUoyZVkwbkd0cG8yQU92eTR6elc4eGxUNGlKZEda?=
 =?utf-8?B?TEErelhoaFY4RTllWnVzVjFUamIraEpXTDB2UUhlN1o1bi9JbGNJeWFDRnNK?=
 =?utf-8?B?bUV2Sit3SGNhcXdKL25JRVlua3czdXpHdTRtWVFCZ0lGNmYwOVFzaGw4RnY4?=
 =?utf-8?B?ZGVyUExRbnp3cXQrMVpxMUtZZVJCeHdJMlBnSXZLdmNzSUU2R1RpRmdBc1Bl?=
 =?utf-8?B?Yk16WXlqQ3lGWjgyU2hkSnlxN2p5U1VYeWJrc0lIWlcwRmZoNnhIYWEzYW0z?=
 =?utf-8?B?dy9ydjNyS0NJcWlyaVFIOUpDbTcxVEY4MVU5OGhzSGZqNlZqY0craDRqUFZP?=
 =?utf-8?B?WXhOdlFuZmpsbThuTlVNMXdEYXlaY2xTY1JXMDhjckJIVWljZFcybVg1NVQ3?=
 =?utf-8?B?dUhqU25RazV5QU4waUVZc3NQdUt1L3NVNGFJUU5OMndRSlVZcGErd3hvb2ZJ?=
 =?utf-8?B?Wm05U1pZbWJEclIrUkdxdjBBWEZ3WFJXM1o2Y243ZloyQ1VBTHFPb1V2SkU3?=
 =?utf-8?B?WDVxT0s0OVhYemkrODBKbkYwbU1CdkxZd0VJeFRGclVBNHErb3lPb1A5MHN4?=
 =?utf-8?B?ZlhXSmhlK1BrR2QvQkx4ZnZ0eWJwd1ovdk55Um1ncjdZKzFnanlXelRvdXFC?=
 =?utf-8?B?WlBmV21sZUd5RW96TDY0alRYQVk0Nk5iclVHdUw4T1VtWGdWaU1DTjlkZTND?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c03644-5a02-448b-ce1f-08dca279fea7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 13:53:22.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlV1ylvmf69P/c5AMrMc9pwNpEa8JRg7PeNmKBaYRta1dcawocl8FEt3/f9FW5J0NSacrTqan0ZEUIkHE2aHOgtnoFKUn2IVJcmry5N8uIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-lip-11 22:21:07 +0200]:
> 
> 
> On 11.07.2024 22:02, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> > Sent: Thursday, July 11, 2024 12:23 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > Subject: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
> >>
> >> Due to the current design of the BO and VRAM manager, any object
> >> with XE_BO_FLAG_PINNED flag, which the PF driver uses during VF
> >> LMEM provisionining, is created with the TTM_PL_FLAG_CONTIGUOUS
> >> flag, which may cause VRAM fragmentation that prevents subsequent
> >> allocations of larger objects, like fair VF LMEM provisioning.
> >>
> >> To avoid such failures, round down fair VF LMEM provisioning size
> >> to next power of two size, to compensate what xe_ttm_vram_mgr is
> >> doing to achieve contiguous allocations.
> >>
> >> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> index db6c213da847..4699b7836001 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> @@ -1543,6 +1543,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
> >>  	u64 fair;
> >>  
> >>  	fair = div_u64(available, num_vfs);
> >> +	fair = rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy limitation */
> >>  	fair = ALIGN_DOWN(fair, alignment);
> > 
> > If the alignment is also a power of two, then ALIGN_DOWN here probably
> > isn't necessary.  But I won't block on it because I'm probably just
> > misunderstanding something.
> 
> true, it's redundant, but I didn't want to remove it since this new
> rounddown_pow_of_two() is (I hope) temporary and I don't want to
> accidentally miss mandatory HW requirement
> 
> > 
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> 
> thanks!
> 

LGTM: Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> > 
> >>  #ifdef MAX_FAIR_LMEM
> >>  	fair = min_t(u64, MAX_FAIR_LMEM, fair);
> >> -- 
> >> 2.43.0
> >>
> >>

-- 
