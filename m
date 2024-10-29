Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7883FD7494D
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 23:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465DE10E3D1;
	Tue, 29 Oct 2024 23:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWALs0k9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FE110E3D1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 23:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730245728; x=1761781728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rsqZA5MLZsjXOwWHIJMh1bxSRIK15Gh8alh1IAzu0MM=;
 b=OWALs0k9TIzcDAKZvyvFGQ2ZGaPHsuoMWgtiYQJ9UdiTZDFg70wyx2h/
 a4Fa1SNz6zns+crxhRPjivSfDKSsSNhW7j3FCmU1y+nynZF+EiynDlOhf
 9raH0XbGld9dIqBpu6cc3kUX+BbbsOKUpS73ziyMyyZRPIhACNTyeDbZd
 cgPf4NzmVoSe2Y2LvZ+og6UhrYqQkQwUa8fugTxUlBXpYciXxLWnsIqF1
 8j6KNEtPde+58wqTG3kIfybi0RQXZssnETjdoclfmysdizFGCWYmoNQNY
 eDt6bSb9l46lChdU3r5VT6gRe920g63QrSzVnsEQT5+OuYKrF3nvp69hd g==;
X-CSE-ConnectionGUID: ky1Mt2f6TwuAciMXVv05Tg==
X-CSE-MsgGUID: Pe/d5zfXRrKi3xckJuAsJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33720714"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="33720714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 16:48:48 -0700
X-CSE-ConnectionGUID: uEFVFIpJSamn4PHKMfRbrw==
X-CSE-MsgGUID: Vv7mqS+1R5mu4BgMIPZ5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="86072617"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 16:48:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 16:48:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 16:48:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 16:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlDcebxEKTedzn66hfTHJZkCKk2gvMEnM85Z7vZgsnm63P5KZZwM8d8h3I3vx3Qdx/gJdQobdk9NdN6BPuDEzNaWXskYL8Sl0UvjDqgzamSVHEdRsby8Htft0uPqqOh62UI+n3I3auZsAy1dleAOnGzvghU2hl8zuYCAtt7G8fXVJTbiBHp3KQHuKT/w5hIvTXrmEKNQ+LjZ8910qbTnm/PbkKxW3YuiCZqHUf18K096JC7dAplMkaMXG14SXsoIC6yUgCmPoXwtLMWL0ENgQBsof0w7o951nzkDzq8EyTAtCeCeKAWC2ltFw0NzZA1S8qV7DFLbRZzXun/DnIiDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+0nuTllJt6uTMOly5q7cgkpnLl3U0eMyVy7pdpfE9c=;
 b=LM5NcBZYtf0fNSaXEaD/Fmcf6yALx72B6icKSGsxjJh/8LeIdwW9fTbuhe2Fq8UaGlxu5YwiA754zBqch0LwNulbfwb82+v7gWVsW2AIY6jZSBIMy9QqGY1SvfE3MbQPqpMEESZl3rMjihM+AgFr/AFnBH6+DAvvRMy/ncrhaNke2at879HS5fTD5xc6/TKpW+MB+AhQeLuTb5Nt8CJ/uSQ9SI7jGP05nJnhLU7YQKDX3QeGFO+Vj/B+pLnMOtZRG4b3ZQ7olOXYtTbkI9Y/eEaMarfGXrjr3GEkjAdbEx3ZyuTE5T1ZEHq2EnlQiODk/DTP8I3g7zhH+x3hRpJ+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 23:48:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 23:48:42 +0000
