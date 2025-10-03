Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC2CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 21:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05110E97E;
	Fri,  3 Oct 2025 21:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGzZDcFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E327210E97E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 21:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759525594; x=1791061594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7yCSeDUC3XCW2eOm10Jc7Ycn4/QGU0LlBmx/HJZVbpM=;
 b=mGzZDcFSHJGAdi1l4YsOehv/36ngYoRLHsG4rCpyKAS53jx9ej+O4kD+
 +C2WP4JPL6iorTL7K6wzXu0KNBnp5Tay/IfevvL5Kneuh25h6xnkVYape
 ZI2Kb8JsiXqfch4MI3Lu7q5LGFDv/lM7xMpEAjQBQM2ZxeeXq6FUyS/Vx
 WQyO7+hR+6P5clWkgJZF0On4j8EhKXoAIiKucOMQBlAuPML6cJ41hjdAS
 g9jj2Nr4sHtzmojl2VDswpTBaNewQ4c/UNU5wO9gYbnufPENrub6IWboR
 ktDwo6cN7C7+mxO6KVfiwrP9WgsOGn7ZqLkkKnKuw9prJOO4pgtNk+DPg A==;
X-CSE-ConnectionGUID: IDEOZus0TmG9HbwmoUO8GQ==
X-CSE-MsgGUID: WlqIoZEtSwm5a5viuLserQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61728372"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61728372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 14:06:33 -0700
X-CSE-ConnectionGUID: vZJUfB33QbeDhUWJytnl7g==
X-CSE-MsgGUID: fOitkDVpRceoTfoAcWBMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="216480346"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 14:06:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 14:06:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 14:06:32 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 14:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIBz0Mn8Sa0td9YCxqQcHjUfTHh9LFsUa9seUI3u4ryoKstZcpLSYs8JPh8OhZTQRf5v35jxn2eyqfHROLrbNPGc3d19utrKZyBOaoIj5Mhb0+M0WcnTwIia6qchK7OXRqsP26nwYcJuo/fQ5NGW8Omf/mXTG2rmsw2M5YLPyoOCVp8MrRcDIYG6Yb5y+Y+wbkTqqHqVe5aTxq/IogPYvqKBmPqTlVbbrwqJ65LG2//IumwFLswOibIDjCkJ1CYltdzir7Mgz29hr3NbFcWAlG9stpWT/jlv6CEdiVDrJG72pmouyzAuU5mbkl6svXpTiy7yslhccdN24SCfRnbn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD+h9lrFEM9LRWbVunTXJSxTvkWxY+/+HU1aTTBEBpg=;
 b=vMuMiHhgenISQz0CJOlw5qEjUJb/Z5eHmftglpdh+lNpDuba2Ws4X990A9hxKiUigwiUFb5T99oksI2OIPe9eVtMdXNkDNwj/MwycHXXSuMqPJTt3233PyIXeEkF0gLlmvOuZ8wx7Pkm+AKTGXTjmje2ScJKs7eTf3bCU0bmLi2PKgIgrMmEzKwcgLiCllVXmwMKWF/u+g85AA0pZ944QUCDwYpMTLkSQkvqj8FdAXyepwApp2+D6swVXtlHUuyZ2hD0xHEvzg6CcHtGkBUV60KroZnkCnO68mn6cC1G2Bp+HhKSMplbF3pO3SCjO3E9V3/tOD8GMV/J4bH6652ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 21:06:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 21:06:25 +0000
