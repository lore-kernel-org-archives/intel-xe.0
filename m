Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440E9C61DCD
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D6610E3E7;
	Thu, 27 Aug 2026 10:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jraY3Spz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F11810EF90
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828295; x=1819364295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mFCY+t1aTzy8K1DcPibkw41bYGdNDtT0PorSGkRZGCk=;
 b=jraY3SpzZk/ZV+8vuwOLXqQaE4+a+KgSFdaxpXp4Vg3CIzyBdCTm1nqm
 NfylbQSxB21vChCiKaxsY+/rQzyaJLw2+DC4RUD1JhHfLdrVfYwDoNl0q
 3LDKvvgbA4wOkiMlWmw6OwZxsisScxbe/fDqB6tFXDhkCcSDx1nUnNzq8
 QUZxRiIEon+97MV0rJnGBt70mbmgyO5ELEtuucGI9iCJyIpAZi1ro0Qf1
 dCrUCyyEVbaFGlj5ltQbzm5UXcineRDdBie5jYusS+NV6lUR1yD5SSii6
 TMZjtPH4ZDVx8iLqkZd6RLkBtmR8LIRSS7i5EcbqrHN7FHGnPRDaTmKhL g==;
X-CSE-ConnectionGUID: xaQLN9MISuCQNQECyuR2hQ==
X-CSE-MsgGUID: YwMBJIVgSMGEi1+wsZu3Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98659978"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98659978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:15 -0700
X-CSE-ConnectionGUID: 4DPBSrIwTMGZW3gG2dV55Q==
X-CSE-MsgGUID: tEKXczeNR3uOMUOC5hxCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="273099202"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:58:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEwO67e7cZbqIIt4DDOleFZbZkeubIx5WxjGtaqZYUd/78umxMyzoddQz8idfwY/nrat3Wil/1W1WHkeyxa8QkJCmbrBCeXhOctJoRP4WOPEOeWGJgQiiNb44Vm2J6wYmZ0In7zk/09Lw1NiX6jieXWoo+JSL1yVgLXAy4hetMo1Erd7MO5cH3jX9yeeRcyWd0lj7DkhO0CQzd0ifoUTOk7VsqcaHQauKq2Ap+secjs109I/EBc3m3C/53mGw4Ay0JT5aXSqPiTDDGJV80k5ZxPnznE1Nht8ySQngoObnoVX2mQKTkqDQXWAKwlqQp4E5BvhLXBu2siq4IE9jjjxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ps6S+ZTHMqZMIEmD39dGt6ApYhe9XjRC7+cTTBe48c=;
 b=UJmmOj0vYsTbTihkQeJs5fs7qAZJy9xy8kqYP9Wa6Gnhb2nLWrjwgIInpMcUashk84yZvfwHfkdh+I5Q5jfbRuLacC3sIKbDVdQtjAWP/aQKEpzUnR/XuOLZms6BhI/cNnFNVC4pvG2Yk1NoES1Yn/W0A/yr+ytNzi5+eHN8SLNUkuD8he9JgcdPAs3kXwqi0Jtet+J/gNyWfXqA0kE8Q+uKpZRBLxtyuVAgwWczNmAsTAa92qSN5oq1Tgh1BpxbsbTDyCeW6bq3p9FB8c5lvY/UtibXOba2HNVLsmNh1a9QF8v/X0LyA4LLjT67P50K9obVMV86COByo/kFTnLPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 10:58:12 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:58:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v4 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Thu, 27 Aug 2026 12:57:49 +0200
