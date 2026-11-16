Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F99606A329
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRZBIi+x;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TwJ72OuQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A2610ED61;
	Mon, 16 Nov 2026 09:02:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E5D10ED93
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819730; x=1826355730;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Hzzq6tY3/VLVZ6JOz/rujG7eTl2MFS0KvJ1DGILoYx4=;
 b=kRZBIi+xNbt/GEEl3qgUR+qcdN1dK2Ky5tgR6JcRgpnoNZhFBK4h7eLN
 llJCYPPHGEIucThB0BoreNKoflyniElj5av5Gq+k55G/Pp2T6R7/35zm+
 ZR4i4mPvAvHnU5NKGVFf7zanKL5Id64Jnmg3+Lmf2VjYScHKUszp9uFF3
 CcYG9uVIXJY4Od3I3DvJxXbdoiAtJBof/i5UQgIMpBvaJsr3rCaMQ7fHI
 BbSvtcOwdfQHte71K+2t30x6JWTjoNNy4Rf9nZaiMrEK7G/rEBvPJVQor
 6PVLz1zdc0DgKos1yh9JQ8wtLhStBxEJ0165lGgOfcTsuS3f6lZSAV0tZ w==;
X-CSE-ConnectionGUID: jvx08Hu1QM6e7CyhxvuCYw==
X-CSE-MsgGUID: cZrON2WFTw2D855r1CCg1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3456636"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3456636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:10 -0800
X-CSE-ConnectionGUID: 11WslHhgSNywHcPAUd2N4A==
X-CSE-MsgGUID: M220/mCqTc6MNdbFpoo8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="10030834"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:02:09 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht4DOGRndjJbadZmmsYE4c+NEiE7f9BRdYPSFD19vWd2AXhAMZUDQ28/zfggaEdOQvghTd2mivpGs1HaOSP7YogUYArj8NusShvb6WxqT3EKUZ+GwhPzmMO7De90dus/gh2h36cHxhyhXvL/ziaFUF3tcZMC+Aeybu0hG2+ylQjmltWcl8UKrre7MYNtWt8p/8g5ifi/zLo6QKY25xAmoQC+mPczbysIgmEuts6etY7ZebgZKixQbzBreKmjdXJ1ypwIH3ScRL+6s2B7Tdp5fhuCW++BbP4UnfDTsHDttgd3InuYnCt3GkBET+apOmOz7JJG4cGmB6MYidvxSKx8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaLfhpLUaqTryJan5QZFspZkgT3TCRKNA3AgRjiZ1/M=;
 b=WEGY/nm2Q7ZId/AK6yk6kBk8aXkp02Lb+zb9OHc3UxU5mUcbEfPbcy08ewiyS1JbuzK8XPLsIXfekHYOp+GG3jEHH9rQRzNSjYXPyAVbsaAHgn4rKr/BJmhOZnt6aZWz8GjnOSQJegF0PjcTIzLBJPnnyxPgvKNkRnCzY5B+81bru+k/dYo77NJqiqB3PHoUFW4E1njC5VtYFfnCql2F04atuaWsN59H/uBzjcphR8TGduWi8lt9vXGwOOD11yrq2BXBxf1CuYc82IsNUCRTE97DcL6/U/fXceTmi9KyY8YIkXI8fR1gRCT10ppWV2yUsmQJnBtuuvikcWTAtYl77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaLfhpLUaqTryJan5QZFspZkgT3TCRKNA3AgRjiZ1/M=;
 b=TwJ72OuQy+sNsmDZcZWH0ZoICC66GbxFS6X7Ml259QCyEDKOl7aTPjNyW9i0WTvQ5qe/EpO48xADfqBA5Qy+s8qYWd6Strb1tMcvIYVHmDF5WU1nPgPqs6OlCDVZ142QIeBXhbQuPrqSVnKv1bkNsCWcl4+ZM6YknDVwWGWQrMg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:01:07 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:01:06 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v9 0/5] Separate GGTT pools for submissions and VFs
 provisioning
