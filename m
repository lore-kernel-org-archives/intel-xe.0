Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315B9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E916810E62A;
	Wed, 29 Nov 2023 16:10:09 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 16:10:07 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB0810E62A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701274207; x=1732810207;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MwrIFaR4QREoipYnU3usk+72kZAYfsjmhYNy1QKcGrw=;
 b=NtHn/me4089N3SOlYIGs+nJ+rwWO725WXWwJvGmbezspEFEJvamDRrl8
 WTEFo0jPWxNsvPpaw+n/dctjshCfN6AGtpc2l4q3ml1KzpBxwESFVDDKp
 R2VWrb5O0UW/Dn2EjaoPgVR/V5tunuoYL++RAPsxdSLHUg2ymaUEdI/Nm
 yc1rf317g5lcWYq7dFVwAMROKm/QsN8jl1sYNJUZQBg1Y78FFFXtJRgoj
 7Tgfb42Ayk1iMeCL+TG9P9L15GEPJEU9bkqU80y+VIlH9LMg9jwirC3UA
 Tt2UllahsnewO07OEwLmHquVTAHhYZQHll1Zdt+YdD4dWrFel+rFJP0YO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="175344"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="175344"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="797958650"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="797958650"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:02:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:02:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:02:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:02:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:02:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbS9ZZgpmN+p5/+4a45dgJdr7+pdp//INJfKxafsFugJ3iMU4xYP/koshwaw3Fqvsm1llIP6pavobZTYBYST2OvFDyv6Gty61Tmum8vKLfCDdKKXLfmBuNV6k2SKZqFmBbJ0NzHgZiz57kX5PpJM0guB/h4ZimMjJtltj8UUd7v4rxQ9XUG3sGdSeaTgPiQ/vV6fyl6lEEnfeLGETqkSXswWMMQTdmDhDFU6VrQ/d38Feuy5c5a0N7YZbTH/beFrrkZzQp2UpwpI9VDTi8gJmHJuUmBqGHWFLElz1x4mFWP3Ow/7CDQYJUMXvKTsbwYfHj3iH1/mtXLDdmA8v40umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3dAPtA9r7YPmcAvjFOqBY1IOJLSuWm3rm9Biu9zT1E=;
 b=NDD8y7TP0fg7lXB47ysBsCq/qglNbEtVxI+aWRIXfZ4Rd8i+uWuaKpB+uEn2jVVbgnZFDgb/ooQa9u/PJv21cQa4/czrdxfsC6/ykJeRXJGkpffah3gj1LYrphB7Yi3F+A3qhGEeHKPIboTp+Qcz5qcoFHZbWaxCHx9YVtkBTqBgI34PF4yd84cf3yRa82zjVZQnDBhs8HnQm+o9TvbVaq+W1Sq1RUZ41JNd3qSdphlQMaQeIbZ5yoCyGCdRLlL+lZuUYqQpWRbS4QGA9M1Q4Ugmv1dDoOWi+GedFouORXxYKooxd5uAU765Jl3UQbhjHqtxVe3AbL72cLBj40Speg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 16:02:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 16:02:09 +0000
