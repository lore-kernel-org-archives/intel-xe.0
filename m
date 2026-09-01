Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F004C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 16:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0BA10EDA7;
	Tue,  1 Sep 2026 16:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCOK1zZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F0910ED99
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788281104; x=1819817104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j8iNsn2XR+TghJQM/sJnjlzuqbybL6qDYO+x+3piZ1g=;
 b=HCOK1zZszWxwSEwu62+P+W8iJbBF1IenWhovRneoSPboAYBq32ROq8/b
 po1G82TPh4EAvm9cXQAw4iCgHAiVCerqSg0YQCe8n/UtqCwcCrlPAPlS7
 b8z6mmBMxC/SmJyfBEDiVN7XaeRSsicg0ZQxxOTwuSprMgXJAkdIGaNJ9
 u5rRUAyghQtGJc6BCBcYzyDwXahUbUjA2Obgn1yYyUsLf+U8sw2PrPYsj
 sZ0qAZw4chWSCxb9TmUolnMrGcWTZOyDtl2Kze4obwS9+IX9pBfyNQ//n
 hiO02GeOw3G8iJ5VHvBpIikHaqy1wLgr+Db0H4Sbc+QBtCo0DjhLlixR9 Q==;
X-CSE-ConnectionGUID: J4TF4r9nSK+6mEPDFAW0sQ==
X-CSE-MsgGUID: 71eBjP6KRaiCxoPxcQ8W8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99881803"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99881803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:44:59 -0700
X-CSE-ConnectionGUID: RG1h1NrNRI2nuJKSgbAnqQ==
X-CSE-MsgGUID: yWAC7OZyQqKcYDCmZNFn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="266557026"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:44:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:44:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 09:44:55 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xkihyg1/EhluPY4nKvuNbIlGZ3F45xfOaQ+FTD7qOWRjMnKKCuoL1V2ScPIa5ykAdHpLedwDW/BwLepyGqYZ9HpeqYz7S1aJCdFEgG5+g76TGmDHjy71Nh2U01VyQzyXrE0TLeQohScLvjvVD1Q7LbOfu6uE4xjoe0YCPyQHCo9MyRCAHP7AGIRC1VVRqWzxySbkEyxfy5swFI9RGsYeEcEi6aYNiCT+p09Ywg8tcxZogyttfKeMP6JPWvKGjexo5TEf9tfEhHKSIOIhfFg4WrMcQqQpDJN5tal4TMAXp0pIg7rd4FAJUz2TfulM0fGyd+CJ4MdQ+S+Z8blGrKQDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALdOu3c2UllzOWnVO75TQ0+PKYBJELm5tNWmEd2cT1g=;
 b=bBHXoqZc+tGQxfLG6r7hZVz+VUoHQAghqJVZXhawe2fVf6aSQ47ImnX5dTIUkLssnc3IJLaUVgKpgGEp2vBKTV5z2VJ5iA3YYbLb4uHl/vFfVlW4yO6xwShmpaEcVqvRJZr5tpkQR+8Mzsxvb3LCeaEA2fGsBWS7scQPt02RAv0gomzsQ0VLZlQeLEn9q6c4545nHxtySYjqAG+HqEKMXVx2CksGBQZspGsv/wak6zEKJsjgrT6pNUAzziPEozky0iSx7bWNecLkm9WBMaKRvp/DBNOPLnrtAxPsanRtW/D0aQvOykOrGR+oN/AUpotjprBDmnMHo00zy6CCaSVtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 16:44:47 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 16:44:47 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 1/3] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Tue, 1 Sep 2026 18:44:33 +0200
