Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D209C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006DB10E5EA;
	Tue, 12 Dec 2023 14:28:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21EF10E5EA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702391315; x=1733927315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FVrhCmwlvbj8h8HxvNRBJ2sWmmJHGMyTciEvF2ErCsI=;
 b=TeVsFxd6oGlWM9zliBlH8vXrojFhCV2Gg0UWgyJ/0DFAZ2LYXbuJJ+t8
 rKQE2QQkHSnI7qrjflWqqHvEG8WM1O+E+M3woraUNLhR0DfIJubAheG0/
 imWCyWp/rEpO32ySRcq4QhE2/IQjI47trcN2SUeaXoyDBgsMWrGzk3ox3
 aYVccTfXGK+19VBDMEKgmxVRR+Q1mVg7zSajm3OJDnfOfOt8lF+WnGghF
 UiKf88dnRmo9zDb/2MpCYypISX9xlhX71DljnGUkra0mSYKmefnVBiQPT
 RhECXhMuT3iUoXXuTGhvrXkdn+vohS6tVuPEZSwbr1rnJX6Q9Ohexlan2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1672561"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1672561"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="766832567"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="766832567"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 06:28:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:28:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:28:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 06:28:32 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 06:28:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic/2PFSedgt6/CLu4vJsunYY6RNlts1Fn+DiGyau/VLOpbmzaaaibq2vID9tEVVk0Hj1bQ9QGqD6gnUBu0AbGk+PnatjpVsM1iQ2Xe8D0fQECYZhBWTbdDMMebG4KV2a40JvKdjCbLo3dqitFYnIDLcARvognNJBpGgYDntz41gynnmkiPoK8t6EB/o8DIRxoe0RQQkceJg4j3rd9/GWwCRYu+/nJ+FMeCI6D01DFUbOvLvTHMOIbCUjvpRiIutfPVWJyfWyM+mUx+YA+xbDS+H+YecuPd8fa5hwfugJXohNUj4SswD5H7R+RA659iXFMQHTTTNwtSYh/EitPNsIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/w7WLRq0D67bJFjHDzth6TGwalO2Ez6ReFGNlap/88=;
 b=Zrt10by/EywlAHKgT+z+NCMtvHyb0bBnhh9ezM3zFZglj6huShqEbo4eRDwfwP3QLrIzWlAOYWeadumSkaz3ZqTE/u/GuP5aLe7RGPkX5hPHycC2WEabZ6JiUMHmK5xrwL7X3+eN6fSPnibN05IDubym6kht9Etk7Ewheg3fgS0xo1jclULttHkRm/VtRfRU8GJYKLEPys6grkItkKB7i8bYZpmU+W0LJ3elCAuoHCZYtOgNjTLwE2LtbGiQeiU+TsFjVJLrTV+Jn06frS21ygRK4rMb/Z6TCEQCuIs3RRVRSc1PYpDxBqVFp8Ge4gbaI9aGf0cm3rOoKHbGluEPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 14:28:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 14:28:31 +0000
Date: Tue, 12 Dec 2023 15:28:25 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] fixup! drm/xe/uc: Store firmware binary in
 system-memory backed BO
