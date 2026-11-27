Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E540606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WownSNyt;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Wwa4RwHm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B110E9B4;
	Fri, 27 Nov 2026 05:55:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C012510E9E2;
 Fri, 27 Nov 2026 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795758946; x=1827294946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PoBBjV2VEGNcXRCh8MaiLjxHitWAjSxJ8sAxWufpmtE=;
 b=WownSNytEcpWkP9YeuHueONh7KJ1F+Htnt1boqEmxr+f3IDf+iWQZN+F
 Zshbdd3HOGV+GeoKsSBihtMqJQWeqkcyZLi2kumghJn4p6apxdOqNjKHY
 ZWmE5QF/RSFvTbiNiqfAEV5Cm6NTHdoNOZKq50565ONRTwBo+GbVZXtkn
 Rqc+1BH9pzVhf/gS3PIBsTOnb/0TINLGotCuYmWSG25cVkNRdjUj7gPgH
 a8QduthKBoVRUICkZwLxsa4U7bdELGSvkis2RZon5fp5N9/cMPDwre19d
 4ojyhTsmIt92Sy6gVF2EjfbihIJAGi9PBUT7c5H9FUPIyMtDkhVpqUSjs Q==;
X-CSE-ConnectionGUID: g1/PmWtPQPq5QxZLq9cnUQ==
X-CSE-MsgGUID: CYlP+I7oRN+uMLIQ1dy8jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4571690"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4571690"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:55:45 -0800
X-CSE-ConnectionGUID: wQsgihahS+O6Gxj0WitGgQ==
X-CSE-MsgGUID: csljTioaSHWMBd9FhLBqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12471974"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:55:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:55:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:55:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1s2x53y3StaaZsp8sni69B0dTD1HaGoAAAvaox2+Jx7woye5fhAio+aPKvi7lmuDUPSUrwOtpGNulG84rKLIJeonwstN/VCTF5MoI4+dgDStisbprJ51xbgiTcfwZ8zihBk4D4RyVf/iMU4h0A7QOndbZj+bg7Ot0tmwCtgZ4QUr7EdbyfQfjKzXIUQsQ9KjKSSWhkWYYWjNWO5UpB1R5KqXRdPDz0WlU7/rkU4vvdzd087MmOglz0gn0lTLbTIF4W1JfoT3zD1hpMujlqr7mKEaSnCLWeCDM3wXhBa0yazZ26yHxw1hk4NQNPWzdXco1IPTb8YolvZ8WzCzcp+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFPvWgJdvWFb8Y7T6Ndl72cebjBxRbksGz/sKsuBWR8=;
 b=Hjj5ftuozeT9w6cc38kJqTsDYu0BobnG9FHYC5rHHJWe7sSLaRtZhG8N2soYhSXZQRXClb1x/pkafppfJu6kD7fRG853mwLdKqjyR4UouJI8JeWfKPEthhbBWsil9vn2TkvXPoDYmj7l7afBN0Ki6a8SolZBuCx4iLsiczz9+1wGKrSSZRWwoowruIlRHs4n7GWiBdpfjEuPSbAZXjHp7FjdJLeehixcOAFBRl6VBsUCTaoRy7m88s9Tef6e8unNqtDw8ubxbi0wlesoqckLRZgF9SaQHJtwxXboIUDfR6gcZXkb3BHH+mMewcaQJ3Ju31SxrVhUBrrcUPdPiVnp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFPvWgJdvWFb8Y7T6Ndl72cebjBxRbksGz/sKsuBWR8=;
 b=Wwa4RwHmDWZxSuzMXzMZosM+AqSxICCc00TO6EqMT2apozDjM/McdqFxg9sUE0YeqwLzo7sMNiOJL4bNCMTGb+DkQJx9CMPOmfUH3dJ+GxZEXrHqfPfKzt9ja4FAv4O7PTy4SsrpfBNqxO+3yJSE5Yva3sdkQzrN3r25j5RFm/E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:55:40 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:55:40 +0000
