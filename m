Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED4C5B552
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 05:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7525210E7A6;
	Thu,  5 Jun 2025 05:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTFOIoJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C510E7A6
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 05:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749102534; x=1780638534;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ILFIPXEEIqvEt2BOWgzReEmFL5Sl+ccmOphBASglRyk=;
 b=mTFOIoJYDZ1AHB7gtew/2YcrxLJ3BQQxHiPWZplhMKtFy82IURPJqMX5
 JvbszGdRIdW0a+7iYzhcTpCWyJuCtJQpnpoAM3D7n9T0h6W6K8YnR6qkw
 L/ui5fJWpF66EFIw0uRmrZxOWr2IjbJ2x13WveC9nXG3xzcy7Xvl7fEtA
 TxR2ZuF7w0RSg8fmJfw2lrsPjHdGVkniNq80cHj7ij7ZzfN/SLFiSbE9F
 Z/r9oCCW38hYA/DHMmqzkacqQjqOqb+uLr/UbxYVQqQVyxyKEP86MeMiI
 tpb85Ox/51qzXw1yRVNAg+wNKw74Lc/hKBUpbR+5bID5SfpIbPLJDl+k+ g==;
X-CSE-ConnectionGUID: /VOK1GZQSzyjeyfFhBXW3A==
X-CSE-MsgGUID: 20LNKsKKTfyHOon3o+OAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54996939"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="54996939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:48:53 -0700
X-CSE-ConnectionGUID: t7wrwbP2QYi9NxDlM486eQ==
X-CSE-MsgGUID: 2g7hiyIFTzKM9HfaHdE0gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="182607411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:48:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 22:48:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 22:48:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 22:48:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG+1n7nJU16RW13EH2y3zwJqddNqbMI0+NzfgxpgUEoSxWPP6+dF5gjy17vEYKoRtRokcYWNbF4T1A2hCeIfqq/3Oh2m7b/5Gru6IH/djYSU5HpmATGrfwX4fTeyu/4BuKlJJIvUIq9IhIKWyWV1YxPWA7BNWOKM/dkHbqHcD3+ukCLkrK1CeG/g5Kx4+kGejyrZ/tSzV4wprfbEwpEsZTZYgJy9LElDjAeHtrF16hH17fm6tT1fUin3MCtMy4WPI/TYScdD6DNpl249XDqIHeA9DLYhZihskBCazORC+cZ2wYzBGj+OaOmtUVACfJm0IKEoh8i2g/0HN2IN2WhWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eaoon3GFenltC71bOuuLOjGHUVeyj91lRo7FVz14eVg=;
 b=U65KemDy5Fqemya9B7WiL8bs6jTgvagDEBUOuQ+XqNgnP6fjgNPdqdy+gtkQ2sXNqze55AmPbHbHh7Kd8GK3TuUiY9FYN1k36yAjFpM1bCm4IhkSKAesSzIgh94fJ8YI/eMeA0e7eaw6mUg/LfzrVGX+89wuY05e6J/qk54EgjhDOPO/qjbhgDi5PcxWWPsHXZkX02LCbbnaGEQQ0u6tEqYXsLIAfWF1Z1M1qcMvc5ut55Hx/felQaJQUC3BIPz5MxxXhjvoAhcHPGDh/aMYvGU9zHJtFA6p93sVTeTgtqykYUd7rw3IYMlu0h3PZVbszYjKnomE/PjteUJOXvWsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 05:48:50 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%4]) with mapi id 15.20.8769.029; Thu, 5 Jun 2025
 05:48:50 +0000
