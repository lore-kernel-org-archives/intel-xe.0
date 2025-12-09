Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540CAD3B7E2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 00:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E2D10E44C;
	Tue,  9 Dec 2025 00:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9IpfVYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3EC10E44C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 00:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765239842; x=1796775842;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JBu5YlO2FMj3HkvTj/BbhX+WDQeNzrw9MdNqrlhbdQU=;
 b=D9IpfVYtsi+D6qmpaqJRMveBFyc1IP/wqdL5DRJ6j0te360iYivhmIXo
 WwxUxSQF+HearIV9iBEqlczjmC4tWCfXGIGgZnvQcZgPoE1Mh3qf913uY
 fE8i+0jtykTmHm1uZOIgSnYr+LfIuSyV2VKlr2ieqcyliYYmEDoZY010o
 1pHRXFoZ7KF5DOl/qXTVdixxz4CSe68d0JmvzpYpyeprzPUeCV5WfgyIe
 6tSOypbWGEzDTq11nayxcu3usOjz5ZNDpL06V2mPJK9zoFppuRR0vqngG
 KSJPwNTxy46oL7vlTX6ggIRAqArBv3/YNT6WwQEn8fkdiUREUACdv7bZg g==;
X-CSE-ConnectionGUID: SHcgXTlqT8yZ7AVZ76wkqA==
X-CSE-MsgGUID: smavbxcSR7ytUnsJcc8vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77810917"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="77810917"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 16:24:02 -0800
X-CSE-ConnectionGUID: LJqVKFC0Tz+tieumE5uKNQ==
X-CSE-MsgGUID: 8pHohSUoSnyIO1hIItYAHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200553589"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 16:24:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 16:24:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 16:24:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 16:24:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHysHAnVf+wZPH76hGSdzKh5NjjuanpWiGfSJEClty/cRmOB5kNYjfeOjyjmOGub6TV64xEZUU5KXuMKmChbIadMDYqs57hu6kVn3X7oa5orW7pUrmsIYPTrWt7EKbCHUghufB6XRB9zVLQsj6X0NBhk2xzR7ewtYNpGBamfveHYdat4HVSrubVknw5DKisbl9ixVGwo+6o4J9pCXC845c5dBSQ1EvIni/GJkQCZwP0UqA6Tpf5rsugOnE28+N/j3ffwK0am4s2ER44Ap0bX67MX05sEtsg4XV1wLC8Aof+EEeZHzBp0VA7npci9n7RDlHY8YHYZ0bnus2BQioJktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAZh/8zA1oMtFBXTudnrGsovr7PLv/UJYR2uzrq/wkU=;
 b=kkA2rNP1SKz9LCug6fIYY5DiNZlvEzbok/wYXXSGf0tqeh+V8YX3/y5zVxkMTd+3+wGxp7PlkkBSc19YU/ghpmuvWE8o55r8X8+/GxWep+U8gYihhcpOjC4eoWbb4+CH8Bq6BfHZgtKXd89SQ55Og731EGrXpdfKZmV6iCJuAgZ31vRWgZ0tgiI6XPP0S9MJpU1KTM+LDnGib5r+xQLRss6t3WSac9Ny0Qm74HAahdcd7dQjv/y4iNTsL105SZCwxjQN5svABxQsRgCKaXynbPwMPH2NDAXUrqdqxTvNiGeJN8AR/p6pzivqNh8mfELDcfQ1IN9z+ixy4hW7Uobc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 00:23:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Tue, 9 Dec 2025
 00:23:52 +0000
