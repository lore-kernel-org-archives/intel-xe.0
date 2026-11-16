Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51E7606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWN/Q3US;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hgV7OXX9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0AE10ED5A;
	Mon, 16 Nov 2026 09:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D7510ED5A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819744; x=1826355744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/3wpxeoBxigG+ir+nNfkb+4Ur3/VQML3zvBZfrTyo9s=;
 b=PWN/Q3US9vfNmZQSqQU6gT+y1kTFsIaxGVgd6TFWMoh5tjf/44W8oQui
 Hk98rIHlhq8JoJdLoJSiqAzFq0sCScVsj6/K0OJQckazb9/xIqTiBh9qt
 /X2X/NsY9Lt5KFJglD+w2NlLO92GbFwV6wLBrSrtxacTDkRljXRR8bHFm
 fiEhWhGoVn+WRa3pX7+wS7sud954tKXSBNxgOn/N3qrUhVpKaYQbMnT4y
 qhZFlU6xXyq6i4GjyDxj7PxFA1KDnx8HPPIjah2X9mbOjRxLk1kRluWzi
 8UagGVXTAoKZHWrn9EWsBVXA8D1YvMESSg34VpbgzemjkUNcs7GhEg/lU A==;
X-CSE-ConnectionGUID: 24GfKcUeRVOstZGDyNtshA==
X-CSE-MsgGUID: FXLf98W8TFSIFpdFOVGGFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3456650"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3456650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:17 -0800
X-CSE-ConnectionGUID: Cgyyuc3WSxa6FSzDq/DVug==
X-CSE-MsgGUID: q/u6p/yqS3O4XzMs81A4zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="10030857"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:02:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5ke2psbwKxYwPA9tzci11RruUsvKgWUaCAq10GllsSqyZ9neXGgZGa7WUguYz4Gxl3IgJaHxX6eJajRE28Kr0rpU9WUiRPF95o2n4/sXPTH469iHjRNLG80yPT6ia8qX+uoo+TwkjZK+m+v/WQJftrHl4Beaxl5vsAUDS5Zen7uv5KxxUNYGSqT+gW97jKqAa7pkG26RfWjO3kE+IcNJuk3iKew6b6Z9Y972/d+aUdknnHA34EjiXx1BZeIwqD8xlFyVGfkSgv/xffh7VSThlHiGpWiHYBOx9hepj08wl9l2nYKWoWnDZ0fGExpgyoNR6rfN4JeynPleIGX/XfpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YolO/r/TLMRyK3XWjlMj8+AL7OGE9PD9G0C/8nYGIQY=;
 b=NC6IXZeLs+sohEJkP9BhLpEr95lNeAFK8VWQOHJRPQ5Dg+XQaeeyfEfreIKYGAXmgDygbcrX2DxYU74DhdprFRpVze82sngBt8/qaBL88kL5IkvE1a6bcTp6JVyj5QGFuPzcQxt/jDjbygWWGRA2H9eryoK4KM8M4LUt4WMlh+gkslypdQWex8qV0wAe1ZzxtycjDjEbMur1cq/cL49APZ3VX82anO79FzqrbP1oXnrXU5TobQmxGBiyGu/JCRmUbOFzs0PwqUJvAPAhB3pfVbF7XKt3v6FydbG0WxGzvOmFNVkqmATyebRIPWE+N+WKfi2ilLwuhjljKVfqT9uByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YolO/r/TLMRyK3XWjlMj8+AL7OGE9PD9G0C/8nYGIQY=;
 b=hgV7OXX99AjF7CGrN7OlDH8eck646yEnciHS412Au2qFrG65fR66nvd5piK96cN4OLrHeVje2p9RjYhPZXmq/FzkqEERz3N7m1s2Vg7m3WXPYGDyWTUV2Mo7cnzbf/T6wxY4zZZU8X4zlM+lrKPzdSgpqh+b/fyLdsTA5LiigFE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:01:19 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:01:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v9 3/5] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Mon, 16 Nov 2026 10:00:51 +0100
