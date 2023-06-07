Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C67C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 09:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7DD10E4A1;
	Wed,  7 Jun 2023 09:40:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A0B10E4A1
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686130826; x=1717666826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xM2dAwFsnly/AUo67kLBXqBZyoTfPZkMHmwHLWSzF+o=;
 b=gkXxluZBJch3bGVri31TIANymQNinO7eFok0ih80t/ZqIDcsreeYFHjj
 GvIEIbkgv2nCD2eUZRa004prUdfyntuj8e7TfScO+TzWfnIsRXj74y/fa
 lN1yM6vdKzicK5IqupShCiJl/bAoz5Ca6AByIZljvhn6JRuBbh3Eybihq
 yEejD5Ioef3KMGYFBk4E27oHU94YN9o+m+cTMq5kFTGV3a8IaGB/IJILO
 wPSXhblxYXglAmgYtpL9p/YT4bICJAaWTQysP6fpjT1BmV8zJFso2VceM
 qdDKYZgbnYYk1symEaKiGnbgqsb9ggFJB3OJwxkzByN/WY2LMOcgfxeeW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336564027"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="336564027"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709414448"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="709414448"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 02:40:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 02:40:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 02:40:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 02:40:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 02:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfcMWPcmOZZf7yC1ZyFForvJ5aRF8ylJh0szVQ0BH88XHJ27fscasRp/NfdrgyfyH7yppMyt2WmB5jnD4AN36vtD5end8OULU83poQnWhpec41VsC8pVVZVHW0DEb8ZfIbDHli1M5mvYUZ1oxuhR3dj1dMedQK1i021vFhgIRMTO4uv7QjtYAe5FCUqKc/y4KSIId397XoU2pX6zBdEavteaInodZ/4ee12ISY7yUGUPGHwEGuEH0sYKhnoez59WebtfppX9at6SqOjvUakOr65+poNoNawZL3MKAy6pyJARd4zR0EvyZ+fy0pPhGieBaWYKreIhDb3zRs7NUImQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ex7RBuny2QLA6+92dsXn/hjYwopNGlOdohaRsCH+jQ=;
 b=Qkwii2iainAM+VeVWP1kIrlMv4LO2nDf+jRrdeQVqX3aLElfbDBFoZbFp2Rs9iFsJrZUinRiANqcz2tRXlYt8Qi/sYYvubiFjhOxt6o+ro31pvAH0iSD+Z/0dtP73efDJg7KJwHGkkATycF+MdnSZ+VSb+b1eAUzpPvVme0PzfAjXeagNzLdKEK8oR95TK90Tiua1GmA92SvIJPxlq/+r0HrMy5TBbzSI9/2Qg6lYagLuMgNUD9zQYumr5B98vIEe72pfkCq7tpQmu70VYDSi+iB2L3De1eC8ZWzYSnwxc6DZS2X9VmHO9AIfme8S1+Z9ytkuNkxeVsLFKjZUoz74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 09:40:20 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.016; Wed, 7 Jun 2023
 09:40:20 +0000