Date: Mon, 16 Nov 2026 10:00:48 +0100
Message-Id: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0047.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: af448a3f-63f3-4470-8bc8-08df43c0265a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|261009223027099003|3023799007|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: IKDCKv9WCR1FH75aPap7t9jpTpKNdHiXDKw2+jSSVoZvmd/g2fvfDP48uVTW40vByCkmYjoYVeATQXfnrMzoB+qFZaEu8jzNLTDeVjdHX+divuRtBivQvOZd0acGrdXMbn9iK6gv0WzOd3/tbqTwSadmg+Jt/iDp2ralkoZsLrNVAIzzQXt1dFJnB7pZ90HUAJ2so/6nZVlEJbvHICNGlV5CcNoZtqLt/01Z4EZsTBBbPjv9UYpyPq/HFN3xjfMkINQRo6AtDANdlomJD7iRXodZSo8VJ6XbiLnYFb1TkAaLU5If1vg1bExXNHn4p+14sYXvpmMYy5cmmWGLTCMO9MESmdpYEyKwjaEifQp6bCmnt4rvnVvl+ZYZ/nxYK+AMuOSQMRpQY54q6wP7UJVk65fVeOlSsSG8QJotPpouiGA/inmwzi+w12MGxhuVX2mMJ/n93rB4bZRQhMkWFlHPOJjVtKZhZThYc+E3rghR09IBdAxLaF/rT1FuyyeXUKF/hFHOLkrUeeWVImtaVsPcRtlYcndEnwrUIxokTkUWWdSLK+epeMULS/qlbKIDSN9GVZD12GvKJ/j/G/mSCjP5snGBaKp0MXoBNh/nETk0NHYW68LAMLL+w4C1+ea4jykQtDnZ/BwEA9UZVx6bVphIZ3vB5+cNd2JyfVuz19hsXmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZqeWN4emRPUjNmTndKMVFCL2lONVpDTHZPR093Z1Nkd3VKbWRaaXo5TjVR?=
 =?utf-8?B?Q2p4M01xTi9ZaSthUmhaejNhbVVJa2pVV0VYQ0hSeVViU3RyVFhBYWM3S3E4?=
 =?utf-8?B?VkFnbkRRYWRNcUlxUFpOeGFESzNXWDVRSTIxYldPSW00cHhHZlp6M09kTVlT?=
 =?utf-8?B?bkh2SGkwVUZKdWVOY0RFTjlEVEJ5MDk5TFVYdlB4eS9QeUQ4UWlKeSsyZDRS?=
 =?utf-8?B?SWNkQmFxU2hzeFMrbmdyNVlaaEpRZk1IK25zS0p1MWNNMlRmTXJEaUpnYkFP?=
 =?utf-8?B?RDRFRDFuTFYzT0krZGdWRG94bStrbUNTYlhyWTdrMHJVMlNJbysyVFFmZ21U?=
 =?utf-8?B?TkMwQlozQ29LV3d6eWw3NTJaRzhQNzl1NzlzMGFRQ0JIcFEvVFFBM3YrL1hr?=
 =?utf-8?B?Q0ltR1FEMVVHa0g4alBhTHd2bjNtSWh4c0NUYmhPT29pMjVHWDBPeWZTSGJ5?=
 =?utf-8?B?Vm4rYmN6TG16cVFSTXNpaGxRMCtTOHhoYlNvOTJaT2crUTFJdk9DRTRLRXk4?=
 =?utf-8?B?aHJKRkZyNjhFR2QzTXBoSUwweCszTzM5RFNadkJjTi83OHR2a05HUEFhSldk?=
 =?utf-8?B?ejRZK3RQSzJuK2lrbG80UmZxc2lrd0RVTDN0WW42UVNiZ3lwUEtQbnhmQWFZ?=
 =?utf-8?B?R0tqYjRuazhLQXpYcmRJVFRNdGdOaDVkOXVIL0U4UFQ3VCtVZ21MdGZLVm91?=
 =?utf-8?B?L3ZPSTRZcXlEWXJsVXA0MEQ1bklTaCtDS1VRVTVLK1dhNUxZa2FXakl6TWkz?=
 =?utf-8?B?WjZaazUxdDJzTndPZmJIbFlydjFMVW5paHEyekNzRVRTT2ZZOE9yb2thT0dT?=
 =?utf-8?B?aHhHSkZ5bjQ0NUEvd1JCZGFCNm1FdkhlTjJlMFJvZC9Oa2M4aFlSb01NQ3Yr?=
 =?utf-8?B?YUdDMXFSL3dMVVJMOHR4L3o3dEUvYVdSelRYcXZ0MUY0eXYxcmR0Ukp2aUwy?=
 =?utf-8?B?emp4Smt2Y1VhV082dTNSdnl6ZGhxOWRhTTBIRlQrRG56RzNsdzNqTS9jU0RG?=
 =?utf-8?B?d1ZPWXRKOG9sUXBBbFkyVHYwaHFpUDhOOWQ4SmFJRGlsays5dlNFT0NrZElF?=
 =?utf-8?B?UllEZVdldW5wTGZobEc5bzE2NmY5SHBhYVVtbFpxUTFuOHBrcFpCS2Q4eGty?=
 =?utf-8?B?S0xJNzNwV1p4ZnRpZkFmOWNxNWFHcmVoVnU4NzF2QVMzU1hYTURaaEtEV0d2?=
 =?utf-8?B?WWhtRnNRVU5BQWhIQ0dEcmlUc25LNjZnTmF2R091d0FGRVd2YzJxb04xcDFn?=
 =?utf-8?B?NzgvY2cyNS9ndzJSRjB2RktvRVJYNlNSWjh0WTlhM3ZYeVZXVWU1ZUZKYWpy?=
 =?utf-8?B?T1BFRmFZZHlGZ3V0WlZiajNxZFl4TVBPTFRXVG9jZkROWCtSaVgyL1pXK0px?=
 =?utf-8?B?TjIxV1U2ZkcraG1kWms4TDNQR2xyUEdyYzFBKzkvbjNCSlYrR252b1dQY1BX?=
 =?utf-8?B?QjZTRVBUQ0dGY2xLclRSNTI0bFo0U1VUbzQwNFJYTjB0TE9zeTNTWkRUVVpB?=
 =?utf-8?B?YWpYYWFHL3Q3dHJzaU9mRmVXTmZqVWtWbExYaEc4WmVRenpzZE93UUs3L01Y?=
 =?utf-8?B?dkUwTEVFc0FqNnlJaFR5Nnl5Mk1oREs3TzRLbElIREpINzBORVYxTzFQS2RO?=
 =?utf-8?B?NGNLWEFrY0FsejJ0YlFoSnZXZ0VLOW11azRVSUZEbWJBQnY1aUxTT01tMXp6?=
 =?utf-8?B?L1FPZk1aMG1jdXBza3JnRXg2YlAvaGxDQUlqamUyWGxVT1piVmtlMFBUenor?=
 =?utf-8?B?MWFtNURKTjZxTlEyZnEyZWFmZllHUUdDOE1WR0UxVytsNmhPMmJEZlVYdFJU?=
 =?utf-8?B?QlE3dFd3dUJxUFgzUXI3TDcyUlpQMjhWUUVZUXBDQWhqZks4RW52aEVoaUtZ?=
 =?utf-8?B?eHp5WFZRaUZmSHNvV0xpVWlBd1A5MElRcUVrVFJoYXBmbHVnS2NsYjlCMDRS?=
 =?utf-8?B?Zjk2aXJCUWtYQXBWSHZYK1dhakZoS0tISlBVUWhMUWtwSlN3RlBack8vRTI4?=
 =?utf-8?B?MFV1LzRVK3hJQTZpT29uNEllSnd1OGsvQWRLVEdzcHZvMFdoRk80UCtXWjNI?=
 =?utf-8?B?aTZ0RmNDcldiNUFHMTRLY3hTRThWTmdmdFpwWmY5a2tnOU4xVy9YRjR6bGFL?=
 =?utf-8?B?WU45cng1MVVLK3NlNTdYeWNtUXdhbHVZMmdWK3ZrbkQ5NmxwZW1qOUFhM3Za?=
 =?utf-8?B?eUtWdE9Vc21PanBJNzAwblZmOUhQTTM1UGRHWnpOTXFBUDVWRUc5VWxadEww?=
 =?utf-8?B?cENTWm5ZVHJVaXlHMGwzVldtZ0YrNU5MS1E3eUpCQ1R4aEJiai9ESnoyV2N5?=
 =?utf-8?B?YVFFWk1rNHRjWE5DOUZIQTZwM3U2bkltN0dQbEVKWXMwNVpzd1Z6L0lEaTRH?=
 =?utf-8?Q?8+e/0SW3bNWAfemo=3D?=
