Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB55C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 05:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649B510EEB5;
	Wed,  9 Sep 2026 05:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2xAPNJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7B10EEB5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 05:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788930219; x=1820466219;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fohSUCRzyaHQstFs1lcGI4+sZJy9wkBNBaPeV5EApl8=;
 b=O2xAPNJeujabpgiKIUlylt9hUNbQg5728UxGL29lhc943wIy6l2mdtgq
 1BN50ySx/I2V9onrhNRuSpCH10U6snKGWJFHMM7XvHxkLudJaOI22AXQv
 +/Q5/G9XVvNDTQYAxcx4Ln+sedxoufPu/LILLW6lMXrUG/xW1w4sppeLo
 lOTgkjGoTnBYv49nzebK0CadiRi1pH6a3TKq/IEQzXRiumcnEhiIr6pgu
 Sfje2w9TpDUsdcoYOMzV1xjHkCoqf4XJcVRU8krC7lIFMjitcYN/eO0ET
 rW6GZCbFjwd/0ovz1k8rvxm06MyDkGazMfDQsu1qxzNrLfAS7c5OXXccY Q==;
X-CSE-ConnectionGUID: ox+3r87HTs+qUPDjYKCX0w==
X-CSE-MsgGUID: ZkkZsWgYSlaH3nnxdft/uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100503176"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100503176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:03:39 -0700
X-CSE-ConnectionGUID: k5wmL5P1TtO4jR2aI0L0rw==
X-CSE-MsgGUID: QXVP0mIaSkOU5Q6N2ALwfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275340801"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:03:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:03:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 22:03:37 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8FWvhU7e63Kco9eIO74FuJabrjs3mG6O4aDaQGXU2G2tjLtRC99qI/QKVCMB6B6+E8fyR9PxzY0Ma6h/TwEO9EB63UFssSu+3o4oiNb8cY9AnR/rAwzTw7aBSAGRrFGn6HK2OAyEp4KxZjXmOvN11PTr9Nv2AuQ31GFHcDHssrfdeGoC9LY4NfcW9dnX2xQ7RMsj5p5TkiMoSO8Z3EA7yp7Uq1TxlwJPFsAeM04+GEYOrX+Aa7DB8cKcK507tZXsK9Uhptdta/tlNIxIbLl2cctApCKFGSWaslw4O2VBSt/ISuX0lmOQ4c9m0M53qXAYnUzZjEhi0lvu+HGu8rSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVPtfgi9IuSeJtlbD5VG47YPUZouZuvpqT13Xrwz3Vc=;
 b=mRiVJ+jbA33RFLu+Ma8WWR0ZFMacUFbOQMW27GVkwfXXU4fkXw6oEMFqYVYfZTaVQ1wPFdg29kPxonq6vMqpXdwEOmOG9F6tXgkJF7UOu1+4XVTEuWLk30KW9qwwx59q/+Yt9Dq9vXG/RQXzTsvOuinY+aKubiyO52ANtxzyPthwtug4qySgjTUqoqt2+FRDjWwPZz1VBgsovb1tUKiNSweZiQamu6fuFJXsu6ftbNWVNvYavK+Ls013tMT+eYpU+dkTMBrKP8ESz5ZT1P5wonnjvvYD3zDeQqEzaiUUPcBH/2o7Ok8up+ZBHnphTezUbmjoO2uHMzt52Lja3WZO/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:03:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 05:03:30 +0000