Message-ID: <2cf71343-8409-02e2-b1fb-7660ee5d59c7@intel.com>
Date: Wed, 7 Jun 2023 15:10:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-2-badal.nilawar@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606125057.838618-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: af78c19b-c95e-423b-53a5-08db673b3578
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwIaNJQySF8ugxZsmZLzqBiZTkFxy2Xl7dajtWM0ggXmIVfuUfDSJQ2e942Yd1Y42ofqNvLtWStUuxray7Y2/A1eC/vfJ51MBijgAmhhSYpnu1Zcl9wPkK8stfgVz039RyRoVxG7LN33zU/jTjBkCAsDYArO0RZKrNleP586KiFwwg79vbLd1OQG6sgFajJPySB7dkD0LkUfQWZDB12tqfeikJcluPg2MEib/nh/7kG3wVZyXeNIHS+CPhFuJo2buC7dRNTWQBodLfIkvzuVQIfEgvPUwtZ5E+wuj4IK8LdkYhXfNqdx2iz+9nBvs1EOWw98DV6gM9Bi1tWD1e7oNusxTCtYGykYjBHEZ9W/ZCSkvgYCTXaWAEIGzLifSFPnyFoKlzBSEoDxUa5FI6ESJyrQXIdnXC0kXJd8isasNw1AeaIxkO2rNUsdjc2XQxO9Wz2CrhrvMkv9It/eGY5brjGmM4pn/iIf5h0G9xz30JQZyqlR4Bgi7E8BNNdEdG+ltAtmo6ufkLJQAIvV/t4wTgUoXGxIOUgFgIPGL8fkmpyvaNpk9GScpA0Q49oJrNbD/FTJHo6HGHqn+jYlVGGiZ7fxHfBGgKepmjSRaHELUnZbHaDRj1cvi31oIkhiP34VwEf8FfZzDBg1M0iOgbga4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(82960400001)(478600001)(66556008)(8936002)(8676002)(44832011)(5660300002)(36756003)(31696002)(86362001)(2906002)(66946007)(66476007)(316002)(4326008)(38100700002)(2616005)(41300700001)(107886003)(53546011)(6512007)(6506007)(26005)(83380400001)(6486002)(31686004)(186003)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFQdllaT3dOQjIwWStPaC9wdW1LSytHYUx0TU9TcmdEaS9qZGluakZ6UDZC?=
 =?utf-8?B?MjdJL2RSMTZkRE9kdHZqR3lVZy9YMzZUcTN1TUNDcXdHYkVhUHhWN09LZm1z?=
 =?utf-8?B?WWgwUFRjSzVONUo3ZmgvU1ZFOFgxS2U0ZE5SSy9GZU92ck9SNExZUkI4SmtQ?=
 =?utf-8?B?SE53YmpCNjh2TC9yQU5MWC9LcWZhVWttZDF1OHZabnBXeEIvZGFES1p0dnNq?=
 =?utf-8?B?WDJFUkl0a3VyMlR1cUM2WlZGUVU2b2VEd2JqalpIVDhINmh0TEFSbVAwekVH?=
 =?utf-8?B?UDBxZFhValFiM21jZHZOUWpaUk5uVW4vdjlZenNLem9SSWM5TVA5eHFrT3dt?=
 =?utf-8?B?S0I0UW1SeEY3a05DZ0p0KzBzcTErc3FvS1ZQUWp3NnZhc0ZVZkxldUppZUU4?=
 =?utf-8?B?Nkgxak5NTldjWWJzb2VSVW9SS3B4K09UYitxZDI5VTNVeG9wTTF0S0pqZXhS?=
 =?utf-8?B?aXZCQloxMmhFRVVndm8yQ0NaenJSK1RCL0JCRWl0aktZQXBLRjJDSURwWWZ0?=
 =?utf-8?B?Vi9VOXBQTGxFM2oxTUVMQzUrSUkrMUZBbGRHU1FtZHpKaVN4R2VHOEpXenk3?=
 =?utf-8?B?SFovYjVLaTJTWjZYakdwTUNWYmN1ZHFWU0pKZm1jN00rRkJzMXZtYkZSam5o?=
 =?utf-8?B?Y1ppdWxaaE1RUVdDcWZzR3RnQS9LcXFObGQzYnhqVEIzVWpFTFZ4ZHdKVlIw?=
 =?utf-8?B?bWFteVgwUnJJQ01GbkFzSHFKV1dFU0FUaXRmUG9ZSFBESnhOclQwMkV2enVG?=
 =?utf-8?B?dVBRd2I3WDE2OFVjVGZubzlvMG9xM1BLRVFjbFI5S0VNdkdQa2dGVTgwK2Fs?=
 =?utf-8?B?SU1ORExPSHUrc1I2YThDM0xTa3A3YWxwRHZSUG9BSFpxVk54TTlsdytmYVFl?=
 =?utf-8?B?ZjRWbE8rRmRreDNwbm5pTVVtYVBGUUV6RjloYXkzZjViOHM2TkM0MWpGVnZn?=
 =?utf-8?B?MmVEOTYxeDhiMHlVTXlMQTlTSXE4Z1JjWGFSdGZhYkJybVlNNTVUTWUyN21N?=
 =?utf-8?B?aDJOL2JYdDRaZGlaNlA4OCtJNWQ0Zjk0TDUvYVdrc2I1ZTY0RytNQTFjWnpZ?=
 =?utf-8?B?ZG56QWkzYWVVeTcxbERyMG0zTFUwa3JINFZ4dTA4UjN1Umw2aGZnY3I2OEtO?=
 =?utf-8?B?S2xPalJXZjJiRks5ck1pZm9mSklLdkQvamZHanUzcDRKZlJnUzdCV0JwMkVO?=
 =?utf-8?B?amY5NEtXd3V3Mkl1amcvVG5ISlVvZWx3NmxLN0NvV0xIV2ozOXQ0RUJpejgy?=
 =?utf-8?B?NU5YaU5zRzJRU0dudW9YTVBUV2FhSHFwcXZZUWRjVkh0ZWFqeUtNbWYvRm9y?=
 =?utf-8?B?clJHeEFIamU0MmRENEp5b244TlNXMEhYSUphZExXWkhaWU9Ic2VZZEtBNHFT?=
 =?utf-8?B?cmd0NHRLcUJVNGdOVG0zZC9LRHNVdUs2TFZMQ01wRkFxUllvNExjMUEvNFM5?=
 =?utf-8?B?ZGdJTmV3RU5tazgzTmRsNzZoVWk5TzBNM3loclpza0gvbG5kY1EwSk01UEda?=
 =?utf-8?B?NzNvU3hJTlc5WDIyS0RwODRPVnN5bllyQWVuS3FZYW14bTJaQ3JrS2FleXZr?=
 =?utf-8?B?MlM3ZitDK0tmK3RVSTdhbDhtSGZlNVZDRS9McnkrOTFoc2ZKdENvT2VDSXRD?=
 =?utf-8?B?OUxXV0RlQmd1MFNvTGhIVFlkM3docHhrVUVFZmJiY0FTM1BhY0gvaDJaN0Mz?=
 =?utf-8?B?eUZoTEFXTlVhWG5iWHlqS3JUYTVUUStrSWd2ZHlidjFqb0w1a093YkIrblUz?=
 =?utf-8?B?NzZQR0FObExoK0xoNTVvT0JOTzlJVy9rNXBnSjMrTFQwWm40N1dCS2pYYVBy?=
 =?utf-8?B?cDR3YjRQQi9PdzVkaGE1cHRlV1RMelFaaVpJbUs4ZnpxZndQdnVGZFg1Y0tO?=
 =?utf-8?B?QldKQ0krZGoxMXBoYWU3eExVZTc3TExYT0VhcU5xaDh1Y1RhT3hqbTI4NjE0?=
 =?utf-8?B?S1FvQ0hva1ZkVlBWWWx5c2ZMY3grd1U3U2dPaW5oeDQ1dllJSGlqcjhYS3hY?=
 =?utf-8?B?TnFTYkR4a25seUNBeHdmdVh0MzN3NXpSNFpqUHdwaGY1KzJCKzB5b0lCdi9J?=
 =?utf-8?B?VDZ0eXJKMDVxNzJ3clFnTW9KNERtZnU4cDdpZm9RbzU0M1BOVFFxd3lIOGF1?=
 =?utf-8?Q?VouX3eP2yCMViijaRzcL+fIEG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af78c19b-c95e-423b-53a5-08db673b3578
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:40:20.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBvR3VlDxVZYq535dJlDpu85X48z4e8h80qh6waldlM6riUKsPAvFA0qcxJbsiRRQzSmdtRQCG5C7t8b/LK9Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/6] drm/xe/hwmon: Add HWMON
 infrastructure
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Badal

