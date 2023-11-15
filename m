Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B82C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 20:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F410E23F;
	Wed, 15 Nov 2023 20:47:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACEE10E23F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700081228; x=1731617228;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gs7MUfRhiYKP5wK8+DhD9sFzro0s6qmZJts4+iiKH14=;
 b=PEyl+F1tbHx4YrLEnKc4Z2o8YLA9ppUZWekcxOehju5mvDcX5Xx5a9DP
 bPzq14340EWBqTuPyhJcNy6VQsB7iaFnlANIR8YvkmleLeCXJZlYwKyNE
 1dz2slcNZFxtrE4vWDlE39Fvp9J9wz9w9aGpQt1rnsNS6PmB4TsU3HaHZ
 JAHJefPlIavOlHlXIDx4X9DRtOkkd18j40AuOiK/46kFqVxPNWxwzXGO/
 3YFbGtbnmWg08+lLJNWWk1y35iw+EzBJxg5jZAF3W5W7GGL5LhK/DztY5
 bNMIL+omv/+DapIvGHbduPW44IJgXaSlvMK6751rUFSB826vZ64m0BtfW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388114501"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="388114501"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 12:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="799965513"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="799965513"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 12:47:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 12:47:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 12:47:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 12:47:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 12:47:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOa/zqAM3jfwVJ1gq7foPQMZGdXToM4d9FyIQSFzzgX1H4BoOoG1LW4k1c6542oldFiiM9YAdTFzpJpeJSAUB4vGkwyyZkTrsk2isYKRmQe5gB+WOcFOdKFrGVwmTTxIiPr3nX1EDkHSyATE2UaPFzMB5s6p2PPR7lr280stjz/wIG00okCedUhM42YpQCB2fAx2lRm8exLT2odCFLh+j7bnLY9JU0tpsvmQmf3lh19stXsSQ1jnbKLW0bXUScNWiUfdFBtqFyLP9ifwZK+9IPQmIg/R7b3FGo+WczdM63G6h8HFoMZ1t5cSSOwDXK0jHzQ12q7NKxsnHNbtEl+s7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JNbXbuIbksOkYBbQbgaliEpB4uDnMpWHlD6B1jjpQY=;
 b=Vji7TijCN5VvqVKJXcMTXKrMt8xNXkVtyV/lYkoIZDG+QXMF7DcaxJ9c6VbRHVHc4z/T+llphj1Nch5gFYclCHyPgP9EpFpEuIpC7YUYd3Gcy1U/LyoyxNafu+9yY0Fgm2Bi/zsUHFb00cdoDMPSqTVaDYLI+jqX9twc2u9zkFbG34wToTtJmeLkTP03LY/MxG0E8/8YkK0mS5D4B1y26FuC4T6/9ee3Xz7I/Fkc6yPGPbdxwRRTUvsQNtL0cVoL7JtpFB9/fvEj2jyidxdw1gYDl663wm8CEz95blQy5ZJmaE6Xzir6IPWPHx5dXY0br0+sz/5c3NhaWYAhI2w9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 20:47:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 20:47:02 +0000
