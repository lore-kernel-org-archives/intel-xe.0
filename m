Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABA1CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9759510E1DB;
	Thu, 21 Aug 2025 17:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fbl9SOq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E71510E1DB
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755797052; x=1787333052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lptsNGHb25hf4SsM3lbvx4ROtUDw3er30/3hOvYKoow=;
 b=Fbl9SOq7Y/H/lO8QSzIOQgoO2ssVOo+209MlobBStI3xaLmTEOkLqq0z
 tvM0ozmKPZBWrkZdNe7ZqCDsaCwbvBoxGA7bYtebcBjiD8Agky9PTBpDO
 s6vWQ4E+Hnzy25zUUguCxHKDVm9+UW/utsyLK36yjP1CAlTApCYhrDeDR
 7UOukBLSWQPoTY+oU9Bg6QyHiJRZMKjqLzVL+DFqJpTiPzY6sU18slScW
 8IQJ6L/8c9aTPJPaFH8//OE4moSS3ko8PQkYfMYhufBBid5cXbcEU0Oyy
 vCePPq8bl0n4S3nXygwaNTMmwRMii1kMek387SA1lHMmiTA0f8jWOZNfl Q==;
X-CSE-ConnectionGUID: 4tH0oINGRbOoUx3KLmp0sg==
X-CSE-MsgGUID: eaP5pja5RrOY2jRPsYpVFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57957988"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57957988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:24:12 -0700
X-CSE-ConnectionGUID: z+iZpK0AQgmw1t9zvIEROg==
X-CSE-MsgGUID: 1ItJzT5sSAK7sI7rEgBdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="167972189"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:24:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 10:24:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 10:24:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 10:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d33tlA/ANdOnrBtS/DnVEcwHwpt9BqwRm+93/lHii/jw60GznlbBxyFBm+CtieYwgX2otkI1l5cFQHJNpWFv9li/fblY/NHckr9XtyexZa13Xvu5F598IP4cy3SKVUZ0uycLSDxtzOKlwADIRE4NRPOUPPpD/J+Lcga8u2MwgEi5fZRRMaaDRyTIxaqgdxphWFWIyYvxOYMLgsrtw7djevX9n7+xF1x+iFk5rPURcUVqYTWpjHfMJ+Zxq2u7juItwBQ4e4kKOM+fIhkwOsen48GFwhfQl1q6A9atJODxExcBYHEKBNf6Es4ugsXGYalyfccHe3oBePgaLSTg3cLkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kldKPXNV4nfTYQugD4GgA7RnvCg2PP+LfTK9eAXNCnk=;
 b=sytDbtxxgreTAVc91DQx2r5jd5ilJIQID9H0idFDa3jH+QS5/BcTzlmId8JBmhSp3Yd1RdtjZLOIZoE8ozlXKjuGiPt+v4hvL3vnfFo+z4njJcPdKOA6983d2bTDvsCzjnpvKweFFO/QS8wwJ9Ql99NLaHxurigfkRPlh0Lof9qipwJSSge/SUN6f2uT6QjXSzL7mPOYuMIxQkEXDGRqozja1rYSaD+rMqxCg+6PcNRSM7Ku1ly3guviFOKcWuC4rexNtQAjY+nHc/c59zbIqLeV9Hk6LL25y2FKpG/D/xMJWThnsRV5bW88d/a86IJCCubnnMTmQcl+bBroI+FpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA1PR11MB8801.namprd11.prod.outlook.com
 (2603:10b6:208:599::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 17:24:07 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 17:24:07 +0000
Date: Thu, 21 Aug 2025 10:24:01 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <daniele.ceraolosuprio@intel.com>, <john.c.harrison@intel.com>,
 <brian.welty@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/psmi: Add setting of PSMI feature flag
Message-ID: <aKdWMWDsgQvCt_4U@msatwood-mobl>
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
 <20250716-psmi-v1-1-674c13d7028e@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250716-psmi-v1-1-674c13d7028e@intel.com>
X-ClientProxiedBy: MW4PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:303:85::19) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA1PR11MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 97641227-46b2-4c96-9da0-08dde0d78852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZklhUml0ak45OHVKc1ExSzV0SVF4WVdGcFNUVHcxT1BtZmRIcHFmNUdkUGVM?=
 =?utf-8?B?L0IrK25jVnd5RDJVR0s1S1FNbFpVNlpPck9xMmJWSC9IOC9mTTVuYk9KVzRw?=
 =?utf-8?B?UngzRDZqUkNSR2pBcmk4ZkR0QTJYZUZrazVLOHVzL0J2SWozWEZ2a1Qxcno3?=
 =?utf-8?B?ajBjQXJVVmx4MVRnZVEwTVpra0V3M1luWlNVVVZYWDM0WkRuZ2E2M2FWRi9w?=
 =?utf-8?B?NFdWTWppRlE5S1dWRGVYZk1lM3g2WXJXaXJoSFFpeG8wVzNEbFlGY2I0RGtH?=
 =?utf-8?B?NVNrdXRFMW9JZHFRWmxONHV5REtLN1R0MFBVZXR0NWV6Z1FDUG5iaVoxZExa?=
 =?utf-8?B?ZFZxd051am53MWs0RThXZ1pEQVNOTkZZR25zcVRBNEVhU0s2REttUm92R3ZU?=
 =?utf-8?B?SEpCRENxK3BCSDIwZk5ZeTVJUkUrUkxxbjdCczV2SFR3UE1VNExxMzYwS2ll?=
 =?utf-8?B?SVVJK3IxWXFRaEJyRUtSalVmeDRYNTdhZ0xaSndJNTA1NHN5M1JJWDRGSk5k?=
 =?utf-8?B?SjBpNFg0WHhTVjVNSTljcEwyUHpOZjc4RXlPMHN0TXVScDRhYXBpNGNCN2Er?=
 =?utf-8?B?dmZYcXVHMlpRWXF3dHdxTE45d2JndnhiUVFzdDlscVhyendQcU1URGRGcll4?=
 =?utf-8?B?cWlteENOekFKZ3pnd1ZnSkl2RG9lanF2TVhIc1N2SlRjYU5RbVdZOFJTSVB2?=
 =?utf-8?B?OWtkYWpKWk9XMDdxdDMwMmpkZ1FYeFh4Y1pGc3lQekYxM1ZIcHJMQ0JDRXRC?=
 =?utf-8?B?bmUwL2RNTHcyZll0MEM5R0pjN0NvczFaZjdwWHJ3Tmd3MDlNczVMRExHb1JX?=
 =?utf-8?B?UnhIdGpNeFNIakV1UEE5Z1pHZG1WSGxqcTdKYzY2aHpOU1dvbFljY1JJMnlU?=
 =?utf-8?B?ZzNQZXF0MnVKQTBHTzhsbzRtVFVlaUlyM0svM2F6QSs0RkQwMFJoWWVHandU?=
 =?utf-8?B?elFGRU5PWjUyZzF1ZEFJVVMzVnZsc2RnVHNKaWdMMTdzR05pVGxFekNOajJq?=
 =?utf-8?B?MFZMRStncTB5aEYrQ2ZNdHdYeDN3QzZad25nYmkvS3JkeWhUWFRZanR4WEw2?=
 =?utf-8?B?MXpjSGFWSldiRExIYSs0aWR2WXRCWGtQUkdTWnZudUpPME9NbkhXUCtmN1Mx?=
 =?utf-8?B?RGtlNHoyQ1NXMHE4bkJrVllURnBuZXc5SFdpVHdocmM2TU1WRC93OVFleEVL?=
 =?utf-8?B?R3RWWEYraHIvVzVCZ3dOMlQzNXpNVW5vT2NqTW1Mb083YWlPbWc0MUJ4U25x?=
 =?utf-8?B?ZitvS0hPSzk5SXFRTWtVYVRaMkl3aDI5eVlDcXdmWHVlMG1weGZqUTRZaEdT?=
 =?utf-8?B?QTNPaldjOVhhRjBvUU9HaWJzSlZhZm92NzZCSWRFVkVRZGlmZXdCeW83VG1r?=
 =?utf-8?B?UmFSY2R5ZkQyT1FqVzNNQ3NRS1NHMThVU1Z0NlpSVURMMnFhWWZxeVQ3VXFP?=
 =?utf-8?B?WnVIWFNDUW1yQ0g3UEJLeW14bE5maEVWU1JLQUdtMzVsc0tJTEFqVGZmSEtD?=
 =?utf-8?B?M3VJcURjYlVPalMrOTRpeDBFeERaUVdDRVVTWHJjZlJmL1ZLN2VZVk1nUlB3?=
 =?utf-8?B?bEVUZHljeUFXV0p3Q1VRVlA2ZkoyYmRiWE1rbHhyeXdzZkdUcWNsakRYaTNi?=
 =?utf-8?B?WS9DanJ3MUw0bFowb0x3Yy9PVFRiZ2I5NE9hdlFrL0ZlT2xWbUxQaDZtUjhQ?=
 =?utf-8?B?VWFqM0NLMHQ5aUpScGhqUjFRYStNNlp6b1BGM1BrM0FpT0pPKzI2TlRmK055?=
 =?utf-8?B?MnovY1hqVDJkcmxZWFh0KzFYSjNKTG9pYzJBVjh0TnVSbjUzMDc5ZWduVWl1?=
 =?utf-8?B?cGMwTk5CRS8yRWU4dXIyd1g2eGNhRUtjTElvUWM3L1dCVnZLbi9TdzA5dFYz?=
 =?utf-8?B?WTdqME9IYXhXQXpXbTh4dmc2M3cwTHcwTkRzcGFHQld5K2dpSmc5SFpBcEgy?=
 =?utf-8?Q?uzrxqYDtHuU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXhtMDdOQVdZdzZOdEdxT3lJTmY4aUZha2NPMWJEM21wYndmNnB1eTdCN0hO?=
 =?utf-8?B?dkE4eTRrRTBSRFJWbGlSaWpuYTBxQ2VkZGxaQlUva1NPaWxpeGxseUJjclFq?=
 =?utf-8?B?K0JtNVI3M3Q2aVdqcndDQVlvKzZNOUkwdDU3azkrNHY2Z0NtVWN1bHFuV0ww?=
 =?utf-8?B?QkUzbDhqTnh5VzhBT0NJZTBEa3BQdm1VR21SNENyZjNBSDVWRTBXTWg5VVFZ?=
 =?utf-8?B?UzlxeFdpM0xsTXFxTHlaSUdiSFo1UzY0SEt3NEthcGVaSXpPcXR1Z2syWkNK?=
 =?utf-8?B?ejAxVjB2M2RQNUgySTRmSElJZFNHZFM4Z3QyYVU1dlhSREpEU0JObTJGeENQ?=
 =?utf-8?B?WlM5MFZjSVZnSjVMWEZzc1FkcmhvMG5GNFdmMklORFlRV1hST0hpM1VjK0tl?=
 =?utf-8?B?MHBsODhBUDU0VWo0VHl3WjJFNlVPLzNWT1dNT2pzcUFrdk4yNXRZQVlpcjhx?=
 =?utf-8?B?azdLZ1FLUVVjQmg4dkxUOTdhcXg1Rit2THZ6eEdVZFRJTkNOYjY0MUlsSXNF?=
 =?utf-8?B?YVRaRzl2bGJUOVlJSmw0UlB2VUVnNlRWZStIUUxFSDMwV0NpS2JobWJJb25D?=
 =?utf-8?B?bFdUd2Z0TVNKcVhiV3BUdWVJTGMwR3RwL1NsK21ubjN2TTdmNkF6dTRqK3Yw?=
 =?utf-8?B?UDVMNzduZ0YvYlVuSmppdmdTS3lBN3NoWWJxNmwwUkJZdTlVd29mNWFtNHQ0?=
 =?utf-8?B?dXlNeVZhRkJTcEpvUWlmekZnV1hNcGdpOFdXcm96em8ydVJuR3JXUXZpRWJT?=
 =?utf-8?B?LzBubFhoVENCV3hUWW5hMkdzNGZlcFVEeFhZQjVRUWpQRnVNRHhuWWFVK0RH?=
 =?utf-8?B?alNYbTY5cUo3T1A0K1pnYkVZb0ZWY0FqakNHM0lRd0crVHpFckRNaEJML3Vs?=
 =?utf-8?B?eDdZbXRKc3gxQk5VeXhXLzhETlU4dXdTUVRBcFJFWVNEOXRtNWNBcDVyVTBC?=
 =?utf-8?B?MUpBN3Z2b2tRN1ovWTluTTNLQ0g5QldPQWo0enZuZ2lGTFdRNktQc0x3Qlhh?=
 =?utf-8?B?eWcwMXNGbGREZkhmZXdoZHEzbnpzRElBcmRMOXJ0aFdxVkViQndJaXE5VmVZ?=
 =?utf-8?B?UUszYVpCQ0tFMnlhbXhzYXk5NVVjalp4QW5Nd1RPQ3pBdHpaaGtFcFc1blhC?=
 =?utf-8?B?ZDBWTXN5ejhQKzhPVU5yei9mL2ZXZHZoNDkwOUFTY1l3dVVjODdncmpkdjVj?=
 =?utf-8?B?YUswNEJmK2JaSERCaHZhbTJVN003aTJ3R042WTlMZThvMDZpamN3enNEK3oz?=
 =?utf-8?B?WHN3aFUyZ1FpZ0ZDd1FoZ3N0eDBxQklBcjhTelFER1BjWVVBd0ptM2lYTEdz?=
 =?utf-8?B?eFdXaTRnVTlzSGNwQWVsWVdxd1BJOUF2QktQUVlZZHZsNlo5TXFBenN6S2NU?=
 =?utf-8?B?YTNSYzdsMEZSMEY1aW93WEpNc0JpNWNRUWhlKzlkNmxxOHlxSkRISHY5c2dv?=
 =?utf-8?B?TlZvK0pMcFNYdlh4UHkxdHN4eUhJWFQ0emJ4VzlicTNvTUwzc3NXUUtvd2ZI?=
 =?utf-8?B?eWp0VE5sYW0wL0RYcWtoQjhQT2NVK0crb0RYZGQ0VnpnMXZGcFlNeHAyUjV1?=
 =?utf-8?B?dUNrWk42aVQvYXVjUXpqUmF1ZUxtdDJraWZnbitkNW9yMEdaSURCZFJkdnFq?=
 =?utf-8?B?QmtBdTNlK3oxZTNLWkZvbjdFTlp2MlNNSzRxWCsyeVExcFFqdkppSFdPZUov?=
 =?utf-8?B?NEtqRFl6aG5iMkoxbTh5QXZMUnI5Z3lQcU5BNkhBTWhTVkg3SUlEOTc2VGtI?=
 =?utf-8?B?UnBId0UrUEtKZ1dDZ2M5eUVVd2lmVUdDQW45dnNYQTAvSlBteEx6emdwWUJI?=
 =?utf-8?B?NHBmUEtHdDFEL1V6TEQxMUoyMXlBcXlwSytiRW4wSlZTU0QvM3dsdnkxaXFU?=
 =?utf-8?B?MEVVZTJvT01qVmlFanNNeGdqbTJYaC9Ga2dlOFVDU3lNa1VadjVJcDFNVTE1?=
 =?utf-8?B?T1orSGU0WTJlUngxcVBXYXRLVU10czJEcWhOOXhjMDVqNWExMTUvUHlzTDBR?=
 =?utf-8?B?S0t5bW1ZZ3huSUVVOUd6bXhsdkVLb1d1Sm9mczc2VUNEOXQrNXA2dWM3aVVP?=
 =?utf-8?B?ajIzVVBxSU90SHZpa0FFM1N3QVM0VFNCaU8vUTU3KzRYSHcwYldEMU1lR0dR?=
 =?utf-8?B?S1JEcytPQnJWYWV1bk9wd3JVZThwTEFvSXVmcktoQzlESzdiZUNWWDFvSXFi?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97641227-46b2-4c96-9da0-08dde0d78852
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 17:24:06.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zKpzycV3di60CI6D/BifB9ARgxQ/jmO21r4Mr9m5mlb3SKBkYoS1oy8oR6EMHPSnzBSBR9DxD+fsQ+EJj1ocugiY4UQI1GBIExqDfGoIzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8801
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