Message-ID: <20260901164435.1395260-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:10:232::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 479044a4-ddf9-4353-b48a-08df08485572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +UaElPOzFsH1oAI6Zjj9cx3w/SyOmMzRFgXYhXZ1hgDkNghZpiBG2e7qD0t08XRiZtyu1xm3kEL1tMVOWumunxcNJfwYjVbdYBldd1u5iuRaU5MMIFB+KL+sl8DZ8L/fb6M38dPjMAGW91Ck9l17VNVjwJkygoWnoS/Ur8SJxEC5cmBQbD5OL3+AQiN+MWsCrzrVDdMYrYw4/tjIBW2wS7cwCZiyUkdfKLU2Wc6qUiroI5hMUBIMzc4MDr4UewdjfPjoc+UJGXs3vayrCfyxok1Gegy6MGsj6P52sy2dcgeNBzBqtze2r0Knz5K9iAf7KEMiEm/Xsb8HilyKHBDfAZhZ3azjsfRwh0hBZqO7yoS8yv3zE3i7CIjy3PaEK1bD0GEevcy9rCRT27JCwr59u5OUR2dYIjMBdfSgw5I1/z/iDmmd8+k6L3DcKZ9u8/zmRY/o5SbWwIuwOHbya//5zKI601ksq26x45mycwZH0e/wYOcojCoJSB4RxLBBKirar4LFpdt273EMf9JnJSgcXEf8K/u9ngyi8EvVLk3UDRg2l0s5bNtxNtHix8S5KOporYWgIkAPq/44IAjz8VLgc0KCh0U6mt5O6h0u4xa4ouG2fgnsHJL1TwS0jBSx36lObXj5kiYJRvZnCJEvx7C45DLnjWyeUJmRsboqTClpAaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmI2WUxvREtSeTh6UUpqa1FCZ25xYy9xY1pBL0dKUHhiVkYyUkNFM0hlS3NJ?=
 =?utf-8?B?R0FyYmhIUGNLdkVNdlhTSTFqNWZPZm56RzMyTTd6cGgvNitwbEMyTFJvdWVx?=
 =?utf-8?B?Q3F1TERvZnRLTjVIWjlLbTl0RENaQmNhYjZ0UDc4RnhrcUpTTEcyaHVXRWl2?=
 =?utf-8?B?MjJxWGQ1ODNESjIwYmcvdU8veVFPeXZKUnBNNjRnSG8yM1NGZDRHR0hhN3Uy?=
 =?utf-8?B?VmZtSkM1ZjNSSnNGelhFUGdYRCtza3BoTUgyRllCSmNEdk1xOTErdVNEZGJ1?=
 =?utf-8?B?VVRJcEN3TnhSSVJCSEJaRmx1SC9veldzTjhqSGcySHlwRWNaallUZkhpYi9Z?=
 =?utf-8?B?UXJ1WEdlK2p2alA2UVRnVklKTVROV2xhUTJKMy9oMGNncnc3bTd1NmthL0tZ?=
 =?utf-8?B?QmdjOWllaXN4OU8rYnRFMnZRRXFuVTNHdFhLZ1ZHeTk3V0VjS3c4VlJodGtq?=
 =?utf-8?B?V1VNcU5pZjJrN1pLMjlRdFR1Vjd0QWQ1YVhMcWVRSUZvVFYrbHJ0NWVzV1FM?=
 =?utf-8?B?Vkl4dlB1VjNIMjJlM3NONTExUXhtTzltNCtTckUxb0V2eUloOExKMS9JZksv?=
 =?utf-8?B?VkFvNVg4TU8rdnJVVFV6b3dGd2ZPODFkdnpvNGRIa0kraGY1MDY5VzBCZndD?=
 =?utf-8?B?blh2dUdYZmZtYTkzMlVGK1FLaXBjdFJzRTkzOXhEVm44d3BXN0tnRm1xZmVz?=
 =?utf-8?B?SXNwSGczT002S2c3eTNKWjJqSXJEU0lYYitXeEN5TXp6ZmtSaGlxNVltS1dF?=
 =?utf-8?B?YWdscWt2WG1uMjdJN1U3cnVJRFJLNFhRblNsMVR3dHpYWnQ1MThWeS84azd1?=
 =?utf-8?B?eU1zQ1ZQd2hUUms0aFlkcFJFQ3N3aGlDSUNkVGRyNzRxNUVDUWJGZ0wvSGdU?=
 =?utf-8?B?dTRXOUtiWE15ZmFEU01UcnpRWjltOTRvWkxLOFExWFRwdDNDWGcxendEenEr?=
 =?utf-8?B?YnBVMVRPK3dnZTlQZVBZL0t5K1NkamNWYWVMOHdwZjdsWFltdjE1KzlqVUxL?=
 =?utf-8?B?Zm9icEpBZ1VrRkNqN3J1eHpOY1VSVU03MTZqY25iL3RLSGkzTzZ3dlRNYVlu?=
 =?utf-8?B?MG5GRDNXYit0alFnTUQzQ3FKMUozbDI4anFPVjY2Z3ZmNndmb1JFcmZUYi85?=
 =?utf-8?B?SWZFMkxudkNiMzliZnN1emNWd0pVczJObmhnaXp3VWEzbXBoa1laUlorQWpq?=
 =?utf-8?B?WCtmRHpNOFIxd3k2M1EyR2pCcjRBRGQzS2x0cnVkcWNzVG1iVzJ4akJPdDhO?=
 =?utf-8?B?cFBMVkVmcGxVZ0ZPc1FkVksxZVVTZXdFRkJjVW9NazludEw3Tk5TaDNNZE9T?=
 =?utf-8?B?cDdQOEp2ejUyQWZIcTBrZ2ppemVWM2VJb2xVRlNlbFFHK1NXSm4vcFE0UVc3?=
 =?utf-8?B?VW9SQ3E0TjNLdWdma25jS3U2N2k4YWNhMFVvUzV1c3dRUWV0aFBRMkxUaWVr?=
 =?utf-8?B?UzZUS2RCRVZsRnRNdVVoclA0MDIvZXFhWlIrOFZSakllUGdrUks2N0kvWXNH?=
 =?utf-8?B?Rmg5VWsvT3YzTDhLMzNtVU1WMmU5elNydEtoYzM0eElRNzF6WjNObnhJQ1RK?=
 =?utf-8?B?QW9YWEFxN2habVR6NE0weHBiS0RqWWhsL3U1WjFzNjdJQjhQdUZGTEdKL3Vt?=
 =?utf-8?B?TFNYWUZzMW9MZ0JFMUhaQmI4ZGtYYlJSV2VLMVBIZ2YvS1NkMUx5NU90SnNY?=
 =?utf-8?B?ckxyMGdNcDMzKzBjc2syUGdWV1pzNHFMYzQ4SXZVSzRSYXgwZmYzNzlzb0d6?=
 =?utf-8?B?UUxBd1o3YVZzQ1hkQVA4RGw2TUpncHljVTdTQjYySEJjbGV4ZkpyejZmUkRm?=
 =?utf-8?B?MUx3ODBlczIxUDc5Zlh6UU9Zd0lDWDAwM3NyVXJuZjFML0pmV2swQVI5aisw?=
 =?utf-8?B?d2F3eUtESm5HSG5UdzRIemtSb29WWEhsWmRwQ010eFQ3eHd0eTVaNnBxMCtS?=
 =?utf-8?B?NUZVenFEaVdrWEtORXRPSFpZbEJHNDFZM0ZOTmgxS3cvbERnZUVLcnBOV0c3?=
 =?utf-8?B?aTgwTjZWRVlhaWY5QnlPR2ZvMnNOd1VNditVVFUvd0tka1hLKy82WFZmSFFG?=
 =?utf-8?B?L0JCSTRKdGkyRjlKbDFQcm1ic21XZjYwN01qbWNYMDJ5aVY1WEdpbmhqNXdR?=
 =?utf-8?B?UTJBSSt3ak51eEs1eXUxYW1rbThuVE8zd2VSOVhvbUFrZlY0WENueThjaGhl?=
 =?utf-8?B?b01xZVdHWEhjbUgyQUdhZUNYbmJnS2FxZUlTZ1pCUUlLcEVLN3R0dHhUeHhm?=
 =?utf-8?B?TEFSeXZhbi81YWZ5aW9ZTVBYUzV5WG13L3hmODVTOHpQWENHVkEzdm5lUFg5?=
 =?utf-8?B?TzIwWUUreFZ4NlMzYUxkQXFVejRZZDF6UHFYNGJGcGh4dTdQUGRyUlJLZFYz?=
 =?utf-8?Q?boMpNOn+zNvPHxng=3D?=
