Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5572CCC6B1D
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 07:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2E810EFFF;
	Thu,  2 Apr 2026 07:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFWu1gmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A51710EFFF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775116501; x=1806652501;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=44gIq5AloqVLxEY/bV4kjlUYXc+9j1zimkPtofbU1Gg=;
 b=KFWu1gmK9/h9Bz2LYwjaB9VDtxR0yt//TPdWdi1qoB4YSMQHd3vLN2wb
 tzLrebF9igvzL1LOhQBl2msh3VP/6wkt3lQmEhoKSFjKmwHtcumJFwpf9
 +ewk4jl3D+rSFU+qG3qpO0T9m6NhZz4vQPoGMV+vV2BZpsuCD/TOSdkc2
 AQfwEraycFb8+FyDTvAra3it68BkS7/TgMoRbNvfvylFSIMG7RTraBJyD
 ub6ejSH/ERmH9bgGyOgCWklkDLrotMv/gq6xhbDJcTftZQz58Zxq0PkV1
 RUcVpczfiNAIn329JBufFReDOGoBaIjXmPB3WhXWHhIGIEWuAQLxqI2vo A==;
X-CSE-ConnectionGUID: FU+f0a+JQpulvVtsZ2KrCA==
X-CSE-MsgGUID: GdnY/XfoSwictgOFvPuBYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76050135"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76050135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 00:55:01 -0700
X-CSE-ConnectionGUID: OrDTswzMQdqyQnq7uojKYQ==
X-CSE-MsgGUID: zwmaC8dvT8qqv489eCqlEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222058106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 00:55:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:55:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 00:55:00 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YT7K5O/iv4JsDMGuBzhvMwJ5SKtewyhuixbiStXIeWhj8wHWXLdLtD8J3INUrenPWNLLuwg7OlG9dw4gQLEoUFfamwhjfJd0s/+12w0Wujrre6dy/sLo1kdQ3kTVQsdQkvdatwQcmuVi/mkfBCl1QNwaLqIam/T0yTE58zVKbwjc7yWV59qJRQBC/hP222ZC9Fj4V2DSKFcnESmoNlpGkR4SmXwjXrzgfn4I7d125gnA8eYerjlER3yTj9J6NniP5VbVN6sU5XsZnDK2JQHN5t0HijSuTpk5WA3KX7xzQ5QIniFQbc3IvA6i+IwIjXpv2bv6/4Y9H0fbblaR/SsZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3Nyvhcu5qpE/pF9FKMmeMjvZhbPERZIlGjVKnTgDd8=;
 b=OudB8lWhztOHznunGiZyMrMqjm8FV3cSOKfQkXv6a+Vpj5cUckHxLNBk33FwaPQwzSiUkMLBaNVJlz+6say7GeUJC4ldCfUlEnqlBY3zAK+vx7hPg89LvUGueeks2LNFH2k+o/T2AC0KftcNfVrPXz/QIAvokmj304Z3KqbVv4TwwZiVcuf38Axc06SFNlLJHdIRUeu1eBo2cvGW2DDLc0vm1e4Sin9JZEmZEbUT9+/IgEdDfdVwdPjJQo0K3biK8SsY2j4VQpSD7Ubf/qvgRTcexCOu8gL3e+22YxI/HsKov9yNOwlMJUQRkwI1bGLPPgss+lbLp9bYWlNM/OcN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6518.namprd11.prod.outlook.com (2603:10b6:8:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 07:54:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 07:54:44 +0000
Date: Thu, 2 Apr 2026 09:54:40 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/13] drm/xe/guc: Update POLICY_SCHED_IF_IDLE
 documentation
