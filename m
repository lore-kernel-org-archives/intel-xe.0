Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDB0CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8CD10E111;
	Fri, 19 Jun 2026 19:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkEX8v80";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BCE10E101
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896314; x=1813432314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wmlyp7tSE4ea61laRePdV+rh8uT20XK6xFyMMaTd0To=;
 b=fkEX8v800rw3u4hKCM3KXCVsfWmzRcauVNfQ1S1ZDMoyBtIY/rC8Um3L
 8ncI1kif+x73al229C3TLx0K8BVScfS7sCskDa3vGWZeQ0sHTJcEZUF3b
 HqPiak194qaojbItpVe32pAjlMYLCyRxiA8qVhFRr1vJeEtWTlRb6lNZL
 7VDUgUyPUC4XE75iCTR0t9dOJygdU34/T4C85u/8PWzlpLQPwgX7ytdtJ
 SOzTOkDlCCsR+5qEn0J5BrRGKf6tQXZPZnTFw781R1fB6tAmbDaPyJgLk
 ap9ceCOmrSBAMUF+EjZ19wJwugxGGg9NJ2TBweBO5HqvpNQGgZ0Rc4k6A w==;
X-CSE-ConnectionGUID: lu9SRliFQRCxpDvC6E5I8A==
X-CSE-MsgGUID: MUetJ5M2S+KJbEuDwqBKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="105539015"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="105539015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:11:53 -0700
X-CSE-ConnectionGUID: YBhErcOfSCajkOQNWjh6Sg==
X-CSE-MsgGUID: u1M4q2VHRemqt6OqUsmcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="246341766"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:11:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:11:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:11:53 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf8QFiQ+l2weYIC5/0L2b+8Z8JgG802JXX2NatToYjp0+x9dIMB6t+8uzs9JzI35W7tP102RYf7vjvWzBeqbScozydGghJzX5nemife3TVOc6dwvZiDV8VT4+1z985Lmxq+fJw8NwNb4LawZxHC91JCnGpVIJAhTuGweX/lTGLNfV+jSDFUEbEEQU8KUo6xYkEutJi/2sWrn7mILBsqa45L4cvEf3GqeEA5koInd009BM6PNBK/9/QKAntP0WAcnmmpEvVFmnHJKr0Q0fAcLwYTD6tAnZK1yw4v8RfzfE6ZtHKa5zCSULXVaycjyIhW81KJCOljYk+KgIcMMMrzScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0N5rNDHgat/xdUAAOfbBa1asH27NYpoxV7HwsUd64E=;
 b=n0VYULkzP4MHODV1AvOMyG6B0Hpx2YqrcrKDV3ARn6e512TiM7AlQJnBujL3GznLa6WwMZM1fAxO+HCsRz+f/eyI4wIlQp7ckZb1eo9gVmwNS5LqNuj4yJvz84E4zEEH4u3ZawbwM4zRy4ojz0/KTXRdNqeFcXnqKBABpAZIi4z6LaOoKR4FS7NsDxkT/JyDEsFeWBgCvvy9A42S7cmHF2LvMYQm1307uuyvST4fS4697Awp2lHX4SqhJrae9eYpeDMF+1VlAHVqyRVTZNMj4t4K3dCABsWNLtXYVOOqZKY9mQTtz+Lhre+wYaEX9p+uQORt1bQ1511Ym1d5WAZOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:11:50 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:11:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/7] drm/xe/guc: Use ID manager to get total number of
 contexts
