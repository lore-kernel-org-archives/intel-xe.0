Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802B8CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 21:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299B210E0A6;
	Tue,  2 Sep 2025 21:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ry32bhxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C2810E05D
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 21:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756847472; x=1788383472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UI4xtOkgqx2AXqA+DIY0JQLyns7e3jVfRPkV+eHanpo=;
 b=Ry32bhxb3fgdc2y73yIoddQIYszmeV5Fz9AIaumhLKiaoZ6B3d81MUo6
 rt6YeNpBJD7YgwAnHOe98hvcAP4NPArmpUEg2R+30cDA6uvzd58hNKYZo
 FsGXRZ6+P1kL3JteB531BV42gJTmbEeI4QyPO6LhO5m/KVMTVKDa5dq0M
 O0DpWzgaYx1aPHkFpRj7XD7stueZ/ijCS49fsq7UUfF9GTvnrX4K7c3+C
 NKKzfcHj0gwJO3AKJDUUgromZpzOuXMVrjXtEUX6fo2g4I/TYMh6J7DwA
 YLKffTZq9dfhFSKWAWZUBddXTAvHLiJl5Z1lGW184akTO0hjTwmleSdb/ A==;
X-CSE-ConnectionGUID: YKOoJlmsTr6FsRsTylEUig==
X-CSE-MsgGUID: PuuVuRP8RJeenBvyo1/bYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59082107"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59082107"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 14:11:00 -0700
X-CSE-ConnectionGUID: 7xtpwGbcTRmB+DtYz2VelA==
X-CSE-MsgGUID: kLdZKZWYQOydyyMrU6hI/Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 14:11:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 14:10:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 14:10:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 14:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAS/khmr7p23c5DRF89R2sTnSkCjB8IKODRIDAqiij2zFLviZ4kXCwjcRAFbDqBTE/dTq3sIKnPtTnc0QjrSceVtSyLvmJ3ugNpDhYwWirY4ZBRfvuhqtq/UOpamsKYeLReogzV24cl/2IPuLiEGvdUo8PZ82clQLyY70rA0164O87F8ZdehaHWskVe67JU6z8oTNP8ublYw2n/KpU2sVNbXqOeYu/BQZgBTrSQPX8ak3j/UFOjLv8ALgWIR+rVc2wIvS0cJRyKYJ0S+VmEVeGQis1hyJTTY6XP/QjfczcsRgq/lXLXX+StL/V3G7HVOtg+mQWTvjGY5d2MFV3AW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQLIZSgax0Upxn1O3/WyPAaqDOLdr5wNeim5rpZmmbw=;
 b=A6GPdXEmgOV5MkC+wHjFHtym5vsoP5GwzKKEs0ufpEjFacKM+pHtLiQTTJ1flts7chHVXvoQ09AnUczWhpbw5BnXxgeMbn20H3r9Ww1+hMb9N9Nc930KRKyWCWI7q5+Blp+bvNwFFD2isQ04OCQqYLJv1KjixeobxjeNq7y2+/nSZCFsWg5puOs04HdLzYD03rlbnYr+imEfsl1tM2a/5SSa7lvfujFKyJszuh3/JAcMdcSVQtUnSMabwlLSsC2AafqMBvMPDpU//3XDMZ2ytl0qdF4EkAp/P94j/WXWplud3FjAmy/1AEN5AkKUDRzYzYR3W85lWlvRo84eWVJmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by LV8PR11MB8769.namprd11.prod.outlook.com
 (2603:10b6:408:204::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 21:10:56 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 21:10:55 +0000
Date: Tue, 2 Sep 2025 14:10:52 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>,
 <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tangudu Tilak Tirumalesh
 <tilak.tirumalesh.tangudu@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe: Extend Wa_22021007897 to Xe3 platforms
Message-ID: <aLddXOsbPyXeLDIL@msatwood-mobl>
References: <20250827-wa-22021007897-v1-1-96922eb52af4@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250827-wa-22021007897-v1-1-96922eb52af4@intel.com>
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: aec2053e-7ba2-46ba-30a1-08ddea6534d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NndPdVlWOXN5bnJEU2Z2cWZVWk94SVFQNXJZeU9hdG5oM2h4b0kra2JoVWVv?=
 =?utf-8?B?RmllU0srbjRXcHI1OUJXdFlUMHh5Q3hyS2JnUVcwRGdmWFE2ajMvSjVOWXdR?=
 =?utf-8?B?b0h5S1pNMG1QSlM2cHZ3MlJLVDQ1b2JrZldoVDlwNmVqWjUwUHhUWFB1ZnZl?=
 =?utf-8?B?MlJoUFF6TXZkcnpHemZUUEp1d3FPbm9SK1JWcUpML0tFdVgwUmFKSTIxVnd3?=
 =?utf-8?B?OFYwWkpPTy9seW1TbE1kSFNRMlo1WHl1RU5ub0FKWGZMMXRSMm9MU0Z0aTBu?=
 =?utf-8?B?NVpiSElUblN3QVlYekFKUXcwTnhtRTFEZkx5YkIwOFBtTE41TmQ3UGlVM2lR?=
 =?utf-8?B?MUlLTHM1VXN3ek5kMEx6YXk3YzdBNDVPOXY3aW8yMWhIVFdkWVdDL050RDlR?=
 =?utf-8?B?Q0FJM3NQOWUvU2NhakRWOUFoYWhUSEY4MW1qY3ozeURoUGFpc1NqTXRVVk9r?=
 =?utf-8?B?S294bjZib1AxOEdBdnFLV1lpZ1Ftc2k5V0FmeUU5TEUxWWhEeGJBdkhONVdS?=
 =?utf-8?B?MzYwendSckliaFg3VEorTkR0bUMvMEdMb1lUc0NtbEY2TmI5WTBnc3ZmSCsv?=
 =?utf-8?B?NmtTUjVvTmJzR1JRaEZaQUVaZm5TclByRU5aMU41bzN6Smtva2tNMVFYQUlw?=
 =?utf-8?B?NzlwVDFXYU1ycXpMME1Sa1ZGMXEwRkpickgydGpxSmtWUUFrTnJPZnZlS3Fk?=
 =?utf-8?B?bEtrMmpqYStGUDkzNmhvNXJQREVLZUtMSWFoS0RON051WkZBOVBSaFpMUCt4?=
 =?utf-8?B?TEpJcDVwWWtNdXpsMk5RcnlPVnVad3UxMytENWQvRUkyUDBZWklKR1g5Z2Ix?=
 =?utf-8?B?TnplcXd3dTVtUTRzWWVaNzQ4bFFKamdQdHhKWml0SmQzeXp3eGNMREV5V2xS?=
 =?utf-8?B?NTJkd25jMDBLMHRPREpweHVjWmpBWldpMDZ5SkxvcjdiNVBySVBzMWVJQXBt?=
 =?utf-8?B?azAxNDlGMzd1NlVqL2hjZ0szb0JzOEFNM1FOQVR6WHpVL2F3RlRoY294dGVX?=
 =?utf-8?B?S1RrZ091cWlPVlFaakF0ZlJzVXdNRkNJZDN1bmNzWmZqZy9vWHZ4UmU1VDdZ?=
 =?utf-8?B?V1lLQUJBcVJPdjNURCtIZzBCRHRtUFlyN0NydWRDeHdBclY5VFh5UVh2OGdm?=
 =?utf-8?B?c3psOXVsellRQkdmdVNFVmlpQ29QOU9GdkFnYTJaYWQ5NklOb1hwN1FnMU1K?=
 =?utf-8?B?eEpFMHVqZUVYRFY2Q3dFYk5sVEtaL3lZV1dmd2x6aWpROXhjWkZCbmJTWlh5?=
 =?utf-8?B?aU0wd1MrR0FKbGhGVitJWC9qZHg1SjJlbFo3ZE5HeCtjbUIzWFlreTR5Q2JM?=
 =?utf-8?B?bmFZdGxsMWVYb29RUzdZSjAveU1pRk5WVzlTR2xpQnpYUzcrZVZTVjVzUUo1?=
 =?utf-8?B?RXVRNmxaZDhmbm84M09RMUVrSDA2MXZSR1NUMHJTaHdyNXVlUkQrRVc5TVJS?=
 =?utf-8?B?SkxRTXdjWUlRZ25QdnIzZnREbXlISzRGNEprUGZzQ1o3YmtuYnRrekZ5UXVF?=
 =?utf-8?B?Ui8xSHUrak4rR0p5NGVaTkwzY2Q4a2xxU25rUXhnUUxzTEpDb3NIYjhnUmIy?=
 =?utf-8?B?LzFJNlBjUkwvV2l2dXRlcnE3bnl5Z2pBU281YXZ0RDdNZzBKMGZVZ0NDU1lI?=
 =?utf-8?B?S0lTVGFZMHY5MzdYT1IvY2E1U1lEbUJRN2xFeEZTSXM3cVExMGlxZDJWRE9R?=
 =?utf-8?B?Q3Q5OUlveU5DeElTNDQvOHRxZWMvRTJBdmIydkNHcGM1eVFjV0xFKzljZitY?=
 =?utf-8?B?bWNGTG9FQmJMRVFJVk5hMDNEd1FEMnBzdWRnZXBTYTNnWkJWMUk4dUV1ZU9Z?=
 =?utf-8?B?TDVIaTdKVTV5OVArNkMvcWJwMEJCQkF5UXphbGsrYitjR3pyQ0lZczh0eWlm?=
 =?utf-8?B?VWJGRmp5TWxpb2N0aDZ5a3lISkNDczFVM2wzSEs0dWduMlFkcnpWZk5MUUU3?=
 =?utf-8?Q?PEpiLHyS5ZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09qbloyL1QxQXdXemV2Rkx3dEV4SXhHNmxOMlpVK25rZ2R6SHVidk9pSkNt?=
 =?utf-8?B?K1VkZExLaFlhOTRGZ0hVMGF6R0lCSm9oQ0tuV2xGbEpxWEpiaXBKdithc0lJ?=
 =?utf-8?B?amovYkl4KzJjcE5yWUlhd0txa3JZeENoSkJYVmlTZi9GMllTRndJT09Kek9z?=
 =?utf-8?B?N3V6SmRBalBkbEUrdGdTZTVjN0F2ajl3aW13R3FOME9OZkcycUMrL1liMjBm?=
 =?utf-8?B?NHd6UFhxNlVONzlSY3B4a3A3OE02dmx1WmVxVHQzcjNSakhYVDFGUDJCbmc4?=
 =?utf-8?B?enJoOTQ0U09iMlByWjYzV0t5TVpHUThWaldUV3lkbTAwOFpWOUpybmZzNFQ3?=
 =?utf-8?B?SStEaVNweFhPVFh5eEdCaGx2a0xRZVM1eFR3ZWZXcmFYQUpLSTV0RDFKYkdT?=
 =?utf-8?B?UU1XMDJ4NlF4cEVtb3owdXMzcHF3YWI3MEVmMmUzUnYzK2hwNDNmQW1qaHVv?=
 =?utf-8?B?c2Q5UEFCUFEwR1BhMGR1U0pmN1JJTzJPaFJsc3NkWjdBQU9yaEw4R3lnWGFF?=
 =?utf-8?B?dFJJVEs3amc3VjhwT1BqVjJ6aUUyTG9xTnFZVWZMOTRFNWVmT0w1TWptNnJv?=
 =?utf-8?B?UEw0b3pRT2hSS1BXR1lDc0s5ano0SkR2STh3L3RQQlBXQXhxSkVaeEEybk9U?=
 =?utf-8?B?d1h1UmppOVphb04xWEVGU0Y1OU8zQUJDVnQrZDh0Y09USWxtOHgwTk5uNW5Z?=
 =?utf-8?B?c1p2N3pPYVRpNDgvNmFHbkdGeDhPVVo5U2t3bytCdDVIckJNdERHalU3elE5?=
 =?utf-8?B?eGpvM3N5U0E5THk5azlaZHFDZEdKS3crS2gxa2tSZUtWVGIrZXdSV1dMa0ZC?=
 =?utf-8?B?ZFhadjUwTUZDclpWUWZsbUZDMFlmbjl0WHZhTTIvdmNubWZldEdJUHhCZm0x?=
 =?utf-8?B?dXlROTYvMHB5Si9tdytHeFFnTThPNUtNZ2I3VE9KRFNyNDdkcnNzUXNOd3Bj?=
 =?utf-8?B?Wk1RTE1WQ0NyMDdncUtNUWNmVWZWRU5lb3F6UWozNmp2d240T01BcS94U3gw?=
 =?utf-8?B?QlpQUnBLVnJ3eUFVWXdtWDZLQVY2aWlEa1Q3Qi9qTHVsZUtEdGxGSExoMTN6?=
 =?utf-8?B?WVFMSEZ1ZXRlK0xYWVM3MThGc0ZCZEdlakF3Y3paYSthWlppYVR3SG5zUnRB?=
 =?utf-8?B?OXBtd2p2azBLbkJneDVZQ2NIZVhVZDVHQk02RVBDaWdWc2RxM3dhMnhXRm84?=
 =?utf-8?B?MDFpQXo5UHRIRW9WTHlacVo0ZUdNVENBMkJkeFZweGZwL1dqRHc3ZGNCK0l0?=
 =?utf-8?B?b21GNWRESElQbGs0Z3FFeUEzYlFKTk5VeGoyQXJzK0R5Smh5VlR2TWdhQXVF?=
 =?utf-8?B?VG10djIwc3c4N296UGgxWVpOZDlCUStjSHBoQnRWRit4SUUzWVp0NDFRbTFY?=
 =?utf-8?B?N2NGWGs3NWZ3OXFHMjFmMDdlR2xKcHRwdVQrMXpib0ZiRE9HK3lNMUlzcG51?=
 =?utf-8?B?VGo3WFUyVVlRUHBQQlhFM0ZyTmgrM284cXVUcmNibGIxRHB1N2VjQ2V0Z2du?=
 =?utf-8?B?b1VvOWZlTFFRWTJrN21OTm9ZaEgwOWREZE5HNXZGMGJjYTh2bVJzTnBlVmpX?=
 =?utf-8?B?alptbHlvUWs5cU5ucExGYzRJNHZDSzhtMWowdWo2ZnFBV0kydGx3Q09WNWdo?=
 =?utf-8?B?cHIyL3pycHdpOEtiWW50ZFhCaHJScEY1dlZFeXRacStoeE5xWWdnQ2dYTmVJ?=
 =?utf-8?B?M0Q1QklmTWMxZm9rS0FFMm4vb2R6OUd6eFBGN3hIRFNRWnZWelFQQXRFUTVO?=
 =?utf-8?B?OU5iNm0xcGZGOWZIa3VLdWRkM05ta0lDZ0d3TE1RdUp4eWlpS2RrdEp3RUM1?=
 =?utf-8?B?VGExM1Z4L2NNWjZQbmI4OTB1U1BEL2UzR01TVnpCMnV6RVVlYVNESndRNmc0?=
 =?utf-8?B?RGo4OVBQejRuV0tzYk1admJkdlBsZVF5N3dSY0QzVlFGVFBiYnFjSGxHeVlP?=
 =?utf-8?B?anBRSHdueTg3NC81T0tSNHhNQ1crV0hnSnJYR29oQXpucVRKUFNYcWs4Tnc0?=
 =?utf-8?B?cTZFN2pwb3Q2OXd2QitXWXhrWG54aVNxRjdUV21vakNqQ0ZHOFlPZUcrZVZN?=
 =?utf-8?B?T1BKS3BKRjB4TVpkNUhyYTVZbDE5TzZuREZ5RHlsNHdqdG50TXAyekIxNzVv?=
 =?utf-8?B?SEtXWVFXWHJNQWhEUDYrN1JPbmU0RjRGbkY5czlzd0g5UWhSVnBNbTRrQ29s?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aec2053e-7ba2-46ba-30a1-08ddea6534d6
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 21:10:55.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhJKOzLTek8GNTziyV1YN7csT0As3I6cfN84GFWlGIIO54e3q7GUtxPqBZAddR3gEGQT8fGyIK/qPbok8U771gOA1S37zF50ymrUbNO5NLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 27, 2025 at 12:57:55PM -0700, Lucas De Marchi wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> WA 22021007897 should also be applied to Graphics Versions 30.00, 30.01
> and 30.03. To make it simple, simply use the range [3000, 3003] that
> should be ok as there isn't a 3002 and if it's added, the WA list would
> need to be revisited anyway.
> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 52c7df4c3afd8..e53edf1e5100c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -879,6 +879,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_PARTIAL_AUTOSTRIP |
>  			     DIS_AUTOSTRIP))
>  	},
> +	{ XE_RTP_NAME("22021007897"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> 
> 
> 
