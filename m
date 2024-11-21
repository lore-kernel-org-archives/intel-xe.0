Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91618E64006
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 19:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153C410EA4E;
	Thu, 21 Nov 2024 19:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frNLkaNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE7E10EA4E
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732216707; x=1763752707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H7Y9XJMXWpuTb+JqJLU5jf32UqX8ONxmIjpdKTaJ4P4=;
 b=frNLkaNmSXZ8zp2sx8WfEKubQtR5luB1sBWKXXV0XJZUvplawUMwrAQQ
 k29IqT4xQ+CivdrbaPGdxk+R6wm58crto85SDisqYm9U9nbFWwL2+iAp9
 0Ltv3WXgvQftSGa7d4wwqcpFBmsyi9LmEfFnt8hmDj+haIwNOSchibOTz
 Arn9ozyQ6JF1myam3t1xg6XV0alRiaNnmre79suqKGsfhCc28kqcBoC0x
 +gkhY7y2C7E0eiFHADZirMwKX0keV8x0fPowEIV9Gp+4MCVpIlg2ta0hH
 ttkjl6NDUfw/16Zyf5JcjyHpBln/YWV7er+0L5/GrTQmugzKZtBt2bGuw w==;
X-CSE-ConnectionGUID: tkdQPtAMTaWUmSgilxjdaA==
X-CSE-MsgGUID: GvYEFOXwSx6gvFf7Ng/Z6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32207782"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32207782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:18:27 -0800
X-CSE-ConnectionGUID: tWnN+ukWSmSCCGTH9gXQDA==
X-CSE-MsgGUID: HzpeNsK1S2eqdyw0k40Byg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="121222859"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 11:18:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 11:18:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 11:18:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 11:18:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufilrm6d2NipwYMMsZYyMnEcFgVLvr6Oic+Jy8Orsee/TLxZGy2aE3SYI3Tqy7Ns0Vcq0pbXwaWYGCrkr0FrlksckJp2b56pwITb4JrJLdHMoO94rsHBqwAJ+6wPgZLtdwWnqHIvQrC39yiqwWNp7zqh2FW5TDrpXaIAwWX+QDxrAvNwmiChDT5C7WvhbeOoos88HYQLOX6kWn0YMdEjxvzrfvqwGjkTpeeUmJUraDvBixEJ+4f+dpc2W9x6aKrp8PEsNE7ZQizcJisuvyvoQIIG3d0W/8GAKN6V1vxPxRqxcdYHOTo/tTeh68Htl9KyNNPMhMxIMiL2ykKRKxjyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5vVzgBbcGF5HNpHoHA2bqogs+2nbvHbjquhA7CwifA=;
 b=d/dXCoJl7KWw00je9nmIXD6c/XZ+oAgwlCSrLUYDlWVYM3XBgCiEinqubef8TcB/JRer54S6ssxsPm0qBQNhJzb0Tn173hlaraqJaQfPyvoJGMPF3D7qiGzgSLY98udaTw6UrvnEMGJsOm1W8V5wL8pMY1eAbwbKimX/w/Ei+fTCVpd72qoA5dXZXVqQ6SiCV+XNzi9hMuNj95uU643TOalKOMqDqTBaKBMSLekp5ueeMiK3JzP0Ua0pPxjsAb6PMmhV946+MhC4NINRu13eGu4etwWsxsHaq0IMVpZHkt5xxNej/js3GCuOunoipThQu4n+Zpgh94+pvkVNrbc7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 19:18:24 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 19:18:24 +0000
