Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D96C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 17:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFE010E0F0;
	Mon, 20 Nov 2023 17:22:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C46110E0F0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700500944; x=1732036944;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0Gutt4tuYqQoBjhnoSXHZuXHcyDjC+bLCi04QES8Lz4=;
 b=ACsMIDWN0JYnCWOqiNpF6faSiot9vppHQy46RIlDQHV0AlChuFVaK8Yg
 HaDJvPThcc+bZDekCVACtpphWHoeeYQ9rK2RlxMa7sBOrEZ/0QZxLN+CS
 036yxYD/9GR0h8YOA2i0qeUdJ3fzln03NDNiSFTbBuNjODVrHX1/U6ORR
 ev4j/UOaXyuI9K9OUEG8UuSzM4/hJ7wib7ELAvbvnPKT1PZljNvyatO+F
 4N8S5vZYw8OkJvy5S5/JRDAx3oZQtkpU6XT7PREuRSRsTyr98vlB7YXeN
 s2s4/zuGUmk7MPtkWjDEcR4zMAw23M6ltGUlTGhedT02r/Na842RZ07Gt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4781291"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4781291"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 09:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7627489"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 09:18:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 09:18:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 09:18:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 09:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNbGCeiRgkwKQ9vDXspuTUx7lz84dkev0yyIv34IjSDkOqaT39F9VB6FwRsDJLJhZXiWvXIRTK3nYdLM7W23I2k3J2Cc40wmvwQE+h26jRCfie41Xi5xm8sWnUoArSs/UchWrfTyAdRM+IKqi8wczVWKh4CbcqYMGNKKkdNE28wjdyPpg5UW7FMqwwgrB94onnXao4gryqeTmoadXja0f0nyc/nGxPGAHVinUAg2d27fUOlClAUdbYA3ai3Flu8Kqv9cOwjaebSWEgwPiMoCsXKVrfhYFEG/6Kv5IdcOd4oscJmxor5DlralxUEJLNfjgnHN0GkvGMWG0IWsInBfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipnR3qowaIzn0ObNvYBtezli5ihLrtZOvqVoAzU8z1I=;
 b=Gh6+IjAViPG4d2ay3rRbKcIFJRS5GQZnQHyzLxYcqZmUCDfo4nnhdsMYlRBZSz1J+AK7FWVnlfJO5+90EiNYdFj0u8/ZA4XGY1jfDU3ta7jw/Bi2db0aHm6Tlik7YslqdQWrm6sxy35dTzQoifFbgQBAkLhJ1MtUcMENQhuyjIurg6wHz8Y8RS6d6ZIviaqoaiQs54mHfKH1kXR3zGzcP0UDcwKDXvKJbuBP4SI1OlZpBsJ/NPOWeAqgYHIMI5YUK5KdVQx/ryNugqU1msLAOZPT07zvu9ivMPDIFwDTCsUoaUpOhtVfYfyqiB3Rk4GUXQbkDNAVSJ7j50M3kmHJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 17:18:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 17:18:08 +0000
