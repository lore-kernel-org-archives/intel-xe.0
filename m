Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1357C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0C310E955;
	Thu,  7 Dec 2023 19:04:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2410E955
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701975886; x=1733511886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GorlKCRLbiw/D58H5AISXG5rJPOBSlP8PjDFakUyf5U=;
 b=NLLUpqSv7GqfALx83IMRLb4KkMR13nh9UBmjw6j28dJXrqTS58yQfKMe
 LwOnD5adlTCOcm6D8apRUOe5yIICeefWGpm92fxztBPWRYByizAN/0pU7
 vqWOIyJK8D9lFdRQMb8S9+q4lZtIWQxIJtakYUUMOxul36eckRdMa2S3b
 +9r1IRxp4x6lBBdE4SseHr8pFhbTH/r5Ciq/nuRTZbGh43qe54U3w/vGl
 fFOBnAfq6V8pJXSikTy5DKojCZcBpMAdG1jFZ+52CXWUayMg+Z2Jy1XAK
 TkfWpYjFp5aKeL8WWu1ZkQHGbkHK+hm8jalNCSZ2prOXiJeAuqCNWgvhw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1163520"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1163520"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 11:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="806119733"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="806119733"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 11:04:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:04:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 11:04:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 11:04:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnWoqO8C9JzNrOheA08x3lldwMtHJBCcmENl4JmCea2sKee7FsMMgHeH8u/puYTAhxN25AjFK/ZpcsUGAAEollyrF9ryMbDvWJYCMTJeH3uhe4iqLc+TlAggmmmyg6PC+2Yk2tG4KZ7Edpb1nqQNxJCp0freQtdRF/TY5cLRU+f1XahIrnac+zq1lpVisAcJmCPB9+5qvjCrr9oHmzJVuNuJpmBFSIrMn9lrKLMMLVX8TC+/PVFhDiQf+UhkdE8vd5kCGnvwXnagHl2xtoO6+/++P5CiziP7PEWQtpaSHSKbOjML9pXMIcQ1Dan+vQNM0VqtoImklSe9Ppgy3nykOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEuO+2lDjXUrHS42degXb48ayFBORqpbbfrDwCwGbe4=;
 b=VyUWke5S/SWn+DD/5iBL7FERIGvWh5jQxTYx8hHAEABeV9y5jltdBQGGpBconbZVoBJsz+qZI764b97PwfH1UThfAOeWwjBaiiJBbtMdx5Ra5p9lnhRzh0pGMbO4jG7srIR06fSBuD5fne/hA4crOSBnozFX+XAYrFHYOPxwVRnswWRgwVB3t8ZcwGl0XR299YEC/y3ilqcAEV6U7JANlUuTaX+wQsGfdgTb6lLPnIJ9OZ71IJc+ea7Jn1RSX4XEGhuYYBHOomy6TL4u/bhkG6YBc759Pinbk0vaanxAM4/BKsIjIi69sdS+oOUBdfD2T31KGBVNWXsnOOzkwakfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 19:04:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 19:04:42 +0000