X-Exchange-RoutingPolicyChecked: oVL+ArlgVj4S1Ke8DN/OfaDOFF+Gta+ctk0Qp+Wa08pDeWPaS+VV1mAH9Vg5SN4/3CNEm/9gErQUee9pYZ5A1zIOPYEGgHVjxf1KiI/uEO9LZAxEMx/Fx4DLCekmWMHSKSmF+vaftAxITGedThrrP5ZBy9eXC7ey7A5qLopIyZa/mZx9z8u9h/X+QGO04t5BJuE9BnsXMfexv5hKHXrdySX6miKx+RFCzBZEu6K4n1zA81vgYioIk7ehOi0xpFoEaRJaLt6VUfC4gufmW3BR4MkmXYC044p9eLGxsToIaF1SGjXA79R6uQsjGn7PEXIEIdUd+kfHJviyReMX7mPrPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: af448a3f-63f3-4470-8bc8-08df43c0265a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:01:06.7324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/hVzzihHknLnPVzk4GZ/WbuMx4qkFdsJgTUh26sLaX5cyBsP6wGUQF42SGewOn3qC3e2LQswIhD3Qb5D28hP/RWLI7HIDH6y/kwHJlBbss=
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top.

v1 -> v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v2 -> v3:
 - Init ggtt.lock with mutex_init() in each test.
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.
v3 -> v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v4 -> v5:
 - Add a preparatory patch introducing ggtt->full_size to separate the full
   assigned GGTT range from the regular usable range.
 - Rework the GGTT split patch to use full_size/shareable_size terminology,
   compute the shareable start on demand, and keep regular allocations within
   the usable pool.
 - Move the range initializer rename and full_size parameter into the GGTT
   split patch.
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT configuration as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.
 - Add GGTT KUnit coverage for usable/shareable pool initialization,
   allocation direction, overlapping pools, unavailable shareable pool, and
   oversized requests.
 - Rename the GGTT KUnit test file to use the _kunit.c suffix, add shared
   setup/cleanup helpers, and split PCI IOV tests into a separate suite.
 - Drop redundant non-PCI_IOV stubs and misleading provisioning debug output.
