Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DFF606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbSbkuqd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=k70TEGeP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63561129E2;
	Fri, 27 Nov 2026 10:24:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA211129DB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795775082; x=1827311082;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eEBouU1PGcFj7zvtBBcNciBxGyOM3fAsoaMRWo2amvw=;
 b=gbSbkuqdQUWWvaackvALBRdKx53Nt9V5NjX7e496F5AG1pPnOaZbfFFm
 3FLUYBvuQLTAmS6+s/Isl3frI7L2sFpleEcJN9ox2iydGDOY6qym5J22g
 RNEeIG9ke6rdf9XRFjyENtjem/cxjBBVu5oI2m+XH7Z4zxMnnIR9vPvY/
 X7GrC/qXGVI5L+OC8XmnaBqal1rD5bAmZOoQm1bQWqWdQxb8LKsQl79+X
 SlUpfwDL/Dl3C01+FMj9eiDjVeZdzNfN2wcYSaC9mkn63OmSqUcikmwd4
 ZAqNLz7Ab7P4q81iWQp6Td0J0xhz37k+ZC4+kdB56RukfzwJ4dUDCU7DR Q==;
X-CSE-ConnectionGUID: mDmvn+t3StOxmbb+ONMnZA==
X-CSE-MsgGUID: i3O2/GifQQ2TgA/up/fLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4612659"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4612659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:41 -0800
X-CSE-ConnectionGUID: ogAu/av7Qvi03IvWT0I8Vg==
X-CSE-MsgGUID: Ba2se0+KSECSuSEu9ypGkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12970324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 02:24:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 02:24:40 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 02:24:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTnuvF3t++XTIfYgFb2sIelcmv7Tz+y/6wFCudfDnRRiYSBnLQD56AQJEm8Vr9HOo2b0cnLkV7PunABVLTKIKJbU9I+WwA6HiAoixYxJlmf5OJZKM6nJoBeBWMiTXYSMFHtSRsAZoc/9lvz31tB416sVaRP13oNAq0gNfyvXKt6zSBDZ9CYoR2M6LmmDlrxA869Gz0HlTDGYmQTLHObxDR+Y149/fp9ZpJSeho7+NEBP88sQtTy3peyKj5W0sVuNK1ddfsV+aMcfbiSwDa+KN0X/hKgI7R4bPPmg9z6IWyyQZoHAHnflkenqelnkp9iodeE4YbU4xwimPZ1rpmVy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RvL4lT6oo3ppcdGLri44HjiHQeK628DSfUTNTQpd6k=;
 b=uFXajBOiTA6LP7NsDm25Qfk9enSVvBPFw6LcarQLT2rMZtVo2fH++40/dJRcYGiK1nr5DF9P6e2my+yzBfbuUmt31jLVS6bAmWHMiyB4jRfvU/7AfVmeIK8a4iBUQUZ9x45MCF2fmfjaIRJh4wKHDbdd1LgnjpRhnVo87J0CKnCvYi++B4evLfXprUxYya5YkExzp6LyghHcNptMu7cgj7Tvkx1GVJtIZl4JLpVwuYJD83p/3TiQClnN0rBHubRHO2WNS14n4S28gOsgOBMH67Ejv+gFp1/JDkHOjhUnBhz3Q3o982Jn0M3I7rge+4foP1eCnb94q1/o/xPXG81iyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RvL4lT6oo3ppcdGLri44HjiHQeK628DSfUTNTQpd6k=;
 b=k70TEGePfD+zVJ/nkn9bC0/r0mqA6QqUsXFi/53c2rNQy+JiqtEK7s6QOmsKAMqtEevAt2XbKLd2KNdbKMWNzLOhwHKAahzNbwUA+YtJ0bP1r6ABNF5TvLXPnCdNdboWsDlEOz1dnYGL5C1b/uPCDlNvBo+FDGgSRre1y1g5CIQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CH3PR11MB687348.namprd11.prod.outlook.com (2603:10b6:610:362::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 10:22:36 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Fri, 27 Nov 2026
 10:22:36 +0000
Date: Fri, 27 Nov 2026 11:22:32 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/7] drm/xe: Define VRAM regions and pools
Message-ID: <20261127102232.jib3lkce7ctqkedo@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
 <20261116094523.2484301-3-piotr.piorkowski@intel.com>
 <ba79e8af-c172-4ae6-83cd-d6964f2af3ab@intel.com>
 <20261126094149.bgphw3p44d6lud5k@intel.com>
 <989a8be7-2a19-4ab5-a943-a8419ab9baf5@intel.com>
 <bd372cb2-e602-4a0c-90e9-924126805aa3@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd372cb2-e602-4a0c-90e9-924126805aa3@intel.com>
