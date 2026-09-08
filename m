Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87395C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F7B10EAF7;
	Tue,  8 Sep 2026 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7pb2Kad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789FA10EAF7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788861988; x=1820397988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gC8dCaqrpejdTQyXboCY5LLdhI1JkQ+VL8RbzPnmBpw=;
 b=E7pb2Kadh1e4crc5RVo5NWeLO0r2ICWQmuax/ebvx5HTObHB0Gi3nL+z
 dQkfUTXTVpnUkZ++uZeWYyr/mw1EevHhjhR9nPUinxbguS48WYuSt3JjA
 yHptMATawr7RYO3ShvtRPn0Hr8Q+YzPyQPbCDeW4j5M15m/WihuuoFORo
 h9WoIjoxirxFOS+xOuHAgVUDBcLxMzW5QBRB14motCrWEiEnKwYpd3LkU
 Cc1Sx5RUiKiX93a5Im3n0CmKOEWHUIZy47aq8tPVqQRMSMAi5OtyoVfVH
 6F2xDwkp3bzDkmBHMqeGa3c47OehRGJE6LUR9gHqoHB0oUw9e3+P/q2lP w==;
X-CSE-ConnectionGUID: DlKbOhjwQb640+ZsZesqhA==
X-CSE-MsgGUID: m//kMf39SGioxGtXHC2PoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89103140"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89103140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:28 -0700
X-CSE-ConnectionGUID: cyHIFZjnQoeFD+jQpyAJQg==
X-CSE-MsgGUID: PqoYtno4RbekYyKVPIL16g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267275410"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 03:06:26 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opXWNLVNaP0VCZVbeuQqbFJHhKuGOU6IpShnqxt76BnsWiayKLN7HjITVHo1cTRgZENdAuLPnzFJ9B8OKeOw9Wu5tHQ7uX/GqrrX2Z7gDiFAQ7rj8AyWLssg/qpsfVjigZEfLD/PI97HHn7CAvpaEz7ybuNWlqHeY81kWz0LgzvDiqQ7LijXBwvHtUwPlFjWrfFREgQuvGZi6TXahiejZL5boEcYNZ8iSOwomNHultR/pfMWp/lHJlGDOQLZN/19+Ztbe63171NUEjfQW4zJTHht7VykN1hthfX6Jzja0vrViFUC0jvdkH86WegpONGjtlDseR0Y238bMVfavz8oyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O61Qdr1zeXWnbf2bbv3+ven92oQg9y3GVLtGyY+gfH8=;
 b=Qbdy8Qnl+qLek48XMOGS26SMETc+xB2VGv9/GRW5sJbIq4MMN8t04lUoVdwYbGKAFbEYUgAUvtjwwdznKQQrpOuRL/3O8hh00bsw55c/w+n6XcqP/IY32vW2nn9TC2zemuKh55QsZxQvAREBtzdXZf9O2HRlA6J9DYHk9dy0IBXei+DLzcLvjao3G2dnyeVJwFxxJzcZj1iZZWNKVXBzqW/kUjbnAg5STFAGGKn1KVUMwOimZpCbChdkNOsBW1F6T692WgqlSifdOOAsYf6W4mXa6v1f9Hw/hu0ucouC28QGqOhUDhanacLJhJmbUtXE5HU6Xd1Iu8LSAuRe5Bsh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:06:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 10:06:24 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 4/4] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Tue, 8 Sep 2026 12:06:02 +0200
