Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D760606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eAM+oVkg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3415410E00B;
	Wed, 28 Oct 2026 05:26:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852F510E00B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793165188; x=1824701188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A93wNiIFgfUwlFoo5A3g1ipTS7aoBA3ymmEjjawMQKs=;
 b=eAM+oVkga7mYgGsOQXzurNo2xEjnN1xLqJPss+8W7lw3qk92Sk9WMfGQ
 WX+LECCkSYRqKWCr/QicEw2I6nDbGXbXVwbHu9lppFK1v4+aLvi02wX1X
 DOHTGTNJ24BZz9DVyQbjzTcFFvRgbeIJzWr+j+PdDjXKomaO3I6erPT9g
 MRGhqbm+9/6W+JDj6tsIuRZsYz97CeS3ab50ODCW8OdeoYEpnynl+aB6J
 PfRnVvuA6MwwJyp2K6l2a/C4euzQGwkSpXP6oDG7pyh8qjIGo4CkHU8Sh
 jVsUgI73q76TgfUHWa3qpqhMNyZRm/lPEeOldc3/ZFYoAaHma+9GJLwVE Q==;
X-CSE-ConnectionGUID: x7vogP3RSFWRcpsFpyvd5w==
X-CSE-MsgGUID: YX5oIkREQr6z0sdRRGJfGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1754734"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1754734"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 22:26:27 -0700
X-CSE-ConnectionGUID: x/Ed4QQ0TJ63v/zNGDTnPA==
X-CSE-MsgGUID: J875mWKMSZWh0uetNGveuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6594836"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 22:26:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 22:26:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 22:26:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 22:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxEsn0zmqCT9/LIpex1pAHdzW7dcc1iDwAjpQwVfRI1a99Ct5S+/tSS+Pbl7FBM/JZMybQVcIyJAKMGJ87eVmvPhNSeEMFtkXMnlcSr80aakOb11F8lYWrQNpveiXzVKGO9wHg3eJjCxV2fIsaex27yNDgLR11PG8pQ81M81ckhcmNpzApY4js7XiCBPzzo/oUS97yaGJwN2P5cuEY1jQBhhesSB0T0IxT6Dl/CnkBwNLmcxllnuEWG14QO57xjSr8F4ubOo/zHL7asNHevaCeZ7IxJ2go94D7eeQQSUTWRn2OKVgMXfhcvrMjyNhqVYFBcaXzoXcr0dtdCP+22nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6r2meWCAxm3SN91QMkqU6FdgTRT4d/Y7FG6w2CPvjo=;
 b=l03lTzv0DDC2HhNXA04o9ND6eCPsaf9O2HD9Tr01wv44lqieso1Z23ctSJldx3F4BE7b+dWGWeL2Chn0r6B9Z9+Hcip6z+rKNXUwwXUCBYsGI16rRiDBuotS4i4PuWZGVRV1n5HNyexEH85Sy62UITopFBLIeu/l593aBdk36+924XLylGiYoA/nbpLrnUxEpk+5EOdPmgfkknrdWJuD8oT0PsO2fSxh+qcWT4d4B1jpOYEijMurP9pQCrguYxfiFHISEYRNd094HQuf401cogzeWol2IRqWuqeiq2QhvSfsfTVUMOYXRnI4PoNrkrvpKuvLOjgoOvtw10tjXz2JKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 05:26:23 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 05:26:22 +0000
