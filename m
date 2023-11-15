Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E01C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 20:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94310E23F;
	Wed, 15 Nov 2023 20:49:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CEE10E23F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 20:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700081372; x=1731617372;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FWQUzXikxtj/1Nm9/aeRVdWsEFveJzm3OJPuH31+K54=;
 b=SNmcVeTvyW5DF8J0bLFYdxFelDK6MSkOpuxOJ2v5wci2ccPueffPNRvC
 SW4EuJE0mUVFGGQcfND2OHUwC3lp5OqXWLCbvD5DQpfzs6Q1CR5L/I+0R
 tZMR1uBLnjntyLfAlh7koPxi1TgIcMfhUgn4dneIVDp9Hq8of6ityIqWw
 W2t/rs9M657PriyYPYsI5R/f830CBURH7gi9KnIDpx3NucGmdZhaFwK+F
 qAlZ7jmjS/fW22twaUN4+zQxgtgRzp5xftijH8bgHriG9Sk2lY1O3F5zg
 TsmQjBp7L2O+EcGBykYKPINZ89QJd7DcCxmSnMd78grbp6rwe2hjtOmlp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9593538"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="9593538"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 12:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855761647"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="855761647"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 12:49:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 12:49:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 12:49:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 12:49:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSw3tZfItnxKVpmxZTkBRSq6eJdQLuF/l+vhYMk1i6Ax1/pU/7VZNa/A3T1+favYtl0LEXBoMYtEAGf5BA1E7t5SYg14uXuawMsESHluEukRZIyc5jLNJT8+TIU+wLdpOA5GxY6xFbqOJcpaAaS/CI2irOL+0ZF8R8d9HLSoXnURWFtnl8yzXNqPH68fGG8Jnj3/KcKC7CkBdzbvSO2xfxf9uOhdVGqQ6My+ffiEyWY8YL4MyVpSQ9JV4Era6Uy9IRbo1cP3yS3QiK1PAkUSgWvmeERfce5NlkcCCDFIf8xJfG8bRlW7ysdl71qF2rzgpkvDE1CYJPrSkMOnH8CRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPSYgCM0yqO5HrsNpxmrtNCDHiVKrd/qMYdVF50rkfs=;
 b=TBFjcIszJVa00d/9Wi2+F71EEHj8tm3FUJD3L7+m5MjtPpH837NSQAdpGLMIs0+8p9gYRttWPeNXSAqBtS+X3lhjvJ/ddytxEBvFzQD1ODycnASUIxj3PT7VCtJSOrtJyBK29BMhhDS2eO7bJVrxaowZxx7rZKBd/CNQPcZJ8SRQPSR979hKud6Wh5bFEyTaWHtYZz/EfhAX0InW2atUBN1pCuaz57/WQzDUY2dhDGI03aKw7kaQkeWc73TcLY9ZZ+Wfc4aLSgBL6hJ4+8L94YPDzNrl2Y++3SzsSHqFqdTVw2QZ46lrAtvU25DYWLDjuqAweEEUz8+//Mnh/eU/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 20:49:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 20:49:27 +0000
