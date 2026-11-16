Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9288606A32A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZsJ6o1bY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DzOIdCji
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8698C10ED67;
	Mon, 16 Nov 2026 09:02:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3110ED8E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819732; x=1826355732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qIAM4bsXAlE+qM0ye95/dGBnsHyjA/cs0KIfRc/xPeM=;
 b=ZsJ6o1bYkJeBFvzJUZBiOGXb/wUnj9P9oyiXzaeiG1nrxZR5ngjqWOyQ
 yVXgfu98PRPj6o4rxYR79tlhSSgTE8b7znF69TYzMcmOyPzNggoak07+M
 Iy4hGFK1o7TLUrYnJ1LUVgI575kMMVCHZDr6YTpuKjJjiDAlY6MJwoRPG
 m6I3BtNXQHluoVOOz41nrq6HAIMCf9J3KFGOSLbKpD7s3ykyj726l0OCM
 hpsJbkeFn7lyvnd05QTA6J3wnyl4UZJZ74zOOfpDGI8ZSQe0uysV3Ut+1
 PH0YYKgGXG0uh5SqDkSTYtU12jkd9GJuICaXBpd3r9qqgeAfhgvInyvyw Q==;
X-CSE-ConnectionGUID: OkCoBSlWTzaDhvxxec6TBQ==
X-CSE-MsgGUID: ilEQap+uRtWawRhgyDVAKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3456637"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3456637"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:11 -0800
X-CSE-ConnectionGUID: LUYwHpqIRtSNJbNbbu2wdA==
X-CSE-MsgGUID: q9eEzQ6iSpClY9j6JV16lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="10030850"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:02:10 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSL79xjY3dX42XVtU9lWPro1HohU3hmBd8q/xyUjqHkYQ7nmGQFpRri+58WmliTnznpisVEyOOmqJWjmamY6/6q1fRvKQ15HAVZTuIP+PENZgJgB2JE9x3RBadB/h0/YdT4Dse+zSWXULiSxMtlHMtpZd/XtXQ6/A4qsV0xWPOp8p0+bAYNnBCx5kNx3MjxnCCFQ6CFrkmQjOYvZ2vrRvZNSKWhGiS3gGX4eiQi24RYjPhL8LOT0Z0OStzvTRzGL9ZwkI6RrTEddkm5CUOlLhpc2SGlQjkFaicH9boRKB8thCCKUvp4q9HUCmQXhHq0UMx9UiA2quMzb4vLPm/dXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AmlYYsnCV9+Zw6a5wpKnLZot9PrabfFEGbpUh3jCfY=;
 b=QnU6ci1PiXlxQA1zzuE1S23+QyJi9q3802lHEb7vkhB0D+mGhoQ7+wM+oT7OTQOAae9Zu7MmI0ZY3w+TtawR8U/SaRdo360Wqh68ZTNo5/a3svyNHL+4kye7Fy0gxpURLidsrCFKOdDJy5L0hk1LTy0P+WAWffTvfAVEW8tJESx36cCQleaYHHcHkKi6pmfHX+mfO/BdhB5ZrGd/wxEWiKMah8eZ5meRSOH/YVzOjWHI9JPkFWlm7hD4TTUemJxoi3YwdPvpBAfEuJCp5J/TrEbcWnI8dSECoH3yftdsVG5zD3/B2EQcQcLUsc/H1FkvhgK7KyFw8V95Aj5+Ao0bIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AmlYYsnCV9+Zw6a5wpKnLZot9PrabfFEGbpUh3jCfY=;
 b=DzOIdCjihOLxYMWzmodqHB5Yb5Ya/+qs7bg6s0PQils+7QppJEoQumTi9GEhEuuccTXHyIEipcsgI04CWYdZgUIR4TApqRfiJsImaWweqMrRF/Wmx1s3YZg9pLm3ZR97wyV/vS16Il90FhyT8QyriYYaPq9DgOgL9TjeSsOZsWo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:01:11 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:01:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Tomasz
 Lis" <tomasz.lis@intel.com>
