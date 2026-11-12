Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5975606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NyDdfeqB;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DUFwwUpl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9543311204F;
	Thu, 12 Nov 2026 11:54:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3584C11204F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484480; x=1826020480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mdNeGfWvB8bpbuz1SQC4qtqwgG+XLLdOcDT3n1GLSVs=;
 b=NyDdfeqB8zO2oO0cLZKrfoYgvSPl7z7zr5fb5cD/P7EG6ZQXe44bAamc
 r8z7gP0I5XELBXs+xB+bwecgVtBi1K+jzOqdA8fZqy/fqPA8WAWPAcQZo
 3Ph1KVQcv2kxvxucQbnjSWBiOq+MgmajVlxEpN9XdOHcpts6K4SUfZ3Dw
 M4TpHP1ekcSXM7iBVvHymmRCavYrrbeJfn9hci2xr/Xf11x7rQOJdE/l5
 g3sSP6vmgaEYkk9binA7UmEVKFB+2lqZXdxRo8f2SQaVKtMHEJHFkucJm
 CLSKxPG23W3FyX/8tfpi906FOonreI3CAa4Sdon2uCUqRZM2kBQ6k2nzf g==;
X-CSE-ConnectionGUID: 4CHAFbhlSl+kkjqsX3DLrg==
X-CSE-MsgGUID: eggmpxbdTyaRe3NlQvYhKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3299093"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3299093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:54:26 -0800
X-CSE-ConnectionGUID: NH8lJyc1Rr+cWCS9Zl+klQ==
X-CSE-MsgGUID: uIVBZLkDT2yOwbuQFUklpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8569703"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:52:25 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TunqlevLNnyGIVtUWqpvcwg02GTKcud64LcrJ6OHWRQAOpiv6/oZdQkcZbrB1IyE4ueNXkut7wl2qQkngqFF3vNhIx/IzpFXMHxpi4qVez08AU7kBIAOp5XaO1xQygjfZ27c+4D6+vJmJQMcojZvbvJz/5FXnj65u8O6SzBioSCEuhnoVfJ9UwBGOe8a6TQ36YlN6zN6tvfpwyWDh0dmqq8p8tUzrqm5bMtJ1AhsB/FuCB1Zc/MYOgEYGxZTRaLaNkqE+Sc/3mCWMZo8wOFxJ91b3tg9j11nVmnhS9eSEbJL0sdJKDDwbKrbeOIcQJEzN5hH7eLQbeScb1+EMs+s9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rPATbU5q/Xdpd4Iv/Il7hR6b9b4MmCSruwgvfb+Sq8=;
 b=OB/1Q2G1TFauTirOOEGySOZLo6UOObZVHU5cn/cIhl8A+ZSx4Bb0lVY3Or/FJzvqCLSvvB5wjUlXu+Me5REJeLMltync8aRcV6KZVn0EiaPx9t/iWlIT2cHHonbrvU7S0KDcvoP7VCTG76zchY+oHvUQMJD1a4cbmIaJiEbbpNpC3+rQASRvaSpNjd9BA4svUV89HZERzv9h41famK4BFW8MJgVc+JonS19mZ6RRpOBbh1dcMdXvmCAoShi43OFHAn6I06oWkCDioEcXDMV5K9pljoqK/xZ2ENEaLfZ9RFbnBZpo/dXxV1wgii6/tgXF6lPNJExJfjRI7sg+tHzpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rPATbU5q/Xdpd4Iv/Il7hR6b9b4MmCSruwgvfb+Sq8=;
 b=DUFwwUplIgQptaJtKKLzspddgV5iCKep0cuLN5bbBgY1ShKZzQreMXgGvMUg1YZpmVF6/IvdP+QgOKCdoQXn2J0YfpQ9UCWdAraUvtTJeA404jO9SlYeGfTRYZxIAHzjW7LKATswYuvHlWU4538RQPhmaNpNI4UFUMbs7B/7XWE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:52:22 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:52:22 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v8 4/5] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Thu, 12 Nov 2026 12:51:46 +0100
