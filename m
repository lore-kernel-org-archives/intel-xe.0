Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B379BC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7072A10E15B;
	Tue, 21 Jul 2026 09:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+WMHxJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DCA10E15B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784626311; x=1816162311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UXtFFKZ310SLNjxan4EMKvW4djO2Va435CqXEuqh6Js=;
 b=g+WMHxJPiUrrNZE28AKapVYWVjl7WQllvZjy9ouQi1Of0HrNQqSD7dBT
 3ugGR7UGwKgERNBEtBiN6SwujfhskfWAC5D7gJkMuEpeJrhrfsrsPCfvm
 OVt+/eKIcd5UtgekTRlz1Kkb0InPNe8k87bJ7ldU6LnwRWSw7nJvVc1JB
 uhA4xCSeZdot+ySAAEaoRB8mekLGIGYmq6fTulpm+h8YJaByymQygiZsg
 ec0LPW+hsfvtdImXUWCyouc4nIadO9Kt9ayYgU66HISqkF+yrr3lEfdvw
 Sh4YZP8Raf79sJ3ua6xyWD/H01pYJYe8DbcISirXVaxDhbqackJsAABFi w==;
X-CSE-ConnectionGUID: wZVgUIanRgamdtgAP5wH2w==
X-CSE-MsgGUID: spu8YUVKQPKtssEv+Byf3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="110769529"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="110769529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:31:50 -0700
X-CSE-ConnectionGUID: 1f3/M59lRCuPxW75edr4nQ==
X-CSE-MsgGUID: hcQWAUoQQLiIyVoOFX4zIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="287749606"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:31:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:31:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:31:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOdVd/jgw8zJCTzBPr+RtPb7HnQzpZzuvyYC85NZPnL9ky8xtsWC0QHo4EOrwlLUeKF7eFP1xw6l+mWwqm1UQL6AY4Y2zRq+HXmZcwJ35DwpQeQSzqnTMX1Brx29cRFxUrBD2RijdIj6pHISsEnFZP5k2xKs/Yq5ov+dTfS2PSjYklsHLh082s709paDLQk9mL1h4IPfefOVphDPN2lmmHKkiZIenXvCi92U5YHX9aEDOU/N9NoxefGTzT60fVERnItUGK5hi9Hi3VoEoTFz3MoNXEI7HCX/V6avOfgvhXmWEz29H4Xok+Nl7/ZA94IVTm2zG0e3Zob1Q+MOFG19sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj1LSzYrBpdBLV8lAGHceQn/r/jLnpRC/34C9dy9NV0=;
 b=OLBmFJ89dlbaBhmew9G3xb8kDKn07t6dVZ6/Jyfa/BfvBzj7pbnpxOKNa312RAcWEbDbBwZkrKm1mkb2vKZ3ys61+7YwcYgFhnRB4M8HsyXZWFbZdsG4k82crjo0SZkLpBKR+PAbNgK1jRpD9FThzxaA2CU06AGrbAyZPvkV1oqwSBxTk/s3lIvbbgdkSl/y6rNaFqn4cV0ocdTt8jlfvUZ6Yvrj2FNSjuvcFLY3U29NTH+VHloVdEhlcoxSYJkPuAY+MKpezJUT7+TsLOaS4nN27HvGy6Lxh5fqzc7fn111HsEdf4/FOBAUJHj9HNWvST2cZj2bdnCNVdSUpBAyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB7495.namprd11.prod.outlook.com (2603:10b6:510:289::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 09:31:43 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:31:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/2] drm/xe/mert: Rate limit VF LMTT fault debug log
