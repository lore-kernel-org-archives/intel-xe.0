Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E64AC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 13:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616810E7C9;
	Tue, 20 Aug 2024 13:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbLtcsLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6524E10E0A4
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724160081; x=1755696081;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GpZwNAM5+/3Gub5tSxvzT+SVpyDrpP4B9970k2e5qPA=;
 b=DbLtcsLWM/dH2VCFX9MBUPetCleu1HpO75bPsGgFANc52dqB+jYCTjvA
 xWaBRtw59sIxA1GygRz6IPrJHc14WW+3weByvGz6UbJ7pLzdYXH9IBmQM
 A0DdUazcFjqm85MZRIv/afWJMVHpIvX4Mhp/B1BLf4nQzpuHO6rcTnBJk
 QqSyw8tYJG6rSEmBAS5m2PXHJerpawe05cmSwag5ANU8483RF3N5F/h1N
 ef0E39o/6Z7UYATlAIDGz6suDVSgzyjVbCKi/mFrPH0iKlJ4gXBqgNQFo
 nhUaxMrWtbtAmhzh8+PAH8y1p03OxWZksbRKGbrgutc7TPiMQfehdvE2q A==;
X-CSE-ConnectionGUID: xd0mdk9WS5uVXpfy+MNwLg==
X-CSE-MsgGUID: UJNObAsHTti6Tz/ufHcPOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33613281"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33613281"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:21:20 -0700
X-CSE-ConnectionGUID: l+q3swvNQhqDGA+Yp/WkcA==
X-CSE-MsgGUID: 6G8Pr/E/TkacjHuBi4PNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="61270535"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 06:21:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 06:21:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 06:21:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 06:21:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 06:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0O3hOZP7CfzNF6HdBgfhvQPuUHRAg1SbToXdc6+5C9+4aeselQcOxV0M7EyrbipKStNoS5/HFm51hLVXD/Yb43zYubIBZlg1KJbyQjzKWJ2e0WI858zsKNSEnlmMu5ht54ELdloc93ZTG9zvtB88QklLXE7v5eraNYqspldZVjuR8MJdVVWnelCw2uI/We0pszVJd+xEqe1HJpMyuPnQO2G5RVxRg610lzSq/XqX0uSCOpK6Ucl7P6kJ2CZvORaOF3YpvnpyNY90Dvp0AaUBYBBE39+gB+TUHppDvYcNfilE4JR2DQRBsNU240tAGB1GF5WL3y76Oxq8vVwArSrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A2GoBcSzCTGTRLJGoQESxbHzwWIrc4zrPcKD9tucLI=;
 b=Krmt2nxP1tMjUFAvaxhH59RFLoQvpdmZ9M8kXL96EPp0pbOiXcz6mJkZX2e3PTab9JmRzWJhWC8BOOIcwhYffoiizr70sE1/YkG+duUi8UtVeyPVByoLMq74uh4dTKTaxsG6IOFSIO3epHwT4YrgPPA9KGiV0I38HLNWt6Hs6ir9qpwIIcROvox3URt5cQb8FLzOj2ateVIkVgn+KDV4VcPvP6b2TjgYwK/CIE7fMaHW1kiht/iU1NS7Mg9j3nuZgLL6HhVWbZIDyhYWk9bCgRdgkDY0gyxa0rXomZ6BssnARnJOb4tt57e56/b3MfpAKgwMjMK2HqWpU7kESsSOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 13:21:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 13:21:11 +0000
Date: Tue, 20 Aug 2024 08:21:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/12] drm/xe/tests: Allow deferred function call during
 KUnit test
