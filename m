Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B9CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF83D10E8FA;
	Mon, 12 Oct 2026 11:52:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865710E449
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791805941; x=1823341941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qXPBzupV3/kAesRVx0wkQLsbGdIKXyoTzgcmr/mbZWY=;
 b=iAZo6Eq/qX04gBD+p/HgN+Oa5IxuVRrvsAgZ64B1keLmj9F0n0g8HR/A
 5fne8KdwaY3CGg4NpdF37yYw3kng3adoj8hjMPOOoCy0X6FPY6nh7D776
 KRXfWAk02uFups0ZQ5E/dkSJw8DNb8ILCZKngOk3x7bEkDF5IkleubBOE
 UX+DGkiQh/7jWSwntS3KJmkdCwOxDtpB+a/LZOvSozopqNvaz2uASpUm5
 TkW6yEpTpk24fGhLCBzed2IXIx7jnmfMJ8ciX9yQUzoWl0eTuLsTIfp7O
 n8AidCoMNIHo9D0fg5C+gtCQuxcRuF0ZIdZXl+oFmcj98qoXX25OxV5Xt w==;
X-CSE-ConnectionGUID: wYUD73q2SyKDgI3E8dk2AA==
X-CSE-MsgGUID: ImB7VBrDTQS2igCxqoF14A==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="520692"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="520692"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:18 -0700
X-CSE-ConnectionGUID: 75MFTffpSHKkYfoB3Lfc4g==
X-CSE-MsgGUID: gu3Vx8iVQtitLH/efeTZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="800996"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:52:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T60WcZeEZKsTITElZtdS4PQ79/Pg/A6bhGKZKbSBaObYtLZE4tCs+KJyPU5vwbtOp7NJ6gaeucjrRc4wXpMD2Qk6oy2yvwQJuVTVz/0xs4t41hA9VVoet+99ItDtRs6gSrq7TGz1hGhZWRqUynWx/YVqIaoaGgHMV/1/3PJEThcvA3zxYJw+hwh+xZ+lkWuACH22jmH24I9wlQiSimVq+sAf9JVP8al4WTAywldAnp9100pd56NUzCoCbQqfhMc/9LLXsavD/eMKDuh2iyc/JWfNPmGxx/klsjDRNe2GcngXuFs/tF+vk/18lUsmJ6SBc+rtOyfGBiJv5f+FvG24OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzEj5c/iSYT4me12+esvgCmJatWzv5c5F4RwhK/nekI=;
 b=ALrpx64v0HYHyhaBMqGQyx3/6Nb1fehtSAf6QPeeHgy3dUPCaMVyWPCBKGsi7oVme338CW4CDq2GjKIHZsOz2eDeXIobF2KIJ8+ff5Zb4Q8zuSCVR8N9HgcpdNyBpVa9Cjfm4qF46ND8gxiKKHi6nscw1FLZNHVU0cjjjp3uMMNYHTzhgO/H+Zx0ffYUQHnoS1HuNJrCE+KEO5YxsCtRa2T1jlqvHWf6HU+8yP7fQJQdQuhNl61pT/DWVeMhlMxwQWbE3lqEQGN2C008+Dh92FqHI8Y6u2RXmiXzyURo4mA7mCYwbYxZw0ctPZVl9n51Rpnv0U8DT259y8OKPTleoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 11:52:15 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 11:52:15 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Mon, 12 Oct 2026 13:51:41 +0200