Subject: [PATCH v9 1/5] drm/xe/ggtt: Assert lower bound of GGTT PTE address
Date: Mon, 16 Nov 2026 10:00:49 +0100
Message-Id: <20261116090053.2466938-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
References: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fa82fb-a51b-4460-bf89-08df43c028f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: FhXFEAgS9c5/MBYOkG5vPsRjMoGQTYX+f/1O+o+FLIq7eyJ1W0Y15Oi0uOuKK7yuVCrBHEEfmB38NCgz3CZnYGRyx53KnosLUBUx5zvP4PEDCuf16E99y0dqG/8119UBUJs9XKtTsY+E6+oOJpS3pb7HMc40IhB1BEPE7R8CQxYcl20y2MuO38OhhbYASXK7KlpjvVWjJLdYEKaR76kOAfdouCIWRa7xZ3PUGRrH3L8P/2SPwH1ocLZLU00X1ylszG4JtjidqHiFHDV8gbyfoX7QHpv0Xxt6I+Hv9kXsv/8DcKQygT7SEmK03EpD3y2udhjdOLPtylJ1mejXBfJ8NpQ2qLrp5/ogWCp5jeBt5gI73QPxKJR80cm4qzqrLbBJxhsVeCHjsEXKVcGQLtDHFtJm0akgukKtUPJztbMLygzoxQAr932my6c8XYIpGHq5VbC70f1km2LmyWk+TagF0BQsl1IncT/fo1xeBf/XdEWCBNtQztpYTKI7mQiHBqDv81wTw4AiMLn1bgALBdwGSTwHeUiwY2iMSPAlG5LOU64NXhZ7zwuZe1uSfKvWaLms9q2Sae82eVq02OP4cy7OoazQspSaqJuUqbZ+bcIxGOVjwIeOiCfxT2cNS6C1i4RkvoHBiiCmSSfZrVLmFfcmIbPjaKKXBxnhzSy1faeje9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk04OC9keEM3d0tHSlpsbFIwWE40dGZzODhkWHJYSzMzcVg0YkZxclNUY1Zt?=
 =?utf-8?B?R0dBUnFGY3hScU9HNXJTNGpmYTdIUjVXOUhITDJtVmdQVlh0a2tuejdFZmQx?=
 =?utf-8?B?R2RTY1pVNW1qdVNvaXIvcEUzMlRmNGZjd2VlTkRFTVNweUcwdXlEVk00VTJi?=
 =?utf-8?B?ZjhZUmhiNjh4MHQ2c1h5QUlBaXZ0R1k4MGRRWEhnT053MUdxUy9PMnl0eWRD?=
 =?utf-8?B?eTJWVFJEK0NjZmpyWmVUMU9nY2FZY0RZc0JqR0hydFRtY0hmVkkxOU1BdWVz?=
 =?utf-8?B?SGJTTUlVY2NpQkMwL0Z0MUxvanNNdzYzSDJ2elA5UncxOWlEaUdPczkyK2ph?=
 =?utf-8?B?Rk13eENiYnQ2MTBpYmZFNlFBUEpvK0RYSU5TeFFPejR4QVgxTGpXMjFkdzlQ?=
 =?utf-8?B?cG1sWWJ4enVIYmtCaGozRmJFSXZMSGJmc1R1MzdUUFZZZkJzVlBuck02TFJX?=
 =?utf-8?B?R3hjRG9YRWYyWEhXRVU5US9jOHhYdk90K0ZvaFlsTFNBQVJNN05KbkR3R0xH?=
 =?utf-8?B?amU5S0lzU3pmcFplMTJkdE4zYW1GYjVsR0hQQ1FDR0crdmhuMk5rYk8yZSto?=
 =?utf-8?B?am5vSXRMR0NSbm9hZFhDYmZWZnd2azAyRW5HRW5EOURXUFdzN3I5Y080MXcy?=
 =?utf-8?B?NVVyMUxsL2FCcGNMRlNmd3dZNDc1SmpCTm9RS3gyYWZHMUlmd0tCUzFsVGgz?=
 =?utf-8?B?d2h4cTRpckRzRDNJb2VmKzdzVXMxWTJiMitKejh2bEZCcnAxSkNoTXA0WWdP?=
 =?utf-8?B?eVhNNTFLbXFtb08zZklVQ3pRR3lRTzg1SUNNUnplYjZ4bmtIRjgwRTNwREd3?=
 =?utf-8?B?dkJXellNaWFMdVpxNXpuTlYyVU9SMzIzQkRENXZYYTRpeVUxQzNkbE9UQjRk?=
 =?utf-8?B?UHI2RlBIOTMwb0k0a2c5dUljenJzSjBXS2lUQ2VMdHRtbjZKaldRSW1oUGRV?=
 =?utf-8?B?dXpZSnhrR3NkZ2JncEN3K2N6L0lMVDdLdW9NSUhQTmVqbUJxTitpL0N5ckNZ?=
 =?utf-8?B?MHZUdmpDT1JFK0ZUc0ZKTGk1eExTQ0JRQ2JnQTJIYnRIR3FRVnB1Q0Q5V0hK?=
 =?utf-8?B?a2tDVzZxcG1lSU1ENkhmTWZOcVBQY0pZVVZrOTBabTVnUHZ6TW9hMzhiYkc3?=
 =?utf-8?B?ZWRqL1FXS20vV0dVS091WFFtSHFlOWpPOGdWSUxHR3R4cGZSV3psODZHeklH?=
 =?utf-8?B?ZW1LTlY5WEY1WG5Jd3M0NGxwVEFMOVYvNnlnYmhvbFlrMnRqcVNBMWQ4bHIw?=
 =?utf-8?B?ZzNJVCtNc3FDRkVhZk5oczliT25yWlZyTkFWS3c4WFRZRGx3OHJRbGN1UjN2?=
 =?utf-8?B?Si9ScU10UnVCZWxwMkhaaDYrSHBhL2c4SjFWTk9xbE9odGVBeDF2aDUvcjJy?=
 =?utf-8?B?eCtYblZTNzczUStnOXVUaUVWVTdHUVVvaFZNOW53c0JxREhEaWI5S3lON3V2?=
 =?utf-8?B?QnZqcFhZYVREYjJpVzZRWE1aUW9CckpaVWxiKzcvS1ZTYVM5ZFMyZVQ1bThm?=
 =?utf-8?B?emxYYUFQNGhCejN2VVVPbGNEUTY5Ym9rOE14VHJGbXNHR0JrUXJ0Z0U5MjBt?=
 =?utf-8?B?ZENta01XWEd0aGtUMFB0TkUyQldFQ281dTI3NWFTbnhhenduS2hwY2R0UXRj?=
 =?utf-8?B?SUhqWlpUUi9UeXpmVm9WbFZ5WU1nd1dLRjFQLzFiaVI4cFh3dTRYa1BJSDJv?=
 =?utf-8?B?UUNnSjlPVXZMaDF6VzJyakxYTmxuK0x2WmNKMWUrMHhxWjRkNFJYZDJmRFV3?=
 =?utf-8?B?ckJJTzlUMTNZR0hPNUo4TkQ4S0N5WGFpR0VNdVlFUkh0VmVCazRxNUF6bWx6?=
 =?utf-8?B?UUViM2NLQUpUT3MyUmhVWFZDMTJxMDEva0ZEWHV2T2JZS1E4RVBiUDlUTzd5?=
 =?utf-8?B?MWNadTRKZkg2cVRiN1VNMUVIV2JSQmFpU0YxL2dBVEVMRlhFRnNSMlhhd1Ju?=
 =?utf-8?B?MmN2cC8wWkdOcnpjNDZPZXgzenh6cGFoM3ZIUE5xcnVac1ZrWFRpOXlpNit5?=
 =?utf-8?B?WE1ZNlIvQXRlazlpZWJMOHlVSzhGR01YcFA3aXZ0WnRlNmhzVWF4MUNxejFT?=
 =?utf-8?B?VVl4M0luNkZJU1RBUTBwYlN5bndRcGIrUmM3WXVtMHBORVhYMG5BY1l4R1Bu?=
 =?utf-8?B?V3hXSjR0RGtrSnZwaVJMaUw5bzZIbmpBN3R5cmtiWmlIQ25TMnJFTm1Da2pX?=
 =?utf-8?B?dnFVdlFuc1FYN1dySW5iMnVreWlZa1pkUm9xcWErcGljSkoyWnQxdzZXcU5E?=
 =?utf-8?B?UkhTL3B2SEJLNmV6ZGtUSDYxajFUWTNFSGJ0WFlucGY3K25hRDBxOUdDS1lC?=
 =?utf-8?B?MzltR2tnSHp3dHp1RzN2VUd2d1FGK1JJdjh3QXN4V3laNWZRaXZEbko1YXAv?=
 =?utf-8?Q?ACgVISGKqSn4ouHQ=3D?=
