Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2486BCD495F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 06:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48B510E55E;
	Thu, 21 Sep 2023 06:50:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8A010E564
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 06:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695279057; x=1726815057;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=UXx9IBHmxjjbynh9T18knBqTtSQngw+Gkj6PVMOcvSw=;
 b=BqQKtfNb1delwuuO4b+0FR1PrkvmrM5VaJ2H79R1///IGKZdtA1K0sv8
 PbqRzdzi2ON8Jqe68xF8mwNLlYJXkIsSFxLYJ07dXFTbdMRtYqbyj2u3z
 cJhXs706mD53tBK/6wCBe6aMKbv4zmqV1BibjQTqKT4P4TRPeLB2CDMxh
 ABpNQzLCD7RGVJSuLL8sl55tgbNOxR5Cu1VYZvHkyEdm8Vln3luKIwG3H
 Yl4yf8KKa4jwDGXosgUA98bHFEWJQ0r95/lMt02lspiFCt0d5mTSqVCI1
 RaUpfhUORYNcKtx+NdejFciGcAYk59IavCAn1vsXsRoQoZ39RDcCeqbze Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360687382"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="360687382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="837206106"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="837206106"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 23:50:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 23:50:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 23:50:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 23:50:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 23:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wx4Yki9XXJ+C+uzXP7G8wjFezhX7Hvo3GknwwXqP6jiuY+KuqX6zmNP3Dk92dflK6fy/ZqZo6/j17XtFbWcmguFj+Hwg8Zddhhi0CL/VOz7BklI1rRM3l6CHMSHUHt78oejje7gkVVWxSMTqVBD0PDtfsohtepqrKIR0/tgYtp7V4V8eRcpmPp0n94JCb8RySf7dtsTaR2ow5jGEQRGHnoRNZAT3nam9EojhY1dMh1OMSyR+QdjChPWLO0fdS14Nb618PYibgThoN8KmETkim4QdG8wAFkbGhVeD4dMVTFGMX9+gd3U/ByI5j+tK0lhkF6BFVpWpy5GTtquja1GyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ExmkVG2mr+pXXNT+UTwz5Lnr+Z5UnoEOlqRbnGTo+o=;
 b=JtZFezWD9Q6+iDv5Nt2PTO/CHu/k9chtJBcR+Rb7QAkq+tkAyPtCJNVl9gBV+aG5aatInHT8ZnbdUryemFoRpfOJZ65P6s7I2y/GGzVUJ5S2GU+p9DNm1fi1QKCW4hUycIiF4J+cTVG6lTdivcci3rzNEzgmStGywKRF+RcndeSOAdEUIqEnvY67ymfOeiST87JVZSzYRhw9V4YWX/yn6u+qzJiYKAp/sdMtTemRbP0RmS3ltrKUyjPkdzn/POyWFbR7fufrtLRWuWb6C6LHCB6wrTsUOJT6N46F3esAoZM3vhUFb2KxNZ5bKoBSsMFzKCtntNHxcefWItWGAM58HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 06:50:50 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6745.035; Thu, 21 Sep 2023
 06:50:49 +0000
