Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB156606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHRHNj6Z;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j2MGSC0H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E81E1122B6;
	Thu, 26 Nov 2026 10:08:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF171122A1;
 Thu, 26 Nov 2026 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687711; x=1827223711;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=H6rKdpRT0fQMPgX+MTLWUdqZKk5fm91t1fJMJZJgCoE=;
 b=PHRHNj6Zn+5CvDW4e+uNkfXvRsqhWmXUPG18Qg8P+AY6Utcre9Gt8wxw
 g3mZDnf90DCbXqKP0lVB3JHWpzSIf0eEI1LwfRuhM8m2QSHThjNYy2gy/
 8K13ryWd8h/sUVBcQkd6tE3p4DP/7ybq938Ze64GcFbatUJyLjXG4eX86
 +8NZf78bJUkAL8AnUUUex58MDW4+MgNd1MHz2zk/sKe70N8KAGgQY3oo3
 kpLaeUtcsQrj0tLz++NOYI9YsVidGejbQdLAmZN55mGKK4PkfJm39wGMg
 LfaNkq0pj9trKaNzapQEaUVNHHThHXx5TVXbtLRJqRDeCU5HC7PpOuHQO w==;
X-CSE-ConnectionGUID: 5O95f05zQ6+oSm6N+qGB3w==
X-CSE-MsgGUID: XLeOs++OSqqw5fCZhjhFWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4677548"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4677548"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:28 -0800
X-CSE-ConnectionGUID: USKw2o9CTae99MC1xel1ng==
X-CSE-MsgGUID: zEl8SK1RReO5XLmsYS/aJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14169391"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:28 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWP0CbEEO5LViSE8q7m/L+sLSHdMERpTW5c36eMNIPY5d7JwbdXjvAAVzfV8apzwgMUDHTsbG+GG5426ydEPYyfHiAVDq0W3IVu+5Tb50CiN7OpHpXbd/V0SJsCTdACFGw1L8m041k1YkpzNoDwgb8nurAo2+ENZ3uAh07jdnomohcDXSTO30uiJ+T/dqQNikUo00RrBqovfndL5iRzavw61JDhHV/5Ih6g341n8JOiXFY+eAGmu1/FofUbd3eJwCESozqoU5qrOoJ5Rs0/5IacDykOPjZh63f3KEQ5J/QgQwgAaGahdWLbF3m7rZUJ/D34n5DO+9ICmojIsH/bNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoGlv/gYQsoLMrajluXAZwFuHZa5aD3whL+2mMhI8kU=;
 b=oJQ3tHSWMSKbcUjdr5F5RohHoFoeT0p37WCOD4fo1/qX3rUpOb1EznfrxsQqqZB7lRvdWDLngwhF59Vvm03XaKGcSuW5E+mEHI8QnQPpGoXE4y27JmARMZ5M9XdqmtDBrRz9tEgTxDkI5LQLnHk6kwFz5G5zuLUkoxPArLTs7dp1gYjfhz7mcP2sn/IHGZ6CwNRF6rtgp1+WV72FHn0C3WgUXtT0TodxA1AUczCInfZ95r0ImzpIBjWO/crvdfivAFozFARZEkhFYvxaHrh9n6FdBEJcyO424Tl3Gy8wJ+ljeS618JbgEKlfrIuH+AMdSZZ5z4SxtyiCwcbHg9WfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoGlv/gYQsoLMrajluXAZwFuHZa5aD3whL+2mMhI8kU=;
 b=j2MGSC0HUDxffIy+DgizKEvNJFHNGh2PeeMBFoya0hHUfvM3KMAOZ2uvy8NCoxGiFIOvzmn50vWGSgX1r/q6tMksfJjyKq1nQGVz067SdGa8CfEvgikai/YxBYxTIv9fFQmURHnjEyTzF0XV1fzCN1vrxI4F+x2a5hcW7HWm0pE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:15 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:15 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 11/13] drm/i915/ddi_mgr: Verify and restore DDI allocations
 after runtime resume
