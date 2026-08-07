Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584E8C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E7410F3A9;
	Fri,  7 Aug 2026 07:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZOLZ6Sj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204010F3A9
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786087120; x=1817623120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5wwbrQBF/+Eu6utTBQ/0k5PsKWwkjri9HXdhZO13KXo=;
 b=CZOLZ6Sjnf6AwtA+rZUQWsW9CXDjvCpXRZ0qJNnZT0cPhcE3OK5eR1jt
 XPnh5/5bB6OJ9B/YJaYAGKn7Nuk7dQlocOcZmw3shkmycqswORH8ZE1Rg
 6Zkl7xeDxKPGueQvlXoZfvUyHM+qabgEDJL7593+2QquLvNPKDKeUViMw
 qspb9noIkB3B7tyrO3Q6Ew62ZMjgRiNwXZ7vo66Af3ppHf7ka55aRl842
 gV+uKpu/hpIRBSdYoVFg7rbs9Hwd/wXVpmeoRJEJgiKb1O49EkkqQHBwW
 +7fc5Gc+Ha4P2VGXuJxU6wQ2SRtA/byjahwewHDkGvk9jMX0qP5aZW45R g==;
X-CSE-ConnectionGUID: Qqzn4tBDQTi0wMxhE4X6Kg==
X-CSE-MsgGUID: I9BKJn1nSYC1BvvB97gqBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104225191"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="104225191"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:39 -0700
X-CSE-ConnectionGUID: N9Hl/pC/TkW+uiCrWvYgVA==
X-CSE-MsgGUID: UoYm6bl7RnilEqMys4s3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260554675"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:18:41 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMqlG8oJb15dQmQvlgqYCOay5MYfWcgXqM1wF2060QZVsPBKhDdXPcjt80NduJ8sXUwWgSBqbtDx16YqrC43FllHim0hWZq1G0R0k+q5N874QNLrRX8g+ecdTMYrqNOrVXXleScTeqVNK4Hpn3LSpBCmXfL4vfM2OgHQtCT+otUkpaQQyEllYCqwZqyigsnpCHiYEXkoRtm4kkvs6MZRtDB3UVEAXtllI7FzhOypIWeceyrIGhF9zwji+/d53PbIskYVguqN44FEkYyANSzO6kbksNekw88vgZMMow6N3GLsjrH39pAQggziSeUe4q+pB2AB78SAU43V5JRCYF8P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2kTyWaCNjuEbe+4VVF5lU5vVG+EnNEg3/PT8A7ulFc=;
 b=qDroiYxERYxoMBWwAFMCw5BIyjK3JQ7H8LGTke/L+Hx4ki228Qbt5mnqAHhXtU5MbfVeAua81U6AiJVmjxTgVyyEkxyz+G4YeJeB93BRzbvUDbA9HH71b00nSRBeAxvEgsfV/6ofsWQPotrdkiMZfq7tBdY5CWxK82K8Z9ZBK8JXs061mGeYpA5gpXqENSL8DRaBOXrvKs/JMHiRVtNqEbQpynf4jSnWYJAZlS4U3TqOWhjmDbGl3Qx13iDXOx0dpL8CwddTNS+1MUqIl4YyE5r+otoZLX4NDzR0nN4Pb/dxISTcvQLe3IGvOtaEOlawMyZe8ePUsineVBDOO7hK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:18:37 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 07:18:36 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 1/3] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Fri, 7 Aug 2026 09:18:20 +0200