Message-ID: <880387f9-d257-4cc7-87a4-c9dc36e398af@intel.com>
Date: Wed, 9 Sep 2026 10:33:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Fix sysctrl and drm-ras discrepancy
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260908080443.2255617-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260908080443.2255617-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db2c19c-9a1b-4801-09f4-08df0e2fb087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VFfk7GCB/RbquFJVJgMV5LGnWRRKgcLPJqHzKSzpuasELKz7O+iayf3i+4coPhBKhczuaDdzESqnGi0decA/FlLurHz+y6+t0v4awc5YQoaEPcssr/QErXhy6J5xYllPgqLaxi3YsfoKOLbcsfhhXQ+sxTUq+Nk0bdF9Ct5X9GZ63Ezie1lW0+negVM6cXDSRap1Oya6YXPQNvSoHHahCt8MknGc3LEIyo+ayUvyz97c+pgFVhZ2xWN41rGXSQSp7zuWzpBSLKiKGlSXoTIiZFot0XAfep31Nt2jKhb6AwQXWn7yPac9TKIe1oXoQ0e9pFIACqZDko49bo84xqZV64wOjHwMDuJtkBccxSdkVqJWS5O1FajKLfcsc0+uvr7MozjC1XHpbOOgLjbmEeeUWbhad67U4+20QxmmfSvYoh2RGztEMYQWoMFWJXSqWJNzQxbmBQHVskIY6Rh3yGFRyvWS4L8AcA2mqL3PT8OGVrivVVT6r/IYm7whcoEXpbXzQ16uJvZZzxSKBPMzcxah5qVqPUzV7uMok5BONsJl3nm+ugKjK2IE6UB14alG2zIQGtOgrs5oJ/riE72s3lJPRaC+Q4GMWrqipdErBLChECR09o7prbfU/XyKBxdFqoR9o8kDMAXz+YdG0eY90x51tUSUysBaPBkRfye539m0cIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9kZmUxMUxObUVqN2ZzMldRakVZTGREUm4wQlRpci80ZnVQK0ZaVFpiTVYv?=
 =?utf-8?B?UnQ4d29PRVdaSlNsQjNHeEE4Snp1M2lYOEt1aGpxc0k5V3R0M2FwVTF6L1dB?=
 =?utf-8?B?V1dweDVUK09uVXhETE8vQU1WN2VzclA3Ym9nekpmSE0zbFRmeStyM1crbDRE?=
 =?utf-8?B?V2MyamhyVmp5VnpEQUhRanZra2RmOEMyd0JicmVabDl6UXc2T0FpUnkvcElH?=
 =?utf-8?B?NHRVcU9NZ0JFRm1qV2J4bEwxQ1NLQytjZkJ5YnpFaGZHa24zcHkzWjcwMG90?=
 =?utf-8?B?RWFZSDc1bHEwVFF0YkJuemxlb1RnRXJ6RFQxYXZhekJVN2toelRCVlB4L2tj?=
 =?utf-8?B?Mjh1T2NpL0dtRHQxWE1zTkkyUmxEUmQrOVN4RDlXM1dVNTRmRmVvSGRmMytD?=
 =?utf-8?B?S1dxMUlZSWhxa3RvZDU4ZW5jL2RSMGN4a1BzSVczZlp3MFNlVytjdTY2dFMz?=
 =?utf-8?B?NnNUQUhnVyt3azlnMnFDQitmaXphV0tNcEhqeDE5K2JJRGsybTN3MnZ1WVlY?=
 =?utf-8?B?OHVlWFFWVEhwRXBwamx1K1RFRlcrM2NQQ2lVUUxMRHpXN3RiZ3VtQjhwdjBD?=
 =?utf-8?B?emhBdHdkWUw4ck8vY1c5WWJ2STBiYkRIck5VOU8yMjg1Uy9nakZ4RkhMbFU1?=
 =?utf-8?B?Z2lEL05JVzNhaXQxVDFha0Z2RnZhN3NJUGRialgzWXV2c0ZQM1VnaTA1MEU1?=
 =?utf-8?B?MjdmT1dRY25GUVduVnVPcmx4UWlWQ0FwU1p6RUNPcUNSdjVLTmFGR1dsc1NN?=
 =?utf-8?B?cElvalZ4OWJZQS9BOVlHQXJpS0d5SEJJTTQ1Y2NlWE83dzdzMzJzUmN4K3RC?=
 =?utf-8?B?VzJQNE1XYUhDaEt4V0JNdHE1cGorUW53Ui9wbjBBczNGUGplbXJjQlBKb1c2?=
 =?utf-8?B?aFp2aW9OMmFhY2tZaUNtRGJKSzNUSzA2MFJwd0huLzZrb21HNzVFUVdEZjhH?=
 =?utf-8?B?NEIwVGZVdmtFc2ZKUlRXbEpOQ0gwK0hBcHJ6ckpjbkVVNmJCNWlaRi91ZDB1?=
 =?utf-8?B?RWkrMFFCY2FNRktPUU1CZXluU0tZeVhRNThiWE5pQ0liRkpUWjNDVHgzZnlE?=
 =?utf-8?B?WVNsbllPNTU1dUp5cmNIOXF0dzNWMmFvMmkzbnNudVpIenJoSXVKUE9pSURy?=
 =?utf-8?B?VUpUa0svV0t6a2lQbzNMQWdBZUVVczRHWnhTbHlMSzhxNUdBc0hxUk1WQ0t1?=
 =?utf-8?B?Mm5URzdDVVhCMUErdkdYRFJVZnpnaldsK0VWU3JhOTdTcEduYUxXc1FrSlV2?=
 =?utf-8?B?cjRrb0hyYUVPM0pnTDcrR3lKaVRJUHZRL2pTOSs0akFzU3N2TU5SYlhqTnUv?=
 =?utf-8?B?WWowdlNsTDJTQnN6bG1LcC8wbkFUVVNzZnZjS1g0ZTRobCtUY2gxamg5eU9R?=
 =?utf-8?B?UVhjazhRQkpjcjFGMnBVWFA0eHhveGtoREx6VXpRcXd1c3BBdDQySjZsTFRu?=
 =?utf-8?B?Zk9zUDkrcWpzNzc4cUZ0ZTNZb3hvbEpkcTlKb0xPMzY0SHBnM1R6SXpZalJO?=
 =?utf-8?B?bnJKUStjbmV3R0RDUDllaENlcFByVUpxcXJ0dlpWQ044MEFnMDh6M1prSjB4?=
 =?utf-8?B?SDh1NEw3NjVFUkVFNXpkeHdoS3h2S01tNTBJQjhrbzUwbnlRekJUQmdETndI?=
 =?utf-8?B?cDhiVlhFdDBZL2hCcjRHN0VpOUlnREZ4UjhWMTRHY3oySTkxWlFpbVE3WG5Z?=
 =?utf-8?B?NUJOd0hZQ3ZTSUJNN3ZhamdERURabll0MTc1TStvUzZBd0VaanZsWjBoVlhh?=
 =?utf-8?B?ZlFiUUhzeWNXOUd1WWcvM0Voa3p0TFhwZWZQdk11UXJQNXVKZ3YrYlE4ajh1?=
 =?utf-8?B?MlVxU1lobUNwVU80OWVSQk15QVBIT3RNV0t0VGtNK2dJWFpGZWFLaERjZE5o?=
 =?utf-8?B?bjY3Yk9yZlQ5Q1orWVRPb2wxc1F5TTFvdmRaeC9Rb280Y2lHc2JJZUV5UU9J?=
 =?utf-8?B?YmJDaDlQM2NHL0luRXpKWXpFcE13R0RGditjMWNsTnlKa0lkaGY2QTMzWVBx?=
 =?utf-8?B?RU1OMHlmUjBQQ1hwaU9KRnk2R1IrdjZwZU1vMytTWkorNEdxdHBBdk1yM29N?=
 =?utf-8?B?dHFrT0lTNUZyR0xKOEFLRnlQWi9zejN5Q3hVUzEzZ1RHemwrZElHUThQVWRz?=
 =?utf-8?B?TnlWQVMzbFU1dEc1Q1JQbTR5aHFLQ2FDenpBNU00UlRwaDJvbzlreGxtRVlV?=
 =?utf-8?B?OEIvMytDT094QURDdEF6b2lONTFDK3d0OTRHemFLOWIyR25WOUQ3Q0JLUTlk?=
 =?utf-8?B?MEtYNXhDRTBhTi9aTHhDY3ZRck94WjAwSVBoM2J5c1IyTlU1aS9YNUxlRFRS?=
 =?utf-8?B?RVo0MU1VZG9rYWErTDV1RFd2cHZmakJaR2plQVFDVTY2YnNhd3B1QT09?=