Date: Thu, 26 Nov 2026 12:07:51 +0200
Message-ID: <20261126100755.1252635-12-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0001DBA8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6e6) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 715124b8-a662-4a8b-04f6-08df4ba52fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Rq8BIKBhaibzjkTApF500IrfEUCyIj2XBSWOIhnMfYGEQDS3Tlz4mIM/6awMoaKXY/DZ30u5DsdhsHeJ7T4mGX+egJt3gDIJEgsIoQ1vjWyHCSnGcMzmTfNwThzPGGMdFnoHaoFuon8XNE5wuYSLBEZDaisl571L6V34hkN4zgWilMlRVLxxZPaCSVzchH5c3FxqZxS0JgyAha+Uc9EKwetFoVM9C5xh82f6diapiD/EtkijH0gqGS4K3FGtgY+DEW6Zl+2x12wcIlaKm0p44ZzxnG43LRsEEoFQ87cYoxMaZC/OeojAo/buZEPLVe2zBj7cXNlF9rEFq4BoOQaFCmJ8/hIg3hsSsM+wA3Db28kedx9zZkhzIo+G6LYNKAv1cvNkPHVzQxPURnzITIDNw1pRdZvEhHJP0PxVI819JjlJjLlrZrGuB5saXQEqAufHJ6K0sEH35z80aaQSPnMEiQSDKGGFtf2V1Bad0ILuOBDLjdLWh/CBaVuYcWIA82bY9GyH3c4hPRrYHS2SwYs7rhaU4PodhL6A9fUaIT6JhyMVfPiqqRpU4wnAMLQoa9LhblqBIebo4enKD/jvpfkAYfzLru3WYUrkHgYYL0nNY2sAnJuEngzrjvi1PSOXUIpKYpydNPX5fvFvxGDHxuzw9F2tTvIB2bcRgaL+TFbrBFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhpZ1pLS2Q0b0l2aGx4V1BiUEQ0MHdDNFllVG5QZnhpRnpIUEFBVUN6M2Zl?=
 =?utf-8?B?R0lyTjJBVHdvcW9SdGJJdHllMzVZSnVsZWYvWU9VR1BXVG1RY2d0TmwvR0kx?=
 =?utf-8?B?WWZ0ZjFwQ0ZxRlJKSlBITmIyOUVZbjdtTjl6ekRaWWlmTkFIVmFVL0Z6eEtW?=
 =?utf-8?B?V2NoRnM4TnVrWFc2d3ZyaVcyNWlKR3F1ZGs0b3EwSDhsSDBzd1NmVURUUjh4?=
 =?utf-8?B?VDdIenBTQXhVT2ZDTnp2WnNPeWxOcG12VkxQL2drNGxwYmVxakdzQk5QaE94?=
 =?utf-8?B?d2t0WlhLd2w2elgxSmQ5azVLeHdEajhjYk55SmJVaGZHdDF4WStjMzlyZmdy?=
 =?utf-8?B?bDJnUDY1MmJNSnJYOEdxaGlhMGxpbjdmMmNlSjlzeW9GN3gwM2xjdXoralQr?=
 =?utf-8?B?Yy9aZHMvNGhKWEwvWFFMdE4yaWhPcE15ZEM2eVNWdmpDRTJzSWxINk82WXFI?=
 =?utf-8?B?MDVmOC9ldkRyd0d1bHZ0c202akM3T2VSWHNvRm9zZ0JBTFJaV1NhUmdXQ2lh?=
 =?utf-8?B?RUo3Qno1NGNkNUdsYjRZT3RyVmJwL1BzbFVNRWVINFgzZ28ySTFHMzZ1TEQ5?=
 =?utf-8?B?bHp6S21yMmNVQnpLUWhSQXRjb2xDMHg3TzhnMG5iWkVuZHRSOEFIZVJlYk4v?=
 =?utf-8?B?YXlkeExiL0Q3cGY4UTdtRWFkdW5TeVJrUnlOanBqdE5DbGFJWGE2akl0bVJi?=
 =?utf-8?B?N0hvR2xtWDNTcWlreEhHWlcvdlRORWxnRE1ScjFmZHZSaWR0UGE1czVJcHNT?=
 =?utf-8?B?MHdwMGROYTc3c21CemtuMnc0ck1GVmRTWWtmd0pPejRjWGJuOUJydENqbTZk?=
 =?utf-8?B?ZDlHUVgxNFB0TWV0cHhLY2lvbXRDUVg1eWFISEJDeUpyRjZRWnFGZGhxMEZH?=
 =?utf-8?B?cTg2VTBoelVJc3hoVFZZTXZrY01XbTB6aG03U3pWb1N1amRUOFdvSHRRZWJS?=
 =?utf-8?B?cUdOdCt4UU9JdTJaWUo1anRsWDh2TTZYRmcyek85TVQvMFh2cURvVnhyMHND?=
 =?utf-8?B?clNaMzA4amRQbEExeHphQUdZR1FoS3VwaEtWZkR4T1IzdDNsclFuSHNrTXhC?=
 =?utf-8?B?VWhtVlc4NnREUDEzTlltbFBuSVFqTUNxL1RzS2hVbmhBSDgycmJsSUs5QWxv?=
 =?utf-8?B?dDc3L1psRkNGNHFFaHJBVG5HVEE4dThkeWk1Qkdqc3Z2MDVZSCtEZzVuR2xG?=
 =?utf-8?B?RGtoRXQ5RHFYUFFJUmxDT2dvdEsxNjZva3hzUU1XSnRDVldNbXFtcEM2bTdD?=
 =?utf-8?B?MDlwZkVpMUR5VHM1Mzg5MTY1WVJQblZCZThjZGNUUE9hc0NQeUc0VEdNQWlG?=
 =?utf-8?B?dG4zSjdId0JqMzBYellxNDUwQ2R2b2hIMzZRd1ExeE5qWFB4VENJT3N0ZmZJ?=
 =?utf-8?B?Rm1DSEFFczcvKzhjVmxVbHVMb3FwV1pFbzR1WjBXQU1jUHdkK3dsbVlmR0xr?=
 =?utf-8?B?MzBsY0l3M0p0RnJuRzBMWWtoVDNHY0cxRlA3ZDg2S3BYMU1Rc0pzTWgrRE9w?=
 =?utf-8?B?SGFicG1wb0pHaFNUOFRFcVBpaXdqTXdmTGVnR0VLYy9lOEUyRmc1b282MTlx?=
 =?utf-8?B?MnEwcXFaRWFEdm1PZ2RWOW9ucTVob05oTndXcWJpYzgyMXBqUi9JWFhlUDZz?=
 =?utf-8?B?QnB5TU5MeTI5R0VBeEpheG16ODRHMXdWUm5VYVIxUVZBNHk3ZmZKaVlSMUlp?=
 =?utf-8?B?R28rbGlwb214Z1V1OFVVcDZnQnQ0eVRLT2YwNitnNlRjRzJnVWN3MjVxUk1Q?=
 =?utf-8?B?eGZTRDR2RlVDbDRTNHZEcC9taFdyUE55Qnl0OVVRT3haN1M0dUJXODBLZkVr?=
 =?utf-8?B?N05xbXo1NnptNTlhdzNBS1R3YjF4cjkwRTVqWTh0R0NQRmVHNC82MXdPZUV0?=
 =?utf-8?B?b3FLMG5INTltTDJBQ2RucDZLMmtEOE5CbFh3OHpGMmU4KytKbktnREZpMjg2?=
 =?utf-8?B?aUVvSmZQN3lZZkZWc2lSLzNCK0N1dzBMM3RPaDJtblk2aGoxU1NJOTVwc25M?=
 =?utf-8?B?UXZ1YUl4V3k5MkFnMEtqQzRaV3VFUDZRcmQ1bGIraDFjMk1SaThPdzNaZmg3?=
 =?utf-8?B?dUdxZnk2MFhTNW5ORzNRdUxWUTJPU1hUK1BoRGQwV01aM3NXcGtWMzBSVE0v?=
 =?utf-8?B?VFYwYXZtYTFHOWlKaHdBSUdmTUU1TFArZ2VkTFc5Z2Nmcy9UNSsyMXBjUWIz?=
 =?utf-8?B?aVhqelU1VGxYSDVwWUFEUXhZOUNUNjZlaVpoMmR4dWpZTzFsQVZzWHU3OWM5?=
 =?utf-8?B?d1Y2ZnRGYTMra0lsNXJIWlZHcnhOelNWczFBaGdCVklqQ1ZGaDR4cUpOQWNi?=
 =?utf-8?B?M3ZPRHIyV1JBaWw5dDVWUUYzTkxBWUNxcmZWRzJpTFBTNjc1QUo4dz09?=
