Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47AAC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 03:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478C610E3C6;
	Wed, 12 Aug 2026 03:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3vXxbHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9DC10E3C6;
 Wed, 12 Aug 2026 03:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786506215; x=1818042215;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=25BeNM4YC2QePKHbCyZiPfy51ts3Cwpw7+36MvPP7Z0=;
 b=Y3vXxbHz0PQELbHfCprgWHENUsIZGD7XfwORjx8lCJnmUcaDIOaQxD0f
 gNrAR9SrXzjfAGImi39FKQzkjaSHr8BsNDOrpEVwH+qpkApznmADLcZg+
 dY9jNYvnmYV2qyEDlqhmX7GqdwA60JAnXfkg6H0fKwuNp116AqXURU0Er
 NSG9HNvFIktivbejIL5R3cP2mWD5HcJ+XAdxmcKUUm4l0/aW/oQLFBLwY
 Vpr4rjkFg5JnvXMPpXON+HsvhuZsWlHdzHJNcGalE2+mtwKBUmxJ84kr7
 fLGsyLHIYyfwyRkiAkhpQbPf1YzBcvErXRvojNY0A6qSPjAN1poyuqmB4 g==;
X-CSE-ConnectionGUID: 4ut5LNmBRRKseFw5gQwAXA==
X-CSE-MsgGUID: VYrQWdi2RyGYErEkZ8UcIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87122730"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87122730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:43:34 -0700
X-CSE-ConnectionGUID: zxS05uvISdqHYX+AQ3NnFQ==
X-CSE-MsgGUID: EPZ0RaJ/QNqI2EKLWfbS/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="268666015"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:43:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:43:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 20:43:33 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:43:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVMl+gtk1VzWKzCbWRyAk7GH3MrJl7ZhGHkEM+7K7kUCy1GrjtLVNRFbRHupcqx7rgDjYUCAi30UF30IuTt3UcLYvbTs0wr0DxSL56riIxXjeoJxNx+QnDqm7O0j8dqlOLPsLwdZI6PjjEH43BIwPrPDyuu2RRMbYONPLKNFZLOfXEf4vBPMF+3N1nn+aqrr1DZ3e0k183RP72lzx+5VAn+ZN6SHQ1qfzKVuggijnUoVkcgNzFRbw3A6+CLW7uHanm7mLR/+wTD8DHV4zrtBBWolAAMLVFkppudHy6jXydrc9GrGRmLknaSHCBVV5jASHIthnmC7Ksrh5fWBkqLWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmhbtT/CsixsKhCM7/QCMQU6+2LoMlMnn62LroEZFc8=;
 b=XsKszyCDMI34k+Y1dcnlosKUHM7mbDt+QhxOGRgJq2de8B4XvVQ14UKzApeX45LnHEuQft0Y1GmqQHiI4LJHwKBJpHL1/qPxQYNjsNR/y6DgzGs+Q/odtaFpT3e77OYSYaUDslAvf8SunQSf92lNs+5TQEom/XT+13P3Zd+SbEZfusfu6K2dID1l8KHETsF7OKy30hSKlP387sd0p+0eLK+7Ku68H59QiZkSA7DvVJ7nvYcYy1ECX+Fhy8ITCuWrx3V6dq9Mtpc82Q9NywC4qFrfAhWXS56EbemRcuIEZDylxs4RDI6q2IwZYFeCJhrBMG5xc9A957cjjNU6ceZXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 03:43:25 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 03:43:18 +0000