Message-ID: <ncie6znthrlhkm7jdeur65l3dwauhdftw27g4zlrvr2jiiq6b3@d7nk7ox5kebr>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-6-michal.wajdeczko@intel.com>
 <7x7kzxucmjabvmoxb2x33qcp7gzrvn7ga2gg5vtlrpipntq5rr@pdahgmswbk3w>
 <c79f9e25-6c72-42a1-82bf-7e5ff9911866@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c79f9e25-6c72-42a1-82bf-7e5ff9911866@intel.com>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7b5afc-2908-43d0-b2bb-08dcc11af55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/gjI/kpl8fUWUW9bBiK+/i8AmOECKcw7qgRRtPgk0hjy6Ivn08inVETnVR?=
 =?iso-8859-1?Q?wXKn4nraQtzh8IFCA6JxC6UJapvuFUuV7lPrvniwxNAzCQLKRtHzqboPLk?=
 =?iso-8859-1?Q?lQlo/8mmD8ujWFekDGOoes4B1N1UokF5ZMdOKFRbcYkB97w0rvvJQ1SCQm?=
 =?iso-8859-1?Q?ETH+y6md2a1HX6TLSH566oYFxn+aLn1mkiiC8xpm8nFSeOLeSxiLIb7EYp?=
 =?iso-8859-1?Q?28X9e9G6jMEJ1VdnoC6/KKNuA0jJy13GGK44/nHC1WGG507w9GJK8Sj9/X?=
 =?iso-8859-1?Q?6EYwlvMT6wpi24CPlCq1wXkPjf8e1xRX8+s0dtgaxQ1byYRlE8t/0L4Dj3?=
 =?iso-8859-1?Q?Gv4qnvIaNFLasLi969Uyn7T15XihmpcjvZ59UYFS80d1mPprA6rjCJQMNf?=
 =?iso-8859-1?Q?OtIWbZLuvW/qmwo3C0GmXnSJTj+21CWeAeA1fsNyO1S9RFifnYnFURxVIK?=
 =?iso-8859-1?Q?yu0DIeiSrxw/nH4ZlFTJPwDwBtbz1X2FiyakswflEkPZPe/D3qKy+0m93h?=
 =?iso-8859-1?Q?6kNSNdNueD6ns7Wmsq1PnFBkZ2249OXH1/gsgZtcvBUBHfGb7OzdRTYWhE?=
 =?iso-8859-1?Q?AcHc6uCjCreO471YIF227289T81bU/GowhVfiKwdSPZtFM1LMXkzfijTEC?=
 =?iso-8859-1?Q?4oGaTsUkihfIfyB/pgjYnXkhyVWy192EFwXsMBljyBnTrv+d7PLuuu/4Hr?=
 =?iso-8859-1?Q?/4/ogROkwkqkgS6hqsqdeuYkXtvDj+OPS2+lmdtQ07vboggaXksTxNcZ+e?=
 =?iso-8859-1?Q?DBP2eSJhhYiVENwOGuns+PNBlV9bKsw59cE8UJ807CSjd/qZ5ySOR176lL?=
 =?iso-8859-1?Q?GPRmeztOOMS5fdQAwICtH0Ln7bDwKeCfVQnJsbzzcFhYZa+RbhuKIrDcQi?=
 =?iso-8859-1?Q?cY8z9peOFMyrsFOLgUEjNA+Q/h0w06yTMXnh0b9gQy7B9u/PssARoE1OEn?=
 =?iso-8859-1?Q?6FoN2kMcLdLEdF/T3fFu8gjoDrSNSe6GYar5P5t7+QBYHj6XXSPQLu7ag/?=
 =?iso-8859-1?Q?Pxepx/oTym6IR13J6gD5RmwJuVHhdtNyLxeoSenhxKFYk6Y024p4DiXs4W?=
 =?iso-8859-1?Q?Kee6BRGs5wI7B2SaDORJaLNdejQH3QgiZxF0mtFOBcQrjAmxVlrhE1bqqh?=
 =?iso-8859-1?Q?eMAPYYuRPgfja0yWLJ7vG05g19jZvSCAVm4wseBJ07yNY2kQ0+2Z6TAPir?=
 =?iso-8859-1?Q?Q4/041CkTbBiLFI2xxImx0TrurqlBJplLsbYBg5HBC0zc8e2h18EB5ecwr?=
 =?iso-8859-1?Q?+YorlPcWZOuWozVzqObnOWw3NVdluza6jm2fVJqg6LsRvuEoiReu+sst1c?=
 =?iso-8859-1?Q?H/waNBpmtuW+8jUOCrqpFeAEKPfL6P+EjnRtziUJw3ARqhM+cWRBuDv1Rk?=
 =?iso-8859-1?Q?yBH7PYEz/cDG9N8yMc+eDVpQOZqJgwRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?87KnJkxnm+nzkeJsKtvPJNAsSp7oVzHxxxRz4cO3vCqcCMIAiQV57ZcPEV?=
 =?iso-8859-1?Q?KTLwWQFpSgzF5DRhzEz8LAJ8PuuFt3G5sEcUvRLmgvpe6SlDvr1T0qAtfW?=
 =?iso-8859-1?Q?TPHqT1xADak53Cz4Wf/zIvcEh0FmBDTTLZvweIEyh2eZ4IJxRKz5EC086I?=
 =?iso-8859-1?Q?+lt1wQ2a/x31bmJ3qsy3uV/t1PqIvDtds1f+lFX/bkYyGU5XVrTBnssXsh?=
 =?iso-8859-1?Q?RRc4066Do8k27+0pX3ZlgEK0C6rp20KM7if0sWS8MheCUz4g1WUZ71cdR+?=
 =?iso-8859-1?Q?iMhibG5mtd5m2y7exSeCxhIUzuYj4FDqyum9qMto5gDM6jsmpQIOr8H0LW?=
 =?iso-8859-1?Q?LRMvSLDRk8qtOzug7SvFiO8+bEOxzI48bZLPU3RGfiaQwYFhLHEAgTbEE4?=
 =?iso-8859-1?Q?W+RDpuhM9C77JreeNClBv+d1qjG3HoBFu4EJcxawyLSt/HQ6q+2wf3kz9n?=
 =?iso-8859-1?Q?hm4oQy8ASNUfBY+ylmi4a91zqj99GTkissRcwRl90jlonj0Sn9Hs8PSKOx?=
 =?iso-8859-1?Q?EKUQA3vcguJ3+OaFa+8f2w3Q2BV6kbT+N/p0xbLIrP8gBOVr3kbl9nnGHZ?=
 =?iso-8859-1?Q?kk5pqa1Y6vSj9Teicv+Cu98tMoTa7MB0zEP2cu23EpZR4jANNCy7kMPh72?=
 =?iso-8859-1?Q?xpGfW8YmdM7Y6Mcjnev4qbCMJBDHaeisr4aI4PTP2tjCMB5elFVX+poXRc?=
 =?iso-8859-1?Q?KwEVv739uNc/T5Pwl4mObgU9mR/E0awgQ9ksNFCaKhFlPcuX6pTgZ1wQ9U?=
 =?iso-8859-1?Q?au1FRTzrNrg+3RGvvG3FhTDxTzJZJ08wqbWC2BEPahjAi+5d86GE3m0/TK?=
 =?iso-8859-1?Q?9qoG4IS5JxjcNPPCn1wIakVnEQUyqmE5gKSkQk6malvM2oYoj2/Vlw6EW6?=
 =?iso-8859-1?Q?4vUlIU7EvmP90zLoFBQIlNl56MsztR3cHPEBf3vzWIfEEFNPBEoCAM73Ez?=
 =?iso-8859-1?Q?yIm70L1hiM+zhwRuJYZOldN2Pqqat34CuYWC2//f7ioQpuBZcC+CKllcFC?=
 =?iso-8859-1?Q?5eAOTHpKOsE+imP6kzlBLC6ctuOP44l9PaAH2+OOSg6iSySgGTvKzNX4nn?=
 =?iso-8859-1?Q?+NDpVuv94Z2F2tDtRzLdq+VX9jyBmfLel2wE+vLEILCTGoBgwZOTXM3g6n?=
 =?iso-8859-1?Q?7RJouqaTtk+A3FKNoPwhuJ3uWMPXflQeHUuK0QwmUoVW9uqiNOXHrEl+8F?=
 =?iso-8859-1?Q?U2wCHrFHQk6u+lTytp3k8n7ZB4+1xbN9S3e9O41vNqRPHrpuCFj5knay6A?=
 =?iso-8859-1?Q?bRPM5vLvK6NBKHBTaxKmPK/c8faP25Lq3Y5roOI3jMf4hFqR9e+edDKiI5?=
 =?iso-8859-1?Q?ObKFTaJST7zKxzutoCs1rZppIlWdJdoW3vctAwrUplAWWbGOgN+KqRa86Y?=
 =?iso-8859-1?Q?M1MmgetKUMiC9GTVMshsRv/fGIhSLC6pmxHMf8LcKJAZj6q8nYLGDK475d?=
 =?iso-8859-1?Q?fPwmPjNKw4kgEkwTkM6hz14Tz/CNHQIi2AvigyKORi8ZE2zZjzluuZj4lz?=
 =?iso-8859-1?Q?w/jCMpnFo8kdJ+t0HUQrGvHTjTHMInckzC5mEJrvCtG10cgh97Fdl9v+gb?=
 =?iso-8859-1?Q?L7M92qDFoE/A+aViE7+f1GFFgOhIuB2n2z9FTt97/+CqjDoIMXik7Srmj+?=
 =?iso-8859-1?Q?kO4G7CFi1aiiqaIJGscOQ6hMBq5D6EbPmd1TfGSnjJO7z7xt1r6gXgYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7b5afc-2908-43d0-b2bb-08dcc11af55f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 13:21:11.3522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZam2408NGhwEekWo6v/eepkLYVlNjyyTttyUkFzWN2STIxLbQSddVU22hdF44ceOxFEb1xYWcYXm2XCHwvzDspKDwtkpTgfnGa/HrN1nuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
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

