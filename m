Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE85606A324
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HpiF8LPc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aZmj67zE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BA810E9B4;
	Fri, 27 Nov 2026 05:57:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6A110E327;
 Fri, 27 Nov 2026 05:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759010; x=1827295010;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nTEFi1eNoy6R/DFb4/bHegJ+3AcUJLSBWYPvre+r6Rk=;
 b=HpiF8LPcbLlomfLvwV6qTqJ/Si6RdcVc9JrC5pyZBNxI86Dc2bnAKV/+
 ADiYksl4Nw9D1FqTg83C1R6uQGuGSqZK1n/+i6rV7hwONZ7aXKbZ1ZnWw
 X4gYHZITOYdwHbqJuGGKGafetnszo1AxLFvvVbNrrYNFa5NOZJsOhXQqu
 bVbGrlInYMSJXtg+C4+USW6FX4DIuqnW9t5LcQsOrRE0S5dx7OuSSInmm
 kFBP342rq//klwmr9wSCPGkfViokX8sQbgjFy4skgopkrySfJbvBKf9v6
 qvO7YsDwGweyZFwJtrnw0qzTbMrl6eIaOWAA566z5b64p/xGrUjJWhev+ Q==;
X-CSE-ConnectionGUID: 2s8Ay5Y3RM+c6qC0ia4oLg==
X-CSE-MsgGUID: k5Es0yx/Qm2KTvo1ceKh7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4672544"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4672544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:56:49 -0800
X-CSE-ConnectionGUID: TErs2YRaTPGcIl5g7f3izw==
X-CSE-MsgGUID: kG4FGEJUQY6qxwV2bW228w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12356083"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:56:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:56:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:56:48 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:56:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh8MJy8e/DCIDcOrKY269d0k+mvvWxdnyE7lvoZDnevO32/oQemuZfg3BQfnitwAGiF9SVQIAV1OMiO5akkys4VXyqLvj4ZOgAS3HM+Bsn9gi7/2yg5ApWrbRBH3Ut8N29MjdCuyVf8Hc+aqgCW3qF4+nLxOs/PdXY0ERRQNyELFIB6GbC6xV4qMIxNf+LY86zfopPDLB4SRoGj+fC07PuKZgXPd+DJaKix/PKz7j/knzmyaCDDuCVn0W+RByFx3U9FpKIdIh99SVTT4OGua2NlKBH4s0ecXRp/6eT850VRCA75QVuaS9O6hKYE00O53OW0GWnXdc7e7i7WIMkUWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pqptx42D0x3h+p4R/TXOgCkuSfEuHLGscNd/W1jQyRI=;
 b=ohHnuYeV27N1E/c0YW5k+sWnfJF6hZDPI3glTVzv3GTos8zfCNAvKtEYS2DtAfl8fysugFujBKk8J7xqTZwLkkWP4OgSkdON9BowtRL0gRD3FmJrtXiT3aC9kalQGSDwE8haUd7WA38IW6Iw9Zt8vmGEr4fOLdihA/cAV4M2MM+/UrJ9xuDyZ+22aDEk+yeHrdaKtA5fQrLlMOEA1/kpg3v/GVwKe2OfR1tW2XqgrdHnr0WGgFVPOgQEHzufOh7ZCH3r3tCK434ZM0C0vyrdemGZhjcyg/HEgZmsivLbMNaTFNRtotC5teiNKKhUo/gtP73T2W0xAXbWVAF3ZJvN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pqptx42D0x3h+p4R/TXOgCkuSfEuHLGscNd/W1jQyRI=;
 b=aZmj67zER4RobYp9E85E/MBocbuopBORhfnaKcy//8UAeiBnt22epzynJ1dGrAyA9LRXC5FiUUElHzTzv6noFr0cLa0iMhCguWvhiVGwGga+PdmZcvh6TE8TTgJm8/id1SIzexd6SXkm4NZK99b6LlaDl6B20Nwib7MUpfG3Ab8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:56:46 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:56:46 +0000
