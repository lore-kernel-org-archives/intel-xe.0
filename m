Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF61BC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C910E3E7;
	Thu, 27 Aug 2026 10:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OczjmXzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CCF10E3E7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828284; x=1819364284;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=pYQeblFMVKDEhi/yyNm8WSNiQjOxzpvGgViMsmwOLrI=;
 b=OczjmXzLOrg5t6td0+qAOac1nuGJcv3gBEbIkdGSzo73ofCrJ8wAueYB
 3/fO05nud6RYiPeiiuMKGON9PCtAYiRMt8eebFZ0wvDdhaA/knmvPCO1r
 5hpbzGDiq4JktqdAE+dIqp6wqB4G01V9MHagE3b+dm4LnDOsV6DaYZDGB
 4m6z0yXaM5X8dYq9oStJTi+HQFnTu3r+wF9evcfTh8hE5SOq/meGOi409
 yHH7ndJ8NNjKaI5vJV3lJHiFQ52exnvLZ/5xKApcbusVRga7aD7KI2Esi
 4IUFx2ix/PkpOUIWh7vb7pYAL4OzxddDIr6W36xzM5PbLvhPhM9rmoad5 w==;
X-CSE-ConnectionGUID: Cku3ROfhQj24GRmv3MCzyA==
X-CSE-MsgGUID: RewdWd9MS56aCMhq1QKxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99843079"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99843079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:04 -0700
X-CSE-ConnectionGUID: tEe/mJU0QziEylrWXRH8BQ==
X-CSE-MsgGUID: vD6CAo52RCG5ljkhcEsKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="297730588"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:58:02 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttfw++Nz3ZSuDYPsqfeyrKXPX1b77lfCBMQ3BYQzryF3yUAVnIz3ynK/4s/HD7SOuq43+0+FG4DvcdhFYHFi+KbGYhScTEiyG8qBJd9PDJ32lFynnbfYARlFqdfy6WI7XxTdMJlV8mFWRHF+aisZcZeAKog8qqucBFFDOtXXigBM7zTqsyszs8Ip3gjcir4T/CaoCJ8lp/62PDr6CyWXiqsOkJ0PQMMF0g+PD1Y60HL/Qfajajyg6MmxEQfeDK1UnrdpsrvwQneGh+bv2WTmN+FqxccggwqOcjN8OgvaJzoSvHcaYx32ArDzg/H7jIpyPrhE+2sRgvdV3KH2nHvjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKJviRG4vDncUzfPEpWiSNsNpGIMqD37r9f+xCos+H0=;
 b=cNGNSdIGJby8tIcPLHDgfWmDxl2mKJF05bfJruUVPcPX8s7MZcYha59N4c+KM3th4qcEX99/BD8EVa7NkIxNtbzLN47apWE0A5Dqaw5XoPGjfucT2aNzmHuUYDwTGujBEen/Dv/zzdYsmLiEZbTmNBjIyRAHB8Z8U2pY1XuJcjWmoh+vEqxu82bOQIIbClWZavPpAXAq3lm63AN/9Tg6XLEQhbh1lD0jAA4EeeqWBfB+0YWPPvFbb9bs0uFyC2UCGa0e1LpPDnIePHlqJruOpAAedO2DIQX38L1dosPosf+cSsLNDqAgSe1VC7row9p0ZNnLJJ7JccvSEGZ9k9hMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 10:57:59 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:57:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 0/4] Split GuC ID space into usable and shareable pools
