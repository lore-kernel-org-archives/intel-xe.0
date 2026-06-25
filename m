Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7C0CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C0910E2C7;
	Thu, 25 Jun 2026 23:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+OF/6Zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452C410E2BC
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782430831; x=1813966831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z9c2XEyGeJONZxRtxr1M0FuHwV+nZZknwkScjbWnykY=;
 b=j+OF/6Zs9YSv1QhJhyp9MLvkrKHANOzkimXTMs050O/MnNrdxVMxARzl
 IKGkC1IHDpm7quVvInRGrILMkleLl4BTmVJxrK8GJytPNQYQdcAq4EL9z
 JEtFVon1iHPc391ttDoS5xdZrdHoX+ED/EMFpto92vSXKo++sNJXEMv0P
 Cibf0Q/hC2fdPYtGZ3Glwfq/hcbz6cIivbns3HQUOanyR1w2o0uLDnBfC
 bjslLDYVElSNRJm+C/IeShhFiQJHeB9I6KUljJJ5oKTZdBwWZXvMn3izF
 SJgSWHwEa7m4GFBNJB06lTSzXo2EF2ZNi83kJeZt71XpeuB9Kw+k3W3cE Q==;
X-CSE-ConnectionGUID: q4k89OgGSXm4VGN3ZPfATQ==
X-CSE-MsgGUID: Dy8S6VnAQsa9PvcbFqkBxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83103226"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83103226"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:40:31 -0700
X-CSE-ConnectionGUID: QDERHfe+Tuau0QJ/f/hq4A==
X-CSE-MsgGUID: fJe1Mk5IRS2OpXII+J1rXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="255581177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:40:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:40:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:40:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0ftauaU9imKD1KPbprC1DS0cVpajCjIWUJLFNRzir2NyQtDv6waswTTMKetePzi14oF3R6be1jjuO3dmG5+NV1wPoRGEMTR6NxpxDW7vVIhqw/7be5OSWdffDepPr9FIhBus9k/PqpLP65cUYe2HrQSMu1sEnaKKF0pOgz/GIFi5AnYLpEK6XB6tGEro8RDahtcC/JdSVQZGjFzCSgi77MM13ZpXqH7LpFt4VoZOjoCwyMaHG4+mcXBG+wH2fqIzJyH/Jx0Cegm/MV1nXQHQ8y5N8JFfAnNCRTwsYH6iSgAwofZ4/e57n3OzRoe/NH6nZnPnSYeqQl/n1rmBYiPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL0sG+OKfviNcjzC7KotMpGzH+S1aOQkTVPmAFqOrRk=;
 b=EkAjdRkthjH8ENEAqEfW4/NLAo5zmPbyn8fgyJsblD8uPmgh86ndd+gFjdUUeTd+Snez8E1UaXiV5ZYYvmXlGE1K6YBiQBsnQcZeBHwwmdOpZLMu1wW2ypkgrbdidcJo9/oewQsa7ECqICLf9U9Dr+iuKzNGlGiZ1m43cYIzPaztELy3+nBGxoOC6J2TNe1RR/+v58fMC4m1t56w6aL+i8uHM66qRjQoXdsAuivIaQh8FSJM9ZSCyWOg9J2VfX8AaNetNgA+FgH8azM7U6APutDIPIhUioGC0x70RFgMzBhl1PhGSFrb0BwR1BCnr4NK/5CtpMP+tQjYjSW4eAclwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 23:40:22 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 23:40:22 +0000