Message-ID: <2c13068a-b18c-4d7e-ac50-11abcdd5ba94@intel.com>
Date: Thu, 21 Nov 2024 11:18:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add lock around devcoredump capture status
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-3-John.C.Harrison@Intel.com>
 <Zz6pPI/q0hfTfZ3/@lstrano-desk.jf.intel.com>
 <4bc83b58-8f52-47da-a8da-96d8ad6cfeb5@intel.com>
 <Zz9s1QINdIZyco1A@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zz9s1QINdIZyco1A@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: 4718ebdb-58e0-4339-82ea-08dd0a61450d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3ErSXk3S0sxNTNUUUpUckVRUHZkekl5R2o1SFB4eHFxK3RudFRKdDcvcE5K?=
 =?utf-8?B?TzE4S3pJc0F3MXR0ZHI4TU84STRiVmdISmVRNW4wVVljMGxFYXZ2R2FINmd4?=
 =?utf-8?B?M0drSTduMXRiTGEzT1J4OUpvR000WjRrT3pXelJPOElSS0E4cXdmTFUyQmJn?=
 =?utf-8?B?bXdpb2dURVNwOHZMV3AzNEtRTXRQa0NtZW43enIzQVoraU5XeGpmc2hhMXI2?=
 =?utf-8?B?a0diMlVubjVTcWU4UHIyb3RBVlcvbE1LT0U3Q1Z0VGh3ejhRTUljOTlCK0FQ?=
 =?utf-8?B?K1BCOFVUazIyVUhPVyt5a2owdk1weW1PcUNjZEdMenJlbUxFTjc0WEhQajlL?=
 =?utf-8?B?TkhoOEJaOVJlbytxdEl3RnZLclJtT1VmbmFHaGxPMVFhcXhkMDhjRm1Hd2xj?=
 =?utf-8?B?TDZsUzIwQWhUZXNmU3ZDU3dCYzc5Y0kvZTF3RWk1RTArc2ErMXpzd2hQVmg5?=
 =?utf-8?B?cWcxdXlhL0N2ZC95SDc2SzE3NStCbjQ0MU5NSEd3NWhycGVSeCtvQ21jWVAw?=
 =?utf-8?B?WmdYZStyNXlya3k2NmlPdG1pQ29FdkVOR2FBSjN1Mm5kTEM3RGZMdStwNTkr?=
 =?utf-8?B?VHJVUHdWVXBOUDh4Q2VDN2RVMjNkNU11ckRIM3hWMmVjWlZicjVqNDdhT2Mv?=
 =?utf-8?B?eCt0KzN6NnFtZU9hNDRjUkVwcjJvTkswRVVOb3c1TjAraEJhWndxcy9rUEdu?=
 =?utf-8?B?bjFrVmR1L0N4cXJ0WitLQzlQRjZvcmlrUGtWN1Z1dzBXWk0vQUNRODVUbXpG?=
 =?utf-8?B?d1Y0R09ua2MxSmZpVG5VRTdhRko5SFBrVHdVTjlhUk16aXZaK0VRc0g4M3Rn?=
 =?utf-8?B?Wi94b3gwd2w3V0p5QyttTnhnU0Y2MU1nQkRmMXRXZHVNMkR2ZHRueVI5TVR3?=
 =?utf-8?B?V2JhMGVOeEJ2S2xiR2ZDQXpEdmxwQk9jV2d5elowMWZRQmtWOUpXd0tEZGQw?=
 =?utf-8?B?b2l6YjdGZXFJTXpCMFpXMUYvSWZiZmNWZmNVa0U0VXRxUEg3OGliT0hqQngw?=
 =?utf-8?B?SU93L1YzanlHN1k0bUJJVnk4alphRnd3S2hxS0hjNHJUOElnVCtwaytEOXRz?=
 =?utf-8?B?TlhHb1hlWlJYajliNm5OZFhsQkVCdFJmSWhySysvSVB4MGJNSzQ0ektmS0pk?=
 =?utf-8?B?SDVHeThGZVoxd0k2c2VqS0E4OGxjOWduNEtEYW5INytOSlE4Q0dQUkhRbXl2?=
 =?utf-8?B?OVdWeC9JTDc1T2wvMlFZTVA4U1BVN013NUtSd2Zib25SNFd2TGZDOWs1Tzh0?=
 =?utf-8?B?akRmMDBOQTBtNk5LYzlBYXFaakVBVDQ5bDMyb0VPK001SnNBNjN5QkpNN09V?=
 =?utf-8?B?dDFETEUrcG04WjdJcFpCUlhRZC9vNFB4OStYa29LMUMyM0MrcjUvZWd6Vmo3?=
 =?utf-8?B?VFg1eWxLYmhFR2Q1TlA0VU5sOWhhODdMa2oyRE1BdWc2QjRoMFUrMmRZa2xr?=
 =?utf-8?B?UVFpWVZpQU5iQ3Z1TDFVWEsyZlVuQTdNQmJBdEVUZjFEV044eFRuMWs0NC92?=
 =?utf-8?B?MXhyNENUS1BaUXc3WWxPN09ONWFnMWZnRU5MK1R5bHI4SEJBUVJjZzZOamZY?=
 =?utf-8?B?K0lUTEgzNk9xdGYwWTd0QWNBTGtSL1RjVGFSaWtmeGdodDhtSmVkaG82T0Vt?=
 =?utf-8?B?WjhDcGpXVkk1bFF5MThHMXZrZFZzVmphTVI4dXpJQXMrK2NQK3hzcFA1THNR?=
 =?utf-8?Q?cRVkB9QuWjffr9BTTHGc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNTZmgxN2tEWVdwSUtxSFFva3BtMW8xRXFTRzJ0M0NoaklDNUpCdU9jajR1?=
 =?utf-8?B?OFNEKzE3RFUvVjRkYUt5NkxYcW9nalV2RHBKV241TUdYS2E2Tlg0U2Q2RDFs?=
 =?utf-8?B?dlBqZldBV3F0aWozSWJjV3o5TGQrS3JsNllCMHBUM1ZjK0xaeW1NLzhyUHdq?=
 =?utf-8?B?YlJMRkFwei9BUFcyaFJFamxMNTdURDloeEJwd0pUMWRmcDRha0lYMVFkZWlL?=
 =?utf-8?B?Nm5QdXY1SmVVYW5KY2hLbkpOSUd4UXNPRXBnaW53cFRpNXpQUFlPN3lqV3NU?=
 =?utf-8?B?c09IcWErelhvK0J0TWtoMy8veDZPZ2NrZ2lDZUlVeC9tNkJoT1d4cDhQWURr?=
 =?utf-8?B?TlJKQ1RVRTBGSFd6REFwSCsyWG14Wk9QeW0rOG9YaE5oVXNEcm1MNE4xNVpt?=
 =?utf-8?B?NHZveUJrNWdmbmRGbEl6d3FWc00wTGxjVFF3QUxxd3RhKzNFd2MxNkZROFAx?=
 =?utf-8?B?MDZLakRGcHpvTTlzQkJxT0hVb1lJMjlrUVRJY3l0WmJ6anJKQkdZTE1BT1gr?=
 =?utf-8?B?UzN5TVhWdTFLUmd0NnVvcWp2aFRqMTJEQzV5azlZeTh2M1liSFcrcWE1cHl3?=
 =?utf-8?B?ejNhZFR0UHBBaWtuVmkvZzJJR2x6MUNEeSt5VmRJYWtlU3JLdWpJUEh0WExJ?=
 =?utf-8?B?NVBKQnRvMCtzbkk5RWxSdEVjZUZaanp4bGN1dUZIZlllMUFmUEtlQ0xxN0tB?=
 =?utf-8?B?eFdOdG1uS2J3T3hGZ2VzbEJ0U3EwZndyM0h3UmlmNW5YTU9zbmlSSHZtbXc0?=
 =?utf-8?B?bUJRRzRYemxJWHR5azU2OTV0REp6ai9lbjFGQ1FUTVFBaVBuOGk4cytxa0Uw?=
 =?utf-8?B?WlFaRHpSYWxhNkUrV3dheUQvWE02MW5hREJnMmZlbnNyUSs5MWhqRGozdUsy?=
 =?utf-8?B?MVViVXB0a08wN1VNV3poMmZnR2x2amkzYThsdHhackxtODM5Y0VDcGJBMVV0?=
 =?utf-8?B?RXVXTUtZUlA4aGdXdGo2bHRCYk5TUitJbXZ4ditGYkdjNVNMZmplTWp5V0Fq?=
 =?utf-8?B?YTBBendZN0pITkYzMEVCZ3ROaUR5UVJsV1BYQjNmN0g2cjVNMVMvWVIybmVt?=
 =?utf-8?B?ZTFYZGl2RzNjOUVybm1MZXZDcklycUZLWldDaEd4dVRKSmU5Q0piTzdtWENY?=
 =?utf-8?B?STNDNGIvaExMTmpOTnNPeEtKeTJna2c0Snd5VjN5Q0pyT25IRERDckRuZEc0?=
 =?utf-8?B?MU1iZi9qWTQwR0JISVl3M0JRMGNPY3ZNVG1ML01aV29BcTdtR1Bjd0hZZ1E4?=
 =?utf-8?B?QlFYWWhoaUM2RWlKY2NjWVRBWEpiWWE3SlpMTUdSTmJjLy9TNm5KVGM5dWJK?=
 =?utf-8?B?SEtraTNNQmdUdWNKNUNjdTFiS29SVmgycThXcXFrZTdXczZ0Q1N5R1k3U3JP?=
 =?utf-8?B?eHBNS1UyTkNlZ2dEZzI5RDRKYVBKM01KVUV0aGgyRXlLZjA4ZU5ydFVwY1Jp?=
 =?utf-8?B?a1NBUkRvdnFrVnBaQVBuZ3BqQlRWb3VRMEg0a1Q4KzVNNFRkSmE5TzFiRUZs?=
 =?utf-8?B?T2R0Q0R0Q2w3bWFuY21ITE9HMHdmczBDVXpwN3BmRG1ZaDZrSi91R2QzL0Jo?=
 =?utf-8?B?VTRMUDhVS0VvTmFjcmVnTUxxaUsvQmZVMDBxa3NCcTU2TXRLUDU2TXVta3VY?=
 =?utf-8?B?S0g5SkRnT0hWRHQ1ZGdsZklLSVllR1pzMmJuN3g5VnJlUTNHVXNyak5qblFs?=
 =?utf-8?B?RGtOd3EvcS9oS0IxUmxpUm9OYzA0enlGNUZXMEF1VmhUUEhOMVRtdSt6R3du?=
 =?utf-8?B?amxsY3RIWjdVZGNXV0pRRUdXdWVnM1FqZHI4VDBYMCthVzhoOTFCOS9XdGZR?=
 =?utf-8?B?cTNwcnJ2RmRMWTBYQ0pFeTBQODZldDNiZEZyMTFJMEpqaVBFcnlSQ21DaGIr?=
 =?utf-8?B?TUdrb0FUbzlFWUFmUVlmaksvY3ZmQ3RCK3Y4VWRvUXd5b1ZWNS80MzBJR2k5?=
 =?utf-8?B?UVVZeEtkV1ptOVRrcDREK25sL1B3UlV4M1NqKzFFZkRveFlYWmhPekk5RzNr?=
 =?utf-8?B?UExRWjZvSHUzU1dZR3Z3RkY1dVlaOFlmYkxpS3VCaUxxL2VYeTN0RUdLTWh2?=
 =?utf-8?B?Und6WUM3Q0JkUDh5UHBzZTF5QjlHRUQyRmdSMUxBYzJBWEdMM1lFQ3hSTWlC?=
 =?utf-8?B?eFBvWFdmM0Z5YVZNbnk0aGVockcvSXcyTlErbitNTFpINDNzTkNNMnV0YUs3?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4718ebdb-58e0-4339-82ea-08dd0a61450d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:18:24.5188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmrIv1BK4hsn/Xiq6v1EH+C3DBNfKQHO+8oK6f3kirS6o2AznOE9bOcBzCIEfTFxmjafE0FPN7vduDuNVSQ1aQKhnaBorG22w7XpBr0rdXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
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

