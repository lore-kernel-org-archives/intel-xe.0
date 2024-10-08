Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799DECEF173
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CD910E00E;
	Tue,  8 Oct 2024 13:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIzmSlsy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9FA10E00E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728393554; x=1759929554;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWinE9fZGqDKH+DKLbr1ytUYHMszHzHum/J7POH0hhc=;
 b=MIzmSlsyytY8n0yK0+7XfR2gSJI7bZK4aJpd+QFvuDCwb1qXyGyxuaOz
 UcwHa18ppQFBL0WVWdtciEs/lOHG24hCee5PqJkCd977XqNORmDR3C1zH
 4KDMkmv3YyQqqiYgZsrvX/ae3px16K9uTjDCPwlkw3HxX519s2b+o1gJS
 wFIkdDnA+UX88V+A0F9F5MdmV0UjnyjhegvnvtA5NVW7c2xEUFl+ConY5
 V72ANZXFvwTlTLM/jPLmzHrhWloYn/rwm433e7HW/7aTunzBOOzTQfBrR
 3o4bo5e3m7Kgn4pTCmgwPw1gBzJijIYaqKbHPVpt6deLyclgdyCTRJxLb Q==;
X-CSE-ConnectionGUID: U43CJt/sRQqRFPc0YZMyhA==
X-CSE-MsgGUID: NCI12OOASFeqJ6OR75u+Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45053535"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="45053535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 06:19:14 -0700
X-CSE-ConnectionGUID: SxYoe9rJQxWfn0gUxiY21w==
X-CSE-MsgGUID: gacUzAgxRoiswywfEycB1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75702686"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 06:19:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:19:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:19:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 06:19:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 06:19:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWVHCn3g+UxUFRPsj6DAavt4mJw+8e+p+EY4eNxZMEGwu/1Kd37J67eDTUunTGHqq0xO3UZHZNiADE8V+cCbM+d5shctuWDrLq12OqMceJjSbo60xri3vOUke+UCCGXLaCw15uGhwXJfonbvBCLbhVml0kdF+7xByo+Ia8btVdQRAXtNGbc0HrEXsvmCQrICBQJt2gFiYrd6oEL7PJajxT/9AENyZHmfo/owMYTgc6kVwG9wKelx20ZwoDusVrhXcxuolVsYpXKuyQA5I6vaHR37o7WLaQmQO8P6AkJOn09fTzw1dTTr36oqzoKj1DxKTHJIcsnCe4napZbfAvM9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC1624Yk5G78NXgl64pI64rslB4gjDMWiRwwVz07a6s=;
 b=Nl7NfvMWQ4aUNlJXauR3PaJVB9EUC+7P1VsOfnIM97mml6JPf91WmNJiSbvlFuBc0ukAeWjHQq0WivJY+6oKy3DlRCdnsi8Gbc7K7owa3qwbmSyeIalUHwEP2MYXGJPy9rv8YaBSBRPlJ3iaP3pQbwDLc5Ql/BN9D8ZtFSZTZBIeekyj05oNDSjqIpKGLBNtdnzmW2w+4eB8nCJWFlG6M3KMdlNhDjbBFGbpkYCXtUtmzhMgxUf6taM1HRh/FGnzuRzreJ8MevBrqo+Bz/zoO97zEIzbNFvomNcfIJMlDj7Z8GuRibl8x7r2tMGbGo/Rw+9uWI5lrjLNYEfORoyG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Tue, 8 Oct
 2024 13:19:09 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 13:19:09 +0000
