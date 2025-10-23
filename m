Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401E9CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 19:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0568F10E11F;
	Thu, 23 Oct 2025 19:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMn7ugQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3D10E11F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761247641; x=1792783641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JMAMxVA+7PsBADOpasuUHkEpcO5zMP994BE9DeZkDDI=;
 b=fMn7ugQNlMI5NjMlH3FDf6asSzrcnoxG2a2E/9/iz7gTevC2TAYKisHH
 PaxJ0OLy/t9E3INt4SFkx0AYXpxjKtUVkVVGedsxZhvKs2LPuANzsMWqf
 f+0ru1VO6xFmlrKm76sYSTqVcxsoUHzV8tEq3MKtKBocscpQGVv6Q9wC4
 s3RtWxN4HiT2IEmcAbhXq2txCqxAibuhXHVHLzsex8Kl9k2vewjpA8c3S
 aP4eTDKMRKiBLARkN7gKTHK2LXUEnWm7uFTszh+LiMIRIcNJB9kA23ayu
 TkS0bJPDYWYaaCaflwsibUf375VuHFUJC1eB9TnFug9Pg7jeSycp7vKCK g==;
X-CSE-ConnectionGUID: /XP+eglNQB+CHh6/9kdxJg==
X-CSE-MsgGUID: QV5eOOflTse0torbcDLa1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74099582"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74099582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:27:21 -0700
X-CSE-ConnectionGUID: h/3XiVO6QWW6iZQqW4GG3w==
X-CSE-MsgGUID: IkgZYIbMRIqN+IK1l+WG0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="214897030"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:27:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:27:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 12:27:19 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITVnRSdaJcqhqqTmNBwwTafmFgeYd7vuof4MHmLMh0HbDse//mwRqoou/MpmFAnll/FZzVWLgQ4sNLLVz5Qe00eb8s8rPQ/P+8eJrsV15F8+IVC+fsuzb/R2WD+AlG0hteg+Dt/Crsev2XyA5X+lQ/RAhubjsWTcyYdOdWs26x78zeAmuFNCJ3wClgTQZDNKApa5p4HiiLhpWATFoNVop0CkKC4fIyCX9VmogcUpOOHUvwlxHKaEmd6DydAqpNvvoDGgVC8pTYyKiI0Ly3xSQc+thR9dQ8Y/KPRyJJUtWRP8Z2gi8GzswqvmNO+Zl5dbcL9aEqxEW0Y3JM5VFuulTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnR3MMi9tSxqERBpR9iy5BPMmR1Ni0htOWkSayZKuCk=;
 b=dtBXdyhVssziZm5J2g6weJPIZZasz10kaYJVBcjeLqC+TCX/WeccsxaOw6XVfS36q5y+IBMD/Xu4UDs9JBFCdhndZllms5Uw2GRGOMAsoJ4NLpgNF2mNGnhBiS352+H2L+q+Y/t4dK7HZcAwW678lB5gxnqmP9bvyaZPm0bLa37tGGRw7eO8hmyoQjpKaOSmiMW7/xD0G79gghFucnE9nphTsl4SdmFQ+dzKPoAUc2KvjNlmEoCUVLjx/N6zQilzVDKEwr1yQShThbg90AGNRRmuI+vq/yZyxtoZRPsw1iru/GZ5qLPbyzxnszUzYTV74Fkn3rLDhM+oyZiwcP2+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 19:27:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 19:27:17 +0000