Date: Thu, 27 Aug 2026 12:57:46 +0200
Message-ID: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::22) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d92f0f-ff37-40d1-d32a-08df042a0ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 2lZcPDPweZq+oJo55K+YefEwBsFREW08pXombM6NxCIA/l4MwgJkbRP7dUFHtvWQIaXqigXOu4T1xFMdlpkBEy1/6RShM45iF0JM3Hjqp8fI1GNCf25mUurLTHGjlgF1O+D1m89aWaDVlSpp8R8RS/QLFukNCbpfBUqf8dMZPoW+eY+ogwrl7vgT6Wp9BJlNUNe0kvZcwCTlrLoEfh3ox/DevU9oVvwANHk1LwreNP85JxTLn5REgVtuJTk+tJ5b9Mv8IlxiyRq+vk6A6kmoNhUm6gkOTPGnOsVC1fPCOJml0YK8CNRn/vRYe6ORO+UpgHGg3EEkDp+ZH+1TMImR9QbIPJZyxNBeBkKEsPCOrS8ZPheghvkzAXskxnF9Y/mqVyXHyFPAhOob+ME8Bw3mXsbH0pOgkKIanMgL2HuDfkKmKFGiNhTkTdWEVgHXPkGosTalS2izrvFE3+lHvObbZnsCNINXVmRVnG4wKn1itaTR/PM1ofNsUEDoxkNbAjDKlHjA2mhlwA7H6kdKycIQiqixN5t1EetB357BIi2DqbvKfM+pCQhAVwqavxRH1mdpg/7FB2yru/bszNRAwu1fw64iAM7Ps7Un1C50lQ5bo09A/1CL50SpC/vJ0XFR28hm3vTZq8PUrqkVVhUenyMBRF2Eby+IIMkRdMaZQcRK1jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUQ4cHNiZjRRQ0k2dXNRSFJ3VEJWRkViVGFkeGRGN1NNVWdrTmxVWkJyVnhS?=
 =?utf-8?B?SE1EOTRBQVNOSkJ5djBINDg0QXFYV0VWN0V6Qjd4a2YrRkdWNHcyQ1Zxc3JH?=
 =?utf-8?B?c3FHcTlIN3FhUjhaaXhhcmpmUGJ5Z0dSb0JMTytMQTNIc21vZ1VDRmVTV0Zx?=
 =?utf-8?B?TU5vcHkrNWtDMXJaSzBscE03RFJQZ3N4ekkyWGZOaXJ4Mk83aHd6bTRSTVlm?=
 =?utf-8?B?YVNjS01RNGtNaDBseUFXdjJxTmw2dk9BbGRUZFZieDZsaDczWVAwTVR2ZlUx?=
 =?utf-8?B?V2FxUUNERG9wNEhrUm9jT1kxQjRjV0FuUGsyMzFWRkM2TytVRWozb3Y4VjVZ?=
 =?utf-8?B?K0hVYVJPOU5ka2N5emxxK2lPLzRkSFB4c05XWVdLdEpPTWVxbTNNQTNkc2tF?=
 =?utf-8?B?NlJiMWJNVVRKVUJMa0VFQ0pTTU5FUnlKcXhqdml4VkQyZTUzeVJZNFdzdGlr?=
 =?utf-8?B?WXZRRHJ3VGtwMVU1dTM1MWdyMk4zZFkvejRrYmIyWXNZczF1eFFpQUVrMGQ0?=
 =?utf-8?B?WGh0LzR0SmtrSGJTNVBlaURJNDl0SVRDNlZSTUk0TldobnIxZmhUTHBnbDQw?=
 =?utf-8?B?aTF2YzBSditQTTZoNUVZWVU0eFA4RkRib2Y3Q3ltcGY4RWErTTFaUWdBdE5z?=
 =?utf-8?B?U0VwOW5Jenc2RkVwa2txT3l5TjQrV1MxbzJkQk5mSkFoczhCSFozV3ZqODNn?=
 =?utf-8?B?VGx0d3NkYThOTmVqV1ZjNDZXTG1USDlxQ1lYdXJ6aGs0Rkg3VHVjc1ZNMExx?=
 =?utf-8?B?NC9RWWEvTVQ2WXNmVEdFTEpFTzJIOFp4S2FDUVVhbmx1eG5zZHJVaWJXdUhI?=
 =?utf-8?B?MkhsS2FIKzVPenFiLzNXWGd6WlAyV25EUnB2T0dDYm9qdGV1QkFRNjFVOE8x?=
 =?utf-8?B?Vk1kaVJMTlhqcXJ4MEo3emdZWEpNTmI1TjZWYzhsNEl1S3dWdnpFelVhY1RC?=
 =?utf-8?B?QVBTZjI4Q01qcGF2Wkg3TjRxR2NTTFl3S3ZYck1vS0dnK3R6SEpCR2RYNmJF?=
 =?utf-8?B?b3BucHhPeTcvYzEyL2hVQ0Q5L3hNTzg0bFpZQzhaSUNpVng2QmdWUXIzdmZl?=
 =?utf-8?B?MUtYUnV6R0M2MmRYa1BCSlgzdEI0anJaQ1JRUXRwZXhPMldPRWVmajV1clNu?=
 =?utf-8?B?cjgwMUEvSWlUUDdjdS9mR2h3ZFlSdHJSam1pSm9CcFFCTWVZemRUbnNicVYw?=
 =?utf-8?B?WEJvYkVzWFhKQ2J0Y3daai9OT2FocWJNUWgrS3FmUnJyc3NtQUQ3SzFzUG5V?=
 =?utf-8?B?UjRWOUNQS0ZKaEdBUHRqZ1dtWTRiaGJtTDYzQlVDK2RSZzZIbHRlcE9iL0h3?=
 =?utf-8?B?bnpmL2FJeTV1QXFyQ0Exakw3Mmg2cDRwV3hsSFFkYWRvVUNTQldZMTVNYXov?=
 =?utf-8?B?TitVcGhFVHdjUFVnZ1VDK2krV3FUWGNHWlpEakVYZzZyQ2E0b0tyTFJ1RUdt?=
 =?utf-8?B?aEVBN0ZnanMwb3Z3cWhTQzE1U2dEZTk3NFlNZXNKaVc3REFhOGdYWjBsZ3hu?=
 =?utf-8?B?YmNXeGNDeWMyUGw3b0xHQkR2dzNLcVZpRkdXOEhualpPQkpLNjJSUjNtbUQx?=
 =?utf-8?B?aDBTUkplQndzUkdVUW1xSFdadDhLYUJKVnpqWkNKYjljR0tXeDJobXhMYStK?=
 =?utf-8?B?M0FFbWhNdmlSV2VhamtXOTJKQmEvYmhqdC9mKzd0S0dNckhjbm1iVTdwcFVN?=
 =?utf-8?B?MW9iR1hqbEhxMjhNOVNVRVZaT0YrSDJDbFl2dEVHNjI1VVBJQWxHdEVKSy9a?=
 =?utf-8?B?ZG0rTXhTZWF0K3g2a2REOFBoNHhMV2hJNGhZVHUwUkhkK2tBVk9wNTBKZE1y?=
 =?utf-8?B?S1luUE5OcnFiWVRocUwrSUFUUDlLZDYxWnlUMUxPbTVZLy9HL0VtcnhncXJ5?=
 =?utf-8?B?S29Kb2ZXeTIwc293VWZmVGFOd01oaFJWdkZPamhDZUg3K0hhN3hIbFNmcVlr?=
 =?utf-8?B?U1grV28xRUVHQ3NRbW80VFhPbUNlMUo1bnlwazZCWkQ1WHdsVHhrR3haSWZh?=
 =?utf-8?B?OHBCRnFDdEl6WkxTMEFqeXR1SUY4OWg5MVpYQVBDSmVNUzIwelFVMUh3YzRC?=
 =?utf-8?B?Z2ZXd3dMVjFIZnk5T0RPbWtRcU96QmVMNjYzbmp2RGV2MVFZZE1lMTJHa0Vv?=
 =?utf-8?B?T2NBODFvZTJTd09pOVpJQnNjNUZ4eVdtcXRHbW1EQk5uUXVkWnc2a0ovclZa?=
 =?utf-8?B?Z2RZTjdLb0Jsbk1TL2hJNGdRV21Vb05HRnJPcGVQTVdOWmloTWJWN2JqQmgv?=
 =?utf-8?B?NGx3TFZmM0hEN2hMbFlqMy9OVFVaZU1qT0d2YjlWUFc3ekw1UUlzNnRES3g2?=
 =?utf-8?B?dERudS94QnVVQ2V1dVp2MkladE9WbDZWbmNEVGZ2dzN0aG9IRTZPNVRoVDNI?=
 =?utf-8?Q?YV80jD+JNUSgbjGA=3D?=