Message-ID: <63184abe-d718-4e9d-9600-aa50d300348f@intel.com>
Date: Mon, 8 Dec 2025 16:23:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-20-daniele.ceraolospurio@intel.com>
 <fa7c593a-5147-4a4a-8d12-566b2ebc40d3@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <fa7c593a-5147-4a4a-8d12-566b2ebc40d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f58cd1-0b64-47d1-84e5-08de36b93aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNuU2lsaEZUcjk5OUo2WjcxajlvTCtGVUpoTmtXQkdsaSt4eU95Z1NKUFFB?=
 =?utf-8?B?aFM1SGZrRE15aGFDdExoVkxxTW9tdnNvTGUwcHdBTFZmbjhKa05JQlN2bnRJ?=
 =?utf-8?B?bXo0YktUN1VJcFZjZy91eGdMSGViZzVBSnc0dkhHcFR6YnRvWHdxMXd1ZGtv?=
 =?utf-8?B?cnkxMnBsbnM3SDdtKzgwRTV0Z1N1SmlIaU12eGN1Um1qZ0ZkN3dIR2dNOTFZ?=
 =?utf-8?B?KzlSS3Y1Tk12Zng2RmEwTlordkM0WnEvdjl0VHIzUmkxTElDd3Izemp1T2ww?=
 =?utf-8?B?N1pKSVF5UWoyWFhMd1k3S2p1TEF1TlBQYi9DdjBhQlBMVHFKaW95SmlIaFlI?=
 =?utf-8?B?WERFdStiVUphMnR4UFNxaTFwb0laQi9kWFoyRlYySGZzNFoyMzVrZjdRVFFP?=
 =?utf-8?B?L2VEV1hNUnM5cWVFVjBEN0lnbVNjQUlVc1dVSlRBVmxDMDNCcis1UnhNUXEv?=
 =?utf-8?B?TGduVUFrb0pxc3lBNkdpSXpvb28wMEdYQW5PZXorYlpBYkRFZTVrZFFZeVhX?=
 =?utf-8?B?QzROQTFac0RTYmFwSndsa0VRV2QralNKWmdzUUVkR0FEQlFIaG90TXJqeVJs?=
 =?utf-8?B?WE5XM3NNSDlKQk9oYlZVZnVNNFpPMFY0ZG5uSWZOMFUxRFlvQ3ZZN0Y2bGgw?=
 =?utf-8?B?Q2c0WU9TZmxXbHlwbDVSM1NSdTBCZ2V5MGFVZ0hsNmhZUU8zZk5HOG1TOUor?=
 =?utf-8?B?a3p2a2laSUlMWXJwTzJCeGpzUHdIM0JaZ2czUGNsNnBEb1NQWVc1eHV4SzYz?=
 =?utf-8?B?dktOQTU4N1hING45NDV0V0hXVk9UUFJaZ2llSFV0WWJjRHl2U1dNRDA2eXRY?=
 =?utf-8?B?SUdLZk5leE9yMTFVSmVWUkxvbjViM2NxUjBnRnhBMkI2SG5XQkY3Wm9wc3Uy?=
 =?utf-8?B?L0Y2enVVbkJOZU8rcERyZ2Fkc0NGMi9pY21oU0Ftck1FY3V2R0tpTVowQzRL?=
 =?utf-8?B?V1NOQko3dFFQU28zQTF5eXhnbnN6T1VUZ0ZKdzFGeDNIam9GR05pU1hQdENV?=
 =?utf-8?B?ZHhLd1ZBVXlDNU43NjB6YUtkWHZsRmlwMEhoZVZhNHdhNkNSMG1udi9Kcm1P?=
 =?utf-8?B?ZjhKenk5dFUvOWNEVjN3azVWelVmWXBaTUlSeW5Za0VxcmpEYi92cWw4bXkr?=
 =?utf-8?B?WHdta0o3YjNjNUFlQkZ3b1FyTnVzNklTdDdxeUJPaE9oc0pONU1lMXUrbFlv?=
 =?utf-8?B?b3JraW00SlBINE1ab0EyRCtJRXU3cWtxVHBJTWdHODR1R01xRkk2a01JYktE?=
 =?utf-8?B?c081aUM5emdXOW15OFJveGNLNlh6QTVPZTg3bStOTjl1aWdFakNYLzNRNTZo?=
 =?utf-8?B?cWhRekhRM1J5TXk4Uy9KVGxkU2ZTdkZXL1VQMCt1TlBpWHdsb2kvNGNDdzZM?=
 =?utf-8?B?d0VJRWxmaHA4bnh2UUJSUStMNUhnd2sxU3dJeDRZUUFjNHRRdUpxZThKSlBQ?=
 =?utf-8?B?OHlJK0RVM0pNZHdGUWh0a25sanVGeFAxODlKeTVkK0lJa2VEazJ1SjN0STV3?=
 =?utf-8?B?eldlVTdqQjFtcEY1eHNRVHBTWUNRaDd1dERybTViemlLQWRZT1M2YkZHWFB5?=
 =?utf-8?B?RFM5eDFpSUpaTUdXU1o2QkdzR2MyZzVaTFFzdk50ZFVxZTFGajM2b0xDUy9K?=
 =?utf-8?B?WjROSmN2RmM2QXU2SUUxcERtem1kemtHM25DQmtJNlFUd2dwaDI0U2lBbXBo?=
 =?utf-8?B?V0VIazJwc0lSZytyaFkvL2xzM1NyNVFadW1hTEozNEUxMGJFQXZRTWFaY3V6?=
 =?utf-8?B?OWR5TjY5Yzl3NHNnWXN5NkFxQ0VHMWw0RHd3cUxJV202blA4VjUyYVlGVWpX?=
 =?utf-8?B?a1ZzZUp5R1BUMzV0SFZ2OXdUOXlNTEV6eXFVaEZJK281WHZyUlc5KytaSTU1?=
 =?utf-8?B?MVhyWVZYdnVFMmhTNFFHM3lkcEJ2a0IrTXVOaXlteHk3NTduQ1JWbWlHN2VL?=
 =?utf-8?Q?68Cpsjd5f7zeFqX2v0jeKvCxBeuQqkF9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzRxYzlYY2cxQ0thbG5pQ2RGSEhQR1phWTJteW8zTVFVcnBCb3NSWjRmdVVm?=
 =?utf-8?B?VWhjd2RtVFdQWmpJdmhBUzR3aFE5ZE9Qd2cyUlpzOStFODlzMHgzYWRCeTRL?=
 =?utf-8?B?UXNjcXZmVklMczhWZCtwbVQ5VHlKVVNSYktHdnFlNENxcUZSUnd6MFZqVUZq?=
 =?utf-8?B?NW1tbE9NWW9YQ09RT0pYVzRjMW5iNlBMWmc3Lzcxclc5aGk5eE9HYmVQNFl2?=
 =?utf-8?B?SWo5bkhWMlJ2Ykk2SVdIdHdmcnJlT2NwbVZSV242ekw5ajBPUzdNMEhUWTlm?=
 =?utf-8?B?czlSajA1OFh1VjlyVXZVVVZSZnVtUWJweEUxN01iNDhadWRiRk5Id0cvenov?=
 =?utf-8?B?RXNGT3k4Mjh6UGlUWjBCSnJiOFYzUEVTVWl0Vmc2U3VvUzQxSmp4VDNnMzJO?=
 =?utf-8?B?NWM2cjYwekZzV2xOUUVIdkdBMHI2TE1PMnM0SmlBTEhReTNkMytIcml5c1VM?=
 =?utf-8?B?MWM4S2ZVM3pXanBNWGlSaFIrTW5xL202SWVGeTI2OHhINU9QY0ZDTkZ0RVBq?=
 =?utf-8?B?Vk4vL0hITzZydjdNeWhHK3pPNXB3MUJWR0JrQit2VFhOVGpYUUlzTWJ0ZTZU?=
 =?utf-8?B?SW1IZGl5aXQ0bnU0MzNWajNlSGp1anFhTzBRWG1EV2ZXc1BDWklnK2FyNkdp?=
 =?utf-8?B?Q2FybTNrbG16ZVgxeE42OFRsNUNzT1RDUVREeXpWSHBoSDBCN0tpREJtOEZk?=
 =?utf-8?B?M0g0YXFkdHBWNE5vMFlyOTJJN3JwVE4rMDRXb3FTcUJsOGkrZnEvR1Z6bkNv?=
 =?utf-8?B?T3Vxd2ZFNjRVeHZzMnI4NTZQT3RBR2ZCb2x4NnpONTRMNm11MVNjV0J1ZTN3?=
 =?utf-8?B?WWF4Q2FNT3pGOWVsUkpzTFVqMGc1ejBGekQvd0lZWGNESXVHcUhxUkxveWg2?=
 =?utf-8?B?Qk1hU2NPa1IvNVBGL0dFWlVJSHdUYlpxUmRWOWRZTDRtZUllQ0FlTk4vOWxu?=
 =?utf-8?B?L2hNK2Z6ZHV0QUtqeHVxYmttdTNIc0thZVh3M1FOeWZjOEZMRXJvckVFblJ1?=
 =?utf-8?B?VElOdGRxK3dnNzlrMFpWQWpxaDhXODZVRnpKNDRUMFBWaDlTSzdXWjAwWmR4?=
 =?utf-8?B?cDArWnQwTVVSSGVYRWc1blE1b2ErajkzdkJTa2ZXeGMwMkt0RmdvOGFXZWtE?=
 =?utf-8?B?QWdkNC9QQjN2K0JKTmoxVlYxQ3RONFZaOFVFTXVkYi9VUTgwSXVRRVlFNndD?=
 =?utf-8?B?MHZ2c1ZpQ2JwY1h4UXkyajFVaTdDeDJMMGFXUnhYb1dTS3RJZHBiZVVEWFJ6?=
 =?utf-8?B?b09lSTA5M21QR1VTVDI5SDFXQlkxZ0hzNVJrR25hUWM4RlM1c1BWdUcvbHR2?=
 =?utf-8?B?L2NWZEpMQUVCeFQ2NjhwT1lvVlp0MEkrRjhvbS9WUkZ1Z3lYMzRjQ05lcWtv?=
 =?utf-8?B?Tjd2WmVHbjJBYzJoSWVzeEU1TU9DR3BLVkpGUzJBMVJqcTNFaEdIMGI3M29j?=
 =?utf-8?B?UUxWdFlHWTZlUFZGY0V3T1VFUmRvY3JvN2FIV0RQOU91U2FEL0ZrbkUwMHEw?=
 =?utf-8?B?N2Vpa0hJSklkK05QWXQzNDk1VndxZE83ZnYzUUhOVUs2dTcwTnZVU3FxMW1h?=
 =?utf-8?B?bkdrMXJ0RVJSK1hob3NWa2h0WTFhM29yZ1JxVG5ORlU0STE2c0Z6ZVV1Zlkx?=
 =?utf-8?B?MVMzWTV4WTBEYzBkaEUxcjVPSjdjakx0bmI2Q0RmZGFhOTV2RzdvQkpFTEcz?=
 =?utf-8?B?WDhFR1NYTXJPb1oxemszSkNtNDFvR1JZNGxPTDlzUm5qMlh3NjFtS1EycVdw?=
 =?utf-8?B?VGI4QjZrNFQvTy9yeTExZ2ZWdS9hdHlEQ3ozUCtka0gwanVoaFB0MGlYWWRM?=
 =?utf-8?B?aDdCdTlHbmpaRi81VEYxbFN1L3pZc21Hd1h2b3ZSNE9tSzhHblM3WjBUcGdx?=
 =?utf-8?B?OTJLUi8yeHVjazNzR2lWMXRIeTJmZGZ2V09xY3dTSVUyWmVrYTFIeHBmSXNs?=
 =?utf-8?B?Wld2ZVArSm9SNWtNQ3ZmZmt3Z0tEdE93QUpyUXBlQVE0enp2NmRlc2p0MlRJ?=
 =?utf-8?B?SUZudW5WajlEQVE4Ym4zM0hPSjVaMXkvSUppVmFiNmIxenRpTEN5V3d3YjN5?=
 =?utf-8?B?Yi9UaUIrTzJaYTFQSnJlL0RYamdHZTRzTGtqbzRodlc5NzZCOUFzVDV6OGZZ?=
 =?utf-8?B?NlQrU2E3VG40U1hORC9POEc3clRpUVBJY05lYVlCcjI5U2ZLR0lRZXZXNmw1?=
 =?utf-8?Q?D8+2CPNOyRJof4AEaF//DKM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f58cd1-0b64-47d1-84e5-08de36b93aeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 00:23:51.9763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNQQQXE0NfXbO7mbuHRRZ5o/dR9Rgtd4W53uRx64KonAyiIp5pO8S/LC9NlMfjbz170NLlBKKSof9/iRj4viQVXq9hf8SEM6OL/o3giTIfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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