X-ClientProxiedBy: DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CH3PR11MB687348:EE_
X-MS-Office365-Filtering-Correlation-Id: b70f8aa1-44eb-4a92-05b7-08df4c705b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099006|4143699003|5023799004|11063799006|261022075727099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003|261021123027099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: wTzcEjn1nN6+3GcBh7JlM0xsRScsQUip/JNwzPvvIzljnPgid4tY0fvdS736u96uaTMHF3jP/jdoRie0pKnlRNNB8uF4VmGMRCGzJMNYYKs7wUKBU/Fk4GiyZDR2SQ/eCbAwznSmGKzyucz+dQSCuimOnX2XO63HQmQsmd0WxBM9T0gQ1W/OeX6ajzxHCpz1VJB1DgPmLNyy0C9pk/CBYiHCOfU9YeInjCYxQywZIzkq5n5pxsQCBc5MJtwsrjibYFrs9slXCiuzi2g9COcQI6rq5yRDmnLCB7fbkz0NMkBUvpjkdaEvTbSxx81acXVbbyHDG3h8XtWYvBkcjUEjHE9s/q8Un6v/cQjQrp1D63mP+AGRC2BQaxoJytHDWjELGs+oaVT5sxkDMQzd0aHc5FmiZ8px9z5Ob28/BbVkGeST4qgXQyL3Z4R3+FkHETJc8tJN8kAJKaYuB5teZ4ivZLnHw7aZT9aUEEc9m6AvWvhSHHmquQ3YBlut007d9imiDSL3OQ4oUooJ0e//i6S5Qb/MF6TRcUf2TUTHpgcnagxqp3MS5o74vRqC5UXDtES9HkCIs7q8jvKlMTjK+5bETgBzUHWDKxXBwHgHzLE0MyFfcXaTyhRA2YE6BNZEhGV84TqHc0OK1Yr691D1teMefZdPFDKFGaTxoudim2tsIC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(11063799006)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261021123027099003)(10067099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0dHdUUyNVQ1aEFGUkxHMGwrUTQyaWlNVmJSbWRSYldBekdvT2EvS3dWWSs2?=
 =?utf-8?B?KzB2UzFwRncxTjNqcmZyYmJYTzdVc2NJNnowQWU3eFlTMXp5bjN1aFZkNExN?=
 =?utf-8?B?dXVkT1N5L2F1U1JRQnkrNWQ0bXZ5K2xyanlJTUcrVzd1M1pVNUUxMGZzZUJ1?=
 =?utf-8?B?em5BTzJyYk4rZUk3ajFtQW5hSHJmR3Bqd0REai9Zd01La0liUkFyR0lpNHhJ?=
 =?utf-8?B?SjRVNHl2UHRqcE9pTGVnbHJQT1d3cWJwSkVZK09ZYVZKZ25MVG1hcjdsQjdp?=
 =?utf-8?B?MHBtR2k1dW9NWjE3S3B0aG9UTXI5MGxsTTN0dk1HQVFSeUo5T3g3RkE2VmIw?=
 =?utf-8?B?TVlnN0ZvZjViLzd3SEZpc0VBOU1MWU5xMEJsTjBYM3hMQ0g0WGRMWmc4eFlp?=
 =?utf-8?B?dE5hU1RyZ1NMRHJ2U1JybGN0cWFucEMzQU9sallvYmVJWWp6UWRJVjgxOG5w?=
 =?utf-8?B?d0g3Y0RjRzdmbTRlOUU1endKVDYwNlg1RUt0ME5kaGtkZFZRL2tIcDVvbkFv?=
 =?utf-8?B?YkpZQm5xdnZwQTBOWE1TbEQva2huRzVGdFYrTXNFdGNsVUhDQkh0bE5CdEVP?=
 =?utf-8?B?YWNaZ3YxUlVuMkdBOEo1V3dVNy9YUTYrcTh2L0p3aGNpdENxZDVNRWV6YVJX?=
 =?utf-8?B?Y1QyVVgxQVV4TGppSTBaTy9VSU1iQVhBYUJaNy9Zd2FIVG1rTmFGdFp2a3hI?=
 =?utf-8?B?NHIvSnJ3L2JoU3oyMEd0VGVLZUxGN1dtUXdwczh4RStTeTRBTFhOSXI2N3pT?=
 =?utf-8?B?QjQzSnVDL2M0VWU0YmJqU1hYeFplQnZESWRCM2JyYnM1TEhmNnBBRWR3Z0dI?=
 =?utf-8?B?dXo5bnRaQTJ6UkFxR2tuSzU2dHlnT25uazdLekx2WDRORWh6MDhhRVpjTTdV?=
 =?utf-8?B?djUyMzA1bWpEMUdKNzZNM1pXRXFja0lQZzhrZ2RBdTBYVElaU040WTh2RDhl?=
 =?utf-8?B?ZU1VNEIxdjVaL0ZZbGZpL3EvQXFZZDRkWlBRdG5tTzNOTGJCSXdKRjE4L0pW?=
 =?utf-8?B?eFJmM0tNQm95UTVpa3NJR2RyZ2JoamFFWWtIR2JMNy8yK1l2Nmo4b0RyUGRC?=
 =?utf-8?B?STZDUXliVjc5RlVlWE8xVGFxQWV6MUI4UEk1WCtRRkc3Ylg0MzVRK3FzQzVk?=
 =?utf-8?B?ZlNkY0FpY0N2NVFzWTFhd0tXZ3BFY2pJYkFMcHkxWEhHb1gxb25JaXdONlN5?=
 =?utf-8?B?a29UaUo4V0VVQ1dzRW9sd3ZqcDRBeS9sUnFQWVpWNEZ1TWREY29EdjBBOGhr?=
 =?utf-8?B?N3NOY0dLMVA4U3BWeUlRWnRyWW9mQTR2RTgzWHdtUGVzWXhPSlVxSGc3Q2V1?=
 =?utf-8?B?TjlEWlAydlJLQmhVU2VKOW5Mc3RTYWtZbjA3QTc0eE5HcUJjMkdPUmQ2dmVD?=
 =?utf-8?B?Q0hNSUpJaUFSa01DY1Z3M3g4Z1poWGREbmhFVzFocFdBdGdCODVQNzZtNnd5?=
 =?utf-8?B?K0NCa0NrM0l5bVpCYjVrejNzbWpuMFJQUHd3WkxFMmM5cmNKci9QSjhqamZ4?=
 =?utf-8?B?VkxRN2x3bWduelhVYktJL3FGQTJHd212SWJWZEVmenFOZ2FrR1lHakZjWm0r?=
 =?utf-8?B?c0pDdFA1ejM2a0VDaSs4ZlN5WnZ0aTRBd3lWdk5pcFhYUmwyc004eHF3N2Fr?=
 =?utf-8?B?RHg3cGpRL0JlTW1CWHRUcEN4UlFRQ25ia25Ldmhtdm94Q0hYSWNqdWR5ZEpk?=
 =?utf-8?B?OVdHbkk4dWdYNzJmWDdqVU1sbE5qdVZYZGhGOUczVGVRWm5PSUp1WWFMWEhy?=
 =?utf-8?B?QkxQZDJ6TW1Sd2g3SWkzamFxaEl2ZmxyRGtSM2N4ZjdoaXErWTcyOEZSZUlP?=
 =?utf-8?B?bk4zNkYyeThrd2lBMUdVUEV1cDJVZnNKdDJMUlh0clZsVXRmTGdIQ0NWa3JF?=
 =?utf-8?B?T093RE9QWkdDUStxL0FDTFU1WHlzaFIzbFAyczY3VVdsOFIxeTBVYUlBOVhJ?=
 =?utf-8?B?RVJ3RGp5NENDMjE1VzB5VWdRMTVwM1JWcmpvb1lUL2NUUjRaVitmeFMzMHI0?=
 =?utf-8?B?SWxNblZiNXUzc09MT1h5SzdIbm13TXkwZERoeUk5RytaZ0JURFJCVStSUDRw?=
 =?utf-8?B?M0IzbnZvZFJRSlIvR3JzWm5VZHVJODVXaHgzRDBJdGVGOWJ3K0dMejRTOTc3?=
 =?utf-8?B?Tm4zZW4rMjczZTJkcE5QdVdwbFB2UzMvMjVGb1kzQVNvbVU0MHV5SEZUSnBz?=
 =?utf-8?B?bjBUVUdOSDNISVU0V0wyejg4Zm05U3luTWlUdnVPWHl5aGRENXNRWWpoejZk?=
 =?utf-8?B?Ni9nWjZZekcvMHA5WDBBL3ZwZGtObFAyVlYwQ2M4QVk5N3BEaERTM3Y0ajZE?=
 =?utf-8?B?NHpjNUJENEx0RDlVOTJxcWVXTlYyclkram9OTWFTZkoxdFptMnY0MzhtS25N?=
 =?utf-8?Q?wu9ViC/r6J+9zUhc=3D?=