Date: Tue, 29 Oct 2024 16:48:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 0/4] drm/xe: Fix races on fdinfo
Message-ID: <ZyF0WH+jt7SqmTCE@orsosgc001>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241029214351.776293-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW2PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:907:1::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: e14ac08e-07b7-4329-2a3a-08dcf8743858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2RKaENwQURoT3ZFTHpYbDU1Tisvd2cxZ09qMWhFbGl4UTluZ09jK0doY0xh?=
 =?utf-8?B?dlBQZG5jR09kZ2RaRkN4dFk0T1FBYzcyaFQwUW5XM2Jmdmx1SS96dC9hUStp?=
 =?utf-8?B?V3cwTEkyUytCNkl3M1BaNVB2SGtXTVlxUkE4d3RiM3VLaXd4c2MwdVlrN0pn?=
 =?utf-8?B?S3h3RmxTU3ZhREg3bEs4YXFKeW12NFNKUE1BRXlDVm9iWEJhQXRlMUV4eVBE?=
 =?utf-8?B?YTl4cE5xZWRteHNoQlovWjNPdjVoL0llWGV2aTFIOE00eVZxUmRrUWFGdmNE?=
 =?utf-8?B?NFlHK25kN0pjcjMrT2hPTEtjUUZyMnFuQ3YreGt3NEpxc3hkL1V2MTVFMVdy?=
 =?utf-8?B?OE1BMDVYUDZWd25vNXJ2cEZUTkk4aEpIUytWZC85Wm84V2cxbjlpcUZXaHBl?=
 =?utf-8?B?eUxiQUxtcStGcEFzc1ZCdGRWWlBNUDBKK1Q4TzErZ25mcG5rbWloZlg5bkx3?=
 =?utf-8?B?TTFMUkJtd2ZLWDBvM3AxRW41em9aQkl3ZlY4UzQwQlNQY0llRVp1elZUMVVq?=
 =?utf-8?B?UEpySm1USXhUOWtyVUxRNEpCUUFZWXF3Si9mb2tycmZYeXFoajR3TGRMWmpv?=
 =?utf-8?B?QVMxcjFMS2ZDOGZiZmxHSUQ2Z3pzcFR6T0JjNFB0YWJwQzdPMC94K05zbDFT?=
 =?utf-8?B?ZTFqMldFcFdEUmx0MVJSdmpBZUZNQXVWdEg4TzlCR3YyTTN5SjUvK0RscEsx?=
 =?utf-8?B?ZFZQZys0Z3hyc1NHSkpQZEdTR0o1K3RMZjVWc2d6ZThYTkF6QmlBVm5aMXBG?=
 =?utf-8?B?OUlIZ1NkWWJDb3NQVVpzSWFXWnhud3RkNExhY2VrQWdsUWhndmN5NldtV1Y4?=
 =?utf-8?B?c3doY2JWdnBzWGtjTGVyNEU2YndBQlpMZHAyc3V2aVNUVDh0OU9CTmFJeGVX?=
 =?utf-8?B?eGZzVkRIdW5ZQjRUc1dRL2p1QjZTZ2tzQUJickxLY0xOOEdqVW9yRVJDSWZS?=
 =?utf-8?B?eXdjNlJpc0RHNlExUmczTkhRSXp2Um4xZk9aeTI2WHc2dU50TnZQWFhuNG1F?=
 =?utf-8?B?QzN1VHlKTnVpN3IyNUk4eE5jSWhxODZiRXZhcWg5TU9hVHFtZEQ2WFRlSUtq?=
 =?utf-8?B?ZTN2M2pDVGhud0JGa05IYWpCZDA4QmErMUxKK3RQcVZnYW1sTWJyci9uNVRW?=
 =?utf-8?B?S3JVWWM3MjR5Q2daNzZYcFhYajB1Z3NRejdFdWI1aktoRUtDUjdsMnBxVFRQ?=
 =?utf-8?B?TjJjTWlSUDVlTDR2dDhrZ2JUYzJ0ZVp3aVhqM3ZIZ0tlU2xsMDNFVVNoSC9m?=
 =?utf-8?B?Q09zNFBTMjhmbHNFNnQ0Y094VVRFS0VFUjBMdzl2THBHWWpmNFZqVU1ZNm83?=
 =?utf-8?B?Zmx1OVNjdkRsQmx2QVcrK0JjUFlSMGgvR0wxc0RkbGt1VmtQcEt2NG5SZC9H?=
 =?utf-8?B?dVhkVVVOYXNtNVdiYndUd0hPNFF5N0xlQnBaaWYzSktoSDBLOVVzU0paZkZ2?=
 =?utf-8?B?VGZla2hBWkMydExFc2gxVzBTclpaOFNxWklpd01JU2VhMllKdzJZQnIwZmF5?=
 =?utf-8?B?b3EwdGNjSGs5N2gxNEVNaE8rS0pmK2VEMVJFZnpDS0MrZzhERGdQMi81aFJ2?=
 =?utf-8?B?a24wNWlHWE85MXp6V0g4TitCd2FyQUtyVUFHSHo1WFlZOTkwcVBSdFN3NGV5?=
 =?utf-8?B?R1Yza2hScWM5QWdtbWlEaDN6VUE1bWFHaWtMd1dtbW5wVXBoS3Naemx0L1FV?=
 =?utf-8?B?MEpwbHgvVmV6aUpzWHlqSkdOU0s3VnNMNllXc1Myd242SVVnZEVXdVFHeXV0?=
 =?utf-8?Q?cBFZ93d827SD1Tb+GT1vdywJFTxFLvccn8LPdH6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3J6L0FUdEtoK2xBekpSMHBwTmxPS2h3RHlQMVd6QVY0WGFleHZvOS9IUzV5?=
 =?utf-8?B?RjJyM0hiaG1Pd01MSjBEN2dWMUhHY1NidHlIT1hCRXBjcnZjcWFCeW12MGFo?=
 =?utf-8?B?MEkyMDdqcEJaT01PTmdib1Y1UnRheGloeDdoT0pUaWRuVGJKcGtWZFZRb05y?=
 =?utf-8?B?YzFEMmZyNS9CODA0VXJKMVdmM0ZTOVZZWDhVRys3R2t2M2VLTUp5bUZIZ2g4?=
 =?utf-8?B?QlVrWGwvRXpGS2E3ZlpKR0ZqcVJHbEhhZUV1V3JPdkJvbHphdzlpUS9nbWJM?=
 =?utf-8?B?VFpnczdTdW50SkpTa1llcjRsSGhUOVVhTnAxMDhEMzFmYzJLNWVNVUhxL0pa?=
 =?utf-8?B?ajlvRm1CbkRuaVgxbTNkNEpGT29sZGZUUmk3M1JTKzh5bXh0TWtiVVcwb1Z0?=
 =?utf-8?B?L0Y0dzVzckROS2w5cktLMVBvY1R0aElzdSt5TzhIalF0NUVLTDlTRkphcFRo?=
 =?utf-8?B?RGRseUcwZ2hOSjBtNmpSdTF4UmNEalBnazFKcDRsWW81MTk4c2U4cm9DTmh3?=
 =?utf-8?B?TXU4eUwrSEJaaUkxb0RLTGJpMUNxZHRmRUlDMVdPUzFyVnRodlJiMnk2U0Nz?=
 =?utf-8?B?UXVIdEwzRlRUYlpvM2h2YjZZSWhTRXVRU1RtbHNHQ0dXQzYxUTcwdnZ2MHI1?=
 =?utf-8?B?YUNSTW1PdzIyQ1RmVDFWUUhuVmV5SmNwTXRBMW9RMi9lQUUrVmwwMVM5Uk96?=
 =?utf-8?B?eHhVOER3bWtCNmo2QmpkQkNkVldROHhJQ2FSczgwR2cxT0t1OW5icTJSNDNj?=
 =?utf-8?B?dHhwTFVPTjJldjhtNXRHWm9lak93dGlwYUpydEVNanZ6UzBwRE1BdmFjNXZn?=
 =?utf-8?B?VDdZRnd0NXdTRDkwRUowSFEvUUd5VkJ6anYrQ0JRbG1pT1MvL0ZvMUxUQ01W?=
 =?utf-8?B?bEd3SDNWOUJtRXBGeUgvei9MZ0VXWnFJOUVwTFRPVHhsNGFoWVNRM3FpZmhM?=
 =?utf-8?B?ZmNHQmhXZmhNdG5OV2JmNHZpZnNTb0s4ckdnUVI0RHdrektNNHpETXpIc01D?=
 =?utf-8?B?SFk1bDdka1RvOWtFM1pOOTM4N21tWS8zbW5GMysrWHZUWXRVeHdtRU9RSUdi?=
 =?utf-8?B?UU5ObzZnOG4wekx1UVpvc2hSSkJ3R011TElUTHFEcXE1MXZONUpjTmlrMVRC?=
 =?utf-8?B?S2htN0lKTDFxclhlczdlaWxuQkZaQk9uc1QwVmFYSlJZUnhPalU3Y0JUaFJl?=
 =?utf-8?B?bEc2VjBMUnFxT3BmQUJsZnVxSjZQSVp6TDNadXZtTk8vWnNpbkkyR0FIMWxD?=
 =?utf-8?B?NG1DZ0FRTis4ZTB5NHpyVTVwZi9Ta3VROHgxMWoydzJpcWwzOWJlcmlGeWlk?=
 =?utf-8?B?cmhBbHliZmNYSGxQaFo1QU5LMW9mZjZJSit2b1lBSjJvdEczdzVDUjBvNW4r?=
 =?utf-8?B?K1dXTDlpbllKbFJGTEp2N0VaZlduOHl5WG1ldkluaUZJek9VTFJmUXF6SzlX?=
 =?utf-8?B?SjhlS2I0RlAxVDZ0UFhRWHdlVG9jWkVLVmU5UzNkOWFWM25TemFud3FWVnpC?=
 =?utf-8?B?bXIzV0s5RHU3cGN6Y2t4VXVmR3E4SjFReHlldlA4UlpDSG9kS1JrQTlEWFNs?=
 =?utf-8?B?U21mSDBzUGluSU1FL2hyc3pZa0p5dm91RHNpQU9nY1RaYUZHcHcyTmNuWURX?=
 =?utf-8?B?bFdGZ0dsT0hzQnZnaG1hOTQ1K093L1Z5R0lyYlhBRUR4ZlpiaytoclpKRzJz?=
 =?utf-8?B?eWVONzdDUzZtRDNxYkVLbXVXWEZxNHZReTVUTFFoYlltenltT1MxaTh3UFJB?=
 =?utf-8?B?OVlUdzkxd096MnhNL1VhRnZuVE0yQ1lHOEk5aFlBQkJXdkhialpIL3FxcGlw?=
 =?utf-8?B?aVMwcTdPbGNuU3pGd2tZVHZqVmtQU0ZPYmtITnkveVlKSXlPRi9QM0NJWkNU?=
 =?utf-8?B?cVdla0xGUkg3Mlh0UmhSeWozRXJnRjJyeGZxcmhyODNaQ0lzT3JWRW5HbVoy?=
 =?utf-8?B?cmxkKytTWEpnQzRTamFBeXY5cVlaYjJNTDRrU284NGNpc3BnRWJwSlZYdXZG?=
 =?utf-8?B?V1Y0Y3ZMM1Z1WXpSWGpROTdzclVqOGFwdTJJSUVEcXE4djE5Y2x3NHlFVWpk?=
 =?utf-8?B?WWxZUEUzdk80ZC9aZkZCbEdiaFRaK3JxZ2lvZytTTFdHZUk4QStEYW1FeHBF?=
 =?utf-8?B?VWpMemVNamVLdFB0MFp3OHRnaFNSdDg2ZGdtNDkwd0dIamhwVnI5dWxzZEo1?=
 =?utf-8?Q?wqIHo20EJcmQ9aafEbhqDUg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e14ac08e-07b7-4329-2a3a-08dcf8743858
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 23:48:42.6880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3Zh3kmNe1MX5pghcv/Kpxb5dW8ROWqg+gEGQ0U+Xe8IEE0dOTxba2LM6zQB5wCduOS2HylDeTpD4xp1cB/BT0d0cV8HQXa3oBZtoy/l6V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

