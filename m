Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C84606A33D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nmrwR2Yk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E0610E4FA;
	Thu,  5 Nov 2026 17:09:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D453810EE88
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793898593; x=1825434593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FocQA8y2NdvsB1DQRTJVDlFFIAdZtvZCY06GgQ/+0+g=;
 b=nmrwR2YkF5AGsZF6QPHXzPB72YMIphBNHg/Hp5eFOtXzQTNEc2JvmzKh
 zfYGnRMHcHLoVKrXn3FHm7OwZREoIQmpe33557o8Whg3X98D0c6ZY/rJr
 rIFU+dZDTm6VBJZ4d/MGVxADvQ9oTBpqMGiyMl1eovxChp2JrKQbDWX5g
 Dpw6DJSPzJALR8NcJXStGckUajAdSKXAwJ7j4xGc5i6EF2X8I6HHtpHzh
 CQ+69LZamk7o6sJEaX+aJmFfCnCTVzGm5QcnZW8UDfdzNRMQBQpZ5ltpb
 FIsWPibhHolJdeTtO73IX+sUcGvi3PBzho+vxSGF4bO0/Ba/9KMN2+RRq g==;
X-CSE-ConnectionGUID: sf4+hCkeTuqN8zj4XsovUQ==
X-CSE-MsgGUID: f9lVX7TYSYy3nh1+bMNrNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2722346"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2722346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 09:09:38 -0800
X-CSE-ConnectionGUID: eiXwaLW1SD+b9RudnMWqhA==
X-CSE-MsgGUID: mj+5uI5DQHeGJZ+Lu15CYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7056628"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 09:09:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 09:09:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 09:09:37 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 09:09:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6iW/S7KUIIxAzWvPHMrCqY6Fd9386U7LEcO6uGyBiJYCW+5yqKxSiK6wNqsNexAtQpaExW61SUknsg2R7VS6Fg9ko434j69igm+71Hqe6cr41JE8S3S1oHl7IiKU7iIQOKZpz+ait7pAeluVYwbUFkjoQ5b5dtTIeEuVJl40Z69Q9xNH/H6OXE4TiM6HiEQjqp+xN/0h7PrYNLzzLDovpREpPyLAoyPAN7zAy1G30pgCDPz5w0ca1ZOq/6b9K9C+beeZcZu2KFGBVbC913Tw8Da3R6DQ8ts6MQm2dOv3hhemAvz7N/9eE7k8sP+1KSXWXAJvq+MVRc8ygwdCDmbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXrMFVF4pA9u5/V+Nn/C+CswhwLCZyTF9X9HtU2VrGg=;
 b=WiSiLwIJ+dkvP4O8Ywx4hzMHjlVkL+BtsHUnpgvFSzobRgsgZsyVL+2P587/GM4FdL8b3tcdWkemCmQJsttFtiRv0kQgeDpklAMLyQI8EizAhwI9sxpxxeZXaoS9Jy4RJGhqhOx/Ea878iShuKoXwC/dwYmimqrI/t6wgdF5osKiLJqCPJlYMo53Fb78Pja9C4gZ7rywbHl92bZhzgsDfoTmdfgq1gzGgqSz+1RlimS0GTUG6gU/fiH6+AQnxK/75FRAP7kDKM+Kw1Y8ZeGUQPVl3hOWpjDViRBy+J+BKqFx6Dwel4GGYPJT9E3FtI+UYUcl7dkqpdsbeCSmH+e/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by CC6PR11MB058488.namprd11.prod.outlook.com
 (2603:10b6:170:200::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:09:35 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:09:35 +0000
Message-ID: <146734d9-e23c-4f0a-bf15-54b97b9f76b0@intel.com>
Date: Thu, 5 Nov 2026 22:39:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] drm/xe/hwmon: expose pwm[1-3]
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-5-karthik.poosa@intel.com>
 <f0cb6786-c5af-41d7-ba7a-463eefeb42cc@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <f0cb6786-c5af-41d7-ba7a-463eefeb42cc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0078.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::6) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|CC6PR11MB058488:EE_
