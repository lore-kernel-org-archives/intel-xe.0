Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA14C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380DC10E641;
	Thu, 27 Aug 2026 10:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpSJJOmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2545910E641
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826566; x=1819362566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=m9mWN6ntOvU0QnBJv16xAo+SlCVEsw/RFFlOgw4lpyc=;
 b=GpSJJOmJH4/7Vg4/NrNLxWbt1of02YP05hGSTG4n9thzMaD0QU48vSQA
 KOo541ZJu0lwkNXndZg/2/o1+SwgMbrYrLjtGtadBt+s6QheQMBF8gkiP
 ETKPn3W9KpZ/itfxoz3fmIzsDRFwpV/BY3A0tKLmemVhyxjS4Ws5q/pBU
 p4iahOLjq8mm6cN8hI9QN3Bt94etKxEldmqzI45hNI/kCNjZRX0fnIxlU
 P+sos60vHJ7iKj9bvZEEfzXatP4mpplfR/2sFOVTcUOQSTbgHVbYdAY/u
 dHn51WTsHZ4Ta1JdHx/gBUo7LkCxBht6oGANZGTsw8pWq4rBps/ZbOlKy Q==;
X-CSE-ConnectionGUID: aMvjEFy8Q/CHNpuHTwas4w==
X-CSE-MsgGUID: hhSvB9cUR/iVXpXEtXVnsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="111106484"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="111106484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:26 -0700
X-CSE-ConnectionGUID: rxJFvjU2QnS27HB7Dyt7SA==
X-CSE-MsgGUID: DblfrXU0TviGANN9j8xMWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="267255482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:29:23 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4ZK2+aBthVewYJ1vhThLg2F+lZ0cxzOjTE3haOmKX6LLnCyxI/unhZa5HxyrY3W+uXhDamnl7tiH07bCIqvIlj9LGzo8THJf6YdTmRDzK+TSOhNCXPDGo23UzggEowx6FNXyBsP+qNYJL1cxRh1osiCYOM4OqsJLUrwzXvxfbnpgCIo61GNw9SaoMsmQdMcVgDF9YZdPyBhdDarP3ITUqHHi0556M3hrn0f7mzHXq+dzYhd6XGpT4CS7p8764adMKzvJIhTmSX4ncVbv6TT8HVOZ25+iXG3CdJM3VfMXl/svc+oZ8xZYpmQP5kn6JjvL1sQKI02b1Z8SnLXHhd2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SN/rlNYRNGOGoKrA2qGBFLmQIIFyn2A9br9lJ6yqok=;
 b=RDz2l0ct0cZI+3Qqhy4WBiSHaYdhCi1J7Na2cFZMXSdtxeE01zwyw9oXPdpYqfQI5zHlCSuYCXpfkaCgOAqmLaPvELkXlon4o9qtDvEFEBgPQiUOUB8cp52WkTPUu58hXpEN1u3Dlx0w10h0rbX5hkD90vWEBDxzkDkZrT+0ib9TNaD8AhRKrSwdOyicSbUWU+19td80yPpEx7kMi4KF4qDkWjsItg7x7fmdLrd/0vG24ntkE9oapH3bXNtYPz4U8H56kiJcwopxDFLEXzJtQCkbdqzX4U6xeMiG3WdRX0e5PCopjSHlyKVwEs48MNuPDuwZAdoTsuq5gGevdgf6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 10:29:21 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:29:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v3 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Thu, 27 Aug 2026 12:29:01 +0200
