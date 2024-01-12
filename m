Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D527C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 21:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87AA10E0DC;
	Fri, 12 Jan 2024 21:12:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1BB10E0DC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705093925; x=1736629925;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WEF6PzJuPwUyYTgQScYq7SRu6MOQSn3XQdLcph73F+0=;
 b=Zwl6/c3Pk5szJAVvoP0qaB9+m4uOfB2UzNO8wpk23JFXMESHOvj02XO4
 gAENqJEtjoaGbJxKPmTXCiYPlyIXOJf0xSMKozWQpL9sKRVqZAdxUf6xt
 xZaiY32q1cIhWo1+F8DxPR9BFbrmsUZ93u1qGsME8b2CdVmonQyh/tKjq
 OJIJEBLTNSy27syMLeAEF3DHzKnS2D+aunX09XdtrdXSgOuGd4wd9SAWX
 Kx1txwxUFTq6+MqpxSbbSENmViwC3aQ8EizZsp+DTBI2ypJEOr5Hr20G0
 GCXWXrgunlPcLnaec71datrqUkIbT6FoDdJGHNAwQZIaCLRDh/lNw/qbq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12774637"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12774637"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 13:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="873493823"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="873493823"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 13:12:05 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:12:04 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:12:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 13:12:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 13:12:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wcuu+bW5rErdcKwtxIKb6/aGEjMnjOMyX8ychHgTjIRA9Cb3WQRiTI0zwxfKVGm361h1DSQK5vA1fyPg5QlMivBFC7NR54MsbP2jGpbUW03gSFw1sVVLOrir2oPAHkwohe53weXKOiqrZqdwr1UskhASw9oWL+P0TK8un0G10k2oZvI4ziSxUW1erhkczH+Huhe/qN8inqYRtQywvu0PjlmJzTfnrcrWtwQPwNv7wdvYDamwKSDcCcFUu6FmdSQus8UCGVooYI0c9i8DcfyRystjxGp3XDooNAHd12oUKGOsoKa5SxJtH2mwLF4W0XIjSwJA5eYICbRF65JIOGNEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKU7q4JyHN0RBrXMn6b5tM+jz9F6kiq/Ew8Gx6c8d2o=;
 b=TfrVYg8yWJ0+eEymSbJuK0K56zbLQXAr1w+y5XrUyiJgF5xJWVcsq9OySKg4HwxXGUpELTx+U+8P7CAqNSBB7nUvDeEAyy9L3K0DM5l6QitxdG5uYbS0jo/R7smdc4Q5jsmbwN8dfeIprV/mMMwiLeUyejHHAnsWVpjG5XyE892WOH2Xk/jiaOiCmGJ4A7VL+kJDBcyRTxzlKfFwRBL4d3CyAOcBhS+3isBJXEVY8aN/5Wx9Tv5/K/WpaDC2iVkNDsmBCzoONNXyEutT9wVO2sP9avbmgdWnF26oyo8K3ELvfiOnhPaa/nwtcAxG/DPnTvq/fmjetv3rrBUj8LMiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 21:12:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 21:12:01 +0000