Message-ID: <20260908100602.1626556-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::28) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 1264d6f9-7855-4994-bd95-08df0d90d729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 3xBormvZspiB6LfW4HHe0/RynpZYt3gqOi0HQLGJJJ6cTl8c+5fRcPsiI0hLBYQ0+4KWvYwP962Ckvi75GSydUecT2XrxxKld8uZKJBHha8G+AcsDSAQ/fHQCohlupHyr9ZXm9ghZ0sP+9dczPDR0p12SCsmKorhxQedNavAFGiaLQLMx9fO3im1ULmB0Bz6dAo8yjauN0EviQ7glSPD7pKcfeICbM8QQeL+kDsGDzWUypu2j+oFsigu3kNqGXfm1BZFLzlRoDxBhpA+Y/Ac6TTfWWOrGO6px7b1IIzH/hvTl22E+r8yPLsH0mXalbfltgQDtPTze/EAe8nN/IEAW3mcSh9NLrjmUS+cfb3XKei12TaNsgCAGgx0bInG2KJoyt+uKx1kMT1Ippn6QTJqAO6OwczaF/U/2mCF9RAnMcHUgkiW6jsUWJTi9W3ECRixA9I0HzjDuAy6L4MwQ5Us5BScNNetRHIVZauvhhvZLnb/bhU/K4+TyEZbsu532z92pl3V4+VqSzI3wegp80Hqj50LFveoBq3MyZHWsIyhF0Wb7lVvnKYXle8itBXHDSToltds90Rf3bGilOEOAsXdAlGlBMp1DaVt2OJasEEfli6E/dyWwqr32LKbd9ZohRhMCZyzoPk2ig5uFjmtqJpc3Ndv6pALtx6ato0meNfvKDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFdYRU92bS90RGs0TWhHbi9ra294U0NRODVwUTVJOHJXUUNvM29QZ0xFTnk5?=
 =?utf-8?B?dnhleUxmWisyR2M0RitRZE14Z2g5RE5ZS3l0N3hyaEFEajh6dzVuMEJidUw2?=
 =?utf-8?B?QmUrUUxxMmcrQ2NNWXlJTkI3WGc2enVBOHFRYkRReWZIcDExWUN3cFNOSnI0?=
 =?utf-8?B?dlRPOHN0WkI1V2YvSGJlekgxZmN0RzQ4VWFjQTk3dXFPc01FMHoyTFhqMmNN?=
 =?utf-8?B?cms0N2F1TnVDQmhTc1ZTQWt0dFBEekhYZDdWeHRlNGtYcHdRWHQ3YmRrenR0?=
 =?utf-8?B?ZTJZdmttUlJ4b1ljMFFLOUFZd0JRSzh6MG9KRFcxSlMzZXUwbm81ZkovSDlz?=
 =?utf-8?B?c0pGbFNNNHJaZUZSWXhGZ1BoU2NVY3JxWnhhQm1CelhzWGxSZUg0SjQ0aGd0?=
 =?utf-8?B?NTdhT2h0ZEpDTmVqbzhhcllUemtRWUIwSjZRUzN2L2hVVWJNYnd2bFQrejVu?=
 =?utf-8?B?V2F1amtqRk1VNnZhRmVmNi9zUFVhbVRuTXY1bUlhc3ZQaUI5a2EvSWpqSFRS?=
 =?utf-8?B?amE2RWZYMVFiY0Jpek1ERUhwQTQ3WGFCdkhIbEFNTlJMbUVEZ2hhcmIvMytO?=
 =?utf-8?B?bFdWdFpOM0VnWTkzemE4S0lvNFRESXp3RjE4dEtJL2RQRndBKzZld0FjQ3Vl?=
 =?utf-8?B?aVJMb0w1d2E5SWJVcklRRGVXOWtMN2FDQXF3c2NKUGhpS1NkOC9SSVBEV2tx?=
 =?utf-8?B?VWxyUWNyZUZZVWM1c1QxWHNqNkVPTmVLRitRN050cXBWeFFyakZWTFM5SFQv?=
 =?utf-8?B?NVhkREE1RGdsTHNWaEs1bm1RM0doRDd2Y1duS3ZUZ1duMlJzd3dqeFh1aEhO?=
 =?utf-8?B?RFdYYlRGVUtqS1R5VGp1bys3VCtCdFdaakdIUVNSSnQ1NXhFckdIVTVtTGQw?=
 =?utf-8?B?T0NrRE5wUVNPT0grcEI2ZkE1YXJoT21XWVp1SlhMc2ZjNk83QWRtY1MwQ1Nv?=
 =?utf-8?B?Uzh2eGRUVnN0UVlTeHhhMHAyNzFIK09OOGg0eVJaQzJqK2I3RnV5dmR1K2wy?=
 =?utf-8?B?S1VjaGF6cVhubzVWNTdPTUpUVGpRMncrOFZRY041Z3kzb1Z5Q0liWlI4bHNM?=
 =?utf-8?B?OG1pTXQ3c1NWSDk1TnN1aWZFWjdjRmRrTlNSWnhXRlhCdnBLbWZta0FlTE1M?=
 =?utf-8?B?dW5mTkliM2Z4OEJXV0YvM3k4THdsRjlBanJ4TXdzSFBaUnFDMzIxZlBWanZn?=
 =?utf-8?B?ZElaNmxTYXA2bkdxVFFkd3JhYzIrMUtmTXlBQ2dXdDJNQ0ZRTERINmZkVlBa?=
 =?utf-8?B?M1lmQlJTM3dFOWVJRitUekE1RHBGT1lpL1VhaTNyN3V5bGVMQ1I1ZVVnMWVr?=
 =?utf-8?B?enAzY0ZPNkIvTWxTZThvQ0NPWUx1NTl4Z0ZqVWc3OU1tVkFWWXd3Y2FlY3A5?=
 =?utf-8?B?ZkdXV1BFaVF5UE1hSmlTc0VyQTFSMUVkV0lEUGc1cXo0TysvZ3o4Y1Awd1lV?=
 =?utf-8?B?RE02dWt0MXJUU29uNDlncmI2Z0xHWjdtaG0vMmxOZm9Ycjdzd2pPNTdZNWht?=
 =?utf-8?B?c0ZpdjlOZWRXcGRuZERzMFBsQUE4M0xqeDVYZjQwMXpnRWp6K0tmcndhK1RU?=
 =?utf-8?B?d0N0bVNCTXB3ZFlIMjd2MnJCNzhEdFd2RkZBbFRRN0NMWUZyc2VCWjZQWCtG?=
 =?utf-8?B?cjU3bDNPWFNkRUE1RldlU1lCTGl5aDBrU2JjUzk4MzJmM3FBaCtzb20zblFC?=
 =?utf-8?B?NmYrc2FSMmlmTzU1cmQwY0I3VitCNHNXYXQyV2J6TGwyT1RxV1hJbkl2aWtE?=
 =?utf-8?B?Zlk0Qnl1czA1c1kwZ09IT0Nzb3BlY0JvdTF4OUJvcmljbTB2ZExZeE92RHB0?=
 =?utf-8?B?ZTBDMjdDMnVmN0RLcHhROUxIRXpmaHlHNmpjMW1YdEVlMkhuREVlMUYvcitQ?=
 =?utf-8?B?QkVsNXdta3l0d0wzNmd4MlRwOGh2dk1FejB4eGZabkpiYU40aUszZDhocVhC?=
 =?utf-8?B?U1IzbURkRzBjNjhzVVBkVjdjbUhtZlQydU1nTlY0YmNCN0hzWXNqYW8rTStC?=
 =?utf-8?B?aE9uMHJwZlEzbGJZOHBVcmRqQUhLNDVCenVKWXkvRnAwUWU5eEtxbVFxZG5U?=
 =?utf-8?B?bzVXSERtSkkrVTU4Z010MW1Db3NMQTl1Y3FqbjVaSmwyQW5HSUt6L3c2MUsv?=
 =?utf-8?B?WVFYRFBhUVNqSlllc3dTYmk0SklhaGxyM0N0azNwdzc0T3d2YkJCM3lwckNj?=
 =?utf-8?B?TEpMQ0dxZDY3aGl4UFBoUEpVYTJJbkdGZUtVU3FSMFdXa012T2xHSWRCV0Yx?=
 =?utf-8?B?UkJ3MVk5MktIcTk3UVBTWnF1L1NVVGVsbnY0T1hVUytCcUdITWV1RTY1WmIz?=
 =?utf-8?B?K2FBK05uTWRHM3lzbDRkcnZmMDB3bXV4SGhucVd0WVFHOUxBamMwSi8rSDdV?=
 =?utf-8?Q?ldNKfs0zR+Fw/29Y=3D?=
