Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB6DCD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8290710E104;
	Fri, 19 Jun 2026 19:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkI1muqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680B310E104
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896329; x=1813432329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lyVaGSMUd0HbYYBrHl8JCSrKv2polr2voMRImxH/HSI=;
 b=VkI1muqrjgEYQuoWfROFuqM1QP05NzSjT+e7ZShFTE35TYXwbT+QZuD6
 RlhWmEYwCO8noMsscWrreI3BtJP0zm+23VPSchDIAV2Y/tbQdgnEi5pF8
 wFq9guKmhnrOWGD5Mc+IG0lCEb/TpL1WtJBhxU9S4zkDhMVRhyk2tPeo2
 Fhlkj38cuNUHdKXlCPAjkXe+70R2Wiz4i1nVCVxv9cPsC9q/x99jTj1j9
 dIguNzrkaBDhc/ylIApTKsYEcjFOB+rPUvv23pvgo/1fEzlVvXTrx5Bif
 UQ6EaK3JQH0JTIo6aS+XCYsrWPHGz847YB3sTz5bBsTF3YZ2WUGI6jVHY Q==;
X-CSE-ConnectionGUID: rDlfpkm/S+KXFEeS2r/TRQ==
X-CSE-MsgGUID: kIm5cZl0QNKfxx2oCJmeVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82744031"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82744031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:09 -0700
X-CSE-ConnectionGUID: TBsssJIrTHmjJXs+UsmGGg==
X-CSE-MsgGUID: 3eks8JxTS5OwYbOZMVs7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247553296"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:12:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7GYdQKzk+18QKU83URv+CHVhgLDMiB4H41QLKCpltx4yt6vPSxMlCDhF18COVIJnxTnKeBo/J3PWDcMj57ttrIszFmdbGxxPIT0rcnV/Wy6Ca1iaDNR6G5rSGy7UhhA5YveJuBh28bSHNN9VzWtkWcYetoyyH58Uf3gy9W9D8KVEfolsmXPAM0YkDXqygoYoBAbKmTUx5SQrYEeVDyTyGLF8Ae5dGeDqN2chhqZvE1XPNIkQcBJSkrnbjelbgtTJDUzQ18eJPNkhakgt5G5JinKSFq3j0t6j0rGb53PmPDA9MDtqUHtp31FFCRiXm4DiK4bOaqBYc9gmmJaq8Rh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCloCLwRA9taEJ3V0VwqYrfQ4/GD2TkXRBnFAplX+V0=;
 b=ilMb54jHA0hS40ZJ1twBAFr9JRrnOUBHk0Zj/c8WXteVs2ftMtO8XO/wNudCERpkms7XicoWwj2TtLWuczmRWjFLKWR3VCeYKjoZ8DrpErellyTn0KyWmLs797XK8Xxr6fWdfEEZgzrhTbpoHtZQStPYbBbR6X3Wp1K9UXI6K06FUxFt8VTLTuYaWqQWLoWxwgPswZdQZq1q7QZGVT5qRbr07TNfEHNmp7vPyqg7aIdnOPKGfJs2Gieb03id8I7DnOoBSlqR6vaj6isY/mYTUUF65PjTr+EUk/XUrXMeQcIpTNFsDYkDwp9K6v3CboXkz0ifunu6KNVfHLg4jbwQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:12:03 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:12:03 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 4/7] drm/xe/guc: Decouple the GuC DB manager from the
 submission state