Message-ID: <c24f22fd-86a6-4217-8ad5-cf5223589e08@intel.com>
Date: Thu, 25 Jun 2026 16:40:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] drm/xe/uc_fw: Allow re-initializing firmware
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-2-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260603101814.916948-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecae485-b8ff-419f-5a75-08ded3131f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jGJwVXL7F6K4rncU29G8q/L8OjfRa/tfdHQMpZ28VxlUVFR9883AqtdpQ3mGZ1OvO/MaDwvgZY5WP01vew0rbjoWAr6yoOgFlImDl4q4bszUrbK4H2Ee+YfH3ruisJBbr0qWCuFtGR2mBL8HHMRscdNQPfcVwXeLainwBUoi2SVSi4PkPELRP3xIAPh7b7QRS6jBm+wCmF+K0SIsrmJt0PfvJyagvwhZqT4/38YlVqkGXxPxAkPlk2tUXl1EWbMOfGOMHi/HI4DrkkUEsCSrO77ocSpSpw3SgZILrMlSi9vYHcLkzspmR/jyiM0k3ckAsgAydopSd2ghUjiLHWSGX8kuWuWbqfFVZ/B0WZZ6ONDMNsE0RK4eDKh9ajUkLQa6KVCTaD62sMWWlssKPs/1XnVS+2XcUbfvfPVMHBhfjUh/vbHYAtJkyOfJpsZH9fCDIVf79g7txcK8rg5tufJ2tST+o5bsYv8ck9c2OjEiU70/kSeuGK35DQjYe+1IU3aaPSFO1uY5UmBuWzYczfhc+oac2aEkW0Abq5WLXFHjcLYwkicXVmPrssubhK6lr1/7SrZ5eXhh9ll8XPVcCUEg0LMBX5kMDSvfRhvgzF9EIynYJA625gV3BHUV1PkRR2WoILxG+YYZbqzHTw3a12eGyygA5VT/A+HlcEF3m0xiaa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk9IcFFPMXhBNE5XUU1RbGFPaWdhQUtoUmQ3S0dpUFJwZjVDbkg0RWZzYVkw?=
 =?utf-8?B?cWhmREluejg2UW1pT2hSOGJsNkpEcWlHdk5SYVNNQmxKMGhBYTUwMEhwb3FV?=
 =?utf-8?B?UDBJbGlmM3pFL0wvQ3crU3ZMdlV0Z0NrQThkem9JZlNzd0hrVkZ4WnlTek94?=
 =?utf-8?B?WWJtcGlqbXE2M0RpcFJjR292STl2dXU3UlBWMTR3ZVlxUWpmalNvR1ViK1d5?=
 =?utf-8?B?UEtmNXFrR1UvODBMczVJcCtsQmNSU29zMkZoVjBubFJrWGZoZnlleTVZeEtu?=
 =?utf-8?B?dmhTUi91N1JPZGpwQ3Q4ekt2b01CM01HSlFEWkQ1VGI3bWJYUFpvZHBQUkpO?=
 =?utf-8?B?KzI4dGNsWXdrWmNhMUZxSnhrdGlCNzJMaGVyWGhXTUlkL1Z5bWVzaVlqeHdP?=
 =?utf-8?B?S09SZUcxUWhWTnZWemNsaHM5OUlHVllvWVJObXBONWVDNFAyek1iK0ZkbjJX?=
 =?utf-8?B?RlFDc0paOU9jbS95ZTJZSE4yY1FyeWoyWTFWSWFDRktnRHNxT3BWZ2IrcVp6?=
 =?utf-8?B?VndENWRxcUV0dDZTMTQwYXRjeGZTUVZYNlhBWXJPVzdrSHRFVDNaMGlDdnJX?=
 =?utf-8?B?aEc3NlVnTlZmQktjWWpMMVVJTUJ4eHVtU05kV1dtYXY1Z3I2Zyt2eTRnZ05X?=
 =?utf-8?B?Q3lJOUZwQ2FSVmp4YUJXRmwveGx0NmoxdWYxUVZrNmhoZTg5ZXI0SlJiL2RS?=
 =?utf-8?B?K1BQbmFTK0hKenBvSURPU1FJSGkxLytBeFVaQnAzWkFpczd3Yktzc1FEWDNy?=
 =?utf-8?B?OWFBZm1haFpoQXJKdklSeGVJZ0FqcTB3K3NVd0cyNkIySVFzVnVSV0pZZjlO?=
 =?utf-8?B?SXBBaDAwL3J0OEtWRm8ySjRCSEh0bVp0bTNuaEVFaDRMZVNXVkpWODBNRTBa?=
 =?utf-8?B?cFZGYnFUTDJ6MzVEeVM1cUVDQ2N6bit0Y1ZQbXZ6TXBGd2ZoZWJ3WS9KRllJ?=
 =?utf-8?B?aUlVMGZNdVFUWDJ1ZENXcFRHemxxL2psZ1FoSG1Gd1Nud2lCQldvTWtiZmZ4?=
 =?utf-8?B?Vkg2K3QxeFl3WmpPVElEdDFFWWw3YkV0YktsU0xUajdGY042T3VsNnliZjRI?=
 =?utf-8?B?N1dNclZxbDQ2MFQvWm1tLzZhR2FjN1IrMTVtdWFOcURGNHJWdUVlVWFGRmxr?=
 =?utf-8?B?dGlONXpGT3NLY04yL3NFUkdzbXFIYjZaNjc5RWNRb2VlMFhmRGxOVm1JdjBo?=
 =?utf-8?B?UmZObCthTW0vSmIrVUJCM3lobzhYR2h4Sy9MaW5RU3FxajJMekhKWWtzZ1Q0?=
 =?utf-8?B?QWNYbHVvU3RNdTBWU2VnODdTc1crS0ZYUnZJcGYyT3VDQVpqS0d2VmxNbGY1?=
 =?utf-8?B?OFhjT2p2R3VlY3I1Vmc2dldQcjNwMTJwRXkxcTcvU1kxaDN6Zmpod09rUlRm?=
 =?utf-8?B?cFdUcEIwV0M4RFUza2hLaDFPalVtOWJDWlMrVW1HVFNxdk5zaHNoMEFaZ25F?=
 =?utf-8?B?RzNrSmdLTDIxdlpFRzcyZXQ5di9NRlFFNzhIS3pFRVoyNVMrOHgyOC8xQ29B?=
 =?utf-8?B?UktXdTFuTm1mWXl0eG45c0xWVENjeWpaV3VOOG1lM21pMldoZnluc1VNOEJj?=
 =?utf-8?B?ZDJ1bkpoek1HUDVzWXY2dVdPR282Sm5UQ29tMW1Ec01RT0h4NEo3c0FEVWlU?=
 =?utf-8?B?ODFaY2lGYkNYbTFuaUx4SVFzeTZqWlErTlZySDE5emlVN3l0OElDVGMzR25U?=
 =?utf-8?B?MXUvTXJ3YTR3NjVvRGpkYkVibVRXUk40MDk3K3A3QmdCMG9BU1c0QTJ5cldV?=
 =?utf-8?B?cWFpR1RRd3F5UUZsc1RtaGZHRlhPQzBIM0FzOHMwQ205ZkpzWmpmT2hEVzM1?=
 =?utf-8?B?cW5tdSt3RWhSVFh6SjZsWXJia1RCM2VPemNWMUdqb1dWVU1ZMHFtUU1Zd2o5?=
 =?utf-8?B?ZzVGOVRTUmJoU1pEUWwvZmZ6VXUvUVJ4VFF1TnNXS2FmWEdqazdhOGdqRW1Q?=
 =?utf-8?B?eDI0Nk0vbTQ0L3VIaEhaKy84Qk45ZkhNZmRHTHkyS0dKQkZqM1gwd3NHZThM?=
 =?utf-8?B?UDNFVE90cFRrU3hkYlZxMmNPdUF6NkI1b2d5RGc5WG5CeDZSVjUxbkQ4WWFF?=
 =?utf-8?B?MVNLT1RuOWIzaDlSN1d0L2UxdktsM2lEYU1HQTFNNVpNRmIvMzhqbmJ1UnhB?=
 =?utf-8?B?d21paVpEZW55WThtMm1PS0hhNlhubGE0c0xnOE84VUh6ZlBHdjJOQzlNQzhn?=
 =?utf-8?B?OFpOazkyRTZBdjd4SUJ5bnhnK3VHMXBtODVOWTdDKzFqMTVuemYvbVlrZkVW?=
 =?utf-8?B?bC8xazdSd2Urc09CcHVVa01TRG9sYlFoNGdkbHhBS3N3UzBKMnI1eXpSU0Uz?=
 =?utf-8?B?R2VGTzcyWnNLRTF3Zi9kVnpGSE9hbzJIZktLM1pjeWI0ZU5LQnJRdmJxOHNH?=
 =?utf-8?Q?Aqq8GY7xVWXlrT5Y=3D?=
