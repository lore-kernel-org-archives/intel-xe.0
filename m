Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3135DC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DCF10E6E5;
	Mon, 17 Aug 2026 09:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ki5JaObc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E770A10E3E6
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786957844; x=1818493844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZsVpDSYxcOCz8XArxeG/68vl9MhvXP3lcGpKczCw5M4=;
 b=ki5JaObcOx8Fea8o346UJjzfw9hwiRblTCNP3musk//FSgtzKZGH5qga
 5V4jiBJvUkUFh+Y/AG/wGrjMgvuN3gW4GpehB05wb/lwn+CJ+bUbSR47Z
 n4/WHjk9lh6gQuorjudkVzPf9f9z1V9O1nGfi8iqpG/KFFJ72qTC6A66J
 Z2nZutU1wxMteQfF0i4XZqrbAByYgYvS+YfWnYCxQYvYNJ+IcuXY7CQBI
 LkukxYCMyrf0fdHRcbSBDSl1ibwkjDPwQwM5rLnzgq6/x10XpqAye+2HH
 fuLkQ4zi0tqfUzAnz6tZR2LOZq2qd5wsbP5TInK6FQb8y2sMZYjX5no9D w==;
X-CSE-ConnectionGUID: cNoOc3ogRIm7zadpjMbWyg==
X-CSE-MsgGUID: x8yzRGf7T6iR/AW6L0hF2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104962870"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104962870"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:44 -0700
X-CSE-ConnectionGUID: ZIuYCmzYSG+l4Pw6YYkH6Q==
X-CSE-MsgGUID: FDo2xXWJRG+4snrVMQj0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268703712"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:10:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLkyA4Sk1SmAKDzhyWoVb07pQsv3fuvhvJOtxCZ4CKaKoaFLSSEKEevmOTu7QTODf11QjbrVW3IqvXrjBwgw2ICaV2Lk4Yw6qPm6KNfQOkGv7F/52JYq/w9LyvfsIPqC0DJmhJSIpWDWmk6YSRSz286Z3nZjDiYDwfZuiJC7T5GgFiRcUAgbHtu0zl49zcsxnxUIOy3vNW5m/XBJyxOtrxiqLuUSPbhC2kXvnWcOE8VSKndU641ZQmVBN0mzLlM+SVbvg08QY1T1N9Rr3i7ZjQX2fzPQggGUbAS04q61osCrNegpFX3AuPKXtu6b9hscwfuqDbtJLdaZNTjOskVnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yxh/GGe0FgEQEspq8xbxa5iLc4jQ0ciIIcamQVxBm4s=;
 b=amfNYLk0R1xi69lv0DQL/wvk4fgazIYZu/L/4SUPj+7uduP6N2HfMFfZmpUh7hP+lErMqAy3BQm3ftvx26blKTOAYpQIKvLzUBS8XPF6dALB6Yi+eY0XnOLcD+RqHPwZ1NFroYq7kQc5sTKs/qPmbKWfVC7QoIxEkTSffV+niqs2FLeEuLm7/4USNzDjjitgP1zsrlmXUzok+NUKdRIxc94YSkHQXWYX/2dQMz9wux+NKbJpHdqWkASht+iuicKCdpI3U3Zt2Sq9vm/OJQ7zbYH0RqKojPkcLyOQdc8vBNrrWlAmBJyambRCISi1V4FIVXRvwmmIOLaTrLqw3It3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:10:31 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:10:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Mon, 17 Aug 2026 11:10:10 +0200