Message-ID: <4247bec1-4d0a-4406-8004-94196f706e7b@intel.com>
Date: Fri, 27 Nov 2026 11:26:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] drm/i915/vrr: Use the local 'adjusted_mode'
 intel_vrr_compute_config()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-7-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0249.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::10) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ed2bc7-d53d-4092-a81a-08df4c4b389f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 74+YAWv1jeIGzTq0FY5sSnIB/21wyGmtqBTu68Q+YUzjbfh5SzdnjFnON4lG1EtimTKTJ/HuAJLXigwNffxpPOyehlCPvXKVvHXZTms1YjnGxuuN4Xdc8OA6HfJbDjXrcNTj3qZQ/SC0EiijjjKMdcUIIwq79sFZYbJnC0T33TecbBNVCDHLBkAOej0MAHErAZZu8xBvvdvJbinQFuiLuQifTak++0jsf4dn1gcl0QynusxJZ7DpKUA9LVTkhqAZrvbU8Oprjc0caVplvWgZqUnziueycrygCqfGqONOWrOvqVHzZddNDYNIuNt9TV4bwVL4vFXzJAtwVQ3Ak6NIXsSfLyQ6ZhawBH3HuiTJqQHJ9hcXPcwVYpfL5HkXbByb+QvMeCajW2zuisuAHxcUIhEgs4IjdWeSX5ZaFS+eitE6FbDMogFmk504BzKn8taZmnYXmUpnewrFDjrNaGhB+KMYjr2koyYqJ04OttDPPukUDD8yej7mW9GW8HVSD9SYs9NC+pPiLl3duiGrm0AE26UlR6ZWUqRX3FFoPVIvra9N8u7kktqJElUuI6MKmUfdiK0cHBl/rTbCsvaR+6hDVNkGLkKtXtEyK6g+Xy7WdI8YlNMbefOuKGBPT7uGajVxYquWb33dyzUhefDITd9xLHKARp6Gt9kG9KX72/pkbmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWczelJMaTcwN2FYZVo0NVlET1EvWmhDZ0NOU2ZGWkFCVUtOZjhRWElEVU04?=
 =?utf-8?B?T29ZZklZOUlESjg3SFI0NUo5UnBCOVhxbkZWbzB3RHNSTlZlaXVyR3djNHJD?=
 =?utf-8?B?c3pUa2pzWWNYNW9Semxub290WXNtWXdnVE90M2VGY2VlQjRhbnU0YWhCTnVK?=
 =?utf-8?B?ajBFSEZ1ai93OCtJTy93TUdOZmlNU1lmWGdDV1ZoZVIxMzhFcFQ5R01NcVdo?=
 =?utf-8?B?L1ZZVUJmSnh1cGhSWjBlQ1J3WEFrQ0lyTWIwb2FqSlZVSDFCSDV1ZjJUUUFs?=
 =?utf-8?B?NVNYYVFkZk43YUV3RGRLbEszMDAxUnlRdGQra0tMaFRqNkRxalFGVGh3TXFz?=
 =?utf-8?B?UGZnL2FTQjQyQ1BmNnZxdVNkOTFjUTc5T0NQTHdRbC9KQ1Fla2M0S3p3Q3FD?=
 =?utf-8?B?SkxKbldDWjNuN0s1RHhKMjZtc0xqVk5qY0p0Njd6dkwvRlVOMzlQbSttR2gz?=
 =?utf-8?B?R09EWlljbm5RMktDN1M4N016cjUrYldtQzE3cUp4MmhZbmpwUmd4S1ZVanc2?=
 =?utf-8?B?ckMzVkwyejA0WG5CT2dQcHEya1VsSGVxRjI1Vm9lNTMxTktJVnpVL1ZidW1I?=
 =?utf-8?B?dDZ0NTkvaHp5Q1B2OGhIdnVIcG0rZ3BWZEtmd0hFenVndHN5dUtQa25GNGhL?=
 =?utf-8?B?RDRId0ttcVMrbDBWR3BKTzRvRXp1QjJHcmdMbStsUGt5QjJ0aFVDbHd4VzJz?=
 =?utf-8?B?aGUzQllSRW9Xbi81ZE0yaGJxRktFQmJuVjlIWW5JVlFBME1RN3daaVk5WEVE?=
 =?utf-8?B?ODNtQXY2MzBCWlRWSGM1ZktVc1IxVG96Y0RhU1BaT3hRUy9NaE5URXlCZG9F?=
 =?utf-8?B?NDBleXArOE5QMGNXVnM4K1FQN01UZkwxTXFkNExJNEZsbThWYVBDeDhuRWl4?=
 =?utf-8?B?TC9SNnB2cVlzU0dUV1FjR2hFTTZ3cTgxZkNiYUFzdXFhQXdNMlRFU3R1WXF0?=
 =?utf-8?B?d1l0UE5OTzJmSFR4Z2J0bG5hNVh1a1FqaGcrY3NZbEd4eGZNalVKT0wrYktJ?=
 =?utf-8?B?YzVvNStoRlU5WlErU2ZUR2kxMnprSUxiOEhHWTFma0JpMmVYWCsvaGRhSEc0?=
 =?utf-8?B?ZUJrSnV0cUY4bkRpUzhBL3R2Z08zd3hrbEZSTFpmNld0Y2l0S042S0tLNXdX?=
 =?utf-8?B?QmNsN3NkUUJUVjBabGowb21rZytRT3JWbTZ1Y1FyTlpVaFVHOTlsVDVPQ2Ft?=
 =?utf-8?B?c056QU1hWEZjNUdRQXV1WnhrUnk5OG1wQ2pWK2lhSW5oUUd0ZDlUWUMveUVS?=
 =?utf-8?B?R0tyOFZ6SG45ZGRYWERYMWw4Z1pSYXQ0aGtsQndYbjlWRnFHbGt6L21LT1Mv?=
 =?utf-8?B?TzJjQmlaS3lQaG8zYjdIbzRGdGFxMXdiaDgrNTBNU01nV1M5NGl2aFdyMGht?=
 =?utf-8?B?bDUrUC92Tkk1b3NuY085eDdhS05wSW44ZU0rb2Z4dC9XcmRrNzNqdHRBM3pj?=
 =?utf-8?B?eTdZS1lJY0ZzSDB6UmNySkNNSDdERjVOZGxwb3h1RkppamRkdTRjc0VJK0Vh?=
 =?utf-8?B?Si9SRlVvb3F5QXNsRDVwczVqMEZ5aHAxL212UmxDTEdRNUY1eEV6TUJ6TjBq?=
 =?utf-8?B?bVlaNDAyUTFCZGF1M2ZLcVVMUVRJN3AxbDJFV01XT01HZTdHOVR1SU5PZk45?=
 =?utf-8?B?dlIrbTF4S0ljcndHVWpWMHBXZ0ZVaEJRc0dFbmZGMEUyMVhxbUh5anFiNUR0?=
 =?utf-8?B?eks1M2Q5K2txRUUrZEdxamxhVFlBNSt2TmloM0JaL05kdnBzTFpGOEplU2ly?=
 =?utf-8?B?bU1qVi9vR0J2OE9ybkg3aDdwM2NpV3dTRmszZmlGSlgvR1ROQjl4MHZVRTNy?=
 =?utf-8?B?SHE0b21RYjJ3blp5bXBYTTAwejVYK0pVUWZ1aDFIQWZpTHNCQldKRGg5SnhN?=
 =?utf-8?B?YmRyNFhnbmo3M1AySmplL0lkb01RVDBFdXEyMzFvRC9rL216dktKSDI1TWNO?=
 =?utf-8?B?UGR3cHdXQnJ2ZE45QjQ5WDEreUE4Ti92RU5iV21VT1o3VHNrajdPajRFb1h3?=
 =?utf-8?B?aWJscGhWRDdOQUY3RWpjNWE5SS84aXh1em4wSko4TG9YcUVaSytpYkJsMDdO?=
 =?utf-8?B?T3Rid1IyalV0Z3dxZmpLSXdnZjJZQWFxbEVUcHRTVXBxVnJlZ2R0OXNqVXE3?=
 =?utf-8?B?WGEvSDFkUm9OWlVwY3FBM1paeEtSNitmeGZQZ2xGYmJOajFSWVRObmVCY01o?=
 =?utf-8?B?MElreWxSY2tIdTlDZFVmdUE4UlY5angrcEVWTUhTZklqNnIvcGpsZXFENEVt?=
 =?utf-8?B?VC8rZ2lmWTFpRjhNbnNPSjB4ZVN5cTVVaUE1RXZhRDFENGhkdGRSOXFtSldz?=
 =?utf-8?B?MUlhT0wrK2ZoeXp1b2RGWmxZRDFtUTVSZEM0d3V0eUlXZk5hSlYwMzBUV096?=
 =?utf-8?Q?F/6UXDzhqXUybzwk=3D?=
