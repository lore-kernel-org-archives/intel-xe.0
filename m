Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BE9CDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 20:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C6A10E034;
	Fri, 13 Oct 2023 20:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE45110E034
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697228174; x=1728764174;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=edVwgJNKAzBDNv3qsJ/9Q5L+J+CAfOJu8nRstbHFczw=;
 b=FyKRhP3CP6LgOWUcMyOkQOMYLTZP/NtZup4iFVUNSmgGJQiKCiv4+Ddm
 bqd7TxTWWQlCN9njwf689H0X2zYqYBUhmP0ggehiYxIKf8Ubm80F5rvOE
 GkH6QaCHKlO3SNyriwLHJ102I3ftXHlhOojOU31ZGJ2vTWIfIHb2RgKUU
 D2zzjZlxdp9PiVtS/ZvzXApX8SRkLnK0kEpnXIdbkAkkLeS/0GqlovD0O
 CpIL7CJZzdcmq8TD0RNLqTRK0zyKVpXEDaoPuks4pbQZgMFNudbY7EmkO
 lqye/LkSlnHjTro1Uz5/J/PNc7jNvjgw6I5XXpSQlXzZkmxgVcaPkYVT+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471485856"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="471485856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 13:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704778532"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="704778532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 13:16:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:16:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 13:16:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 13:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqdlL70Mlkzt3drQPmlMcED31ciQGAg7l0JZxsycq+jHqWWLm1WcB7P0YkVEAyjtDulJqNSU7WLKZfN7wwW1pZ5mNBESmG9Xf5w+Ra23cP4C/kzMHvoEHO9m9kEwQvRI/LJXC6QUY/gZYgQMrOfUYpXpVsyQf87tfeIBSrCiiK2GK85iwCartQvtZkpNhqmNfhEtesOfBdx520YFyTix3YA1W6mRV5vNLe4V0iAUTgn54xlfk/1QQZ8XV73xhA2tzaz+nrE/jM9u37aQDrCCwvyFvxnu2rQD6ekZ8JdoroRze5gl4vhSRQZbyGWgCP1vf3mHuBjv/2acw5yxAR9ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzp9/jFTfQoc8rTw9bpeKPcOlHtd53zzNTy6bqd/9Bs=;
 b=DMIu1cZbKf8M/Z/kSkbjKJaR0w+IxUqYAGeF4dqvAeu7QyG1cb4ZalFXdOFqp7WO4v6FRXucZrm+PNoH1AjAyxxUgpVYiSDXe25/wwagMTdKKUXK9ijX0hgsdPaRYV6HFKzI1cvZEpyb/4wyra7AwxJrh1GpbTLaS3/GyvpBeKXv3GK9NcK3yVg62KGL2wgh25N7nceg1jsIbiOUY90cnmCeBzBPAm0NRMxK18A0nXx0EIlaryOckHzv2Qfhk4Sgzdv/wFkTLNfpd23RSta/sbm4o3rISEed7RZhq6xj2SmTEWIerx4JmP9re2W4lIsa9sHo83GqQ4LFZdwob+oIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Fri, 13 Oct 2023 20:16:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 20:16:07 +0000
