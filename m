Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED09CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 08:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB7A10EC1E;
	Mon,  5 Oct 2026 08:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkel50J8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEF6892CA
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190330; x=1822726330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cMd2zBb3YezoTXNSLmFXV6TsuH0y2oF5F6pEjBsAFS0=;
 b=Wkel50J8OXoD0stJ/83MZLo1DX3cgk7/Scgg2kTKEGtqpoT6MDY4HoXt
 BIB8TsvfFiEjox5lXqylz6QWSi2gJVvMYhxxk7z5C3AtQyCLkIxQuw6gp
 0p3tXye2qHJgSSL+h7bSo3ctG2daHWIuZwsGhZmdbPNzPPuJs2RnD+olI
 4Qn0nUhOchsWgGisX84hq06NcfJvQLoWnJG2AHvCWMRgxGLbOyWrJAfCY
 Q3yJ4wV1YnQiRPMy7p7mENG/gS7YNZary/c9d7GhedmuWx+9LXx1YQqA4
 GXy/7QkTHdU5Ls5kuDeYXXq7Fu1rdHxLw1Z7bSphYOM+VtJma7Wc3OXhc A==;
X-CSE-ConnectionGUID: H98WKEQSS5WbHbXiCeaRhg==
X-CSE-MsgGUID: OapZOruRTku3DWF+Gf6G2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91878435"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91878435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:10 -0700
X-CSE-ConnectionGUID: Nplj2fs/Sz2gAMZgi28x2Q==
X-CSE-MsgGUID: QvRaWaCwR3WlnIhAhy4fNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280045081"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:52:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 01:52:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:52:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdNi953U0g7sk8T9HGlkfcoL/CJxZQGNp/E2q/VHYXqsMMb56KbFEMNAjTsbNGMM3tNls3e4r7h5zEc7VRiwYmql9ZnxlT6gakPghX6g+y3Qf7IfUBMfimrhQe0YI6XFPJVOJElWsJVBDVhEX/8be5HorGLc9IAPHwLJwPZFljtDaf3WnT4NCqtiEAmMmQ8mEs662ePZiw24ga+FOEvdrkPqm+ZY5ssZ4BXw8ZoUzuX5zf+VhNKYnwgJ+7iev8HNfZc6ufb6jgpd9z5qjHoODFR5xv3y3WUplj8cCT7v+S9FoZ+kh5A/jiQmtArQ8+0exoiTKUMQTbOWoM5rq4K9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyGOpEF+cMoV5GqYsbAe42kIGRftNx8FdU3hEcFh6C0=;
 b=D6ZZ6r44bMhinfN1vXDRHdUwZnq+AB97dlm/H8ngZZCSrDsYXqHsIoDeq0shJDKOfeWy1hmITOiAwEp+5yRLbNL8Rzo+Iey1TbTTrrnfpSpehKQnCGmltbkGQ+FunoK4pmCVD0MSvFSSkab2BP6mFL7JLck4SdtamOwvjg5HUUZ7S6QmomUmGIityfYieWtY/KhiEe50M6lWSqCvClk8uqCf64kcJi7J1iGqznbY4r6zg5vgKpPbF+CfhgamOUXXu2Wf5oUIH6vcZ9QE1VAMdZid5irh34tA4wgxHu5sS+vBr6mm68WHueS+8nANSWC5ruXPNSpk6TkgBuxCnw41/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM3PPF960565C2F.namprd11.prod.outlook.com (2603:10b6:f:fc00::f39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 08:52:07 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:52:07 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v5 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Mon, 5 Oct 2026 10:51:32 +0200
Message-ID: <20261005085132.3720685-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM3PPF960565C2F:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e39b3ff-0fef-4deb-47c2-08df22bdef88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aOfL984EgLoB1WgnGGzkypMPOCjnSFpUnbP5WjMyIBoOOmootPDdTn5HfEw5PJJm4P1mBBuWZt/VTpXhgPX0GNZ5BzjKwMdVd3Qw0d0RgMzdzUtxGvZzPYNXHLJJQIUAlk/+9vUxrD3SnNpC5kf5K0ZmAwRFk6UO8LNA6mrFwwz2IhWzeW86F2VKsb0n5LRQaN4OR7JpOcW+KiXTkFh5NPDfdSGAghOE1HnCHTC8cC1VR82ed5jRaPUXXnjst9wCExXg65eLQPefDhtZIIOy5dohBC3pjoU11xHBZzPEtJhoqsrjdpnbptfonCqZf1JHnhbcjOKXmAjzbl+Croqe6EGnxVUWmCqPtMiRDn14/hHaAbBKJApdXORzJtLfFb/dKmPEnAWI0jUNBFbxLBty2SRTAgBUI77MPf0VaUjC52WQS/9HnLk9nJRdq/rbQwudEWrqJUW13Usk730DnxkoLBCUQINpGbLEsvQJQIT03IF8lvbfNS5HbnwC8pd6HdJKDFTDaS6UsPMCMpvffNO5fHe+pDXJ8Gls0gANATi+JuYX3YVGn6Btb3tKBCWNfuN1No2SU4EqdXas73MueNVj+9UmARGlWo/p0lR0mTY8Vj/GhwInyw6tUD9NUdviSS0/yvgwSmg5iS01P5a5O49Fgl59OuTTjGp11AIVR/oh6SA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkF2Y1dneEdQWmtENHRFZ3BMWGgxM081cVFwcXc5UFJScDVXVGp3U1dXc0lV?=
 =?utf-8?B?ODZPYmkrUUZZZnI4VmY4cTNiOXhUcENYSlU3UnpFZXI2RVd5T2lVYTVtamx2?=
 =?utf-8?B?VERZVlFlblN5WUI0ZUJLRUdFYjQ1SFUwMEJCdnRlOVNydnQ3YUVGQTZ1dDQ0?=
 =?utf-8?B?SUhYcWdSenhvU1RTZVpOazVscjYrZWlIMnBOZWNwOFY4eUpnMXVNTFdtVGNI?=
 =?utf-8?B?aDJzbFlSVWtJWU8yM1V3a3Z3dngwSk1Pa09ncXBNaytMTElQR203cDhwb0ha?=
 =?utf-8?B?ZVpUTVZOTzRtaG9zSm9Yazd2c2d3UFhScWVjZDFBc0RsOHJnR0R6SlNDQ3pI?=
 =?utf-8?B?Kzk3NHUzNDBVc0krblQ5T3VVQzVIdEdtT0xYbTk3RUVQbU0ybjl1ZU5ra3l6?=
 =?utf-8?B?akhaSjhoeEdqNEVqSGdjc2tzWG1VWVZBTGNsczJSaXNRSDRCVzlqUEd4bW1S?=
 =?utf-8?B?VXRMMXorOVU1eFZ6TTJ6MTUvQ2d1Vnl3cHo2ektLSHNwUFh4V2NlMmRiOVFt?=
 =?utf-8?B?YURHVVh2UUpaRHpLbnI2T1FhQlFsQit0ak93N3lCZHBjOVZJMTRhbWZLRHZj?=
 =?utf-8?B?WmdMdy9kNkdkcGxvYis1TVBXUXhTbUo2a3BIcVQ5R3MvSFB3c29YNVJ1aGY0?=
 =?utf-8?B?K3hINldUS2JXZ3k1a2tzcHcrald3VEdsSVNFUWRKSXpCenhTUDhkQmk1a1Rn?=
 =?utf-8?B?Y3ZPMk9Na2lWblJaRFdGZWw4cElUbFlYRkNIWWFEdXRqU0xkY2tTYkZFL28x?=
 =?utf-8?B?ejVNUTVZWTcyVWhQU3NjWlRtNDlYZENlRzJ3S0d0a01oSjJUT254MENKZ29z?=
 =?utf-8?B?ZEdhNFdMWVBaZXRqVVBRZWhaajIrSkJTQU1OTitITXl4STlJV0ZaVDVuNVBV?=
 =?utf-8?B?VTMxbk00ZGlpb1hqNEVLRjdVeWpuK3NUTzJiR0xLVjJkSnUvNTNUeVpVUEV5?=
 =?utf-8?B?Y2F3Tkp0Ymt4Y3BVUUFJbllFb2trRy9NbFZVWWRSQ0ppdGx3MytIYklBdHJn?=
 =?utf-8?B?TmNHb2VnTkVuRThabkdsN2U5TFlNSmE0NkF2S3BzRElJZndDRjRMSGZ2NWNz?=
 =?utf-8?B?R2hYTnh5N05VV2kxdVJqNk56WkFxK3pROEU0R3haa2pQWExWQlpZK0tLcDhj?=
 =?utf-8?B?MkZvUDB6ZUpSUzBKSHdpZmYzWXdEMW5oaFJta2NFWDR6MFc2MW50a2FzWjNW?=
 =?utf-8?B?YkRhVG1QWWFDbFdySWFxYWd6eEp3TFF5OWpObFVhc3JGWjU5NDQvbjRjWUs0?=
 =?utf-8?B?c3V0YWtEb2hDSXdLc0Z4WUJpMTJ1ZlIwUHBDcTVPS2tBZWsxbEdRSVloZVhy?=
 =?utf-8?B?NWt6L3h6eDRzeGlZVU5OZDRBSUpMMzZXSWlvOVB1ajRRVmxNUjJvOWJKY09S?=
 =?utf-8?B?WjlEZEJZS2tEdjU4ZDUwNUJQdTFBVXFqczRZSk1nNUppeWUvV2RvNmh3b1Nz?=
 =?utf-8?B?UG9RNkNubFR1K3BvTGNPWHk5azhxTTM5R0FwSmJ4Q0lMeTJHdDhjcjBWc2lN?=
 =?utf-8?B?bkJBTE5sM2FMUG1rZm1DcXpJTEt2ZENUNUZYdENTWHVaWVhsOW54clViVkdi?=
 =?utf-8?B?NzJmZVRhRDUveFhMMy9EeWlCMXZraTB5aEUwT0xQVDd6TnZaMTltTXo1QnRp?=
 =?utf-8?B?YXdCTVNDK3dOWEpzMUVlS2FRZTJvdWZFWHNQZFBvQXpUcG54VjZ4dW8rWm4x?=
 =?utf-8?B?V1ppeUhHN2hLUXVkaE1wcXpJb0NzalM0cjA0MUhWcFROekM4Smp0MVlGYU5u?=
 =?utf-8?B?ZmJvUHNNSmdGaVZrZDd2QlAwY0tEUHl1V0lIeFlZbWNIZzZiYjdzcWxXNUhZ?=
 =?utf-8?B?ZE5wbWFLdUM1bVQrNVZzUk5YWGg4UE5aNXUzWHRzbnN4SVJXZGtZMUorRkt3?=
 =?utf-8?B?bjg5L2ppOW5aT3VFckoyZlYxRTJYcXZJUjcvYmkwK2pTOUM4S2k3djIrbXVR?=
 =?utf-8?B?K0NqM213L3NEMThpSzU5eWV0ZmkxWWE1K25LOURUbjIyVlBTTS9aN2ZERHJs?=
 =?utf-8?B?MWpWdVlNdmJJSmJNUS90V1hjVjdSaVRpOUdMbVRXM3FXNTc0blVrVzJKTWcv?=
 =?utf-8?B?WmJocmhCQm55MTBXOHRGMVluOGpsY0dWTnR1bHNaK1hVMUxFT2xhb0Q1bklk?=
 =?utf-8?B?U0FRZThTYkZZeVBZUjk4bnZpYVA1bFpBQ0NWUTVHY0w5RHFkKzQ3RFFBTElx?=
 =?utf-8?B?ZVo3UEN0aGp1NGE4eDBKLzQ5dFBhZU4yRVJySzNXQ0hwYWl6ZE1HM0JuT1A4?=
 =?utf-8?B?WHUwTGM5Z1dYK0pGZ045dHJaTjlzcUU0Si9JQ3FjMVNndmllVmwrSlhWT2dK?=
 =?utf-8?B?b0d2Tm8xeXNLOUtzWjZmck92S1oxN213VFRWS3MyMmhpdnlMMXlwdnBIQkp5?=
 =?utf-8?Q?e8fJWGQNEu/lvFTU=3D?=
X-Exchange-RoutingPolicyChecked: BBmC+rMwsHnSGWq+7Pv1vmneRbN1qHvimgNEY3fIkclm8EMRbHEaJ79V7LhPW+qC7MNBESHklU+ykV33LKmi2PL1ITXBIArkHVDv8B5rgf0CzGw3Q31cHpRNPfaL4UJq4bIh5jcZ04dksvpyJ7ByZe5Ug5sDpAVz7p4lsO68qAVu2lnr6Fcwtem2SgeUk/nf6dPmrPYlE3QxcImbttZ0E1ptTdjIRul4Q7D2DrVP2FGSrMPcnvk1PCmN69KlLdP2NKRVuPssbVS51mNBNiwdpGgILrIMm0+iHX2FFgvrV9DnZLyNDt+qkYTXEl0MbaPdb2zyNVvZ44Hw5CfJsjWS8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e39b3ff-0fef-4deb-47c2-08df22bdef88
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:52:07.3597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/joIP98+djuB0uWKv2WTbwOqSa2LwjMDVd4W/HTz9dbu+9QAuDMhpmZNz4XibldfWD12gnw82IQTJU8I2DTcoNPaLmuH4peT6/LdAX9H3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF960565C2F
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

v2: Use local variable for max shareable GuC IDs in fair profile (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 24 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30f..4d72411cd570c 100644
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
index de1ac58e31412..0a47458e5bf20 100644
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
@@ -1170,23 +1170,30 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
 
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm);
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(max_shareable, SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(max_shareable / num_vfs);
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
index dc918221b78de..6cd73009177af 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,9 +120,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
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
@@ -283,37 +287,6 @@ static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigne
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
@@ -471,25 +444,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
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
index ed9970829a939..844d68440b0af 100644
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