X-Exchange-RoutingPolicyChecked: FVbnCjfiL0X3XUxCl9gBrILXa4qpUF2+HKmgjwB4QbN+tm+LBRWBEBvaAGF9x0+2rWUvyHTODEO9TyQuSvxfet5/JXs837RmEOrZTNFCKznhTPm5xGwF1lVPYOjkg7z9WwFgEpff6zhcZTwhRJDfkIHlrql6cll6lzGslZzIp48j0XVNuA1hlaaO9xbU+sgBM4q8BA6lw6LHF8w5P+wMpoQ6CRnLdMo36yo9Bi9krVnBBAuwS31ljTDfaC1N/DzZD2Rn9aehhB80k4EBbesadOn4IoujDJ9wVC3FwCdrHttVzHNXFz57AOANwf7eoflWGb/zZs76pnpNAxhdEONBNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b70f8aa1-44eb-4a92-05b7-08df4c705b9b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:22:36.8299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mI1qcpPR6T4bEZZJn9xqRkGC7mV8Cwqqho4yjRWFWGzZIBXRW+SJm9jNWOgXw3ANCLJh8CvsMR+BfWuWfkjYKfs2JRaaHA+/RMBZGo2xit0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB687348
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Matthew Auld <matthew.auld@intel.com> wrote on czw [2026-lis-26 11:36:13 +0000]:
> On 26/11/2026 11:14, Matthew Auld wrote:
> > On 26/11/2026 09:41, Piotr Piórkowski wrote:
> > > Matthew Auld <matthew.auld@intel.com> wrote on śro [2026-lis-25
> > > 17:38:07 +0000]:
> > > > On 16/11/2026 09:45, Piórkowski, Piotr wrote:
> > > > > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > > > 
> > > > > Allocation paths place memory through a struct xe_vram_region, which is
> > > > > both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
> > > > > manager) and the only handle for the purpose an allocation serves. That
> > > > > makes it impossible to dedicate part of a region to a given purpose,
> > > > > e.g. to keep kernel allocations such as LRCs and page tables in a range
> > > > > of their own, away from VRAM that may be reachable by other agents.
> > > > 
> > > > "other agents", what is meant by that?
> > > 
> > > Hi,
> > > 
> > > That wording is too vague, sorry. "Other agents" meant other users of
> > > the device's VRAM whose memory must be kept separate from the PF's
> > > allocations. One example is SR-IOV: we want to reserve a VRAM pool
> > > for the VFs, with a guarantee that this pool is used by the VFs only.
> > > Other sub-drivers that need a separate VRAM pool fall into the same
> > > category.
> > > 
> > > The pool is meant as a generic mechanism for that, not something
> > > specific to VFs.
> > > 
> > > > 
> > > > > 
> > > > > Separate the two concepts. A struct xe_vram_pool represents
> > > > > an allocation
> > > > > domain: it identifies the purpose served by a range within a
> > > > > VRAM region,
> > > > > whether that range is available for general use or dedicated to
> > > > > a particular purpose. A struct xe_vram_region owns the
> > > > > physical resources
> > > > > and embeds its pools as partitions, keeping pool pointers
> > > > > published during
> > > > > initialization stable when the region is later split. The region also
> > > > > records its binding, distinguishing a device-wide aggregate from a tile
> > > > > region, since both may use ID 0 for the first tile.
> > > > > 
> > > > > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_vram_types.h | 159
> > > > > ++++++++++++++++++++++++ ++++-
> > > > >    1 file changed, 158 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vram_types.h
> > > > > b/drivers/gpu/drm/ xe/xe_vram_types.h
> > > > > index 646e3c12ae9f7..a3e421f2f32d4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vram_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> > > > > @@ -15,6 +15,142 @@
> > > > >    struct xe_device;
> > > > >    struct xe_migrate;
> > > > > +/**
> > > > > + * enum xe_vram_binding - VRAM region binding types
> > > > > + * @XE_VRAM_BINDING_NONE: no binding assigned, default
> > > > > value of a zeroed region
> > > > > + * @XE_VRAM_BINDING_DEVICE: device-level region aggregating
> > > > > all tile VRAM regions
> > > > > + * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
> > > > > + */
> > > > > +enum xe_vram_binding {
> > > > > +    XE_VRAM_BINDING_NONE = 0,
> > > > > +    XE_VRAM_BINDING_DEVICE,
> > > > > +    XE_VRAM_BINDING_TILE,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum xe_vram_pool_purpose - What a VRAM pool serves
> > > > > + * @XE_VRAM_POOL_GENERAL: general-purpose memory, available
> > > > > to userspace
> > > > > + * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed
> > > > > to userspace
> > > > > + */
> > > > > +enum xe_vram_pool_purpose {
> > > > > +    XE_VRAM_POOL_GENERAL = 0,
> > > > > +    XE_VRAM_POOL_KERNEL,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM
> > > > > region can be split into
> > > > > + *
> > > > > + * A region currently holds its default pool and at most
> > > > > one pool dedicated
> > > > > + * to another purpose. The TTM manager mirrors the
> > > > > partitions of a region one
> > > > > + * by one, so a region cannot hold more of them than the
> > > > > manager can back.
> > > > > + */
> > > > > +#define XE_VRAM_MAX_PARTITIONS    XE_TTM_VRAM_MGR_MAX_PARTS
> > > > > +
> > > > > +/**
> > > > > + * DOC: VRAM pools, regions and partitions
> > > > > + *
> > > > > + * Allocation paths place memory through a struct
> > > > > xe_vram_pool. A pool names
> > > > > + * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
> > > > > + * placement plus the address range serving it, see
> > > > > xe_vram_pool_place().
> > > > > + * Whether that range is the whole region, or one of
> > > > > several partitions
> > > > > + * sharing a region, is a backend detail pool consumers do
> > > > > not need to know.
> > > > > + *
> > > > > + * A struct xe_vram_region is the physical carrier: it owns
> > > > > the BAR mapping,
> > > > > + * the DPA range and the TTM resource manager. A non-aggregate region
> > > > > + * initially contains one partition spanning its whole
> > > > > usable range. That
> > > > > + * partition is the region's default, general-purpose pool. It always
> > > > > + * occupies partitions[0].
> > > > > + *
> > > > > + * Each partition is described by a struct xe_vram_pool
> > > > > embedded in the
> > > > > + * region, so a pointer published during initialization
> > > > > remains valid if a
> > > > > + * later split changes the pool's offset and size. A split
> > > > > never changes a
> > > > > + * pool's purpose and may only happen before the region's
> > > > > TTM manager is
> > > > > + * initialized.
> > > > > + *
> > > > > + * The device aggregate described below is the only region
> > > > > type that has no
> > > > > + * manager and no partitions.
> > > > > + *
> > > > > + * The id shown below is the VRAM region instance id. For a
> > > > > tile region it
> > > > > + * is the id of the tile, which the uAPI relies on. The
> > > > > pair (binding, id)
> > > > > + * must uniquely identify a region.
> > > > > + *
> > > > > + * Partitioned region:
> > > > > + * A tile's VRAM region can be split so that a pool
> > > > > dedicated to some purpose,
> > > > > + * e.g. kernel-only, gets a range of its own and the
> > > > > default pool keeps the
> > > > > + * rest. The dedicated partition is carved out at the start
> > > > > of the region, at
> > > > > + * the lowest addresses, and takes the next free index. The
> > > > > default partition
> > > > > + * keeps index 0 and is moved above the dedicated range. A
> > > > > tile without such
> > > > > + * a reservation keeps one partition spanning the whole usable range::
> > > > > + *
> > > > > + *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
> > > > > + *        
> > > > > ,-------------------------------------------------------------.
> > > > > + *         | ttm: struct xe_ttm_vram_mgr (one manager,
> > > > > shared)           |
> > > > > + *         |
> > > > > .---------------------------------------------------------.
> > > > > |
> > > > > + *         | |  partitions[1]            |
> > > > > partitions[0]              | |
> > > > > + *         | |  offset 0                 |  offset
> > > > > pool_size           | |
> > > > > + *         | |  size   pool_size         |  size   usable -
> > > > > pool_size  | |
> > > > > + *         |
> > > > > `---------------------------------------------------------'
> > > > > |
> > > > > + *
> > > > > `-------------------------------------------------------------'
> > > > > + *                  ^                               ^
> > > > > + *                  |                               |
> > > > > + *             dedicated pool                  general-purpose pool
> > > > > + *
> > > > > + *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
> > > > > + *        
> > > > > ,-------------------------------------------------------------.
> > > > > + *         | ttm: struct xe_ttm_vram_mgr (one
> > > > > manager)                   |
> > > > > + *         |
> > > > > .---------------------------------------------------------.
> > > > > |
> > > > > + *         | |
> > > > > partitions[0]                                          | |
> > > > > + *         | |  offset
> > > > > 0                                               | |
> > > > > + *         | |  size   whole usable
> > > > > range                              | |
> > > > > + *         |
> > > > > `---------------------------------------------------------'
> > > > > |
> > > > > + *
> > > > > `-------------------------------------------------------------'
> > > > > + *                                     ^
> > > > > + *                                     |
> > > > > + *                            general-purpose pool
> > > > > + *
> > > > > + * Device aggregate:
> > > > > + * A device-level aggregate region is unrelated to the tile
> > > > > regions. It is
> > > > > + * never backed by a resource manager and has no partitions. It only
> > > > > + * aggregates the sizes and DPA ranges of every tile for
> > > > > reporting purposes.
> > > > > + * Nothing is ever allocated from it::
> > > > > + *
> > > > > + *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
> > > > > + *        
> > > > > ,-------------------------------------------------------------.
> > > > > + *         | ttm:        unused, not backed by any resource
> > > > > manager      |
> > > > > + *         | partitions: none, this region is never
> > > > > allocated from       |
> > > > > + *         | size:       total VRAM summed across all
> > > > > tiles              |
> > > > > + *
> > > > > `-------------------------------------------------------------'
> > > > > + */
> > > > > +
> > > > > +/**
> > > > > + * struct xe_vram_pool - VRAM range used for a given
> > > > > allocation purpose
> > > > > + *
> > > > > + * VRAM allocations are placed through this frontend. It identifies an
> > > > > + * allocation purpose and resolves it to a TTM placement
> > > > > and the address
> > > > > + * range serving it. Whether that range is a whole region
> > > > > of its own - and
> > > > > + * thus has its own placement, mapping and address range -
> > > > > or one of several
> > > > > + * partitions of a region is a backend detail the
> > > > > allocation paths do not
> > > > > + * need to know, see xe_vram_pool_place().
> > > > > + *
> > > > > + * A pool stays valid for the lifetime of its region and
> > > > > its purpose is fixed
> > > > > + * once published.
> > > > > + */
> > > > > +struct xe_vram_pool {
> > > > > +    /** @region: region this pool belongs to */
> > > > > +    struct xe_vram_region *region;
> > > > > +    /**
> > > > > +     * @part: TTM partition backing this pool, or NULL
> > > > > until the manager
> > > > > +     * is initialized
> > > > > +     */
> > > > > +    struct xe_ttm_vram_mgr_part *part;
> > > > > +    /** @offset: byte offset of the pool from the start of @region */
> > > > > +    u64 offset;
> > > > > +    /** @size: size of the pool in bytes */
> > > > > +    u64 size;
> > > > > +    /** @purpose: allocation purpose served by this pool */
> > > > > +    enum xe_vram_pool_purpose purpose;
> > > > > +};
> > > > 
> > > > Can this not somehow be merged with the zone? Or why does this
> > > > need to be a
> > > > separate layer on top?
> > > 
> > > I thought about it, but I would like to keep them separate.
> > > 
> > > The pool says what a VRAM range is used for: its purpose and its
> > > range. This is what users of the memory hold, like
> > > tile->mem.kernel_vram or the BO placement code. The zone is internal
> > > allocator state (the buddy and the CPU visible accounting). It is
> > > about how we allocate from that range.
> > > 
> > > They are also filled in by different parts of the driver. xe_vram
> > > sets up the pool during probe, and changes it only if the region is
> > > split, all before the TTM manager is initialized. The zone belongs
> > > to the manager and is set up only when the manager is initialized.
> > > With two types, it is clear which code is responsible for which
> > > fields.
> > > 
> > > Today there is one zone per pool, but this may change. Your
> > > visible/non-visible idea is a good example. That split is about the
> > > allocator, not about the purpose, so one general-purpose pool on a
> > > small BAR would be backed by two zones. With separate types, this is
> > > mostly a change in the manager. The tile and the BO code would not
> > > need to change. If pool and zone were the same thing, we would need
> > > to split them again.
> > > 
> > > Also, a pool does not have to be a slice of a region. It can also
> > > cover a whole VRAM region of its own, with its own placement, mapping
> > > and TTM manager. The user of the pool does not need to know which
> > > case it is.
> > > 
> > > I agree that right now it looks like duplication, with counters on
> > > both sides and pointers in both directions. I will try to reduce this
> > > in v5, for example the manager will not keep its own zone count next
> > > to the region's partition count. I will also explain in the commit
> > > message and in the DOC section how pools and zones relate.
> > 
> > At a high level, if this is just the zone concept from core kernel, like
> > you say its just an implementation detail in the allocator/mgr, whether
> > that is implemented with bias range or separate allocators. But I would
> > have thought upper layers just ask for a zone(s) type, and/or that is
> > somehow inferred based on the usage, like kernel vs user etc. Still need
> > to go through the rest of the series though.

I agree that the callers should only say what the memory is for (kernel,
user, VF LMEM, ...) and not care how it is allocated. That is what the
pool is meant to be, but I see that v4 doesn't make it clear, and it
also adds a lot of duplication between the pool and the zone/partition.

The reason I can't make it just a zone type inside one manager is that,
depending on the platform, the same purpose can end up in quite
different places:

 1) Today: one VRAM region per tile. PF kernel, PF userspace and VF
    LMEM all come from the same buddy, and LMTT keeps VFs isolated.

 2) One contiguous region shared with another sub-driver that needs its
    own allocator. This fits your zone idea well: separate buddies
    for separate ranges of the same region.

 3) VF LMEM is a separate VRAM range that is not contiguous with the
    PF range, and the PF must not use it for its own objects. This
    one doesn't fit well as a zone of the PF manager: it has its own
    DPA range and BAR window, it must not be counted in the VRAM size
    and usage we report to userspace, and it shouldn't take part in
    eviction of PF objects. So it needs to be a VRAM region of its
    own, with its own manager.

