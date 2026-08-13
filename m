Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359ADC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF2210E028;
	Thu, 13 Aug 2026 10:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EV5aKFzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF00710E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786616745; x=1818152745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E7y9UciqWQYV09+vOpXJx6vcVru0pkUpwnVt5KQ1cZg=;
 b=EV5aKFzV6TKSeUQb8sYLmwba5S5YdSrpzfdMnwWStRz6u3zFJ/PoHqo1
 zv6QCSHJx8amgkVBEPIrL/ZWjVrFoFZy3C8m5tvzSqgZETmDLZfO+0tFi
 5dfz/0B67XZGwuYNVwM2eM/NlNNwXksAk63QV4Z7tNtwgtgfTdPELE5YS
 MFO3dnziR5rD+vN832oK/EdsdwCahIidY3Jbq7FAuMijMNNjyiMNAsyzk
 nzXLbwTKQBdkWl8t4tMXXulzXZua30IZXkVp45QXf0NLr/8bVGix7T2Xw
 noDC22gWE778TMVV3GTNZIWKorVn9wzCyRi9nEQYpxUlVL6Bh6Y5j5V5v w==;
X-CSE-ConnectionGUID: NpLRcfAKSA6HVAkWaEaozw==
X-CSE-MsgGUID: xi+oh+C8QdSyzDz7aRIj3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87208444"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87208444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:41 -0700
X-CSE-ConnectionGUID: yYAb0X1LSDuWEcjEwYJWtw==
X-CSE-MsgGUID: qHL/yY4LQE2M/tiSG+xneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288690078"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:25:35 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI6TZwD/NA7iFm2nCbtWlqP+gVm8EAth4wydqlvk1dmfNswT7AfLtiXSICWYxI8b91g1V1wu1JpOk2Kys0ANBgjYQbcavRSSTaw3CKU0Ha+pxkXRWgkXErMLRwlEFy5NRoob1uzZsrXzh/+z9nm7hVdOpFlSgMgNIhmZWBzqqID+lvNKYPnbGU7h6eWC4b0XEAqX+axwvs6PqHNOrhFr5tTSIVv9gmiQhLmPTv66tx8ae16qLkmlhZCPTraQlw63/b78yEwGHpUsyTg6lOe3mEcjNPioKn7466qkSxkOdN1vfniOqFkSAfz+iTETbR9UoLy8v5ASlngoFpRMknKUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4PEexvlwC0W3J+ZKuslZ+kYVh4sasp4FtX/7WV31M8=;
 b=RqVpfHAenHizl+uHJBjwqq8kZ8HiTGKDosorC4mOYNkv18+Bh2VmeUNhZvBS4V9R6vNIoCoS3xqYGJYxzlkiBzf3FCJIbBjkjHl2AYf6ER6evP7EzPAbJZh4kz+kjBu7zrhPmGzOQo/Ias4QujfhTJ9PFTye09pr6dBEVS1I841U77q+CKJdKWT3SyQQ1NuirevpOjFpzFf+/LCXz5+LuMQ8n7jLkpwfJ9oV29LP6DgdbJezQDRwrmiyiJ1cbQi5GSlrEw5t1binZKZ4dui/CCS3iu8eAeF6N01k5Ld2pnim/eiBR0MX1Z1SyeQF+aS1QCYwxaPt5PUBJet+InkDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 10:25:28 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 10:25:27 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/4] drm/xe/ttm: Add PF-mem VRAM placement types for TTM
