Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937BD606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OG4AUeA9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=A/HUJjn1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EA110E859;
	Tue, 24 Nov 2026 11:58:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2D10E859
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 11:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795521508; x=1827057508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=UZ75qFhvdhxMQFuPqiGsBQ5xR9vqJQZWFVA0ASW+2c4=;
 b=OG4AUeA9G0BpcXQ2ftB0qDfXNh/TqwSMRVuNGuLLgeRKG8RL0A6kMgmr
 LoG2hdlT5KNw86BtAmln3/VPvTP/U5yGugTC1HbBfye5L4hq94+2+3mDy
 oyNX2bmTkLzbTn8TDat5VElAIxpZi17IFPI2RG6DfPqW1ie/95k6g+vYP
 OsrE73XKYtXjYMS9ZEKak2QV9JabIRNLj0qhKcExStqUp0ocE0ljH1v0h
 xZR9U4/Y0W64HGLBwYdfidzwzu4RycvhuO91sci2teJ6sYjPeHjZNkvqf
 x3S0FYJMUMTaBRTMJD9a0iwxNXzLggWVyyAd3pvlh/glqvKFuY/9/2IZh A==;
X-CSE-ConnectionGUID: bf6Ia0IzR/+nogu/T6W7xg==
X-CSE-MsgGUID: ap2A7hTyQsSnnSvSjmPFsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4216832"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208,217";a="4216832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:58:28 -0800
X-CSE-ConnectionGUID: Em3TrOkeTJ6lx0ohhglqQA==
X-CSE-MsgGUID: jeRhjZO/T86TVATrp/TIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208,217";a="11667450"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:58:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:58:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 03:58:12 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:58:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgHMWDfIrXhpgWcWaX7DmR2ZGsBZ6vGRjYZrVgXFvBLIwqnmD0OouSqdQWKQKHE6Y0CsLyby6X2lb0V6/dzrkWQ5BaoFs45kzrk8NWFamfeoLhZWMIRMoQLemNiPioBsL2eOjq2p0+0yFyZCyrV9Ggp3ea/SfCAXKJrDVYxQ6ACovJggKpoTQ7ugA9PZaWTURXj9mx+1H044MqASJL2u6NNmRu1NZCyJDIXu/orpP70HA5/BtveEVb0Hq4hNYyi5psUgVWp36aoRP7FRmkf8lwDT9kEV6M549r9kumc+GZeRAl6105VYP4oc5XRLowwlX4xZ/IlXSNREioqLHo9RYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lw9HHM7MMU54k7Kn5N3zcP42OnGY6QjR5Jh6XXqYWRo=;
 b=es24H6vcqMxct3v5NKmf8BFlZ9hMhA52KnXlMzqQ1skX6dEq+VF6a01vpzUMrhvfUUmHset1HgwyeJuPWw4MK+G965vs0bAnBi9sGpQMtfqo+etvtNmV7ZZ1Hp/CzE1R1Qg471sy15YHrgYBSl5MTLkbw/cdyOlKRDDp0D0sGkD3vbV8wZUHQq9RpiE/E5BHtOrHcpoKfBkJO30/A834HMR3DNRAAhZ1t1fTDuCifE+n6WPiCHwehgFW37uYSgWrimcGMK4IZWFpxenPpHNg4d64r8OH0kWwZqo6tKFDoXQwM7r88gkw7/fogWo4otW8+Kp/UIKOAd4qYeUhNbB4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lw9HHM7MMU54k7Kn5N3zcP42OnGY6QjR5Jh6XXqYWRo=;
 b=A/HUJjn1gDxYbv3HfHiV1zYg71/sWLyIdv1azyAOv6tjwbwDefdaC6yz52cVMZyl24/6FJz1ms4cYFrEQBCHFD1MFAqlsVeN8HsEtyWQP5teKU78FFho5lXc/++PBOPF+fkdy+Ic5nVoJf+dl83puaV62GnWj5ipFIhJnC5uQKY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 11:58:05 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 11:58:04 +0000
Content-Type: multipart/alternative;
 boundary="------------kY2Hlul6sh63M09KoTG0rJSc"
Message-ID: <32cf23d7-ff8f-4e0e-a212-d869b943a00e@intel.com>
Date: Tue, 24 Nov 2026 17:27:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add debug configfs option to force OCODE load
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261123183740.4002390-4-sk.anirban@intel.com>
 <20261123183740.4002390-6-sk.anirban@intel.com> <awSf42ue559qzavc@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <awSf42ue559qzavc@intel.com>
