Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB366CA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 14:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7C510E200;
	Thu, 18 Sep 2025 14:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4N4D3lx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1191D10E200
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758206517; x=1789742517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qabQXcqY+OryX3TOsCVmCA/5za/WXz9yqRAy+1vrn3c=;
 b=m4N4D3lxp21xLzATS++l0ZjPFMJP+hB7PEVWXhahNGlOAeGDrkiKm7BE
 Hb+K4/pE4fwHXhCaxjCmyxPpuoISqLr28gd0XuZtXB95Rvs7RcGQ8G4it
 1Qg4E+Dy38vJphk+1RE4aG0+VwWOihrpTiqT2b2yyZlDlCYsWSIdkvQO8
 Nu0MflVeHAPI/QzL3nVs//SHYYAj4vS1xgviCjw1lRTVJ4Mvi80KPrba/
 ahEM9lq1hINY8mU16HvkIj9VZhaDCLhOQ+ILmOWqpO/zNYUioBr7ajrou
 lloQvuZSi5qJqBxQ8Rq5V0I9GnUJUX9CB1bYOG1cueSZN1P4+I0UlrSBp A==;
X-CSE-ConnectionGUID: iRDvdMxoQj6WXthdJid26w==
X-CSE-MsgGUID: 8p9LMyT5TU2h8L0lCNR1EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="63167553"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="63167553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:41:57 -0700
X-CSE-ConnectionGUID: 7E47t1NeR0+LkaSuNDGFeg==
X-CSE-MsgGUID: /GSO4OAATmKjJcKSMV+rZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="199275437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:41:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:41:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 07:41:56 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:41:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIs7ylS+doaSFTQqpDtQTVzLaLsA+dOxkJql+c4jpoVzkdmrUwRq2UFdeEZbW/v1ne37o1JnUaSX1x8cOcw6jCA8Awp0t7GZZ/HadBXi8vz2eIPDi2cNPhq2C5iiyIdPqvW/2NPniWFVjfazgh5lyNKXptV/W5KQII3grN9IiHNgoS5qMzLPid37TdPbiK62UtgtNg7NLGUY4Hsm6+rVB+NiRG6f3uhoZjbsD4lO2EmcPaX2WuuDs5X0/dV1WaW3FDlapwkUH0HOWLO5YOr4AzM6mUHI7ynPB6ikiHw7ZoB67M7Ww0045tfUPgBRrdX6cPn4L24RWRq0zWfIIo9ZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MQpiptkPdwjDXD4T7iihm5hyK447b+jq5Gwv2P1pW0=;
 b=hgGMN5Cfob2oT2t6NNDUlP3SR23xZK8tAM5MruG136R5etuUTnzS7m3KR61x0vnP2go1HvHpxYnwI4ErRqtEZyfPTMQWM9w0rDN1pllybVbhgK9SZgIPidv1StKCQ8rgyzDTMo/zVHA3oetppaYU8vzIM/XOC14eiFWCzSneyTWmmmdIZePwjJGuIGax/2sf/bzVbwBDhWYlkpZQJv1fpf2Q5DqXlHXZ9fxoPtL+uiWDUoIPIL9vR15R8fJkC3g0Ff6ukn2H5mmHQbL/y7A+mLQT5Y9fJOHao0t992e2hJa5Pgr1n05WRqKBGSkmEZtBsQT96Iep5XyCW0ALcKLVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 14:41:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:41:54 +0000
Date: Thu, 18 Sep 2025 10:41:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/i2c: Don't rely on d3cold.allowed flag in
 system PM path