Message-ID: <20260817091013.280173-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817091013.280173-1-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008A2.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::658) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: e65de30d-f506-42f3-c9a9-08defc3f6302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rxRex9HFOMXnx7nvupGBkn65N9SzR/IcwscemJIlefAxbuqAN4G/w0UnA+WVNCo+qgB2SQfI+pgqlb2kAvlDGhl6Z7tguRnzv1RhtPx7wcKarendweRD6w0BHu1GlmqOJsGCf7H/w+DBwoRTsyF7s1S483ZDYJxs6DPpv7DqcbAKggt3TEe6XNEF4bHQFEbFPQrJfcD7hQVo/epJZ52LW0q0rn5rCxiISZuODdH7/g/h8kO0p2KtpPpGKunwHU70N6QrKy+mgw70dVNA1xNFI5D6abMpB23IHEmfbcOnReMGmigu6AXEuxzMy6jLbOWlnIcsZCrPgvSovJC5hosZGFykHt7Kv6fJnEjiH7oWSoBk7PPoedbp7juf34vFjZ/267rGLtBVaUSME4sJMk4j2mVAHcDfpxk2TOSxcLSDDINRBjDrjh4IoUITWBBlnMHl6ehUrrs0yemE6NkYJpHNkZgv8ml37rZAtvIurCFN7HQ+cjPInapfccvWA+ddW7nuziHQSyME9AAakgKWO4wOqpfXWhlfbCz2ZoEbPr5H1fzBfbGB+GnJLOEguslEqgF9xSr6PwyO8i3Yl+B7eZeyX/Vb1vjgy/2T2zq6dQqHU9hbiy8X9fRXbx06ofWiEZqYAb5NyQkNgCzbjRA33QbpwLPWILdjFMkEqEIMU8WT9XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUowaUxrMXlMSE1OdUk2YlozWmxNZEk2TFNwWCtOSDNBQmE4QUg2YTBwQ1Bv?=
 =?utf-8?B?SGFDMDhDVkhHejhmN0ZaaHc5ZWdldGd0Nk50dWJIRWc2bitISVc1K3o3K1kw?=
 =?utf-8?B?c0tVV3BITGlSR1YrNm1PSmxMd0d5dDNwN2l2ZnRlbjF3bDZLQVEvaUYyK01y?=
 =?utf-8?B?NmFXQWlCMk9za3Y3MHRIM2dneS9pNmR3RW1nZlhtYnIxd0tPSGRRRDZ6N2pF?=
 =?utf-8?B?d2lkMSt6M0VOemNIbXNjcFAwR1lEUDlKNmdEcjlabE56YWxTSEhVbXhIOEFn?=
 =?utf-8?B?aXpnOWJtMEVwd3VCSnRuMytvVVdFdTBNQmppd2JKSllMNURCczlkbVgwQ2Ro?=
 =?utf-8?B?clpWRVVBdkVJMDloRjZXeGRQUXlCV0dKcW1oNTlJMXlERjdzdVdMOXlBaERw?=
 =?utf-8?B?VnJqWTF2QXgyc3ZFUVhxR05NMndkNnM2RUswdzFManUzRTA0VWF4SEdaaGFt?=
 =?utf-8?B?b2JuOW11Z08vZjRIOWdNV285VkRWbUJJdXo2YzRuTXplbUsrNXM5VlVIaWl3?=
 =?utf-8?B?eHJpeHBHUkJocldCcmxJOWU4NmRzZWplUkRVcGZjRFpQSEplYXZpNzhra1ZG?=
 =?utf-8?B?L3ptZ2ZkWlJyQmdUQXlYZlFCN2NXaTdncnpHL2pINVJBYno3b2pkRktNTmZr?=
 =?utf-8?B?SlVSejFja1dlVFgrZUNLTW80NWczZnVNM0NXTUU4NE9hNGlsOFVZOTNpK1Jk?=
 =?utf-8?B?cUlEWGZhZUVPbnQ1eEViSVVncGVuL2pzbkRYK3N1Miszamh3N1hvOWllY215?=
 =?utf-8?B?NmhNQVZRWWNyQmp0Wktab0YzM0NLVU80U25XRHRRSkNxSmZuejhBNVBkU3Vp?=
 =?utf-8?B?MktJSzNxZEJKSDNjOCtjd2RaL2w3L2xLMTBaeER0NnlKNXBsY2NUS0lkeHU1?=
 =?utf-8?B?bFdvaTJVUE9NOXhzS01rSk1haStpK1JFcEwvdEtGRzdCQnBUcnZjcjY4SUFE?=
 =?utf-8?B?TUNaYU5WejlJa2Y4YUZxVHFYTS9BTXR5c29xeWVmNk9ZdHpud2ZlNUFiZFJr?=
 =?utf-8?B?ZmlMOVJKazhxZWpFUEs1a1ZRZWJrNVpLMGFvU3dueXVZQXY1aUpBUGZOd3R0?=
 =?utf-8?B?Y1hSMThoY2FkTXJvbjZ5Wm10bENmQ2pBMnplNFd6ZWVPaU90Y1lvZzRMTTJp?=
 =?utf-8?B?S09kUUcxM3IzV00zNDNOWW1ac2lwVGs0QmFaTi92dkFmSkgzV0YzazFTenJ4?=
 =?utf-8?B?U0o3cVo2UGhjN2VvRFZMOXhxN0REMzJCRkxQMGMrQjRha1Y3OEI4MmpWY1JV?=
 =?utf-8?B?QjBsRml6cVJGNi9jRDVBV1BORjBxVmZhRzh0UkJjeVNXbGc4ZWFHaXkrS3Yr?=
 =?utf-8?B?NmhZOVBkdW5jaHMvS044clpBMDFSbFAzczNUbkZwSXA4ZWoyeWMrMjBQMlZR?=
 =?utf-8?B?Sjh3UDlDVWE4VFEvME1JdnZQVTkyV090VlNjVlFlVmUwS1VZcFpRS3ZiTlo1?=
 =?utf-8?B?dzdtNVBqRWhKSGNkczEzTnJkRzZsVktjSGptWjk3N3RUVGhXNDR4REFpQ1FG?=
 =?utf-8?B?Q0N3NTk3ZUZqSWtxOFRCUmZBTlppOFg4Zkx4bUh4MExPTERqQ0JoWkxKb1Z2?=
 =?utf-8?B?aVdoZnZ1R0VPYmxLSnNSb296SmY2VlNjMzd4emNXWmk5R3VZdjc4MTZxOGhH?=
 =?utf-8?B?TkRFY0ZxL0ZHamhkMFhIUkdvQkdYK2puS3ZqZWNaV3I1cjZYcG5FNkhHTkdX?=
 =?utf-8?B?VFZtM043MXVtMXJlUityT09vckhDOVVmb2xOUVVmMjRKVXpqYXNRVXBoZEFO?=
 =?utf-8?B?K0Z2ZFpxbFJoak5XVk91QWdvYWZpMlp5NnVqK3pMZ2NGOTN1Z3J0S1VTZkFy?=
 =?utf-8?B?a1JiRFJRenJRM205T04yQzlmanNlZXFvK1BRUHE2Z1dTUS8yTS90ekZMRHJG?=
 =?utf-8?B?N3IzWXF1TzJ3OVU1YWN3bjNhOVlFM0lzSmZGb1JoYkZybUVoSkV0c0k4bXNi?=
 =?utf-8?B?SDVBU3BLSnFNQVRuOFRZd0VuVktQVG9adWdlZGV4aVIzTktuSWFQSi9UWWEx?=
 =?utf-8?B?U1Fkc2trUnZSRTNpUkJaVTNFbm5WUWsyK2N5SE5kS0VXZEdCaTQyV3lBNlNQ?=
 =?utf-8?B?R050VHJCRDJQa0VEd0hGRlZ0a255c0J5MkhYY3pRRXFwR3ZCSDh0YnI5NUZS?=
 =?utf-8?B?a3BvS1dzTGxNUUg0Qm82R2tQcWE3ZCtDYVo0ZEhQN2U4Qisxak55b0lnTE5y?=
 =?utf-8?B?dzBNdEhKN1YzdGx2ZGUyMmRkK09oOFYzSUlPL2MrM2VWVy9BMzhtR200VHIy?=
 =?utf-8?B?MFNoR0xtWG5aYkRlUEl2RCtUQldMQmszeUtvWmkrQUFiM28rTGdhNk9MT3pz?=
 =?utf-8?B?dW1VakpPQ2d3elVHM2pCR0J0RTllTEpkQzJ2RThIeUJKNC9KR2lmMnB1cm14?=
 =?utf-8?Q?P0QOm94W6lL1/oa8=3D?=
