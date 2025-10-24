Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD132CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BFE10E00D;
	Fri, 24 Oct 2025 19:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaLpk1Em";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144510E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761335239; x=1792871239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KkZTZZr3PZYVdjSPAEW+8RCAuqhyCfClgsVm3iVnqTA=;
 b=DaLpk1EmKDeyEpub7TFOx/iKEz3BYLnJOzp/GFbtqhFw5CKrg9Fpo9O0
 nuoh8EQPWir6XwY/9XZARuICI4LjjIajpHCCuGXiIVz41VoCH8+I4XpxF
 vyTowgO9UxySRn54diC4E2szha882olCS3F0vWVYQ7Qj89UIB341tIgU0
 L1+ler5FlZXU1TLGqT62K6Pjf6RCQD1Ax3ea9Cbbay38Q2LVv1jgMIQWK
 Qi8FngaRy1ZgOxEJyo/pXVDNlgwRRkVRuzz6+k3CDlryawVfH/grNd+RM
 DbH+KxndTUravqccqPtnEG0h+3BGjXtu8aVFyn4roGrDhWDfgi5uo702w w==;
X-CSE-ConnectionGUID: 3K/wiuhSSCK9QcoA9KaFqQ==
X-CSE-MsgGUID: QF0JIutUQRqmo9PHHdhj2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73810100"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="73810100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:47:19 -0700
X-CSE-ConnectionGUID: elDxkCSdTNyM6E3orHMdMQ==
X-CSE-MsgGUID: 7129rKL3S0CMXWqR+UNLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="215165503"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:47:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:47:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:47:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHry8BFB7CAcKva/3v0zsqRZuI2W8U6w1bYF7499xMsj7DxGRCUnndDdZAgw4ZEJASXbh29rVdixrYwmFDmpY1HMyUbUiMf2WQ8xQmjwIYQoZ0fwD6lEnd/EJO51gn4tjQC4Dp0ESk7NkazJImi3K/+fM0kTVKkC5EVGPZHk0XiPdTIRMbN9PjyZLsp5AN6gxpkiDHyA1hfuulAo32pHWix+Mszf3HkoBA4I8efagVZX/HwOFy1r0vGJcQPd8h3wD6l5asQBXK6YyGD9zbqTWGPEusZ7BBLVig1q8LZBuOZohanNjnLiX5dUYo97sruzyJ3Yx+WS2fYhkJufW9qZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j94XRoiFBbAP0MMEozJG1oLEHZ3CavVPRSJJVmXqYrM=;
 b=mhsD0Sa3HHiL1+7GIjLG0ylOA4pHa4TvWQb5emmAmtwE8+8fq9jr/m58XYboMDMrth57CCTBDLr3lO//uRb6SIummcYvj2qg2hr07D/ZkQZd9UK+UejzvwAF2+ltWm+6/q7YpffBMECayfopUuaBURWy0hCp1CcvtIaY7qtixR7J/KcjQS/+ViZdOAj9SVy4m2Ltzbj/82ukSWoOPxRPD55H/7t125vUg6sOqSaxU2DI/xyZWQdpdHarId4iP9+5z03WjuU8b/F28v1Wi94x8LEC8GumwAmSKWtbqhdVJixfIPqwh60QNN4wKWMFkssn2WJ3H7s2B9/cbzvT3rHBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:47:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:47:10 +0000
Date: Fri, 24 Oct 2025 15:47:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 09/14] drm/xe/pf: Allow bulk change all VFs priority
 using sysfs
