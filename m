Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA4606BD76
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eaBHLdl4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC6410E2E4;
	Tue, 10 Nov 2026 06:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C533610E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794292890; x=1825828890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=St3jf8+2EZe95mp9dOeZoVWiBJ/KFfV6WrZcTBUSnnA=;
 b=eaBHLdl4lLORP7AYtvXCPULWGOHHA285vwWoJ+P52S/PchmbU2JUcSNO
 Z/+EOcKztBFSo72FoZuuQMwWZMDwmnb+PaFP9XoqNWvrpp1amr94JXDTK
 6cqeZMpScioKBz8MlThL6tedPJTrMyh5wkOMkhiKBGwKYPUN55mvoQlpf
 5jlm03FP8s+FcuLgajtiOKCENzdSnsd3SzJ2iyEp9uV7TKeNpCD3TZHOp
 d8z9/Jgwtpp12VssllYjMkwjeLfpR6V96SsTpCpNV4Rtl+5RVRgtMuGqK
 MkS1lR3uQqGHx5yn5Zs9tLTzh8yByAILNZHBuLDTRNjA2EeWHkOIe7BaU Q==;
X-CSE-ConnectionGUID: nDByQJjYTI2r63VJpLPb5g==
X-CSE-MsgGUID: W43dJpOgSeW6qu7RGK1XxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2898875"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2898875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:41:29 -0800
X-CSE-ConnectionGUID: +Rj5kmpcR22kxMpt4i28HA==
X-CSE-MsgGUID: POrBno3xQtSVGd6Yp4DZ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7948392"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:41:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:41:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 22:41:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:41:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmU8nhSwWPkxE7cBeH2O+5e07qSoHQCpeJ1Y27fjD36jO6c/WMlnjznYB3U3y/RlIPHsEsFJvrUvaHkK8n0PNVweXb4Id+swXbrUurcxH5gYIiWZkazvcxW4cNSEAIfn8iGdG5M3olmHLrMiavO6hGE89R66shrdyD6w5CpZ+w31NUzoJ37R7bB8IAV6M/6JMpMMsV/gS7O5rTyXBQoBqAvqomXSSLTK3xghyvDxDLP7XbcrJwhAok6KSw2LdUTwQc6W7zomDH3n7bUPW39gA2om3c3wi1PPjDBbZhSngNSWoufrTHy7gWLZZGtTujKGduoCdwbpbr74c0sYwfroeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJ9q0Q73wuP7WRJIGuugZ5gQ+5kbfZEZgJLFhIewtR0=;
 b=fGQts29xbMgyIccdhH5D5hTeiNDkmjOzGN1IDYsKQxuryxXNHjvkD+M+JJ5GL5hOvveCGynqIBTCx1Arf0Le9yPa0Yz61FLtuEugDNxZJ7zHta5zFVdzxQZYEpsLOinnMEhGDGJX6WCQ0RsQWioRPifjF0mFzyC/9adRmN469zyIcca/yEGMYsYcNQvXGhQ+yjrb/CnN3aZlVcRMogp7tgXyUjAsPujh36rnkkWaFeJw2FRad159vOWYYYo7uKDFr6qNCGcsfEiKDKiDx1XII1yIY89/X5PbmXLxugVC6ptg6XCJElhRSUc2duFQyS+Ng2D6Y3kKUF0ahgcHRg6Gaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7844.namprd11.prod.outlook.com (2603:10b6:610:12a::17)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 06:41:25 +0000