Message-ID: <a148cc9f-b20e-4c93-9977-83d6ba12d379@intel.com>
Date: Fri, 3 Oct 2025 23:06:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Add max_vfs configfs attribute to control PF
 mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20251002232648.203370-1-michal.wajdeczko@intel.com>
 <aOA2n4npjuprZ1hD@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aOA2n4npjuprZ1hD@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0062.eurprd02.prod.outlook.com
 (2603:10a6:802:14::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: f894b025-599c-4323-e78f-08de02c0b6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkVoM0YwVWI3aHZsM0VVa2JkUHNsbnQvNmxabkRpL0NzTDRsc0xScHB2M1d5?=
 =?utf-8?B?V1ROK0dCZTNjY1BPaTF2RVc4bE5OVHIrdTFsUmxXT0x4TjIzSVRXSjVDWkFt?=
 =?utf-8?B?bk1MYzVEckh1VXlpbFRISVEwSnFYSU5wZXo0MDVONEIyYkJZUWlYQ3JoU3V4?=
 =?utf-8?B?cnVNUmZZZGFNYWUwUmxZRGNkZG5hWlByV3NDM3p6U1hZMUo0NTVLNTFHcjhQ?=
 =?utf-8?B?RklmUm1wd2xkNkp2MHczcm9Sek1Ca21SaTU2azBYanRZNmY2NlNjYjF4SkxW?=
 =?utf-8?B?SXdTSjQwcDZJNEViMlo0K29PRDhxcWdrUkZXUjI1LzROeWVaQitOc1lHU1Rm?=
 =?utf-8?B?RC9iNm1VTGNtLyt6Tk1mVXU5ZnFNMU4xc1V4T0VEaXpUWGxzVER3enVWMWgy?=
 =?utf-8?B?VFBwYXZDcXUwUTRwNTVBMUdTTms1bStTa2JoSFo3WEcyYjl3bm5rWmJyZ3hT?=
 =?utf-8?B?a1FWMWlMZlN5aWFwdHNVN0lnL0MzaXo0U0Zpa2U4Z0ozdWVjSWU5dXd4WllJ?=
 =?utf-8?B?TWRoZllSV0JvbVp0VVV1V2V6eWdUbTBpYjZzaVJLLzFBalg4TmtYS3lJclBE?=
 =?utf-8?B?VCt1cHNJK0RVdnZIMktNUmxUcHFLMW5VTGRqQU9HU0xFTngyTExUWS91aktu?=
 =?utf-8?B?MGdSQlA5ZTY1SWxNeERaZm42aE9YN1VIRHZMekJPcC8wNlZDZlgrRS9NY1Fr?=
 =?utf-8?B?bGZNUHVwbG5TNFlhMXNkVWc5bGVyL21NeEdjUWVlZU8xZzloYktDcnRmWVF6?=
 =?utf-8?B?MkRZM1E4alIxTFZ2a2tsMEw0aTRGTnF4R0NYYjM3UHF2VlRUbzIwUlFUQ2VY?=
 =?utf-8?B?ay8vOFAwUExud2tlQ2RrdXVHbEhqdHQ5aHFJY1p1RndsbTZOU3pZTkNnVXE5?=
 =?utf-8?B?bng0blBSaGkxWG10WWM3anl5S09WS1BFSnI5TkkyWEtKZmc4ZXFaVjk5YzlY?=
 =?utf-8?B?RmNMa3pIMm1kRFpVdjdnNVlINWpaaDFWaHB3ejFPRlBsbTFrNmg4ckFGcTdj?=
 =?utf-8?B?QjgrYmpRaDZFTThidzBiMVplb2w0enA1Z1R2a0Z3NllxR1gyNWY1ekRkMWlZ?=
 =?utf-8?B?U0h1clJlOTJ0MGRwd3g2Y1AxQ2N4eHZ6OWlDdFBVRlBQak5jWStKSXdRODVa?=
 =?utf-8?B?cEk4cCtHUTlLWUZsL3N0UXFLMGpxZmFFVGlhYndqVnRUSTBjSVVjVzdtZVc5?=
 =?utf-8?B?QlBKTnE3U1V0eGdKazFpaUVsbVdaanIyN3BTOWxwVUxZVWtWdWp6Wi9aOFNP?=
 =?utf-8?B?cXpNN0Y2aXNibWx5ZnBVVFg0bGdLaURpT1FVUjhBTDRvUlJmTTlpS1IyYkl3?=
 =?utf-8?B?ZFQ5UmdrckIxeG9zbUswYTNodmM5N25jTnFFKzFRZnAxT3BDZnVjbWhONjR3?=
 =?utf-8?B?ZzJHUkxsRHdhVTNXVFljZ2VXblZVTER0VjRFbGsrWVVQaSsweFU5V1htYXRk?=
 =?utf-8?B?TTNKMko4c3BDUDdCVWNIQkxOWHBoZm80TERmdWVVSUtJM1V0Q3pKV2s2L1U4?=
 =?utf-8?B?Z2dZWnNCOTY2R0FpVWlLcTNDcnl4QnYyZXVLVXNvM0pCeTJFakt4QVQxbGtk?=
 =?utf-8?B?V2gzN2tua2VWdmFXZEtUZ3Uxaksxdkk3b0JiQlBxRzB5dW83dVRsR0lTMSth?=
 =?utf-8?B?QU1TRldZTEdmaVdhMHN6bVZqTHYzYmtLUHpwN2ZzSnFwcnhQOEdUeS9uL2lN?=
 =?utf-8?B?K2xYbU1hZGJwQ3pORjZ6NEVTL1QweEJ0UHZEQ3gwNVJpZ1pMRFJhVE9IMjhS?=
 =?utf-8?B?cHdlT256VHNpOW1TNllaTU1pRms2bWZ5QmpoUGFHRzV4NThEWGJiOGtmRnRT?=
 =?utf-8?B?bU9ucW5LVklwaDJEOVNaN1NNNnpoVzlHUUV1dUZvVzRucmpmYWxTNUxrbWYv?=
 =?utf-8?B?cDg1OEdaTzk2SFA1WlpuSnFEWERtMlYyWWRmOWFWYk9tVkFyYmFPZzZqWHBP?=
 =?utf-8?Q?gL4YQc6/7zYW/pznoqErp+qSXFAMZkwO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytxbHFxZVJoYk5vbE5yNUN0bUUxNWF0cDRvWk1zU0lPLzV6b3ZSUkF4ZzFO?=
 =?utf-8?B?a1F6L1Yybjh4WXpRNmFnUHVCRDZDaDRkQVF1R2tvMUVScWRrdFZoSkhzSTRF?=
 =?utf-8?B?Z2cvTUNpZ01ZOVhYN01KcXJIRFZUVkwyYkNxdmc5UGVnTUFJUnZ0alg1cEpx?=
 =?utf-8?B?UXJqREY5QlhWTEE2TG00MDlhenFyZUhydmgxVEtnRGtIcHhqWUtwdFJIbGo1?=
 =?utf-8?B?SEFiaFpMbFliZGIycUdsSDNtNkVTOTQwRnVMcUFMY3hKTlVGcGpob1psUUJ4?=
 =?utf-8?B?SkFuSVRhUFJyTVlIZlVxZVVxcmZXdVczY3VMUzd6ajhnZ25ucm9sZjFJRGdX?=
 =?utf-8?B?TjNFbXdWY0RzaGJ1TWl0OXFzMnFzRC9NUlhVK1ZWbU4vVDlROW5JcDBha1VI?=
 =?utf-8?B?VEpCQW5QSnhQWHU1RitPRm12VThMajRpUXd5YnlVdDFKN29FblRlN1dVNmt0?=
 =?utf-8?B?Q0NrVjRYYWFkVmxoV0pMYWVSNjN5dkd3V3E0enJiMUxRdlh5U3ROV1NxeDNW?=
 =?utf-8?B?Uy9GWFdUdzFnRkM1T3BqQm8rcUhVSTBiTG1zVnBya3hzZHpwQXExeThVc255?=
 =?utf-8?B?Y0R6eXVFaEtXeUQ5MHkycXg3QU9ZbGVwS1VVUlROL0dCa1VjNmxTV29RS1Ra?=
 =?utf-8?B?bWRnSFpuS2J4TWNKMldXWW1aVjUyaW80c2MxY3R2ZEFHcytVRjZCVHU3Mkkv?=
 =?utf-8?B?UlA2YUp5M0FkM0hFK1hKM1F5eXpmV0NaRzBqdCs5VVBUcC9kRSsrK1lrcDZD?=
 =?utf-8?B?aEVTaFhpTHNySHBCTDB3M3R1bndLcDVNYmFDWVQ2d2VSYll4T1J2NHF1Vmww?=
 =?utf-8?B?Q1ZwSTErSklYQ2t1ejVlWTE1L2xLRlNtYms5b0RkUkpMUWJlcDVkU0tzMVRG?=
 =?utf-8?B?eTdkV0NYWGFkU2xDVE05WUJMZGZIU1dTY3hvY3ErR0s4ZzNYUXM1emNZL0dl?=
 =?utf-8?B?Nkd6NG9abzJqZW8xTDBLUmtyUmdCOGxJaUxNanBwdXZqNklaOVFvUVBBamE4?=
 =?utf-8?B?bVlweVQwN1JHRG5lVGIwbmwxT1pvL0xENkNzY0VTSExKWjhpKzlCMy9UMDF0?=
 =?utf-8?B?YkNtOTZsc2J2NFhOWkFZVmJmaGVyQzBRVytxUlJJd2RiNk1rb0lGME1DL00x?=
 =?utf-8?B?M0FQZEhpUGtRamEwU1M5cXdvWW9vTTBLNnlVa29ReHduVXg3cStHQm53NmFX?=
 =?utf-8?B?VEROVk5UQmRsQjBTc0NuaFpSYzlHc2UzeWJiV0tXbkFEcGNCL0x3Q1IrVy9Q?=
 =?utf-8?B?K0I1WFFDRHpBWUFoZy9XUTdpWjBrQnMwV3N3emp5aE9SK1lXdklrVUFzdkZY?=
 =?utf-8?B?b2NIYUM4SmNvbUcrOE0yMlpyb1VkaFgwM0J2VUJETU5TcGZIUHI0cWhkS1NY?=
 =?utf-8?B?Ymx5OU9MNkRkZUZRSHBTcllyUy9iRUl6aWxMbGNUSTNRR0hQK0x5ckxGd0dp?=
 =?utf-8?B?bmdTcFB4bGJkR1YrTDR2cGR4K21odW9hWmxiTmhMV2cvOE1nbVozWUJtMm8r?=
 =?utf-8?B?VHIyTkUwZWFYSXM5WVpuclA0MC91OG5Bc0c2WFJjMmJyeE0yb3ExdStadlZY?=
 =?utf-8?B?NTRVc2ZJa3JJNS9nUjBTTG4rdjREbzd5WGlKNnQxYzkrVEozR0hZcnREYk95?=
 =?utf-8?B?THU5dE96d1JFMzNjdjJVR1c0VVljMGxOMVdWcjd6QmRTeTVvVTB5QnFSaUJW?=
 =?utf-8?B?ZVRyOHFkajBzYnVNMHZJZnB0d1VyalpSNGVXUi82UkJwdm9ubmpIU3VXOUFi?=
 =?utf-8?B?SzV2OTVmenk1SFVpQTVNeFltenJVS045c05kOS9uRjFiQlgrNkJXeTVkcTdp?=
 =?utf-8?B?MjdYZ0pCRmNyVDNsSndYb2tJTzZNYnBFWEV3RjM4akJUK1d2UnVhaWozU1dm?=
 =?utf-8?B?OHFCRTJoR1poMlFQRWRhWFhDM01EcTZxd21xMEtrTklHZW4rU2F5R2pyOW43?=
 =?utf-8?B?MjZvcytaeEUrL1FVYUxNWnU4VHZIZGp3RVRrZTUzdDdsSXEvNHZBL0hWdlVh?=
 =?utf-8?B?bmtDcTd3YnJGR1pRSTlJbTdwT285RnowdDdjRk5GTDUzcTZ3QnJNM0djQkdY?=
 =?utf-8?B?ekluSW53RTI1OTBqWVNENDlFSVFhclNFWUZiUHhEdFpLOVBQZjU1RzZ4enhx?=
 =?utf-8?B?VzhkU0wwMVNQNVFzVTZMZGJzRnI4Z1pZVzV3dklmbndWRjJTenVyWFdrL2xX?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f894b025-599c-4323-e78f-08de02c0b6a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 21:06:25.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhPsGJy28mK6c2HMoD+t4/dYudb2nuReTpEDaLF7eeNJm63r5qkteGvJBCKZHPuZQbm5BHmE4TKcmg7j6zJO0SGKYJyOrjQXclcnAHCtzDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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



On 10/3/2025 10:48 PM, Rodrigo Vivi wrote:
> On Fri, Oct 03, 2025 at 01:26:48AM +0200, Michal Wajdeczko wrote:
>> In addition to existing max_vfs modparam, add max_vfs configfs
>> attribute to allow PF configuration on the per-device level.
>> Default config value is still based on the modparam value.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 139 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs.h |   4 +
>>  drivers/gpu/drm/xe/xe_sriov_pf.c |   3 +
>>  3 files changed, 146 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 139663423185..464a79c2a903 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -18,6 +18,7 @@
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_module.h"
>>  #include "xe_pci_types.h"
>> +#include "xe_sriov_types.h"
>>  
>>  /**
>>   * DOC: Xe Configfs
>> @@ -169,6 +170,32 @@
>>   * Currently this is implemented only for post and mid context restore and
>>   * these attributes can only be set before binding to the device.
>>   *
>> + * Max SR-IOV Virtual Functions
>> + * ----------------------------
>> + *
>> + * This config allows to limit number of the Virtual Functions (VFs) that can
>> + * be managed by the Physical Function (PF) driver, where value 0 disables the
>> + * PF mode (no VFs).
>> + *
>> + * The default max_vfs config value is taken from the max_vfs modparam.
>> + *
>> + * How to enable PF with support with unlimited (up to HW limit) number of VFs::
>> + *
>> + *	# echo unlimited > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
>> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
>> + *
>> + * How to enable PF with support up to 3 VFs::
>> + *
>> + *	# echo 3 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
>> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
>> + *
>> + * How to disable PF mode and always run as native::
>> + *
>> + *	# echo 0 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
>> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
>> + *
>> + * This setting only takes effect when probing the device.
>> + *
>>   * Remove devices
>>   * ==============
>>   *
>> @@ -185,6 +212,7 @@ struct wa_bb {
>>  
>>  struct xe_config_group_device {
>>  	struct config_group group;
>> +	struct config_group sriov;
>>  
>>  	struct xe_config_device {
>>  		u64 engines_allowed;
>> @@ -192,23 +220,34 @@ struct xe_config_group_device {
>>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>>  		bool survivability_mode;
>>  		bool enable_psmi;
>> +		struct {
>> +			unsigned int max_vfs;
>> +		} sriov;
>>  	} config;
>>  
>>  	/* protects attributes */
>>  	struct mutex lock;
>>  	/* matching descriptor */
>>  	const struct xe_device_desc *desc;
>> +	/* tentative SR-IOV mode */
>> +	enum xe_sriov_mode mode;
>>  };
>>  
>>  static const struct xe_config_device device_defaults = {
>>  	.engines_allowed = U64_MAX,
>>  	.survivability_mode = false,
>>  	.enable_psmi = false,
>> +	.sriov = {
>> +		.max_vfs = UINT_MAX,
>> +	},
>>  };
>>  
>>  static void set_device_defaults(struct xe_config_device *config)
>>  {
>>  	*config = device_defaults;
>> +#ifdef CONFIG_PCI_IOV
>> +	config->sriov.max_vfs = xe_modparam.max_vfs;
>> +#endif
>>  }
>>  
>>  struct engine_info {
>> @@ -721,6 +760,68 @@ static const struct config_item_type xe_config_device_type = {
>>  	.ct_owner	= THIS_MODULE,
>>  };
>>  
>> +static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	if (dev->config.sriov.max_vfs == UINT_MAX)
>> +		return sprintf(page, "%s\n", "unlimited");
>> +	else
>> +		return sprintf(page, "%u\n", dev->config.sriov.max_vfs);
>> +}
>> +
>> +static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> +	unsigned int max_vfs;
>> +	int ret;
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	if (is_bound(dev))
>> +		return -EBUSY;
>> +
>> +	ret = kstrtouint(page, 0, &max_vfs);
>> +	if (ret) {
>> +		if (!sysfs_streq(page, "unlimited"))
>> +			return ret;
>> +		max_vfs = UINT_MAX;
>> +	}
>> +
>> +	dev->config.sriov.max_vfs = max_vfs;
>> +	return len;
>> +}
>> +
>> +CONFIGFS_ATTR(sriov_, max_vfs);
>> +
>> +static struct configfs_attribute *xe_config_sriov_attrs[] = {
>> +	&sriov_attr_max_vfs,
>> +	NULL,
>> +};
>> +
>> +static bool xe_config_sriov_is_visible(struct config_item *item,
>> +				       struct configfs_attribute *attr, int n)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> +
>> +	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +static struct configfs_group_operations xe_config_sriov_group_ops = {
>> +	.is_visible	= xe_config_sriov_is_visible,
>> +};
>> +
>> +static const struct config_item_type xe_config_sriov_type = {
>> +	.ct_owner	= THIS_MODULE,
>> +	.ct_group_ops	= &xe_config_sriov_group_ops,
>> +	.ct_attrs	= xe_config_sriov_attrs,
>> +};
>> +
>>  static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>>  {
>>  	struct device_driver *driver = driver_find("xe", &pci_bus_type);
>> @@ -746,6 +847,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	unsigned int domain, bus, slot, function;
>>  	struct xe_config_group_device *dev;
>>  	const struct xe_device_desc *match;
>> +	enum xe_sriov_mode mode;
>>  	struct pci_dev *pdev;
>>  	char canonical[16];
>>  	int vfnumber = 0;
>> @@ -762,6 +864,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  		return ERR_PTR(-EINVAL);
>>  
>>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>> +	mode = pdev ? dev_is_pf(&pdev->dev) ?
>> +		XE_SRIOV_MODE_PF : XE_SRIOV_MODE_NONE : XE_SRIOV_MODE_VF;
>> +
>>  	if (!pdev && function)
>>  		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
>>  	if (!pdev && slot)
>> @@ -796,9 +901,15 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  		return ERR_PTR(-ENOMEM);
>>  
>>  	dev->desc = match;
>> +	dev->mode = match->has_sriov ? mode : XE_SRIOV_MODE_NONE;
>> +
>>  	set_device_defaults(&dev->config);
>>  
>>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>> +	if (dev->mode != XE_SRIOV_MODE_NONE) {
>> +		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
>> +		configfs_add_default_group(&dev->sriov, &dev->group);
>> +	}
>>  
>>  	mutex_init(&dev->lock);
>>  
>> @@ -988,6 +1099,34 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>>  	return len;
>>  }
>>  
>> +#ifdef CONFIG_PCI_IOV
>> +/**
>> + * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
>> + * @pdev: the &pci_dev device
>> + *
>> + * Find the configfs group that belongs to the PCI device and return maximum
>> + * number of Virtual Functions (VFs) that could be managed by this device.
>> + * If configfs group is not present, use value of max_vfs module parameter.
>> + *
>> + * Return: maximum number of VFs that could be managed.
>> + */
>> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>> +{
>> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> +	unsigned int max_vfs;
>> +
>> +	if (!dev)
>> +		return xe_modparam.max_vfs;
>> +
>> +	scoped_guard(mutex, &dev->lock)
>> +		max_vfs = dev->config.sriov.max_vfs;
>> +
>> +	config_group_put(&dev->group);
>> +
>> +	return max_vfs;
>> +}
>> +#endif
>> +
>>  int __init xe_configfs_init(void)
>>  {
>>  	int ret;
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index c61e0e47ed94..16a1f578e4fe 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -23,6 +23,9 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
>>  				       const u32 **cs);
>>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>>  					const u32 **cs);
>> +#ifdef CONFIG_PCI_IOV
>> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>> +#endif
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; }
>>  static inline void xe_configfs_exit(void) { }
>> @@ -34,6 +37,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
>>  						     const u32 **cs) { return 0; }
>>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>>  						      const u32 **cs) { return 0; }
>> +static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
>>  #endif
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index 4698348c010a..428b1b62cf48 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -8,6 +8,7 @@
>>  #include <drm/drm_managed.h>
>>  
>>  #include "xe_assert.h"
>> +#include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_gt_sriov_pf.h"
>>  #include "xe_module.h"
>> @@ -19,6 +20,8 @@
>>  
>>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>>  {
>> +	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
>> +		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
>>  	return xe_modparam.max_vfs;
> 
> I like the idea of the configfs, but this here is strange.
> shouldn't be better to simply remove the modparam?

well, I just wasn't sure what will be our approach here, since all our
current configfs entries were just new options, never existed before as
modparams, while this max_vfs is the only new one config that previously
was defined as modparam, that some users may still rely on.

so my approach was to use modparam value as initial default configfs value
for all devices, or immediate fallback if configfs is not available

just need a clear statement

note that there are few other modparams that should be promoted to
configfs (like guc/huc firmwares) and I assume the same rule will apply

> 
>>  }
>>  
>> -- 
>> 2.47.1
>>

