Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32360CF58CB
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 05:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96BD10E10C;
	Fri, 20 Sep 2024 05:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHQuLy4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940EF10E10C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 05:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726809475; x=1758345475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lf+OCU7jkjU9eoIbrJ6JyTHxrEuSOCGXyPRhmEwk91E=;
 b=PHQuLy4yYoVH1x9u59F/0gJljW0EZfg4MC36mVr3kaIt6zxxSzfpt6Q9
 Coq8bfres+/k0EYM6pI5E25jwJGzUWwP2ME9SRZnqHtvAGDeIZURPkPT4
 jwEBMgOhyRJEKnl9jW2FN8FKyL4XZUSUPu1mBq3kx/X5k8g7kHZxoAakf
 +Dx+keMSpvx5x1HuTQqZ1SrxT6E2nqf0BMbK1P98EZa50R6qzGFGd7A8s
 9rcLh1LuSX/79pXbRTcs22DNHtPn16cOQRVqDk2vaLL1g11f2pP+g7ySK
 2a6yrpRbe7USt+whnKrunH6qYSayge79JUbt2vue+IxP37+MQpnScDdPX Q==;
X-CSE-ConnectionGUID: ai6GRoldQjK7HN85P5q+OQ==
X-CSE-MsgGUID: BBQz+XE4Rq+9VDn/36txpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25953356"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25953356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 22:17:49 -0700
X-CSE-ConnectionGUID: qAaHMTTDRFqyVZJ01bqAbA==
X-CSE-MsgGUID: Gk7KUsc0TcaW+0vldtXXSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="101007597"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 22:17:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 22:17:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 22:17:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 22:17:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 22:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xinv9Sqbidoeb+wtumiKDq64/BjN7du8Jux0FLUZPkHOlJhOMpgFaP/FSwBfgNqTo5E9XhdjFNa2sECcB++rv9guR3iuh9x8AmM1bBq4EyblGZ56+4P0eCziz7LtRLN5s9NpGi68ZolSqROa6OCz3y/XU7OWLtWHWNfIFBnFB/Vbrnt4hmWchojw99V9zEWurb28kuIpo8YwSfyaOhgnhBss+7kwLro5E8h7qox1T+DhWP8g5rFDkmWqyRT2yF4W6pbPSq1BHCINkCPeFDxDV101DCzKc4iYKn+NqaT1QBxU1XOXUon0GgD4Rertw1fbeBflnW00RskM2kTWkz595Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf+OCU7jkjU9eoIbrJ6JyTHxrEuSOCGXyPRhmEwk91E=;
 b=sLQIPas5bm2Pvp05O5j8tPywgaNetmIxwy3E6L6/Bc0pxuzww4cXnPbUgG+07wgmgdTA56xLt54g0/J5DgePENocU87eAI/LB2PerV+158HkwaHrG1NRHEO0UTutxw4VfBtQ5hYPhSWZkGGOazZ2/oDr5n+PyyYJDml9q9tPCShBN6RSsGd5qPGjjKQ8Uv0xdEQn+h/wp4UQGaoYj60otLn6qs75pow2Z/KxlRJINFFsB1uQTQNN4KxB+R/50honoDWTUfAVv6ciXXmQGQZoMhCOzdthxe9cSpoEkQr2pvkAsgqkT48IMM/WyIh+mLbn008RDacKKiYyZUd7P3SPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 05:17:44 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 05:17:44 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Thread-Topic: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Thread-Index: AQHbCgwwBIknbEUWrkWZw6M9a2LZrbJewvcQgAC7/ICAAANKgIAAoNHw
Date: Fri, 20 Sep 2024 05:17:44 +0000
Message-ID: <SJ1PR11MB62049A21650B5A9AF1D6DC70816C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
 <SJ1PR11MB620488E5BFA1FB516114662E81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <172677385930.58088.6492678739635646603@gjsousa-mobl2>
 <172677456514.58088.3176651522327124209@gjsousa-mobl2>
