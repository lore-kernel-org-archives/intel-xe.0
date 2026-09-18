Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4876BC982D9
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E146410F28F;
	Fri, 18 Sep 2026 10:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUeCQvMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BE410F28F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789726914; x=1821262914;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/PBtum7F6QVnBUyzsKxTAp3wjpTKxGMCp0vanhxLR9g=;
 b=GUeCQvMoZvjtS/CoQNwqfqOMKWTisC2BDkMm68d+nyYKLFmnXmkLU49q
 iCMyJNWDFQ6KvFACRfjFb7RcNixv4lTa/zrSSvWFbPmVQBd9hkuUhu35x
 JxYKeyP8qYS1UGacwUTz3x2hDfZd90kzrwhzzwzaxssjrdxw6MxeLco8m
 rwcmGhpMcm6hpceGGRaUkcZ83UiA9HzMjDsae5fgtOKFT1n95zY9ok42J
 gWkhPbKw/7fo8olAsEsTRco1vaKcLZAiurPNA0jr2ECIJR1yL5R4z0C7T
 G83dx14IyL9Ke7KkljhPg/c67siXv5tT5XfnqdhNGRIKKKEIOMdjn7/W3 g==;
X-CSE-ConnectionGUID: kPLcYqjoQPuPt3h3o4FXBQ==
X-CSE-MsgGUID: hniH6qRCRKih780/tTjaWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77786634"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77786634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:21:54 -0700
X-CSE-ConnectionGUID: gHttc7rlT6u0mRL6m30HYA==
X-CSE-MsgGUID: PDqnchgxS++TXeWazXmZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268076856"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:21:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:21:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 03:21:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ml0ajaWt6l6ksIkh4RiZ0Kdu6/IrusYbgq+vEPzo8km4QTf82F7Kbn4qGROa3+34K5kL51hZW2RYmLpDGoXXDrG7odN76aRwsyyOKhKnDIe/V/lV6Wiluxrj7ebKzDaWjrsNa4viub0WhnQXHpgGJJlUqkdgAMmZZ03qkNtBGkzR1i5l14iVHL32eN2/7H2rEv8EREYso82Q3jIURKzg45Ibe3fHC3c5/Ei6ELraST4Num3TGSkR70NvHm4rEzCf1tzGfprZBYmyRCgP3DsKvd0Qkn5CwpAZX/qFW7fiQJw0h1CcBZuCCg7AdokXtyLzci1t1cGGDUx8xoITBeAhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+okJXU6CKlx9K4eJq8HFEqGoxM8vhAV60edmGLqXmE=;
 b=kqGfiInbxBJUKoHjKHdjiSqop+QBKj/agExV2Ej0pt4qV2LeBI3xweXI1Yim7nOsjt6QpMH//gEg24CFIMHY02QWkW7OVa51Fbg+MRCQfI/9Cdu+ZlMk8/xzsnEq5G5p+rHKTM2zedQ/+xD32mhnfKD8liIFQlvN5HwBjujaTQf0knNgycm4L6GsyBvyOih8zLmgT/Xtfbpw70F6too2AFzRBkadWRT/IPLnfJNvIpN9+bNIzXKa08WBjhTQf/z/kyzqxfhOJNROqYfr0+nk8zAF9Ofr6Fpgv66E4kSYqytlF4PBUoTMYOwaWumHBHKm2YoIHYncTv7mLMMxCAyzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:20:54 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:20:54 +0000
Date: Fri, 18 Sep 2026 06:20:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe/hwmon: Disable memory controller and PCIe
 temperatures on CRI