X-Exchange-RoutingPolicyChecked: Zaa+VZerdxOa4lz1PTSd+RT0CnAoPyJb8CrQGXsJYyPOot1EKZtqt+YJ22gEaEAhYwzG44qtMUoyqMZIlyYTPA+9eG2iC3+RgHe4GzweZvqixT5MvjlqQsn74ss22kBxL7of29RPziVZSPn0QhXD1OFCz9c5zj+vyaIquB/ARx9cmB8QoC5+WNemHdUve/HeulxH8Tu1ayyhXKdvVnpB6Fzb3/Hv64ruCisCwkKbmToz2F0H7CfUDXwYjJLhpIQoeRs83iQHDP1vLXJ9S99Bz+jvWv1NEA/IUzqnt4PR6lcJglKm9t0xKCvKA5X7SITrgFpuso/SGBfVBffwjBgQ3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecae485-b8ff-419f-5a75-08ded3131f9f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:40:22.4774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7s8N9pgLvBTkWoXsIuy5bUvUPkLsvaYFzW6uK58dP+zxag4RUMdG43kmJhlotXM6OUmCpXh5VzPztDTyMnZHrgdjiRqyjjwQSMcywdZiH0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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



On 6/3/2026 3:17 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing firmware without
> reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
> already exists but since it's contents are on VRAM, they are lost on PCIe
> FLR. Copy the firmware back to it's bo and mark it as loadable as part of
> re-initialization.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

