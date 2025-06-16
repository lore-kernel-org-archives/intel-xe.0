Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DE9C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705AA10E2CF;
	Mon, 16 Jun 2025 07:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJWdVYLQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B16F10E2CF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750060502; x=1781596502;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JOOlYg6u4oINKgmtFkNZW+ShsuUYYq3HvoFO3uOizuY=;
 b=UJWdVYLQRXOgnIYKfDbUF3SWpPa5p05eWrRjOvDImGfZjkhDKa5cCANP
 nXbfitcTJ2P17nmuspzzm3eYZWJZOeuzD10G/7fvKMgxrpogU2feNYliQ
 ovv0iyhQ8uunZLuP4QG+0EpzvD4ekZBJYwNnrkYgLVngU2mUd1I78L3mw
 uZjG2/IkFt+p3k0YxuVv/jWBI/CLaDbjgfstTgLsNhon97tSkdVWMEHd3
 cO0QqQjQ+emOym2vkTwBAzoEQM2lRAYaLTsMR0CIF7x923muw9f2JbxFd
 MTo0oj1YDbkx1D/Kd5MIP/2WnppdZuTPnf+swe96wwtssDE0NybU8bpCz w==;
X-CSE-ConnectionGUID: L/zRaH7LRsG7HwK50KpK2g==
X-CSE-MsgGUID: RaM2P2/yTmuVpV+fI19N2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77590994"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="77590994"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:54:57 -0700
X-CSE-ConnectionGUID: 5pLRujsyTleKFA8om/MwhA==
X-CSE-MsgGUID: q7ArpGYBR/mQni43GV++FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148945591"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:54:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:54:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 00:54:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ku6uInY3BdpGjb47xzz6cCoZn540nc88WaWqunl2U3l2tvH2JLDFeJK8d0crqRHILi5TlqV36rzasAv5olWtjKeqtfzz6Dk331Pd4Pd0sr5w6WFTVQSEzpl57ez9lphFEZsYFMTCkFM4gv8GMWe/T741po12DP8qBP2vN/XqirluttAW4rOvRrK3SZntQdp8EHRynJsy7nCKMQAWSMJFyviRazxYfj/vAH6pvAxAOWPIw8EMwGqasCwaW6OJ+eEXtD1+FmzOCpr4tL3oA+/yKZMVrehPgxxQar22iAPbnJWGHIGuJqax+ApAC87NIA9P3gnMJLdNFxEH2HSfVoRCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP9q1Ek/QTXAVfZmapIHumOSwFYgzm5J2581oJuj+GQ=;
 b=wmuX45AvE9urzjJ7cUmr6sUe7OaJ6lbUIADlfgmcl/reR234FgT6A/BNivhhuznbYs+NnSIi5rdg2Rl9YNSnmSHWau0QbC0nxqo2D1VzHcQBkm6WQVcmMaNjxgsmjohumtWQpmvhyANeI8roCWt+/PCteH9oLyXWJbJoseRBDdAPPo5fx66vl2WfJ6LlOc+yhjCHDZWrTiDg+LlG49CAVBkemmybU2D4YeSY0w778a4J4E4Ng2wp/OBplZ1sP0N1loA2j39DN6KVy7k9MxWCK2cImE2m9C/xaUQziMmvJgNXSqPesMGN9Xgyaz50GEaNA98k7eJeKSYNi4TyZ3+mEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8347.namprd11.prod.outlook.com (2603:10b6:a03:544::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:54:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:54:53 +0000
Date: Mon, 16 Jun 2025 00:56:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aE/OLjpW/pwyV+DM@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
 <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
 <eb5531f03ee560a593f77f60ae1f6f862eea6a14.camel@linux.intel.com>
 <aExQEKec1H7yqS1I@lstrano-desk.jf.intel.com>
 <aEyDw0ZQ5R/ohrO3@lstrano-desk.jf.intel.com>
 <2f5a1a129ae6dff415d7160a1bed9e28786147e2.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f5a1a129ae6dff415d7160a1bed9e28786147e2.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:303:b5::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a0ba69-accb-45e1-302d-08ddacab144f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlRSZW1GSDVDQ3luRUVEeTVxZDYxck5PVmR3SUtwbm9PNE94dFhnay9qU1ln?=
 =?utf-8?B?VDR0MFlqMGIvUkp1Y3Z3UStlNjJ6eXFCbyswYzBsRmpGZGt0UDBTTG9QY2k0?=
 =?utf-8?B?UVpkU2h5RlpHOXdZNVgwMmhJYzFDZkRUdGFjSURXMVhOR2YwaDRlODVPYm5v?=
 =?utf-8?B?Q2QvRityTnVkWDA1emdDWmtzemdrbmc1VURmSndpV1dTRVdxdWt6Tm5jZis3?=
 =?utf-8?B?aG5mQTd2Q2pMaklUMHZycW10a05YN3ViQzJsbTNXcTcrQ1hZTzJiSy9DQkVM?=
 =?utf-8?B?cklEWDdFTnI1OUpTRms2SnBOaEhTZmVtS2RtWk53S2dBN3ZieElQUzI1SFBq?=
 =?utf-8?B?eGZtOTdmOE9SY2libitHdE1IOFJTbzJ6NWVPeUlXNkFRTzF4M2MyRDg2K0lz?=
 =?utf-8?B?T3ZXQlptUHZRS2xXK3Q0ZVZhbXlUU0gvamJMUkV6cUNnbzdYcnordmVZU3Bz?=
 =?utf-8?B?QW1DWkZXSEttcmRMMSt6Snl4U1pwUkU4b3JKV2EwZEF6Szh2SExCNHZFR1NL?=
 =?utf-8?B?ajlkVURXY290ZlVrN3lGOWdxbUFBeHhuVzI0Wi9XVVhjSGRkdnphYnpuL3dM?=
 =?utf-8?B?NGtlUWNmTERmWllodFJQUGJGNkpuYTRySWlmMVVzUTZjUEhDT0xaMTEzVXRp?=
 =?utf-8?B?YlB3enkrWmFWUlowV0xnUnN3UUFZdDFBL01vZ0NwRnZRSHJ2M2F4Ni93dWZr?=
 =?utf-8?B?NkV6bGcxWldOWjlzOG0xMUF6cElPZlpNdTNmaVVMU3dJUlZTUTIyRGZ3Ri9u?=
 =?utf-8?B?OW5sNWJlaVdEZGhVbmJVb2ZwMWtOaXN3cVRYaXExbjNvdHhFdTlTby9pb25L?=
 =?utf-8?B?NEFWRFZ2aGFGZTFxWUlCZzJ4aklWQkxDaXpha0hweW9DVEpDV1R3VGdicUdk?=
 =?utf-8?B?VHluZlBmRUp5WkxIZUVTMktQbks0LzRBWkF3WHI3d1d6dDlPTTNiUDg1ZUcw?=
 =?utf-8?B?Z1pjTzZoZTBWRnZESXlFOXNKR1c4QkJmVEZ1ZkcxRmZpa0llM1FBUGhwM3lX?=
 =?utf-8?B?TXFZRy9MZWdtMGYzMWZiTHd4Z0M3NU5TM2RRYnZBRzltQ01rUGUxQlJ1MlYz?=
 =?utf-8?B?ODVyQ0l4cWZ0VFdxZTNNVnFxQllVS09NVnNkZWhhK0dudm5PaFhiei9uUTF1?=
 =?utf-8?B?YWtmY2NnbE42eGFvT2tUVXhheVJ1eWt6VnhPQmJuME5GNHgvK0x2Vjh6dkJv?=
 =?utf-8?B?Q3pYTHJqUmVqOEYxekwwRmgwdFV4OWIxc2NNeHMvc1RUcTRDQ2JNYXBIZG5G?=
 =?utf-8?B?cEduRnpOemliK1B6K0t0TE9KaDFmYWZ1V01MVkZOU3ZiOW5hTWtFNHZqem9E?=
 =?utf-8?B?VGdKdTczc0JwbndNZXdTZjNuazI3NkNUQmJqc2xrQ3gvL05VWDhaS2cvRktr?=
 =?utf-8?B?eW5aL0MxQit0eGp4ZGt5U3UrdzFBRG9kSE9XbDVxemZuSzNSYWhBZ3BNMGZM?=
 =?utf-8?B?cmtzRjV6d1ozVE1PTVh5SkFzSXZSd0VQTXl1U0tYRFhmMEVTQlJiVzNZNHA5?=
 =?utf-8?B?NkRRSnpyblRxL2FVVWIvMDU0RmtsREFIMEJzL2pFM2NONUZzUElYUWVGVG5l?=
 =?utf-8?B?ZCtUV2ZrRzhBSFVEc0xoalhmVytIUG9YZnpTZkt6ZDl2R01sZDNYVVNVRnpu?=
 =?utf-8?B?SDh1UExEcEhCbkZ1bWw5K3pqNEV5bkRnUm8yQTBFSk5NbjBXRUlTMnZZRkNG?=
 =?utf-8?B?Tk1VdzBadFlvQXcvd01lQVR3czhpZ1Z3QzNzL0hjWTlMWDBnM1FPV1lpTWdi?=
 =?utf-8?B?VnpEZlJsNGRVY3J3UkVFMllaMDFZSkl3TVNOeEora3Znc2JLK0hHN2tWR1ND?=
 =?utf-8?B?UUpqYk12cmJhWERMSU1QWmJBYjFsRmFkK2RIVmpQLzlzQ2ZBYVQ1ak9zYW1Y?=
 =?utf-8?B?cWJKZEs0dDNYRmo3UGpHVUF6ZnpyWlZsOWUzSG92ZmNoR1RqNjdna1pKdnJn?=
 =?utf-8?Q?Fz64pemmJM4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anM5Vm8xbXNmWkxVbDBRdHpDSGlUWFBKY2ZwQnJoTHFaeVF3VGNlRU1kWHFF?=
 =?utf-8?B?VjZZWHdtMzBrdHZGNy93KytKM3l2cTZIU282R0dhT05XaUdvQnRiTENSdXh2?=
 =?utf-8?B?aVo2b2N5d1pNZXI3dlIySGJBMVlReWtYL2JMWjVNSm5VV2ozRU0vOWVYYWQ4?=
 =?utf-8?B?b0xiOTFLcVFoZU96U1lmellZVis4SEpHcnpUQ1RTRHFwU0tDR3N6VXFBTTlZ?=
 =?utf-8?B?K3g3NUtDajc3d2RPRjZRMkpqVkwvNjNaTVlnY214bVlpa01UZ1l0c0pNL0d3?=
 =?utf-8?B?MklyTGxLcm9ValExQTJGL2pCajFzdnZISGd4NEJLMXNYb1M5RmV5Rmd4Qjli?=
 =?utf-8?B?MTR0bXpjcGJIYVI3WVJJSHhwNE1kSzExNDAvYVJCVFA3dWZGQzBzUS9lOCtS?=
 =?utf-8?B?ZmdmL3hLbXRzYUlKblhKdzVqWFJJVG8xeXVaVERWbUh4cjh2ZDlHb2JhaDY3?=
 =?utf-8?B?UUx6Mk5BYWJTcEZnVmhJOW5GcWRzQk95dGwrQmNkQVRVbjIvUGZOSDF5aTFC?=
 =?utf-8?B?eVJWUWFiR080L1NGdkZoZllFbi90SzFJRHh4cU4vZnNic0tvT0Y3cUNBbFVO?=
 =?utf-8?B?eXlsd0hkNVM1eXhIR0w3L3djSG9idkNJakdWenlBbHRVMTl2eEFkSGV6enEr?=
 =?utf-8?B?a2d2QkIyWHpqRHBrdEIrMmlFdzFPVmZldWFEY0F3WVRSYzltd21sWXBzTVRY?=
 =?utf-8?B?V1U1UlpXZjU0MVcvcmtKR0E5RGNCMlBNb3lGRElGbm0wOFg3SlcySS85Umhs?=
 =?utf-8?B?b3hSWHE2elkwL1BkN1RqZ2dZY1I4Mzh2WWR2RUlmMm1yR3oyWGdQR0MxYzNn?=
 =?utf-8?B?L1NKZ3QwUEJ2UEVubkVzZm80ajlHNlFwaW0xWldQQ3BFNG5CeGd1OHl2Mk4y?=
 =?utf-8?B?VVJIdjk4ekF2bXZBZzdvZHRweDFOYWUzZWdsa0hUeWRzY2VOVWg1ZllGU0tI?=
 =?utf-8?B?dEtISFhxNkpFcFlmbm0xQ0x1SW9UaWdHeVZhaEZWV1lqY0xVUnp3eVBLbE1Y?=
 =?utf-8?B?aXdUT0dEVEdleFc0blNxTG1BeVBhSC9vZ1U4ZmRRK2dnNTNvWVRhYXhubHFF?=
 =?utf-8?B?OCtONWZza0dsTklxSTJ2YzhLcWt6ZjV6MXQ3eUFvazMrWk1NaXY0ZDlLTG9y?=
 =?utf-8?B?WFUvb25uTUwvQ1lzdWFLL3FrM0p6U2lkZ3FMRDZ1S0xHMndudGs0V2NLK1Ru?=
 =?utf-8?B?cFpZZ1NUVEFrOHBnM1hjcGF0eUxBVE5UNGVIbEFvTDJsZ1doRlpZeUx0dUZ1?=
 =?utf-8?B?YlJhd0JIK2dDeGZVT25BQ0lZMDIyVFMyZXJlS3RSVGxMY3B5Q2RoS3BjMjA0?=
 =?utf-8?B?eDk2aEhtQmlSN01VR0UyL2R2R0ZtbHBUdHZSWnNjUm5zTHp2aTRPWnord3dP?=
 =?utf-8?B?MjhzRVhHSTA3ZktNdE1LdU9ZdTI0L3djcHRKK0dtbHlySS9YanlXUEtPY0J4?=
 =?utf-8?B?NzdzZTdRUS9pWnJ3UzZsSDNoOVhCYitUQy9ZekRLa2ZvT1lOb0lxb1hwNUJG?=
 =?utf-8?B?R0JNYlcwcFRmcVRYcTBNV2NIQkFQaS9QYUJiYmJVMmVPajdZVXJkdURWMlF4?=
 =?utf-8?B?VmtLOFZtYUloZWFLYVNITmMzc2hkOVdvRnJpZi9ZM01XZURvcWZoVUtpVk83?=
 =?utf-8?B?YXhMT0dYZ0JkNU1sT3dQdlNBQWNaa2hhTnVqS0IrWmlKM3BmZXhQUzhWOWVm?=
 =?utf-8?B?N2piZXN2eTRobDdGbFV2S2R0RjF0MWlaWFRxZVNGaXNYMlp5UlM1Z21NTk04?=
 =?utf-8?B?SHZ2UDV4VW00bkZFYk52L2FjenpMcGMrWmtGOFJaeUVSTm9acENLSVFxQWRN?=
 =?utf-8?B?bVd5Rks4TXl5bWhNK1BZODhsQ0taWWNQL0JhaXdWUFU3d3JaeWpSRFVzTUxQ?=
 =?utf-8?B?T05XRzF6eFJlbkNtZ09xT0VKZ2ZiNVVsSGIwQzhHN3ZXNERwTDBKMldacTd4?=
 =?utf-8?B?THljVnFGUWJ4UHRLaEpGZUtSdVNucGhleFJZeDBFbFJjRUpwY3BBUFVrQTFV?=
 =?utf-8?B?dWdSQXo0WHRxdXN4dDVGeTFaMkVpaWRSU29oaGJZTVduTUpKd0hpZmtZbU1u?=
 =?utf-8?B?ZXFDaTI1MkJidjJLTm1PMVIrWDJsUHFaQlhFVy9acXRuTGpaZkIxWWoyZmZD?=
 =?utf-8?B?Q0taaGZ2MmQxenpUbmhSZ0hhRWhURlpYYXZpNFpJRWdibDlPYTQwUjZ0RnA0?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a0ba69-accb-45e1-302d-08ddacab144f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:54:53.7960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTldjGV6ce2efbu9OTPMi5DgAmKTzUvPHyfbH3fAoumOx17pTPM2HzC2zF1gjNEPtM+/pf9ndAzodPcgRZ4Qyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
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

On Mon, Jun 16, 2025 at 09:40:05AM +0200, Thomas Hellström wrote:
> On Fri, 2025-06-13 at 13:02 -0700, Matthew Brost wrote:
> > On Fri, Jun 13, 2025 at 09:21:36AM -0700, Matthew Brost wrote:
> > > On Fri, Jun 13, 2025 at 10:07:17AM +0200, Thomas Hellström wrote:
> > > > On Thu, 2025-06-12 at 10:11 -0700, Matthew Brost wrote:
> > > > > On Thu, Jun 12, 2025 at 02:53:16PM +0200, Thomas Hellström
> > > > > wrote:
> > > > > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > > > > Clearing on free should hide latency of BO clears on new
> > > > > > > user BO
> > > > > > > allocations.
> > > > > > > 
> > > > > > > Implemented via calling xe_migrate_clear in release notify
> > > > > > > and
> > > > > > > updating
> > > > > > > iterator in xe_migrate_clear to skip cleared buddy blocks.
> > > > > > > Only
> > > > > > > user
> > > > > > > BOs
> > > > > > > cleared in release notify as kernel BOs could still be in
> > > > > > > use
> > > > > > > (e.g.,
> > > > > > > PT
> > > > > > > BOs need to wait for dma-resv to be idle).
> > > > > > 
> > > > > > Wouldn't it be fully possible for a user to do (deep
> > > > > > pipelining 3d
> > > > > > case)
> > > > > > 
> > > > > > create_bo();
> > > > > > map_write_unmap_bo();
> > > > > > bind_bo();
> > > > > > submit_job_touching_bo();
> > > > > > unbind_bo();
> > > > > > free_bo();
> > > > > > 
> > > > > > Where the free_bo and release_notify() is called long before
> > > > > > the
> > > > > > job we
> > > > > > submitted even started?
> > > > > > 
> > > > > > So that would mean the clear needs to await any previous
> > > > > > fences,
> > > > > > and
> > > > > > that dependency addition seems to have been removed from
> > > > > > xe_migrate_clear.
> > > > > > 
> > > > > 
> > > > > I think we are actually ok here. xe_vma_destroy is called on
> > > > > unbind
> > > > > with
> > > > > the out fence from the bind IOCTL, so we don't get to
> > > > > xe_vma_destroy_late until that fence signals, and
> > > > > xe_vma_destroy_late
> > > > > (possibly) does the final BO put. Whether this follow makes
> > > > > sense is
> > > > > a
> > > > > bit questable - this was very early code I wrote in Xe and if I
> > > > > rewrote
> > > > > today I suspect it would look different.
> > > > 
> > > > Hmm, yeah you're right. So the unbind kernel fence should indeed
> > > > be
> > > > last fence we need to wait for here.
> > > > 
> > > 
> > > It should actually be signaled too. I think we could avoid any dma-
> > > resv
> > > wait in this case. Kernel operations are typically (maybe always)
> > > on the
> > > migration queue, though, so we’d be waiting on those operations via
> > > queue ordering anyway.
> 
> Hm. We should not be keeping the vma and xe_bo around until the unbind
> fence has signaled? We did not always do that except for userptr where
> we needed a mechanism to keep the dma-mappings? So if we mistakenly
> introduced something that needs to keep them around, the above would
> only make that harder to fix? It sounds like this completely bypasses
> the TTM delayed delete mechanism?
> 

