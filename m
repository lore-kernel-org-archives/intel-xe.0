Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AFBC44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BA010EA05;
	Mon, 20 Jul 2026 17:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFMD1cdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2676310E9FC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784568853; x=1816104853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ghNRF73RUcf6i6DFGRiRePHc72Dt/1H8yIGT1uHTXM8=;
 b=eFMD1cdwUuoMP3Kbh/9pcDeaQINzZdrglzACNER3y+FTdhZTJjwnunq3
 RcQ94nf3zAnu/ViEg+iaNgPMK0galQQefsEoJp0/3ymvE2jHacz1uTVK/
 KZeN2I2wZbCOxZ7MmzoDns7QwIVJrG3+jYusZUmuGE2FdMiV+r07vle1l
 wvmzfOWQTH7jBdOSYpLScdVX99MBhXh5byCFoEHO9D8Pn8toY65TwPckn
 uu8aYmgmwjEoGJ9a3of8azWOK4gepbGxWKz6k/1AHoSzsFnpm42Uztybo
 Td/T3NgzF2OG0smg4XQxlX2YQT/sx51UgtAVpXgHn/m3GJNBvr25aROfZ g==;
X-CSE-ConnectionGUID: xYTdlQwiRWuZ7+xaKeFfMw==
X-CSE-MsgGUID: uUVZseRFQ22wzrLDE0qzAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85276163"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85276163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:13 -0700
X-CSE-ConnectionGUID: z6gGJA6pRUiun3gPgBwuZA==
X-CSE-MsgGUID: YFXn4DwBTZiCXgca1mP/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="254890299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 10:34:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+s7frE1cVPOs2GxjciLzILS5Pa5hxHoN7DFW1E2jsYwubPE1U7PULd6wvttSPrF5tMEaWyhsXNaylhw07nMZUVASNKB7UmiSwzJx/Vk/mA+kBYbyJIWLIwltD13ERhpzmKRG1SgteziwCcIJ56g30OIIbAdxRDRHodNCMHX7Zh3OCm48eCrtpHEQyqhaC4xX3A0vj4hu/P6bHFYEfexvsJlaS8WQHAcILb4Gx00z1XkoHyg9rlqUP2XtRDY9xORYT03uIsml6wkGRgOpFiMIg1RQKK5IVNNaNEzlol/3D+g0ZsAjeb3ytDkXjPDoRvHrqoBL3joSS9vv9CKpQoNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO4FM99hYz3lmLjz+0fhjiCkjrfhQdfHo5pgCjccYVM=;
 b=a4+GHVgT/enzvtN80mjq2688+6aa4BtTEQUN9t1mtOpTgR4rCoiJ58HnOkZzC2GoIKGjmka9nuvIwE0RsNWaBgsVXUbn1kyEYqard6mQtBhFZCNdyanI6B+PqCLpr+cC7U4z10gECTURORpQC2/b8a0GUV2pS8BfIskRhRU/vzKRxm4AQdqciVjxTZ+o5KuirFbY/tIMEZr2ZmkHfqAw1UR0E+ZaDLRKVu3sCd9OyHs4Ltx1LBODQ9jrbC2e5gy1haunnB2sb8zmkdFuBb4nHwmPyJpOp+XLzvfqi9Z0W+wCz99k73VrUZxswOIDJWDkfUlRbUJDDcI6Vx+pAp5Wrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:34:08 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:34:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Mon, 20 Jul 2026 19:32:43 +0200