Message-ID: <174d672b-b63a-4ff6-894e-204100fe351b@intel.com>
Date: Wed, 12 Aug 2026 09:13:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/i915/ddi: add helper to compute DDI clock
 frequency
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-2-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811175844.2613721-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: c6caf2c2-575b-4a6c-8de7-08def823d8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fW1fO5lWIpC/MB/zboV23nK6c+0VneZebJnuYhRxj7XGDFOpaRsAr/aiqKT8nRT2BTVRU5//jEkkua3x3Hg+froA32QT/F019Ebo4JEGH/31TpbLErafgjFFW0JRSpkpGGIMWKk1eqPaf/pz1+bTRpVJSklvdyNUGy103kmDBmBI+gWJdqfOz8jQ5QWMsvtLX/C+LLkkr7AhF1YD0y12FuzwyrlMa6QbjIlCYadC+9tne2xaMo+JDgZCGUiYrHA3pWtwMtUTxeJTqXTJsLadUIGSSnnO+scrrwC+4zgOxwKJfnusAgvUooe3z49DPh8d/KHcF7B9W7WLdq5QD/9vPcz7I73SsgnZ1ME9VmfPMAQpm54GXbA0cjsZYG+qfavdTDnx2ek7dTDEYVo/7nFYcnkupuWLQpYd0llol/1LrnlUzaaLLKLo1yoPXa0/uBKTVuZWw+IZuxRFOLegdUPHVRGm6RWlEWYin5kYtGGsN0RAhcSOzjdE1+T7T4rRDgEtGvkx5nkhqxpjg6rBxQd2SOGz6gtMtJpQOFSBgulQBXbCreNlcEmrDG8rK0hq9kbJulh03FfvpjZKxuojziXMqHRfpbL76mFoPW/WR/KK7FWyV2/yeeQtqqYoviugIdMkQXPGT9NMhIAp37vBdh+jo4SrPpsJ6yixYGRf23mwFXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVNFK1VTNVBaYmMrd0E0V3gyOHgwL3ZBNUowdS9odStNczIxYlBzUTVLWGNS?=
 =?utf-8?B?cm45WmRXVElsSzhYb2JTUEVoTnFaSFVXNkc5WXBSRElmNmdyVDg1WHpXM2wx?=
 =?utf-8?B?cGIvanoxZUltTlk2RHlLcmVsblhIQ1NtM1FRMmpZWC9Jd2xWaEFzZ2dFOHZU?=
 =?utf-8?B?RWZPQ2hkV2svT0ZWbmJNY2hhUExNY0ZET2NwSzcxOWRIWU4yUnFiZFE4NmQw?=
 =?utf-8?B?U1hYK0ZaUHVRcUdvVjBPaE8ySzJJVW1ycG54Mml0aVJ4d1BaTTNoT2JSVWcx?=
 =?utf-8?B?dE9nRGR5dFpBQ2JhaUprSkVYOC9UT1dYQUFJNzAwK3pkdUVSUjNiSkZ6bXlN?=
 =?utf-8?B?Mkl0UVZJRnpoSHVNVGZKb0lkeXZscFZlN2ViT3NUVThlbWY5TE84TjNTQllW?=
 =?utf-8?B?Wms3alE1VHJ2UldtajM4akMzazkweGhDemY2eFptMEwyYWQvS1lYeGl4Z2dS?=
 =?utf-8?B?eDRGcXNydFJsOGllYTc3Tk5YRm5WMkI3eTIrOFVoZUJZSXhhbktLVmRvOVNQ?=
 =?utf-8?B?SWx5TGdac1l1ZDNFQnRFeTdhazhsZ0lxNk1aV2g2M05vSElyaGp1NENjdGUz?=
 =?utf-8?B?NllHTHNTRTQzQUZBaHd5aWJ4NHNYdnFPMUNMU01UNGhoL25FZU0zd1hGVjlB?=
 =?utf-8?B?aUpiNml1THR4UlpSRUszSk1KV3lLa04wc0lmUU9NNGZLRHM1a0dSRVVzdTNR?=
 =?utf-8?B?K0drRDVrQVpEM3dwSTdFYUxwdUtNemg5MHZ1UzdKbVRYcHVJSk5CaWFZZnBx?=
 =?utf-8?B?YU1tL3grWlp3b3U3SW8wVGJnRkxmaTBsZy9jNzZSbjNLU3pRdjJVVjVlLy9P?=
 =?utf-8?B?eFZ4a1VpeE1Yc3lmbFNNYlg4S0F6VE9QdTR6QkZ1ZzlaNFYrQzM5cXNWT1ZV?=
 =?utf-8?B?a2hKZ3VNK1BKazhoWXpjUHJ5Z0oxdEFIaHFGUTBmeVpoMlVLbnBMQldpdXlX?=
 =?utf-8?B?cDgvdkV0UG4rekhvSDhUTGVQcTViZzJWVncvQ2lsbDE5bzBoTTRCajJtRUN3?=
 =?utf-8?B?eWZCbVhLMlFZb0lHQUhNeFpKcHIycm41NXRUTUlqQll6OGJIL2tWejZESDVQ?=
 =?utf-8?B?N1pld2craEcyd0dUSXFFYkVpUDdGZ092Q2ljTkNGYjlUN0R3elVDcmNxU1di?=
 =?utf-8?B?NnhSU04xeDVwVGM4RkVRS1M1OS9SM3hmM2NiN3ovZUJCa0ZsRmFNdjgxVDZy?=
 =?utf-8?B?SjczenlFRE41WlRiTExzRGR5bE9qbDhOeFRqSzR3ZENGUm9tWHp0dDRPaVlI?=
 =?utf-8?B?LzB0U2dZaEhEMXFpVGs0Vm8wY2NRREVzcVdqa2JRQUQ4MnM1U0RCYWN3d3F0?=
 =?utf-8?B?V1lEQndHYVFqZUV5RzRCajJ1T2s1Y1Nra2ZPTzk4M29OUWI4MFdLQkJuYTUz?=
 =?utf-8?B?R0cxdlN3dWFEMkJUa2YxOURWTXo3OFcreTNVYlBRV0RINWwyUFZmYVU2alNp?=
 =?utf-8?B?ankyQ2J4RFpDTmhIMG80M3JtLzVQNWdkcllPWDVCVmtXcGhTaTVhQnVXTFJX?=
 =?utf-8?B?bDdPTFNWWHA1b1BaZTRhaFAvNXhvV2xVSmhjUU5VNUs5L001ald4a0pzbGZE?=
 =?utf-8?B?MW1nZjQxVGhjOHFYUXl2N1c0TmMzUmg1Z3hDeWhLYnQyR3FuTWp1bm1UdVBZ?=
 =?utf-8?B?R0NOc1ZPdUZESVV4RzA1SVZDWnYyQVJYWkFMTmRKV2lRZ3gvT3ErWjFrekRa?=
 =?utf-8?B?NmRXdVhMd1pYOG9WOTNVaWlxakd0aTMzQkhUSDRpVEthbFNlbDlObmhydExo?=
 =?utf-8?B?M1JQQW14ZUpzZ05RY1BBa00xd2N2bVhWVGp3K0ZRaG43ZDhGRzYvSXA1a1Iz?=
 =?utf-8?B?cVNiYU5WdXh5blErdngyOFAvU0UzWHFHeDhzWjNkZWhmSGlYa3p2UnJub2xJ?=
 =?utf-8?B?QXhxU05hdk45QU9OSG16TnFud1lkMEo1dVFNdWtYN0E3M3NEb2NiejdqSWhF?=
 =?utf-8?B?K0FxbS9kQkRpSldONnJlUkZWbWIvcUtKODdNWTMrTE1WeGk5QTJuYUhFUUlU?=
 =?utf-8?B?Q2hHSWsvdzJMMEZyQldnVy9oWjhvSlZwaWplbW1EY3ZsMkpoTEw3YnhKZEpo?=
 =?utf-8?B?RmV4YXJ3ME9YQXBJUjVQc1dOVjNWOE9rUHEyQVpQRnN5SjYxWTd0cDJDSzQy?=
 =?utf-8?B?OUE4WE1RQWFwQWttNzJoUENXc1lid0piZmcyNlVkWmVDS0RqSW95aXZOTHIr?=
 =?utf-8?B?OFNRWjVhaUdCbTlvZHB0RnZnY2tna0I5MnpLbkNyV2pmVGFXQ20wdjBYZVpu?=
 =?utf-8?B?anBhQ3VkaUY0bHk5YWhkaUhGN3dzbTlScGtSUkJST2d6eGxWbGppVmtqUXVS?=
 =?utf-8?B?dEdOektuSFYzS3NNdnAxeGlxMXdMUHNabzdDRk5YaGcvd1V1eW5EUGdVaU9T?=
 =?utf-8?Q?nAo5vA5/ynZS82nY=3D?=
