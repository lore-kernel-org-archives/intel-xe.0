Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C812AC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 05:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFE010E2A3;
	Wed, 18 Jun 2025 05:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlILlcSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140EA10E2A3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750224842; x=1781760842;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uLuRLnsTN5e64MuQMIu8mRIbATz2te0MGBLg3QNWMBA=;
 b=AlILlcSuLwwTeX+nq0KRgbhongeJ0JJc39oE8ocGfotL/Rn7Q+e26AZZ
 K2OE8I3qnClfMfQCTAhXg0Pm5woSEpbW16YKS1OcPion6T5WdET/YWxfO
 7Iq6hXOlvacKrMLPa2LMKzOOkHjAazyvzwtPaCudBWNMTAn/IRG5R8exj
 NxrTNnwG5ulLFM/YOsqj1lrL9wnqloXuTQ8AhvYXPOBocsTfY0LIzNFXD
 s3MNL99U7N+nGVIprSCB72UZ10oASIlHwApAujsd7xtQIOh46bGL7UQKI
 uGwAMljChtGpRCPG5dg/biLM6wbPg9su8H6mrEPph7Y0qejIbMCp6VDvU Q==;
X-CSE-ConnectionGUID: LpN8qhDbSBu4BqlWlsQkmQ==
X-CSE-MsgGUID: VsF6BDasTbaLzRoXllRarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="62704017"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="62704017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:34:01 -0700
X-CSE-ConnectionGUID: 2vIlQRwaRKyqKSVx+KFRFg==
X-CSE-MsgGUID: wBeDYWibTNycZCZry+WcJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="153987007"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:34:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 22:33:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 22:33:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 22:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgQ1snv2+YwKVHdwHYh0XvPyiDBaxmVJE/3OUZIftn5ga8gPnqp/h8xp7xsoZmDvI39M+GwmwEn81pnJN6kGbiH+3bvvWyThOwvVFCI4VnWqGiOEvWw8Ttf/18OJFSP7uFT/IOxAd73oKEtXHSaihLOue0BSIfvPV6CUEMz4ko6rh6NxQRAAa762F2n9UosNhYCcWXgCFmSaUfxz+6H7ByyjifKmp5rl8RdSHbYaYVWT5QWQXfz3sHM6gVVjMOzIdX5AAmh+o/pg87A59Im172gDRazBYNBJHMHHg2ru7IVp1yb+OXuMysu8w9A8rPxWph0q5+3y2tM97diEBJTaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tj/sWgPMxRxjpiun2ltgOaZb8iuc6jUlZAT1RrPOGw=;
 b=qAniCPjmhBYMoDDQ0UrPxvzdyKUW82MgrtunZeY1lJXjWYhs+BlxngpAN3s0yxiuD2Pjln1+cfxqsn9HAOsEp2zKmTesjbEe4vXsGupXgrcTMIQHgJkY4gq+iwMn4uyl4HTA2w4hW5WuHi2sxo048wFrBdSHItWE25ysiQoqoiP3FSR2oVs4Q656p8veETowp5A435maPuttfrTxcu4IlbDHW5Y11a1ZCRFsoOS4Y6Ajc+uIx/1w0Y7LqaxiGlrKPG6LfAbiHIav08FQ+hj+P+VZdu6R14rNYErKExS742pNmCwB8MY8hx1HBJKLG8NDDRHYjoflbH7+m7StGMRvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.26; Wed, 18 Jun 2025 05:33:56 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 05:33:55 +0000