X-Exchange-RoutingPolicyChecked: 4zZB1qb8d/mDUORJIvYo1bcdIm/5lQ3X6bNVJUhecuoTKakbgglFvbUs4//ZUOxDnbVljwXYpNQ4/R07Xi8ErzNvOhIkLV0PZsMovOBWfL7k2moeZSWGPKqs2e0SH1RklIbDM+P3YAzEpKpC++TStn0qCNnM8W5IO8FFPxqSScHlLiwpMFecbVdcKMw6gL5Ln41wIEw9aAnHWQg7ztPqgePEkMyqYPGUUjCMAQet+QuC+H5Q3dASRuhvQ71z758mA4YcrF9HXA8ksvBEn37hOKugmsP3nmNiT3DiZ/hVfQETuszey9ADr/ho9NE0sT4jqfdzvBh3q1vCB+tu+87BKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 479044a4-ddf9-4353-b48a-08df08485572
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:44:47.5873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xTyZBPpy5Q2YycLYJNPmpvaoqtDjIJ936syz2PaW/DByACFpC0QNpNPH+NE7MJF1vBHjDbOF+m+7BMWuoyjPJ1XwubsrEDpJ/jsS2cZTMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools, together
with shareable hole-reporting helpers used by SR-IOV PF provisioning.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.
v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 184 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 3 files changed, 176 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 63e8bf193605..1f0bd876cb35 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -114,8 +114,10 @@ struct xe_ggtt {
 	struct xe_tile *tile;
 	/** @start: Start offset of GGTT */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @size: Size of the usable allocation range */
 	u64 size;
+	/** @hw_size: Size of the GGTT range assigned to device */
+	u64 hw_size;
 	/**
 	 * @flags: Flags for this GGTT.
 	 * Acceptable flags:
@@ -142,6 +144,15 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable: Shareable range within GGTT */
+	struct {
+		/** @start: Shareable range start relative to @mm start */
+		u64 start;
+		/** @size: Shareable range size */
+		u64 size;
+	} shareable;
+#endif
 };
 
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
@@ -239,7 +250,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -253,7 +264,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -355,16 +366,31 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+				 u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, usable_size);
+	xe_gt_assert(gt, usable_size <= ggtt->hw_size);
+	xe_gt_assert(gt, shareable_size <= ggtt->hw_size);
+
 	ggtt->start = start;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size) {
+		ggtt->shareable.start = ggtt->hw_size - shareable_size;
+		ggtt->shareable.size = shareable_size;
+	}
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt->hw_size = size;
+	__xe_ggtt_init_early(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -427,6 +453,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
 		ggtt_size = GUC_GGTT_TOP - ggtt_start;
 
+	ggtt->hw_size = ggtt_size;
+
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -439,7 +467,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size,
+			     IS_SRIOV_PF(xe) ? ggtt_size : 0);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -652,16 +681,55 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable.size == 0);
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
+	if (range_end > ggtt->hw_size)
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
+ * to leave space at the top; otherwise they start from the top.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
+{
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable.size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_HIGH;
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
@@ -683,7 +751,7 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an error on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -695,8 +763,46 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
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
+ * xe_ggtt_insert_node_shareable - Insert a &xe_ggtt_node into shareable range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Inserts a node into the shareable GGTT range.
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an error on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable.size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt->shareable.start,
+					       ggtt->shareable.size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -704,6 +810,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -787,6 +894,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -807,7 +915,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -874,10 +982,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
-	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
+	end = min(end, ggtt->size);
+
+	if (end < start + xe_bo_size(bo)) {
+		ggtt_node_fini(bo->ggtt_node[tile_id]);
+		bo->ggtt_node[tile_id] = NULL;
+		mutex_unlock(&ggtt->lock);
+		err = -ENOSPC;
+		goto out;
+	}
 
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+					  xe_bo_size(bo), alignment, 0, start, end,
+					  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
@@ -948,24 +1065,30 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_largest_hole - Largest GGTT hole
+ * xe_ggtt_largest_shareable_hole - Largest hole within the shareable range
  * @ggtt: the &xe_ggtt that will be inspected
  * @alignment: minimum alignment
  * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
  *
- * Return: size of the largest continuous GGTT region
+ * Only holes within the shareable range are considered.
+ *
+ * Return: size of the largest continuous shareable GGTT region
  */
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 max_hole = 0;
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -981,7 +1104,6 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 	return max_hole;
 }
 
