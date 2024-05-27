Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2368C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 13:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0310E0B1;
	Mon, 27 May 2024 13:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMavXSIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7D10E0B1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716817924; x=1748353924;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=U3rS2g25A84NMxB26bYjp6KJKiGzgYGoA2gIvpkp1qM=;
 b=mMavXSIxGAp5KMzLwQx5L2jgjGJGDVzre6CblaF8M5C0cqV/PPWVYNxo
 XxEns8OfVMBo0RAvYRD7NPa410rUvJKL7zBES/Vqg2zXBAhy1/Ybrv3HQ
 a3VbjvKN/l/3WWnzRSUVCT2l44qH8y0MFdwbXnPRMFrWNgRmgvf7h8BCI
 002MZi/USkQVKf7UXcZUi4N2MnAh7TZhRkObt2cX7Jd2RWoSyUCHSVhBV
 SttTiEmeP0tINU2vXzBWxzuFZ3hGK+TciezMR50l8jRM45EnjNCNq5jec
 yyHPqYfidIguF6MGByTee5HBXw7yVNTWp/rvjw/tl3Hc4OSHSOs+Si4F+ g==;
X-CSE-ConnectionGUID: jWmy+0b4Ra+UpKmjNjo77Q==
X-CSE-MsgGUID: yKNj8eGlTxuYFoPCU+p6KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="12968186"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="12968186"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:52:02 -0700
X-CSE-ConnectionGUID: d1FTXre4QG6+gR7c0OAjzQ==
X-CSE-MsgGUID: QEnmjlUGT1KpnltdSQzc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="65567255"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 06:52:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 06:52:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 06:52:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 06:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXzEfnKLjQLU6ZpbE5wQcIVNsWuhKi0jBafEa+8NUczU+rVE18CfGACHeGCNyyZ72fjCNeSq0sJCinFjl6HSpD4Zqjtm1zLA8WdbXopiC11Ap8Qjhnm6+hIctoYv71znLo1RAfHnaulykxHK8EjtvvykCY9rHetZepqkBELhyxBiAqdz3whooKpTtju448lOR8OO8cQCg6wdsJLjb8NGiv0R0dzbSFWTd3yZ6UkhRRNst3k0zXePX8WKoEQt/2hpDM0ro5Qbim7ygEnL0xW4iU/pqfAUVkt6Fb4555lFABuGhbeNBOXj+AivUxZDk4O0ExDvOMgpViw48oPQbtA5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk6wU4ZCIW2bF4C+C0Z3ssn1+R9CQ23pR41MIYGuEWw=;
 b=QQU/y5d/j3osYNCyoZucIa4g2zdxGsGhXWXf8pBKon2kwGjI76DD9md0qNwypNSZLSzu1FJ2mkMJGdNii448NNOOuN5r3oogMHyBY+osI+Y0Cps0TZ1yq7QxA65z4YWd7Y77/TBLz9DR5JO39qMSjvhW18GV3jGwveU3yzjBcBFYPxphGW7CBZrdmq2miW5x+fEBAKOt2ETTf1waZZOxYzMbbe9hi5ZHXmilOKU7Ut+2rpqnIX17m9znoa6CK7LgY+OOR+h/9X8rYGhzjI4bsJwojj0REAJyXS5qX+f3ZDAsWm/rPvaInrYPZAa+UUnKzZ3MlF9zqeTAyGGjAQwDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Mon, 27 May
 2024 13:51:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 13:51:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240524230444.1447797-2-matthew.d.roper@intel.com>