On Wed, Jul 16, 2025 at 01:55:44PM -0700, Lucas De Marchi wrote:
> PSMI allows to capture data from the GPU useful for early
> validation. From the kernel side there isn't much to be done, just a few
> things:
> 
> 	1) Toggle the feature support in GuC
> 	2) Enable some additional WAs
> 	3) Allocate buffers
> 
> Here is the first step, with the next ones to follow.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Original-author: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c      | 3 +++
>  drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>  drivers/gpu/drm/xe/xe_module.c   | 3 +++
>  drivers/gpu/drm/xe/xe_module.h   | 1 +
>  4 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b1d1d6da37581..a117300501247 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -86,6 +86,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  	if (!guc_to_xe(guc)->info.skip_guc_pc)
>  		flags |= GUC_CTL_ENABLE_SLPC;
>  
> +	if (xe_modparam.enable_psmi)
> +		flags |= GUC_CTL_ENABLE_PSMI;
> +
>  	return flags;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 6f57578b07cb0..2a5256c24b9d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -107,6 +107,7 @@ struct guc_update_exec_queue_policy {
>  #define GUC_CTL_FEATURE			2
>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
> +#define   GUC_CTL_ENABLE_PSMI		BIT(7)
>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>  
>  #define GUC_CTL_DEBUG			3
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 064093bf1adca..2e6ac082f7bee 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -57,6 +57,9 @@ module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
>  		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
>  
> +module_param_named(enable_psmi, xe_modparam.enable_psmi, bool, 0444);
> +MODULE_PARM_DESC(enable_psmi, "Enable PSMI capture support");
> +
>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
>  		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4c..a84af8eccb91d 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,6 +12,7 @@
>  struct xe_modparam {
>  	bool force_execlist;
>  	bool probe_display;
> +	bool enable_psmi;
>  	u32 force_vram_bar_size;
>  	int guc_log_level;
>  	char *guc_firmware_path;
> 
> -- 
> 2.49.0
> 
