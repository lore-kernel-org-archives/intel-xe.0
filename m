Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A39EC44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE2810E6B7;
	Mon, 20 Jul 2026 17:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqLfY+f8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9AD10E9FC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784568857; x=1816104857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+uGBLXb2mFCPE84ihnZIw3nakLPAUCWvXqw7dvAvVEA=;
 b=dqLfY+f8l7TFCO50bNrEgs5scfa2YVX81QtCd8QbELQIQ4puMV5vfRKL
 8mjtqMyZm+HKmL7kv6jCa6ZU1s4Pcj/ntp1/jTxTrfEeXQ4AlA3uiU6Yo
 REsb05nNu0486/msbaKWKlR72Jq59sNPNrsc1brEwT+gXB4yDVeD8Fq6k
 YY3UWoyztWbbLeZWIT9T0q5Jzh9/7aUN4c3Dx/0y5jYzrYnkOWmDG9OB2
 M6B7ajCIJVFafQS/TKtZrzG5UQybnfiZSNI8IVpWtZ77+HP1VKBdd0MOx
 LZ6Aw9A8RtP4GoqGzJZInhAgBGFeQNJ67rvP845OW5ipjRliqi378bWaJ Q==;
X-CSE-ConnectionGUID: ZSv/cPpNTsuUE+phIf0XQQ==
X-CSE-MsgGUID: NUxWY8oZREed71lpb8WeUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72690534"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="72690534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:17 -0700
X-CSE-ConnectionGUID: 0/kX8qnbRFqMnXd8aBNx9w==
X-CSE-MsgGUID: UGp+P9bLRPm5pssTV/Mq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="257574119"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 10:34:16 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM7jpUoR6bkGr7YyAf72iZj9D+G5T8PLiN28Avl7x0wchv1H2txLT6AbOX3HW+lzrJ/yG8itKjMZE6dOtx8A67vjQGwYmg8UcIIOdpc5dAJ+vX0kj71Zl9qzEog/HE9FVKO1UM0VY2c9dG1cykC6UMQ16bcIdfqt5CDUdjdkCw+9ZG9g0I0ESiDQBl8QYlYCepkiEQ9LmahBPRbM8CfMuP0c3pCafa0uSU/OmC/facgsKljbrlZZ0vC25vLrHBlfo7NG8hVNm2KlmPphSPtDKN+tIbqWgALSmjo8AUBXYwU5TsqpUkC6XkB5OikIObGqAK/acryzjzWN3Uq6s1Eqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22HoZRwf912N/Jjxvfzr+wk6Y2tlEtFsKEBZklIH4zk=;
 b=XrucvZWoIPRZ41LQexWPqnDwbxY+HKpDbve3velv/ffav1PBnTug0snzAB0E27mvkV75EqupzkZROHk6v/ErB8HEDjuk3EPLQSPhEt1gB0qdHxrGpmiIWGATm8gZzEU/pCoX76ZivkY3DPpRIoHRUcpq6YwhjJuN/kM1FG53eia3tjqqRXvinT77PzqckQd30iuQhWBXvUMYDFmbKtMmnrAcjrRHEn5ZjizD+aG8XFMh3U4rqhU59zG6lfAgfVYqQjDhBxEW5RnG9af4bAbyoqbzQN7pm9FRQna2KaNRqza/LxBfXtXWzAyXpXOwshE4jEPyKfSHsMiUzdzI2MOJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:34:13 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:34:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Mon, 20 Jul 2026 19:32:44 +0200
