Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127DBC7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4E110E17E;
	Mon,  8 May 2023 17:14:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC94E10E2F0
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683566097; x=1715102097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WU+S3ujb3jr7S9fF00qz62IpuEudYxhneUup7USLJ9Y=;
 b=hFNDHF1d3Y8mfeGgf2AyZEYiv83djMT0sVb+uiaS3oxKWQTJK/r7F0KL
 Goaq9Pe8WhbBuAaM6Y+DT3t661QENz/DarydD8He+A7K5yEBAKseoPev8
 y7oCmTT4T/zG11fHljqH3E6SMFNuuc2N9wyM4zn6DPYgUoUvb4wKuB5rq
 BS0VyqapdhvAmdHMdlicndLKSeOa0THVZsSdw+zvEKSfGHfSMZg/NijsA
 DMqVX75e3SjVxDDUvnlHymIyr0TKgOqqtisVD1BAhYDFZWDU/v/zcuKa6
 bunSFBAVZPAY9zhy/zmyytETxtU85hJkemcI0BU6baSWa2xjOTCvuAVYX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348533228"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348533228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701493894"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="701493894"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 08 May 2023 10:14:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:14:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:14:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwlJADwkATzMpkscULMAHHKk0niMAdZ0oiKE9k+4mPH3B2RmJvqWWZk8ooJ+i4PknGtIowCF1OAvD9l34zLsJVQbGwDjmpQtUiMGWGtbNFuir6K1nOBNsNOs9FGkWj5z54m2+2Qxu+D8o6Rt4GV7OiuXF9F86nXaKcA/EHT3W2X64WDLXgG0eTDfv7ioB4/V40t0SlXhocC76nDDfYd9YzgN7XCpuKK47rKgZ4vw7UaVPgtvUmlnvP7G3RyKFw2bIol1An3KLdCv5Oivz/Z3vVsG0os7rtPMhiuPRe7E2akdclAiU27bHyVzHq4cVlSNGv15awO5MkgIGG3sBT/FWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM6n7S9dkL9M3b24NjJlUN2vjEFSmw8FpVLTJWAZ/VM=;
 b=h9zo/8TiHMDE94ZbSgRa+pAUUzubBwACAC3LvXlgOSFPZwqxXdIMuUjBaPSNJOgBoLb7nuyZ5BqqKsH07VceRACSZezE+MHNjL225AAqyOQXa67OWs98su2sqEhAC/rQIYNMpmvB+GwVXqjwddIUdTk3VTdFj46LMEHnNBg881Q8wgUStxOX7xzFWlp2jZCulIiowyNI33bpZPmBQ2ypOiBcsbD4NKxr6y4aa/oDJnHk2wHhjnNglYDpDj+u7fEvXfU/6YjaNX/q9QBDIf5wkJgfgBHfuuUD726U62xo/5z0kgLbgkekMr7tYca966nC+bWpqcYcn9no0pmu5gET7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:14:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:14:39 +0000