So for v5 I'm thinking about the following:

 - the manager zones are the only place where the split of a region
   is described (offset, size, buddy, visible accounting),
 - the pool becomes a small handle: purpose plus the region and zone
   that serve it, with no copies of offset/size and no counters,
 - drop the partitions[] array from xe_vram_region and the pointers
   in both directions.

> Just half baked thought, but what would it look like if we model the kernel
> region with a "zone" now? So ditch the separate VRAM region and move it to
> ZONE_KERNEL which is inside the normal VRAM mgr? If there is no ZONE_KERNEL,
> if just falls back to one of the other zones?

With LMTT, yes, I think zones are the right tool. For example, in PF
admin-only mode we could have one zone for the PF kernel and another
one reserved for VF LMEM. LMTT keeps the VFs isolated, so the zones
are only there to reserve space, so that the PF kernel can't eat
memory meant for VFs, and the other way around.

Without LMTT it's different. There is no translation, so the VF part
has to be a separate VRAM range that the PF doesn't use at all. That
is case 3 above, and there I think we need separate regions, not
zones in one manager.

About the fallback: within a region, it should only happen when the
platform has no separate zone for that purpose, which is the default
case today. It must not happen when a zone is full, otherwise the
reservation doesn't mean anything. Between regions there should be no
fallback at all.