Message-ID: <aq0Qd86expZdQ39C@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910182756.638830-6-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CO1PR11MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: 57df6539-b7b2-4d48-7c90-08df156e852a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MzlyysY2HAxKcAHNODknOYPjS+66/e3gEy23q3XmG4+Kr5byKTzV9y7i8jM8vwOG4+A7sJiMQzRFKFk/3lTV7ovMLxYE7+pWV2N3WO0xawsyraUCBol1FfOhbL8Q/NfT1I2UjwAu/RTIygIXXqgTLkrBcmQHbaVJsctM6q4OEXoqFQSWYGA+h0o/Zs8NB+XeNM+LSaPmtVG/tbaf+PDgy/KyuDXz6mEo4orR0Jpm8+Kw1hXDqVOEEI5fkENl8MZLd9NA06uqBAxPJc2AEqvW7DfN//JRUdK3Nrythydt89Fsu6VF3rbajX9fjqhJTgWY2wM+DtFsNczkWt8P57okhf204sKo5Vjbo6SNDE/1PQWo8LcQ/pYONH6oDR5biBSNOTysGxY05WklyCuFdoLcvjujdgSVgpQsmGCOVTackDeMAcYsazbQokdVPnvMOXEIzgc02E0Sr6tpxrO2QMFIEKPhQvFlQIMJfpKQZMvTOyqMl5YeN0GmI54OqilpJt3dQlgDMDh/6vV+aF/zTseL/Eoe8cJ9ySChn1gSKFszWugGgcSTds1hInOEwtOrkda7GUwK7SW6TS+RfepFkDZUrEPXLZronA3Pdpf4lycB//9G3zPhhLBU8HI0xbYbe4eRcvGEWEZYze4bkbhUKy6bkC1SZmehzODUM7op8s+VTBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PbG3DanfokGkZHHmxX4rTylA5AMCKQzbCYTOzSdcMHmTJ/aiqs3a4wX/QX?=
 =?iso-8859-1?Q?Y4nqiwNjRGBnjOdHEmC3K83n1whypNUxH4nAlr6KKh8Y1vJ611eWk6MRNF?=
 =?iso-8859-1?Q?+O9RfVHfEdZXf4nm7KOyJmYuf/tjO3k9/UHEfhTywBrt31+fHZBH52+yoo?=
 =?iso-8859-1?Q?ARU5qK+LgUWfXzZw0S2lsKokKR+aBHZcgjHI/0jsI6NmM8GWdoa4wnP5wn?=
 =?iso-8859-1?Q?K6Wq7V2QBjLnc9iCY1G6FhpnV0SDXp0IJzow8RMS1oXFUrf5rXFIMZTsqR?=
 =?iso-8859-1?Q?LoUKfYAbtgLVc15HrLbGhcigQcYPHMfhDkvFIXNATVXD52ws5KBvYwkYNA?=
 =?iso-8859-1?Q?p7Ug5/QvOt5lBDdcmYm3aFgl1IEgV0vQByMO0J5aYQBQxS8OF5rDvcURew?=
 =?iso-8859-1?Q?9U9fXBgBcd/+gghiVaD4UXuP6/ngnqrphV42nl0x9r/QeFi61XiAgUTcDj?=
 =?iso-8859-1?Q?qfuQNQ8IerO4NYQmiDAEZM3SFlMlFqZWYbufxTGns7Am5/PVfaT3rZ6QIx?=
 =?iso-8859-1?Q?md10anzwWJ97OmBsLoPU4Gp+kOhVlss7tKdXI1R8LRGaZh6yBA++ud94Xo?=
 =?iso-8859-1?Q?g6mTdK7y+v6qKtWod0pVc9Ms34UpIXr4BIte9IctSrxiQCMEYIZtbpKN3I?=
 =?iso-8859-1?Q?5ZahT/ijAM/V1J7HxGtEb8rQvQyVrNoihUTNLnAs6cFagkrbjH/HmIK8gL?=
 =?iso-8859-1?Q?zTwAaQBXqnpFomnSo0/FUuV4eJ1w52WRs4g5Et2fZkcVQqBnSJwDsK7Aa4?=
 =?iso-8859-1?Q?fcn3vmMBDpc8lpb7X7Y64IbQ0CMV5/FOb9sWgC21uzoRg4IoGUO0J6yqHK?=
 =?iso-8859-1?Q?lQsfBRYwg4jztaXevsTsRBRDEG17fxgcZ2Dw4dCmfQQ3d/zPLVNF6ivFCM?=
 =?iso-8859-1?Q?bU4KMII/69vRHGmPmwcFkU7DpV4swYoUWBzQft1iSIWw/Ok9p6QxtQYB0a?=
 =?iso-8859-1?Q?GVuDcUaTzyWJp1xtdjSoCF56rCKFtTsrIlXqlWMp12OmuVNYrqiD883G6d?=
 =?iso-8859-1?Q?/8192dFix45Xa22xo5hvjrsEXn9gMX3fxLpFOb5h6JB2YIECSexbYPJhTn?=
 =?iso-8859-1?Q?g6HDYpEl5K4WPK7huGQvphRyjPeyhuIz9I82093vNp2uGZJQsqqJSXxbAu?=
 =?iso-8859-1?Q?5mYr8oAf+o/JgKMKGdXAyp4YSdpMEoAjCb1bYgYHTWDxpLzzYXj3z+kbbQ?=
 =?iso-8859-1?Q?Ik/+4ryFr1KsVfb5RjOx0BNusBqucVltzKqv4ERsNmcGOXQRv4H3qQs/+Y?=
 =?iso-8859-1?Q?13MjYQvFeZCKJ9sO5RbgCsBJU/S4CpiMNHahmQkPUG73WMCa6MgZ4n9Ca/?=
 =?iso-8859-1?Q?7NctCLfadZ+uUvQ18hnDPoqtDf8KHRPDv3pSEuY4wOQAJ38fvrjSqGV1UP?=
 =?iso-8859-1?Q?Q0fKDHLYK3kRHLJ2lw4bvg6v7NEYVxRwB//+3z/MJPYMEUjY3WbNEJkXMn?=
 =?iso-8859-1?Q?hpLTUKhjtesQ7yDOX1L8A6lofVo9NhuFoRTCo9wgiG9WA2mH4wnzAS9paf?=
 =?iso-8859-1?Q?/m32CR3gKDa1g8nj10fxlCSpibacqqjxvv6YiN9s6vYlZC8q8s4F8xG3aX?=
 =?iso-8859-1?Q?fXUqqgCOk56nAIR08ioS0luzIgFT6+knuTxArGt0SqPDoutRBxVYTZmiFL?=
 =?iso-8859-1?Q?EQLlmny/PV7bbmeqGtFLoHANon0v2GHcNKloQAdaICxR5fD+sLraQ2Q1tG?=
 =?iso-8859-1?Q?BAfAv4TmpmSk5tyWfh5a/YY9v8rvzQ+O0nHmJ9qPf6eILF4JztaKPGuHA/?=
 =?iso-8859-1?Q?uNt0QDTZuCYbJZE50p7c5mQM52kiTotzPX85C2i2aBiroJ2LOwbmqf6jbp?=
 =?iso-8859-1?Q?31VqWpNILA=3D=3D?=