Message-ID: <5daf91d2-f86d-4740-b39f-e605deea6620@intel.com>
Date: Thu, 5 Jun 2025 11:18:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/xe3: Add support for graphics IP version 30.03
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-3-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20250603182430.1016734-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b289af-71b2-4db4-32a8-08dda3f4a5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEJWRmZzOVhVRFhDY1k2c1BOZEFQR2FHQ0pMdnNPU1d2L1hhWGlNKzBJOFpl?=
 =?utf-8?B?aENpYlFVY3V5ZXFBZmlsRmRpd3UvL05iVlhwUmhPN01iditleHBRYmNla2Nw?=
 =?utf-8?B?N0g1cG8velFMbCtKa1pVZkxJUlMrWjJpOUk1UkowaEJNT2llbU9IaW9jT2x3?=
 =?utf-8?B?Sm5BM2M3VFJGRG0rNlZteFdkZ3dHc0ZRelNDRERPRlNDN3R1L0FIY1MxN3Jt?=
 =?utf-8?B?OVBpdm5yVHg2OFVJYnZCcHJBd2lLK0l2RWVNR2ZjcUc4QTBQWUppVzR3MUtR?=
 =?utf-8?B?bGYzcjNlMWd3U0lzeUlFR01JS3B6dldRRGpRcHdwN1JGbjZvLzNNMGhkaHdR?=
 =?utf-8?B?MGhsL2NHeFBjeEZ1QjM0QkJFbFNXRzR5dnRIczMwNkJiODRyNVAvRHBPUUlt?=
 =?utf-8?B?SC9wREVqeDNaanN2VFdXdFZtL2dhb0ZDREtncUJpZjVLNlVNSmNEeFFiTGpU?=
 =?utf-8?B?WGxlb2Z4TzFDdVRVTS9zdUxJYWdScU1VVmJoVkVMZEVRR29ndm4zblBqaGFo?=
 =?utf-8?B?WXliTHB3YUx5VzllQS9oL1phN3BrNWV0SStxTURMaGZsdmdjOFo2cTVFT0N6?=
 =?utf-8?B?bVBacWl3QktFZGdndDVTL3RiRTdueVpTcWsvMTB3eUxxTlNBOERKZ244OXZo?=
 =?utf-8?B?cW52OWJjV2dUTTg1UFFoaDhmUEEyb2szVWFzMVd2Z1d3b2NuRkZYWDNqMldn?=
 =?utf-8?B?Wm9NamRKb1ZWZDNpanJJQmpvaStNN3huUDZQQUdkalZwajVUUFFubEVJR1M4?=
 =?utf-8?B?K0dPZFpYcUhpUUJseFpXRm11SnRicXU5Tkh5aGM3Z3NoeTdvVzg0Njd6L1Zo?=
 =?utf-8?B?dkVWZ0tCeU1YblhMd2k1WDhzZU1hQmQ3ajNyZnhSNmdpeDRadXZqR2RpUGRx?=
 =?utf-8?B?ZmU5aEsvcytOVHREUDNvQUtJYjdCS3BOYzZFVDBmTFp4ZmNmSzF3MTRzdUY1?=
 =?utf-8?B?REp2Q0lyMGpxdnJnRzU5UVZrbU9WUkpVdTZ2bzViajBVa0xHN0RDWUVoVWox?=
 =?utf-8?B?TDRFNEFJTHhQb0lKM0tVNHEzZDRVLzJaTkd2UC9pWGhUUkxiQUFyQUswZ1lV?=
 =?utf-8?B?L3BqLzZha2dUQittMTJkZUhhMytKMlQ3aXdGSEloRk1vWlZTTkhGRGpxRlBo?=
 =?utf-8?B?WHh0QXFwbXAwWUlpY1V6dXlEYmR4c2xnZFA2WWcxdG40TjlrZDNmc09uTHo1?=
 =?utf-8?B?ZzVYRnlKdk1MT2t0VkZzNFA5SU0rQjdiT1R3R2VmdlZqYnRSQ1dOUzZ2L290?=
 =?utf-8?B?T0U4Rmk2Wkh6eXp0RnhSaFpDQUEvNmRHcFZQN1l1QXF3eUZyRHc0TDF5L1Jy?=
 =?utf-8?B?MjJVVitvRzliOERLTTNjbEZlb3U1RFR5Q1hJcERUdWczSGwxakhoL1ltTVNY?=
 =?utf-8?B?dDV1MC9MZHdOL25QM2FIL2tMZDVySlFEd2x3OU5iazU0czZZK3Q0VWIra00y?=
 =?utf-8?B?RWJiMG9sTU5xWVI4VmllaGgyUmF0YXNCS3BjUnFHRWIraFpFUkVVdW5KMmVP?=
 =?utf-8?B?Wm1xck11RWsxVlZFNWhVbVFZci9sMTJVSTRXUjlFbUdCbTl3Y2RZUzEzTEZz?=
 =?utf-8?B?bkJoT0pPTnd3azR2MlR2YjJpKzhzN285b1ltMkVzRDA5WmwxWk1XOEw0Z3dL?=
 =?utf-8?B?M3ZTT3FzS2FNSmhOSFZ2RzNod0VndWkrTkNkYk0va3VvVjdVQnF0VHZFd0NU?=
 =?utf-8?B?N2ptamI3a3JvZ1pvSVBoVlJFZ3lYa2NvQzlidG1nVGxYTjlLM1VPWnFmV0Nt?=
 =?utf-8?B?aHRZd0pIdStFcEVIUjlKdWYxSDZBRCtmdjA0SFFJRmNnNEIyQ1E2Mm1xMjM2?=
 =?utf-8?B?b3B3U2V2ZXpxN1lCckUyTkN5c1RudTFJY1JGMTkxM0ZXUXBpSWpaS29JN0dy?=
 =?utf-8?B?TXRaNnJvZXA2Q3o3ZTQrSlFPVFZxS2tkdDQwTWJReHl0TlE3REdGUFdlc1Iy?=
 =?utf-8?Q?d7iTio9Hq+8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFCV0ttenE4bUxleG4vWEx0cFowL2Rvc2c3ZXhHMTROdnQ2WnMwYzdQeWVC?=
 =?utf-8?B?ZUdnQjQ0S1FzZVhtSy9nTzliQXJHSG1CMENSbjBFcG1pR1IxSTVQMlBPd3JY?=
 =?utf-8?B?SFhtOXRXMmROWjZhSnFuU09RTWJOMDRBYU4zeE13bndFUTEzRUp5aFZVRXAz?=
 =?utf-8?B?RkdOQXRIMXRSMnQycFRCZWkrdndQM29USXM5M3VkVUl6QVY0VVJ3Y1BKL1Fz?=
 =?utf-8?B?dENtS0ZmZDFFTzdVc0NlWVU3TVA0K3ZWOWZVTjJwWjJSWVdiS0VFSVJHVVdL?=
 =?utf-8?B?ZEpMTncxa2w5SXJzNHJKa28vOHpRZ0NvVjYrcDEwNjFoVnlEU2NpSTFBRC9M?=
 =?utf-8?B?Qnl1MnplRWM0RUZWS0w5TUltNks2dkN2RTZPVENDZWJjbGtWMDJKbjJJeC9C?=
 =?utf-8?B?c0FMUjA2RUg5cW1WQ05Qcnc2dDhXM1BYVTE0UEw2L3Y1dVRsNXY1MXFmbzVx?=
 =?utf-8?B?SWtYekNxUTdwb1JIL2RMRTBrMXlRdGZCbGh3WUNBblM0SkZzbXZYcDJMT1Yz?=
 =?utf-8?B?Y1IrTGc0dU9PWXY2c0pxSWNOZDQ0WmtMR09WajFZcnlMRDkrWlA1WmVEU21K?=
 =?utf-8?B?UFZrbkhtck82d01kaWF2VWovajhTT3dydE53MEMrc1dkUEdWaExWK0dsUGIz?=
 =?utf-8?B?K3Q4Vlc1T0dNYUdhOVQybHFQbGlLN04zQ0hVcjlFNDZXa2lGUUwzU1hkTDg4?=
 =?utf-8?B?ZmhJTHdsR0gwTTRNYVd4b2pxa0ZzckhsQUFaby9GMFA1T0ZsRGRFTGwyT1dB?=
 =?utf-8?B?RTlveXBoUW5icm1PZnZId2FrZVIraVN0em44eENKNFBYZXExT3VObU42aTdM?=
 =?utf-8?B?ZWRrNVhMMkRXSHFodFZZMHlvdU11MzBxa0R5ZGxUcG5KazQ5MThPMTNwMTdH?=
 =?utf-8?B?allESXR0MXdUcVhSNWFsb2tGbVBnRUo2WkVyd2JXMzVoUUI5QW15dDRJMGVR?=
 =?utf-8?B?ZlpoQm50aS9XM1hqaTdxMC8wVGxzQnp6MENQUVlTM2NRUklRSXh4bGlqK0dP?=
 =?utf-8?B?aTRzMGJscUN3NXdpZ3JGMGRzR1dmYjcvZ0p1OWFEU21zcDNCdHhWTmUrL043?=
 =?utf-8?B?MUtJOStoc0I3ZWh2TlpCaVdxbnlhMVlmOEdLKzY4VUtJZndITFFNSkVNeHp3?=
 =?utf-8?B?TjdWMjl1MUc3ZTNRQlhkUnRmWi9OL3BkMWNydG8ydk9Sd0FLNDgyVmhwUmpT?=
 =?utf-8?B?ZCtiSi9zR3VyKzhJYy8vR0o5TlFqUXJUNVIyeTlYYi9zbzZ6VTluTUd6UGlw?=
 =?utf-8?B?c09ndDVxc3VjRlRZSUltS1VlRE1GT0pCQi8yUHcra0RXRWxDcDJqUDZ5RnZX?=
 =?utf-8?B?V3dzZUZVWWhjekR6dlZ2UW4wcGh4NkRGNzJUdWFBZWlITjllZzdQc0pFQTNC?=
 =?utf-8?B?dVlQMnpFSk5la1I1S2RlNHk2UktmekswVnhWT2hXVGVoNW1vMlJFakw5SWlV?=
 =?utf-8?B?TGNDUG4wMjJTN0M1a01QdHJmWWpDU3k4dWljaXNaYVVCQTdQSVBjeDRBUFdO?=
 =?utf-8?B?ZFZLWDBtRitpZlAxMHFwN1p3bHI2TnQ3M0FiNUU2a1NkTXp4di9EZ1FoRXFx?=
 =?utf-8?B?NW5xT3ZNRmxIVC9SanpFTGlhcmZleG95WGl2c2hsRGRHcnRVZGtFRm50Y3gx?=
 =?utf-8?B?dms3UDJQZk5sQ2tRNEZPZUltbnN4Z3Bqc2VkMk54YzdZYk9RNlNzamhScE5w?=
 =?utf-8?B?eUkwUk5HQWZXSDZOOTZKYVdnemUwOW9MbmdGdnU5RjRVVUFaQ3hWUmVDMVdv?=
 =?utf-8?B?MHZtQU4vU3diYXVIS0JFTkFFZk1qQy8zYmpkYWlMUFB2VWdwMExYS21WaWFy?=
 =?utf-8?B?dlpyWVJROWNoejlCQzlzdlFUTlluVFp2NDd3UVR3SGtiVzkwdVNVK05lVjJ2?=
 =?utf-8?B?ZkRDWXg4dVNLdjVwMVJPN2J6THZjNXlWcW1yOFlOckpBaGllTXlPVEVDazRz?=
 =?utf-8?B?aEdKVGxxYXlWRjJXK3ljeThEK0lBOWhqUXQ2bEFCRUVTS2RqSWNKYnJnbEtQ?=
 =?utf-8?B?YVBraitqRXhtdGxURXNXZWhTWU52K2EyM2x1Rm1aOGkxZHRYYWpGaUdQRHo1?=
 =?utf-8?B?MFh5Y3FpVWQ4clhtMUNBZkkyeU83S2E4MW9EdVlRTUxpenNwQzd5L0dZWkR3?=
 =?utf-8?B?ZEU2NE5UUnRKMkpvNWwwSzVoeE1CejNiNlk5YUgwcURrLzAwZmJSZUh6aXhi?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b289af-71b2-4db4-32a8-08dda3f4a5ae
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:48:50.6744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OGv2MD6uo4LaE/v+52KGn9VD8AphYmZG34eGLyHnryRB5DaLrJW8vW+42lZ1Kkwd48q4LjTfY9uZG0yQhjFHNWm2fU+Kbv0BL/1Sb4ImWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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