Date: Thu, 21 Sep 2023 12:20:38 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZQvnvvJBYlaYwoQe@bvivekan-mobl>
References: <20230908184928.65815-1-gustavo.sousa@intel.com>
 <20230908184928.65815-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230908184928.65815-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: PN2PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::22) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c824d4a-4565-484d-ffe9-08dbba6f1740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CYBBLOv3VTgT14iN+ilvU+jriL2E5LRaJ+KhmHghfgQsYsBqjcYs/uTZfeLUmvgu220jQ/RmohRf1VUJ5efHKCffTcbU/glBUWjEf+/yoz2bmvjgDfGUnHcuXni/UL7LaEqNn7HWqVwJ+KyBPm7tvp1wPbnV+VCfcPVs52onRkg5f9zR1+kuPn1hzxyRY/UVlkpN/93Mfd5lu8Dk2R/1u+Bs0L2iGP6fDfrO7viTTkslcXBenlPePucoMGwcYyG4E8BT/32vh9pqgZkSRNeQiTEoFZYDofpQyNmaZs+2cxhWLaOaoRNri0z2Ay6RltthjtbqZQr+yLVdVk7XQZvAPhLBI+tn2Y/FPRO1E8xJbjTAGHA1fATyH4TG3sWHa8aB2e9xD1xHevQluG0/RAq1/zlR/wkOyjOTy3SKCS6O5mth7ZRF00jfuOwAS1IhwMplyQYHp1WnqdY+NVUVkruhi+njCsQVy54LerIHjGRHu6TksQTtrGdO9BRHRNywyCkoqTpKZjuW4ON+simWWu3M4YGG+00htn4N0yjcE/TpdZwl+jsFXMKKDhsM9zilrxJL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199024)(186009)(1800799009)(53546011)(6506007)(6512007)(6666004)(9686003)(6486002)(83380400001)(478600001)(26005)(2906002)(33716001)(41300700001)(66476007)(66556008)(8676002)(66946007)(5660300002)(8936002)(44832011)(316002)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHArVmlYdlVvbS9zTHlEaThUOStMSUpCeDFXWnBRMDI3T09wSkhLVVZ4YXBk?=
 =?utf-8?B?ZmtET0xNd2VtLzdMWXJxdURqN3NidlVkbDhXb1JOem1WZzNRaW1UVzBTNkVH?=
 =?utf-8?B?Y2ZUZkpLRUI1bk9GdXllTUFRbUpMdTkrWmFFV21XcTU5RURIMitYQ0lKenk1?=
 =?utf-8?B?dGJDWmtMRjZuZ0JaaktuYzFuWFZLNzhIanIwV0ZyWGJsNXhBSmo0dDcwZzl1?=
 =?utf-8?B?c2dPSW9xUm9ITUc5VzUyeEp1ZVVWMERNNzlIM3FUYU1Cb0JwZzNiRzhDZUk5?=
 =?utf-8?B?MFBvc204bzdOeHRZRmtoMDc1RzlzbDdLdTdpZXlLTkozeGpwNi9nL0J2bTdO?=
 =?utf-8?B?Zm11ZXpIcDZIUTFmaEtIazZKV3luM3ZpR3RMUGF1NWF1N3BFNVlWNDZ0cTZy?=
 =?utf-8?B?WHJrSDN5TEpybzFSYnB4VTFsZUIvMmFsVVovUGtwM0p6eVN4T1JyUW1GVGZC?=
 =?utf-8?B?QTVLdFh5bktnb3piNmdkeTNJdE5kSlN4QnJPLzhja05HZUgwWU13emhkZnBU?=
 =?utf-8?B?OHRmREJMUXkrWjZZaEFQUmR4M3ZVTjBqWklBN3YzUWozc2R5aitIY3NBR0NN?=
 =?utf-8?B?TlNFOVVsblNMd3pqSmpTa2RqcW9NYjdGRXEybFhSYk9EL2laWXdiK3ZwSFRN?=
 =?utf-8?B?QnZYV3RsaVN0RDlTQ09vTENJRVhhMVp1QmdTNE1hZGZYc2hRSlNzT2ltd3Rs?=
 =?utf-8?B?OEkzOFhnR1JocXc1OTlKWEhzZ3o3Njg5MmU4WSt6MXBrNDZJWGFsblZzWk5p?=
 =?utf-8?B?OE00Wm9MZ0dHTmpiNFdLZXNHeTBoWEhQaGtRSGNRdTRRRmFabmtud2Jzc1M2?=
 =?utf-8?B?QWZYbHAxK0t2dlNlY01CaVVjdjRiNzN6bWZqZllseU9vamlzbllCbWpqT1Aw?=
 =?utf-8?B?U0MydnI1R3NTTHQ4SGZKczF3YzJtVFdZb0o4Rkx3Z09TYXFDUzUwaGJkRGZu?=
 =?utf-8?B?elhPZy9TYWZmNUNqQndXV1ZQS2lUdEVNS1ArMGtCamV0Z1daOVV1YjNTTWRF?=
 =?utf-8?B?K3VEbFhPZTZDZm5BTGkzUWlGTzdwZUQveWFTL1ZkS2JWZXo2ZVpaSUoxUHJt?=
 =?utf-8?B?WWVtc2N6SE5uY3Y5aFRJL1ZwbjVNY0dLeGcrQzZydHNHMWExMXQvR205b1JQ?=
 =?utf-8?B?aG1TVHVzKzZoOU5Hd3JZcENLM2M0UFhqcW0xY0xIemRTRzBqVk52QXA5and6?=
 =?utf-8?B?b0hMZEliUG5oQ0wwOUtTRE8zQ2tQWHMzeU5rVHBjWnAvZVNuTThaY2hNU2R1?=
 =?utf-8?B?YkpYQXdxbGRTamxONW9DeXZxdUNFUGM3K0lOQndPcTNXNm1TclN4RjlFb0cr?=
 =?utf-8?B?cjhCOWN1Qjd0T3FYQklmTkFwWGRyQjljUzdRZGVXcGhlVkwxd2VZL3E5MmIv?=
 =?utf-8?B?akV6ak9GeWtnd2hlN1hwRHdUOFU5UVFyeElsT0JTczVMdUZxZGxzWUdXZWl5?=
 =?utf-8?B?S2VYVzNqUUZDQU51QXlpV2VXdUhZZTZqeWhLYm15Wk9SOUNTbTZLbUxudDZ1?=
 =?utf-8?B?ZmxLRGtVU0orU05ianFFQ3ZZeFZqOFhvcEZzL0I4UVNxKzI1RG42amdyYWtL?=
 =?utf-8?B?M0ZHc1NEbitHT2p4SWJNcDlNdFFpM0xGbnM5Mm1nTEdEUCsxM1AzZklXU3Ri?=
 =?utf-8?B?RTBFelVva0RMR1oxREp1eE1wcHc5ZitnTW5wbjBJOHBCSThLZHlaS3Vtcm9t?=
 =?utf-8?B?T0paZmxMd2c5NFNReHEvNzdSRGloK3l0VUhUTzN6YXkwdUJDS2RIVjRDVG1k?=
 =?utf-8?B?ME1XWDVlWmMzQmdvUS85cy9ZUVBnWnppczQ5alVCNWc1b25oZ0NqUlFuZEJZ?=
 =?utf-8?B?eE1FL2Zvc0dLV093OGhMVlVuMHE4MkRaZVo4VHNxdFBqbklVbGFBWXJWUXF3?=
 =?utf-8?B?UlBMSEkxWFZHTmlqLzdPR3ZRZEtsbTNpSXo0WG1TMVpGODFNNHl6SGN1WGpk?=
 =?utf-8?B?ZmZ0bW00VmFucDBiaDZDblpFbS9OZndiWXJWVlp2enRYTUNqdktWVkJPejJw?=
 =?utf-8?B?UnJ0NlFRMTdyUnRQOVVBRU9lM1RUL2RrR0lHNS9FNkNOZnhjcVRFZ0ZJdDNx?=
 =?utf-8?B?SFphL0VRYXBWSTJZaFdGN2xDQWNTVzVOeE1Dc0w3UmlrVHJsU2VUMDVKdzB1?=
 =?utf-8?B?cG0ra01oMGJ1UVArdGdxME8xdEM0bUVReW43Q21LRThML3lXNkFhZDZtWGUv?=
 =?utf-8?Q?29ZJupLK3YCcjiAdO6ggPpw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c824d4a-4565-484d-ffe9-08dbba6f1740
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 06:50:49.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ncf6YpdCyxs6ewWnXzluJ/9XVTMtmhEi62WEFKYbm9w1fOhTEVHQx5aIALjqo6Ntwb6P+duRieU6IkIZ/fNMZZAkjpCV/6iFHtuwGZEn0ySxvNy8jpum4rW8STmSghTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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

On 08.09.2023 15:49, Gustavo Sousa wrote:
> In Xe initialization path, the function intel_init_display_hooks() is
> being called twice, which is redundant. To remove redundancy, let's
> remove one of the calls.
> 
> That function sets up hooks that are called from: (i) later in the
> initialization path (i.e. intel_display_driver_probe_nogem()), (ii)
> resume, or (iii) mode set commits.
> 
> In both call sites, none of the scenarios above are reached yet, so it
> would be safe to remove the redundant call from either of the two.
> However, since intel_display_driver_early_probe() is shared by both i915
> and Xe, prefer to remove the call done from xe_display_init_nommio().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/xe/xe_display.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index a453946ad108..5823e3f2de1c 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -159,8 +159,6 @@ int xe_display_init_nommio(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	intel_init_display_hooks(xe);
> -
>  	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
>  }
>  
> -- 
> 2.41.0
> 