Message-ID: <e11683a1-27cb-4d3e-8c09-97fded87f68d@intel.com>
Date: Fri, 27 Nov 2026 11:25:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] drm/i915/vrr: Reuse vrr_vblank_start() in more
 places
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0237.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::17) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a231b1-349f-4dbe-d358-08df4c4b10fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nCFrVOB5aV226xQSrnDuv7y/yp6Y9araBRWHvbVKHIaP96BKboh3TSElRQ3Ea1zvm6e+f5zn8oFVP4X0SbFjd/Xk3cqJybilPEbTZLdJ8WLYvth8Na2ZjFdAOf57raleYcR+T2qk6YOaF55vu9DQ5CWACVyIILR1zCSinKghXxmqkbkYvuEmDWHwag7lJrEqxsPzm14Zd+ggJhmA6D1DYeFMGGSiZ2RY1VnFJR0vU+V/iUS6j4nJPZqVzz7H9gXEriUr/qUpsean2pCAO1x4Cj/bk0dDP2ZFA6kAztAjXAWb1swop/vtcsm2AvKutDoHFT4LdO15Pb8hrbvE8U0ryVZ5d4EXOO09XY8ehOd/+CD5el5yB3qyJqAVm0SNk3qSc6QhZ9AJxv7VZbjNu2ff9jqrqInVVUAnLx7xjBZ10ZF4VLdJCcbzoQ8Jy6BslBFVM4+9mvUj5tK06gYl4hhmgkvg6z9osFcBQr6TF/H+TQEoUCvFb1AnS65AGOH8q77wSnFmQnVemrYsHyPso8jzUTbsTQI/lyU4nU4FGz60ZyVmMrUsRUR4jn34COYZF6qkxux97JmbsDk+szS7RIUGzCfqvGXuyCqFUQ0H/7I7P85oDND29MImPm3rQAQyd5CBdudXCE5vQQj4gVrI6cc0+mcDEhSs/10WvO6waqzOxQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymw0UDhDS0tVVFBCTzBmYkhHRCt5aGZuZVV5bit2WnliYUkwYUFqOThjSW1I?=
 =?utf-8?B?aUlMajk2TU96VVljZE9rNkdEV1h0cEpiYmxmQ2lHNTU5MkJkTTU4OU45RTl5?=
 =?utf-8?B?R21keWJMbXpiT2RUQmRjV0hGV1FWMDV6MjZPeGlQYnhteU1FaWVnRUpIMTZD?=
 =?utf-8?B?SmkySVpmZU9HRGpxbXJUTGlhcHFlVjQyNlQrY0g0RmMrZGV1dkNhekNWYnc1?=
 =?utf-8?B?QkZVRUlNTmUrbyt5YmRpeE14TVp0QzRIMjRIU2tHVVR1cG5USzdEUG9jbGxn?=
 =?utf-8?B?ZHJWT2FBbDhOR2xoV0NlRUt3WXZIMHFYZFNRY3BYMy9HRzhHa3grRCt3Mk4x?=
 =?utf-8?B?cGJBaExnOGowVlA0bTFLbHZpSHBnTDhxdWlJU2NTcmVPbUVaWFpZeXQza002?=
 =?utf-8?B?M211SUFKSHZxb0Q2RVp6dll2dUMrOWQrUm9PYnZ1NXdBWnlHcTl2d3FSSElt?=
 =?utf-8?B?Wmp4WnVOcWZKRlQwMkF3U042RS9KaGJUMTBVb1RXRUVSaWw5RjdXcHlTTExO?=
 =?utf-8?B?VXE4aVF0dDZCbkhpcjZNbmRhV3I3T1hmQ0tid0VqMzQ4bkhlKy9vaEtWQ080?=
 =?utf-8?B?d3FWMGtWNkdtTFFOYWgzWUNzckJkQVAxWU1TdDB5cUF1Y09WSWVvbTA5OTJK?=
 =?utf-8?B?b29memxrOTVQeENwRTBRYVlQM1hjSWlaYmdFNWtQd2NVRTBrRWU1Tk8wT1dF?=
 =?utf-8?B?L1BDelBlNjJOMFQ5SW5YVXNkK3djY3RkdHAwYTB0cEFwUTlkTGJpcWkrN3ZE?=
 =?utf-8?B?M1F6RkNMelVVSGJlK3JTbHVmaUNRY0ZLdkJVM2JiTDdSb0ZaQnZEZExXa2Vl?=
 =?utf-8?B?bmdYRVJ2bDBvWDV2ZnlzVkREWTFSWUZuRjgxbVBPNDJNcWZBT29xZzQyNEYw?=
 =?utf-8?B?N1VJVkxlUnBZbzJBUlhYZ0x0eVp1dFArV2ptSHVqY3pidlBoNFJWcDlKa3pB?=
 =?utf-8?B?MkxjZ1VaWmUrTW1nR2V4VGd5eVRiTFhkYS9pdG1nekNBMFF2TlZTWTNvNlEz?=
 =?utf-8?B?QUZicVBSSlRrR2VDcFRkUVpySC9NY25BamJmTE92UFJxeDRnem9RdnZyVjJ6?=
 =?utf-8?B?RDJIdVlVcVl3N21TSWpUaFpHSVBINGxZdEx6d1BQQ0g0amdoMFIvSE9TOWhR?=
 =?utf-8?B?ekdVZTNvV1BndlY2c2hOcEFRaXVOR0FhNEtaV1RSalQrM1o3VnlKcEhKUDRk?=
 =?utf-8?B?OXMvMkJhM1kvV2w3WGFiY29LRlZJdm55MGpURW1LMGVwM05MdkdoYzVsc2JY?=
 =?utf-8?B?MlZ5a3FBWTZPVzdhc3pOaURXMm5rOXN6OHFQbjB2Wko2WkFudHRRMDZmS1k4?=
 =?utf-8?B?QVNHSEExRFZ2TUxoZVFaSE41eWdBMjhSWGpNeU1lSndkYTREdjJBYVlIcWdD?=
 =?utf-8?B?M1RsV2hOQlY1MUMyZUpQekErUUtRMXdZTTJRTnRyWFRkSWdQT1Jta051SUZu?=
 =?utf-8?B?Z29rY0tWRWIzV3pCanpDSzF2RkxodjkxR21MZ1paL2drOWY0THl5VVNoSDQ5?=
 =?utf-8?B?K1FwbEhnZ2E1Mjg4bXlCTXBwV1M1OGNiTGVwRENjc0pwLzU0Z3lRVlVLcGcw?=
 =?utf-8?B?ZDdscTdSOEVPSnhxdUlsdkRwVUJ6NGxvTzlhUlZ4NlNGeUNTQW5NYzR3aDUv?=
 =?utf-8?B?cXpjTThLVEgwT0ZkUTI0U1VuOGJERDZMVHltMHdSanJtMEUxZEZTN2V1RWRC?=
 =?utf-8?B?WlpaWDhFaTM4bWJLSTd0MHFtVnNFVHlzSUo1SzNsQjZsNUh6UGZZbnJTL3Nj?=
 =?utf-8?B?eWxtV3NIMTVFWGlrQ3JTYmtrQ0hReUNBVjZ3OFJOdUhNejdNMHlSNnBKTXNu?=
 =?utf-8?B?MGFpQlZjS0FPR3o0Wms5cGY4QjhSU2lSSU1Ja1ZqaWd5d005TUNRelJHMkU2?=
 =?utf-8?B?WGtZLytXVitWLzFhUkI1SnJXMkVBZ0Z4dXdSdlNCancxbVg1Z3hTWFNLQWdI?=
 =?utf-8?B?NklPRjZUc2JVZW1BaytVdW9taDFRcCtzVGsvMFJUQzVqbElQYmdidmtYdWw3?=
 =?utf-8?B?WkRIMUw1UlJ4OHRQdExBSFlsVi8wNXBwbEE3dkcwbmtxRjlSUUEyQk9QRmxC?=
 =?utf-8?B?ODA3Sm44VVNtQVZXQmpDWS9WMWdjQ3pjVlJBYmNJd1VHbnhzU2ozYVZwRHYy?=
 =?utf-8?B?aElTOEdBWVhjbVEyYWVZUVBTSG1saXRBSVVOdmY2WitHZzdlcE5WbVhzM0pu?=
 =?utf-8?B?UHdFS1ZSTmNxTDNBMTJQN0JDSytzcmRtUE9ibUVYV3dTWG9EOC94bVpkMytZ?=
 =?utf-8?B?anlwQXFFQnIxQ0JoZzZ4M3BtSnR1all3K1RLbWthdllManM5aG9IUnUzenpB?=
 =?utf-8?B?NmZYNklSUUFPYU96QTdZVUtCVEZnRkhhUjcvaTZCS2Q0TStONkhyS1J0WVky?=
 =?utf-8?Q?8cX0PbGy7x5mS548=3D?=
