Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AB5CCFA18
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 05:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB8610E0D3;
	Thu, 13 Nov 2025 05:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMB/93db";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9197010E0D3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763012635; x=1794548635;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5D9hUgwjzD0/v8T5e+DHScBVot8/YEbKfg8it9HzeSM=;
 b=dMB/93db9YlNrwK84/9eZeSSUAVYs6kw2nIHBCQqUayL2SnABZM8e7aX
 vN9qwY34W/XaevmITueQPEtZBeBaocBDUCPu/d4NSwBYaXpy5nT8zoRwF
 RfiUx3AcJ6QKyfJmtckMIa8AeFYoJx/SlJsisX7H+ZWs+cQ/PAQQAFJcG
 /IPhZkVWZOsiuUmjDl3NR3lBS31e0e1/UdIJiVocH73IeciooWU0cefm7
 TWAusr+K9WGDkCuPeWC4oWafHxlef1HAhBm6Fz8BNWgf5afY9u/V02kIr
 7WZf2SY0DAZhUCAPBMBjQSh8CMaB/mSUFPkPZW7TeNyDdWWT2YlQCfiLS Q==;
X-CSE-ConnectionGUID: K0nC/QRmQmuaPgzqNOxC0w==
X-CSE-MsgGUID: Do2r1WbMThucpRnXkTajFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65021383"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65021383"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 21:43:55 -0800
X-CSE-ConnectionGUID: lLZ/+A+dSyu1dkGWa9+rmA==
X-CSE-MsgGUID: 9c7UCvNMSkqd+lKb3si/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220071715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 21:43:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 21:43:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 21:43:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 21:43:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX9o4fwNAXlZ16ZjSqrxiKl/uOGxYjObilyw5VG2hX3nc8sgaVPnV+AvfJgZ4aVtzqNj3TyCFwULCXkVGHzXn5gaB2uscvPIhq/n+GBeWuCPsbL9r9twBd1JYFMgYUdGHKQwRsvLEikr2Bs+6VZ9B6DqoNo6NIgi9cQp44eNzS0TCaZ1+xk9N7X1tQxPVpSvP2MGBs/4KKVGrQqUvwT84FesQRSnK4RBtWDMzNkp2WZfeRiXTzOJXr+M0rettJMk7y0g6RGvSZvEs1YMdz/EfheLmrF7nE9fxAtWaIHoUQQlm4672wUPS0AawaKig7hTsjtTM8psQ1aso2eSgUwMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ASYtUDUw2CSTvbNENLMWqHm06PcT3cVA8MCLqJ3D1Q=;
 b=PN/kwFeOGxRSYxnGz/Nj5YgPzl1FvJQD5Un2WH+GikrpqdDiqdHdbQPg/Y/NdrziZRlVTfOXu/+L812ekdWVgg6hzpNWRjz+ZSlPjIcmDJt6fruH2k5Izvswbs7LqiHfU6Zh9oMn00L7XsJesM3U9SjobIrRlxwdPq1p30wD/wNq92MitlpFP2ajL8q8SmsNrhcf38NY1HrYaInajcNu5CljTS42oTECLBGmsPeWh5kJjafeEbdHay/uCb0ZV5gX43a86+dLWHnt25pz23wf5WkmSdIqOyGLPIDXQGncnOYEvOJV+3vXx8tn1lnel8anQv54exZxLp+/MJmriESevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:43:51 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:43:51 +0000
Message-ID: <f8f3b890-f29a-4f9c-8246-def070a92748@intel.com>
Date: Thu, 13 Nov 2025 11:13:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pcode: Allow checking for mailbox command
 support during driver probe
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <ville.syrjala@linux.intel.com>
References: <20251113044620.537345-1-raag.jadav@intel.com>
 <d3a3c573-307a-430a-8279-ef04ceb8a114@intel.com>