Date: Thu, 23 Oct 2025 12:27:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
Message-ID: <aPqBkuDYVtehPVJA@lstrano-desk.jf.intel.com>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
 <f7f83835-adaa-426a-94a5-21ad3bb240ff@ursulin.net>
 <aPjz5BHrNbUBUk8L@lstrano-desk.jf.intel.com>
 <24e3535c-6729-4c48-a350-d32421688bc6@ursulin.net>
 <aPp6MZbGDJZzFvyR@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPp6MZbGDJZzFvyR@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c7d636-36aa-4f6c-9511-08de126a2d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODQ1dXNuUjRqaXFJOVJuZGFBdklHSGV0ZnlVblVpNEtJV2hCaUNwaUg3d1Jt?=
 =?utf-8?B?Wnl2SGdSdXFtQVFTSzFqOHFDaFI2WUJEdFlCNU40Y0EvcEd0RE5sRUZaamJw?=
 =?utf-8?B?dkZWcjYrZkZ3b0d3M0syRFVjZHF6bG9mMyt5aVJqYVUrTTkvbll1UUdVNktr?=
 =?utf-8?B?a0R3Z3Y5OU9KWXBpVFZSSGg0R3JxTndkZkQ4bVhjTlNGUWg4S2JScnljVVRy?=
 =?utf-8?B?Y3dlVGhJbG9mRDZsVGRjajlKMjF4NkdUOWMyaHNMWncyNklQY2M5Q1dIQlZk?=
 =?utf-8?B?WEJPdWp1RHBnWVFQYVlaVUg0dERBaEZhWmx6WnZBMWp0U1Z6RndpeTVSVWcx?=
 =?utf-8?B?ZHc5aVRPTHcvb210ZGZSYWZQdm5LanFIbWhVdFZOenBHamZ6Nit1bXBJMGg5?=
 =?utf-8?B?QVdicFJGRHZ4NTBqRmNCT243citnaDNrV2dUd0tyMlNpTXBJOC92aitVYytq?=
 =?utf-8?B?S21aVE14ZXBhZGNoQ0dYN1RPblhPMmNrTlpYNUVlQm1IazNmY2Z4WlN0TFdK?=
 =?utf-8?B?VW90d0FER0t3VFNqMGhzaDhUODVpcmVKQ2hUaElNM1JneklnR1NJcStZM2dt?=
 =?utf-8?B?N01NcHNEMEtDNDNXU2FXSk9ROVFjemZQQWpFMUwwUzI3MDloV2VxL2JUOHJt?=
 =?utf-8?B?aVRlMVIwc3BUditlWXVpRk9HYTVCc0xONVE5UUJXQVlKd0NHczd2WThpUVox?=
 =?utf-8?B?ckppd3dXUEMwazlxUnBRR0cxbFh4OW9CQjFOMEdFMngxRUdIODUxS2Vvd0FK?=
 =?utf-8?B?UURHWVJ2WVdIVS9YU2tBL1lwTVREUkRLYmNIZFNkU25WN0w4Q0xIYkZKY3JZ?=
 =?utf-8?B?WjE0QUxZQ2gzYkpFNTh0U1k1aUVuSWdFS3BtVDE5Sm91dm5pT3hHMklqRU1R?=
 =?utf-8?B?VEp3aW9aWStYZXZkZGZBM3FBUkw2dHZ4M1E2Q0tWUnN2Tjk0ZjgrSVl6UVkr?=
 =?utf-8?B?OTR0WXJTOHVsVVB4YlRNN0dLMExQWTFDY25kZ1BrNC9hNmtpa3NFU3pKMGhY?=
 =?utf-8?B?WmVGaVZRNmR0ZXJDZDljSElLclQ1TmJ5bmJtR25iS0ROdTM1bGZDYVJUdXRx?=
 =?utf-8?B?WkRkRDdxQWY3ODdWZVpid1Vrc2dnM0Y2dldia2g5T204OGZpeGF2ZGJ3Q0Y2?=
 =?utf-8?B?bERFcjBGNjc4cDR4YXdUaGw0VUJjREJlWk5GbzUrVFdWanY5bUp2VjVlUStx?=
 =?utf-8?B?OGpHT1g1d2VQVllxSUdrYlJDcjcrNUNRMVZFODNwOCtQTDZxaXR1UVVBYjht?=
 =?utf-8?B?d1pMTU93K3IzUnI1Y0pUdEtJUTk2MmJpRElOOFN4TWMwdmh0K0pGTE94QnpQ?=
 =?utf-8?B?bnBnTkdBOThsUEVaUDhkTW9VaHF5QTRtRGdDSkd6OCsyU2dLUGVxTTJNYTBu?=
 =?utf-8?B?b0RobmdMTnRjRFJtL1ByWGlaUkJNYUsycUpDMEZyVXVUdG9VcHlWN0ZYWEtH?=
 =?utf-8?B?ZWFnMnFwbldTNVdLbmxJa2JyZ1oyKzRKREMrZG9oSXl4MHNBem9XbVY5VWdF?=
 =?utf-8?B?Yit2UWtHQk1VWUVIUDlqM0x3N3ZSYVJRaTdGcHNWQTJ3KzBaclVxRkx1MDZv?=
 =?utf-8?B?aVE0cVF3NmduTXdZRTJPZ3JjeXZ6Q2gySFd1L1d5S2loaC9MaWg1ZkxtbFMy?=
 =?utf-8?B?ekM1Y1NOeC8yWVUwcW5GelpmclJHbS9PK2QrZTk2anp1TkhpSTRmZHNUZzNj?=
 =?utf-8?B?aUVNVSs3eGFTWW1PVTdKaWpqQmRzckFwcG1Rem8vd3VCek8vZjBSY3U0WXps?=
 =?utf-8?B?OWNNUlhVTnJLSGh5ci9mR2sxNHdEQlBJZVZMYWJqb3I5MlA4RmZOS2ZUYzFX?=
 =?utf-8?B?dGVNSXVRVXZ1MXV3MEE1L1BnMGNWYzZUVXdLVFFBclJ3Q05rY2wzOGpnMjY2?=
 =?utf-8?B?ZHM3dDl1TlNYblJickNJYnZLSGxtekV0YldxVG9QalNLelE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnUzcjlnUlZvZnc4OEhWdnpZdDFsSU5ESXdxcDN6ZFZnUVZwYzVieTVUOHFw?=
 =?utf-8?B?M0VuR2lxYnkzZmpmV0VFYW00Rms4NVlLN09Sck8xeXRRMVZwbTNsNm5NclFm?=
 =?utf-8?B?TWFXcURDeWtWKzRVeDhsSThWemtDMlkxTlZtUWl0blZ1VVFOL25WR3lkQXpx?=
 =?utf-8?B?d0dzWXJORUx0T0NSWnhON0JOQmJZSG04RmVlamlVRE5pOCtSNXhtOGFBeFpn?=
 =?utf-8?B?Unl3QzZsOU9laFBsNDZjM0pxUktDaDVIS3RJUld3RElkUkdndnJZQkpjdWI3?=
 =?utf-8?B?blczcVgwNCtLaTM3RGdUdForTTNqUFUvNlIweURuVHVqMWc1U1BmWDNCSmZa?=
 =?utf-8?B?TCtCOTBmdjVQSlo2d1h3N0xyeEdaQ1ZmNVdVMzVsRTZEV1hRT1hZUkMwdXVm?=
 =?utf-8?B?aWsvQ3lDdjdBb1lyMGlUaU1WTnNaekdVVWhtNURIZUdKRFA3SkljaTdUZlQz?=
 =?utf-8?B?RjlKNUFhQTV2SjltUlp6TnI4UkExbUE0VjZoU1hhSnJ0djBmeWRVMVNZVjdj?=
 =?utf-8?B?NjFaczJvSis0SWE1bFpudWpLeGNDZHVhVi91cE9UNU83YUtsdEJUSit6K0kw?=
 =?utf-8?B?eVYvVGh4WlBoc2RPbGpZeGNRRTVZVnZTSllDVU0xZVEyTmFvQlRRTWZNK3dD?=
 =?utf-8?B?d0VBNHp4bEFXck1ST1lyRnl4em5zbXBsTFV4bUtsd1BCS0FZYmQ2c3NHcDNO?=
 =?utf-8?B?RDBFQ0trczFEN0J2YUYzanhZb0ZObVQ3aVlCY1hJZUhwMERkSXdzbGZiUE1O?=
 =?utf-8?B?Um5oUjkwSFRhekJjRmtsY2RQWkFibUt6Vnh0NlV3cll0MFVuTkYzajVzRjZX?=
 =?utf-8?B?WUVHaXMwUWVyRm9PNWlvSnZUdC9ZWDlGNUovbDQyeGc5S3ZkaVN6QTVxNmRV?=
 =?utf-8?B?bmV5MUpzWk5YUHFMSXFBcDA2b3VwdWRnUmNtUXorRVpQUUN1ZTJIWVoyYVNa?=
 =?utf-8?B?OEtFbmkyY2piT3FCV3hlUzNPTzdoMmhuV1VrWU5uOEx6cnFOYXN1N09QcmpY?=
 =?utf-8?B?MklWVjlWMmFGYlNyWnk1eEFNd3I5SWE3bCtnZXp3dTVmRHBYQlNwbHFETWdz?=
 =?utf-8?B?azI1VnQ0aHRQMXJ3bkdXL2YzVjhqcElndW5DZFhXb2owMTZJZ2UxdU4rZ3B6?=
 =?utf-8?B?WW0wZXBSSGhDaSt2OE1LaGlCR1YrMmtVVUR3ak9XM2VxZmRIZitDQkQzQmhO?=
 =?utf-8?B?cEVETHZYVkg0ZnlpeXJxQUVjd0U0ZWFVdU5POER6djdDc0NhMmpTMlYxU2gr?=
 =?utf-8?B?ajA0bE5xdHBRL1hWM1FvOVRmek1zOXAzcEVEcEV0Q0tXVWk5TUNMMWQxQllt?=
 =?utf-8?B?My81UGlpUGtwd0hmRGZrcUI1QnNDV2NISTlFa2lUaDZ1MWw2TUpRMVh5OER3?=
 =?utf-8?B?U0VMZTZGQkFZZDRxYW1WWjFyOVl3K2NBMmNTaHRNN0J1S0ZsZnJqa0hmNUNQ?=
 =?utf-8?B?TWV4TmMyOHdIbDh5S2Q1c2Zzb3ZvSlNUZkt1UTlrMEtrK3k4aWt1UkxraU9y?=
 =?utf-8?B?TzlOcG5sSFMwS3BnaFBwVlNMWFpsVTUzcHFXT3A1eGVEajQ2amVIS3JZOXdi?=
 =?utf-8?B?WDdUN1REY3BZOXFOdjVZWEJIQlBTZHV4VTVZc3drcmRUczY5RWlBdkJDelBw?=
 =?utf-8?B?QU5ZQ3hVUVB1d1ZHOEZpdXo3VWU5RTBtdTJuUjI4bUcyQVpwWmZJNVpiMm12?=
 =?utf-8?B?Q3E5MkJ5bTZDQVBGbVlKc2hnWk1VL0FuR2FRYm5udE9aN3d0YnhiNHgrdjB3?=
 =?utf-8?B?RjIwYzlVSndhUUg4MjltZ3FLNkwzcDgwK2ZCdWFFRHhrSS93OTFhZVRYSEdO?=
 =?utf-8?B?WEtqdlgrTkZGT2t1aEFPUVB2N3piTTNpck5NU0lTUnZiNmVBT0tSY2VpK2ZS?=
 =?utf-8?B?dEFXdHN4dmlZdUlQM3UyVHF0dWxSVXlsRjN5MTE5L3laaHNTVEdlaVdlWEVC?=
 =?utf-8?B?cUo4SE44aWd5aTlBeFErODFYQ0hJSXl3TUR5eVQrVCtMZkQ5Mi9yQXBMMlVG?=
 =?utf-8?B?QVJRUEtwZ1dXUjRVcmVtN25iZElJUmliNno1WkxFN2xybzdTWEMrUXhBZHpI?=
 =?utf-8?B?eDNSODc3dXkzNTV0aGZRaXdlQ2FPV3VCaXp4b0U2eC9tenVrZlltM29BTGRx?=
 =?utf-8?B?MzV0OFNSMUJaNWJjRnRLSG42L3JzNTYxd014UFdKYnRSWVRvREFWNHpkc1JY?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c7d636-36aa-4f6c-9511-08de126a2d63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:27:17.2994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piL07fhR5ZkDJmw6OiqYPvl6UCrDjQ/bEKHEA1BQykDVG8kwQdRdu4/PTNyMXCQXIIBcFT/weUyacYfJ7dJO8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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

