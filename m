Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A4606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ks8I1/am
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4980910E62F;
	Fri, 23 Oct 2026 14:56:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42BB10E0AA;
 Fri, 23 Oct 2026 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792767308; x=1824303308;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=18I3Cb+PqlL7AqGEB9Ohi5qQJ3ivyj5XtdZh09HImkM=;
 b=ks8I1/am9BlBC1ro9xtPa2OfZL1f4CYnFqjd0Y8INZHOYpFeK+es0Nnu
 FKmI89J/qsZGizhR2Me7zxf5X2RZb3EW2/YVIEgRBw49T3vpBvh0gyrB0
 tB+l66pY1DUDmR67p7v3p4TWk/ImOzO6FutkBVh2JpoyOPv1F9l1g68M2
 P27QWiYRfLGiV7S6VE5XkflNMdzofXwz5HyXtYzxkUf3EzE3RLewANNeO
 DOOKK0OfT74LyTH1jrhGROPZPBAVJJDdFszC4BJz3E3+OrVWtRh/osyOn
 fsw3m1sC5HAO6616hdnIiVpS7jqjNke/rmvqZ5tp1d7xF288zOdGApP+a w==;
X-CSE-ConnectionGUID: k/sW8zXoSl+w8MLS7BEwXg==
X-CSE-MsgGUID: V0uNzt4pT2+CHEQdbPvD9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1408248"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1408248"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:55:03 -0700
X-CSE-ConnectionGUID: WYCwj6WAQ82MO8Hjq9hIhQ==
X-CSE-MsgGUID: VKlvwdzaTg+EIQipoL2/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="5420855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:55:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:55:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 07:55:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piN2fdRRZ9i4cw5dLe+q/Bn996iOVyzVM3nlv4Y0RUrhB7b8fNwBj7d8nwmWEoZHXBCEmwfmACdF7b/f9Or5guQT6dlFz+yyrgIsfM0H2EAEvIYk/PmSnSADuoONIP/V9xjiWZRHTI8G8qEg9y3KWY6woK4s0JzTylRo0QWkxrFVFj2CoHP8QhaTmxx1PRUfWewuR8ClZ+eIBW4ZFsbFCnH2E/F2z1ZrSnZ1xzC2E6qY7x5yfNHGDRI7Q0OjtyzHvDNsOCijEHsrEuMvIE4shDhGOTUMd4R3UhOgXmevpRqkcyJrI2gHZCrJr/ahz9gNlotupsDw6lZUy+SJPHccLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fyl1qn7tCbtPzgLD591fmwmtGmhPOtXKhVsmLSe83U=;
 b=f7B0dn1cwAgkd4VnbeFyIUXJ/KhLcq2tstrbDRs92gFyJGKdGo8KK1Mzw+eQSZ/FMEzFWaUjMVTEsHe5NzLozzP8aCdo+hdCCkD9HvakgsrCzWlHJ664irBQse4S3Ve/zUK7Nu9nE0EWzmV2EZLy5s+1C6J5nv8oQ0QePnUNuu6y80ELz4SbGU7yZiGBO774HIoZIdj2+fRIV2ToPPRS5Za1/3K0/CjKLgkD+GKeV5xer2QNASpqi7Ba/KJYm9viXaInoE87KhE3zLDEQmQzNz4jDnc9DwMCvpJ+3pTofIQyEYlF/QA2Sg8D0Et7tC+ve9sUdlMeYq1z9WvtFAgnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 14:54:58 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 14:54:58 +0000
