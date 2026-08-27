Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF83C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02A410EFA5;
	Thu, 27 Aug 2026 10:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G55Avplq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1272210EDB2
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828293; x=1819364293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3zYwBtiEJvJ/18wfADBglECnt4M6ixkfmXEaypNeMeA=;
 b=G55Avplqtb5FHUlEp9iT7QI5UrG2jV+sZ8dUusRgMWHkl3zzjrwwToTX
 GRqQ0UG2oemJhqRfebZA+RtassZELlCASl31lYo4vQ4OB3scbV6N15BOv
 B1K5Xx9N+yEzo5sd/ifv5sSGsAXCOKO5YOSJIM9aTQibAJ6DSVIEO2wsk
 vQxYQy9rlGjekzI3uB2OvcbljzHFoc5+0qiAloPeahZHotahSnB0PsYbS
 Dm01wYImZEk1665jDkcBO4/4g/M1y9jZtELZ9K0AWOxItHtXOSjd0i042
 sMLcrbHLnkCwuCOss+vAs44FODzq1x7SUAVvC3DrR2bvs8y0nKXoOdoTP Q==;
X-CSE-ConnectionGUID: PZjRJLUQSNCqYyPAErQEIA==
X-CSE-MsgGUID: gY673rtaSeSRdGzzAl1Myg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98659973"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98659973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:13 -0700
X-CSE-ConnectionGUID: llRfJqY2R3GS4VHdMM7Zzg==
X-CSE-MsgGUID: 7e5AfXyHTgapjNZlLYct+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="273099201"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:58:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw4Lk0w+G2ODvGixVi1NbNHm1TqmEurAuRSDcFdQ65SIESSf1NfAjj9sb0Mp9ou/NKaE1rnq4a2ZVAlHTyoW42ueVXFPnclrT1kP3LgR/YrYoS2E8C3GtwhpyCZuSx0UqICAFcdtNybfvFFMlOll9LLXzPasaXl9wrLwqp68n4sJ8fn2fYuhe9fDl88Tgfpqz0zCzsTAVv/mV5xUmNerHt9uKKekDC+lbTG72/PD/BwNg3pijkeXHmUZ2tEK0KYB0CB3pxwQHrKaRnGZjupJPM8DiBZQyPtTssTk/ud9WLLLbd81ytr/TZ236ZqbY2U0kxRvmEpJWKVRj3XogswZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4DqbaxzspbUqnMTH5ftqs2bpy1Mh1VWAB48vjXkaUc=;
 b=VB261pOe0QKjmHjsH7p/KA8o6tE9fh3opXsJpDRL4a/oC8QGYvDZREiiO02ClmFsGU0E8UsJxinhS1IOYUm2EidrotQQuZbHC1hRO39uMakxd3gcY03gVTsEUs5VwMoyEoACw+FKzymk/hNl0iVU5cw3txWdHBcVGO+3KAfLO0e4FtcETPk/ddQvyOiDe2XZzL3Kl1YJAZbKfpnnxTp7JZSaMmEMBK28SgH2U8Io6Hz4s2qUNUUv9F4ymD+JD7edQszjWcgFgm/DiPCtsC6qWfCNlq6kjfBrIkkQ1VUUz6diSGLDsXAPz4mYntSsn23UM73JAiW9Jy1o5f+2NDi1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 10:58:08 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:58:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v4 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Thu, 27 Aug 2026 12:57:48 +0200
