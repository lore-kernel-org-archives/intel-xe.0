Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D101C109E527
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 22:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDCA10E02D;
	Wed, 25 Mar 2026 22:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPMUr/D3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04C310E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774478292; x=1806014292;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BouwosHue6B8vSZEYnu6TEL9k8obKW8vk2A6DJXxtpU=;
 b=VPMUr/D3I/pb6NXWQVX+YlWpFnM8lK0/V4Q9omKtgyJ4Qgzp3VX8J0KW
 BLj3/W/GJl6LFz9VqiXtR1nzeFrnCelGS2i/BP1DoGhHSYtPMB5KO4Kz9
 q2TENu49vAVwtKrDHgNEUK5horHF9qu1VOxd9Y1zAk+djHvKHCx2zNN7z
 5KIlr9xcz9CliVpNAMbZ9XQJ9+09vsXiJAj6MuP42Zgr0jikJD8i3CpwO
 9+7fMF2PcDE0apgsLPxGwDU5McOU/otbEsV0L7EQJ86XQn5MRnZOIBlL1
 d2UfHxboGu+Zg8PD4lr9GvSd3TCYGFCdchdoHK060x8Lx1z3NFVF2e4SY A==;
X-CSE-ConnectionGUID: BITj+FWCQ4+CBFU2kVDs1w==
X-CSE-MsgGUID: ExiT3IErRI25UFqFW0Fqwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86145903"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86145903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 15:38:11 -0700
X-CSE-ConnectionGUID: 3LP755EZQ2a3YT6jJJI8Pg==
X-CSE-MsgGUID: AchWurj1TkSvfS/i0K3N7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224835782"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 15:38:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 15:38:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 15:38:10 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 15:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1EDxYsLmamPNA1ISvX1cFml74BUKvcDi4UFhwYrfJIOG6YwGTl9nf+8Q6n2RMPQzJwKkHzRHIa83/2kxlz4y2+HM8dOY9GHfyTNg6H+pwOo5fZhZ7dkVo2q8epekjXc8aJeY4LmXF8e/iICXQzAtTcMajeZW/md4TvMWCwdEwQs7fs9K/MSYso6Xn4roe7B9wWyGU0ZdZP4jp2DGaX/VHMp3kxcvLJQB/0hLQWP/VJ0ef/sUe1e/MYCUVfmRHHymtzHzJvXfogS/FwT2PRfEZcWd7UCkhM+nsKd0yB8wnSv34Iu89Ea65vNXDwf8rUtiwazOHON/wjM0UkdpsgFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koZXFivMfPgCoZLimuv0QyfwOlAmKzyVTCZ0j86/nc4=;
 b=XRVL8Sdr17NatbgnwWipupYB8qxpp5UM+Bm+KaemZlrUdNSC4cDxEtOLPb3CVYD9P2haEf0uC+nSq2rqHLGQi0grVN+j4/NaDvU0TFQIALyVkQtBTPn9cn4XxLIE8OD+DbUxg9w7Fxr/TU8zs1Ez1b+aK9tPiR2zhszUUsEIQQDSLWewUeDg+kKU74v29riCRbRbGgNhCewbhG3LBhs9kD/zorL/VGS8k1l5GB51irWKyxAlqR6u1+y282BLw19bB7fbklarUjQWSGzA84uKbhnb1xjbRTRMKCQW6gz6nnizpGwCc9kZYCoLYxSGcHX3C3Eh4n5nR+Kwf48ZOf9ImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 22:38:06 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 22:38:06 +0000