Message-ID: <aPvXu8JW10pOSKOu@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de82e02-540c-4f4f-1fd7-08de13361ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vnk4SlJPbi9xNjhpRHk4alVwWWhLWk9pNjIyRHdEK3pwV0k1VlVYUm01N05t?=
 =?utf-8?B?ZktFSVB1YTIrU3NNMmFwTm05YlhyK1RDRjBzTmx0RHFkY1lRYUZOKzB5eVFq?=
 =?utf-8?B?NysxUG5hdGJQNVphcWx4SStscXNpWnk0QVpyZmVIU3dtUFhoWXI0djNwdG1o?=
 =?utf-8?B?bGRhY0FYME5jSXhzdEdsdllTNGdBME01aEVQOGM1MVI0T3NEZkZvaUtqTzhz?=
 =?utf-8?B?YmRua0ZiMzVxZ0dYc2NxOFM0N0NxZEh2cXhEOXBQWkNjWWpkL3F3NGFEQ3BH?=
 =?utf-8?B?cTRvUTJUbmxnT3hGTERJVGlqeWdPQlU3NVcxS0IxS1c2YUdleXRKSFpDUDNN?=
 =?utf-8?B?QWpCQjRRL0NZWDM0aDMxSkZHUVhuSm0rSHU3SVpZSGFPT3lCY2dRN0JqMEZ1?=
 =?utf-8?B?VDBOS1BhTWttSWZIelRWbG5zV0VVeHBuM1p1OU9YMmd5bjVlUWJvN21mWno2?=
 =?utf-8?B?KzN1S2kxTFNPTHNQdlR1SGpwUmhLbzE4emg0V1I2cGpVNlVwWEFPOTFwa0hN?=
 =?utf-8?B?a2JZYVVtNU1KWWM3VEgzc2tNdjFLMDNVRndNQmc3SWErSElqcGY5eFgvRnBN?=
 =?utf-8?B?UHF5MUw4WU1lMnRjUW9ONk1PN3dSR1gzSjQ1N3F3bjJqMDFSMi9aaE9aWEhm?=
 =?utf-8?B?SDdna3VFOHNUTG9HL2t4WE40ajBkTWNCRlN3cjhCRjRlNTh6L2JKOUlaZnQ5?=
 =?utf-8?B?Z3lkWUpReXh1clpDVDFLVUtiM3hYNTV6Y3BRdWZKM3RwNzZDemhwcTZ4bXVL?=
 =?utf-8?B?ZFRPdDEraUp6KzFWcmNBbUozQmNkMlVzdkJUQk1NZ0tpTjVvNnZjOEd3a2Q2?=
 =?utf-8?B?Y1c4RGVwYzU4VjN0UWNqLzF5MFdaSlRpSWN0Tk9CQS9pSmZ3ajMzV0lpbDAx?=
 =?utf-8?B?T2l1S2szbTN4M3E0eEprZEFOSklDelI0RnB3a1JJREd5WVZEWTQrNWtZYVVP?=
 =?utf-8?B?ZXhHb01EMVpGMlE1SEN5VVdPVXdKSm13Q29GbzdEYklkUExpdXMyaHN3RFZT?=
 =?utf-8?B?WWJwbEVQRlRuSFVETGxqcGNtUHFCVnRwU1piYWpuWVgrUGFWbEhCbzRZZnFv?=
 =?utf-8?B?WDVCRDFuVFNxemdQZUNkMkppVHhFY0RPYXE3NDhpUXc3QUgxZ3pMa0VpR1ZY?=
 =?utf-8?B?Zm5FaFNGVlh0S2JhdXJIUFE0OW5naFMydEZ3VHZmdGxUaDZFdVp3cHRRTkox?=
 =?utf-8?B?bk1jbVIzU3Z0UUhJNERLNndCY2VnZ09ETGQ1UmFNc1FsWHFGRlpKZVpNNUN5?=
 =?utf-8?B?RGRtWVhaVW9zOVpsU09pSTVMdVdDZC9HVE1NUmZwN2oxLzZEckEySnkxOE1H?=
 =?utf-8?B?NGN5R2w2WnMxNG5WTGJvbWtIbTRhR1hRKytMb3N0cmJ5V1JxN2ZLamErQ01W?=
 =?utf-8?B?Y0pvZThnQjl6elRCbVRsWHhEbyt0ZWkrejhKbXJOYnE1U1BmNTZhMjc2UXpW?=
 =?utf-8?B?Nmd2RlJSWHRISktBQWdpYjkySWtFU211K0hRK3Jhd0dERVdjTTZ3TnB3UkUz?=
 =?utf-8?B?SGlJSmlqMVcxdmFlMG40enlUOEgwK1lVS0haQ1VhZUoyOXp0T2w5b2E1OHNs?=
 =?utf-8?B?ZmR6aHU1QnUxTTVnVUM3dVR2N041RkJUTkp3bGlqZDF1dHN0Tm8yNysxWk83?=
 =?utf-8?B?N2pacWF1QWhkWlpqcHFodnlYblJGd3l4NXpEQkd3L253VjNMZy9oZHNjdEdS?=
 =?utf-8?B?RDVxSTNFV0szTmNNTE94S0hOYjJzdzNMd2ZuM3B6cFp1YnJVbDhVcWpUbWZZ?=
 =?utf-8?B?cjhnREtrcHRlUkVxdVMyVVNmRjFVdzNwTjlnSDJvK0I1aUdqRXdkbGEyR2tP?=
 =?utf-8?B?TXpoMUlkUFhWSUszR1d6VUdFMEVRMWJmZ2VHZjBhYTdSNTA1cTdkUFB3a0tZ?=
 =?utf-8?B?d3dEMjdNeThJMzFBYXlwV0tGTXlnT0Y5UTY1TXdCK1MvNDh6aE9EeG9rN3k3?=
 =?utf-8?Q?/95eX3CEVsWq19aZejl3hLBghsCwcSYv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmUzNDdrQmwyaUFSK0poeHBCWWhic1JZbTZYZUxGYnNOQ3RId1hOcjBGYnF6?=
 =?utf-8?B?NWZlcUxkVW41RWRjbG1sdzhmcU1KYUlES1VpeGJQOFY1bzA4RjFmMEltcFZn?=
 =?utf-8?B?NFd2SFE3TWZoRzhwZWVhZnlKQzJQQ1hNNjJ2dkZob0hzUWhkd2V0d1Qwek5L?=
 =?utf-8?B?cnFKd1Q2RUVpa2FwKzFEcVZPdTQrbUVwSlhheXR4ZDg0eWwrSXR4L1IzQllE?=
 =?utf-8?B?QTFTOHA0MURDMzZTVDVqTXR6ZThocWdxZkVVZHdJSEF2Zk5pRkF0TjZRTVpV?=
 =?utf-8?B?R3IzTFZpRVhQUStWc2xveW5RV3RlWGt4NmQ1Zm9Wamd6Y3MrY3E2TkJ1RE5r?=
 =?utf-8?B?aFFIelczSmN3MG5EbCtsaWNtdCt3OExnTG1YSmtFK2o5L2g1Z0tDMEdZMGVm?=
 =?utf-8?B?TnJla1hRU3pMVThuRzdtVlZLVFp2TFdidXF0N1VxWGo2ZlMyNUpjWFBDbzhv?=
 =?utf-8?B?LzlNcDhlUXZHZkJkL1JEL2c5bW5ibFF5WFppWXNUckJsMkhrTjJRdkUrcERI?=
 =?utf-8?B?RjRKVE1QWlJwWHdPTkNrSEZCd1JRT25OSFVkT0VVUjNsNVhsUHdWUWdZdHZU?=
 =?utf-8?B?UVREeWpNbkxMUzdIQUJSNms5MGVFTmZoZWxNUEpXQXUrYzNUQitLenZnK2Yr?=
 =?utf-8?B?c1RaY3RXUWRMOTloS0lwK2k3bjdzbG5rek5GSmNJNkZnUU0xRnp5WEVER2Mv?=
 =?utf-8?B?QzFlSUk0VXczTlpKZUZCYzJ5Z1V6QmJHVFQ2SDlSbTVrSGtzZWJISG5OTHA4?=
 =?utf-8?B?cWI0bHJmZll4bzVGYyt3Tm5rMWhBLzZvL2wrc3RNRUZUQlVHTFF3b3hrbmFu?=
 =?utf-8?B?a1QwMUxKWHdJZEhrbjdOSy9mdWphWURzN3ZpQkxRc0Z4S3ltbXduanZPc09h?=
 =?utf-8?B?ZjdKRVBwekhCSS92M1VRNW9XU1RWVi8rdFZtNzNlVFNEK2wzZFYvUGJoSDNS?=
 =?utf-8?B?T0hTSXNLYkhacjdPU2FNSjZpYVU1RkxsSGJzTEVaMHMrVUh5bDBFYWRuOVpy?=
 =?utf-8?B?TlgzNUlISk9FWW1leTc1cHRtOE1uTGVnTmZnUzBIM3ZCdExSMHJMM0xaTjQy?=
 =?utf-8?B?OGsxaFlKL2FwRm9nZzIvbFBCUUlSb2xZQkFZem0xeFlWKzVTRWQ5MEh1Ukxn?=
 =?utf-8?B?NlJxdWU3RVdGZEltNmpVdldON1pWdHorUnZuZXNOd3F1b3dQaklITUpRNVk0?=
 =?utf-8?B?YlVkSXFEYW9hbnVRY1dxZ2QrMzN0Z3VhUHpoWFdtbmFZWDd2bkRZZmRjSlFm?=
 =?utf-8?B?aUFjY1pNL2FNa2FZYzc4NjBrMUhkNy9wcWlOL0ovaWlEQk9Gc2l1Ulg5eW5C?=
 =?utf-8?B?V3RUYXlWQWMvN25DaEQ0d0xCWUNVaGo5OENyL3dCU0ZUNHordmpwcmpERkZ4?=
 =?utf-8?B?d2FENGE5cFEyc3JBcmpxdlg2WDMwdUE3TGNiUTlyZnF3eEpDMktZQzl4Tkhv?=
 =?utf-8?B?MlkydjY4K1RhUUw2anAxZ0szVDdXZ3FhWmFxcllFZ3ZidngrSnB4SWlJaUJt?=
 =?utf-8?B?UUtsTW9RMHo1WEZHM0RKNjV0R3k3U0tYaFVxQUlpemRQVEZqTFp0NFExakRQ?=
 =?utf-8?B?ZVMzUmNZUVRTOVNicFBzMGhqTXluOWVZRHdVYnhURStvTWVmb0oxbWlFQ1lt?=
 =?utf-8?B?K1EvSjY3NURaZnFoM2R5ZEtEYnZzTGpmSU9Kbys1cGVUSWc2SHUydWhrT3BN?=
 =?utf-8?B?dE9LbTd6Nklkcms1R0J0UFNRZzJOWE9PaTI5QzBWM0o3V3NLWU5lVkF3NXQy?=
 =?utf-8?B?bXlWUElJSXlTcTE2a1Z0Y0pYeGYvZE05T3JjQjhPM3JJeGpEa0MxWHVSckRa?=
 =?utf-8?B?UTUyOGxONG1sUk5GVWViYzZvNkpRdGMrV0NmdEw4T2huWlZLNlNYaXU5OUNu?=
 =?utf-8?B?bUE0KzhqYWtQQS8vNFVaYjdXakRCN0dJM1E3Sll5YWdmRlFvU1V0V3NPT2pk?=
 =?utf-8?B?QXZGN0hBS2JRRDlIVEJZVGFITnFFbE96WUl0dmhoY2dWczZWdnRBNkMrNjA3?=
 =?utf-8?B?a3ZhWDJHV2RkNWZrS0hEY1NMVG9lVGVjRkNRdVdNY2tNSG1FZWt2VzRnL24w?=
 =?utf-8?B?T3FmbkVtcHpVMDJJYUxBYkJKTkY1SGNrcEdoN0svQy9xbGsvYjdoOUtTUE1a?=
 =?utf-8?Q?1vm7O+WcG1UkNDc+F3VX5X4SP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de82e02-540c-4f4f-1fd7-08de13361ee3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:47:10.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxJthxuoIFkyaWRlTWio2N7iyS3tVPRA61mgryP2BluNjqq5bweV+VEkFhsz5SNPLw/t9KumZ3Xcije25b79nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On Mon, Oct 20, 2025 at 08:24:09PM +0200, Michal Wajdeczko wrote:
> It is expected to be a common practice to configure the same level
> of scheduling priority across all VFs and PF (at least as starting
> point). Due to current GuC FW limitations it is also the only way
> to change VFs priority.
> 
> Add write-only sysfs attribute that will apply required priority
> level to all VFs and PF at once.
> 
>   /sys/bus/pci/drivers/xe/BDF/
>   ├── sriov_admin/
>       ├── .bulk_profile
>       │   └── sched_priority		[WO] low, normal

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Writing "low" to this write-only attribute will change PF and
> VFs scheduling priority on all tiles/GTs to LOW (function will
> be scheduled only if it has work submitted). Similarly, writing
> "normal" will change functions priority to NORMAL (functions will
> be scheduled irrespective of whether there is a work or not).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  1 +
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     | 42 +++++++++++++++++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 3a3806055616..89b2feb43b77 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -6,6 +6,7 @@
>  #include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_provision.h"
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 5c445094e223..26ba9a2efec9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -24,7 +24,8 @@
>   *     ├── ...
>   *     ├── .bulk_profile
>   *     │   ├── exec_quantum_ms
> - *     │   └── preempt_timeout_us
> + *     │   ├── preempt_timeout_us
> + *     │   └── sched_priority
>   *     ├── pf/
>   *     │   ├── ...
>   *     │   └── profile
> @@ -108,9 +109,48 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
>  
> +static const char * const sched_priority_names[] = {
> +	[GUC_SCHED_PRIORITY_LOW] = "low",
> +	[GUC_SCHED_PRIORITY_NORMAL] = "normal",
> +	[GUC_SCHED_PRIORITY_HIGH] = "high",
> +};
> +
> +static bool sched_priority_high_allowed(unsigned int vfid)
> +{
> +	/* As of today GuC FW allows to select 'high' priority only for the PF. */
> +	return vfid == PFID;
> +}
> +
> +static bool sched_priority_bulk_high_allowed(struct xe_device *xe)
> +{
> +	/* all VFs are equal - it's sufficient to check VF1 only */
> +	return sched_priority_high_allowed(VFID(1));
> +}
> +
> +static ssize_t xe_sriov_dev_attr_sched_priority_store(struct xe_device *xe,
> +						      const char *buf, size_t count)
> +{
> +	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
> +	int match;
> +	int err;
> +
> +	if (!sched_priority_bulk_high_allowed(xe))
> +		num_priorities--;
> +
> +	match = __sysfs_match_string(sched_priority_names, num_priorities, buf);
> +	if (match < 0)
> +		return -EINVAL;
> +
> +	err = xe_sriov_pf_provision_bulk_apply_priority(xe, match);
> +	return err ?: count;
> +}
> +
> +static XE_SRIOV_DEV_ATTR_WO(sched_priority);
> +
>  static struct attribute *bulk_profile_dev_attrs[] = {
>  	&xe_sriov_dev_attr_exec_quantum_ms.attr,
>  	&xe_sriov_dev_attr_preempt_timeout_us.attr,
> +	&xe_sriov_dev_attr_sched_priority.attr,
>  	NULL
>  };
>  
> -- 
> 2.47.1
> 
