Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C48C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 08:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBC110E1CD;
	Fri, 19 Jan 2024 08:25:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F31810E1CD
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705652735; x=1737188735;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UMKaD3pk/Jr6o+G93Al3cafoILgU+8mnHUFrQk0iv6Q=;
 b=Ve/lAEr6v84FMh8Kk7OQ8FFTpaYdVKp266g+YKFsImnmpKo4/9TSgW28
 IMDGMI54NBfGt/Hy3m/SZWnNkciM8pOPwG9WHBHVkkmP0UfQhjTHzAUgK
 j1QXHKRUrY3gtWkHgO1f2XMWVUV7FJzI1PXafGWxxH8i1i32R5qYgZ2wA
 QEUMJhp+FxUGSLT5DyqAKit8w0o0gEE9dU2xYJ2VZ9nouvKxTTg+41Zz1
 n4qpFRqW1zWDUJ9+HYaG0jPrJnle2Mx8PTerSxhO122xXySQas7zg0xKs
 BOQFRkX76vW+V/VBSOmsPacJAhuLabYi4q0MpY+ubyx83XFi7aRkYNdkb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7395694"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7395694"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 00:25:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031893891"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1031893891"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 00:25:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 00:25:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 00:25:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 00:25:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 00:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwhdPhdDzqGUESU+ZV469ieyXUlMec7Q8SIIHe/3MdhK0hUIfu9bxCgS/L8IJhwv0RoB4mhzKG98T58jPJ+zxDmXx50OE4hmlRJmvn1uJMuJC0sc+LGf1NuArSa51ER8etEOxCqTXI+F1ujILcmNP3ZIdxU+Rvygv6B8MSXhnF214CoNFOx/okev09s++QmQPSlHCTE/1fdkVB9Hb13+cRa7GROuq8AS9uyaHsywPtYwEA6NZRu9SS8FYrNTWUNu2bH0MO9DcQ9vj9UgeAA63l8+HFfN3jrnt6PRYxrqOC8gGNACeFWDlTT23O8kmBoBC5JDiNeFCQ1kF2vaMT1Btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57YiTZ6VrJa8m3pR/i6Anic+El/SimEBn83dqg8Dltg=;
 b=imBPpFlnPecAogPeyheVxV6bnIIvs/zan2sphahW/ROqy6zNrfTUtjwimvwAFCLeicyvEBLAQhBNBj1qF9Q9ulILVWNODl1dC6il+Z6zuG3UZjqG4lLGhlgX7URTlYA7YMLX+z+6twVnFQKpco1MFoK324JrupqV3obI+5rZA63zIN8YFLMy7JkRl8k5aQXKrK3mu+4fcx4VU/LtQ6Qfpi6bXgRBZ9tPLwMWYzYk5DHfj+rPe7osbIOo41oRO/gv3iePXSH3Y6cLs6td23av2+eGISLcUgXg4ELAyRKGnvZ3fNtkSPJcFAcep/CtxhocetmMfGKdyBdPJE2vfsbiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 08:25:24 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 08:25:24 +0000