Date: Thu, 13 Aug 2026 12:25:09 +0200
Message-ID: <20260813102511.200690-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260813102511.200690-1-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::21) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: ebad19fb-c07b-4a3f-6e61-08def92531bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: FHIR9c00Bqy7ZzwyV36bplt0kteuvyKxA8Xb8zLxaauhmnwPqm9IKCXq5HNacE+AtvVvFgkwjBBZEDofGpZsMPIXXvbdsiZC9ORzayTlI0MwuqghF57jNC6HvMmUKW98PFUpz5EtrunMu7MaKRWXAVm3P0D7GRhJ2iuIVxtw9ANz/LIEFdQ4Q9sh6xiubMtifUD5LK+BRrLyH9kbFP9RATIelx1y2BBhGwfY3HAulzJOIkAR2CYCgcldk4xzm/40OFHbUlN5Hhdt4ntS/Sm+emLc/Fcwj7kgTPgx0Qr9P/5WeF02EXh8gEiNjBad8yeqkzihqTv+6olve7vjhAFy75lu40MmcfjXoxxwWMciCzkXXQwr8nu6GlmxHsRIwfoyrNGjH/aivyCb/p6G/EEPVV9Xy01SZuLMSi/VblYCUo94+wIyATa0NhqCl9ZqD6bbYvv8ZtqC8YL7YfuQX8V9Ne59pg7UPd4cA6SjBDmKRlerrr/Ap8jdNBrKIEjilMA20fSGKi9zT/08HQ9FGWh56RsckuyxHOqBYyHe97NZxeLlYILF1hrqWBysQHP4Fq917bwrQ19vweKoj7Q+JkXXi6/3zlicgt4h/ZEUgbRlrX0i2igBSy2brLsQuzAjkzqlfZUV8P7ogrw94dZArsciB5uaPuTwxoolDRwxajKzyw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnEwZ2tqVGN5VEFxQ2RlSWJYcmFNdFJhekg0bnRvVjdIVEEvaFNwaGpiTFNV?=
 =?utf-8?B?RUdpdDRRTTBZNlppQUNiNHFHSGZYR3lZTHpJUC92dHljOU1qYTNad1g3VllN?=
 =?utf-8?B?UnFXWE5TT2lCY2tSQklUV0YyWEFZQld4bjljN1haQWRzeWQ2Ylc4Z256c2dp?=
 =?utf-8?B?cG9jMWJnZEs3Z25odnp6dkxlS2Nsc2JBdnVBbkpPSStUNmlrT2JYcEUrbzR5?=
 =?utf-8?B?d1Z3Mm8yYmtHaWRsNTlqTmd5SE1ZOFVBdHRNclJWbjgvQTF6TVpMalpVRWJC?=
 =?utf-8?B?YXNGQUNmNGNjNDUwYlFISmRPYXJYY2xBd01xUTY1S0U5U2dRVVQvNzBxU2ZT?=
 =?utf-8?B?T0xyWkdOWmQ5akdvMmZWNGxZNzVyM1gzNFo5azdoL0N4RC9oanFFN20rTnEv?=
 =?utf-8?B?aGRNNjMrY3MyUEFFc1BBTG44Q1BPNERZb0hEcWV0M3EyL2tBRGlMempYWTZK?=
 =?utf-8?B?UWRHREljUUdsZTBUZ3JXaHFLOFZWbTNYc2M2b0E1bnJOYXBzNFdQQVM4cXBt?=
 =?utf-8?B?VHBybmwxeXlKaHYxc1ZVb3BldjUzZU1WTWRLVG9NRGwzNTdzeFFud1FlWmxE?=
 =?utf-8?B?OUV5RklBR2lIbVFOWWxUTkFTQ3VxYkwrZmlDWkIydTA3eXVmRmpCanJ3bllU?=
 =?utf-8?B?ZEZ5LzFIY1dNOU5kZzMyTHhUNTRZVDVaazloT2Y0TEZOVnM1Z01kMitFQ1ox?=
 =?utf-8?B?ZlE4S1VpVjQyWjY5YUVGSGw2Y21hNUpWUnh3WTdFZTkzZWRpcGZkdG5ZRUxr?=
 =?utf-8?B?VUw3cFFmYnhLVnZLdS9IMng5SHdPbEtGUWdKeXVGVU5HSUNuQSsrdDh3dk9r?=
 =?utf-8?B?eUdHbUx5NlJtZzljYmFLQXphUnVJNmc0TmNtM0tRTWZXazNPdWE3cnF5akdx?=
 =?utf-8?B?MXp3WDVmRTZSeG9QUGpJUFJPMm9xb004aUpjRVgxdnI0UTZoZ2pmNnN2Mm0z?=
 =?utf-8?B?cm5LTHZkKzlabWNOSTdlVWZmNGZIZk9rYlIrWmFsSDZ6enA4TDZwVmRGTThh?=
 =?utf-8?B?emFEY1RBWGdBWlFJMW5ZUlN6bk5MSWZybmR1U1JrVU9TRllQWEZITTNrbGhy?=
 =?utf-8?B?ZHBJUkc1UHZ5YldqMC8rbzhtNU9TZWZRT1BFV2R6bnpFMzFheWFwMWVZaWFQ?=
 =?utf-8?B?bGZtaWNoUGZES2pFMVJOaXdJWEJNWGg4RFcwOGFMYnBoQ3JoaDZMd3dhWFBM?=
 =?utf-8?B?UmtYU09EZm5OaGhsNTZHTXRrY1dYODR1K1owcGMyQlpScjFZeE5jYlIwd09F?=
 =?utf-8?B?UFBtN0dLWG1UY1NKOUxTanMxVmlVblh4a2Fndk1uRFpwdTVXeVBKQjR3aUxZ?=
 =?utf-8?B?TC80ekFzYTZsNmNGeG5nb3E3NVJ6L2owSjJjMlNuU3QvenVJR3MzRTFkcFM3?=
 =?utf-8?B?RlF3cm9tK2RReTIwRnZxV0pmck04MUlwL1FNd1RWeE9JTEpiQ0I5ZXV0eXpy?=
 =?utf-8?B?UlNaQWJ3Mm5kYzE0MjVXT3BzdFRkQlZ1MTErbWcyS2dOMk8yTWgydWpNY0Uz?=
 =?utf-8?B?R3JqREQ0YXJXZHdXV3JOWVBiVGtkVlV6N3ZiL21IQWJwb0ZuNVlmeGVYMXg3?=
 =?utf-8?B?c0NySmRJSlFKYmlqcURlUXczWm83UDBVdVUwd083NXFZZUVwNWxvdFE4RTc1?=
 =?utf-8?B?RldCTjVZVWhYQ2JhcG1iUkFLV3JkL2VDQ2dlZE5HcHlIcjV4SXNxU09xelNh?=
 =?utf-8?B?RGs5dVBOUUs3bjVyR1ZJMXlVN3BRVDlwUUhYejlaQUJTODBneGlIaHNLcDU0?=
 =?utf-8?B?dFRGUFErM1FTUmdtdHdaSnpPSUV6N0cyQU5VcTh4cy9QM1N3TzJCSFRyQkk2?=
 =?utf-8?B?eDFVMkpSRmpFVE9MMVpkaDc5NHlpaXZWTnFCaUlmVmdJYWhmcFl0WWxrSGpr?=
 =?utf-8?B?ckVhdXg4a1Y2VXZZbk03VTFDSStrZlJZczdaUkxNNTRDU0xyM3VVWHk3Y29M?=
 =?utf-8?B?bFU3TWNzWC9vQU5ZUnNPZEovL1BmWitidnVMbm9NLzQxNUNJRFhpRy85WDh2?=
 =?utf-8?B?TFo1alpaMks5Zm9nRUdVMkVxazJreHBHNGNJWklPdDhBK1dtV0JwTWlveHd2?=
 =?utf-8?B?c050bG9qc1JZamF5Mm10UjlNWXJxdDNwZUJhUEl6aGgrODZTUi92czBUZlM3?=
 =?utf-8?B?RTBIMW5tMjd5clZmcllMUU1DWHFuTHFZTG5yZ3ZXMTgzb0pRaVRsUUxibm5o?=
 =?utf-8?B?MnBxUHdud2JjcytGRWdPV1UzeURnUnAxVEQvajZLem85WU8zeFBsTis0V01G?=
 =?utf-8?B?VlRpRGtIRHhkSGpHRUVXRHY3MzRPSnN5a3NjSXV1N010SEVBMEFnajBLQUp1?=
 =?utf-8?B?dldNOG9UMWQ1T1RDL0pTV0N6WkJtQXJNTHRHeUNxM3o2N096WWZRakxtci95?=
 =?utf-8?Q?aRjpbdv24DkqJ1GQ=3D?=
