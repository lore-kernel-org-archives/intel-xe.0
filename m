Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2CECA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 08:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D2A10E44C;
	Mon,  5 Oct 2026 08:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcL8UY1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1776210E247
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190321; x=1822726321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=alpbmMysow7VUn1sPZ0bnZ57Bj8FyrptYz4Zn+nfiQs=;
 b=UcL8UY1y96cfICGtir6fjnc9LvTSYB0YiAduQsCyKpP8CT+fBBRhvqTx
 k3p61vN8ww7iKwtpVI28ed8FpfOBH82cmBAg0LQICZhGYx55jypCSqUR8
 TS0QE5X9IxvFUFHJI09k3dUSHQBePOksWLOZooutq5GEoJmCLDtQKjeet
 HLdWfJsRwWnvv8G9wFOtge1b98tbaxG7lDqryF+H+6kjOE9v/8DdeNoNk
 MgUf8Ykxvfu8FTD4nRib0q7lUpDeO8dqLloKUZYiJcwiEqYiDBu/SMVj4
 iDdVefiiIsJFENyIwgdEl+RTIoCZN2bQQMdJrvTgB9JMkPWy3kPI5ahlW g==;
X-CSE-ConnectionGUID: Y7elMjkkQIKC1v8DGlnYtQ==
X-CSE-MsgGUID: 3xLSLVYXRaiDkowBM5RY1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94345045"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="94345045"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:00 -0700
X-CSE-ConnectionGUID: M54U8IrITISY3BwI2QAY7Q==
X-CSE-MsgGUID: sAbhvjH3QxuhDmxmyNtLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="774070"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:51:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 01:51:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ginuqjbz5+MER9zPjCMK3NbWN8nPXsQ0RKodSGoJ6kjsn/iQCg1C8Y8m1Yk1fVXfE5tDSen6beOP/8EC2Df3QXwadjuO4rwMdPRtrcwOk8FmBFtZISeZnKXA96neT2sLfUYLlo/uzcHM1vWYq0/k+kVk81klv/5eGbgxSrXSs1m4jleGpjxxgt62ii9wlEpamfQ+Qy6PYlb67XGSWjAloeqVDJnHXUXFWf8RALDWQ6K5S3cacZLql10PJ/KnfpgybimGYAtuGdHL/+AigX1zrTZujpPm68Y8j3LvFeYCC4FfZIjqx0Ij5YjhkkNWZFCG3QyLL0e+BchCBo9byJfU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX+JJ479Hty6wbHYq+0nsfm+QD1TZR31kMLP0mhlhGw=;
 b=nLNMSQbsymQgf1CMzFiu/vvy72bs9lXdBERgspesG0j6NJW2WCc/y26bvWzh71s+mxjGGGehiaD2CIvJ1xuzA6tSZeGeuiRh3IwqRTqwx3SMYjXmoLo5VyGj1OMLdJw6fswoilTlTuMPEr+emoSZIPLJvdkNOznrFmWe2rM9X7Y92nficMviRwV/6TpkDvbUhFbExH68TZ+5vqxn5LUARkZHejtnkucX0N/9gUOtVulFR8OnpPfXC3CAz32h912ewEW+R/wqQwZoDQYIeKMCoyIbQRwCgYaQ/z17IsAf2XWRMAXS83MtI3wavW74Wxj7/NuUofVb3fsvjZksWyZ9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 08:51:56 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:51:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v5 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Mon, 5 Oct 2026 10:51:30 +0200