On Thu, Oct 23, 2025 at 11:55:45AM -0700, Matthew Brost wrote:
> On Thu, Oct 23, 2025 at 01:46:26PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 22/10/2025 16:10, Matthew Brost wrote:
> > > On Wed, Oct 22, 2025 at 09:00:47AM +0100, Tvrtko Ursulin wrote:
> > > > 
> > > > On 17/10/2025 17:52, Matthew Brost wrote:
> > > > > When a burst of unbind jobs is issued, a dependency chain can form
> > > > > between the TLB invalidation of a previous unbind job and the current
> > > > > one. This leads to undesirable serialization, causing current jobs to
> > > > > wait unnecessarily for prior TLB invalidations, execute on the GPU when
> > > > > not needed, and significantly slow down the unbind burst—resulting in up
> > > > > to a 4× slowdown.
> > > > > 
> > > > > To break this chain, mask the last bind queue dependency if the last
> > > > > fence's DMA context matches the TLB invalidation context. This allows
> > > > > full pipelining of unbinds and TLB invalidations while preserving
> > > > > correct dma-fence signaling semantics.
> > > > > 
> > > > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_exec.c          |  3 +-
> > > > >    drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
> > > > >    drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
> > > > >    drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
> > > > >    drivers/gpu/drm/xe/xe_sched_job.c     | 44 ++++++++++++++++++++++++++-
> > > > >    drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
> > > > >    drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
> > > > >    drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
> > > > >    8 files changed, 98 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > > index 0dc27476832b..6034cfc8be06 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > > @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > > >    		goto err_put_job;
> > > > >    	if (!xe_vm_in_lr_mode(vm)) {
> > > > > -		err = xe_sched_job_last_fence_add_dep(job, vm);
> > > > > +		err = xe_sched_job_last_fence_add_dep(job, vm, NO_MASK_DEP,
> > > > > +						      NO_MASK_DEP);
> > > > >    		if (err)
> > > > >    			goto err_put_job;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > index 90cbc95f8e2e..d6f69d9bccba 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > @@ -25,6 +25,7 @@
> > > > >    #include "xe_migrate.h"
> > > > >    #include "xe_pm.h"
> > > > >    #include "xe_ring_ops_types.h"
> > > > > +#include "xe_sched_job.h"
> > > > >    #include "xe_trace.h"
> > > > >    #include "xe_vm.h"
> > > > >    #include "xe_pxp.h"
> > > > > @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
> > > > >     * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
> > > > >     * @q: The exec queue
> > > > >     * @vm: The VM the engine does a bind or exec for
> > > > > + * @mask_ctx0: Mask dma-fence context0
> > > > > + * @mask_ctx1: Mask dma-fence context1
> > > > > + *
> > > > > + * Test last fence dependency of queue, skipping masked dma fence contexts.
> > > > >     *
> > > > >     * Returns:
> > > > > - * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
> > > > > + * -ETIME if there exists an unsignalled and unmasked last fence dependency,
> > > > > + * zero otherwise.
> > > > >     */
> > > > > -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > > > > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm,
> > > > > +				      u64 mask_ctx0, u64 mask_ctx1)
> > > > >    {
> > > > >    	struct dma_fence *fence;
> > > > >    	int err = 0;
> > > > > @@ -1119,6 +1126,13 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> > > > >    	if (fence) {
> > > > >    		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > > > >    			0 : -ETIME;
> > > > > +
> > > > > +		if (err == -ETIME) {
> > > > > +			if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> > > > > +							 mask_ctx1))
> > > > > +				err = 0;
> > > > > +		}
> > > > > +
> > > > >    		dma_fence_put(fence);
> > > > >    	}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > > index a4dfbe858bda..99a35b22a46c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > > > @@ -85,7 +85,8 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> > > > >    void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> > > > >    				  struct dma_fence *fence);
> > > > >    int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > > > > -				      struct xe_vm *vm);
> > > > > +				      struct xe_vm *vm, u64 mask_ctx0,
> > > > > +				      u64 mask_ctx1);
> > > > >    void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> > > > >    int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > > > index d22fd1ccc0ba..bba9ae559f57 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> > > > >    	}
> > > > >    	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> > > > > +		u64 mask_ctx0 = NO_MASK_DEP, mask_ctx1 = NO_MASK_DEP;
> > > > > +
> > > > > +		if (ijob)
> > > > > +			mask_ctx0 = xe_tlb_inval_job_fence_context(ijob);
> > > > > +		if (mjob)
> > > > > +			mask_ctx1 = xe_tlb_inval_job_fence_context(mjob);
> > > > > +
> > > > >    		if (job)
> > > > > -			err = xe_sched_job_last_fence_add_dep(job, vm);
> > > > > +			err = xe_sched_job_last_fence_add_dep(job, vm,
> > > > > +							      mask_ctx0,
> > > > > +							      mask_ctx1);
> > > > >    		else
> > > > > -			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> > > > > +			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> > > > > +								vm, mask_ctx0,
> > > > > +								mask_ctx1);
> > > > >    	}
> > > > >    	for (i = 0; job && !err && i < vops->num_syncs; i++)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > > index d21bf8f26964..7cbdd87904c6 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > > @@ -6,6 +6,7 @@
> > > > >    #include "xe_sched_job.h"
> > > > >    #include <uapi/drm/xe_drm.h>
> > > > > +#include <linux/dma-fence-array.h>
> > > > >    #include <linux/dma-fence-chain.h>
> > > > >    #include <linux/slab.h>
> > > > > @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job *job)
> > > > >    	xe_sched_job_put(job);
> > > > >    }
> > > > > +/**
> > > > > + * xe_sched_job_mask_dependency() - Determine if a dma-fence dependency can be masked
> > > > > + * @fence: The dma-fence to check
> > > > > + * @mask_ctx0: First context to compare against the fence's context
> > > > > + * @mask_ctx1: Second context to compare against the fence's context
> > > > > + *
> > > > > + * This function checks whether the context of the given dma-fence matches
> > > > > + * either of the provided mask contexts. If a match is found, the dependency
> > > > > + * represented by the fence can be skipped. If the fence is a dma-fence-array,
> > > > > + * its individual fences are unwound and checked.
> > > > > + *
> > > > > + * Return: true if the fence can be masked (i.e., skipped), false otherwise.
> > > > > + */
> > > > > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> > > > > +				  u64 mask_ctx1)
> > > > > +{
> > > > > +	if (dma_fence_is_array(fence)) {
> > > > > +		struct dma_fence *__fence;
> > > > > +		int index;
> > > > > +
> > > > > +		dma_fence_array_for_each(__fence, index, fence)
> > > > > +			if (__fence->context == mask_ctx0 ||
> > > > > +			    __fence->context == mask_ctx1)
> > > > > +				return true;
> > > > > +	} else if (fence->context == mask_ctx0 ||
> > > > > +		   fence->context == mask_ctx1) {
> > > > > +		return true;
> > > > > +	}
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * xe_sched_job_last_fence_add_dep - Add last fence dependency to job
> > > > >     * @job:job to add the last fence dependency to
> > > > >     * @vm: virtual memory job belongs to
> > > > > + * @mask_ctx0: Mask dma-fence context0
> > > > > + * @mask_ctx1: Mask dma-fence context1
> > > > > + *
> > > > > + * Add last fence dependency to job, skipping masked dma fence contexts.
> > > > >     *
> > > > >     * Returns:
> > > > >     * 0 on success, or an error on failing to expand the array.
> > > > >     */
> > > > > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> > > > > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> > > > > +				    u64 mask_ctx0, u64 mask_ctx1)
> > > > >    {
> > > > >    	struct dma_fence *fence;
> > > > >    	fence = xe_exec_queue_last_fence_get(job->q, vm);
> > > > > +	if (xe_sched_job_mask_dependency(fence, mask_ctx0, mask_ctx1)) {
> > > > > +		dma_fence_put(fence);
> > > > > +		return 0;
> > > > > +	}
> > > > >    	return drm_sched_job_add_dependency(&job->drm, fence);
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > > index 3dc72c5c1f13..81d8e848e605 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > > > > @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
> > > > >    void xe_sched_job_arm(struct xe_sched_job *job);
> > > > >    void xe_sched_job_push(struct xe_sched_job *job);
> > > > > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
> > > > > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> > > > > +				    u64 mask_ctx0, u64 mask_ctx1);
> > > > >    void xe_sched_job_init_user_fence(struct xe_sched_job *job,
> > > > >    				  struct xe_sync_entry *sync);
> > > > > @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct
> > > > >    int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
> > > > >    			  enum dma_resv_usage usage);
> > > > > +#define NO_MASK_DEP	(~0x0ull)
> > > > > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> > > > > +				  u64 mask_ctx1);
> > > > > +
> > > > >    #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > index 492def04a559..f2fe7f9fbb22 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
> > > > >    	u64 start;
> > > > >    	/** @end: End address to invalidate */
> > > > >    	u64 end;
> > > > > +	/** @fence_context: Fence context for job */
> > > > > +	u64 fence_context;
> > > > >    	/** @asid: Address space ID to invalidate */
> > > > >    	u32 asid;
> > > > >    	/** @fence_armed: Fence has been armed */
> > > > > @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > > > >    	job->asid = asid;
> > > > >    	job->fence_armed = false;
> > > > >    	job->dep.ops = &dep_job_ops;
> > > > > +	job->fence_context = entity->fence_context + 1;
> > > > 
> > > > As a side note, hardcoding the assumption on how scheduler allocates
> > > > contexts is not great given recent efforts to make drivers know less of the
> > > > scheduler internals.
> > > > 
> > > 
> > > Yes, we should probably have a helper here — maybe
> > > drm_sched_job_finished_context?
> > > 
> > > I was planning to roll this change into [1], but that series hasn’t
> > > gained much traction, and fixing this is a fairly high-priority issue
> > > for customers.
> > > 
> > > This is documented in the DRM scheduler kernel docs:
> > > entity->fence_context + 1 is the job's finished context.
> > > 
> > > [1] https://patchwork.freedesktop.org/series/155314/
> > > 
> > > > But what I really wanted to ask is, having only glanced the patch briefly,
> > > > could xe performance problem here also be solved by unwrapping the container
> > > > fences at the DRM scheduler dependency tracking level?
> > > > 
> > > 
> > > This is primarily about preventing TLB fences — which originate from a
> > > different context than the bind queue but are still ordered on the queue
> > > — from becoming dependencies. The process involves two passes: in the
> > > first pass, we detect dependencies. If none are found, we immediately
> > > complete the bind via the CPU. If dependencies are present, we defer the
> > > bind to the GPU.
> > 
> > Interesting, I saw fence unwrapping and context number checking and thought
> > it was maybe the same problem. I do not fully understand what xe is doing to
> > comment strongly but it does raise a question on whether there could be a
> > more elegant solution (ie not a hack).
> > 
> > Could the two entities be shared and would that solve the problem? I mean
> > the TLB invalidation and the bind queue entities, do they need to be
> > separate if the assumption and guarantee is to execute in order?
> > 
> 
> Sharing dma-fence context would be great, but we have three scheduler
> instances here — one for the bind queue and two for TLB invalidations,
> one per GuC instance. The bind job feeds into the two TLB invalidations
> as dependencies. The two TLB invalidations themselves are not ordered
> with respect to each other, and the overall operation signals only when
> both TLB invalidations have signaled.
> 
> This gets more complicated when a subsequent bind is issued without an
> invalidation — it needs to wait on the prior invalidations to ensure
> that fences sent to user space from the queue don’t signal out of order.
> 
> If the subsequent bind does issue an invalidation, then we don’t need to
> wait — and that’s what this patch is (partially) fixing (e.g., a burst
> of unbinds, which is the issue you previously raised with Chrome
> switching tabs).
> 
> I’d love to find an elegant solution, but I’m just not seeing one right

