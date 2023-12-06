Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0D0C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 14:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805B210E733;
	Wed,  6 Dec 2023 14:07:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632B710E733
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701871622; x=1733407622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2+n7lc7lbGS1/U8+3Dl5ueG9aFBPy2SI6TQZyllPd+M=;
 b=YJpySHQ8g2WGCvIC1Aee9fYkgk2SZa/Tko3JYeE1dIVT7RZR1pAoj3ht
 JBfyg6ctJDh7pfHW12QRYuWBh1lPVcbcv7BJZ1NLmv7Dzpss5Q1+ldsLH
 RYtWoqWUPBRp1Dz1L6foN6zjzu1ikwtZIXUQS3xo4pRpz7jhorErrrK10
 oDp29vU2L93kV9jPFj2+EqAa5zw96Z/61N5NH675iXJ2BGRY6hcZ1DHBf
 L8UlnJajlBrwc/6++EXDBq0pY+PkcUs5En7i5aSU4fG+hw/Whhgr3Z35J
 WaHUkpIMd5VoE+sUdqclDFVZCMud5s1jOR+oVB6kgqR3opRTGPrwGyQHh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396853925"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="396853925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 06:07:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="19334986"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 06:07:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 06:07:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 06:07:01 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 06:07:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpOAsz96gBS1c7cniFvPBcx1mk70ccz96kAXMlVB/r9/LMGm5jjEqe2g2cf9oGDlIc7a0ZFAVGQHqKeBxUXKxkhlTePvH8+f2kk9sHxwMrAusCIQqISq+CKBXT4aj9lBlhkkAU7JEddSqubKV79bJoyk7c+JSxzyfLtA6enmHbPOxhSU8lW9DRnBsWUUP28hzIJB5OeUYuZ0nQ3ewuRDiYswe0SXoplN2xnDK703m5/UEzwhdyzeHSMctYzRyuhb8ZGfgoOd7KzzlyDJkzzLue6VjhNGk7SAbHnSsGFbbYYKGkPfX2YArbUWWLnOIBkP8rPOFXWdgn1gh7x8gJu0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+n7lc7lbGS1/U8+3Dl5ueG9aFBPy2SI6TQZyllPd+M=;
 b=YqeOjkbW7NJJGSHXoHztej53Oin1Qcb0Awq6qQ0ZYq7JzuuvOshtCRstBp8G0Vjc020lSKXli9Bhc3Rj2EsHsgH3wP3gCpS2btEPCV61JC462S72SjdnpEleFOjJwS1OoD/qhwhtMtyf1eAFfZCwK0EbO+pddHkJDgWT48Lec5w2Mn0UJlXE6jieFbVXm4c3Cp5pqc0h8itSgK4b9mL+ONZLx1c3BEzJt/qeEMTBGaEJ5lZw+VN6fuT7trjVXiGgO+Oi6MSHreETqPjA6qrXQsPz5XgaAw7NXr+lCq8waSukZb7fryjlrwWZG8RtwR/qdzKJv5ad4XGSPZlikJsQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 14:06:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 14:06:58 +0000