X-ClientProxiedBy: MA5P287CA0323.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::13) To DS3PR11MB9796.namprd11.prod.outlook.com
 (2603:10b6:8:363::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: bd45eb54-0dc6-4810-13b5-08df4a22322e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|4143699003|56012099006|261026121527099003|261022113327099003|261009223027099003|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: XMxje3MBeZF+/k3CnFjuUWOE44GVhDS1P6DhPxJpqLztEb6JkLQ+cqGkKNGoZsD9PD257NASozl4J9A063pBW/wd5BxtpcS2A5A1DarU558rZ4uUB7iwvT8XhYdEPIryG+uvTs70Ao0vWcSKnaM1ywpd7wzpoq9nJGmaXuZLsLYidBE9/b4h56JpTEfFzU+6h2D2GS7mSsZuAayYSDoZJDqlf7obIu6fuxxbqTbTsUKnUrXS4YR2mxd28+TYVKFrspKrtTXmlinWS0DlemHreY09/ySAvN38F+rwafydrW4ASUFUyh/ohb0CrUApV7pZbV7gyxOppKiL82e70TCXyfrgGP6A8nxi+q0+kXL+whb5QvbggtauJjb3rP0KV3ptEU4KJfcKR+sLl4Q5ueKi2KZPVflE5bNMWvr2ODTqEqdUKWJAzrUWludOtK7nk3b8slJ6NuiiY5Zlpfd7+5E52X47QSDnEhCgL0n5tLuE96zYhAX+B3d9tWuVuk0a89+e/d+9ZzSPZETTv0sGNEInIg92Da6UyZfHgRomHMrLkDaB7VDLOq0nrSGbWf1hJyDy8eP9XRIwcEfO/ARuOaoaOAlV59/xTuIErCHDTrinkvUsHsp9INppRF2WJXRaQPggNGs2XQuTkFqV0qOasYdqaLrLVOY1cdmHi+iYFAaTCVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022113327099003)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWt2NExGTzRUaW16akc1Y0pEWE15TCtTYk1IQW5hc0ozTTBnSGFLQVN2aS85?=
 =?utf-8?B?dHYrcmxBbE5IYkRFV0FoU2loUldGN3g3QjVIeklYcnBPeWt6ODVxc0phVGRj?=
 =?utf-8?B?VklqVnlveEpmRmM3UzkwaXdLUnhjSTVMQU42K3lXdUVNSHdFd1RXbVZiTlZj?=
 =?utf-8?B?T2swMElkRWdCL2hVWWF2dG5IVVNleE9pSWxPa0gyMHdFdmZoMFNvOWQrQk45?=
 =?utf-8?B?SkZOOGt1cFFQVmRFSGZKaHFXeHdCbTJQMmFDV0phaVA4UlJCM1QyeldRWDM0?=
 =?utf-8?B?R3ZDdUk4M0FIOHpwM1FLOTVzR2I2TGZvOFhjc1Rud05MakxBNEh2WG1oaUJW?=
 =?utf-8?B?a0VZTnljbEJ6dzhwRDJsektWbXNLbHhqdUI0SzRkSHBodVF5YUZNaGJNV3Bh?=
 =?utf-8?B?KysraDg0QWJodzVHazdaVlNHdHVRb3RhUURDRXFRTEttalFWOEhBSy8wZ1pV?=
 =?utf-8?B?TXc5V0JPRGNSR05XODhWUVlOWmpCai9hcnMveUdwazR4Vm5LN1VyVHlMVjRV?=
 =?utf-8?B?VjZYaFBTSHJjSkc0bEFiQjlMZlFZa1JTSEM2dHVSNlZ0TTBrUkd3MEgwSVpq?=
 =?utf-8?B?eHQ3QUEySEVBWkhQNS81Q2R0azFLL0tqWU9hTEx5TFF4cnVpeTUrbUhISjRy?=
 =?utf-8?B?d3ZpYUp0WG95TERySkxnUjNpa1FGNkxpSXRJNmo4ZWE4alZWTHgvRWJrUWU1?=
 =?utf-8?B?V1Zobml3ZVhqQWxxSmNaQXJEeHdGNWcwNDRXTXJWSFR4Y09GNk5KTGVzNmsv?=
 =?utf-8?B?RVRJV3pJNHhDQUVEc0xXYnd0YVNmQW0wS2pZK1M4MjRNQ0ZxeXYxVnIvZUow?=
 =?utf-8?B?RnJ2K1dINThJenhtWDFnZ0prWW90M1RuRHJJZHE0K0dYQ1ZZYTA1eEM2cmdR?=
 =?utf-8?B?blZRbTY4bVlKbGx2cDREWjAraHc0OGxUSjdneU5PRDVRMmdnbVM5cjJLSGlY?=
 =?utf-8?B?WWlGME9UYURSNzRXOHpNVHRKaG4zMitDZHRzQmxWek1pTTFEQTJmbE11WGVP?=
 =?utf-8?B?K2FjMHRVNmx0OU1MNTIycEx3WDBZNXphdUpwMGt3aXlMdHh5QmsrYlViSWYv?=
 =?utf-8?B?YmZhNW85Q3VQekpNaHBUbmFtK25na09HRlJEV1JuSHlVY0hlaXhtT3ZnMHFw?=
 =?utf-8?B?ejlFNmJSZXNndzRtVUlwWTZHWFluTTNLdDdPdkNUdHErcEdCWFJ4WFE0czRC?=
 =?utf-8?B?aE5mNTdQVkNaVHdiOWVsQlV0Zk9Rd3lOQ1dhWFB5ZWRCRDhYUitqNjRjblhL?=
 =?utf-8?B?NEt1L0VUS0dsTHZkbXRIRG1OQjhJZnROQmQ5Wmx3SzhRUkorVTNPa2hJWkZ6?=
 =?utf-8?B?ODh3bmUzc292ZHZ2K0Vlc0lBbTJoNnFlNGZkbUNsRFZpRGl6SlJoazlIOTZQ?=
 =?utf-8?B?MjRZR0szNW9GZjFSU1BoZERsS3VwVWltZ1RjRHk0R3NxN25NZWtFWUk0SlBr?=
 =?utf-8?B?WXZpYWJBNVhsdk1GVkRubklmdFpZTHNVUzlkNmRWekZxMUdXUlJUcXF1dW5S?=
 =?utf-8?B?bTdoeEtwUWE0WVd4SnF3bSs1NlNncThmN0EzQk5Qbkk1VGJ2WGFlckYybmFW?=
 =?utf-8?B?QzBxb0srUFZCOS82U21aZVFYQVREd0hPSVlrVURRN2RUVGJHYzl0b3VaT2hZ?=
 =?utf-8?B?ck50OW93Q0crL0V3bGJBUS9RS01qczUrempBam5RamNnMWV6b1hNOWlMWGVs?=
 =?utf-8?B?aDFRTm1jTjFkd09HSER6and1Q052WWNlcEYrbHZpUUpLckhYZGRiNGdza0Q4?=
 =?utf-8?B?L1dsd2ZOeThJVFU3Q1Bqc0VDL1EwaUtwODFDWGNNMS95SVNUSHg3SllsUk9a?=
 =?utf-8?B?MzR1M2VHK25NbnpVU2J4RzRTVkt6elpHWllWenhTcHJ3NmpLWUZuaW4ra1ZK?=
 =?utf-8?B?NkNqWnJYTVo2eGRieVh2ZkUrWVplRldWL0dZUEJVZjBUb05TNTB5bnNlMHNR?=
 =?utf-8?B?bjBqMzRWNkJINUwvdUpQS0pBSlRVRFJTRDBpZ1Y1d1pEcUJFYjZOMGdYZHpi?=
 =?utf-8?B?SHFYOTF6bnFJN3hTUmk5Vk1wQ1RRemVCVDZLcjduM0pYU09RUUJycHhWSnBQ?=
 =?utf-8?B?QTg5VWRWaXY5czdHbkI3ZDdsVEVKYjRKd05oajlYNFJOcGszMWY0NndEWndu?=
 =?utf-8?B?SVBYKzlDM3BWWWZUek94cjMyOXVxUXIxYndKTEFqZ3dubXI3Z1BoTHpIc3BY?=
 =?utf-8?B?aTUzaCs1U1Q5eFNyUStJV2I3RGtYK3ZwaldiVEN4YkFBRkVKSnZlOHNtLzZ3?=
 =?utf-8?B?d01CdmNOb29NOEFpbTMzNnRGTjBES24rald5a0RyVStodlFoZ2xlOTNQcjEw?=
 =?utf-8?B?UE9DVkg5dk9Gc013Sk1kSVJxMXZ4eUMvZm9kL25oZTJBYW5jeENOQT09?=