X-Exchange-RoutingPolicyChecked: h3ioSp58T/IeX11XseaCmPEJqOepAtxm2uf25mZRHHYgKfd/3Xsa03AOON4ti1nDRAU+CGzh3CWWMyixeEOxRGw18tIqM/M4mE3dCPU4tY8voxWTfYHRyg/XDs5GI9GO9LqUnWbNDLMgwvGMrWxfpoDErCUOTxm272J6PYadxDMsQy7vev3ULl5NUZlOKPspkeMgqhTYcquTKWZHQQXup3OaE1Ew53QpXbbZjKHIr7C2TKUlTxB6jl/GAQcxCSy79XMnnYhnL/ym/j8yOZk0D6RjGNJQqI+/5ZJ4kYgTXC1EMX+9tR459DEpsiwHdCHlBbzxhehHebvufmIJDRFJpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d92f0f-ff37-40d1-d32a-08df042a0ebf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:57:59.3784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnHclFp977yxcnpYo12D1Sv+rW8Ndyhncwl4l94yjN5BTzFxv4m5tEL7+0cAncOF/Dav/9vOnX38PBIe1X4o72aeubwV+SGizmS+btRM72U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
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

The GuC ID manager currently treats all GuC IDs as a single pool shared
between GuC submission and SR-IOV related allocations.

This series introduces explicit separation between IDs that can be used
for GuC submission and IDs that can be shared with VFs. The ID manager
gains support for independent usable and shareable pools, dedicated
allocation interfaces, pool-specific accounting and validation, and
extended test coverage.

To preserve existing behaviour, both pools continue to map onto the same
GuC ID space where appropriate. GuC submission is updated to explicitly
allocate IDs from the usable pool, while ID manager initialization is
adapted to expose the correct ID ranges for native, PF and VF operating
modes.

v1 -> v2:
 - Fix issues reported by Sashiko (top-down VF ID search, KUNIT_EXPECT in
   locked sections, xe_root_mmio_gt() for the primary GT).
v2 -> v3:
 - Guard failed ID reservations before releasing test allocations.
 - Fix shareable spare quota accounting to include PF-exclusive usable IDs.
 - Skip some tests required PF mode if there is not CONFIG_PCI_IOV
 - Some minor other changes
v3 -> v4:
 - Avoid releasing unreserved ID ranges after failed test reservations.

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 665 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  22 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 458 +++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 1066 insertions(+), 156 deletions(-)

-- 
2.34.1