Message-ID: <e2d9bd5b-ff5b-46ff-9332-ff5aa5cf6746@intel.com>
Date: Wed, 18 Jun 2025 11:03:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20250617171600.2905682-1-soham.purkait@intel.com>
 <20250617171600.2905682-2-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250617171600.2905682-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c23940-7b00-4e69-85d0-08ddae29b7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2xNWjNFVmlYSDJTYllIaEdEN1lxK0IyRWtNU3VUQVdnWGliOWdhaWE3dDBt?=
 =?utf-8?B?S0x4QkFxMmt4NzB4T1ZwWnE5b3ZxN2w3WVFJdVRmRmY4UXlWNVJ1NTREWDcw?=
 =?utf-8?B?NmtwcFltYnZyQnQvNzBVNUlsWHhmV2FFOG11amNXSDJyQlNHUkJ6b29KM3V0?=
 =?utf-8?B?NVIrUWhUeGZiVk1Ha0pHbmtaZXJrQ203MHF0S0pBOGY2VUdRUFE5R0dnWnIz?=
 =?utf-8?B?azdZQ2ZoTmgxaTBwYm9RQ2tmZDZzUCtNemppWTJNdGczNGlVNGlXaURhRTNt?=
 =?utf-8?B?VjdydXVUcW5QNlZsSGoySVhZbFc2a0pHenJzYVBVQ3d2K1NmdzIwZjBWT1dq?=
 =?utf-8?B?Y1o4YVZQcWhPVk82UklnVFRkMnF1SU9GMTE0UGNzbG1JYzJZRG1Uektpa2Nx?=
 =?utf-8?B?aGdyWk9Ed1pOVW9hWXIxSEp6azR0M3JmL2FCaTBsYW9VYnVYYUxrd3doZmhn?=
 =?utf-8?B?eVlmVVZkeGd4S09tRVBNMjcwM2VyL205QmdHdUI1OW52UHVYalVFTTdESlVJ?=
 =?utf-8?B?TERNWndNU3c2ZGxGZFdWM01qOWFRV1pSZ2FDTk1kUmgyY3pSby9PRkN0S0VW?=
 =?utf-8?B?a1ROeitYdWNJcEJkUWN2Rms1MnYrMHpBSlVtRGpZd2dSc3k5a2hWd0IzdmFP?=
 =?utf-8?B?RXRPQ2FXaHNJNlNKTmd0U2JFd3MvdTk2SXU1S3ZoUkUwZitCWDYySnI4eXB1?=
 =?utf-8?B?dFpOTkxaMldBSlQyNXJlMVBYN1lmazFMWkF1R0xhOTdseTJ4NGhmRG5INmlV?=
 =?utf-8?B?SkxaMlA2eTV0QmFYTUoxdHRseHErMGx2K1YrM1lET3pBc3g2cHQxR0UwNEhP?=
 =?utf-8?B?ZlROREdtaSsxdVNCNjRNRndZdlhjNFNVVDN3L0NmODlJcEo2SDlpYVhnT2RD?=
 =?utf-8?B?bTltZnlSNSthRUplcHVleGJMbGdHeXh0eUF5UGhseVBUY0VOU0xLZXIwcnNS?=
 =?utf-8?B?OTQrWEdOZG0yUVIxbUViZmZCT1FzU2FVVEd5TFlMckc5dnVEUEVxMkxoQitH?=
 =?utf-8?B?MHZtdmFnZk1IMy9wV1VVN3lXWU5RdkdYaWdnS2VJSUQvc1RKUmhReFEvanBv?=
 =?utf-8?B?YkZEeis1WWFQOHJxVDRTRlR4a0tyOWt1N0h6cmh2dXB3VEpiZ05FSzVyR3Rh?=
 =?utf-8?B?SWhaeU9HN1hLU2ZpR1lMOGs1TW1EQTlnR1VUMWhobXV5ZFFRZ1RwY1poRFli?=
 =?utf-8?B?K0QxdnVTWmZBOEUyN21LaHRxWngvNlNuYk5nYkNndVl5OVprRkFKOUcvSFdU?=
 =?utf-8?B?aC92NTBhWWlmMEVYcXZFSXlzMERSNGZIdDJLYmJBMVZ2cG5MR0dFVWh3UW8v?=
 =?utf-8?B?TU1YZEFEQWJVeU5MRHZ6L1pzMTUrd2orYWpQUnNKWkMyelRJWnVTdHBYUXZN?=
 =?utf-8?B?UVlXbmdXazhsNWE4eUVKZVA3aXU4S3liNS9XTmFOSnFUMnFLVThjVDdES1dm?=
 =?utf-8?B?QVZNK01hczYwaWVxOGwwdHFuK0Z5b09iZVZGamlab2dkcVNteUtxbm96aldn?=
 =?utf-8?B?NXhEd3BvdWNiVTNBaE1NbWhlM0JiOTFXb3FYU3NZS2JLQ1hmM0dUMHlxeDFG?=
 =?utf-8?B?c2h4ZWxJcVc1TTc5eW04YXgvNGdpd0FpS21zTFU2NEdRYS9JMThSODNqcGNn?=
 =?utf-8?B?bElJNjFvQzgxcEtlME9vNzJyRVZ0bEIvdUVqamllcGNMWWxrcHhyUTZYSmNi?=
 =?utf-8?B?SGVwbVZkcEw1cGVTcTBmT1oyUWtJbTM5NWJLKzhqamJKdHFuT3VSZ1VQbm12?=
 =?utf-8?B?SSt3LzB6b3o3UkdSdnlueDlkNmo5V2dsdWV4eC9XLzYyQTJuK3NDWDlkOGcr?=
 =?utf-8?B?L1h1R1Foa29CV0VNaCswNjZySWtBdUZUc2xaQzI4QllLWXlKSWk4RDhGdlE1?=
 =?utf-8?B?cEdoVTMxSm5EKzc2cDYzSnZtV3ZkS0dnVk1OUnVHOStadnc1d3AvM3JhMWcw?=
 =?utf-8?Q?zCIQ6lQy01Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TURuSE96d1h5enowUllhQzg3OHp5dFlFeUw1VUVuYW1KU2NiMGNodnJnbWJG?=
 =?utf-8?B?amtnL3h2SXl0WjdTbFEwTVlvdlJvN2VtcUI0MTZrS002aFhrcjlhK3puMzQv?=
 =?utf-8?B?dmMwcXFPMDBYWFoxMWYvZ2tPUEF5cnBPNURKUFllSnZPTGVMamg5T25PYXd3?=
 =?utf-8?B?dHNXSDBmZGlDTDRBNHZodDBRTk9CbFNpWkRnSldqY0VaNmFEeHlQd29pUHA1?=
 =?utf-8?B?VERQSGFlY1JzbllPWCtJaTBKN1BKaXdRWmZCeWU2OUJJeGhlSlpOY3JxREdR?=
 =?utf-8?B?dWtiU1RYOG1hZHA1WWtCZUxBRTRnRDFLTEVGeEZ4cmNCZjRFblNrSnBUUnlD?=
 =?utf-8?B?Vkxza3QzRGNqZjlMRGQ3WGZDZWNaTW4zK1RBTm9nMnlGdVo5TjE0L2p2OWNv?=
 =?utf-8?B?blNvcVc2ODAvUmloT0lTQ2F1ak54aUZ0UDFoZEZTOVlPNmdSOHo3NzZxeVFG?=
 =?utf-8?B?VGxPZXAvRVNHMVMyeW04azdIYldhdkZNWEVHQ1E3UDhsOTJJSC91Ti9JR0lN?=
 =?utf-8?B?QU56Z3VLdGFjQ0NaejVZc1M4TUl2dlFZOVhQSFZaRGlnTVNLM2l5YkVNaTNn?=
 =?utf-8?B?M2wzZGFCNmgxVkM2Z3NZRStYbnNLSFdJNC82ejZTSVdxUWw3T0lOU1BraC9G?=
 =?utf-8?B?eXExK0NBOGF4bmluZzFTQjRDM3pLVW4wS1lBbTFQL0FOSjRkWGFEMWZtYkQr?=
 =?utf-8?B?RDhmaEEwOUkrcDhCdzE1Y0JSWkxnWDVXQllsQlpSa2J6RTZtYmd1K0hxaXBu?=
 =?utf-8?B?d3h5TjdpeEJhSFJoeWNGMmZSSUFRaHF0N1R5REx0Q29qam1VUmFGOVZuTU53?=
 =?utf-8?B?YzFOMU1YVUxDR2VlOEsxNWpnNjhrS2tFRkNTOFJhVFQrZWN6bVhteHpoTFdl?=
 =?utf-8?B?ZTJkRXQ5OUJiSmpRT0RUSGpScHZWVjE5cjlwOE40V21WdjVHK2s4dkhGWG0y?=
 =?utf-8?B?aVhSekJaaWRjVVZwOXRocWpOdGtjZHBpaDdESnllQmJUd3RVVFpCVDdYUitG?=
 =?utf-8?B?Qzc1b05RaDRwQWg1enNIb01xYk9jd1AyelRBK1p4eXlWOGNDVEN5a09kczNJ?=
 =?utf-8?B?RTQ1RGV2akZsTnpjTmwxbHh4MC9weDdmeHBRTnBha1gyQjVQa3YxejFQQ0t5?=
 =?utf-8?B?SFkxTHdrQWxvWGwyTWkzSGJ1K0IydTFVcXNIcEY5Unc1YkUybmdnWGx6YkZj?=
 =?utf-8?B?UjRYQTdTSW1ZVFo4TmduM3pidVFPMXlQbnlXS0xuM05yOVcxQVZxSE1UczA4?=
 =?utf-8?B?M3ZsZ3krc0ZuaDhIc2ZxenBaSVk2VEVJNENUaXMyeDNRbTl6eklSZ0RieStk?=
 =?utf-8?B?eEUzT3luODlVaGhUYTNYY2hOUEd5SFp5SUlxbFM1VkpNOEJlSFdaK2tvL2JG?=
 =?utf-8?B?WmlIVEc2UW53dGI4ejBXN2JWSG4rclI0M2JvOE1UZlQ2Y0RINGtPdm9weWYw?=
 =?utf-8?B?SjVJNEVGKzBxWUtCTTErKzRxZTVxeFEwQktLckJPTjVQUlZXNmpYWFI0QWhn?=
 =?utf-8?B?SE5OSnBOZ2hzclR3QTVZakZQUFdKK0szdGdWa0JMYmVaOVREVnNnWkwvNkJV?=
 =?utf-8?B?WENLSmlYLytzaTFvNXBZQTNtN2FWeWV1RXNVaTBScVF6NG9aQk5HeW1FdjQ5?=
 =?utf-8?B?ODc4V2lTUWZRZEJzWmRGNldRM0VpSGVpelJBSWVpelRaalJZY3loL0FhRU5p?=
 =?utf-8?B?c3B3K1VtMmhNOU9ZcldiYjBkT05haXlscE12RzUvSGVqVEJicEFaemMxZWUw?=
 =?utf-8?B?OUxZVkI0WXpnVVZMTTgwc3VXWkNwaDhlMzRQOGZvTFZySDJDZTdtcGhLUVc1?=
 =?utf-8?B?b2VlOTZzOVJQcWRyQUlkZkNxaGhkUnphdFNCdzhXUG5JVERRWXY1Smgvbmo1?=
 =?utf-8?B?QThyMG9HNmc5R3NXNnJpbnZGdnZPcDlGWUtJWXpGTVRGdVB4MUxSSGJCM1dj?=
 =?utf-8?B?MVBxbW1lU1ZWeTkwekVFbXFkTXMxc0ZSenZ6Um9RanQzR0tFcHRpSzhiU3BE?=
 =?utf-8?B?ekJ2L1hMYWs2QVA4T2Jka0I5SUlmdFpFby9vUHhkWFBhQXhKdEFSdVcrQWdF?=
 =?utf-8?B?cmdYOG1ib3pteVR1QmZrZDhRT0N4Q1FnVlpEM2ljMTZHUmJCSHdnZlp6eXNS?=
 =?utf-8?B?blJVNWFKRkNhZjZQbWd0dC9yMnBBcUdaVDYzUVRHRHkzZldyRjlzMjhyR1pC?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c23940-7b00-4e69-85d0-08ddae29b7ab
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 05:33:55.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xw9NjjInkHrvWT4vyjegrLXEPS+cGAT3d0XSdV6XqvrYb/ipHiqa1TWILKurR2JqsQyuZDEQgesHcl6pCFdKDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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


On 17-06-2025 22:45, Soham Purkait wrote:
> Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys

1. dgfx_link_state_residencys - This should be dgfx_link_state_residencies here.
2. my review comment about simplification of commit message is yet to be addressed.

> in order to obtain the G-State residency counter values for G2, G6, G8, G10 &
> ModS and the pcie link state residency counter values for L0, L1 & L1.2
> respectively.
>
> V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)
>       Included runtime_get/put and removed drm_warn. (Riana)
>
> v2 : Moved dgfx_pkg_residencies from "/sys/kernel/debug/gtidle/" to "/sys/kernel/debug/".
>       Included dgfx_link_state_residencys for dgfx_link_state_residencys.       (Anshuman)
>
> v3 : Included check for BMG and dgfx and helper function for repetitive code.  (Riana)
>       Used drm_info_list to create the debugfs. (Karthik)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..39c5fce3e4fd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   
> +static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				  u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +
> +	if (ret != sizeof(residency))
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +
> +	return 0;
> +}
> +
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
>   	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_link_state_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1.2 RESIDENCY", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   };
>   
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_link_state_residencies", .show = dgfx_link_state_residencies_show, },
> +};
> +
>   static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> +	if (IS_DGFX(xe) && xe->info.platform == XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   