Message-ID: <20260827105750.1248792-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:10:120::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c767f3d-8cbd-4f82-c423-08df042a1624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WC3P7rlCsF6/uihdxj77gjYcICUlLdEE+JlPt5/jDwkTSPANaqa+E6xgoZXN7ORdbLL1LhIhIG3jmBB/QzARun3m50CA4VhuggNIe5qYD9NsCHRriZLT7YVR2yLfz55f7S9NfYmK9cWYZZY3LLNFHfxYXvqWLV9AVylfBWJBkcKyAsjl5Ey9BfFLd8sFNiwWknRMGMkdCKDgolVblZPtqKMQQIYZoW7Di3hnew08idsacar++91rw3GcE/b/gVxL5K6Qz1IHS5daLSlZZkv/iDSBQwSpBTPZNV46s6Cg+IpUTslb0DMMPOmo4y7zQo3rseossCNfGoEze2gVx9qzv9nQWzSkaUgFitFkS2J9HQueb3ykl7mEVj+FlHn/uMUDT45QOF0HD+6ojO4Eij81vuLvHmJCRqsVGWhbwHurpAXlx2T6b/S8zQp5rM9R0RyY2afx5oz/tC+tv32EEzhJ6X0YQwVeIhiZd3b3kWMpHrD40u1B7k8OdT8PdIOaNXAvMvOrGkJUAlyELhUVeC8Xl+UvGBkivLvwx60lcX+OqkYPkdWP+fbHHKFWDDTodEmLSW/ksuGOP+Nh2k6wzNBh+s9nTrQnOBiQj7DiuSgGdx2kgFGs2YbPyWoVhmpnyWoETbnbYC9IjxXN4aAK0KKYXT/rcsHwYS/lM3Ny6+dax6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRqdHpQelRVenp2TFZlbFlLVXorcjZRcVI2NllJVkpUNloxSllLVlU0cmdT?=
 =?utf-8?B?RDVrcTNEZWNoeG9uN09PUHhaNU1MbDcvaGJnek1yMkRmejJORWFJS25WWk1S?=
 =?utf-8?B?b0V5bHBTYXZGN3pBclNwb1ZiKy9peHZZZnR1UHdmcWY3VFpEVmExQkNhVkY2?=
 =?utf-8?B?bEE3SmhmZzloVlFuRm0wNjdGbWJNR1djakl1ZFZpMkRSVkZ4bk94SU1Uelhp?=
 =?utf-8?B?OVZDdUhOV2JHcC9rQkZtajVEUlkyaU9QRnJBaVIxNGZWRjh2QUNZU3k0dEta?=
 =?utf-8?B?Y05WbUdLcHM5TWppR3krTFk3d2QvK1dzL0VXVG5uWWJIditUaUc0c3k4Ykhq?=
 =?utf-8?B?aEZKbDd5aGdIb0tHb3gwNm1IcFhFbXZwWEJ0eUxiVDN0d0ZvRTF0V3NCcDJq?=
 =?utf-8?B?bUd4YTFYdnVMaE9wbFR4WFVFSmV3WXIxZUp5YWxUaWtMNlZDYzFhZUEwbm5j?=
 =?utf-8?B?WDZOWVdhaEh6Zy9QMlA2b0dTS2RhSTRJUlQxYTlhQW9tRUphTXZZMnpTMFZP?=
 =?utf-8?B?N2M0UEZFWFJ0KzFRa0VPT0Yyc0FUSHE1c2NlT3Q0ZXhhS2o4QjFyZTF1Y0VE?=
 =?utf-8?B?eUVXVFMyOVVBRlZZZGhzUnBCTmxXUFQ1ZStnUVNZdlNJUnB0ME1zMzIycFR1?=
 =?utf-8?B?TjJOb1FPRUh4R1FqNnl4MHVDUUVRQjZSM2oreFdDMW1BRzRaK3A2ODFSdGxs?=
 =?utf-8?B?SVgzL0U3ay9rUjNZTTBNZWJ0UjBHc2VqcHU2SlZrRXBycUhBdDJHb1Z2cGs5?=
 =?utf-8?B?VGhEYTBaY3F6NU11bmtJbXVpNHh2OTVkelQ0d08wZDlhWXBWSmk5cnBMeTVZ?=
 =?utf-8?B?TlVHVCtMQk5EY1NwY3pRQ1Vtb0orZEpxaitiQ25iUFM5dVUxMUxKdG5DWTRQ?=
 =?utf-8?B?aTA2TFZPc3N3bVF4bWJYb3U0Y0dEa2tlb3Q4a28zd0FLSmxBQzFtb1BVSm9F?=
 =?utf-8?B?VS9XVDdXMkZxWnEwYU9mMWhYbForQlJwYmJYWURISkVOOUI0T3BJSm5yZUw0?=
 =?utf-8?B?OTFzVlVEck5xbXFNalFxTWRFRmV0UGwwVVBZRlVlWlJOSGF2bUlyeTJZYkVk?=
 =?utf-8?B?blFPdGVxVzdzZ01QcHhVQmkvK1dLbWFtRW5wV2FuSUF5QllXa0gzTUlaOFlO?=
 =?utf-8?B?TDVGM05BUTNUeDlRaUVEY3FxNUI5S1dueVlodkptN29YZ3B0OWsvUWpXTUlM?=
 =?utf-8?B?N0pQN3dOQlhRdHptR2JOVnR1QVk3U3NWUkRqZ09za211d2piZzA2Q0lISWpo?=
 =?utf-8?B?QytRdmVKdjNxNkNuejRFT1poQWJTZTJsM3kzNWpqNHh5WlRMTnBTSWtGTUJp?=
 =?utf-8?B?dE1tUGN1SWJCLzVJdEpLVlJac2Zvc01IM3UrbW1GQytHeTcrM04rbG9OeGYr?=
 =?utf-8?B?bFR1VHU3MkpBU2VRV1dDcEpGN3FlNlVPRWQ1dVo0K04vcEJPa1FwSE9Mcm5u?=
 =?utf-8?B?Vm15ekVwR0RCV1JBbkNDczl3MGVyTzlKQjRQL3JpYU5KUllhZnJWem54VWdq?=
 =?utf-8?B?cnNjSHdnOWZSOCtvbytYeEZ0YmdVd2kwNEc2TmJManhTdVNOR2dhRXZKNTNv?=
 =?utf-8?B?ZlVNcktvaldyZnNRNHUzNUJXNHNaamZGUnBpc2N1ZzA4K0dEdWoxcDA3NU1u?=
 =?utf-8?B?VG5lVUZkTE1GaGswNG5TVUlwSkt3QmxEZTVIRE5SdTVBVG1aeFRRVXBKenZh?=
 =?utf-8?B?OXIzNER5bjJ0cXZVTFhJSFNjaTB4Y3RXd0xyREY3ZG9ET0UrSloxTE5UQTcy?=
 =?utf-8?B?cmd4OHl5WktjZ0xSV2x3SENDYUFabU9vMm53YmE5WjlHUkVtS0FSZkthRnJk?=
 =?utf-8?B?Rzh4bHVDMTRKZUtnZHVaWGFaY2xpTkVEd1BtY2pFSUZUd3RZY0syTlhQdE81?=
 =?utf-8?B?TjRhV3Vhd3J0a3p4RTB1Tnk4TnJPeURDNHJoZU5hTGlLL2lZYk9tNWRLMWFl?=
 =?utf-8?B?cHQ3WGprb0RhUU5YeW4yUGxRVitoWXJ3eWZmc1dHWTZQU01STFJESi9xN21E?=
 =?utf-8?B?RWxkeEg3UlJmRXY4cjFobnVnMmQzeXpkM09Hd2lqY0EwQ0NSV0NGd1hxMEty?=
 =?utf-8?B?K2dneW9NU0VTK3dUSmJRblUzRWt5d1hRV1dtSmR5dVV3K1l0NEJaNCtneXZJ?=
 =?utf-8?B?WHJVWngvajdKd1h5c1JNMGZzZEdkN2p6aGlwQ0lOdUZBb0hwRldGc2VGUnQv?=
 =?utf-8?B?MGxrVUk1WmdUTGoxdHZCd0U0UjJqSm1HTy9LdkhuZ2ZTNDFjS1VOUWY1aDA2?=
 =?utf-8?B?U1c2VUhUUnFRT0txTkovdXBZMGJ4WUREZHN6QVpOQUlpOXE0L05uc2xGZHNC?=
 =?utf-8?B?dnFpdUR2Tnp6bXFadW1MSnh2SXBkZTRVc3lJelpGekJ1QUtERi9jZVZxOEND?=
 =?utf-8?Q?jPI6Qk0aMycu0W2E=3D?=
