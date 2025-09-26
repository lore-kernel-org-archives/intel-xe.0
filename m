Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59DECAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 14:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A59210EA6E;
	Fri, 26 Sep 2025 14:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJgFbtPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AE210EA6E
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758896832; x=1790432832;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QsvbCZnVxs+MajlRlo8z9a8ZZiYbyW+t9DHnEDL/098=;
 b=nJgFbtPgHkJcjRwrIq1XA/RmQZ+Y0WuvWWBVyRmmQiPWSIxfD+65ElpJ
 trFolSXL9RuWFspuhsylSeHGIxYXyHPCF6sdms/lCEfOZ7GH54DGnHD4n
 m8oMJoX8CxWpLJZJZt9JSw+jTjMICpxSrH7S7RzmKoSGcrzawHtgLU3MA
 2EK0jkKmdM4gNu6nSUPWewUW0FbgdcYz4uEynjwDGv9VWuB+yBKjWv1W2
 ZTAk06/n09uqghC7jg29GaNZc4538812GsSzNBMi3NavtSahqoCZREo2R
 yeA9UQrprwuiurRONZ06vCm/ffO1aGYXmvfls6gyl2O2GvtLw2dfq834V A==;
X-CSE-ConnectionGUID: 4JxN6SFZTNSQv1ITMiuLMg==
X-CSE-MsgGUID: 1hXWWIMNR8qraxQNUH1c/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="83841895"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="83841895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:27:12 -0700
X-CSE-ConnectionGUID: rc9sBkTyRkmewKdtL8G4Pw==
X-CSE-MsgGUID: H3L8Z6R0Qk6z2Dah9t297Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182897345"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:27:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:27:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 07:27:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyJIGnxOKj2/R99KOc+hamuZyx/pZn+pfktAy+NWK4n1AX0SvCoFH7KvwhpmUyERo+Q91kbHyW8+R9xeVDL+t4dovDtzKJrIidjKfTFe15pf5TJ7Yva2RtFgYdT9VnhLVr2gXhKekROnKLA9YfO1DBrVB+D8UCVMdpiGLOmQ27HbGN3LU/n72/NbdpWGmcQzh1ZfHVkoFwErUhkxbKS9BNEILaeD0/gXf858hCFUitYoYk/A/2IfnHgsYdK5s2ny9fWxgjpCgWPAddsw8wp0SP6eLxcuku2E+lkocIhaY01X0vSflb5cN3SfS1e0KC9KEwybmVo/DOIMAz4HUoRRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLnFELNH5YpsrYcYdXSUdESndNeBO0Sw9vZGewqCiUg=;
 b=jKObxKpKEdkrMx6GfJe6G4dkl9/7T6ICSwG8U1GOculEawdEu+rCZkAdXRkV8T1MoPmDVNKbpippc6H67/Pi0/Zp7RrY1VDR5758an+MbCIZnOv72wicAhq8auD3gjZ6nDTV8lzipmK+agAi/ovGEYs/uOlF/LF7Fevuq1Ywa56skP5siD5WEFIv3SzEQLiysNO5z3t8+morHS3NJKHxvevH8qc1p80/xwUkz7Tfutnh3KvxiJGCCRHsNlqCl1WOOqucvnpAXG0KODKyFpJQ1sTTmpIg/NkdqCmcv19jHudg4L4lFvxTUUEbwdLJkTKAHmBMZT0C3uyVApcLJ3X89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 14:27:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 14:27:02 +0000
Date: Fri, 26 Sep 2025 09:26:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/6] drm/xe/pf: Create separate debugfs tree for SR-IOV
 files
