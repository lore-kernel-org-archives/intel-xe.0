Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF2CC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 19:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E96010E76D;
	Wed, 11 Jun 2025 19:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8DBjzzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390B10E76D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749671260; x=1781207260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ezj08LQGG6hzcsy3OpOLSD8KAZb87Pixl/LvFGDT1mU=;
 b=W8DBjzzVSQsPDlGChFaMCKeoB3wtUzHGMyFsBzNJlw5rAFqZ5d1YUCqL
 fs/fkWqtEpmtmH9woUXQ4bMpph4HJ/spv08U+eoHCm9YkfSXD0h5SX1Di
 cRec7weUk/a8G6bA5WWL4Yl+FOsaU6FxhZps06GkgZImPEXljb6B9BADX
 c77KI6hFHIXdfWg0bK7VCcoQUX/fhLJN8lRKfReijj0HCtSaUAu8BIaVT
 BxxS0iKA4PQ0lmUF6IJNxxZrWaCAQxaFGEeBfKbPTAyN9dG8kyMgAoQWv
 ROs2Uefupo4uUCa18FQBvy4R1bsSZtiwWSZ8O7ENArCbhja2/rn1RDOHD w==;
X-CSE-ConnectionGUID: BoTa6tlEQ1CMOdPJu0Nh4w==
X-CSE-MsgGUID: fKojIt5XTNqrOmO1hQt1NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63236343"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63236343"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:47:40 -0700
X-CSE-ConnectionGUID: VSa/DZPmRM2O2p+kfXpojA==
X-CSE-MsgGUID: UdkkN2J6R2mDDCMD2MpXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="152563886"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:47:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 12:47:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 12:47:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 12:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVtGYfj3mWjrR14OF+I840iPkt3QKSUO4JaSVUtmOFV81VRdJq9BKwEP5IcStwtl8T9PgYo4eigB6O6r0VN5OU9lZrAhHhwW2yNJfMt+kBZ9Kc0fuo5MTukWgHZRaMX700XtbwlDf2IAsCuIgbN7PcYJBMYq3qTsKNof3W8FQlEWeRjSpWHLaECp02fo2xA8NbyB40Oj24s/Y4XjUfmcXoDAI0DvbBeMseOecE2/Iy+w2B1MzMticTJ9/tpx2s9Lm2E067tVmKD5J+RGtjtAdj6XaOI/yttxGUaBryk9zj+6Pe91cCQxmd9N4ql8Nmc/1LUZIySL0tTSwmaExHIcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ezj08LQGG6hzcsy3OpOLSD8KAZb87Pixl/LvFGDT1mU=;
 b=BK7wy+PdMe2jxBslZ77GPJZrIBkPPL5kdI1xvPv5D5n+J4Vab+jXp0BDoAmArHqsaH//cxkV0wSDMvIHgMWqs85sSMXDrNtF5I/iH/4A46nogxw0bWhhLh7nUUA9crKbafqoYl/MzgphMCbpBNWDOz96LhGTUV6eXyEkAPOpWCZFfOVBZ+lMnxgaLBPqhD6TSCvF2U92AtJcEJdcj08U0XyE0xkdCSMxys2xLNH1DKEkcPGuSHDKZ/aWzkGAfsRyAFown19jzGi46ok8xFVs2OAamai62qPGgQh0J69aJJH90H7Q4midAoO9IeJvZBl7/pil/KgWJgRM9TBQ8XLILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 19:47:35 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 19:47:35 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't use drm exec locking in SVM pagefaults
