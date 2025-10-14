Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E5ACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97E610E656;
	Tue, 14 Oct 2025 16:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpqAUqxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF11710E656
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760458483; x=1791994483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4jXLHYtwUi7TQolAXj4/8xtp7xnIhlaohAuY/q2VR5E=;
 b=hpqAUqxKayR18gcVOpfZmeXHA1EXwVqXHkGwiDb9zXvIUftkDMkEAE3z
 HIgHwHyT8gmjhdHlEZMkAqo28YK6cPbLriql0luV8K6/WVUHAMclOUJQd
 hiORjwqul1ng5PjWJWT69UTcCdY5BoBujOO8FynLtmZFWvdyfmByeI2Z8
 mIWBMDk6Fuyo8LOzEpC5N3u/uOUlN5B/5dtgVyHbtwSIWfAgaK91tk3vJ
 /KgTWD0Eiqv5p9tt6v76w+A0ptr0Jq1eJcpBb0FDP/r/Xka3a/xbq0EIG
 87iIwBxbnb/Ny035EGPjfE1rOAj2O4D3AO1rJ4yjQ7PZrUwNMg9FoWT8S Q==;
X-CSE-ConnectionGUID: ICOjLN4+R8KI0WZQK8Zf5Q==
X-CSE-MsgGUID: gfOZ3W9MRHarch0+BxECqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73964220"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73964220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:14:43 -0700
X-CSE-ConnectionGUID: tHysT7bRTealMgiugOwGhA==
X-CSE-MsgGUID: bmDlfA9OQEGuPoRDQWstGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186349118"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:14:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:14:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:14:42 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXD/gC8sDKe3HALgvQ0S54lCiwe7BK2fVIRoEmmyUUrejOo1VFthPVgkDPawV4pczz2CcNooNX7KVSV42q/JT56y0/IX5Zllh8OjnpeMCFJUix9faX9ykxPFc5UvZiwukJkASG4kJJ1SMEyVkO3qd/+F1trjr9fhbMRp4/73Ghwbs+qYro7yt3s/2UV9iB7ZJ7yn9CsaO8uFKldOZKTZxbMDkbumuuFzkSK1kwLCCymTLxWfqNvPsABI7q9D7Yc7UyVYHMo17DTBCiQmabE+BA10IVBalx8GAX5KkDPBW6sgM9QNY85LSG/WV9/fO3Fy98P7gvhkaS8pthgh2BPaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeLo2NQZ5EQ+UnZQivT4T8dhS0VCoii0kyJVJwrzkiA=;
 b=LyGNYOIfrZqGk3sLx8mX8Rm4dxWy3tdlzKPRFqXmldbe6tuWWUDmGi9XHxCaO48UIAV/+CF+nQ50cucU3lXa6LkZchKoLLzNSWDWmP5u7y1znrAzSMjekrFypIOV6Mr+3iKeZYjfzW+Y7ODM1n1/tWkvwVAYl11rtmDdeEu+KgFI7DuLY22HxloZGCBLCc+h66pSTitMOiaQtjQzZlzTPbhYrvfEq83nogk34lUK0hTeMlUAIJirc0UqRSg8eAlK05YmPhChf0awmZZXbE+XOULinGgzfdZXHeimfYqijvNG6HN/9Q/RIqp8PBvdW5JIYeb5j2Z8Y5qOAGSCB/ftAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB9471.namprd11.prod.outlook.com (2603:10b6:208:5b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 16:14:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:14:40 +0000
Date: Tue, 14 Oct 2025 09:14:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 02/23] drm/xe/xe3p_lpm: Add support for media IP versions
 35.00 & 35.03