Date: Mon, 20 Nov 2023 11:18:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <vcvbctcsuqspng6zgm26p2lknexr7eennin7nsilzpuefb7zon@ysglsrtxd5ab>
References: <20231117173634.61564-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117173634.61564-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b8f8dc-ec44-4a9b-005c-08dbe9eca9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ux2P+lzO34e6Pl2Vpz7ryg7NyUstNOmFqoYLgu1mJcbAcNcOAzRRE99vHAoE3+GV/Yb18Pbb6u6IeVoyHH8ISow81057nIoec/vfJNfJEy68evTzIX5Dd+Rc2hCTYAcY/O/zOZZ4bJcmwJJPxpoGay696WTIbLcFOtaKs0XE85IJXDres2ntnqICVUrpcCdsDAJ6jOhCG+BZDnYznlZkzqeI7g7b/ctQymPxG6x9LcEHDVRETaitR8dYDMrIlY2J3rPrb33MB7Ez7O8U2d/gLPRQu8+oAQud+ULgpVwLAzjrGiQTDCV4eLfj59F9MOjGNpqGeLv0pCGxioMrSlRIcWbQxuYfg/JvRs7j0o4pLa6VYQqi0DzSmSkL8dp8MIBc/rDH0tY1H3KL1aMo3iN/pLhNlNp7ucrpJoDbDwQijlN8SKJITzdRtgPRFFgcOLf8pGzFgd1VmrvVF8m1SVgRMcrHczU+8JQHqbE79mYEKqlxvSy5Rh/PMIMIBiCksc95vPuJKWfG2/tgifhvyaysQEoC7Dzl3NbxD1ONO8+UoC9KNw3dvrQ5Ba1CwEqKOWUQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66476007)(66556008)(2906002)(66946007)(33716001)(41300700001)(82960400001)(8936002)(8676002)(86362001)(5660300002)(4326008)(6862004)(9686003)(6666004)(478600001)(6512007)(6506007)(6486002)(6636002)(316002)(38100700002)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tMaupkB3sEsmo+3zKV35qP1N1D3/lkyJljKbAWXdqirDiwyBOQvzHlF//Z?=
 =?iso-8859-1?Q?2BcZkfYrVeOTVTy2bAgDWlTLn+llJYxRBng1LmlZjI523vUmrIp3QtTdiy?=
 =?iso-8859-1?Q?wUGXEr+iMU3rL2Z49ecl2u3GWeWYlrxAeByjeLFj/HZmjYmz/3rYXnXrJ8?=
 =?iso-8859-1?Q?CesSRQw8/YcLF2+FZd5TQ9px8iS68CmxuI9HVw8IGZL6sOJlw8CSyTEqPX?=
 =?iso-8859-1?Q?dl1uSbxCPJCItzv3SZthaSS/a2zcC4PtMVqiDK4Tjmr8ZZlZAy0TTyrWkb?=
 =?iso-8859-1?Q?zefsLwUQUE6YTAhx76/q5TKs3okoCcDn+qb/DYVBP1iGRzoFZeiYLwwFoZ?=
 =?iso-8859-1?Q?vldZJaVGksp1A86NzKnsjFAv8H+y5SRsmztW9fDcEWkxGivNHYxaCINxK/?=
 =?iso-8859-1?Q?kWobe3xT9I3P1Fm5S2JbMmOq6vaDRv7l3kIHpMLP4rpVsxHOFpbmA6q4cI?=
 =?iso-8859-1?Q?30S9QyVZULdT/eoPumBO6g7V4FP2PN1LWyiPdwWvJtvHHW/nC7+WAuRH3E?=
 =?iso-8859-1?Q?3WYjQ2ZYCVRu/P72P6AYOzjA9/K8uNbYDZ6gl+dBl9CUmPndt+PIXpZxNZ?=
 =?iso-8859-1?Q?JMvi+UJ+NNuxsGWX5W67DZGSRUgwbLhay2C/++/ondY+MEr5djRxMxgQzo?=
 =?iso-8859-1?Q?5FpmQbNEmeLChEIKu4n2fArpT5bA7hSBTa19E0dPEdK9y7v8/sxbtOTc5t?=
 =?iso-8859-1?Q?cC3OymXHbizJ/IjTy6R/icQiFXqVHj8LUTXDjPjiZ6RM/wNnpD8UOTQ73R?=
 =?iso-8859-1?Q?drkERZBCYnKBOJKe3yHQIVK1waFGGg7yLZwJCm4f0lnm63+pwyltQ8YgLb?=
 =?iso-8859-1?Q?qCA+teWSTzYMKlf2h8lwLvcd57wo5B7cXB7vHbaoT+POX0xtRTmWBchgaB?=
 =?iso-8859-1?Q?m7DbnByup7XlLVYk3+Qemc1WvEMnUoADNuvox2UeOVoyjMoPZwAcHeVp1g?=
 =?iso-8859-1?Q?yLIROB46cJrHy8tp0bVj1UBGa3dmErGBcbI8KFT+b+rUmHW5svQJfRqkV1?=
 =?iso-8859-1?Q?xBEDq/7cez95vn8t9YEtPKSGyxcTifU0EW2S7+WJtzT2fCzI41yuVjiQZL?=
 =?iso-8859-1?Q?GLGKBE9NBAIBLMPArYNm/mIiAd9vqPQqDjzd0663+xq0ZGFvjGlYDrf6XE?=
 =?iso-8859-1?Q?ChG4Yc9xBPhlNut0lTCp14iP0NEJWSujk87CE4AGf3tbCyctaZZbAQQfiN?=
 =?iso-8859-1?Q?akBXQrirSHauxmjwpm+Fm5jhqPJq2chnyEaD2+jKK2q2FdciNL11/3tlyO?=
 =?iso-8859-1?Q?vYCSUikM2ekkkn8btcr0T6vtH5CzLHK/BFgqdWJHuTkN9Q4U4nATZnso/2?=
 =?iso-8859-1?Q?68fc8Av+NwKfSuaivvXnnyLew0HWKNoZ5OtKGojDX3d60scbSz1OhmRY5p?=
 =?iso-8859-1?Q?0nn9WyHoX4BtdXNqzGxc/RFZjgDwLdzv5poFOauWe6JT7D9Lc9CsMHviL6?=
 =?iso-8859-1?Q?zLvdv2Fr8vLzMZqDKCEzyqkDJ/6/pDlZqIzb+R4gmcSCu2ZPhkZpHIaPtT?=
 =?iso-8859-1?Q?LtmJAFgTf6+QSgNVJZDPi36K1SbiTJUc0833ipkfBzg5L3iPFJlsX3iFLj?=
 =?iso-8859-1?Q?Rt6Hz9uaUXv+wr11ePJYHogey+4D0vqo76CGnnHjgQhBL/pkZC41sD535u?=
 =?iso-8859-1?Q?0rcEA2MpIev3GRVWl1K+An0X2lwdeVoYSZ/nvhCiUwNWODIP9FUx4QAQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b8f8dc-ec44-4a9b-005c-08dbe9eca9f0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 17:18:07.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCTN6EjS9T/tFqvMJw9U4xHE9PHW49b4U85rbMd/w1pBanM61id5OO11X4oljsSXH5L/PDJsRcGRUqvhvIImbCzDVScVVP2Mj4Y/4BTMRPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Include RPL sub platform PCI ids to
 pciidlist
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