Date: Fri, 19 Jun 2026 21:11:01 +0200
Message-ID: <20260619191107.2628783-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0289.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::24) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 8008f0be-6c26-4339-3068-08dece369d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: adrUQN0RpGrRfLLrHo1UKJH66p71Ruv2f3VeBuOpWoxO/LJPMflDoQMSSrbFQr2whmZeFe8XaB7FITdvEhU39R+V99rLxO0maVAusWo+zeBKYP7lrBpl9dyl8H44wP/JyloJjOeYK+vPpOKc/6r6cK4qGSDiyIICfprtuQDZF36uqw8TVGl0bipVwMB4CLEow9u+I9KN0rN1fdjh9kFGWS3Hf/y+7MMc9Lf1Lt/r/r1HZwlrYfXFvAESSMXrDKz4/N1/yvxXZjKipslKVyEfPjAeb9pc7EZfnRWNHJd/SW3UEh18En1fWDkLgwxRmAdKbe9nn5PA+6svOIjJ+ujjs3yBfQEoCRMlTizTav42eVOcJSLMhsH4kN5uySf8H1WnssGvKN0GJIr3ZsIAVTCZvM0mXgnN8AXwV4Sj8cSkdQauCQ9t7f5WK8xrtVgD1msmnZQacxGwqM9ELDEXzb45LHsnzx8H8qFnyeaep4N8JmuBhqCI8BPT0+Q0qFdUspfSD7RyNyieGblGjdKiqhvU0IwlNEMq1zg820kCqIUIHywpqkNFXItdgY7kfLmYM3zcl/NzzYC+oByysaQiIYpuaOqucQIGu0M9snfoi8DMgWyMTeNrc733OjdxIdqTHigTWsGBOea/zkla36kLkxyEy/RjKQ+TYR7M7vEZIqrICKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTkralExZnV5UURnSDdxUTVJTCt0YnpGV25vMGpEdW1SR2trREJ5VmlTK0Zm?=
 =?utf-8?B?MTJDRzVJbGNOQTJ2TkdsOUlUNU1QdkVRK3o2d1V1WmxKTXdOMkxSQjVua0xs?=
 =?utf-8?B?d3NtYU9hcjhWblJPZHkzOGd4eFdxT1pRKzR3NEtOYWxJdzVJb0VlbkM3blMw?=
 =?utf-8?B?eVZ4S2dnMGhXdTFLYXVHYUVoaUVFdHJiSldHUFVGN2F5enJBd29Wbkk0Sml1?=
 =?utf-8?B?NXFJZnE2VlpoZzJDS0J2Z2JLZmJNKzdKV2hpWUZac1JYbWs2emxNTXNubDFU?=
 =?utf-8?B?eHZsemZwZmdTYlpZNW92R1ZneXF6OStJUlVsVGZMNnBnTUkrdnlHc1R6UWZZ?=
 =?utf-8?B?b1ZCSnJoc3BKdUp2dndGYnFBN3dKVFZJdjIyNHdzaTFLdzc5NUxJdWRLdnpr?=
 =?utf-8?B?WVhBcThVTy9kUzlYKzA3NVFwekhVeWlPMHphcGx0WXB2YjhUOGxtY2ZjVkIr?=
 =?utf-8?B?ZkZ0R29UY0VkTWxYeHZRck03bDFPUGJBbUZzRUpnRUNZL2VnSURqVTBDVHJl?=
 =?utf-8?B?M2pGNDBRNDhHRkVrT0UrR1dROE9IU3oyd2ViZ1Z1T3JpQ3VEdkluM1BpSHMv?=
 =?utf-8?B?bzRQMVIxRElaYUNBR3FSYUFrMy8yM0t0OVRueUhua1d5Qjg2cUszUmt2MDNU?=
 =?utf-8?B?eDRoUVQ2cVN3T3VvS1grUG02bXFWeDhnRGJUeTdCWmJKMjY3REFkK2oyd0hs?=
 =?utf-8?B?enV5VFJ1VmtNQllLRmRLNnp2TEJYaVJ5L3pBa2FXM21vaWZZcnpENkt6SDZu?=
 =?utf-8?B?TXpxb1FWSTBlMzY1Q2ZmODV3cGVQTEVJSExNRldCRGNwY2YrUnZPMHJTelFk?=
 =?utf-8?B?RElBRGxRTXVuYTJscDk4ZmFUWlJMTlRHY01MTFFvVmtJeGJZR0dIQ0lwdzVl?=
 =?utf-8?B?Ny9xUUlTRXRpaGV0ajRwcHNRbE5MaWkvNWJGTHBKWWJ4RmtYSFF2bEwwZlkr?=
 =?utf-8?B?U25ORGtGWHdkbGhnT1FraGxRWnpWQndIMUlCR1VhNWk5VlA0blNnSnh4cEhG?=
 =?utf-8?B?aG9PeFRoQUsyU0ZKTnY4MHByd3pOL0FKMHNGMkw1K3B4cjA0TFdxSEl0S2tG?=
 =?utf-8?B?WmxnTkdCaUN5c3hwdnZDanNsUmdENVdRUEF5M3NlOEdMZFhEdzF6U0JaSXo1?=
 =?utf-8?B?L3ZaSTlyVENGTHc2TW8vc0Y1QnI1akF3b2dFNmQreWpVTzlKaVBsL3hHU0p5?=
 =?utf-8?B?bDVUT3pvWkptc2psajBXREVaQjNYTm04NmJQaFBEbC9YejYvZFFYMUd6MEQ3?=
 =?utf-8?B?eHIyQlpNNWhSUFRuL0dBRTZ5Ti9CL2dBSGdCRTJ0d2VxWFUzWVJIK1hSM3Bh?=
 =?utf-8?B?TmlHOHk5aGtaQ2xpaFBRZUxnZFF0dWJnS1JJWDhoYVQ1WVhJdmMyNUkwdTJh?=
 =?utf-8?B?LysxTGcwUDU0dHlkTno1OTRkWmVKTjVGZkNINFZiNHV6YUZ6S0NwN3E2aFp2?=
 =?utf-8?B?ZTBucy9qdmw1MC9qQklsSm01UkgrUnVJaElxZFcyckdtN3dIVjVRcXJIWlJy?=
 =?utf-8?B?a1BiV2hMZTBhc0VPaDRXc1U4UHBaTVR0L0NVZStQZGhyWWVrc21zV1VpcGpi?=
 =?utf-8?B?cTUrL1IrTk93UmZVcE5yVlk1Y2FUWnJrWEc1ekpZMURXZFNYVG5rblFNdGFD?=
 =?utf-8?B?b0RxcUR0SC9VNU9CRWtMS2pLMXdVOVFkaHl5bkZGY3hvcUhwRDJYaUgwbHAy?=
 =?utf-8?B?cjZmZWREQ3Y2QjV2SzZ0eFNBWXVFQmR3T01YcU1HQ3dqZHNCYVZjUldlaDk3?=
 =?utf-8?B?clpjN3cxSG94Nnd5bmN2WjNOWWNqZ0NZbEVBUkYzSEE4Q0RrUEp6UVJ6VDI0?=
 =?utf-8?B?SEhhNmxPS2xkeTFvZk1ZMEc1ckxzd1hTaUZxRVdGYzBaZ05pKzBwZkdJckha?=
 =?utf-8?B?WUFnRDl2OEQvQVkwRWkyUHNzWW04eVplajhRSStSaWZFOWpTSlFQVEgyVkdS?=
 =?utf-8?B?WmlkTnQvZDRhOXJqVjhJSnFCeWl3ZE9EalZuV2RFV1JKbGo1UlJYNncrNGhU?=
 =?utf-8?B?c0VwUEEvTWZXRmJEU1Uzc0hwd1piYTJLN3B0THR2WW52ODE2V2hIcmc3WlJR?=
 =?utf-8?B?NXpPYXhYYVlGMFhZWUw5MWNlUUxodlozd1lIRFlHQjVaR2kxUkNZZ0paYWNh?=
 =?utf-8?B?LzJqM1BjNHRJV1F5Z2NTdWlvNGs2RlowU1ozYWJ1Q05DaDJMKzRlK1djcnNo?=
 =?utf-8?B?TGpMaVpiYXdHVVJZMnlITkU2VmNyTGsyY1lFOHF0SmQzNXk0dHpobkUyZzdF?=
 =?utf-8?B?SDVFcmExbnBUNmEwTjlUKzR2RnczZ25hRTBLY0w5dkFHRURqaWtQbE54UWFp?=
 =?utf-8?B?Z0trVjUxWk5UaVpYdWVCUE0zdGtEZ0ZCRUlDSkxtaHV1UGF2TjVaMGFiWUJj?=
 =?utf-8?Q?bl0ENBCKOU+p7kkE=3D?=
