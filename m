Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D05606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 22:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IUjBHjHQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gBcyNDQX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B48112773;
	Thu, 19 Nov 2026 22:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192C11275F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795127298; x=1826663298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1LWnDdOfZtv2fEt0VUYHScy7Qfy6TnXq0gFGKz8W5yw=;
 b=IUjBHjHQoe9HJzsiQj/2xaUjnkrqW20SZzWO/z5r0/pMy6rwOGYJ/ASr
 m9+3hezaD3Smyma1ACCY2N/zJQm+foMTC+lX1sQkQXQdWiQzKrBbSu2ua
 C0D0W5+g4faekdXyfaZ7S5bOJ9qFUjkiZgAszqnvTCJ66HOfRh1EnzkqO
 iuMDma8fWdWKd7caQFIGNe/AqPlIFm2oYuAMwp1dIFnQWqzDkt1rCtB6E
 lwOmHTTnSM6qH9akJnhIfkN+S68QFTlMe83PoGn49GvDAX5oCj6zy7AAJ
 iyCcX85+FpHqYqqMTFb1SDRbEgupflXknBV72RCrfpwtHj7LiPk6Gt9Nl Q==;
X-CSE-ConnectionGUID: fcJfonrcTTGTfNmyhuih1g==
X-CSE-MsgGUID: do/C07AfSAS/pRs28UagBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3843250"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3843250"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 14:28:18 -0800
X-CSE-ConnectionGUID: xDapSHIrSOe8i7Yqa3j4Hw==
X-CSE-MsgGUID: Lyop48tQRj+DrAdlt5d16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10462307"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 14:28:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:28:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 14:28:16 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:28:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbBiduTMe6khtRnIzOWDJEH9dg/Sjh8ckWPnO7CcosZEJ1Z/7znqUzhYdAy7yU28hqY8RXVJkJEK9MB+ncE2+O6syJjHWVTQMhB/VGLhJk5BVnzYyDvNU0iL8zlLN3j7JGhBfnq7EldhtrsQPlFngYwvVUn/TVjIxBP1a5+GUu/xrwYvrUU4r/Oyu6eGBGHAfdAG0fOlbeOumjQ+KcbF9Xjnjz+ukfwZkP0vCvyc5Liqmb1lsIhTMUuGMVMrBYfd0ZxuWg8XU6l8qj+U8Sk78f8JhyFP5QS48pcSXleRzBJCWwt8ENMs6XpOU+V5tDEvh01E877KsqIvB7QH3hC7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPUp4V9g7hrWN5YgfcrB1SIQMNzfo86QzeKJuDcBT8A=;
 b=c+N9PALRUWwHTYfJ60ln8n7x8ZCKoFGsEGe77l3R7NUEh+Yt65y/XWITXlvtkNnPTahDQ259WoO0G/+YJ8Ksyhlvln9DaQZaWQoOpbkoagux/Wk/W3gmafBW+26er4L444gic4lxGaJCaL7WwLvM6u24woyC0UJuxPHX+hUpFrgXfgZ32biF7KQ0LaxELPBSc7/fYaFb/qkr1WdqM/b1o8hpx/qbm+kNCU1qhbUZRgBUcG4r21xZn9Hizp2V+ZLjMWDcJ63tLEUpm4SNOFZdGxEY8gk1TFKowEfkKqskMGwuXzLYhyut+nPAwp5abuQAREU//WROSm/aSzgNhXhWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPUp4V9g7hrWN5YgfcrB1SIQMNzfo86QzeKJuDcBT8A=;
 b=gBcyNDQX3WSCgEw29wo8t2RBAsaVywxOWR+IBR6mPEfC98vrN27XumtE9oWSJOHetw6WvATK6dYHHldizbYWuOzgOxMUR1v/eZE9mMXNicoy/fG68hraHPNDYITzOxdNq1ep3KVeK0hFx2Dt1A+MmcScUSNLMYKj/kvpAP5pW9Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:28:13 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 22:28:13 +0000
