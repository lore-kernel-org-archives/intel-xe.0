Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5459C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 22:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404210E087;
	Fri, 12 Jul 2024 22:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qkzj4eVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232C710E087
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720822970; x=1752358970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8hgDVs5fteoLDKvBw3OLjbWZEhBMFjK8+FU6r/bUeV8=;
 b=Qkzj4eVzF0fIx3HuC/7RxaPmY5cEAiX8AJvOKo08hnfQ6R6YBna52jz3
 h9omurxQ3EWMwmDVjcc7A58Qjqrx6fq+HYbanWrehOZqed06tVPuMK6op
 SpMTXaFmV08dhW7MoyWdImyCdLOSaWVvjZNxqmgakToCumDId/1YFncyp
 1BTGXywLu4C7L5EDk8aZdBuTmt+rJQVR0+x73idTXoxoNPRfq8MbIvxOk
 7uZ2+UWO/bNeo86IuatADv8IRe2w8Y0+sCbJthe728LyMieMRASbMkIag
 O1cSmNCc7LXKeMSF0hge015tbKswxObV30yMboW9b+AtDTktCiJScfHAu Q==;
X-CSE-ConnectionGUID: QAmG1JRHRU+Jsv1Wl/U7ww==
X-CSE-MsgGUID: FGbaXPaHR7eEgUSDQYbyzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35824499"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="35824499"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 15:22:50 -0700
X-CSE-ConnectionGUID: yZHpCaTjRbupNvx26hicrg==
X-CSE-MsgGUID: So76Vf0rRZu+sDZhgjIeFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="54225523"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 15:22:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 15:22:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 15:22:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 15:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9y/EYSntdiAbVJba/1F7tb+OBULL1cU3xUUZ9zoIU36N5W5mMYmahiQHSF1ka26xWqnTra5+WOck1c/ftfKYPFo04ANDtdnLH5ZTIYQEqmElB+qQRxMzjUE+2cQ3vbLqkpYjawgoTiD3XpAlT4quBVvj4GBADvXN1CHAyL3uBGf6ZaOn381p+4c6HIWgztdGa7wVvuncwHProfhlYzhUuAmGi5gsWP8aUCXuNpxKRR7aa4mVmVNiuwB4GJXUUibSbZ07qEnyBkhNaLqAtNerBsy1xwYppXUnPmwODyk0Amv2jTveWdA0YCJbtWfZhKlnG0yX1qgd4IuVmKGB58NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9g+9LMm2KGNMhE1wcXgBAWuq1tlRs1Ipm12LxwsEWs=;
 b=xKM7Nngual+xLUI0PbjpWfiYBTPCc0ROf9CYyVL/gOXPbLd2ICobdmGdmA6Efu4Tgqlh2tAV1LVkznJHu/+H5Zwnmm53caHtNN7BkCJow9pyJVplwuoPa2ewpaCSo/lQFCoyiTkYn/95CSyQK6gRC8nN3h5mLiv2I9XYFKZPs7MXpPBFGawGND5wFjqR6KMYeBhGC3A5nBVnQwnEb9xrAT7P7pRtM1bueRwX0xRGzFdLFB+oqslche+WNTHfWkYGlSz/ybfuBgD3R5cezbcPCOOvm0gTqUF7xY75UdJMSuRckfgGt7s5S38E7s9NIIE/K+OjKaX8F/nKhdXIcQMtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 22:22:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 22:22:46 +0000