X-Exchange-RoutingPolicyChecked: OM98hG5MUTGLxo7wR7OVFAC18t2LnpEVKZYzWkBVkel0/5ikKNQISPzluAai7HbKw/3nsTH27BTjMELcXRaUg/duEA/GBAiraUX6rlG+s7IeNhjV45qO6iGeFg6sCD9aUvEWeMcRZHTd7Dk99jyOyo9sqhFzKfHimhxgyp6/iahR+yukxl/Zi/m4ZxaZOK5KbIhpGZP2C4bHt+F3NaRjKSfjgkldA6KryXQDaQzNQGhvzHRZC6yQ1kvoamz32C5TWahx/jiQZLnmw5Yw+7YXsKhKD49E9U9eakblxVkmr/M/MsGWCnMLXW4+8PiTJwpVVhGv2WI3UyDCnHWhJRWT/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1264d6f9-7855-4994-bd95-08df0d90d729
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:06:24.7127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9F6vP8QWVYPgsfxeZ39eeiEC0CRrD7c3atro1LExJr4K74B/XFwjLXr3F3uK3h6XRZkb9VLSo2oN2+ny5PC4994VGozEQiMkNwyhOzaEFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9827
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

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.
v3:
 - Rename the test file to use the _kunit.c suffix.
 - Use shared GGTT setup and cleanup helpers.
 - Split PCI IOV coverage into a separate KUnit suite.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 327 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
 2 files changed, 331 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
