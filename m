Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D095BC27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 11:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAF910E902;
	Thu,  6 Jun 2024 11:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdHLmsr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CCA10E902
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717673362; x=1749209362;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EmJIQWln3YQaeATUfdaKxNzJ99Cx5aWOKG+vmKOx8N0=;
 b=AdHLmsr4Qp3E1UcpSias7u4jt2XwarxqTgMEe4TFakc/jQWlxlg/DxpF
 0qllzogTyp01jf5BLRxkU/lHJ80gITAlG94B5m2B4f7bSWkF4vWpZxXdc
 cnGnwodqJGu0r3YrtEYQ7TnbTg48j7EKKY6XAlXJV7q/gtBfnd+E6Q0HY
 yfTwkf2MW2yoSnmGZGkLgrcQSKP7EEfMTzjza4h9EP2vc3WS9j2eNW2kS
 e3fEkyICy8JXVEK0Rxo//WEb8gUgU5RHzQ/hHxVMws7OJIkT3UvO7h7O7
 xOUl6bYWWQNOapgPqwUEZZJXi8wWKgeLQGUz+7f2Ggbpa22qq1zLKNs0Y w==;
X-CSE-ConnectionGUID: vxqjTkrNSJWBh2mBhFTjew==
X-CSE-MsgGUID: pGtGkhaISeKY84y7KeRcXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14171955"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14171955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:29:22 -0700
X-CSE-ConnectionGUID: zq/jZI+rSQS29H6RAtzYzw==
X-CSE-MsgGUID: 8PougFbiShGRBQxlsBs9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37937749"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 04:29:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 04:29:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 04:29:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 04:29:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 04:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9UTDm/xm9iQuhXzGzbzK/cpK+f6SExPTzjofjQNJn97H563b/wmmnVGEDwu/wFOHgbH4F5i2X3/K4xQt4q9imljL+E3zBWf7ctfQmCUCBufrzpF7JXuoq1YyRyjgJZbG3ETcIy5EfWbIgxx7At02FeqLMtynEO7R+RctA+hMzZklICIiRpayyb3Ij+LAb6rQ8fN4QLDBc5i4UrxbMyW0b9QB5CkqlXUMdqJhhK7IUnDZTsaAVCSwMnwwIRs+eE6eXMh8uC/j+fJdT9sk5kpRSh1GTQa97xkrnvqXUsbWu2bQfXTmvODOVCZj5TI5Dtv/cMUOuvNDCIDU4YEuCSc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pcy7cV7uw0GQHzPCDW4YaNWQK6ub0l4n03QAyb+0ec=;
 b=KgDIlqgzXtCAHJJyxt+GefgMHg83oKFn3mQvU8DZ+qd31rg0SnrHo/OWirtYJrIfmDpetcqKOKUwtuHj4j0NW6iTNrBsrxHTaF7JYSFP5gDlntIqXaHXyv/cKX2LwcQcriK1UrypYJz8gKqGCkZA3HM+/208pjYHyzVgmJFypQYm39qsheODOkiNmRPO3GinshPaP76SIgdueVPBnAGT/heftHETYLUuCYxd20A0FDv3C5YfonndpjGaVgKwvkrA7MGdbijNf8lNuHIUvvOPTVQtJnPadfqwpJNNGATRBPYQR36dfnTZCONRKW4b1kMUkZl+VeeP8ylLIT4145E7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Thu, 6 Jun
 2024 11:29:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 11:29:18 +0000