Message-ID: <ce2b44d0-eaf9-4f00-bff0-170c4bcf5f24@intel.com>
Date: Fri, 12 Jul 2024 15:22:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/14] drm/xe: Make exec_queue_kill safe to call twice
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-2-daniele.ceraolospurio@intel.com>
 <ZpGqGUsECblGxJCI@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ZpGqGUsECblGxJCI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e499b2-8042-4b29-4680-08dca2c127ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1M1RFIzZnNZd1lma2lQQ1dCVDJ5YXFwNW8rclVMQWNvOFRnc0paUG5iZHBs?=
 =?utf-8?B?YzdCOVpDNDVqNlF6aDVhUjMvQnJaTWo4Zkw5ZWtVbHprNlFnSFFwWiszSzlC?=
 =?utf-8?B?Mk5HRFU4VE80bGdXRGdBTW5ocUpSSFQ2ZkNWS2RXb3dWaXQzMkZxYnMraDlW?=
 =?utf-8?B?SWI5UTVRMDJsamFHQkpVSFc3RVdSS29ZeFdOeWdheVVEb0tkbCt5ZVVLUGJX?=
 =?utf-8?B?VmsySkxyd2hWdVNHQmRuRWt3QUZxNTRlTWZmTjM1STVYSFJxQlVOUloxOHl3?=
 =?utf-8?B?VmtIUE82alhEVVE2MmpaRmIrdUo4SnRqRDRyZDY0Y0RTMS9GT0MyYlJaUy9U?=
 =?utf-8?B?WmJGeFFXQ0ZYbjJVeGx1Rjd0WS9kWWNyZmtleXZFUy9nTUxSRzFGV1hZVWJQ?=
 =?utf-8?B?bUYweUpNUHNhK2xLZTNGZGdkOU9oSzNGbXlhYXROR1NqUWF6R0R5ME8wOFRE?=
 =?utf-8?B?NlFReUoxT1ptN3Y5MThuTlVnRUo5cW8zSlhyQzFkQnA2NVV3TWtSRFlERk02?=
 =?utf-8?B?UnpkeWRVd01UaDR5aE84SHVocUxTRlBSTEtWWk5wYnhNa1F5bkNKUzZkUjQ4?=
 =?utf-8?B?U0NjclNoeXJJUTZQOGlBQ2xQSnpnUEhhdTF4RkVhN3NSb3dEOXprRGRkUitC?=
 =?utf-8?B?VGVFU04xd29BbUtITWhRWmVWUU54Umk5YzkrLy94MlZHcEdhWlE5Tm5xZlRv?=
 =?utf-8?B?cWFDV0NZNE0zbVg4SE93bnJWN2RWb3ZNSnFZRVc1djg4REd5WUFCMVNGYTUy?=
 =?utf-8?B?dVpHZUZudjVCSFBvSXB6WllTOFRVK1JSSHdLc1h6WEk5OGdXVURsTlduUWpB?=
 =?utf-8?B?U0M2K21Hdjd3bkRpMlRZV0g5S3pMTm1mMDFqanpoYkZGYlkrOFA1S2JDeFhs?=
 =?utf-8?B?UFN6cTJ1dStzS0c2YmUzSTV0SmtBMmdCR0I0bTFOeC9vekFYNWo5MjJXUS96?=
 =?utf-8?B?SjZDZzRlWDlTOFMvWFNYamhhUW5WTXNCYU9QQVZmRHVIVkRwN2pkSzk0OFc4?=
 =?utf-8?B?OXhUUnR0SkY3NVFzTzVYMytMcllBc1V0aDVTQlRTcXd2T1ZkaXFtaWdnRkRJ?=
 =?utf-8?B?N2dvOW1vUXpkVjNidFJvU2pXd0ovTjVPTjVGTE9WMENZdUd4T29mN2pSazM2?=
 =?utf-8?B?V0FuZktsVDZGQ3p3bnlJK0EwdG5SRU1ZY1JiaTYybTYzY2l4WWY5UXVyY01K?=
 =?utf-8?B?MloyS0hvcHpRakVXWCtWSXdxRTN1czdFYWhqTE1oUUJVOERCY291Ym43RTgv?=
 =?utf-8?B?NHBDTFM0OUVXNjdBQnNXbC8rRVFTOXF1cU1HRGVsTDNJL0hCajhGZldzTSsr?=
 =?utf-8?B?MENkT2R2ZlpBSitIcmpHVjJMaUlEZUk1R1VvUGMwU2p0RVlLOTBsL21od2xJ?=
 =?utf-8?B?bzN0WUhtcStrOG5VTTVxaUo4WC9RaitUamRBV0g3cUs4NWwyMmxiR29WMHlr?=
 =?utf-8?B?d0trWVVOanZGTmRxc1lpbVl3aFREbndRV1ROUHN5MFYzSE1QQk1VQmJHcTJq?=
 =?utf-8?B?THkyRCswWi9tR2QrZjB3OHROQ2srN2hKclYwSG5VNVJZdCt2Tmw0SHErVkpW?=
 =?utf-8?B?V1VHNUFrR1U1VWE2YzlXQUlkVlRQV1RmV2tzRnM2eDlrNTlaVWZLMWF3QjNv?=
 =?utf-8?B?L0Z2dmtUSSt3UDNOVjFzd3RwUXo5VFBkKzN5TXc2a0JGMjBhZ3I1U1NUczMz?=
 =?utf-8?B?cGtpak9SSDRqNjBDYllQWTJ4c2VDb0RodlQybGtENkNpNUdjV3JiUnEvcWF4?=
 =?utf-8?B?ZmQyV2VDQS9MNjZyQ0RvM2NrVTgwV0NpK0ZkK2pkTkY2eFFSaUVielJYRzZE?=
 =?utf-8?B?WjFCVFRGQ0tUN3J2cUE0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGlCRjRZdDZCYkZEaWdoV1RuM0RMV3puRHBvNjluelBwcGpySzJmbm53LzV2?=
 =?utf-8?B?bHZZNjdGSENpUE5tN3J4WUZtWCtid1plRVRkd1pYR2JhSWMza2lFZzVKSDFs?=
 =?utf-8?B?Smw5SXBtcXZkTFNkUzUvRmtHTFBnOVYzWjZkRDV5d3Y2U0pvaC9zbGEvUCsz?=
 =?utf-8?B?TVV6YWZ3YitXVEFEWkExbkdhTlgwRERZNWlGbVY0VWp3bzU4YTEzNlNWNVpJ?=
 =?utf-8?B?MXJOMkl0YzNFRkpNSW5CaDVPb0FQR1NPeFEwaW1NekpjWW0zSnpxaUgzd3VT?=
 =?utf-8?B?eU5KNTR6WEs3WG5Obys0anRmcFN6Ty9tKzYxdEd6aiswVXFqMDF4VHdsTHpy?=
 =?utf-8?B?Y0s0OFI3c1dCNkZJNVZqanNuWTBsejRVNWdnZU9VOCt5VmlzRHlMZTR3Kzdu?=
 =?utf-8?B?aVhDRHFIc0M5SHFkUW5FOC9zaGF4QzZCRDBhWTUrWWd2RXRBcURZVloyZGlS?=
 =?utf-8?B?ZmhqNDVwU1JVczYrUHo4TjBGUjFSQlpQNGZldEE5YWpUNEhjR09vdDYrWkpk?=
 =?utf-8?B?RVYwaVVmSnJTdjhJZGxab2VhVmo2R3BCTDZiWC81aTFhenErckUrMm55L3c2?=
 =?utf-8?B?WFFPenJuOFZvWFQyZVZxRENhbnRDa0xmMmlyTlR0VTRmbldWRVQ4cnNJdVdn?=
 =?utf-8?B?NTFjcnlMd2U4WFllaDNSbjVGREJUYis5b3hIWUFWalFlT3cyWlBLN2ZPci9N?=
 =?utf-8?B?VHRtRlF4R2xPbnBrWFQ2cE0zaWxSaWhzN2NvMGxHY2l0QUtiZHd3VWZGNVE2?=
 =?utf-8?B?VGhLSXZ5ZDFNSnZYemc4SGRMbS9UK1BvNm1QT2hzTk1wQzZjY3ZhNWsrN0ZU?=
 =?utf-8?B?OWRnWmxJRnZpK00vbmN6QjAyL0ZRZWNwQ1NhQzY1ME9ramhrKzN1azVpS0tL?=
 =?utf-8?B?OUdEYXFGK1FxRXQyc3FOL0xWWU14UGE0bzBtWjUzNHdMMGZqQVV0MmFkMlcy?=
 =?utf-8?B?Q080OVZWNmduZXc5MTErSnFCWkVmOVo5Z2dHODJjUmtRMEJGMGYvR2UwcWJq?=
 =?utf-8?B?eUdoS1VNZlljbTBSbmlFS3BNQnpRK2F5TGZ6cEkweFZCQkNiZFk5eUsxVHFm?=
 =?utf-8?B?aW5NL1cxK0RldjJmS2NkZXBWWXI2OHhDV2pwWW1kY0VMT29jbXlNeVhCd3M2?=
 =?utf-8?B?cjFjb3JGMktJcW1NbytGalpueVpISks3Y0lPSDNMN3BCSDBGVmhRRzhyNHRv?=
 =?utf-8?B?Yi9uaDVSN2hRdVZabFRNMWlhNU5BaVZPa0lNS0hsZGNtSWVJTTl4aXBUaTlI?=
 =?utf-8?B?eUpJS3NwdHl3VTUycVJCNVVWd1BOZm1rS0FweCs5cXFzRCtQVnZiS3pyTnBw?=
 =?utf-8?B?Uk4wampqaUo2NndBK2JhR25BdkVkajFvZGJHZHpvMWg4SGlOcG1JcVJjOGI0?=
 =?utf-8?B?RW1BcXNCN2FvVjByaWQxUGplVDNOZ2QvZWMyT0JseGErSzhJMVpTek8zVUs0?=
 =?utf-8?B?NG8zeklUUll2bFNkSzJZeGRMaVZNSWJ2MVdoOXZnKzlwMWt1WnNPbUhZMm85?=
 =?utf-8?B?VEpNc3hVMlRQc3JZbUxOaDdGTngrYit3emhueXBWSlJJd0Y3RGZIc00xekh2?=
 =?utf-8?B?aFcwcHVaMHFRZTFSOTJuTlRUUVdmYitWZmdFTkg3SU83dTFZbzgzUFhwZUxZ?=
 =?utf-8?B?VlZlK3NkN2dCTjIxSUdXUWFoYk83aUR5OFRRTEhFQ0hSWFZjSnc1V09TcmJH?=
 =?utf-8?B?Z1U5OXhnc01rdTFGT0Exb2dLa0R6TjdEMHJYUVVjVy94T25JQnh3NWtrSS95?=
 =?utf-8?B?STYydnlsNWsva1crZUtkOWdkZTgrRHkrRTVKWktabkU5ZldRTmF3SnFnRURC?=
 =?utf-8?B?eVZMckM2YXExblM5ZEY1em1hV0hmR3QwQVJ3aVd0ZTEwU3BVZUJDQ2RxNkhN?=
 =?utf-8?B?eTcxVnVQWFJpcUVjMzlhVjZvWWhBMGFjMmpXR2dWNUdmUW11c09aLzFxODEy?=
 =?utf-8?B?MWU0Y2ZONkFVa1NYUnZDM2owd1ZJNXBGZytxaFBwdE5MbHhhRE5ObjlPbWJr?=
 =?utf-8?B?Z0tjYVQyeW9CUDJRZXBlOU5vWG90NnhGclNzbXlBQ0p3UW1zUW1Wdk5jUS95?=
 =?utf-8?B?WHU5TUE2aFY2cWNtSlc0b250emlUejhmb1V0cnEzelR4andkQy9XMUNjbERB?=
 =?utf-8?B?WHk1elJsV2dNeVVCOEhmY1phN3R6eHp6TUZ5aWgwZ2F4VUJOUi9ETGs1WTVB?=
 =?utf-8?Q?mTxrjPZJYss2awEsHn9fOrc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e499b2-8042-4b29-4680-08dca2c127ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 22:22:46.3166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zo94bF8ux/LIFL4s6gHxrBGStts5y0+JG99tUveSrluhzyWE8LolI1w0ihONqf5F/g93/5Nm4tjWXE0bN2RVGkzeU+v/9RzLNDhGZA3cSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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