X-Exchange-RoutingPolicyChecked: BwqObZlRGrqQt0lmqSXDoqVS7Xr/2TUbtq7TajHnCpsJ9wcIWec7c5szlWyjJJRqyN8zJP5Zs8CucnZ7pKO7eZEghjxOM006cZerU0ZNp72FA3qJBNxDblAmwwhblOKtFFtEahjQswXlXroBjy1d8YKn3/5vtWbmyfaWRlyJ6fobGuBsHN/tYe5FhaCnjRhNSRPru0IeR3VRQ3ZGIPcID4Ze5qx7fv/J0YveTk3IOVhT6u79m9ysv1GB7SGb1sZledBCcZbUCkU5MaXEM5Nsqky6Lhd2vCORYlx7meFvtDRAouvAUX76nqF/7Mf2K8zGgfFLhA4neWcG9bZPKGEmvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6caf2c2-575b-4a6c-8de7-08def823d8fc
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 03:43:18.5641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhJ75hXVCueiXrH4NqP2RzGazH9+HP9rLRnjg8i6xojOZIhBZrpXjgj9YLyrWvkr9gicV8ymtEJ7uu0Ud45nIKO+onD7QTQUPMh7/+ZyLVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
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


On 8/11/2026 11:28 PM, Suraj Kandpal wrote:
> Add intel_ddi_link_symbol_clock() to return the DDI clock frequency for
> a given port clock:
>    DP 8b/10b : rate
>    DP 128b/132b (UHBR) : (10 / 32) * rate
>    HDMI FRL  : (10 / 18) * rate
>    HDMI TMDS : rate
>
> The DP case reuses intel_dp_link_symbol_clock().
> This will help in upcoming commits to decide value to be written
> in DDI_CLK_VALFREQ.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
> v1 -> v2
> -Update commit message with correct formula (Jani)
>
>   drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
>   drivers/gpu/drm/i915/display/intel_ddi.h |  1 +
>   2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bf5788c5bbd3..dd9064592ec9 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -1529,6 +1529,17 @@ int intel_ddi_level(struct intel_encoder *encoder,
>   	return level;
>   }
>   
> +int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int clock)
> +{
> +	if (intel_encoder_is_dp(encoder))
> +		return intel_dp_link_symbol_clock(clock);
> +
> +	if (intel_hdmi_is_frl(clock))
> +		return DIV_ROUND_CLOSEST(clock * 10, 18);
> +
> +	return clock;
> +}
> +
>   static void
>   hsw_set_signal_levels(struct intel_encoder *encoder,
>   		      const struct intel_crtc_state *crtc_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.h b/drivers/gpu/drm/i915/display/intel_ddi.h
> index 580ecb09b8b6..239d5a403f91 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.h
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.h
> @@ -81,6 +81,7 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder);
>   int intel_ddi_level(struct intel_encoder *encoder,
>   		    const struct intel_crtc_state *crtc_state,
>   		    int lane);
> +int intel_ddi_link_symbol_clock(struct intel_encoder *encoder, int clock);
>   void intel_ddi_update_active_dpll(struct intel_atomic_state *state,
>   				  struct intel_encoder *encoder,
>   				  struct intel_crtc *crtc);