> 
> > 
> > Also, the kernel-doc and commit messages above and elsewhere are very
> > hard to read. For example stuff like "physical carrier", "other agents"
> > etc, is very strange terminology IMO.
> >

Fair point, sorry about that. I'll rewrite the kernel-doc and the
commit messages in plainer language for v5, and add a short DOC
section with the cases above, explaining how pools and zones relate.

I'll wait for your comments on the rest of the series before
reworking it.

Thanks,
Piotr

> > > 
> > > Thanks,
> > > Piotr
> > > 
> > > 
> > > > 
> > > > > +
> > > > >    /**
> > > > >     * struct xe_vram_region - memory region structure
> > > > >     * This is used to describe a memory region in xe
> > > > > @@ -26,9 +162,11 @@ struct xe_vram_region {
> > > > >        /**
> > > > >         * @id: VRAM region instance id
> > > > >         *
> > > > > -     * The value should be unique for VRAM region.
> > > > > +     * The pair (@binding, @id) must uniquely identify a VRAM region.
> > > > >         */
> > > > >        u8 id;
> > > > > +    /** @binding: VRAM region instance binding */
> > > > > +    enum xe_vram_binding binding;
> > > > >        /** @io_start: IO start address of this VRAM instance */
> > > > >        resource_size_t io_start;
> > > > >        /**
> > > > > @@ -57,6 +195,25 @@ struct xe_vram_region {
> > > > >         * (e.g stolen mem)
> > > > >         */
> > > > >        resource_size_t actual_physical_size;
> > > > > +    /**
> > > > > +     * @partitions: partitions this region is split into
> > > > > +     *
> > > > > +     * A non-aggregate region initially has @partitions[0]
> > > > > spanning its
> > > > > +     * whole usable range. It is the region's default, general-purpose
> > > > > +     * pool. An optional split may adjust its range and create another
> > > > > +     * partition before the TTM resource manager is initialized.
> > > > > +     *
> > > > > +     * A device aggregate region has no partitions.
> > > > > Allocation paths do
> > > > > +     * not take a region pointer, they take a &xe_vram_pool
> > > > > pointing into
> > > > > +     * this array, see the DOC above.
> > > > > +     */
> > > > > +    struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
> > > > > +    /**
> > > > > +     * @num_partitions: number of valid entries in @partitions
> > > > > +     *
> > > > > +     * Zero for a device aggregate region.
> > > > > +     */
> > > > > +    unsigned int num_partitions;
> > > > >        /** @mapping: pointer to VRAM mappable space */
> > > > >        void __iomem *mapping;
> > > > >        /** @ttm: VRAM TTM manager */
> > > > 
> > > 
> > 
> 

-- 