Message-ID: <20260827105750.1248792-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0216.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d087860-71c2-4f3b-58e8-08df042a13b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N6jMoC++VBmrtEhXRLuhp7qx5PXDNDaAtRS58oHK4LkY18BMuitbeisH0wzTqFjJzlfHPPs4ppL+qqMyAlaxvPzx7wp069HOE3h0RIWRRwOWi1z8X2mgAKnZiJkU07UXennCVu2N+7z5Wvgi++m7re6qFvGM2YlELeWG0hcW0X88RvSSRedAj2jxc3Xy3ore68lbX/V3RXyVsMTwo5NB/FeeR++0G/bVHwyJ2TgfwHXACi8qV80By6JmkLDKUb0el5boKjowRgvqnhzHMJNMg2FxF1jTjxbc0sIdyfLU7npGRDdKT6rUfeb/LQiHYjQuoIkp1USuQWMnXBACM0KwqfLW9OtMDHluulnPyTCZ6YIkeStjBbWU0hzCp3scKnHbxu6y+7WuBihMUE/KrkXrby2s2GKNiayZSa11V5uF1E5zdyKQCvrnUWAJYGOiV8WrWNVuQ5Uun2pZyfsbkoCfSoYgj41bxUEUZDv3eWHyLNVbTh+QAsQo6PJhw3NoNApMy9dKeYAIxKpszaUzCMwely+KWLhiRllIPE0s1lrPY6+9u4VPxxSs8D7caEcLneu7BBk15WVXcYpjKA41dssgmCPUxRuL2+rwIF9aGw4Gow0U+xSlclrj70R+c6Q/z3nlIl+yFhE4S97pRHcIXNso9UM4QFXyuKIALv7ZbJ+4xGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNHeTdqZTNVdXBZSDlPSVNoRHVCZHczWHk3YzNHV1Z5M0p3N0pPOUJqSFFC?=
 =?utf-8?B?czkvMUdhNWpWSlAvQ0krSnlqcGJhbHI3Q3JTSHJ6ZzcvSEZKK3ZRQ3l6U0Fw?=
 =?utf-8?B?djl1WnBwSkl6eTluaFQrUVVUcE1HUWVENEpkTnlVMklFdlVjenlLWENLdHdL?=
 =?utf-8?B?SWI3MG41bjdtTVNobERlZ2tHeXIzT2YzbHBrUEZIUGY1MzVDUW94S29BQlFR?=
 =?utf-8?B?SHptVlhjN1h4VW5rYzlIbnVTZmFhUk9oVHZLS1czMzZ4MzlxWVovY1YyOXdt?=
 =?utf-8?B?S01jU29VUXpPeCs0UmptTFhwUnIxOVRoSFdOVlV6M1I1QzI2RmJqNWtSNHlO?=
 =?utf-8?B?SU1hVzlsRkxSNmtFREYvSmlxWk1BSFpQdHlUTm1kV3VlTVZDTVMxLzZ2N1ov?=
 =?utf-8?B?TEdWVWJpa3pjbmFRT3kwdjNpOUFmMmMzUXp2akZSa2FJbDdjK3hDMVVCTjgx?=
 =?utf-8?B?MWtZN1NocWp6R3lvN2hxVzlMZDArQ1lmMmc3enlFR1hpU2g4UW4zM2pRd2VX?=
 =?utf-8?B?ZytyUFRHbzFjVHJMcy84UEtKemVKWmJoQkhNa2E1eVp5TnhpSDFtVXhFZTFR?=
 =?utf-8?B?UGhscUpldEt6Wk1Zd1JGVlZkSCtJMVd4T3pOQzcxNk4xM2p3WXgvdUwvRVBl?=
 =?utf-8?B?dGhkb2pCSnVKamp5bDJsNFdseC94bFBHdDJOK0lYUnlLUC9hRTYwTWZuMllB?=
 =?utf-8?B?UEJodlRHRDY0SWZxY0ZFS1E4MVJyQjl2YU9uVUl2RlZQR0NEcnRCbmw3b0Nu?=
 =?utf-8?B?NHdPbEFSMXNrN1pIUUNsQ0R5RmU1bmFobkYwYVl1TkF5bjAwVGovOFRScTdl?=
 =?utf-8?B?NWhHWXNQVU9FZkszL3JteTFlZ2padkhGdjgrbFJLTC9lM0JPaGNFbC9kMXlv?=
 =?utf-8?B?cHR3OTFCNHhFMGdXNEJLOFlrdDZhaWlIay9XbldRV2JBd3VCb083b3NJRzVq?=
 =?utf-8?B?dUlTNkh0YjgzdFVtVnFDWnRURnVLK1ZSVlFFaXFZc0MyaHhwMUM3M3RocWQ1?=
 =?utf-8?B?dFB4cExqYWREUSs0WE5WMld0Q3BySnJLclgzYndmN3FJR1gyNlZnRDROaWF3?=
 =?utf-8?B?N21ZcHRLU0RFMzBoLzlXREsrcUFZaWhZc0dHNVJmOGpCSndjSTNBSG9Qc0hQ?=
 =?utf-8?B?OGNvR1R6QXpjZ3AwblVOY2JGNmx2cXpzeXhrVGNlZVViTFh0YTVtc3VxK3hn?=
 =?utf-8?B?S3FWb1RFZUZwQ2FxOE1xNzVQMTlIQTFrSW9rUVhqQjlldEJmNlo0aWtyN1VZ?=
 =?utf-8?B?bWFBTDVlWFJGZWFuaTFRNTVvVGMybDdxeHdOcWNSUURUOUVNV0ZIVUR2b3pu?=
 =?utf-8?B?QkhubUtLdncrMzFUTE04blB3UFVEQnZqUzNHRkVhYWVzM2k4Z0VXSGo1YVVE?=
 =?utf-8?B?c3hiVnhFZFMydEI3NFFpblA1N1d1U25NNTdhTWZNaEkrRENUalo3VkVmN3c2?=
 =?utf-8?B?TEpWdlY5STlZQ0lDVURCRnJTZ01jdm5pTThWWGJjSFp1cXFOaVp1eFhQakI3?=
 =?utf-8?B?RFlkZVVScmdLOEg0MzZoWW01NnFsZWVFcUVVNXBVMHF2dVFoMDFUUlljOXpQ?=
 =?utf-8?B?VmdHNTRBVkFVbUI1TzJzb3pSWE9JZDY5aXhkTlBZWXIvM3h2dFVnd0JJKzdw?=
 =?utf-8?B?V213ZkxxZHhSZkRsdG1vMVFjMk5yY29EWkttZDZtVVNjWlZYcytZYTF5aFN5?=
 =?utf-8?B?bkFUbVFHSDdrV0ZTL2pxM3I0Q3JjQ2wzZHRzUVZsVXF6Um82N2NhQUJGSnAz?=
 =?utf-8?B?emdJcWhSQ1E3WFFHdktCYXlZd2VsOFpwdzdBUjNvVzNFaUZ5UmdaR0pnSk9v?=
 =?utf-8?B?NDlRNXd5VzBpRTVtSWszdXhpeE5DaktOZ2Fsa2pzbzFjdmdWNWJpQ2dTaS83?=
 =?utf-8?B?VGpZS2lpQTcvTGR0UTBMckszL3pQSDAvU01YWTQyODBka1hZUDhpSEs2N2s1?=
 =?utf-8?B?WDkwdmpqSW1ON3hvVVlYNTBnTjQ4OENEcFg0YXdNTzBLMEtpaDVJa1JLaVdn?=
 =?utf-8?B?UUtYUmdRY1dTaHNPa2ZuWVhHMk9oUFFHOStzZ1JFYmhDY1pHNWRyN1pLeWZx?=
 =?utf-8?B?N21yUldsOStXUFc3aGNkNmdNSm5VaWxkRDJ1RzE0ejh6a2sxTVhzS0tmMWlQ?=
 =?utf-8?B?ZjlzL0w0SjVQVjVCNTZSdzg1OHpHZ1JtbllZQXhQWm12anhXbTc1SWdybVNt?=
 =?utf-8?B?STVJTWUvN1g4SVJKbW9yTms1U0JsQzkya1dicWU3Nm9FUlhWVm9GOEljbHBH?=
 =?utf-8?B?LzlnZkpRUlFOMFFIbDVrY3lLT3RrcUpBYnhXdjM5R3BLRFJxcW5uSUt6MlAw?=
 =?utf-8?B?K0tTUXhKRWJaNWU5djZnQVBUa2RVVTVqWHEwKy8xcWIxM2xQVndHSG9QelNp?=
 =?utf-8?Q?1iX5HYY3/JfjVpZY=3D?=
