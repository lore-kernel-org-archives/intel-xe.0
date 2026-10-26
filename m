Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492B606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nzt5G1Lu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB30210E0D5;
	Mon, 26 Oct 2026 14:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FDE10E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793023786; x=1824559786;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JNR388JY1lEO7ny8XmvR15zskBbZXXr2eP2cY+5qF0c=;
 b=nzt5G1LuGKNhKKFR4gE6E2czfcOjpjgxXNMBkHGrmj/OAXhB+2FlIvF4
 Trv/25/QL7WYeYnFpl4N/do3loDsEWIEjt3CVQnBBrFLAt56X/w/2k+db
 xReQ41XD2WZNoFK2u3YOgtzTm2EucMgCHjNJbsy9mUT06d5OoVvY4Lp2o
 VFermv0Jvt227fZZjAh6RDWtl8AdEGjWrEWtZKiBwwvlV1S6awop66oHZ
 ZGnyMOiOYFoBH1FInLaZx+5CGLoysxHlPsi3b9NbTec+JPDoU/1O7QziB
 AKOETT0IiY5W2UKWy/EC3WvITJKSwFvdDOqmyPYOqNAU8vwaBQSF7hAPb w==;
X-CSE-ConnectionGUID: uG3O+rUBSF29tvQ3BJypSQ==
X-CSE-MsgGUID: PDeZvxXbRrWYwM5Chey7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1782727"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1782727"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:08:57 -0700
X-CSE-ConnectionGUID: E5nFLT4nTSC0kCWYqVLrsg==
X-CSE-MsgGUID: s30OM0pERfitw/zlF3WohA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6025517"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:08:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 07:08:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 07:08:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 07:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuBxRqyPVl/aAq1k8pfY6YcWtGlULAnPSOHXTi3dZUwRq++tuRXAR9rVialM1kizZ6FiTQ1/roHoCITXUgW5a1GbNyBMJcc4pnB6JvgyvC3q2UpMNVWiNDbmJutBNsQ4y2tenAceD3EvNm0cuyG0lQpIovJ9obMa9OcgfPMnMQ5lKZBTVmZ0NDzGvh95+V+NeM+ZStr7JrAfD0NljVhnkJH1aEfH0WxbUYoH+YDKTLZYkucqPQG9tRMkNitS1Fa99+dal9WgR1+lDdUhlNSfHzPUsUm8cgA2IhAvtCzZSBDjmgkVjIZb7ZF4JKHEibnIvD2kBb/Xvu3yML2oNCLSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAsGaEBZWiQpzY9i+HKtiETFMbJMtTTIn56DChV+Jnw=;
 b=bMwzFZcIcNz9duSfEdcZM7Q+l4gVjzHHqYXspM0z0MW9Sr9jEPEGmQUFdFicPdVjh6iHKJYQlxgrH+TFB2rqGomNfbjWW1ipIzXqWDo5fSXMKeG+GQP+CbNko4SzxUG7lTWMVfTSCmYRC0+UzaM2crUCvi8cQh0cNuRzeBdKOFkjJE3O6nb6wjAlvtDFDnyaoNX9jY/BLAm6/GBIcoVC6Tbyk4FdYqmp4/rViyg/nuWRJWAcNZVBfK14MmdQkdnD8KAFRI1p9N2+QiO2bJBo+e1Y7aauBLAmP2x+AKY8IOcbgkmPGw8ajP2Q6BGOAGdiiIjLqegIIqOZRFZNjztx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Mon, 26 Oct 2026 14:08:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 14:08:52 +0000