Date: Wed, 25 Mar 2026 15:38:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <acRjzH6641w5deS1@gsse-cloud1>
References: <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
 <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
 <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
 <acL7D7MVf5F32C++@lstrano-desk.jf.intel.com>
 <b253dfa6eb00aaa61f57d7c9694fec3fea68b79f.camel@intel.com>
 <acMf8wr1wfHoRoWE@lstrano-desk.jf.intel.com>
 <702f79d4601bcf9dce128fe47422f24d830ffe6f.camel@intel.com>
 <acRa+iGbsAqAjjYY@gsse-cloud1>
 <e443be46b4f67e7fe5b16ec410428cb88a4b9765.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e443be46b4f67e7fe5b16ec410428cb88a4b9765.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: dba124f8-be7e-4e2d-b050-08de8abf2ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: fhhBU2TrFn2a/ZUSZMlWqdqO5UMi54b4UrxSrWZ18Z8ADYSuon4B1e3LcD0+/NhHob7nMi+M45iilyEO5QB+j8pPv3sbcYqhP4+6oI9Cppe4pyJ1eHZFxBeC2nuktB3RAlJ2NBPDtnb323JxF4i5jB/KaxKbvQg7EX9J+0Peju150Af52RYGrRQP7brfJGSr2B7Zo7/Ug7qSADrUBv/X4uJYpoXHG8Jkd7Qhka2wb8R7GHWsns23pPg2qgUtbNjcD3oAwtqMFb7dfJf541S1vLLe3z2ON5UEPdq91qBS5vwG/TlwmvVsK20zge/VRNF+FMUPSNHwD8E/PzkL1Ly5LPglon//gYNj6A3fMnep+Sg/UzTrVTGAb+MSa2imAXxlIKKNJui0d+XGUyO6dTN1/nLzFi60z8G4F3w9Jg6nd+vWK1aZY+aQgBXTYNSevpOStKCvayCvmZcd6pRIWlr0i5Edb0REVJoQLwZN2Zsgrn5Qf/1rIoIVrjk2RSbdTjqFehB8VpApDbZ8kFfqK5QrKtbGFTk5eYiupuixjx35gFpIP7H5ZJ1YgTC8mFEXK2zBgalFLtAUevkQqdXOgUtKSGlg1JH0JRbk2awUH8zAnVI3FMU1zmQX92OJRKbFpgbc5XFjokno0H69/Xj2yBdb8JovAddkZlpg56cS8unYjK6ey82NpfeKsfTPxOfFt9PR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZRMGZHcks2TDdOYVY3REpncGlZZGlsSHNQMkhMeWlrL3EwbUl0Tk5kcXI0?=
 =?utf-8?B?RjhWTjVNTGp0Y0d1K3RoZHFJcFRpaWxvVDVXR3c3dG5UMk1KNExVaHBINFdQ?=
 =?utf-8?B?b2pDYkZPc3l4N0VscUwwbEkrck1uK292SUt5dktxUGszOW13S0g3aWpiSG9B?=
 =?utf-8?B?eUNnQXJVYklqMzZYL243djgxMkYrMS9ENUxNR0FQTG5wckN6Z1ZJZ0F6ZjBN?=
 =?utf-8?B?a2NEaGNTVklWYzQvY3Y5WU5JMWVHMmJsbzR3cDhxQWNyaUNZSnYrbUorMDR6?=
 =?utf-8?B?Z0tQaWxtNkZwYUl4YXh3M0h6OGl6YWs0WTd1bzJ2NnhDSmNZUkt6blVTMUxL?=
 =?utf-8?B?Sm9CZjNoYTJFUFRWaHhleEFGb3RJaVExK0ZNVldaTmExYURMYlBvSXo2S24r?=
 =?utf-8?B?d0xsOVh5NXVUM05LOFBOemlFTDBDRzV0WHdpdUI0U1VjUFZHMTM3ZHQ4d1pw?=
 =?utf-8?B?dENzMU83aHFaTlZLVTBEZE1CcUgxaDMvRC9QYjNOM0RFSDNvenVudmpUblZw?=
 =?utf-8?B?Uk1XTVhab0pkMFBUR2tFc0hCWXlWZ2hLYmxncjVxekcwekwxbzZYem52eURT?=
 =?utf-8?B?TklkMzhVdkM4QkNpeW5lNG81cjFGVnl1cUxkUHQySzdGSTBXY1ZkeFpGVDdY?=
 =?utf-8?B?a2lNOU1VRVROdGVFczltcUxyektxMmJkb01pZHFuVFQ0UjJpSGF3bEhTc0lR?=
 =?utf-8?B?Q1pUL2cxYVNNcjR6YVNvRFBVMW1qeVNPT0JPdWd6REYxOFArazA4K3hCUi9H?=
 =?utf-8?B?K3J2ekNycXpwR3V1RWthdVVzN2ZGME9TQlVzUnVRR3I2eGtuV1llUVl0ZWEx?=
 =?utf-8?B?clFtV3R3K2dtcGQwM1J3UERCTEcwM3l3R2FTdDZTbG0rWllSN1krakNtUFRK?=
 =?utf-8?B?RmFqaGV5b05rcjg5cFh2UThxUjhNb0h5UEQya1M4ZWR3Yng0cCtrWWgveFZB?=
 =?utf-8?B?OW9nakREUjcyYWRrY1Uwb05UZ25ORDkzenhHSXpHemdJUFZiZDdpZ0NGZnVT?=
 =?utf-8?B?NVV3RHgwakd0KzhKdDdUWTZXa1ppYXpsdEVqWlFPbzNXb2RaT0RCT1l2clZC?=
 =?utf-8?B?ZG9vUVU2NGJiVVc5eFpUVlp1Yk9RYUsvbi9OeUxUQWZQc0E5b0VhdGJZY0Ns?=
 =?utf-8?B?SzVEMTNaWG5jd3N3aHZTaTV0bitaY1QveFFuamF6a2UxOEpKcVF3ZnNIcUUy?=
 =?utf-8?B?amZ0dXcwa1BKVlJ1UFBsOG80SytJemtBOXd3a3lmcTNqYlVtZGVFRVVNaUVO?=
 =?utf-8?B?S0ZiT2FYczNRZEI1aVVibitMa0RSOUxhcXkwS3dwdEdnSnQrZjZqT2ZWQVNz?=
 =?utf-8?B?SGdTc3VZa1NpYUJHNkd3QWM2RFRoQ0JsbHkxMGx4ZlVjUVlFaVRUdTMxY3N1?=
 =?utf-8?B?UXBYalJLYmRSOVlOQ29SOE1mSG9tcTRPNVN0R1k3VW9GMDBTelFPLzkvZmZs?=
 =?utf-8?B?YTRWZisyekJBZjBybnc0MGduRGxEK2ZvNHVNdlJQWndoZ1BRdG00c3F1bFpU?=
 =?utf-8?B?cVF2YmNPRjVIZHF0YXcwbStqazZOSUJERGhpTU5TYldmRjNsSjhSRE9CaE5m?=
 =?utf-8?B?U0kzMDFYUyt4SGtwZHdwRlZtdktobmRRV1dlNXM2TFBnSFVZMDJIQUtEYUoy?=
 =?utf-8?B?VXpOeTU5Z2wxOU1SeXludngxVDBMRVhBUWQxRVlHc2ljTE5NZktpR0xnZ3BO?=
 =?utf-8?B?VmlveXJyRndwdzRwcG1UanFLMHAvL3kwMll4NE1JTEtGelRkelhhZWdlM3A0?=
 =?utf-8?B?S2FVL3hsaklOQ01OYkwySTJqY3UzSy91L1NqQk1SSmFSRG93ZWNjaEpaZG5v?=
 =?utf-8?B?bGNjOVJkTXMxWHVFQ3l1cHNWSklHS1Azek5TMTEyVkpEakZKVG1pZDZ2ODRB?=
 =?utf-8?B?Znc5QzkzUjBwQ0sxNDR2Q2pZdy9EVHE2SWNWM1JDUDBxNnZyTHNpSnZ0eFdo?=
 =?utf-8?B?K1Vra1c3WGhRMnc5L1R4aWFCSGVsSy9sdGd0dm1CV08wOFg3Rk82MndJU2pS?=
 =?utf-8?B?STdxL0k2S3M0UnhMengrdkpWaGIzYjBCWDNOUjZhcy9aOGlCS0ZqYU9wdkFV?=
 =?utf-8?B?L2RJeCtuWGhEVndXbmgwbUJQcmJzc0YxRkMxZVJJK3FhT3YzajhUczVyT3p3?=
 =?utf-8?B?dWV5R2V4bTl0b1hHM0YxUG84UXJYMWZadzZrUHE5MnJoY1FMSGw1YnBKOW9R?=
 =?utf-8?B?MnpwNTR3Tkl0UTl6QU5vN3JTek1kRDV1K1psaUw2RWw0STFhY216dUNRQ01k?=
 =?utf-8?B?M1kxTTdyZ3NvM2dHWC8yZ0tlQkhwQlYvV2lIQ2Nub2pENVA3aENvRk12ZTFE?=
 =?utf-8?B?T1BlaDQ1NVlUVndtM1E2SThwNGFMa3BYb1dPNC9Md2hqYnk5alJVaXpWSHFi?=
 =?utf-8?Q?Ue0hK8tsrzeFSu6U=3D?=
