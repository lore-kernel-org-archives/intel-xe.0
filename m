Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F0606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOzwawRG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Qaxpsdeu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5B10FD70;
	Wed, 25 Nov 2026 15:56:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C9810FD5D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 15:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795622177; x=1827158177;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CeoZSVcZm5vMYm9fQHFkO28J/e3C1w2XXOKtlcqqq9o=;
 b=OOzwawRGI4TX1BsT4hQHl7pII/k5llRu8cANJrHrrKL5c0ReD6sO8uZ0
 HONe+aRbzrFmByIBMYyz0QvBIriHSm/0BL2V6a8xsDk4bBm6ljReb7trq
 KrnrMADtwyStuz3drUFsT1k9RWbTXQSHRsSb6GcggqtPlxeDOKzSNnie9
 t86zWNe3dmc83EeLlYh/RDm3XpFxXDb+zV5xMdOG/qdeZI5SoWlE1cNvU
 Aw5ilGZ3FpCdeIsAhKb4f2oR+vnMj7ENSfKvkldPx7d3KTRK72VllxeYo
 +D8T3d3a1iH+NpFWiwN+t2Zmfn59aAKSgIkPawzTE8lsHu4br7burfZCX g==;
X-CSE-ConnectionGUID: DSMKwAlCT0+U5TW4xzkNLg==
X-CSE-MsgGUID: bfrQla6aS8eTO8GVZw/WcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4363802"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4363802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:34:24 -0800
X-CSE-ConnectionGUID: 9ojbwfkLS9+t2X8shZq/BQ==
X-CSE-MsgGUID: cQJBdw89Qd+EWt7TTHdatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11779349"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:34:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 07:34:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 07:34:23 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 07:34:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJKYExXk6UTDFsZZPJYoogv0Fk683kgICleg4AR7gFU4j33nNGMy6/AogmN+07+HypDoyPn4AkLZyO92xDVLb3WYY7NPKX3bmqRdGZBM0y5Q6FSGQI99MINUxU2BBZnlf4umluDxS+dT/k1TxIo5abvvkfKMexPPY/pPoBgc7KQVNHqqv7H5/8q1X5DoNoMj0H3Dgk7iPwQtNHiJ1MmPWuhJkWl2OwLBz7XyRY/9DzJjM/h4ZUTljgINdy69fQnwjN3snFf8UL34dgUcJGI7onRnfM7EzA6usGDr3VB3TFKYkigkp851cCr7CXj6F5327HcpV8oVbbgGwT1lMjqowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo1AmmzGb8FbQEjX5sZRdw53TqVBrlQ11IGp5nbSYTE=;
 b=gxNCL1nvFpyE5QLGFZPPL19RnRpbF9otFO/IA35c9epCmztmu/VVMnqsNBWNvzqsnr4XJfeE6IM2D+GEe+xC0Idl0ydQDkmhDEUvG3XR/9l5B3i7ZuxdO0fbvHeY8bP6OfCKEpxE6YZi1wWmBL+N5f8LX6H5BtD3TAlhsapcyLJpnd8IN6qjrGcxgSzzijFg/ca+AHtc8TG42lw4fpld75MIiwnXVIljgec/7y/yXFRLQnJVeMXeWCEIpi/Kzt/2Qoag4ZZhyuj5e3DUd8lLxI+fJgXVjO7dSnOXTfldxXJvf9m3ie08o7Q7XqfiSfydZlGEeYc3mf5CkQZO7yjkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo1AmmzGb8FbQEjX5sZRdw53TqVBrlQ11IGp5nbSYTE=;
 b=QaxpsdeubuPaM+tdhO4ZbwxkUrTZzDh+wtI49KsgBf7dTdVfmHSeLEq+chtZBneffXTZOyYjX4K9jBvMB5svGXvKvu5v0ZapTJ/rOVdumcanjXcOxlIOh9ak7COvp7bVZedQx9A/DPSPan2UKCGZz3aVnKTdcH4ToEKIbuxL6hY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 15:34:07 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 15:34:07 +0000