Message-Id: <20261116090053.2466938-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
References: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6e4a30-9e92-4374-18cb-08df43c02db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261026130827099003|261021123027099003|261022105027099003|261022113327099003|261021121427099003|261022075727099003|261021135927099003|261021130227099003|261022115727099003|10067099003;
X-Microsoft-Antispam-Message-Info: ryYUKnepd9iL+ONFutBdp7jRcGuv7yBgOmLty9RtAdC3Cr0hPMRRs6+dHECLP8SPPt53wXsMKhDW7uv7EuJaCDwCG4xlv2al6JKY4/KHzBcpZX3hPV7eyFjXB00xo3Kgl7G//RHMXw2yrkk0xHex6E4jGxP/LffYLWsRwqtLtxNF8lOehLShDz0a2u7/fYoklC3dRFWXUITRcgpQya08L53eQ6eCWhZPBX1o2Aw2xgO+1IEjEHt2aEtoVVJzC5nhBC8hJxaTlTN9chcfpyJ1r66jhHENfne8PqOxJz2T2cq73fUE3OTKxFfC6n6afhMRl9+ULMa50S/yOkZqTWJ8U9kUGxMkFsdxr9OlgLw5mVjGY7Fym1tgncg1+9aPPPXzTqLiwJvRiJXU82QnqN/rf7WbazdURFwmVhfMf+5mM6HDNusg3uM0IYvEmfu803KOp3npWYRgjVqpRjJ3jC4fvbUbmmt7QytQiOq7oaDGDEoX8A4djU5JmdYYfIj//C1VcEYEdXN8rCidFDvB8pYe0CvujZRtjK9O8vXlGlEB7+qtpeb4tZSUzUnarp62fd8xYazY7Ck53nSqskcB0yvD4wT0PqMD01XV28FiVru8RleShh2bPPdrANBVN4NcuqjkMNmVspC8GntLcP7aLbmvqKpvkNpkMUBF8CzUgb6H2Yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026130827099003)(261021123027099003)(261022105027099003)(261022113327099003)(261021121427099003)(261022075727099003)(261021135927099003)(261021130227099003)(261022115727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVl5L0NHNFNMUTNEcEUvZkxhSlNHNThZQ1ZZWUNnMmdIaXlhNkYwakpkVVF4?=
 =?utf-8?B?UmEvc2lac1RPTStOWGtZby9DMWM5ZEx5ZmcyRXFBT2hrWnFxaVhWdUE3cW1s?=
 =?utf-8?B?RUJTNk1jc2M5Wm1yRW1HTXYwelQ0aTJEUlFTUkFCRHVOYmlsZHRIZ3dleTRT?=
 =?utf-8?B?TUZ6c3gzOTBpMkJKREFBbFk3b3hIRFFOT3l3SlVNVmwvdkoxSXBHa3FFNEwr?=
 =?utf-8?B?Qi80Yms3ZlRaS01xYVVmem1qNUNIYllHNHd5UmxPMGpUMzVEekN4TTJJOU5W?=
 =?utf-8?B?N2IrczVCRDhvU29ZUk43b21PRlRNMlM0Zk5DZ0wva0RBUHhiYS9iRlZPUk1n?=
 =?utf-8?B?VC9XVGRrUDhGTjlkdlBSeklLSFVyUEtjNmRkUGFQanN1QUdNV0s0N25VcWFl?=
 =?utf-8?B?ZjdSaERCVGNRUll1Y2NqdEhHV3ZXNkRndFVLcktYK3pTSm1GSk5QT3dSalN1?=
 =?utf-8?B?ZTlVOUFhTE5iN05MSk0xMG5DaWZUOUV4WGFQb3Nua1NTcTl2MGtmbDRiMWZa?=
 =?utf-8?B?YzhQeTgrTUdNRXYycFNwaXltNHFwQ202ekNORWxGZlRSNFhGMExHMHQrdXRZ?=
 =?utf-8?B?ZXArVWlob05vWjUzVTltbjIvZmR3UktKeHpkcldlMm1kY1h5eWFJelo4N2oz?=
 =?utf-8?B?eUpsa1ZmcDYvYTlFUU03VE95dEk4MGJFZnNHVTgyQnhwTlptWFpvQ3Nwalo3?=
 =?utf-8?B?UGVDaDhVUVF5NTFJWkpWaGRmNXR6YU40OXJwM3BtUGpFK2prRTcrSjN1Mlpt?=
 =?utf-8?B?RU85YUJNL1IycHZ6OHhJd2kza2R0Q05CTGxZLzNiM01sOEJlcDhrdFE5WWxL?=
 =?utf-8?B?VFFqMG1Od1JGT2pqS2p2WTc0NHVTdUJJMzZqYS94U1UxdTBsaDdmbkZuME9H?=
 =?utf-8?B?b2l1cnh4Qmk0YkZHZWQ1dDZnNU1JWVFCcmd1ZlNMVWlXZVBHdWNOMVdkSjBi?=
 =?utf-8?B?SEVNaWhZSGhYVjUvUG1ZZnNRN3lEdDQyNzNMRXY3K0RRWUlzWlZUSm0zQUZr?=
 =?utf-8?B?U3FVQStXVCtLWEpmVENEVG5yTENwTXJUbzl3UWVxR2RESWhMbHBGRy9OVWhG?=
 =?utf-8?B?VDNCRXg4M05VVGFKL0lHa1h5cGI4Nm91cCtjUEVxT05tNnpFRmZ2bkFTcE1S?=
 =?utf-8?B?OUNsMHFQM3JDN0NERzUvUlZKa2QzOHN2cVJhdVJaNDJleUtiaXgvQWptd0sw?=
 =?utf-8?B?VlpGTWVkUHBoNGRTMlJmWE5YclNQSUJqSjlkZ003a1BUK2dPWEEwVU55bUlR?=
 =?utf-8?B?ZGo5TW1pbFcwQ25sclZEZFlKZkk5cG9GZTQ0aEQvcGVZdGlrTUV4bllPaTFk?=
 =?utf-8?B?alQrN1AycTJHeFQzSWZEQTVoazU1ZFRCYUpVbUUzRktLaDA0NG85TWsrU3lW?=
 =?utf-8?B?QUx6NGQyR0x5cWlpc3Z1aC8raHB5TW9MZWNFOVhMVGNEYmU4dlpsait3SzJ5?=
 =?utf-8?B?NTFXdmJycVR5M1V3T0Nmd0lJSzdVM1Y2Zm1BQm5hQmdyM3NFczdmZTh3c01w?=
 =?utf-8?B?cTBXNFNNRG1Pb3VIbTk4RmZEYXJMV3l0ZjJSWEdJa21tbVA4aEFTczhnbmZ1?=
 =?utf-8?B?bG9xUlY0a3NKQnJkeTNpK0xJZCtucVRxN01Zc2pNdFZZbjQrcURmVERINHZm?=
 =?utf-8?B?Nlh3R0RTUTg5SkhPSWJXb1llMEU2a2sxNkRzNkU0VkYvSm5LSnNUY3BTSUhF?=
 =?utf-8?B?bTZhdlRLR3RJZG5CYmUvWmFxZjQ3OEI0YVh3WDV1am9wOUZVc3lUem1jQzQw?=
 =?utf-8?B?bjhTRVBoNUpLbDh6eU5ENEkwczFQMzZZenMrN1dmMXpsYm5zZmdQSGFXSzJK?=
 =?utf-8?B?aGhpS2lsVEhxUlhHLzBCYVhGOERRclQ1RjFGeGxrUVU4VVg2UkZQcDkrcisw?=
 =?utf-8?B?anArck5tQ2w5L05waEZaMkpSdmNBUU01VENhK2lHS05kNTBwSVhvM1JPazNU?=
 =?utf-8?B?ajhaMnJja2prampUellMZEVZYnJJQTgzaXdQZFFGYU8zVUkwaEhXSGdNbDJK?=
 =?utf-8?B?bmFSaUJGelJ2Qk1yN3RFdFZFdmJCT1pVSWFtaEgvcmlpckphL0RiM251bFMw?=
 =?utf-8?B?ZS9GUnY0MzBkN1N3SGEvNVNBRnpzYlZCUHlnZW5xREtldEd3OEpCd3NldUxa?=
 =?utf-8?B?N3diemI0bW1WbThSc05RZ0dTeHpia1FBbXdzNFkvYWhlU21yU2ZvMnlpRmhz?=
 =?utf-8?B?YzZVUUFTMkppUU5UbFV2YUp3bHlYMHJNMVpqanY1WU00V0ZLM2poYktmNS9q?=
 =?utf-8?B?RUxKUVJkNDhvdWZQL3I4ZTd2M21vcG00M1NSRTd0WnFBQVVMc25NdGxYYVA4?=
 =?utf-8?B?UXNYOFdUNGx2d29VNnE3UU1KeUVqcWdwbFg5U09jeUJGSVlhNUxqQlh1NkVZ?=
 =?utf-8?Q?/jaPyR1uwSW66lZc=3D?=