On 11/21/2024 09:24, Matthew Brost wrote:
> On Thu, Nov 21, 2024 at 08:56:19AM -0800, John Harrison wrote:
>> On 11/20/2024 19:30, Matthew Brost wrote:
>>> On Wed, Nov 20, 2024 at 03:22:57PM -0800, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> There are now multiple places that can trigger a coredump. Some of
>>>> which can happen in parallel. There is already a check against
>>>> capturing multiple dumps sequentially, but without locking it doesn't
>>>> guarantee to work against concurrent dumps. And if two dumps do happen
>>>> in parallel, they can end up doing Bad Things such as one call stack
>>>> freeing the data the other call stack is still processing. Which leads
>>>> to a crashed kernel. So add the lock.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_devcoredump.c       | 18 ++++++++++++++----
>>>>    drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
>>>>    2 files changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> index b5aebe8fb06d..05f3c9185ef3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> @@ -235,9 +235,13 @@ static void xe_devcoredump_free(void *data)
>>>>    	/* To prevent stale data on next snapshot, clear everything */
>>>>    	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
>>>> -	coredump->captured = false;
>>>> +
>>>>    	drm_info(&coredump_to_xe(coredump)->drm,
>>>>    		 "Xe device coredump has been deleted.\n");
>>>> +
>>>> +	spin_lock_irq(&coredump->lock);
>>>> +	coredump->captured = false;
>>>> +	spin_unlock_irq(&coredump->lock);
>>> I don't think you need the IRQ version here, or in the other usage. I
>>> don't believe in either case here we are in IRQ contexts, or if we were
>>> one of the cases would use spin_lock (already in an IRQ context) and
>>> the other would use spin_lock_irq (not in an IRQ context but another
>>> case can be). Certainly taking spin_lock_irq in all use cases of a lock
>>> seems unnecessary.
>> Yeah, that was a copy/paste that I was meaning to go back and update as
>> necessary but evidently forgot to.
>>
>>> Is there some follow on patches where this changes?
>> There will be. Still more re-work to be done for the GT targetted capture
>> support.
>>
>>> Adding the lock seems right though and should enable coredumps on
>>> multi-GT or from which are not the GT ordered WQ.
>> Yeah, with the capture on GT reset I was hitting the race and got a very
>> dead kernel a couple of times (because there were parallel captures for the
>> same failure - one via GT reset and one via DRM timeout). Not sure if it is
>> possible to hit with the current job specific captures but I don't see why
>> not. If you had parallel independent hangs on both GTs of a multi-GT system
>> then it seems like it would still go bang. Just much harder to hit.
>>
> Agree this is certainly possible to hit.
>
>>> Maybe also add helpers like...
>>>
>>> void xe_devcoredump_release()
>>> {
>>> 	spin_lock(&coredump->lock);
>>> 	coredump->captured = false;
>>> 	spin_unlock(&coredump->lock);
>>> }
>>>
>>> bool xe_devcoredump_acquire();
>>> {
>>> 	bool acquired;
>>>
>>> 	spin_lock(&coredump->lock);
>>> 	acquired = !coredump->captured;
>>> 	coredump->captured = true;
>>> 	spin_unlock(&coredump->lock);
>>>
>>> 	return acquired;
>>> }
>>>
>>> IMO - this makes this locking semantic a bit more clear.
>> Not convinced. There are exactly one places where each of these functions
>> would be used. And acquire/release doesn't seem like the right terminology
>> to me. Especially when the release is from a totally different call path.
>> The 'acquire' is an internally triggered thing by the driver but the
>> 'release' is in response to a sysfs write from the user. The intent is
>> really just alloc and free but for a singleton entity so there can only ever
>> be one instance at a time.  However, the above code is not the actual
>> alloc/free so calling it that would be wrong.
>>
> This comment is more about having a locking semantic that protects code
> paths rather than data. I think having a helper makes this part more
> palatable.
The intent is that the locking is around the 'captured' state - 
basically to provide atomic get-and-set support. With an atomic 
get-and-set, the code can ensure only one call path attempts the initial 
allocation. And then everything else is supposed to be safe because the 
content never changes after allocation until it is freed. But yeah, 
there is a separate race on free...