Date: Thu, 7 Dec 2023 14:04:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 13/16] drm/xe: Adjust to commit "drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm"
Message-ID: <ZXIXRjh3sVidder2@intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
 <20231207141157.26014-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207141157.26014-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: c1aaedf4-eff0-4194-ba96-08dbf7575e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HN0xgGgMqdlfiA9V3XkgjJBns93o2ubr7agsBHa23E3frHA8hZXBrIL3csf+hF0LFRCSPD6IJKoFzA8orVn+/K/qZ6hsnkGnShYYmKsmqImcbHUf1qXAYqKoomAu4KAZZA63On24YdyHJM17I2u/NvhbIPcn4ik15f5VuQl3jwxC2vpge1j/hB4vhj6g3A63qgTQQKd+gZCw7CwGL3GyioKgnHfY6ktwyz9Yua4DARimbSO3gCnsHS9SHQCp23w01MwoMrwRMpZnL4HOuOfGz0Al1wNcLApQU6GVng2S7fTJ5JVSntqSy+/YjpJdrAZShXCLEOGp5q2O3/iwa8nWfwCjNlZD6Zi1ABJIPxcQGmzQVwpyC8AXU/jlFts0cY1F7raK159PKnsWfb7XAbrI9UnRoyhdRkK/TYuw8WlZ20XRANkOhPzymUcQBjXiiB9JZikjqb//Fs3P7TcAbxpsFT6DduCE29WgoOt/gRK16FtWcdjdQl6NDI2aXvoi/zsxwR8X/0OqRL7KV5xYY72kCLTzf34HjcmQ/l8MLOZRZ2AlRMfXSlLItxHN7KUzqME
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82960400001)(6512007)(6666004)(6506007)(26005)(2616005)(316002)(8676002)(44832011)(6916009)(4326008)(66476007)(66556008)(478600001)(6486002)(66946007)(8936002)(83380400001)(41300700001)(38100700002)(36756003)(86362001)(5660300002)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1/jceMhAtQDXzqyUXMDvm9+nAjk7Lnw9QeaOUqAM9Tbstuog2DY60lg75y?=
 =?iso-8859-1?Q?Q9dJkkpGqr29bsXkoZrMbXqZhC3tbzJZoD/xxgb2t5S7sqeU/JBi4mB1CV?=
 =?iso-8859-1?Q?4ncR5AYePcrHJjZ9/GZM22i/Q4lVsLbs4Nsq52EwzGjI0QShXXFbnHbAZJ?=
 =?iso-8859-1?Q?Q9wob8kr21kjcDHmm93uAIuLLyYZCNyGz3o6sotBheEZOJ2FFA2RJ0lFci?=
 =?iso-8859-1?Q?kohxoew/1nyjYiliWaQZd8BWiDkkr7a9tkfgcyzovruLTAi0V2gT4Z29xT?=
 =?iso-8859-1?Q?jKKDqDoYwFyAMFONvruIBw05v4RUEpkUYoF3bYCYa0MHSiW+UnGGaBXbym?=
 =?iso-8859-1?Q?hqt2LO5oqbIsbtHW3zxVdiG58GGkef4F0fd/Pn5aed36Y5gBS2F+R/vip/?=
 =?iso-8859-1?Q?FtR0HJFrCH1z36Yen/cdq/aFS542FFm1Q7YLE03PR81Nwb1vuThWQdxGT1?=
 =?iso-8859-1?Q?BjJOLQp/tRQkI4cm8kVBa9GRS6yQo7kReF5kcA/gr4XVPtVPMjRfp12oRU?=
 =?iso-8859-1?Q?ussZcR/xu2Kq4cFb81AzBDWiAdYJ/bP7m0aoG2TLuixVev9JySjmzpxXo/?=
 =?iso-8859-1?Q?+uw/dLv8VWVRbWC2iSOgXxM6jixelAoYDl/Alh/UYGsDMDgwoDxfdanAm0?=
 =?iso-8859-1?Q?FnNutmYWPujEvfeBDefTXYDusRcgAjySOizxDjyuT9JxCjYZJks5rEJkEi?=
 =?iso-8859-1?Q?efntmkPN38bX7yx9uduFjF0fomDK2M3bJ0QHInDFyREhXN8Fj2hEfiB2lc?=
 =?iso-8859-1?Q?mbZqIYipUCkl8DOz5HZQp+PhcauXZpyMlfyh5X0dObEJxJlcyAskU8SzgG?=
 =?iso-8859-1?Q?FM5WxyhqKZDN6m/huLjXQ5z7jlHocVj40uOZ3slg9yvYWOqnz91TQQcUIX?=
 =?iso-8859-1?Q?k6ocBMWSCMKZKX18lCAlztk3P2ESQ0rlXTMNnRev4OaxMFqebKYcPEkuEn?=
 =?iso-8859-1?Q?WrNiPlZXAVJOUIKsfrFrgXy4OchXB19rje6ae71SNB98b09qOgBPwlzK8P?=
 =?iso-8859-1?Q?C2LtT2ikVdqVHfcY6jfD1SenI15Nwcf8N+V+bUjTRY1IElCm6C1WSZZHlM?=
 =?iso-8859-1?Q?EXTASJQ1HV+fjh4O5paRBeYcuKcer2UakqQtE+hdN8x2UQucii2uIHw2nD?=
 =?iso-8859-1?Q?EfhYG8WeVKnJz9y/2Xj4oOTEa0S+G+U9y6/RLlwyhUxEDRsZEl3DPITKY3?=
 =?iso-8859-1?Q?ijCD4Q/Tvc3Gy5p70ZUuwPxupbogyUBuwXIIHnG22wesdBhl7MNscTGJCh?=
 =?iso-8859-1?Q?rYEeWfAy5rZ10sB1E8IHdptl73pSTzO0ba+lEbAPQfR4N7Vge82j0mdITi?=
 =?iso-8859-1?Q?4ZmRCtbxyAeYaX2xiWnrjygRYCYz+vPm4wwgYJcoX6T4nln3CwLi528VY4?=
 =?iso-8859-1?Q?M2PzocUI5SKh4XReBmfjM75f0YCCBWr6Y8A+1ZExeme6ZAqgW70FTTdS/2?=
 =?iso-8859-1?Q?0wdRbgYNiSejnEgQSOHJjq2kcIBOKBnB4xU8V6214vP8RuCUCO21iZ95WC?=
 =?iso-8859-1?Q?KDx7xOQ/eD656hVIAje5aOtr+QuhZZm01Vhe1DJvozxlwXwIuPGsZSzqxN?=
 =?iso-8859-1?Q?/LOhAqexWTHo1ef0qWKREqufdXX24Jyj+f3cifap1iJ/HVRHznFG5sulXd?=
 =?iso-8859-1?Q?6be2bV76yodyr+xNCdoMRA7pxxe/oSFedT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1aaedf4-eff0-4194-ba96-08dbf7575e83
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 19:04:42.6197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTCNK9V/tud5ny4fX/HIjIAneD/Ju3LsztSPPWNNG3K2UoN589V+5USRWtwqpwLeuTV8e8/M6PxhZF4esCDMsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 03:11:53PM +0100, Thomas Hellström wrote:

This will be a fixup for ecb7ffab6760 ("drm/xe: Port Xe to GPUVA")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9a090f21f9af..034496ac2341 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1385,8 +1385,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		goto err_no_resv;
>  	}
>  
> -	drm_gpuvm_init(&vm->gpuvm, "Xe VM", &xe->drm, vm_resv_obj, 0, vm->size,
> -		       0, 0, &gpuvm_ops);
> +	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
> +		       0, vm->size, 0, 0, &gpuvm_ops);
>  
>  	drm_gem_object_put(vm_resv_obj);
>  
> -- 
> 2.42.0
> 
