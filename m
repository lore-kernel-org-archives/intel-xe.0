Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE520D6AAE2
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 15:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8616610E004;
	Thu,  2 Apr 2026 15:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bu+XuPP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B876310E004
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775144454; x=1806680454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ry6KrQK2hKJ36qRDrTpDMfqxOn3Yc7QbtdHWqMboz6A=;
 b=bu+XuPP0MkzI1JIE8auOSg1myH1Q8LKXvLVEcSRC1ynYZZJ4Yaxp2uwU
 uuzYz/lcI53VHIrNc1UX4KxIFRbwcaEHBOcD2tKoIvk1Emh57E6ISJxb9
 4lE4aCVKDQt9bZZJnw0nnhXHtPT6icmlR9tcyxWdBFoi00NM8y5sq9lCC
 f0JgShypbnqdpmfsNp3WGYErZqyWyu4JyGx3fv9PyWl2gmYcZDfpr6fHP
 SO3Nv8nACy7dLahJ9lzW0vvfYVh6MnBzdRPvlbpG5GO09WwIVusr25+x9
 voXqoxQJ8NfSXkStp/sVYOYVCmYqFzclBpSZL+MMiTQs/tNLqrBHqjlDz Q==;
X-CSE-ConnectionGUID: gfoxQkV2Rbep2KfwW8TwZQ==
X-CSE-MsgGUID: 90rXAmf2Qx6JWibHNxNHbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76396171"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76396171"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:40:53 -0700
X-CSE-ConnectionGUID: NJR0ySDgQSW641ufJHMblg==
X-CSE-MsgGUID: PwZEzMhOSB2HHYauUvebcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="227270771"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:40:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:40:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 08:40:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqyzXhkkyQMn4izwNuV0j7+P8GpKrdXxckg6U2Ba7Mxuv/fFRhNFmjSgotl1vI1ITRwrt/ZK7V0JC+BHHAqRICOOS11ceZAltQVHDzW+OOjOdXRL6Dv73iSgBdC+/6jRvT8R9J0yv16yWTeYGUo2Dll6HkuDYXgDnsq0FGppGyZTKCRscZ/GVmCipEQqEsAX7mTE7lRMENWbVjfqgOnLxlfvxB56AgraxpPiN1/zj0ynKdzzrwZKHGxWqrsFWPQcBmV3IHMZLOBEn2XHaSgm9Yc+EbTHWMSGkXI+fQ9Tave7dieSjVFkokJhCvVho++4wlFF8ZPBGsjKUvHY5l2Hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsAsPXWcsj42PhnbO3NsMX+p/4S1jzy1m3W87Tnzouk=;
 b=kFdEMoSu/I+MarjFvr7kqyHoXtn9AswANsaQ0wkQ+0Fcr3sUugC1iGEWgj8R6hjvUmIi/sF5tkKgx/6lT4JC2WQaFLg52WxvHPz/JfkZsE/fZx79bkpIJYN0NfWn9yLzr6aRMYEMfJZwGce92fmPayyaWrK1Q5L9+cuzLdS5ZsQpO3RZ1/R3WoY6WGCf+xJxxKDqRMAkhPqpQLa8RpfImxBv2hizcNSbroyQycuJNLQ0ACoeDupGppjVtitsKdXgeGuqR+hKvywYNU2/Uug2mHXswophbKqiTkiEfS9GfE/8PwxVH/u4/42RJHOfL3CwmT1N4my9pLH/Q3pN8ZBrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 15:40:48 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 15:40:48 +0000
Date: Thu, 2 Apr 2026 17:40:44 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/13] drm/xe/pf: Extract helper to show which VFs are
 provisioned