X-Exchange-RoutingPolicyChecked: WoQUAN6ymj8XpxCjh/Rf9ZS3wvRi6ydIoBTI6X+SeUu/Bap93ZZEyOjPlP+Qnbbb/VIYpT804nIVRRIhTv7/oFemDoSr2N0YZCxBjbqKLOZgGGvsXBKVt7EJucTUNLQ3grkYKUQVa9pYFAWTTE7uatfwtrdw4V974GcJiclMnpYV6abmNOm1TVsyJd6Vc0/NaNxRod7G4FKh1ePrHRuC5YVEByxwA4K7mH5u33/PWbSJ3tB4CiRqS+sEKa0esP62Dqs4u0gNn9QLaLQY900BmKk9pOF3sw5sP/ZPYSsiY5UhRSwPnIXd3gtUXKo4gYJ6TCPkJT71bn7x04e9Ivwnkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e65de30d-f506-42f3-c9a9-08defc3f6302
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:10:31.1064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoDoxF58LtPWhtazwt0Itu6yjj8yYzlIXnJUdFN2FWeWi79TFRuTS/QzP0HN/0Lc/w6lq623b7h+yqWJS8w5Gvfe2ZoKb94HSVGZAiz7BN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocate for legacy (Sashiko).
v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  52 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 448 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  18 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 438 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..103ea82d278e 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
+		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n);
 		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_used_total(idm));
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -78,21 +78,25 @@ static void check_quota(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total - 1; n++) {
+	for (n = 0; n < idm_total(idm) - 1; n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
+		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm_total(idm)), -EDQUOT);
+		KUNIT_EXPECT_EQ(test,
+				idm_reserve_chunk_locked(idm, 1, idm_total(idm) - n),
+				-EDQUOT);
+		KUNIT_EXPECT_EQ(test,
+				idm_reserve_chunk_locked(idm, idm_total(idm) - n, 1),
+				-EDQUOT);
 		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
 	}
 	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -102,14 +106,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
 		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..f4725af59fc5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_shareable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670b..08e72af2735f 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,41 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