Thread-Topic: [PATCH] drm/xe: Don't use drm exec locking in SVM pagefaults
Thread-Index: AQHb1K50HMLFung+5EOtQQQ1nF92arP+afwA
Date: Wed, 11 Jun 2025 19:47:35 +0000
Message-ID: <4efd6ad0af5f8dc2cd04d85ce8afda53ed6cb2a4.camel@intel.com>
References: <20250603174012.2195759-1-matthew.brost@intel.com>
In-Reply-To: <20250603174012.2195759-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB6845:EE_
x-ms-office365-filtering-correlation-id: 68cf97e4-c486-4811-db75-08dda920d059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RThIYVhrN1I3eStKejJYcm9jWGJuVjBsVW5qUTRjeVBUdjMvWUdmL1B1K3dt?=
 =?utf-8?B?WVB4ZW5zSlBVaktSREwrYi8yR3dGTVZqRHgyMVpIYXd5OERCN3pkZ0tVUGp5?=
 =?utf-8?B?aW1RYjhpVjE2LzR3eWo0VnhCQzFudXR5cXB1dHJ6dEpsYXhTeHNUMUJQeE9J?=
 =?utf-8?B?T3JyQTZtVExwTVM5c0sybnNvQzJtWEhwcDFMT3NCckRQNVFGRnNxTlFZa1cw?=
 =?utf-8?B?YmtMb0pKZlNJVzh6VG5ZWENaWVNzd0E0TExubVgvMmdGeE52S1dCdlRYOVJq?=
 =?utf-8?B?aHNZQS8rSWduUTEwZXRnS1RWdVlkaFZkRkhsN3R3MDlPcDhsS2N5dDBQNVUy?=
 =?utf-8?B?Rmk3a0JSSjNZUEpGd3hoOURkUzlwejc0SGx6ZTBkRzlzdnovQ3NwbWdaUnFV?=
 =?utf-8?B?L3NCRE9iM2RUczVxWWQvS2E0QzR6dVF3L1lRZEpOQWV3Zk1Va0V3UjRoOHVF?=
 =?utf-8?B?K24zQ1gzOEFtSHZralB6T3FRb0k2TEl1Mi9UN3IrVk96U3R3Z0JpbjZkTlRC?=
 =?utf-8?B?T00yMlppMnpxb21QcHNxY2hXMjVSTkVNMW9BQmM1Ris1Q0hCakQxclozczNB?=
 =?utf-8?B?RWdkTURnakFqWmlOcDRXQ013OHM1ajlhQzY4eU54RTZ2bHJCb2tqN2tZSkdH?=
 =?utf-8?B?Z1ZKaU5ocXFrTzNhUkVOUFAyWmRJM0tQOXdhV3VHSHdybE9VUlJaa0lZMm03?=
 =?utf-8?B?SjFIZFVOSFUyMnN3MW1UZHVyOUx6aUVkS1c4bUdQaTJiTkhWYlN0VDJ4VXhw?=
 =?utf-8?B?ZWFDdXVrdUhCc09kTnpPREhpSDczRG5Ld05XU3RPZ1lNSDkvWmdCNGx1WlVH?=
 =?utf-8?B?WEVzS3NNYnlSRnUrVnptTVUwT2tmRGs4dUpzT3NWNTZGRnBrZXM4c25rRmdn?=
 =?utf-8?B?ZnVnOVJMWXc4eWdRanIyR0pZd01BQ1BFeW5Zb1kyS3dHQ2hpaGtqQTg3alNy?=
 =?utf-8?B?WHA1TFg2YlJib2c1QzRGU1hsSHRhUFdFWUFETWp4Q01vRzFzWWpVbWdmajBh?=
 =?utf-8?B?Z1hYck5ObTdBNU5Yd252TGh4dDRRMjcyVkZsNG5aaEZTY2hJZ0NUUnBab3Z5?=
 =?utf-8?B?dXBDVEFlb0VtY3c0L2NBRUlrTlF3U21qanc4T2crTmJoaHpRNWxTbUdFdnFL?=
 =?utf-8?B?d1YwOHByeEU5bENHdCsrR2d4Q3NqVzhlN20yaUVkaTlINGVMZE1CdmtwVWhE?=
 =?utf-8?B?OUdrZnZLSFJuVkRJUG5rOWJraEJyK2FILzdvOVVYVEQ3M3dhSVY3eW9nQ0d2?=
 =?utf-8?B?ZTlTNVAvb2d0M0srQUZmazg3UFR1Z3lLS0J1dHVOaWhxa2E5cEJuM1U2VUZV?=
 =?utf-8?B?U0gvVE5BcjJ4WXA0N3JNWnZ2SVlHK1k0Vy82OEhIUlJxdzlvczZyYWlwVkNR?=
 =?utf-8?B?QW90QUNlK2FQRHd1TjZ5NnRDUDdpeGJ6MnJZVm1DV2JadEdsUjRobXVFcTBt?=
 =?utf-8?B?OEpPNlhkVlE4cFpYSXk2YTJFT1VnTi9lbTlVK0pha1oxU1N5ckhQSmdPaWVC?=
 =?utf-8?B?NWpIa3hYMmh3dnpzcVREZ00wNnNFMERtVCtUSHdvL3Q2K3BxZEFVdFJQZ1Bj?=
 =?utf-8?B?aE1XekpQOFJoYU5yUjl2MENvYTV1Nkp5WGNTaGRoWVVmNEdJMHB0MUZxbFB6?=
 =?utf-8?B?UkErR2dxREtsWWpMVVRWRWhIWXFpT1JUUVFocWhrU2hBRTNlSTErUFgxWk9z?=
 =?utf-8?B?NTl2K25xekdES25mTC8vYldMdlhqMy9NV2xBRW9WUFk4bXp5eExEeFk0bm1O?=
 =?utf-8?B?T0Q3N0dORDlUaDlQOTJUWG92bXFlLzdrSmZWWTRCZXpqdWk4RW5yZGRiTHBO?=
 =?utf-8?B?NzNTNmo1K1d3bHJsUjVWdkJhODJyU1JncXhXSk9INTYvRHNWUmgyTUFCZzMx?=
 =?utf-8?B?VXFFU0ZyUUQ3MWlocU5ETS81V01Ybkwxd1ROSFV0Ky95REtPQ1VYTGNvdHhE?=
 =?utf-8?B?VWNiN3RvU3REM2hIQi94Nm5LOTd0Z1BQN2ZGeVlzYzFicVV0WkZ5VEZnZ1JG?=
 =?utf-8?Q?PxfOgiJemKZb9wMa5Ld5XoNQObgvQ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnlIeFM1bDNuQ2pDQjMrVExjVVhoRUhOMlpvSXFQNEc4QjJ2QjltMy9iUy9W?=
 =?utf-8?B?L0NWZ2M0OXA4Z2l3TUcwa0t2TGRzNi9CV1dXcnhGd21KUVMyTVdsQzU0NTJk?=
 =?utf-8?B?aERkclRuRnhHTFc0RDNwTVVmUU1wOEg1ak1NRWVmZE1WQjdsOWdPYXpvOW92?=
 =?utf-8?B?c1VjQUpta1lkRDV2b090amZwR2FtRHptbFFxNUNCUXEzM3ZGNVprOVNKMXV6?=
 =?utf-8?B?REE0QUdhWDJybGpaWXJBcWc0YWhKbklmejhPVDZVK2EySWNaMXBVZUVsT21Y?=
 =?utf-8?B?dm1ndHpvbnpSMVdLLzdLRHVtUGhpTnpSd25hSFdMa3dhTGVJRWVJVkFuM3py?=
 =?utf-8?B?TXJraEEvY213RmxmWWZnaTBHbzl4b2hsZ0VScCt0ZTJ1S3h3OWhiZmZGT2dG?=
 =?utf-8?B?RlhGYlhJNkNmY0ZsVlhlWVJkZDlNbWRBTHdFR0dONnNHc2h2cUVvQzNZcXJP?=
 =?utf-8?B?bUVFbXBpN1RzdkVaWEFwSlYxMVR4VFBWNjlSS3UwQXc1c1Zsa2lKT0dqclp5?=
 =?utf-8?B?THg5MU5oSHJRVGd4dU53cXljbE43TDd4aGtvNjg3ZEEwbmJCNGtSWkptSy9n?=
 =?utf-8?B?ZFhPM0d4SjRKUkN0VEQ0YXl5R2lKelc2c1JIMjczOTZ4N0UwS3Q3MVZJZWIx?=
 =?utf-8?B?ZGpLYTRwbjlSVnNIUkloOWcrd3FLZ1ZSOFgycWM5SmExMDkxZnRveU5KQkJY?=
 =?utf-8?B?VFBwS0VQZWp1dlIxUzNlN3BvZXR1VXowZElwV0I2TWxzWjFXem5TRFAzN0hj?=
 =?utf-8?B?Y3IvZXNHRnNiYkVRYVcvcXNmZVdNSU9vaGJYUGlsT2FpaGY0ajgrWnhhR1R3?=
 =?utf-8?B?UTNrcWN1c3BDUzltMlhVTlRpWkI3U1F1UzJZei8raitPM0NFTVEzVnVzaTN3?=
 =?utf-8?B?UHUwSnNkM29kS2ptTGc5NitnY1BlN1UyT2laQlFIa3hZOFgrOTVLNDhkTndU?=
 =?utf-8?B?NUVFL04zQys4THhiNXEwSHNXUG9sV3JKODhPaCtuZFhob3BYYktudWNRaWlz?=
 =?utf-8?B?dTI3WWZMaTI4NmNiNzJ4and3bzNISUQxcFlZTElDN0tTMWlZNWMrdXhlSHZM?=
 =?utf-8?B?SEM2Vzg5ZHo5dkhOL3FuUUpZbW1aa3RxQUk2UUJLS3dxRUZNSWN6V3RTMFpw?=
 =?utf-8?B?c0ttL29HSUZQZi8xbFZ0dUVFVFRQNW5pNXM3NE5IM2E5RU5aSDlEem5YWTht?=
 =?utf-8?B?K3Vac0VsMjFLN2tHU2dhY215cWJvNHVoQjE2eE5Rc0Qrc0FLby9weXBsWWZ4?=
 =?utf-8?B?ZmlLTjZ6bnpSK1ZWMTdqK3JsTTB0Ymt6SWl0RjV4RlpRa0VkVlUyTFVLWGxB?=
 =?utf-8?B?ci9MY3BjbEl4VXhtb3BNK0dGS1NpSTl6Y1BwSitsTUt2aEtmSzE3WEZWM01R?=
 =?utf-8?B?OExvSy9DM1lwYWJHbGsxUWgxU3BGY0hzSndvbXNrNWpqQ0hjTlRxakJiY0NP?=
 =?utf-8?B?Y2F3V3ptTmVnUUkyNjE1TzRCNGJWSTNIT25EMlVnS3lNdTN0MVpyMVUyNG1w?=
 =?utf-8?B?MVBvWlBLZFlsNDNxUG0rcVlRaG9RSTFHSjlmUGtEOTdHeXJZZG01QkdSdGxm?=
 =?utf-8?B?T09yUVJLSStoR3ZVRW5LVWplM0tlMjNORGhoWVJWY1hLZnJyYWhkMWIwa1Br?=
 =?utf-8?B?alJTeHhra3lzOHFSUjRuRVQ5b0dmSm9DSy9rWTVxbjZqZzl3Z1FiOXVTYmdK?=
 =?utf-8?B?Ky9LSDBiVHBKSVh4UUkrekRYMjQrLzhxVDlNaDlyZnAzclNleFpGNHk5SWRn?=
 =?utf-8?B?SS9GS00xQWh2ZkNPSStVZXlpNEJ2a1ZML0drdjViMHQ1NzNNSkx0OGx4NWJu?=
 =?utf-8?B?U3piWUpsZU5sOERvME5xR2JHYlgrbVVkdm5ENUNEY2ljZHBsdFdEbUQrY2FU?=
 =?utf-8?B?T3dIaWRvb1JQcUZPSnQyTjJFWTFPRXJ6QldnRUNOVTQzVjdnSHVFdmlqY2cw?=
 =?utf-8?B?UHBvVWlRbkxqb2NnMnFFU3g4ZVFoWE1ZWlhnVU1DZC9OMEVmL3hRTzVHR2tB?=
 =?utf-8?B?THNXTnluVnppYktwMHVEV0Y3VHRzMk03VGVnTEt1TTJaT2FSRUMrcDl0S0w1?=
 =?utf-8?B?WXhnL3E2RjVCcmRRSm5JOG1VSHN3SU1KY0lQSEk2alhUdk1XRCsxenFsSmZ6?=
 =?utf-8?B?WVNxZkxGbFowUDNMVlFjTEIxOWgwOWd1N3oxSERXcEhZSHRkOXROYm5GQzdY?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84850DB6FAFEA94A9A180C8A6AE26F73@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cf97e4-c486-4811-db75-08dda920d059
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 19:47:35.5456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b6+LSha2acEzO0ec/RQbVDJwrhRol2EzJIkK/QIpfUiXaaHcTPyafbwX1sTsxWHzqhePle2w7W5e442yX/s8q/cMUSLbNPrqgi9yWKGysXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDEwOjQwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9ubHkgdGhlIFZNIGRtYS1yZXN2IGxvY2sgaXMgbmVlZGVkIGluIFNWTSBwYWdlZmF1bHRzIHNv
Cj4geGVfdm1fbG9jay91bmxvY2sgY2FuIGJlIHVzZWQgaW5zdGVhZCBvZiBkcm0gZXhlYy4gTWlj
cm8gb3B0aW1pemF0aW9uCj4gYnV0IHNob3VsZCBzYXZlIHNvbWUgQ1BVIGN5Y2xlcyBpbiBhIGNy
aXRpY2FsIHBhdGguCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1t
ZXJzQGludGVsLmNvbT4KCkxvb2tzIGdyZWF0LCB0aGFua3MgTWF0dCEKCj4gLS0tCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmMgfCAzNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+IC0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N2bS5jCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmMKPiBpbmRleCBmMjdmYjliNTg4ZGUuLjk1MmI3
NWE0MjY0ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmMKPiBAQCAtODU4LDcgKzg1OCw2IEBAIGludCB4
ZV9zdm1faGFuZGxlX3BhZ2VmYXVsdChzdHJ1Y3QgeGVfdm0gKnZtLAo+IHN0cnVjdCB4ZV92bWEg
KnZtYSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2
bS0+eGUtPmF0b21pY19zdm1fdGltZXNsaWNlX21zIDogMCwKPiDCoMKgwqDCoMKgwqDCoMKgfTsK
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3N2bV9yYW5nZSAqcmFuZ2U7Cj4gLcKgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9leGVjIGV4ZWM7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFf
ZmVuY2UgKmZlbmNlOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGd0
X3RvX3RpbGUoZ3QpOwo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgbWlncmF0ZV90cnlfY291bnQgPSBj
dHguZGV2bWVtX29ubHkgPyAzIDogMTsKPiBAQCAtOTMzLDMwICs5MzIsMjEgQEAgaW50IHhlX3N2
bV9oYW5kbGVfcGFnZWZhdWx0KHN0cnVjdCB4ZV92bSAqdm0sCj4gc3RydWN0IHhlX3ZtYSAqdm1h
LAo+IMKgwqDCoMKgwqDCoMKgwqByYW5nZV9kZWJ1ZyhyYW5nZSwgIlBBR0UgRkFVTFQgLSBCSU5E
Iik7Cj4gwqAKPiDCoHJldHJ5X2JpbmQ6Cj4gLcKgwqDCoMKgwqDCoMKgZHJtX2V4ZWNfaW5pdCgm
ZXhlYywgMCwgMCk7Cj4gLcKgwqDCoMKgwqDCoMKgZHJtX2V4ZWNfdW50aWxfYWxsX2xvY2tlZCgm
ZXhlYykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSBkcm1fZXhlY19s
b2NrX29iaigmZXhlYywgdm0tPmdwdXZtLnJfb2JqKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZHJtX2V4ZWNfcmV0cnlfb25fY29udGVudGlvbigmZXhlYyk7Cj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9leGVjX2ZpbmkoJmV4ZWMpOwo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfb3V0Owo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBmZW5jZSA9IHhlX3ZtX3JhbmdlX3JlYmluZCh2bSwgdm1hLCByYW5nZSwgQklU
KHRpbGUtCj4gPmlkKSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19F
UlIoZmVuY2UpKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBkcm1fZXhlY19maW5pKCZleGVjKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IFBUUl9FUlIoZmVuY2UpOwo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVyciA9PSAtRUFHQUlOKSB7Cj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgY3R4LnRpbWVzbGljZV9tcyA8PD0gMTvCoC8qIERvdWJsZQo+IHRpbWVzbGljZSBpZiB3
ZSBoYXZlIHRvIHJldHJ5ICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmFuZ2VfZGVidWcocmFuZ2UsICJQQUdFIEZBVUxU
IC0KPiBSRVRSWSBCSU5EIik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byByZXRyeTsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV92bV92YWxpZGF0ZV9zaG91bGRfcmV0cnko
JmV4ZWMsIGVyciwKPiAmZW5kKSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIHJldHJ5X2JpbmQ7Cj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gK8Kg
wqDCoMKgwqDCoMKgeGVfdm1fbG9jayh2bSwgZmFsc2UpOwo+ICvCoMKgwqDCoMKgwqDCoGZlbmNl
ID0geGVfdm1fcmFuZ2VfcmViaW5kKHZtLCB2bWEsIHJhbmdlLCBCSVQodGlsZS0+aWQpKTsKPiAr
wqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGZlbmNlKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV92bV91bmxvY2sodm0pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBlcnIgPSBQVFJfRVJSKGZlbmNlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKGVyciA9PSAtRUFHQUlOKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBjdHgudGltZXNsaWNlX21zIDw8PSAxO8KgLyogRG91YmxlIHRpbWVz
bGljZQo+IGlmIHdlIGhhdmUgdG8gcmV0cnkgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJhbmdlX2RlYnVnKHJhbmdlLCAiUEFHRSBGQVVMVCAtIFJF
VFJZCj4gQklORCIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ290byByZXRyeTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX3ZtX3ZhbGlkYXRlX3Nob3VsZF9y
ZXRyeShOVUxMLCBlcnIsICZlbmQpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZ290byByZXRyeV9iaW5kOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiAtwqDCoMKgwqDCoMKg
wqBkcm1fZXhlY19maW5pKCZleGVjKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV92bV91bmxvY2sodm0p
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRtYV9mZW5jZV93YWl0KGZlbmNlLCBmYWxzZSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoGRtYV9mZW5jZV9wdXQoZmVuY2UpOwoK
