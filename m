Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28459606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=amntIjV0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A4E10E46A;
	Tue, 27 Oct 2026 19:28:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA910E473
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793129276; x=1824665276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6LnLtvoCQ5d7ctN/eC0Z1xguWu94N3MjmH6AAvF1iGQ=;
 b=amntIjV0SIOy6bqZurLTe8xCwJaZ2R5F7q4bslu3gb55EEayrZlUHrPu
 6I/dZXpHNU+ut3ILOP/ek4A+sc5Nrz5n1/ca1c7k8R4ZGUfa+UWBXwnXq
 9COn4r7x8ovAIr0AYTxz+jmHQSC+UXYU90yvcxHgwtsSerT7HiKWbYVzj
 7vSq1ncx98cb7HRsflqko44wG2T+4BcIPORioWHMQZVBxQ/kF2R6nyNom
 lcxhlycUlZtw82GA1DARbQvUcOn7yHfMZ2dJ4D8e3VR+I2JE5/lCuUpVx
 JVpEN5JKT8MntvGzqUwtcPnIOmmXR33PaLi0HTU2ApvWxvWqS4WDek5k1 Q==;
X-CSE-ConnectionGUID: jzbmnuKdQ+uaVD8m59KQyg==
X-CSE-MsgGUID: iMjPTAm7QgSYThTVdR1WIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1723748"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1723748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:27:55 -0700
X-CSE-ConnectionGUID: Uz9pIHyBQGWW8J5TEO29Ig==
X-CSE-MsgGUID: dBBKZHe7TQGlMbJyx4oQeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4636327"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:27:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:27:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:27:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEjurGmcYy3AwaVfJCikHM+fwjq/iNeyEv9wu0ylpLty43CqTyWKRZ4BU2k+E4ZDX3qpTl7iKaCmOmHmhznuz36VSa3400nl3Kj+ilyQl1IoycRrfefC0cxLu/hEsjy8GlJfVOUQQe3alTMXZ45cZ4XMmmfx3FLWL09g3MhnMXkHEbDg+5KM8yzUmfFtm/OEoTB5sYz4MXGj5V6mZd4mgCRjU9Mtn+N+TR82jDpswGPS34xE8BiwTm1lX+31OoL9W9pPyVm7tZ/trEaul5LdbMS9/s01LPvIW2bSiE+BPzd2IYvvzqlPgQ8Pi0xcs2yQ9l1L1AVlXpmvzB+ENV2UeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOAOLQip0TdZ+zUlTb3xjtUBtie+uvLxTQw4LnmdJig=;
 b=vIpzm426RiVV1K6UeNn0IuAhIe9TD/LoVxFeUyhd2aNKlgR+9wDVdN9ynGp0S6WeMXuTcNOTNqQTCNbXEn9zCPc3/0ozPdDMpUUGhZeDp4WkYY4Fm2srD9NMmA1LEVCYPeyk0SHHO2/usbafAp/5RaSOSrZzWe0W/AlixLL3Lthx+uTvysgjw+DWMx/hqwqW+LRAt6S1iUOE9+s9x7JoUfB90NkL7daLDSSpdxwvQgH4moMlPOl75siIfBUHtRnYXk5MIZ4n+5gWNGYz1DCV34pMU/r8wMqeI73VTjRjknEHwVNVWgaIN/EbUv8QfacuK3j/BU0LYI5WntY35yOOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SN7PR11MB7066.namprd11.prod.outlook.com
 (2603:10b6:806:299::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:27:52 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:27:49 +0000
Date: Tue, 27 Oct 2026 12:27:47 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] drm/xe: Bail from adjust_idledly() if no
 applicable workaround