X-Exchange-RoutingPolicyChecked: ubdHqLqMn0UI/8TuXxFQ1EIYC9teNJSrHCUnIo20wMgRmp9kIBnuRAIk5bHblMWJLH6/J/X4Nc5oUaGYwmI1OX/CelFqqMPBDCBt9TaTlKiKCh2GONgQ8sDvqqIowRrOvpbO7V9bAlPML5qpnmW/JZqti5vZx3rXn8V2LiZ59MuUUCTRGzEtyiIXHCKGxhpyJT+zmu3NIXT1RdBM30Ofjo9qCpho0oc3LsslRSbm39jcYKIjf2OMpSp04eONa8DHG2NLrVCx3YWP2fgkv00Sudrh4O3hlu8vd+B0N3XD1vVfHPZ3+kR4kCpFpUF0+CUrOUTjzqZCeCsGMj/6M63P1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d087860-71c2-4f3b-58e8-08df042a13b5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:58:07.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1v4ak5hA5FtIqAke3daFC5dNbKF6lMy+foXSRvwLQwLLXGgiesnX+FSbBy9BeQZusHSxn8/gAyE+xd2zDgu0g6MnuKbn7crPdAYAlBlBXs=
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

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
    so the mutex is not leaked on failure (Sashiko).
v3: Guard failed ID reservations before releasing test allocations.
v4: Avoid releasing unreserved ID ranges after failed test reservations.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 609 +++++++++++++++++-
 1 file changed, 594 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 78d3de46b757..5fe71eac2e38 100644
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
@@ -51,6 +65,23 @@ static void init_fini(struct kunit *test)
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
@@ -62,13 +93,13 @@ static void check_used(struct kunit *test)
 
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
 		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, test_idm_used_total(idm));
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,32 +107,566 @@ static void check_used(struct kunit *test)
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
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	mutex_lock(idm_mutex(idm));
 
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
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
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
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
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, total - 4);
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
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
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
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
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
@@ -109,6 +674,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
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