Message-ID: <20260720173244.3935848-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
References: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d98df3-3dbd-47c4-cb61-08dee6851d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: g56OhyopNxsC85/hXBL3VqeyvfP6NjbBeuYGPFkc+ybUHdzYO+o6ZptySxpFS4uoWahPpzhHk/IYZGX9CSo3N6PyIa76d6z2mptuCTTy+kJ2V9my3SvBrSL5+wQb9PcBG5VZKn32/8bU3h8oKL6KGEdXT9t2vhYmNI95jqbN2ecSidR7QMh3I7vUugwYwdKIoTH7tKdyQca6ROxVt/ZqspJIxHwUijMUdX9pltaIYDwCw9YXq8W0yibdcwI31LOlakKT8IKncpmqaRWQ2ytraSFkOHBcEH1SXV/1ntuHKimbriNxOxgm/3Ntlu70dqTziBWwZebw8352kt2tHTOIjbejuJZI2pD26LvVC6hDuo4LtDWngiTNDu1iNvLhCwHvRWq2dpn7VxIQoeEEL9idn1U8WefG4EuhRndMSBC0EQAjsREFR5RyzyOmRLU9VUVlQB3WMBdYkh/PJOdv2A/yXYtt73kZMa+v+IMpPIOk6ddIdW9hq0kOsEDy52vY0UYm8AH70M0DkP1v1UJ0l+feccC5beZAbOxcVRM94yFDEEHE4tCJ+qRnY1pPL28dJeJziZi9E7bltoa4zGLDeGsC+YCpGiiCBFZQ9pNRv+JCGKj21qNM92G6OLW/yNASIZknVdpYc+jSufx8JTE/p7PWdS/cawj/OVJ+Lls/F9Jxx0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STM3bXJZYTdSNVhMM0FBeGorZ1h1ZmxQcXh2SDNBOU9DWWNvM3BFc3BLemZW?=
 =?utf-8?B?WCt2ZzlGdlVDWE5FM3BHQUJ5ZGdnNVp4VUhtbFRIanljTVA1eU5YZ010MFdH?=
 =?utf-8?B?WmtldnJUOVk1WWZDRkdqemVhdG13ZTdQbG05c2FhMjhza0YwVjNKeno5S0Y3?=
 =?utf-8?B?Tmc2S0ZTaktGaGM1ZExxNENUM3Z4cjdkTjlyMC9KNWxXUkJ0Z09ocUkwYWVB?=
 =?utf-8?B?TWYreER0aDQ5dmJLQWF0b3hEN1Z5MHJsdXVES2JqZVFqbWxub29MOXVRMERM?=
 =?utf-8?B?d1UrSFRzenZZSjR0L2Z4K2JScERBbmxqZjJaL1YvRXJnbnpXWUtjTVJwSjV0?=
 =?utf-8?B?cXZSSnREQTlEVTJLdzFJSFhiN2VBMFVJaU8vZFR0TjByUCtxd3FKdytPNklH?=
 =?utf-8?B?d3QvNnVyUjhGalM4TXArUHVNbWx5MWlrYzRoQ2daV0xtTnFyVENjQUllQUhO?=
 =?utf-8?B?YTdPOHgvdU95bTlOQ0NHYjNwWFllamlwUGlWMUNLOHZpZEQyTUJ2QldENHEr?=
 =?utf-8?B?YXNEK0hjbVVjM3hta1hQUUZPL09xSTJqeGk3VlR1TDhsM3pCVUtjNHN3V0dt?=
 =?utf-8?B?NzN4QzF5czRkM05mWHBaTVgyV29sNFF5d0hxTUs5UzRSRlhnb0hGK2tnbmdG?=
 =?utf-8?B?bkw2OEE5ZTBWbTVhRTFYR0U2UHFMQVVoVjlTUThGaUphVnhxM2JHa1duTjRZ?=
 =?utf-8?B?ZGJYUkZHTzRZK3M2b1B1TlZuUVVDU2tTbW9DOHVVcnh3RXZmK0dUbjVoM1hO?=
 =?utf-8?B?MkVhMmdaU3N0c3Bsbm80cmFlU3gwTWc1OGo2Qk5KcExpL0QzQkQxcUIrYkxq?=
 =?utf-8?B?QkJkQW1CRCtqT0p2MmRFbXp6MjhkRzdGOFpScTlpdXVvWTVDSVNSOWVKQnAw?=
 =?utf-8?B?RFJHdWZvTllva2dLVHRSV1c4VnVqK3VraExMNHJ0NFp5U3dobEc5VWlQUW4w?=
 =?utf-8?B?QTlBTmxiRnBtVE9pa0JKa3pTcWtlaGlCNjNHYXRQalRpbERnV1RxN0VBUTVy?=
 =?utf-8?B?ZTNxbXVIdDQ4QThpd3dGWWtNdmxLZ3hrclFEUm1KdWhoYXVKN2phZmphZ2Nx?=
 =?utf-8?B?R0dOa3NJYjFCZmJIUzBhazVEZTNzNjFCa2JxVlBoTDgybnlXQU9ySTFjQmVV?=
 =?utf-8?B?MDVkYnZ6Ky90TFF4RDBGUDVjQXFaSTZuK3hkbVJRSUE0MHRNQ0Q0eFU1SkpW?=
 =?utf-8?B?OS9Xek9kenhjNGdKT0I3YWgyWlQyZTBLN3BEL0JnY1JCV2dzVGtFdjNrSFQ4?=
 =?utf-8?B?Y21LZElhUkdKTG9pb2pqdGJpMmp4MW1TS2NKY25uRWZTWGR1RUFkWjVxN20x?=
 =?utf-8?B?TVBTUkljMDlwRWVGUTgrcU1GUnlyZFJtOGlXME1yUzdURXNaL21DYUszOG9z?=
 =?utf-8?B?S1RQamdYMkhVQXNZM2RWTWREL251QVhWc3YzMHJsS1BkV2xvZHBRNHlVMTRX?=
 =?utf-8?B?ZDhuS3piL3kxeVpGUHRkUjlpejVFdWR0OVNBcWlvZVVhOVpZUGtZcnpNU1FB?=
 =?utf-8?B?Zy9RNEpZVG9mNk8yUU5GYmpyK1F2d2JsYURSVjRhT2NTQnhBdDJSSFZ3MEo2?=
 =?utf-8?B?YWZmTm9HMUw3ckY5dnhuZzAxdEd6T0hjYThGZjltWlh2Nk5zL1B3L242cEVq?=
 =?utf-8?B?c3dxY0V3SG1oalJWaTVZSzZpbkhtdDZPWG42Y3JPcW5hVXJsRHlkNUlucGdG?=
 =?utf-8?B?VytuTjVVRjlkRXFnZFZhMW5tTWNWWkd3aEJzOFVTUHJWd01uQ0hGNG1zZUJi?=
 =?utf-8?B?dTZhWFdBM1RCUE8xeG1JYWs3SEVsNkNDazZVU2NGa01JeWFyZlkyaTdFUW1p?=
 =?utf-8?B?Y2VFQnVRQ0xROXNoN2UyK0o0UGdzb1BOVWNzSFJTNEhSbWhuTlorTFMwS29Z?=
 =?utf-8?B?bEZ6V3ZFQ3hGV004S3I0WFo2U0x4YXFPemFKQk1RaTIvbG8xd2NwdlFtVnVG?=
 =?utf-8?B?QmpZTGtQZ1crTUdSTDAvV1FTSlZ0eHVNY0kvd0F4ek1QUjNxeFphOUhEWDhC?=
 =?utf-8?B?VGlqakg5RU9WbXpqR3Y1ZE9Xdld6Ylc1bEdSNFJRUFlmekw4SVNYNUt5ZkdC?=
 =?utf-8?B?VkFqalFTQ0IxcGRJbHdjYzREWFJmb1NTODRlc2s0M29SeWF1U1dGL2dTQVht?=
 =?utf-8?B?TEJXUGhwdWRqaEJtUjg0MEl3U0RwY09zMzZQQjlrU3RYRWdXTWZsakt1cmc4?=
 =?utf-8?B?L1Bvc1ZLTXlpemJQUnV6R1ZHNkhFMGp0c21zaWxoK3BNSDRsS2xQK1ZMYWMy?=
 =?utf-8?B?aW1GUW91U3pEY2JCQisyczFkTjVVQ3o2UFVzUncvRVFMbTQ0cFFwQ29uNVpz?=
 =?utf-8?B?QUFwMEVpVzIyZzJUOXN3Ky9pRlFLZnRmNVIzaHJqN3YwTS90VmVILzRBNG9G?=
 =?utf-8?Q?BcZIOYwyeVKEim5Y=3D?=