Message-ID: <6f0b34bb-8fd9-43a3-b575-bc5040b7086e@intel.com>
Date: Fri, 23 Oct 2026 20:24:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/cmtg: Disable CMTG after encoder disable in
 hsw_crtc_disable()
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
References: <20261021190631.527183-1-animesh.manna@intel.com>
 <15f30286-0c23-421a-9d1d-860a2b12850a@intel.com>
 <DS0PR11MB8049E7519329D4E03500EA5DF9642@DS0PR11MB8049.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <DS0PR11MB8049E7519329D4E03500EA5DF9642@DS0PR11MB8049.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::17) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bca9d9-a2f3-4fc3-5ae5-08df31159b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|10067099003|11063799006|5023799004|56012099006|4143699003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: Udw/G+O78YQAT4Orw1LjrV4NqRl7eOk0ijelzSneIXdb+6dioID3cIFUD6ljyc/YGzvNTtAoKYaiiSwFchUSFmLRVz87X6cG515ccT76NFqZ5e3cEuejDzpoogQ0MHRy681kVqqkDFtltOLF0QkcAKzjI1anqJanibtnLDruWJn1wAbMcWA7CDWpDxngUkF9hS7f9l9J2A5ZbO0ys7H8splnmvlZkK0jnBXPSGmmtTDk26LTZ3AT14TUq2/snsKjC/TEkR8dnerUe7R1nYb24X3cy5Agv6L+HmZeHMxx+Isz4hpwxh+gRYP1vjCHhmHgo1kTXRKe1Us3mW1IOSLy6eMk552mY0Eqn3EXpRhroZHICw+JVuJU9qYR3fDz6YfdKSmjTDKga03sdI//hw/a9Vf08eacyfMNbnKMWLfsi/4I1DfJuQyzLzDr6X4H226Fu2z2/I8osBz1VKwMVylJtEpjfBJexCUrHZg9d9O5Rm+30mRzDDQnQedDHAcww77CCguGGuOXzHJVofNVVopMT8IrcNJI4rvFDocWQ7cywRYVDk4qFjcwdxW2KZDwAvV8wxew0a1cXaY9J8U3JzzjRWguQ5M9WCu8pg7g60EH9Ik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGR3SDJzdWkrcHVBL3owcU9QODF4ZlJiSm1xV1FINUEveVZGc0NrSkJGSE16?=
 =?utf-8?B?cHUrMVFZa1lsWTdpK1ZZdGNDb2FMR2dQMXVBZ3lscEVjaFhxVWRrVEZuclpm?=
 =?utf-8?B?UzB3NHdEWXNNWUJVSnRXVkM2ZEVEb0QrT2U1QlNneWZiM1hvbTBNTmd4a3dh?=
 =?utf-8?B?cVhzL1Z1VFJ3MUJ5UVhQc1BpbWxSaVd6VGZVdk1DYXNDR3dDVCt0QkJBSmN6?=
 =?utf-8?B?emVPVFJBNzE2OE1jNm5FbkRaY2tiWWJzbDlDSENsa0lwNWQrQlF5cXNpTC9J?=
 =?utf-8?B?KzlrMzJNVm9yKzkyVXdIdDMwaEM5ZEtOeDlrUC80WGc3NlZ6a25pN0FVZDlz?=
 =?utf-8?B?UjRpbnArcVdRbVFVaVpjLzNaUU1mYVZocGlIbFUvcG11RVVvbDBFVFpseFN1?=
 =?utf-8?B?TEtGUWRtR2ZMQWtFTW1pTkJVYWI3RFBmZ3dmYVZQVitFZDVHS1lOaU9KWFox?=
 =?utf-8?B?TStIajFrQUcyWVFYS0JxUjhwT0VndWNhUWh1R3c3WU15a1NnVzB5NXVzL05R?=
 =?utf-8?B?YXd4TzhkQ01EQVhOc09TM254SnJvdGR2RDB6TDh6VVREakRxWVZnZ054aFpk?=
 =?utf-8?B?emVKNTlRekJKWGZlQ1RDWFdkTXNzclRIV3FaUnZOM093L2g1cVh2RXdPUXk3?=
 =?utf-8?B?bjdVR1l4dmswTGwyV0kxbHJLMmMrMThEMCtEUFlJd1NrK2dneWpzb3g1VExl?=
 =?utf-8?B?ODNOeDZjV2srdjd0Z0hUSjlEdlhIWkRZTkVEcUNrdVpuVGRxUVBsSGYxTDdC?=
 =?utf-8?B?dndKZWdZU1NUMU5pcjQ3MDhVU3pWbGYzbXRKajZJTHNZQThFaWJJQm9GeVo3?=
 =?utf-8?B?VDBBL2hCL3FKS0phRXpCOUo5SDFVbG5xSThITW9NNEdMVVF3eHhhVW5VZnVm?=
 =?utf-8?B?M3BMWUhUWGlhLytNdHIzYVZCOGFhQlRETzRVZFhxQSsyVXlOR2kxMHZ0d3du?=
 =?utf-8?B?TmNXbUdJYVJyT3J3cWJQKy9jbVhhUzBad0JwZG9VM2l6S0N6bUtxVmtTcTZ5?=
 =?utf-8?B?LzE2MzNsTzNGUEwxUXQ3ajlWVFdMcGhHSUptZ0FvZTJGd1NqZTBleXcxb3JN?=
 =?utf-8?B?NmtYQXRQdkhTMVMwWGt0NU8zcThIY01zRzZhWjMyMDZFZTVSb1dlZzVHbith?=
 =?utf-8?B?M3RUNlJiSklJNnhLbDlGZVh5THRJTTlFQmZsMWorS1pTVW9MYkUxS2pwYjNJ?=
 =?utf-8?B?M0tQblBHSHdnMGhTemVRaWJOS0Y3SGFvL2dOVGxtMTNCalhUbSsvMkFDT2h0?=
 =?utf-8?B?LzJacDJ3UW9ZN1AzVExvbU9kbzhHcWxEK1g1UEl2ajJmSTNXVUR1QjltSTdV?=
 =?utf-8?B?QitRRGdreTdSSDhMbDhoc1gwRk5FTUsrZlA3WkZxWlloS1lVUTFEVFJkK1FY?=
 =?utf-8?B?aDBGNGFYK1ZmdXlaTWMvcjAzekwyQjRmNlZrYy9VMzlYR2tFdmd2RjQ5WFQr?=
 =?utf-8?B?NDZMclZYeFUveGJQdUZ5YmN0RTZRMW8rSTFDcDNlcjlpVEUrSTkwNVJFODFi?=
 =?utf-8?B?ZTY1cy9UQlNiUW1FdGxSbDFOMXovN3ZtRlFVcHc2N2RUTUZuNDZ1ZElhSk12?=
 =?utf-8?B?NnlVUVpybWtEVnRKUnUwTGNoR3hsSjhuRTZYditaS1JCejRETFYyMms0V0lO?=
 =?utf-8?B?TG5neGpyWndCWDc0WWV3L0JlcUxJQ3ZoL3pKZEtXb3hyRGNVVXBGR1k2WE5s?=
 =?utf-8?B?d1I2MHVHN3ZkaE5NWHVRckxyMlJ0YVdDZ1BhM2hlR0xZS2J2dDdkNSsxd3FQ?=
 =?utf-8?B?RUladWFScitSQ05FM0xUbjBINGoxUjRKZTVaOXp1YzVCa2hKOGZIQ0RQdUN0?=
 =?utf-8?B?cXRIbDZhTlJYOVJRTkk5OXg4MkZkWHo0d0ZKS0pDdW91eXh1N2lERDJ4cXAy?=
 =?utf-8?B?Q001eENNa0dObU8xM3BCRjYzTGR1dVV6eWlaNDJxbDdPWG9jd1BuNlhhekVR?=
 =?utf-8?B?WndTS3F6Ykd3bnVOcGRGUzJULy90U0ZpbGF3L1dXaStpQWJrMmRQeVgzU0RO?=
 =?utf-8?B?bmlFZnhxM1k0Q2JnczR4eUdyeVZJVUVYMEY3dExsc3dkVWljdFY3U1YvYkZp?=
 =?utf-8?B?dklodHpySGJYZXlELzM0UDIxQlAzRk1QUXo2NlgzRkg4UHRhWG8vUWh2cHc5?=
 =?utf-8?B?QUdWUDdnbThYYUVKd1BIc2JRT1lqK3pzQmlQZTZZNTJKU3p3ZlJkZ1VXMTlE?=
 =?utf-8?B?OFRPaFVTajVkaW5mZHhGT0RSTmJodzdpZ0lqNDBwenBtYjF5WXVjOTFYUzFF?=
 =?utf-8?B?VHdLUjVMVVdiZ1VKRnJPZ3BrMTJlNWE3ZGtSYldTSmtJMTAxYlNWUThBbjZL?=
 =?utf-8?B?Qld5UzJxUG9acjdNR3JKbzdzOU5zVmdKbDk2M251ajhIaXRucjFYS1p1aWp6?=
 =?utf-8?Q?z4o6iZz/24E0KLR3gJ8jTR7ymbtOifCARcI8mxQf52ahE?=
