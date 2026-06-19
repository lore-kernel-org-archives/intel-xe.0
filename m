Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4425BCD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B83710E04B;
	Fri, 19 Jun 2026 20:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZbbRqdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFBF10E04B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781901012; x=1813437012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sH9VL3+5ttsXEmF1coADRGk1H4BHlygA/MNosgS1Rdw=;
 b=kZbbRqdEYgRXXOfmOhXBJbZeoEvNENU8JRjUfME+Tn99T7xHSDxL0JEL
 p6q+LxhM7ODB+ryXfx9CPhUgkDpVtXdXpP1TTZ8utsAad4sBvLksC4dDx
 KNZUNe6xBf0JvjV7kvhaaBEbc5eow3W8RJbd5St9prhRXZu1mEJ+XmwwB
 3TDA5JVLxKZudeRFxPRpMo5nAgQBLIJf4bfhhVPAvg0nDa3mU/ARV4rFO
 nRirZWvvZfd5yIW1B+HIC/iZryj1WOhxtydQ56w2y1UnzEwZkAK9onwe/
 pnqVWJB4j18vY9Wz35FajhgHJmexq+oMcPwqHrfs5XzBm5zGelMdbhwLz g==;
X-CSE-ConnectionGUID: wd2rvL7VTI+qzMRGQCrLTw==
X-CSE-MsgGUID: MuXVb1NUTU6DsWiugPqxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="70256047"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="70256047"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:11 -0700
X-CSE-ConnectionGUID: U2lUstuLQUuFayqDf280+w==
X-CSE-MsgGUID: KDS3MrqLT4alyczT+Td+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="245771634"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:30:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPp5XRwFpuwWKAE9/AYloLkPm4On4i2xB3mdrHlabeDw2IxA34rNG+81PSORzcGVAWtKSfMN+QHzByAU/4/FHMlDUjEw+4HMoEkyV7oBFtNE9Bef7QvXxjImYn4F35tsHrRLlFWmw9vVHtW5ZCcdYwuwgiz43VeZOOERpc3T75bf7j4xNtiDzKHfJHWg6zJZyVNXMQgaKLvRkXRHcqYADK9Oa7IDkr20pETc45OTjGbQNnIXXhQwBDg2+Cq8jTSshlWE7y+4Ya6E7hXQQeUAVrxz0tqD+/drydxMPE4KKWPy5PwAtqFndYPchyYOX8/DVxAO8URX/i4tHJJQBnNQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/RmRj2rnIJKXBWELdWl80t5EePsODjR4/K0zeopni0=;
 b=gPcwRTjnIgUYDUmLUpox0VDWAWgSj+dWW+cHUTU3dRKaPDGnA+dZ0ZCb6O/GcLUnoq49ymKqteWjrjxtOZOwV6HU91LvNpCj4ZwsTHdxvmy2JlUwe+MDpwO8JSclvT8KNhGTqMdPNyMYVdLxsSCMmtccTpL03Z3GSY72ZZZcMYy4xQLDY1X5UHLtmRCOz6Ja2b1ZtuXYZzvj+JQyCtm3Immfrllj/hzfI9zGtaImTWceUlmE2GJXkbObPE+1JkGa1ngKemkS7bczYVzRz8EiVgDH4DjsLa2LSKPSymF/vi/IEPNoIFQB0cx0vc4hfkeIFkqYmnXNQd7poXTpzSzt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 19 Jun
 2026 20:30:08 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:30:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 7/7] drm/xe/guc: Allow reserving GuC context IDs without
 retained range