X-Exchange-RoutingPolicyChecked: YrTuobgWJq9HCQdYrARonl7EXl7bOjn8i9UOoMThBZsXXWZ3mELAkjqkvZhtOFY34rmV56aGgK+o7mVJHR5Vco1dSm4RqdQGQjGD/O9K97kqp8HZ78WT5p3eeYnj3QWhZ3YStWXKT8FVh7m8UDKaydjg4enUkrmcilt4EBw8+QWMg4KP1HXbj00zI9THTMpTU+lD7JkRY2Hv6FjZ604IsCj7psO6E83NIHSxeHE1d0bJlo5AbEi3AOi2OnvoXRfKcUDndl5XTESLpTj3Tf88s6WiuH6hhGFLk+ca0p3zS0IsINXywOj/Kw+AgOxfwQ94pXNY9DABrf6NKmoxce008A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ed2bc7-d53d-4092-a81a-08df4c4b389f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:56:46.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIMDJfQ49REU1G8p9ORbtrTdMjRSsXgz+TMAYFTqtOedd0g/1mP8zUC/GUjgSrq/7VVftRbGjDcqjHYbp+tKhFUei4W7y8O56w0xI7uQ5Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> intel_vrr_compute_config() has a local 'adjusted_mode' variable.
> Use it instead of going for the long hand version.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 9ab62423a1a6..6aa99bcec448 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -529,11 +529,11 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   
>   	if (HAS_AS_SDP(display)) {
>   		crtc_state->vrr.vsync_start =
> -			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> -			 crtc_state->hw.adjusted_mode.crtc_vsync_start);
> +			(adjusted_mode->crtc_vtotal -
> +			 adjusted_mode->crtc_vsync_start);
>   		crtc_state->vrr.vsync_end =
> -			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> -			 crtc_state->hw.adjusted_mode.crtc_vsync_end);
> +			(adjusted_mode->crtc_vtotal -
> +			 adjusted_mode->crtc_vsync_end);
>   	}
>   
>   	intel_vrr_dc_balance_compute_config(crtc_state);