On Tue, Oct 29, 2024 at 02:43:47PM -0700, Lucas De Marchi wrote:
>The current reading of engine utilization has same races. This should
>fix most of them while also drastically reducing the update rate needed
>on "normal apps".

This series addresses the above 2 issues, so for the series

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>I left tests/xe_drm_fdinfo --r utilization-single-full-load-destroy-queue
>running on 2 systems and saw no failures after 100 iterations about
>execution cycles being 0.
>
>There are still issues calculating the percentage load - while I have
>one additional patch to "fix" it on an idle system, I still can
>consistently reproduce the issue in a LNL machine by overloading the CPU
>with `stress --cpu $(nproc)`. So I will leave that for later since it's
>a different issue not related to killing the exec queue.
>
>Lucas De Marchi (4):
>  drm/xe: Add trace to lrc timestamp update
>  drm/xe: Stop accumulating LRC timestamp on job_free
>  drm/xe: Reword exec_queue.lock doc
>  drm/xe: Wait on killed exec queues
>
> drivers/gpu/drm/xe/Makefile          |  1 +
> drivers/gpu/drm/xe/xe_device_types.h | 11 ++++--
> drivers/gpu/drm/xe/xe_drm_client.c   |  7 ++++
> drivers/gpu/drm/xe/xe_exec_queue.c   | 10 ++++++
> drivers/gpu/drm/xe/xe_guc_submit.c   |  2 --
> drivers/gpu/drm/xe/xe_lrc.c          |  3 ++
> drivers/gpu/drm/xe/xe_trace_lrc.c    |  9 +++++
> drivers/gpu/drm/xe/xe_trace_lrc.h    | 52 ++++++++++++++++++++++++++++
> 8 files changed, 90 insertions(+), 5 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
> create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h
>
>-- 
>2.47.0
>