Content-Language: en-US
In-Reply-To: <d3a3c573-307a-430a-8279-ef04ceb8a114@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0180.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: c4921740-7315-4ff3-0dac-08de22779fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVN4WDNYMFJuWk9Hb212Qkd3UzcyQ09Sczd3UFB0Wm9tb3VYTTdlM3YralF0?=
 =?utf-8?B?Qi8vNEtKYmpZclRZZTErVmw0VEJLRmxOaHVrcFM3aFR6VDlHU0xkZHFzRmZn?=
 =?utf-8?B?UTlHUjNqdm9ITVAzN01nSko3cVpsVmV3MGpSSE90czRqUlp3TVd0aUpGd29E?=
 =?utf-8?B?U2lQeUNteDR2Wkpab3VlaUpCY0VVemRadzRQS3hJTHNCLzk0RUlGYklYcDE1?=
 =?utf-8?B?MWlBWWVLZ2FyQnVqVW1iUCtxM2FxRG5CYnZBOVk2Wk5mejJ3eVRGTHYrZXFQ?=
 =?utf-8?B?YmlvcVFRSWJJRzVGUUlLanlNK25ocUs5OERqZzJNbHkwVjQ1SzVzc21NK1c3?=
 =?utf-8?B?aVorMWlJT1VORkZkOWhmT2g5Y1hoUndEaXJLQlV4SUlmMmZVeUhlQzNHb2VY?=
 =?utf-8?B?T1pMdExQZWpQUnl3ZXR3S0p6T0d2T2VrNTFJaUVqbHQzYUQzZ3Y5c2FjS1lx?=
 =?utf-8?B?bCtKNTgwRDB4RW9NYUtvVkVCejFJRElXQjVkQW5XYVZNL3lURUw4RnM4bU9h?=
 =?utf-8?B?MExUWEEyOUpKTzUyRW9mUHZ5VDhScU4zQitpNXc2K3lNcVhrOE82NXgzc3ho?=
 =?utf-8?B?clRla1Fqejh5eWRnamt4Q2J5RGV4cWo5cmdVQk1JOFN2U0djUzgzZUNydVhF?=
 =?utf-8?B?UVVSM3hCNzRZdzNDYzdxLzhYN3MwYldkVUdDL3J0ZzlKc1RWODA1ZVd5SXBa?=
 =?utf-8?B?Z3ZWYmdmc213MGlBN0Y1WXpUMGRHU2RMWnVyNEVYOGdRdXgvbjFPcDhrYnBJ?=
 =?utf-8?B?V2FXTFN4WkI0bGRoS1YrbW9PZFUyeklGY1ZlRFR1aVZ1VTRQN1lLa1kvaytt?=
 =?utf-8?B?bHp3YW0vTFJoR0ZZblcrQlVnY0Vod1UyeFZBYnFCUThqbXpUanQ2bjBhOXQ0?=
 =?utf-8?B?N3BCU2xtR1k4UnRkMXNONytQNlZhTks2RGt4SllrS0dEV2ZUWHlZM21pYzJV?=
 =?utf-8?B?WllNTit4NzJsdFNCVUdFT1o2c0p0dHRBREgxUVdwc0dJeDF1NFcvM0lmWDlR?=
 =?utf-8?B?WE41YmIwQmdtQWpTZ0drT1haaWxFaGd4UU5qdGY3dFJFSkVISTJ0eHpGTis3?=
 =?utf-8?B?QkdNZTBsU1Y4Tk96c2RXRTNGWDFTWFlUMFVWeGFWdmpIV1h5ZjlYUEhiTlNn?=
 =?utf-8?B?YUlJM00wU05qVTlLMjhJNHM5MVI4aEZEbjQwTytIVldxSmJGVzAzR05LU3E3?=
 =?utf-8?B?YjVjYjd1SHpzV2NBQmpMY0J5RVYwUGJJQ3JLRFVsY3FrNEwwYzErUllpT1Zv?=
 =?utf-8?B?eXk2elR3dE8wWEZBclY3MTUwMGdQUVQyV3Q3WVpKa2Y5ZDEzcnFxcElMNHor?=
 =?utf-8?B?dEsyNFpZSGVDK01Edkkzc0VVQUFsaDl6NWE2dVo3UEZjNGJURTRTa3VtNXJa?=
 =?utf-8?B?MVNtQ2ZzRVRVTkdabyt2QnZkK0JyWG96Z3A0R2ZRc1g2OTdmeFhBTXg1ZkR6?=
 =?utf-8?B?VE9XcERXSWJDUHM3QUczNFZ6a2pGNWdzQUl2dFp6QU9vby9jN1VjUUtiSGUv?=
 =?utf-8?B?bkx3V3NoejRhN2Y5TEYra0RPM1pKNytVTEZzMms0ZTA0NlhMTzRFU1AzY0xj?=
 =?utf-8?B?SzFLNHRTU2E4TzI4bnlKMnRyREovR25ubFp1UVZxZDBVWVJYWmxpSzBpQjRw?=
 =?utf-8?B?MUFMb1NLb3I5d2VkV25XVGtPL0lqcUsrMFk1a1g3MmJvNXJpV0hncFFyQks5?=
 =?utf-8?B?SjRjR1NzdXk5TGVvYzhTYTZqZXovMGxDTERyeDUyR1U5YWZRZkZ3ckY0TSt0?=
 =?utf-8?B?N2pqaHppQ2l1cEFxUTVZUU9KbGVndnFET0hXU2Z5c3Rja1lPakFFZWk3SDRH?=
 =?utf-8?B?dUVqdlN6OWQ0bmkxL2huM3FjYUtld3dsbFRwcTZaM3Ayb1crR3hicnNKQ3B2?=
 =?utf-8?B?YS9hRWdYZVBoYmZyWDVXZkV1c3Ivem9lRG1CZDljMllpNEl3aC9ScFlRUE1N?=
 =?utf-8?Q?/73Mv2PpWPZT/6AhcXObkFM0XdnIGwF5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjlDZ01DSXd1R1AzT0pGdmRkZjlFL3cwVHJYRm9aaEh5OFI4bGVSallrc1pH?=
 =?utf-8?B?cXF2cTMrdFNpRjl4V0FRTS8xR1VqdGN6ci93eXNJNGFQMnpaZlh4UjQ0VEVn?=
 =?utf-8?B?UVdIa2Jpc2ZKblJoWG44MXJDanJQbEpVN2F2VnNHdEZEZ2JFQ01DSkw2R0ZF?=
 =?utf-8?B?NGc0Z2RzKzkzR2pTdUtFNXhsV3dCMFM1ZklXSE9jSWl2N3A5QjYrNnR0V0VX?=
 =?utf-8?B?NlE4L0hBQnNiemVpUHRXY1QycWNsa0dzVGhoVm43MmVoRkZ5dEl5YVFuSHhT?=
 =?utf-8?B?TGxnZmM0OW0xWVlhUGN1WXJ2cmZid1gvbjBjNWtodTh2SXhIMDhFQ0daWmtM?=
 =?utf-8?B?M21qd3drNHV3MGRkS0RLeXNuVzRqMkVkRnBNZzVzOHY3ZU9xeFI5b2d4amRX?=
 =?utf-8?B?L3RzK05nUU1ieDJPQkl0VmFEY3JWQzcrV2l1dlJBT0kvV0h0VHBqaHpRQ2VQ?=
 =?utf-8?B?Nm04dXVBQ3ovektaOHFqZmRCMm04KzdBZUlsVmlwMGJOd1IzcjEzYzl1cVp4?=
 =?utf-8?B?QU1laGR5VzJlbkFvUGZ4SmU1QkxoamJ3TllFaTJ4ZzhUQWxFRUdubE9mbUd6?=
 =?utf-8?B?N3ZmcVZSQWNSbW5RNlQ1bXhDeVNPRjlPY0x4eEVrMDJKTVBLVzBFYzBVMERV?=
 =?utf-8?B?YUUxbDcxVGFwUXlDR3RhV3ZBSGxDWHFXSXNhVXZtMFdWUXVmVlNTV0o4eWxj?=
 =?utf-8?B?RlV0K3hKc0NlM3MvMHFNM2U1UUx3Vk9ibUFtVFF0Tzk0bzd5NXhTMVdtMng2?=
 =?utf-8?B?NVA0R1htMzlxT1IvVUlvaFdodHFzbm9sQTFoUi9MM1FnWTZmVlRUY21NeFJF?=
 =?utf-8?B?dVBIZjFaaXJuNkU3UHlldjJnbVVzVGtJdUEyT0tPYzE2NDJwejRJYThRYmpO?=
 =?utf-8?B?azF3T0psOFRRZSt5cUZWbmJFbUFTRmRPWCtUeC8wRHZKTmFzZE5mZXhTK2Fi?=
 =?utf-8?B?QUJ3WTRZR3NsdGxsWjVjRjJ1bVNYVHR1WFFtWDRoUnZoUjN3TzVYQ3JJM0ZR?=
 =?utf-8?B?cS9HRFNWM1BzcVpZRW5RVDhyR0hVakRReHlnbXZkV0ZEb01pL1ExK2hJb0pu?=
 =?utf-8?B?U1ZEUTFsWjJybVhoUnBXVHRqUDU5SVZ5WmNvb3hlNlFkMElzQ0o0UmMrMU14?=
 =?utf-8?B?TzlVKys3ZXFwSmRTazZKUWRmTDNuK21OeVhkQjdNL25GaUR0alNXSVFxcmgw?=
 =?utf-8?B?RWt4TVVZSmE4eDkycDRISEtVZUh1cVgxM3FjVlBZbllWZk9tZi9YK1Yyd0hJ?=
 =?utf-8?B?Wm1ZZzZmbkNQaDNnRUZCdlB0ZTZCRncrMm0xRGViSWNSY2hIcEd3L3VCUkM5?=
 =?utf-8?B?WFJWQjNmeW1kM1NBN0poaWk3Q0NXZGU2RWdsME9NZlQxZEJwaW0wMHhKNTJz?=
 =?utf-8?B?T3VMVHFSaS9QODVPcXVOQVMrcG50U0dtRDlTdTlWOXFIVlExcTJyUnhXTGNt?=
 =?utf-8?B?TUNETHFKMGIxaWtwd1laNWZSSmRMNVR6UjNqQjBNOU1UQkhnMTlaQU5vOEl3?=
 =?utf-8?B?WU80K0YxczdCMWl4MTNQUG5FREVpTXN4NURKWGJEVmZHQWNBaFpUV0VJN1lm?=
 =?utf-8?B?WExyYnRuYUczVUdvNE9HNlkwRmxhOHdDK0t6a0FLRGV0cmlxVnJiY01pWi84?=
 =?utf-8?B?T0Z5U0MvSmRJMG5oRFhMTHNoei9lZGdWUmdBRm9qYzNqUWdFY1l4OURYWTFV?=
 =?utf-8?B?N01Hb0tqYlNBZ3VDQWtJWTMxN3pZYkFSMm5HUUxyTHFYMklIZmV6T1dFc0Fn?=
 =?utf-8?B?bG9vRE9OZFVRa3U3YVgvbTJvTkJnL216aEhsUlB3U1oxelZyYzVVemYySmxP?=
 =?utf-8?B?bFB0RmEzZHBjRUxHY3JYbElzS2FyY0Zya04xUGZsbUpVRnFvbFFSaExxYXJi?=
 =?utf-8?B?Smc1ckNqeWgrYmdvWDMvTWljcW1lTHhRSlkwMytuTzlPMFQ1b1h3NG5QMFV1?=
 =?utf-8?B?Z08rdmJtMDJNekV2TEJpYTJGa0ZJckV5Q2ZGdFJRcFFFUThBeWFKWE9RQVdG?=
 =?utf-8?B?UlZwMURDZGFrZ0V5NXRGR1kwWG84UjJMOWdPT2lSeGdsZWkzc1dDdi9lZ2dJ?=
 =?utf-8?B?V2ZKLzk0MHZaNVZGeEN1UjZtRm1hZnVRUlpqZy96UXdXeDAzaG5ZdEpiMFVZ?=
 =?utf-8?B?Z0txU3ZCdytLTWY2WUJsWVVWWFh2RUhFOVdLdFZTUlp0VytTZVRqdjRUblFw?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4921740-7315-4ff3-0dac-08de22779fca
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:43:51.4794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5epxutUfu/dzwSoEtof3dvMjOj6cIca/ftwTNbeeJK4RyZ5eVtHCg9SCtQ/ELx9ynQzULNmVBC7EiwYua4qag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
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