X-Exchange-RoutingPolicyChecked: AAeO4L1IMuljtrW/VPZsSAhFsTL6IGEh4NAWCMtoshQ+y6xd7JIblaqcEyI7sGXg6NF9v8k21NSYb//rv+BHM8yB09+Mmt14UcRthy0EOLXTVlhmpL86loPF5l/FqaTGSjffArczJtpvV0mmDtoC035+x3fcyUpH2twREmkfEmzMPBb4LbSSU2qm/cNsnnRObKFMobyBESYfTk2PjXaqzuPPjlwFS5bc+hpYzeO/gY7yXfNzz/su6ai8SZTRkI/0m1RdI7ElNhBydPFLy0jVKJmh5hceMKssfjkmRh6A+twtx4G9fnbYgdHuAB7pSYJ3qHgwnJUuov+i65A+ydg7Hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d98df3-3dbd-47c4-cb61-08dee6851d8b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:34:13.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4UQr37zwWR6Royyy/gyP1Cx2sfZbG3MS0MF18sfmmHQ6DoPIHRwx2LDkq0o/aUIKaTbvPQhDfC5BVArDPSvxb4/+2DKlB2z9QySpxdcnVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 36 ++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 14 +++--
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 58 -------------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  1 -
 5 files changed, 37 insertions(+), 77 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 88e656d4e462..b0b24c1ca5f0 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -59,7 +59,7 @@ static void no_init(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
 
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
 }
 
 static void init_fini(struct kunit *test)