Message-ID: <20261005085132.3720685-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 226e67ad-335a-48e6-4113-08df22bde8fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: B9fy1i4YF2DzcyCgi3YwGItiE4LQdt/lPYHP/03I7eCD8itG0BMtM03jFiiZkOrb/AxKDEi1J8MqUC2O76TNYQ2TpCXk8aLLiyFbhohZRdSh0HhozY4haC/bAR9TJDYlKA9OnHmrV99FML6LTf6DY0n4uq/ZAVLlIVxC4dhPtljTjes8aq685X3pXpBN6YO7E/+7qr/E0CZIVSbytSZFVWwNN2q2sUokOeN1wg6ughsOw8DrjhX2vcXloyS6RN+uk8bEbV4x89J2iFc5wD4uNlctYsZ0/ITLyOxgk94pXsOfIscfmaChPq/RuRf4gABNaC9gpyYLdfVy3ME7NrUJjg6Djqx1snG0oJ5pXlQ/quzS7Yx1TDWGt/3pOxb9xTt2ack7QGAezjG5lPTJ2cSKfdr1O6ZhipVWvmc57opy5ufUGYk4HnHs9zXapNka8573PxTtFSrCsfG0iFXz7QfNh27D3zDw1WnLXAprlFLy80OUCUde59WUfXqybBQbQlm3ZZ4fqYPPzY2Y6Q/ohIuCrC6odvGyqI4qQuEJwKbuIxDBsONBUWXZNnG7vIKJ+vQizUJEguKd1z7MIsPlpAX7/FUQGcv63fP2aTcOIaaPbFSkkpQfs79u0HaiGHL297r7GfJMEFtFcKT5KucZK8uSsN5pUo1zjaCSQfPPl7BL1LI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGcySE1uSkFoT01wTDNTdERtRTI3SUVxaUFpcjVnY1puSWNNTjhQRTVaL3Ir?=
 =?utf-8?B?WVA5RmIxVUlOQmRoeUREK1JSQXVRaDJ1T215YjRGS1d3ZTh6NWI3RDFvRUUv?=
 =?utf-8?B?UEpMMi9LUXEzdG05MXZqREVrV2szOXRkQ3Jyelo5RDZKeFlhZlIycTFvcTgv?=
 =?utf-8?B?NzZZWjZHd09xcDk5dVowUFJmc0hGTFU1WTBkWVh0NnlMZzg1US9KYi9WeTVU?=
 =?utf-8?B?UVd6b1BPZE1nWkhSbjlMS3dWQ0dPbUZBZjdCWlMrTEpTdUthMEFyQlB4cENa?=
 =?utf-8?B?OUhETW9kc1M3MThKU21IZUFFdCtDOVJ4ck9lNHd5d2RURGc1TDFiQlZwVDBi?=
 =?utf-8?B?UHJhdHZDNk9IWld3cHZvd0twcGU2V210OVJ0cngwTkYzR0twTDBrZlhZLzJX?=
 =?utf-8?B?Mmk3b1hHOEJmUE5UbElzUGN4T3FCdVpEVmlxeUFiN2R3SEpWR1pwYVRvNmJz?=
 =?utf-8?B?SzczTnRsRG0wNUZKUXRWS29vNk9LditOMGdHRlFhTVBXdHluODlhOUZjZkdy?=
 =?utf-8?B?QTZZWm50RWlQcVBNd01WM29iZDlkRWkyYnZkTENRZHAwUG1rTHczT3krYmJz?=
 =?utf-8?B?VVllM3FNRVpxTVJXQ2FUVCtkVjhycWY4eEtFN1pneVQ1VGFKckxrZFhUT0lI?=
 =?utf-8?B?VzA1L2tGcVVnaXVUNVppWVlVcHV3Q1MvM2wyeFNVZ29Sc2RCZHV1Uk5uOGJu?=
 =?utf-8?B?dndneHlpYzNsMUYvQSswUDFXeXNkdStCZzFXR3Y4UERySVhKUTN1c2pndDBC?=
 =?utf-8?B?bko1K0QwUzUvVDV6bjhER2xVYmZudi90WVdMLzRYQ0k4TGVubDJiQ2dYUCtK?=
 =?utf-8?B?T09DaUVFSW50dkdObElhU1JQS3lUZFMvUlh5UzV3T3pmQWV0eVd0N2ZoWjZC?=
 =?utf-8?B?YkYwamJYVTFDZDFpc2lnSFVndElPL0pNb2FmSjlkczBQV1RZUlpoNGRPTzFt?=
 =?utf-8?B?Y01uSmk4TlN0Q2k5a1IreHcrSjcybnpZSEx5QWVTTlZMaHlZNlVnb0FKRkZj?=
 =?utf-8?B?T29VMG9iYTJUdGp5NHpwaXVnTzgrZVI3b245eXY0bmpuMjcvSW5md21qL01X?=
 =?utf-8?B?b1NRTzFtem9QRE5GbHdPbWhvZ0svTkJIYk9Ka2ozSjFtcW1OOVBFMllnaW9z?=
 =?utf-8?B?RW8zRWRmcE1MbytHTE9XTXVTMDZqc2owT0l1T3hKUDF5MVR2YnFtT3pmbDZ6?=
 =?utf-8?B?alF6czVkSFQ4aEhURTlFcEl0M2RUdllsWEt4RnhtYlpzQTJCMHE3akVFSHFS?=
 =?utf-8?B?QXo3QS9Hb2VoZnQ3QVdMNWg2bUFKTGZQKzhPZmhMMnVoaUNBbmMvL245bXY2?=
 =?utf-8?B?U0VsaU9JbXNxZmNBQWx0ZTZPaDR3Q3pXVjFJa0ZsRWZ0VkZ6REIrcXdMRkZ2?=
 =?utf-8?B?MWx3cGZUZ2lHWm5YQVQyQ0pCSU4wN2JWaExtU3luZWk2NEVaWkVNb2R2MlBF?=
 =?utf-8?B?NXZpbjBSdWFkNmw3ckNHMXBUMEpOWENBeGdmNCtMNXJlSkdQK29HMytvb0Y3?=
 =?utf-8?B?Sk5NSUg3YllPdS9vMmhFVzZubjVzUGtROU5sT0xiZm95V25nM09OQ0Rsc3Mw?=
 =?utf-8?B?WS9jeEVMZHltQjVWMC9MVEoxY0dGN2Q0bGVGSTNyRGtCb3VSVFVTWlZ3bU04?=
 =?utf-8?B?VmJMb0NoY21hM21ubTZnaGxORlpvWGQvNlNjbGlBTkxHd0hrUDUvY3NsTlcr?=
 =?utf-8?B?WHZ6WHdTa2FzNXQ4Z1lRM1JzeTkwV2JEdkJZOGwwQWxKRVF1VzlkQWNsL3Fl?=
 =?utf-8?B?cSsxb2JKSm9SY0U3ekowbnpQZVZYeWgyeTBSajJ4T2VDM1hqZzlhRHB1RG1r?=
 =?utf-8?B?ZExBUTdtdG11ZFR3MjI2WldEWEF0dUhiY2Y0MytkWWtqeHBWY1RsbjEwOTQ5?=
 =?utf-8?B?TDdHY2JzUkhlTnk5S091QVoxUUFIQjRrNFJDdWd6eHBGZzFKZFNUSjdPSVNo?=
 =?utf-8?B?VDFhckZXbmlyOEtlMW8wZmhva3lTeUZUNUNXZXVuR01vaEE3YUdQYlNoRGVR?=
 =?utf-8?B?Z2E1bHNPRnZlY0pVNEI4dlNDR3o0SktLYWtxNkxFWDk2MEtzRTNjazVCTWQ4?=
 =?utf-8?B?bkN2Vyt2K1dwYVVkU0ExR0NIWmJFK0M5M1lwMG5YblhGSS9FVFdPZkY5STNt?=
 =?utf-8?B?TlM5UjZVNlM4a0Q4c0RMN1Ezb1Z1MlQ1ZUE3MXR0dytBYzU3SGNSWmNxRWNv?=
 =?utf-8?B?cHl5UEhCYlZsUERSM2NrdFhrc3RzcVNKZ3J1ejIyVGtVQ1h1VEFVWmJkRVB1?=
 =?utf-8?B?NkVoTmRZQllVVVcyNThCR1NUcHllbEdVM2ZCdGZEZC8vOHFhZXVQb2RNaFZF?=
 =?utf-8?B?K1hEeVJ4Yko0SlViU25OaHJjdEZrNkVabzJGOWZydVMvMDE2NW93MDB3VTJs?=
 =?utf-8?Q?PhPJR1+no0CKpvt0=3D?=