Message-ID: <20261027192747.GD203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-5-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-5-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ec5bb4-31c1-41f7-c939-08df3460633e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10070799003|260925021911599003|260925021311599003|260925022911599003|11063799006|4143699003|56012099006|261022105027099003|261009223027099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: wCz1rC7Za6AiNEnB+ecVZFvLNrGBvw8lUo/tssn91rNOZOhWzNkm6O0Ivjy3/Nnp6ui9wKOmceOSLfOyndL56UkckWYCM7oDNlALtvuWBnWxVPmTgKk4otdfMmX31G+tm0DAv4zJ6dky6Ys/wYttev8eVNKbN1ZxomgQqxgCdswnC2QWT2NksciUeJmdS0B7zoyJwrtXaDIoTOema/tN1IHCIw4asyuA5kFWZdReiB+FXaK4kKkv2gsxCQdFysW/tad8hryGXdiHjfTTH7Qt4kfHTPisuyCHxep2lzR1/FSKuvlG/RgHFSXxqV0jZhK0hBPINzY1rt0F0YRMtmgdCElcw/GmEU37MB7+aUGt/QuXm+WV9LwRyJU8wEDxGnjq+NeFIVCgNltJIXD6BFZk09kBwNcpefHzbwZOuZ3PAtmxVX/sXY4pfJGRIqXej/8It9aJQ+zL03pr5OMMSornkJg+WRv8D9+7Ap4c0PdzPWcd3+08Ho4wyp61mGZS6gW7e8TBwSCVQESldnoL6w/xOnSmYUsxgiNBuZHCTFj9pTBXP+VzRuaa0Ocq6EYGNTUosfsBGhuqlAazEDRl7eZUhhUUH+jxCQFlQvc9xSda5USwmkvJIPShdF9YyWwGUCFilGkgfp8M3gb2wQlwAGFTVpOBLT2ssiY9ukVoQmWxHsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10070799003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BY3RR3TwL8NRM0bBCNMqqEGfU/nSH5eyZd3n3Jgo7mFoAYxR0XFth8GCFLzX?=
 =?us-ascii?Q?AmKCBafPJjuMn5PslP0OK983rerg+ywYcx1tsHevDKez1rG0IC2XZ3YqZzWi?=
 =?us-ascii?Q?O+ARMWUmDk2BF6FNzx5mJ4oahf8U/YSnvDKex87BhJz82NAOBBGA8QLJZCKB?=
 =?us-ascii?Q?QcqhwE2OZdAl5qnlMAhQkEaE0Udh7gXazCFv/5+yuVuG+9GT6qBxzD1PR562?=
 =?us-ascii?Q?z6YXzxTz7ojWjGwPmRuTZk1uadEhq+HWuXHETUUA38Ms95cViPVIQUk2P0Ea?=
 =?us-ascii?Q?t0/dUdcNCMZXBNiKXvr3Cvdlj71VR/35cz57MJUA8goFVCaI85gtc3loWJw0?=
 =?us-ascii?Q?dJGFqdWxzccOZoMfaWBCU+o3oyiuUBzji6TV+snvbOjish2AW0BbEEP2iC2X?=
 =?us-ascii?Q?/jcVus/GaF3YeK0KlWrw2uxAWlKSr0SE6uTajyWt2aUdfe680eQraHDz6uP/?=
 =?us-ascii?Q?GBqlU1xKJsJia233Ro0zDJtV2+u8WtSB8O/J3K8mRZEpJj4shPTwcXJQNz8u?=
 =?us-ascii?Q?LY0PivKki1TbRHecJTv48+G10ohZwCw2+o2TiZ/HvuSmnbqVo15aLo9BGel3?=
 =?us-ascii?Q?I3lKSJUncAWJpYEx5IQ6/i92fyuQE2DQOKi3isu+N3eL7a8WIPkxqzoDK/Ho?=
 =?us-ascii?Q?UhycAq7rRVll+dfSp9dX58+ZFIxIeRhU38S/sdRjB1TtdR4k5U7duTik1YQ9?=
 =?us-ascii?Q?uxxIxsWWKsgwbjh3AygQ5av6pyNo8GB5yqGZez/r9k0FN6qzwtJD15b5XgPV?=
 =?us-ascii?Q?bzGendGUMjdn2EMnOfOJDbyT1DbrtQ+zv/e4nDs+ge7CMutrXomiq5vkThhR?=
 =?us-ascii?Q?q2geR3js69J6rGtugE0Oe4GnWPlLDASSayEf/1EQAvcf9/U41ftiIUtHq3RH?=
 =?us-ascii?Q?z7nEJWqKvIDzwxlGqYDMYRYuQdIRt3Zlq4ApMDVyKNF5m2P6gbHyOghbH56F?=
 =?us-ascii?Q?Y8z/RYbc+P/haoDgeQ3ckx5NXCSQKYHRVqbOJGC58NmJFYuqEgA+t5CrpI5J?=
 =?us-ascii?Q?rPpHvBtQC6/Chwh01Fpt1egJ3qGxW1v6mP8nY0BO8HB6MAdCO3f3dPgwj/oh?=
 =?us-ascii?Q?+VCvUBK6lV3typvoJmplcKRwF1658nMMhL9ekYq1jBB2c3NijEXLjb20N4L4?=
 =?us-ascii?Q?HtEACg8gXtNgZurVhXV5ObceK1E7TFM2HPx5Xok0u65iKOewy6UzS11aVOLn?=
 =?us-ascii?Q?wVPgdr5QZbx4Czfx7kLbsfOUpEce+NHuibcFyIQ/jXwf5qKrue+lYFf7AJr3?=
 =?us-ascii?Q?ZvGG5Z07+t75HnUcA0FJ+si9R61SRcuN/ZVyKCVov7iPXTHvB6lGEgtzx9Zy?=
 =?us-ascii?Q?8b00wkjrc8Cgq65oAVqLKNjbxHB6deP9w3tRsIR0POLJPzyhYUCovPx9oLw7?=
 =?us-ascii?Q?+FaOxsFlQ1K1d383SSHaBxLuUkeoX48E5FDrN1czWG01i2Z3l7sfv61yJkbO?=
 =?us-ascii?Q?5fsQVSPwQOaYxHSEokgDEjUSefIMG1QRG9fhWFcKLMEoXQGiWvd4+ZdPEYop?=
 =?us-ascii?Q?2YH4uFaG1kRUmyJ9Js48Iw/vEPDXSqo0RbIktul0EPOGjrL4kUaAgr67hJ+T?=
 =?us-ascii?Q?OxHfwl6Oc1Bbph556YMh9g0OruLEBx0Ky07/1FES5A5anjsv1viFxZSZn+Du?=
 =?us-ascii?Q?3YrioFuMCXJdrI1omvRgOw66/e5kTNLvSIzwFkMfHWVV+f3W8ASpS8RcZO0z?=
 =?us-ascii?Q?Pc0k1BX+6nIIhzMF+pNGqj1EknvtQD374d59LpSdai8Zo/tdJEz0P/ZXHLPB?=
 =?us-ascii?Q?hzNavWoc0Y781lfmf0Swcb8CB41Z4I215DFqVLw6tr05Qe/9b4KCo2poji9G?=