X-MS-Office365-Filtering-Correlation-Id: 185bdec2-a7a5-4a92-c852-08df3b5f90dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261022075727099003|261026121527099003|4143699003|11063799006|261021123027099003|261021121427099003|261009223027099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261022105027099003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /6N3f5XZ5IiMfvVnHcMOsqq0lwEqJ/95Ttt0+TANHlQGioPPSPo5X2wGgKKKE/3SC9Ie7CDG9yk/o/xERWbL0qhnibHGammiBuhzVRlQAEywXJwiNc2mTkgAhad038aiOGCDjHSnNAHy2wZ8gQRTL8cLy2uPim2+mX9aQ7W56j6zE415SrThzXN7r/xo3UKqnze7e0t2chxBdhf+f1GWZz5ySY9Kk41MuV7HD9c81ioKz3vdsOEsSlOaeUT0h5ovjNFSfII36MJczXVKo2v2lTwAaUYE8YmWNHVVE3i09vExZQ2Vdv8pqgjg981xxIkngMN8WM2lRthAjwoY3NEyIBapi86ISH/WbgDfPj+KpwXjHFdgzi1e/7GPgkL70OBv+2LimT3AxML97VrXtO1AvzsSpfBeti0/MunPzeH4gVvXO7JInQWEIU/OeGXBgpjhX/+y9Tgr7tUlXgLiGmME3F88Y7WuI4O/iU/ypEoqQdTzBBolNz+0rnlNPrFRbUSaK7FEMP3s0SUPuiUtDO4H0/GG1caz4ZqHq1AEtUolt5qpOYQfSNUkNqrHEMJqMtqUiDJ14DpaOOMK4l5A4hZuJFngL1MtJIEHm3OMvq17MamHY7NQrpp/wN7U/+Ly5CeCHYNH+I6j5+zPsrrI4h8x1CxwKLNpBSeJ5fDCCd+5fiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261022075727099003)(261026121527099003)(4143699003)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTNZMGZLUmgrNExzd0NUTTd6RXhUU1oweWpuYktwVWJmZEY0aU1CaDdjT3ND?=
 =?utf-8?B?RFh6WGdqUTV3NzFxQVJGVUY3YnQzQlphNXJlamdkakhWSzBLLzFFVENvb3Bh?=
 =?utf-8?B?MFgrYit4TUR4Ynh0VWpxbjR2TUlpQnJTVGgzeFp3QTNBL1BUVi9MeEhLc3Aw?=
 =?utf-8?B?b052QlNLSWJmR3d5WUVHcllHWkg0U2VranhFSklPOEdQZmtWdFhNT0dWWUpL?=
 =?utf-8?B?NUhNRllmMXFaVmxzYjhGWUNMTVpENGFhTkw0cjMrd1plK3dqekVLOXFJbTVx?=
 =?utf-8?B?RkY4QVQrdkFSajFtVW1CY0pwcS80M0dqcWRSNmZDWk9rN1BqQUM0dFFBTFdx?=
 =?utf-8?B?YUJLUkJZV2pVbUdEMFY5ZWFHcVRiNWV5ditYTHhiUHpZMi9kQXBTZjBkbDVS?=
 =?utf-8?B?M3lQWDArejd1ZGYrcjI4UktSOGttdXRIdkpRUnZNSmV2QW9KS0FsdHBmSFdr?=
 =?utf-8?B?QWxSUDNGNFdici82elFuUHFCMDhZaTRoZjZ1c3A0T3dQeDgzRWY0dFM5eTlK?=
 =?utf-8?B?RWVGZlFtVTY4bGhEY2pxU1NLUWpJdXFnUWYvWitRUXJ4SXZpM0EzZ00rUVdP?=
 =?utf-8?B?c1B3eUhGSHlyL25rVDIwL0lITDRyRU8rTFh1TDhpQ25XbXJxRkNrekZ2Zlkz?=
 =?utf-8?B?cGZPN2dhZE1DVUY1UnMrWFBSTTNLMWV6Z3BlcjdZVlhhbWd5bmI0dXRsUGxT?=
 =?utf-8?B?MTBHTG45T0xDQ3M5eWZRb3FYYkNwZElnQTFSaWZ6Zll0bVlPS0ovQjl2N2l1?=
 =?utf-8?B?azZlUW05YWdodUdZa0NMS0FHR3J6eUVDeDhXMnhPbmJkekRxR1l6STRBcURr?=
 =?utf-8?B?RTBXREQ0N1Z6aW9EbnFBZXd5U09KMFpCbFYwTzU5THEyc1NFWEljZlJMclUx?=
 =?utf-8?B?KzdSYUl2eTJFMFpFbThEM2FNbGdPZ2hNZzg2d25ibU5YdC9YRjYySXFHTzhL?=
 =?utf-8?B?NzN4cFJqUHJ3T014SFRLdmhtTlc1MC96ZWdBNDk4eXFTK2pHejZONXRsZVhW?=
 =?utf-8?B?eDVzTTdiVXVpRXdmZ2tpNjdJZVd5d1dMUjRWZXA0MmdkeGJiYlBlUEF4bkFu?=
 =?utf-8?B?SktJbXpINzAwVFl6aVNDL3crNUpDVUxxdXNaYi9JREo1M0pkSm1Ja2o4TTF5?=
 =?utf-8?B?TU5VTmhuSDMwd0c3cjI3ZnQ1TnZwd2tTQ2FmUTl3WDMxL04rbGVlM0svdlpo?=
 =?utf-8?B?ancrVUVmM3htc3ZRK0ZNamNWUWtKamxNb3EzbHlUQ2RtY1ExMmwzTWFPZDd6?=
 =?utf-8?B?VlRDaFBva3dDTmVYSHFwVUdoaWl3QmZReDBNR3h4ZUdEc09UeEZMcFEzNzJw?=
 =?utf-8?B?bktSbTVvbnVSZ3d3dG4wMkRoY3BGeXJrYlJMQ0liUnFkelUvNUZjR0owdGhh?=
 =?utf-8?B?b1RJOGM3UkRKaXQvQjcyQlhhMU5TSlBDVmxTT3N6S3QyUG9ET1NmUjEweXhG?=
 =?utf-8?B?Qk4yRXc5QUhOWDlGUktwWWdQRWNxc1NtTzN4OGhmcnNIaDlBRkw3a1Y3V0VN?=
 =?utf-8?B?b2QvMjhvb2NNVm9lYmJDWmhGYlFGeERzRTQ5Y0JNQk03WktDYWFuVEtXb0dF?=
 =?utf-8?B?aFIyK2JBMlg2dWt4SXo3SmxHaklySDJyNDBnUTBia2cyYnBZVk9FWHQvUE9Y?=
 =?utf-8?B?UGNweDM3MWZDTDVnTG9hRTFQTDUwRTR5Ri9zQ3cvNndZY3FOVTlGdDJZQ004?=
 =?utf-8?B?T3R5QWZPbnN2cE1QT3ZaczV2WDcwTW1NRk1kQ3RLODJuMWFvMmpPc2NDNkQx?=
 =?utf-8?B?YWtyNEM3ZHpXaXBSbDlvZUoxR3g5MEQ2VzhCemhwUEIwd2RnakFzUzZueTh6?=
 =?utf-8?B?Q0RENlBkRDN1RWhrZ1Z5ZzZYWmFham9XT0J1S2RJVjFuc1pFWGxRcGNySTNG?=
 =?utf-8?B?ZFVTRXdrNnkrdWFYOHlEYnpFenZQalRjNlYvOUVBL1Z3NllENVJ4SHhuNkhZ?=
 =?utf-8?B?ZlZBN01PbGw4dmNMNTNlV21ML2k1QzhDMVVVNGVUazF6dmxBc2JEUWNOd0tW?=
 =?utf-8?B?Q0lOZ21uVjQzRmxQNnN4Ty84ekNTaFp4VDNUTXRTRGkvUVFTczVTL3VwaWpF?=
 =?utf-8?B?N0ZlNHN0ODFLcTBTVndMaDBGcUt4QWRnTDlGeC93TDZkMDVVYW5RSWZJbnF6?=
 =?utf-8?B?TGo1Zm9xK3M3d25NeWFVRUdOU3lZSXJ5RlZsVUhhZTBKTkN2SlB1VWluOGMy?=
 =?utf-8?B?cjNscFR4bGIyQ3dXSXFhaHdYVXZ3ay9YSEZra1VremVxM0toa3Y1dWlVaVpU?=
 =?utf-8?B?aGtONWhXdDl2YTRLNll1cGVQV3hIVXBleHB0YldTUjVnSU1CTnVOQXBzK2pz?=
 =?utf-8?B?YlRqVi9FMnhNMzl4ZlNqV1VjYkkzbTJ5YTVkeFFsdUs1WTNRWkpTQT09?=