new file mode 100644
index 0000000000000..9bac48982a81b
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static u64 ggtt_test_accessible_size(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+}
+
+static void ggtt_test_fini(void *data)
+{
+	struct xe_ggtt *ggtt = data;
+
+	drm_mm_takedown(&ggtt->mm);
+}
+
+static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
+					u64 usable_size, u64 shareable_size)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt *ggtt;
+	int err;
+
+	ggtt = kunit_kzalloc(test, sizeof(*ggtt), GFP_KERNEL);
+	if (!ggtt)
+		return NULL;
+
+	ggtt->tile = tile;
+	mutex_init(&ggtt->lock);
+	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
+
+	err = kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
+	if (err)
+		return NULL;
+
+	return ggtt;
+}
+
+static void ggtt_test_remove_node(struct xe_ggtt_node *node)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	mutex_lock(&ggtt->lock);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	ggtt_node_fini(node);
+}
+
+static void init_native(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = xe_ggtt_insert_node(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+
+	ggtt_test_remove_node(usable_node);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = xe_ggtt_insert_node(ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static void init_shared_pf(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, accessible, accessible);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_start(ggtt), 0);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_start(ggtt), accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt_shareable_start(ggtt), usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = xe_ggtt_insert_node(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+
+	ggtt_test_remove_node(usable_node);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = xe_ggtt_insert_node_shareable(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
+
+	ggtt_test_remove_node(shareable_node);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = xe_ggtt_insert_node(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+
+	ggtt_test_remove_node(shareable_node);
+	ggtt_test_remove_node(usable_node);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = xe_ggtt_insert_node(ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(ggtt, shareable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+
+	ggtt_test_remove_node(usable_node);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = xe_ggtt_insert_node_shareable(ggtt, shareable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = xe_ggtt_insert_node(ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+
+	ggtt_test_remove_node(shareable_node);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = xe_ggtt_insert_node_shareable(ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = xe_ggtt_insert_node_shareable(ggtt, shareable + XE_PAGE_SIZE,
+					     XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_iov_test_cases[] = {
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_iov_suite = {
+	.name = "xe_ggtt_iov",
+	.test_cases = ggtt_iov_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+#endif
+
+kunit_test_suites(&ggtt_suite);
+#if IS_ENABLED(CONFIG_PCI_IOV)
+kunit_test_suites(&ggtt_iov_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 4eec94e377c98..cc64ae68661dc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1385,3 +1385,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_kunit.c"
+#endif
-- 
2.34.1