Date: Fri, 19 Jun 2026 22:29:35 +0200
Message-ID: <20260619202935.2701499-8-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e0469f-4e50-4b67-657f-08dece418e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: otY4EDlRuP/pL8nUbS9HFq4QC6get+cnkw8L602o8EgPk2HXvasv1+dml0OjkuGD3JMvQwoRCmnopsFhLpiW9cHF8LzNeA9+lkaM2zo5bEhQEI4Fkgxjf+w3OTuL1Ykx3q0rNRlJlgTphYO2I0tCCJN3Y/xrxhti9/DVBFUL2fDMZBPsDdtJT9oRlBXj4rpkrwly78zSP2okM9rhWY5BKtAHwZHBAGrYO1LUHLv3se9zzSpBmm/RIsXxGXxbFXtQ/6Mlz7Z4xrTf+mMBk9eUnjfPuLoU0RJvWz2zLkEicQf8EZ3ikPfoidTyznQssRV27RYo3SkoYT5xbpNTt/Q2Gsnraz+hQCe3m5/MnS5GPkKQaXKXe5aY9skkKUwBnRVWNK1GK/F58ygx911/5sCwuDLKmMF6yyyXLGXV67ACU8BtcLOMWwlU3QLke6z9HlhdjC3D1p666B03PPrIWjiq06QFZZfTNp43AYF3+258vbKgio5C9ta7sJRnTN3xUTRHcXamUsZHQ1PygFhy+e9a8Qrm7+qCE2QkbE1pUECoEVzR+nkYex7rExIXNgeK6eND93zFH7Krngen1qSz70uxMtI2Nh38vwKTMvNHqzIlffr+62DTwKNHK6i+rWG9Pr9h/+4uRD5WZzcwdOYLKi9BeGeBzcOD00ShAKvPUQe+UNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0tlcFBJSEFHWFBJc1lqa3hCejgrT3BLanMvYnFxeGhURUJZVjNKMHU5amEy?=
 =?utf-8?B?T2VzcmFaZlN6c2JQYThiYXdxMWs4VkZ5d204ZTBRektVaitTc3I5eHppVnJz?=
 =?utf-8?B?SWNiWTRXS0dSNTdqZGdlVDNBWllmNXJTTzJwZEN5b3IyYTVRYmRiSXpzc0l4?=
 =?utf-8?B?Wno2VEJIN1l1Z1hKa0wwTFVDRzY0alo1di9ENUNGRGNjREVUa284WlFlTTl0?=
 =?utf-8?B?UFFSaml2ekdyUklpOU43UnlibHcvNTF1cXZJQXBZQXFYVDlRQjl2OFFDL2t2?=
 =?utf-8?B?RW1vWSsvc0Vlc05KYk5WVnhreG9iQmd2YmJwdVJQNitLVjhjR2ZMNWNMaDhD?=
 =?utf-8?B?UFZNUEJ5b1RrK0lwQytLZm1nL2ZQNmlGZlV4M0hWNDhqMzRaenNwRnNtdFNv?=
 =?utf-8?B?ZjFHaVNmc0NwQmRQa1NOUDY5TkdPSjJRLzdmSjFReGNWWFczTUhSaDFmc1FQ?=
 =?utf-8?B?TDlUVGFybXJESVRPYldPbFNIY0RnK2x3TVdjVnNjZ3ZjNkNvVTNjakpMbnlt?=
 =?utf-8?B?OEo3Q0pxdTNpVEdpMDVHb0dxOEE0VTFmWXQvVmU3RTN5dHAvRmNndWhUZ2lL?=
 =?utf-8?B?RXhmQklIakhFaUVtMVVBUG1BTm0zQm53ai8vWncxRkozVitaYkpSQXRzQ1g4?=
 =?utf-8?B?b2FIR3Eyc2FRUnJDTzEzYVVrQmI1VHNwSlBxd3dJZXNZQllCRVZRQy9OL25a?=
 =?utf-8?B?SjFGTlM4dWRjOGtIaE42bkI2NzE2R0hMRUJpZEIwYzhYanJpWFVvUE45MDJT?=
 =?utf-8?B?RjFWMTlSRGN6SlJkUkZaMTBVamY1TlNYN1d4OENSTXlEV3F2RG8welI2YzBM?=
 =?utf-8?B?SldrTFFJWUltSFZpNjQ2N1BSN2kybkZHSytmWkRJOG5IOFY3aE5reG8xeDBK?=
 =?utf-8?B?Tld1MEYycHl2eVdtVnc4UTEveWhrY05RbmwzSVRQcXl3RXdYUUVPNjlJV2hC?=
 =?utf-8?B?S3FZZExOYkEvMTRpU1FQQ2p3ank5T1pSOWU2ejJtT0loWUd6YmU5czRlb1NI?=
 =?utf-8?B?NlRZdXFaSVFmNXFod2lxU1N6MUFmcEdVMFgrQmQrY2ZleW13bFQ0OGxmbmFF?=
 =?utf-8?B?SG13OHVBRnZVS2JlbjN4N29oWEUxcEpyQnZCRTZkZmdMTm84Z2I5RzQ1RE5E?=
 =?utf-8?B?dFc4dEVLS1hmTkh0TlY4UEtPTDZLK0wydlBHUGZTcjNmMWhFcjVJd3ZvUmlF?=
 =?utf-8?B?MVBSTFA2SWZIeUxuTXkyak9UZlNCTmd6eWNlK3l0N1dXSFFVbDBVdmR0dGhJ?=
 =?utf-8?B?dFg0SWFIMFlWTG5BS0srY2VGQ25qNFhHcXdNNXY5V2FOVm5QZjRJM2I5MFlp?=
 =?utf-8?B?OStGZHFWYVhBZDZmNWJpTHpkcXRZSkJaOGtPQ0NCdmlRNVZoQllEMkNKRTFk?=
 =?utf-8?B?eTc5OFdEVlN0VEFnK01LQ1ZUWnFRV1pHUmNFSGRIN2FjQXQySDR3UmVmY3dC?=
 =?utf-8?B?NUliWVBvM094YXFuTk03U1ZuemxqRG1vdm5iQVBIVTFIMU1vdXVpbUVUVmxp?=
 =?utf-8?B?c0EwbEN1ZXlLRnVzWWRZcU00OHA5QVllcWIxMFBDQTlvSHF3MmhsR05jODdL?=
 =?utf-8?B?VnRRbVE0WElaUmdXRFhrbWp0OHRCNmlMTnV3aWtqaUhvNndDN211Y3lqeG84?=
 =?utf-8?B?eDZBNzQ2UndSS2VsNUtPaFZ2NkV5cWVuOFJJRFFMaTVPMWVta0NiS2RVcy9a?=
 =?utf-8?B?LzFrK0F2by9wdjZuc1c1ZkVQMTFHbTcyTWExamZYQ1BVZWsyaUFvWUFHcncv?=
 =?utf-8?B?TGMydTlDdVRoN1pKY08zeWhtcytabW9jYS9XUXRScEdvcldoYkYvYUJXWno4?=
 =?utf-8?B?RDhrS1hVU3orK1ZweFZaTUxiY1JzdDAzNDdMOHQya0hibzJSMGNkRmFOSTl2?=
 =?utf-8?B?RjNlZzhFVG9Xd1NIbTEwbmx3RWxvcTkyTUVzTjhTNmNTZzF4UmNkbjZld0ph?=
 =?utf-8?B?Qnk5VVUxQ01HOFlTL3o0YVZITGdQRjNqNkw2bEhkWnNNN3dHQmpJWHBNalBm?=
 =?utf-8?B?N3EzUnd4UVB4ZGRDVlR4NUp5eGUreU9QS1RMTmpZWmEyUFpmQjRTWDR6QlZG?=
 =?utf-8?B?aDdJWWdnR1E1SEs3Z3ZyM3ZpL0NIdHQyUWlwcWtXZnhMTnJ6em41dzFCZS9y?=
 =?utf-8?B?Znc5SVNOaExLSkpJSFBDUkNWcGErYzcxYlRZZW5DbDBYcU1zK2FXQy9SQjlQ?=
 =?utf-8?B?RGl5RXo3aEM2L3BJb0lOQndDWllFekZyMXlRTmc1K2tnM1FxWElCRzNGV05Q?=
 =?utf-8?B?MG5PUnA4Wit4QitBTzBHNmNVOHM0TEtoSVJBS1hhTjk2TmRXajVjUFRZZ2tD?=
 =?utf-8?B?R2dzVTNURjNmUUZ3YklpVzhnekhRYi9jOWNNNTQxYlVMYzZ5WmM3bVFlcldi?=
 =?utf-8?Q?BDkWUIqaPkCBuQOs=3D?=
