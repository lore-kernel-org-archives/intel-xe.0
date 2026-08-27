Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFDFC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23EE10EFA6;
	Thu, 27 Aug 2026 10:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyjzQg5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA1310EF90
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828301; x=1819364301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aPNylGTjU9AXnu3UrY9Dqi9ujEnv+KKswiN2y3l0jvI=;
 b=iyjzQg5govecTAjU5Wjy36U8JG9roM5z0pcYB6KqXnvVJxoSzOKiua3X
 g2k+wYJMh70dqvorSt0RNB8eTLRyoVyfIgS235ureSkdDpWj2DTgI3UvN
 Nq1VmrcRxxHAVKBBw945Xc7nE5Xqnt7nJMyuhYPN9wWEVpJ7X1j5OgWB5
 VqKYaBfDKCjijDnEalN/EE6ots7CSKgg4Tks94Y6tW8sMESl4HI7+mq0S
 AYUVEkFsp33AsSoea4BMf+swQxipLpalz9VfuvNR17txzPgBDeIUIfx2F
 uvutFF5LS7PzuAuZBuwsfXoHn4mS8ppz/5ELLxz63uor2KIngu61wB1hu A==;
X-CSE-ConnectionGUID: dJ0k1bDNS5WWKQVjBCJP3g==
X-CSE-MsgGUID: bSQgbFjeTmiH1psxYn9zlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92010635"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92010635"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:21 -0700
X-CSE-ConnectionGUID: E0pX0phNRbSOQhKq++eR1A==
X-CSE-MsgGUID: HH61l2MjQfKaOVGCM2DRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="292677346"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:58:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM1fqx3j0ACGe4vXT6Os5eYnSvwUCZDxFp8oFdVVKE6ywV2NVnfVofDRIiu+Px6EUW8hR5gNUsIJVkXSf/aavdI5UX88ZfiCx2JFMGVyl7MJTmxJr84LvDmz0a5I1QnHbIymp1bzJbyPkBU4oE0mkcKPmzPCy0qoBhifI8yDNYYFltT12V0WxWnAMViMxghLc6J0Iym1fIkhqYDWcy+/8XOjM07NoNg2EPO5rfwuaGzVcfte9m9Gj4WLXxCISwmQXYS1XmesAq3KXYR7FtvBxCeL5OiGIa+rTZAMf3myup65SA0T82xWvJN54hjU7VtZ+v8l/2z49aWR459ZNYcFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9/h1tqTG9D07yT7CVsP72uCybG+YXPuf7Z0Zu9w+h4=;
 b=bcahR9MHq56q3Hp/LqRYnV4wVJAc26l+shj7Axjb7K0BG6UQEKjhUYbi0wZeafflVgrJp/9c9fatGWmDIAMBesCb5EAXy9f1NN/E9zkS9KN7arhmqA1P4acJ5STvNwm/b4rpK5hiNVKh4H9WzbUUEQ5PDRG+OTGdvTcW7u2/knJYfvG2SyebjyWgNZW8wOQhxL8XjPqz061nb1SD3aGuh6sTnTHb9VwhC/7IK0Wpn2XZ2Iy4kQBN10J7LwsK1Y03ph4oRZAiylb+TROXBNMlI42CIlFOSqT4e0OsR56G2Qo0EAODEbsIYjNUaQhEL00RkudSBccCPZVNvrkADSVfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 10:58:16 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:58:16 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v4 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Thu, 27 Aug 2026 12:57:50 +0200