Date: Thu, 6 Jun 2024 13:29:16 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe/vf: Support only GuC/HuC firmwares
Message-ID: <20240606112916.5qsne74isbfkyypr@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
 <20240604212231.1416-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604212231.1416-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 2477b8f2-3e8c-41fb-b514-08dc861be790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUgwL3dZTGZORDkwajFhNE5kZ0xwcjdVNmEvZ2d6UnhnUFNsOXdaZStGRGdT?=
 =?utf-8?B?MDJmSzhvUXdYSW1XNXpCNDZ0cjBuYkxQS1U1NnZOWlVlQUJlOG5MclF6dWtZ?=
 =?utf-8?B?cDFLem8zUVJvaWd0eTZEUXNwNVI0QXNFS3NaQWtwcTlrTHd0TU1ndTFRREwz?=
 =?utf-8?B?MG5hQmxOTzhmZG9zRCtGRDVBMUloQ2FnNy9JSDY1Y0gvMWdZdDhXd09HUFVW?=
 =?utf-8?B?SmcrRTV0VVVRRzcyalNNS2FhTjBxc2JNYklaSkN5MCs1cVdjNG9aTy9IdmlJ?=
 =?utf-8?B?QTRrZmZsd1dDL0V2eFozZjFCVjdFVi8rWUhWZEY0V0pHUlBtWmVZOTEvNHVK?=
 =?utf-8?B?OWx0VWYrZ0tkWmp6VFJkTUpKa3NtN1FQcnVMclM4K1JIelVWaWRmOWNuSXc5?=
 =?utf-8?B?SFBWSEhVT0pHK25KZXYxeXd1SVNuNWxZd2w1Wm1oSWpuQWhpRktKL0dHa0My?=
 =?utf-8?B?NVF5eHdSaTRrSGJZQU5HdGhtVzNmeXcwTEdGeU1xdHdUdVlFNkdsNXJYQkJZ?=
 =?utf-8?B?NDNnMC9kdW05UThDNWx1amwvcE4vdHFzUDkxOTlxVHRMbStUZHljMXlya1gv?=
 =?utf-8?B?cTJsa1ZlTENKVUZZTHZOR3cxenFKRmFOTzJ4MjU2UmFoZTFzb0gxUUY5Z0Vi?=
 =?utf-8?B?d1lCTFhJQ2hacmxzMlIrRzhBSU4wKzJoZUVhL1l1bmRxdnZreGZralFlTFg0?=
 =?utf-8?B?aFVZc25pUEdzN2dlYUNaQ3Nsd1hUN1FPTnIzdkZYdXczZm1aRklCU2hWSlZX?=
 =?utf-8?B?NnQrMTlYQmZLejN4T3dCaGl5YVh0V25MZU1ERW1HZFdHdGtQK3dVUW52WHIv?=
 =?utf-8?B?a1ErT0xCUFNGMEdReEtzbjRrcXRhUjNQelJMaGpiMXVxMWd4NzNFV0xaVmVp?=
 =?utf-8?B?eXdCUWZtWHhtN2FBMW1GS3ZxRW9aMkorNHFHeCtRSHAwMWQwTjNhUVRRemNt?=
 =?utf-8?B?d2QvbjNwWTZEREM5b0pzVExmZFVpVGFlM1h3WmFwcFRITmd3QlZ4djJqVVdn?=
 =?utf-8?B?ZFY2RWFFc2pTcnR1T21FQ09kSVlIMytsdDkzYzg2RStCeGtUR2ZyR2hWZ2NC?=
 =?utf-8?B?bWZvOHFKb25HYnl0MTQvNkNyREdBSjlaM1Q1a2RGYzdkTks4QVJtUGVtYXJZ?=
 =?utf-8?B?V2RTQ3hzSnNhWjk4d0x3RnBud3dPTzVva01OSmhqWS83a2tiTTdtSlJ6bXpw?=
 =?utf-8?B?UDRuMjFZS1UrR1hyL2YyUzhVSzliSEgyWnl3SW5xQnp2azN3NlkvdmtCemNx?=
 =?utf-8?B?aFF6WDY2cHFvaVRhc0lTeloyUFhBWVFERGJYR3hXVmVQZDBJRGsyQ2dNYUZl?=
 =?utf-8?B?cmhrQnhMM0d5ZnFQaDU1YUd1ZjI2b1JYVkQ2eFl1OERzTllkdmhZYzlvYnls?=
 =?utf-8?B?L3NVYUlCdTJOdGF5Q3lZWUgwZTk0R3pQdHdTeGd4QktObnUwZldVajkvSzU5?=
 =?utf-8?B?ZkV2S1hocUpxZHpUMzJBbTIza3JkTHdWakVrY0IxNDNQRDFqQ2dlZllEN0dM?=
 =?utf-8?B?QURWaVhqV1YrMW96bWo5K0ZNYkIrYlFoWGFLb0pmNjJ4d3BzaGM4bkZUYjIr?=
 =?utf-8?B?UHdVblkvOGFjY3I3VnpqNGdGVmdsVDBNMHZzSUxwLzdKYXNBbmVyak5wZDhW?=
 =?utf-8?B?WmREZDA3VGJXM2pxZEtoOThpbStyUDk0QmhOR1NWNThzTXdTMWRza2tjQVpB?=
 =?utf-8?B?QWZTM1dEOFdtOVVQS3cxdkxWVC9lNkJMaUlmZ3I1a2x1SW4reG1ETXpEMUxC?=
 =?utf-8?Q?/b5mFi/7P9nyQ2J3yct4hAolorqak/e1u9oZa0K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlxeno4Rmk0MzIvOStkUktCNDhGZlZJZHRXQy9lQjlHRlpUc0RpR2VLYito?=
 =?utf-8?B?Zy83VitkanJ3aWcrK1krRUZueHVPNHJZY3lXQkxlWEE2RXNCVkFiMHNNZzcx?=
 =?utf-8?B?T1hEUjBiczhmWnpnaUd4bWIraVIyS0kxSTZ6cFk5Z2FvM2dIZHhQbXFLMC9I?=
 =?utf-8?B?TWZDbXVKVzBzSzhka1FJbE1VVklwQVdrMmNFdmMyWFo4bUUzVitONlJVZ3JI?=
 =?utf-8?B?Y2RlSTdENlg3Tm5FeFAxSUFKM1lHVWI1Mmczb1pwbkx4MDN3RFN5U21XZ1R4?=
 =?utf-8?B?aDA3b05DY1V4L2dDdDFXOWZoM1BlL29lRGpBb3VjTlFNNGVMWDBnY0FUemI5?=
 =?utf-8?B?aFltWWQwRy9tK0ZxMjA3c2JpUWsxbVNEckwxVE5UVXQ4bzdtc0xtMGtLNG5p?=
 =?utf-8?B?MFBJN0JLQnp0b0NEMmZSTEh2SDVlMjdYc3NQWHlXajh6WU03U0xuRXBROEtP?=
 =?utf-8?B?Z0l0Z2kwcXoyRG0zdXZOQ2R5ZFFndENlWDRmU1VOQzN6eUdDYWg3dm0vSU9I?=
 =?utf-8?B?VWVWcTFaMW5MK0R1Vm5VMy9pYjdjQWRKQ3pUKy8xSEUzVW9oc09RMDQzeE9I?=
 =?utf-8?B?ZldsOWJDa1hSRjlXYm9xRFIwRHdWU2tOUTBEZThhMkRMRy9VaktLSHNNOWhx?=
 =?utf-8?B?SXVKRXdIOFNGSTU0M0tQV3VUc01pc0hpdm0wSDZlOS8wVVlWM3BhR0tkTkZs?=
 =?utf-8?B?RlJRS2JoUExucjkvWnpkcjZPend3U0xkd3YrNjltcXJ4Skh1N1FDK3dub1RD?=
 =?utf-8?B?UDh6V0J4ZDRDSjFULzBNaTBETkFBRktWVmxiR3pZa0dLVWg4S0tRZ1BuZDZH?=
 =?utf-8?B?aE5hVFRrSnZqbTN3clV4cDJTTDQzRmJFNC9MZVNwLzU1dEY0bkYrMGxpVkVx?=
 =?utf-8?B?N3NqbFFibnA2VmdGc1h2alMyY0FxNEFTTTk1VXhSeHZNNmR0eGRJblNxdEo4?=
 =?utf-8?B?a1dQSzJJSHo5ZkozUVhubEFSZDZwaVlaTnVwdXZramN2MUNZUHFDY1EyazBJ?=
 =?utf-8?B?T256SmQ3L2hUdXRPeUFhU3ZNVHZWckFYbUtkUjZHNE00bTYwYlN4TE1IRFVn?=
 =?utf-8?B?b3MwYm1OVFRxSEdSTS84OTJiUllGbXlYeEUwZndoK1hQMDh0WSt2WU56TTlp?=
 =?utf-8?B?elBNNDVnUlJ6RndEaEVoTFlyeTA0eWNMOU9SZm5QK3N3U1lhZDc1SmNQUWl1?=
 =?utf-8?B?Yy9sQ0g4RkpYOVJGMjZZVkxZMGVKVkZCNXRKWnRvSFd5Yk9RMk9YOFpGZ0ZM?=
 =?utf-8?B?SjU3OStjZm51Wkg4d0dWQnZqUFNBVkJVYWV4NUliL0VzNTdjVUp1UGs5QWVk?=
 =?utf-8?B?RGtFa3EwbjcyT3Evb1FiS0s0MW1NRkphM1FuSll3YnZ2dDkwZFZoVUdYL3Ay?=
 =?utf-8?B?bjluWEVrbTVEaVRuK0ZnbmpuTXIrazRzVGVPWkNQNm45YTIvQlNLMzdiVVB1?=
 =?utf-8?B?WVFtK3NjZHhoQjQ0WE0wNTZjR3FkaUhkalpwUWxtbHNtU1RmZlh6MmwvaHBx?=
 =?utf-8?B?T0wrRlRBZ3B1ZDNoa2h2S0x4QUdONXo3S3JrOXlTdFlLQ2h2M1B1bGZ3UUZE?=
 =?utf-8?B?eCt1K2JEWXBRUDFQTkxOeVlVaE1tLzIzVlhyVTg1VmVMbEhsQXBnakRIZUVQ?=
 =?utf-8?B?b1BzVUdOR2UyWGpzbU1uMUVRY3FHbEpOMlRwSmpDVXlEbkMrSnp6S1NiUmYy?=
 =?utf-8?B?cVhsVEN4R25TSmdLN1RhTVE5MkMyOWEyM1F1YjFDM3k0Y0NFRVZhalJpanZU?=
 =?utf-8?B?ZkxERmtZMHlpbUVMSy9LMHdsaUMyVndEUlVmQXMzMFkwdjFxU1FOdmozbUFs?=
 =?utf-8?B?d3ZSbmk0ejliaTNhZ3pHb1FRdEZhMUtYWWFFbmtZWDhoNjIrVE85VmNpRmtH?=
 =?utf-8?B?blphWVB0NkVnejdPRi9Zd1d2VVdCajNPcC9XcS9EeXB0eTEyWlVwVTFIZWQz?=
 =?utf-8?B?SUF5Q1h4elVxQ3Q3TnVSOVpUVkJETlN5MlMwS1BBV1BQYkJteVJERytuRndq?=
 =?utf-8?B?NFRxRTZ6cDRNazNENVJ4YW5yOEkyb3hnRzNIRFZ1RjMwMW9xQUhIQ2ZqeDhJ?=
 =?utf-8?B?V0pjUTZLY3FDRXRMbVFuSDZjUGlIc0pjYlQvdjZqZzVpSWtsV2Y2cUdZbmdF?=
 =?utf-8?B?TWNVTUU1WHN0L2ZTUVE2bjRGSmRpcHZ6QWswNGFRaVRkbWd0WENDeVp4aDdV?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2477b8f2-3e8c-41fb-b514-08dc861be790
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 11:29:18.8616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kuAs7uB7CoqPEGNO6N92r8L2UYuqvCCKnrJ2U6XgEBcFoYbB+SU7DjQ3tYB1p58Ip86mLLpIlThfc0NERfV6c71qkk8siFNQUx3MRwMKsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-cze-04 23:22:28 +0200]:
> Only GuC/HuC firmwares can be used by the VFs, don't claim support
> for any other firmware (like GSC) even if the driver can support it.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 12346645a8e5..a69c61f6b064 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -657,6 +657,10 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  	uc_fw_auto_select(xe, uc_fw);
>  
>  	if (IS_SRIOV_VF(xe)) {
> +		/* Only GuC/HuC are supported */
> +		if (uc_fw->type != XE_UC_FW_TYPE_GUC &&
> +		    uc_fw->type != XE_UC_FW_TYPE_HUC)
> +			uc_fw->path = NULL;
>  		/* VF will support only firmwares that driver can autoselect */
>  		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>  				       XE_UC_FIRMWARE_PRELOADED :


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