X-Exchange-RoutingPolicyChecked: DOErxQovlOW7VtBhYHOX8zooroISPoZrJxHzhClzOH+Uva/0ENxMX5U7Fbnof359/2ikEvJWbxOuxzIWcYr6EjX+MuiPnAyjprE4Agqk0HT2YJmSvhs891muC0Tjp2eXir0G510pO52CipW71CksrsTMcjr6iXWcWzTDEnn5aZiMm5AnXvI8hngSwx3OGw3j7xrsbCwk9Y1ErFwUIbFLZW6QM3c2Y6lYMvEN/sWe2HT+3PLtcICh/MeK+hHOZo0ofFA/Q7fY6sasslqrIoLkFDfQaGNDBlLpzrm6WCyTHb/AhJqh96yWW3G6zwUqPRry0l973Q8iu0OmQqryLFIwHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 226e67ad-335a-48e6-4113-08df22bde8fe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:51:56.4728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAn7mXn1mUABSqkAUwq5VVvE467vKRvepNu1ZeezBUsoePrBhD844ASVFqdg8PcNgyfoDE+xUHZ7MWnqsxLinDZD9l+KEVDBrREIHNzo080=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
    so the mutex is not leaked on failure (Sashiko).
v3: Guard failed ID reservations before releasing test allocations.
v4: Avoid releasing unreserved ID ranges after failed test reservations.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 609 +++++++++++++++++-
 1 file changed, 594 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 78d3de46b7572..5fe71eac2e380 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -7,13 +7,27 @@
 
 #include "xe_device.h"
 #include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
 
 static int guc_id_mgr_test_init(struct kunit *test)
 {
+	struct xe_pci_fake_data *fake;
 	struct xe_guc_id_mgr *idm;
 
+	/* Keep one logical suite: use PF fixture when IOV is enabled. */
+	fake = kunit_kzalloc(test, sizeof(*fake), GFP_KERNEL);
+	if (!fake)
+		return -ENOMEM;
+
+	*fake = (struct xe_pci_fake_data) {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	test->priv = fake;
+
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
@@ -33,10 +47,10 @@ static void no_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 
 	mutex_lock(idm_mutex(idm));
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
 
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
 }
 
 static void init_fini(struct kunit *test)
@@ -51,6 +65,23 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static bool require_iov_config_or_skip(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
+		kunit_skip(test, "requires CONFIG_PCI_IOV");
+		return false;
+	}
+
+	return true;
+}
+
+static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -62,13 +93,13 @@ static void check_used(struct kunit *test)
 
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
 		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, test_idm_used_total(idm));
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,32 +107,566 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int usable = GUC_ID_MAX - 10;
+	unsigned int shareable = 20;
+	unsigned int spare = 11;
+	unsigned int tail = 10;
+	int usable_id, tail_id;
 