Date: Fri, 13 Oct 2023 16:16:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZSmlgS88PD4QI+k8@intel.com>
References: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:180::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM8PR11MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df132e3-f740-4c11-dbc6-08dbcc293b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXlwisVRlb/qzwWfihM2Ik4t7Nsw11AHPNXAOnbKddq9X4ci5kE2ckGAUFoIMQJW7O9LCY1UeOnAWrZD5U9qxAcX++CVAhSjG2Whm51ftMReCo7vQI4AunXA0QUpx14ncZjwF6fqKVdpHwTDaK97UGwkZhNimCeH4t9IxWmWx7cqa25VRKHEJut/d3MIsXf4QGkaClZW5y45dUhpliqh/NdlADBqO+06nGD0XO0Q/foKaLOQZH532A8sn7VWEjljuFa1CvD/CIWgMNSxlh57/z9oH3jlS+DDXr7AA6EbqiwTRLJQd1KW3nuuTTbP7nvBcUMk28dBHLMp+MRrz93mKb6ed/MJ4Bpj+zNYk7B5SE7Aib1cYpPvKLTITETvx5jOhOezB5NW/lpawxioXJP9jFX61AwhAvMybLzEYfZjCJZNDnJpCBJfYriyvY6or6NxLFtqvTkLAGj2EepSwlfE4LMfDjNMePd4ujV89IisdIlO1lbkbNOpEyYKjz+QU/TazfNfeX8Ts4OcLX6YsPPyfvvEvhhtXUPf59QBTEudkLOkQf2H4+4fWtrEp0epuOSvf+yVfN/86G51ncz0PfgJ7Cs/ab+truTaU+b7v8j6SUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(6666004)(6506007)(6486002)(478600001)(36756003)(86362001)(82960400001)(38100700002)(2906002)(66574015)(83380400001)(26005)(2616005)(54906003)(5660300002)(66946007)(6916009)(4326008)(8676002)(41300700001)(8936002)(44832011)(66556008)(316002)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjNML1ZOQkhIeWVpai80V21KQldENHZLeXY4Y25Idk93N1F4TTRZbTdhaFZi?=
 =?utf-8?B?OEVFREllbncwa2tKWGFwcEtBMVMzZXBhS28zMU1lOEgycDZxaVFPQ3RoNElH?=
 =?utf-8?B?UXBsVkgwM20vWnIvTkxZRmFwNVdlVEpsSTRobnFVem5kVjFibUlkdWRlelBs?=
 =?utf-8?B?OVB6MzNqTFJRa3UrcGJBL0VGaURpbWdGNDZ2RU8wOXlsZWNwYytqaHJabE1C?=
 =?utf-8?B?Nm10bDJHSDZBMFVmZnd2WVJvNDh6cXBidEc4TGxkM2VoRW5iYTdqa3owd3VF?=
 =?utf-8?B?RGdXV1dnb3grcG0zK2V3ZzhsRlZ1ckg5bFlhOHMxcndQRFVYMW8ySXFudjZn?=
 =?utf-8?B?NFVvQVFvZW5HeS9qYnVCUFQ0ZDlNNGN2c0FmU2c2TC84alR2YlUySDR6Zmwy?=
 =?utf-8?B?VU03S1VhNEVBWnRQU1M1NUNRbzIwNGhFdkovRFo2SDRGTmtCbnpSNXQ4VEVR?=
 =?utf-8?B?SDlIejFuSEVONVR6azNFc013aWlOMkxzcjczUlUyQStGeC9sSitaTittODdp?=
 =?utf-8?B?MzFxWW9sSG8xZFhVYi83VysxUGJpSmhqaHhUKzhtSGtvSE5HZTZpK094NEtR?=
 =?utf-8?B?M2MwbXJaNy9IOGtmbGhsaFM1OHhuWDcrU3IyOXhJc3FNak1mOWY4MFhEUFpP?=
 =?utf-8?B?VDltV3g4dGlWOHhGREhObVg2RGVMdmwydm9PU2I0Rk5aWVpvaWMrS3lSa1ZT?=
 =?utf-8?B?czdvd3pJKzVMOFVwWmRnMkNIcVp6ZU84Mk1nODN3ZlFWRm01VndSYVNWcDFK?=
 =?utf-8?B?dWI5MHY4RVN1VGt1SHNzWkZaVFRkR0tPQjJOSmRSVlJzWFo1Ukx2NkRiYWEw?=
 =?utf-8?B?MHllcmtpU21kRGwvcGxnaDZLQSs5VGtlZ0Y3cmtTaDRKOWliVWdNZHZlUUt0?=
 =?utf-8?B?Vm1DY2Ryb0ZBd0ZSazh5UFRVd2JTdVlkWWRiWkRzRE9TaUw1eEtSSm9GdFE1?=
 =?utf-8?B?bDk1TU00enlyZ2dQckhkTTBQdnVCbER2K3hkN2pUNWNLT1RKSkRqYUxXeEhU?=
 =?utf-8?B?ZUdxekJKMmZWSlE4NFhSbXNHdkNlUEFaZEZ5ekk2bDhmNUdpUjJaVURwUmM5?=
 =?utf-8?B?VlR4dm1yUGFUNWNMY2FYYWpja1YvWmlnbmxVZURJSGRaWjNZK0F2aDgrYUhj?=
 =?utf-8?B?aEg0NFhGWm1hNmx0VmFPUEkxYU1Cb09mZ25xdnUzTVFOeCtIbk0yNmRnTGw0?=
 =?utf-8?B?TzRJSDIxMHZEQ3JYcG4vWjNyVU11akhzd1BsQmNPcjR1aFdVNnJtK1BGWCtm?=
 =?utf-8?B?SFVKTFFIWm95em50Q1JFd1lyNnRVL09HdVF3RDc2cjlLaHM0Y2NiT1pGNzRT?=
 =?utf-8?B?cGFtRzhSVitMQ1ZBd3ZGd0NPdFA3TWM3amNsR1dPL3o4VjBLZjJ1WU5GRmJZ?=
 =?utf-8?B?T1JpWVBSU2dJaDlSMkZmWnVjdVcxVE1wQXRQemdpaVZqT3lBZTdxZWZRL2Vz?=
 =?utf-8?B?ZTVURmFBc01VWjcrc1BhUkJ5KzdVK3hDQ1N0NmlJYUY4cDNMREs4TVQ2dEpV?=
 =?utf-8?B?NmVvYTVCcnlpcis2eUlYbGlUSlZVdTNMY1p3bmgxSG5QamUvRjlvTVc0NEZw?=
 =?utf-8?B?Q3pSdTc4T3dTYlBNRnBJQzRaWlhwVVlSc0xUN3VzYVZSeU1KbWVTSlc5NWQ1?=
 =?utf-8?B?VnNlNXFaYjRjNk5QNkVwb3JMbWVHbWU1b3FpMzE3UTZJWkpYOWhCYkFNcWVT?=
 =?utf-8?B?NTV5d0kra3BPRnQxOG82SlZjOHpFU051S1FVQ0FRa2haVElGSW0xOVFZNC81?=
 =?utf-8?B?TmhPbWlhWG1TMU4yK01iR2pXNGMvb0t6ZlRRVnlFWVY4eFppUEZIbS9rVEty?=
 =?utf-8?B?K2NDeEtaY3dZdW0rcjRzUTdISVl0b2k1T0ptZUhIbHZaY2VldkQrdWgrR0Vk?=
 =?utf-8?B?ZXpUZWs4Y0pMZWIvaTRGRXdpK1FyTXNLWkdrd0tqOE9CV0NjKzJEcllxUExK?=
 =?utf-8?B?OHRiSGZwV01qZ08rS0xKVjlBS1V4MVZId2g4TFh2dG5lQjhMRTBLZFdaU1d4?=
 =?utf-8?B?QU45WGZSUnhRc1l5ZWY0R1YrZUJ0OFpObXgvbzE0N0hjOGRmQTBJMGtxRG1E?=
 =?utf-8?B?Q0JuNm1KT2xQaHd4a1J3TWt1d0ZkajFuQ3Jjb2dqNlgzY2VydG92NlBDSnZ2?=
 =?utf-8?B?ZVdGOVA3TmhSN09TVUEwL3l0WWlwY0dDUEd6SWh3ekFvZWd0ejBMVlE3ekVs?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df132e3-f740-4c11-dbc6-08dbcc293b00
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:16:06.4224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2rE8Csmm7jeC+dRNoRSY8kp3+yjptHayZU1idc8KmQbasc4wjHixDnO8VKBbbSsySte6qDxZwHPzpjFB54RWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5592
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/uAPi: Clarify the meaning of
 min_page_size and MIN_ALIGNMENT
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 12:22:26PM +0200, Thomas Hellström wrote:
> In particular, don't *enforce* alignment of buffer object sizes to
> MIN_ALIGNMENT, as enforcing that for imported dma-bufs would not
> really make sense.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d48d8e3c898c..5895c95879d1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -167,11 +167,10 @@ struct drm_xe_query_mem_region {
>  	 *
>  	 * When the kernel allocates memory for this region, the
>  	 * underlying pages will be at least @min_page_size in size.
> -	 *
> -	 * Important note: When userspace allocates a GTT address which
> -	 * can point to memory allocated from this region, it must also
> -	 * respect this minimum alignment. This is enforced by the
> -	 * kernel.

This old statement seems bold on the kernel is enforcing it. If we are
but intend to not enforce anymore we should also change the code in
the same patch, no?!
Also by the commit message I had the impression that this was removing
the enforcement, and not just the documentation about it.

> +	 * Buffer objects with an allowable placement in this region may
> +	 * be created with a smaller size, but for increased performance,
> +	 * user-space drivers should align sizes of such buffer objects
> +	 * to this value whenever possible.
>  	 */
>  	__u32 min_page_size;
>  	/**
> @@ -252,6 +251,14 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define XE_QUERY_CONFIG_FLAGS			1
>  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> +/*
> + * XE_QUERY_CONFIG_MIN_ALIGNMENT - GPU VM bind address - and size alignment.
> + * GPU virtual address mappings of buffer objects must have their VM addr and
> + * range aligned to this value, with the exception of buffer objects with
> + * allowable placement in system memory only. If this alignment results in
> + * a mapping beyond the end of the buffer object, accesses beyond the
> + * end of the buffer object have undefined reslut.

s/reslut/result.

Should we make this into a kernel doc?

> + */
>  #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
> -- 
> 2.41.0
> 
