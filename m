Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B981A606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jTIog/Pk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB4B10E7C8;
	Thu, 29 Oct 2026 06:35:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74EE10E7C8;
 Thu, 29 Oct 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793255748; x=1824791748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rCmb8ljES4YLQ/laAtj2Wxgcgspmj+FYS8+zSJ/kNOI=;
 b=jTIog/Pkz7gjNy+YieaEHZCIb7LxogXYUI6LCOReZgN7hQ1iJIweXBVO
 YkkRtx6yCPEaSWSPw05qHjtlBiFPSTTrVhLgL4Urluzr0xbmm4+7pI1cM
 0OJfXqf0/N1k0oy+EkMtuj38uwYpwn8HONowb+Eq4Anfp0sE/Eueb0Ciw
 kBMhyI4wOwaSqfbELxMkdYiu7H5dPDnnB1+c0bUVdz4e0IbaOS++0H7wU
 +rkCBrGtk83Ugp8z6o5idVPXzkGSv0y5qJ7GuMtUijnXk2bOPlY/bBCMW
 jqF/WlvM9wyWEEOB9Tu2/1UMMvs32TqTQ0LklnlgsIAnjHIx/6cfVYMb9 w==;
X-CSE-ConnectionGUID: dzZ6pVM8S2qerL4H015z3Q==
X-CSE-MsgGUID: X+bVkH9uRNiMMJlBjkzTAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2093657"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2093657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:35:47 -0700
X-CSE-ConnectionGUID: Tc6gZLRWQa+NNOjuH5eqgw==
X-CSE-MsgGUID: Ff3YqbujReGm+IVhQCOSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4996369"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:35:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:35:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 23:35:46 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zl6TpBGLuYEE0hOH2Nsd6392IE3NKEw9eMAPaOhSqKYM2lWNw8WdGfZhRqpscjd4nYKNR6wjzyvlm1eizaOZKota23yulBFznN5C/QXzyyX+eY4mldJnZAYD5e3nwyWe+u0S2m3jkl9KCjewDBRJzyKpDgDlXKYgyrVMrcRtrlMarrB3GsDz0nlmsHK55GCsOTECjSpo3eiISxd+IgsMJFmBgHSJ47ZElAOSIv0sEw2iYuMFIh8uudImtn/C4wefwvEVbNwvuiBYKgh9dw9sOs+2vmk/3ZXRR9Rk2pdwrqiOeKwYtun38nUWkX5I7bWYnq0wuNLfKi5ego5zuu0tnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVxqI1BvONjMU35Q0P3erppuy57zpmEPkyPXHV2o8ug=;
 b=tft5hXZrtwvXWTMAZyasBFiKkJlMi1zvLDcKTo7pBbiVyj5HZUKXy26Rb605HIwn1wioM7pcizg/ClTrQQsnXMbq9JRPlTuVub5SG99x0eG37dJ9y3v5SO1tuc6jsKAOZUeP5EqbxqviWmJCw67zrji0fpVkTPYTfuixDLBntdvlp5C+dfJICOKPJsnHwOIrkNK6D6rRuSU3DBR4Aduuij/rv/3HRPqqvTrwQxgs9TEWMkhVy/S/ay1Gvp7eb9LyhImTaKdCkw1jxsiJrUuOXYw7THXtYMtGSzsWpkvKQT7NkzAYmDh6dfIhY5GQ4UlS1xgb7K93PecXT3qmhR9BXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Thu, 29 Oct
 2026 06:35:37 +0000
