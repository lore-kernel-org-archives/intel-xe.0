Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BCEC624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9261110E12D;
	Fri,  4 Sep 2026 18:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsoK6i0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866610E12D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788545634; x=1820081634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uE4AUhWuxlgIyDmMO69h3hIcYL2KZdZrTpLES7RS0yA=;
 b=KsoK6i0U5JTvbhMPjb99lbRyBPnjmA2wJEcByeFLDMix9cUWRE7+94gw
 JmPmwsnrU4WBVgnDhLDYwJvvM78moVrWV1lYWtJGkheyDo4B7X1iPV5Ly
 QrAMBRurvcGWzGyrzKTThPFBWfKWD7Oo8tBZDeplbGaoqEGWZEUnOIAgy
 9ClPADnLTbVu74tEbQ+6jPXXPZKog0QhrzKK/kXk6gqFh7LR6gaxNzvsj
 EzLpSx6BIxkgJt9pidj72gqiWt64cwiFjiT4Epz69Rgwa0KWV73k4k88b
 om7olnn2ichz533AB1LtZ3pQS+KPvFL68W7V8UyvcjQnsCoNgS7fiuPEW g==;
X-CSE-ConnectionGUID: NqlaUemrTfOUo34v3jX5XQ==
X-CSE-MsgGUID: VwMlftVHQHWYc4bA8cKmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88902008"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="88902008"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:13:54 -0700
X-CSE-ConnectionGUID: 2JltJdiCTMuRhlBoZrmjDw==
X-CSE-MsgGUID: 4WU8DAIKQkSM0PClrzjdXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="308311880"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:13:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:13:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:13:54 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9UvCAEf9W/KZcRvny0dO4HNKXOkc06noTNPi3elld4MSN0lHP++TpHGU3wd7Cq8Sujs52nRLa4GqP+OjwclwW+CuwBRxsOlxwLlb6Wozef46XWtnRJUgFdj84DbDZEY3bWkYfc5Oa37j41s2dHkKTROEdpwc3vX8l1BqjK/HIf5XnTv6qaMP9Tw4HFicmna9hauaLqXumzavIZeWDBiHmZY56h+WNNjA0oI8f/Hy1LVcRmNp5rFjoLC6istJqgP2WRmNoemcIMVELhNi2IF990gW/zsU/8onbxVtUUZONpYy+w2n09qlzLHPc6lfWmynAnbc2h6b/hX5XS4ICd1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOEq8NN6HNKnsXVI3qpRMQybYKnU1mJbeaG3YHJ8Ikk=;
 b=fDCNvYacg6CGhh9p6VH2KwoVEPdXZS/olIkz3YtoPwxIR/KiPEZWdMcD7Gt/41AykgMK+Ooh5nkQVC2W+FRvPX2lGmB++gZ0HqU9Y9sT17AFATbdONPEWoFjhyJ1zBGoxNK1MnzJ5khXLPTnNmr6l6fnyR4Z/D1Kjn0yXROXWBhQNTV4nSGC6er2CBKuc0S5/1Com13ZZE41xRDl4XbvsV1vL6DS9OtywZE4cvxii1cAxzR/ynZOQTY5Atk8V8I58jPYsZ4FC1if0BkpB5PF+wUsl7GsmyF/4sj3bjO24V4zhaENyyoXPE50OBDCJvod7wBwhpfOOSHXe+3+nINmPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4617.namprd11.prod.outlook.com (2603:10b6:303:59::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:13:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 18:13:50 +0000
Date: Fri, 4 Sep 2026 11:13:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
CC: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: Re: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <apsKW3PaGxW1rUNt@soc-5CG1426VCC.clients.intel.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
 <20260904134935.674507-5-anoop.c.vijay@intel.com>
 <CH3PR11MB04614946668821D655E04261D9C1B52@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH3PR11MB04614946668821D655E04261D9C1B52@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: ee327f8b-3c21-48d2-65db-08df0ab044f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|5023799004|11063799006|4143699003|6133799003|22082099003|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 6Myu+MVx8/VfvXewL3BM1Qa7tIwOtbSyvOc2L+ydXTDu+hJaGX05yt+/hTWsVqf2V6XziXaCLNYE1Fex6YYrcRXXT921IrYlub3izzd2wyNgABE4NHkpGoiJrEoYBlpIPBtiVlee0aWdi0ZQvB+o52C8j4aOYy21otvj1IhrDNoASgpa1uS1pxxoXI7lfDkQCtu1aouW0WQK7sk9MsCLcObZU+/suOPjW64S3iq1UmJXffv//wL47lrObqgldtiLKIL7SGo6vMbFA8E/by5EK1KTLgR65VGGSBub6ShoytQCouZ4fNOsyGPnMmO+544hQKNx/2WW3gxYab1jN4npaagBtWCp9ui1phTmXHdg8n0u2urJYS1pJuIBUfF/ZDr8wgJp53F2yGpUVsRfGEedXrhUKY9a95t4U34Mq3grk5tuinuV2dgBo1oOhCHQ87VTLvKkbXjvJyV1hsvniH4ALVSCxFMaHFzeBCj/6sCv9d5c6TXADeu99gF85cyP5cgtLVElt5A0OzWjaQKo3eD2WTENlzS27M7+1xG3eo/sIlKXS235IBwcGXGZPZLbBCgQG4GOB/ZxjSjW6qtSij8/6iI0XmAsxYumlM6AcgO5w6544AWQXa+lZtP/8hPvtOVxyFmxSEvqwxq7+T/vclq3Z804Now/baDWceg70jhhJF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(5023799004)(11063799006)(4143699003)(6133799003)(22082099003)(3023799007)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXkvQ1RHdE1BcHpTUGI3RTZ2NkNTUnBHNHVTdmFncXRUWUJIdHEzRXNHSmpR?=
 =?utf-8?B?aC9qN3FmN2tRWENTa2dRMFlYNDdEMGtGSWZaRmRobCs5Ti9MRFdTV1ZlTVRS?=
 =?utf-8?B?NjNkc2cwcWZ3R096eGxyY2VSLytJWTZydFlTdzI2RS92V1pOcXVUZjdJUDM4?=
 =?utf-8?B?OGJTUEVRMTZjdGV0M0o0bmNJMk5LNG1rQWhqcEFWelpsSnJEeWtQNVUrSXYx?=
 =?utf-8?B?L2pjZ3RKNGhxNTFQNWlFZXNxRE5oMHhuVUtHTW1wK3FUcTlkdVZaSEg4eXhK?=
 =?utf-8?B?dmQ2ZmY3NGNrMkxXamNtNkEwNjgzWVJtYVF5dzk0Sng3VmhaSHkzdVEzUS9S?=
 =?utf-8?B?UTJMWUwwSXVLWE9Vb2VwZzVJSDQwRGJWTHhzSnRxKy9iSW9aRGYzakh4M1dv?=
 =?utf-8?B?OGZvRGJKNXV4cGZ2Z2tEczZTY1Q5YjJLUGFVS2JWeEdTV2NrMzY5UTVkcXBo?=
 =?utf-8?B?VzJycUJuOEVza1pEQVFubEVuaXJ0VHlvWVdOOWpXb1d5MnlFanBQZXF3MDZr?=
 =?utf-8?B?ckw3ZXZOcmorSUdnNm1CSzRTeE9lQmg2eUs2QmZPeGxzQXJYenplLzhpdjR5?=
 =?utf-8?B?RTVYL3dvZ2tUVURHOGRsOVpORndlVS8xZEQvZlkrcUtTZ3d3VCt4VDVmUzNo?=
 =?utf-8?B?QzZvOTBCMmRjbytSWktjVHRWellXY1dDejZ2MHRFVEJoYTZYZEp4NngwcjZK?=
 =?utf-8?B?R1d2MG9BY0lZVnQrdVNmS211aThraE9rMFA3bnhlMWozQkNyTDk4WkZ6bFpi?=
 =?utf-8?B?cm9tRGgzd0JRUWdKMU5JMkNRUjdNQ05jekJJdG42TXZvN1Vlc0dUNFp3TW1K?=
 =?utf-8?B?VG5WWkRaODgxT0lmOWFUS2s5TmZNWWdYTGRweC9PRDNXS2o3WnB2YzdQckdT?=
 =?utf-8?B?MXY1dk1rQXJiSkpxOUpmbzRaZ3lxdTNxR0VKa05kU2I3Z1lMSHlEUG10UUVI?=
 =?utf-8?B?UVNaVXRwWnZqeS9RV0VQeXdQV085ZUZoQlBoTGp4bVdaYy91UlQ3ZHdaSDZa?=
 =?utf-8?B?THZCM0hvRWpQMCtnTFRXaTdJaHVoVlBsbUszMDlHU3lSVDdBclJsamY2TVBk?=
 =?utf-8?B?OWQ1MExFR05Dc1BEMjMxQ1oxUXN0bktKN1NlQ3c2K0huUFlJNlpBWjJ5SHo5?=
 =?utf-8?B?VUpIQkkvQVNuQm96Q1lFMHRwMUNqVXQ5cFBMd2Q3MkxYNi9DWHhvMDFLV2VQ?=
 =?utf-8?B?eEE0YUFYY1FuSlRpNjRuakQraUNaOEZiQ2hQZUZrNzN6bzBNVVZvb0txdUVE?=
 =?utf-8?B?M1l0akRjYXRMcFVLOU5USVZmK1BwSHI0U3FKWU1VdUd3V2V4L2lBVzZaakYw?=
 =?utf-8?B?Y2k4TUJ0RklPcnZFNnU4eDFZNVdqK0YrY2IvY0t0a0hMdWxaM3IvVzF5eTRL?=
 =?utf-8?B?ajlLQjZjenBuT0pjUlZ3dkVIM21GeTFramlGazZWeDF4anRXVTIyYUUrNzEy?=
 =?utf-8?B?OEdkWWRYVUtlSnVOTXF2T3Q2d0RKYk1NbHJLSU54MW5IUmx0ck5TbWtDS1Fy?=
 =?utf-8?B?a25TbldwVlluNlRKWmx4eGhvYVMraWg5YXNLVkRvY1AyV1hxMzFLWGYyMmxD?=
 =?utf-8?B?cHNNSzNqdGN4ZWVYOTV2UHRlZW9OWnBGRVVvNGs2Mmg5cXFxTGwxdWZhK0VM?=
 =?utf-8?B?VGgyZ1RSRUMvUmFtWG10cXdCUHlXRW85ZG5WbC9UcTFzTTdlcUY5T05tN1NH?=
 =?utf-8?B?R3AzT09YS2ozam5ReUdaL1RTdHdwdGorVmxRYjBXTkthNkhHVDVZclhOZXc5?=
 =?utf-8?B?aVhOVm0yam1vMjVXVFpFTVpzc2N6eDhPRmxCVmcxTWM1dlM3L0ZtclRDMnpv?=
 =?utf-8?B?MU5ENEJRTFZCMFNtZHl5bFErWUFqWTI0cmZwc1lqRG1WTWJzUUtrdXVwUHhq?=
 =?utf-8?B?YjdLR0FrMGNBaWhGRk9SUjdQVEI3NXI4bFFPRGk5NzF0YUZ5RkcwNmpRNTFB?=
 =?utf-8?B?dFJ1SzV1QzVzaXdlZCs3VVV5SjZBWTkydUdMR20yaTgycUxmS0dPUFZKSXlW?=
 =?utf-8?B?bHhQc3ptRElLTFFoUUtXMm5jRGkzZUZOTHg2QmNMRXRlQlBOanZyekRheHFE?=
 =?utf-8?B?dHBkZ0pOcDFIcDZnTGNrY2tKVHp0aVdDSUgrbGw3SlRuMXd0QVY5NVFDbFBs?=
 =?utf-8?B?bG5oWHBwSmZIVVZtVkJvclZienp5Y1FJaVJZR2ZNbHNhRmVBcUFTdGNWSi9Y?=
 =?utf-8?B?SEJtUmNnMExIL25kMXZkR011aXNMSHkvTjZGV05BKytLbFhPWnQxNGZRQW52?=
 =?utf-8?B?WExSek1BMzFwaWlESWRxM3czZmJMM2ZrcFBoS2l1UitybzViQWtjeTYyVFpa?=
 =?utf-8?B?MGpnVlNMUkhZZkVOWmp3cEJ5VGVTZTVyRFRFSmRvbyswMklFdE1lV2lMSHcw?=
 =?utf-8?Q?a5hYhbAoWJmSotaE=3D?=
X-Exchange-RoutingPolicyChecked: O8+xNd9FvVk2SewtqBz5GK8iSb2htBpzQxIY+pANHY3DNKLewU+VKVJFvL9XKSZXS/8KZk5XExqlLgB9xQ06nCKNSrqyxVUj1KFdckElV2w7ZUY9OsjO5ThVF+H4V/4gNktJVvyizhDTf23d2eOdviWmWCnixbKdZUS+C13ygc0y8/RGjL+jeNUTUj+0KdwhcZFAnGdPly0vH4vaLIL8Zdd80UnxF+Q1EG2X53y5py4i88IJGv29JaStyCPd9ItzTlnBBjyfNVDsc+Q/QhE2MXWS50P1Hwb4MEfTH5JicMgPPLmrwm4ElYhkAHLiS0stQCxALy8Z8XrKUMD//nIaYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee327f8b-3c21-48d2-65db-08df0ab044f1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:13:49.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuDAXSGjLFqflFqF69NHO7F2rFl5U+1doLKrT5X8lo0Z4HVJmY02twShTU9AAwjs1vatENmo1gsB+TVKz2xqiw5nlE8U8k1zHkzXF4bQj9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4617
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

On Fri, Sep 04, 2026 at 08:19:07AM -0700, Ruhl, Michael J wrote:
>>-----Original Message-----
>>From: Vijay, Anoop C <anoop.c.vijay@intel.com>
>>Sent: Friday, September 4, 2026 9:50 AM
>>To: intel-xe@lists.freedesktop.org
>>Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
>>Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>>Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
>><riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>>Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
>><michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V, Mohamed
>>Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
>><kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
>>Subject: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application status
>>
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Add xe_sysctrl_check_app_status() to query the state of a System
>>Controller application using get_app_status_by_id mailbox command.
>>
>>The helper maps xe_sysctrl_app_id values to firmware application
>>IDs and returns the reported application state. Add a convenience
>>wrapper to check diag firmware application readiness.
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>---
>>v2: (Badal)
>>- Return SysCtrl firmware application states instead of errno for
>>  application lifecycle conditions
>>
>>v3: (Riana, Badal)
>>- Replace string-based app identifiers with enum xe_sysctrl_app_id
>>- Use get_app_status_by_id (opcode 0x05)
>>- Move mailbox definitions to xe_sysctrl_mailbox_types.h
>>- Return enum xe_sysctrl_fw_status consistently
>>- Map communication failures to COMM_FAILURE
>>- Add INITIALIZED state and status helpers
>>- Fix Diagnostics typo
>>
>>v4: (Anshuman)
>>- Make xe_sysctrl_check_app_status() internal
>>- Remove unused app identifier
>>
>>v5: (Anshuman)
>>- Rename OOBMSM status helper to use xe_sysctrl_* prefix
>>- Remove xe_is_diag_fw_ready() helper
>>
>>v6: (Riana)
>>- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>>  header packing
>>- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>>- Use hex constant for application ID
>>- Move oCode application readiness helper to a separate patch
>>- Add xe_sysctrl_is_diag_fw_ready() helper.
>>
>>v7: (Umesh)
>>- Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less platforms
>>- Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to
>>xe_sysctrl.c
>>
>>v8: (Umesh, Rodrigo, Mike)
>>- Drop XE_SYSCTRL_FIRMWARE_APP_NOTSUPP handling
>>- Simplify diag readiness helpers to a single
>>  XE_SYSCTRL_FIRMWARE_APP_INITIALIZED check
>>---
>> drivers/gpu/drm/xe/xe_sysctrl.c               | 73 +++++++++++++++++++
>> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 45 ++++++++++++
>> 3 files changed, 119 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>>index 62ccc9be71b4..3b7fa2c9c333 100644
>>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>@@ -13,9 +13,11 @@
>> #include "xe_device.h"
>> #include "xe_mmio.h"
>> #include "xe_pm.h"
>>+#include "xe_printk.h"
>> #include "xe_soc_remapper.h"
>> #include "xe_sysctrl.h"
>> #include "xe_sysctrl_mailbox.h"
>>+#include "xe_sysctrl_mailbox_types.h"
>> #include "xe_sysctrl_types.h"
>>
>> /**
>>@@ -29,6 +31,20 @@
>>  * This module provides initialization and support code for interacting
>>  * with System Controller through the mailbox interface.
>>  */
>>+
>>+/* Application status flags reported in xe_sysctrl_app_status_resp.flags */
>>+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
>>+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
>>+#define XE_SYSCTRL_APP_RESP_INITIALIZED	BIT(2)
>>+
>>+/*
>>+ * Known System Controller application identifiers, keyed by firmware
>>+ * application ID.
>>+ */
>>+enum xe_sysctrl_app_id {
>>+	XE_SYSCTRL_APP_DIAG	= 0x0D,
>>+};
>
>Curious as to why this is defined here (rather than the header where app_id is defined)?

I asked to move it to the C file in one of my comments. The header file, 
IMO, is consumed by different entities and the APP specific information 
should be separated from that. Not critical though, if you feel it makes 
sense in the header, I am okay with that.

Thanks,
Umesh
>
>>+
>> static void sysctrl_fini(void *arg)
>> {
>> 	struct xe_device *xe = arg;
>>@@ -125,3 +141,60 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>>
>> 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>> }
>>+
>>+static enum xe_sysctrl_fw_status
>>+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id
>>app_id)
>>+{
>>+	struct xe_sysctrl_app_status_req req = {};
>>+	struct xe_sysctrl_app_status_resp resp = {};
>>+	struct xe_sysctrl_mailbox_command cmd = {};
>>+	size_t out_len = 0;
>>+	u32 flags;
>>+	int ret;
>>+
>>+	req.app_id = (u8)app_id;
>
>Is app_id different for different requests?
>
>Or is this done because the size is fixed? (rather than using the enumeration)?... ahh I do see the __packed usage, so
>this make sense.
>
>This looks reasonable to me.
>
>Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>>+
>>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE,
>>XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>>+				  &req, sizeof(req), &resp, sizeof(resp));
>>+
>>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>>+	if (ret)
>>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>>+
>>+	if (out_len != sizeof(resp)) {
>>+		xe_err(xe, "sysctrl: unexpected get app status response length
>>%zu (expected %zu)\n",
>>+		       out_len, sizeof(resp));
>>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>>+	}
>>+
>>+	flags = resp.flags;
>>+
>>+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>>+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>>+
>>+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>>+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>>+
>>+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>>+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>>+
>>+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>>+}
>>+
>>+/**
>>+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>>+ * @xe: xe device instance
>>+ *
>>+ * Returns true if diag firmware has reached the initialized state, indicating
>>+ * it is ready to handle requests.
>>+ *
>>+ * Callers must only invoke this on platforms where System Controller is
>>+ * present (xe->info.has_sysctrl).
>>+ *
>>+ * Return: true if diag firmware is initialized, false otherwise
>>+ */
>>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>>+{
>>+	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
>>+	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>>index 090dffb6d55f..8dc576796890 100644
>>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>>@@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>> int xe_sysctrl_init(struct xe_device *xe);
>> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>> void xe_sysctrl_pm_resume(struct xe_device *xe);
>>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>>
>> #endif
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>index 66e7cbcc3f91..c236e5377f30 100644
>>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>@@ -14,9 +14,11 @@
>>  * enum xe_sysctrl_group - System Controller command groups
>>  *
>>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>>+ * @XE_SYSCTRL_GROUP_CORE: Core group
>>  */
>> enum xe_sysctrl_group {
>> 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>>+	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>> };
>>
>> /**
>>@@ -42,6 +44,49 @@ enum xe_sysctrl_gfsp_cmd {
>> 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>> };
>>
>>+/**
>>+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
>>+ *
>>+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status
>>by ID
>>+ */
>>+enum xe_sysctrl_core_cmd {
>>+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>>+};
>>+
>>+/**
>>+ * struct xe_sysctrl_app_status_req - Get application status request
>>+ *
>>+ * @app_id: Application ID for which to retrieve status
>>+ */
>>+struct xe_sysctrl_app_status_req {
>>+	u8 app_id;
>>+} __packed;
>>+
>>+/**
>>+ * struct xe_sysctrl_app_status_resp - Get application status response
>>+ * @flags: Application status flags interpreted by
>>xe_sysctrl_check_app_status()
>>+ */
>>+struct xe_sysctrl_app_status_resp {
>>+	u32 flags;
>>+} __packed;
>>+
>>+/**
>>+ * enum xe_sysctrl_fw_status - System Controller firmware application
>>lifecycle states
>>+ *
>>+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by
>>firmware
>>+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but
>>has not yet booted
>>+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-
>>boot init pending
>>+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>>+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
>>Controller firmware failed
>>+ */
>>+enum xe_sysctrl_fw_status {
>>+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>>+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>>+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>>+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>>+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>>+};
>>+
>> /**
>>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>>  */
>>--
>>2.43.0
>
