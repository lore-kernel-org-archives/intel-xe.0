Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A517DD3941D
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 13:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E3810F271;
	Thu,  2 Apr 2026 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAHt8VSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C778810F276
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775136811; x=1806672811;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k3UwtubHvU0iYNxstO7/xOTTjE0S0BdHVeUnIPRt034=;
 b=aAHt8VSeJS44Ok0+C00llXV3blPVYTWiuHloCrdNmg1+jN8tiSSOK726
 pXlBbPHHYjvb6/QY8CTpC4ufqtxm2sAru9kmPYEugR0lJDuyhSor/b3tI
 3EWTHdx4Xf7YQzXG2sASXYav/j8qXtFLjydrOKV89IykacLlk2D0NeemY
 QSlfNDQBOr5pVIEYgRIwRlsfXIFB8a8V7s/I5q0hJotXveZJHy0dpMWJn
 /NedTq+7eXSNm0TUiupbCS5Ub+TkB1YJCkF28IlS9WYExRcTLMAFZhikj
 x06s7tgRhE4ZpkcJ4j/5fvMPuTDZ82741My3WL1UbRvNzPUJU3VX4jy55 g==;
X-CSE-ConnectionGUID: MQ00WqaVSNC5VsxDtQf+uA==
X-CSE-MsgGUID: CfU5nq2bR6e02w0IdjX7uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80054895"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="80054895"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:33:30 -0700
X-CSE-ConnectionGUID: +wAY79iXSWGlDhyUl9KrLQ==
X-CSE-MsgGUID: xZcW0c8MSGSdQ0vBnnFL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="224120850"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:33:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 06:33:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 06:33:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 06:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy9ZbkwA0aot/FMp2ZtlKwo8CPlZKbA7Ywr184xh4HGablQaCmX4beiBuTmXHczrxwqKhMDfCWe6qksR7roXsligFIBvcBFtANmeI7WV6oNF6DEBT/JJ8djGjIiMy2zNzFjqPeIbvRnZfODcmlGWzCwTVRUOKZfaxk5n/82rsGMgzetmXY3TK6fhi4/UYARkDMPnlby43ujSYCUNI8dBRSrNCGkdeyDEzALHNA/ZUnwQ4IwmU+g9+FlejXTM3xBXgQ+x/Fn5mVvDNhc+a+5nhEfZgoj4oEr4O4/tG6GNBgRd6PFySkWLGQxj/IoAfeDoOdO/hDWvs4RcFZZof5OdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6mijoAmiP8ol6Bs264h67wocRi0n8mQtvrcMNjXbLk=;
 b=lRN3BRLkU0xj2pbIOGM/UEe2aovG7HmDfccXvn3jxLUa8KfANCEHGfQWMyVwtw/PYlgJijhWNmwC7YCA2FXYnR1jY54exxBUGqU89+Z64km2GhOrneKbPgyC9JtlH9ky0MzzSUvS3EM8XApoXpXNceh/yG91rP1cRG2/GWCYMbZpnrBawXI9tGo94eOj8ZhYZpcqVl/FpsIJHcFOPNVqZ0h7WZIcMviWsnRP4kKA9YsOAnqKYCzuFkxitgyYOHkXDZdTaHvLOQE5Hk8H8ZJNxrMPcre8gT4nGczmW/n6/5XgfiRaiLn6dG9hl6XwbAGmvNIBaODXlzRQblFYk405Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PR11MB9398.namprd11.prod.outlook.com (2603:10b6:208:576::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 13:33:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 13:33:24 +0000
Date: Thu, 2 Apr 2026 15:33:20 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/13] drm/xe/pf: Allow to change sched_if_idle policy
 under lock