Message-ID: <20260720173244.3935848-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
References: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0013.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b83ada-b062-48ea-81eb-08dee6851a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: yAxYFkLE/j+axC4rpXBlTzkrrLONm0bYoV8FZLI1I/nfpHCzGBZXw+jKXV0bqoMe25vonIGTOC4m1YB4Rbifi1NfQW4DPl4pUg+rIiSL9NYam8j1AA1knZFbpFDgAKKgOl/l5SHB67UojhtJrjsyZpW5bmZ3sQXVPWSC54LnAjPI7md00Jjwil45Cb6kluyFjKzKKKeteFpy7dcg1edvt+IufIvv8Z/31mQdZmwArQL3V7K5wsOxHQKLQhVeDZNUYm3h12YxCjBrBqN99j4dmKWfT7si9T4MypqC1II1cNe33DHGyCad1gP204p/36uHL8duLUrCx9IiajDCBvt/8DOKRSOFLEkorB8UerXT84apvGepIOrZuxufz97lmI+M1N0uT805OMJOtegQ9JJOJqfazG4gUN9fWgTeW0oFWOZYoJDTKhX+KM1Qs4Mdkk13GTifZoq1S4TT9QhuIzXVprLEAyuQpRLZMpGlxM7JYdXRnxHNDTmOwPWFbaEg92UItuZ1J8zlwQaOdlnyYhfpeAJ8uADSLBlWTTFCrvqxagvuPI5nIg2Nx864Tq0uAMC7GRpmlUjCEe/jsQXmWkL+xnYqSZUh7DcNQsPTsUgZxQeG2uc6USoaBsewIAIg9gGHGE2HuOJHT22Yq05hzmJgFv0I7Z5MUq+LzKztkM93C9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWlKT3dVRnFFUk92SWdFci84SkhNTlhOTW1UUXNLSWdnaWNDdWQ2b3QwbmIw?=
 =?utf-8?B?STZXMnM0SWpUUXRuajJUakdGYUJPQXJZa214OTBqdENCYkYxRksvZTU2cFE4?=
 =?utf-8?B?dnVVM1RQMlRock9UMGtSZnkxSWVoT0ozK3pNTC8wVEw2NzVVOHJabFJDM0VW?=
 =?utf-8?B?VjNuSngwSzZYMHQrZXhWQmkwMzVxQTF0aWRrUGR6VlNLT29YeTN2cDlRaVVZ?=
 =?utf-8?B?SG5zV1ZjQUpZcHB1OCtSNzV0M1hQaFpmTVp5OXpIYktYY0d5bTU5SVN0WHd4?=
 =?utf-8?B?UHNNWUw2ck9lYlhxZ1h5L25nZTRwRkhZR3czK2FvamErdHhhNVdJcnRKdjNT?=
 =?utf-8?B?RUJrWU5mWjJuT0IwMndraWZxeXdST29oYVdOdmNJdU9QZWVZY0E1cmNsNlFv?=
 =?utf-8?B?UEUxYzVkTUI2MkFDTjhaTmdadS9BZWNaL0VUZXd4N0RUYm5BKzFkb1JaSzFq?=
 =?utf-8?B?V0FORjR0YUVtK3ltTE1VOTJ2SVpRL2xtaWp1V0czOGtEczdETEd1aDUyOTFi?=
 =?utf-8?B?Yi9UZGd4VnVyZ1d0c1BtWDVJZjRzYk1WZE1paFM0N2pvcENMVW8vQVJrUERB?=
 =?utf-8?B?QjcxL2tHVkJlZlhIT1BkcnJCYlJJWFdjblhoQTRkMm15Z3UzOUgxL2M0MFhv?=
 =?utf-8?B?V3VqL21vVGI5ay9tOC9uTDNSOG43OWk1dSt1d1ByV29lTWJrSW91cjA4UERL?=
 =?utf-8?B?UW5ycVlxSTJNSlpEYzJNRTdKM09XQkRwZU1TQWdpcEczNHlNS3lhSlpOWndV?=
 =?utf-8?B?ZkJyNFBOd0M0N2xKOGRrcEZuYkk1QTd4Q0pKYmp2NkRMczE2L3pLOU5XdTR3?=
 =?utf-8?B?Wk5jUVBySENJWEFxNzZHUHJYb1dKVFErRmpBaVcyUWlpU1UvZ3BPRUxIQVlu?=
 =?utf-8?B?bTVkcUNuNE1MbUJvaVlHRmNhb1hJckEyOXlVU3hkSy91MnRBSkpyZ05vZzhC?=
 =?utf-8?B?NExsMWMydHlmbG82cE8xN01xaDNoK1Nua0VZRjVXMkFtYUtqNCtZamI1YlM1?=
 =?utf-8?B?Mk0wSk9KaGlFUCtmWmhXVkFsSzB1ZU1UQ1hPMW9wUURObFlKRk5jOUMvaE0x?=
 =?utf-8?B?Q09RSSttWExCVmI5ZzhNNVM1eWJhdE04NS8xU3RadGkvNnh6NUt3KzdRN1VM?=
 =?utf-8?B?WlduV1pVdkFNcWkydlgzSVVxN3JXMGQ2ZUlyekZNazJEQ05uMGdmYllBR0lT?=
 =?utf-8?B?bm9qNDE3QUV5c2dJRSs3RENWT0ZTZkFIZ3pEbFI1b1BVeDRueitDbndMVi9K?=
 =?utf-8?B?Nkx5Z2tTMGNkTXc4aVVMa1pOQ2VJQVJwa3VldjFBT1ZaNy9TczdQY2lrdStu?=
 =?utf-8?B?eDVvbXJiV245M2hBVFMvUjdEOXFkQXJQUStMbDZNMUp1NkV2YmxMdTIxT3c5?=
 =?utf-8?B?NlNpb3NxalZJLzZHcFREVkpKdUpaeGVrT000K0tkQ2FQV3J4L2VTOVVxSW1F?=
 =?utf-8?B?em9wdWdHNjQyemtHVDBCZU5LaTJxOTRIM2MwdmtlMldXbkliL0Z6bnhaV0dT?=
 =?utf-8?B?dHlOcHNWUTJ5ZnBDcnVNeHREVlRKNWFuM0s1QklKQlVmb1JuRmk1cFVqT01k?=
 =?utf-8?B?b1hnSFFyWlJVU1BiL2JEeDI4dDNicjh2cWk0bk85UUZYalFlRkVPT0Y2dVlQ?=
 =?utf-8?B?S2hEczV1NUpMU0NFY3FDcGNVZFVSMTVOVW1GcW9zWlVjckd4aTIzdVNPczZX?=
 =?utf-8?B?UFJOeWx2TWpoZXBZNURPWjV1bVJ2SkZkTlY1Z281dlhWWlNJYW1TS3JtT0Rl?=
 =?utf-8?B?aTYyTmREbEc5Nm13VjdaKzhIV2RIZ0NPaTFuQ25SYzhEYm10OWxZa0pWdFlB?=
 =?utf-8?B?S3dkbFB3cGtLRC9IV1dwRTNOZ2RaL1NPWVYrS2VVZTgvTzR5UWZNSmJkVjdi?=
 =?utf-8?B?NnljYWlyOTZsc0FPbnZyMVJSdC9zNVByd0JFYTYrQkc2Sm10VUdNS0ZSU0NF?=
 =?utf-8?B?SVdQbTcvZVJBbjJ2dWtVRng2YjFxQmZQZ0lSZVpTSlFKZGlwLzlCMDExTVVH?=
 =?utf-8?B?c3FWeUc2VDM3WTZjYk5jZXJWZjdLWHNkcnZla1M3SlBLQWJoZ01uZFVyMmNW?=
 =?utf-8?B?bjgybG5jQTVScnMySlJObE5mM3g2ZzJpK1ViTnB5RXNJeXFiYTlRa210RXUv?=
 =?utf-8?B?NnRmRkVkOFkvUlVGV3I2NXhuYkQ1M1FidnJjUFNhUWpXTGtjdXQ3WDIvdWtu?=
 =?utf-8?B?Y2w2bWJCc3A1UTBCcDNxckJjbUlJUSszRmc3bFBtNXlsY0tCOUdrN2FNbkQx?=
 =?utf-8?B?bVFsb1V6TThUUWJNVGhIc09vUE1BbmNuU2Q3cWVBbHUzT2cwUDE3NXhydTNK?=
 =?utf-8?B?R29nQnVHUWRsUWlYVmV4M0FCd2swN2xUWStHNW1iU2kzbzk3bHNJQkVlYmNS?=
 =?utf-8?Q?Bub2WSb1LIB1z8NU=3D?=