X-Exchange-RoutingPolicyChecked: h6OggqKcHljgyfzp8oIJS2zcKGnxNH3brAhXC5QcMAksPRg5owqKqCi8ZVYNtHdC12agPoTcX6Z8nCK/VN3A3gqsp6beD2u9eFeWptzD5+Ac5xk3u+rmh9+pUc8QPSFjuTpE6prH9MTaU3gmhRVoZrc/ztrfTPcZPiUQOPIsF9UdzbxVbDSorVigDtYLcz4oHoF/efZyUNT0ZG5nEcIInv9bKLyAG8WCpl7TmctHdy9Ca4WdGMWInJGeZs333Y/5Ho8+/9F9+NydpZN1QP/979LeUFDDXt/Od+BvnY8ev/z8UxlP92sHIubtnjDlLDsTIf5kLs8d0fmdynT5wBah7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd45eb54-0dc6-4810-13b5-08df4a22322e
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB9796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:58:04.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItYUgfFLZgK0SXaefZvG8DoARSb0xZi4mj6icStlreeDDn38sPrV0je3B+V3mgb6IV1UBbjUSJFL0VLR55YzJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------kY2Hlul6sh63M09KoTG0rJSc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24-11-2026 01:49, Rodrigo Vivi wrote:
>> @@ -12,6 +12,7 @@
>>   #include <drm/intel/intel_lb_mei_interface.h>
>>   #include <drm/drm_print.h>
>>   
>> +#include "xe_configfs.h"
>>   #include "xe_device.h"
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>> @@ -259,7 +260,9 @@ static void xe_late_bind_work(struct work_struct *work)
>>   	xe_device_assert_mem_access(xe);
>>   
>>   	/* TODO: Compare the running OCODE version at probe when available. */
>> -	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>> +	if (lbfw->type == INTEL_LB_TYPE_OCODE &&
>> +	    (!READ_ONCE(lbfw->probe) || !late_bind->force_ocode_load) &&
> let's not complicate and remove this 'probe' check.
> It is a debug only case, let's allow even on resume and move with it.

Dropping probe will end-up load across every resume but user have option 
to disable lb using debug fs node /"disable_late_binding/".

Thanks,
Badal

>
> The rest looks fine.
>
>> +	    xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>>   		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
>>   			fw_id_to_name[lbfw->id]);
>>   		goto out;
--------------kY2Hlul6sh63M09KoTG0rJSc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-11-2026 01:49, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:awSf42ue559qzavc@intel.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">@@ -12,6 +12,7 @@
 #include &lt;drm/intel/intel_lb_mei_interface.h&gt;
 #include &lt;drm/drm_print.h&gt;
 