X-MS-Exchange-AntiSpam-MessageData-1: /ztngDiNm1vPq/NxjjMMOFH+s67WwScR6J4=
X-Exchange-RoutingPolicyChecked: rjXx2/gR/PYtqaKafrjNqmSIDcEMHioyB6Japn/I3nt3FW/1oQSGd4b64FNQLIWlOZ99oEpIy8AJ17gYQb8W0grKCsS1FhygIVBQvNcHSQKYmKaQRF1lvtXKKs2d0LbqX9bXTzj0p75y83zhx7F7OpcDfynq2JkZ5ZQKJSr/Nwf+h5P7Q34iST+C7XlqBDzqE/M0XU0XE4jijBLeM1Yqk6biAdUfxQ+io2sHXzdKjpvrJZQUY/Hh+W9U5MQOl7i3vMMc8sS8Jdz9Dl1YNsoiLqcqN/Gzu+lGZUn775m8ZmMq1MHYIzlSJbvC21me13F8XkUgr3k0S1o2Sf6vXam0ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ec5bb4-31c1-41f7-c939-08df3460633e
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:27:49.8719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvhsBgwtnKp9h4mm9ahwp/2KxCnUBud3BKOkERj+Nnm5ZziPL6a3DTnfFCJpfryehuNGvBnDbrAukRZjuRsHWM2ZTjPIGplqBzfL3JTAc0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:33PM -0300, Gustavo Sousa wrote:
> Re-organize adjust_idledly() so that we return and avoid touching the
> hardware if no applicable workaround was found.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0c9b510e7cac..9f0fd10afd4e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -605,7 +605,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	u64 idledly_ps, idledly_hw_ps;
>  	u64 min_idledly_ps = 0;
>  	u64 max_idledly_ps = -1;
> -	bool inhibit_switch = false;
> +	bool clear_inhibit_switch = false;
>  	bool wa_applied = false;
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> @@ -616,12 +616,6 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  		if (!idledly_units_ps)
>  			return;
>  
> -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> -		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> -		idledly_ps = idledly * idledly_units_ps;
> -		idledly_hw_ps = idledly_ps;
> -
>  		if (XE_GT_WA(gt, 14025941587))
>  			min_idledly_ps = max(min_idledly_ps, 5000000);
>  
> @@ -633,13 +627,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  					       max_idledly_ps,
>  					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
>  
> -			/* Clear the inhibit switch without disturbing a valid delay. */
> -			if (inhibit_switch) {
> -				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -				wa_applied = true;
> -			}
> +			clear_inhibit_switch = true;
>  		}
>  
> +		/* No applicable workaround found. */
> +		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> +			return;
> +
> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +
> +		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> +			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +			wa_applied = true;
> +		}
> +
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +		idledly_ps = idledly * idledly_units_ps;
> +		idledly_hw_ps = idledly_ps;
> +
>  		/*
>  		 * min_idledly_ps is applied before max_idledly_ps, which takes
>  		 * priority if the two ever conflict (not expected in practice).
> @@ -671,7 +676,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  
>  			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
>  				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> -				  !!inhibit_switch, gt->info.timestamp_base);
> +				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
> +				  gt->info.timestamp_base);
>  			xe_mmio_write32(&gt->mmio,
>  					RING_IDLEDLY(hwe->mmio_base),
>  					idledly_reg_val);
> 
> -- 
> 2.56.0
> 