X-Exchange-RoutingPolicyChecked: rCdD090kEOu0Bg9imgNqRlEIPzZc/Xwn7orWcfJxAqKSE6M8SizIRDXB9z0ZScmgGxmcwaT+en1aMttVOxcpmee0qvVpQ8o8nYm48XTbFeMnYABV7I60wvNV9wdSfCYXaXrtsk9a2r4p95dobM/XtnfteeS53zq/Dcxmb0SF2HFHiEXpwNbuEnUv2FNd1wrX4q6EeKHjbn/uAIRyrdtUnDmtT1Hwv0lp4xW3lfb6u1u3uAEtHXtLETA59ruN0vSXwTbQSHwZK+lPcZb1z0n9Ugi1jbkwntP3AENjuE9C3TZiCtdEDzfO+8CjzJc+Wfn3//g6wN3cKEWvFX5fSuGYUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c767f3d-8cbd-4f82-c423-08df042a1624
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:58:11.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUsPDlJyWSlmxE406i9q8c/qSaIOodXBgFWr2E4QfSF472Sjy07UUu/QuHuthj2MOoU1fcJKTx2scSkB7jGOcYUUZHO2BYJt/nTVxsQBnDg=
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
index 5fe71eac2e38..2e62809b4d4c 100644
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
@@ -671,6 +702,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
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