-	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	mutex_lock(idm_mutex(idm));
 
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
+	/* spare is larger than the overlap, but the PF-exclusive range is free. */
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable - spare);
+	KUNIT_EXPECT_GE(test, usable_id, 0);
+	if (usable_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	tail_id = xe_guc_id_mgr_reserve_shareable_locked(idm, tail, spare);
+	KUNIT_EXPECT_EQ(test, tail_id, usable);
+	if (tail_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, usable - spare);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, spare), -EDQUOT);
+
+	idm_release_chunk_locked(idm, usable_id, usable - spare);
+	idm_release_chunk_locked(idm, tail_id, tail);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
 }
 
 static void check_all(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
+	int id;
 
 	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm_total(idm); n++)
-		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++) {
+		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
+		KUNIT_EXPECT_GE(test, id, 0);
+		if (id < 0)
+			break;
+	}
+	if (n < idm_total(idm)) {
+		if (n)
+			idm_release_chunk_locked(idm, 0, n);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
 	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static void check_limits(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 10, 20));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), 10);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 20);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 30);
+}
+
+static void check_overlap(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
+static void check_overlap_alloc(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int usable_id, shareable_id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_release(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, total - 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int rest;
+	int usable_id, shareable_id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	rest = idm_total(idm) - pools_size;
+
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, pools_size);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, pools_size);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, rest), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_shared_range_blocking(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	int usable_id, shareable_range_id, shareable_overlap_id;
+	unsigned int shareable_start;
+	unsigned int nonoverlap_size;
+	unsigned int overlap_size;
+	unsigned int total;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	total = idm_total(idm);
+	shareable_start = idm_shareable_start(idm);
+	nonoverlap_size = total - pools_size;
+	overlap_size = pools_size - shareable_start;
+
+	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+
+	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
+							       overlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
+							       nonoverlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_usable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
+
+	mutex_lock(idm_mutex(idm));
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_GE(test, id, 0);
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 2);
+
+	idm_release_chunk_locked(idm, id, 2);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_shareable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 3);
+
+	idm_release_chunk_locked(idm, id, 3);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_mixed(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_usable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
+
+	mutex_lock(idm_mutex(idm));
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_shareable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_split_boundaries(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, 4);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	idm_release_chunk_locked(idm, usable_id, 4);
+	idm_release_chunk_locked(idm, shareable_id, 4);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_shareable_spare(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int shared_tail;
+	int id_tail, id_overlap, id_extra;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	shared_tail = idm_total(idm) - idm->usable;
+
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+	KUNIT_EXPECT_GT(test, shared_tail, 0);
+
+	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
+	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);
+	if (id_tail < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
+
+	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
+	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
+	if (id_overlap < 0) {
+		idm_release_chunk_locked(idm, id_tail, shared_tail);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	id_extra = xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1);
+	KUNIT_EXPECT_EQ(test, id_extra, shareable_start);
+	if (id_extra < 0) {
+		idm_release_chunk_locked(idm, id_tail, shared_tail);
+		idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable);
+
+	idm_release_chunk_locked(idm, id_tail, shared_tail);
+	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+	idm_release_chunk_locked(idm, id_extra, 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_shareable_spare_fragmented_tail(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int usable = GUC_ID_MAX - 50;
+	unsigned int shareable = 90;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int count = 39;
+	unsigned int spare = 10;
+	unsigned int i;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	KUNIT_EXPECT_EQ(test, overlap_size, 40);
+
+	bitmap_fill(idm->bitmap, idm_total(idm));
+	bitmap_set(idm->bitmap, 0, 1);
+	bitmap_clear(idm->bitmap, shareable_start + 1, overlap_size - 1);
+	for (i = idm->usable; i < idm_total(idm); i++) {
+		if ((i - idm->usable) % 5)
+			bitmap_clear(idm->bitmap, i, 1);
+	}
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, count, spare),
+			-EDQUOT);
+
+	bitmap_fill(idm->bitmap, idm_total(idm));
+	bitmap_clear(idm->bitmap, shareable_start, 30);
+	bitmap_clear(idm->bitmap, idm_total(idm) - 20, 20);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 30, 1),
+			-EDQUOT);
+
+	bitmap_zero(idm->bitmap, idm_total(idm));
+
+	mutex_unlock(idm_mutex(idm));
+}
+
 static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
@@ -109,6 +674,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
+	KUNIT_CASE(check_limits),
+	KUNIT_CASE(check_overlap),
+	KUNIT_CASE(check_overlap_alloc),
+	KUNIT_CASE(check_overlap_release),
+	KUNIT_CASE(check_overlap_partial_init),
+	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
+	KUNIT_CASE(check_used_usable),
+	KUNIT_CASE(check_used_shareable),
+	KUNIT_CASE(check_used_mixed),
+	KUNIT_CASE(check_release_usable_range),
+	KUNIT_CASE(check_release_shareable_range),
+	KUNIT_CASE(check_split_boundaries),
+	KUNIT_CASE(check_shareable_spare),
+	KUNIT_CASE(check_shareable_spare_fragmented_tail),
 	{}
 };
 
-- 
2.34.1