Message-ID: <fdcfe5a1-a875-499a-b46b-630c3516dd2c@intel.com>
Date: Tue, 8 Oct 2024 18:49:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/ptl: PTL re-uses Xe2 MOCS table
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Haridhar Kalvala <haridhar.kalvala@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-5-matthew.s.atwood@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20241008013509.61233-5-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 6913cfd3-59e4-48c0-827f-08dce79bcaec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDVndnIyYWh6WmdkZUxGOGFEWDlXVGxhOFRCeEE3YVhwOUxDbEk2Q3U1cGVZ?=
 =?utf-8?B?WmFNcm0xVkQ2ZHBuSFNKUEQrZzQxNTdweXZ6cDNGQzQ4ZlZERFFpR1p1UEli?=
 =?utf-8?B?ZnlyWldEZlJldlJPUGtWWGJlQmhDN1lrWWlwR1M4R01GUjdWQ0l5cDFRenhv?=
 =?utf-8?B?TWs0UFFkclRFNXlROTRrcnZtanlrVjJRb01PTzVVY0VlbzhKYTlvbFM2eTRm?=
 =?utf-8?B?eFk5NjNkWDh3NUh2ZFEvcG1neUxpK0RPRDR0bFg4M3VxSTVpUFZvVjVZN1pB?=
 =?utf-8?B?Y0w1dzR5Y2t3VHBYRkNDbzJseTRkWXE5a1ZEMy9EYTlDZ0lnN3NkcHBTb2R0?=
 =?utf-8?B?eGxLV3NDRlZlV0hsdnUzcHJ0Yk1lSzVpeWd3Y1JDREpSOFlueXBNQnZma0Rq?=
 =?utf-8?B?RytjTFVmendGUk5CT1RWVFZUdHl6M25WVXpTY1o2SHc4VFJHOVYwVklGRjdW?=
 =?utf-8?B?eGY1WGlqODlxcTVmUXZoU2doYU0yOUFkSS9LZXpxZnA1RStSVE5NcmdQY2Vl?=
 =?utf-8?B?V215RWh0NTNjdEp2VHFFeVRLYlk2TzI3M2RJakh3Rnc4NE4yQythZzNRaENr?=
 =?utf-8?B?OWsrNmlLd1RnZ2J4RGhiTXR3UjdEVXFycGtJekNta1Q5eFhCVnl0L0xIZnlv?=
 =?utf-8?B?MzlpUUhtWUlRUWJXWWRJMzlSeFJpand0VFFCWlBFUG1CMmxTbEE4dEJCUzRN?=
 =?utf-8?B?OXNobGJiOUNZOEF1bk9jb2daZmdUeC9jSWtxU1h6aVlYQjRWQi8zZHhnR3dD?=
 =?utf-8?B?czVmeEhJcTgwNkRvbXQvVzFxY1JXKzBkUHFvdkFWRnlHT3JaNFZEZXlKMnc3?=
 =?utf-8?B?WmRHSUNMeDlqYmxOd1k5RWh5bnFlMEMrUUNpQjJxOEhxODRLRmo1RDY2REJr?=
 =?utf-8?B?emRMVDZIUVMwbmcySFhuUXo2aG9ZRTJyNFllazlmamZ2QlNCaDc4YWFNK3dI?=
 =?utf-8?B?YzR4d2JXMzkxM2ZmK3hiVFIvV0htd1BhQ25pa0grbDl0UVBLTzg1WWJUcjZP?=
 =?utf-8?B?c2NEekIwaUpoNEF0RThCVlE3aUtEZS9ydnhSVnRxSGhuVm5LMndWMlVPbWVO?=
 =?utf-8?B?YU5LS2UwdmpBL3hyMDNvanFKUHBBdkRtQlFmS1NmREJzMkFFYUQ3MHdWRWpL?=
 =?utf-8?B?SHpmaHg4elJYSDNEeHhVYlNMUE1OcXZkN1dwNGYyTjhlM09jc0JwWDRDRFc4?=
 =?utf-8?B?emx1ZGxlYU5nWEZXL0JJcTUrNktaR3FoSWcyQUtwaVN0ZWhnaWpZWUIrZUJ2?=
 =?utf-8?B?Y2dJWWRLVE1WVEwvNEJSRm5tZlBCMDFpZkZYZXAzbmVMclU5UFpPeDdsd054?=
 =?utf-8?B?MGZZZWhFbVcycVJ5K1ljY0hCVVVIWlhsNGpFQlBJeFZaWGJrMnpidTVQbFhj?=
 =?utf-8?B?VzhWTmp0cDBFWWdQNWowWDFBdGc2Yk5jd2pZakpYZmFwUXlMQTZYY2lRYm5X?=
 =?utf-8?B?ZUlkNjRqZU0wNnh1Uk8wOU9QL001THRSQi81eE00QUtEUTlZSkR3VXVuQTUw?=
 =?utf-8?B?NFpFaWlRTTRGZG81NWQxL2hsK0d3MExOZnJIL2hJY3hIWitHSHhwQVRCV3hi?=
 =?utf-8?B?N1VMdWVxU3FBa1hjL3Ivdzc3cE0zaWVaQnFFMC8yNG55Y2xNb3lVenFYRDIv?=
 =?utf-8?B?RmM0ZDcrQ0VHU2tQS0dFemtJZHlhc1YxNk5EQzhTdTk4VG44STJsV2tka2xi?=
 =?utf-8?B?ZGk1QUM5WXFsWXIvdTZDamZJWnBVcDZhTGFOaDViOVhWNEptWDNyNHdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2pkMUVvUmJxc1JRWDBmUWxCQUxsSVdBL1RsY05TWi9GY1pQY0hDakhZa3lM?=
 =?utf-8?B?d2ovQUVRdkNRU1dDOGVQU2RjRG9MQ1ZHUFBSRjh6aGpDVWl5aFE1bjc4ZkpH?=
 =?utf-8?B?Qi9aTlVZOVVLdlpTeWVoTDd3L1BNNDlmVEZyQ3graEFQN1FWNjdwY2VSRnow?=
 =?utf-8?B?ZkhnMzR4YnEvRHFXc0dwZG5rKzNZdEJpdE1pVFFFa2Ird2JsVEtnYXZ4UENF?=
 =?utf-8?B?c2dqc2NuTDkrdmVGNXRmRFVaNzVtQTY1b2l6YlBIS1dFWlFsc1BrQmVkYks4?=
 =?utf-8?B?bWlnZzhwWFB2Vm5RTXdWWFJGVG8reFdoS0hjbTFsclRPNHRvNE5zRVpvWlpv?=
 =?utf-8?B?S2FkTWs0V0NOWkZZWWNLdDNuMjBPd3RZV1IrZzlzN0l3WE1sbStTVStVaTJU?=
 =?utf-8?B?L3hRdGdMZTZQMTFYclg1UUF2SnkrOGVjbFM5Nk10ZjdNcm44MXFOMmFTaGhG?=
 =?utf-8?B?Szg2NkxQZzV5cklsL2VaNWZmalJxUjFudjNDYm5XeUszcCtjQWxTRWVGektS?=
 =?utf-8?B?c0ZsbDEvTnRGQVRHSVBMMGROTy95RE1JZTRPU3BwZW14MGQ5eHQrQ084RUhW?=
 =?utf-8?B?Q1NhL3AxNG5ZZVNzWExDdGpncXNhdzBjczY4eVBuUFZHN3ozRXhOQUl4blJO?=
 =?utf-8?B?aWY5cUpFZEVUb1BVaEh4bHpubjVOLzRYM3NMNDI4MlkvcnlPdEFyMm55ODV6?=
 =?utf-8?B?ZUlNTjNsekVIUmllZ1FPbThXdEkyblhHRGNZS2xtaytoVTBENWxIRTREaHZR?=
 =?utf-8?B?Sm1xOVRnNndDYUoxbS82eStYRldTamswdXpEZ00xTGtuM0R4WWRpRTEvVDR0?=
 =?utf-8?B?dHdndzliMmkyaEhSRFRBVnRTQUllNCtvYTBiKzEzeFM3eWJUSkxXajZvZUtk?=
 =?utf-8?B?MUFTM3FNdVM1MlhTaUFCZ2VTY2liT3I2YkM4RWw1ZitTWkhidnlueXUrR1VJ?=
 =?utf-8?B?M3MxYzlzZGNsWGIxbkV5WE5HUzZySHZ5bHYrcTluRzVsUUpoYnpEMThDVm81?=
 =?utf-8?B?endLZVBvOVp3dDFwWW9BbHJuNytHdnNOWGY3VjNQWVhVdHYzb2UyMmpRV1pp?=
 =?utf-8?B?TGNQQ2dPcnRMMktlTUYyY1YzK25XUVByOFZvZ1ZiZk1ONUVESjc4cjFNU0Ru?=
 =?utf-8?B?Ky9HenRsQjduUXNKWS85cEJxN0hQSkJkYktyalo1TmxwRGtabzNiNCtNOWox?=
 =?utf-8?B?UWZRVlJOaEpGTTJGQ0V3aHFCRUFrMWdyamlsM2dpQ1ZEYzh4TFhqa1R1NXda?=
 =?utf-8?B?YWZpOU1WWlE1dlY5cmsyc3ZNQTVmRnZ6R3o4QWNmUytuenpNRzdtc0FkaHMw?=
 =?utf-8?B?bnBwRXN4L09nRkJ3bUVNcW1zdTByb2lWYTA2akthb3pBbUN6Si9nNlhHTEJ3?=
 =?utf-8?B?VThEelBJM2QxSFdoZGNpT2V0VUpnZmNiQUlHMzBnZHhGbkNuMFVlRjVaRlB3?=
 =?utf-8?B?V0VRQjJMNVJqOVZvcXB1aFZGMDI4N2pqM3BqVEtJWEF5K1ZKMzY2ZjZZaFZ0?=
 =?utf-8?B?TEk3RzVTdHRldXdZK0Q3WktmbVlwN3lFZkd1QnhZMFhJcTk1c0FRYTczQ1Ja?=
 =?utf-8?B?RnNnd0FYOUUweEhnZWxJZDc2bDY3aExpNExqcjVoSWFzN0NsZFBvSmpMd3R3?=
 =?utf-8?B?Wm5yRlpvVlNaNjhKMjg5K2V6ZW5KOXluaHpBVUNIYk50Qk4vRlBCRHFJQlBr?=
 =?utf-8?B?blF3RllBYW4vUml0MitXUUpUZUU5bG1Ca2lOZWhtL1M4ZmdwWXVoV0sxaGZs?=
 =?utf-8?B?YUkwaVVPejMrYWhhaEloV2xNOTNPY0hac2J3UjA2ZUpTcEN3VyszVFlzWlVj?=
 =?utf-8?B?Qzh4YjR3ZjRPTk9iQUs0WU85NHlZdU1LZkgzTUljdkVUWTIxOWMwTUxyRmhQ?=
 =?utf-8?B?UlM2cUg5R3U4Y2hydFNVcXdsZ3V5cHZUTmtSazRLak9ZQUU0TjByY0oyT2hI?=
 =?utf-8?B?eEZyMjl6RzJ1TnZQRVhiYldLQlZXbGI1MHBTQk14aXExbVlSWEJVTTNHMVJD?=
 =?utf-8?B?c05IdUltTGpRbVZ5RnpEVkIxWS9vS2Nva2VHaTRIVmxlUE1VQVFCd0Z4ZDRp?=
 =?utf-8?B?QXdrOU1ZWFdPL1lWQ25iWXQ5NUxIY2sydWpqRmc5SVZkSFMvS2h4eDk3Z2U4?=
 =?utf-8?B?WlluTGJTTzZpWHdSaS9KaFhHOFFPOVRWZzgwQmlORmFOWHNpQko0NmZmVk0y?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6913cfd3-59e4-48c0-827f-08dce79bcaec
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:19:09.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcXRohpy8biPvIYweg+W3gVRKAbs22sn5+vsvLJGE1wb2hM8DTyaP4tDgyoJlEJOtJQW4AXsUfEMXre5Dv5MIIz7Wj1soa7RInEtHLZLrEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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


On 10/8/2024 7:05, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>
> PTL is Xe3 architecture but there is no difference between LNL and PTL
> in MOCS table.  So, PTL uses the same MOCS table as LNL.
>
> Bpsec: 71582

Also, similar to another review by Matt Roper on Patch 5/6, we can 
remove the empty line here below the BSpec. There appears to be a typo 
as well. But yes, patch itself LGTM. The RB is already present below, 
adding it again

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mocs.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 8df41cd12d51..231d0e86ed83 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>   	memset(info, 0, sizeof(struct xe_mocs_info));
>   
>   	switch (xe->info.platform) {
> +	case XE_PANTHERLAKE:
>   	case XE_LUNARLAKE:
>   	case XE_BATTLEMAGE:
>   		info->ops = &xe2_mocs_ops;

-- 
-shekhar