X-Exchange-RoutingPolicyChecked: A35a+Gtglv41YaFLU9DRA4hYg4G3RKo8WoQqo9k6cwGahJNWg9/jiPzZIIat8NXwbN23j0BItIbvt2o4oU/UqNqSjQ9JLSdtBvlfqToYyt/WDcQSKjlvMQLSaW19OaJ2KDdFLem+mArRgoJeVJv7b7Atf3/BPDpWc7ec3IOklnkFbQRVWYzpnjMNJsv6DkZzjnWzxip8M8IFoKW4ZVFX6h+Zij4O6/Tj5BJ080T0JCPwFIs85wyD7nBkC4wdBC8ymbumdm6MXirxzcjoWlucTic5aV6DLlp6g0d+nmzuNrj5T/rzQIAyAShjtg8jBoaLZKXxTtPHhaplo9tfW9DC1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e0469f-4e50-4b67-657f-08dece418e22
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:30:08.7101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlT23PqiJxM3L8FN4GFw7/pjTu3D4SCUtQ/4FMCkhSd8AIdH8KtKwzoD054C4XzLo9aem/W4OOIAS8aELpNxtnXPxYxONqCGV/3Xvd3BE60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

The GuC ID manager currently requires that some IDs remain available
after a reservation is made. This assumption no longer holds for future
use cases where PF and VFs operate on separate GuC ID pool.
Let's remove this assert, to allow reserving GuC ids without retained
range.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 8eaf2ca46f37..925710f22418 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -250,7 +250,7 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
  * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
  * @idm: the &xe_guc_id_mgr
  * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @retain: number of GuC context IDs to keep available
  *
  * This function is dedicated for the use by the PF driver which expects that
  * reserved range of IDs will be contiguous and that there will be at least
@@ -265,7 +265,6 @@ int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
 	int ret;
 
 	idm_assert(idm, count);
-	idm_assert(idm, retain);
 
 	mutex_lock(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-- 
2.34.1