X-Exchange-RoutingPolicyChecked: f8bAYXnN16JJytzbfwmUrguXucru3YqnwV5BHU4yJcW3EwJs5iB35sKjoJkLaHdEt0IXbnIIjhKMgMTsWkxZgfqVHXa1X7OYiZiEe8mSsrgzP1Sdyk7hl3q0dEjfeRIinvnEVC9uh9z7dy6rBD1zcypGxLFdjsVbIyHsWSLzRiEAtlFizjuQ+LUrwHdKWY3XJREq3J+v3vezaRqdAZrn4xOaK1nmlVPXVO/Z+6GwGlEDBmTSCRrWjiBEdrN/+rM08orZhGEOWdOtaC41YIuUtOp7804KvEJ79gNoKSlpAxB81ZOspuF+ELUpXugPnaabZnSPBE+zR19i5Pk+fJO3/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8008f0be-6c26-4339-3068-08dece369d5f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:11:49.8994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n35t9wauFMEMSJPz22TbSEppz+qRDlVaUliH1zQuC1WSD2j5wtZraTISYuItFLV7mpeTpN8Dhgq16y9ay4QN3w8M5GZy3PBdllLcIXj1a1I=
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

Add a helper to return the total number of GuC context IDs
managed by the ID manager and use it instead of the fixed
GUC_ID_MAX constant.
Update code to use the actual number of available contexts
from the ID manager instead of relying on a hardcoded limit.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.c         | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_id_mgr.h         |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
 4 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..aa77bd4cbca3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -872,7 +872,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -916,7 +916,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1136,18 +1136,19 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
+	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(xe_guc_id_mgr_total(idm), SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(xe_guc_id_mgr_total(idm) / num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_total(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670b..0738fc277bd2 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -102,6 +102,17 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	return 0;
 }
 
+/**
+ * xe_guc_id_mgr_total() - Get total number of managed GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: total number of GuC context IDs managed by @idm.
+ */
+unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm)
+{
+	return idm->total;
+}
+
 static unsigned int find_last_zero_area(unsigned long *bitmap,
 					unsigned int total,
 					unsigned int count)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7..25c6f026449a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -11,6 +11,8 @@ struct xe_guc_id_mgr;
 
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
 
+unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
+
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9458bf477fa6..537985f4d3b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2753,7 +2753,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
-- 
2.34.1

