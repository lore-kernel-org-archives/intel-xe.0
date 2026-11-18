Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B3606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bhy1bR1C;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZA1PpQ0V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BB810EC27;
	Wed, 18 Nov 2026 15:51:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F310FE04
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016744; x=1826552744;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=grtlTq5IOehRs9jxrPeTpoDGnKgdEYLd2hZDo3uVu3w=;
 b=Bhy1bR1C1RXvdlg3lrNF4TmGanKb4rSC7M8xvBQVyHNgQPJmJBgU07W+
 jexeYhIo2/9Mdbn9yUOOpFgOBFOILUfog8T5bAhQcjJHnmZfLh4NsNSZ5
 qZCyLfPBDdMm1an/DXF2U6TEUFJYRrRla7vzusVVWp2IAxQWgBUXjEP+P
 C3CFpoC8QyiyIWxJfwSNN6x4JXyhIyNJh3KNytxgJuGVn2i7WYjDuSkst
 Rlo/VUds+SBByyTbevlkrkS/qIE/2yf/OvKPCQDAM5Si5g8/P7UJNjALI
 lqvN1PSMv2Jml9K3ASUoaoZ+8GZjARkyKJw70eX7XScGFO+ASij0gSOSl w==;
X-CSE-ConnectionGUID: ZLWXF5z3SmyxMFXmAcL54w==
X-CSE-MsgGUID: 9HKw/VzEQQqKmB0r4n+UUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3823580"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="3823580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:44 -0800
X-CSE-ConnectionGUID: Tuvtozv/TrmE3dlBfMOp5A==
X-CSE-MsgGUID: 0coMJOl9QwCh1lOkU0SGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208,217";a="10406576"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:45:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:45:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:45:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/6DwdW97Lt/300PvOV3FQDMpAT1Znh9PAtMVum81nA4XNZPdSu/ua6aj95FN6/f9HaOkauepWnnremvSGlbUhoWTs1CWYlCImPVqy8puLlJ13td9FoEjBBTexQz1AZEv2ZgO4R1zsQlBMxkXZ4stIA5JhZyV64wT7r8tvNZIqupo7fsQ/VJdbRuLz5CD4USe+nNtmHIuBP15Afz7aZFgqTzBSK/ZYtzZzsy/FI1QSCfHCYHjIEPEdYk3n3MOlRVEBwUgOentBnSrGvRXubbBeQm3BtjzINSuycmBOjPVnFY66SE5itsqeYOpLsY8uQUtTUnKaivPyFdPWfXhzoOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqMLkVlwMK+HyEJAqmq3wenW6OB7nekXMxiHW1KyYbU=;
 b=MBmjXxoaURlj0EGEAy3kMt9PAQ2VuJixdpdydiw+IzgNv8UbhXK/I3G9VIBT4a9zj6FOTI4tnmU+gIMX7Lic5MSsv6lj6qIgFoxWrfsPihQa1sIii31QFANnU28JdEf8yisYbPjNyzC0VOQjwmwKeYCp8MF4L3umtZ4AlPMeoQML1KTgD5AjrgZY7RHo+4X9/rMAesF6SgFi5wO+UbzCUu+vkcXLjo621KUchL3JzNoXxVCVHlwJSzEWs/ZBp5aQW9s8eVY1GUMGbXTb7181ebjQCaptss1ophy32ACxpcuMwjQMj4OcuxPhrI6TosprlUpYdlcN57yW8gLW4OkLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqMLkVlwMK+HyEJAqmq3wenW6OB7nekXMxiHW1KyYbU=;
 b=ZA1PpQ0VcnTa7pWuYxerT8IziptQeFpF+fIunm49OGlqJpVULaJNA1Njouwpdd7R6BJTKRAxtjV2fFsYHgwE7/Qph0apfXQhMGCXItedamQ+0ioZ16oem1QHRM7DG0/vV86Q8Czs6lC1TwbqK16Ogo+VjciUXDsESrrkZMqZwa8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS4PPF382351574.namprd11.prod.outlook.com (2603:10b6:f:fc02::1d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:45:38 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:45:38 +0000
Content-Type: multipart/alternative;
 boundary="------------VSJC3vF2E62ZAXR0sqlStV69"
Message-ID: <875d7ae8-d70e-4985-a317-63907477f09c@intel.com>
Date: Wed, 18 Nov 2026 21:15:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
 <avxyUc1VLSYm7DbG@intel.com> <6179a816-4d28-4c82-b020-d6282c97c7d4@intel.com>
Content-Language: en-US
In-Reply-To: <6179a816-4d28-4c82-b020-d6282c97c7d4@intel.com>
X-ClientProxiedBy: MA5PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::19) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS4PPF382351574:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb1482c-d50b-48f8-6c22-08df458afe1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|261009223027099003|8096899003|11063799006|4143699003|56012099006|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info: WdvBbfnviJz0QJ7X2oK5PI6jSVGP1Jm0UxdJcQYmJIu3f3f8FjP9fIBZyx1CRFFx/tTYcu3E9a2T0FKHepRSm6pY2PWp4atJIuYba6ZFdRl1d4KeIkRkw35VNpWW8EDmU05UDHC+fP4Q9CqPM7cxwl5GGPAUvJz8HPIdWeJ6CyvLSlZtVJVhFyOdmHOugKljsPgidMJ+s7tvVjFSfQHCHte8Sd18SvCjswZdqTcJiY0oZEYFipI/zXlJP2rUcbG2uIjTtCkWCHpkqAB3/8A4wOrl3ArVllLrRaP0waHdW6EiXyH9uXkk/scVQjTDMNOGLLnZjcn/uXw/uFAH3u6lNrUwJtLNMFh8dM2t8gJLs4ioE0CuaidgpGRpajkPxaKmx7ecigcGZB2pxRVf3zwqpQnTomYSlD2PNbbGgNG9BI5yzYM/1ad9aDeljuBofu2B2yNtKC94+8T58cG/KebIb1R1A9FwaGGOoA527F4fucfS5LfNIPOeY1X9i/WyqfvWBoneOPxJ2X67kFq/X7Zg7be5Tc+P4WpMLPb6tVt0Gyg5COgFaKEJ505On3+QWZztkgdP6HokASkH1YWtnqgldW7Lv6NvM/bDx6LWnjyfM1seKJ8mzXhMC7Ole0rrAG3sbE4dflIL2NZY0rlggUrUUZ9uVXVNvweDoEu2CvxYbIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(261009223027099003)(8096899003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022113327099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZYV04xd21ZNHdBL3l4aC9ZRE4yM0k2NlgvTTdOZ3dDaHRldHJXcWVNVXVw?=
 =?utf-8?B?UFY2Tzc4azA2UUIwTXdlcGsvTTlsVjlicTZRdDJNZ29xQno5RzZpenRyVHR4?=
 =?utf-8?B?U2QvUEZQNmxEWXV4ZmlCTHdYUmRMRitHRkpHb3RjN2ZOeXFWNGN5MStlQlhG?=
 =?utf-8?B?Ujdac0FxcGE0aStxNGRhcXJYL0k0em9EVVJOREs5dW9JdUdOVnJHSG5oSXVr?=
 =?utf-8?B?akJJdFJZWnBxUVhGUFVlUExaMGQyS09qYnJ1TFovY052VmFwY3A2RE1EbExw?=
 =?utf-8?B?dTlQMmZ6clFrWUVuaVlLdFFRemJ2elQvUlV1ZHd5dGZ0TzlDWSszL0pFVnhF?=
 =?utf-8?B?VWxiR3YwckVneDF2OEFKOHZUalkwUzlONHdYeXFlTHVCUDRneHpQWXRuU0Nr?=
 =?utf-8?B?ZHlrbkI2clBKMFoxNmpOc0J4K1M2NDFPMEpYb2dkR0pkWlpzdDczZkxpRlZD?=
 =?utf-8?B?RHRFcDVHWFhNajc1MXp6enZqVzZ4VnZ3QTlONzBHVVZsZFNyUVBHcGdpazJK?=
 =?utf-8?B?M1dmbEVNRDlKUjdsYnBEaExicHpiNS8zN3JNR3ZaNy9uU0pzUkY3d3BIb3R0?=
 =?utf-8?B?NzYwTkxvU3dXaXZodmRORVBXVEJvMEZvSjZiZEZKZWdWWGRONG91UzNpR3pS?=
 =?utf-8?B?Z0FsOWppbW45QzhHRksxZWQ3Mml4amt0QlZUaFdRaGc2ejQwdnhINTFtWVov?=
 =?utf-8?B?RGgwWjdTZjJqdHU4Vk1xdjRCQ3d6WjRHL291NmhaZUZ5MU5Bcmd3MHdQN2Uv?=
 =?utf-8?B?dDY0MUdNSWE4cGUvVlRSYTh0UjZZbFNMUHRoa0pVS3JjZEhZMU44RkdrbVhh?=
 =?utf-8?B?aW96aHJPdmgyUnEvVWwzamtPQmoyYkxESXVpZENLc3NSU0YzTk5XMXhydmE1?=
 =?utf-8?B?UnplMThxOGc1TFlLczJDOU9OeUsvMEpjVjQrK3ptdklwTVlyM2ZkblZoeVIv?=
 =?utf-8?B?RzZqR0NQNWl6emlCWlhBTzlRc2U0dlVFQXh1VWZWTG9lRXc3TERzWk12U2Y3?=
 =?utf-8?B?TWIrdFVZU1FwNTNZejRETGFjbWNvOGZFRVg4anRzM1ZscDYrMTNiQ0V6L2ov?=
 =?utf-8?B?TGxUQXl4dDI1SjhPdDFJaUYvUmlnUTFkdFRjWmFPbmpHbUI1dDM4ZEFrcGI0?=
 =?utf-8?B?bjFrdGREWS93dnNNSDV1NCs5Q24zMzNtRjd1c2lKRGt4dkY5TWNESmU5cUFB?=
 =?utf-8?B?cnNMTzh3TGNYU1hhZEJnbTNCbHBsdFpraXRXWFpmOUpHSDAxb0ZNZWRXQTgr?=
 =?utf-8?B?YlJCZE15VVRpUkVQY3NIV3M0YUZUUnRrZ2dJSk95UWdRZlhnaDJteWd2eFp5?=
 =?utf-8?B?eXdoYmF3NFk4STAzUjROS3BoQkxBemF4K056ZTh6d3FWTWdtazRUVjE3NlZF?=
 =?utf-8?B?RkRSS1RuVVBrZk1qUGY5ZHJCQzhMWFRSNnFQM2tPMnFQdUVjSzArdEN3K2lT?=
 =?utf-8?B?dzl4QXpaSitUeUJab1VwUTdpVGMrU09jeU96UklXMEluSExDdUx3ZG1Cc25a?=
 =?utf-8?B?ZTFRQzd3WjBIMXoyZHp0NU4vZlpqVTdianMyRzJSZmVLdS93cjlINHM5UENy?=
 =?utf-8?B?ak56SlZPVi9sQ2FrMWNnQ3ZWMFhaS2ZXeWR0NXRCdmFXd0Mzd2RUT1NaSFZy?=
 =?utf-8?B?WHNHMDFUakE5M1BrZnhRYWZ3eXhLSHQxd2FiNWU5eDFuQXJUa3JnWVh3bDRX?=
 =?utf-8?B?c0ViZTZEVVFlTFVpZ0tUYmRiaUZBVkRpdXRXRVA2eXZ0SFdNcnE5WFpsb2h5?=
 =?utf-8?B?TEd2ckwzbHl4cVVyRjlHSGVJTEcyTlhKZUZDWXBWWTM2QitMR1BqcWY2T3Na?=
 =?utf-8?B?WDZncVdNdWdubEl6ZFQ0UGN5NGhoZFVVOHpiN3dzT1FlUjVZaGRuU1NtdDl2?=
 =?utf-8?B?ejRHOFkzbkhpTU5reXdRWFE0ZlJkcXdLdWxoMGxIaGFUeGJIY2ZMVUtlY3pX?=
 =?utf-8?B?UXg4SXI2NGNNZU9YQWl3dEd3MloxU2paQ2dlTkpWcjZsNTFDekY3UXFxVG1F?=
 =?utf-8?B?UmdqNjhDaW5XQTFoM3Y2ZkJxaWh4cmRQTVBSM3VCb2d2cDdEUUh6MmdiaXFD?=
 =?utf-8?B?UjgwTzlIbGx6UmlObmxxcjJDYjZsRE1YaDArWTIwNU5XZHhSbWhZczhveGNX?=
 =?utf-8?B?dE8vODJidzI1eExZdW0wN3orSXd3V1lkUVByNlNjV1BxVy9oTjBHcjhlRXJK?=
 =?utf-8?B?ZmdTTDRSaHpsM090QUs0Q3VOMlUrMnNKSlB1Qm96a1c3bldkbFkvV0JaTTFk?=
 =?utf-8?B?dkw3YUNuSmZvVmptcHNsMEdnd2NUTUxINXBQUWdZOFBUenR2UVNjdUk2SEhY?=
 =?utf-8?B?aTJIL0hFbFZCNVZsMHRZWW1kdFRZQkF4Ny90MmtoTFR4VW1GSENCQT09?=
X-Exchange-RoutingPolicyChecked: 1nB91FPSbJzO/IchML5AS9cONACW5zakSIwlsn3JBuhefCmzSxtvfj/Nxmnvvh7mYYc70PWt/Iw/lVzp7dPvF3VIyqd5HDJ6bSViovyUFV7fZniiwnR+U5yowvqjjObAPThXPrqwuFW6ckfPxo0Ucj8TPLATMeJxloe6XHrQlJrwSJnEILmc1Wf6nhqoM4pI0IngP0++JFdDd4Lly25vLOGmJLqQyozYNwOAlOuK1QVflT8I7OwrfIeqMYJD5xbrVjqBXfXLqrd1UPzBY0E2OLGu3nH8+JYIrHBtenbTULlSc5nJJhrxx2fRu6G8DEalpOcAPnTuYLPZn5BJgHLISA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb1482c-d50b-48f8-6c22-08df458afe1a
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:45:38.1873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJF1fTA+piUpBWOdUdpgyO8EHir05oD7Z7Ituio0drkjF80gYkazmZ//btuS1RWZXBZZRX44oi6GK1e8p0qZrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF382351574
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------VSJC3vF2E62ZAXR0sqlStV69
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 18-11-2026 21:00, Nilawar, Badal wrote:
>
>
> On 17-11-2026 20:57, Rodrigo Vivi wrote:
>> - Drop the sdk_api_version check (it also saves a mailbox call). Just check
>>    xe_sysctrl_is_oobmsm_fw_ready().
>
> This is fine across D3Cold but not for module reload.
>
> If a user/developer wants to try a different OCode version, the new 
> version won't be LBed until the system is rebooted.
>
I mean the new OCode won't be downloaded until the board is power-cycled.

Thanks,
Badal

> Thanks,
> Badal
>
--------------VSJC3vF2E62ZAXR0sqlStV69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18-11-2026 21:00, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6179a816-4d28-4c82-b020-d6282c97c7d4@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 17-11-2026 20:57, Rodrigo Vivi
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:avxyUc1VLSYm7DbG@intel.com">
        <pre class="moz-quote-pre" wrap="">- Drop the sdk_api_version check (it also saves a mailbox call). Just check
  xe_sysctrl_is_oobmsm_fw_ready().</pre>
      </blockquote>
      <p>This is fine across D3Cold but not for module reload.&nbsp;</p>
      <p>If a user/developer wants to try a different OCode version, the
        new version won't be LBed until the system is rebooted.
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style>&nbsp;</p>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>I mean the new OCode won't be downloaded until the board is
      power-cycled.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:6179a816-4d28-4c82-b020-d6282c97c7d4@intel.com">
      <p>&nbsp;&nbsp;</p>
      <p>Thanks,<br>
        Badal&nbsp;</p>
    </blockquote>
  </body>
</html>

--------------VSJC3vF2E62ZAXR0sqlStV69--