Message-ID: <bxngimao35jeod3to6mqgpl23xssfasxottyvrnhljb4o6h7x4@3n5rgq3uh4uj>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925220425.196860-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 65da673b-7fa6-4e2f-97fc-08ddfd08c25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnE4UXR0NDcrbXQxTzFNMExoaVJmTGhPU2Nvc0JLbEY0ZTNML0gvYmpvazht?=
 =?utf-8?B?Nzk0QnhPejJqNEM4d29sbUZYRW5FTlBnaU5Db01uY3RqbExhMmIva1A3WkRs?=
 =?utf-8?B?cnJ2czMzcHRkZEt1RjBRTWw5a3ZVRGpUbGFXS1Nta2kyUUtGMUFrSUxDR1V2?=
 =?utf-8?B?enJzOG1tRVVuVXlDUGFUeGFXeHFSZGRzK3pSam9nYnB3K2oyeUhpMFd2QVdk?=
 =?utf-8?B?NUo4ZWJiK09saWdpR1BmcVk4emR0dldHSkJFL09EVVNEU1orTTZ6WVVubzBF?=
 =?utf-8?B?SzVCREx5a1BCbU5LTWRhRTRnak5DNEw5cnVHYTBldWc5bGxiMDJPQzNveFg0?=
 =?utf-8?B?QUJLd2JYb083eUQ1b2RLZnlSZmdiTFB6YnlVRlV1bDQ0OVAwamw1SDRUK1Yr?=
 =?utf-8?B?cnQwcU1MOVA3eWx5eWhwdjQ2eXd2L0FRcTlvRkc0Rm0wcjJxbGV4SHVJMkhB?=
 =?utf-8?B?SE1ZUlA1aDdiTXdTalBUTzN4L3ZBTjJUS3diQWNEdnFoNHBjM1lUSWlTckJO?=
 =?utf-8?B?Z2FxVXVJTjQ2Zno3Q2V0K2YraDlFVjVGR2tnUXBuUjluVm5xVFVldHhISm9I?=
 =?utf-8?B?RG5ZZkIrRE1ZaWRhS2ZuM2RlZ0RTcDZIYjhTUitSQnJaT2RNNlMxcjkzSHpF?=
 =?utf-8?B?dGxYeGp4MjhHcVI5WmtRNTV2ektrcVNQdkx1aWgzVVRYeSt2MHhQamUwQ2U2?=
 =?utf-8?B?VTNYenFIbDVWRFBVb2h2WW5wYWVIUGgyQnZpcVFnbys0UHMwelB1LzRIK3hD?=
 =?utf-8?B?SndUcXNKbkhHdTVKbHJ3STh3RnhYOXJDL3k0TEh6RUZOZDVZbklkcmpaYnNq?=
 =?utf-8?B?cmFDY0krNk9icGxXeDFMRy9TNDkyeUl3bnNvbnB0SFFXRTJKRzFjWGNuRjZ4?=
 =?utf-8?B?Q3N4T0kvRmw0ZW12NlhFVWZvdm41eDJpd2NuM3pQempEVGcvUHZ5MTh4N21D?=
 =?utf-8?B?eG1VZFlVck5oY1dRTWlBQzJYemlpK3JHbFB6WmdHSmJQUmtuVExtWHE3aTV1?=
 =?utf-8?B?T1NENkN1K3NZaHQ1R3ZJT2pqUitRQ0lQUXQ2T1ZEaElSby9OYmFZK21Ca2RM?=
 =?utf-8?B?VGRlZ21rZ1cxWEJJVXhvcUxkOUFMWjRSckdHb2xPNDVTMk9kejQ4TnkvZld5?=
 =?utf-8?B?NE1YRUxBSTIzSG50a2lMV2lrREpvYWF3K2Z0MEkzc0dZYTAwYXR5eDJ6aVVY?=
 =?utf-8?B?eXBSVSt1QktldFcvaG5xMldjcXFGVHZKRFZjTjN4NlhJbUp3RUQ4a2xNcG1C?=
 =?utf-8?B?SnV0ckZjU3ZrWTJmTThNR2ZES1BXUW5MYzNzMkZaRE9iZzJpL0lzRWxWT1dU?=
 =?utf-8?B?cHo4Wlc0TVRDTDg4WVFYbTZvc2JaT0JLZndOVm85UGdDN3BSSDBaQzFKTThn?=
 =?utf-8?B?eEt0QmNZZkNFRnFOTCtlY2dpTmNUbVhjZkxTbzlCalJ5TTc0MWZTNEdLM2xJ?=
 =?utf-8?B?RkxmT005a1JjWFlPenRSNkdXSlBrRXRWanhrc0d0RnEzNzJaN2tYMVowcTRx?=
 =?utf-8?B?VVF0NWorUW5uaWM0YzE5MDBIU3NPWUI1TytvczhXam9JU2JxZUY5TWhVUW1m?=
 =?utf-8?B?ZEVnNjNNczVNcGtkSlFPR3MwZ2hkNWdrVHl1Vm1qOGk0eXRnRWJEdis0N254?=
 =?utf-8?B?OWZObW5KRDc0NXBDU1B2SU9uYUNzMjFvVVl1dkxQSEpGeDJlcmVTaGNmNXQw?=
 =?utf-8?B?RlNOQ3ppNXg5RkVNUFkxNkowZVk0UTMyU1JFUklaZHVibzZhdG9EaHBQUk9U?=
 =?utf-8?B?MVZPRWRhZElhVjRaVldqK3ZMUU1rMjJUdlR4NklNR09nc1BSb0ZHMlIyaWxi?=
 =?utf-8?B?RFR0SVVJb1NlN2xBbjcxVGZZU0VyZFF2UXlUMncxR3VBbnJqRlhCMTNmVUhC?=
 =?utf-8?B?U1lQeWdoZ0w3N0hZTGxjYzlaalpNbzltN3FxUzZlWmUya3gyMHB1TUNrQ0dI?=
 =?utf-8?Q?wfqR7/VP4TM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDM1OW1ZbXk4WVgwdzVSRThYR2FmN3lFVkZzWDU0RU1ZcXpZOVNDbUVDdHVy?=
 =?utf-8?B?K1V0R3pTMHBTRVViKzk5YzhQc2pVNUh0UE9CaFFneklPL012Mno0RTVTUGFX?=
 =?utf-8?B?V0tCdUJoaE96M2l6Q3d1NXc2Q2R6YXRmejd3Q1BiYmRqY21GYlBYUFErYkNU?=
 =?utf-8?B?aWFDOG1IYnVYZytidHd6aHNSRjJQZmN2cWdkNHJDZWR5N3VaVEdueDhVa1VW?=
 =?utf-8?B?NEJ3QzRJNUFuTDlMejhjV1hlUmRkM3RibHQ2WW5iajd5MlNmeGVrOUpTWmtk?=
 =?utf-8?B?QjFRZ0k3SnBobDQ5MTNUbUp4dzFiQ0ZWd3hJNys0RHBSMjlJeHpYc2ZablBl?=
 =?utf-8?B?Y1RrTTJOelBDN2lXUVl1UFh0bFJEUk9hYUsxRWFvem9mRWN2UURqcGNieWdn?=
 =?utf-8?B?N1U3dDhWZWNQYk9tamovdWVOWGsxQmR4VXdhbTN6blluTlQyWlEwcFJYTC9L?=
 =?utf-8?B?eFZ1bWhtVUw5QlRyTjQrUDBJdTRyanpGeWpjeUJNVnRUMkV0U1JSSEQ3QUJs?=
 =?utf-8?B?ZE9XblYvSlBIK2VkaTFqUVRLTFUxS29YL3gyNGg1YmpnQTN3cHBmbGpOUGxW?=
 =?utf-8?B?SVpQY1FYcmtBR3JxQzA0MjhpWWRNNlliT2lDUDBlc0tscy9DRXZXVEVoUXJT?=
 =?utf-8?B?L3ljcUpINnIvOENOYWtHYnJyUGkrNEltS3Nza24rV3VOUXhiZUlDQjhnUVB5?=
 =?utf-8?B?Wk9OSXR1dFFpNExEdUlNT0JjekFTWUZhaUxIYmYyaXZTb2VOY1RPMnpuZkRu?=
 =?utf-8?B?Z2M5NGhMNk9MY0lMblBnc2hVYjZVajE2dk9hS1lnMnFTQUhnNEpsZERJQytR?=
 =?utf-8?B?ZzhFMVEzLzhOSFVpSzdtUjUxTWVlaEVQS25VcmgrSXoxdGJFNUhuQzJkdTVF?=
 =?utf-8?B?MmFXUjNKKzVWWmR0WGk2WE1PWmkxb1RtR3FCclhaQXR3dERFSlFydXQxK0FF?=
 =?utf-8?B?aDBLZk5uUnZod3NiS0VLclNMOHY4R0F3VGV2TUhwZ004TXBCdTVTZm1xTENl?=
 =?utf-8?B?d2dHMVJaMU5vQ1hDRXRmY2RKeDUrVjYzL2NvZU5YdVVTcjVJTUl1RDdxUE9F?=
 =?utf-8?B?bENvMmZibE1sQTlpUmI1VWRKSGdrNlovSmZRbG5xalpSdjJQWEpWaVVpVGkz?=
 =?utf-8?B?S0lzN2gyV3JnSUtzSUtYdEd5NFlzT3JpZExKaTJOSGtHb3I2VFdJMGhFdyt6?=
 =?utf-8?B?NHRJdXljbkVYRVFwalZLRUhKNXNIRnhzNk5QZFN1TmhYRmRBdjNqTUZmMDAz?=
 =?utf-8?B?NHdhNlh6ZlZaRVcvWGxNQkQ2WUlYSk5TREZGbTBtS0MxSlVCWUdGOEZvQ3c4?=
 =?utf-8?B?MnJmenlDNC95T0phc2ZZa2RONVl1bzRGemU5R1lSQXpIT0tkZlZnN0V0VWl0?=
 =?utf-8?B?Y0JreUNDVXVlWXA4OUV4K2ROOWpuMDMvS2xCdHZDR3crQnRnSVpvU0RKcmR4?=
 =?utf-8?B?SXZmNG1tQlpTdmdIUnREQ1FzYzlRWThkSllBU2M4c2ZRUC9YRWRGUjdpZU55?=
 =?utf-8?B?aHI5di9mcHFRSS9CV2RPdzN0MXdndTA1N2xtRWpSMFFKQ044c3dFQmU1azJD?=
 =?utf-8?B?b1VTaUJDNnExUjVEUUo0N2NXL0ZoWDBZU0dNZTM2b2l1cGtjclE4STVpS001?=
 =?utf-8?B?QmxFTFIxMGs4eDIrcWh6OUt6NEZEY3gyb2JaTVY1WDBDOFVHU0pUMTRpTW95?=
 =?utf-8?B?b3ErbS8vbmJFeVp2R1FYd0dpR3FmK25DTzZUNmtNbEkvR1FtekJBcGdFM0dl?=
 =?utf-8?B?UEloN0hZbnl1c042RHJVNS9IRFFhbS8ySmpVcnRUbnFmVXJYT2hqeFBPOTZi?=
 =?utf-8?B?QzB4MjdHY3NRMHZSTkt2aHlrNC9oWjN3dHpvRDRYdURpOUYrM2d6RWx1Y0VO?=
 =?utf-8?B?bTNUWHZlK0JuT1VKdlFIQ3JuY2FZNFdsMEovOFJZUHFkMXJZQmlRMGdVY0RM?=
 =?utf-8?B?dDdjbm5IelBUbHYydmZnZzBjT3NnUmFYM1ZqZ0krcWpMdk0vR1ZFQzMxVVVP?=
 =?utf-8?B?K2RDTitrMTRWOTVjUGlUaU9qTU9ndHluQ3RmdE5mVzlqVnpFV3R5cTE2aXAx?=
 =?utf-8?B?VFEwS09jWlZaVzZ1V1drMXQyYkMxTG9NOFl3Q2c4c0ZucndBZGJIQ25vT1Fr?=
 =?utf-8?B?d2RsVWhraUU3V056eU1FL3ZORFRqYjRRNWlYamxGM2xUdFFrdWxrM0VaSm9m?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65da673b-7fa6-4e2f-97fc-08ddfd08c25a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:27:02.0106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gimcYieOdWoAQNnvvCDqsL7W0UC5Aykhpx3HayZXGo4V5TGN+WKMcqxuODz2B4HtdYEl/pxaWr475bfcUx5XQAhu4F73uxHLPcceW4QwOSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
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

