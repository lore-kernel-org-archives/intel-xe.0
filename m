Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939FCCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 19:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BB110E11F;
	Thu, 23 Oct 2025 19:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPBXGBVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B3110E11F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761246349; x=1792782349;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OsCwWeaiki7kLaNvzRqueyphW5syaM2X0Kx71oRG7/0=;
 b=mPBXGBVc+yr5K4W2KdezWvNtA8YIGYXa4jsfwipWiN7rz1B+CRpmbU5k
 11748ClOqsJdUrWULiPc83EC2z1AEOZyaTt3AW13Fd/vtAaRsj5QIgZDb
 lRiewVSU9SkfkfJ/wHBqkvFFKfrPlCij8JHYN2M9TOZf/06n5qtNrvSLY
 BbPUUpSH821qnAtdsU9C189HFbuF+lDr9C2ZqqiOBO7kQ1lj87rgt448d
 cLk0G5PgTOnENnelHflYoSrfhl7PAHNmreB5bsyrijuR729KhISat1Y3M
 xhZMqLyUq8bItCTAv6b0uC9QXgafyeIJH8O6av0V0xjkXRkgZxq9MjsMO Q==;
X-CSE-ConnectionGUID: uYr+dLTnSs+kr7m/ldLjjg==
X-CSE-MsgGUID: qJBTOAKcQtSB+hV4yRBTLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51006166"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="51006166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:05:49 -0700
X-CSE-ConnectionGUID: HwsaBKWPSoCrPvgS4iUXBQ==
X-CSE-MsgGUID: FLC59skKSy6FJYAZLkinnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184307377"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:05:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:05:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 12:05:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:05:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhMkay6fVFtC7I7wcNpDzOeYxCitjO2eKFgu5zLHZ63zsFgEMQmeRpag1D6dJCLnGakA7a0NPCMqOn1qwloCTYZSjJ0iM34A5W6S668zQkYSmmCETj6xWO5iVMLuTYvR+JYQVRjimdpkvrlHxfnttq67+KQ8L0HqStDtisn/93tr6sf1BbiQT3PBrHpqqJ7DtFhLyxyYx4gwprh1T52ekbmc2U2BQ2tvV2h5s42KAUB0DjiBdDC50vAN9gN7T4D86y6AlC2l9Oa8KgVwdPXi7EaSRIlhzl1Y0aPzZ3dVZP1AjeSsxqKthYms1quqtBKfjqcF4/Imm+R5ibpsM5Sfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up9FgKoDsq/Zz/4gL8iuRdftRWEl/RJuqfYQKPvZEvI=;
 b=ecq8VQw47bsHcny23EugtVGWZGwbgltZ9+7/hF907+4gNbFYoOxpHULQJOxysPNiM94rF9HhQ1OZhLUltQWiqZxohA27u0PDsbJOVaykRZg3TI8X+iXyuQlqAuMyKlw4vGIPdaZaxwl1MC0BsK4I1Rj0hflNOcxZlPc6BceV1U4u1StOhxybq5ywdRYAUrwtWv530xkdp+xeGWov+nsNCithPgDMERppsMKV5fHcMSh73yA8Hk2jl7d7pMDApywhgajLnDRBQjj8+pB48zre09hlzzcqY1C8Fv7ERRmjpBcukkXLO/KQfji1rCGME8RjAXp8K1mi3eArt9Y7QNlOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:05:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 19:05:45 +0000