In-Reply-To: <172677456514.58088.3176651522327124209@gjsousa-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7800:EE_
x-ms-office365-filtering-correlation-id: 09efc5c7-2957-497a-4482-08dcd9338ec9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QUFNNWtLeEFDYTRYY1JiZzdkQ2JqdWxZNzJaRjRlK3RmY1B4NlN0aEpjWUlw?=
 =?utf-8?B?UUczYVFMNVJpS1daWjlpOWxXTC94dWNSbzRVblVFTEg4WG13ZVRLWkR5RU9o?=
 =?utf-8?B?UEtJaGtrQ1gvK2RRbDQxTEtud0RWc011QVBCazdvVW9HVGhZK014bTEvRzVp?=
 =?utf-8?B?d2NWY1BoaCtLRjJTcFhGY3RiYWU3SHZua0xqZktEYjJqbFZMSjZjaHZYQXlu?=
 =?utf-8?B?ZkN1NVQ2R1BvQm9ON3ljMTZjci91N2U0SS9JVFRjR2pmWE1MaUVOV2Z0MnNj?=
 =?utf-8?B?WE5sOE81azdBVUR0YzdnU2tOcUdrYkZ0WXB6OTlkbUtUMWpuMzRTcjZRRHE0?=
 =?utf-8?B?Vk9aaWFSODRkdS81aGVzTERqV0dtMHk5YU1QU0tuT00vZ3RkUVliaWE2YjBP?=
 =?utf-8?B?NDM4R1Z1QUNTSUVXQ0JSdndzdnVhbU13azFhTS9KWlF5UGFuMFFWc1dzbkdx?=
 =?utf-8?B?d3lPSnFFKzRoQ05PR2t4cjlMaEx6K1c5dFVRRVNQc2ZSM25FaVF6RWw3clFu?=
 =?utf-8?B?NXVxYVF3dzlXUzJQZDNsZjdJcUs3bllKWUhPWG5zU2RkckpoY2wwaWNheDkr?=
 =?utf-8?B?NFlOL0lSR2ZIazV2YXdOZm5JRFJzZm1nMUlRNEpDdmlxaEY3ZmpMY3BNSllN?=
 =?utf-8?B?ZmxpbGd2elZtOTM3Q2hPUW1kT0Y5Vkc2OVEyK3QrZ1B5Z2wrOXc2T25la2wz?=
 =?utf-8?B?RDFiWXVvd0hUbHB3WXp1aER1R09Cb2wyQTJBVmJaYkJ0U1h6ZFVBUGNqa3ZD?=
 =?utf-8?B?Z0RMbTBMaEpkcmh3T1FpSVF4ZkZoQnVWUUgyQWUvU0hJN25uR0VwMVM3aHM5?=
 =?utf-8?B?T1F6TkZSZEROei9yRnRrTU96OFpLK2FsODVkcTZDWFgwM0JabUtLbHdjZHJy?=
 =?utf-8?B?ZU1jM0VDS3Z4QkMrNFNSbnlmeERCbmd4cjdDN0FUZ0xhMlA3RUl4RFBxOUFO?=
 =?utf-8?B?RUJrS0RKTk1SR3pVOFhzMlZvaldEd3ZNT3pXbjBKRDJpQUl5akxxZ0FQU0RU?=
 =?utf-8?B?YmNEZ2s5NVFOclZXczQ0Q0xBaDdzWjAzK29uMnlZTWNiTlB0UU5vNyt6ODBt?=
 =?utf-8?B?RENIS0c0RmNTQ01waDRsc1NRUVJhQmVVUGxnTW0xbEZDTHpueDBBYWp5MVZ2?=
 =?utf-8?B?aGVrdlhsS090RFkrQjZIS1NMVko4cmdSMG5lZXE1b0pSSWI2WkVseTRIUGJH?=
 =?utf-8?B?NzFkY1hwQjVtREdWYU5sUTNhU2NJYlBJbm9nemRPdUs0eHphblJHTTFiTEg5?=
 =?utf-8?B?OWdJcHQ2a0l2RUdqMCtrbndHVW5oalNQTUtCVWl3RjJpcWRqK1h6U2NGOUtm?=
 =?utf-8?B?NlV6SG9PaWtKMkdEc1RyV2hlU21mSjNaSEVpK21ZYjZXa0ZCSzlUNmREbDN4?=
 =?utf-8?B?eWJCMDhwQ0Q4WEQ2VEZ0S3ppd1FLTjB6dXpIaDJFck92MVN0SlRyRU8vbG1W?=
 =?utf-8?B?TG9NQTRLMS9ha3dhdDFuYmdZa3VTSUNYdzFLY0tDYWFhUDMvSUR6Y1NrRkE5?=
 =?utf-8?B?dkg4ZkVHVE1lM3NZeEdrUlA4UnkwRWZOMU8vMi9qUWRrZmRxMG83LzVYdTdW?=
 =?utf-8?B?aFUxbGoyVE9Vd2N4SllsSEcrQzdyZXFEWEVFczRJRVZBOWhIanBma0ZHRStx?=
 =?utf-8?B?bVAyaE81aGc4VWtWYTF4dWZSdVBveG8rVWE4bFhJZURTWmR5empucDlEM2hu?=
 =?utf-8?B?UEUrNVlBNFR2ODI2ZHVZazFXWHhDMmtjWWtkcUpFbjgyMnVqYzhHcjVXYzhu?=
 =?utf-8?B?aGNlaTBwNWEyYm5XWGo0ajlobldBRDVXeGFldHJIRFlCcFBteVhpYXNjSld1?=
 =?utf-8?B?ZElnR0FqTlkrQkwwdmR6OWFrclFWdi9QaTg1Z000WVl3MHZZbHMzdUo1RVFm?=
 =?utf-8?B?ZGVRUytSa1luQmtxbytQY1FEaGhiSDVDWllRZWtvMWEwd2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXVUZERPM1JXS3BwS3F4ZlBWQWFIZGlvZ2pXWWF2OVI2RDVock12TmUyM2p3?=
 =?utf-8?B?TDNzVUx5R1grV05QR25wUm9LUUVmZ2pWaDlYT0tKTTlmZzMycjdRU0htS0dz?=
 =?utf-8?B?SU9mc29saC9rclBURjdVOS9nYWkxaDdkdzF4R3JwU3lMNmQxL1FSOGhTTlpB?=
 =?utf-8?B?SXBtVUxNYlcwSURDTy9oVDk1b2s5YjNIaVJPZk5MMnhReVQvMW1VWnJvZFhh?=
 =?utf-8?B?YUhqQXBvTU9YWlM5YzhrcnF6SGw4YTA2L3FJN1dJVFBIQ2hKcEpPckJjdytQ?=
 =?utf-8?B?dnh2VlNxVWxsekZVczBBeWp3SFJnZ1pDdWJwY2dDV3ZpTi9RRDhTbjFuOGZm?=
 =?utf-8?B?YkxFSHIyVUlkVEpDQ3EvT25VMGtWY2U3Y2dhSUhrM1Jsd0hGa0NjNkE5Z0Nj?=
 =?utf-8?B?ZkxIMmo1OGU3VFdiUGFzK0dCRFk0Y056QTRDTVJsQWVMZ1A1ajRUcnA3WURt?=
 =?utf-8?B?dnp6UHU5VTFEVUxHZ3A2anB5d1NxOC91eFdON25wekFOR0ZhMm91RGtKeVh1?=
 =?utf-8?B?TGw4QnVoZTJRYlhGdHo4T0dEMGpyeStNRnNkZ2FYSW92Sk9pWWpia25pZWFL?=
 =?utf-8?B?cm4zMkoxb2paRVpKR3IzeHpHdldINU9RYzV6cjhJR0lxNGhIVHUrb0JYK2U5?=
 =?utf-8?B?MyttWmNpdTR0N1ozZ1kxM1hOei9yczhrNHFpNlNKZTU1RldyQzA4WnFSTE5w?=
 =?utf-8?B?cDRLZzNwdzVmTzFIZjZCYlFXeEVqVE94Z3BOTjU0QlZsTElhN3Y4cjJsMnJE?=
 =?utf-8?B?WGFPaGFQQk93MzBkUDJ4Y0pzQ3dRcVQvYlpROGh0a1V4OWhZSCsydktDSTlz?=
 =?utf-8?B?R1dZb0tNRUtta05leHNSQ053TklNMVFEMWtZamkwVExFdTdiMHFlOVh1Z0RP?=
 =?utf-8?B?TitkcmN0YkFtdEEvWWhMQTdZQVZpc1hZWFdLVGc0cVdxRjlCM3VZNkJkK3M4?=
 =?utf-8?B?YVQya1FiWTlqRkpXeFJEUFVPQTF1VGdPbjBCVzZzQnNOZGk4Vm5vRm5JQVVw?=
 =?utf-8?B?bEpqaW9XNEtLeEFZKzlTZE5tTTgzcHRmeml3VGxNTkF3cXdad0MweURWNitm?=
 =?utf-8?B?cnUwVjRDV2ZPdkxYUXBPYXhDenh5SUVYZjR0NHB0Q3I4c0tpYjYvbHM3UUxr?=
 =?utf-8?B?ekdpQklJcWVCcFJzdnRQUk5xc1J6VC9TVXBZL25RMW5VRGNzUzFlTE9DMXN2?=
 =?utf-8?B?VEdMem1BRXQvZkN4OXZiZS82RnphUFRsYlhjN1U0c1haTDB2RjRNbkticTVO?=
 =?utf-8?B?YTlVWDJROHl1NXJLZ1Z2aUgxVjlTSC9wUVhKUlMrMkwxZWtQSEhYTThnempq?=
 =?utf-8?B?QlQ0N0xZSVZEV3FXYUZRVjhOdWM1eEs0ZUxoaEJKRVVFV3FwOTdXYjRQRWN5?=
 =?utf-8?B?S1dOMk9RODV0VUJIZ082bHVqRStzWXUybnpTN1BlYWV5dGVVUWtEZFVKeGxm?=
 =?utf-8?B?cENTRDQrWWZYREwyKyswaGk5VEFwcSs1Vk5qNXYyenpWanZ0RWdmOXhTdEUw?=
 =?utf-8?B?SGxEUHAzSWFBa0tIYXkxN3I0RXJEb1R1SUtZSTdJNkhVeG5hbnIvWmJSSDdr?=
 =?utf-8?B?bDkwS1N4NkpJRCtXQytXdzluWUNGb2ZMTXNSWnhOd0cyTlZJS2N0K0g5Q29P?=
 =?utf-8?B?T004ME45aERWSnR4MW9GbEl3dVM1K2xFTW9hUElERHVZYnJhUEkzRjhhL0xy?=
 =?utf-8?B?ODBPRkhrVnJmSmo1MXlSdXU3QmM1OEM4ODIrNW5rd01uem1HTG1BSW9EQ1ZE?=
 =?utf-8?B?MndxVEdzUWpTQWI0TWRlVExZY1BoK010RStGQzg5LzlnSkJyamtKTjlJanpz?=
 =?utf-8?B?Qk1oUFVnekFqNFZqbGJSRHBhZ0MxbURYSGh4b0FvZnNLRUNFSTF3WFdDNE1T?=
 =?utf-8?B?RGN5enFJWDNrZzdIVFR0NjNuZ3d0ZjZpV05WTkM0OVdjb2YxeDlNOWZ1SFk1?=
 =?utf-8?B?SkVQcGlYQWR4SUZ5MC9DRi9PLzJlcHBzRU9TWFdQWlZMVTBPV2pyOXFnSXdB?=
 =?utf-8?B?YStZckx0c0hRRVZCZDVvV2thMkU2d3NZNWlKRkJUSnpjckZmb2owK2EwNFlM?=
 =?utf-8?B?dDhiWEpaYVZSa01wbWNyc1hsSkVHdzJjcUZlQW5JNzV2VnNMU2J6RjBwVGVh?=
 =?utf-8?Q?hHj9rzQM+4fVdM8pePuXIVzb+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09efc5c7-2957-497a-4482-08dcd9338ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 05:17:44.1848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbKpcl7Kioxq/qFm+Qqtuxbd6DPRNc49cWrxj5tyw1JSbMjb2wF2wxvrbG/lOYBmDN11KJpMafvU7qBdeVGZo1SNTVAgloPPr+zM2doqvyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU291c2EsIEd1c3Rhdm8g
PGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAyMCwg
MjAyNCAxOjA2IEFNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVs
LmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBN
YXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFU
Q0ggMy8zXSBkcm0veGUveGUyOiBBZGQgcGVyZm9ybWFuY2UgdHVuaW5nIGZvciBMMyBjYWNoZQ0K
PiBmbHVzaGluZw0KPiANCj4gUXVvdGluZyBHdXN0YXZvIFNvdXNhICgyMDI0LTA5LTE5IDE2OjI0
OjE5LTAzOjAwKQ0KPiA+UXVvdGluZyBVcGFkaHlheSwgVGVqYXMgKDIwMjQtMDktMTkgMDU6MjI6
NTAtMDM6MDApDQo+ID4+DQo+ID4+DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+Pj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4+IEd1c3Rhdm8gU291c2ENCj4gPj4+IFNlbnQ6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgMTksIDIwMjQgMjoxOCBBTQ0KPiA+Pj4gVG86IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiA+Pj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5y
b3BlckBpbnRlbC5jb20+DQo+ID4+PiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSBkcm0veGUveGUyOiBB
ZGQgcGVyZm9ybWFuY2UgdHVuaW5nIGZvciBMMyBjYWNoZQ0KPiA+Pj4gZmx1c2hpbmcNCj4gPj4+
DQo+ID4+PiBBIHJlY29tbWVuZGVkIHBlcmZvcm1hbmNlIHR1bmluZyBmb3IgTE5MIHJlbGF0ZWQg
dG8gTDMgY2FjaGUNCj4gPj4+IGZsdXNoaW5nIHdhcyByZWNlbnRseSBpbnRyb2R1Y2VkIGluIEJz
cGVjLiBJbXBsZW1lbnQgaXQuDQo+ID4+Pg0KPiA+Pj4gQnNwZWM6IDcwODIxDQo+ID4+DQo+ID4+
WWVzIGJzcGVjIG5lZWRzIGFuIHVwZGF0ZS4NCj4gPg0KPiA+WWVwLg0KPiA+DQo+ID4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFNvdXNhIDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4N
Cj4gPj4+IC0tLQ0KPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaCB8
IDUgKysrKysNCj4gPj4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHVuaW5nLmMgICAgICAgfCA4
ICsrKysrKysrDQo+ID4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+ID4+
Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3Mu
aA0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPj4+IGlu
ZGV4IDZlYzJkMmMxMWQ3Ny4uY2NkMThjZGQ1YjUwIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPj4+IEBAIC0zODksNiArMzg5LDkgQEANCj4gPj4+
ICAjZGVmaW5lIEwzU1FDUkVHMyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVfUkVH
X01DUigweGIxMDgpDQo+ID4+PiAgI2RlZmluZSAgIENPTVBQV09WRVJGRVRDSEVOICAgICAgICAg
ICAgICAgICAgICAgICAgUkVHX0JJVCgyOCkNCj4gPj4+DQo+ID4+PiArI2RlZmluZSBTQ1JBVENI
M0xCQ0YNCj4gPj4+ICAgICAgICAgWEVfUkVHX01DUigweGIxNTQpDQo+ID4+DQo+ID4+UGxlYXNl
IG5hbWUgdGhpcyBTQ1JBVENIMyBvbmx5IGFzIGJzcGVjIG1lbnRpb25zLg0KPiA+DQo+ID5Mb29r
aW5nIGF0IG91ciByZWdpc3RlciBkYXRhYmFzZSwgaXQgbG9va3MgbGlrZSB0aGVyZSBhcmUgb3Ro
ZXINCj4gPiJTQ1JBVENIIiByZWdpc3RlcnMgZnJvbSBvdGhlciB1bml0cy4gU28gd291bGRuJ3Qg
aXQgYmUgYmV0dGVyIG5vdCB0bw0KPiA+dXNlIHBsYWluIFNDUkFUQ0gzIGhlcmU/DQo+ID4NCj4g
PlByb2JhYmx5IFNDUkFUQ0gzX0xCQ0YgZm9yIG1vcmUgcmVhZGFiaWxpdHkuLi4NCg0KSW4gdGhh
dCBjYXNlIEkgZG9u4oCZdCBoYXZlIHN0cm9uZyByZXNpc3RhbmNlIGhlcmUsIGJ1dCBtZWRpYSBh
bHNvIGhhdmUgc2NyYXRjaCByZWcuIEhvdyBhYm91dCAiU0NSQVRDSDNfTEJDRl9HRlgiLiANCg0K
PiA+DQo+ID4+DQo+ID4+PiArI2RlZmluZSAgIFJXRkxVU0hBTExFTiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUkVHX0JJVCgxNykNCj4gPj4+ICsNCj4gPj4+ICAjZGVmaW5lIFhFSFBf
TDNTUUNSRUc1DQo+ID4+PiAgICAgICAgIFhFX1JFR19NQ1IoMHhiMTU4KQ0KPiA+Pj4gICNkZWZp
bmUgICBMM19QV01fVElNRVJfSU5JVF9WQUxfTUFTSyAgICAgICAgICAgICAgICBSRUdfR0VOTUFT
Syg5LCAwKQ0KPiA+Pj4NCj4gPj4+IEBAIC00MDYsNiArNDA5LDggQEANCj4gPj4+DQo+ID4+PiAg
I2RlZmluZSBYRTJMUE1fTDNTUUNSRUczICAgICAgICAgICAgICAgICAgICAgICAgWEVfUkVHX01D
UigweGI2MDgpDQo+ID4+Pg0KPiA+Pj4gKyNkZWZpbmUgWEUyTFBNX1NDUkFUQ0gzTEJDRg0KPiA+
Pj4gICAgICAgICBYRV9SRUdfTUNSKDB4YjY1NCkNCj4gPj4NCj4gPj5BZ3JlZSB3aXRoIG90aGVy
IHJldmlldyB0aGF0IHdlIHNob3VsZCBuYW1lIHRoaXMgTUVESUFfU0NSQVRDSDMgZm9yDQo+IGZ1
dHVyZSB1c2Ugd2VsbC4gQWxzbyB0aGlzIGRvZXMgbm90IGxvb2sgdG8gYmUgTUNSIHJlZy4gUGxl
YXNlIGRvdWJsZSBjaGVjay4NCj4gPg0KPiA+SSBiZWxpZXZlIHRoZSBwcmVmaXggWEUyTFBNXyBp
cyBlbm91Z2ggdG8gZGlmZmVyZW50aWF0ZSB0aGlzIGZyb20gdGhlDQo+ID5wcmltYXJ5IEdUIHZl
cnNpb24gb2YgdGhpcyByZWdpc3Rlci4gSXQgaXMgY29tbW9uIHRvIHByZWZpeCByZWdpc3RlcnMN
Cj4gPndpdGggdGhlIG5hbWUgb2YgdGhlIElQIHRoYXQgaW50cm9kdWNlIHRoZSBkaWZmZXJlbmNl
IHdpdGggcmVzcGVjdCB0bw0KPiA+b3RoZXIgdmVyc2lvbnMgb2YgdGhlIHJlZ2lzdGVyLg0KPiA+
DQo+ID5QbGVhc2Ugbm90ZSB0aGF0IHRoZSBzYW1lIHBhdHRlcm4gaXMgdXNlZCBmb3Igb3RoZXIg
cmVnaXN0ZXJzIHRoYXQgaGF2ZQ0KPiA+ZGlmZmVyZW50IG9mZnNldHMgb24gdGhlIG1lZGlhIEdU
Lg0KPiANCj4gQWguLi4gSSBmb3Jnb3QgdG8gcmVwbHkgYWxzbyB3aXRoIHJlc3BlY3QgdG8gdGhl
IE1DUi1yZWxhdGVkIGNvbW1lbnQuDQo+IEJzcGVjIDcxMTg2IGxpc3RzIHJhbmdlIFsweDM4QjYw
MCwgMHgzOEI4RkZdIGFzIG11bHRpY2FzdC4NCg0KT2ggSSBkaWQgbm90IHJlYWxpc2UgaXQgaXMg
ZGlmZmVyZW50IHJhbmdlIHBhZ2UgZm9yIG1lZGlhLCBJIHdhcyBsb29raW5nIGdmeCBvbmUuIFRo
YW5rcyBmb3IgcG9pbnRpbmcgb3V0LiBZb3UgY2FuIHJldGFpbiBteSByLW8tYiB3aXRoIHRoYXQu
DQoNClRlamFzDQo+IA0KPiAtLQ0KPiBHdXN0YXZvIFNvdXNhDQo+IA0KPiA+DQo+ID4tLQ0KPiA+
R3VzdGF2byBTb3VzYQ0KPiA+DQo+ID4+DQo+ID4+V2l0aCB0aGF0IGFkZHJlc3NlZCwNCj4gPj5S
ZXZpZXdlZC1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4g
Pj4NCj4gPj4+ICsNCj4gPj4+ICAjZGVmaW5lIFhFMkxQTV9MM1NRQ1JFRzUgICAgICAgICAgICAg
ICAgICAgICAgICBYRV9SRUdfTUNSKDB4YjY1OCkNCj4gPj4+DQo+ID4+PiAgI2RlZmluZSBYRTJf
VERGX0NUUkwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFX1JFRygweGI0MTgpDQo+
ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R1bmluZy5jDQo+ID4+PiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dW5pbmcuYyBpbmRleCBmNjI2MjJmMGJlODUuLjRkZDc3
YjQ0YWM4Mg0KPiA+Pj4gMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHVuaW5nLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dW5pbmcuYw0KPiA+
Pj4gQEAgLTgwLDYgKzgwLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5X3Ny
IGd0X3R1bmluZ3NbXQ0KPiA+Pj4gPSB7DQo+ID4+Pg0KPiA+Pj4gWEVfUlRQX0FDVElPTlMoRklF
TERfU0VUKFhFTFBNUF9TVEFURUxFU1NfQ09NUFJFU1NJT05fQ1RSTCwNCj4gPj4+IFVOSUZJRURf
Q09NUFJFU1NJT05fRk9STUFULA0KPiA+Pj4NCj4gPj4+IFJFR19GSUVMRF9QUkVQKFVOSUZJRURf
Q09NUFJFU1NJT05fRk9STUFULCAwKSkpDQo+ID4+PiAgICAgICAgICB9LA0KPiA+Pj4gKyAgICAg
ICAgeyBYRV9SVFBfTkFNRSgiVHVuaW5nOiBMMyBSVyBmbHVzaCBhbGwgQ2FjaGUiKSwNCj4gPj4+
ICsgICAgICAgICAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwNCwNCj4g
Pj4+IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwNCj4gPj4+ICsgICAgICAgICAgWEVf
UlRQX0FDVElPTlMoU0VUKFNDUkFUQ0gzLCBSV0ZMVVNIQUxMRU4pKQ0KPiA+Pj4gKyAgICAgICAg
fSwNCj4gPj4+ICsgICAgICAgIHsgWEVfUlRQX05BTUUoIlR1bmluZzogTDMgUlcgZmx1c2ggYWxs
IGNhY2hlIC0gbWVkaWEiKSwNCj4gPj4+ICsgICAgICAgICAgWEVfUlRQX1JVTEVTKE1FRElBX1ZF
UlNJT05fUkFOR0UoMjAwMCwNCj4gPj4+IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwN
Cj4gPj4+ICsgICAgICAgICAgWEVfUlRQX0FDVElPTlMoU0VUKFhFMkxQTV9TQ1JBVENIM0xCQ0Ys
IFJXRkxVU0hBTExFTikpDQo+ID4+PiArICAgICAgICB9LA0KPiA+Pj4gICAgICAgICAge30NCj4g
Pj4+ICB9Ow0KPiA+Pj4NCj4gPj4+IC0tDQo+ID4+PiAyLjQ2LjENCj4gPj4NCg==