Message-ID: <20260807071822.225338-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807071822.225338-1-piotr.piorkowski@intel.com>
References: <20260807071822.225338-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0007.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab79c8a-02e3-4a3b-d804-08def45418f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 7i4VOnA8w7sIjq8f5DLnAk8j9rw5BYKiAZYGS5/fVNtOnfHU25+gzwbvgVkohElUbPjYuoLAc+3EzjgKnN/bW6VU9/DDJxjuGyGR5Ft7wGnZSCUG6RTC0qqGMl3iggnd8c89l0+nwm+guptShJpIKtukj4v08Cn7iCdQYj1KDRF8rcAkoHBuyECzgxCDs5y173dgY92xx8iJd04fR5ntk9mI43fsRbv2kTJfO7/dZWf+/cmVGQfceDL4uMu/+V8xBxnzHSovF3CAsqCHizQlPJJSuifaiViCRdTxBe0ckCtug2c3CLFG7DjrdqPquqEAf2jTlgSfQIVGc94/2eaRBUilNUQpKMykVFf/G99a9LlTqIenJWPAOq7tXJr1h8G2RYpb+muq8FhZXC9vDxca9NIrgohc+hYUUjJ/yiVe6W0ZjICqia+pE9J7daE4sOpGkI+7UKPVj1mw4A1gfn3y5t6GjnLarhayNuztkoRP/YAkgFOXnXcfuWzSXU4WT0smuBhH4mG4Zp41aW3zIRyuk9+siJ5fCrd9FxXXNWl8t6CLpQH+AxOvR+WFi9WeUCYgi4/kFzHbiv6SZg/N756H/sURLyjFkeZJDZIVCnVoIwqmEjEUkTYjTRJtPqR9ma95B99WP305jOLMMPWICkvcm/FHVmK5oy93l6ErIgQIDXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVURUp1dmxkemFxYk5CUjd3Q0EzVCtxSldKaDVCa0xUUjhHKzFFSGJUazc5?=
 =?utf-8?B?ODNQY3U3dVJ4UG9FSmo5cERHdzR6ZUtIWlJOU21rQ0RNUDkyVTB6VXJZMGdj?=
 =?utf-8?B?VS8wSlo4MkliZmVnL05TM0p2enpnaDZEdVFKMmcwYnFUbUJOVEJ3YXlBWEN0?=
 =?utf-8?B?YlFDNXFRMER1VUdZajhCMVB4dm1ackpBR2FIT1E4ZTZlQTliV1cvK25hTTk5?=
 =?utf-8?B?aDk5OXNnUzZlZVFPQTJkcWlVMVpGTXFuSWMrZW1tQlpjRDF5QzM2VmFYWTlR?=
 =?utf-8?B?dllLTzhwV2pIL2g2OEJkNFdSZDVxL2x4S2xjMForSnZjYWx0SmtrRlc5NzRh?=
 =?utf-8?B?d3BmYndLTmlBVjZYbHRobHdQaXgra3pHZGgvcHhROGRrM1hiQTN1YW91Zkkw?=
 =?utf-8?B?dnoreDdCVHlma1FvOUxFQlZ3eDdxZ3FIN0VrOHhpWFhRbk0xYVlLWExvOUMz?=
 =?utf-8?B?alBwOE5TbnJKeHFqTTVjVEFWZ1Y0RHdveUNmTHhWN2hxT0JXQ1JyUkNobzVM?=
 =?utf-8?B?UkZ6TjA0NWc1RWdpcS8vbVhlODJPbXBFNzRRN2ZEOTdrMFR5WHBHbEtBQ0JZ?=
 =?utf-8?B?eWtyZnVYdnVBeWZRR2RyUU1tQ01OSGR3QVJpN25ZRHprYnpNcG4vcU5QcmEy?=
 =?utf-8?B?ZW5ZQXEvQWxBTS80cm1CZWVuZFExTnN1N0g4ZmhuV1VsVXIzamxPeGV2M2Fh?=
 =?utf-8?B?OUxIa0JyUis3S0R4QkNUSnNGRGhxRTdpQit0RHpXVHpFTUJha0czUjZzK01w?=
 =?utf-8?B?a2t3RSs0WGErUW9NVVNOODNYbDdrTnFSQzVJSUxHdVFjZHNlVUsrcHdoS05n?=
 =?utf-8?B?aTNHb2NwSlZkQVZFNG1RQzJSbEZKamFMZUJtN3hPMElRTVY0Um45cHp0ZDhS?=
 =?utf-8?B?VmtrT09KV0g4Ymo5cW1YMXE4OHNydjVPd0pUWEpqOG4rdmxIbVllNUFicE96?=
 =?utf-8?B?TExvWXZGbEd2VUFHcXVodDQ0eHE3WGpiOGtGK0UzRFc5YlIwTTduK0xxN3JX?=
 =?utf-8?B?aGxhemwrcHhrQ3ZLa3l3YTMwUzZ3TUNJUEp0R1UrdXdxdjgxbnM3b3kvUE14?=
 =?utf-8?B?TzVrbXF2dllsQVpUU3c2UEhaM3R6QlhkMHRCMCtGM0xiVDl1UUpsTFBaQzBy?=
 =?utf-8?B?NFVaV3laU3pUSHVkck9UQWRHS3BKNUlpb2NvVm1aVnJJT0NYeTA2azAwODYx?=
 =?utf-8?B?WnRYTjBnN3p1MkoyU1lORUZvVlB4RkVzcGdXT3lkMlMxOHpVOGdCQkw3a3Qv?=
 =?utf-8?B?clprRVBCRXRqOTlINittSmJwYjExZm4xbEN6VXFxMWNzQlIzakt6NTRSMkxo?=
 =?utf-8?B?TU5LbzloTXloblhtWEYzdUExbXFwOGhtMW16U3ZlVkc5ZE92RGJ6Z0Z4Tm41?=
 =?utf-8?B?bC9udktPcVRnWnZkOXdNQ1hvYVpuMHMrcE5lTFdXVkdGYjBZZzdXdG1IOUVx?=
 =?utf-8?B?am5sK05qOW9lL0FpUXFheURmNVYrQS84NnhkMzdTZll3US9LVGpjbEFRVU95?=
 =?utf-8?B?NzM3dm1qREpMaVA5Y0Rmb0dPYWNaUG0veTFyTjZXT2s2UDBJUDhESE50N3Jm?=
 =?utf-8?B?aTg2TUpxV2VFQ2REbCt1SzhURTRUMWZzRFpKTXRBWE1ZL3NrQTlMT2lQYVBh?=
 =?utf-8?B?a3NETGdha0NVWExzMy96WDUxVEVYTXlUZWpOc29Xa0krRjF3TXNFMFdyWnEz?=
 =?utf-8?B?QlVsaElYc1pMNkJsS0V3ZWp0K0ZoUVhFNytqZUZhYnI1dG8yQXkwWWFndElF?=
 =?utf-8?B?bzFlQ0JId1MwdWNBZ2Eva0JsbGM1cWE4dVhTblk1VmdmRm9pYjMxZWhhV0xy?=
 =?utf-8?B?UjczRFpid3NubGhiaFRzb0pPM1M4M2k0dENsV2hBM01DUzEyTjVlYzJMTzdh?=
 =?utf-8?B?R0ZVUjlvRERNNUlSQzJRZXpELzk3YzFtNTRZY3V1UzVoenJMUU5hQnNBUC8y?=
 =?utf-8?B?TUgrVUxzS1NXRzBKV0ZzWEMweG9GV2RSYjN3V3pZaWdrYmcvMHRqbXRyL2Mx?=
 =?utf-8?B?a3RIdlY1TVMwZkZjV2U4TE5HckM5SFRaTk4raTc3eGI1ZmdvbjRoZUlseHgz?=
 =?utf-8?B?dml5Rk9KbHhTNlF3THNaSzZ0ay9nVDlUWldxUnZMcmJsS2dSMG4zd1FHM05x?=
 =?utf-8?B?dDdqOS9FYksrWkRDSFoyRmF6WHBVYUhqWEpkVVRLT0VZRzUzdW0zWlJFY0Vm?=
 =?utf-8?B?UTlDWHByb3AxRGkzNXU2eDkxYjhoWlRxdFZWcG5wdnloeFcvMHZPbysrZ3V4?=
 =?utf-8?B?SlF5cFpPVHBqWk1uRko0dlFvNjV3VjdhTnBwNXF6eTRndHVWT0syYm8zVGUw?=
 =?utf-8?B?VW16b1M2UTNjVWZjVkdRa1JSbkVLQjQzSVZqRzZmVjIvOXlZZ1ZUQ21uM1JJ?=
 =?utf-8?Q?eGxNo3lplDq+dwmM=3D?=