Message-ID: <20260827102902.1236918-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
References: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d2e903-f065-473c-5127-08df04260ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: UTVbU54jpayE/YS14Lla1d6svs1Rb4Ig6TqsiZb/6Zh0Nux2UOcXc4RxuTH6zF1MrOve6MEcPccDfVTVSMTwTz96f33NyBRRLD8wEA16fj3KiupktYJBQU+Jx7EqpRdXajvP3dU63t3TJ+AfJJ/ta9yLTEQcNwz4JG3J55vBw6oX8VlDARAnu8IDaouTDLwt87ozS76SjiKUv/bCnETUx8vjOwJ/26q+AJhZHhsBPRIJRxkzC7R+pbj50evIhNGZKc0Qtm82AVuHRm874LAFGmY5BuqdddpptNGIm8yo537Syga0x5HQSopjhadVi/Nobyj3VrvFvjcEhlMIgU7KgRATp25osPALxjnKprZOiI6iqg59eWlImRUZTocJh8O1bXbYzQtzfwI2AevPIERcRll3GwWxo1IL5F0vJsLqjtTzcvlBOkGNNiFIqHgQqYkX1IJG1d77VMNFAfdJTDwyFKWoUzuhaT5F4dANCDRE8iBXhIchnwr1AwWr5J4dzEUROGF0U+LisIuewxy7T7sHyhOj9Ns2ZHZs9oWI+Tfdk85LUjbzVdpJpLfpkIGXG79su8uC6gChTln7JW3GKnmHLp8aypwom1wSpleKdonA85C/EN76yMpgjMzJC2LkHsZxqU0u/6C7ptMornGh2CJG3ToDEz4I1QD1NwacFRfAqzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUhPdVBNL1B1WkdBc0ZDWXZ5eHhqOGR4UTlvWXFXQS9RcVJJelBqcnJUZ1Ay?=
 =?utf-8?B?NjFwdDFTOWRuSEhpUkVIQ25pNVRLWW5lWmttR1pDcVNuREZYdnZDV3NUa0o2?=
 =?utf-8?B?eGRMM3BKT21nNTlVZC8xYjYrbVlGa2ZoR1NqYVk4MHA1OHpRWUgyM2tRdTVR?=
 =?utf-8?B?dXNZbzBORktuUmdsUmVNclcvTm1LMkxhK3FuR3JRTGNCQnZLdVBHTlNCQ2tn?=
 =?utf-8?B?eG1NUjR4cGpnbjRpb3pKY2NsQVBRb1JxTDRWMXdTbG53Rm1yWlRuWHYzdTRJ?=
 =?utf-8?B?WWRtQVVHUWlyR3ZYaFJ2SGJNM294cU1QK3dRbUJleXpJa3VSU2RYdFp1UFZq?=
 =?utf-8?B?MElkMXNQWlkydGNZMzhJeWk5ZnJmQ1pjb21mQUZyUU1lc1pGRG5ER3BSMC9r?=
 =?utf-8?B?aTJxNEEyWVJTM29aSlRUVU90NkJIRVI0WDlCc216TWtJWjZPOU9INWMzWmc0?=
 =?utf-8?B?ckhZbFA2YXg0cHg2U0xqUWt5VEdqY2dsd3ZpR1pRdUFKUGROVnMzSWVESFN0?=
 =?utf-8?B?N0Q1QnFFd2xaOWxKVEt3b29Ubnh0WmhTSU1NZEhlMml1N2EwWWFlUlBkYjd4?=
 =?utf-8?B?VU5haHNDR2IzMlpPZmVqZGl5NmNZbUpiN3pSc2QrVFdHWitFVGJnU1hQVTRY?=
 =?utf-8?B?UmRUcW5iczUxdVpJVDltL21kNktGQnNCYXlITE0yYnAyaXNKWXFRQjd0c3Jl?=
 =?utf-8?B?d2tib0dXL3I5Q1FuUmdGQmlxZ3JZZitHdGtMTFh6TFZLY3BrWE1zQ2NNS3J4?=
 =?utf-8?B?TWZ4dWxJWmtONkdwa1ZTamhhZjVpVW9LdmV0SHh4S2xzR2ZVZ3c0MkpNWHY3?=
 =?utf-8?B?dWJnK2FCS2JPUGw5aTE0NUVDcGVEZ2VERXpQY0RQZ25oQXYzM0RIWitMYUFu?=
 =?utf-8?B?LzV2QmJzaHMwQlNSeUVJYnlJVmVSaEpSZVBQUUNrY3d4WnpndVNFNUpvTmZ6?=
 =?utf-8?B?K2xNV3Q0QmdQakExTmpjQXFkSk5lMmhYV1o1akRIK1paNTVTTEhnV0ozdVg0?=
 =?utf-8?B?WDJZaUFaNmIrbytWbDhiaFF5ZUVTdkVya2NvdHQzdWJzcHluK3Nvdjl5NnhT?=
 =?utf-8?B?b3ZaUmREelUwOGZYUlRORDV1RGZaMjcvdkJDTW5zL3pFYm1YQXNxQjlNSVhm?=
 =?utf-8?B?bzMyakFKRjBMUlJ3QVZzQkJHWjg1TFc4cjdoM1dJTG9UaDQwOGVTK2lodjNr?=
 =?utf-8?B?TkpzR09xREd5VVFPVU53ck50MEMwaWtxMnorVzc3Nkh0ZG1JdkdnTDBDWTI2?=
 =?utf-8?B?Q1ZvTTh2aWg3SkpianFqUzFZeFdYdWhrKzBYWjRJU0JhT01zZThaY1dkRmI0?=
 =?utf-8?B?bWZzSU5oWHNOaFBtampnNnF2M2xLdjFFNmtjZFhZZmtIQUJxU1FUa3h2MCtT?=
 =?utf-8?B?MkcxK2tXYUxIZk1PN2ZxQmZWbVUzdGd0RndkRi9pb1hhYlZwOWNwM3h6eWRq?=
 =?utf-8?B?aWhpbmdYTFI0cEZzV0ZlZkF6bkllazBDVVcyMXNQSnNXOG9WWU1UZjFINUIr?=
 =?utf-8?B?RDlLWWtrcGw4Z293SktocXo5WmJZUzZFWmp3Nk9GTm80ekszbU5yUGw0Mlpk?=
 =?utf-8?B?dWwxSm1rZ3hweWpvM09rcldnbUVsZUh6Ni91SkZvc25BbngxZzRNbElpV3F3?=
 =?utf-8?B?Z05mVUNUZG1ZcmNLa2pLQTlWQnFlT281Ty9PUk82aE1DOThBRFhjbnZQdjQw?=
 =?utf-8?B?WFVPL1JPVysrMUtNNjR2UWZsa1ZhZnZ5ajE1WFJDNkVFVS9NUE1hWld2M0VU?=
 =?utf-8?B?UU5FYUVTUUVZenQ4NzZDczRzSHVpa0o0N3E0M1VVellGYXY3YVl2VHlVZGRa?=
 =?utf-8?B?Z0E1Z21valNFaEhCcWVXampHZFNMREN5V2grSnVaRFY3dzI4RFQxUmZRMHlO?=
 =?utf-8?B?cFZJS205cWRUbGxaMEpxY1BQTFk1d3ZXRmhwRU40ZUkrc2xqOHFYc2RqWUo2?=
 =?utf-8?B?elBSVUs2M0dSK0dpbDFzQ1czYzgwWDBvMERYRlNJRW5ZMmFZM1hxUVpabGxh?=
 =?utf-8?B?MW5KUTlQWFNSYWpoRG9kRnB5dGhnRmJVV1ZOT0llUjJCU2hrZkFuMWZGakR3?=
 =?utf-8?B?b0QzUWR4T094Qm1USXhsVC93WjZ5TFcyeWMrcGp3UVFNbFgwa1lXZkxSM0ww?=
 =?utf-8?B?dnF6ZzQwaDFoU2NVYlNkaVNUcS9PWnNZNGRmaHdOSmxVNDd1L0FicjM2WUZY?=
 =?utf-8?B?bGFFRjdXOElNODF2aWdlNStrU2VzanJMWUc2WGdMUGoyVVZic2RaUjlpQTV5?=
 =?utf-8?B?MDB1aFFHZ2doMFBLM2w3NlQ0OVVwQThGL3dGQTJ3RjZldjhJREc1WXBMNmtm?=
 =?utf-8?B?eEc2WXVTWFA2U0wwQ1hYbGhBSlRLRk9ZdkJjdW5EVVdVOU00Z2pVWHVnRnJj?=
 =?utf-8?Q?UJ44QmZl5OoXTn2Y=3D?=