Date: Wed, 15 Nov 2023 12:47:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115204700.GK1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-3-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 3399fe30-579c-45cf-e37d-08dbe61c0521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ig/BPxS8VZXUsVciFJaqbYl9SA8ZbviZhvCR6ETFzxOnVhvjfnAwrytUi2svNRMv9XwXlVvsz0T/Tbmz85XA6VUnWJ2u0hzk1NDq+OfCHPJwP+0Q2K1oXTgrWmsEt8IothOz+y+JM773pcmzshNIQMvveXKKAPoZBiGHAv1CsohurBBVQBntJuwScAry8koyS15qKw+XyOJuzbPO6B19VE/Lv2wQh3MYy/8gUVuHcv3Q4HZ8ZvUnzocHItoLhJJ6kFRSHqWVdEzhIl9+wPjL+vl3N5F+EF2sppVMUTKRowwvQ0TGyyYxklTX6SMai2EKWTsyJJn+BzfS17P8I+RnsLxkEFEzho0di+JoJ1FRNqrO80vD07v45RvwF8uOy8TwNeTNu8gEhu1AeItmuIL49iDDC6WZYfhiUrLaOIQ+99lHsojEm24qeh7LyULc5MeNI14NA7ezE15qak9DyjwB4bKE62THzN8l9YeGR0iatxGO+vs4tPRs7Ae4US9GND8SNeBb7yiVPZkPbQp57+JSjZpzO39uW8+auHuK0vZO1DJilNHEUgl+PshcusNJjWl6bwAQphA6HdwSzGo6LTzzLFXSRPZCl8LbdG+8b1sB5LV+ihVhc2KEdjTKf7WZzgZV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(1800799009)(64100799003)(86362001)(33656002)(5660300002)(6486002)(38100700002)(6512007)(316002)(6636002)(66476007)(4326008)(6862004)(8676002)(66946007)(8936002)(54906003)(66556008)(41300700001)(2906002)(83380400001)(26005)(1076003)(82960400001)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3VqOVpYMkc4ZmxpY2cvVGJlQVFjVUtTWFhMcEZoc2xkdUxoeFU0ZEo5dHlK?=
 =?utf-8?B?VzUvWjM5ODZ0WGNkZHErem41a3FDb3ZON1I0eGI5b2JsazRJWGdEWXV3Mi82?=
 =?utf-8?B?MGFnRThZUW9ha1ZuZmtXV0FLdUYrZ20rNkNKZE1ubWFoVXVMZm4waTh5RlJB?=
 =?utf-8?B?M0lOU1JyVGw2Q0VOc1hSd0lqeXRWdjllTFlOanhXS1poejB0LzV6V3crMmpk?=
 =?utf-8?B?QVR0OUtHNTU2cEFNaWVKazlpbURUYm45MkQ3NXFLMGJCbzFabWxBa2gvNFRW?=
 =?utf-8?B?eVhJUnlMeitNOThoa2FtTFdMYVJIOEh3Y2lsNmVSOHlXRHRyZVF4akhUdWlZ?=
 =?utf-8?B?TGlaa0ZMRkZZTjFXNHdCMnZUNkN1K3NzT3Q2M29TbGNybWtPemlLTmlkRW1X?=
 =?utf-8?B?NGY4eTVZU1EwaWRza1BKdHczenl0UU1yYUtocTRNTWhKak9Mdjd1azYzSFJ1?=
 =?utf-8?B?dk5naCt2ckhrOW00YlplS3p4OGx6SGQxc3YrMWVVNVFrU3FWempuZmlxbGxZ?=
 =?utf-8?B?V3NicUUvcFJKZ0NXbVBkRzlmZmJrSzkxVUJhWVBNclhReXVFWDhQMEpsa0Ry?=
 =?utf-8?B?a0x2WlVsNWVmVUplWGhKbkd3UUo2eXpNQXdKRmRzN0xlU2ZFWEVsV3lLVEFz?=
 =?utf-8?B?VkpYeUZPdnYwN25GM0wwQ1h5UW5wVlpkTGc5bHZMMGtQblptdGx5TEgyYXlw?=
 =?utf-8?B?V1ZZY0dtQWdVS1pQZGUvcU9aVVdTRXRma0FaRmlERUpnZUtaUm5UTGtSOUh3?=
 =?utf-8?B?RlVZVVRNOXZhZGQzNWRUSTUrazg2QXlUWXViLy9VWkRZNTFhNnlablBXeDdn?=
 =?utf-8?B?L0ZvemJKdkJMU0NvajIvNWlyUnBvZ2U3ckk4bW1nNjR3NVZmKzJoTklEY1E2?=
 =?utf-8?B?SW1RaUhsNENVU0hVYXZ4QnVLMXR5MTU3TVRDdzYvR2hLek9TWGdOcHpxUG9r?=
 =?utf-8?B?dFdWR3BwSEJQVTlUSitkbjVTS1hyQkxUZlVRNE1lRDF4ajVaMFNvZ3pRSEla?=
 =?utf-8?B?TlpvY0dYRXZwYWlsZzBVdXdCaXpJU3JNZWxVQTU1anJqNm84QklPdnZBOWo4?=
 =?utf-8?B?K3poTFJ2a0h0NE1lRUpGOWMzTHVVank1a0hpcEJ6d3JKRGJaaVlGZUY5WkhT?=
 =?utf-8?B?RzJZa2M0aWhNanNUSUlkWUZyM2RkY2NIRFluUEcxWUkzMVkzYnhtTHVnZG1P?=
 =?utf-8?B?NkRsWURvTDdMQndPZVZuUnk0YjJxRzRGMmZuaHVESUkyRG9WYVBlQVViTHpD?=
 =?utf-8?B?Z3lEaS8xV2dNY1VkM1pEQVMwcVNheHBVblBJZFJOcElkbnNIUW81RHJrUnRP?=
 =?utf-8?B?d29ncDBlV25BcE05S1BqOUZnbldvUlNrVzJ2VkhPNVVzcFFWUGl5YTdyVXl1?=
 =?utf-8?B?ZTRRcmNKK1NwQ0xPTHBGR1ZzNjIzZ2JxdDl1Wm8xdGJhczRTZ2UyeFExMm9x?=
 =?utf-8?B?MnlWOXdSeWR1QlNWeDVHaWprT1hhSUMwaG9YY1V6c2JQZStzdWJWLzhvY2FN?=
 =?utf-8?B?RjlseG5FYUl1b2YrTmE0akwwbWJsZHJVdHdmamxuWmExcDc5NWJCR3phOGVN?=
 =?utf-8?B?WkpwY0oyalpBTlp3ZVdjaFI3blM3SklFTVE0Uk4wYk1NejZ6YS9pcW9NTndk?=
 =?utf-8?B?QXNFN2pWbVVaZkJPMnVNaUt0Q2FEMnd4aEhvTnd5c2RVMWtQb2xzSFdYbUdo?=
 =?utf-8?B?USt0eS9KYjZtTW1oZ0R1ay8zSElid3VTS083MVZxWEQwVnpUM1FkaitIUFJJ?=
 =?utf-8?B?TUlJeW5JaTlzMENNVTZBcWU3R01QdjJFTEY2dVR6U0VUNnRYUmNnbEkwZ2JZ?=
 =?utf-8?B?eisrU1hJT3ZzOC9jZjJtQmp3ZjVBQ1F2czN6T2xRMkpxYmJjUTZZeUtOWHAw?=
 =?utf-8?B?MHk4QUs0TUFZaHlCcS84NzRPSS9xUW54M1BRc0g0MlMvK0kwdE9QVm9tdFMy?=
 =?utf-8?B?VzFEbEMxQ1g0NVliWndNWkxJb21lWit5RitZSEJtWVoyUkVxMUdEVXhqcW9L?=
 =?utf-8?B?aWZCMlVhUSs1RVZQZDlVQTc0TENmcWxIT1F4aFdNZ0JjK2NveitndzZkME9V?=
 =?utf-8?B?cmFSZk02RWpDWTFmSnpWTERsUFNGc3Ivd0d5bUR0NDRpUHhOa1d4elNJVTE5?=
 =?utf-8?B?T3hrM0ZHakN3TEdHb1MrREdtQ2tsb1J6UkxpbDUyR3NiMXFoRWNzRUtvWk9J?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3399fe30-579c-45cf-e37d-08dbe61c0521
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 20:47:02.4689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omkROYus43lIB1GtMZ2x/ChzR4qwwMwUfj35nsDjXoCYOHerH4ZLfBZiNeW1LVxnLFAi2wNwOYTcHQ+WwDo7eyLMKlp5jxn3atCt/W0hek4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 02/20] drm/xe: Use managed
 pci_enable_device
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:13PM +0100, Michał Winiarski wrote:
> Xe uses devres for most of its driver-lifetime resources, use it for pci
> device as well.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
> v2 -> v3:
> - Mark xe_pci_clear_master as static to fix W=1 build warning (CI)
> 
>  drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index de986aaee3bb2..e6b59c4b02bdc 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -663,6 +663,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	pci_set_drvdata(pdev, NULL);
>  }
>  
> +static void xe_pci_clear_master(void *pdev)
> +{
> +	pci_clear_master(pdev);
> +}
> +
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> @@ -691,23 +696,25 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (xe_display_driver_probe_defer(pdev))
>  		return -EPROBE_DEFER;
>  
> +	err = pcim_enable_device(pdev);
> +	if (err)
> +		return err;
> +
>  	xe = xe_device_create(pdev, ent);
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);
>  
> +	pci_set_drvdata(pdev, xe);
> +
>  	xe_pm_assert_unbounded_bridge(xe);
>  	subplatform_desc = find_subplatform(xe, desc);
>  
> -	pci_set_drvdata(pdev, xe);
> -	err = pci_enable_device(pdev);
> -	if (err)
> -		return err;
> -
>  	pci_set_master(pdev);
> +	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);

Is it necessary to do this explicitly?  I think this already happens in
pci_disable_device -> do_pci_disable_device, right?  I don't see any
other drivers adding an explicit managed action to do it either.


Matt

>  
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
> -		goto err_pci_disable;
> +		return err;
>  
>  	xe_display_probe(xe);
>  
> @@ -734,16 +741,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	err = xe_device_probe(xe);
>  	if (err)
> -		goto err_pci_disable;
> +		return err;
>  
>  	xe_pm_init(xe);
>  
>  	return 0;
> -
> -err_pci_disable:
> -	pci_disable_device(pdev);
> -
> -	return err;
>  }
>  
>  static void xe_pci_shutdown(struct pci_dev *pdev)
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