> ---
> v2: Add kernel doc (Matthew Brost)
> v6: Skip uC firmware selection during re-initialization (Daniele)
> v8: Set fw state to XE_UC_FIRMWARE_INIT_FAIL on failure (Daniele)
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 67 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
>   2 files changed, 68 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 3f08a3b54062..158ac15dde55 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -833,6 +833,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>   	return err;
>   }
>   
> +static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
> +{
> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +
> +	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
> +}
> +
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   {
>   	const struct firmware *fw = NULL;
> @@ -856,6 +864,65 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   }
>   ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
>   
> +/**
> + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
> + * @uc_fw: uC firmware
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
> +{
> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version old_fw, new_fw;
> +	const struct firmware *fw = NULL;
> +	int err;
> +
> +	/* Make sure the status was cleared the last time we reset the uc */
> +	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
> +
> +	/* We shouldn't be here for the firmware which wasn't available */
> +	if (!xe_uc_fw_is_available(uc_fw))
> +		return -ENOEXEC;
> +
> +	old_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +
> +	err = firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
> +	if (err)
> +		goto init_fail;
> +
> +	err = parse_headers(uc_fw, fw);
> +	if (err)
> +		goto restore_old;
> +
> +	new_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +	if (memcmp(&old_fw, &new_fw, sizeof(old_fw)) || uc_fw->size != fw->size) {
> +		drm_err(&xe->drm, "%s firmware mismatch on %s",
> +			xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> +
> +		err = -ENOEXEC;
> +		goto restore_old;
> +	}
> +
> +	uc_fw_reinit(uc_fw, fw->data);
> +	uc_fw_release(fw);
> +	return 0;
> +
> +restore_old:
> +	/*
> +	 * parse_headers() updates version details, so restore original version
> +	 * before bailing.
> +	 *
> +	 * TODO: Create a struct of all the fields touched by parse_headers()
> +	 * and restore them all.
> +	 */
> +	uc_fw->versions.found[XE_UC_FW_VER_RELEASE] = old_fw;
> +init_fail:
> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_INIT_FAIL);
> +	/* OK even if fw is NULL */
> +	uc_fw_release(fw);
> +	return err;
> +}
> +
>   static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
>   {
>   	return xe_bo_ggtt_addr(uc_fw->bo);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index f2d3a3e7208b..6debdb924310 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -15,6 +15,7 @@
>   struct drm_printer;
>   
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
>   size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
>   int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);