X-Exchange-RoutingPolicyChecked: dCEGRt24JV8I1+vrJMsREt6oYdshpc2aNlw/lNvsDAvRb5XRl6bujhBf2nqfpE+ca0tJP+ZhLZVFoPiz1hhj3SqrM348VPT++1JwQOYiIEG+7mnPO9U42sW4i75PdnuRrJXbBQh69Br/iklbICCzzuHzrnV34l4y75A+n1JJyv/T9YkzmxVcxOWf8NPPlbDcfWwfGgwlkjGkNeJ1iXhgbhHN57OF64njAS/09JGmiEfeBJLqpT/8PR3JFbFdWoOKAaJDUPEHOQWaS8HiBjLOWnlQoHzOjqcYjPaxa/4TXPMLNhXJ89npKEYpvmCw8Cj6fWsVVt4RwmY5UIOLEkoRmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 715124b8-a662-4a8b-04f6-08df4ba52fcd
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:15.6113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbixNZ4HnrwNvHjBq9kjpl49glXVFlbdeMtSjJQ7PheSS/gxouJ7BUpiI+Zk8Z1vzzAMDWTiU4T/D93dCkfdGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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

Check that the IOM resource pool and recorded legacy PHY assignments are
preserved across runtime suspend. Restore missing legacy assignments to
their original DDIs when those DDIs are free and the PHYs have no other
assignment.