X-Exchange-RoutingPolicyChecked: biVKd5lT4YapGLb9Fm8cyjBhneQMvxHEkBmfi1ctE17cDBtK72beCppzy93v6Hbyd1vg3kZEPrOcvHcUFUMtIHjc3IvR+IvvMeHuRaZl+E0dEuJXB3f2YXhSnemrZVZV1Kng167xhjuRojBupP8rMvWle0HYxEjlRsGGCoKJLrU3Ng5M4C1QpsFZzQTOiazRwTwDPZqAklci0LP3CpwINYPieF7ts5D7EH4lAYTBrd2xvbx0Mp2PdotxdvpJ5x3naS18K4yyLcmbRCT8rQDfo4x5MWeuTb/5cbLWKHvQfSFrt4VXNqvcZ5eQK9aAnzaLwxPXgZCDvgm17SyRkpKcNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab79c8a-02e3-4a3b-d804-08def45418f0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:18:36.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbzdoW4zgORmclbk0XLziJ4sXIfnEoiFvOW2HQsR6ljPqbcHBYQPkf+kpIHm/DXKiyA4jUT/A0Srexh04v2te/UuFm2yrghdxWpGyZumlns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools, together
with shareable hole-reporting helpers used by SR-IOV PF provisioning.

v2:
- Rename ggtt->usable_size back to ggtt->size.
- Remove the ggtt_insert_node_in_range() helper.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 175 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 3 files changed, 171 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..eb02f9b84d3c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,7 +113,7 @@ struct xe_ggtt {
 	struct xe_tile *tile;
 	/** @start: Start offset of GGTT */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @size: Size of the usable allocation range */
 	u64 size;
 	/**
 	 * @flags: Flags for this GGTT.
@@ -141,6 +141,15 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable: Shareable range within GGTT */
+	struct {
+		/** @start: Shareable range start relative to @mm start */
+		u64 start;
+		/** @size: Shareable range size */
+		u64 size;
+	} shareable;
+#endif
 };
 
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
@@ -354,16 +363,46 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static u64 ggtt_accessible_size(struct xe_ggtt *ggtt)
+{
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
+static u64 ggtt_total_size(struct xe_ggtt *ggtt)
+{
+	u64 total_size = ggtt->size;
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable.size > 0)
+		total_size = max(total_size, ggtt->shareable.start + ggtt->shareable.size);
+#endif
+	return total_size;
+}
+
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+				 u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+	u64 accessible_size = ggtt_accessible_size(ggtt);
+
+	xe_gt_assert(gt, usable_size);
+	xe_gt_assert(gt, usable_size <= accessible_size);
+
 	ggtt->start = start;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	xe_gt_assert(gt, shareable_size <= accessible_size);