+static unsigned int idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +76,60 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX)
+		return -ERANGE;
+	if (shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, usable <= GUC_ID_MAX);
+	idm_assert(idm, shareable <= GUC_ID_MAX);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -75,12 +145,6 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
 	else if (limit > GUC_ID_MAX)
@@ -88,45 +152,174 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	else if (!limit)
 		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, IS_SRIOV_PF(idm_to_xe(idm)) ? limit : 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	unsigned int found = range_end;
+	unsigned int rs, re;
+
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
+
+		if (start >= end)
+			continue;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
+{
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->shareable)
+		return -ENODATA;
+
+	if (shareable_start < idm->usable) {
+		/*
+		 * Spare is meaningful only for IDs that are shared between usable and
+		 * shareable pools. For non-overlapping pools, shareable reservations do
+		 * not reduce PF usable capacity, so there is nothing to retain.
+		 */
+		if (spare) {
+			unsigned int used_overlap = bitmap_weight(idm->bitmap, idm->usable) -
+						    bitmap_weight(idm->bitmap, shareable_start);
+			unsigned int shared_tail = total - idm->usable;
+			unsigned int used_tail = bitmap_weight(idm->bitmap, total) -
+						 bitmap_weight(idm->bitmap, idm->usable);
+			unsigned int free_tail = shared_tail - used_tail;
+			unsigned int need_overlap = count > free_tail ? count - free_tail : 0;
+			unsigned int overlap = idm->usable - shareable_start;
+
+			if (used_overlap + need_overlap + spare > overlap)
+				return -EDQUOT;
+		}
+
+		/* For overlapping pools, prefer allocating from the end. */
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+		if (id >= total)
+			return -ENOSPC;
+	} else {
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+		if (id + count > total)
+			return -ENOSPC;
+		if (id < shareable_start)
+			return -ENOSPC;
+	}
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
+				     unsigned int start, unsigned int count)
+{
+	idm_assert(idm, count);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		unsigned int n;
+
+		for (n = 0; n < count; n++)
+			idm_assert(idm, test_bit(start + n, idm->bitmap));
+	}
+	bitmap_clear(idm->bitmap, start, count);
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int retain)
 {
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!idm_total(idm))
 		return -ENODATA;
 
 	if (retain) {
@@ -134,45 +327,58 @@ static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
 		 * For IDs reservations (used on PF for VFs) we want to make
 		 * sure there will be at least 'retain' available for the PF
 		 */
-		if (idm->used + count + retain > idm->total)
+		if (idm_used_total(idm) + count + retain > idm_total(idm))
 			return -EDQUOT;
 		/*
 		 * ... and we want to reserve highest IDs close to the end.
 		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, idm_total(idm), count);
 	} else {
 		/*
 		 * For regular IDs reservations (used by submission code)
 		 * we start searching from the lower range of IDs.
 		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, idm_total(idm), 0, count, 0);
 	}
-	if (id >= idm->total)
+	if (id >= idm_total(idm))
 		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
 
-static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
-				     unsigned int start, unsigned int count)
+/**
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ *
+ * This function is dedicated for the use by the GuC submission code,
+ * where submission lock is already taken.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int n;
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
 
-		for (n = 0; n < count; n++)
-			idm_assert(idm, test_bit(start + n, idm->bitmap));
-	}
-	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ * @spare: number of shareable IDs to keep available for the PF
+ *
+ * This function is dedicated for the use by the PF driver, which expects that
+ * reserved range of IDs will be contiguous. The function expects that the caller
+ * has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -205,6 +411,75 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 	return idm_release_chunk_locked(idm, id, count);
 }
 
+/**
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * This function is dedicated for the use by the GuC submission code,
+ * where submission lock is already taken.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve a range of GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of GuC context IDs to reserve (can't be 0)
+ * @spare: number of shareable IDs to keep available for the PF
+ *
+ * This function is dedicated for the use by the PF driver which expects that
+ * reserved range of IDs will be contiguous.
+ *
+ * Return: starting ID of the allocated GuC context ID range or
+ *         a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
 /**
  * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
  * @idm: the &xe_guc_id_mgr
@@ -242,24 +517,78 @@ int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +599,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7..b2b4c1212a8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -11,11 +11,27 @@ struct xe_guc_id_mgr;
 
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 3dbcb1331690..6da43691e54c 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