See xe_vma_destroy — if there’s an unsignaled fence attached to the VMA,
we delay the destroy.

Yeah, like I said, this code is very questionable at best and was
written early in my Xe days, before I understood TTM a bit better.

> If the remaining operations are maybe always from the migration queue,
> they will be skipped for the clearing operation by the scheduler
> anyway, right?
> 
> I think the safest and looking forward least error prone thing to do
> here is to wait for all fences, since if we can restore the original
> behaviour of dropping the bo reference at unbind time rather than
> unbind fence signal time, the bo will be immediately individualized an
> no new unnecessary fences can be added.
> 

I think this needs to be a tandem change then — we drop the VMA/BO
delayed destroy and wait on the bookkeeping here. Sound reasonable?

> > > 
> > > > > 
> > > > > We could make this 'safer' by waiting on
> > > > > DMA_RESV_USAGE_BOOKKEEP in
> > > > > xe_migrate_clear for calls from release notify but for private
> > > > > to VM
> > > > > BO's we'd risk the clear getting stuck behind newly submitted
> > > > > (i.e.,
> > > > > submitted after the unbind) exec IOCTLs or binds.
> > > > 
> > > > Yeah, although at this point the individualization has already
> > > > taken
> > > > place, so at least there should be no starving, since the only
> > > > unnecessary waits would be for execs submitted between the unbind
> > > > and
> > > > the individualization. So doable but leave it up to you.
> > > > 
> > > 
> > > The individualization is done by the final put-likely assuming the
> > > BO is
> > > closed and unmapped in user space—in the worker mentioned above. If
> > > an
> > > exec or bind IOCTL is issued in the interim, we’d be waiting on
> > > those.
> > > 
> > > > > > Another side-effect I think this will have is that bos that
> > > > > > are
> > > > > > deleted
> > > > > > are not subject to asynchronous evicton. I think if this bo
> > > > > > is hit
> > > > > > during lru walk and clearing, TTM will just sync wait for it
> > > > > > to
> > > > > > become
> > > > > > idle and then free the memory. I think the reason that could
> > > > > > not be
> > > > > > fixed in TTM is that TTM needs for all resource manager
> > > > > > fences to
> > > > > > be
> > > > > > ordered, but if a check for ordered fences which I think
> > > > > > requires
> > > > > > here
> > > > > > that the eviction exec_queue is the same as the clearing one,
> > > > > > that
> > > > > > could be fixed in TTM.
> > > > > > 
> > > > > 
> > > > > I think async eviction is still controlled by no_wait_gpu,
> > > > > right? See
> > > > > ttm_bo_wait_ctx, if a deleted BO is found and no_wait_gpu is
> > > > > clear
> > > > > the
> > > > > eviction process moves on, right? So the exec IOCTL can still
> > > > > be
> > > > > pipelined albeit not with deleted BOs that have pending clears.
> > > > > We
> > > > > also
> > > > > clear no_wait_gpu in Xe FWIW.
> > > > 
> > > > Yes this is a rather complex problem further complicated by the
> > > > fact
> > > > that since we can in wait for fences under dma_resv locks, for a
> > > > true
> > > > no_wait_gpu exec to succeed, we're only allowed to do
> > > > dma_resv_trylock.
> > > > 
> > > > Better to try to fix this in TTM rather than try to worry too
> > > > much
> > > > about it here.
> > > > 
> > > 
> > > +1.
> > > 
> > > > > 
> > > > > > Otherwise, this could also cause newly introduced sync waits
> > > > > > in the
> > > > > > exec() and vm_bind paths where we previously performed
> > > > > > eviction and
> > > > > > the
> > > > > > subsequent clearing async.
> > > > > > 
> > > > > > Some additional stuff below:
> > > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > > > > ++++++++++++++++++++++++++++
> > > > > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > > > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > > > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > > > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > index 4e39188a021a..74470f4d418d 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > @@ -1434,6 +1434,51 @@ static bool
> > > > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object
> > > > > > > *ttm_bo)
> > > > > > >  	return locked;
> > > > > > >  }
> > > > > > >  
> > > > > > > +static void xe_ttm_bo_release_clear(struct
> > > > > > > ttm_buffer_object
> > > > > > > *ttm_bo)
> > > > > > > +{
> > > > > > > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo-
> > > > > > > >bdev);
> > > > > > > +	struct dma_fence *fence;
> > > > > > > +	int err, idx;
> > > > > > > +
> > > > > > > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > > > > +
> > > > > > > +	if (ttm_bo->type != ttm_bo_type_device)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	if (xe_device_wedged(xe))
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo-
> > > > > > > > resource-
> > > > > > > > mem_type))
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > > > > > +		goto unbind;
> > > > > > > +
> > > > > > > +	err = dma_resv_reserve_fences(&ttm_bo->base._resv,
> > > > > > > 1);
> > > > > > > +	if (err)
> > > > > > > +		goto put_pm;
> > > > > > > +
> > > > > > > +	fence = xe_migrate_clear(mem_type_to_migrate(xe,
> > > > > > > ttm_bo-
> > > > > > > > resource->mem_type),
> > > > > > > +				 ttm_to_xe_bo(ttm_bo),
> > > > > > > ttm_bo-
> > > > > > > > resource,
> > > > > > 
> > > > > > We should be very careful with passing the xe_bo part here
> > > > > > because
> > > > > > the
> > > > > > gem refcount is currently zero. So that any caller deeper
> > > > > > down in
> > > > > > the
> > > > > > call chain might try to do an xe_bo_get() and blow up.
> > > > > > 
> > > > > > Ideally we'd make xe_migrate_clear() operate only on the
> > > > > > ttm_bo for
> > > > > > this to be safe.
> > > > > > 
> > > > > 
> > > > > It looks like bo->size and xe_bo_sg are the two uses of an Xe
> > > > > BO in
> > > > > xe_migrate_clear(). Let me see if I can refactor the arguments
> > > > > to
> > > > > avoid
> > > > > these + add some kernel doc.
> > > > 
> > > > Thanks,
> > > > Thomas
> > > > 
> > > 
> > > So I'll just respin the next rev with a refactor xe_migrate_clear
> > > arguments.
> > > 
> > 
> > Actually xe_migrate_clear sets the bo->ccs_cleared field, so we kinda
> > need the Xe BO. I guess I'll leave as is.
> > 
> > Yes, if caller does xe_bo_get, that will blow up but no one is doing
> > that and we'd immediately get a kernel splat if some one tried to
> > change
> > this so I think we are good. Thoughts?
> 
> I think we either (again to be robust to future errors)
> 
> 1) need to ensure and document that the migrate layer is completely
> safe for gem refcount 0 case bos or we
> 
> 2) Only dereference gem refcount 0 bos directly in the TTM callbacks.
> 
> To me 2) seems simplest meaning we'd need to pass the ccs_cleared field
> into the migrate layer function.
> 

