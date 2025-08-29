Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE0CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 22:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5B810EC3A;
	Fri, 29 Aug 2025 22:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hkljfoee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E93610EC3A
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 22:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756506524; x=1788042524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plGPkDtDW7orgRm+jpLM9A2HspRDC31SxhEBSnz6OCs=;
 b=Hkljfoeell2PbLNkqsX3xlIsDC8DJNkf3hZffG5ek+9Q/PyEudnmE4xn
 +GZALMlfVNOfaXIBVgamZpTKTTD2I1r4g7KlgkPSCLg+z2IQ37dusyJMa
 YcdzB+pl2BmQOTtoErcRgHKuQYhKkjNK8DO0A/Bd2fjeDwvev4jyxBwmw
 ouOOcFSk+w7C7eif9YbHyJ0zuqo7bZW9qJYMOh/JT/hlfGK7sIsX9Y2nS
 bvb+MkDekeHejSd+uN5d7fKjQNsTFaHMtfR1lddRW5r4JUY7LCjQ+eWdi
 kBxDIcrXPEHaKm0YpnRtX0mvCHlgguflV32kEj556tOrUXEz8DMp1WMbo A==;
X-CSE-ConnectionGUID: 6uubbqUfQpyJ8+/7XiHruw==
X-CSE-MsgGUID: b7g7XShvQgSd3cAI6NfXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58901911"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58901911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:28:43 -0700
X-CSE-ConnectionGUID: l+IK09iKScqW+LKs2VJviA==
X-CSE-MsgGUID: aONHCkrESiuumtD5m/kgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174656105"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:28:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:28:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 15:28:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:28:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jd9i/GFpwCBZr2z+CKqc1i1YRakY8tFeUjQMwhgw5r7OlNB15oV0nPQGhYgrcDKczt7tzcmuIM4/DETB3u4RMVnupAFMTnaGHjELwfMjQOawZeVcRkIuE9k4xK7VyL30fCFcw8DV2PxhJEezTiqdX2NWCrczIi8Upq5bhu5JTuGC92bN6ZBdT7aDbVPqlgDXwNJCbcgn7og1XQ0plM6V85K1JDsbujicV6noOrrFiLHPfJmLSIkHPKNaN7zF9BacJoHvii7tcmAzpLTf7oTH1VRTyG9A+C2OEKP0+3zDGjZyhBDXsYQqVxutcHDpXelflnNMqhnc0xDt2XSKUFDdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plGPkDtDW7orgRm+jpLM9A2HspRDC31SxhEBSnz6OCs=;
 b=gbelYqZ7Cqg2TT1WCQSl5/7RPQnz8gCYbNPRdDokiGIjAL6wrr5HcY4TnL4FOe8XWvv/WnMsmg2J+rEt9Sh8rT1mXgSusCRicyfQWy2Ot/k4j/amOWsfxIcwgfnsoQH0LZ4cVPh0OpEPdU4ot/WIOYdoT47tnLpfm+e7SOFmsBzJyu0u9m/wn03kT5UT1puFPDeQ4NFFYBsCLQfEJRTgXZ+6twgwmkPhAtKVrFBbOkxt+niodE5pVyenqPzelRhRhY2s55o1T6HqjGNKvWXM+eaoKUg8gYHTwexs8E/yvMGUY6EnaxYU7iVflhtmuc95oPxHMmQJwyT22eXJhz8u2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Fri, 29 Aug
 2025 22:28:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 22:28:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: improve dma-resv handling for backup object