X-Exchange-RoutingPolicyChecked: TS7JFHmLjklV/jVyXB5Fmr31mOpKbeMYamtIrDdWgmKtc48/OqadEfOiF/Uz0C0+ej4OqRsDDksMFoJw/nSFcU6xlT4CWGpeoEhCvU3m9fBYJvYLncmkhOnIQP5Lx4ndPZbAvng7JoCbV1WjDHjRaC0mj4IzyoPHK9j6zVWuyqlc+Ebi0rkSPl/ZX7uKiO9yxPyKMlXe0DJlgsHvWuK1Z2qMvNWKFWZxr+RXJ2jfjZbM3ACgra/0eSsqMWw8YTuT15ukCqKe2wUdqWgPrd1pEc6hbnYuuk/b02eeu/lKlsgr+giKF8V+hsRyeHZ+gWXACi817h6lbH7qeQ//BViJWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 185bdec2-a7a5-4a92-c852-08df3b5f90dd
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:09:35.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTrFtIdvCmwQGBWXbh4dHgd+zQ3p2OiaGt6PxxfSNIlDhotJKSM0Dazhw3Qz1XVNcZVcD5PEHx9PmJg1PE4GfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR11MB058488
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


On 29-10-2026 17:01, Purkait, Soham wrote:
>
> Hi Karthik,
>
> On 16-10-2026 00:37, Karthik Poosa wrote:
>> Expose pwm[1-3] fan duty attributes through hwmon.
>>
>> This enables reading and writing user PWM values (0..255) for each
>> available fan channel.
>>
>> Update Xe hwmon ABI documentation for pwm[1-3].
>>
>> This sysfs node can be used for manual control of fan speed,
>> irrespective of fan curve.
>>
>> v2:
>>   - Use xe helpers for dmesg logs.
>>   - Avoid using hwmon->num_fans to get fan count in
>>     xe_hwmon_pwm_is_visible().
>>
>> v3:
>>   - Set PWM directly through the user table; avoid initializing it from the
>>     stock table. (Soham)
>>   - Move the unused xe_hwmon_activate_user_fan_table() to the subsequent
>>     patch.
>>   - Fail pwmN reads when no value has been written, rather than activating
>>     the user table from the stock table.
>>   - Define MIN_FAN_CONTROL_POINTS as 2.
>>   - Use MIN_FAN_CONTROL_POINTS for PWM configuration. (Soham)
>>   - Use batched writes for configuring fan control points when setting pwmN.
>>   - Add and rephrase couple debug logs.
>>   - Update the hwmon documentation.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> Assisted-by: LLM
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 170 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>   3 files changed, 182 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 5ee68aefa485..ce17e9ca3ed8 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>>   		milliseconds over which sustained power is averaged.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
>> +Date:           October 2026
>> +KernelVersion:  7.3
>> +Contact:intel-xe@lists.freedesktop.org
>> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
>> +                fan speed and 255 is 100% fan speed.
>> +
>> +                Only supported for particular Intel Xe graphics platforms.
> Use tab indentation after the field labels.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 32016c5d4770..a86ed741feb3 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/jiffies.h>
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>> +#include <linux/delay.h>
> Is this header required ?