Date: Tue, 21 Jul 2026 11:31:16 +0200
Message-ID: <20260721093116.4011940-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
References: <20260721093116.4011940-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9d4d28-0348-427a-b8bc-08dee70ae03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: IvtGLwEqvQH0e2vpchWEUFmlTYrD1ujdXVe8zlTfO4xhxkLA4+FqnbyveAxgIIiFPI+6wyCQGkSqxz/Lk00bCJ2LWQ5mqB5WVT8/6W0NrABzit4KXpJnhzKcnjUAWNispv+ULYcQ0hbpt45N24JY6foGDzWacU9AtUBPg19RYIrb3AvSqPTJX1aWtfKJPqCKED/LoGGsvXMqLRW8zpeg4QNXk96ORrixf/N6BD0rjHOGjge3weRMooe2OHDiturJ6ATcEDoxQgxRaWrpj+UMMHhe1aDxXEUd2Waa6zWoiOaTw070NIzKWxHQ8jU2ifkkAu7cAhhoLQeS7UA0ZCxwDkXFL8Rfqt7nd+vqsm+eJwKzgi56ZC8IIXGIGAvEAIg3Jg83dFjEEmaWJWh0lp8yYbVD+FGPled2tac+xA7GtDiSXcv379XMBeWEqizI46liay2G03ULtLzLgIvvKmD90YdnG+Tstn6COjrgdn9BCjxIzZsTeOTzaqls+W7fF/VMP3b/ak/illXGH5pxuSFjgXhoTpdmL1d1yzWtctpye+7xm5WG6914N1Ya2laZ9JBr8xi6NIdQrB+X9Q6GMOCayMo/QffuB8X9jOBzbeACN8T4sz6RFm6uT+Y2CsHfL4mgHsHpUG9784pqy0FnSc0ZzJuf6Ukrnqwy2ASSe2ARlbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZsUXQ2aksvVnVYbnJ1SmJVVWhpTSt6MTY2eHdIUDMzT0E4cEtEYkhZMFRR?=
 =?utf-8?B?bzM4eTFnWm43L055aUx0Si80K3JnZUhkQnJ5NE44ZWxQSmx5MHozd085enlZ?=
 =?utf-8?B?V2I3NXFydGhDb0VUVEl2UHgzWDlZMmtLRVJtcFhRMTN6VXRFV3ltRk1LdzIz?=
 =?utf-8?B?R1MyK0t5K0VyL1FXUnZyanBPSUZLVmQ1Ym1zMG44dUtvRVlQc0lzVVhUK3ZY?=
 =?utf-8?B?clg1ZU4vS3ZYWHRQVWs2NytXZ1llSmsvUk9EbVErUE5yZGFNcEdZT0JmVGFC?=
 =?utf-8?B?eHRYRlR1dWZrZlpLaWlQU0g4cWZ0S1cvWjRxclpiT0JrWVdrY0tpaXAzTXZI?=
 =?utf-8?B?L3J6SnIzMGV6bVZ0bUJ6bnowbFFLcnB5SFV5UXdIZkZxcEV3K2dwait1blFY?=
 =?utf-8?B?V2ZpaDBUc0w3QmF6SmExRFFIY2VOQi9mM3VtZUZqcnI3ZzFobk53ZXh6Q3Jk?=
 =?utf-8?B?RXRzRzlURXZjUjZINnBLeGgzS1psU1FJb0xZNEFUdGhyZ2tSOGlta0w1VDA0?=
 =?utf-8?B?N1hiSEp6RGdLMnEvOHlHZUFzdHN2Z0RmZzY4a0V4MmlFSzhrQW01b2s2ZTA4?=
 =?utf-8?B?Z1M1Q3hCQUxzR1NncnZsa2RGUnBjMmlkK2tzWUJQUFBwdkVHbkZSNHNOaXhR?=
 =?utf-8?B?RVJ4S3BTWVFWQXU2N083U2N0M2srbWdhWkZNN1lMR3diQWd5ZXB6NENHa0xw?=
 =?utf-8?B?OWZURzdhSTdEaDhtMzNtazIvdDBaSTlXTU9hdzdBTTFQd21lZDJKeEV4U3lF?=
 =?utf-8?B?SVQ4aUQ3bytzUkNVRm44M0ZXL2VWVkhubkU4MGxpbjFId0F1c09Va0MxdlBr?=
 =?utf-8?B?czEvemtKYnN3dXMrWFZMckJhZ3pac2JUdlE1TEdaNlMvMDlDQnZCQVZtUmg2?=
 =?utf-8?B?QmcyNXZNcmdGeE1qT2tjM2NteFUvdEMwVWxPbVJGNHUrVWw3em9sNGllZFpi?=
 =?utf-8?B?b3g1eGNNb0h3eTlaNjg5Vit2T0lDNE1lQVQ2WkxwdUlXd1JicVRtK25GcFdp?=
 =?utf-8?B?dFZnci9sOFdZa2Rqd3hEclhHOWZqZENBUVNWekJQNG50aitSdU13RE81T29h?=
 =?utf-8?B?ZEdEcVYzR3FQalBVN1VZZXRNUkUyVlBvZUh4UjlMaGtURmVocU5Db0RUQjVV?=
 =?utf-8?B?Ti93czFNOUhxdWN5ZWRHSVQrNlNYRU9SaTBFcEhsSWVIK3B4NlU1eSs2SHAy?=
 =?utf-8?B?KzFhaXFaZVJ6MmJqRUlXVEx1SVNPb3l2My81ckpLK2dqaXVFTTZ2TGZzcUZ6?=
 =?utf-8?B?Z0NwKzYvTFNiUnZQdjZWV0hvVkhsYXU2OFdnZmVJRGJ0eS9nMTl4UzJNK2VF?=
 =?utf-8?B?VHBRaWR2V2VPc1dZdUUxaEJuTE5PUThsY1RvT25jYzIzbUM4Zkk2blJ5SlY0?=
 =?utf-8?B?NGJUWFdJV1o3WEtTa281ekwvR2xlL0lidVhEMGRZWjErZWt5SVlOajdNOFA2?=
 =?utf-8?B?ZlNSZTJJYllWY1BRdHFRY09MMENnb2JLak1JaG9ZMTc4K1dhQTkzTUt6T0Jk?=
 =?utf-8?B?OFBtQ2J4UHhLQThXYmRMRDE2R0hhY2NqMnRPWWdOYnBkTmxiaE84ZElnNTRU?=
 =?utf-8?B?VndPVVdHV01RdlFMb3FSNWJ2dzc3cVI1U2NWdUhQOEVZMVYzcElMcTRQNjNn?=
 =?utf-8?B?aGFkUU1Yc3BRTHlBbXMwUkJyRlc3bGFEaXRFZHhxaHBVTjlqS1FmSmpPS1Bw?=
 =?utf-8?B?TzZSanhxcmYyNWIxUFR2bktXNXVXdDI1TlhtdEhDUWxIZnJUa2tjMUNYV2F4?=
 =?utf-8?B?bjRZTUhldHJnZU1nMWVjV1Z0OVd2dytuWEVzSjlCSHlPT2RrOHdWZFhxSDlM?=
 =?utf-8?B?OVpEb0p1NXBlc09td1p3QVkrM3hxT29MajR2blk2OG9sb01RTldESG81cloz?=
 =?utf-8?B?Y01pT1A4ZDArVDA0N2dMV0lCelByWlk1M29rRnA5bXE1UGFhaTRJMGRUeWJ0?=
 =?utf-8?B?VWRjSmtlYjNwcmtVb1VrbWFmaDlla3ZwbXdlbm1tV1pJTzE2eVIrZ3dkTVJQ?=
 =?utf-8?B?cmhOQ3Q2aWVzYnI1VUh3YjJlWDVXeGI5RWFpVm1sNnpJM1RKZkdFOGVESE85?=
 =?utf-8?B?dk1TSkhwSVgvSGZ0UzdtTVZGU1JVT3BUMFltNE9SZkUwUDRBUG1vNm1ac1A0?=
 =?utf-8?B?S2hzaVY1bmVORGF5SERIU3hlVVE1SVF5RU5oMGlVQlFRM2p1NzJERmljZXFD?=
 =?utf-8?B?aDFFV3F1Q2J6NGNNTHRNOU01UUIxRzFHbzhkd2x4QzJIcldUeDdHVGlJOS93?=
 =?utf-8?B?NnE1ZG9yZWhabVlNOWtxNzlKS0txcWZQYVFTWmpCekE0aTBPWjRSSWtqMmpG?=
 =?utf-8?B?MEFBbHBsY3k1eXFkYjNwME5MQXUwNWhOaFJMRHVNckhzU2RwUXVFcHFNNFM0?=
 =?utf-8?Q?Xl7nowzDY/lFBrWU=3D?=