X-Exchange-RoutingPolicyChecked: LV/hSmiYoDMVxC7VtW9PQZMonUp/8/mlz0lUE6LneK/rMC1v6WXTjxkHNM7+AVvjBpzlWVbJyGRXhZciwXoBAuw9FZmwGfkKpGqvkRDEYdiY0JPTpSZ6/cGOh1CWC58a43BTeBZ+17JsrVXtE85ikz1xw82aKrFIH4pGYg5dwqhLN8BFgatRbgwL95zCoudh+O9Z/iSAumGNE07XMTpi0Wr74Iub5XUPyt3CXNoEA3YJ1u67SSolHvi3SWTKjCpwGYIQ5UkGFo1cKGAqgbWWpqljEHC4VOkDuUP6vCSl8zz/OvhRoVdFewlBYbI2snbjkRp6LUufWLIGIo2tzCg42A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b83ada-b062-48ea-81eb-08dee6851a2c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:34:08.1088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzI9ygyVxiLA2cdhCKfjl7Y+TNA+P95MCc4ckpbBJkU3QVIO1zTxZaSLfoNbz6TUI2lSsvrG75vJLVOiUoG7UDbNX9MWpoVATLU3lpKm0L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

Switch GuC submission to explicitly allocate IDs from the usable
ID pool.
Also lets configure the GuC ID manager according to the device operating
mode during submission initialization. Use dedicated initialization
paths for native, PF and VF modes to expose the appropriate usable and
shareable GuC ID ranges.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 104 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            |  73 +++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  14 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 6 files changed, 177 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 056e4fd8f1ab..88e656d4e462 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
 
 static int guc_id_mgr_test_init(struct kunit *test)
 {
@@ -20,6 +21,28 @@ static int guc_id_mgr_test_init(struct kunit *test)
 	return 0;
 }
 
+#ifdef CONFIG_PCI_IOV
+static int guc_id_mgr_pf_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	struct xe_guc_id_mgr *idm;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(test->priv));
+
+	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	mutex_init(idm_mutex(idm));
+	test->priv = idm;
+
+	return 0;
+}
+#endif
+
 static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -33,7 +56,7 @@ static void no_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 
 	mutex_lock(idm_mutex(idm));
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
 
 	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