Date: Wed, 6 Dec 2023 08:06:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <mq756slndp2u2ooh67pdhhaqfrb5o4f47s3utymcwtqh65jpv7@icq4wbtysn3e>
References: <20231205145235.2114761-1-lucas.demarchi@intel.com>
 <170186687243.27709.2485801479192283213@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <170186687243.27709.2485801479192283213@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 130c531c-1b84-40fe-d3d7-08dbf6649c44
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G331RFBXXXrH2RsIP/DtcAmoxh2NQI8BMhofU5MecSQ+CM5yNXeuE28rOPyCRM52WSC2vyViZJrELrSe0tgLyaeqg8WWzJbc7kKP7wdBGSCaMiAFzE12ZqvmpAwiicgek20hAdzbvbCjmi1Dy6p1wnnqV6C7Rc1diSLfjGR76LMrxSPYVIo6knaJLrNAM8nk0huYzVcRoeH7YrBVZHpyIiIMchVEjEXYJ/OVLEB15rGl8wUwdm8DhcIPYkUTaA2rQyYkgkT2+/WIZRRkvmyiQ3bLSDp2HS6UwhwwWWBzUcBS2tRKjWdYzA3EL0dMYk18nP8VPJmOHOewln9qDQJrPTRU6AtDjlmTefFAOt99+taWZLM3VwSUtCHFbvZ1IdWS/hwouJjZCVQF2oDkPcWg4/ZEu3gjasCmval8nnb64Pe4k+vy1S8aVYmyFeQxbjTltC8kOVll+2BAPumeuyywA4WFgQmJNhlObZNa8yjPa6Bmrky+t9mQgdmVO4L/H7HwGCvDXbrO/ZYlGk63T4HLL5KxAT46pSvFY1jZpKkVqPqrENU8xORlufgcbZHL96qc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(82960400001)(2906002)(4744005)(33716001)(41300700001)(86362001)(6506007)(6486002)(478600001)(6512007)(9686003)(38100700002)(6666004)(26005)(6862004)(8676002)(4326008)(8936002)(66556008)(6636002)(66946007)(66476007)(54906003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TecoEjy9lwJhEZFD+4NP3LHcg85T9L/razQ5896FZuja1COhb8hEgqbw/lPl?=
 =?us-ascii?Q?QZP07l3mYz7bOCXeIGAVIcTx5XvwBu46509aAb5gTkf9IM7zrWl+NlcHac9V?=
 =?us-ascii?Q?e30q8MHvZxloneqfGFKbzPrhwu/qT8mofXtT/NigP31P6x/S51E7SaQhhX4v?=
 =?us-ascii?Q?HQGIUNI8+V/sJlPgjm7YNL/ZbjWfYsOKACetiybl8PnTJM+90G0x0Ut9KYxP?=
 =?us-ascii?Q?bKKA5U1XK4WH/UgqvCK0hh+4lDwIBgkXg15aCKXske7NcR0+UzLpY9sNdUIw?=
 =?us-ascii?Q?sM1vdoOpVb9qrdTos+J7APEMmiIX3o9vtizZ7RU1jcvGioPnM2JKHTpERrZn?=
 =?us-ascii?Q?VEQfJquVmW6Fl2lDrr1yJC/y9XXuY9roJryduidUIUHSrPn1TYscjK8DSg6v?=
 =?us-ascii?Q?awswuHTYT2XspBcY8ifXIh6ObBp2QbMwoDRiEV7Sxxr4WXV/YAbVlwDWc8vD?=
 =?us-ascii?Q?49gQUr58ZGfRLfjFGDrl9QR9uPFIfjAissOQKVexuiKFhChoe6XvEFvyIhsa?=
 =?us-ascii?Q?hjIqsYITygEcUbnTO0LNYTkXXk3iw+g0ddCdw7GmvM17NgRFN1JL4byirCyy?=
 =?us-ascii?Q?gCiEQQvo7D1GP6rGNTYf69XAXx52uy1u96qt/Mwk7UDXn+jVdOdpGdtFlbke?=
 =?us-ascii?Q?UHTmYmu6yEIAiYVvtjE/0HlQsjDDxWwiyqCT706x/ki5m5yfnxMPunpsjapP?=
 =?us-ascii?Q?Y6yR04XFwOre42fBLQFzFO7VNXewAMrbd5jX9l5jFpGCort+k3KTbOnQS85C?=
 =?us-ascii?Q?4n9k6GFEstl1HKYEpJb8Sre1X7l624P49eT+4EXWKMTSxDDhk6vE6bFd2Hvv?=
 =?us-ascii?Q?W21aPRZHMuD/D4QYI3eYTllAjHLR1q682/JjIxn2SfebHEP9ce5d1eX7d5s2?=
 =?us-ascii?Q?1OQeX+F5JUSRURkASaMcGaWZFiEl1svUtVRG2oW+1VN9PiUsFWwx2IhfYN07?=
 =?us-ascii?Q?WAnTPyhWADuODqgPuMwsXeepZIQvjXSLb0un5tQnisF1yIuMebig9TnidXaI?=
 =?us-ascii?Q?dk06xNHi2PfJ5LPdCq5IWj3I4ItA1tljNm6IVzIAlaNbn1ZYqFPUa0U3SXsY?=
 =?us-ascii?Q?qaBHggOwkuuVD6T99Da4XlcrnPEEpOJlrekmCiuADx8ceDs0xz2G9m+QYadw?=
 =?us-ascii?Q?mo/ITcq3TpR0qslF9LAUnNEvxXzfFUA/yU3v6W3LjpfJ9RofCTbdwLjDBVKD?=
 =?us-ascii?Q?mqCJSH+54ETRqCgbejY0e1GhLztUpA4bG+fPS4k5bRCKRZrTMh21uOCBmpmZ?=
 =?us-ascii?Q?Zpl+2z/8UjBe2R9Jhd7RMEvBj5kGbjP1O/BYAJOtsXZytuNiKQpcZi7i1aTP?=
 =?us-ascii?Q?jkTsxnycXjt4L8eM6SMBpGfdzfBhHQaTMTBNk5iUcudUlMWD4+K/l4sTdJDf?=
 =?us-ascii?Q?Y3SUAy0Gfiv0zk1RwuGNimyKD+H/VU9VcHxAbjaSI6NiqbyWaPRfK6v75hKI?=
 =?us-ascii?Q?L9A8BQbCUChBZ+54WkS4lWI+gLAjh/Uh319BJur4NeOrzmoYKv5+i2OCdI11?=
 =?us-ascii?Q?J0gNPMAWQIxtaCLxAJWjS/dHNgLzhJaFyFTaVl/hXLF/IHsDbwblORIlh7gb?=
 =?us-ascii?Q?F2ZilS+dGHIt06SoQ/wu42UE2YAB0SDxy5WtN5oUcjrDllICViRgHZ7eGKUo?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 130c531c-1b84-40fe-d3d7-08dbf6649c44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 14:06:58.6392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOJAoV2WsTCaYYHGboviSsQe7O35SNhsoS0SYxsvkhmrz1VijZDkv2BU8Rdxwc8jctAvbh5d1m3mxpfkRsuIiForhhD6JFAQZD7yr4DxcZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename info.supports_* to info.has_*
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 09:47:52AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-12-05 11:52:35-03:00)
>>Rename supports_mmio_ext and supports_usm to use a has_ prefix so the
>>flags are grouped together. This settles on just one variant for
>>positive info matching ("has_") and one for negative ("skip_").
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Thanks. I will leave this out a little bit more since this has been an
area of disagreements in the past.

Rodrigo / Koby, any opinions here?

Lucas De Marchi