X-Exchange-RoutingPolicyChecked: 1INlTsxfbxW6nmnV/PasDfvYttYqE/OWrd789jnzntt30PNlW+Py9aX5mBvNs6n1RUMJIBxOcNOQ6JRI2El1F6jUpUs8aUh0s3vAwHV/DNFTegNocWnY8rrGLHqVE4j4+ArO/B8Z7GHWgSW2Lp7zvolEFPIALD9vir7k4C5yFEk2GDxlOJyXGqYwolABIaSZY5FEsWBkg6EcXc2yo6Hh97WUfFJPHumeqmJXHUpaznseFSz6BTmEjWefbQaQPEPkWJAYUN3su9jIFng+YmeZJp4uapfLtgkwdVsuUVM06DoZHR08dBgx0aV+Fg/vNxUNrhPgYFhD4YbMnYEID3yhxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fa82fb-a51b-4460-bf89-08df43c028f6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:01:11.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HsIIKduRWfo2jd+0oqhNDs5rs3ZgsUM0qo6VehTmV0+Gp6pueYQIxs5mRpaZuFfA6lto0b8WHKfAJajAOzgT0HT7wbzMlthdohAkUJZv1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Since ggtt->start was introduced, the GGTT range no longer begins at
address 0, but the PTE accessors still check only the upper bound of
the address.

Also assert that the address is not below ggtt->start, so that stale or
miscomputed addresses (e.g. after a VF GGTT shift) are caught as well.

Suggested-by: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 9ef2ce743770f..deddf18d0bb09 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -240,6 +240,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
@@ -254,6 +255,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
-- 
2.34.1