On 6/6/2023 6:20 PM, Badal Nilawar wrote:
> The xe HWMON module will be used to expose voltage, power and energy
> values for dGfx. Here we set up xe hwmon infrastructure including xe
> hwmon registration, basic data structures and functions.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   3 +
>   drivers/gpu/drm/xe/xe_device.c       |   5 ++
>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>   drivers/gpu/drm/xe/xe_hwmon.c        | 119 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.h        |  22 +++++
>   5 files changed, 151 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f34d4bdd510b..7ac4469b325b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -112,6 +112,9 @@ xe-y += xe_bb.o \
>   	xe_wa.o \
>   	xe_wopcm.o
>   
> +# graphics hardware monitoring (HWMON) support
> +xe-$(CONFIG_HWMON) += xe_hwmon.o
> +
>   # i915 Display compat #defines and #includes
>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>   	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7985af85a53..0fcd60037d66 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>   #include "xe_vm.h"
>   #include "xe_vm_madvise.h"
>   #include "xe_wait_user_fence.h"
> +#include "xe_hwmon.h"
>   
>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   {
> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_debugfs_register(xe);
>   
> +	xe_hwmon_register(xe);
Can we call this if config hwmon is enabled instead and remove empty 
inline function?
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> @@ -354,6 +357,8 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> +	xe_hwmon_unregister(xe);
> +
>   	xe_device_remove_display(xe);
>   
>   	xe_display_unlink(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 17b6b1cc5adb..6f511d359de8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -378,6 +378,8 @@ struct xe_device {
>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>   	bool d3cold_allowed;
>   
> +	struct xe_hwmon *hwmon;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> new file mode 100644
> index 000000000000..65e5488dec82
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_gt_regs.h"
Above 3 are Unused include for this patch
> +#include "xe_device.h"
> +#include "xe_hwmon.h"
> +#include "xe_mmio.h"
Unused include
> +#include "xe_gt.h"
Unused include
> +
> +struct hwm_drvdata {
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
Comment can be removed for this patch and added with the overflow logic
> +};
> + > +static const struct hwmon_channel_info *hwm_info[] = {
> +	NULL
> +};
> +
> +static umode_t
> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +	       u32 attr, int channel)
> +{
> +	switch (type) {
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	 int channel, long *val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	  int channel, long val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_ops = {
> +	.is_visible = hwm_is_visible,
> +	.read = hwm_read,
> +	.write = hwm_write,
> +};
> +
> +static const struct hwmon_chip_info hwm_chip_info = {
> +	.ops = &hwm_ops,
> +	.info = hwm_info,
> +};
> +
> +static void
> +hwm_get_preregistration_info(struct xe_device *xe)
> +{
> +}
> +
> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(xe))
> +		return;
> +
> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return;
> +
> +	xe->hwmon = hwmon;
> +	mutex_init(&hwmon->hwmon_lock);
> +	ddat = &hwmon->ddat;
> +
> +	ddat->hwmon = hwmon;
> +	snprintf(ddat->name, sizeof(ddat->name), "xe");
> +
> +	hwm_get_preregistration_info(xe);
> +
> +	drm_dbg(&xe->drm, "Register HWMON interface\n");
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> +							 ddat,
> +							 &hwm_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		xe->hwmon = NULL;
dbg or error statement if registration fails?
mutex_destroy needs to be added?

Thanks
Riana
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> new file mode 100644
> index 000000000000..a078eeb0a68b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_HWMON_H__
> +#define __XE_HWMON_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_unregister(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +#endif
> +
> +#endif /* __XE_HWMON_H__ */