Thread-Topic: [PATCH] drm/xe: improve dma-resv handling for backup object
Thread-Index: AQHcGQS7b/T4nzfVxUaXp47t54bM87R6NlLQ
Date: Fri, 29 Aug 2025 22:28:34 +0000
Message-ID: <CH0PR11MB5444877F6F94DFCAC0F45EBBE53AA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250829164715.720735-2-matthew.auld@intel.com>
In-Reply-To: <20250829164715.720735-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4687:EE_
x-ms-office365-filtering-correlation-id: 33a40ea7-b1c7-4861-76a4-08dde74b6420
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VnJUcU0zSCtNUWRDMUhtQ2JmL3R5MXA1YW5odjBBZ0p5eEZrQlFZU0Y5UUVo?=
 =?utf-8?B?Ry9VYldmV3ptbzdKVjBraXNwa09JZi9ZN1IwYjdjRlBWNWhzSDdIVXlpTGtC?=
 =?utf-8?B?SUFmeUJVaTI2SFdaY0ZKN3poR3NpRWdPOXU0amxpQmErWGZqb0NtMU5TY0Jl?=
 =?utf-8?B?T1BsWHM2R2k1YUcxc0VVTzdvZmptSWRhNkp0VjB0UnJRSlpBQU14MW1adTBw?=
 =?utf-8?B?a25TQTNPWXhWV1NNeVV6K0xVK0hwUk5JZjh4ZTlqY1lYeGMzcFdrZDhKVjFE?=
 =?utf-8?B?cGh1NUtvSWZOazhEUzBtMDB5d2pqWTVTT1pGR3JwVDBkcE52NG92bVVVejBW?=
 =?utf-8?B?OXhZWjhTRHNJcHNMR3hDWFZTRmFCT25mVkpsZlhjVWtycG5tR0toRUs0c2Yz?=
 =?utf-8?B?T3JuNjhJWTdrU0oxSVR1bjRDcjhSMllkMXJQWlRaTXdJNVBzOW1Lb00zY3l3?=
 =?utf-8?B?L1BYemZveGZnbFFXTGlVZ1p3TXZCVDJDSXRTeDJpRTdhSEFXcGxCbE1wcHlC?=
 =?utf-8?B?cjh5ZmM1SzBJaEJzRjZCM1ErT1NZRkFlSFU5RjZHdWFCTC9sSEdtblRkNith?=
 =?utf-8?B?a2ZnQmUwdEFsN3VTbWlrejRrZDdVeVhKT2Y0S1hLYklBTzQ3YWUvUERrWE16?=
 =?utf-8?B?QUk3VnhET2NXTUhkQ3RlQWNwUS81ZVhoamZuWlZUblJXdzcyRWw1U09sTXJC?=
 =?utf-8?B?Y09hSlI4UjhlbXhEV3lFWDBPeS9iZktRUlZxZjlZUXF0MlhvVnZndWN1b3My?=
 =?utf-8?B?cHQ2elF6eU8veVVxRjN4VzRycHlEU3pRcHhnTFp3VUlnNlRGRFFubUVPekFI?=
 =?utf-8?B?UlBsckhpcmNDbDMydzRqS1lrN0ZTZ01JMHJlWnczUkxwN1U3TmpWcWp3cUE5?=
 =?utf-8?B?SG5VWjJ2cFBwQ0llY0ZRZ2h4VE5TczNzRkh3S3RBMmpzcWRJTGpwTkt0QS9a?=
 =?utf-8?B?a3RYalg5RW1IY2dnWWFxdTc0Mm1rdjgxVSs5cDNoVWhMMEo4ajZCN0pjcDVP?=
 =?utf-8?B?YVdER3lyK1pRcVlla2ZYU2FZb2l2anFjdjVDbWNYUGcyWXdLV2gwUThaTDdL?=
 =?utf-8?B?Q0Z1SUs3ZS8wYm1pT2I1NnJIdkwySVEyM0JzMFozNTZtWXRob1NiaGh0aDhh?=
 =?utf-8?B?cThnN2QxeWMrek1nMXl4Mk83TTFwWlg1d21HRFdoYWZRK2t0Y1ZjVVBGVUJJ?=
 =?utf-8?B?SE9RRmhtc2xuRzdReWx3QSs3eXFYWDBoUkFWcUI2V3lOVGNpZ2hKc1d2R2RV?=
 =?utf-8?B?c0diZWVvbFBwMFNxQXI5d1MyNWJ4V0VuVDR3SXdORHNJOEtwMkUxNkEwanZj?=
 =?utf-8?B?T2kwYUtJdTc1YkwyNllUWGZxeGI5Z0JqT0xlQ0o5RmJLMm5xcm0yTjAvY09B?=
 =?utf-8?B?Mkl3dEVwSkVTbWdNdnlIempTOWhxT3Q2VnhkSHdUZEltSmdXUi9EMTNScGt6?=
 =?utf-8?B?Q01MWCt0QU9CUDJINXlUVnJHRVpVN0pLSzhNbm41bzY5UlA4MTN6OXhWNWs1?=
 =?utf-8?B?NDYzMitrZlVUWjh3U0VRR2JNTlFnbFd3UU1LeTlvYytXOTFIdVNLbnBCckFK?=
 =?utf-8?B?aWFvQnZlWFhPdlc2dU1NMGNNYVFhSHVINkh6NEVBLzY5SWpnbklSaUdSNEEx?=
 =?utf-8?B?amR0emUvWTRWNWN0Mk1VaDZWejFDWFMwbUtTY2NlN3VNUklNQ01KZW1qclM4?=
 =?utf-8?B?eENnZXFZTDFxMzJtdk1lWDNYK2ZQSmVaNGNvbGozbEdRUGk1U2ZHcDBjOWl0?=
 =?utf-8?B?TTBRbHpWS2czOWJjVVllWDA5MldORWx3akRRQmJuOCtSQXgvbEU2KzdNVTlv?=
 =?utf-8?B?dG83RW1wd25KUmozODc0amJ5V21NK2VhWHVBU0MyYWV4NUxWcHlqMk8rai9n?=
 =?utf-8?B?Ukc1MEtBL1JzWU5TR3JuekFJRTcrVU1QNUkwRFErTHZqVlE4bVhZQVdxeDlx?=
 =?utf-8?B?Rk1mbFJ0cE9QR2kzS05oZmhVQUFoTHpaNnc2S21TVjFxUWVnbSt3QktKYVBh?=
 =?utf-8?Q?oqwU/edtd+flar4Dtz5/E6BHV/jUuk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEtXZGxmSVJkYjBzSzlrTDZSOTdYa3ZMckM0MUtHZDgwYUhtOXRCZEZIbktk?=
 =?utf-8?B?cjByVVREbzBwRk8yZFdZZkRSM3FmTlE2bHd5aVRldk0wdk1mWU81c0c1OHlo?=
 =?utf-8?B?S2FQK0ZtRWE2d1NLbzlKMmJ5V29wSE9CakxGbDA4OXh4ODlsaElha2RsZDZx?=
 =?utf-8?B?K2dpUTlqWHlRR3lTbXEwUTZDSnhxQXZUZ1Q0L2pBTkxkbXJqcFpiVm5MaXYw?=
 =?utf-8?B?ZGlJN0xtZk9CZXMrVEs1andhYUh2Kzdjbk1TK29qS1IvSEtyZnJwU2VKSGNa?=
 =?utf-8?B?WWVnOUd6UHY4U2lISXgzQ2NmTHZBb3ZWaUR6N09XKy95c05wUW4zY2NOZGFq?=
 =?utf-8?B?aGpacjJSMlNNM3IvaEg0VkR0Rjc3VnJzZGZwa1FGd3lIeVJSZ3lhMmRGN1hC?=
 =?utf-8?B?ajB2OWVkcERSOU5KcVJIc09kOVBmUGFlM1lvcUJsblRFWXU5OHV6ZmUva2tW?=
 =?utf-8?B?SGo4b0xYd09jbnlrOWp1VXdhMjFIS216MVV2YnZKWVhvVmRCSHdBS3YvSHJB?=
 =?utf-8?B?b3JpWktEcm40WVlwNEkrNDJITjM5bVF4Qk8rQjh0MWlaOStDQThXNmllVHhT?=
 =?utf-8?B?dUJ3SXE3dkRRNlg1aWpHYkdjRTFOa3U4QmJ2VWNab1BmQUZCdkRBNThZNmNp?=
 =?utf-8?B?SmlEZFZzTHlVa1hyWDExTldZUVZCUDVpbG5Vc3ZiblZNek1vaE05UXJTZFdX?=
 =?utf-8?B?cG9PZ29jcjNiVWxTMVpLaE84RWc4TUh4aEhLaFNBczBrTWtiZDRUZkZOUHpW?=
 =?utf-8?B?Y3NtUEt3UzNKUnNmZjZma3l2Q1BIYW1ZM0FidWd1UlA1U0V1QmVTRmRJMDU5?=
 =?utf-8?B?RVNGZUZLOVQxVnQ5cmIxTDNoTEpqcFNEenQvUnVqTE9DVXRVb1BEeTYyelht?=
 =?utf-8?B?Z09iYTFKc2N0ZGRFbDhRTS9aSFZiaGxIaFNkS0xSZS82V2o3b3ZlWnA1d2Fy?=
 =?utf-8?B?NU9LVnlrS3puc05pWTZsOE9PQTdUcDF2bnJqUTROL2UreGFjbDZDb2U3T3VC?=
 =?utf-8?B?dTVjVUZwQkcyQ2pubmt5NVhWWUJKa3pnY05tN0R3eWJRZ2xQU2dHT3BIQThL?=
 =?utf-8?B?ZTAxYzRKaWIzUXcxbGpRVjNaamFCQlhGYmpycDVybTRhNzkzWHdHaUFySjFm?=
 =?utf-8?B?ZUVYWHIyS0ZqUE5UVlhSK0pBK3BkUFpPc2pmRkVvSng1SXpPb0EwczJGLzJI?=
 =?utf-8?B?ME9sWTg2T0M1U0tDcENoNGNSUERrOFVaTWJ0Z1kzM21TbG1IWS9JbG9CWlZB?=
 =?utf-8?B?NkM0MktVY2lnc0s1WWtTbHJQQlBXTmdqSFJjcDJGN2NJTHhwNUw1T1piVG12?=
 =?utf-8?B?eHd3cERJSC9ma244SmRyV1k1eTU2ZmpXMVFhMEZmL1JZblN1dXZ5dFVqYXps?=
 =?utf-8?B?TFJIYnhqeUdUNHd3TnVvcDRuMXUvcDEvSHl2dzJZQldEZUR0dGdEcFYvcDlN?=
 =?utf-8?B?bUhkenJGVkc3RTBIeFpHSXd4YjdreGZzSXIyUENYMnVXMDMvdEJEZjV4SlRT?=
 =?utf-8?B?dUJSUFRPYklpZVlTOHRUTFBQb291c2V6VkxPMjc5Y014RU80NlY4T0N1amlj?=
 =?utf-8?B?SmZIbzJCaXl1QkNUQVQvRWlaNlFZTWtWWkxqUXB3VWhjNGZEckRGOGQ5VEJX?=
 =?utf-8?B?RkJYVitWOXVka0hiakdVU3k0elVZMlRMWktINVBzZTZJY09iNHdZbGtFeXkx?=
 =?utf-8?B?OVhGZkZSMWZJTVBmb1R6dUY0bjR3OW56R21OaXpZVXBrc3pFeWlkUlJlb09D?=
 =?utf-8?B?MGVFTjlHL2ZHdTF2TGR6aW9ZOXBRTUFvUWoxR2RuVTk5b0d2NEJ4SFlUaVFw?=
 =?utf-8?B?RXlPUWR2SXF2Z2xuaDFJdERZMVpnekdVUStyQUZHbjhhcytSYzN6Z3NaYnA3?=
 =?utf-8?B?YVFEemhCcnpHa2FKSFQzczJVcVJlRENTR3JBaHBoUTJNcXNhM0tFaEk5QUx1?=
 =?utf-8?B?em0yUUV3UDlVVFJSekpXYTR3ZlA4L1RibS9peiswSkRRV09nUGpuSVFrMFUz?=
 =?utf-8?B?T0RSbUhHc2F1ZFhHR3B1dXlGdEdqZ0tkQjhNblowNXRPc2dsR09NNUkxNnpj?=
 =?utf-8?B?LzEwUlZWV2dpQWpYVWdRUk1xTHcrc2hrZXZWOVNvemRJOGJzaHlSYWFPV0lG?=
 =?utf-8?B?TG9HUTY5eFNLU3p0NS8vTDVZYXh4NC8zek9ROGprRmxyOEkrd1dYTkJydUp2?=
 =?utf-8?Q?h9Sht/8RZo7VQnzlRL/HdEM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a40ea7-b1c7-4861-76a4-08dde74b6420
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 22:28:34.4373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMqUePspS0z7m2xs6LqxPFn+2N0bWwFZbsaDn/lPRa/appBLJKmPbXcJabuVOHLzsSoW9BrdOgAE1zsX96CmlmsifWXYXMRcxW22LWu2VpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1hdHRoZXcgQXVsZA0KU2Vu
dDogRnJpZGF5LCBBdWd1c3QgMjksIDIwMjUgOTo0NyBBTQ0KVG86IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxp
bnV4LmludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4N
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBpbXByb3ZlIGRtYS1yZXN2IGhhbmRsaW5nIGZvciBi
YWNrdXAgb2JqZWN0DQo+IA0KPiBTaW5jZSB0aGUgZG1hLXJlc3YgaXMgc2hhcmVkIHdlIGRvbid0
IG5lZWQgdG8gcmVzZXJ2ZSBhbmQgYWRkIGEgZmVuY2UNCj4gc2xvdCBmZW5jZSB0d2ljZSwgcGx1
cyBubyBuZWVkIHRvIGxvb3AgdGhyb3VnaCB0aGUgZGVwZW5kZW5jaWVzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogVGhv
bWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzog
TWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBK
b25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQotSm9uYXRoYW4gQ2F2
aXR0DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyAgICAgIHwgMTMgKy0t
LS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyB8ICAyICstDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYw0KPiBpbmRleCA0ZmFmMTVkNWZhNmQuLjQ5OTExMjQ3ZjZjYiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTEyNjAsMTQgKzEyNjAsMTEgQEAgaW50IHhlX2JvX2V2aWN0
X3Bpbm5lZChzdHJ1Y3QgeGVfYm8gKmJvKQ0KPiAgCQllbHNlDQo+ICAJCQltaWdyYXRlID0gbWVt
X3R5cGVfdG9fbWlncmF0ZSh4ZSwgYm8tPnR0bS5yZXNvdXJjZS0+bWVtX3R5cGUpOw0KPiAgDQo+
ICsJCXhlX2Fzc2VydCh4ZSwgYm8tPnR0bS5iYXNlLnJlc3YgPT0gYmFja3VwLT50dG0uYmFzZS5y
ZXN2KTsNCj4gIAkJcmV0ID0gZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMoYm8tPnR0bS5iYXNlLnJl
c3YsIDEpOw0KPiAgCQlpZiAocmV0KQ0KPiAgCQkJZ290byBvdXRfYmFja3VwOw0KPiAgDQo+IC0J
CXJldCA9IGRtYV9yZXN2X3Jlc2VydmVfZmVuY2VzKGJhY2t1cC0+dHRtLmJhc2UucmVzdiwgMSk7
DQo+IC0JCWlmIChyZXQpDQo+IC0JCQlnb3RvIG91dF9iYWNrdXA7DQo+IC0NCj4gIAkJZmVuY2Ug
PSB4ZV9taWdyYXRlX2NvcHkobWlncmF0ZSwgYm8sIGJhY2t1cCwgYm8tPnR0bS5yZXNvdXJjZSwN
Cj4gIAkJCQkJYmFja3VwLT50dG0ucmVzb3VyY2UsIGZhbHNlKTsNCj4gIAkJaWYgKElTX0VSUihm
ZW5jZSkpIHsNCj4gQEAgLTEyNzcsOCArMTI3NCw2IEBAIGludCB4ZV9ib19ldmljdF9waW5uZWQo
c3RydWN0IHhlX2JvICpibykNCj4gIA0KPiAgCQlkbWFfcmVzdl9hZGRfZmVuY2UoYm8tPnR0bS5i
YXNlLnJlc3YsIGZlbmNlLA0KPiAgCQkJCSAgIERNQV9SRVNWX1VTQUdFX0tFUk5FTCk7DQo+IC0J
CWRtYV9yZXN2X2FkZF9mZW5jZShiYWNrdXAtPnR0bS5iYXNlLnJlc3YsIGZlbmNlLA0KPiAtCQkJ
CSAgIERNQV9SRVNWX1VTQUdFX0tFUk5FTCk7DQo+ICAJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOw0K
PiAgCX0gZWxzZSB7DQo+ICAJCXJldCA9IHhlX2JvX3ZtYXAoYmFja3VwKTsNCj4gQEAgLTEzNTYs
MTAgKzEzNTEsNiBAQCBpbnQgeGVfYm9fcmVzdG9yZV9waW5uZWQoc3RydWN0IHhlX2JvICpibykN
Cj4gIAkJaWYgKHJldCkNCj4gIAkJCWdvdG8gb3V0X3VubG9ja19ibzsNCj4gIA0KPiAtCQlyZXQg
PSBkbWFfcmVzdl9yZXNlcnZlX2ZlbmNlcyhiYWNrdXAtPnR0bS5iYXNlLnJlc3YsIDEpOw0KPiAt
CQlpZiAocmV0KQ0KPiAtCQkJZ290byBvdXRfdW5sb2NrX2JvOw0KPiAtDQo+ICAJCWZlbmNlID0g
eGVfbWlncmF0ZV9jb3B5KG1pZ3JhdGUsIGJhY2t1cCwgYm8sDQo+ICAJCQkJCWJhY2t1cC0+dHRt
LnJlc291cmNlLCBiby0+dHRtLnJlc291cmNlLA0KPiAgCQkJCQlmYWxzZSk7DQo+IEBAIC0xMzcw
LDggKzEzNjEsNiBAQCBpbnQgeGVfYm9fcmVzdG9yZV9waW5uZWQoc3RydWN0IHhlX2JvICpibykN
Cj4gIA0KPiAgCQlkbWFfcmVzdl9hZGRfZmVuY2UoYm8tPnR0bS5iYXNlLnJlc3YsIGZlbmNlLA0K
PiAgCQkJCSAgIERNQV9SRVNWX1VTQUdFX0tFUk5FTCk7DQo+IC0JCWRtYV9yZXN2X2FkZF9mZW5j
ZShiYWNrdXAtPnR0bS5iYXNlLnJlc3YsIGZlbmNlLA0KPiAtCQkJCSAgIERNQV9SRVNWX1VTQUdF
X0tFUk5FTCk7DQo+ICAJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOw0KPiAgCX0gZWxzZSB7DQo+ICAJ
CXJldCA9IHhlX2JvX3ZtYXAoYmFja3VwKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9taWdyYXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+IGlu
ZGV4IDk2NDM0NDJlZjEwMS4uODYxZDlkMDYzM2QxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMNCj4gQEAgLTkwOCw3ICs5MDgsNyBAQCBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9taWdyYXRl
X2NvcHkoc3RydWN0IHhlX21pZ3JhdGUgKm0sDQo+ICAJCWlmICghZmVuY2UpIHsNCj4gIAkJCWVy
ciA9IHhlX3NjaGVkX2pvYl9hZGRfZGVwcyhqb2IsIHNyY19iby0+dHRtLmJhc2UucmVzdiwNCj4g
IAkJCQkJCSAgICBETUFfUkVTVl9VU0FHRV9CT09LS0VFUCk7DQo+IC0JCQlpZiAoIWVyciAmJiBz
cmNfYm8gIT0gZHN0X2JvKQ0KPiArCQkJaWYgKCFlcnIgJiYgc3JjX2JvLT50dG0uYmFzZS5yZXN2
ICE9IGRzdF9iby0+dHRtLmJhc2UucmVzdikNCj4gIAkJCQllcnIgPSB4ZV9zY2hlZF9qb2JfYWRk
X2RlcHMoam9iLCBkc3RfYm8tPnR0bS5iYXNlLnJlc3YsDQo+ICAJCQkJCQkJICAgIERNQV9SRVNW
X1VTQUdFX0JPT0tLRUVQKTsNCj4gIAkJCWlmIChlcnIpDQo+IC0tIA0KPiAyLjUxLjANCj4gDQo+
IA0K