Date: Thu, 23 Oct 2025 12:05:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Limit number of jobs per exec queue
Message-ID: <aPp8hq0uUu6YCpWC@lstrano-desk.jf.intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
 <aPkm4utKS39I1W/o@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456A69535CDE3915CE71A3AEAF0A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5456A69535CDE3915CE71A3AEAF0A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a191d6-6ed6-48c8-2a25-08de12672b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0RMZWJ2Y0oya0ZYM2x6RDNmdnhWQUNtVjNCVUpvSnQvSGdtMlhBbkRZYU92?=
 =?utf-8?B?ajk3a2d2WE1jWm43dGY1U3cwTVRmQjc0ampGQjNhbnlDVytOL1dGWGl4ei80?=
 =?utf-8?B?SmFaUzA0Mm05ZDNWQ1Fuak9FVC9SZlRGOHA1aDlWYld3d2FEU2cwUXpFYmlV?=
 =?utf-8?B?NnoxR2MweFhUUUpUcW95SnZuVjRieks5dFRISElUTHN3eWMySms3YjFUUEkv?=
 =?utf-8?B?cFVKWDhzL2wzRXJNZXE4RUcvcUxWcDBvdWl2UWhmNlVPak1weWM4NnlxMTZs?=
 =?utf-8?B?OTN2TXgvblp2M2Z5Q2IwMFhHd3RXeUo3SlpDY295VnlNZVBkd0t4b25mbFZt?=
 =?utf-8?B?RDYvSW9MYmFyRDJPZk5SZG11TnYwTUtKbWNxeklWSEhxdXRoL3kwdlVXdVVm?=
 =?utf-8?B?ZWl1R3FzeTlWN1ZLTHdLdE9LZ1VYU3pSZmdrK2VSc0JNa0d6M0xSWVVBWUVw?=
 =?utf-8?B?SjBNZ0RFMURmMzhIc09yZDFFVzJIT2VOa2ZLTTJQMERmSGxNOUQ3WGxzU1lM?=
 =?utf-8?B?bS96WlpHUHQ1NVl1T0U5Ni9uOWVsSVo1RmI5b3RYQm5LcG9zc3hQSDFSQUov?=
 =?utf-8?B?VHloOUxRd09pOUlBUVZEV0VRemo4SGxMMFpZcDlHRHpQUy83anJmU2RvT1RF?=
 =?utf-8?B?WC9aM3JaTDgyK01wckJaaHVZeGlYWXYzczl6WUNsT3ZBRWltS2hMS3JmL1ZB?=
 =?utf-8?B?Y1lwdjlCS1BSSzhyTWdNSUpvYnpZWkZwSkJkeVFwZmk4cHF6azQydjVJQ0pn?=
 =?utf-8?B?SWtMQ0hVeXJzWW42OFllTGRqSmx0MG1KK0twNkdpZGErTVBnNDVxeGdTM3Av?=
 =?utf-8?B?TW44RjFlTG5PRFhPR0hzV05vMm1NK0JhdWtxRjFKSXFCS3d4UEQ4cWpXNHdB?=
 =?utf-8?B?YkZJYkk0Q2pkUGduRG52SklsOXo1dEoybFJzTXB2TkVlQmJBNEg3MXBTOVF3?=
 =?utf-8?B?M0d3dHdna0R3ak82bm02UmFkbVh1YlROTVJ4Y3dmMUNMM29ZZW4xZjJhSWV4?=
 =?utf-8?B?bjg5ak0ralIrUCtQTDR0Sk53WGpTaytZNWRZM0xXY0JoL3FnTExPOHVCOFRn?=
 =?utf-8?B?QmUwVWlUZk9wZUExaWVVZjFoTnI1eTBQbnJEbm9iUk50bmZMZHUxSFdyakw3?=
 =?utf-8?B?K0d2d1VqMWxON0R6OVp4ZzZ1VEpiWFlHem1INmU3ZVZrd2Q3K3Bxa0VNcnNp?=
 =?utf-8?B?b3FwSGU5ZTByOTZnWkk3N2EzelVKc25SaTgzaWUrckwwR0FZVktTTVU1SWNj?=
 =?utf-8?B?bm5kMjFncnF5N0E3NHdFWE90WkdlTjRwVm1uNGxPV1grNVdNSWxtcytvd3U5?=
 =?utf-8?B?dFVDOW1pcVhibVkzTTRLRDB3OVZVVGhGNmpibjhldUVXbU9XczVLZm9OZjdm?=
 =?utf-8?B?bDFmY0ZSNXZKRlZpQTZ5dTVFTFdKM1NlYW9pS2lIdkI4emx4cE5pZ3BkY1Jl?=
 =?utf-8?B?WmNXdzdXK2VvdVc0alBUWW9zWHRCM0dhbFpJdWM0QU1EOEMzeFhzTWFZam5r?=
 =?utf-8?B?RHFqTkQ5d1I2SmdHVjVKQkdDcW1uQUtlaEZ2R3dWbTU0NmpFaWpydk1ZWnIr?=
 =?utf-8?B?OUR5TUNyS0hoRFF6TkRYT3MzdFAyQmwyV1VWbGhaWDV2R3dMcFZyWmMySVlt?=
 =?utf-8?B?TmJXbk9hRHh3SlhoU2pQSW1vT0xhRmpOaE1WM2IzbmdyMHRnYzllZW1MV3dy?=
 =?utf-8?B?MHJmMDBLNlNTZDY0Uk82YW9icERIWGNLZGpVcjVGY21QUDZFYWlBZUJKK0JG?=
 =?utf-8?B?U2VKeXg2QUhaZmRSNmlFYU4ydGN1amlDTlRPQmx2a0xtVXorNE9Fd0JWUEtR?=
 =?utf-8?B?NkZrdzNPc0FKTXVjRE5hYUJBZHQwaDhIU0tCMElsTGRkejA2WElYWnkyNStm?=
 =?utf-8?B?Szg4bk1ybmxHQnhXdVV5T2FsWDZlMGdtaDNCMDNMakNaZmo4aVh5NkFOa3Mz?=
 =?utf-8?Q?YWmpa26XkFPypgIej7+4oTmsDFFMOh1f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3U5VDhzc0I1MTlvRHNzOVBaUnBMc3JLL21zQWw3Vnp1ZE1jMzcrNk5Pc3Zy?=
 =?utf-8?B?NlROaWllN09KaUNCbGx6RWxNRlBtcEdxMFVtK3FNWG1rNitvU0toc2ozVkh6?=
 =?utf-8?B?d3JMSVpTOW5ORkhNdUMxSndpNE5ScEJTTmNNMHBGMmNiZFRZRHUyVDErc2NV?=
 =?utf-8?B?Y1FGTVlEbzJhdGFSN2d1bko0OTNXb1FxWk00ai82U3drUFZHbklzRjQ2T0pR?=
 =?utf-8?B?UTc3WWRpUHoxSXVZUkkvOXJDWGxCUk1SbkY5VGdnanA1VENaWFJWSkRNTU13?=
 =?utf-8?B?NGJJcmZ6WFZXR0w5a3plVjVsS2RpYS8xVnpyNFFiRCtNcGFWaWszTGhrTGcr?=
 =?utf-8?B?UWpFU2VqOHZOeXdlL2RGbXM3OFgyMnhVcm1uU2xhdEl6aUMzekZKWWI5b3BW?=
 =?utf-8?B?bDRNblJrSVIwa09HVnVrK25wbEFyd1Noc3FrU1RXdDlwUlJXUGp4VlZsZVZ6?=
 =?utf-8?B?bXpsTFdXeDFKWFhBbDJQOEJkeG5RRTVta1JTMFc3eUpTMmpxaXAzOTcyaXV1?=
 =?utf-8?B?SzVITmdUYXpiM1FqTzg4R3RZeDhGQ0FRaWtQbGJSelkzY0h4SUtET0UxUmVE?=
 =?utf-8?B?TG04NGQrUUtZZnUrZUp0Vy9aNGEyT25KWmNjN2R3WkZjajk5N2c5Kzd1KzZD?=
 =?utf-8?B?a3BMOFZqQTNyeWQxWkVLdTZYZnprUUR5WFJBanh0Rm9vMlhVNW54UWcxMnVK?=
 =?utf-8?B?cW9QTm8vMHFBaVpTcUxTZGhTdmhZUk1RZkl1Z2IyT2Jwa3orSWMxSmtxUlky?=
 =?utf-8?B?U0R6TGptcC93NVcwTDVTNWF1ZStzUUNOUjlWOGp2Y3RLTlk0TFhxK2RvQ1F5?=
 =?utf-8?B?Q0VmckFabzRYeGdLMTFORTBDeVJ2amxLL0owZ2VuakxDM3ZMSjhlVWdycUpM?=
 =?utf-8?B?RkE0emJaQnBlbVZKQXp3ejZ0STMxTmtxL3MxcTE3OTBQNVJlQTNaUU5WRlFh?=
 =?utf-8?B?YW8vY0JOZ0VYbVArVmJ3bks5RjJ2T210R241SHFraHRnZ2xpTC9IdSt1S3F2?=
 =?utf-8?B?NjdhaDYvQ01FOEFPTVlBMi9QY1ZBZU41Zlpla0szeXRqV2o1MFJheElSRjZN?=
 =?utf-8?B?TnVmOW12dlQ2UGFWY1VXSU1sMnJGRFNwbzhDMU5xRmo5SG5oS0RlTytucy9u?=
 =?utf-8?B?UkpkMnFnYzhMck1MV05xRGtSR250UkVWYkU3NEw1YW9IWEZaaEJkS2Q0aXhF?=
 =?utf-8?B?MHpHcUd4RlExd1BNWGFjNS82bVhGVzdPcGN2TmJhNHdLOGIxaGR2czFyeFlr?=
 =?utf-8?B?WTlaOXFIMC91RzBHd1ZzSVVsdnNoTWRnS1BmM0ptNTNYeng0SUxLNXh0emlD?=
 =?utf-8?B?YStwWlptODNEUmNqRjdDdDNjV0QzUE51VGlUeWl0UWFYejFDUE5UTDNCajQy?=
 =?utf-8?B?MENERkJQQklvdE45UXZuVmZacW4rQk9CK3Y0WWs4cEhneklWSXhYUjQvUUF6?=
 =?utf-8?B?QmRaenFxRmJ5UDdXUHY5Zkhma0d2K2wvbUxZNkpvQ09mYjVqUG9GaFVtMGF5?=
 =?utf-8?B?akJ3ZjZSQzc0MDVtelZXMm9iWnU5OERIWm5RYmRFNW9vWWt4NmdublhEN0FG?=
 =?utf-8?B?ZkNPaHRyaytqR25GaHVwTVh1eW5CeE5QYXRsczZGSlFLcmZaMW13Nm95cGNV?=
 =?utf-8?B?b1QwSnM0d04zcU5zdnpVREQ5cTZuMDZ3TlVZbEx1Sk16T2VxUHFiaGV0cjRW?=
 =?utf-8?B?R3pUaHUrMlVYN1NDVVdBMk4wNTBlSWJLTVE2WHM1RU9BcGNyNVNtSUJoK050?=
 =?utf-8?B?eHhVTHVCWSsxbkRHM2Q3Q0U5TWtVRWtuNHl1cy9uVHJ2Z1BERGttK1VsdzJB?=
 =?utf-8?B?ZmtoVThrSitMbXZmbWZrbXJLNExlWm4wZnlsUmxzS0NCU3N4QjloUldYNDkx?=
 =?utf-8?B?RUF5MUZ1WFg1OThMRlNNOGZzbzFvckROR3c2eFYzWVRrb05MbDBtdytTT0xR?=
 =?utf-8?B?N3IxMTJsU0NDNm9QeVNFWG5rMXNIVkMzRkdWaU9aTUpmd2JJRjZDUlVIb2lJ?=
 =?utf-8?B?Z3R6VkJwWXRYMmJXWG9NYXFmTGZERVBBK3BsanYyZ2p1NEdpT0ZEWlJjWW9B?=
 =?utf-8?B?S3FnV3BZUm1wZTNaZ0Z3RjRqcUZZZFBVdjhmMHpIQlArK1dxbWR5aUMvZ1JX?=
 =?utf-8?B?ZThyTXhxVVBsejFheng0KzFSRXo3MzFlcUNkWllKUWY3QVpTZUtqbWgzWlRz?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a191d6-6ed6-48c8-2a25-08de12672b8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:05:45.6127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UQkaFXkPZ3PTwDzSjJ+BVcejQcqiuxIVGLmxhiWbbo6bgo5VOJz1gmCrZrZqeLiORvf+XTn8/1rGu/XY29zKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