X-Exchange-RoutingPolicyChecked: mmGUy/vurwiMa99IF1nggHvCVeBEq8/W5049cYz2b1hip+LYB9IOBgz0zKTUPt45c3UOmPzW9Ufa53MH234N6l2K2Aj3kSlVg/9xJ7Jsrro3pRDJtWka4qW1MesQX9Het3LbN+JBBoQ7n20tEQMvRPhcnltBNbdWmvcLEWpu8v2k0GfPYFpWrbbgo3+eHl9KFfx3jFh57Lm/PZ/hJCcqBCrZaZRXdgW/pwHjHVJmsb3clyDgGXjD0sBJMo+HOCFRHR/e1wf1H8gyo8JHctai6t3qHRX82w6cqyWNdiBYS4ayL3OfuA6IYPRLuvVqX30lCffIkV2MsJM3dCPPM0UTMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9d4d28-0348-427a-b8bc-08dee70ae03f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:31:43.2638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBm5qUzGuOTFtW64i/VC6N/3lv9wrsHpaI3LJh8Wd1RgDDJPBak9g+cVhwAK8SlAa6EGPDsJtFr/Yl+etc3WaqXqp1mQN/w8ATajtiv9wjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7495
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

A faulty or malicious VF may repeatedly trigger LMTT faults and
generate many identical CATERR debug messages.

Use xe_sriov_dbg_ratelimited() to reduce log spam while keeping
useful debug information available.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_mert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index f637df95418b..32700c19a1df 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -77,7 +77,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		xe_device_declare_wedged(xe);
 		break;
 	case CATERR_LMTT_FAULT:
-		xe_sriov_dbg(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
+		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
 		/* XXX: track/report malicious VF activity */
 		break;
 	default:
-- 
2.34.1

