Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF9C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 07:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C40710E594;
	Thu,  8 Jun 2023 07:52:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2886A10E594
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686210739; x=1717746739;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eAFXkXzumfHt7fVWFMTLG4aHiyMjLUZL1OWPw9kVcw8=;
 b=cdrzlE0kYUsfKJYIKg49vrAZDUao/oIe8wbDDXIZaamnrZnuAkNhQ1hx
 2W9SQ5k8NKDKd00IqzAMmZwGXjO3BntXZovg9wzXDiCC6Py0YL8ALtt8f
 67nCOeymHxklYsFIo1tUHro5RCxyntX8XJMe9hT/SiIZGiNbFAjVcX3I4
 ZCEKVX/EqxSn5haqsAGQl/1sfwTCZ9ON5oRSCJyuJliJDRTtVAB+pScuy
 g737LQ6JhdjVfmfc9y8p2RFzSfDlG/7JdtHDboNon+slOEOwgfaIJbvHU
 ikDRA0byDlseRrDER/2tz9phaZBOEnU/mm0i2TvAd6EWTQDaTfkMhqCiK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443607868"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="443607868"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 00:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="834084066"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="834084066"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Jun 2023 00:52:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 00:52:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 00:52:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 00:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J72PN/PkVEkV0SPz6ycYV6aeF4kfAdsLoFjKxSdEZiLm0cpMr7CKamXfpcBUMlbtC4CNy6rl5wrOlgnb1DzZ7LwitbGVfCRyRjLTxTQr/L7yaCrpf9hZgN2EQEKgWKZFOc3vI2NbTRsZECn8KdLLOZl7fy4F3aazq+HDJ49JkMF/8DdJxHkZtc4khDAtZ19GHPwOQ8kFxg/VbKQSa247BXJ2rtkTIMJwC/9JFRBq5ZxOdByYE9mBt7QAlbKWJwStESbIG8vVJr+GPYUSLuJ3l0+CdrjqCDwcDcE7f/9YWOM57hDITVd0TrbgFldxxtNL4lr8d5t5fHHtkirykuFF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWCaGPk4HQRfO7jm1gCEJo6N+lypPO9DDOyss6MxghA=;
 b=IhyZp+B3trTdq1Qbr3TQvNaQoVGzjREl4atiELh5Mc6lUQYYIju8NJ9ZS68RffIgTnR3bRYjKBM4agacVZuaplOe58tEYaCgE0h9/19xaVWQm2o0jGkeQqM0RdOS0ZIjOX7UrqAT/6562Suho//intIxJti3jmMt5h3xA+kkQaBgz892dKR/zB4LxUmocQ+fRuhYmMUMTMt0711tPJOH8mVPcEww+ufIv/F84gOSaThlXCnQ7/o2c18zFCx6OdRGPehHvPnki/HqIB969Mi/barczf4f9RI2U3jGOTKNcIst7dmWjFCHpocaMwx/pMPGD3VdIVLYJBzV9wdWhFXR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 07:51:56 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 07:51:55 +0000