Date: Fri, 19 Jun 2026 21:11:04 +0200
Message-ID: <20260619191107.2628783-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0033.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::29) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 80326d2c-5c24-4a01-4d6f-08dece36a528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +Ki1TsluoLv3Qo/18tNhe8tiUiMoVRgo/WgXEi9hd4MfBImZyxszI/akBds1puZ2eLm7a6D8mhn1t1MmCLSvkW5wmnEt4up7IZNVyvTfgHrzxAwK6wslCS9PerB7M6Q8Pc7VY3sJ+CeugAHSvpnxG7rzFSdix3tARjfdZecR3t6sT/CrPpyrGV3o7yUzkNTMNEQZTD1oOOUthFIacIbaolrSIccuES7OXHfOgD4WnJ557ybyzM4TgaSWgWAkCoEC09hqAjRKYAUiQ6VH/NUbmJDwAEIbH8fF3dI5tbPa5458WIxFTmBA40KeUCSvR0NBgWKFQk7W3ZgnrEc3kb7Tm9C9rP+svCWdc/CYNRMYdVWwdQdy3ieT691Mdyw8/b7inNyEe3Xk86eKI8uhehq7bzAIzLkOSMkVos9UongGC1zdCEPqKvg6CdRcDU85C/TsL7aSvmOqFJKQVtKKfRRZc1Z2FZ9RpVfAurfVD8lzrYf0WiNNr+GwvUY6CeG6gRR93KcBYv/tIon8L+9y52pNE9Y+8N5E0giRyfrZr3nIHYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVM4eUJmT0pwM2UrdGpSNEx5dktJaEpMOGp5cUdwY2NUNExPYWNMeWE3QnI5?=
 =?utf-8?B?WFhVbXhYaXphbUlBNDRMMGVMMTVIMDhqRTN1UDZPQ00rL2JDWHV6RmpzbSt5?=
 =?utf-8?B?RVk1WGR3M0ZEWEZWeTZZa0h1dVhuTUlOakJOc0hCRFg0QWZRb1ZkWmsrU3Ux?=
 =?utf-8?B?Y2VHMDdYMWwzdUxla0pzSjVTNC80WDIxemYvUVhNTS9UL3N3M0NWR3dsRlBH?=
 =?utf-8?B?MnRiRDlRWFNITUgzcGR1L3FPb3R2RTh6SHYxaHBJSS9rVVlpL3psZmczQmZv?=
 =?utf-8?B?YkNzcUFFR1RwbDlKcWxGWWpMcERxczgzSytPRkxoZXlTUk9IbmZLYTNWNGl0?=
 =?utf-8?B?Q2s5d2tsanZ0bTZneXBNcm9Tcllvc0FLUUdOQXR4MGFZMzc5aWFVSE5kWmpL?=
 =?utf-8?B?bGJLRnlGMDdxT2h2MnZkZkFRSDArbkp3MXhXREtpVWJVZDNvTzJNSUdPU3cy?=
 =?utf-8?B?SHd4MFFrRVF5MHZLTzJFcjdtTWZ2b09OQ01qQXF0VTFtSnpBR1BWaDNqOEh2?=
 =?utf-8?B?a2lhcmoxUlZUMmFKaENMaC8ydmd0M3lMemlyNi9SRGUyWTkvNnJuS2FTZFJY?=
 =?utf-8?B?cWtkNGIxYXN1MU5GVTdlYnMyeXZ1YVlkV2hwOHdydEQweTd1QjhackwwV2hI?=
 =?utf-8?B?L2VrYWdjQm91UFphalZiT0lXa3FoWmRvZDh5SmJxTmdVbEVsMVZJM0RjYjg3?=
 =?utf-8?B?YXM5STBnaTJJT1dmSnFmVEhwbGdoVUFFTXcxY2N0RTVYK1FuczdQRWZnbXdX?=
 =?utf-8?B?UXJ2MmxVMGd2RHByN2hVZjB1L0dRRUk3QVdKclhYT2NXMkVsK05ZMEF1eWxL?=
 =?utf-8?B?WnRKeVdqdjFsaC8wREovazJjZ2w4UFZKbzFGc0ZEb25sZzkrcHZXOU5EcDZv?=
 =?utf-8?B?dlpWeEZyK3dLc1ZXNTBqbzdiMFgyR3BVbHA4OVh5T2pRWDZaNlNoYURTRGto?=
 =?utf-8?B?N3dVYy8xRGJZbHhiL2JaMmY1c0l5NjloUTBnWEFTeEcrU1ZCckhYc1dpRFU3?=
 =?utf-8?B?dURUOGUraWR3NjlISXVQY1NuYjZ2U2l4cG9lK3d4SzJMekxPYkNMNFh6NXRZ?=
 =?utf-8?B?MnJQUFl4cUczSmZzL09DckJ6UVNFWTJ5OE5BdUNaN3N5aWlta2tBZWt5RHlD?=
 =?utf-8?B?aVY5VDA1YjdMWTBUSGUxbm1ZbnM1S2g0cXE0NjFGVnRZb3ZhKzRtOVZXVFRl?=
 =?utf-8?B?SWdqT1NDVzVwcGdjdkF2YVJHa3cyUkExTDZsaXhGOUprM0xoM1dkM1c3TGR2?=
 =?utf-8?B?MkVIRXJ5RG14ci9uYmdpV1FSNGtrdXhUaVpTUnB6ZVZZTE5mSEZocmE2bk1q?=
 =?utf-8?B?czdGOUdhNTVPR28zRWFTcXdRV05HR2ZWQytsNENVY3gyS1B1dDkvRWZBUG5O?=
 =?utf-8?B?S1B6QldrNmNHWXVJZjhKVnRDWmxic2xzVUpXTjBoRDBaODVieU01d3crTVhI?=
 =?utf-8?B?QzhmcUp3WXQ3MzFWSndxZW9CaVR4WXp1dURJbzB4MzFGdnlZTVNFZjE2di9v?=
 =?utf-8?B?MGczNGhxMVYvWUE5M3k4UDQ2RmRVM2JlbnVIOWJGaGRMZjlnaHY3SWJEZDVW?=
 =?utf-8?B?NkVvUGVNQThiRkszRFYxNjlxVEpIVUhiUVlMRkhLKzREZi9LeGdIdGovUlE5?=
 =?utf-8?B?ZHRZUnFlNmpKYWM3ckVnOXJGOFJ5TVlLQVlnZGZyWWo1RUp4M0RUdVY3c0Qw?=
 =?utf-8?B?bytvQ2V2OE1jeXFTZTF6REYxcUtTNEZhL2MzQWVHMUNIYzk1b0wxOUJTOWhy?=
 =?utf-8?B?b0VkU1NMZWptdzhEdWllTU00M3hsUzJDZjdqQ3RKOEwzZXVHYldJTUlRQzNj?=
 =?utf-8?B?V21ORmYxdUhTWTRmV0VuNmpXQW5ZZ2ZST0NXUGdrZFBBbmpRQnV5UHEzaGVn?=
 =?utf-8?B?UHp4S0VuMHpGcW5tWENqcTU5T1hvUTZybERrbm14YW5rNkdQN1RsdTVjTElj?=
 =?utf-8?B?bTR4OHk1TVZUaVNaUnVXSHNHMXVCZ29ZQkdCTUVHVGtkcmt6eUlYZHJNU2Vr?=
 =?utf-8?B?RjZhVlJLME5zWndDOU5yZjlZUkRnQktlN0JKMFBZWC9FUm90SzFyNDd4L2hB?=
 =?utf-8?B?V0hzWlBHcksxNCs1dkJQdG1QcWJWYXlCK3V2UnAzbUZzZFRNMWx2eVdmRXZO?=
 =?utf-8?B?UFYrRThIYlhYMHQwd1krZURUeXBIU2ZUOGJhY0N6dS9vSnJCS0hCaEdwUGM3?=
 =?utf-8?B?WXJkalBlczBhK20rV2NHdno3ank4bDB2UURJelBHQi92QWR0aVZXYUtXekUz?=
 =?utf-8?B?MDdUbnUrVHFRcHU2eXFJT0o1U1phbXJzbVJEdm9nR2MvWW9UUFpWN1orOGtW?=
 =?utf-8?B?TmlDTDRSbFJuaTJ5bUJXN1MyTWl3S3owSXkwNzlDVVMwaUZlS0FReFNvNXVy?=
 =?utf-8?Q?BBqv3wwfwI+0iuoA=3D?=