On 7/12/2024 3:11 PM, Matthew Brost wrote:
> On Fri, Jul 12, 2024 at 02:28:45PM -0700, Daniele Ceraolo Spurio wrote:
>> An upcoming PXP patch will kill queues at runtime when a PXP
>> invalidation event occurs, so we need exec_queue_kill to be safe to call
>> multiple times.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> Not opposed this patch but is this really required for PXP as PXP queue
> are not in LR mode are they?
>
> Either way, I'm open to accepting this as xe_exec_queue_kill probably
> should be safe to call twice anyways.

Not required for PXP, no. I just really didn't like the idea of calling 
a function twice when it wasn't designed to support multiple calls, even 
if it didn't apply to my specific case.

Daniele

>
> Matt
>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 5b166fa03684..02f684c0330d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -280,8 +280,10 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>>   		return;
>>   
>>   	down_write(&vm->lock);
>> -	list_del(&q->lr.link);
>> -	--vm->preempt.num_exec_queues;
>> +	if (!list_empty(&q->lr.link)) {
>> +		list_del_init(&q->lr.link);
>> +		--vm->preempt.num_exec_queues;
>> +	}
>>   	if (q->lr.pfence) {
>>   		dma_fence_enable_sw_signaling(q->lr.pfence);
>>   		dma_fence_put(q->lr.pfence);
>> -- 
>> 2.43.0
>>