Message-ID: <e93b9746-d716-414b-9eda-ee19ea8cfdec@intel.com>
Date: Wed, 28 Oct 2026 10:56:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Use overflows_type() for temperature
 range check
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <jani.nikula@linux.intel.com>
References: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
 <e4839979-963a-4298-9fef-5f4486a67442@intel.com>
 <c8a8e54a-df3f-43cc-a5b5-ec67597898c5@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <c8a8e54a-df3f-43cc-a5b5-ec67597898c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0063.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::14) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|DS0PR11MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 59973e94-3894-4402-edc3-08df34b400e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|11063799006|4143699003|56012099006|261009223027099003|261021123027099003|10067099003|261022115727099003|261022105027099003|261021121427099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: no/1QTWs39ordoeyoFiA3bdWBFG473PiO2GVwZToxSSbDB1o6/rrMz+43DRPS97Z9zUQg7RzllAq+Ggtqq99FdUoRleNR5qIA/NnhAqQkh8MmXCRpyTaAPa8z5yNmxDZS/ejtd1pio2hZFsGZqA50jmUngG0sR8F9xC1GG2FHJe+CX/kAXAgtrKHwkQ6cxXGdY/I0ZvOdSZntZkkb6/AVzNzgAHOajUG/KG0jEzxBohuN2cMy5JA7gqtWS42qb1MVX/rZvjW4NR2xS8bEh8PcXxpKSYfclY+AM1iQsGd2h1bqOhnHbYv5fn4IG4xaQdNkbk0E6tDrEphOPtnUAR1Cr/v0ZSCbgrE6mYuhyrFIQ2pZ9kfnVVaaLTgixegma3z9hjW/6Q98EPnvvuvT5n9WY4NE1S993p42qwM6zSXQ7Xs24b/sz0h9HnnCMQt2BJn8gZUdK0HVVoyNBd0IZjs12BUiJkA0M6VtEBx/w94bx73BAnA9w0aKg1xSeu2nOIrrpKctNRQHqiQX8EIle2Ws10a3jRKSALm0WVompx34N+3V3bYAw09gObg1c15xV8zvpIvGDGBExaBG1x/qgRdPOBe+ga8hQvA91tIeIK3vheUw0YIvF34pLAwI5lMTskml0l3TPrlI5MOV3lD5AE5HnOlEYetdtUTvHQcwRTlHQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021123027099003)(10067099003)(261022115727099003)(261022105027099003)(261021121427099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHA1NkFhR2pKUWx1WWtvZlZ1QWFsZFdhOVoxdlZiS2l3b1pUSlJvM2pxR1A2?=
 =?utf-8?B?RXc4YkRMYThwVFl6VE1LZmNieG14MVBMQXM5bHN5RWVLbDBpSnJwbUZ5bGVj?=
 =?utf-8?B?SHhTczBJK05BZDdxUDVCdUN5ZkJNU2hRbm9tcURocTN2OXQ0bjVlY1lTeXNi?=
 =?utf-8?B?K0twRS9MMklpdTcxR0pLTzlIb3dVTHdZTnlGdUxtR1ozZ1hWUHpEd0dZRlh5?=
 =?utf-8?B?WEdBejVTVUNMODU1U3VYN1N0RU5TcGFWSFhuRXB3R0FrVndxRDVUUEhqQitq?=
 =?utf-8?B?c1pzK2lXaXM0dFM2dFhmdU1TQlRzTmJYdGZ1aS8rZXR2VjhzQWI1czBvdkJV?=
 =?utf-8?B?ZG9ScGFZbEpVN0pRSmdCeXhlVGtHWkZvME8vd3E4bFhJNlMveU5zTnY1VTN6?=
 =?utf-8?B?UkdqVHh1eHRZZVJBU1NBMGZOYVZrVXRrMVM4VFdlMWhjeEw0Y01MMlZBRjVk?=
 =?utf-8?B?SWVPME1yeVdTZXRqZURKMk9raHhkTFFkb2RXN29SRzFKUkJZZW02REpBZ1cx?=
 =?utf-8?B?UTV0MXZwQXJFWTIwbHorVDNZWk5vbUc3SlRzdW44bzVJMnIrVlEwUXFSYksr?=
 =?utf-8?B?Vi8xSWlWQ2pqMXlKYm92WVpucnp3ZEw3T0JWZmREbUUxUDVRNi9MdG1SaWY3?=
 =?utf-8?B?ME8wRDE2NDEwQWlnY0JFNVd1dmgySzRNcXlSeTN0R0RYZWtOa0dEK2tNcDlM?=
 =?utf-8?B?Tk9VZFZJaWRYOFBMWjBURFZtTXJxMTJuRGhVbm1mazZ2QTFGemtENFVTOXhQ?=
 =?utf-8?B?ZWhTMWZCRU95SjQzaEE1NWs1MWxuS3Q4MUUrY3h0MkpRcDJTb2NwRytvSFNl?=
 =?utf-8?B?SjY3a0t1YXBJY2RuZkNpamRFOUl6UThqd3M3RXVEZTY2SW5ETWJxNnJ5amVj?=
 =?utf-8?B?aVVIUFRQVWJDUkR1QzJHeExmVkVBSUl0MEYrVmUzTEFrQWxSYUNubTZwb1Jm?=
 =?utf-8?B?UHA2WE5hRDBlaGtrTldhUFJFQzV1aFJTd3ZCU240dmVtUEVNUk81L1hjdjNo?=
 =?utf-8?B?Z2pDcTRudElrMDVzYkwwSU5pWEF6MUF1d0ZuUE94SmViZ1FCWUNYSHVaQXBO?=
 =?utf-8?B?RjlubWtsLzdaRW9YWFpMaC9Nd2RONCs0NlAveXQwNElnTExodVN1SzVxTTd4?=
 =?utf-8?B?RU9nNkNmWjAydk1ya29Kd21KT0lGekhqd2t0SFVlc3BvZEdwZkJvM25xajcz?=
 =?utf-8?B?Q1F0TlpGMUlnbHQ1ZncydjdwcUJpZHdXUGJjdkRJVGRKeWQvSHZLSEJlUFZt?=
 =?utf-8?B?ZndIckRLbXliaXprL2pNRi9VS1ZGbjBzV1BobzhTUHo3RHpLK1QrN1AxNFNj?=
 =?utf-8?B?TUpibDNXTlJLUmxONkUyZVRYMmlxa21HdHB2VzJtSUwwekc3OGNRSVVzRHBL?=
 =?utf-8?B?ZW1WQ1l6dWQ4OERFaHlEV0FMNkYzS1RMa2xiU3FGTTd2SUNiTVU0SG8zQzdW?=
 =?utf-8?B?ZWlmMzVkUU1CakhkUXZqejc1a1NlazlkM09FNUlqeG1tM0R6L3RsTGh3VWxS?=
 =?utf-8?B?T3VmSzRVRXF2Wno2OHhLOXNCSGlZZmFRb21mTWhiNkZDVkNiNitzWGRXRmhh?=
 =?utf-8?B?UDdVSWRqeGFic0RIa3FuSm5FUWRvWnNvMVYvUDRnRWRnV3R0L29rZ2IwSFJD?=
 =?utf-8?B?eGRFZjEvZkF1b0FZQnNvblo3M1FNTUxmZWticnFiMm8xWHN5SVhSMzM0SkdC?=
 =?utf-8?B?dlZSTTJDcFdUdFBYWmNldVVtZlVJR09BY1cwaGZ3dVRUNTBCbUpnSGgzK3hC?=
 =?utf-8?B?S0p1cC9CTnh3azV1WnNwVDNTbVNIRjR3L0o0d2dKUkpHai92ZzJlUCs5MUJy?=
 =?utf-8?B?L3Zoc0pVNk8yL2xTK0pFaW5IN0l0R3V3cnZyOW1HY2tFMVVROXlPcUtiQlF4?=
 =?utf-8?B?T29PQ3JmandhRFo5dFNEWnBiSGZ5a2tvc3BMWmlTOUpaeVhYcWxULzhlY3Vy?=
 =?utf-8?B?bEdKdi9xb2s1Mzh4ajdvcUsvTklnaXJZQ21rN011SEpWOEZSaHhla04xR2RV?=
 =?utf-8?B?eks1aU41UE5PeGVKTzRpL1hCODNjK1h0WDZUSEY3cG1QY1J1NXd1N1hnSTBl?=
 =?utf-8?B?ZkZScHNwV2pYYWlkdkdYWVgyTmJkOWpHdjJjYkd2UzV3T3pMeWFYTUhvWEZD?=
 =?utf-8?B?TGxwQXh5K3pLTDFLV09PYzBwYjFqaDBjNWxPLyt5cHUvNGZTaXFDZVh3aFBm?=
 =?utf-8?B?Z3NiaWY0UEpSVVBWeGs4RThqWEUzZE9KYkkraHdiZDVDekxZWExWZ3R2WUNP?=
 =?utf-8?B?UnRoNmk3aXo1alhHZ1Q4cEE3YndQRkhFTURhUmhlaUE0aXBkUXdaRHUydjVm?=
 =?utf-8?B?MXd3UDMyYzFrQzRPaHNsbExiRlY2VWlEUy9HUlN2ZHQzSVFvT0h6UT09?=
X-Exchange-RoutingPolicyChecked: VQVxy64XWubgwDtUZNpkcaQ2VzvydmOqiHHNeADMCZyvnsCkZEJkrKkUEQnqEygEcT9bP9WBLOvaV83Ub9bRJ0VcR/5RXWZ4grub5uaAT8s516RJ2jn7j04u742teYg+TfZLPIl+WhLGTLzbUAYDVrf0Lf4MwtF7Guc6bTgao0pWrJc4q7t8pVRmPi5DD+9wRG1L/NcrXYxPPMT2fYC+GWNjeFRS8YAeT3giYqKxRW/abN23QqlM/qKyZJhnJr9fZ4cCBJ1FkI32yqDy9ka4Uw98mcRu9Fs8IVxz1J33VZBw7iNvT4dYMcWAMhAV5k/ff2p4VQdyrEqlt3tl6inXuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59973e94-3894-4402-edc3-08df34b400e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 05:26:22.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNdwcKC5LVYqZAS5jRzl14aZ9FlupipzsSqp7jO0H90qGsXjhV0rDK404PfCONyXwcqvyX7Oxg/5SWnf3LfOlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 18:06, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 05:04 pm, Poosa, Karthik wrote:
>>
>> On 23-10-2026 20:06, Mallesh Koujalagi wrote:
>>> The temperature value is calculated as an s64 before being stored
>>> in a long. Check whether the value fits in the target type using
>>> overflows_type() instead of comparing against LONG_MAX directly.
>>>
>>> This keeps the overflow check correct on both 32-bit and 64-bit
>>> systems and avoids architecture-specific handling.
>>>
>>> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers 
>>> as IEEE-754")
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v2:
>>> - Use overflows_type(), instead of #ifdef. (Jani)
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 42acfeb8818c..515b288f18e5 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -6,6 +6,7 @@
>>>   #include <linux/hwmon-sysfs.h>
>>>   #include <linux/hwmon.h>
>>>   #include <linux/jiffies.h>
>>> +#include <linux/overflow.h>
>>>   #include <linux/types.h>
>>>   #include <linux/units.h>
>>>   @@ -1322,8 +1323,8 @@ static int xe_hwmon_temperature_decode(u32 
>>> reg_val, long *temperature)
>>>           value = 0;
>>>       }
>>>   -    /* Ensure the magnitude fits in long, which is 32-bit on some 
>>> arches. */
>>> -    if (value > LONG_MAX)
>>> +    /* Ensure the decoded value fits in a long. */
>>> +    if (overflows_type(value, *temperature))
>> Is this change addressing an issue reported by a static analysis tool ?
> Yes, it's reported by a static analysis tool.
>>
>> |LONG_MAX| already reflects the platform-specific size of |long|, so 
>> is this still needed ?
>>
> On 64 bit arch, where long and s64 are the same width, however (value 
> > LONG_MAX)
>
> is always false because LONG_MAX is 9223372036854775807LL /* 
> (long)(~0UL >> 1) */,
>
> As a result,  "return -ERANGE" path is considered dead code and gets 
> flagged.
>
>
> Using overflows_type() makes the overflow check explicit across 32-bit 
> and 64-bit arch and avoid flagging by
>
> static analysis tool without changing the behavior.
>
>
> Thanks,
>
> -/Mallesh
okay,
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
>
>>>           return -ERANGE;
>>>         if (reg_val & IEEE754_SIGN)