X-Exchange-RoutingPolicyChecked: d3UyCoQNQToT2EOThcP2QR5UH6XmWYvw3RpiG9kXTaaeCd3E/4bK5i9xdufw98d/GtnmBwGyB2drI4Pf9WCujcYo3bBwN7226XuqsCK4UGWpA6DpKSC/yLhWHseco9y/YE4j8x4sHRbFnSU7tWI7R8cHOilwUbIw2Ftd4LRT/hnjle8+3nWQqlvD0LGKk4ocbcd+614Oc6LjcW0hwGEvwB9t79R+0KurA42fz46zvILyYBqtAWdN2rbXCDelYC187bREgsWokryiZprJZnZQy1JPtpsYaYMS3tsYfdycekN8X7aG8sS8atbywU2MzNol0oqL1vREV4/Fwxn/mXG6eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80326d2c-5c24-4a01-4d6f-08dece36a528
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:12:02.8892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkP59IBRTVKooL8zCP3+JFtwLrz72VktLAVqwNZo8S/FbbLQr6FkzYiPwr5YdCwgLoSoGNStLwyh3D+GanSA0gsNNAENXWR7z0e4/WDAeYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

Refactor the GuC DB manager to remove its dependency
on guc->submission_state.
This allows using the DB manager outside of the GuC submission path as
a standalone resource pool, which is needed for future patches where
it will be used as a separate pool of doorbells for SR-IOV VFs
provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 20 +++++++++++--------
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 17 +++++++++++++---
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_types.h             | 20 +++++++++++++++++--
 5 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a..95a713f10034 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -15,16 +15,20 @@ static int guc_dbm_test_init(struct kunit *test)
 	xe_kunit_helper_xe_device_test_init(test);
 	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
 