Firmware may reuse a legacy DDI while the device is suspended. Track
allocations that could not be restored separately from the saved routes,
and report their connectors as disconnected until the allocations can
be restored. Reject enabling these connectors, including when the loss
is discovered by the commit's runtime resume, while allowing them to be
detached.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 123 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |   2 +
 drivers/gpu/drm/i915/display/intel_display.c  |  12 +-
 .../drm/i915/display/intel_display_driver.c   |   3 +
 drivers/gpu/drm/i915/display/intel_tc.c       |  33 ++++-
 drivers/gpu/drm/xe/display/xe_display.c       |   3 +
 6 files changed, 174 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
index 236146a37fc34..8f32e7c8dff27 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 /* Copyright © 2026 Intel Corporation */
 
+#include <linux/compiler.h>
 #include <linux/iopoll.h>
 #include <linux/seq_buf.h>
 #include <linux/string.h>
@@ -45,6 +46,7 @@ struct intel_ddi_mgr {
 	struct intel_ddi_route route[INTEL_DDI_MGR_NUM_PORTS];
 	u8 ddc_pin[INTEL_DDI_MGR_NUM_PORTS];
 	u8 pool_ddi_mask;
+	u8 disabled_ddi_mask;
 	u8 legacy_phy_mask;
 	u16 ddc_pins;
 	bool has_hdmi;
@@ -101,6 +103,16 @@ bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi)
 		display->ddi_mgr->pool_ddi_mask & BIT(ddi - PORT_TC1);
 }
 