X-Exchange-RoutingPolicyChecked: O1LfYl+umkuhaduySfqGL0gPhHcrYfUJwe+V4LoKuWsOJ2CCGQfMJHZAvM4pAHBVvPQkMp7LMCaZx5f3feLv5Y5lgtBfVUi+k3XH8mMPBAiIUGb7ZjYwMNtJRtU1cpB7NY8spmqXi3Mfs6VgSU/lDpRQka7KbGUHjk8ZumtlaPiAjL9oybWZS+k+b5dGX3V9Sh3e906O1IawYWwlfssKrcf5q8O5xSXlBTy5wO8ofUTVfbwi+bjaRK4zuRpmnvXTAiIVikgOMvZK3JdxlUWzDKBrHJr6PECwqwBGWlwncIixOWNW1ad6e+DCQM8VK2QVp8YTWBDUEqqtWpi7F+qSiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6e4a30-9e92-4374-18cb-08df43c02db6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:01:19.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X44osPRrVuswvAqFV+WpnPmA65g7ebsrtLlO2leDAZX0qlma4AQGt83t8LYZzFTH2vN5egQPAVTxwDo/033bCTfgY/H2wb1R4IFPU+wz0Ok=
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools and use the
shareable one for VF GGTT provisioning on the PF. Without a shareable pool,
keep the existing best-fit placement for driver-owned allocations.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the full_size struct field instead of the ggtt_accessible_size
   function.