On 13-11-2025 11:07, Poosa, Karthik wrote:
>
> On 13-11-2025 10:14, Raag Jadav wrote:
>> If the device is running older pcode firmware, it is possible that newer
>> mailbox commands are not supported by it. The respective functionality
>> isn't useful in that case but nor is error logging, since it doesn't
>> particularly signify anything wrong with pcode firmware or device as a
>> whole. Log such failures as debug messages during driver probe which 
>> allows
>> the caller to check for mailbox command support without it being 
>> reported
>> as an error. This is useful in cases where we want to make a decision on
>> driver functionality based on pcode return codes and a relatively 
>> simpler
>> design choice compared to other solutions like checking pcode firmware
>> version, which comes with additional complexity of binding every single
>> command to a specific version and deems pcode commands useless in 
>> case the
>> driver fails to obtain it for reasons unrelated to pcode.
>>
>> This only silences command related failures and still reports other
>> failures as errors, so we don't end up hiding the genuine ones.
>>
>> v2: Split unsupported command cases
>> v3: Add device bound check
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>
>> I've not followed the documented device_lock() rule here because
>>
>> 1. It'll deadlock in ->probe() path.
>> 2. I don't know the code well enough to tell if it's really needed for
>>     our case.
>>
>> So feel free to weigh in.
>>
>>   drivers/gpu/drm/xe/xe_device.h | 7 +++++++
>>   drivers/gpu/drm/xe/xe_pcode.c  | 8 ++++++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 32cc6323b7f6..e8f997546ae1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -12,6 +12,13 @@
>>   #include "xe_gt_types.h"
>>   #include "xe_sriov.h"
>>   +static inline bool xe_is_bound(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +
>> +    return device_is_bound(dev);
>> +}
>> +
>>   static inline struct xe_device *to_xe_device(const struct 
>> drm_device *dev)
>>   {
>>       return container_of(dev, struct xe_device, drm);
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c 
>> b/drivers/gpu/drm/xe/xe_pcode.c
>> index 0d33c14ea0cf..0f1edf5155c4 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>       }
>>         if (err) {
>> -        drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>> -            err_decode, err_str);
>> +        if (err_decode == -ENXIO && !xe_is_bound(tile_to_xe(tile)))
>> +            drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox 
>> unsupported: %d %s",
>> +                err_decode, err_str);
>> +        else
>> +            drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: 
>> %d %s",
>> +                err_decode, err_str);
>>             return err_decode;
>>       }
>
> This looks fine, as the commands to verify pcode supports for it would 
> be there in device probe flow
>
> and we need not log them as errors then, it can be drm_dbg.
Acked-by: Karthik Poosa <karthik.poosa@intel.com>