+bool intel_ddi_mgr_is_ddi_disabled(struct intel_display *display, enum port ddi)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+
+	if (!mgr || ddi < PORT_TC1 || ddi > PORT_TC4)
+		return false;
+
+	return READ_ONCE(mgr->disabled_ddi_mask) & BIT(ddi - PORT_TC1);
+}
+
 bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display)
 {
 	struct intel_ddi_mgr *mgr = display->ddi_mgr;
@@ -165,6 +177,9 @@ bool intel_ddi_mgr_aux_available(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
 
+	if (intel_ddi_mgr_is_ddi_disabled(display, encoder->port))
+		return false;
+
 	if (!intel_ddi_mgr_is_pool_ddi(display, encoder->port))
 		return true;
 
@@ -193,6 +208,9 @@ bool intel_ddi_mgr_connector_available(struct intel_connector *connector)
 		return true;
 
 	encoder = &dig_port->base;
+	if (intel_ddi_mgr_is_ddi_disabled(display, encoder->port))
+		return false;
+
 	if (connector->base.connector_type == DRM_MODE_CONNECTOR_HDMIA)
 		return intel_ddi_mgr_is_legacy_pool_encoder(encoder) &&
 			(intel_bios_encoder_supports_hdmi(encoder->devdata) ||
@@ -822,6 +840,111 @@ static void update_hpd_sources(struct intel_display *display)
 	}
 }
 
+static u8 legacy_ddi_mismatch_mask(const struct intel_ddi_mgr *mgr, u32 resources)
+{
+	u8 ddi_mask = 0;
+	int ddi;
+
+	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
+		const struct intel_ddi_route *route = &mgr->route[ddi];
+
+		if (!(mgr->pool_ddi_mask & BIT(ddi)) ||
+		    route->mode != INTEL_DDI_ROUTE_LEGACY)
+			continue;
+
+		if (IOM_DDI_CONSUMER_GET(resources, ddi) !=
+		    IOM_DDI_CONSUMER_PHY(route->phy))
+			ddi_mask |= BIT(ddi);
+	}
+
+	return ddi_mask;
+}
+
+static u32 restore_legacy_allocations(struct intel_display *display, u32 resources)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+	u32 new_resources = resources;
+	u32 readback;
+	int ddi, slot;
+
+	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
+		const struct intel_ddi_route *route = &mgr->route[ddi];
+		u32 consumer = IOM_DDI_CONSUMER_GET(resources, ddi);
+
+		if (!(mgr->pool_ddi_mask & BIT(ddi)) || route->mode != INTEL_DDI_ROUTE_LEGACY)
+			continue;
+
+		if (consumer != IOM_DDI_CONSUMER_FREE)
+			continue;
+
+		for (slot = 0; slot < IOM_DDI_NUM_SLOTS; slot++)
+			if (IOM_DDI_CONSUMER_GET(resources, slot) ==
+			    IOM_DDI_CONSUMER_PHY(route->phy))
+				break;
+
+		if (slot < IOM_DDI_NUM_SLOTS)
+			continue;
+
+		new_resources |= IOM_DDI_CONSUMER(ddi, IOM_DDI_CONSUMER_PHY(route->phy));
+	}
+
+	if (new_resources == resources)
+		return resources;
+
+	intel_de_write(display, IOM_DP_RESOURCE_MNG, new_resources);
+	readback = intel_de_read(display, IOM_DP_RESOURCE_MNG);
+	if (readback != new_resources)
+		drm_err(display->drm,
+			"DDIMGR: DDI restore mismatch: requested 0x%08x, read 0x%08x\n",
+			new_resources, readback);
+
+	return readback;
+}
+
+void intel_ddi_mgr_verify_state(struct intel_display *display)
+{
+	struct intel_ddi_mgr *mgr = display->ddi_mgr;
+	u8 old_disabled_ddi_mask, disabled_ddi_mask;
+	u32 resources;
+	int err;
+
+	if (!intel_ddi_mgr_is_enabled(mgr))
+		return;
+
+	old_disabled_ddi_mask = READ_ONCE(mgr->disabled_ddi_mask);
+
+	err = iom_lock(display);
+	if (err)
+		return;
+
+	resources = intel_de_read(display, IOM_DP_RESOURCE_MNG);
+	verify_ddi_counts(display, resources);
+
+	err = verify_ddi_pool(display, resource_to_pool_ddi_mask(resources));
+	if (err)
+		goto out;
+
+	if (!legacy_ddi_mismatch_mask(mgr, resources))
+		goto out;
+
+	drm_dbg_kms(display->drm,
+		    "DDIMGR: Legacy DDI allocations changed during runtime suspend: 0x%08x\n",
+		    resources);
+
+	resources = restore_legacy_allocations(display, resources);
+
+out:
+	iom_unlock(display);
+
+	disabled_ddi_mask = legacy_ddi_mismatch_mask(mgr, resources);
+	if (disabled_ddi_mask == old_disabled_ddi_mask)
+		return;
+
+	WRITE_ONCE(mgr->disabled_ddi_mask, disabled_ddi_mask);
+	drm_dbg_kms(display->drm, "DDIMGR: Disabled DDIs: 0x%02x -> 0x%02x\n",
+		    old_disabled_ddi_mask, disabled_ddi_mask);
+}
+
 static int init_ddi_resource(struct intel_display *display, int ddi)
 {
 	struct intel_ddi_mgr *mgr = display->ddi_mgr;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
index db10d0e8b3a97..fddd69564b84d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
@@ -14,8 +14,10 @@ struct intel_display;
 struct intel_encoder;
 
 void intel_ddi_mgr_init(struct intel_display *display);
+void intel_ddi_mgr_verify_state(struct intel_display *display);
 
 bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
+bool intel_ddi_mgr_is_ddi_disabled(struct intel_display *display, enum port ddi);
 bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
 bool intel_ddi_mgr_is_legacy_pool_encoder(struct intel_encoder *encoder);
 bool intel_ddi_mgr_encoder_has_lane_reversal(struct intel_encoder *encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 19caae633d29f..1c03e801e21cd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -68,6 +68,7 @@
 #include "intel_cursor_regs.h"
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_display_driver.h"
@@ -6812,7 +6813,16 @@ int intel_atomic_check(struct drm_device *dev,
 
 static int intel_atomic_prepare_commit(struct intel_atomic_state *state)
 {
-	int ret;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	int i, ret;
+
+	/* Runtime resume may have invalidated a DDI after atomic check. */
+	for_each_new_connector_in_state(&state->base, connector, conn_state, i) {
+		if (conn_state->crtc &&
+		    !intel_ddi_mgr_connector_available(to_intel_connector(connector)))
+			return -ENODEV;
+	}
 
 	ret = drm_atomic_helper_prepare_planes(state->base.dev, &state->base);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index c13471a5a10e7..b018608eae032 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -30,6 +30,7 @@
 #include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_dbuf_bw.h"
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
@@ -962,6 +963,8 @@ void intel_display_driver_pm_runtime_resume_early(struct intel_display *display)
 /* after irq resume */
 void intel_display_driver_pm_runtime_resume(struct intel_display *display)
 {
+	intel_ddi_mgr_verify_state(display);
+
 	/*
 	 * On VLV/CHV display interrupts are part of the display
 	 * power well, so hpd is reinitialized from there. For
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f878494bcb388..e01f367007424 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -10,6 +10,7 @@
 #include "intel_atomic.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_display.h"
 #include "intel_display_driver.h"
@@ -1173,6 +1174,17 @@ static void xelpdp_tc_phy_get_hw_state(struct intel_tc_port *tc)
 
 	tc_cold_wref = __tc_cold_block(tc, &domain);
 
+	if (intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port)) {
+		tc->mode = TC_PORT_DISCONNECTED;
+		drm_dbg_kms(display->drm,
+			    "Port %s: skipping PHY readout, legacy DDI allocation unavailable\n",
+			    tc->port_name);
+
+		__tc_cold_unblock(tc, domain, tc_cold_wref);
+
+		return;
+	}
+
 	tc->mode = tc_phy_get_current_mode(tc);
 	if (tc->mode != TC_PORT_DISCONNECTED) {
 		tc->lock_wakeref = tc_cold_block(tc);
@@ -1195,6 +1207,8 @@ static void xelpdp_tc_phy_get_hw_state(struct intel_tc_port *tc)
 
 static bool xelpdp_tc_phy_connect(struct intel_tc_port *tc, int required_lanes)
 {
+	struct intel_display *display = to_intel_display(tc->dig_port);
+
 	tc->lock_wakeref = tc_cold_block(tc);
 
 	if (tc->mode == TC_PORT_TBT_ALT) {
@@ -1203,6 +1217,10 @@ static bool xelpdp_tc_phy_connect(struct intel_tc_port *tc, int required_lanes)
 		return true;
 	}
 
+	/* AUX transfers and modesets reject DDIs without their legacy allocation. */
+	if (intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port))
+		return true;
+
 	if (!xelpdp_tc_phy_enable_tcss_power(tc, true))
 		goto out_unblock_tccold;
 
@@ -1227,6 +1245,14 @@ static bool xelpdp_tc_phy_connect(struct intel_tc_port *tc, int required_lanes)
 
 static void xelpdp_tc_phy_disconnect(struct intel_tc_port *tc)
 {
+	struct intel_display *display = to_intel_display(tc->dig_port);
+
+	if (intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port)) {
+		tc_cold_unblock(tc, fetch_and_zero(&tc->lock_wakeref));
+
+		return;
+	}
+
 	switch (tc->mode) {
 	case TC_PORT_LEGACY:
 	case TC_PORT_DP_ALT:
@@ -1733,6 +1759,9 @@ bool intel_tc_port_connected(struct intel_encoder *encoder)
 
 	drm_WARN_ON(display->drm, !intel_tc_port_ref_held(dig_port));
 
+	if (intel_ddi_mgr_is_ddi_disabled(display, encoder->port))
+		return false;
+
 	if (tc->mode != TC_PORT_DISCONNECTED)
 		mask = BIT(tc->mode);
 
@@ -1880,7 +1909,9 @@ static void __intel_tc_port_lock(struct intel_tc_port *tc,
 					  false);
 
 	drm_WARN_ON(display->drm, tc->mode == TC_PORT_DISCONNECTED);
-	drm_WARN_ON(display->drm, tc->mode != TC_PORT_TBT_ALT && !tc_phy_is_owned(tc));
+	drm_WARN_ON(display->drm,
+		    !intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port) &&
+		    tc->mode != TC_PORT_TBT_ALT && !tc_phy_is_owned(tc));
 }
 
 void intel_tc_port_lock(struct intel_digital_port *dig_port)
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index f757cfad4bd6e..b36a7cc83420d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -13,6 +13,7 @@
 #include <drm/intel/display_member.h>
 #include <drm/intel/display_parent_interface.h>
 
+#include "intel_ddi_mgr.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_device.h"
@@ -340,6 +341,8 @@ static void xe_display_disable_d3cold(struct xe_device *xe)
 
 	intel_dmc_resume(display);
 
+	intel_ddi_mgr_verify_state(display);
+
 	if (intel_display_device_present(display))
 		drm_mode_config_reset(&xe->drm);
 
-- 
2.49.1