Received: from SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3]) by SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 06:35:37 +0000
Message-ID: <fb98353f-8758-4766-8080-eb1ff16774df@intel.com>
Date: Thu, 29 Oct 2026 12:05:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Don't use intel_de_{read, write}_fw() in
 bdw_update_{pipe, port}_irq()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0093.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::19) To SA2PR11MB5035.namprd11.prod.outlook.com
 (2603:10b6:806:116::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5035:EE_|MW4PR11MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d783fa-8947-40ca-1b8a-08df3586d75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: A1vyVY90Dvxu97dtytOXxMAz4j3tvgdJyiCFx75K7jr3zdAUClbEoYv7hXO5v1h+m/YRe7QyN6sJ3pURfjyybo3J8U9k/HGSDeAwB0zlN3DdhrZH8ipl3fuZB705XryDLcF7QlzK+D8t2MlRcaWo4W8Yt6V8+3e4yyxZavOkztNy8aNfjWbpv6piC8opYAboE8rnVADpZZsiFd0AjktOjguNJ44lsXpvY830bF7XqbJaN0m1pddh0Mjtgh2y6PEGKa3nF3Dc+ZSjmAh5YrNrvg5d7AdidaiYhfjSvZuPAOdkXZbGuQ3wfgxp3oGVwIpDeVA5PrflBKdc6//T0hIxAndofcnET/s5UxX2wAaXTURo7LI7S6lJvyqA5VNW+PgORrxCMGj22R6Hcd3MBOZX1YjExx2Un2o/rwhHMATmrQGSlOcvMc4t6syRHL/B2ANx+IAsEMYBC3jen3sQO+8E0kGX8m1zLBS9XL6F40eQg9pn3Fk9lOmImsGqJgQITeUY8N+wnGmCI9cMKzp9LHtrhu/cseesC8G4Qqfc4r7nRirjs+h/BH2f+zFlJT45bhMnfN68jkXXLBT/kik6PrEeQoBDhAT5vlSJr2ld2WnfSbSskHlIWEOptEcfP74JybP9EAEt94xLyyH6XnxksZ4T92SJKsrhCBwWfgX9WyKcUNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5035.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHYwM2oySVZUQm5uY09EK2Q4SFNudFpTWUJTd0pxNm1zeHNCWVFybTArWGNn?=
 =?utf-8?B?Yld1cDFRU2Y4ckI5aWJWcWxTL2hEejlhaWRSMHgrU2VGekFtaEtYRVpqa3NN?=
 =?utf-8?B?TVduenFlZzgwaHB4QnpaVU1oZk56OEwxaTJNTVkwQ2JvTkJRT2RQSEVQVlMz?=
 =?utf-8?B?T2ViVlJmWFRTRGgyN0NMeVg0NnlvQlNBNkFWMkdwTytWMGxRNGwya0pUblJw?=
 =?utf-8?B?SUJGOVdEREpQQ3FDNkMyWVoxMllmaDBoWm4rdk4wY0Q2Ym52cHB4ZEllNyty?=
 =?utf-8?B?OTc5UGlHbUY4ZW0yNDRiWmlJbFdzakVWZE9DVWxWM3lqMnBQbDQ1b1BNOFk2?=
 =?utf-8?B?RGdsMWk3THNIdmFxRFBURm9UanQvazd1U2xKSndYSEJjSnFjZTFEWDB5aUJa?=
 =?utf-8?B?SE1jMWs4cHhWQUJxcDMrczluU3FYZUNjaVV2MGRiT0RsRGIzdGU5M0traGhu?=
 =?utf-8?B?Mlg0UlpDaVdER1ErYVhOZ1hKMHo2ckF3SkhBYXVHdGgzV05HRldSZ3B4MkN0?=
 =?utf-8?B?Nk9NMjA0UDRVakxQUnVSK29ZYU5sbTVQbVlFMzUzclNrV3cvK3RFbzY2eEd6?=
 =?utf-8?B?VDlmVVN3WCtLcC9FRmJvYUFLRnNYUkJGWkFzLzcwKzdrVUJVKzg3cjFhc1dU?=
 =?utf-8?B?UUhxUjdycU9QYnpLS2M4YzVWRWVVVzQxNGhNOW10RWdGTlRPekd3alV3clpI?=
 =?utf-8?B?R2RaQlFnTjVwYitlRFBYemZUZkYyMmloQmtvOWxBaDduODRuaXlTMVZpSFdv?=
 =?utf-8?B?Q2pDa3JaLzZKRUc0ZGxlci9tL1B1VWZGOGdUZVJhOEw5Wk9wMzhsMS91dlF1?=
 =?utf-8?B?T1MwOUZxOEEvek5lOWtlQ1ZYMDBsK24rdGo3UDFiYXRmQ2VBdHZsRFhCV1Jp?=
 =?utf-8?B?WHBkd2VjckpVamtxMDJhY3RzU0szVkJzb0dZT2d1Qis3bkxubFZWTmFteUJ5?=
 =?utf-8?B?cmVtK3ptVTZoOENFclJBYkIzL28xVmhXU0J2RVhlMjEvTWJraXFJQW5VZVow?=
 =?utf-8?B?UkFNWFUzQXlDZ3FGWTJSbzdUQXI5NFdWalVEaUl4QzZQTUlCRU16ajFKWkla?=
 =?utf-8?B?cDlrdjFyYUw0cGtvYmF4VS9aSE5DR05VMG5RcFZiTWF2b3RNNUppaVlNZGIz?=
 =?utf-8?B?STI5WlZxNmpIQlZwMjNvZzBETHRpOEtTSnZUTFJiS0NhU1lHN0lWTGNmejJ0?=
 =?utf-8?B?WXFKN056NVM5MFVSdXd4NS94c3lXcmFKcVVLTnlXbzlQMFVpeWZuSUNPTHBl?=
 =?utf-8?B?TEhlL0FmRE1UTTg3b2ZTM2wrQ3RuWmlSbmhlMnFvTWp0M0k4akNhU1RYa2xw?=
 =?utf-8?B?QTJvNlJvbXZudUhobU5XK1RyWDZwc3hybXJzQ3pwRjBZVmVodEZtWUNyQmhO?=
 =?utf-8?B?R2o1VTRJQ1NuVVhaVWc3VWJsSE5yc2dGWkNxaXVxYWZ1SmZBZEdvTURzT29y?=
 =?utf-8?B?aGJBRTRwRlRuWExPSnppczAvcUFkaG5NS3FwcUNJcDIvNmNZYW9jWkJmZ2tZ?=
 =?utf-8?B?dVNFLzJBb3E5d1dmK1AzRDlYbWZETG5uU0FJR1hYN1UrQUxCMlNiZk1wMmlB?=
 =?utf-8?B?YlJvZkRzblo5NWJpQ0dWalZkRHlXbktFcGxxZzNKTk1pSzFlSTZpUFNtTmNL?=
 =?utf-8?B?bzcyRGFyVkJpaGQ2MTRGS2xHdmtSR0VjYlh5eWF1QWRLYTdlZ082SE5wUTVD?=
 =?utf-8?B?a0s4WVcrY1lpNU1xK0puWGdaSG95bDR0TzhaeVBkZkIzWm1lNkFLM2REVnBG?=
 =?utf-8?B?VWhSTEZHdk5ETHdLV09QVllTdDJJczY2VXlBK214VEt0VzIvSUlKaW5OY09o?=
 =?utf-8?B?Nkc3NnpFSUtUSDQ5WXNkbmVZTzVtSWhUdytkM2RXaUJnYmdMRDg2MVVvZFkz?=
 =?utf-8?B?T1ZSczR2NGdEenBuQ2FoOFFIKzh5ZitxV1lOb280enIvbzlxZktVQ25TSC8w?=
 =?utf-8?B?aFNDVDd1NkxrQnJJTVhBcDlLRTFKNVA0TEdQeUJlQzlDSGYxWlVaL2RHWk5n?=
 =?utf-8?B?WWVSWmpLZFBGdmtiSk5IRFF3WjdOMkorMVJEeHR2aGpTVkxWQ00wOHFmSDZl?=
 =?utf-8?B?L3ZYT0ZKZVlmMGtleE9lbFA3dGdXSU5pdStjaFY5ck5Hb3dLV1owcGR3Z0Ny?=
 =?utf-8?B?ekN1Ty8rRHVIK1JZaWVwVVE0QjkvaDNxM1YvdjFZaW50NjlGdk9vcDNVUFRT?=
 =?utf-8?B?WmgvSTJlc3ZONnlIOTltWXlLbjdUbGhLcmpsb3liWTZoOE8wMVRCVzg0Q1pz?=
 =?utf-8?B?NzBvbnpMUTdDWUJuOFFXVUh5WFk2eG1xMDY1WlhXNmVTTjJrenlvZk5SWmQ2?=
 =?utf-8?B?L0JZUVF2cjhSd3c1aU9sL0wvc2hMQnQ3YzZOQkIxLzlyZEJkMzVpc3RBVUdS?=
 =?utf-8?Q?WnoJ4+9nrc0EOjps=3D?=
X-Exchange-RoutingPolicyChecked: WT/9N7SjVlnbe5kOAvGQL8wuMqoI33cxj9+RbzWIA97P5zPplPbGA0ejfopLKSht6hNux0H9Cnj1ZGbknyeN/ong/V9hxEMwXyB66YUT8jQlag5hgBCbTAuG1QGjNuyDrQLt0B4W0ljCBN5rDk89G+g0ByEmgTsQLig+Etrs7lS5rD2xnu9Qxk+HfrYxhI+RyNi1mcdrQs/wzDIJngRsS928SdXxpwy3AxywcbkKsbRM/Bkwp/RlMx2Ci1xKqmyVz/5yqKhpdTP1wYjzTcDGs2iPofZdyLBccjeZ9P8EA3WWfCL5SL1HA/HMDjeX+z7qtfqnwkdDDmAMIIPa22E8bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d783fa-8947-40ca-1b8a-08df3586d75e
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:35:37.0181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/+gyHKdmtwjcsnoCJmjnky4gGH6dmkmLp46rnCD7gKynpRo+rjrP8wu38U+KDDMkHQtQRM83HyHAAWqaMXmMCF53ed/GfSerFrkUJxwKlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
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



On 10/28/2026 8:20 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> bdw_update_{pipe,port}_irq() can be called from anywhere, so the device
> might be in DC5/6 at the time, which means we need to grab the
> wakelock to guarantee access to the registers on LNL+.
> 

FWIW, LNL does not have wakelock enabled by default.

> Revert the earlier change to these functions to use
> intel_de_{read,write}_fw() and go back to the full
> ntel_de_{read,write}() which take the wakelock for us.

typo: intel

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Fixes: d50b061acc3b ("drm/i915: Use intel_de_{read,write}_fw() in BDW+ irq handlers")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_irq.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
> index 25b899990475..b8d7e8de4ee8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -206,15 +206,15 @@ void bdw_update_port_irq(struct intel_display *display,
>   	if (drm_WARN_ON(display->drm, !intel_parent_irq_enabled(display)))
>   		return;
>   
> -	old_val = intel_de_read_fw(display, GEN8_DE_PORT_IMR);
> +	old_val = intel_de_read(display, GEN8_DE_PORT_IMR);
>   
>   	new_val = old_val;
>   	new_val &= ~interrupt_mask;
>   	new_val |= (~enabled_irq_mask & interrupt_mask);
>   
>   	if (new_val != old_val) {
> -		intel_de_write_fw(display, GEN8_DE_PORT_IMR, new_val);
> -		intel_de_posting_read_fw(display, GEN8_DE_PORT_IMR);
> +		intel_de_write(display, GEN8_DE_PORT_IMR, new_val);
> +		intel_de_posting_read(display, GEN8_DE_PORT_IMR);
>   	}
>   }
>   
> @@ -244,8 +244,8 @@ static void bdw_update_pipe_irq(struct intel_display *display,
>   
>   	if (new_val != display->irq.de_pipe_imr_mask[pipe]) {
>   		display->irq.de_pipe_imr_mask[pipe] = new_val;
> -		intel_de_write_fw(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);
> -		intel_de_posting_read_fw(display, GEN8_DE_PIPE_IMR(pipe));
> +		intel_de_write(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);
> +		intel_de_posting_read(display, GEN8_DE_PIPE_IMR(pipe));
>   	}
>   }
>   