Message-ID: <20260827105750.1248792-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR05CA0006.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 125fa119-aca2-434c-2e67-08df042a18ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JjdBZEhBaffWsa3YeixW1NEUG13/0wKnxCTuz/gv5uj/TDnAtKHn0o8PKFa7pZQW9TDWx0o59f2di+XqyfYNBfgXWlINyDSYiHR0y7HLNWvP8YSHLXYSCxvyt/ckip5VPpuvteT0lAAIsEfEK+v+m7bvl9yQAXISszz/tBATjCfds5wBTsRwiOqGAByKtwl6Yp6279uMI3L5MNUAy/elovuvjZ47gUDvGTBUsYGouxWvC7XHP0G6CsXwo+cIBwUuBjwvQinHh62dlnMkQmmy8kUGUfPsGAlLecamSxcxcvd1zJV+kahshJK/Np4uy3IuoN/xvcDSK32AVEjJHmFi4rS09BDOXy2unK1cbbjUzs0AbJ8oriLiDAA3C+tI4yKMRFYjIaxaAOyGuBje4sS9F8i32LDriu8m7UB3GAjDRlQM2/nH7txqmTRw1j8c5/wFzNyTCWhL7N42p4OWujvhnA/Uro8p0P//kFSYfd2em3A7ZiqngUcrc7bOakrPVL+m4xI1jhYlDJ0SXrR8FLvc9iv6wT2FdZkxxXpe5BUY8cy/LVFq/gSO0IZZ0zSlFxtPWZkPw5cKL+fpdTDEHSbYpKcFqnf2/HAcVcMdaCX6Xq8K7xXgjF6UXdw9acjU/kiKDAmkGZtvB52mXUg9xNr+KHJP/o+hXdS0xEq7tVBmH/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtqMzRVYVp4cjdINzZXZjdob2ZacytJTmZ5UnhVQWQ3YnNGZDNOOCtIeFV6?=
 =?utf-8?B?V2l4aDRxK29uVEtiWVVid21wUWZncEhncHREamVmZEIveXBSRHFsYURaakhJ?=
 =?utf-8?B?b3pyZzFwSEs5QngxOUdZZXg3ZjAxQ2kvWm5kN3ppUndSMFFqMldSdlVlY3Yz?=
 =?utf-8?B?dEhaTXczV3lkZDRZSnhtUEZwdUpnTWVtckQ1Tjc1SnJ6MWlYSE4wd25zZ25R?=
 =?utf-8?B?bE1FbFczS3RCZW1HU0FNbjVGajhUY1ZFd2FDbkxGZUVLeVlud3VYQTlnREUx?=
 =?utf-8?B?SVhVbFdENzc1SUd1a1kyQkpDSlFJNWw5N2NQWUJJaG9zRDBwRFdVMWNNYUFq?=
 =?utf-8?B?czZPSmJvZUh4TlBZQ00rbEFDSHNWZmYzZEVsV1A4Zmdxb1RZdzlQSXZOd1h2?=
 =?utf-8?B?cys1SFh6UlY5QThXdXhLVzU2STZwbithcmQxRFdUdlpCb2R0Qy8xNkw1OGNt?=
 =?utf-8?B?WGU2R1NqV2VkMEhteU92VEZVeDNZK1ZndkY0RlJoVmlHVXBJYVV1UE9hN0Vm?=
 =?utf-8?B?MVVGUjlod2NRT2hGUUZicDdSbGNGcmxTSGUwYkhUQ3pFbHRhM2FaQmRXNlFH?=
 =?utf-8?B?MFgwVldGYXE4ajU0OWppQkpmYUFxd3dlcVRKVU5oK2UrL0ZtK2RkWEdFZFpC?=
 =?utf-8?B?Um4zZ2tEdU9Ec3J6eUFCMXpYZVM0V04zajUyOUs3djdHVjlLQkREV25MbzR2?=
 =?utf-8?B?THBFVUhKWDZrY3Q0dVM5NHJ6YkxNd3JWYUtVSTA4dGRuSmc4TDRybjJ6N0M0?=
 =?utf-8?B?R1lJdnNVZkt4eTNEQW1ad3VaR3ZjNm1JNFgxdCs2SWJSQWsyU2l1dVJqTmZB?=
 =?utf-8?B?VXV2NU9UZHcxV2dFQVZubFEvanh4cnF5OWFYNDFObzhCVkNscVhqaTFUSDFB?=
 =?utf-8?B?aE10Q2JaRWVzeTdtdk1ZTndWNklLNUlJZCsyK3JPV1EzWDhHOFpmdFBGNmds?=
 =?utf-8?B?QytjcXRwVnFsREd4SG13OEEzUWF4RFNreVlQSXVZVTlxeE5TTmZoVU1hMGFF?=
 =?utf-8?B?UERUVUtxUFBENEtpMlhlMU4vRU5kOFhyMmE4b0gwemFiKzcwWWoyV3gwSTF3?=
 =?utf-8?B?YXpPRVQzRms0aHpkT1E5dW43M2lwdk1jV3BSeGl3NlNmMHBobjJoMmtxOE1j?=
 =?utf-8?B?UDFYZWFGbFdsYjRQNXFoekVyOVNOZngwRjBVbXdHK0VBZTZYeHMxVjh3alpy?=
 =?utf-8?B?dnMvRS9UK1h5YmhoOEFvdTRmOVJ1czZKeWsvazhoSVRGcHZSZ05kakNUbDhH?=
 =?utf-8?B?dGd2c0I0YnJkc2dzQjh0dmhlTnVENkdXSVNrRDY5UUUySCtNOHNKdFFOYXJm?=
 =?utf-8?B?VzR0ekRzVFNjRWFmcUw0bVdySmpWaU1rdVlNNzdoZ2dBbWw3ZzluTDgvbVVr?=
 =?utf-8?B?SjBwNjBzL2ZUa1RyV09QTXJGdmUrQ0ExNU00NTAyMHc5SUl5UEpPaFJQWFFL?=
 =?utf-8?B?K1R1dUdYM3dKL3F0VldUUXFET0tBUTZKelJZR0Y0Z2J0TFNjeGIxYTZFMExv?=
 =?utf-8?B?M2ZxK1ZpVzJqa3poYnkzQXNZY3AzS0N6TXd1WDhrS014RDZzT2NEWXlHVWQ4?=
 =?utf-8?B?ZTMvUFIwMm5GUCtrenJLRXFyTVM2Y1Z4bFdIbjhzdXJWbnk5QnVwdERJWmxI?=
 =?utf-8?B?TGZsc2xSUVlwU3ROa0FCWTkvOGZFb1lIVUtyK09LbUl3S1RtTldNRi9NYjA2?=
 =?utf-8?B?djZzOHFVRVJrRVVtbjU3V0xVTVJpNEpPNUxUNGozVmhNTEtQTFh5Z1h6ajJN?=
 =?utf-8?B?UmI4MFdIa1lNRHluVStuaFVQVE10Q2treHZMbE4xTXlVTE1NeEFRRTM0UkJl?=
 =?utf-8?B?dVJkSkNPTE9HTG9qeTVXMkNzNUttVXNCNGZhREUwaXQ3ZURtQVpNUTE5TjJm?=
 =?utf-8?B?QVl2MkxKcG5JZW1STXZiUjh5Nk1xRTNMYzlyUFExRXdDU2NJRWdJNmZXNDNQ?=
 =?utf-8?B?dzR1QzVpWnZudVozRU5IdngzMHEyKy9GWVhXeXJKdHNORS9vQXNZVG1aQVRi?=
 =?utf-8?B?RDlYeHd6dGNLVk9XMVhEYlhLMVFRcXJwYXVQLzZZVExEZmZDdy9leUJVRS9q?=
 =?utf-8?B?cjZwb1RJbjVIaWVnbmRERWFsYTF6cXlPcXVCUFg0NEhqYjRTWWVvYjlUUi9I?=
 =?utf-8?B?SGI3N1FmOTRVUzg3eDJFZENmZWZpYWRoaHcxNXlYK2lIK1FIcUcvVVpqREll?=
 =?utf-8?B?cHZrS3QxV0lIdmNJNlo1Nmh5U1VQdklXQlFrejBCSWQxV05vRHRJZWFBREZX?=
 =?utf-8?B?ejBIS3JXVjZwSlFQMjg4VkFOMmQ3dGZlb0NBVXVTbDFZUk1nZDlFNFVkNmwz?=
 =?utf-8?B?bS8zVi91akpCWlZRSWxVM1dVZGExcnVXODgvcE9IMzkyQVlpZytOeXZMSE91?=
 =?utf-8?Q?V6B6Bv0PD8mzV+lM=3D?=