On 12/8/2025 4:08 PM, Michal Wajdeczko wrote:
>
> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>> Under a new subfolder, an entry is created for each group to list the
>> engines assigned to them. We create enough entries for each possible
>> group, with the disabled groups just returning an empty list.
>>
>> v2: drop subfolders, always register debugfs for all groups (Michal)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 70 +++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 1be23809e624..15f5f3a40471 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -163,6 +163,10 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>    *          :   ├── tile0
>>    *              :   ├── gt0
>>    *                  :   ├── sched_groups_mode
>> + *                      ├── sched_groups
>> + *                      :   ├── group0
>> + *                          :
>> + *                          └── groupN
>>    */
>>   
>>   static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>> @@ -260,8 +264,60 @@ static const struct file_operations sched_groups_fops = {
>>   	.release = single_release,
>>   };
>>   
>> +static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
>> +					size_t count, loff_t *ppos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct xe_gt *gt = extract_gt(dent->d_parent);
>> +	struct xe_gt_sriov_scheduler_groups *groups = &gt->sriov.pf.policy.guc.sched_groups;
>> +	u32 num_masks = groups->modes[groups->current_mode].num_masks;
>> +	u32 *masks = groups->modes[groups->current_mode].masks;
>> +	unsigned int group = GUC_MAX_SCHED_GROUPS;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	char engines[128];
>> +	int ret;
>> +
>> +	ret = sscanf(dent->d_name.name, "group%u", &group);
> see below
>
>> +	xe_gt_assert(gt, ret == 1 && group < GUC_MAX_SCHED_GROUPS);
>> +
>> +	engines[0] = '\0';
>> +
>> +	/* If there are no masks it means that all the engines are in group 0 */
>> +	if (num_masks >= (group + 1) * GUC_MAX_ENGINE_CLASSES) {
>> +		for_each_hw_engine(hwe, gt, id) {
>> +			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +			u32 mask = masks[group * GUC_MAX_ENGINE_CLASSES + guc_class];
>> +
>> +			if (mask & BIT(hwe->logical_instance)) {
>> +				strlcat(engines, hwe->name, sizeof(engines));
>> +				strlcat(engines, " ", sizeof(engines));
>> +			}
>> +		}
>> +		strlcat(engines, "\n", sizeof(engines));
>> +	} else if (group == 0) {
>> +		for_each_hw_engine(hwe, gt, id) {
>> +			strlcat(engines, hwe->name, sizeof(engines));
>> +			strlcat(engines, " ", sizeof(engines));
>> +		}
>> +		strlcat(engines, "\n", sizeof(engines));
>> +	}
>> +
>> +	return simple_read_from_buffer(buf, count, ppos, engines, strlen(engines));
>> +}
>> +
>> +static const struct file_operations sched_group_engines_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = simple_open,
>> +	.read = sched_group_engines_read,
>> +	.llseek = default_llseek,
>> +};
>> +
>>   static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>>   {
>> +	struct dentry *groups;
>> +	u8 g;
> no cryptic names, please ;)
>
>> +
>>   	xe_gt_assert(gt, gt == extract_gt(parent));
>>   	xe_gt_assert(gt, PFID == extract_vfid(parent));
>>   
>> @@ -274,11 +330,25 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>>   	 * We should rework the flow so that debugfs is registered after the
>>   	 * policy init, so that we check if there are valid groups before
>>   	 * adding the debugfs files.
>> +	 * Similarly, instead of using GUC_MAX_SCHED_GROUPS we could use
>> +	 * gt->sriov.pf.policy.guc.sched_groups.max_number_of_groups.
>>   	 */
>>   	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>>   		return;
>>   
>>   	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
>> +
>> +	groups = debugfs_create_dir("sched_groups", parent);
>> +	if (IS_ERR(groups))
>> +		return;
>> +	groups->d_inode->i_private = gt;
> no need to store gt here, you can grab it from
>
> 	parent->d_parent
> or
> 	parent->d_parent->d_parent
>
>> +
>> +	for (g = 0; g < GUC_MAX_SCHED_GROUPS; g++) {
>> +		char name[10];
>> +
>> +		snprintf(name, sizeof(name), "group%u", g);
>> +		debugfs_create_file(name, 0644, groups, parent, &sched_group_engines_fops);
> why storing 'parent' as private data?
>
> better store group index there so you will not need to sscanf it back
>
> and parent can always be retrieved from the dentry

The issue with storing the index was that it'd require allocating an 
array for it, and I wanted to avoid a new allocation just for that when 
it is very easy to just read it back via scanf.
Since I had nothing to store that and we're storing the parent in other 
cases, I just did the same here.

Daniele

>
>> +	}
>>   }
>>   
>>   /*