X-MS-Exchange-AntiSpam-MessageData-1: KyGFv0dXBpwbFQ==
X-Exchange-RoutingPolicyChecked: WznelnsGpYQeaiY5MTJTGDH3gLuZeq6Kq9hnYqkqXyQMzhH2TKHmLVRS0GZZqyxUIFEXrohmO0XNUz9M55BF9j6tXArvxflh+wj8XMYpghO+MADBXn1vz9AknD8VErnhtkngYpNo1Tz/+MUCFXfxtY5v4W4OOO9KU9+dWlz1e6zhQ4kZLG6lwOwA8+UInTjkjLtFOZCnVeEt0hbz6DM02hilTdzt2B2pVjwxhzi7ctyll4UOLVMfjz5maLdVEzQrQVZHZOz15XRhMP7HVcpsVWG6V/U9oq1k+uSPRJ+DgNoU7PQ4TbSHyq4viq3S1cx4BPkhB704Wh1QuSclAHg8NA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bca9d9-a2f3-4fc3-5ae5-08df31159b89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:54:58.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VCzP5TfDx92NEX32h51s6L6YhnljQuogUtllCvtOQe+B4e6LJ+hus6fs+eOueyqogGgS6/WPN8pLQUC9oWY80lVvmkUTa9YmssM4392iKLY3E/2Pzjrpv1XmNeIFQQY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/2026 2:31 PM, Manna, Animesh wrote:
>
>> -----Original Message-----
>> From: Dibin Moolakadan Subrahmanian
>> <dibin.moolakadan.subrahmanian@intel.com>
>> Sent: Friday, October 23, 2026 10:49 AM
>> To: Manna, Animesh <animesh.manna@intel.com>; intel-
>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Nikula, Jani <jani.nikula@intel.com>; Shankar, Uma
>> <uma.shankar@intel.com>
>> Subject: Re: [PATCH v2] drm/i915/cmtg: Disable CMTG after encoder disable in
>> hsw_crtc_disable()
>>
>> On 10/22/2026 12:35 AM, Animesh Manna wrote:
>>> hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
>>> sequence, before intel_encoders_disable(). With this ordering, the
>>> wait for CMTG_STATE to clear after CMTG_ENABLE is cleared
>>> intermittently times out:
>>>
>>>     xe 0000:00:02.0: [drm] CMTG: A disable timeout
>>>     WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205
>>> intel_cmtg_disable+0x331/0x3d0 [xe]
>>>
>>> This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
>>> disables and re-enables the eDP across modesets and suspend/resume.
>>>
>>> Move the CMTG disable after intel_encoders_disable(), so the eDP-side
>>> teardown (panel unprepare, ALPM disable, backlight off) has completed,
>>> but keep it before intel_encoders_post_disable() and
>>> intel_dpll_disable(). The transcoder timing generator, DDI buffer and
>>> port PLL are therefore still running while CMTG_STATE is polled, and
>>> the requirement to disable CMTG before the transcoder and the port PLL
>>> feeding it are turned off is preserved.
>>>
>>> v2:
>>> - Modify commit description regarding PSR exit. [Dibin]
>>> - Add fixes tag. [Jani, Dibin]
>>>
>>> Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable
>>> cmtg")
>>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
>>>    1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>>> b/drivers/gpu/drm/i915/display/intel_display.c
>>> index 7602f633f49d..1c42aa477f3b 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>> @@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct
>> intel_atomic_state *state,
>>>    		intel_atomic_get_old_crtc_state(state, crtc);
>>>    	struct intel_crtc *pipe_crtc;
>>>
>>> -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
>>> -		intel_cmtg_set_clk_select(old_crtc_state);
>>> -		intel_cmtg_disable(old_crtc_state);
>>> -	}
>>>    	/*
>>>    	 * FIXME collapse everything to one hook.
>>>    	 * Need care with mst->ddi interactions.
>>>    	 */
>>>    	intel_encoders_disable(state, crtc);
>>> +
>>> +	/*
>>> +	 * Disable CMTG after the encoders are disabled, but before the
>>> +	 * transcoder and port PLL are torn down in
>>> +	 * intel_encoders_post_disable()/intel_dpll_disable().
>>> +	 */
>>> +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
>>> +		intel_cmtg_set_clk_select(old_crtc_state);
>>> +		intel_cmtg_disable(old_crtc_state);
>>> +	}
>>> +
>>>    	intel_encoders_post_disable(state, crtc);
>>>
>>>    	intel_dpll_disable(old_crtc_state);
>> Nit: Since the issue is hard to reproduce and the exact cause is not confirmed,
>> you could mention that moving the CMTG disable later avoids the timeout in
>> testing, but the exact reason is unknown. Not a blocker.
> Yes already tried to explain in commit description through - " Move the CMTG disable after intel_encoders_disable(), so the eDP-side teardown (panel unprepare, ALPM disable, backlight off) has completed "
> Here extra delay is helping.
>
>> Please add a `Closes:` tag for the `igt@kms_hdr@bpc-switch-suspend` failure,
>> if applicable.
> AFAIK currently 'Closes:' tag is used only for gitlab issue not for the issues raised in internal validation.
>
>> v2 was sent as a new thread with a different subject.
> As subject line is changed so patchwork created to different thread. Next time onwards in-reply-to maybe the correct approach, will try in future.
>
>> Please add a link to v1 below the `---` line so the review history can be traced.
>>
>   
> v1: Initial version is implicit for all patches so dropping it.
>
>
>> In the original series: https://patchwork.freedesktop.org/series/171766/,
>> Jani asked about Cc: stable. Please clarify whether this patch is applicable for
>> stable.
> Yeah, my plan is to copy stable later after few days of merge in drm-tip. Just to avoid unnecessary backport if the issue is coming again.
>
>> With the above addressed, LGTM.
> Please let me know for any further clarification/suggestion.

A link to v1 would have been helpful for readability and to make it easier
to follow the previous review discussion, since v2 was sent as a new thread with a different subject.

I'll leave the Fixes: and Cc: stable decisions to Jani.
No further comments from me.

Regards,
Dibin

> Regards,
> Animesh
>