X-Exchange-RoutingPolicyChecked: WzeNYlEMdpaErHm1aT4AAXTrdAJuSlGZMInH5un+ljs2cE2A8S/4r06+VCsDmG+KFmVMnFCj6BQ8tPPPJNyck4FPQWcu8qQeD9dG1ym001TZjgFFTB0pX3BD5EC5qp8ai7aeszo5wEzAmN8ZHaYZiVpZwaE55Wc4iDDOQpCHwLwjDa+xv/5IhgLCZh2nf/Tq80JYVyWZ6lm28rgix+8LFLNk2X4ZqlfbCAaEo/yxIa1sXgYGgDEvsyPtBUwzwAkkkkgPtMcvQO77+oMqvJKe14D5+JnEg54szcHL3USQFTiPCN8QVYRHBRB0PV7ACYbDhFHJ1aEU3GvqmXl03VUUNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a231b1-349f-4dbe-d358-08df4c4b10fd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:55:40.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7/f5LITNaOuMYbMUPvCTWDhFH2gyATKJKalNZYSaEuCXlw5XfZP9gBVJbJb2+eF6a63DtxFYfWvUZ3s41fjB3/gBbmLcCB7U9ScjxApeMI=
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
> Currently we do the vtotal->vblank_start conversion by hand
> in several places. Replace all of the with vrr_vblank_start().
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM.


Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index b62148f29503..b1721b0bedff 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -182,14 +182,20 @@ int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state)
>   	return crtc_state->vrr.vmax;
>   }
>   
> +static int vrr_vblank_start(const struct intel_crtc_state *crtc_state,
> +			    int vtotal)
> +{
> +	return vtotal - crtc_state->vrr.guardband;
> +}
> +
>   int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_state)
>   {
> -	return intel_vrr_vmin_vtotal(crtc_state) - crtc_state->vrr.guardband;
> +	return vrr_vblank_start(crtc_state, intel_vrr_vmin_vtotal(crtc_state));
>   }
>   
>   int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
>   {
> -	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
> +	return vrr_vblank_start(crtc_state, intel_vrr_vmax_vtotal(crtc_state));
>   }
>   
>   static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
> @@ -311,12 +317,6 @@ static int intel_vrr_hw_value(const struct intel_crtc_state *crtc_state,
>   		return value - crtc_state->set_context_latency;
>   }
>   
> -static int vrr_vblank_start(const struct intel_crtc_state *crtc_state,
> -			    int vtotal)
> -{
> -	return vtotal - crtc_state->vrr.guardband;
> -}
> -
>   /*
>    * For fixed refresh rate mode Vmin, Vmax and Flipline all are set to
>    * Vtotal value.
> @@ -634,8 +634,8 @@ void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
>   	crtc_state->vrr.guardband = min(guardband, intel_vrr_max_guardband(crtc_state));
>   
>   	if (intel_vrr_always_use_vrr_tg(display)) {
> -		adjusted_mode->crtc_vblank_start  =
> -			adjusted_mode->crtc_vtotal - crtc_state->vrr.guardband;
> +		adjusted_mode->crtc_vblank_start =
> +			vrr_vblank_start(crtc_state, adjusted_mode->crtc_vtotal);
>   		/*
>   		 * pipe_mode has already been derived from the
>   		 * original adjusted_mode, keep the two in sync.
> @@ -1184,8 +1184,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   	 */
>   	if (intel_vrr_always_use_vrr_tg(display))
>   		crtc_state->hw.adjusted_mode.crtc_vblank_start =
> -			crtc_state->hw.adjusted_mode.crtc_vtotal -
> -			crtc_state->vrr.guardband;
> +			vrr_vblank_start(crtc_state, crtc_state->hw.adjusted_mode.crtc_vtotal);
>   }
>   
>   int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