Date: Mon, 8 May 2023 13:14:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZFkt+7SAlhL/T5gt@intel.com>
References: <20230508091734.1938204-1-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508091734.1938204-1-anshuman.gupta@intel.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd8751d-3b17-4b5d-e819-08db4fe7b484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WgL4/lvpfMR3Indfc6xptETLYYThZFf4dRQ2/9zTPK5yjtL2rCjrxdNorUL9nJBY3SXi6bmtEvrKLxCsE7yzE9zAWGXljANniAR1Na2ZjWMU786twTeDvEksGtbKLEycZo1hUrCU6/2N/l4SehaTWrzuP7mktr8Haa4xif8cBJYCyOsrI45Tt/6jDHkrnTucRpfiAwFe3kQre89KiefKVLszU1aQPYHlUODX4QpL57p/AYlYD9PBIial5Khf/QZrEQU19WDaqY4yr0DbBNNDSpkdbqDiopL3s9GYvt4BRN6cIyfhxiFS3mVrYWBoeQnG1pFZ5BW5epI9Y+nu6DLdaSfWQRoikuqYsC/BmaVmBYT4Oa+9Ooa1m+9lkcpLNct4NMA8zmh2pB5KufNV6JtmPXHmhAH7kYSc3yyUuKrD7gfWH9sDiRome30Xi1c1EQri0PNjLpqnbwlifzCGqpt1hA6KqFl/R6CV0VfMsK9AXuvg5ELLMDAD48s5e6k8/Xah1wCMg2No+9wvD6yBvRCoDBKBCC/aNkSdziFj5a9HiBg8QGX2C2GxvHdNaFS4aPUf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(5660300002)(37006003)(6486002)(6862004)(41300700001)(6666004)(8936002)(8676002)(316002)(26005)(44832011)(66476007)(478600001)(66556008)(66946007)(4326008)(6636002)(6506007)(6512007)(2906002)(83380400001)(2616005)(186003)(82960400001)(86362001)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awP+ykftirG57yTgHhgxTHX4yBdK2uc3AliuS3jJTPC/YvuvAPpH642gDiyZ?=
 =?us-ascii?Q?omsoV0XRkmm+JGRbZ0s3HYOjYRSnDYM1nf7sn150AMpxKCKYpmWanzipjU/2?=
 =?us-ascii?Q?hnJcnu4fKVB03+Yy+yGxLj8qo6HgBX68NXSYAWEy0T3M5VJxCp+ekLNaUTrm?=
 =?us-ascii?Q?/sTqsA5NhPI7XA2gdbWcrs1QQ+q/YBtjvLQX5mJJGETDqiXx0BTaTtrDgze9?=
 =?us-ascii?Q?dTKNFPzl7m+taH9UflUhDUS4J1nUaF+QnxsFkCREchiHKOO58052iPkLs4an?=
 =?us-ascii?Q?l0MUbrhC8cOiF9icquUtLMON29TkvLpu2Inr2MXx3oOGskQXXNhe4f+UUXK8?=
 =?us-ascii?Q?FOisW7GwAFf3SREfdkCStKMvCqXLzZril98wnk2i2rw4GqB2w+KMNzhqiZY6?=
 =?us-ascii?Q?qRd9MtfpMxDf/DhjzobLdT0ZkU7KVsgl3HaWSW1M5o5rhNoGikE9S1/ChPOB?=
 =?us-ascii?Q?SIQOZJZ/StNIApLaBKXZaVPyBoqit6Yqzxx8bpY64S1baab+VoZAWk6KCd2p?=
 =?us-ascii?Q?UPFbKolMHvPKH6AV1m5k/QNtvu990gd1gURz6quOQjc0kUxGWziZYkU/Zbpz?=
 =?us-ascii?Q?cuhrVtNztKo5N4kvg6koadCA1k5h/qpyI4krk+DeuPObSx7ai2we+dMRrPHY?=
 =?us-ascii?Q?5kjq2VCC5QAcydHYJQKnWM8b9huCKJcqWKZxVzxisPLH39dy6/8KCF+nBrbu?=
 =?us-ascii?Q?GL+IzK80sYH76YpY7t9yVAYX9MhtGhbeQF9vGjnl9H+48XcXQuR/LB84nEJ9?=
 =?us-ascii?Q?iL6kw8A+rjmRyElQLDaQyvs0KJ3QtM7qsOdlSlRLHofAq4fqmj/cp3UkGeTR?=
 =?us-ascii?Q?2oO5zZnkcqfe9suXF6n4NpUSuRaw8HQUBP7q95TG6/mefeuUiArSI8j6/Cv6?=
 =?us-ascii?Q?W7Fk0Cg9xFwNKmdn9rdqYnDrqzVD7U2/dVUl6FrHv6udcZBNzI2YOHiE3OGX?=
 =?us-ascii?Q?8ZYjd+CBAz4xJeKQEAbbytYB8vKNWxTF3kGOzKE3efq9C+6XYTkVVhkzFrrc?=
 =?us-ascii?Q?s37kgNOGh84mNQ02Cw34bNlrDsRIZw0xg9DlNA4HnKOIwoveZT5FIEtzUcpQ?=
 =?us-ascii?Q?X+BYJcy3znBaN8iptNp9DJjltMrlbZHFE4jV8tugf8e30FAGZz9FUkqRVARf?=
 =?us-ascii?Q?c84aibvkF/yHAjfR5C+P5OhUCCNEWUmnCEoYFqsAEAfjYqbgfCsRnHfrXRUY?=
 =?us-ascii?Q?KQiLB8tW9eLE9MS8yZqLfJGlklj/BdP7ywjjcDffCDV2xxbmI6Y3ia3fyOp6?=
 =?us-ascii?Q?uAAFiJmJQUkXlbZJLlnbjJmVIz004E7uBjRgNA7ZSzhaAdk1yPN27w/IAykH?=
 =?us-ascii?Q?NZudpGTUrJsmyOF47Z7Cn+NIdZVk0EZztkY9684Rso7J+1Qsm73et1aNmXJO?=
 =?us-ascii?Q?FXXR4ie2aNDUxYllUEGmAvgTQ+QoSHiYLxUEWmCqjCKSMOA0YzuOuwyfGUFK?=
 =?us-ascii?Q?twGb2efrl39tVhDcA1BOuBwqYJ2/90kKtsmPzr6MeemOovcMTTRqMD6zBNDc?=
 =?us-ascii?Q?G8ePnjg+QDO9N2C+NJIRZzUI2+ERfyD++YnsDcQSG9lWBmPmGxMqiimtBI1p?=
 =?us-ascii?Q?LqQQXrbSs3z4jMaMzuDrEpR3b2tW5hcNRaK/vN/Q2IuquWO52c1sMMcKj4+r?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd8751d-3b17-4b5d-e819-08db4fe7b484
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:14:39.0262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByyZDBHOLExRnmL3ptBRjaPtdO52xBIcHOm2hsasOzzD/imm8QofDpXBnY8AZK5waiDv7Dp8uVPLxwbqGFsYBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie
 parent bridge device
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

