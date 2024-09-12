Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F82BEEE253
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84810E1DA;
	Thu, 12 Sep 2024 20:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDCZQ2TD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826F810E1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726171880; x=1757707880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rhVwYrXdPuItpw4fiJe9oNTkpLdMLSo8hlzL49A81fE=;
 b=mDCZQ2TDxwBh23dmVwg+XS26E8QdWKuctkFW/V9CAZvRJrxxnKVcG+h6
 1nIZ9ChpmO/zqtx5O9bcAC5YvTC9Q3PmRxmlZJqFaie1zpmogj3ykLawE
 7bXZjFCqK0zDNj87mkexk67iRHGcLf0P/g01AWUUC9HEPsId2lnn4V6Ti
 0m8una1yA/iAmWjgU+SGGVjaHf/8Z3FygPvsQrQimeTcwuZQ5jM+LHLas
 xw/9GzEMC1y0JU/3WBupCRPYkj5jnbh2GgC9qCW7KcP3xC7ZFAY0n7JwN
 CnNqvFw9WNrfiIHKM6bzbkUqW/i5UTgP3xHWQy3cwnBoIwX/FHHR9u29L Q==;
X-CSE-ConnectionGUID: DWnYqXfVRcalMQgebUeVLQ==
X-CSE-MsgGUID: Q3z3ZOAzT+ytaFBaikHLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24877590"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="24877590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:11:20 -0700
X-CSE-ConnectionGUID: md6mVyegR6mSVQ0etG1Q7g==
X-CSE-MsgGUID: lHDOBQMhS+CxdDPd7zGk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="72174731"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 13:11:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 13:11:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 13:11:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 13:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpYcYHTH9JgNSzBRRwNdfbW2oRfHRSQ4prEdfaLw/F/v80POPs/bsECdgE3jsKY38bx6niXiZry6CYynmeW1h8y1tfEM+vK52K1Pq+Nl2wj8rQj1DWVIk3rqOAEL1oMtNv7ZMsD8NRhEDp43xxA5KAVMNIHu7foT6baC+6tAsDy4jASQ65H+XQ+Rh+VH9kZRHBXf5rhW0mVBUgEu0ZpTtZM1ueJOiXDBIhzyZuNOXkBAhQf6TZiXAquhQWkaxrTv8M6AzwLQNtZQ/djcqTBOxBJbpEL4BxLRhE/cEHVOgQ+Bf2xQSjbhXMGOct8svOtQLjUkMz16jsrqO+G2wOUpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oV1UB5SSPAj4rjScoUEoUlbrNtxH1JODBqMU6uVQNg8=;
 b=mlewRgB9CBr6H+CNc4Ahb9f+mljPu7VRXwAKffPPjJcg2Gyvm1YXfjm6rCEDas1YtJ2zEOHvXRHqdKtt3u97/+AyE528pU/0pkw1g+QL+jAPfADABh/C9Gfj2Bk0SubOw+R4MHKBC3uEm8IblJzMZi3RuVtljsAyFwymEPOF4JO1i944EYqcW3PgI0RrN44H+HTFVR39HJvz9b72/if1MjlR6OhcMpBIwsFJyLr8Wbt7M/F8X8fVnr2szkNeu1h2DXxoE0MsX/pu/kUI7RXaD6939R5yf868XTMQmxKdggs4694aqoSL0rfG5gF2OO0Un85S7Ib+kzUmxjyhrxD22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 20:11:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 20:11:14 +0000
