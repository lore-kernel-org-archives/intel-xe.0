Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A924606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hFozML4M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AD810E2AB;
	Wed, 11 Nov 2026 08:20:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D8310E2AB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794385251; x=1825921251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LO+JdrekQq0UpIZXrBscwvOEdXFEZBgwFlAOKXsiW3g=;
 b=hFozML4Mants4HWYzuBFPlXbelyFgrcmBw6q+s8QKqCn3D4rXAIdoprF
 3garsEO+agWpDsH7d82avrujnAyZTzk0puoqmZQwo0prssYaiALp45uxR
 p+xc8xqhMCXZohTf4wZBm3Tm91FW5Ng/cuUC4o5u6Zd5EcvdyX0EMxSYT
 +cy3DcT+P2VOHpHZpPWBzkdmveQUZt6ofGh9cyEzrbzzUX4G5/yagz4ZW
 WHpsPDJ6yVwoTjfmFRfxZXI5K40+a5+LQU+s07o9s93tep1jHdLp2sXpR
 IahxxDVBvr/5la6aHEea1ZwE/7wUmgWccQxLxXDepSVRB/H203KKunQxV w==;
X-CSE-ConnectionGUID: cypULeMsRCWT1oLwNeFYTQ==
X-CSE-MsgGUID: GwaF6cG0T/KrvR3aVc11Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3061824"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3061824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 00:20:50 -0800
X-CSE-ConnectionGUID: Qgu25eNRQsCxAqEFW2zhvQ==
X-CSE-MsgGUID: +2OqG/3ARYipfYF+r0gWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8677682"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 00:20:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 00:20:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 00:20:49 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 00:20:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okH2kctaPUdJJ4KkdGApdcfrFd06EQFhcimCf1pg1OrWPRkxOMfRvsItXryfO2SVKX9qpWpOfq3HUvQTi3uj6q1Q/Velg/kwmEWQjQUQkgo7gsFGuwozIX9aBWNUGhpGfNJmE+IUEojAjFMd/MR3KjqxKTmGT7OH2JdODNaURkA7tf6CJ+STU44pxHSsBVIgy048ji4ff+CVi2qaJ3caN7QPTJb6+Wsluw0f23TvKXX21yTINSzxoDLrbA/16aaCqOwm1bCeVi1iehFgW4oP7l+Y91sU3pY0Wu1GYVuJkmJQlFj/PuCG1XG6sQ5cyXWcBtjjimisCS1pZ5B3LbF4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jzsg3KYVRP2mgQaIiOh+ZwC4SfCrIy4zaR+jbwxqiA=;
 b=qn8640YQFOjrRq+vMcblrRgsif8Ek5Mvm8KZvt7DPwc34g+gCuF7rg/fjPudj7f5mgBS7QDoa2rctfYLSYjN51x5r3eCpk3WK3L9L3mZjpGHq3PsgMWeWydt4lyWqiv1dkS975L8xpSGUs2IgHCsR5jmkuvZVqxjJQ3KlHFWBpiwTr/Fhzid4RnJlZV5qsFzvUoSYCZIPmKpbtgYD5NmODin+Dziestu4Z82QY90/wnYTjCq2erZ+IKAfRMjduyJ4KraaxC/iIoTIEv4q04kdaj3FuSY45zEt0JGNH7uwkX0jjxXcZDAt25aSzP9yX1J1fXk66AOhQBJjxUjC0HMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DSVPR11MB9693.namprd11.prod.outlook.com (2603:10b6:8:34c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 08:20:43 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 08:20:43 +0000
Message-ID: <6b815695-c727-4e60-99ba-ef9cdddbc5bc@intel.com>
Date: Wed, 11 Nov 2026 13:50:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/xe/cper: Emit software CPER records
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-11-mallesh.koujalagi@intel.com>
 <08229e79-3a43-413a-95ee-c0baf3838045@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <08229e79-3a43-413a-95ee-c0baf3838045@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::9) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DSVPR11MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bd3262-d238-418d-4d35-08df3fccad7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|261022113327099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: lq+ZKdtxNc4f/WNP961B92Gu4JM+9vAA+ALVU3QoeJ7cY/RdPsFsEa5LUSxgJN/OzIWYqc76xpO/oj7cyaGN+KhHSVsUUxeZTQZyWqzISaP52GAhQM1aUzUM94X8RTjVLb0TeQLotk09AvyzMWh5SiSgD74lfxX4uVRZ5Sw1rpNPkIK/m3MYe98BvMXJBqQPYY7VIVlStxzeyoB1BPW0edasIacaigb/88eE6u8uwegTmrop/715TDIHMPyffRntsaXvBWB/G7ejfdX05w12x77usOrMLL+eGPs2JzG7Fm/25AVrFD4Q0SyCTvh2lIxAfbOW1JQcTcK3YpWzz/KHJeE+rsaApwm7wZMgrmyA/p+6Jnm4BV4NbOei24Cq1VeI6QAd9Y5J72taFEDfAhs1VaV70A6Ra4CWN7LX7r0LxbNg8nDtNf6flh/4P2nOVoYHvZOscOBTS3c6lYhBJ2n1Nlz7qxS5MWoI2DD1WfQ81EMLs/Whvls+N1ACcIK521TMJIXojOTQ5ebMs3oAH2cb4FaI842dRB/JFpKQIEX5JGhn97RhG68K1Z47Id6vXIcQrOXhsLnT1Yvha21ljOxjxvXpRucoR91/bzWxk/OyQ93PhbpL+qAYZbuF186IsLKY3t5104ZeiUQJ9+6yK5Eqk5XSgKFZEYb64+DbHZpwVn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(261022113327099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QThSaUNrQWEybzFMQ05qOGxzdmVtWklMVWtJMDNDelZFTTlqaUVhUGpJSWRW?=
 =?utf-8?B?dFdQY1hXU01DQkZaOEg2ckt5SG52dGsyZldSdTRBa1JQYlZRSGprcURMZTJi?=
 =?utf-8?B?THMyTzkzdUhFalB6bXFrLzJFSS85UTRlS0NrRHR6WXNSUGgraEUzNmd1ejha?=
 =?utf-8?B?T0dEZ0tZY2FQZE5GNVJHMjRWUTBBNzNiejZ5djNNR0NOeXg0Ly94ZlVlL2dl?=
 =?utf-8?B?cWJHUFNLa2gxMzRDM2JGUlBPN2NlWFV4WnJqSCsrK1paLzJSdDZKUEh4V1F6?=
 =?utf-8?B?TzExT1loMExrWkdoY3lJV0RxQlNsa3V3NTBpK3NueThrbks2RVgwdlJHTzUv?=
 =?utf-8?B?cEdVQXE0L0FyYVRvVHlEOGhxc3VsbWhmNnJDREMvNEg4akxPaHNLeDVnbTc0?=
 =?utf-8?B?a0VjUHFwRytORi9hZEFvekRZUDU3UFBlUnUzTnBYbWZxTFBQY2ZVWUtiYTJq?=
 =?utf-8?B?RVdORGszT3BaTFAwOGxWYS9lQmJKRUN2NHRKTmFzd0JUbFpsOVdudHZRZnM1?=
 =?utf-8?B?VTBpRFNSOU5XTVJCS2J0aGZGV0w1MTVoY0lmZ2tpcWdaV0Fud3JIY0xqMFdr?=
 =?utf-8?B?eGwvUUFza05jN05sNFhyaThKc2ZCT0VUQmZpNE5mVDBOSFFEQXhwcFE1b3ZL?=
 =?utf-8?B?ZVc1Z0JlNW4xRVNwVEg4NnozWUZtZmZGUTk1cFYvTWFWS0V5L1N1MVQ1MUR3?=
 =?utf-8?B?MHZOSjgwaW5jeGxpNGtTekdCeGlaNHYxVGV3THNDNXhhRFEwVzA0bFc1TXJu?=
 =?utf-8?B?NU5uT3pjWWJYanFpUkNQajZUNVl1VVVOQk1sWkNOS2RMcDFNT0s3Q1dVbWxI?=
 =?utf-8?B?c2NmTVNlT2xEYXd2T0dKN3lsSUxwVzFzdm0yUEwxS3E5R0g1YXBjbEpCcUY3?=
 =?utf-8?B?d1JVVkVNWXVCdGs4NWVMK3h6NmFTc25DSFNkUm9vUlE5MnZ2S094NUJ2VTdl?=
 =?utf-8?B?U2t2Wmlaa0RHMUlYY3M1NkJlS3VOUngzMXRwM2lCdnNnQjF2M01VUVpQd0Vn?=
 =?utf-8?B?bzV5L005ZDhXbkkzZHZnT3lFTzRJb2U0emxHbG54TW13UU5HM0VwSGZ4VzBV?=
 =?utf-8?B?S2VHUzZWaDljODBVUlo1RmovZ0JNcHFTWXJhK0JGWURJMXBlU0tmaFErM1Z0?=
 =?utf-8?B?VlNHNDFCbDBiQldFMHNHS0xYMi9ObG1ZQkp2NE8vZTN0Nll6NnlSbWo1MDls?=
 =?utf-8?B?N1gxYklBYjlsRUxCQm9hRkhsNzJ1M0V4U1hDemNJL0tMbXZJbTdRY1lVM2pY?=
 =?utf-8?B?T1VQWmJGOTMrUVJzTndPZXpOMkYxRWVDUkFVNzZDZ1JoL1ZpS3NsNElvQk5V?=
 =?utf-8?B?NVVvdXh6T2ZxeUJqSXZLQWd0U1lQYTlzOCtwNnh1TFJPeSthNDlLWnhyTzRw?=
 =?utf-8?B?MXBZck9vM0RxVWl2cnBVMkh5V3FRUUpFT3lJR0NFUE9IeUgzYXFPVEE2RUdI?=
 =?utf-8?B?RDlKZTRLcW9sQ2ltMnR1bEJXUE5Kd2gvNnVGcmJsNWpTM0szVitCdGlneWZL?=
 =?utf-8?B?NVVYNDEvR1FDM3BOZEw3b2paMC9zR2M1STJjaGt2SXMrcEJpTUhqUHYza01u?=
 =?utf-8?B?YXZ4QW9HaWhVNXR5bDZ5amM0UHBhZHNSTzFlNzYwN29pTXVqSGVjSWJHVXlz?=
 =?utf-8?B?UVI5RDFVUjlTMk8vUmJ2bkJocElLclhzWURIMHFhRldKSVBzTWF6Q0FvazBE?=
 =?utf-8?B?VFNzZUlyTUg2QWY4R2tTKzVUdVVNcnNwWHpiOUk2dnV4NmtFWktzczhjTEc0?=
 =?utf-8?B?Z3lNTUg3V3hyT2lOWDRnLzMrenpWbEs3d2tNVzYwZXdQdXBBMlFVQlF5QWFs?=
 =?utf-8?B?azYxSEo4YVllNDFMaU11ZkI1a2lvaXhTb1JIRXcvSnAzSFhhc09DVlE2RHJP?=
 =?utf-8?B?ZVhpTnlqOWhPQVp0UDVQQVZiUXpMcW41Q1JMZTBkUTVNZXI3UWMwU3VuS0Vy?=
 =?utf-8?B?eHJGVjBiV1FlQm9BOHZ5d2ZIYlROSU0rcGVNZUJHTnp6cmcyWWN2RkQrQzJv?=
 =?utf-8?B?bWdlbmpURFpwdjFuQmVJc2NuRlAxODZOMzQwZVIvcTdnZW5objgwcC81dUFu?=
 =?utf-8?B?dGl3bTVJbkNxVXBvZzdEeVR0V1pIMSs2Y1lYYVZZVkUwWjl5Zy9wMHFnQm5q?=
 =?utf-8?B?d1RGcDlVZjNtV21qNHpINld4MWZBdGNIL0tRYkZsTjRHOWtmOUJnRmtnMXRB?=
 =?utf-8?B?K0V2QnUrSEhwVVpJV1RYZU5VSVFrOUJlRGNTUU9SVHB3SUlRdWxCNCtjT0Iz?=
 =?utf-8?B?TTNYQ3dtQSswOUZ6MGdLTG9HdWZCRkJmajdQaDFxZlQ3THRaZS9sRko4azds?=
 =?utf-8?B?WENoUStoVTFQdVE2eXJaVjJISzdWZ000RTE5cnFtdWVUYzFOTVh5T2I3QkV6?=
 =?utf-8?Q?nazPb+DghXJPULhM=3D?=
X-Exchange-RoutingPolicyChecked: xymJeSkv/ZM+9ja1OL0wN3misIEhSadJj/uoKESgkaAteGHPBpWCzOQ4BN5zUn7TVG9m4T2guomnPjthvhNbZMkVBsPDRDQsmlZ6kboFBu/0tBaOZA6Yb8p2HNr5pCBLPuofpLXQ0U0Va1PInHX/JvuImclLf2XLI+/4DaPB5D9p+aKgvAgnGc7xdWRLws7h4c/u2VSkyR4kp9JQz4EzI10XoG+edhRJ6WJ7acPMUGqBbb0Nxm4woJZggcvTrgH0TPpme4Fq9WleLZjCS0qUdWlUsOJ+PGP6o4EE2uUdnGwNi0BL+X7MehMLozxGgjSq/x6eFJqzFFdlew9i8tcR/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bd3262-d238-418d-4d35-08df3fccad7e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:20:42.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ALvfYZnnUVN5vXb+DRoTV8KsaSCv/lrQjF34Qe/NBOS1MeIs+lV0+11Dptk/Qj+8q9C4FVV8fbbg+dLtrNorzecbj0FKpkgLxsdSpAH7xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9693
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


On 10-11-2026 08:42 pm, Nilawar, Badal wrote:
>
> On 05-11-2026 14:23, Mallesh Koujalagi wrote:
>> Emit CPER records for software SIGIDs and attach the
>> formatted log message as record data.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 12 ++++++++++++
>>   drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 10aa10bbf282..9510dcd1754c 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -248,6 +248,13 @@ static void cper_emit_hw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>>   }
>>   +#define XE_CPER_SW_MSG_MAX    256
>> +
>> +static size_t cper_format_sw_msg(struct va_format *vaf, char *buf, 
>> size_t size)
>> +{
>> +    return scnprintf(buf, size, "%pV", vaf) + 1;
>> +}
>> +
>>   static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, 
>> enum xe_sigid sigid,
>>                    u32 component, u32 location, const void *data,
>>                    struct va_format *vaf)
>> @@ -256,6 +263,8 @@ static void cper_emit_sw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       struct xe_cper_intel_hdr ihdr = {};
>>       struct xe_cper_driver_error_class *driver = &error_class.driver;
>>       u64 timestamp = ktime_get_boottime_ns();
>> +    char msg[XE_CPER_SW_MSG_MAX];
>> +    size_t msg_len;
>>         driver->error_type = cper_sev;
>>       driver->error_component = component;
>> @@ -263,7 +272,10 @@ static void cper_emit_sw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       if (IS_ERR(data))
>>           driver->cause = -PTR_ERR(data);
>>   +    msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
>> +
>>       cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>> +    cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, 
>> &ihdr, msg, msg_len);
>
> xe_cper_driver_error_class already contains the necessary information. 
> Why does <msg> need to be passed to CPER record?

Discussed with Arch team, along with xe_cper_driver_error_class info, we 
need to emit <msg> in case of software CPER.

Thanks,

-/Mallesh

>
> Thanks,
> Badal
>
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h 
>> b/drivers/gpu/drm/xe/xe_cper_types.h
>> index d8581992dc45..268995a537c4 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -40,6 +40,10 @@
>>       GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>>             0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>>   +#define INTEL_CPER_NOTIFY_DRV_ERROR \
>> +    GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
>> +          0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
>> +
>>   /* Section Types */
>>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>>       GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