Date: Wed, 29 Nov 2023 08:02:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231129160206.GT1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129011624.836843-3-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: d66a743f-b8e2-4fa7-41cc-08dbf0f48a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dv5GWh5knerTgHwGOhSwWGUYXtLFQIYqF4j+29PG4Ih4PofOHCwYgqYxjbDKHmB7wXP0ammQV1lzMWO37BDbKYY2L0NB91ctZxEd46YXITKbe24iraLO0t+bKEPFpRS7hl5Kzct/ZZ3idcLE9dl3T2BwSEgv293xCGmzdD3pGOEhrUkSQ3XfUPgHLDw2uor8EHstqWmAyJZS+Tnj1LLH7gwznULA3ox+N9THZi6JASGghvPz1i0mJclP6hR+hpyb8OCa4D1xRute0a62u6GTbI0pizD5Gn8sNlJ28EuBAiWBMekEIGjgrWbermYWWBahKUSI23pjm3gRY2e0OLGld16t1ornk7uUEcquBvDY99WWz0czHfrjiKuFVHAO4uxQe3nYkWGsYPXFiUE0OCits9qOWsJ0f6k7dfTO98u1Dzp0f7o4v57CRd3KAebtIrC5os0GZxR/FT/bJ9UPkhQLjCZ5RrFAotFKdewqWeh0kmuAWXStnnVb7pvThJnC/tPZB3NxnwaHQzT8C39dC1MVqAswO1JzKjYU3V2y9GRrw90QnbOD6e3o038FjF6L4V8ZPDAdKNl1xfJZl1K/H3Zi9h2fkPLToPuqTkker79szFmPcEiYR0ILRr67NL70X5y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(5660300002)(6512007)(6666004)(54906003)(8676002)(33656002)(6862004)(41300700001)(8936002)(6506007)(6486002)(82960400001)(478600001)(1076003)(83380400001)(66476007)(66556008)(316002)(86362001)(6636002)(4326008)(26005)(38100700002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmw0Wjh5dW02QkdhNTJZKzFIQU9nYXA0VkFObjFCVHdJNkhRVFNyemhaYW0z?=
 =?utf-8?B?TE5WandkT3ZUY2hnOTRtN3N0aGovNUQwYUVWNnVIS1I5Yk5sdmFkdzRTOWdK?=
 =?utf-8?B?bS9WeGdnSkxnWDBlYnJoRmdVcFRuWE9nZ1NYUE84WHNuVUkxSVcwYmV6V2o0?=
 =?utf-8?B?UUtka2tiQVJFZkFHZ01BWDhNOHZsVWtNbzVBSzlEbEpNTkJlQnIwT3VaRW1K?=
 =?utf-8?B?VTIzVTJRcE1wNDUrb1RpSE40MDV6VjZkWk1DS2JiazhqZFIwOTJZZ2hiZzBQ?=
 =?utf-8?B?YW1KMVBpbTN6dWlRM043ZmVtdUtoVXZIWmhOZ05HQzlYY1pMdEZpcHc4VUF1?=
 =?utf-8?B?aUc2dytLZUM3b3hVdjVtOFhVUjBjeDR1cGJvZUJzNVFGVlFxWm16Ti9MeTc2?=
 =?utf-8?B?WnI1NHRWWU94SzR3c29TdVNZL1NBbDZKOG9GN3cvTUc3dVRjOTdqSHhuRmEv?=
 =?utf-8?B?ZVZENmFDQk5EUElYMXJTVHdDSVFlSk0wVnF6SGZ4L3dTdzNFOUJKRlBLNFZ2?=
 =?utf-8?B?MVRYVEFFZDdCQUVwQlI0aFhWZVlHMUZwOXlYM3FZMjcrdDVVc21jOU5mcjNF?=
 =?utf-8?B?a24wS0k5M3VkTDg0MEpBYkZRbmRwblh6TG9iOUtZbmdQLy8waHJaRldXYjFx?=
 =?utf-8?B?KysrK05OQ1hkbkdPUU1VNTl1akpsNzFTbVM1TzIyT0hLUjNDTXBDWFFYNWdQ?=
 =?utf-8?B?eUFkTVBpOHkyWG9GRHBtUy90NktSUWVpdUxFa1M2ZmVDdTFNM1ZBbjBZU1hk?=
 =?utf-8?B?VmlCN3B1aURidFRrL0NvSGVkNnNWWVF4ZDhNbUxuZ1hvZTJJSHh4S2ExcHEz?=
 =?utf-8?B?aER2RFhtVVlwekl0TExobjRhZ3M5eFozdlhUNlAwOUx2UTZhRzNNOFBucjN4?=
 =?utf-8?B?Y2dJU2JxWUs2a2xpa2RjZTJqaVZFb2ttNUhwckxDaWNZZWs3UkRkc0hLYitp?=
 =?utf-8?B?a09aaGJRL1ZoNTRsK0orV214Q3ltV2pWRFNleWhIVlcrSTVUc3NIU3FaUVN4?=
 =?utf-8?B?RkRINCs2R0hXNTdmQzk3bkVIc3JGMnBQVVZBMmZhelZQUjVSNlIwelFqQlh0?=
 =?utf-8?B?Q1hsdGxUNCtYYStWWkRaSHRVL3pieEU0UnM3aG91bm96NzRqdGpOUjBibnB3?=
 =?utf-8?B?UTFLMmZ2S0xmUVBSNEpNR3RaU3daK3JVZHQ1Uy9pRWhVNXZGKzhOMmJEKzhT?=
 =?utf-8?B?SGxCNzE2RkZRdGdpMkNhajlWWWxxT0FoSWdNUFl5MkxtYU9CZG9yWk1DY3RZ?=
 =?utf-8?B?a1FtTkFUa1Q0bGV1aW15c3Z3a25zQzdIaUpHT2o1NkhYYTFyNkowQWFia1lZ?=
 =?utf-8?B?Y3lINWhxNHlIeVFSWWRmRzVkTG1mNVlPQnFEbFJibFo1a1hnbENJN3RlWHg3?=
 =?utf-8?B?ZU05WHArZmxJT0JzSzlGMnNkT1BwT2pxVmlsMWo1K3NCbDE5VzdNMVMxdWkr?=
 =?utf-8?B?Zm9wRmZpNHNFaU8vMzFwZHN5UnJ2dXNGNm5HMm81L3ZXbm90YWpDemVxVWJz?=
 =?utf-8?B?MlZINndlTEFJcHY3eHpBWlA2QUVZUHA5M3FWRVpVWWpiVC90QkYva0hCNTRW?=
 =?utf-8?B?eFhta1UwczZFajRFMEhYZndzbXd5YmhFMDVycEhxOVkwTFlWamZmUVdFbEps?=
 =?utf-8?B?emRya0VxL2ZwYmVzSWxPMEYwTVo4VzNUNHFheUUvdjFjTHhscEU5TU9LZVB4?=
 =?utf-8?B?c3lhclJCQ2Jra0VZMzVWejRRQm8vcXZQNm9NcC9jMUVBVys3YzlQcXZ0cEtv?=
 =?utf-8?B?eEZsYUJHTHJidmxsVERiMnN1amYvWndIaCtQUzJyYk5WK1B0UVg4VW54YVdY?=
 =?utf-8?B?UGUyS2tzdVJBN1lvdm9wY2gycVRHSStueTd5WEI5ZUxnRjZoWC9oU3FpNFBS?=
 =?utf-8?B?NFhlSW9qSUlvN0FGTnUvZzMva0wrTUlFMDlZa29QOFRIZ3ZNb0tYUVRBRkcx?=
 =?utf-8?B?YjFKdTZleTBFZ1Q5ditIV0ZoSTBKa2R1cC90blVmSjNDWDNxN0plNytwVEdU?=
 =?utf-8?B?dUxES2crSjRmYXFjZU9pTVhvSDYrT2tlRk9xbWVIdEZOS0M4bG9CZG10NWR4?=
 =?utf-8?B?a2ZTUzlKRzRZV2M2U2ZxL2VETUw5Y25PcVlWWWJBVGlGMVJQeXVYd0pWbnFk?=
 =?utf-8?B?S1lTVWE2MG5aNDhzUUxjaGFmZnYwUFAyY24yZkdLNWFOYzNqKzdVT2xka2Uw?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d66a743f-b8e2-4fa7-41cc-08dbf0f48a8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:02:09.1926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00/TKqNckeX+fxw8cdtMVRYN0zqGMsim/BIBdaokrmzGBMlzkZQ56ZxLl5gG8owmRklA6DUbweyMuoWMxcJugTZ3RQ5rjZOiy/tlJm6aA9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6046
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 02/22] drm/xe: Use managed
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

On Wed, Nov 29, 2023 at 02:16:04AM +0100, Michał Winiarski wrote:
> Xe uses devres for most of its driver-lifetime resources, use it for pci
> device as well.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2 -> v3:
> - Mark xe_pci_clear_master as static to fix W=1 build warning (CI)
> v3 -> v4:
> - Drop explicit call to pci_clear_master (Matt Roper)
> 
>  drivers/gpu/drm/xe/xe_pci.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index db2a58747e25e..cc5dfccfb8c08 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -693,25 +693,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
>  
>  	xe_sriov_probe_early(xe, desc->has_sriov);
>  
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
> -		goto err_pci_disable;
> +		return err;
>  
>  	xe_display_probe(xe);
>  
> @@ -742,16 +743,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