On Fri, Sep 26, 2025 at 12:04:19AM +0200, Michal Wajdeczko wrote:
>Currently we expose debugfs files related to SR-IOV functions
>together with other native files, but that approach will not
>scale well as we plan to add more attributes and also expose
>some of them on the per-tile basis.
>
>Start building separate tree for SR-IOV specific debugfs files
>where we can replicate similar files per every SR-IOV function:
>
>   /sys/kernel/debug/dri/BDF/
>   ├── sriov
>   │   ├── pf
>   │   │   ├── tile0
>   │   │   │   ├── gt0
>   │   │   │   ├── gt1
>   │   │   │   :
>   │   │   ├── tile1
>   │   │   :
>   │   ├── vf1
>   │   │   ├── tile0
>   │   │   │   ├── gt0
>   │   │   │   ├── gt1
>   │   │   │   :
>   │   │   :
>   │   ├── vf2
>   │   ├── ...
>
>We will populate this new tree in upcoming patches.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 73 +++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_sriov_types.h      |  3 +
> 2 files changed, 67 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>index 2a1316048439..b2088b6dc23f 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>@@ -9,7 +9,9 @@
> #include "xe_device_types.h"
> #include "xe_sriov_pf.h"
> #include "xe_sriov_pf_debugfs.h"
>+#include "xe_sriov_pf_helpers.h"
> #include "xe_sriov_pf_service.h"
>+#include "xe_sriov_printk.h"
>
> static int simple_show(struct seq_file *m, void *data)
> {
>@@ -28,27 +30,80 @@ static const struct drm_info_list debugfs_list[] = {
> 	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
> };
>
>+static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>+{
>+	struct drm_minor *minor = xe->drm.primary;
>+
>+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
>+}
>+
>+static void pf_debugfs_available(struct xe_device *xe, struct dentry *dent)
>+{
>+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>+		char *path = kzalloc(PATH_MAX, GFP_KERNEL);
>+
>+		if (path) {
>+			xe_sriov_info(xe, "SR-IOV details available at /sys/kernel/debug%s\n",

that's a possible (and common) mount point, but it doesn't need to be
there. I think it's ok to have it in comments in the source, but as a
info in the log it may be too much.


>+				      dentry_path_raw(dent, path, PATH_MAX));
>+			kfree(path);
>+		}
>+	}
>+}
>+
> /**
>  * xe_sriov_pf_debugfs_register - Register PF debugfs attributes.
>  * @xe: the &xe_device
>  * @root: the root &dentry
>  *
>- * Prepare debugfs attributes exposed by the PF.
>+ * Create separate directory that will contain all SR-IOV related files,
>+ * organized per each SR-IOV function (PF, VF1, VF2, ..., VFn).
>  */
> void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
> {
>-	struct drm_minor *minor = xe->drm.primary;
>-	struct dentry *parent;
>+	int totalvfs = xe_sriov_pf_get_totalvfs(xe);
>+	char vfname[VFNAME_MAX];
>+	struct dentry *pfdent;
>+	struct dentry *vfdent;
>+	struct dentry *dent;
>+	int n;
>
> 	/*
>-	 *      /sys/kernel/debug/dri/0/
>-	 *      ├── pf
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
> 	 *      │   ├── ...
> 	 */
>-	parent = debugfs_create_dir("pf", root);
>-	if (IS_ERR(parent))
>+	dent = debugfs_create_dir("sriov", root);
>+	if (IS_ERR(dent))
> 		return;
>-	parent->d_inode->i_private = xe;
>+	dent->d_inode->i_private = xe;
>
>-	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
>+	/*
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
>+	 *      │   ├── pf		# d_inode->i_private = (xe_device*)
>+	 *      │   │   ├── ...
>+	 */
>+	pfdent = debugfs_create_dir("pf", dent);
>+	if (IS_ERR(pfdent))
>+		return;
>+	pfdent->d_inode->i_private = xe;
>+
>+	pf_populate_pf(xe, pfdent);
>+
>+	/*
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov		# d_inode->i_private = (xe_device*)
>+	 *      │   ├── vf1		# d_inode->i_private = VFID(1)
>+	 *      │   ├── vf2		# d_inode->i_private = VFID(2)
>+	 *      │   ├── ...
>+	 */
>+	for (n = 1; n <= totalvfs; n++) {
>+		snprintf(vfname, sizeof(vfname), "vf%u", VFID(n));
>+		vfdent = debugfs_create_dir(vfname, dent);
>+		if (IS_ERR(vfdent))
>+			return;
>+		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
>+	}
>+
>+	return pf_debugfs_available(xe, dent);
> }
>diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
>index 1a138108d139..761ae86cd55d 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_types.h
>+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
>@@ -20,6 +20,9 @@
> #define VFID(n)		(n)
> #define PFID		VFID(0)
>
>+/* should be enough up to "vf%u\0" for 2^32 - 1 */
>+#define VFNAME_MAX	14

why is this in this header? Make it local or maybe don't even add it.
16 is a nice power of 2 number.

Lucas De Marchi


>+
> /**
>  * enum xe_sriov_mode - SR-IOV mode
>  * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)
>-- 
>2.47.1
>