Message-ID: <fd0b47b3-ab33-41e3-9182-ef114a1a2d99@intel.com>
Date: Mon, 26 Oct 2026 19:38:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
 <DS0PR11MB8718FF0E8B9E8E9D88D87E1981612@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB8718FF0E8B9E8E9D88D87E1981612@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: f840c780-e276-468a-7090-08df336aaa41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|261021123027099003|10067099003|261009223027099003|261022105027099003|261022113327099003|261022075727099003|261021121427099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: Z701OtJkajnvXOVV6qvuxrSgwUPS11Jb9eB6N+ucF6plYhaOVWynb/nT/ngBhnZnLqBdPpUVrFc6HUDp2PNqfxF5+QTrYLpnJuUaoS6UMmBUZhFzcO9B5Q9DGEabCihdqIxuX6UO/a84s5cdREzlncXooK1g+vh8ti8o87JDedpFxhIJQn7sPNfC5fC7DvBdtWiI+M50GVUrkEwUNV8SGK/fWZCHTjVZl7qQ5ghE4dBojr3fLXoPlArNbF10NWmOjONz5MLgqk65zRwUrydIFTMHnlAnLCKMvxEUTZ+st8IV805597MDV1nOlwYZTXyIMQ0zIgdHHJLdRys1RazyFWsI9YKnegvT9Y7JSKSSVx0S7lGpCxxZvJmwsrdCM8ERTpK0ZWRnm4ngcVM6fZHPl1r91KHViPNBpbqA77gOwSoCNb5JQ0y1RPDevI9klZOSDSWVLKkq3Vwe56hG6awLIJdcNgu1l3/pnuwBg3iDCt1op5/iAyc3DYbvZ2vriNZPqgIOw/8ev9ucQqxy+6XQyF8ZdZVFVt3Lag1e2pXbWq4zJrID59z/cMTHQ+kIeVTBmoDp/rOcG04duVfR+8AsvH8bAM2cZUqjXbRevthArYbMS6TLmSsU29701y2VXmQmQsEVlZ/1S0tx21EDFpPylWCeR64w/SUBR0IrtBmf4yM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(10067099003)(261009223027099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021121427099003)(260925022911599003)(260925021311599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajAxUXJtWFdkVVM4dk9zaE9nQ2IzaFY0RHhoTXUwd2NHeUs3Nm9EV3luazRI?=
 =?utf-8?B?UzZmL3gwMkpMTU94aEZZQVZtQnozSktieGJ0bzM0K3c5eC8vb3V6dExUYkRw?=
 =?utf-8?B?VnZkN3Z6VXl3dGJHbU5EWE9RcEx4aWlvSWhmdGlWYWx0Z0J1QXZpd0Nuays1?=
 =?utf-8?B?akpid3B1SEFOdzFQNTVZMVN6RWtqWk1RNTR0Unl1eklwWFU1WEl4OTE5QVZH?=
 =?utf-8?B?azg0QTJjNkg0OFhYWVpLbUVtcnVtK1o4cmxhNmJ1M2dpSmZJakVrS0Jxb21Q?=
 =?utf-8?B?SzVPak5rMEJwT2pBZDMxSStiMzlxYm9KdGFTT3lCd3hqTW41NTFOME9ud2pp?=
 =?utf-8?B?eGh6T2lyZzhsRHhzcm95NlNxSU1WUUVYcWxvQ0VabitwU0UwMEs2SkUxYk55?=
 =?utf-8?B?OWFRampjQVdiM1QvQlgyYll5VmJ2YnNTbEJvUTVlNjYzbFV2VFhkVG0yR3g5?=
 =?utf-8?B?dGw0WXR6Tm5XWlJmdUhicEQxTXFHb09ZbWthTUZ3Y21QZ0NPREpHUzZvclZN?=
 =?utf-8?B?TzYvS2k4YmlnVDA5YzN1TGFWSXNPNnpBbytiZUk3MGRZYU56WU9nR1BkQUVm?=
 =?utf-8?B?UE5qQWkrWkJJcUQxOHRiRDIzVlJvOWtZbCt0emp0dDRyK0pmdnJBSHN2a0R0?=
 =?utf-8?B?NDJ0ZGhGSzNHS1VJcEEwcXdsY29EN0pSNmhQZVVDdjI4cWZHcU9lajhUb1Vt?=
 =?utf-8?B?UmY2SG9DWkJIeXNlZlkwNEJqcjNkanBaK2dFNnlaM2E1OW9NM1JRN3dSS2pV?=
 =?utf-8?B?RVhQbzloZXUrcDRsdjZldXdTTGRYR094Q01WelI3S2M1UnR1cFZGbE5JYm9H?=
 =?utf-8?B?M3U0TTR4b1hFTEpWWGM4bTgreVkzbUZsTHRyVkpyckhVaEdmQVVxRmNtV25F?=
 =?utf-8?B?Q3loYXZRd3ArTDNvTkJGQmJaZk9ETG5UaFpuajQ0VzR6WVFGU1ZDUWR5bXJv?=
 =?utf-8?B?R1kvd3J3RG9yUzhtREpZbm1hVnJVVjRObU5GMzVma3NZSkd3M2xreUszQ21q?=
 =?utf-8?B?MTUwL3Q1T0V3R0I5TDZFT0hLRG8wcHdWYm5Nek42R05RcHVFamNiaDBSSTZ4?=
 =?utf-8?B?d2E1UDRydzUySnhOSG4xR0ltdVcrdDdQUERHUG5yMVBneUFoZnpSSHo5dDRN?=
 =?utf-8?B?SVBLNlo1WGpxdGZ3Sk5rMW12cmxVWGRjTmJpVnhJNDJoMit3NUlna2NZdkFv?=
 =?utf-8?B?WXdyRzllMG1sUFJnbnJCOS9FMkZ3UGJaOC9HY0hYRGk0K1NNeCthV0lhOW5M?=
 =?utf-8?B?aEptc0xDei9EVzlKZTJtVlUzeUxnT0hwaEpLaUVwQkZkdENjWi9ObDZvVE9N?=
 =?utf-8?B?WnFNZzAyanU5MUprTkVJTmZjZVJ4cVVMMzhhWXh4RkNDVUdjbTJKYjVuMG1E?=
 =?utf-8?B?TkIxY1lmQ0FLYXBwZnJvVkc3bWlaK2d3d0JjaTJJQnIrRW1VeUJuNzA0TTBD?=
 =?utf-8?B?ak9FWTUxSHJ2ZWp4bkZidFA1dXJSYUttMWZvQUphYk9jWlhHM0VNQWhSZUxx?=
 =?utf-8?B?U3BBV1dOR3JkOWRvMU1ocVFBa2o4N2hSQ2FSeHR3b0dDeWswM0pTNW5BTzdN?=
 =?utf-8?B?b0J0aXl0cWkyeHJyZzltb3cydzFXd3d6ZUFHeE4yT0lWTHQ0NXBUM21RbSs3?=
 =?utf-8?B?UkVKc2J6UkFTWC84Z29rL2VTYnNmbzlGcjM1RHpkOEZQTVBpcUxZRVRUZktY?=
 =?utf-8?B?TjZwczZySWdzQ240am9VNjZDQTZOZXNTYWJZbnQvakszNGh4YnQybFRmN3JZ?=
 =?utf-8?B?VGFycXIxdzFKdVhhNzZxNVltL2Z6R0p0NjMwZzJxN21jbk5DWVhSMSs2b1Fa?=
 =?utf-8?B?TWF2QlZUcUtuc0l6SG84dWxXQmdmY0VKZ2FSa0s2RzFhSWQvbURFYlB1ZWpi?=
 =?utf-8?B?TU9Kcm5icXNqb2pBU1l6bk1abEt1VEcyY3V3aWNHRlF4SkNrUDY4NW5rM2h6?=
 =?utf-8?B?SDV5S2JmWjgrbWNsTEdhcjFnRGwwcGdRaTJGdEI1WFptOExrNVZBcjdvQW1h?=
 =?utf-8?B?eTRkZ0ZVL1RWVlRxTll2OVFlQXlHRnJ4aXVqelRJWTg1ckM4VlZER3dYaHpT?=
 =?utf-8?B?WE5ac1FlM0ZxSkFhQytBTGhNUDMxTnlHc0lpN3JmMmJ3V3FBeGFvRXRvbEN2?=
 =?utf-8?B?ejZ2d1RsanRtb0RQN0ZneW9QeGVsZUJJM3g0RCtrKzloZldQbk5GbzVBcGd3?=
 =?utf-8?B?ajdVUHc2YS9wSXNYd3BYUE9YOVdSMGtKTytLRmF3WmNyVkcrdXB2d2drcEJi?=
 =?utf-8?B?dUR0eU85U0pneWwxM1VMM3A1bm80WCsyRkUvTys3cHBJZG50Z05vRFRucW9Q?=
 =?utf-8?B?U2pQTXlSdEdoVGV1UGs3S2N3K3Q3RmhOaEhac2xrR2k3Y1pqQXFoQT09?=
X-Exchange-RoutingPolicyChecked: NpiFT/lG6yVEUrNjug9kcIANU/WwKXOa1ZpWYofQ6eGYIHHBRFmHOD+UMCApZFdajAz58yRTJzkXo7Ja6QodUd0jvqwiyhcNp2qolQ0QkYd9fm8yuRXHduuYrmoiV+fdUCVHMlpy3QfD9XgEce4nVTIyzSKNrgsexgkwVp6+bc1gRxmWbMrdMolKt1USsSNjydz4u68kAdSqV5Gdi0bS5VuJCrpDBfMqUSyYAG7AJpbzQ/F5yXntVAJefnNycl0ew4JQr5q0gsMwGajAfTPc8wNoZyd1r7syL9r9RvOPIfga4NJxQQZvSPk5iwnn9ClSxaEeXm1Mqeq8iRlPEF9FRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f840c780-e276-468a-7090-08df336aaa41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 14:08:52.8075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRyVS0LFV34k/79FIsEc+ff5yDEM3kavwaDNZu0+25ltCAIbiVdODuI2us5ysMy48a7DdXw4/oudejeClI5sfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 16:19, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 26 October 2026 11:35
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
>> via direct IRQ
>>
>> Process, log and recover non-fatal errors routed via direct IRQ.
>> Double-bit ecc errors belong to non-fatal error category and are reported via
>> irq. For pages that belong to critical BO, wedge the device with bus-reset as
>> the recovery action.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c | 37
>> ++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
>>   2 files changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index f7799c3c08aa..269ce6a19a80 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -5,6 +5,8 @@
>>
>>   #include <linux/bitmap.h>
>>
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -15,7 +17,9 @@
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> +#include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>>
>>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>>   #define HEC_UNCORR_FW_ERR_BITS			4
>> @@ -166,12 +170,36 @@
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) ==
>> XE_RAS_REG_SIZE);
>>
>> pvc_master_local_fatal_err_reg : \
>>
>> pvc_master_local_nonfatal_err_reg)
>>
>> +static const char *hw_err_to_str(const enum hardware_error hw_err) {
>> +	switch (hw_err) {
>> +	case HARDWARE_ERROR_CORRECTABLE:
>> +		return "Correctable";
>> +	case HARDWARE_ERROR_NONFATAL:
>> +		return "Non-Fatal";
>> +	case HARDWARE_ERROR_FATAL:
>> +		return "Fatal";
>> +	default:
>> +		return "Unknown";
>> +	}
>> +}
>> +
>>   static void hw_error_work(struct work_struct *work)  {
>>   	struct xe_tile *tile = container_of(work, typeof(*tile),
>> hw_error_work.work);
>>   	struct xe_device *xe = tile_to_xe(tile);
>>
>>   	guard(xe_pm_runtime)(xe);
>> +
>> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> I think you should have all these in 1 patch for 14028434957

I can combine 3 and 4.  If i combine all usages, it would be difficult 
to review.

Thanks
Riana

>
> Tejas
>> +		/* If the device is in reset in AER path, skip processing
>> hardware errors */
>> +		if (xe_device_is_in_reset(xe))
>> +			return;
>> +
>> +		xe_ras_process_errors(xe);
>> +		return;
>> +	}
>> +
>>   	xe_survivability_mode_runtime_enable(xe);
>>   }
>>
>> @@ -433,12 +461,13 @@ static void hw_error_source_handler(struct xe_tile
>> *tile, const enum hardware_er
>>   		return;
>>
>>   	/*
>> -	 * Hardware errors are reported through System Controller on the
>> platforms that
>> -	 * support it, and never routed as direct IRQ to SGUnit. So we should
>> never be
>> -	 * here for those platforms.
>> +	 * Non fatal errors are routed as a direct IRQ on platforms that support
>> +	 * system controller.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
>> routing\n");
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n",
>> hw_err_to_str(hw_err),
>> +				    severity_str);
>> +		schedule_delayed_work(&tile->hw_error_work,
>> +msecs_to_jiffies(MSEC_PER_SEC));
>>   		return;
>>   	}
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> db3cbc186a51..e6a0ee468b17 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct
>> xe_device *xe, struct xe_ras_error_
>>   		break;
>>   	case XE_RAS_MEMORY_DB_ECC:
>>   		ret = handle_page_offline(xe, info->sw_address, true);
>> -		if (ret)
>> +		/*
>> +		 * Double-bit ECC errors are non-fatal errors and are reported
>> via IRQ.
>> +		 * Wedge the device with a bus reset for errors that require
>> SBR to recover.
>> +		 * TODO: Trigger SBR using pci_reset_bus
>> +		 */
>> +		if (ret) {
>> +			xe_wedge_declare(xe,
>> DRM_WEDGE_RECOVERY_BUS_RESET);
>>   			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>>   		break;
>>   	default:
>>   		return XE_RAS_RECOVERY_ACTION_RESET;
>> --
>> 2.47.1