Message-ID: <20261012115143.4100364-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0334.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::24) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 835d74b3-8ba4-46b6-1943-08df2857423f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: E76S+5ZTeXHFzW0gygELuIpGZ04MER7B5oXEJECV133hJ5nFQY6YaNTGTc7mcT+zWiLo+Ka2Nkv/KpPT8Lib+TrybUsKzPszXWn2Z9s6WqqyobhRabtSnYbSg6t5IVL8z/mdSAtwNu2x1pHJqzH7WIsvtQevo/+gB5747Kxxf+L7zSmj9NV/82rJwcFuFDSXl3dFpuWR7O1D+L3b2uIftA2WQ9PK6tKDsyXuBkqA0SV5nEyNRIdbVq5nmrY7bk73LE8xbQoJ2gltT82XW0/bCHl1fKrgkQn0C3iel+gbC0HErIIEPLqO5c10vmzvJjNTx1hqwDyMnU4k9Jyco8SIukXoqp6pSh96jJwMzIntEvZYIQZzrWTaX6FQnN42SAnpxJPx1SuB6utFgoimG3mE+NkT15pUPZ0bQmKpGz5dFcUQXTbDv0V8ev9e4jSXJ3pVVgY+JUTmKCJydz8EJzQNrGgGSD7vcayN6GaHTcrFdU+8abbXylRKPCIkNMHzzh7YNRl9MrAeoWLCjEqBilmlv8vVnC0L6DmFKM0POxa7e/EzLL6F6EoJN9Z9/k9IUPJcalk4Vg43bzcpr6+T0329+SkaPJrFVoiJdCv7zVF2LbHfo8xEP4I1S26vU91IDQ4sbqL+S2KFeyz3gLTOj4vRpQFeoQOb6dCy5QPQPzcHSpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BjWFRWZXZUSE5xVFZ6NWIxc2J3T1Z0R1NNZFFlU3NPd2pJanh1Q2tMc1FC?=
 =?utf-8?B?RXdnckdjZFpOZ2NNRTY5aVFUczl6MWIydm1KT01kMWVUelcweFMyclU3ak1B?=
 =?utf-8?B?YWtJRmt3eG1LTkZqcHVISEgrcml6QzZqRjgzdUc1bnFyWTV5bWNSMGJKWlFm?=
 =?utf-8?B?SHdGY3N4c2lXSThZeFBLVGxZUEs5WElpL2NrRng1WURwZHpFeWpxdHdTSHlk?=
 =?utf-8?B?WEU5WjY1THRUN3NVQlJoV0FsTzg5eGt1VHM0UXpGMHNENUNNRis1YlplS01H?=
 =?utf-8?B?RlJEcDkxa3NaeFNLV0Y4RklqQkdJYk8zcm5nSXdGVnJTMkx1U3phYlRUZjRa?=
 =?utf-8?B?QjRBMGpIQTJmSGhCQnBpR05MTVg0cjQyeFhjTUxDMFJnckpDTVlocVJ0d0U4?=
 =?utf-8?B?VjVCdWtuUUVvMjV6WjRQUU9yOCt6QWVKSGFYU2RsNE5tbkpXcG0vakxhMXRz?=
 =?utf-8?B?STRDZWQwcTdlMkZkQ01TR1p0UTVxcVNCNzkwMjlnWVVxMXFqZGl3QlJVZmYy?=
 =?utf-8?B?bWUrZFk5N1Z6Yk5JbFNMU2tpVEhYQmF3dkF2SzN3TkU5WVZTUzVRcW1YRTho?=
 =?utf-8?B?NVByRWV3eVByQlRHVjlmY3FyVEVRRTBrYlNacm1rK2p4WGpJZTVEMkxSR0V2?=
 =?utf-8?B?b0R0NDh5QU12ajJrYUNUMEVQeW0vS1pEZmI1eXlzU2sxM1ZNdjdsUENUSlha?=
 =?utf-8?B?OTk1WnkrR0lXVVArTER3QWU1bnM1bmtuRUdlSzE2RmVpM2VCcXVWOTg4SkdE?=
 =?utf-8?B?YUVna0F6Y2dCbGtnclI5MEZsWlBIdXZRQTJjbzhZSnZUbHAwU3VuSFVjYmtY?=
 =?utf-8?B?MDZPZCt2WENueTZCaHFLcmE4NUdOKzBxandIcWI2NlF6NWpDUyt4QjB4WFdi?=
 =?utf-8?B?YVNBdkVkeURPZDBVYTJMUUJhM1NLM1V0SldpYTRyRjhVT1prc1RNdDhWMUhS?=
 =?utf-8?B?VEVmcE5GRzRRUGppaXZOcHBFbGo3cXFKYlNLYUJaa1czUjFTNnMvRW9XSStV?=
 =?utf-8?B?NzZRTmQ2R3RBU1FDM0hQMFk0V3c0bU01T25INlBZNUs5VktGVHpnbUM4TXVM?=
 =?utf-8?B?ckV1NWtsbnJieXpIVGxOeUxPckhZM1djR00rQXM1Zkc4eWZaL1VpQ05ZaTJw?=
 =?utf-8?B?T0ZKeXJsWlhzNkR2ZEp4NnJ0Z05ua3JZY3JCOGNOc1I3NnNGWXp3MUdYOTkw?=
 =?utf-8?B?QzRaaDJhTU9FcDRlOXB3NHdHbDFBWUQyVnZubXZTOUt1VUNFTGpCdU15ZUl2?=
 =?utf-8?B?V1F1M2pkQ3kxOUVXeWh1Vnl6ZFAzVk9EbXhoa3Y0WXRaMndpN0JRN0JnQ3Bi?=
 =?utf-8?B?bDVndndtWFdQQ1g2bit4dTJEK0tYamFvM1ZjN25KRUZBd2pRZEhGTGRXVktC?=
 =?utf-8?B?Um43am1ucW1tVENVL25OVmloNjg4QWt0TENYTmNsYW5DVDhNUmx2VU9qUG9o?=
 =?utf-8?B?cmFHOTNLWkpjUURiZFpkTW1abzFWaHVHR2VWa2VSM2M5V0JnaHdRVnNwd3NZ?=
 =?utf-8?B?MS8wbjFlZ1FqZzN6M3pUSWhud3VWdXR3N1I4cE9LaVk2Zk1nUVViZFd4OUhR?=
 =?utf-8?B?VXRoTkF6NnptUzJaWHZVQTZ1VTRTY2hITjY4UUhPMnVINC9KbExZd3pGaXlN?=
 =?utf-8?B?a3ZMbXgrcUlQaFdSZVN1K3Qva3lKdXNMcVRmNjZDYlN0NzREMC96V2VHRFRW?=
 =?utf-8?B?b3d5OXNYYmViM0hmQ0Q3MkJZNzM5dzJhTnR1bVgxWmhiZDFxNXQ0Y1pWTmFZ?=
 =?utf-8?B?RmpZK08zZ3Nha0NoOTlvZGR6b3BFL0FFY29qbERDcXZMeXJyRDJSbmo1czc5?=
 =?utf-8?B?bGR1NURJSG1UZm1FMFR5TUZvYzd5THE4LzNCUmRuQlpUQmFybUtwREMzc1Ey?=
 =?utf-8?B?SlBtSk1DZ0xTOVhHN1RQTkVHNFhkck9PSEVtTzNqdXFLbFRrT1N4ekFRWXcw?=
 =?utf-8?B?Rm5HbjcyMzVJY0NSbHNmWXl5TlhUaXhtYjZnSFVMUGdyV1VobllISlRQTmd2?=
 =?utf-8?B?dGJLRE8ya1NsL2htcCtmL2QrU1JFamQwVUhMdEhIUklaWkRBNHlDMG9TMlFH?=
 =?utf-8?B?eHJVUENvOWNCOVBtcTRJaFJ1bVNaWDUyaDZBYlMycDRyMnVMbnp0SGFhK1Za?=
 =?utf-8?B?VXBURTg0blRmMFJXUUdWNGZZTm92MXZhQzVIQ2dlUkpuWkdXRUtJT1M5aEFT?=
 =?utf-8?B?aS9FRjRiZkJRbWxaem80TExVc05JdFN0Sk0ybDhQWmZFYVF4Tlh1T0JYaTZq?=
 =?utf-8?B?Q0VZOFFVVERLSHl4SGZqOXRzWVFEUWxHNDlVSUVGanJYbjV1dDVOczVhM0Ex?=
 =?utf-8?B?ZnhPYlZVR3lXUWowRUZ0bStHMlRvUmNJaU12U1Zmc0ZwT2gyNzYzNGhPcmw4?=
 =?utf-8?Q?lrTheG6IGwcoIdX0=3D?=