So, pass ccs_cleared by reference and also pass in the TTM BO? I
typically despise pass-by-reference, but yeah, that could work. Some
kernel doc indicating that xe_migrate_clear can be called with a
refcount of 0 would be good too.

Matt 

> Thanks,
> Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > > Matt
> > > 
> > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > /Thomas
> > > > > > 
> > > > > > 
> > > > > > > +				
> > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > > > > +				
> > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > > > > +	if (XE_WARN_ON(IS_ERR(fence)))
> > > > > > > +		goto put_pm;
> > > > > > > +
> > > > > > > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo-
> > > > > > > >resource);
> > > > > > > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > > > > +			   DMA_RESV_USAGE_KERNEL);
> > > > > > > +	dma_fence_put(fence);
> > > > > > > +
> > > > > > > +put_pm:
> > > > > > > +	xe_pm_runtime_put(xe);
> > > > > > > +unbind:
> > > > > > > +	drm_dev_exit(idx);
> > > > > > > +}
> > > > > > > +
> > > > > > >  static void xe_ttm_bo_release_notify(struct
> > > > > > > ttm_buffer_object
> > > > > > > *ttm_bo)
> > > > > > >  {
> > > > > > >  	struct dma_resv_iter cursor;
> > > > > > > @@ -1478,6 +1523,8 @@ static void
> > > > > > > xe_ttm_bo_release_notify(struct
> > > > > > > ttm_buffer_object *ttm_bo)
> > > > > > >  	}
> > > > > > >  	dma_fence_put(replacement);
> > > > > > >  
> > > > > > > +	xe_ttm_bo_release_clear(ttm_bo);
> > > > > > > +
> > > > > > >  	dma_resv_unlock(ttm_bo->base.resv);
> > > > > > >  }
> > > > > > >  
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > @@ -1063,7 +1063,7 @@ struct dma_fence
> > > > > > > *xe_migrate_clear(struct
> > > > > > > xe_migrate *m,
> > > > > > >  	struct xe_gt *gt = m->tile->primary_gt;
> > > > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > > > >  	bool clear_only_system_ccs = false;
> > > > > > > -	struct dma_fence *fence = NULL;
> > > > > > > +	struct dma_fence *fence = dma_fence_get_stub();
> > > > > > >  	u64 size = bo->size;
> > > > > > >  	struct xe_res_cursor src_it;
> > > > > > >  	struct ttm_resource *src = dst;
> > > > > > > @@ -1075,10 +1075,13 @@ struct dma_fence
> > > > > > > *xe_migrate_clear(struct
> > > > > > > xe_migrate *m,
> > > > > > >  	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > > > > >  		clear_only_system_ccs = true;
> > > > > > >  
> > > > > > > -	if (!clear_vram)
> > > > > > > +	if (!clear_vram) {
> > > > > > >  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > > > > > > &src_it);
> > > > > > > -	else
> > > > > > > +	} else {
> > > > > > >  		xe_res_first(src, 0, bo->size, &src_it);
> > > > > > > +		if (!(clear_flags &
> > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > +			size -=
> > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > +	}
> > > > > > >  
> > > > > > >  	while (size) {
> > > > > > >  		u64 clear_L0_ofs;
> > > > > > > @@ -1125,6 +1128,9 @@ struct dma_fence
> > > > > > > *xe_migrate_clear(struct
> > > > > > > xe_migrate *m,
> > > > > > >  			emit_pte(m, bb, clear_L0_pt,
> > > > > > > clear_vram,
> > > > > > > clear_only_system_ccs,
> > > > > > >  				 &src_it, clear_L0, dst);
> > > > > > >  
> > > > > > > +		if (clear_vram && !(clear_flags &
> > > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > > +			size -=
> > > > > > > xe_res_next_dirty(&src_it);
> > > > > > > +
> > > > > > >  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > > > > >  		update_idx = bb->len;
> > > > > > >  
> > > > > > > @@ -1146,7 +1152,7 @@ struct dma_fence
> > > > > > > *xe_migrate_clear(struct
> > > > > > > xe_migrate *m,
> > > > > > >  		}
> > > > > > >  
> > > > > > >  		xe_sched_job_add_migrate_flush(job,
> > > > > > > flush_flags);
> > > > > > > -		if (!fence) {
> > > > > > > +		if (fence == dma_fence_get_stub()) {
> > > > > > >  			/*
> > > > > > >  			 * There can't be anything
> > > > > > > userspace
> > > > > > > related
> > > > > > > at this
> > > > > > >  			 * point, so we just need to
> > > > > > > respect any
> > > > > > > potential move
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > > > > xe_migrate
> > > > > > > *m, struct xe_bo *bo,
> > > > > > >  
> > > > > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > > > > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > > > > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> > > > > > >  #define
> > > > > > > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_
> > > > > > > DATA |
> > > > > > > \
> > > > > > >  					XE_MIGRATE_CLEAR_F
> > > > > > > LAG_CC
> > > > > > > S_DA
> > > > > > > TA)
> > > > > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > index d1a403cfb628..630082e809ba 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > > > > > > xe_res_cursor *cur, u64 size)
> > > > > > >  	}
> > > > > > >  }
> > > > > > >  
> > > > > > > +/**
> > > > > > > + * xe_res_next_dirty - advance the cursor to next dirty
> > > > > > > buddy
> > > > > > > block
> > > > > > > + *
> > > > > > > + * @cur: the cursor to advance
> > > > > > > + *
> > > > > > > + * Move the cursor until dirty buddy block is found.
> > > > > > > + *
> > > > > > > + * Return: Number of bytes cursor has been advanced
> > > > > > > + */
> > > > > > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor
> > > > > > > *cur)
> > > > > > > +{
> > > > > > > +	struct drm_buddy_block *block = cur->node;
> > > > > > > +	u64 bytes = 0;
> > > > > > > +
> > > > > > > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > > > > +		   cur->mem_type != XE_PL_VRAM1);
> > > > > > > +
> > > > > > > +	while (cur->remaining &&
> > > > > > > drm_buddy_block_is_clear(block)) {
> > > > > > > +		bytes += cur->size;
> > > > > > > +		xe_res_next(cur, cur->size);
> > > > > > > +		block = cur->node;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return bytes;
> > > > > > > +}
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * xe_res_dma - return dma address of cursor at current
> > > > > > > position
> > > > > > >   *
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > index 9e375a40aee9..120046941c1e 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > > > > ttm_resource_manager *man,
> > > > > > >  	if (place->fpfn || lpfn != man->size >>
> > > > > > > PAGE_SHIFT)
> > > > > > >  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > > > > > >  
> > > > > > > +	if (tbo->type == ttm_bo_type_device)
> > > > > > > +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > > > > > > +
> > > > > > >  	if (WARN_ON(!vres->base.size)) {
> > > > > > >  		err = -EINVAL;
> > > > > > >  		goto error_fini;
> > > > > > > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > > > > > > ttm_resource_manager *man,
> > > > > > >  	struct drm_buddy *mm = &mgr->mm;
> > > > > > >  
> > > > > > >  	mutex_lock(&mgr->lock);
> > > > > > > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > > > > +	drm_buddy_free_list(mm, &vres->blocks, vres-
> > > > > > > >flags);
> > > > > > >  	mgr->visible_avail += vres->used_visible_size;
> > > > > > >  	mutex_unlock(&mgr->lock);
> > > > > > >  
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > > > > ttm_resource
> > > > > > > *res)
> > > > > > >  	return container_of(res, struct
> > > > > > > xe_ttm_vram_mgr_resource,
> > > > > > > base);
> > > > > > >  }
> > > > > > >  
> > > > > > > +static inline void
> > > > > > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource
> > > > > > > *res)
> > > > > > > +{
> > > > > > > +	to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > > > > DRM_BUDDY_CLEARED;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static inline struct xe_ttm_vram_mgr *
> > > > > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > > > > >  {
> > > > > > 
> > > > 
> 