X-Exchange-RoutingPolicyChecked: hBqHoX/edTtdnV6IvDFYR8s0UTZuHcZEWqbOC0so1JPj5sMkzj22s2lLY0LWZghXvn9nyWhk8S2Kt8brDtgoXXGew/DDzgL7DodMFbZhH/dA4DSL3p+/gyU/gGp/ybYXtUvz+TFtlqirsC9EPab7zrolWpmMxJ0zbOAaTu9+z4LUP2VVSAtMI6BY5zYxivpZGDYL8L35niI/muug5xeog/pBnpMWakJMPzEZ/cuCp7tjr2BqrHeMCDCX9YPuhVpwHQCRkmiUZzQo2s7V5RVZC8EvCZc1DGjJzHjAgzcvYxtivMyXM8LO8fiAFybGGJ08xqqIRWeLoUKHi1Q/zJCKaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ebad19fb-c07b-4a3f-6e61-08def92531bb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:25:27.8062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vl2eFifpDQQdRXNCdg0twNG3BidFcahHMB0TTGnbnozhMWIRi4hAT0Lzz8zykk+qq7mQNgcSLp9hlrP7Cf0VKWmqaprjkdrFsIekn+nMaoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

PF-mem regions are VRAM regions dedicated to kernel-only allocations,
where buffers are allocated exclusively by the kernel driver and are
never exposed to userspace workloads. Representing such regions
requires dedicated TTM placement types so the BO paths can route and
evict them correctly.

Add new PF-mem VRAM placement types and update BO paths to handle these
new VRAM placements.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h           | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_evict.c     |  2 +-
 drivers/gpu/drm/xe/xe_pm.c           |  4 ++--
 drivers/gpu/drm/xe/xe_res_cursor.h   |  9 ++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  6 ++----
 6 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..7b1a82e18faa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -46,6 +46,8 @@ const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_TT] = "gtt",
 	[XE_PL_VRAM0] = "vram0",
 	[XE_PL_VRAM1] = "vram1",