-#ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
 	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
@@ -1120,27 +1242,32 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	return err;
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_print_holes - Print holes
+ * xe_ggtt_print_shareable_holes - Print holes within the shareable range
  * @ggtt: the &xe_ggtt to be inspected
  * @alignment: min alignment
  * @p: the &drm_printer
  *
- * Print GGTT ranges that are available and return total size available.
+ * Print GGTT ranges that are available within the shareable range and return
+ * total size available.
  *
- * Return: Total available size.
+ * Return: Total available shareable size.
  */
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -1157,6 +1284,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+#endif
 
 /**
  * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a69..c441e39fdd47 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#else
+static inline struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
@@ -36,12 +46,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *e
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
 int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..a5f4a3d27c3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -531,9 +531,13 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_insert_node(ggtt, size, alignment);
-	if (IS_ERR(node))
+	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
+	if (IS_ERR(node)) {
+		xe_gt_sriov_dbg_verbose(gt,
+					"VF%u GGTT provisioning failed: no shareable range\n",
+					vfid);
 		return PTR_ERR(node);
+	}
 
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
@@ -729,7 +733,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
 	u64 spare = pf_get_spare_ggtt(gt);
 	u64 max_hole;
 
-	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
+	max_hole = xe_ggtt_largest_shareable_hole(ggtt, alignment, &spare);
 
 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
 				max_hole / SZ_1K, spare / SZ_1K);
@@ -3549,7 +3553,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
-	total = xe_ggtt_print_holes(ggtt, alignment, p);
+	total = xe_ggtt_print_shareable_holes(ggtt, alignment, p);
 
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-- 
2.34.1