+#include &quot;xe_configfs.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_late_bind_fw.h&quot;
 #include &quot;xe_pcode.h&quot;
@@ -259,7 +260,9 @@ static void xe_late_bind_work(struct work_struct *work)
 	xe_device_assert_mem_access(xe);
 
 	/* TODO: Compare the running OCODE version at probe when available. */
-	if (lbfw-&gt;type == INTEL_LB_TYPE_OCODE &amp;&amp; xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+	if (lbfw-&gt;type == INTEL_LB_TYPE_OCODE &amp;&amp;
+	    (!READ_ONCE(lbfw-&gt;probe) || !late_bind-&gt;force_ocode_load) &amp;&amp;
</pre></blockquote><pre wrap="" class="moz-quote-pre">let's not complicate and remove this 'probe' check.
It is a debug only case, let's allow even on resume and move with it.</pre></pre>
    </blockquote>
    <p>Dropping probe will end-up load across every resume but user have
      option to disable lb using debug fs node <i>&quot;disable_late_binding</i>&quot;.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:awSf42ue559qzavc@intel.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap="" class="moz-quote-pre">

The rest looks fine.

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+	    xe_sysctrl_is_oobmsm_fw_ready(xe)) {
 		drm_dbg(&amp;xe-&gt;drm, &quot;%s firmware already loaded, skipping\n&quot;,
 			fw_id_to_name[lbfw-&gt;id]);
 		goto out;</pre></blockquote></pre>
    </blockquote>
  </body>
</html>

--------------kY2Hlul6sh63M09KoTG0rJSc--