Date: Thu, 12 Sep 2024 15:11:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <5o4xl2avzkdnbecni3vg7fmtiw5lfr2ohuz3o6vdfqzjmkdmia@pd7naq6fa42l>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240912190530.435976-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a6c72d-7c00-4a05-7333-08dcd3670db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zvGhg7M4uXX9roSbz+N8FcXUtw0Ehwhz6SVRNyOsz6wRFs8XZgDTR6JdOT9n?=
 =?us-ascii?Q?40F3v68ohauGPlzfN0on6HU+nLTFmpcN8ntIhNATCN96By2C5rMc+eMVGTxl?=
 =?us-ascii?Q?eLFMBUiKqVXQRzzjXbqpx4FFNSArwRFAEeIE4C+0KRQ4LxZR0iNpLDBC3wzJ?=
 =?us-ascii?Q?+ZmCuBOx7/3jkK5Ul/gs6Z6mhEIkBmrEklbfRmfQLiYj+K0jAjDxFs6bmtVw?=
 =?us-ascii?Q?qzfy7BinBm4jTW+qqNwVHHbWtsaP1d/xg1RlmJC56lkObBLG76m8Iq8UjxzD?=
 =?us-ascii?Q?nDeN9NiZsch/+EdUKp2CmZxq/78At+H3ERyCIJrY4Hjpmrxs5tTIrQgjaKjN?=
 =?us-ascii?Q?RihV4z1DrPMgC3q48gqovdJ7PbUX+H18YrUTyzMZRle8P1t3aRSTAwgyN9ZX?=
 =?us-ascii?Q?2O6ptTVxtfBP5UtQJLeu9jsEkL0MCbpTMwPDYUV3rYZqVf8IPTEyVbnlCILR?=
 =?us-ascii?Q?p9DvMUFUZfja2daiE35jakLCI20Dv0GtZxy3xanfbPWfi7fWoiFDH3255jOH?=
 =?us-ascii?Q?rji5L+RWGuaOSBSCqueJkWGnGTmy3gcKOOhr8FA2a36FPJBIzfhFCkh/ZjWs?=
 =?us-ascii?Q?WhFhcMlSwEearXwyOL63Hx233unqL2vQm56yQm/cS7i/SWJq4RtVfq5knsxB?=
 =?us-ascii?Q?cH6DJr44cpJjZ0dvsJLlDzVxlgEf3urnoWLjSDsc7EvGEqTc+zUQMXgQLBPK?=
 =?us-ascii?Q?nVGINTGrPxjfmhcxCKS9PrwHnnjetk67VE5tQHzEAganHgkNJdS5Qxjk1Qek?=
 =?us-ascii?Q?3LyifKAo/Dh+A0DJvvdrVArt8j2Nxa46ykUI7RJfi3vUIWogY4bP3kBAafkV?=
 =?us-ascii?Q?+6YYI15or27YyjiZnCAaS7QcuJEymf8XCzYl1Wi5JmincFxfJ7eHEQEXvNEW?=
 =?us-ascii?Q?4sefL/m9uNJysQQNat11qcF9C9c23UiyXvf+FEp/IEwI1wTgw1KgWR1VzJQ5?=
 =?us-ascii?Q?V+voa2iSm51S+eOBEX4o1UO4V4ILoLTaeqKN7aBvVGbFkYOxcfdzVWNVqKns?=
 =?us-ascii?Q?AXpT3TUInmNI7txoJs0HfJhhsppSTevErKSa+wWuDSweT0pxcNjOwH3r39m4?=
 =?us-ascii?Q?W4V7J0nYh8n+pBvhMnfjWTGbWfN1EN4H+NZqmGmf6Nyx6DnAXxr11DKvRwE5?=
 =?us-ascii?Q?dP+PsMQ1+/p6LL78FBBujIr6p/TWZtEQC4OvHDpkvYf2ryVQ/NulUdzPIwre?=
 =?us-ascii?Q?9Ar3hkR5gGv4yoYSqODFbZkUpdxuUw5UtQRVllKpw3PtJ6aVQ12AKkNZ0PUg?=
 =?us-ascii?Q?ntO3hzRhT99V6bp8rqKkznk21sydateAB2lpVu+YSyepza2ewayCqZdczbo7?=
 =?us-ascii?Q?UOyfuQH5GbxKAyIp1hsylU87as1bOXCFwKiHVlK0b/BvQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M1A0OOrM6lvoLaDux/pwFjj3UZ3GeQUk+gHQAQ49BEVL1EHlDyAfS/thbu3i?=
 =?us-ascii?Q?b17plToZZ/IIJIHSLxEWG36bMWSpnPssZz7sdmtwctmKwnGwz2up1LijKXTy?=
 =?us-ascii?Q?PMnjpBW04+v/LwTxBv+b4VBoIwjqXEMrOkeBeuCoDAmNinzZOtjKxRDteext?=
 =?us-ascii?Q?illRZlcd0xAjSuTzCU5q5t/c68PK/EywnoJ2IwOClk992SZhGeFWNtCY2cF/?=
 =?us-ascii?Q?QP1jWKj+3WeGymlQLyS40knnIKB1L1WdQncUue9eJJYq+Od5F9HQuDHUxzLP?=
 =?us-ascii?Q?AV/RpRhoMo0/38LlugyRtmBFM67jIuOR+Sm9f+1vYId6KikKaBlKjat0+YDm?=
 =?us-ascii?Q?ID4pbbYgVF8BJudeDU5sIFxpL/PAiLOnLgiZKmQiAJxO7kmrpHhP6vQuWFn0?=
 =?us-ascii?Q?iBJSsEU569nnpgYoo+CvqVTUr7/LEe8GBnj+n79bamrlVONtK2mW8/y42DKO?=
 =?us-ascii?Q?I3SP5OPZ2MfvRT4wL2U0fcCCXKPPYCpNvac7gti4yMCyIuSp8gMkpoR8vzGi?=
 =?us-ascii?Q?JpCE8E/2aZ5dTQ2Yn/DduCjDoqxexdlUWxa1VT4eox2a9OuTE0Yu4fmoZ4NA?=
 =?us-ascii?Q?nKhKCv+eAEJiMQRiNb9Epzs0r7XhWstbj08A7sbBCu6obu4KUVnY9BFJ0juM?=
 =?us-ascii?Q?PeYFbQbzTrRZvSOTd37SYa5V2szk8dgNvxSJ5kEr9CjyXknAxLnT0Wp0aDaI?=
 =?us-ascii?Q?0dDrTFzedzuEHrnxTRNINb9/VZ9TS9o6TZAN0uUNDRci/oFLSxRJhOUdZj7p?=
 =?us-ascii?Q?uPnyXJwbt8ucE7RU/k4ERCsdoHt3Pono/JuWso5/Ot5XX840e9s7bjX/BYrB?=
 =?us-ascii?Q?G+3o7GOm3GddZ2woks1NVmOa/OqOnJPwDuAWKgVFgjYrcf5HeO3HK8aYG+ar?=
 =?us-ascii?Q?JakQWjGoInuyGuD+43ofiTP5LaOW8/Znycpvk73ZNbQ7Sy6pEBw4BHu1eIYK?=
 =?us-ascii?Q?qy3R27MojRHFf2SDvLGipHJ70UO/LXEor0yiT9KV91j7VKewLVzNAZKLrCzr?=
 =?us-ascii?Q?rGKDLxkKc+2fI1os3wrCHix4Z2bsYPq/neWH9VboVWQVmw0Z28JxatE9ntNE?=
 =?us-ascii?Q?RDXJIkoKv/XgSrq8R0Nnf6810CLClLBuUIj38KkHu/KCbg0+yyT67tCbuitj?=
 =?us-ascii?Q?pZ2yFsTLVUcrMD/DrIT60RPrsjpoDn+91carQomZJZtV8y+hd3spkAqWv7H9?=
 =?us-ascii?Q?hR28zsmXWOilqO+kfiGzwrE53YmvpAN1B1c4pj+mSjs/jCfXw9wJCVZPfhIi?=
 =?us-ascii?Q?mxWQe3awml58m/MtNzCRAkdjRrE0HLYG0xLj3bLj9jwuqwi6l/Vls84CStYS?=
 =?us-ascii?Q?OQ3cYR4ik38wMrVi91f4OC2vDFZ9XWibGvhdDonPL+WsFXzdSXmTk6RNNR+J?=
 =?us-ascii?Q?Y5yPx1RXtMtt2T8RaEukw6qWE/VpkUDm9rJKJKer7cuiE9gfjUlq31cD5fkZ?=
 =?us-ascii?Q?iR9doRQ5e86pvk0NkpCWFdzgXOa+Yrq3yOtEOFhD23ePSZEWiYQ1hCbGAYmS?=
 =?us-ascii?Q?a3e9Cso9+EWdbB41xvkz3p9I2GMxqrVvWx3rZLYjqCCeihGuNJlq09bT4vCD?=
 =?us-ascii?Q?dz3GKkgdCJJvwOcbe+9Php11En92qHnguXQ7tgvdpjGv0CX2jq2JLYcFtziX?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a6c72d-7c00-4a05-7333-08dcd3670db9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 20:11:14.6814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiZsKAtpnFhYp8ATfNiDI0UraUjtM4624o2tvLr0YwECLgk3a0kgbZDfMnJSs3mCUQIk4jYK5yJ9R73uY9kQHF0NuwScFR/D5dN2J4GlKt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
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

On Thu, Sep 12, 2024 at 03:05:30PM GMT, Rodrigo Vivi wrote:
>The pci state was saved, but not restored. Restore
>right after the power state transition request like
>every other driver.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

oh, no

>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 5ba4ec229494..6d29ef4b396f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> 	if (err)
> 		return err;
>
>+	pci_restore_state(pdev);
>+

something bad happened... I was sure this line was here before. Indeed.
git log -L:xe_pci_resume:drivers/gpu/drm/xe/xe_pci.c to the rescue

See commit f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")

Lucas De Marchi

> 	err = pci_enable_device(pdev);
> 	if (err)
> 		return err;
>-- 
>2.46.0
>