v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v5:
 - Move range initializer rename and full_size parameter here.
 - Use shareable_size and compute the shareable start on demand.
 - Constrain regular allocations to the usable pool.
v6:
 - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it returns
   an offset within the GGTT range, not a GGTT address. (Tomasz)
 - Explain why the pool sizes are checked separately. (Tomasz)
 - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
   lock is again released before the invalidation. (Tomasz)
v7:
 - Keep best-fit placement instead of top-down when there is no shareable
   pool, so that stolen BOs stay within the CPU mappable aperture on older
   integrated platforms. (Sashiko)
 - Provision VF GGTT from the shareable pool. (Sashiko)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 159 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   2 +-
 3 files changed, 144 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 73c45eecae2be..8bc888f6274cc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -145,8 +145,19 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
+	u64 shareable_size;
+#endif
 };
 
+#ifdef CONFIG_PCI_IOV
+static inline u64 ggtt_shareable_offset(struct xe_ggtt *ggtt)
+{
+	return ggtt->full_size - ggtt->shareable_size;
+}
+#endif
+
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
@@ -360,17 +371,35 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
+			     u64 usable_size, u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, full_size);
+	xe_gt_assert(gt, usable_size);
+	/*
+	 * The usable and shareable pools are separate logical ranges within the
+	 * full range and may overlap, so each is checked against the full size
+	 * on its own. drm_mm keeps the allocations from both pools apart.
+	 */
+	xe_gt_assert(gt, usable_size <= full_size);
+	xe_gt_assert(gt, shareable_size <= full_size);
+
 	ggtt->start = start;
-	ggtt->full_size = size;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->full_size = full_size;
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size)
+		ggtt->shareable_size = shareable_size;
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt_init_ranges(ggtt, start, size, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -447,7 +476,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
+			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -641,6 +671,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
 }
 
+static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
+{
+	return xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
@@ -652,24 +687,65 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  * This function may be called multiple times during recovery, but if
  * @new_start is unchanged from the current base, it's a noop.
  *
- * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
+ * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
 	guard(mutex)(&ggtt->lock);
 
-	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt->full_size)
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+/*
+ * When the shareable range is present, allocations start from the bottom
+ * to leave space at the top for the shareable pool. Otherwise keep the
+ * best-fit placement, so that allocations stay low in the GGTT, e.g. within
+ * the CPU mappable aperture used to access stolen memory on older platforms.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
+{
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable_size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_BEST;
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, ggtt_usable_insert_flags(ggtt));
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -686,12 +762,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -703,8 +779,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable_size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt_shareable_offset(ggtt),
+					       ggtt->shareable_size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -712,6 +825,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -795,6 +909,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -815,7 +930,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -882,10 +997,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
-	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
+	end = min(end, ggtt->size);
 
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+	if (end < start + xe_bo_size(bo))
+		err = -ENOSPC;
+	else
+		err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
+						  xe_bo_size(bo), alignment, 0, start, end,
+						  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a695..59b2f02870195 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index cca2f837e90b5..93c3b55bd1ee7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -531,7 +531,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_insert_node(ggtt, size, alignment);
+	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
 	if (IS_ERR(node))
 		return PTR_ERR(node);
 
-- 
2.34.1