Date: Wed, 15 Nov 2023 12:49:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115204925.GL1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-4-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc23ab7-c365-4563-9ec9-08dbe61c5b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCFdRacxyBm4cryFuM4Gb9aCswFQqnUd2ZQ+MEW4tXd6DV89O2PQvYQN1ONXYaz0Ff9rpNQ3GHGalu1ADaEu8JK/Phkk7fTT4wLkoMobe2xSzd6Aa42CJMsHfG2hJ+4wpY2lHSnPib20aKEEDy1ENFW2XYsNft3FNXBOvvBcUwO/I1Eo6lhhq1E6SvVuz7frmvGRT362ckhF5VwVOq4juQRQgKzP6vVU3/8cUpVQuNGomWy2zwygcDdgudrH6tTm1bn+Y/8N9YUNxwgy63WcwdSl3TliOj/WCINmvUAj/lRPHkKaC2UpuczQXDNtl7uuJKE4yEWJgPGMkj4JC7goO1nrdtIlL3aVYw0r7g3IbqsfrRC9GgIOhEQ71wc3iryQj7g/vRxbynuA+Xw0Ta3GNqle5JW3HuKxIqeaGbRvvNPBXZK8mOAo3401/xmbhAK8J8e9rYCa2dDdM1r3vz7cg02Ug5hyed5xJ5fIdkfdXbp1q9fUOi1nR0vRwQAKvqDERonXOzib0tpZIn96wVcxFxjSyJfYwmwp/RoIy/CRwuPzHNiprR9/OAEC0OfiQ+DN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(1076003)(83380400001)(82960400001)(478600001)(6506007)(6486002)(6512007)(38100700002)(86362001)(33656002)(5660300002)(2906002)(41300700001)(6636002)(316002)(66476007)(66946007)(66556008)(54906003)(8936002)(4326008)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0trNlExSUw5d3BOdHNuNit2VEFZZDA0UmRDWjIwV09tYzFuYXNhYXZ5WHFu?=
 =?utf-8?B?dWp2S2pMZ3FIYnZqSWFBNHV1K2pSTmtOcjQwY0o0aGVtVFE4QktOZy94NjJ6?=
 =?utf-8?B?WW1YU2Y1c3NGQ3lDZStTNzIyTDFhRUlGOXRMTHF6ZW1nU1hkbi9wTlRvR0Jw?=
 =?utf-8?B?Yk02ai8zaDVmRVlHK2hpRUtpeExkSStTd3BhY3NaU3VoNGpicTNlVGlBcUdV?=
 =?utf-8?B?UUh3Tk02SDZlUERKTUlQTWd4V05JWlFmZ3FIZTdSSjd5RzBJR2VCNk51WTZ0?=
 =?utf-8?B?SzY0ZDJPOHQ1Y3phOE9PT3dmOGRwZVA1SW9JejVtYkUvdnBnZ1MrR3VyNUJy?=
 =?utf-8?B?cldnNXREcXVsb0Ixa21ld1hPd3VjOFp1Vm9qLzZ5bnNQSS9hazhxSzgybWEv?=
 =?utf-8?B?dnF6SlU0Vk13VVJlU1V0N3J6WXBTMEZzc1hid3duMjAxK1NvbjZYeHpPYTBW?=
 =?utf-8?B?VTlnMHJDdGJkUkRiZGJ5Njdhek1FTDR0Vkh0MVZkSENwcVZ6a290S21kZ2Vq?=
 =?utf-8?B?dTVEbjA5VzdLYWt4Q1ZVY1k5N2RFczBnWGJwWDRRa0JRZ1U0ZVBsblBzWHZj?=
 =?utf-8?B?S1Bqb1VadllSWHVSdnhSNTZtdGp1emRPRnQ2Zm5ybmdESFZtZDBXL2RwVWZ3?=
 =?utf-8?B?eWZ4K0l3UWdvajhqWVh1SDNUTC9Pc050QjNnNnBFeVZJQTBsZGxvb0lZbUd2?=
 =?utf-8?B?aEhsOGluOHhIeXNKTzJZcE1ORk5RcUJ5bkx4cGNMcW82K2R4SkRaS2Q0cDJS?=
 =?utf-8?B?K1dFNytVTUI4WTFYR0hVclgyTjQ3bDRVem0wZjdqdnZvSGF4VmxNZnlhRjlL?=
 =?utf-8?B?ZGFqbEszQk95eWh2NkFRdzFkWjhpQ3NpWC94ZzEycFg0TUpYeHZFVW5BbnVX?=
 =?utf-8?B?S0kxVDA5TFBSdm9ZcEwxOW1yRlViem55S2djTVZBclN6dmEyQ3RvbjlIb1p5?=
 =?utf-8?B?RlViY2VkS3R1NC9JOXpsd3VRa3I5TlFSdlRjU1gwSG9aV0pZaXZ2RU9BVjhm?=
 =?utf-8?B?UHl6QmwvNDZUenFxMXpKeGlPY1ArTk9UZjJzbk9qQTdzR29Yb3VRUk9SZmtU?=
 =?utf-8?B?cHRQMFg0ZTU4VUprL2NOV1Uvb0hGYWF2RzdmY1F6YWMvWVpHbTdOdzRCYnN1?=
 =?utf-8?B?Zk9wUkRLRXR0L3FWQmVWTXJXTVRqZWE1R25hUHo1UTU4d1RUSExOc2Rjb3pM?=
 =?utf-8?B?Y1dBNVowZlRydWpKbk1xYk1hQSs5QkhQV2VHYWdnRXNPRGxNSjdIajN4TFJC?=
 =?utf-8?B?ZUx0VkZHajNpeCtBZVQyME5kU1M3cmFIS29iSEtnZFNDMFIyczlySHV1cytz?=
 =?utf-8?B?eTAwU0pGcXcrdEJKeDlXVy9vNlAwa21oVGZDNGc1TGVZU0dkN1EycmRjSzZZ?=
 =?utf-8?B?YU5oMTE0RkVPRzNUVHAwWFA5NmhGeEtpUER2YU1ZRktQTFNFYmx2WUJLVGpH?=
 =?utf-8?B?ajdYYktFaXRTZHRlbnJ1VUYvTzh3aFF3dzd5bGRGZ09IZCtpbzJQWVlWUVRj?=
 =?utf-8?B?aTF4a2wxUUFYMjdURmswU3l0bE52S3RaTHZOS0RlMmVvZVNxdGZ5SHBOUDU4?=
 =?utf-8?B?TVcvN1Y1VG5ZNE5OTGViZCtiVHRiU1VKTjY2Q1VxamcwbVA1bVJOMktETUhF?=
 =?utf-8?B?SWY4YlpMQkdpQ2dtMjFjNnE1Y09WMlVnV1h6QjU5NmZrRlNiUm4rejgyRjln?=
 =?utf-8?B?NElOeVBXVFFxVkxhQmNHRjRmYzRGUjVLcE5yNFVJZGVSTDBOMnBpTkNUR2hW?=
 =?utf-8?B?OS9MaXFJaEI0NS9GTThOUTVhYWFFSWFXY3FsRHFIZlQyTHNpdTBRS0VBb2Ux?=
 =?utf-8?B?cmxvQVBSaUNVQkdTcXlSaTcrTFZNaFhyZjkrMTRJaS8wR1gzZE9mVzdQZEtt?=
 =?utf-8?B?L1F3SFk0ZUZCa3lsUmlWdURQaVBnRGIzdlc1R3pNR3YyRkZhK1RVTWlNWUd2?=
 =?utf-8?B?MlhicUw1aHRNc1FlU3BHZDNSQ1pJNnNDaWMxWmk3L2xpYjIzcmpNUDRwdkdp?=
 =?utf-8?B?MWkyWFBqNi8xcG5qWDRoVDlhZUE0WWtVTUYvaXo2Z1VscDM4M3J1ejA1T3po?=
 =?utf-8?B?cUw2OWFNcktiZkNnWkpBRU5NbnhjSy9UcXh0eHpaV1BKekhpR3dVYUpwNk55?=
 =?utf-8?B?ZW5PSVpBNG9HeHBjM3o2WlFHeXRkajNvRTYyQkwxV0F1dzl0WlVLVjlaVHhv?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc23ab7-c365-4563-9ec9-08dbe61c5b96
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 20:49:27.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIXkOYo7FmKcyPh4AjqE2ae40h24jkbauFro89sW9a62+Z12XGgl8/EYdUe7RiK56+UlA2CDKFAF3+NMg+ZqUnB2sebFyXgHc8QFWuWHHek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 03/20] drm/xe/irq: Don't call
 pci_free_irq_vectors
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

On Tue, Nov 14, 2023 at 02:02:14PM +0100, Michał Winiarski wrote:
> For devres managed devices, pci_alloc_irq_vectors is also managed (see
> pci_setup_msi_context for reference).
> PCI device used by Xe is devres managed (it was enabled with
> pcim_enable_device), which means that calls to pci_free_irq_vectors are
> redundant and can be safely removed.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index c5315e02fc5bb..df4da774d0275 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -603,7 +603,6 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>  
>  	irq = pci_irq_vector(pdev, 0);
>  	free_irq(irq, xe);
> -	pci_free_irq_vectors(pdev);
>  }
>  
>  int xe_irq_install(struct xe_device *xe)
> @@ -630,7 +629,7 @@ int xe_irq_install(struct xe_device *xe)
>  	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>  	if (err < 0) {
>  		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
> -		goto free_pci_irq_vectors;
> +		return err;
>  	}
>  
>  	xe->irq.enabled = true;
> @@ -645,8 +644,6 @@ int xe_irq_install(struct xe_device *xe)
>  
>  free_irq_handler:
>  	free_irq(irq, xe);
> -free_pci_irq_vectors:
> -	pci_free_irq_vectors(pdev);
>  
>  	return err;
>  }
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