Message-ID: <20260402075440.seunke4q3egivrdt@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR07CA0306.eurprd07.prod.outlook.com
 (2603:10a6:800:130::34) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 276cd29b-c772-4ec1-d2ab-08de908d1ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3aZEUQ/WUrKf3s5nWWEL8JwBUMqT9R0GjG2ECcRYaeYQYDj8DrRTUlegBrcaxLhSCXmjDn5AFyy+64BFz8AwHL8HZ2JiAnjeFXP/MMLO4H8pkMFKmS1JBi3kXPmeLX8RM73WC0aOAPfbWLkwhXwoJjySSv2LFpfMNmkSWogj8AKQ0T8b15OOQOLJ58us1Ah7YVZ3I+ds/vuZlw66dhovS24OiK2Lf6CO6ETim4/8l5d29ZQ8jtagyDIvgKZOxLDHvzLMW/UkJHYI8L2n+VGWPsODFwCWxiaq3TmEBH5wZcStpsxjiK9r4yD5Dn2L0fZKlfG1oP4+KpWXbw/5+9pWu+5TdZvu7Xg+JopXLqUq9LHCOkWl/JgsmfKnAzGUumI3c/rqmTTUy/6SFuJU0ER2oLc6VtYaRJjng1kU4uUAMmVuqH75987h4blRSsmqzqYk/9U5eBGFX+GzUcRHa9Z92SKz9+t8UIfvfQP4uzJYXLpvCktYW0VuCxW32lqi2LxnT68nTjanZ6Tvys/VdYG5i3CyQlPDUXWZjECJibCtG8OAbShV3sNve/AdjmCgkHquw2Jmxm8veZuUIJ6MerwirifdNymGMQdgOLSjwR7pTM+oYJuozd+WmKDNxwk4LiUX6ZLtJTMmAxwO9PcOH1Y5sW/Vfj2Vis3Mynj7n3hcN55wVZjmOicQ7k+qbpTguWyBqBg895wkBuIiIVbVD5fYfo8Xf2th68SCtik+4xNYT6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eStHTlFIaThmWkkxeCtlRCtIcGJJMmh1NHptL1BLek5RckhadHZ4eVZ3aUEw?=
 =?utf-8?B?Y0c0ZUY1SWJ6S1pOellyZDNibEZIekdSck1aT1gyZFRxVStWMDNFNVU5SVpp?=
 =?utf-8?B?cmh4QVRJSnJvOTNTR0tScU1Dc0RTUHZ6d084RjUvZXo1V1g3Vjk5dHN5WGlj?=
 =?utf-8?B?REVkTVFVRVdIWkZCYUhEVGtjNmVsN3JQOUtQLzNKcVVMZEtxQVI4U0NGNEtl?=
 =?utf-8?B?QkZEUHYrTy9iWkJtb3RDbDJBMHJtWDBHQWczVlZmNVFrTVViaGxaRk9nRVRF?=
 =?utf-8?B?OEt6aHVqQlY5a0w2eG41cmxsbEVGSnRMNUFxbWttdGV2UGtCTUtZRnlzbEov?=
 =?utf-8?B?WnBCOEMvZWU0YUZSdEJvTGpqK2tpZEdDR240bFBDaDVLcFpMenpJdnN1eXRr?=
 =?utf-8?B?a25LclhDZzdpUnlpT2cyaWloaCtsVHk0bHI1a1FZZ3FhTW1IaVgwb0pWZ3ZE?=
 =?utf-8?B?YjJValMwMlNydnZ4NWZJNEg1VEE4SzFXbERzcm96YnRlaEJ5bExjVGpnSWtt?=
 =?utf-8?B?d1ZEcDRlOE95YnRuWXJWdmE1cHpmT25KWXZsN1JQcEhMUHJUS0NDQnJlMzRN?=
 =?utf-8?B?UzMzSk5pL3lOejBMcFNEWFlaT0tWQjNuTnhwVW9wRzRFWnJ4S3VZUi9nTVJT?=
 =?utf-8?B?OE1IWXVDOGJHRXg2VmVhdkNTTGZYVitpS2FSOWtSSW12all2VVk0WVRMaW0v?=
 =?utf-8?B?eDlGZytncXZPQ3VjTmV1bENDRFY5R2tJNFYyUWNUTzdLUnNpWWJZRmc5TmRu?=
 =?utf-8?B?MEpTcGRpKzNycUZKaXN2dXJSNWNFcGd6djdUY2FrTGFFN1JGOHhsWVcvMUJM?=
 =?utf-8?B?OFZtTk44QXBmR2hBZFYrK2kvbDB5aFRDaklkajhoSFBZbU5LNk14eUthdTN5?=
 =?utf-8?B?S1EyQ0hHbjhhclhqejJmNDlJdzIzNW4zc1VJSUdzQ0JnU2RiODdzb0ZRWmly?=
 =?utf-8?B?cE9uZy9PNVVDQ3B1N25TNjRYZklSdDZUSHZ0ZUpubHU3T0hDdlo5QzQrbnRn?=
 =?utf-8?B?UFpLdGYwUERSblRscjNtS09mYll2eGRaeFM1Q2QvTEpabEVFb0p4cFpSYVdW?=
 =?utf-8?B?K3B1TzFGQ3BCU05RU1pPV0lyVTlvbi9HOXhGYm5RVFJnR3lmZzhLUXFqVWdM?=
 =?utf-8?B?eDhIL0VZdnRUMWhuQ3ZrK2tsb2lSUCtROWpxSXFsTHUzbHMyY0pwT09ITmg2?=
 =?utf-8?B?K1QrN3RPUWR0TUVtcUdQeGcxR0xONkc5ZWVXazc4azBEOFpQcG9yQnVTMm5H?=
 =?utf-8?B?a1QyRW45YnlHam5pQXRyRGIwejgrbjA4SWs2aDhPL1VUbTNDQXFjWUh2S05D?=
 =?utf-8?B?K3VydTc0djlJbHA0d21Sc2ZvS3k3M2Rtd3BJay9QK0RESDRXN01kd3NCRUV2?=
 =?utf-8?B?cWlXNmVaZjJFcW5WTS9GYWViK0xDanVIQ3dYby83dzBudjZDMGVOT0hXK1Zw?=
 =?utf-8?B?OUxUUkZhQTh2Szg1VENlTEZ0N3paTmx6US9CTW5BbmZZY1ZtQ0ljWThPSWFN?=
 =?utf-8?B?YUEwcmpuZWpIcVdmT2V2MmpGVS9GTU10TU5SQXJSaDFoWk5YTnNGNEVxZE1q?=
 =?utf-8?B?c0ZiUmZHTmtTWFU4S0U1WDdNUWFIY1ozb21PY0xOZkpCM2w4TFY2dmxMYmJq?=
 =?utf-8?B?S1JMQTdaUmpEYzVDcEtrNlh3cDNDbzhXa2hqRTFTdkxoWFc0SjYzbW5OTXRT?=
 =?utf-8?B?Zk1ySUY3Nlp0ckQ1N3AzSS9SZU5mTXYxUU5RQVpiRjE1U3lBUUdkL1BLOFR3?=
 =?utf-8?B?MmlxakhnaFVuUjl6SFdHbHQ0UjdvbFpnTW96b1B1cDhRcnpPTXVJTFh6cGNU?=
 =?utf-8?B?UWtxQTdJb1o4RTJOTUlPRC9EMEdncU5ick1kYWlTdzZYVlhpVFlOTHN2c3Vx?=
 =?utf-8?B?ajNUOTlObERzRkxJWUtlSE8zMG9sRmNUcmdRUWppREt5K2MwK1ZpWVJIOGxB?=
 =?utf-8?B?SjJOM2FJNlBKaVVNeXMxQmg5NlpXT1ViRy9aK1FwL3IyNGVvbStFaWpMV29T?=
 =?utf-8?B?ejhoUXF6aThkSnlVYXdCSDFKR1JOR2hicERnWEV1UkN3dytiQmpKbGphNWQz?=
 =?utf-8?B?dlJSWkNKMjFvMzRMUis1ZStpTmNSaFQxbzBmWEZVY2pDZWw0VFM0eE1Pc1B3?=
 =?utf-8?B?WkVGck93V2Y1S1RVdnpOMDhPN0NobUVCOENSVVhWZnJNVVR0aldtUFF2RkRN?=
 =?utf-8?B?TW5zT3V4akk2VEsxbXg0MzVuZWxzNG1hQkVhVFBBYXEwMlk0T29SaXVyb09Z?=
 =?utf-8?B?MzBqSDRGT2lBd3BEYVBEUU1PKytDRXZkdUlvT01CSW4xcWh4djNSakczeHZj?=
 =?utf-8?B?cnR1RHYwamExYUlXb0dtQmpPcXRxSW5SekwxdUUySXlvU3dvWGU2cnBBODRy?=
 =?utf-8?Q?SywVAXwQbkDnctPM=3D?=