Message-ID: <20260402133320.vrpt3bnnwttsbv7p@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI5PEPF00000916.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::935) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PR11MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: c16209db-e5b9-45e2-dad7-08de90bc6a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: dLIPXi+fzcJKYLQ43q2IE5dBsRAgJks8jh65pnVOqYdCTfqiwCHzb811dUrs2ejgQAPd7abmlWf80l7eeGT6P0tXYzwAAXS5H61U+LOf/p5JWXk0LMhEZrfmh2nCzrb/5DUmUoVtTDPQl4mLnHHPiUGE/nOK/wqmRwpg2bGQPWm67/K/JgxX+t4XpzjUPUZzCS+vGB5FO201C8u5Zxy+/DMiqdkVq3PBTyZ2bT69xcPLix/JoYnntJzbzF8IDgOWf9bFT9r9YEr9fogamuTMjcCt1tus9oCp3rHEKJfSxUg6KbhROqoAmCseATlhBe6sqvrk+hLeRe+BI6QTLt65gnZjCu4HVyqHY77vi51jHXROzzpO9UEoOvqRtmZkg7Z33mOEwdGtZtnFMoGolzeYi0O3VIL1WaGY/88km1/ZIjIsCSFOsRyqfQ8cUNBx5/LFQO/l2fRy9XaUiOXjPI0SOdXFCqEyEQrZZURfipV/6z+FuhldOG3vY1Hhs/mE4I/lQzpMNOSUzouPk2rI8ZahfVFRwoGWKcmZZum9sJLY6Da4oVtBvSzv/Xim5A0b6xJhcwHVRiumaV89UhI31r41YcU3ig6ZEJdJ/MTimT3TZ4zjgi2zz3WDJo55gKpkwr81bAbndAyto6aEGcE3fLePe7wOoSGWHO9zDyiubk8462v1ZlGo+nS3LX9TwUF/2fFIhr67Nnz5pzxCOKjM5OIraIHz0xHeH8u25RKwgzezcyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNmbmV6TWhQdjdndk9MT2xUOFFFeUFibTQrZE1OVm4wdkdqK0xGdjZRSkJU?=
 =?utf-8?B?WEMzb1ZwMkRjSUF5ZFFxdXN6Nk5ISnFKSDVSSFR4V2krbmNRWXRJWlZZMU1q?=
 =?utf-8?B?bHpXYzZaY2wyN3l2amRtVXkwalBuaTdiRzdNcjcxbWtpQmFpMUgzQlhRQmJI?=
 =?utf-8?B?UStLWlVNbWdhNDd3VGlPeHhyUjNaNUUyS3N2eUUxT3JvLzczcHlCOGVNa3NO?=
 =?utf-8?B?UGpXNzBpYkZCTzdnUDAyK1B4ekVjK3I3dlpkSVZIYzFOZUJBOGtwRUNkZzhL?=
 =?utf-8?B?cDd0RXg4S0FxZWp3d1FxWmpyQTM2cWp2cTdoMThQK25obG9ISktWcDRLR1JN?=
 =?utf-8?B?Qm5ZZWtpOExNZGtuUXpzS05jelIxZ1ora3lFWjFzV3QzdDFmVjlwa3FmTklK?=
 =?utf-8?B?eDFMNFF1aTNsRERuRVByN1BIUXNuckJWMDM4ejRRT1pzRHZVTllxbzlZckc4?=
 =?utf-8?B?cmVCN01WRXFxTVhkTUxmdlVVY1E5R0swakxRTVAxUWtGSCtHWFBYWUN2WVJM?=
 =?utf-8?B?cVpTS0hESUl2RzFOZXdxOWdJTE9Gb2duZHZxV0srcTZPQmd6RDlzVkEvTm0y?=
 =?utf-8?B?K08vb2h0WDB1RmJaUzlIQU5kbGxpVnBKbEVaRzQrZHJ1QVdLenI4enl2ZVhJ?=
 =?utf-8?B?M2xlc0MxVGdQR0M1QXdxdFA5MGpyNW9KcHJ6YnlZNDk0WUhra20wVmhKdGRN?=
 =?utf-8?B?MCsxcFFlUlk5WER0NXpiZVhSV2RuaWJGNmJKNkN1WDRPZS9PMDg2MlQ0Tkpt?=
 =?utf-8?B?bmlMUWhsSUR4UDdmWnNzM2pnRStXbmdlelJxQ2hUWm5Pd1djKzFOeDFuUXJB?=
 =?utf-8?B?bXRoWWFKc2lJcXIvNGY1Ym5qTEVCRmNXTUVPQWpWcDIvL2xJNklJR0lBTTVX?=
 =?utf-8?B?NVlTRDNiWlZQb0x1amJJMEhZZ0w3SFlHSDVmOGRtWHFhODNad0QrMWUreWVW?=
 =?utf-8?B?OHZKZkl5cllSbmdFQW9pV2xCTlFScm8yem43cGtsZGMzd2lWTjhBR1AzMCtk?=
 =?utf-8?B?MUVVaHZwUFJrSSt1TlQvcGdrZUhhMWtCenM5SWVVcDZQamh0WDBYWHV3b2VI?=
 =?utf-8?B?RUt6Tk1SaWEyeFhtU1hna3FoQ3V6eVRBbk1IREhOYi93L0dTdkRmN0VkeUhC?=
 =?utf-8?B?enlhYm9VYlFXbzlxR1ZrK1M4ZmJRKzIyaVRENVQzQU9rZDMyZXExU1pIRk54?=
 =?utf-8?B?VlJlb0lQN1lhWncyVXZydk9BS2hyV2dJU1FWQ3B2UXRncXZxNFE5c2RMN0tu?=
 =?utf-8?B?ZGtmNFc3YkdQS2hnby9XZ0ZFdUNNUXAzMnBIa24yOHRad2RPUUladHJDOW9K?=
 =?utf-8?B?SStNVW1FajhoZkxhU1VIMk4ybUZVWHBEcFJKckFyREQrYmpta0ZSZkJRUEJW?=
 =?utf-8?B?NVpFMURLOFVwd0dpM3JkQkJpbTRPV3pRbjlPZWt0VnhsbkZnUmpnV1BPcHBQ?=
 =?utf-8?B?SzU3Zld5blQ5RmdYamppZ3phRC91dWFLS1ppYW1aeXExbEJoNTZabkNnaEgr?=
 =?utf-8?B?N0RrOTRoL3BsekVxVTRBU1ZaTk9xREVPelpPSlgxV1NPUG1ySzNqNEpJbmY5?=
 =?utf-8?B?dEJ3NHdFM242QXdGd0hERGpCSnZMRFlmdklBR3RMclpMRzJRdkZ5UUhlWnZS?=
 =?utf-8?B?ODJNSis0Qlh3MWlTbUkwTmFRSThyS0cydmpQb1N1R1B3ekhocjgvbXhHem9W?=
 =?utf-8?B?aVR3dXVmWWw3anVpdDIvUmwrNzMzZnM5STcybUVUcjRIRjZKZnFQUER3QnZZ?=
 =?utf-8?B?SWV4Z2dsYmNkQ1k2L3VqNUU4MDk3emlTWXNTYW82TG4yaW10MnFXcUNhb25Z?=
 =?utf-8?B?UlFUemd5eVl6WG9kTU1DT0dudklGdGttMTBPS0FzamFEbFhuMGtYeS9LNjhs?=
 =?utf-8?B?ajNPUk5pd29vWnh1cnl0OTVhdlZ2N3JyRnRwOThnWVJkWGdOTkxSVWNHeEw1?=
 =?utf-8?B?Uno1eG5WVGtDN3FRbldrbWdSYjZ0bHpBalVPNWF5Q0tJSUE2S0NHSDRTTVhj?=
 =?utf-8?B?b3g1YUVJWUYwYmgydzEwcFF2S0g0ZHdVWlFnejV6R0NiSi9laGRoT3lHN2VF?=
 =?utf-8?B?Y0piUGNsL280SkJHZ3hzNUtCL0J5ZVVqTmwrb08rMXpTdU9oalllQ2M1NXRL?=
 =?utf-8?B?b0haOFJYMEpvODdEZEF2OFVGOFJVM1I4SytNN2tXdFVzK0dFK29NUGxFTk5R?=
 =?utf-8?B?WjJ1YzZZQWJtRXpxV01GRTl3bTdBSytkSm02eDZDOEFLdEF1Mk1scldQODQw?=
 =?utf-8?B?MDZMOHpOb0MxL3pweXBnWGJvRzJEaWdCWGkyYy85ZlNIVDZ2UGFKRHBCT3l0?=
 =?utf-8?B?bDMwdk1uMnN2OXhYRGJIc2V0MGR6dFAxbmRMV1UyckliYTdkOVd1YXZrK2VP?=
 =?utf-8?Q?LujhCxewGtvbxE74=3D?=