Message-ID: <4dd696da-90ef-4612-93de-e812d0a8336e@intel.com>
Date: Fri, 19 Jan 2024 13:55:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: <intel-xe@lists.freedesktop.org>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
In-Reply-To: <20240119081852.1858212-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: c0173d5b-adaf-46c0-52b9-08dc18c82f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eu/Xo+t4PnETnIoLwTn2FqRQbKL1Lg5tBm7STlNIl7m0HSOxXSoRP1LCY7qigQ2Gnv1qiGS32rPSNwAT6Z0WitoHUOCCajrHwB8K23ggaDTt06GlCSg5W4HTMTV873Cfmar+9PmVQAbpQz368pGRQXDJpVVF2r9ZhZ1GNDTuUflqSia0EoHc/z/4yVM9HgJ+3LnMElN4Zx3J++xagPBB+OGnoVpdfvDlb9eHqkqhZ3gx38Obgo0gmC3oAQRIO+XQQ2fSkFwFEdhRRXyaKW2WhyJhju58M8AA5ljzHNC+zUN7bO+L/RJzST164k5IbD0GUR8+mvlLWOHfG4OOEOhagF38iVMZWtJK92aXgCZds1syz9Z1joooQ/JdzujgqyPEq10PgfXGPeA1Ztlz8CdV37kr8VrPWMFNOxPljKBRkKukc5LTv2xMVwHtUuFhyStCoeBsdaFYFQuKHZqtBwpYXDZgS15n2ky5ZBljjyKXRIadKFnzOf0YGWaEErRM3+heSQVq3y+WQiPJH49rfr/3TBXAqHdzuBHlIUsNDsOd4hCvx8yaoUBF0aX8NcJzdcFWvgWC9ip7LYkx5FZ3/Kjy91KFuyS75uof4SovPjdiDlsT/cCICPzW+0eGxjDbGjs6JqRmXzsVi/DzlVmSljNclQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(5660300002)(41300700001)(6486002)(38100700002)(82960400001)(26005)(2616005)(31686004)(53546011)(6666004)(6506007)(478600001)(107886003)(31696002)(6512007)(8676002)(86362001)(8936002)(4326008)(6916009)(66946007)(66476007)(66556008)(316002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDN5RDdKYzFYSHhIZm5mbXlOMThiOHRreklHWEZ6a3ZiK25IRnRJNnR1Y2xk?=
 =?utf-8?B?QmVKT0hMaE94ZGVYWElISzNmZStTUUdEZ3BwYkNDYVVPVW54TjVEdFFxZXpM?=
 =?utf-8?B?MFdZZnlqeUJnbWdZSFJva1dod2Q4VEtabjZsRDk2a21aYlBOVHFZdWNwNDVi?=
 =?utf-8?B?bEhuL21yUVV6VFUvOVd0eHkyQU9uVmJYY3hmTTc5dm9Zczd2MjVuYlVweWU1?=
 =?utf-8?B?eWhUU2NkelE2VHpMMndwSlY5OFR1bmlMSm15ajBPdTNlT1h4b2xzU0Z4Qk1H?=
 =?utf-8?B?MG5yQjE2WFJuQTJhdnMrZ0VZUXg3UE03ODFMV3hVdmRGaHFBVXhnZUtnMGln?=
 =?utf-8?B?dGMvVldZbUNjNTN2WlI5dktTOUZwRDhaK2lZSjN3SmgrZHU1RGc2NWw4aXZt?=
 =?utf-8?B?eERCRm5ZMWJ6SnpqNTJsUlRtUytkZTlDZEE1UmM5N0UrU0FEdnAzcDI3WTlY?=
 =?utf-8?B?MnFJZENuRCs5NGhrNDVkbUpiQ2NId0o3K3ZQM3RDSW5GbHd1M1VWNVNVZzE4?=
 =?utf-8?B?ZnBnV0cvZXQ0SEtTMEVMMnR5TllvZFQ3dnBrMjM5RFlINGthLzNUcVg1M0pQ?=
 =?utf-8?B?RlJPYmVRS3F3ZzlkREpNSUtZRUxrMjY5cTBhRXdhRE1xc05PRVczcnRWMlA3?=
 =?utf-8?B?ZXNsemFPd21WcDZHbkVIanBQS0s0QTRTeE1SYkVKWG5tNmQrd2dYVlZocVhY?=
 =?utf-8?B?Tm1DK1d6SW1qcGNIOUZ5aXRSc3VDdkpkZnAyOXl4VGFmV2daRUJDV1loR3V2?=
 =?utf-8?B?NGFIOEdLSEZtSVExSmN4ZUpHbUZ1SFcwbzRscktsYUhpSU8rTUs1TzFaeW1X?=
 =?utf-8?B?QTArUktsTG8yTW5ZNmhWTmg0YUZLdk5yWVp5dlhwNDF3WGh3SHBuWk8zdjRY?=
 =?utf-8?B?cUdOdUhoV1cvZFJVUlpwQzVHNG9BendCV0RRTEF0Z09WbUI1SSt2bUFDR0hx?=
 =?utf-8?B?RWhaZTNlSm1Bd2JRejIvUG5yNGNyZWV2WlpMcGhvMTFNZ0lycUc5U3VwOVlY?=
 =?utf-8?B?RzUxcmRyVzU4eGg3UVdNRXlwZzZWbkVUR0RyL01TZ080Qkw4WlFIUFFtUU1a?=
 =?utf-8?B?Y3ZqWEFjNVZIcDJEOFpaeXVTMGFUeElzZE1vY21zTTVjWW9mdDlLb3E1VHB5?=
 =?utf-8?B?V3I1ejJwQndmR3d0aTlmdVhyTEhvN29vZHpGbGN1Z0t1MzNGSENqK3F3OHdZ?=
 =?utf-8?B?ekljL1YxSEt1bVU2eWUvNzlkbFQrTTRpRitFUm0rRUoxYnR0dXVEQTk4R0lE?=
 =?utf-8?B?WmZHRzhTMDZPbVZrbERwcG01Z3JjYlhwZVY4MXUrdE9UVHlNaldmMGdvN0kx?=
 =?utf-8?B?M0pDei9vbjNQVndSa1lMKzhJU0x2M0ZCbmJ3aml4eHpqbmpoZHlKazN4RXUv?=
 =?utf-8?B?Vnh1cHVhYVQ3ZTFacmllWTBOTzVWUjdqZjluQWhGTmg4UDdPaFpHK1lOWU91?=
 =?utf-8?B?K0hFTVU0OHJ2QzlDYU5OODh2YnE4QkNHRWlNRWtUL0I4Uy9peG44Uzg1Kzhl?=
 =?utf-8?B?bG90dXRIczY3Q1U1THp1MEo5RGJDcWU1TEwybW9QSDMvMS9yM0QwU0dva0xq?=
 =?utf-8?B?OW4vck8rTW5YR3VKcE9LcHNLWXJ4RGRmcTVaVTIvWlZYVzc5OEZiekRSdzZI?=
 =?utf-8?B?UGVlNFZCeitadEEvVkVFQjcwQ3NjK1I1bnBLQThhOWttcE9DSncwMDFVNWpl?=
 =?utf-8?B?S05TdnBlN1hFamRwaGJqejNTT0tBMHZoWWMvcEFFdUpUakpYUkxiWlNWWStB?=
 =?utf-8?B?dXZvWmlyQmJRZDF1bmQ1NngrN2laR05WR0VKbHppR1hLR1hOc1p2V1pSUXBo?=
 =?utf-8?B?K2JaQ3AwQkhkQ2pHUFVCdkNDRWJUUGpjUnZIN3l4V2drMjI0TmF4SElPVVBt?=
 =?utf-8?B?OXZpUFJvRzdBRk5IaFo5Y2RtZXJVZlhzQTlOMHR3SVRPUUhNaHRWZ3JheWFq?=
 =?utf-8?B?WDhvaVlFZ2dCYVhEbHJNcGVKNEVFSGdwS3Y2S0M2NEN1bEs3azhOTmxaNjBx?=
 =?utf-8?B?VVp5cjZZd1Y3SE8rc2xETnBJNTY0cmRrWnhsRm16R0l4ZWFGK3NPUEFpa3A0?=
 =?utf-8?B?Uk5FdDNoYTZCdUM4Z1NDRE9hRnpmRnVnTkhzMVhnbXBZeUxFQWt2R0lLekRk?=
 =?utf-8?B?R1FKZ3BEaEw1QWdwaWtwanRLeFB2d2pKbUZ2Z2RiNXYwRU9NeGI5MzZyQlVY?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0173d5b-adaf-46c0-52b9-08dc18c82f28
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 08:25:24.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0PiawpZaExLL+vlI05Dds3l6I8jIp23dHXm1ASehn273in1+zikUFb9dzhoXzR6Y77D2B43nMDxE0wdVi6gzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
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
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19-01-2024 13:48, Badal Nilawar wrote:
> Expose debugfs entry to check if platform support GuC PC (SLPC) feature.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index c56fd7d59f05..2f474bf0e7c7 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
>   	return to_xe_device(node->minor->dev);
>   }
>   
> +static int is_gucpc_supported(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +
> +	return (int)!xe->info.skip_guc_pc;
Will change this to
return (xe->info.skip_guc_pc ? 0 : 1);

Regards,
Badal
> +}
> +
>   static int info(struct seq_file *m, void *data)
>   {
>   	struct xe_device *xe = node_to_xe(m->private);
> @@ -67,6 +74,7 @@ static int info(struct seq_file *m, void *data)
>   
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
> +	{"is_gucpc_supported", is_gucpc_supported, 0},
>   };
>   
>   static int forcewake_open(struct inode *inode, struct file *file)