Date: Fri, 12 Jan 2024 16:11:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Use kstrdup while creating snapshot
Message-ID: <ZaGrHbOqyLNz5ws9@intel.com>
References: <20240112160652.893-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112160652.893-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:74::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a4c9e8-32ab-4e38-5ebd-08dc13b31e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgDt0pUm2jdbAFjAoExbnRD3SRr9wnZ4OKqYQo6qjiB5dpM5wMyD2+WTPHdIaTr3RafW3IFBX+bS2uR3uESSDkRy2iB3+6kBwYGh8hREDe4KKA0Rg2JsnKPSKXee110JuD/mNzFFfBHHYiqW6I9y6zPJS5r7pqOGNkSYMFc97Lh7o+ZMLkuj8szZI2OjfiG2GpU3L0oF5D2YiW6FPkSovT1s4KaOJQ8reQSA7OqQDnsqda1+lTIKPewYitIkyD415BRO8Dy4xJlmltqfCNHNGjKoSufmBiKRwaMHy2Ug4yuyTa4aHj2xM7HQvap/eEUzh+X4Q6nIc/pi1W89+mBDdbBq+cE3ZlTU3ueQUX7RrBj/yUB0hUZcrxXKEVw86fW5phdd8brIfeOmrEsotrwCEyPeqsW3JNqXk/HV1kGMRT/2GfJRZVHywG3U9A8JW5E0jhOTT36popAZlfOmnj/7Z6Ai4kBNHlAD74gue5BhKPKk6wTvavtce28lA+fOyfgV+dsCjczBDlP+Vencco/bxEY4JwllHCkNCi/YBx8Dm8RvXA9e1jET0dNm8J71szQl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(36756003)(6666004)(6506007)(478600001)(6486002)(26005)(2616005)(41300700001)(83380400001)(6512007)(5660300002)(2906002)(44832011)(38100700002)(8936002)(82960400001)(66946007)(66476007)(66556008)(6636002)(37006003)(4326008)(316002)(6862004)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DCtQL8MBrzG2dqNPyNlTshbOKQpBrJG0INKhrlaGWYQd3xV/7SU4xYu060pf?=
 =?us-ascii?Q?IlVesNRTzMt25/PXJDMWmOf2HLknpmlbz5qL0koitDM6gB2fUEQV4ddsZ83M?=
 =?us-ascii?Q?jnjYKBwEXQETCvnddv++NZjax4G/vcd9m9mQMxEtxVIZtOTsuwg4ZBsYF0el?=
 =?us-ascii?Q?LswjdiebpcQauXpwlc+Azb6v/xgo9hwODRQ2uQHzN7D2qn+fXMAZuTgQXZN2?=
 =?us-ascii?Q?uXgbm4RKu3I0B22ga+ZuTzcDQJb0qwTPg12xcW9iMcVWkHdiitsmm97Pt983?=
 =?us-ascii?Q?4jvMQHeMeDyotMrhtKCjbAAdVq6u9ofoUyeUsCdt++9tLI+0YpBVFa/7SCnW?=
 =?us-ascii?Q?bqfGZg3rbl98WjfCZGw4fTTipawduA2An3muFLt/5p3DiRcGNZng1JciIcPZ?=
 =?us-ascii?Q?40Hh4O1DMdYNYqnU9kZbQIUoMRvSU3geGDi4ww8RvSH4Ya2mOiYgLtrn6ynu?=
 =?us-ascii?Q?8VndXWP9Vtiq/tGRHdvOiUh0tWUtodWdXX1Aw06Xpz2bueMlXc0WhVHENaSd?=
 =?us-ascii?Q?DTxBXbTTscNPaHiYn4lVMqiSKz2yVwROMN5wv2uMniaP2Cr6BZfb8zc/wG/e?=
 =?us-ascii?Q?ChOCMXZ5Bop5FMEVPhm3KTFaORgSssoUSv4YRjFKd2Fw7AhsbyCoxE4+4W00?=
 =?us-ascii?Q?AzO7Jf7d7RQTNCI52r9BbOLgdkXP+22j5jtrT2+/TQSuXaprz7r2EJpRplTC?=
 =?us-ascii?Q?aGlIoNC0zktJDM692USRIJi/+8i+UJeK0shzLeFfmXfTc+6l0fhidzvQnv33?=
 =?us-ascii?Q?ckEuJ/HLCCzarNR+EzrcfZm7VXOuxOtYYt15RTN8o8JpZzHxfzWXWHN4irCx?=
 =?us-ascii?Q?yVjtPbHPBNc686GbMsGVhSlEhQkWL4bWhfjlZdlMn15g3p0NW9fYPff4z7l4?=
 =?us-ascii?Q?g5gTlh/eCtXq9aEsmvDHHPQ3oWdNA8nvarbRmY3mVmBLw64lXIwu7I8Mi2IA?=
 =?us-ascii?Q?UVIh7oezI2C0TyxubEaGzymMoss6p3QgKy12NiTurcFvWXxMEXPl7T2GE4IH?=
 =?us-ascii?Q?1aj3+Jw9rwRygvjOyjeWxRZGHLiK8o5cOwhPyAuZrXDm8PJ7CmlTENOLANKE?=
 =?us-ascii?Q?BhQbFbRxZL7U5nQtypgyFOCBtlBeSsjp8Mm0uyHQ17QT3JY9oIX4Dir6NeQH?=
 =?us-ascii?Q?VxezhV0EOYtXhN+hh+npTIy7dyRVZSoi1kUcsanilTrtsBRKCrKUO3EDpjVT?=
 =?us-ascii?Q?jmkFRWsHPbCy5nMYy3Q2TvI3DbT5xsIf+w/cxx4IWN6L0v2Dyfy3McQ4Jn35?=
 =?us-ascii?Q?zOTbzlU4dsznYSkhkYAjXXoOFHCoBLhJKaUb4dwnVeTlawxj/C8jIcpLY0qn?=
 =?us-ascii?Q?Dq6+4ygTJR457dlbt+uIlvcx/fy+QqZq6LhtkecZcwMbNgUBRKx1n8G/lIgX?=
 =?us-ascii?Q?0rP+myCpRdv3c45U0OWJ3VLKVsciqg++42kk76aK8EUT8VZ07yXKyZk6N0LI?=
 =?us-ascii?Q?JKJzyptLRRAhTthTv+fgNm0t8WaSU6eaY/1AC0NiIRS91ad3VdIrGZntwOv4?=
 =?us-ascii?Q?md4jqS1h5E2t5ctPD7Y9laAHk+73GOeYihGcuXo2S9qasbWHmAJr4yR0KelX?=
 =?us-ascii?Q?WqJAR/se2N3bZH5OJRnYuou1/qk763I5TFOiXC/h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a4c9e8-32ab-4e38-5ebd-08dc13b31e97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 21:12:01.4830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYBRtsAQzLRE9G1L4vFB3h0qb11kQg6/qTX/X/udD8EUP+zKSZMFSJhKvucLIzIOOEp+clToNauUR4XpxkgVKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 05:06:52PM +0100, Michal Wajdeczko wrote:
> There is no need to copy string step by step, use existing helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e279ef6c527c..3aaab507f37f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -749,7 +749,6 @@ struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
> -	int len;
>  
>  	if (!xe_hw_engine_is_valid(hwe))
>  		return NULL;
> @@ -759,11 +758,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	if (!snapshot)
>  		return NULL;
>  
> -	len = strlen(hwe->name) + 1;
> -	snapshot->name = kzalloc(len, GFP_ATOMIC);
> -	if (snapshot->name)
> -		strscpy(snapshot->name, hwe->name, len);
> -
> +	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
>  	snapshot->class = hwe->class;
>  	snapshot->logical_instance = hwe->logical_instance;
>  	snapshot->forcewake.domain = hwe->domain;
> 
> base-commit: 7a20187068bed91b523795a18219e570f1e84eb1
> -- 
> 2.25.1
> 