@@ -127,6 +127,13 @@ static void check_init_shared(struct kunit *test)
 }
 #endif
 
+static unsigned int idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -153,26 +160,31 @@ static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
+	unsigned int max;
 
-	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 2));
+	max = xe_guc_id_mgr_max_shareable(idm);
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm_total(idm) - 1; n++) {
+	for (n = 0; n < max - 1; n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm_total(idm)), -EDQUOT);
+		KUNIT_EXPECT_GE(test,
+				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, max), 0);
+		KUNIT_EXPECT_GE(test,
+				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, max - n), 0);
 		KUNIT_EXPECT_EQ(test,
-				idm_reserve_chunk_locked(idm, 1, idm_total(idm) - n),
-				-EDQUOT);
+				xe_guc_id_mgr_reserve_shareable_locked(idm, max - n, 1),
+				-ENOSPC);
 		KUNIT_EXPECT_EQ(test,
-				idm_reserve_chunk_locked(idm, idm_total(idm) - n, 1),
-				-EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
+				xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1), -ENOSPC);
 	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), max);
+	idm_release_chunk_locked(idm, idm_shareable_start(idm), max);
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
+
 	mutex_unlock(idm_mutex(idm));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b4f4a7aa21c7..79535f7478e9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -872,7 +872,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -889,7 +889,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	unsigned int spare = pf_get_spare_ctxs(gt);
 
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
 
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -916,7 +916,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1138,9 +1138,11 @@ static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
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
@@ -1151,7 +1153,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 	int ret;
 
 	for (; fair; --fair) {
-		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 53c83d2b1f66..ddf4338f742b 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -62,13 +62,6 @@ static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
 	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
 }
 
-static unsigned int idm_used_total(struct xe_guc_id_mgr *idm)
-{
-	lockdep_assert_held(idm_mutex(idm));
-
-	return bitmap_weight(idm->bitmap, idm_total(idm));
-}
-
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -345,30 +338,6 @@ static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
 	return 0;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count,
-				    unsigned int retain)
-{
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!idm_total(idm))
-		return -ENODATA;
-
-	if (retain && idm_used_total(idm) + count + retain > idm_total(idm))
-		return -EDQUOT;
-
-	id = bitmap_find_next_zero_area(idm->bitmap, idm_total(idm), 0, count, 0);
-	if (id >= idm_total(idm))
-		return -ENOSPC;
-
-	bitmap_set(idm->bitmap, id, count);
-
-	return id;
-}
-
 /**
  * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
@@ -486,33 +455,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
 
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
-/**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
- * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
- *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
- *
- * Return: starting ID of the allocated GuC context ID range or
- *         a negative error code on failure.
- */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	mutex_lock(idm_mutex(idm));
-	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
-
-	return ret;
-}
 
 /**
  * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index f7ab753070da..844d68440b0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,7 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 					unsigned int count);
-- 
2.34.1