Date: Wed, 25 Nov 2026 10:34:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <hiresh.kumar.yadav@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Skip OCODE late bind if already running
Message-ID: <awb_6-urPGcB868g@intel.com>
References: <20261125125011.192907-4-sk.anirban@intel.com>
 <20261125125011.192907-5-sk.anirban@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125125011.192907-5-sk.anirban@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2c2d13-7a52-488c-8f82-08df4b098b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 3wUcgn8rPAxDRsy4AQj56VBy8zjYCOMDqkSSEkJD7LmvyiAdKa1YMh7VkjMtz0vpZpdGmDMH8CEoCVaifZt215T8c9h3pfRYJA2JiHogaytdwu+M/9Jp2czQ/Ao63pjD0urNIL0c13UBZOQ1H0AyRAFLme5DD+7js79YlGWM6u4NtCY3WvogaV1krocxDgHyjB2532AXKC8xhGGLQ18RqBUxx6IvlY7l7AQLG4EyF3xzuXAXiO1NKN1EgPX8snOOBJdmgijpDut8E8KQxZ/EIotNWGUyZXnvL6TQydioG0gycOHPxx8iuIXFlFuALKLi8+1/la22LbtbuwT+oj6sMd/B/41jck/vcpwIG4YjkAQHJv9Coao7c2rxFc8wTAAElwHZO7VvtsbokHJLhsERmyXmacpceSfAILidi3b99Pse1feD4FvNjfnQQoL0DXBDIVx3+A5WgaHNuznQti5+80gFwY49Cwx8LFSJSTfBOR8qN3i53nf0gR7VcPxk1inbsRfzuy1Xu5K4WNr7Nc2P983jv9LKGaN7wTvGl8uiO+etxiVe0ynfJjeBLhzWOYsLTevcrGA2GYFNvI3Toj9XqcdjFrWFCRQmd54nK5mftncrCSiMLWnJCZAB+BtoAK3sIcB+eqwqhHFq1fr2WrHsEyt27hCgNsVNBg0zNEHSTBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1phVCgrWBCzU8sB76bgjCGuYHOrBmdvJzZnYYs0GPwlPHz7hvJxNE/P2M6LB?=
 =?us-ascii?Q?YzV2bja+d25YLZNllnZfOpCREs6EZF0O1JhTx7/ig/U/Unq5S0t6rZAg38UQ?=
 =?us-ascii?Q?ku/XjA7HqTRK6O0uWnwbCx2221zF8Qn0stVdpddge+UjzSSITriMaOxHvT3d?=
 =?us-ascii?Q?JfLmtG+vfiGAWGUK801vjGN3UQTp/YHrpcxg2gcwo/8lBdgVqjj2+oHH04Kc?=
 =?us-ascii?Q?B+7slkuin7dS0HN4bIC572OuD//BZiwE/IVKu5fGNuHPKVBYdJfTmzUNlhlE?=
 =?us-ascii?Q?9oPAcFQMDY4nbkJMBHATpsdgPGiWyk348JTGOppzgUcRxRVxG59GtJzbhrOG?=
 =?us-ascii?Q?HafqmAHF5LgICdlNLavqaerN0lBnTe3SrlzBRVsl0owy3sZ1JHEoycK3L4dy?=
 =?us-ascii?Q?0k6s7snWwW9ffzKiOcQcsr1LPWenteznvEgusl/YIP5VrBAqEknfxSARv5go?=
 =?us-ascii?Q?57JNK0LVIRYmCtdR5whHm3WwvuYMp9tD74oES5Y7bIAHvWuyFQJJm3Y3WBH/?=
 =?us-ascii?Q?KMxZDce2PJiygtcCzSjyjKbqHPtDXhN1lJSagxtsp4iJTMNrTOl810ycjgx1?=
 =?us-ascii?Q?zj6sZmQCgImL3YxNLR3usohI0KTX6FuzUzqCw0T3swYsz0kxilduihW6BzNY?=
 =?us-ascii?Q?JusCjY9CHbXO9CfA/zi9C/tPobfz/yyUhJACsRw1px5tgoLCe1zjVcujWoGb?=
 =?us-ascii?Q?rx/CtXaSGYD09bBkaas8qVeEne+mxpWGU+lyBW1aFdb2W4trx/er0cWUdR4b?=
 =?us-ascii?Q?qGWpm/TiAmt3BKMAkbbcvnYqdVjw+x8rv+l1RbTqHsHZwstetQa8pyt+m2Yp?=
 =?us-ascii?Q?XSINXnkr5O76QO/Yi+Ej0+zi3y1+qlkfm1yaPI4pOyNl+THwILcQ51fVOknM?=
 =?us-ascii?Q?amMtgFqJtOFpEBqUMCMQITgTCJY/zi6jtRfKBGMi8UGLYy9aNZEYYGfk7ZJO?=
 =?us-ascii?Q?cWP7MElkDGalFKKLlJ10fvfxOSjAT3qDM0aCT9ionD8HR2Ns4pa+rg1Odp0c?=
 =?us-ascii?Q?opbi82fsfQLwV4/QGOeHC3noDsBwaeNuF3Knx8wiQOBJgh3e8SCOw8xkrMuU?=
 =?us-ascii?Q?HUk4TyWjUuBs3jkAz7luylDTrOsQhy2pe9C6ySIUG2JhlFkIV0MpOe7bslcM?=
 =?us-ascii?Q?tu82CEyeLu4JkuJ2Whr63d5JKsFceHxMu24Cglbaak+vNDGSKR/H61kHYfAe?=
 =?us-ascii?Q?4tjhk6NzrMYD2EbnxtNrQM7Z2iTLjdjFVDYFEV8r/bwaoya4kYnacXsbUdWs?=
 =?us-ascii?Q?oWpDzZg5wog2huTh9cwjQkSVDCUFaM388+afCW8lttRjb17bdAotQPpRVBmQ?=
 =?us-ascii?Q?7ui1dyWe9LjzD9gMoCj5s34OoNfVKgvA0DlTxnk1ua/KCbjE5Bgaf5C9Gd2R?=
 =?us-ascii?Q?qWETB4suN14nfdUDocvPetnCRniH5JQ99PGPfyi37SzOeZAlYcFefQ2jHvsK?=
 =?us-ascii?Q?b5Vsnj3H4LWh9YXVYBwACLMmPDCxK9C4RCvbEeQaJLNiJDUsNddK4QLzsu0Y?=
 =?us-ascii?Q?9Lz2VCmiMjqj5ebisC5KCHWL5BCdV9FItp/tg8xYwSG844Nm88BSkZkLgy83?=
 =?us-ascii?Q?8Se2k+in9LMJZCbSWkufpCtuSL5C2SwBfNpwNbrN7ppjFc19F9tY24YX2zwj?=
 =?us-ascii?Q?AJ0Fykr0hSF2CzG0yRljwZVBgFJjHdsFskcjXY82WiiFZWyF3Xb+7ptoG2Wt?=
 =?us-ascii?Q?+vv+zEr/aQGf6/Zqn7GHHOk2U6A5dIDDPlfr2li18OBLD5Tudv9xIF22Qmkb?=
 =?us-ascii?Q?T3TJiOXM3w=3D=3D?=