Message-Id: <20261112115147.2329912-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fea477-52f6-40ef-a454-08df40b3699d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|261009223027099003|18002099003|261022075727099003|261022105027099003|261021121427099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: t8oR9ZbgGS9IHHZq2zD2Ck1Yaxfxm5AXlY8Y2BJ/O6obYh9HaUNYubuHfFrdfiUejSvwDwe7gomMuI1q2HlvtOi9Zp0mysERdSCUfQUWk6HOtG61jkbr8gy2JmfZa1i9FsGTDCzExakDk6rlzfbLuUO0SOfuhTA26aqOfauwrBQi1OmDcPS8aUrI+ajc5hK6SToHAc5Cgjv+xBxVEd8J9Ed3HNQ3fnVXgwTi+pZ1IPobMIhbcrOIdNZtQU3DZCRpFbmCp6G17NSa7PGFl9JoXmLnTZfPoWAEMOHb405P+mH0R3eblW6FMWRd5CdPhCzyBKUD7HToDuAuMk3r14XA2fgCcX4jZHgTx2a0Obv3lwCJiTqfTTcI1KGsAUbFJoyw9R4eJUYRm+u84JAvtSJssdVTJ3v8ezQLh4d06FduKMcIvCKof3tw8JilmBY+EDybeQldG0HqwPRLDsvuGdbePXwCxYcxecrdeKJAUw5gyLx3yZbRkFcw8K+JVFgncdL29CJeFEbmeknAM5aNocJFb8mCfIyT0UNifwyEQ9JajUHiV2JETfSkM16T91Wi5Oxvyn3xXPubD+0/0qB/r/L5OFzfpFfN8gdI46NjlbcAv8mpTQEYcH9mHwpW6j9QHRtm9LVW0QDFHeaDRUlEgAa4ATCkRvj7XEZ1IhnOJoSt1Gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(261009223027099003)(18002099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpPM0h6dDU3bTJLQjAzNlQvNUpzbi82ZzNGT3FJeUJXeHlLTEU2UXFJS2FX?=
 =?utf-8?B?dXlRdXRLNEgvdmNyTG5CdUpkRHV3Z0M5cC9IbGUzSi9nQVcwWU91MWNFMkRw?=
 =?utf-8?B?YjhaME44eFRzaG5vMGJRdmlObW9SMWVMSlluWXArcjRaWk5aWFo5aWY4cndT?=
 =?utf-8?B?cm5PcEw1ZGZtbjc1b0ZoejNNOUxqOVlLN0pOVlNaOEl3VDd5a1NLRDBwOGJm?=
 =?utf-8?B?NksrOTBzcFA2UWRzVzduV2RjcytiaW1sYjRHZ1RSdDRuYWU3SElrRHhFc2Fq?=
 =?utf-8?B?cmJBQ2I2N0JsdWN2aHZ4V1NRSjV2cVplWDlXck1ITHkydzB5aUJMZlJiVkYz?=
 =?utf-8?B?K2FQOVNKNFRVZkhDWUVIT2hGQmU0QlB0TGM5ZnRVVzlUZHRWeUIxV3MyT053?=
 =?utf-8?B?N1BrNkpGcUtWd0NVL292ejBtTkdSOHZtNmR6TU5Ha3FxZmtPZHc0eit5RmZv?=
 =?utf-8?B?Nmh3TTFwSGh5M2J3dkwza1RNb1d3Wk5QdHM1MktUa2tKaVRXNzYxaURuaElF?=
 =?utf-8?B?V3FXeGdzY0h1a1hFcFJrVFZTNG9zZ0Y5NlVIUXVMRUZaWFdGdFZDQ3pPNnBZ?=
 =?utf-8?B?ci8rNVlsa3FYWjVVNUhpRTN1MTJPSlJaUGcxUjZhdWd0QmdQeml4R2NaRTZ4?=
 =?utf-8?B?ajRVY0VVSi9wcTF2K2NLcnRMUXdZZ3J5V3JKc2ZVcjZKYllsTnUzbC8zRzRR?=
 =?utf-8?B?d3BnazVkcUNqZjdKUWhudDdXN3dOVnNXbU41czg1Ymc5dGh1UVczKzR2YVlF?=
 =?utf-8?B?TFpKY2JCRnZTYXJMeDRaUlZ3a2FDUTVUbncxQzZCVk9kWDVNRGNjeEtiVXdh?=
 =?utf-8?B?MzlsUEdaRVNRdDAyWU9hcDhCbkhZQnFIL2FTZlFXWElZQWJnT2UxMWh3Um1N?=
 =?utf-8?B?Q0RJcWUza0tDUGhoVlVWVGRXQm5XbkszemYwQkxMYlRjRHFSV3hnYkI4VnFT?=
 =?utf-8?B?QUpvYmE5Vzd3cElwREJsMDJZWUlXclN6SGtIUE40MXh3Nmc0bWZBbTFETStx?=
 =?utf-8?B?eFI2dGl5MXNPeWtqM2Z1ajd2TXVXRm1LTk8vaWM4MHJOcHl5dTl1alUwUWdo?=
 =?utf-8?B?OENoLzF3SmdTc3l6T21EeWF1WHRGVTEwOHFhMnRDQTBubFlTRU5EWVN2eFNT?=
 =?utf-8?B?YzgzYjVWdHJMY05YYlFpdXVpMmszUytrQXc1elZoc0ZaWkJnWmh5VUtVL29T?=
 =?utf-8?B?RGpLS1o0dUJsNCtBc1lJU2pJbTBiVjU1ODFnUStHbUpwZHZiUWFEWnpzY0Mw?=
 =?utf-8?B?WS9yZEFTL29OWGY2VUdKNGZGdTAxU2E3OXN4MVFKS1JBODVCV0t5TDVsbmJp?=
 =?utf-8?B?T1M4L3g2djRXeXFiWDVIUys0UUxtNmdWWEdQWnlvWkhvQi9iZVNzVTZVcHoy?=
 =?utf-8?B?NVN4cEh6Tm9XYUs5QnZ1Y3BvYnV5bER4emZRVEhVczZBM3VmZExib0NkKzZy?=
 =?utf-8?B?VXNzL0lUd3JVVVVQN2J4OThpRmdlWndPNmFGV0ZLVnJTR2YvalcvUFp3bk95?=
 =?utf-8?B?NkJNcWpoTVJ4b1djR3FJa2hPdGgrQnpyT2N6ck1IZW0wSlZaS1IydWZLTmxn?=
 =?utf-8?B?UHhLeE45Z2xyVzNhdkpSUUZnSmFDeGtGZStLM204enB0ZXZVbDdUTjJaNFhU?=
 =?utf-8?B?dVZVWERhbmJmVEl5M2tFYktuRVM2dFZnckdIMnBtTFBNdEd4V2tiV3JiWTlP?=
 =?utf-8?B?ZnhCalhsY2NLOUdPUjFUQ1JYUUJESXhUSG02Wk84VGhOMGR3U2V2c0t0YTJM?=
 =?utf-8?B?MXNKUFNPLzJJYW54dThPbnZrY0Qyb1RzU1d4VGNNTDhSRjc3UWtzR0JLdm1R?=
 =?utf-8?B?Mk5yaWdKQXp2dHdHN0tUNlE1TzFuV0c1UmdrNmV1RTVzYlJSYlJUL1RDYnVX?=
 =?utf-8?B?Ymc3czlxS25kNmJ6LzE5MDRXT1E0d1FQY3BGYTVUMVZvb0RWUkpNVlFNZlJG?=
 =?utf-8?B?cFhBM2phdG0vUm5WVFJhNUlTY1YzUzhtSnBaby9LVjFHTUlOOVlhVFhNMnk5?=
 =?utf-8?B?VHBCQnR0UUxaTnVvM0QwRjQ4SEp6R0pJakNoUW92ZHVDUDBpRVd2b0EyTDN0?=
 =?utf-8?B?NUhLQ3gzSHcvTG0vbkFsUlhtQXltVzJEUERFQ29EZytxd2c1dzBkWEE1eFZF?=
 =?utf-8?B?TWprK1E3QVY4WUFULzBkVzYwR0NOb0J4bjk1UGdaWERZSDQxaitYTjBtQnN3?=
 =?utf-8?B?SnVTMWZtZHRLMHBUK2xQR1ZRQmVncVR6T3RkQlRWcWRHNXd5dVFXWHNVWEdX?=
 =?utf-8?B?c2oyRitBd2RzSWdhWGRWM1MwZnUrZ3hSdGI0UGVJbG5wTndXV1JnRjVsV3Av?=
 =?utf-8?B?RG11L3I3YmY4ZHB0RXF6M0hDZkpxbEJ4SmtJaGNTOW93RDgybFJIdkVMc1l4?=
 =?utf-8?Q?GRhCHrGEyqIJ/3Vs=3D?=
X-Exchange-RoutingPolicyChecked: wnVCKXbnY99IR/LhItUBxqtH8g0e0sOtu3P3l62JtkVmpBAuYkOh5nfPbk8EMkUk51fFevsUoFMYbEM46y450tboFgSK1Q7/lH34VAD0KAW7h7GBK4U2g7VHbybhEOdKXSKvXEQnkuCI6T+YHxO9LTG/BCpfT3GLXEsS8bJ5kWoBYv+2v1K76EDV5FBUwsmSgPSBgDJmthfiTJiEOsk864S2b0Slt4sbnFnXaqYxd/b6AiMxVBhfyZ+YccgRoDZRJiOxfgOvsImvHduy25pD92avPlIvsEKS7iXnxOz+es4ilk5Qxi8FViHWoyNf2DlieBc577Z+M50Adk2sBpY1JA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fea477-52f6-40ef-a454-08df40b3699d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:52:22.5890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do7XYpCDv/wYAQpk77EV8NERPVj37tvekq/CoeIjWX7MyQEOIDkvZVlCxxknHHWmHxuE8m0t1cLNJXivo/utfNxXJMJVZtGEZwXwq2jYcak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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

GGTT initialization currently uses the full available range for both the
usable and shareable pools, regardless of the SR-IOV mode. The range is
read from hardware on native and PF devices and assigned by GuC on VFs.

Separate range discovery from pool setup and initialize the pools based on
SR-IOV mode. Native and VF modes use only the usable pool. Shared PF mode
uses both pools over the same full range, so they fully overlap.

v2:
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 129 ++++++++++++++++++++++++++---------
 1 file changed, 96 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 607578e4080e2..c987687663596 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -397,9 +397,99 @@ static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
 	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
-int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
+static int ggtt_probe(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int gsm_size;
+
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
+	if (!gsm_size) {
+		xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
+				 "Hardware reported no preallocated GSM\n");
+		return -ENOMEM;
+	}
+
+	*start = xe_wopcm_size(xe);
+	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
+
+	return 0;
+}
+
+static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	u64 wopcm = xe_wopcm_size(xe);
+
+	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
+		xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
+				 "Invalid GGTT configuration: %#llx-%#llx\n",
+				 *start, *start + *size - 1);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	if (IS_SRIOV_VF(xe))
+		err = ggtt_get_range_from_guc(ggtt, start, size);
+	else
+		err = ggtt_probe(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (!IS_SRIOV_VF(xe) && *start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt_init_ranges(ggtt, start, size, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size, size);
+}
+
+static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (!IS_SRIOV_PF(xe))
+		ggtt_init_native(ggtt, start, size);
+	else
+		ggtt_init_shared(ggtt, start, size);
+
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size - 1,
+		     ggtt->size / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt_shareable_offset(ggtt),
+			     ggtt->start + ggtt->full_size - 1,
+			     ggtt->shareable_size / SZ_1K);
+#endif
+}
+
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
+{
+	ggtt_init_generic(ggtt, start, size);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -427,43 +517,17 @@ static void dev_fini_ggtt(void *arg)
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, ggtt_size;
 	int err;
 
-	if (!IS_SRIOV_VF(xe)) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
-			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-		else
-			gsm_size = probe_gsm_size(pdev);
-		if (gsm_size == 0) {
-			xe_log_err_fatal(ggtt->tile, GGTT, -ENOMEM,
-					 "Hardware reported no preallocated GSM\n");
-			return -ENOMEM;
-		}
-		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
-	} else {
-		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
-		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
-
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
-					 "Invalid GGTT configuration: %#llx-%#llx\n",
-					 ggtt_start, ggtt_start + ggtt_size - 1);
-			return -ERANGE;
-		}
-	}
+	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
+	if (err)
+		return err;
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -476,8 +540,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
-			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