@@ -51,6 +74,59 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void check_init_native(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 1), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
+static void check_init_small(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int count = 8;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int usable_id, shareable_id;
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+
+	usable_id = xe_guc_id_mgr_reserve_usable(idm, 1);
+	KUNIT_ASSERT_GE(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable(idm, 1, 0);
+	KUNIT_ASSERT_GE(test, shareable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, usable_id, 1), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable(idm, shareable_id, 1), 0);
+}
+#endif
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -63,7 +139,7 @@ static void check_used(struct kunit *test)
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
 		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
 		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n + 1);
 	}
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
@@ -97,7 +173,6 @@ static void check_quota(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
 	idm_release_chunk_locked(idm, 0, idm_total(idm));
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
-
 	mutex_unlock(idm_mutex(idm));
 }
 
@@ -111,7 +186,7 @@ static void check_all(struct kunit *test)
 	mutex_lock(idm_mutex(idm));
 
 	for (n = 0; n < idm_total(idm); n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
 	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
@@ -493,6 +568,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_native),
+	KUNIT_CASE(check_init_small),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE(check_limits),
@@ -520,4 +597,23 @@ static struct kunit_suite guc_id_mgr_suite = {
 	.exit = NULL,
 };
 
+#ifdef CONFIG_PCI_IOV
+static struct kunit_case guc_id_mgr_pf_test_cases[] = {
+	KUNIT_CASE(check_init_shared),
+	{}
+};
+
+static struct kunit_suite guc_id_mgr_pf_suite = {
+	.name = "guc_idm_pf",
+	.test_cases = guc_id_mgr_pf_test_cases,
+
+	.init = guc_id_mgr_pf_test_init,
+	.exit = NULL,
+};
+#endif
+
+#ifdef CONFIG_PCI_IOV
+kunit_test_suites(&guc_id_mgr_suite, &guc_id_mgr_pf_suite);
+#else
 kunit_test_suites(&guc_id_mgr_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4286bd05c686..14b12bcfaf54 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -852,7 +852,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -896,7 +896,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 7e3e85225839..53c83d2b1f66 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -131,29 +131,63 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
+ * Can only be called when the device is not in SR-IOV mode.
  *
  * Only VF drivers will have to provide explicit number of context IDs
  * that they can use.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
 {
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
-		return -EINVAL;
 
-	return idm_init(idm, limit, IS_SRIOV_PF(idm_to_xe(idm)) ? limit : 0);
+	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, 0);
+}
+
+/**
+ * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
+ * @idm: the &xe_guc_id_mgr to initialize
+ * @count: the number of usable GuC context IDs
+ *
+ * This function initializes the GuC ID manager to manage a small number of
+ * GuC context IDs (0..count-1) for use by the GuC submission code.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_init(idm, count, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
+ * @idm: the &xe_guc_id_mgr to initialize
+ *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
 }
+#endif /* CONFIG_PCI_IOV */
 
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
@@ -368,21 +402,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
-/**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
- * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
- *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
- *
- * Return: ID of allocated GuC context or a negative error code on failure.
- */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
 /**
  * xe_guc_id_mgr_release_locked() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index b2b4c1212a8c..f7ab753070da 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
+#else
+static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
 unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
@@ -20,7 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
 int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..f0c13f5c0d48 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -282,20 +282,26 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static int guc_id_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_shared(&guc->submission_state.idm);
+	else if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_small(&guc->submission_state.idm,
+						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	else
+		return xe_guc_id_mgr_init(&guc->submission_state.idm);
+}
+
 /**
  * xe_guc_submit_init() - Initialize GuC submission.
  * @guc: the &xe_guc to initialize
- * @num_ids: number of GuC context IDs to use
- *
- * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
- * GuC context IDs supported by the GuC firmware should be used for submission.
  *
- * Only VF drivers will have to provide explicit number of GuC context IDs
- * that they can use for submission.
+ * This function initializes the GuC submission state.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
+int xe_guc_submit_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -305,7 +311,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = guc_id_mgr_init(guc);
 	if (err)
 		return err;
 
@@ -411,8 +417,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	int ret, i;
 
 	mutex_lock(&guc->submission_state.lock);
-	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
-					   q->width);
+	ret = xe_guc_id_mgr_reserve_usable_locked(&guc->submission_state.idm, q->width);
 	mutex_unlock(&guc->submission_state.lock);
 	if (ret < 0)
 		return ret;
@@ -3040,7 +3045,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_max_usable(&guc->submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index ccade320dc69..07682f174aa8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -12,7 +12,7 @@ struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
 
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_init(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
-- 
2.34.1