X-Exchange-RoutingPolicyChecked: lDAb4JozrZiV8lzXWYxqwNWOWSKzbKgHUUeAlL6aw9v8Pe6Bvp5BJOj6/RduYmcXIYAYzxGCWA8WTCGejIsqkwPZp6WG6tmAYe6RUo9PtsZzVmXxb4eY9bB8Bw6keXlvlXGYHnNDi4TXDHx37PpX8hXSS1w4RANfAzW6ep7naDPLYQCQ9lZ7Dt9GOqc64xN0PQsUBbkYmdXYLm2uBndFXWrn2nJcm80qGGcaACdPK1LjIp1ucQB92KS4n1cTkC7gfJjaehz3pmlRAM20LtnUGa1POFHadRPXCMxZrDFd4xbDJRIbdajfuhRigXCL/uyoHm2pe8BOWdzwty4HN3fSxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 276cd29b-c772-4ec1-d2ab-08de908d1ab1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:54:44.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xii0wXf3HUSranWrDN0Fhp743LCmfAQ13i4L4iLzSL91t+W/fZtNd7oDZr/0XA+jGUvnAn+B4rbHHh8NyG3qHjvNVlQW85DkxSNPGLsezc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6518
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:32 +0200]:
> Starting from the GuC firmware version 70.12.0 the meaning of the
> POLICY_SCHED_IF_IDLE has changed, which now acts as a bulk update
> of the VF_CFG_SCHED_PRIORITY configurations of all VFs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e33bd622ab44..7106fad7beef 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -192,6 +192,13 @@ enum  {
>   * `GuC KLV`_ keys available for use with PF2GUC_UPDATE_VGT_POLICY.
>   *
>   * _`GUC_KLV_VGT_POLICY_SCHED_IF_IDLE` : 0x8001
> + *      [From 70.12.0]
> + *      This config allows to update scheduling priority of PF and all VFs at once.
> + *      Setting this policy to 0 updates all VFs scheduling priorities to LOW, and
> + *      setting this policy to 1 updates all VFs scheduling priorities to NORMAL.
> + *      Those changes will take effect on the next VF-Switch event.
> + *
> + *      [Before 70.12.0]
>   *      This config sets whether strict scheduling is enabled whereby any VF
>   *      that doesn’t have work to submit is still allocated a fixed execution
>   *      time-slice to ensure active VFs execution is always consistent even
> -- 
> 2.47.1
> 

-- 