On Thu, Oct 23, 2025 at 09:51:27AM -0600, Lin, Shuicheng wrote:
> On Wed, Oct 22, 2025 11:48 AM Matthew Brost wrote:
> > On Wed, Oct 22, 2025 at 06:10:37PM +0000, Shuicheng Lin wrote:
> > > Add a limit to the number of jobs that can be queued in a single exec
> > > queue to avoid potential resource exhaustion.
> > >
> > > A new field `job_cnt` is introduced in `struct xe_exec_queue` to track
> > > the number of active DRM jobs, along with a maximum limit
> > > `XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 0x1000.
> > >
> > > If the job count exceeds this threshold, `xe_exec_ioctl()` now returns
> > > `-EAGAIN` to signal that the caller should retry later.
> > >
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec.c             | 5 +++++
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 5 +++++
> > >  drivers/gpu/drm/xe/xe_sched_job.c        | 2 ++
> > >  3 files changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > b/drivers/gpu/drm/xe/xe_exec.c index 0dc27476832b..722a5ac0200a
> > 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -154,6 +154,11 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> > >  		goto err_exec_queue;
> > >  	}
> > >
> > > +	if (q->job_cnt >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
> > > +		err = -EAGAIN;
> > 
> > How about an ftrace point if this occurs? Should help us detect if users
> > somehow hit this during normal operation.
> 
> How about use " xe_err_once" log to detect it? err log in dmesg is more noticeable.
> 

It is not an error. -EAGAIN is a specific return code in DRM that means
"try again." We want to avoid returning -EAGAIN to well-behaved
applications, while still being able to detect it. At the same time, we
want to prevent misbehaving applications from spamming dmesg.

Matt

> > 
> > > +		goto err_exec_queue;
> > > +	}
> > > +
> > >  	if (args->num_syncs) {
> > >  		syncs = kcalloc(args->num_syncs, sizeof(*syncs),
> > GFP_KERNEL);
> > >  		if (!syncs) {
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 282505fa1377..5f3219acec3c 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -162,6 +162,11 @@ struct xe_exec_queue {
> > >  	const struct xe_ring_ops *ring_ops;
> > >  	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship)
> > */
> > >  	struct drm_sched_entity *entity;
> > > +
> > > +#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	0x1000
> > 
> > Hmm, I'm trying to think of a reasonable limit. 4K seems high. Maybe we
> > should check with the UMDs to understand the deepest reasonable pipeline of
> > jobs they build — to avoid blocking them here while still limiting the DoS
> > surface. My initial thought that 512 or 1k should be a reasonable limit for now.
> > Can always adjust going forward.
> 
> Yes. Let me change it to 1k. And adjust it later if needed.
> 
> > 
> > > +
> > > +	/** @job_cnt: number of drm jobs in this exec queue */
> > > +	u32 job_cnt;
> > 
> > This needs to be atomic. xe_sched_job_destroy can run in parallel with the
> > exec IOCTL.
> 
> Thanks. Yes, it should be atomic.
> 
> Shuicheng
> 
> > 
> > Everything else looks correct.
> > 
> > Matt
> > 
> > >  	/**
> > >  	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
> > >  	 * Protected by @vm's resv. Unused if @vm == NULL.
> > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > > b/drivers/gpu/drm/xe/xe_sched_job.c
> > > index d21bf8f26964..37f58be7cbcc 100644
> > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > @@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> > >  	for (i = 0; i < width; ++i)
> > >  		job->ptrs[i].batch_addr = batch_addr[i];
> > >
> > > +	q->job_cnt++;
> > >  	xe_pm_runtime_get_noresume(job_to_xe(job));
> > >  	trace_xe_sched_job_create(job);
> > >  	return job;
> > > @@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
> > >  	dma_fence_put(job->fence);
> > >  	drm_sched_job_cleanup(&job->drm);
> > >  	job_free(job);
> > > +	q->job_cnt--;
> > >  	xe_exec_queue_put(q);
> > >  	xe_pm_runtime_put(xe);
> > >  }
> > > --
> > > 2.49.0
> > >