v5 -> v6:
 - Release allocated GGTT nodes in the KUnit tests through deferred
   actions, so that an aborted test does not leak them into
   drm_mm_takedown() (Sashiko).
 - Rebase on current drm-tip
v6 -> v7:
 - Add a preparatory patch asserting the lower bound of GGTT PTE
   addresses (Tomasz).
 - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it
   returns an offset within the GGTT range, not a GGTT address (Tomasz).
 - Explain why the usable and shareable pool sizes are checked
   separately (Tomasz).
 - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
   lock is again released before the invalidation (Tomasz).
 - Fix the !CONFIG_PCI_IOV KUnit build (Sashiko).
v7 -> v8:
 - Use the root tile's GGTT allocated by the fake device in the KUnit
   tests instead of a locally allocated one (Lukasz).
 - Reuse ggtt_node_remove(), ggtt_init_native() and ggtt_init_shared()
   in the KUnit tests instead of open-coding them.
v8 -> v9:
 - Keep the best-fit placement for usable allocations when there is no
   shareable pool, instead of switching native and VF to top-down, so that
   stolen BOs stay within the CPU mappable aperture on older integrated
   platforms (Sashiko).
 - Provision VF GGTT from the shareable pool on the PF, so that VF regions
   are allocated top-down again instead of bottom-up together with the
   PF's own allocations (Sashiko).
 - Expect the native usable pool allocation at the bottom of the GGTT in
   the KUnit tests, to match the best-fit placement.
 - Rename ggtt_test_ggtt() to ggtt_test_get() in the KUnit tests (Lukasz).


Piotr Piórkowski (5):
  drm/xe/ggtt: Assert lower bound of GGTT PTE address
  drm/xe/ggtt: Introduce full GGTT range size
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c   | 334 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c               | 297 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   2 +-
 4 files changed, 583 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

-- 
2.34.1