Okay, I take this back. I think I have an elegant solution, but it will
take time for Xe to get there.

Currently, when a bind job is needed (i.e., it has dependencies), the
final part of the bind process runs on the GPU, programming leaves or
pruning new parts in the page table structure. GPU jobs are inherently
asynchronous, so subsequent TLB invalidations must be scheduled to run
afterward.

I have patches that, for various reasons, make it advantageous to run
the bind job on the CPU. Once that happens, the operation becomes
synchronous, allowing TLB invalidations to be issued immediately from
run_job, returning a dma-fence-array or dma-fence-chain of all issued
TLB invalidations. We’d only need a single queue (scheduler instance /
entity) for bind jobs and invalidations.

We’d still need to block somewhere to cover the case of a job with
invalidation followed by a job without invalidation, but that seems
workable.

As I said, this won’t happen overnight. The CPU bind patches have been
around for a couple of years, and the last time I revived them, PM
references were leaking—so I need to track that down. But in the long
term, a single queue for binds and invalidations seems like the ultimate
goal.

In the short term, this is something we need to fix—it's a clear issue
in our driver.

Matt

> now. I also wouldn’t call this a hack — getting dependency tracking
> right in a complex driver is, frankly, just really hard. We’re still
> working on getting everything correct.
> 
> Matt
> 
> > > > I am asking because amdgpu recently posted a patch to unwrap in their code
> > > > for potentially similar performance reasons, and if now xe wants something
> > > > similar, or even the same, it is an interesting question where to do it.
> > > > 
> > > > Also, I have a patch (not sure if I posted it so far) which unwraps in
> > > > drm_sched_job_add_dependency() and converst the dependency xarray to
> > > > unwrapped dma-fence-array. Initial idea there was to allow scheduler worker
> > > > to only be woken up once, once all deps are signaled, but now if two drivers
> > > > seems to be unwrapping fences maybe there is a case to be made for doing it
> > > > in the core.
> > > > 
> > > 
> > > I don't think this is the same problem as the one above, but it's an
> > > interesting idea in general. CC me if you post this one.
> > 
> > Okay, but since it sounds it would not be helping here it will not be
> > priority to clean it up and send so might be a while.
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > 
> > > Matt
> > > 
> > > > Regards,
> > > > 
> > > > Tvrtko
> > > > 
> > > > >    	kref_init(&job->refcount);
> > > > >    	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy */
> > > > > @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job)
> > > > >    	if (!IS_ERR_OR_NULL(job))
> > > > >    		kref_put(&job->refcount, xe_tlb_inval_job_destroy);
> > > > >    }
> > > > > +
> > > > > +/**
> > > > > + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence context
> > > > > + * @job: TLB invalidation job object
> > > > > + *
> > > > > + * Return: TLB invalidation job fence context
> > > > > + */
> > > > > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> > > > > +{
> > > > > +	return job->fence_context;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > index e63edcb26b50..2576165c2228 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct xe_tlb_inval_job *job);
> > > > >    void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
> > > > > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job);
> > > > > +
> > > > >    #endif
> > > > 
> > 
> > 
> > 
> > 
> > 