On Tue, Aug 20, 2024 at 12:23:43PM GMT, Michal Wajdeczko wrote:
>
>
>On 19.08.2024 23:38, Lucas De Marchi wrote:
>> On Fri, Aug 09, 2024 at 06:51:52PM GMT, Michal Wajdeczko wrote:
>>> For some advanced test cases we might want to simulate external
>>> activity that will stimulate function under test. Add set of
>>> helper functions to implement such requirement. Usage example:
>>>
>>>  static void foo(struct xe_device *xe)
>>>  {
>>>      WRITE_ONCE(xe->foo, 1);
>>>  }
>>>
>>>  static void foo_test(struct kunit *test)
>>>  {
>>>      struct xe_device *xe = test->priv;
>>>
>>>      xe_kunit_helper_delayed_call(test, HZ / 2, foo, xe);
>>>
>>>      KUNIT_EXPECT_EQ(test, 0, READ_ONCE(xe->foo));
>>>      schedule_timeout_uninterruptible(HZ);
>>>      KUNIT_EXPECT_EQ(test, 1, READ_ONCE(xe->foo));
>>>  }
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 148 ++++++++++++++++++++
>>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  38 +++++
>>> 2 files changed, 186 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> index bc5156966ce9..8fe1a0918b32 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> @@ -127,3 +127,151 @@ int
>>> xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>>>     return 0;
>>> }
>>> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
>>> +
>>> +struct xe_kunit_call {
>>> +    struct delayed_work work;
>>> +    struct kunit *test;
>>> +    struct {
>>> +        int (*int_gt)(struct xe_gt *gt);
>>> +        int (*int_gt_uint)(struct xe_gt *gt, unsigned int n);
>>> +        void (*void_gt)(struct xe_gt *gt);
>>> +        void (*void_gt_uint)(struct xe_gt *gt, unsigned int n);
>>> +        void (*void_xe)(struct xe_device *xe);
>>
>> I think the only reason why you're adding this in xe is because you are
>> using xe-specific types. This could rather be done generically by
>> always using int delayed_func(void *data). Then you can simply add it to
>> kunit and get it reviewed there.
>
>while some generic functionality could be always extracted and moved to
>the kunit, for easier use in Xe tests likely we will still need some
>wrappers with xe-specific types, so do we really always need to start
>with trying enhance generic kunit first and then wait for acceptance
>until we can use such extension in our test code?
>
>IMO this could be in parallel, so in kunit review we can point how this
>is already being used..
>
>anyway, will try to split that feature into 'generic' and 'xe'
>
>>
>> Also thinking that the example you added in the commit message is likely
>> suggesting the wrong type of test, that a) sleep too much and b) tend to
>> be noisy
>
>only tests longer than 2s are considered SLOW ;)
>
>and HZ was just picked to have an example small
>
>and you will not see any noise if test PASSES