On Fri, Nov 17, 2023 at 09:36:34AM -0800, Jose Souza wrote:
>RPL-U and RPL-S were defined as a subplatform but those PCI ids were
>not included in pciidlist so Xe KMD would never probe device with
>those ids.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> include/drm/xe_pciids.h | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 68fbab161feb0..d1e54befd05f4 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -69,7 +69,8 @@
> 	MACRO__(0x468A, ## __VA_ARGS__),	\
> 	MACRO__(0x4690, ## __VA_ARGS__),	\
> 	MACRO__(0x4692, ## __VA_ARGS__),	\
>-	MACRO__(0x4693, ## __VA_ARGS__)
>+	MACRO__(0x4693, ## __VA_ARGS__),	\
>+	XE_RPLS_IDS(MACRO__, ## __VA_ARGS__)

that doesn't seem right... you are adding it to ADL-S list even if that
was not the appraoch taken for i915. For xe1 platforms we should generally
follow whatever was done for i915 instead of deviating from
it, which means:

/* RPL-P */
#define INTEL_RPLP_IDS(info) \
         INTEL_RPLU_IDS(info), \
         INTEL_VGA_DEVICE(0xA720, info), \
         INTEL_VGA_DEVICE(0xA7A0, info), \
         INTEL_VGA_DEVICE(0xA7A8, info), \
         INTEL_VGA_DEVICE(0xA7AA, info), \
         INTEL_VGA_DEVICE(0xA7AB, info)

and then add both RPLP and RPLS to the pciidlist:

static const struct pci_device_id pciidlist[] = {
	...
         INTEL_RPLS_IDS(&adl_s_info),
         INTEL_RPLP_IDS(&adl_p_info),
	...
}

... Even though adding RPLU to the RPLP list is odd. Looking at
drm-xe-next it seems that is the only thing missing, i.e. :

>
> /* ADL-P */
> #define XE_ADLP_IDS(MACRO__, ...)		\
>@@ -119,7 +120,8 @@
> #define XE_RPLP_IDS(MACRO__, ...)		\
> 	MACRO__(0xA720, ## __VA_ARGS__),	\
> 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
>-	MACRO__(0xA7A8, ## __VA_ARGS__)
>+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
>+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__)


^ this. And update the list of PCIIDs to match i915.

Although the use of -[USP] in some places and not other may need a patch
to stop it.

Lucas De Marchi

>
> /* DG2 */
> #define XE_DG2_G10_IDS(MACRO__, ...)		\
>-- 
>2.42.1
>