>
> However, now that I've written this, maybe it's better to just use a
> single large mutex that is held across xe_devcoredump,
> xe_devcoredump_free, and xe_devcoredump_read. Looking at the code, I'm
> pretty sure that xe_devcoredump_free and xe_devcoredump_read can race,
> with xe_devcoredump_read possibly dereferencing a NULL pointer in
> read.buffer.
Because a user could be reading the capture out via debugfs right when 
the DRM timer expires and expunges the capture asynchrously? Yeah, that 
could be a problem. Or are you seeing another race on top of that?

>   This mutex would also need to be primed with reclaim, so I
> guess it wouldn't be held in flush_work(&ss->work) or
> cancel_work_sync(&coredump->snapshot.work), but everywhere else in the
> aforementioned functions.
Not following about reclaim. Are you meaning because the shrinker might 
want to free the coredump in order to reclaim memory? Does 'primed with 
reclaim' mean it is or is not allowed to be acquired inside the reclaim 
paths?

>
> Do you think that would work? If so, it seems cleaner and would adhere
> to Sima's locking guidelines [1].
As above, I'm not sure what the reclaim connection is or what the 
implication of that are. But having a big-coredump-mutex-lock sounds 
like it should work to resolve both the double allocation issue and the 
free while reading issue. Only concern would be if any of the core dump 
trigger points are in places where a mutex lock is not allowed. I don't 
think they are though. The capture from the dead CT handler is 
potentially in atomic context but the intent is that will skip the top 
level xe->devcoredump stuff and just jump in at the 
xe_devcoredump_snapshot level, i.e. it has it's own private snapshot 
object that is internally allocated, printed and freed. So it would 
bypass the mutex lock (and also bypass the double allocation and free vs 
read problems).