Message-ID: <2d2d7a8c-8251-b968-0317-4baa133af302@intel.com>
Date: Thu, 8 Jun 2023 13:21:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
 <20230608074544.2186318-3-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230608074544.2186318-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 571999cd-c5b7-49e0-67a8-08db67f53aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5hVCGth71xXYyTnKHUZv+HqvQzqH0IgsLWnyhEyqv94OCdX9vPdTQdEdGSv5jW6GZIesvl7gR7jz92gfP8iCHHTZmvZgIPiZz9xS0jhlduwDnZZZPqvvbSPOBAYHgwHpRS3IaxlFdnSVGho78ByoixZaECczR5WXq76nUX3JIUZgziOwED1zFpI8BXmbV/1uVv49Q7/JZs/5AoWy+A7Zy1vPGsb4bgatcv+bEVp1gx/FAkWFIThvIU0qj9i93GqWCB6zlSu0qRkBNYx50bgWztwuQYkfd0Orwhx66TfvGEvn3voH1yeiv5gQCHoi+pWfS0Pd20hzIByQU5TC4PuHD1YmEn+VPO54tGm6AmlAjwQpILs0c0peIkDyTc3UM35HlFN+bus9bj2d34vl+cSFGYpVKVTkfezHSYCzkEMSatzz7VCc/qaqNR44A+neu9bA+TV9+h5TdTqANWxkBv589GE/IW/Sc23HGuns+NX05NaF5BgIruUpQIRwQtaf9+ydrGV0dC3RrChIqVcmNiIzud9tJlrmr79yLGyBcncTzy8L1WnxqvfWKL27uKXb7rTyD3IwOeTFDaQvp+dERW56U/gLRDv1eemuytriyvwZ1CuXEFJ5xxBz4VaXiE7XDzCqByfliFthF3iflyI4DtZPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(36756003)(5660300002)(2906002)(31696002)(86362001)(31686004)(6666004)(6486002)(83380400001)(53546011)(6512007)(26005)(6506007)(82960400001)(316002)(478600001)(66946007)(38100700002)(41300700001)(2616005)(186003)(66556008)(66476007)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzU2SEhFNHgvR0xFdzJuRS95YTVyb3RPVVgyZGJwZjl3eWl4SGVma2lQSmQ1?=
 =?utf-8?B?NXYvT1JIN2dUaTRrKzFWcjJ3amZ4YnN0aGY0djM5TnQvY1FjdkErVXdyU1g3?=
 =?utf-8?B?NWFycmtnekx4eGc5cjRFNzFMVXV0S09EOUVOQWZ4NERjU3dOZHQ4a0dJVGM1?=
 =?utf-8?B?MnlTRmhEZUF5aFptSitmWDJQbXR1Q3AzRkdvZE1rVzcxYVk1Vndzd2FEMnlp?=
 =?utf-8?B?L3BwVXN2RSt3RGovZEZjc0tBTEpHZjJuaHk1RmdwTTN4UlB5cG1uTVFSUFYy?=
 =?utf-8?B?YUZvaC9WWlFjcUVzUWN2eDEyZkNxci8zcHcvMXI2bzZGREZpSXB3T2NpZDB0?=
 =?utf-8?B?RGY3bWVoTUxTM1ovZ0w2NWY2ejJGd0NOcS9ZeWxVSXd2bnlOVy9mMlRjTFN6?=
 =?utf-8?B?Q0JnUmQ0S0ExcWVRZ01UbzlTRGQxRFJPS1RMUnZ0UitrbDZiS2VURzZXNE12?=
 =?utf-8?B?bUw4ZkQyUS8yUm1uTktHVW5DRUZXMkpJWkxOUGNNS05BaHJGWXU2RGdXaDBh?=
 =?utf-8?B?SXJNOTlha3BMcFJvNExPWDZDc2RDOEF4dkNYTnlCeGJiQW5DRVA4UGd2a2pu?=
 =?utf-8?B?MWxjR2N4eUV2azVhWnVaNjNpVk9vOEpTaktVOVllanJaS2R0elNRZjRmM2dH?=
 =?utf-8?B?S0ozZHRBMmp6OFVsaDZZKzFjSnlVUHMwcEVnMXFkVVJXbmM2NVphNlhhR1Vr?=
 =?utf-8?B?VVRRNytnRENrc20zMmVPV3NLdktnNWZCTFNWTFlXZlJJcjJPWGdlRUpSUkRC?=
 =?utf-8?B?Y0RKcEJ5VEhMbkUraTYyLzFwcnBycnZDMmhXT05rTHRZNVFPN0RjVXNGZ3kr?=
 =?utf-8?B?dVNZN05sRTJob2s2ZnZqMFZNSllySkYyVVllZ05yMmlIaUIzcTlNZWZzREgv?=
 =?utf-8?B?ZkpFQ1J0bnNmUXBVd0dFTUo3aUFPclBHVFh3dm0wSHZlb0gxZUxWVEhqZUVr?=
 =?utf-8?B?dElCc2tYek84c2hZa2I3ODV5OTRwcUJDV3FWMlh3U25yb0hOSXljQ21nNlBV?=
 =?utf-8?B?RDlycnlKWkRBazFsMzZWenRSNUw4U3hvajZtOURFdXRrS3o3ODJZb1M1dEZk?=
 =?utf-8?B?U0VVbHJRVFFHN252bGdkL1hFemYzZEZVU3JrVzNXYkw1eGZ1QUxrZXBZeHcw?=
 =?utf-8?B?VGI2b2lrQnZnVnN3d1JTcVRobE83QmdWanFhNzRNMHYyNXZ1REo3RGJaSS9i?=
 =?utf-8?B?UE1MM0VOYStGVlg3aUZPakxBM3dveWpJZnNvRjU5eGFraExBeUNIWlc2RStD?=
 =?utf-8?B?UmNHUTlWc2FhVFFqYTA0QVNkUEdIUnVnZ2hPMk92TDh1T1U2TmVWR0xvUmIv?=
 =?utf-8?B?Sk0wVU85aE9yNm1NcDlvRjBubGhXaDdva1R2eTNHQmNsaFhUY0NqUzA4WW5H?=
 =?utf-8?B?bWNLV1FHRkQ4c1JMdVcxam56VzRJdGVqcjhhbGtqMmxSaHFsMDlWNlI3ZG1k?=
 =?utf-8?B?cVdOekE2anNUM1grWkJJZFFPQ0xNZmw4S1h3WHZsVTRWNFRyWDVrNFhQZENh?=
 =?utf-8?B?U1YvdDdFNGJ5am50NmNZOWlLZ1NRVGUyYTZDcWtwN0MrdUtLN2puY1QvdnVz?=
 =?utf-8?B?UFhYRXVJZ1I3Y1YxMVBncHZlcnp5NFFzMUtwYjlkZ2svbTk4a0J2eGR6S2xi?=
 =?utf-8?B?dGl2TmxwWllUS0t3UlE0enJYK2FnOHp1U3F6VnR2ZVJuWXlXTklrVjJqWVY1?=
 =?utf-8?B?eG9xbTdOemZJQ1hJdEVVSmJlWEYwZTlReDhwMTROUk04RXZPRUFHa3JiQ3Fn?=
 =?utf-8?B?OS9oRjlGY0hqeERFM1Z2TTlUYURaaUNnNVIvd1pGMEFzeE1mMGg3SmttUUxu?=
 =?utf-8?B?TGZFb1VWMG5NU3ZHbFhXNzBNQm1iN3dQQ1pnbXJnYXF5dWh6cEVoRmF2Zm01?=
 =?utf-8?B?SDdQTzZobWUreU1LOHJhNjV4ZHBNZEY3Ym91L29rZlJCdm5ZSlVIdXlzTzFj?=
 =?utf-8?B?aE5SRE81QjRQamZUSmtzS0VEWXVuaXJuUVRYRXFhNTZWdVF6NFpwZ1IwcEI0?=
 =?utf-8?B?SHZlYnhWajZ0Q25YQ0d6QWI4eVVJWkN6bFdicFB3YUIvU1NVS2dBYk5CbjhQ?=
 =?utf-8?B?YzhsRnZFLytFNUNMOUVzQzVjL1JkV2VONUJnUjNDMVllemU3cjhGMnBYdUxF?=
 =?utf-8?B?SWI3RDF4YnVmK3pBRlI3YU9ZbExmNU9QTmhXWmFJc0xkOFhwdXhxU3pHM2Vy?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 571999cd-c5b7-49e0-67a8-08db67f53aba
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 07:51:55.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pTh441IDIUuCnmN+JwgfAYrWfxv5C2/L1TTcVlstCNOjPioIe6t5IdON57oEE6DavGYUOR+HP0c+jJgBIEbPubBddpyezOUKtaqK/ma3GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe: Add GTs under respective tile
 sysfs
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



On 08-06-2023 13:15, Tejas Upadhyay wrote:
> With the separation of xe_tile and xe_gt, We now consider
> a PCI device (xe_device) to contain one or more tiles (struct xe_tile).
> Each tile will contain one or two GTs (struct xe_gt).

better reword to one or more, as we do not know in future we might have
more than 2.

> So lets align sysfs paths accordingly.
> 
> TODO: Currently we have gt0 under tile0 and gt1 under tile1
> on multi-tile. This GT indexing still under discussion, when
> it is concluded we need to revisit this change.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c01cc689058c..13570987a756 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -31,7 +31,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>  
>  int xe_gt_sysfs_init(struct xe_gt *gt)
>  {
> -	struct device *dev = gt_to_xe(gt)->drm.dev;
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	struct kobj_gt *kg;
>  	int err;
>  
> @@ -42,7 +42,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>  	kg->gt = gt;
>  
> -	err = kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
> +	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
>  	if (err) {
>  		kobject_put(&kg->base);
>  		return err;

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