X-Exchange-RoutingPolicyChecked: CTPDCN2PGPE773m52uyGfHvC2Uu/0eZQ+AMR/TMdwBN46cOCOjCu+afzHE9YI1vtklPxAQJMqeuiwDct/928HR5jsOpLMnes4YbnBOuOXW5gIf974F4FF6Aa+zqvVe5kAFj+zLadInPaDwt8rucChdF0DYJwNleCqgDGFTBfkaNrbo+7tEReA8eZJo843VmKeT6AaUH/kRwbDJ5z5V1Rzojhz0UTFqqGDAjx4JdQH+BTYQ5ubyQCx4SeKISypHb8EPU/GsJ8v2hPVHFJC91YQjYarol9eVHZ4VjL14u6iW8unRjfGQ7xMdhZ3ZOHLcbsWw8p/Tfd7j0mtK72wmT1LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2c2d13-7a52-488c-8f82-08df4b098b2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 15:34:07.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lcrvo1OKjO2bBB527xkHJRty1uElQmBZs3MXyysFAyeXFkE1ByYfS7AsZ0RhTbTglgSpH2655vw+9yf+w1ZEKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 06:20:13PM +0530, Sk Anirban wrote:
> OCODE keeps running across driver reloads and warm resets. Despite
> this, the late-bind worker re-uploads it on every probe and resume.
> The firmware is not expected to handle back-to-back reloads, and the
> extra delay of reloading an active OCODE can lead to firmware issues.
> 
> Check the OCODE status through SysCtrl in the late-bind worker before
> uploading, and skip the upload if OCODE is already initialized. If the
> status query fails or OCODE is not ready, fall back to the existing
> upload.
> 
> As a result, a newer OCODE blob is only used after the next power
> cycle. Comparing the running version against the blob is left for
> later, once firmware provides a reliable way to read it.
> 
> v2: Update commit message (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing both patches soon.

Thank you

> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 355d7c841871..dfff1693bf1f 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -258,6 +258,13 @@ static void xe_late_bind_work(struct work_struct *work)
>  
>  	xe_device_assert_mem_access(xe);
>  
> +	/* TODO: Compare the running OCODE version at probe when available. */
> +	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
>  	/* we can queue this before the component is bound */
>  	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>  		if (late_bind->component.ops)
> -- 
> 2.43.0
> 