On 6/3/2025 23:54, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> Graphics version 30.03 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c        | 1 +
>   drivers/gpu/drm/xe/xe_wa.c         | 4 ++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 5 ++++-
>   3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b68c90910d82..247cd928b933 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -182,6 +182,7 @@ static const struct xe_ip graphics_ips[] = {
>   	{ 2004, "Xe2_LPG", &graphics_xe2 },
>   	{ 3000, "Xe3_LPG", &graphics_xe2 },
>   	{ 3001, "Xe3_LPG", &graphics_xe2 },
> +	{ 3003, "Xe3_LPG", &graphics_xe2 },
>   };
>   
>   /* Pre-GMDID Media IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c

Any reason why we're merging the addition of Graphics-GMD_ID patch with 
the List-of-workarounds' patch? Historically, we've kept these two as 
separate patches, right?

-shekhar

> index 67196baa4249..5f750054a9c4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -640,6 +640,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
>   			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>   	},
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
>   };
>   
>   static const struct xe_rtp_entry_sr lrc_was[] = {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..557d23c1bb9f 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,9 +33,11 @@
>   14022293748	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)
>   22019794406	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)
>   22019338487	MEDIA_VERSION(2000)
>   		GRAPHICS_VERSION(2001)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> @@ -57,5 +59,6 @@ no_media_l3	MEDIA_VERSION(3000)
>   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>   16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>   		MEDIA_VERSION_RANGE(1301, 3000)
> -16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
> +		GRAPHICS_VERSION(3003)
> +16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
>   		MEDIA_VERSION_RANGE(1300, 3000)