any test we add that follows the pattern "fire something to do X, sleep,
assert it did X" falls in one of the 2 categories: either sleep too
much (in this example you're using 2x) and/or created noise because the
time slept wasn't sufficient.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>>> +    } func;
>>> +    struct {
>>> +        struct xe_device *xe;
>>> +        struct xe_gt *gt;
>>> +        unsigned int n;
>>> +    } args;
>>> +};
>>> +
>>> +static void call_work_func(struct work_struct *work)
>>> +{
>>> +    struct xe_kunit_call *call = container_of(work, typeof(*call),
>>> work.work);
>>> +
>>> +    if (call->func.void_xe) {
>>> +        kunit_info(call->test, "calling %ps(xe)\n", call->func.void_xe);
>>> +        call->func.void_xe(call->args.xe);
>>> +        kunit_info(call->test, "%ps(xe) completed\n",
>>> call->func.void_xe);
>>> +    } else if (call->func.void_gt) {
>>> +        kunit_info(call->test, "%ps(gt)\n", call->func.void_gt);
>>> +        call->func.void_gt(call->args.gt);
>>> +        kunit_info(call->test, "%ps(gt) completed\n",
>>> call->func.void_gt);
>>> +    } else if (call->func.int_gt_uint) {
>>> +        int ret;
>>> +
>>> +        kunit_info(call->test, "calling %ps(gt,%u)\n",
>>> +               call->func.int_gt_uint, call->args.n);
>>> +        ret = call->func.int_gt_uint(call->args.gt, call->args.n);
>>> +        if (ret < 0) {
>>> +            kunit_info(call->test, "%ps(gt,%u) reported error %pe\n",
>>> +                   call->func.int_gt_uint, call->args.n, ERR_PTR(ret));
>>> +        } else {
>>> +            kunit_info(call->test, "%ps(gt,%u) returned %d\n",
>>> +                   call->func.int_gt_uint, call->args.n, ret);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static struct xe_kunit_call *prepare_call(struct kunit *test)
>>> +{
>>> +    struct xe_kunit_call *call;
>>> +
>>> +    call = kunit_kzalloc(test, sizeof(*call), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, call);
>>> +
>>> +    INIT_DELAYED_WORK(&call->work, call_work_func);
>>> +    call->test = test;
>>> +
>>> +    return call;
>>> +}
>>> +
>>> +KUNIT_DEFINE_ACTION_WRAPPER(cancel_call, cancel_delayed_work_sync,
>>> struct delayed_work *);
>>> +
>>> +static void queue_call(struct kunit *test, struct xe_kunit_call
>>> *call, unsigned long delay)
>>> +{
>>> +    queue_delayed_work(system_wq, &call->work, delay);
>>> +    KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
>>> cancel_call, &call->work));
>>> +}
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call_void_xe_device - Queue a function
>>> call during KUnit test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_device function to call
>>> + * @xe: the &xe_device argument
>>> + *
>>> + * This function uses KUNIT_ASSERT to detect any failures.
>>> + */
>>> +void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_device *xe),
>>> +                         struct xe_device *xe)
>>> +{
>>> +    struct xe_kunit_call *call = prepare_call(test);
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>>> +    KUNIT_ASSERT_NOT_NULL(test, xe);
>>> +
>>> +    call->func.void_xe = func;
>>> +    call->args.xe = xe;
>>> +
>>> +    return queue_call(test, call, delay);
>>> +}
>>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_device);
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call_void_xe_gt - Queue a function call
>>> during KUnit test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_gt function to call
>>> + * @gt: the &xe_gt function argument
>>> + *
>>> + * This function uses KUNIT_ASSERT to detect any failures.
>>> + */
>>> +void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_gt *gt),
>>> +                         struct xe_gt *gt)
>>> +{
>>> +    struct xe_kunit_call *call = prepare_call(test);
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>>> +    KUNIT_ASSERT_NOT_NULL(test, gt);
>>> +
>>> +    call->func.void_gt = func;
>>> +    call->args.gt = gt;
>>> +
>>> +    return queue_call(test, call, delay);
>>> +}
>>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_gt);
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call_int_xe_gt_uint - Queue a function
>>> call during KUnit test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_gt function to call
>>> + * @gt: the &xe_gt function argument
>>> + * @n: the function argument
>>> + *
>>> + * This function uses KUNIT_ASSERT to detect any failures.
>>> + */
>>> +void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         int (*func)(struct xe_gt *gt,
>>> +                                 unsigned int vfid),
>>> +                         struct xe_gt *gt,
>>> +                         unsigned int n)
>>> +{
>>> +    struct xe_kunit_call *call = prepare_call(test);
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>>> +    KUNIT_ASSERT_NOT_NULL(test, gt);
>>> +
>>> +    call->func.int_gt_uint = func;
>>> +    call->args.gt = gt;
>>> +    call->args.n = n;
>>> +
>>> +    return queue_call(test, call, delay);
>>> +}
>>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_int_xe_gt_uint);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> index 83665f7b1254..ec5287947ee4 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> @@ -9,6 +9,7 @@
>>> struct device;
>>> struct kunit;
>>> struct xe_device;
>>> +struct xe_gt;
>>>
>>> struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>>                           struct device *dev);
>>> @@ -16,4 +17,41 @@ int xe_kunit_helper_xe_device_test_init(struct
>>> kunit *test);
>>>
>>> int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
>>>
>>> +void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_device *xe),
>>> +                         struct xe_device *xe);
>>> +
>>> +void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_gt *gt),
>>> +                         struct xe_gt *gt);
>>> +
>>> +void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         int (*func)(struct xe_gt *gt,
>>> +                                 unsigned int vfid),
>>> +                         struct xe_gt *gt,
>>> +                         unsigned int n);
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call - Queue a function call during KUnit
>>> test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_device or &xe_gt function to call
>>> + * @args: the &xe_device or &xe_gt and other function arguments
>>> + *
>>> + * This is a helper macro that compiles into dedicated function call
>>> based on
>>> + * the provided argument types.
>>> + */
>>> +#define xe_kunit_helper_delayed_call(test, delay, func, args...)    \
>>> +    _Generic(func,                            \
>>> +         void (*)(struct xe_device *) :                \
>>> +            xe_kunit_helper_delayed_call_void_xe_device,    \
>>> +         void (*)(struct xe_gt *) :                \
>>> +            xe_kunit_helper_delayed_call_void_xe_gt,    \
>>> +         int (*)(struct xe_gt *, unsigned int) :        \
>>> +            xe_kunit_helper_delayed_call_int_xe_gt_uint    \
>>> +    )(test, delay, func, args)
>>> +
>>> #endif
>>> -- 
>>> 2.43.0
>>>