X-Exchange-RoutingPolicyChecked: Hs6l9m2r8rKR9znupsZcVDN1zInm7+RMvweDFRFI0C1y2SGdVXKs1Am3ds9WhPAt488Yw0eL4p43YwZOO2a+7How3HI+iq0XTZnius44EOFmUaTqISt9N0Xz7d+FjaTcfwU7vqhl19CZZVH7U9CKvKUPinaFQ9V6pLSL90YlmdvktwswKE5FLiIb3rfJpZHqvh71Krguo9ZA3X2QsdR94Bj+DENENIJd4h5eggGx7MB9VkMCcCDyZrffigmOI6VDcEjaSyySbefdWUsQOUyxnG2crUKsOydi+yXF3n7FA0X9+ETTIMEHXU8Jlq0tGnT/1qgtsp2NWPcEI6jtF8bjoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d2e903-f065-473c-5127-08df04260ec3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:29:21.4046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLyKhcd0PWEMsLVFGRiV80RCimSFbRCG3i9QK9r6tTfwArYX3fiTFgl5W2FsQWp9mv7G2QAAH6HU7BMXH+9VGM+IdEPZaGFN+gV7RSsGK28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
    needed (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 33 ++++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 53 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            | 13 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 27 ++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h            |  2 +-
 6 files changed, 105 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index bf5d2beaaead..4c2bed554e23 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -65,6 +65,23 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
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
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
 static bool require_iov_config_or_skip(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
@@ -75,6 +92,20 @@ static bool require_iov_config_or_skip(struct kunit *test)
 	return true;
 }
 
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
 static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
 {
 	lockdep_assert_held(idm_mutex(idm));
@@ -639,6 +670,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_small),
+	KUNIT_CASE(check_init_shared),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..f1c802d53987 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 2c181d280552..5675325665fb 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -124,26 +124,55 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
  * @idm: the &xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * Can only be called when the device is not in SR-IOV mode.
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
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
 
-	return idm_init(idm, limit, 0);
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
 }
+#endif /* CONFIG_PCI_IOV */
 
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 209f99831f1b..ed9970829a93 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
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
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..f4d12d994b56 100644
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
@@ -3180,7 +3185,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
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