John.

>
> Matt
>
> [1] https://blog.ffwll.ch/2022/07/locking-engineering.html
>
>> The implementation is more about back-off-when-busy than regular mutex
>> locking. It could potentially be done with a kref thing and inc-if-not-zero
>> functionality, but that also seemed more confusion than just having a
>> spinlock around a simple bool.
>>
>> John.
>>
>>>>    }
>>>>    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>>> @@ -310,14 +314,18 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>>>    	struct xe_device *xe = gt_to_xe(q->gt);
>>>>    	struct xe_devcoredump *coredump = &xe->devcoredump;
>>>>    	va_list varg;
>>>> +	bool captured;
>>>> -	if (coredump->captured) {
>>>> +	spin_lock_irq(&coredump->lock);
>>>> +	captured = coredump->captured;
>>>> +	coredump->captured = true;
>>>> +	spin_unlock_irq(&coredump->lock);
>>>> +
>>>> +	if (captured) {
>>> Then here...
>>>
>>> if (!xe_devcoredump_acquire())
>>> 	msg...
>>> 	return;
>>>
>>>>    		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
>>>>    		return;
>>>>    	}
>>>> -	coredump->captured = true;
>>>> -
>>>>    	va_start(varg, fmt);
>>>>    	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
>>>>    	va_end(varg);
>>>> @@ -342,6 +350,8 @@ static void xe_driver_devcoredump_fini(void *arg)
>>>>    int xe_devcoredump_init(struct xe_device *xe)
>>>>    {
>>>> +	spin_lock_init(&xe->devcoredump.lock);
>>>> +
>>>>    	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> index e6234e887102..6b776abd8bf4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> @@ -80,6 +80,8 @@ struct xe_devcoredump_snapshot {
>>>>     * for reading the information.
>>>>     */
>>>>    struct xe_devcoredump {
>>>> +	/** @lock: protects access to 'captured' to prevent concurrent captures */
>>>> +	spinlock_t lock;
>>>>    	/** @captured: The snapshot of the first hang has already been taken. */
>>> Protected by @lock.
>>>
>>> Matt
>>>
>>>>    	bool captured;
>>>>    	/** @snapshot: Snapshot is captured at time of the first crash */
>>>> -- 
>>>> 2.47.0
>>>>