X-Exchange-RoutingPolicyChecked: bMAOyY/NTYu32LwXY4GiFzOW/doeU51kc+xMwJi5Q0t/7LA2vomxZ/SWvpi9C+1KpkgBnTyTj4SOKWnrd9YeDpZdowfx1JF72Qc57gZY7dx3VylPEWlpp8CyY67sY8zHGxKlXx3Obhd85oO5Y1pbI9lYBwXqvO8F/7bHAo/HoN9KLtlveB8uLoAnB9aFYTIZibK5EMNfs1P5OBG0QOcyxp+zkQb8QDGJDYPNEkOCsKRz7Ct4Dtt67TCaDynN27xnqnkAJlwoZY32RJImPbjKlUMfirAIMj0ZA+kiAZDTFy4usPicf65WJXg5FqS7/64dRX6vTHftkLBreeBnWSxdxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c16209db-e5b9-45e2-dad7-08de90bc6a06
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:33:24.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5ol8cGQp2YBcpRuA2YxyJCoi2n5ZU6Io/A5Ky9EBQzLioqa78PU/Dp1pxMOI4PCx6GXm0rMJQ165oPyLnnmslYoBtlqcew8Eh0GTPsuEUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9398
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:40 +0200]:
> In upcoming patch we will need to update sched_if_idle policy when
> we already hold the provisioning mutex. Split existing function
> into two variants to allow that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 23 +++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 63e6326d45f8..e8458d63742d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -192,7 +192,7 @@ static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_gt_sriov_pf_policy_set_sched_if_idle - Control the 'sched_if_idle' policy.
> + * xe_gt_sriov_pf_policy_set_sched_if_idle_locked() - Control the 'sched_if_idle' policy.
>   * @gt: the &xe_gt where to apply the policy
>   * @enable: the value of the 'sched_if_idle' policy
>   *
> @@ -200,12 +200,12 @@ static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
> +int xe_gt_sriov_pf_policy_set_sched_if_idle_locked(struct xe_gt *gt, bool enable)
>  {
>  	u32 priority;
>  	int err;
>  
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	err = pf_provision_sched_if_idle(gt, enable);
>  	if (err)
> @@ -223,6 +223,23 @@ int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_set_sched_if_idle() - Control the 'sched_if_idle' policy.
> + * @gt: the &xe_gt where to apply the policy
> + * @enable: the value of the 'sched_if_idle' policy
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, enable);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_policy_get_sched_if_idle_locked() - Retrieve value of 'sched_if_idle' policy.
>   * @gt: the &xe_gt where to read the policy from
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index f437dc1f5e90..d667d66897b1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -14,6 +14,7 @@ struct drm_printer;
>  struct xe_gt;
>  
>  int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable);
> +int xe_gt_sriov_pf_policy_set_sched_if_idle_locked(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt);
>  bool xe_gt_sriov_pf_policy_get_sched_if_idle_locked(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
> -- 
> 2.47.1



LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> 

-- 