Message-ID: <20260402154044.ogjcwp7hu224zku4@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR02CA0045.eurprd02.prod.outlook.com
 (2603:10a6:802:14::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 122156d5-fa15-422c-4279-08de90ce3662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 31WcrRezIT+7UadTC7M1Iwy/QYIcee4iBMdIwYllvAf2RRse3gaR/Jduk2nt2M3sKaovaGbUglAKWqxNEjiZuYEAwswZWiRxrMG919u6Zi/1cryrLSzOH4QW7duquuq1PNf3IbccBmxltbEKlAXmqpOpejsl/zgXQIsTLwHyuYWGCBypUYTl0NlLb6XUEke7V36pCWrRIkB2GKtw2obakusiSN/n+VivR3WHE7RmnCIpqCpMbqjJnKW9gNDhVVO7P6BGHj2P12WBxeqxwIz5zDnS8vJ371TIRLn6BULCR0UpqfC1likguTFM42694od1o1H32CkfollgoTmF7oCybjQusuPvRCvw72moZrvQuWQavfJHGcxJlMUKTEkZ+tgNe2ph6LYqell0c7ASF5Y9G1Ki3lArXOb5xf6gPfnzSOhsmMJeX5rwIFEksWZyl5oU1dXrHMcv2ym31YhZkRf7e6+gBOQMoOl2iuXRUJJKWeOk9JNl2Q/9vCJaG9a0D5ZTVM94Gc9AsxGkWHyaPhjQypPSr5tnG4nLKkoTx+HBOOE0wF+eKlaXhvpzmQV70lhXw0Rbv83RCXBzTNkgSOhsxteXxb8veHxN3CQyAjYfYkafcAMtqIFt8lHUWJf1J7qI2C3EM5HuqvEe1j7KrSz8vyTSVYI/yDMJWR4Y5vPxKVn2JpYX2pui/4YMkkMBL1KXB5RhMtS8CuQmazMQIQbAPD8ojofUUGApaEIMv17lk9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzdlYWd2WTZKajM3K2x5MnlKU0JteEJmVnV0Tm1qLzVWSmxOeHM1VWd4dDlV?=
 =?utf-8?B?TUdnaXBlRFFsbE5TKy8yazJkaHhVYWJxdEZNNTIrcGU5NzZCQndBQmxJRnFO?=
 =?utf-8?B?R1ZzWm9SU3daTDNIclpENEVvK2ZoQ0g3VVZmblZxTnJBRG96OVMrdXJJMllP?=
 =?utf-8?B?NTU5amo4cEs1WkplSlBiYlZwTmk4Zkl0VmRoMnFibmVsSFZzZDFRQ2E4Skx0?=
 =?utf-8?B?UG95VnBlRXhwT21NemRKZDYrNmMrbGVrMGZ1NnJhalhTb05nS0hLZWhCaHdi?=
 =?utf-8?B?ZlZJMzlobDFNcmlKUEVkdU1QbVQwOVdFOWhBa29RYTBqa245MmhSS1piT0c3?=
 =?utf-8?B?cW5kc0EyYThMVkw1KzJCQWJDWE13ckRmSHFhdWMvU3BMQWtLQVIzQkFEWklV?=
 =?utf-8?B?U3VUMWhpcysvUnZ3Yndyc0xhanJvRndSV3JEZ3lQWW5XYUMwbWRpQ0srcGVZ?=
 =?utf-8?B?bXBRTXpHTzRaYVhzNTJHenpxZWpmMFpKdWJtakFzbTJGaTFuMjVVUU55YkJj?=
 =?utf-8?B?UTZXcmUrVDBaZ1l4dkFZUkxqemxSdG1BMzRZdWFya056bldiMkR2eitINUVn?=
 =?utf-8?B?RHl0a0RRTTZhaWpMUVpZeTMvWTNwWHZaQmRHNUVrcXlGSkxSc2xsNEcrVFlC?=
 =?utf-8?B?T0ZQMUtCMXYvOFFBbEovSm1VOGtzV2lOcStLdFg3anNVU2w2dVRwRXVuMmcr?=
 =?utf-8?B?LzFaeW1vYWMrTUsxbjBveXNyWEpWdXduUzBvZ2JobFJGcDIyTmJzZWNXbFh1?=
 =?utf-8?B?SE45cWtkeVZLSHFqK1NJZnZqVUhkak5Xb2RLSXA2YXFvamJNcXVpUWdLNUZS?=
 =?utf-8?B?eHZZOUhadlNLZ0M5MnpNM0N0bldmVStQUnV0RDY0VzY0c2pabEVvMXFnZVpW?=
 =?utf-8?B?YklJZjFvai9NTStoSURybFdsQTIwRGZKY0dRMHE0cjZkeWJiL094SDh1dE84?=
 =?utf-8?B?Mm14bzlid2JtSmxaRis3SkE1eUx4RFBBcTVBSDdBSFJ0NG5xNFRCMCtvV3Vo?=
 =?utf-8?B?eStlVXArRUhtYm1vYTBlYnVTeklTa1B2ZCswNzZaeDBuaEc0UTRLdDF4TE5i?=
 =?utf-8?B?RkgvbzF3L1RpckkrMmVIeHJ5V2M1bHpjUDJidE1nc2V5NU5XeUpwMkl5Sjcz?=
 =?utf-8?B?K05mY0RCd3gvK1lWalRHcGtsaWNIRDJ0aUsyRXFlS0JGR0t6VFAwVDZoeGpv?=
 =?utf-8?B?dDlLOWo0WjBLK1A2bXYwSUZZR0Z1a0dJMHk4SE1BbThkY3FPUmxtazRwZGFR?=
 =?utf-8?B?aFlKTTJFS0JaazlEZDI3ZXJFTXIzOSsxNUNCYys5MXBmZ2haRDFobXdXM2lN?=
 =?utf-8?B?ZG50b2M1VjIvRlVDY2pnVm8rNVEyM2ZsKy8weHdLZ1FWUlVxYVFlMzBQTWVn?=
 =?utf-8?B?bHdMY0FSUDJCV2FEUUtZQzJwR0F1RTNlTWw4dVlDRWJVWGhVT0Z4RFl2QlJK?=
 =?utf-8?B?Ymt1TDh4L1p4K3V2czZ3bnJCeFpjdDdlOU1qb3Rod2FGV1BkS1JWL2p0c3kr?=
 =?utf-8?B?Szc4a0Yra3VVby83UzgzQ3ZSSUZlQ3BWTDVoVWJXbnJEMlVtUmorT0hsT3ow?=
 =?utf-8?B?ZitiU2daSHlNcWljRzY1WEl5U3dZWGMrNnNGZmJmN3VMb2xRWkJuTGMxQjFz?=
 =?utf-8?B?SE1qL0lXVlc1bU1xU2RzcFBReTYwRVV5N21NRDhIM3FsOHRJSXl2NmFOcXJV?=
 =?utf-8?B?MzhZWDJHUWRZYnRhWUdzM2NHM00xdkRxSWlHWHJpYlpMSnJUQ1Ezdmc5Wm0r?=
 =?utf-8?B?QlVOeFBUbHRSaFRxWHRGRjF4MEZaZDZjOUFPYkVDNTlhRG1NeVpuY0hnVGZv?=
 =?utf-8?B?Y1NNUG9nWHppU09JNkpLYzFLN0JwLzNZaU9TN3BFOERFanArTkZkS0o1N0p0?=
 =?utf-8?B?QWxkbnpIQmFmcnE4UzUrMUpVc0FXN3BNZ2VRR1RpYjU4dmlIV0gvQlBuNDZN?=
 =?utf-8?B?Skl4NGpOM05QMHBHbWxVbVowSG9yaWVUWlBObDMrR09sOXd5UEN4Um5rYUgx?=
 =?utf-8?B?T1lyYU1nMk5nM0JqSUFRcEJVQ0hmb3V0UGdYNE95cDNtL20zMmE0RDg1Rjc3?=
 =?utf-8?B?RE45dEloQU0xV08vRC9wdWdLcDlmb3RVT0ZQSEZCN0xxd2p2ckZwak5pOVUz?=
 =?utf-8?B?N2UwT0lUUUd4eEJxd09yenl5OVdUdkc1anpEL2IycFRnMkdncy92TE1Fd0Nj?=
 =?utf-8?B?M082VFZEdGZxaVBlMkE2NXdQRUs2UWpwU3IrSU80YWxEVjY1U0xtaG1RbnRP?=
 =?utf-8?B?UFMvWXlXalp1UExIUFZnazFzNU9BeENLVHRxL3dHSGdBcFRaamlwVjIzRXVx?=
 =?utf-8?B?OFAzUjFnamtCRFZ3bFRreDVSOWNFK0NrVUZqMXN0NVc0V2pBeE44bDR3ZnFk?=
 =?utf-8?Q?BkrHVVUFKcvbHOik=3D?=
X-Exchange-RoutingPolicyChecked: NVS5rNSW6hw66hq02KFU3z8aC+op1iATeJMATfz7gwpbvPqFVxP2F8QGMDqkOctYNCpcBwhgdPWsvzjC+nFj9LecWWd6Y/lLp1og/aNUlOYa1bCEFG6gGjY9wrf32ajEh2LLmM2VhG0SoMxrlRS7yeUZBObPBpWMNwMZ2OEswiqsaTEbKsXYYtj+T7bLsSe3yRErAfJ6TjWhz3vjal1rpgQvMAxIkXL2hA5Fb/Vc8Awct1F20o2PpCcKz54hIBr0ZixAsCekA492JjL+njMNqxM6wtRH2XQo4WjPX7tKvl6roGXcr4gFi3NXcqHJJn1UH41/VaWuz2kpCC+ItRSIlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 122156d5-fa15-422c-4279-08de90ce3662
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:40:48.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP+sg6utS0TJAVo9442N6EqSEW/dQV7IQHX3bXTmatlCnC7nypxUBBby1i+5Hu+Knt6DHu0kNKAzcBw4xVm4DjarpoVj08opx5rouEBFj5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:42 +0200]:
> In upcoming patches we will want to show which VFs were already
> provisioned with resources other than LMEM(VRAM). Convert code
> from the LMEM reporting function into a more generic helper that
> can handle both u32 and u64 resources and can report also PF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 +++++++++++++++++-----
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e673e96a147a..680ea73d1ce3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1934,29 +1934,45 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
>  	return ALIGN_DOWN(fair, alignment);
>  }
>  
> -static void __pf_show_provisioning_lmem(struct xe_gt *gt, unsigned int first_vf,
> -					unsigned int num_vfs, bool provisioned)
> +static void __pf_show_provisioned(struct xe_gt *gt, unsigned int first_vf,
> +				  unsigned int num_vfs, bool provisioned,
> +				  u32 (*get32)(struct xe_gt *, unsigned int),
> +				  u64 (*get64)(struct xe_gt *, unsigned int),
> +				  const char *what)
>  {
>  	unsigned int allvfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt); /* PF plus VFs */
>  	unsigned long *bitmap __free(bitmap) = bitmap_zalloc(allvfs, GFP_KERNEL);
>  	unsigned int weight;
>  	unsigned int n;
> +	bool pf;
> +
> +	xe_gt_assert(gt, get32 || get64);
>  
>  	if (!bitmap)
>  		return;
>  
>  	for (n = first_vf; n < first_vf + num_vfs; n++) {
> -		if (!!pf_get_vf_config_lmem(gt, VFID(n)) == provisioned)
> +		if ((get32 && (!!get32(gt, VFID(n)) == provisioned)) ||
> +		    (get64 && (!!get64(gt, VFID(n)) == provisioned)))
>  			bitmap_set(bitmap, n, 1);
>  	}
>  
> +	pf = test_and_clear_bit(0, bitmap);
>  	weight = bitmap_weight(bitmap, allvfs);
> -	if (!weight)
> +	if (!pf && !weight)
>  		return;
>  
> -	xe_gt_sriov_info(gt, "VF%s%*pbl %s provisioned with VRAM\n",
> -			 weight > 1 ? "s " : "", allvfs, bitmap,
> -			 provisioned ? "already" : "not");
> +	xe_gt_sriov_info(gt, "%s%s%s%s%*pbl %s provisioned with %s\n",
> +			 pf ? "PF" : "", pf && weight ? " and " : "",
> +			 weight ? "VF" : "", weight > 1 ? "s " : "",
> +			 allvfs, bitmap, provisioned ? "already" : "not", what);
> +}
> +
> +static void __pf_show_provisioning_lmem(struct xe_gt *gt, unsigned int first_vf,
> +					unsigned int num_vfs, bool provisioned)
> +{
> +	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
> +			      NULL, pf_get_vf_config_lmem, "VRAM");
>  }
>  
>  static void pf_show_all_provisioned_lmem(struct xe_gt *gt)

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