Message-ID: <8ade7fc2-8efb-4355-861d-5b5ef43144c5@intel.com>
Date: Thu, 19 Nov 2026 14:28:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
To: Jesus Narvaez <jesus.narvaez@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20261117005534.2322094-4-jesus.narvaez@intel.com>
 <20261117005534.2322094-5-jesus.narvaez@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261117005534.2322094-5-jesus.narvaez@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|CY8PR11MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee79b19-0ebf-403e-9c62-08df468c6636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|4143699003|261026140227099003|11063799006|56012099006|261102123227099003|261026121527099003|261022075727099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009223327099003|261009223027099003|261009221727099003|261009220027099003|261009221227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 6RZI/nAI74sI77bB5W9uM4emYMpagJLJdifL57UwwVaIDe5Mle9kSoslJPAWWTMIdiUwDXv8FNeZlzKIhdhy7U2mpYzq+D+sGxWCdwf6zHqfgXNZB1B8FIIL7vt/d1V+TzO9FlD6Iw2NgeAmmncXvX4vrDvOltpm5xcjhckzCUTf5tCp7SKuF6m5uyDYStGLfVQqN6eL+PjK7lYshru4ee3TpC7HWUUV4gqn6Ss2bM7a4SAm9Vu6u82JTvHw356DGveCDv5q+xNeORoiRh7GWdsoUrTBN7fvlg4TRjmUNyUQZVGAKTFJNVBtWGhDz+zrmiJ2EisvI314+SvFtdDvGhiSI7d9KU7SRVilXlLXnWHPyhRqgd1y1QNdv0jV8uZmKGAbQ+jx4EyltV7Bp/0PaSueaPeyFum1KJu2/vRa9NFkZ8ATMnSuioFwxXB2Iiw2n1kJoYhv8lACHvopn/UqJ/sPm4JPpFZwQvEbyk2PUgoOsck/SvyuUCppJk1P2O9TT8QJP5lULZzC+rF64obiJgxCWRiTsKhk+GFlCFD8GUgYXxKTkqfQsccua1D4qTv56ZMbN3dbkcOtLOiOiYnYf3wxLf0a+D0tQPoNcHLSX0xz/mzGDZChSbohVCHLS1Z+OmMgEAQEdqqWmEnnUdLNibcVQoP1COXtgmvw6ZZ+/TU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(4143699003)(261026140227099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009220027099003)(261009221227099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUJ1QXd5bzVkbWlSS2VpNVdFU0RDcWFGZE44NjZ5aFkrblA3NXRsaTJhUlBn?=
 =?utf-8?B?OEZsU0Y4VWk4ZHlQRE9qcHhSUk9ia3dGTTJOL0pyU04ydWs5WDg0UjU1eGl0?=
 =?utf-8?B?eEZoRjhCbjNLbUFmN1dvcy9sL1JaclcwUy80U1o4QkNJRkVyNkhONEJISkx5?=
 =?utf-8?B?b0YrcnUrZWxOTzBYeFA0VHV3UFo0VjdoMlVpWUp2ZnhpajFNNDhvWmZhY2Fx?=
 =?utf-8?B?dFR1N2g5c1U3TUh1eU82dnZwSlFBQkZBUmFTU0tHZk5nNU1Fa0o2dlN4OGF2?=
 =?utf-8?B?YWU0N1h0ZXpIZWZMVXVycktnUGY1ZW1mWWRDOHpVK2thNGVaT2UwTzNEK29V?=
 =?utf-8?B?YU9EM1ZhcEFRUGp1N3ZCTXRrek9aMWlSVDIxSEpjMDBlK3ZnMFZSeGJFRlhE?=
 =?utf-8?B?VDAvNGwzNFVLSHFKN05FSUl5UlFiTlBScFVyT29KcWRtQkhZcXpsMytCODZM?=
 =?utf-8?B?eXVDQ0MxQllCMVdYNkltQnR4QTcweWVTTkp6a2szVlZBTXBIOEtSYkg4Y2kr?=
 =?utf-8?B?UkRVdjNpWHpWLzlWek9mTmplRU5ocnpaTENGeEVsM082MHhsV052U0VtVlJ3?=
 =?utf-8?B?bzFjUXAyUHdYOG1nUklwcjlyQW9kYmI4alVSek16TEFoMTVRS3VUUm50SmdY?=
 =?utf-8?B?ckRuT3VwSitoenJPMjVkZEI1TExPNEdYY1RPcTVqZmV0WHlEbFVwNGlMYWlr?=
 =?utf-8?B?TWtHMkdCTTB5KzFuNmcvTUU3dU9RNDlJVHNJMzFsNEhHbWR1c050MVFjcjNz?=
 =?utf-8?B?bVhrRVgvTG44QzJaak1MYitGd1ZaY2Ywam14aGtmSXg4Vk1tdjVDVkIvUGFo?=
 =?utf-8?B?K25zSkwyeEE4TEZHMmxFSjJPMkl2NnRzQVlMZmRHdy93K1k1bzM2dE1qT1pK?=
 =?utf-8?B?ZnkrVGNhZE4rRWxxcEN5bHFDVE1qQ0JVQXVERXJuN3BjdE1hSUp2dU8zcFhP?=
 =?utf-8?B?aEhCeWFFZWlUUWExcWlodUdnMG9kaTgxZFpMcUpGSzZuWXl2MTFGZEJ4SE1C?=
 =?utf-8?B?Y1Vwc0lyWmgrT1NJK1E0T1BlczRJSHBDblF5NndIV2NtOEgrMUlZSkw4d3N5?=
 =?utf-8?B?QmZlMGcydHN3VDlkbzZ0eVpXSDZMdVA4NzVGMW9TM1R4NGJRY3JOczA1NU1r?=
 =?utf-8?B?Uy9XVjhKZEczcFJaR2Nuek54RTgvaXJCZW14NG1QVUp6M0szbWljSUQ2OGtE?=
 =?utf-8?B?bGFSN3MvMElyZVVmbTFvNlRUN0s0VkptWU53d3k2MXdnTUxrL0d0ZGJOclpm?=
 =?utf-8?B?dVdDUjl3R3k1NHdNc0psT0lQSFJkaUMxaUZuMytHSGdLakt5Q1lwK2hxd2tL?=
 =?utf-8?B?NjlFWXh2Qi9lNG1rUVhwM1RHc1FLdkVYYXk3ZlV1UXJPNGx4MWJralVjSkU4?=
 =?utf-8?B?dk40UnlnZEhqT3E4Z3ZkMjNQRXUvYVNmblRweUxYYUZVRk5TWWN0ZHc3M2dJ?=
 =?utf-8?B?YXFDelRGNUNENXpoU0V6dlIxTTdUUXhvNGNxcWdmV0tQSlR1OXJhSDRJUjlW?=
 =?utf-8?B?Y0FXdmV4REZId1VZaTdGV1NJTEV3WXpTUmFIck1WcUt4OVpUZnFSZFhMYmFj?=
 =?utf-8?B?U3BIYjRoL2craTdDblRvRTBCazBFbXE1eXNSSldXdmNBcjhtVUZBMDVteVc3?=
 =?utf-8?B?OXNXaDVhbnJ3VVhXVnBhR0tFcmtoNmJ1TWE4akRST0FaY0YyQzZ3bm93eVQr?=
 =?utf-8?B?MzBSOC8rb0xIRS9ZTUMyVlJydVZzdldDbGFQeFBZWjltRi9tWkNNZm1QNWZn?=
 =?utf-8?B?ZWhSR1ZFNEN2Z29WVE9NWWhQQnREYURaK21TbGk2UWpUME9qeFBSdURvdW1t?=
 =?utf-8?B?YXNGcFdZMTVWbWtJVWZPNjVQdm1LQ1hacjA4SUhuSTc2REZnOFE2eWo4NHdK?=
 =?utf-8?B?a3lLSWRlbmloSDNaU1M5QnNWbERXbmthdkZGaytSNmkvelhETXlPSW9ZQUNV?=
 =?utf-8?B?TVYzNjd0YlUyaUxXQzVsM0JWa0M1TTF5VDNRTlZhSS9HSW85bE5Bc2hqaFFZ?=
 =?utf-8?B?b3BKMGdHZ3UwQnVGaUtkTnlrQ0JkbmZwdG1ZS1ovNjEyTGN0dGJqNzdQTDBo?=
 =?utf-8?B?K2RjanB1TmE5ODRWRFBRRGpRUHpBdjhZZ0VsV3lYTTNGdGdvbkxCVjg3c1oz?=
 =?utf-8?B?dzlOTEMxeGM2aythWVVtMmFFOTVlWlY1Y1hNVzJxenhXMHpzTStiNU90RFV5?=
 =?utf-8?B?M29xa3RxdDErek1xM1Z6NVMrMEpRZGUrTnRSSy8rSUUzUUVFRVUybVJ5NEc5?=
 =?utf-8?B?L0ZXWk9JcUYraVdOT0NqSnFGcklWTkN2a1VEVDQwN1Bnd1V5aVZNOVBkVVQy?=
 =?utf-8?B?Mzd6cFFqKzBqYmtXYVFGblRvYVNMN0dQeVRyeVFWRDhUV0pOL1BKU1dYSGwy?=
 =?utf-8?Q?Er+XDRMc7CBru1R8=3D?=
X-Exchange-RoutingPolicyChecked: WLfnwqVuAJVTsrMktqki/2xFdyTtxw8ICCr/MYYLfSbSj4NE11R92HcqA5V37bEADAnL8LhLLEo+m8p8r7mK6v1ZnX/q1yFsU39+0K3CSSmcIn7u5ibv4qsSpw4sz2jNG6jfbR87jPuwEM1eQPWANAWRjgK2+SY+ossceyFUTF5qXUuCWvNILhphMh57L24jiupSaZxzS69HoEksRSYeCFvePwrKmLlf72VHi8x6eSOSTQ7toXAxKo+YEgo3kbvHRPVUcSCJm85TOrH4mgsKKgCnG8X7Uzz6ScKY/b2Q1fBfEk5n/UUD7SNQ3BakIG/2kuSycTRKvZ1TsX1T/oYW1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee79b19-0ebf-403e-9c62-08df468c6636
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:28:13.6896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h04d6PCiE0/S7YaNyeNuo/UyF6uuzjOxzhA6U6sjXTq+WNWoJKpgAwrFUuHYXzdRxgCegIoBRt3Qgfmqw9JJD8cHqwuYJW9vTrR2fyhFhFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
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



On 11/16/2026 4:55 PM, Jesus Narvaez wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Add a has_sem64 capability bit to the graphics/media IP descriptors,
> set on every Xe3p platform that supports it. Graphics version 35.10 and
> Media version 35.00 only gain support at stepping B0, so that exception
> is applied when resolving the final gt->info.has_sem64 value.

If we have different capabilities based on the stepping, we probably 
need to start matching the descriptor based on version + step rather 
than just version; that way we can have separate descriptor for A-step 
and B-step, instead of patching the capabilities when we copy them.
Not a critical issue, so I'm ok with this being cleaned up as a 
follow-up to not stall the required sem64 changes.

>
> The bit indicates whether the GT's command streamer supports the
> MI_SEMAPHORE_WAIT_64 instruction. A platform's CS must not mix
> MI_SEMAPHORE_WAIT and MI_SEMAPHORE_WAIT_64 within a context or across
> context submissions, so both the primary and media GT must agree before
> either one enables sem64; resolve has_sem64 once in xe_info_init() and
> hand the single value to both GT allocators.
>
> Assisted-by: LLM
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
>   drivers/gpu/drm/xe/xe_pci.c       | 27 +++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pci_types.h |  2 ++
>   3 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index c00a7c171f80..cc7d6adb6aec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -167,6 +167,8 @@ struct xe_gt {
>   		 * error reporting support
>   		 */
>   		u8 has_uncorrectable_error_reporting:1;
> +		/** @info.has_sem64: GT supports the MI_SEMAPHORE_WAIT_64 instruction */
> +		u8 has_sem64:1;
>   		/**
>   		 * @info.has_xe2_blt_instructions: GT supports Xe2-style MEM_SET
>   		 * and MEM_COPY blitter functionality.  Note that despite the
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 619653c68f2c..b33dc06cf8d2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -128,6 +128,7 @@ static const struct xe_graphics_desc graphics_xe3p_lpg = {
>   	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
>   	.num_geometry_xecore_fuse_regs = 3,
>   	.num_compute_xecore_fuse_regs = 3,
> +	.has_sem64 = 1,
>   };
>   
>   static const struct xe_graphics_desc graphics_xe3p_xpc = {
> @@ -154,11 +155,20 @@ static const struct xe_media_desc media_xelpmp = {
>   	.hw_engine_mask =
>   		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>   		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> -		BIT(XE_HW_ENGINE_GSCCS0)
> +		BIT(XE_HW_ENGINE_GSCCS0),
> +};
> +
> +static const struct xe_media_desc media_xe3p_lpm = {
> +	.hw_engine_mask =
> +		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> +		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> +		BIT(XE_HW_ENGINE_GSCCS0),
> +	.has_sem64 = 1,
>   };
>   
>   static const struct xe_media_desc media_xe3p_hpm = {
>   	.has_uncorrectable_error_reporting = 1,
> +	.has_sem64 = 1,
>   	.hw_engine_mask =
>   		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>   		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> @@ -199,7 +209,7 @@ static const struct xe_ip media_ips[] = {
>   	{ 2000, "Xe2_LPM", &media_xelpmp },
>   	{ 3000, "Xe3_LPM", &media_xelpmp },
>   	{ 3002, "Xe3_LPM", &media_xelpmp },
> -	{ 3500, "Xe3p_LPM", &media_xelpmp },
> +	{ 3500, "Xe3p_LPM", &media_xe3p_lpm },
>   	{ 3503, "Xe3p_HPM", &media_xe3p_hpm },
>   };
>   
> @@ -904,6 +914,9 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>   	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>   	gt->info.has_uncorrectable_error_reporting =
>   		graphics_desc->has_uncorrectable_error_reporting;
> +	/* excludes configs that don't support sem64 */
> +	gt->info.has_sem64 = graphics_desc->has_sem64 &&
> +		!(GRAPHICS_VERx100(xe) == 3510 && xe->info.step.graphics < STEP_B0);
>   	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
>   	if (!xe_configfs_get_enable_multi_queue(to_pci_dev(xe->drm.dev))) {
>   		xe_gt_info(gt, "Multi-queue disabled via configfs\n");
> @@ -954,6 +967,9 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>   	gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
>   	gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
>   	gt->info.has_uncorrectable_error_reporting = media_desc->has_uncorrectable_error_reporting;
> +	/* excludes configs that don't support sem64 */
> +	gt->info.has_sem64 = media_desc->has_sem64 &&
> +		!(MEDIA_VERx100(xe) == 3500 && xe->info.step.media < STEP_B0);
>   	gt->info.engine_mask = media_desc->hw_engine_mask;
>   
>   	return gt;
> @@ -1108,6 +1124,13 @@ static int xe_info_init(struct xe_device *xe,
>   		tile->media_gt = alloc_media_gt(tile, media_desc);
>   		if (IS_ERR(tile->media_gt))
>   			return PTR_ERR(tile->media_gt);
> +
> +		/* can't mix MI_SEMAPHORE_WAIT/_64 across GTs on the same device */
> +		if (tile->media_gt && !(tile->primary_gt->info.has_sem64 &&
> +					tile->media_gt->info.has_sem64)) {

I think there is an effort to try and get the driver to boot without the 
primary gt, so we can't assume that it's always there. With this fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +			tile->primary_gt->info.has_sem64 = false;
> +			tile->media_gt->info.has_sem64 = false;
> +		}
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 74a6cd461b21..90936f805d8f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -84,6 +84,7 @@ struct xe_graphics_desc {
>   	u8 has_usm:1;
>   	u8 has_64bit_timestamp:1;
>   	u8 has_uncorrectable_error_reporting:1;
> +	u8 has_sem64:1;
>   };
>   
>   struct xe_media_desc {
> @@ -91,6 +92,7 @@ struct xe_media_desc {
>   
>   	u8 has_indirect_ring_state:1;
>   	u8 has_uncorrectable_error_reporting:1;
> +	u8 has_sem64:1;
>   };
>   
>   struct xe_ip {