X-Exchange-RoutingPolicyChecked: 4ckeUc/AIYs4t2dxnxd4yJafQbhtOvLdsdJAhtJe36vvWHinJq0MZBzonCYLnvB4y83HwIdX13xuFKMkK1DWCSnNw/VfXN71Q7H0727y9tyvhk4QUgDRbRXOqhVDq9xgnuoZh6nFaJ/W0cp5aaGZNmnxXYXWkLaqmw8/ZttVTFPpytbmQNHxoYH4AAJHbff2xyOHQtfNn7J58Z5yw1M8vcGxegv6Mz+vaG2JN9WEbVoKV8DqOE81WqT5IMkfK38rm335US9ylWA8Qh04VoH3+Z6w/YNr5L6UFv7bFTtqO0AlDAI9VpOo7gaY0yyr6Kxfyo3ES8Y5e4rDneGqmyhtJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db2c19c-9a1b-4801-09f4-08df0e2fb087
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:03:30.1702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO2F4Z5n5TwMQRUvcSqBFNlGwonbrKt2+CLqbP1GauU21MDZPyM+HlmmaG4b+Xb42ZIzqHtX3njEFU31fGmeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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


On 08-09-2026 13:34, Raag Jadav wrote:
> There are cases where a reported error is valid for sysctrl but it's not
> exposed as a valid uapi through drm-ras. We allow such error to be logged
> but it's redundant to try to send an error-event for it. Early return such
> cases and prevent misleading drm-ras error-event failures.
>
> Fixes: 6a9493e47075 ("drm/xe/xe_ras: Report correctable/uncorrectable error events to userspace")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..522d891da4a0 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -288,6 +288,13 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>   	u32 value;
>   	int ret;
>   
> +	drm_severity = xe_to_drm_ras_severity(severity);
> +	drm_component = xe_to_drm_ras_component(component);
> +
> +	/* Not all sysctrl reported errors are valid uapi */
> +	if (drm_severity == DRM_XE_RAS_ERR_SEV_MAX || drm_component == DRM_XE_RAS_ERR_COMP_MAX)
> +		return;

We should add this check in xe_drm_ras_event instead.

Thanks
Riana

> +
>   	counter.common.severity = severity;
>   	counter.common.component = component;
>   
> @@ -295,9 +302,6 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>   	if (ret)
>   		return;
>   
> -	drm_severity = xe_to_drm_ras_severity(severity);
> -	drm_component = xe_to_drm_ras_component(component);
> -
>   	xe_drm_ras_event(xe, drm_component, drm_severity, value);
>   }
>   