-	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
 	return 0;
 }
 
+static struct xe_guc *test_dbm_to_guc(struct xe_guc_db_mgr *dbm)
+{
+	return container_of(dbm, struct xe_guc, dbm);
+}
+
 static void test_empty(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, 0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, 0), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, 0);
 
 	mutex_lock(dbm_mutex(dbm));
@@ -38,7 +42,7 @@ static void test_default(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, GUC_NUM_DOORBELLS);
 }
 
@@ -63,7 +67,7 @@ static void test_size(struct kunit *test)
 	unsigned int n;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, *p), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, *p);
 
 	mutex_lock(dbm_mutex(dbm));
@@ -86,7 +90,7 @@ static void test_reuse(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, *p), 0);
 
 	mutex_lock(dbm_mutex(dbm));
 	for (n = 0; n < *p; n++)
@@ -115,7 +119,7 @@ static void test_range_overlap(struct kunit *test)
 	int id1, id2, id3;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 
 	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
@@ -152,7 +156,7 @@ static void test_range_compact(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_NE(test, *p, 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 	if (dbm->count % *p)
@@ -171,7 +175,7 @@ static void test_range_spare(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 
 	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count), 0);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4023700ff2a9..092084b200b9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,7 +882,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
+	ret = xe_guc_db_mgr_init(&guc->dbm, guc, &guc->submission_state.lock, ~0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 697bf8684ebf..f810692ad8fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -30,7 +30,7 @@
 
 static struct xe_guc *dbm_to_guc(struct xe_guc_db_mgr *dbm)
 {
-	return container_of(dbm, struct xe_guc, dbm);
+	return dbm->guc;
 }
 
 static struct xe_gt *dbm_to_gt(struct xe_guc_db_mgr *dbm)
@@ -44,7 +44,7 @@ static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
 }
 
 #define dbm_assert(_dbm, _cond)		xe_gt_assert(dbm_to_gt(_dbm), _cond)
-#define dbm_mutex(_dbm)			(&dbm_to_guc(_dbm)->submission_state.lock)
+#define dbm_mutex(_dbm)			((_dbm)->lock)
 
 static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
 
@@ -74,6 +74,8 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
 /**
  * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager.
  * @dbm: the &xe_guc_db_mgr to initialize
+ * @guc: the owning &xe_guc
+ * @lock: mutex protecting this manager, or NULL to use an internal lock
  * @count: number of doorbells to manage
  *
  * The bare-metal or PF driver can pass ~0 as &count to indicate that all
@@ -84,10 +86,19 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int count)
 {
 	int ret;
 
+	dbm->guc = guc;
+	if (!lock) {
+		mutex_init(&dbm->internal_lock);
+		dbm->lock = &dbm->internal_lock;
+	} else {
+		dbm->lock = lock;
+	}
+
 	if (count == ~0)
 		count = GUC_NUM_DOORBELLS;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index cbe163fe7ece..e29e318e213b 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -7,9 +7,12 @@
 #define _XE_GUC_DB_MGR_H_
 
 struct drm_printer;
+struct mutex;
+struct xe_guc;
 struct xe_guc_db_mgr;
 
-int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
+		       struct mutex *lock, unsigned int count);
 
 unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 0850918c28b0..717cac854724 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -21,17 +21,33 @@
 #include "xe_guc_relay_types.h"
 #include "xe_uc_fw_types.h"
 
+struct xe_guc;
+
 /**
  * struct xe_guc_db_mgr - GuC Doorbells Manager.
  *
- * Note: GuC Doorbells Manager is relying on &xe_guc::submission_state.lock
- * to protect its members.
+ * Note: GuC Doorbells Manager uses the lock supplied at init time to
+ * protect its members. If no lock is supplied (NULL), an internal lock
+ * is initialized and used.
  */
 struct xe_guc_db_mgr {
 	/** @count: number of doorbells to manage */
 	unsigned int count;
 	/** @bitmap: bitmap to track allocated doorbells */
 	unsigned long *bitmap;
+	/** @guc: back-pointer to the owning &xe_guc, set at init time */
+	struct xe_guc *guc;
+	/**
+	 * @internal_lock: own mutex, used when no external lock is provided at init.
+	 * Do not use directly; always access through @lock.
+	 */
+	struct mutex internal_lock;
+	/**
+	 * @lock: active mutex protecting this manager.
+	 * Points to @internal_lock when initialized without an external lock,
+	 * or to the caller-supplied mutex otherwise.
+	 */
+	struct mutex *lock;
 };
 
 struct xe_guc;
-- 
2.34.1