Received: from CH3PR11MB7844.namprd11.prod.outlook.com
 ([fe80::1b09:28f3:5090:3380]) by CH3PR11MB7844.namprd11.prod.outlook.com
 ([fe80::1b09:28f3:5090:3380%3]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 06:41:25 +0000
Message-ID: <a929039b-6898-493b-9848-32499b99387b@intel.com>
Date: Tue, 10 Nov 2026 12:11:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/xe: Add support for wa_14028434957
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-17-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261106071944.2693854-17-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::18) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7844:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb45cc8-8a8f-4d01-040b-08df3ef5a37e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|11063799006|260925022911599003|56012099006|260925021911599003|260925021311599003|261026140227099003|261009221227099003|261028144727099003|261009223027099003|261009220027099003|261102123227099003|261009221727099003|261009223327099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261022113327099003|261026121527099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: exM2X5+caxqR/RmyHEJXmbETHR47BGqClfAEdmcT9DrzTyLhRQCBqsO2zzOgsbbJulP6a4Zl7LJHxDtiHLA9/VN28p6+w4THJ/rIICzRKULUB1iGmz9xIyfVrziu3ikfeBuS5iGM36cXshJRU0g3JfELxBtPUPmmBwFj0n5zP6Ac8A7BesIFIhxXA/2kYHVAQgCgP0iGFSWKgF6oP862vn8UBDyCZ5tvU4XLvbHt/BhvNJ+tZPs7Ix4R7V90burlNIkhBFGKy0pFU8GsjSPFnnyP8dpAVLyknnQlBqVwoBJjCN5UcOUXZ65CQU1PwRbjoW4sfJWOOS4uUvTo0Qq/GB8v5D8p2i/RYJRiJy099o6Lg6JwKHuynw0U/cZzg8NgBpjw8EenNz4VLSBexxWjrq3dAoWIoPojBwbl5kmK8Pu7mSPwbJD7hExnJSLlHFSmrN1HtkH9OjiKvjqnlfj8QbNkI22iDzP+Hs4fd286CwLzeNvbKI0TYQOQyg1ckA8Z49JOlkkYamzh5W1l1r2uEmbnsImrbCpScJBW8FVBVPXM0g2Q1xIBNtBQ6tvXLTIVrvr5x2fklwqU228sjXPqQJ3M7yTUT8CPimmc5jWZclRb2ocx9LrTEtuJa/STeNoBPykDHsFJNXjgMpriIMccMOCUUt6/XI4PwfflzeQal6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(260925022911599003)(56012099006)(260925021911599003)(260925021311599003)(261026140227099003)(261009221227099003)(261028144727099003)(261009223027099003)(261009220027099003)(261102123227099003)(261009221727099003)(261009223327099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261022113327099003)(261026121527099003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STlCUEJEVGVDdGpiRHBlcFo3RXMzRkIvVm1JNzAwUXJOTnVUeHF5TjhhTmxi?=
 =?utf-8?B?U2lNcTlUeVdZcnVpUjNoQTM3MHluNDVNRmdQbDhLaTBUejJHL01hVUpLYjhU?=
 =?utf-8?B?VzFnN0ZuT1JZbS9WakVPUnpNa3hodmIyMXl4c0JMS0dmWitYSHl4T2VQRllD?=
 =?utf-8?B?UGQ3YVRjdWJGRW5ycTJ2S3RoQTB2dGxneE9yNWF1MndaL0xUS3hsUFZYbTRm?=
 =?utf-8?B?ME5Sa3ZzK2lrY1QxdjE4WUxtWVRQWURuRTdiMGpQcld2MWw4ZTZta3Y4ZWl4?=
 =?utf-8?B?TksyTmk0Y0VSRTc3VDhuZFVIY05meUV1bmRHM09kZG9ZUi9vYlUrd0J1cFpp?=
 =?utf-8?B?KzM1cHlEWjBqQWhoV20yK3ZlQXR2RzhqU25uYXpkZm1uc3J0RmxUYkpLeHBO?=
 =?utf-8?B?UUU5aVNyb1RpWnk3VGxHTFZiMnhVa3Fhb1hIS2kzUG1NUElUTTdXUmVuUGI1?=
 =?utf-8?B?TWZ3enFSNk8xVFFKTXRVV09qcTdVdVordXQ4aWNJRTU3ZERpNVB3TzNreUsx?=
 =?utf-8?B?NFA4R1ZSUHJTU1R0R1ZhSUhTeTlyRHVRQ051N2t4d1B2MXcvTG9Wd25tSnhE?=
 =?utf-8?B?ZjBQRHRMMlh0dVhhV0h4bEhvQWFTNXEwSTRUY2VmcW9sVDJPR2RRNTBWS2Vr?=
 =?utf-8?B?MzI0bmpPTkR3cEptMU05aUFaTnNlTmw1a2hIbDVidlJqdzEyRElQWkJ5RmVU?=
 =?utf-8?B?SU1CY0tWNWhTdzZ3QTVxTXdHTmRCdUxjUlBJUXVGMjVFWmYyalFuNWdEV3ZJ?=
 =?utf-8?B?VU1jL1Fua091Y3poTStrRTBMa0FKTlBUYm5nS21BbWFvWC9va0RUS01GTnNP?=
 =?utf-8?B?YzdnclI5Tlo5aUF6YUFQYlB4RG9mSUxNNDZPU3hJOWkzZHJxTmdaZitpZ0ZM?=
 =?utf-8?B?YVZTRDZIbk15Ri9pK3psem5GSHdFRnNJYjQ3L28vUUFvczZndllPdFowMDYv?=
 =?utf-8?B?NlA0VHEyMDY0aVRJTk1xeUkvaWJPV0NacFMzTkR2NFRyTjBVZmJHeWJDcTI0?=
 =?utf-8?B?UWZoOC82NFRLK0IvVEtUYkQvaTMvZ0xpZWg3bXloRjlMZ0J3S2xDSU95TWpj?=
 =?utf-8?B?ekZyNUkvM0NhQVpRSFRDSHBmTnBmTUhFWU5jdEdxZ3BvdFhJcnhqU2V4WVlV?=
 =?utf-8?B?WGVyT3ZocUI5NnA5RUlLNXo4c2Rucm81N1FpMnQ4RGtSUDRiUDRxRGFYY2tj?=
 =?utf-8?B?UW9HaXBhTVpOb3JZYW5CaUNTRjFHcUhBbVlFcGwxMGd1d2dSRmZBWGE5MWhF?=
 =?utf-8?B?cWNYTmZnSUF1QjNGMFhOZjNLMWZZSUs2emdyRjVpbWdxT2FjT1o2OE5UTG9y?=
 =?utf-8?B?MlBhMTFWOFpETVpDYWRwUkFUeWJJSXNETWgzajNZeXNOeHQxUkxnaDFMVG9C?=
 =?utf-8?B?VWR5blRuS25XSkM0N0Z0MkhZa1o5bWpabGtzK25pSzN1ZVJtajhBc1R1NnZD?=
 =?utf-8?B?M214REtrUUNtaXhxNWxWNFVWc1BxZU5sSllERDkvakxUUDdVNTJka3R5djht?=
 =?utf-8?B?THZHL2xzMDArMm52TkhBY2tadXpMQ09QR2tqakxpNzRtTXQxQ2F0Q0ExRSty?=
 =?utf-8?B?SzBmQ0lCaWNLZkZXRzBQbUZOcFpub29WcytxRFlseGJXOUZ5NS9RUW90QjZy?=
 =?utf-8?B?T2lKejkyZ3Rzcjhoa0V1bEpYb25zN3c1WUorbFdxdEZOQkF4VTY5SDhGZUc5?=
 =?utf-8?B?Q3hIVUlkU1JZczZwdzE1UWZLYWt3UUhoY0psalVxMTF6bWFuTk5nZnh2dWNy?=
 =?utf-8?B?NUVVTE1zRnZSY0xHNmNMaUFQcjNvc1ozZ25jMWJNSWwyVmtxMUU2WGVoV2FP?=
 =?utf-8?B?KzBVOGhOd0l5YW5XR1Y4SWlYZHNsdCtoWVFpMW9LTmw4a1JPOWI5YWNjcXRV?=
 =?utf-8?B?V2gyQUxJblNTUDd6bVZwWURkZ0NnZS83WGxGMHFRVVEzejZnSmFZalhBZVdO?=
 =?utf-8?B?a0pIcWkzQzJLSGVrME9JdTJ2N2RwcnhpZ2d1ejNPUWFZUGVMdzVNK2wrZDI0?=
 =?utf-8?B?bWZJL3FoU0JzaXExekxodG5Zajg2OGhtN05jRTU2b3JZSDhWeEcrOUZXTGgy?=
 =?utf-8?B?Ym45ZmFDODFLSXhlRHgwbEJOZXRFbWFjUUpwT1VZK0lhOFNHTnczdng0eXhU?=
 =?utf-8?B?RWR0L0hHL3VQdVFBWkt3eFhiMnVldWxsS2hkakMxSFVsTC9SNjRTaHpKZSs3?=
 =?utf-8?B?cS9ZUzJQSTl6VFZ2VFpoUWZnNU1WUGI3bTVJRTJzMHdFUmx3U2RnbU14NmpF?=
 =?utf-8?B?cUhseVNEM3Bpa0NLdzJlTTZqSFlTT3BqQ2UwZEpYYy8zbkFVcDZTLzV5Qnhz?=
 =?utf-8?B?aVE5ZUJodzhHaGlKNXFwcERObUIrai9ndkZoeDZuOFlzd1M1d0dGRldNUEdO?=
 =?utf-8?Q?GjDgtH5eH2pqvi54=3D?=
X-Exchange-RoutingPolicyChecked: X6xj7VA/+R/K5O42TB2/6AoFwZ01l1y8lJimzaBwOtp2cTO3fW6T9U0Bd21DCFq6T2CeiWp8GA9fstP9dVsq4mjfIjj4x2xJDVYO8tuPEdWlr7t9BPAIxB1Ry5dJDa2SYZ812J/nPxCYhJtoQ8CVaGHmgAggDAHTpcamye3yNI4ko2KF7rvldzTkFi/6HtdLJk/8A+6Nl62p4H7jX2yrzfNJX5SbzfCSYSu1GROyEqWJI8AKVK3ES4Dy3O/IVFftoKxpMq3UzlPCgZmT890DhLEtz1+QrHnnmOsVjj+VsAhSxJk6lPZNQUAjSPe80w9ecfaOVA/MfhXu1h6WzUqJ0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb45cc8-8a8f-4d01-040b-08df3ef5a37e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:41:24.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ffk8zfmFuSiVz57l1HfXMuKmkYiciQHZqyHOFlyW1eiDWslnvYN4WGlQsxXEz7Ysq/oJKsdp0LygsPQi3gP1abK97gNfQQYcGHPjelHI68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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


On 06-11-2026 12:49 pm, Riana Tauro wrote:
> Add support for wa_14028434957 on platform CRI.
>
> Non-fatal device errors are reported via a direct IRQ, while fatal
> device errors are downgraded to non-fatal uncorrectable internal
> errors and reported via AER.
>
> Add support to process and log non-fatal errors routed via the direct
> IRQ path. Most non-fatal errors require no reset, except double-bit
> ECC errors affecting a critical BO, for which the device is wedged
> with a bus reset as the recovery action.
>
> For uncorrectable internal errors reported via AER, request a
> secondary bus reset to recover. To avoid a race between the two
> paths, if non-fatal error processing is in progress when an
> uncorrectable internal error occurs, flush and disable the worker
> to prevent further processing, since a reset is
> imminent.
>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: use platform instead of graphics version (Gustavo)
>      combine patches (Tejas, Mallesh)
>      remove 1sec delayed worker (Andi)
>
> v3: re-order disable hw error worker before wedged check (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>   drivers/gpu/drm/xe/xe_hw_error.c          | 41 +++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_hw_error.h          |  1 +
>   drivers/gpu/drm/xe/xe_pci_error.c         | 19 +++++++++--
>   drivers/gpu/drm/xe/xe_ras.c               | 21 ++++++++++--
>   5 files changed, 72 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 753b2a4a1006..300207596893 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -7,3 +7,4 @@
>   14026746987	PLATFORM(CRESCENTISLAND)
>   14026779378	PLATFORM(CRESCENTISLAND)
>   14028586678	PLATFORM(CRESCENTISLAND)
> +14028434957	PLATFORM(CRESCENTISLAND)
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index f7031b341ce0..86b29f282837 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/bitmap.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
>   #include "regs/xe_irq_regs.h"
> @@ -15,7 +17,11 @@
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
> +#include "xe_ras.h"
>   #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
> +#include "xe_wedge.h"
> +
>   
>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>   #define HEC_UNCORR_FW_ERR_BITS			4
> @@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   
> +	/* Skip hw error processing if device is already wedged */
> +	if (xe_wedged(xe))
> +		return;
> +
>   	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> +		/*
> +		 * Skip handling if an uncorrectable internal error is reported as
> +		 * reset is imminent
> +		 */
> +		if (xe_ras_is_aer_internal_error(xe))
> +			return;
> +
> +		xe_ras_process_errors(xe);
> +		return;
> +	}
> +
>   	xe_survivability_mode_runtime_enable(xe);
>   }
>   
> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   		return;
>   
>   	/*
> -	 * Hardware errors are reported through System Controller on the platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
> -	 * here for those platforms.
> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
> +	 * system controller.
>   	 */
>   	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
> +		schedule_work(&tile->hw_error_work);
>   		return;
>   	}
>   
> @@ -537,7 +560,13 @@ static void process_hw_errors(struct xe_device *xe)
>   	}
>   }
>   
> -static void hw_error_fini(void *arg)
> +/**
> + * xe_hw_error_work_disable - Disable hw error work
> + * @arg: xe device instance
> + *
> + * This function disables work for hardware error handling for all tiles.
> + */
> +void xe_hw_error_work_disable(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   	struct xe_tile *tile;
> @@ -569,5 +598,5 @@ void xe_hw_error_init(struct xe_device *xe)
>   		INIT_WORK(&tile->hw_error_work, hw_error_work);
>   
>   	process_hw_errors(xe);
> -	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 5e3a11424108..c2c0bfa6d9f9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -12,4 +12,5 @@ struct xe_device;
>   
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>   void xe_hw_error_init(struct xe_device *xe);
> +void xe_hw_error_work_disable(void *arg);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 472b85d0ccc3..67920751ecf1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -5,8 +5,11 @@
>   
>   #include <linux/pci.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_hw_error.h"
>   #include "xe_log.h"
>   #include "xe_pci.h"
>   #include "xe_pcode.h"
> @@ -14,6 +17,7 @@
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>   #include "xe_wedge.h"
>   
>   static void prepare_device_for_reset(struct pci_dev *pdev)
> @@ -87,12 +91,21 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	if (state == pci_channel_io_perm_failure)
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> -	/* If the device is already wedged or in survivability mode, do not attempt recovery */
> -	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
> +	/* If the device is already in survivability mode, do not attempt recovery */
> +	if (xe_survivability_mode_is_boot_enabled(xe))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> -	if (is_aer_internal_error(pdev))
> +	/*
> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>   		xe_ras_set_aer_internal_error(xe);
> +		xe_hw_error_work_disable(xe);
> +	}
> +
> +	if (xe_wedged(xe))
> +		return PCI_ERS_RESULT_DISCONNECT;
>   
>   	switch (state) {
>   	case pci_channel_io_normal:
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 58a0b5fa676d..1809c3c893de 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/bitfield.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "xe_assert.h"
>   #include "xe_bo.h"
>   #include "xe_configfs.h"
> @@ -23,6 +25,7 @@
>   #include "xe_sysctrl_mailbox.h"
>   #include "xe_sysctrl_mailbox_types.h"
>   #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
>   #include "xe_wedge.h"
>   
>   /* Any non-null entry marks the page as offlined by firmware */
> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>   			    "Double-bit ECC error detected at sw address 0x%llx\n",
>   			    info->sw_address);
> -		if (ret)
> +		/*
> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
> +		 * TODO: Trigger SBR using pci_reset_bus
> +		 */
> +		if (ret) {
> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>   			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
>   		break;
>   	default:
>   		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> @@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
> -	/* Default action */
> +	/* Default action for PCIe bus errors */
>   	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
> +	/*
> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
> +	 * internal error. Set the default action to reset.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>   				  NULL, 0, &response, sizeof(response));
>   