+
+	ggtt->shareable.start = accessible_size - shareable_size;
+	ggtt->shareable.size = shareable_size;
+	xe_gt_assert(gt, ggtt->shareable.start + ggtt->shareable.size <= accessible_size);
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt_total_size(ggtt));
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	__xe_ggtt_init_early(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -438,7 +477,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -610,16 +649,48 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable.size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt_total_size(ggtt))
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	u32 mm_flags = DRM_MM_INSERT_HIGH;
+
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable.size > 0)
+		mm_flags = DRM_MM_INSERT_LOW;
+#endif
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, mm_flags);
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -641,7 +712,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Inserts a node into the usable GGTT range.
+ * When a shareable range exists, allocations start from the bottom
+ * (DRM_MM_INSERT_LOW) to leave space at the top. Otherwise allocations
+ * start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an error on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -653,8 +729,46 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable - Insert a &xe_ggtt_node into shareable range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Inserts a node into the shareable GGTT range.
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an error on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable.size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt->shareable.start,
+					       ggtt->shareable.size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -662,6 +776,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -745,6 +860,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -765,7 +881,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -906,24 +1022,30 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_largest_hole - Largest GGTT hole
+ * xe_ggtt_largest_shareable_hole - Largest hole within the shareable range
  * @ggtt: the &xe_ggtt that will be inspected
  * @alignment: minimum alignment
  * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
  *
- * Return: size of the largest continuous GGTT region
+ * Only holes within the shareable range are considered.
+ *
+ * Return: size of the largest continuous shareable GGTT region
  */
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 max_hole = 0;
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -939,7 +1061,6 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 	return max_hole;
 }
 
-#ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
 	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
@@ -1078,27 +1199,32 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	return err;
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_print_holes - Print holes
+ * xe_ggtt_print_shareable_holes - Print holes within the shareable range
  * @ggtt: the &xe_ggtt to be inspected
  * @alignment: min alignment
  * @p: the &drm_printer
  *
- * Print GGTT ranges that are available and return total size available.
+ * Print GGTT ranges that are available within the shareable range and return
+ * total size available.
  *
- * Return: Total available size.
+ * Return: Total available shareable size.
  */
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -1115,6 +1241,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+#endif
 
 /**
  * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a69..c441e39fdd47 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#else
+static inline struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
@@ -36,12 +46,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *e
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
 int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..baed91d2bfd8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -531,9 +531,13 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_insert_node(ggtt, size, alignment);
-	if (IS_ERR(node))
+	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
+	if (IS_ERR(node)) {
+		xe_gt_sriov_dbg_verbose(gt,
+					"VF%u GGTT provisioning failed: no shareable range\n",
+					vfid);
 		return PTR_ERR(node);
+	}
 
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
@@ -711,7 +715,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
 	u64 spare = pf_get_spare_ggtt(gt);
 	u64 max_hole;
 
-	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
+	max_hole = xe_ggtt_largest_shareable_hole(ggtt, alignment, &spare);
 
 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
 				max_hole / SZ_1K, spare / SZ_1K);
@@ -3498,7 +3502,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
-	total = xe_ggtt_print_holes(ggtt, alignment, p);
+	total = xe_ggtt_print_shareable_holes(ggtt, alignment, p);
 
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-- 
2.34.1