X-Exchange-RoutingPolicyChecked: A3Yc2ePAuFYLIuim75jIR2arSKhJ3md+ICx6Kfdg/N+Jfv1EfmZ6atLkIoVVwUACxKyQbc/30L+x3rLFW0e5PYMKlP2xLZHRB3UXZbjoUkH5Ar3NiRDXH6RRNtOcxsbCZnX8x2kotzs+DJkfMBOxH3+hW25nutTaTiAQ00aVw6A9IYdbO//aUielr9/Asac2DKoBRPNIuMJfhPbLFZVA3GHUGs9JxvHYPDklhy2XiPhnpndUxUx2D4E5wIpioLdf6aPlDqvqCg19qYwSldtVkwRekvbjuz96XFhK5vfX0r+DsNX8q4QFV4R8OjjP71dDN06vLQZ65oakyKtsYq19+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57df6539-b7b2-4d48-7c90-08df156e852a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:20:54.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KX+HWPWj3FEWgraIwVoltJ+QNkrMNgej4lCzIbQITWtJ5JOigyWiJDhILeYCyM+swN+t/sDhjLRwpGIeQK4bsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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

On Thu, Sep 10, 2026 at 11:57:56PM +0530, Karthik Poosa wrote:
> Temporarily disable memory controller and PCIe temperature reporting on
> CRI platforms.
>  
> The definitions and interpretation of these temperature sources are not
> yet sufficiently clear, which may result in inaccurate reporting.
> Disable them until the hardware interface and corresponding definitions
> are fully validated.

I'm wondering if perhaps some has_ flag should be more appropriate,
but we would also need to think a way that we don't explode that...

so, for now let's move with this

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index e4a210916df2..669bbfe18cea 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1094,8 +1094,14 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  
>  		return true;
>  	case CHANNEL_MCTRL:
> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
> +			return false;
> +
>  		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>  	case CHANNEL_PCIE:
> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
> +			return false;
> +
>  		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>  	default:
>  		return false;
> -- 
> 2.25.1
> 