+	[XE_PL_VRAM0_PFMEM] = "vram0_pfmem",
+	[XE_PL_VRAM1_PFMEM] = "vram1_pfmem",
 	[XE_PL_STOLEN] = "stolen"
 };
 
@@ -166,11 +168,12 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 static struct xe_migrate *
 mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 {
-	struct xe_tile *tile;
+	u8 tile_id;
 
 	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
-	tile = &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
-	return tile->migrate;
+	tile_id = mem_type == XE_PL_STOLEN ? 0 : xe_vram_pl_to_tile_id(xe, mem_type);
+
+	return xe->tiles[tile_id].migrate;
 }
 
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
@@ -360,6 +363,8 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	switch (tbo->resource->mem_type) {
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
 	case XE_PL_STOLEN:
 		*placement = tt_placement;
 		break;
@@ -639,7 +644,10 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 	case XE_PL_TT:
 		return 0;
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1: {
+	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
+	{
 		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
 
 		if (!xe_ttm_resource_visible(xe, mem))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e8081af5bfc1..c698f70a3b0c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -83,8 +83,13 @@
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
 #define XE_PL_VRAM1		(XE_PL_VRAM0 + 1)
+#define XE_PL_VRAM0_PFMEM	(XE_PL_VRAM1 + 1)
+#define XE_PL_VRAM1_PFMEM	(XE_PL_VRAM0_PFMEM + 1)
 #define XE_PL_STOLEN		(TTM_NUM_MEM_TYPES - 1)
 
+#define xe_for_each_vram_pl(i) \
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1_PFMEM; i++)
+
 #define XE_BO_PROPS_INVALID	(-1)
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
@@ -614,4 +619,16 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	xe_bo_assert_held(bo);
 	return bo->ttm.resource->mem_type == mem_type;
 }
+
+static inline u8 xe_vram_pl_to_tile_id(struct xe_device *xe, u32 mem_type)
+{
+	xe_assert(xe, mem_type_is_vram(mem_type));
+
+	if (mem_type >= XE_PL_VRAM0 && mem_type <= XE_PL_VRAM1)
+		return mem_type - XE_PL_VRAM0;
+
+	xe_assert(xe, mem_type >= XE_PL_VRAM0_PFMEM && mem_type <= XE_PL_VRAM1_PFMEM);
+	return mem_type - XE_PL_VRAM0_PFMEM;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..e2ae97f5c684 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -303,7 +303,7 @@ void xe_bo_pci_dev_remove_all(struct xe_device *xe)
 	 * Move pagemap bos and exported dma-buf to system, and
 	 * purge everything else.
 	 */
-	for (mem_type = XE_PL_VRAM1; mem_type >= XE_PL_TT; --mem_type) {
+	for (mem_type = XE_PL_VRAM1_PFMEM; mem_type >= XE_PL_TT; --mem_type) {
 		struct ttm_resource_manager *man =
 			ttm_manager_type(&xe->ttm, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a5289a9df8d2..4c1630bdcc0e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -970,7 +970,7 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 	u32 vram_total_mb = 0;
 	int i;
 
-	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+	xe_for_each_vram_pl(i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man)
 			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
@@ -1007,7 +1007,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 		return;
 	}
 
-	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+	xe_for_each_vram_pl(i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
 			vram_used = ttm_resource_manager_usage(man);
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 0522caafd89d..4603a3356e53 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -111,7 +111,9 @@ static inline void xe_res_first(struct ttm_resource *res,
 		break;
 	}
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1: {
+	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM: {
 		struct gpu_buddy_block *block;
 		struct list_head *head, *next;
 		struct gpu_buddy *mm = xe_res_get_buddy(res);
@@ -303,6 +305,8 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		break;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM: {
 		start = size - cur->size;
 		block = cur->node;
 
@@ -322,6 +326,7 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 				cur->remaining);
 		cur->node = block;
 		break;
+	}
 	default:
 		return;
 	}
@@ -358,6 +363,8 @@ static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
 	case XE_PL_STOLEN:
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
 		return true;
 	default:
 		break;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 05911904c1f9..4b4ab7db70f0 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -336,7 +336,6 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 {
 	struct ttm_resource_manager *man = &mgr->manager;
 	struct dmem_cgroup_region *cg;
-	const char *name;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
@@ -365,8 +364,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	if (err)
 		return err;
 
-	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
-	cg = drmm_cgroup_register_region(&xe->drm, name,
+	cg = drmm_cgroup_register_region(&xe->drm, xe_mem_type_to_name[mem_type],
 					 &(struct dmem_cgroup_init){
 						.size = size,
 						.ops = &xe_ttm_vram_mgr_dmem_ops,
@@ -405,7 +403,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_tile *tile = &xe->tiles[xe_vram_pl_to_tile_id(xe, res->mem_type)];
 	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
-- 
2.34.1