On Mon, May 08, 2023 at 02:47:34PM +0530, Anshuman Gupta wrote:
> Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
> they connects to root port via pcie upstream switch port(USP)
> and virtual pcie switch port(VSP), sometimes VSP pcie devices
> doesn't bind to pcieport driver. Without pcieport driver pcie PM
> comes without any warranty and with unbounded VSP gfx card won't
> transition to low power pcie device and link state therefore
> assert drm_WARN_ON() on unbounded VSP.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 19ead642442e..dc0d5cb4950b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -667,12 +667,24 @@ static void xe_pci_shutdown(struct pci_dev *pdev)
>  	xe_device_shutdown(pdev_to_xe_device(pdev));
>  }
>  
> +static void xe_assert_on_unbounded_bridge(struct pci_dev *pdev)
> +{
> +	struct pci_dev *bridge = pci_upstream_bridge(pdev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (!bridge)
> +		return;
> +
> +	drm_WARN_ON(&xe->drm, !bridge->driver);
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int xe_pci_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	int err;
>  
> +	xe_assert_on_unbounded_bridge(pdev);

besides warning, shouldn't we block the suspend at all?
returning from this point...

>  	err = xe_pm_suspend(pdev_to_xe_device(pdev));
>  	if (err)
>  		return err;
> @@ -718,6 +730,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	int err;
>  
> +	xe_assert_on_unbounded_bridge(pdev);
>  	err = xe_pm_runtime_suspend(xe);
>  	if (err)
>  		return err;
> -- 
> 2.38.0
> 