X-Exchange-RoutingPolicyChecked: Xe63wESk6VHRyDNX+Udhideb65aGvXlHTWcNaOLXklRoWvJhza+Gm5tIl+dGK8JTfNerYjPmcwfDpQQJP27rU2fwAnWb6fjxyyqRDyyzRO6Fo925HV3eXsiSINciIPekA7Avnx9eS7IWF5YGv5qH7ntDKPP7N1WhD3pGaH+x/v3HQP5H60L5iy1KoUAzo9hVL03rXuDN66mdTjkycaO4XzOiWjYkxIgpMWOJT5phqxGNtCIjnqy2NovoSxK6+dv/wNHAvbQpKWigL8OxTvvL5H0B1pGPERqLl1B85lFoeMETYriDU+7qKwxQC0j6J2GxAlP2a2goe+MewSZpuoL6yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 835d74b3-8ba4-46b6-1943-08df2857423f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:52:15.1046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zdKKUo0PP9M4R6WGkSgIBlaiHJ8rz5q6/RTvYeUBTf+ATmLMQ/M3ptTQKOcMs5f/yhFYA1vikWAhckbRtf1uwR6vl5ZdzNRJsEtZmp3EK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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
v5: Fix check_used() cleanup and add missing reservation guards (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 670 +++++++++++++++++-
 1 file changed, 654 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 78d3de46b7572..48a962de5abcb 100644
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
@@ -51,10 +65,28 @@ static void init_fini(struct kunit *test)
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
 	unsigned int n;
+	int id;
 
 	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
@@ -62,13 +94,17 @@ static void check_used(struct kunit *test)
 
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
-		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
+		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
+		KUNIT_EXPECT_GE(test, id, 0);
+		if (id < 0)
+			break;
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
+	if (n)
+		idm_release_chunk_locked(idm, 0, n);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,32 +112,620 @@ static void check_used(struct kunit *test)
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
 
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	mutex_lock(idm_mutex(idm));
+
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
+	if (usable_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, 2);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
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
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, total - 4);
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
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
+	if (shareable_range_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+	if (shareable_overlap_id < 0) {
+		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		idm_release_chunk_locked(idm, shareable_overlap_id, overlap_size);
+		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
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
+	if (usable_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, 2);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
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
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
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
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
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
@@ -109,6 +733,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
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