Message-ID: <20251014161437.GN5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-2-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-2-bfb74f038215@intel.com>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 5baeef87-4ba8-4fb8-557a-08de0b3cc726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VHogbMa9kEbImG1OfMGLDjqiCHyV3ibaJeOVRxFd/ZmtCnlMAm9POCrw8Voy?=
 =?us-ascii?Q?y/FQ3WcfTzT2uLOFjL9Fu0DQgUE40WGt4mvnBjqTcA5hggkQYQV/4NqgQZ/0?=
 =?us-ascii?Q?39+G2pCM8AEdGpQiZdYMc74U7caq7ifHwgdJQoPaE9uFroX1XyIHjIxGipby?=
 =?us-ascii?Q?IAMBywMF/rixWEByGla7+cBlwPRt9N/aGV2CIv4PBUfaB+Pr9nikibLy+9b0?=
 =?us-ascii?Q?6YkAb85K8/AKC4jRgzLeKD5KHsSGdOX4hVEG2a3saSYRz67F5GfthO2DHxZN?=
 =?us-ascii?Q?KavPVk5Tm8hn1m7vrAPZSYaMw1DHwt8GqgMHwLoUYZqpTSsNNEI58ok5041f?=
 =?us-ascii?Q?0yfGSGdgGPQaRUWcU7VPys+zeuo1VHCPaMWJAmLX2/DWMjIVL1CeKAs18sao?=
 =?us-ascii?Q?8ib6MjgEmoZcPt+66Vp+JSLwBY+b3Z/Yub7veaAqSxtWBV8tKeiNznUx6IRj?=
 =?us-ascii?Q?5W8046bxxkHIeBFkfOqKz7+CXEAYPlhENrmTVxbV4SsBOU+bvkrqHLKB8Ifu?=
 =?us-ascii?Q?/ItWEBVmgkthqBPVEWiy20eSplq052KI3rMCYuwL4roCw/kryd++KDrsj14R?=
 =?us-ascii?Q?aYfN7Qx1YB9dlIxuG2NdCMjVjwt8BtWIbYLdJi5yd/j5pNpUWttBGqpgOJO8?=
 =?us-ascii?Q?AfIVLUxV4z4NaR+7TAPv4htrrIPMRw7/Bd4WKm7dA/YWjVrSyPVS42io2q4J?=
 =?us-ascii?Q?/Lf+6s+I2AFXxQl5haj7YDmFsEhftiPc79TBnJr2pkjIF9eIqUvT7ABoCppO?=
 =?us-ascii?Q?MRCikuLUFvaF2h0IWVyaEu2YcWzDZ6/Dh7NoDXtJc7z8O7A8UZ3GxnovbPLu?=
 =?us-ascii?Q?UrFraiAyTNndrcT1EMKA0C56PPMcu2lYlHRnZFWjxwlzytaQIAAWmEef1adO?=
 =?us-ascii?Q?Xkwxwmv0ZwrTlZITK+/nlMcNWZ5YNW/bURQTfN6nQbkqk+wBadm1/wCHko7l?=
 =?us-ascii?Q?bNrCUpywVFkRpyxkv4EMP4nq0nxq2b0VGkMWCyb9Vu+wkVvVGE93mk8AbK8l?=
 =?us-ascii?Q?DTWBGpF7dvKyOYw51cmLp0OpiwvDsr9fNijEVgPXWVi1bgU1f+NOJLLBHkx6?=
 =?us-ascii?Q?zQb3J17oZgtKuWGqdQ/M1DH4CJhtio83cA9d3cW8BLJDsY6xGqmlRx6kkldV?=
 =?us-ascii?Q?OX19PU3KVzhAUQrhukMv4yVU8EQJm0MKfmbprZ2uWot1ORp6RB30I5LF5HR8?=
 =?us-ascii?Q?XwwTh2TmyqTjaJYJxlhcfyO6rhgTW0svv7r965AsZ7Txrr+kgRBGJtD1pmFT?=
 =?us-ascii?Q?dnJIxk+AqCIYLHwM0l3S7+7gMBRZfr9sJw+XkBgF1AS9E1hJQ1N38v/DDKSf?=
 =?us-ascii?Q?Fa5w2JbJOtD0VD6IPOfN5lfzgUnJC21RDCP7sxpPMiBk5EMci+NtcwlVwtLL?=
 =?us-ascii?Q?5LNNOTXp4ZpGBZycnNK3Y8SX1n6tZppJbhy9BgxAjS0IWA+YFXS4KefdNvhR?=
 =?us-ascii?Q?SV26WI6xvmZHs8rhxvVXeQ7WEayPXIEa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n53rPrh8vXfS8jD+Pynx+KZE+TmzWmhEOC19LVsIiLXGu6z/6GzO+ALV3qWA?=
 =?us-ascii?Q?ShvdLVLJq3Y4LBtfjSdp22t+jbII8C1SBRAIXJleUTlszW6gEBlgz1uA4tq9?=
 =?us-ascii?Q?VKd8KwWA4QL76CDHN+zAzJi7PdqmSZKesOpaLm2hYIVKyQPjphcuY86/KAaA?=
 =?us-ascii?Q?VjM/qaqRtiD+0xwf4YsVXNJnQPk26YMXYjSfUhbWoSRvhgyz96h22JMcsv84?=
 =?us-ascii?Q?UkH6Y+OM1xHUYKtytDfu8AkdADp6ePFWnmXMmQTwlfTJT3KqmWnuoaz1EuQM?=
 =?us-ascii?Q?JqjurwKaZ3+bVK5Q/saSfBy/kQUmYcAQOmhAkO7T7JUcEW9ebCZrPvMUhdAc?=
 =?us-ascii?Q?iCBnoYV256x7YcaylOH0KEA3gHnjk7n1XF/6mh7OPzVwLWMDLht28Mj+0UUj?=
 =?us-ascii?Q?I912T8FuCSQO7YLYqi5TPXRHgkCdkW5JrYc0tkJioM16RZ55bI1gFkjOgBtO?=
 =?us-ascii?Q?MKlf23erb7vtKfsZ26uMNrWRqE9cfyapPACRUmhMsR4zPyMvV4lCxAlFWvTm?=
 =?us-ascii?Q?fkuOC9TFxSyUc8yWWvYn5mWU9ydH4iDZ/J6uL2lsVFwnFhKLUsHeFdJ6nYIx?=
 =?us-ascii?Q?cydKw17dmw/MWIwuYCLqbhZuEqsbkm4+3VlobN0tlaJMlJsb5dilUnvG+yVf?=
 =?us-ascii?Q?g8ULzoxu2m2kuLfrtExdcs5+mUa0v3WRaT/hF+jvDxEeP+YjCvNl0saDoz4H?=
 =?us-ascii?Q?MrvDsRagkLfWnk1SZMlbxdgFAEhm+vxGUxm+A6pKDsy8MeDTKUmdkMeYgIim?=
 =?us-ascii?Q?7vVgNl7HV+6hRPdrsGmPIVdmpgj2amJG+HIWcSF6lvVr+RmKX0rK7MNuGpjp?=
 =?us-ascii?Q?0vbIWFOFvjDaYwIt2unFwXiyjOy+x4E2FAD/ip/nBD08SbcmTnFMZvoctICF?=
 =?us-ascii?Q?FPGHAtym+hcEcxRPpKkr676rVE62PYZCVOpm8eM9KEghe3x0Vabtwk4T0g29?=
 =?us-ascii?Q?tK9vUM6vhZCYx2xI/99p5VTea4OIeuPab6jIYNTnqPG7f0Tn/b0udyflySfx?=
 =?us-ascii?Q?jpubzgYwPM/da2mxPXuXzY8WX+BPc71GR+M/7JGJrWAS9n+OYu1zl4w3TDhc?=
 =?us-ascii?Q?05Bp4ibGKHYfOXkr3OBF3yU3kMy3BN6bayunQXzImv8LgYJApMiZiW6L5ipg?=
 =?us-ascii?Q?D5ZP+1g9WBYWPSe9eiHkKfsVeUoO2ARu7oxcwV1LS3ciBlEJQmgtx0phzx/R?=
 =?us-ascii?Q?gJpxY/+wjywoJIf5Fy4NzbZhZvsIPELyC3tkGRnSfNtZm6FlHW36jDa+PadN?=
 =?us-ascii?Q?7uTihu5GP5K1/OVR62VHdLLdEedGt2LrFKXz9UINLvsOQHMgRzjFrh7tZ+CU?=
 =?us-ascii?Q?nJ335oXKrkkY9bW6Xwcjzb7fXwfhGTJ38dD4iGFGch3u/inHk/yeyAUrkrQj?=
 =?us-ascii?Q?DyKG3Z5reRg/z8pZd/XNxMS8aUZi4ATJNg+sKFWjAuNzTN8u2j+ndC9KvDYR?=
 =?us-ascii?Q?tiBNHStJofFoItJ7peYZyY5vnSlMJwYibmTgIc1VN1JZynnlU7BUh/FSHZEZ?=
 =?us-ascii?Q?zpXn92eNs5JY+7YQ3j2Mxby5+C9mrxNyCIkzUat6mOQw5qGmroJCBpTTiJvq?=
 =?us-ascii?Q?wMNGKNDEiI28G8WpVqI/qohOcOZWLD3rdiUbxIUTAJeGGUAdDIevyUxuq/dF?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5baeef87-4ba8-4fb8-557a-08de0b3cc726
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:14:40.1964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/pLXH/I4FuX4qAYtd6sUpwsdgJMELiSRPeLZxebAFfzqOLKeDAahqBe7tLQNAF308W7ekwUzAeWo8qnzSNr2nd5d2TThHA7iaH7BNZaJ3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9471
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

On Mon, Oct 13, 2025 at 08:24:34PM -0700, Lucas De Marchi wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Xe3p_LPM is very similar to Xe3_LPM on the kmd interface, so it can use
> the same descriptor structure. Add both 35.00 and 35.03 IP versions.
> 
> BSpec: 74201, 74202, 77977

Should page 77979 also be included in this list since that's where the
35.03 number is actually documented?

Otherwise,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c1e89689953b7..8480e53990031 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -164,6 +164,8 @@ static const struct xe_ip media_ips[] = {
>  	{ 2000, "Xe2_LPM", &media_xelpmp },
>  	{ 3000, "Xe3_LPM", &media_xelpmp },
>  	{ 3002, "Xe3_LPM", &media_xelpmp },
> +	{ 3500, "Xe3p_LPM", &media_xelpmp },
> +	{ 3503, "Xe3p_LPM", &media_xelpmp },
>  };
>  
>  static const struct xe_device_desc tgl_desc = {
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