Message-ID: <ZXhuCRgyLTueqGE9@fdugast-desk.home>
References: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB7PR05CA0070.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::47) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ec8442-df7b-4289-15dd-08dbfb1e9d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plBLQ3gAd6JDaslIegrADS7pCjDrjDOrzUa9kcdHGmcnY8qKvuTlPLKcQ8041laFlHPb6WG7OEufI13y4yJJjMlk9WTS/5v0MyFD5oCOG4TBNXEXgWH14+FAunjSfni1B+VxUvw3S7HQ2k1cQFmbojQuVbeFaISQ6zKixLPdqVWNa81NyAgapVwMC18UyK/rAoL60mt9bAXKOe/TiMU37DugFoKcsZmyVvfh+RwhWHPylqJuyWHCXJDDyoQCL+UxiHUvvfeYMCdxdBAsi7pBWGnsA2yHu61Z0F7Sxi82HLE1u4Ejk26QUutZrqKQj7/6dgxL8mWoCHRNllURbGkXu+J/sNYGIC2HY4/sU9xCPuby0o1tljVkbYeAo+zdHnjLlWpL8N/p7cT59LwgKXtecg4HXGgBEvkbbgMBSu1EYAtJRN8NpHUNY0YRI+zGMX/IjHYpHWOMXwniAWdBFumKpL48aLk4HtSAgvYjzQa+Cf+6WOCv8A3qg2QeiFqJux1X7SexS35NuroLyZ7OdApfUzKeRX9lQMFritfWhKW3EkJVq5qDMzL/HePz6o9LA332
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(38100700002)(82960400001)(8676002)(8936002)(86362001)(316002)(36756003)(66556008)(66476007)(6916009)(66946007)(478600001)(6486002)(2906002)(36916002)(6512007)(4744005)(9686003)(26005)(6506007)(5660300002)(44832011)(83380400001)(6666004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UBdHHzJOlZN0AaTEfWYGBbrTT64pcKCnEr3e/xt9ZC1qX2jin9Lme3Yhba1r?=
 =?us-ascii?Q?tBPSDX3x/U8X/nfqmvfdKg7amk70pBQm198MvdshYEFnnXk53ohER3TxjaPY?=
 =?us-ascii?Q?acV7coxLdWFUt3Xe0RhoFuLF6EWqH2gqTQnklkQ4M/AkkxAHlpUGTDxAS/1w?=
 =?us-ascii?Q?/EepNWFwnIrCP4l5ZTa0D72WecQpULRiJ8ycOwP/4mJ2XzvWQ6xjjMRqQA1q?=
 =?us-ascii?Q?hWF9rlmftiKlZhT1ow9WuNbLBHN6lNKm/QMIiQ0c2Fo9fCQwHGZWFuerwcQF?=
 =?us-ascii?Q?ZcfrdSrTmWQrmPD4J3LYoQYixmxCRKbB0I+o68ilAzWJtccF2BIBruv1YxVy?=
 =?us-ascii?Q?p59u3L7ncD877dCOHJTp5F6PKbgeBwhbvWp55ZGJDRUaJud4T4T9Ow5CZzGg?=
 =?us-ascii?Q?SvBjeTqotLD4j5wI8pQBk+0xuCOOndY69Iqt7aNes68ehIjKp+sG+Vx3O/eU?=
 =?us-ascii?Q?VNN2hgPQ1Cz4lks3eRp4mtlqqkMF9oMsLT+wC2gIi57ASYAXx85Ravh6/7E1?=
 =?us-ascii?Q?JcMnrSbCNNafRGUMc2+oPFP7H0y3ZlANNb7IE+clWLXvTAh4y5mUQJkHnhdP?=
 =?us-ascii?Q?AdCJhjvcgmTCurMlpea+zrXTuccNxVg9BcubfL53eeZlwqnbCpXh8bs1VV8c?=
 =?us-ascii?Q?uL9aMbJlj/E0oGWHlqhcUF8wppkev/akwZOT5xo0by+IxaXBQkCRx0f76BPc?=
 =?us-ascii?Q?eqJKM5AOHtW/3AWwIe21m2N/0jm4Q/1XBHyj3qOr0MVfFvXgjnMIdiMfAJV4?=
 =?us-ascii?Q?UaGxEHfRGKVYN1nNZshez1kO4oBiGpNWHAV9wY0CnV9Hz0TdQwzhCWd7U7My?=
 =?us-ascii?Q?/mUWtrLx/Unxn5uQ6l1dCxdnO25pnrkadDdRGBdCeR1UsSu3vH80e1Xnr14r?=
 =?us-ascii?Q?y/by0vPEIigKHCDGzsIOjCXEkQzNgzxQdxzk1xMlLJsIhcuhIa5gt9wqIa4A?=
 =?us-ascii?Q?nydzfm1Vn2zGWrHnYhvkgYZOeUdh/sy98Pxe7dAY9Oph9qcMQb1BsdsPq4hb?=
 =?us-ascii?Q?peSQN6bC+sOSnkbzGULNIs7xiqvsPM1n8/TdjfRxXDcDbp8rM2/y7LNjHMdJ?=
 =?us-ascii?Q?086dOef0MyIg1UrjI0MzQEgn8p8E2KZeUDP/8e9ND89H3Sisjo6AyXHuy0a2?=
 =?us-ascii?Q?+AEFHAVdwktXhRwVIR4DviBaL8wzDjgfSrPQ5maBsCmYH7ZquaS1AgCBuaPJ?=
 =?us-ascii?Q?Yyxbkj9i4PyPpeLkOYlmanmfBQIFQELFBk3lwK2Xm81Yn38dwGKNvlYQRrfG?=
 =?us-ascii?Q?vJ0bp8na4VJHeRQzIKzgOxVxvJetuHHUNGAqMWq62eHDNbfEy1BsQ7cNSBpG?=
 =?us-ascii?Q?y75pP6jBinawipcRMZQLgg1ZqNouG+hhyZ6YKrm0hqf6RNxiOo5ia3WLqUZr?=
 =?us-ascii?Q?LYeNvpy+MDjyhD40WLexIrXHeEa+n1GOIVdEsGoiWpX34aLp+ExTpTm7gcn9?=
 =?us-ascii?Q?RJeqZ7JbA+24p1GFQ+22IsdFmd5XaUDB7e234OP4mYsjgEkbfosYCKznOnyo?=
 =?us-ascii?Q?OzGVfn4lkU9SdGOr1yWW0bYrN5KdSuGw4xCuJl1lt/OW8DMTchJremGN8iy3?=
 =?us-ascii?Q?musO3lzndg6+NZYqg0gWTlALmzqXT7AXLnXj7rNZ4/kF4dD5cRarbm6VeV98?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ec8442-df7b-4289-15dd-08dbfb1e9d6f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 14:28:31.3019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/1rOi/GwPcLi3b0npP+qwz4Ijc/dDulFkrd1o5EJHIdx8+fV03AHEbtq97peNTbjG+wozkxSiYY16jgqi4qW/4bA+mYH1VLtPGkiW3l1q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 03:20:44PM +0100, Maarten Lankhorst wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6c3f601f4c1a..73d6938c921d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -762,7 +762,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	if (!fw)
>  		return 0;
>  
> -	err = uc_fw_copy(uc_fw, fw->data, ALIGN(fw->size, PAGE_SIZE),
> +	err = uc_fw_copy(uc_fw, fw->data, fw->size,
>  			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
>  
>  	uc_fw_release(fw);
> -- 
> 2.40.1
> 