X-Exchange-RoutingPolicyChecked: TPJIdDRGJlTXRmH5Q8FxHefYJvi++q21MpW3SN75EkXFL+aaihsG1zTqB2oxPW9Am84ivIU/RQ3pwm3qiGwJq3RCiKyFFgMfpqHKnjloco7y2TYAA7OVpWGS1Nfg5lh+O32gyKqbWqxO23nE6/KXlb+iCM3X+fRMAhjZvlbLY/JBMxupFZl0vqJODoAhlWGc1H8bS+VgrXC9DPSO5ehTlR6LYisnXuk9ICmbivCBe/cvgi1pdSkT8dnTRGt1c70hoQCjNttN8xpTGd0dPVfVNcIEqW4yZFi1HVVsLqs5hPxFzA47PoYGnsEWJkGtvglZ9+K15V0n/hPwEowJ/IPRCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dba124f8-be7e-4e2d-b050-08de8abf2ef5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 22:38:06.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWUvNct9M2x6CSbDDP7QZPGNmdZ2Ql47uGAC3gUm1r82MUmEXkxvSNT0BHyam5jOIyoT5XtRa985fu6I7lF/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
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

On Wed, Mar 25, 2026 at 04:25:22PM -0600, Summers, Stuart wrote:
> On Wed, 2026-03-25 at 15:00 -0700, Matthew Brost wrote:
> > On Wed, Mar 25, 2026 at 12:37:18PM -0600, Summers, Stuart wrote:
> > > On Tue, 2026-03-24 at 16:36 -0700, Matthew Brost wrote:
> > > > On Tue, Mar 24, 2026 at 03:10:41PM -0600, Summers, Stuart wrote:
> > > > > On Tue, 2026-03-24 at 13:58 -0700, Matthew Brost wrote:
> > > > > > On Tue, Mar 24, 2026 at 01:53:27PM -0700, Matthew Brost
> > > > > > wrote:
> > > > > > > On Tue, Mar 24, 2026 at 02:39:54PM -0600, Yang, Fei wrote:
> > > > > > > > > On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers,
> > > > > > > > > Stuart
> > > > > > > > > wrote:
> > > > > > > > > > On Tue, 2026-03-17 at 16:21 -0700,
> > > > > > > > > > fei.yang@intel.com wrote:
> > > > > > > > > > > From: Fei Yang <fei.yang@intel.com>
> > > > > > > > > > > 
> > > > > > > > > > > Hardware requires the software to poll the valid
> > > > > > > > > > > bit
> > > > > > > > > > > and
> > > > > > > > > > > make sure
> > > > > > > > > > > it's cleared before issuing a new TLB invalidation
> > > > > > > > > > > request.
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15
> > > > > > > > > > > +++++++++++++++
> > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > index ced58f46f846..4c2f87db3167 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > > > > > @@ -63,6 +63,7 @@ static int
> > > > > > > > > > > send_tlb_inval_ggtt(struct
> > > > > > > > > > > xe_tlb_inval
> > > > > > > > > > > *tlb_inval, u32 seqno)
> > > > > > > > > > >         struct xe_guc *guc = tlb_inval->private;
> > > > > > > > > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > > > > > > > >         struct xe_device *xe = guc_to_xe(guc);
> > > > > > > > > > > +       int ret;
> > > > > > > > > > > 
> > > > > > > > > > >         /*
> > > > > > > > > > >          * Returning -ECANCELED in this function is
> > > > > > > > > > > squashed at the
> > > > > > > > > > > caller and @@ -85,11 +86,25 @@ static int
> > > > > > > > > > > send_tlb_inval_ggtt(struct
> > > > > > > > > > > xe_tlb_inval *tlb_inval, u32 seqno)
> > > > > > > > > > > 
> > > > > > > > > > >                 CLASS(xe_force_wake,
> > > > > > > > > > > fw_ref)(gt_to_fw(gt),
> > > > > > > > > > > XE_FW_GT);
> > > > > > > > > > >                 if (xe->info.platform == XE_PVC ||
> > > > > > > > > > > GRAPHICS_VER(xe)
> > > > > > > > > > > > = 20) {
> > > > > > > > > > > +                       /* Wait 1-second for the
> > > > > > > > > > > valid
> > > > > > > > > > > bit
> > > > > > > > > > > to be
> > > > > > > > > > > cleared */
> > > > > > > > > > > +                       ret = xe_mmio_wait32(mmio,
> > > > > > > > > > > PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> > > > > > > > > > > +                                            0,
> > > > > > > > > > > 1000 *
> > > > > > > > > > > +USEC_PER_MSEC,
> > > > > > > > > > > NULL, false);
> > > > > > > > > > > +                       if (ret) {
> > > > > > > > > > > +                               pr_info("TLB INVAL
> > > > > > > > > > > cancelled due to
> > > > > > > > > > > uncleared valid bit\n");
> > > > > > > > > > > +                               return -ECANCELED;
> > > > > > > > > > > +                       }
> > > > > > > > > > 
> > > > > > > > > > Is there a reason we aren't waiting after the write
> > > > > > > > > > to
> > > > > > > > > > make
> > > > > > > > > > sure the
> > > > > > > > > > invalidation completed? It seems like we should be
> > > > > > > > > > serializing these
> > > > > > > > > > and at least making sure hardware completes the
> > > > > > > > > > request
> > > > > > > > > > rather than
> > > > > > > > > > just sending and hoping for the best.
> > > > > > > > > 
> > > > > > > > > Yes, this is correct—we should after wait issue *if*
> > > > > > > > > this
> > > > > > > > > code
> > > > > > > > > is actually needed.
> > > > > > > > 
> > > > > > > > No, the issue is that software cannot issue another TLB
> > > > > > > > invalidation request while the ongoing
> > > > > > > > one has not been completed yet. Otherwise the hardware
> > > > > > > > could
> > > > > > > > potentially lockup.
> > > > > > > > So we need to make sure the valid bit is cleared before
> > > > > > > > issuing
> > > > > > > > another TLB invalidation request.
> > > > > > > > 
> > > > > > > 
> > > > > > > Yes, but we signal the TLB invalidation fence as complete
> > > > > > > without
> > > > > > > waiting for the hardware to actually finish. The locking
> > > > > > > here
> > > > > > > is
> > > > > > > also
> > > > > > > incorrect for MMIO-based invalidations, now that I think
> > > > > > > about
> > > > > > > it.
> > > > > > > What
> > > > > > > really needs to happen is:
> > > > > > > 
> > > > > > 
> > > > > > Ah, this actually another weird corner where we take down the
> > > > > > CTs
> > > > > > but
> > > > > > GuC is still using the GAM port...
> > > > > > 
> > > > > > > - In send_tlb_inval_ggtt(), if the MMIO path is taken,
> > > > > > > acquire
> > > > > > > a
> > > > > > > per-GT
> > > > > > >   MMIO TLB invalidation lock after obtaining the FW
> > > > > > 
> > > > > > So maybe 'Wait for the valid bit to clear' here too but this
> > > > > > still
> > > > > > isn't
> > > > > > fully hardend as the GuC could immediately use the GAM port
> > > > > > again...
> > > > > > 
> > > > > > Or perhaps we go straight to my suggestion below - when
> > > > > > reloading
> > > > > > the
> > > > > > GuC issue MMIO GT invalidation...
> > > > > 
> > > > > I feel like we really should be avoiding these MMIO based
> > > > > invalidations
> > > > > wherever possible. It creates a lot of race conditions like
> > > > > what
> > > > > you
> > > > > suggested or even parallel invalidation between the GuC and KMD
> > > > > while
> > > > > we're tearing down (KMD lock might not be able to guarantee the
> > > > > GuC
> > > > > isn't still invalidating).
> > > > > 
> > > > 
> > > > My guess is the issue calling xe_managed_bo_reinit_in_vram on
> > > > some
> > > > BOs -
> > > > the GGTT don't get invalidated GuC side and it reloads with stale
> > > > GGTTs.
> > > > 
> > > > > Can we instead rely more heavily on the GT reset to flush the
> > > > > TLBs
> > > > > for
> > > > 
> > > > We likely need a MMIO invalidate whenever doing PM resume events
> > > > too
> > > > as memory can move without PM refs (CTs go down when PM ref == 0)
> > > > if
> > > > I'm
> > > > not mistaken...
> > > 
> > > But we already do a GT reset in that case right? So this should be
> > > covered?
> > > 
> > 
> > D3hot doesn't perform a GT reset or enter D3cold. However, looking at
> > xe_ggtt.c, GGTT invalidations always hold a PM reference, so the CT
> > should remain live unless a GT reset is in progress.
> > 
> > Therefore, the only two cases where we might need MMIO invalidations
> > are:
> > 
> > - During initial driver load, after we call
> > xe_managed_bo_reinit_in_vram
> >   on some buffers used during the hwconfig GuC load phase, and then
> > move
> >   the memory while retaining the same GGTT addresses.
> > 
> > - During a GT reset, where memory is allowed to move around. Likely
> > do
> >   this step before reloading the GuC.
> 
> But for both of these cases, we should be able to do:
> for_each_gt_on_tile()
>     xe_tlb_inval_fence_init()
>     xe_tlb_inval_all()
> for_each_gt_on_tile()
>     xe_tlb_inval_all()
> 
> Right before GuC communication goes down right? Then we wouldn't need
> any MMIO communication since the TLBs are flushed at that point.

CTs are live during hwconfig GuC load phase but not so much in the GT
reset case.

What is probably easiest /safest is any place xe_uc_load_hw is called,
do a MMIO invalidation of GuC TLB immediately before (but skip this step
on a VF).

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > > > 
> > > > I'd also like the GAM port interaction broken out in component
> > > > like
> > > > xe_gam_port.c (with a dedicated lock) in this seires [1] albiet
> > > > way
> > > > simplier as we only need GGTT invalidates at this time.
> > > 
> > > I'd still like to push we find a way to completely remove the MMIO
> > > invalidation from the driver and rely on either the resets or GuC
> > > based
> > > invalidation prior to teardowns if at all possible.
> > > 
> > 
> > I agree MMIO TLB invalidations have no place xe_guc_tlb_inval.c.
> > 
> > Matt
> > 
> > > I hadn't seen your other patch yet though. I'll take a look as soon
> > > as
> > > I have time.
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > [1]
> > > > https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1
> > > > 
> > > > > us? And for the GuC memory specifically, maybe we do a full
> > > > > invalidation after quiescing the GuC during hwconfig load (the
> > > > > first
> > > > > time we load the GuC during driver load) and before any kind of
> > > > > reload/reset?
> > > > > 
> > > > > We'd still need to cover the case where hardware is fully hung
> > > > > up
> > > > > and
> > > > > GuC isn't responding, but then I don't know that we really care
> > > > > about
> > > > > MMIO based invalidations since we'll want to fully reset the GT
> > > > > there
> > > > > too.
> > > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > - Issue the TLB invalidation
> > > > > > > - Wait for the valid bit to clear
> > > > > > > - Release the GT MMIO TLB invalidation lock
> > > > > > > 
> > > > > > > Without this lock, two threads could both observe the valid
> > > > > > > bit
> > > > > > > clearing
> > > > > > > and then both attempt to issue invalidations, clobbering
> > > > > > > each
> > > > > > > other.
> > > > > > > 
> > > > > > > > > This is early Xe code from me, and it’s questionable
> > > > > > > > > whether
> > > > > > > > > it’s even required.
> > > > > > > > 
> > > > > > > > This seems to be required, otherwise modprobe would fail
> > > > > > > > at
> > > > > > > > golden context submission,
> > > > > > > > [  480.237382] xe 0000:01:00.0: [drm] *ERROR* Tile0: GT0:
> > > > > > > > hwe
> > > > > > > > ccs0: nop emit_nop_job failed (-ETIME) guc_id=4
> > > > > > > > 
> > > > > > > 
> > > > > > > I’m somewhat surprised by this. A better solution might be
> > > > > > > to
> > > > > > > drop
> > > > > > > the
> > > > > > > MMIO GT invalidation code in xe_guc_tlb_inval.c and instead
> > > > > > > issue
> > > > > > > an
> > > > > > > MMIO GGTT invalidation whenever we reload the GuC.
> > > > > > > 
> > > > > > > We can defer trying this until later, as it is a riskier
> > > > > > > change.
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > > Typically, if the CTs are not live, the GuC isn’t doing
> > > > > > > > > anything meaningful in terms of
> > > > > > > > > referencing memory that the KMD is moving around (which
> > > > > > > > > would
> > > > > > > > > require an invalidation).
> > > > > > > > > So this entire flow of issuing a GAM port TLB
> > > > > > > > > invalidation
> > > > > > > > > is,
> > > > > > > > > again, questionable.
> > > > > > > > > 
> > > > > > > > > So I'd suggest move the wait after issue, plus throw
> > > > > > > > > in:
> > > > > > > > > 
> > > > > > > > > “XXX: Why do we need to invalidate GGTT memory when the
> > > > > > > > > CTs
> > > > > > > > > are
> > > > > > > > > not live? This suggests
> > > > > > > > > the GuC is still in the load phase. Investigate and
> > > > > > > > > remove
> > > > > > > > > this
> > > > > > > > > code once confirmed.'
> > > > > > > > 
> > > > > > > > The issue is a consequence of an earlier failure which
> > > > > > > > caused
> > > > > > > > the
> > > > > > > > CT to be disabled. And the KMD
> > > > > > > > sees a bunch of TLB invalidation timeouts.
> > > > > > > > At this time I would expect a GT reset, but that is not
> > > > > > > > how
> > > > > > > > Xe
> > > > > > > > behaves (the ole i915 driver triggers
> > > > > > > > a GT reset on TLB invalidation timeout if I remember
> > > > > > > > correctly)
> > > > > > > > 
> > > > > > > > -Fei
> > > > > > > > 
> > > > > > > > > Matt
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Thanks,
> > > > > > > > > > Stuart
> > > > > > > > > > 
> > > > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > > > PVC_GUC_TLB_INV_DESC1,
> > > > > > > > > > > 
> > > > > > > > > > > PVC_GUC_TLB_INV_DESC1_INVALID ATE);
> > > > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > > > > > > 
> > > > > > > > > > > PVC_GUC_TLB_INV_DESC0_VALID);
> > > > > > > > > > >                 } else {
> > > > > > > > > > > +                       /* Wait 1-second for the
> > > > > > > > > > > valid
> > > > > > > > > > > bit
> > > > > > > > > > > to be
> > > > > > > > > > > cleared */
> > > > > > > > > > > +                       ret = xe_mmio_wait32(mmio,
> > > > > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > > > > GUC_TLB_INV_CR_INVALIDATE,
> > > > > > > > > > > +                                            0,
> > > > > > > > > > > 1000 *
> > > > > > > > > > > +USEC_PER_MSEC,
> > > > > > > > > > > NULL, false);
> > > > > > > > > > > +                       if (ret) {
> > > > > > > > > > > +                               pr_info("TLB INVAL
> > > > > > > > > > > cancelled due to
> > > > > > > > > > > uncleared valid bit\n");
> > > > > > > > > > > +                               return -ECANCELED;
> > > > > > > > > > > +                       }
> > > > > > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > > > > > GUC_TLB_INV_CR,
> > > > > > > > > > >                                        
> > > > > > > > > > > GUC_TLB_INV_CR_INVALIDATE);
> > > > > > > > > > >                 }
> > > > > > > > > > 
> > > > > 
> > > 
> 