X-Exchange-RoutingPolicyChecked: otQAyp2Jxcj1HOaRIaSwz/ecEIlGQYdgK10J1Gc0dr1PmDtWvkFSesGqDyv0dA6j/9l0P/xOrolQftjzNxSFaFLs1HeRQQCzaWypCAcBSdDn37eNKOcnR6Ahh3jcsimx1hiuKnt+tOTP4SE3ojoM88zFVjDsva4l6se/AC9TDlH7dGxyt2TCRvbI4GWdmQW9XwcxVlR0NWY1EQuYRBYHKv7AWmkaYmjaC5WtzQED6thJgLonpM0eXoy+w77wzjiJyjm+5xVnA1YmOtvLjGnM+/QOGVorOIb3HiHm9BJfT5ytGrpeSgv2jovF0aCJZhsTXdL4iZdJv80JRCOAb9jpyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 125fa119-aca2-434c-2e67-08df042a18ac
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:58:16.0621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZQD5qA3JA4ScHziqZF0naap0zrTnSnSwmdgViRwr1kZx/Bh2pM6rAtdTVCLp4q31pxNiLzNrFuEFwviko8z38uyYWg/3PVOgwS++riaJ8k=
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

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 22 +++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 25 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30..4d72411cd570 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 = 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
 
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
+	idm = &gt->uc.guc.submission_state.idm;
+	mutex_init(&gt->uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 9445e5f32fe8..bd55617295fd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	unsigned int spare = pf_get_spare_ctxs(gt);
 
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
 
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1173,20 +1173,28 @@ static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm),
+				  SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm) /
+								num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(idm);
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
+	u32 fair;
 	int ret;
 
+	if (max_shareable <= spare)
+		return 0;
+
+	fair = (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 5675325665fb..20ce16bda973 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -124,9 +124,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &xe_guc_id_mgr to initialize
  *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
  * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -287,37 +291,6 @@ static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigne
 	return id;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
-				    unsigned int retain)
-{
-	unsigned int total = idm_total(idm);
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (retain) {
-		unsigned int used = bitmap_weight(idm->bitmap, total);
-
-		if (used + count + retain > total)
-			return -EDQUOT;
-
-		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
-	} else {
-		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
-	}
-
-	if (id >= total)
-		return -ENOSPC;
-
-	bitmap_set(idm->bitmap, id, count);
-
-	return id;
-}
-
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
@@ -475,25 +448,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
-			  unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	guard(mutex)(idm_mutex(idm));
-	ret = idm_reserve_chunk_locked(idm, count, retain);
-
-	return ret;
-}
-
 /**
  * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index ed9970829a93..844d68440b0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 					unsigned int count);
-- 
2.34.1