References: <20240524230444.1447797-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Don't refer to general LRC initialization as a
 "wa"
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 27 May 2024 10:51:53 -0300
Message-ID: <171681791387.20659.612633389107203888@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0b3a66-346b-46ad-1a08-08dc7e542d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUliTUluQkxITHRHTlU5U1B0dG9iRS9UNkIvTkliNzZ6K05PR0FwM2dJcm1P?=
 =?utf-8?B?eExDSDJuc2sxVHRWdmpDSWx0b0o3cDVyckM3bUtzRGtXQjJ5STZKZnZVSzFJ?=
 =?utf-8?B?QUhBa0hYczFCUGMxKy80SmpVeTB0RXdnSmorQWNEMmJJZW9PTzh5blUyYURX?=
 =?utf-8?B?N0hOL3Qwc3FLVjJVZ3JvZ0FBM2NpOVFwa0lsRFQwb0tUeXhaOTUvWDVhd2cz?=
 =?utf-8?B?dXBtcEZPalRGa3FMa0ZwRDEvKzNacy9FdmF1M2wvWGI0Q2UyMitXd2JoblNP?=
 =?utf-8?B?S2xGUW10SjUyMS9KS0RBYkZ5bDk5aEsxZTBFdDA3ZHY5dnNWU25oTU5BSW1G?=
 =?utf-8?B?Q0x2TnBib1IyOHNvTXRVd05zUy9wRVVoSU0wUll2V0dKa0t1MGQrR1ZFQlh5?=
 =?utf-8?B?Z0hmZEZxcTF0RVFTK2NWTlg4ZGtFOERmSTFKYTZMQnBBci84em9CQU5nNDlO?=
 =?utf-8?B?emFVby9tVWRkRHVXSTlHR1VHK1RxbGpXcVppMTVPQlFBdCt0MG5lUXdZLzBX?=
 =?utf-8?B?alViOUZhbk5GSjQrc2IrQU5nelZGZkY5U09SUnVobUVYc0dGTWZYK01BdnNm?=
 =?utf-8?B?eEhqSXNGSU1SR3U0ZjFFVnJ4b2JLaWlXMiszM3hoeUdiWnJmZHJzdjdBWEJr?=
 =?utf-8?B?TWUxakVxUGs4OE5UK2xqQ2RWYUo4K2V2eVc1c0hIazJDUGNCRFFpSitGRzFs?=
 =?utf-8?B?N0M1Q3FXN3lVM2dSRmRUNjN3WDNTRTZPRjNIYm5pNEpUbTJoVi9nRnI1blFB?=
 =?utf-8?B?ZG1JQlI5Z0haRmJqVHNUSzZjZHJLaUJQTHNyOU41dWhybDFlcUo2b09WeEFW?=
 =?utf-8?B?KzdveERRbU1HV0Y4L3Y3VDhiYlVDd0g0RFcrM2VjcldlNnZSZHRyZCt1YXpw?=
 =?utf-8?B?MkZhYlhCK2VwRllQZkFzNXBkbkprYndsQ0pLYlpPVi9Oc2xWQzVNZEh3Vjk3?=
 =?utf-8?B?eHdkVGRZOUZVZTV6M0JHYVNwdEhXbExNeEQ1TlRRbVphNXd0YXhNdFBnZzMr?=
 =?utf-8?B?YmxQUHd1TUdLallRUllQVmp4VDVRcWpDckFFd0hiaU02dlkyb3JYY1VaWldF?=
 =?utf-8?B?blowSlo3N2VkUk9WSndQRzY2WlNzZ3NibmZycDRvK01ZbDI4emdDOUFaZHJj?=
 =?utf-8?B?czdLV0VuRU04VDVEejRhVzJKUlppcFlIT2JLZTdiMzNpc3VtMCtWVllDNmtx?=
 =?utf-8?B?a1BpRnAxTDhzL2RFUFJ4cUlaallYanBlOFlRVE9aYjBvWE5BR2NYYk92TU1I?=
 =?utf-8?B?cjNKL2FZcTgrbGF4ajlMbHFIWVZOL0hoZzArSDRuZEgvOWlla0ZRbVR5TGpn?=
 =?utf-8?B?K0pyV09MZUJ3VUYzT080UkRreUp2MTlsOXRzT2JoNFNvUGlqVlZpVUppTmFr?=
 =?utf-8?B?bkpwdm45aHpHck5tY3VJZ2VLV2NabkpiY0REKzBlUzZibWhaTGlHWlZWVFJk?=
 =?utf-8?B?UEI3b0E2cmxiWVZmYk11L1diK2ZXVmp2TkVKeldKaHdFRTdUNVFCTW9WUDdi?=
 =?utf-8?B?KzcyWFV6MndLZXJGTFdaNGhWYTA2Mlo1SjluZmhBRmZ0L1NsalYrbkJHNXFv?=
 =?utf-8?B?TzNyK0hPWXVwWHNSYjlQL2V0UE9RRlpOZ2dTMWtLTjhDZ3l0dC8xUzRObHBj?=
 =?utf-8?B?bzhFN2hWcWVRS0tMK0p2Ump1cS9ESzIxa3BGcEpLTmkya3lFeHB3R0ZpckZ4?=
 =?utf-8?B?b1lXS0xvTDBuQmwvVmpWdlF1MHpVTnJxd0hUSTVlcy9vclNBbVAyYnlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVxY09seUsxTFluM3YwZHNLZm93djBYZFllUXplM1QxTFNzdExESjBwcTlP?=
 =?utf-8?B?UE1vaWVwZ0thcnBnTGt0ckpwU0FSTjBIckt1b0h6ejBjS1NKYjJScVZTODJl?=
 =?utf-8?B?YWtEZStFb2llb29DNkkxZThhaVhIUUhzKzhEYm1UQVpYUnllSUx5a0xXMmZ6?=
 =?utf-8?B?YWxESnFtOW9nUFdIMUxvRFFXdEhZWGEwdmFsN3lXR0g1VHZvVHMxOVNiOXNn?=
 =?utf-8?B?bkRvaElPZU15dStVbEpGRXQwZytCMUt2VGlVWlpKOEU0QysrdUgvWGo1UHE5?=
 =?utf-8?B?QjBCUE1Ucmt1TWliSFdzUisvZjJTWDNuYlNuK3lyVW9WazFjYXpMRTRhYUZ4?=
 =?utf-8?B?bzdFbTdJcjVGS216dS81Rk9WSytlSVVsYXZ0N0VTWUJkNDNJWmkzT0VyRS90?=
 =?utf-8?B?U1VuK0JsYU9jK1VHT0gyQ2g2UkFPTUFibVZBTW5scFhXSUFtdlB4YjBNOG5z?=
 =?utf-8?B?MDQweFRUc1BJb2xWS2FITW1Fb2dOeG9XUCtPdGZhaDFQK01JSzNuL0dtM0U0?=
 =?utf-8?B?VkdOUkFTSlk3LzRzZXgyZ3JYTUFyc2FYejVjVUdiZjV0YWNoZlEyaTF0b2hr?=
 =?utf-8?B?eXA3QURmQkx2aWJSMGZVVHhIR2s2UWIrMlR2YU5oanF4MjhnQzBka0t5YUVo?=
 =?utf-8?B?NjNNd3Rqb0xyOFFZT09pSlBtRTZUM1dvcEpLVC9DMDE2SXc2VFV3S1p2Yytv?=
 =?utf-8?B?eG5qcUFrNWxJd3VxeFpkUWNhNjJDY1hVQXljYTBBd1pXUUFvNC9nRmgvWFZJ?=
 =?utf-8?B?M0o4b2RmWXFHY2FDYWZVaWw2T2l1dkw2M29hNnVqODZQVDZHSHJOUVZiTkJK?=
 =?utf-8?B?VmRqeW1FMUg4WjhYUmdQTEdKekgvZThGZkNzU2FTRlVUWnNkY01zT0JTK0RV?=
 =?utf-8?B?RkNqZ0JucDYvY05VaXNoNE0zeTFBckZyMEZyTTN0VFNhMGxCUzI4VTZvV3Jq?=
 =?utf-8?B?dDM3RDE4OVcvRS94bGhVQmhlSjYyVXF2QXpsOGF3K1ZYOTBEaHRQK01oeThy?=
 =?utf-8?B?WnRWVFVmUmxrMUJuWThvYzlVa1hKTzJXV0FIQ21kQnIxdXZGSlhjQjhMcDZT?=
 =?utf-8?B?UmpmOGIwNUtWek5zQWt2ZnQvc2tBUE5uTVJEV1Y5NTlCVENlMGRiVmdVcnVU?=
 =?utf-8?B?elVBc1JsSk5SUm9JQUZEejRoOTg2Skp4SFFvRmRITWRvMDYvODlMVFhTZHBZ?=
 =?utf-8?B?eTR2cGxsaHB1aEVKMEIxOHBKRE1KL1o3ZUptQ0RjS0RhWVhuc2huam96SW5I?=
 =?utf-8?B?VHVKMEY0eW1BcUR2cDhPenJucGZJak0vZUNhbFFBN01ycmZ4UjVCUzVRNUpJ?=
 =?utf-8?B?RjBRS2lKVTU1QzJsTVpvcVNDeE1QOW1yL0NYaXZJNXRHbFlYSGhzRHExbGJL?=
 =?utf-8?B?SXg2WkIrdldLS0hvcGtvZ3gyRGdzU0EybXFFZE9JenVTOGN5SzRvcXdrTHNG?=
 =?utf-8?B?Y21VWGRidE04Q0FsTzJockZ2R2oyRDdwU1BZeTd2cVNvTXFZVlJtRCs3cUln?=
 =?utf-8?B?MHhTU25yYWN5TVhRZnpwTi9YeERLd2JRUVhJQytnSmY1UktXNUNncmMxcFJ6?=
 =?utf-8?B?YWVGOTNKR0VPOU5td3JwYjJ0LzRhb001b2diQUlPVWtrUlVQMUY2cy9kNkpp?=
 =?utf-8?B?cE1yeXdZS09wOXZSUjZOeUY1em16ZFVmUGE2Zi94RzhyeDdkYm1rUW80aTBk?=
 =?utf-8?B?SFN6aU83b3hVd0tBSEVHL2I2RXUvSW13SGdKS1JaamtYNUZwOEU3S1p4L0Qv?=
 =?utf-8?B?QmUvZnJUUnZjVXNXT1N1S29SUytXdXlZL0JSSngrbEc4RU53ZXNveVBxWHRU?=
 =?utf-8?B?cmtFUHF2ai82ejlTbHFNcWlTL3ZCTEI5SnZVK01lMHhFcUJ2V3hCcVV6NzFm?=
 =?utf-8?B?Wjg0d0RzYVVFZ2Iyb3VVQTZPM2xXTTJ5WGZISE9vUGRMcytWRm1IcmNZT21K?=
 =?utf-8?B?SnJuUVVqOUpxY2p5QysyRlljR2cwR0VtRkVYZmJFQ3RCSzJHM2R5bDlNbU9H?=
 =?utf-8?B?SThCcytDaVVQbytLWnIwdW9YdzdXWEdSMDI1ZEZ3ZlMwck41ZFFMOXBnSlZJ?=
 =?utf-8?B?dEFmd3g4alVHN1ovMy9pOTFubWpWYllIRmh4U3ZnV0FwOU5RYUdKZDVaTTJI?=
 =?utf-8?B?V0JGL1BHOWZQdWthS1EwdHRsZlAvNFFIV1Z0c1BEdmlyb1ZsUWY3K0x1a0lF?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0b3a66-346b-46ad-1a08-08dc7e542d90
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 13:51:58.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBLVAOaoHQ103fFnAi2kzaG59SB2f+LZVpUM5gPp5T2tWq/72RIuHo4qKaPqYCqDyoGQwmJFVl130LsA5xC8Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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

Quoting Matt Roper (2024-05-24 20:04:45-03:00)
>During engine LRC initialization a number of registers need to be
>programmed as general setup.  This programming is not a "workaround" so
>naming the RTP table as "lrc_was" is misleading; switch to the name
>"lrc_setup" to more accurately describe what the table is actually for.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_=
engine.c
>index de1aefaa2335..9eef789be897 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -342,7 +342,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engi=
ne *hwe)
>         u32 blit_cctl_val =3D REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, moc=
s_write_idx) |
>                             REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_=
read_idx);
>         struct xe_rtp_process_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(=
hwe);
>-        const struct xe_rtp_entry_sr lrc_was[] =3D {
>+        const struct xe_rtp_entry_sr lrc_setup[] =3D {
>                 /*
>                  * Some blitter commands do not have a field for MOCS, th=
ose
>                  * commands will use MOCS index pointed by BLIT_CCTL.
>@@ -374,7 +374,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engi=
ne *hwe)
>                 {}
>         };
>=20
>-        xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>+        xe_rtp_process_to_sr(&ctx, lrc_setup, &hwe->reg_lrc);
> }
>=20
> static void
>--=20
>2.45.0
>