we can remove this, i think this was part of some temporary debug code.

Not required. This was left over from temporary debug code and can be 
removed.

>>   #include <drm/drm_managed.h>
>>   #include "regs/xe_gt_regs.h"
>> @@ -153,6 +154,9 @@ enum fan_table_type {
>>   /* Maximum number of fan control points supported by each fan. */
>>   #define MAX_FAN_CONTROL_POINTS	(10)
>>   
>> +/* Minimum number of points required for a user fan table. */
>> +#define MIN_FAN_CONTROL_POINTS  (2)
> Use tab indentation.
ok
>> +
>>   /* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
>>   #define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
>>   						((POINT_NUM) & REG_GENMASK(30, 0)))
>> @@ -913,6 +917,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>>   			   HWMON_F_INPUT | HWMON_F_MAX),
>> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
>>   	NULL
>>   };
>>   
>> @@ -1154,6 +1159,89 @@ static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
>>   	return 0;
>>   }
>>   
>> +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
>> +					enum fan_table_type table_type)
>> +{
>> +	int ret;
>> +
>> +	ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> +					      (table_type == USER_FAN_TABLE) ?
>> +					      FSC_READ_USER_FAN_CONTROL_POINTS :
>> +					      FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +					      fan, point_count);
>> +	if (ret) {
>> +		xe_err(hwmon->xe, "failed to read fan %d %s point count, ret=%d\n", fan,
>> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (*point_count > MAX_FAN_CONTROL_POINTS) {
>> +		xe_err(hwmon->xe, "fan %d %s point count %u exceeds max %u\n", fan,
>> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count,
>> +		       MAX_FAN_CONTROL_POINTS);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* Temperature to set when setting the fan PWM with pwmN. */
>> +#define FIXED_PWM_TEMP	(1)
>> +
>> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>> +{
>> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
>> +	u32 point_count = 0;
>> +	u8 clamped_pwm;
>> +	int ret, i;
>> +
>> +	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
>> +	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
> Is clamped_pwm and  fi->min_pwm in percentage ? If so use 100 *instead 
> of* U8_MAX to be the max value.
you are right, will change it.
>> +
>> +	/*
>> +	 * Set the first fan control point in the user table to the clamped PWM value.
>> +	 * Use only the first fan control point for setting the PWM value.
> It says "only the first fan control point" but the loop end up writing 
> 2 points.
will rephrase this, fan control needs atleast 2 fan control points
>> +	 */
>> +
>> +	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
>> +		writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
>> +		writes[i].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, FIXED_PWM_TEMP + (i)) |
>> +					    FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, clamped_pwm);
>> +		xe_dbg(hwmon->xe, "prepared fan control point %d with temp=%d, speed=%u\n", i,
>> +		       FIXED_PWM_TEMP + (i), clamped_pwm);
>> +	}
>> +
>> +	writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan);
>> +	writes[i].data = MIN_FAN_CONTROL_POINTS;
>> +	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, ARRAY_SIZE(writes));
>> +	if (ret) {
>> +		xe_err(hwmon->xe, "failed to write pwm %d for fan %d, ret=%d\n", pwm, fan, ret);
> "pwm" has been reassigned to a percentage by this point, so either 
> print the original 0–255 value (keep it in a separate variable) or 
> label this one as a percentage.
ok
>> +		return ret;
>> +	}
>> +	xe_dbg(hwmon->xe, "applied fixed pwm %u for fan %d\n", clamped_pwm, fan);
>> +
>> +	/* Verify if the fan points are set */
>> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
>> +	if (ret && point_count == 0) {
> On failure point_count is already 0, so && point_count == 0 seems to 
> be redundant.
> Instead could this be more usable :
> if (ret || point_count != MIN_FAN_CONTROL_POINTS),  if the valid write 
> needed to be checked ?
ok
>
>> +		xe_err(hwmon->xe, "pwm set verify failed for fan %d, ret=%d, point count=%u\n", fan,
>> +		       ret, point_count);
>> +		return ret;
>> +	}
>> +
>> +	/* Update the user fan table cache. */
>> +	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
>> +		fi->fan_table[USER_FAN_TABLE].fcp[i].temp = FIXED_PWM_TEMP + (i);
> Drop the parentheses around i: FIXED_PWM_TEMP + i.
ok
>> +		fi->fan_table[USER_FAN_TABLE].fcp[i].speed = clamped_pwm;
>> +		xe_dbg(hwmon->xe, "fan %d user table cache point %d with temp=%d, speed=%u\n", fan,
>> +		       i, fi->fan_table[USER_FAN_TABLE].fcp[i].temp,
>> +			  fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
> The arguments don't align under the opening (.
ok
>> +	}
>> +	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
>> +
>> +	return 0;
>> +}
>> +
>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> @@ -1774,6 +1862,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	}
>>   }
>>   
>> +static umode_t
>> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>> +{
>> +	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(channel))
>> +		return 0;
>> +
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +		return 0644;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>>   static int
>>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
>>   {
>> @@ -1828,6 +1930,67 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   	}
>>   }
>>   
>> +static int
>> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>> +{
>> +	struct xe_hwmon_fan_info *fi;
>> +	int ret = 0;
>> +
>> +	if (channel < 0 || channel >= FAN_MAX)
> Add a short xe_dbg/xe_warn before these -EINVAL returns for clarity.

this can be removed, as pwm nodes will be created only for available 
fans, so there cannot be channel outside the range.

2699 static umode_t
2700 xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
2701 {
2702         if (!hwmon->xe->info.has_fan_control || 
*!IS_FAN_ENABLED(channel))*
2703                 return 0;

>> +		return -EINVAL;
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	fi = &hwmon->fi[channel];
>> +
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +		/* Check if user fan table is set else activate it.*/
> Where does it activate ? Use space before */.
Activation code was there previous version, now we read it from cache 
else return error.
I shall remove this comment.
>> +		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
>> +			xe_warn(hwmon->xe, "pwm not set for fan %d\n", channel);
>> +			ret = -ENXIO;
>> +			goto unlock;
>> +		}
>> +		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);
> The 0–255 <-> percentage round-trip is lossy for small values; Better 
> to add a one-line note since the ABI says a full 0–255 range.
ok.
>> +		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
>> +		break;
>> +	default:
>> +		ret = -EOPNOTSUPP;
>> +		break;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +	return ret;
>> +}
>> +
>> +static int
>> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>> +{
>> +	int ret = 0;
>> +
>> +	if (channel < 0 || channel >= FAN_MAX)
>
> Add a short xe_dbg/xe_warn before these -EINVAL returns for clarity.
>
>
> Regards,
> Soham
same as in xe_hwmon_pwm_read.
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +		if (val < 0 || val > U8_MAX) {
>> +			ret = -EINVAL;
>> +			break;
>> +		}
>> +		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>> +		break;
>> +	default:
>> +		ret = -EOPNOTSUPP;
>> +		break;
>> +	}
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	return ret;
>> +}
>> +
>>   static umode_t
>>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>   		    u32 attr, int channel)
>> @@ -1854,6 +2017,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>   	case hwmon_fan:
>>   		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>>   		break;
>> +	case hwmon_pwm:
>> +		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
>> +		break;
>>   	default:
>>   		ret = 0;
>>   		break;
>> @@ -1883,6 +2049,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>   		return xe_hwmon_energy_read(hwmon, attr, channel, val);
>>   	case hwmon_fan:
>>   		return xe_hwmon_fan_read(hwmon, attr, channel, val);
>> +	case hwmon_pwm:
>> +		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> @@ -1901,6 +2069,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>   		return xe_hwmon_power_write(hwmon, attr, channel, val);
>>   	case hwmon_curr:
>>   		return xe_hwmon_curr_write(hwmon, attr, channel, val);
>> +	case hwmon_pwm:
>> +		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 32bac74c4281..80642bee0ac8 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -82,9 +82,12 @@
>>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>>   
>>   #define   FAN_SPEED_CONTROL			0x7D
>> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
>> +#define     FSC_WRITE_FAN_TABLE			0x1
>>   #define     FSC_READ_MAX_FAN_RPS        0x3
>>   #define     FSC_READ_NUM_FANS			0x4
>>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
>> +#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
>>   #define     FSC_READ_FAN_TABLE			0x7
>>   #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
>>   #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