Message-ID: <aMwaLxuoB9UU8Hb6@intel.com>
References: <20250918103200.2952576-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918103200.2952576-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e5d0f2-e8be-4fd5-7a3f-08ddf6c182a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uSdCLSlnsIs5ZRx4kHw3rxJWfh+5E5hdXMktJarU/8S60mUG0U0TQB8Brnn2?=
 =?us-ascii?Q?AIGggEF3Brq9gsCeeND5H32L68Ht173L2kL7BWlPOgvWrX6x8jrVd8WCtl5o?=
 =?us-ascii?Q?ZZcpEl6SzDEe8zghNQgvpPYbSrJQ8f2MMczVdCeA1VjbrKJV2ycWvZd64H+z?=
 =?us-ascii?Q?wn6XvIfnKweIceNKZ5in1yqjzFgPHPvEbeQtPqFKnNN51c3I0xuYTlGIMHH/?=
 =?us-ascii?Q?n2kIfuGSOVU/n0QmSievuLjUantq2shpqmR6BAtOfvXJpUC/Yy6sBgKamX2l?=
 =?us-ascii?Q?S/AJHIw3xJASYnt5pd9Gp7xDVGv+vAoIoguUYTw1WcALvYoo9F9A234HzMID?=
 =?us-ascii?Q?SpZGtxqQ+tBZsqr/xVvey5SgMFOY1/QI9CTyo3y6iwJfs63KCz0iANaLvBHU?=
 =?us-ascii?Q?sI5NppUe9rONu1KFZqbUsNQnekyMcKcDazVqwkmEBGPO5fOZ9e3DMKHgwCVJ?=
 =?us-ascii?Q?RTlW5cZetU4iYUv03uVRmjmuXtYoOoDRT3+JTMbXyJ26+dsybISUU0KiJqjB?=
 =?us-ascii?Q?wF5GwB4mtzOgA5Ab536dL9VrcUGzTc52PuihFZA5ehE9ZGyESF5frXB8EIuX?=
 =?us-ascii?Q?gBARKRdWZHgY3d7W8+y5zj4U8sLlXiWgRBbyToFUMz48uELIOc6xxlRADEAW?=
 =?us-ascii?Q?FGTTlPZpB9yGeSsst+axBJfNC7cDXf0uLcdI+aykQIAugmdY7+08rXABjkiS?=
 =?us-ascii?Q?mOuff4WYka1pCySXXsFyyHumF7pZ39w6d6NfLKBib4vzydZ4k6qayDBNsCFB?=
 =?us-ascii?Q?/LueYuzo3VZa79wQz7yiwATDtSL5YUntjpXlbP3pmh+Ms3+rWNxOhJASlst2?=
 =?us-ascii?Q?l5QIYxCFIMw0RPIoxRblWiamChjvcG5vLr7sMVMbXQuKhE1tWfAL+m8/TeB4?=
 =?us-ascii?Q?amysoKMkPuYfJPPkCTCCTGyEp4Oz+nRDWFz8/LrKBY8/yzEe7gdXrBmZ8E9p?=
 =?us-ascii?Q?SEX2DgoAQNI2WKwRgDgXC+9c4uUnANU6diwUcyfsN04AGEAAxw8JqaELdTTa?=
 =?us-ascii?Q?/ERy/qEDz6o6yUoLcW0+C23ARyXN5b+mMB8s8y2mh0P7i8N/tsbFlU78CVjp?=
 =?us-ascii?Q?iHXSn/UMiysORb7Ljyje7HohgiLLAJxVFoBWy8GSq+6ooDFkZ6Z1Ba+rf4jo?=
 =?us-ascii?Q?+CDp+PviQOEkhtt1lSg+wDWQJ2GrKUKun86lD8iY/OUgIoBCbdHHsksLBf71?=
 =?us-ascii?Q?C8G27Bmi0pn7pszXdQtLLMwGGz8gNBuXrg9Udb8NIF5VWplcUZ6ZxUWSrigY?=
 =?us-ascii?Q?tK/Yly3QJydZ7HGlADvUzvhQVdDuu5iEOXp5zyNb3KUIaUIrDAb9CIkiVL/I?=
 =?us-ascii?Q?N7gT3j+3YcJPeM82NISsTywTBTs/iHQaOg5wmQxoSMx+7AC0ifnL4Arh6n76?=
 =?us-ascii?Q?06HWZr++mgiPvv/yZhDOvVw9qUeKPdvX2obOTKPXh1Z6ktNmZDKopeQPPUPq?=
 =?us-ascii?Q?ntmL8nhxJ38=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ClHDkxxLsRpSeANHMmQfYcZrago3dj4TftIQkAI/GmP5l6SYyzgXraKbmdn?=
 =?us-ascii?Q?Kr1ASlG/abG/kokvSWSIedvCyJmNijzbT9yXBYHhABrgKjBk+TSyqJGbU5Gw?=
 =?us-ascii?Q?CCxZU+JPkCYst87K+r/LvfPsWlAbYeWYVV9uuZbzfhozNiupUSLeKtEQZ2H7?=
 =?us-ascii?Q?DdgtTi5AoxfVKTChl8XfxkTpBvmrkmY2tv82VHYTf5VJNR++B8Tgm/pgfHIk?=
 =?us-ascii?Q?ZqIBIPehjE3l1mAd0aHiuMlPzc22yv+J3O1aiDdIg9XvHmhKXnq0cX3/Yulg?=
 =?us-ascii?Q?zdT8TOf4IO9SAaUvX5FTSe75Hv17vjnqbdDq/DPHQrR/rfyLZ7XidUu/ou31?=
 =?us-ascii?Q?lqoGXKai2wIA9bItsdVsTHhtBa9ppVN5jUdKqXA3LyIFwSWFSRBUy0lUZml1?=
 =?us-ascii?Q?GQXJRfDOOMtK8Pzj3YzajV51DlbPXI33rT33BVCpSNGjAsH9t6HAB42dlIr1?=
 =?us-ascii?Q?/OJqLFrfgrkZK5ouM1Y48hHyxwiPsMoxs2zgkA/Iy05F6LX2WOvvebInVxXI?=
 =?us-ascii?Q?hpZyKMPpL9TFFT6RVKK2v7kSmq6iUlkNFM+/pcnezEOXzMyU9KWJNk1hcLoO?=
 =?us-ascii?Q?3bdaxwTGb6ZhFkKtfjgdnHP9nc4CJtqY7A6pNjAEkwpfzPssjT/PemxlnIHC?=
 =?us-ascii?Q?qZESNBWolmK2DMaZCEXPKvUvaUGFKsm1iiGmJMAkP7yLl/U3LHnSCZrATdCE?=
 =?us-ascii?Q?IKu5OLCX7bmk/C9vKEN6hixYZ03FgZ5uc9/r7sG8ugzDepIQtdZum6taNhI0?=
 =?us-ascii?Q?bR37V30xp354Eu2A+BdC66thpAkegzBZXQd6zk7Eh3it5jI6Rj3o7SVwqFAn?=
 =?us-ascii?Q?PwwfAmcd/VBJmEPARfTdV/ZnxxDnl/YWXj19sGBSzY6zpRnKKQuafdiDyQWE?=
 =?us-ascii?Q?VjWLhv4uBep65k3fg2mPfOEHJHHfSYgIz4vRulkMnAWWux8tHesp4AWYjXuc?=
 =?us-ascii?Q?JtRZ+7AqeY92it+fh6Gh9oF78qfDpoOD3+pQmLPx5Ba/8kO7s9/fa46MMdM4?=
 =?us-ascii?Q?oSG3Ka9D4xcj/eS/D5zZYd7A0eU2+lHG+A6db3s2etfWFqvxK3uAijjNb732?=
 =?us-ascii?Q?of8qXK4uy5KkhdPWsqnvAyAIk3YFBofKlMwM9bwmv3OSw/uko0SfidIJUSS3?=
 =?us-ascii?Q?JEkVL/n9nMSzrWTXp1u1+i3b/uAk0Mo2LRoFOEhLXrR+dW5Yq11lcrN5Wnl2?=
 =?us-ascii?Q?fevdXWjBjn4DkEqnPjaQYIY01jBMueJbtnSKoGVKP6cfqCbYSrcKMo29aVJC?=
 =?us-ascii?Q?uCKU2Wvhs7c5yxDzTUYmRBaYEBAmDO1m66Q4JJxlnjPNCjuDhTWDuoa9tDKA?=
 =?us-ascii?Q?01HhI/fOKG+4uwjlJBPwxwyuKlFItUjf8P5pfaPA4Sav6MQxSYFKIm4KbDFj?=
 =?us-ascii?Q?4pXBfR4ZpnmhhOEyingE+U6DuMo9cYigj2kX01pA6KKfAB3wIgLTzIiLRtjg?=
 =?us-ascii?Q?2VwkABtZwBtx5BoFDuh5OsyAEGUzrIR5rdGUXfjYXIR6VZbxMxUQHs54oAmZ?=
 =?us-ascii?Q?a3c2g86o93qcK+nZ7Uwx/ubksjZ2Yu0M65LbMv1nru6YlYoqWzOC3KqGOoo/?=
 =?us-ascii?Q?vtwiW+7e3z2PgxsVpy+57ldoXp7T8pjLJ/9V+4tGlinFdE1k45mGTAjmpc9e?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e5d0f2-e8be-4fd5-7a3f-08ddf6c182a4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:41:53.9431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSlNF8MuqgmXj7CCjc9CRUbWflSEFDhtplp+C/nTR9o4ukuYN0PZlkIOJQZg/qFsxlOYrtaxCxBKTORxGNSBCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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

On Thu, Sep 18, 2025 at 04:02:00PM +0530, Raag Jadav wrote:
> In S3 and above sleep states, the device can loose power regardless of
> d3cold.allowed flag. Bring up I2C controller explicitly in system PM
> path to ensure its normal operation after loosing power.
> 
> v2: Cover S3 and above states (Rodrigo)
> 
> Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a303ed5780b4..00ced1f63776 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -198,7 +198,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> -	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +	xe_i2c_pm_resume(xe, true);


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  	xe_irq_resume(xe);
>  
> -- 
> 2.34.1
> 
