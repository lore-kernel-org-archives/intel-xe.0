Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E8C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 14:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C18C10E1E0;
	Tue, 25 Aug 2026 14:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPX7bvsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0634710E1E0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667509; x=1819203509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CobIvMyrfec7k91YfagOgEgInBGDongHKQMHX5T8ozA=;
 b=WPX7bvsjFP02gs20LW6vdVDCskkesXS8qerPraftggMAZUMDBnlyTLvE
 6l8zRWwsxWD46KlMh+R9WQy/xswRswGOQzGZzj9tRVCaU7WqwuWDyEwRb
 BF8YrmhUKEPZfuXTv7H2YuxUC0PGkGLBsvGs8QmwhyjiZva9vGrrR5+Ci
 SHKRP+0EtP/e1gMrwBk5Si/yTQL/Frt2XdQm8bG2n74m5V3SyqzKgBp24
 hcm9Z1Q5nowPWV4Xo8hhLhX7sxF8qOIAJ/WWLPa9kHG5FpSAAbJm0sCJU
 b9dVyg+Cwt7hfB6L8sP8Uvm/HVW8thLSp795HCZqakWeDzEtkx4rUN8lG g==;
X-CSE-ConnectionGUID: 5NTk51fWSVy0VILZSf3pXw==
X-CSE-MsgGUID: ydjDdDoDS+KjZvrk18ri5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88264764"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88264764"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:28 -0700
X-CSE-ConnectionGUID: EKVS1KJ/QbuGkhjJXj4stg==
X-CSE-MsgGUID: sEvvn6/eRmGmj3495UbPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="290830837"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 07:18:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 07:18:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 07:18:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DU4ksHA5eMudoPyw3UQZPKH1AF81798LDMN0FtoVPdfiv3U9Gyz+ENBBgn4IvSaYHKaaoJW9ALS13/lWWRJBuskpo07oHzaNa0fQemW1R5X2K04LnDZl2Hrir9ggBW3PkYp8ONMWxiEePXav22Khbn+DsGjO5pdwLUVWR2sWvHwxRJypMd/+f91Zu9Mz52qgoGNV5j7rggwOkzwQ4U/35FTIUmlyYS58oSV3JK2g5fkbDyJmkADwQqWRm+qyUmRh2dG17EbMRtEyftLEZKq9FM0QpRlV2FsuLj3MZ6DrnMyy5n0ziCq4EzYTg+C/D39O4kJkVfxZt6vO/sCd7nKftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QRk87cy0kaVQy4CQq3rqSk9c5m37SIC9VTlRoJ3ej4=;
 b=A8uni6majXZjckcFsuuVXt97rWLYNmz0mvbpJvMsQUlTjcL/JFnQpl+qBUpzUhcGRfSvWyTOT5obTsXv07cz1yw+FCVKYsdF0MHht73qntTjzOc0FLYV0R+47sTVXA5Cbr5MNhegHEd8VaInNyTJZAsM/Cy1RiJIPXIkwIZAQI9hHaBkiLWbjqjvcmbfMJHalfeI1LM66NcJW+fTdm6N9XInWEhnbhFPGXIOggurT1TWSHilOFn6yUOmpk3HspbsDtJU2VAFGI3Ob6eLds/VzvyjnVXM0H/ELXLr54M9h32qWC4r/rxsxQepWnLBzpv0A4YUKZkrLwDrQpANLkjH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by CH3PR11MB7675.namprd11.prod.outlook.com (2603:10b6:610:122::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 14:18:16 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 14:18:15 +0000
Date: Tue, 25 Aug 2026 10:18:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <dave@stgolabs.net>, <jic23@kernel.org>, <dave.jiang@intel.com>,
 <alison.schofield@intel.com>, <vishal.l.verma@intel.com>, <djbw@kernel.org>,
 <iweiny@kernel.org>, <ming.li@zohomail.com>, <bhelgaas@google.com>,
 <linux-cxl@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <lukas@wunner.de>, <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/2] PCI/AER: Export pcie_aer_is_native() to AER
 namespace
Message-ID: <ao2kIepOqKnJUgVq@intel.com>
References: <20260825054312.1319951-1-raag.jadav@intel.com>
 <20260825054312.1319951-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825054312.1319951-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|CH3PR11MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac4bca7-95bb-456a-9930-08df02b3b423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: TPubKbl6s/yHcgUOGzxYDaldUfdc2mT7qEE/X0tvN0GnIRM4BPRcTR0cz8+YiBUIXA/QdN3N/roTOZK4S4Ym4hdZoUPT+VoNzFmqtjrRbmErrhXeNjZP37lsxc/TGmCCRRH3TipThI+6Wlhk1C969WH+9AQ3UKANKSNKDBtCyn3zv2JwNOZH+RnQacnD13OYgPpIbetuaTVk2GmipdisCqtG2CFSD601K4YKz/6LOtpV5asclrjDFWSrmnOSsz7Og3rio5H8usq9pwTCNwIl7Or4CZU0q9chxfsZMgADIQLLHNyOf92uB+jYb00EkiEYtq7V0OvvHaIPsSGuYgB2SXe6IO14qLoz0lAXUMxDrUcq6K7y5RdUE8zObnZgKbK0JPgmpGE1BEXTQMIh1sOzC/iye84CjCwWcCtDMu3p7xTVj+GHGRAwo78QPycr/Xv0oONivOhWfSSUqLcBc7AEZIaksttTk2Z9ZPJFHYb7vL4LVEBX0u3IqOf3kOxluuyX0A2JjRNFpwfPzwJVnI75Sky4pOOyYl9xFsQgTmHE8C+Br0t8VyIzkRJshR0U++5z+pwcUbvBJ93XMCpGGQPAlj/IemkpxfxOEIvHOTaietnClOevJtxXewXqeoulGoUGRgUYrTSDnUT4XUQIwYELBiHQkOcENjqQt3DRcSjp7Zo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1FN3eiphPCdh1BQv0S1pRnGKqF9lwqO6XX5D3nUqwG4AW6NmEahX3DwVQtn?=
 =?us-ascii?Q?/VMoGTcNp5POkSJV8BLKq4nuuzyMOzMm5zhGNDfDc+U2nmEvxBsBj16CbVp7?=
 =?us-ascii?Q?xbPio0BT/7oGOojiVnVTueEtnb6LQFzb1SCp/Roqj3Yg0F7I9aXirb9o7xKO?=
 =?us-ascii?Q?tUoxJffFG5LHIk+K0buycntAqU3w+OYI+3UgET6AqT2mDkG0ZxAdk6s2qEBc?=
 =?us-ascii?Q?RAnrGkoxyKTbqpkJLrDbILNUQHqZtzmpW2n3N+i68ZXr9B5lfHRmm1QyHSA1?=
 =?us-ascii?Q?i14lUifxMh4T34ApcaacUzxA0MmGyEbTLjChGZOHPBQMMLrtUKzqqONLXpSs?=
 =?us-ascii?Q?cEukALI0Go5Ohh6Dekj8rm4QavTSdvhyExyJPHlZI0fSusSzI53gRd4X3Xv9?=
 =?us-ascii?Q?vPjOcRAlftcutxagkpNFBVnCKFOG/v3v8yunhevNuqcT6Lp8alAACnCL8dCE?=
 =?us-ascii?Q?DQyoEiGOg5O5VP7MJZPZ4yLvPUBeSBXZ3SIPsVlcxc4h+inJOSXn6U6x+dFc?=
 =?us-ascii?Q?Zfctuyg/ojQYQnJE/JNzA3O7RcCYy3bGPf5Gd2dQUFeNZnigpZAnh7LSEZi3?=
 =?us-ascii?Q?C5LkcM/1z17YnRzppxxNhb02+dA3/T72C6QCYSYWyUgyODdZggxtwE4B5c8X?=
 =?us-ascii?Q?QbaglyjSZo/pZxdYjFU73p8Szkn+JX2Rm9BlMCBo/LbRGwZJX8u3hVUKQLXg?=
 =?us-ascii?Q?a7e3gKJjK/Fmws5NIJHxEKogY37zxWliGmfqEL7nw9MzAGiZWrpGvB89HOux?=
 =?us-ascii?Q?sj72L0kRKbhnbGQ2qffZIWUiSdDBsDLzEhJHILNGKuVY2/TkaE95l9AMmpyA?=
 =?us-ascii?Q?C+jU1mOQt4cet5oJ1ZMVq0oE06GkkdNVusSrH6UN5LdYGdRvTDpS0vLhxgwe?=
 =?us-ascii?Q?0ePBNf8ZsY4r8xRt7fX5Bcmge0PcoYWVXriniX95Ynv+Okg/ha59fKO9YGpy?=
 =?us-ascii?Q?jbICN/WubPuOBOskR9DP8AQrd+7tEhhhWSmqZ2FP2tm8RIqCLZIdrHPJTN8N?=
 =?us-ascii?Q?7aLhvYHyOlc22DfBxYg40CbYu+EiMcAiYz49WsOkOgEib3fH8ZU95qPa/Avr?=
 =?us-ascii?Q?/1bAZzY5tTL4aNiOgurqRQKNI5dL+yjOErStOh/7YAOXdMT8+g/nC397TBha?=
 =?us-ascii?Q?Iyi2RShbR61IqS/XKJqicSifH60oqtdHEgPvjOWy8W1BkzFyvN6rASbk6cW/?=
 =?us-ascii?Q?v28jrgo0k1kHicLEhboezEnjc/bZZoJzE1rvKpd/fXRw498YAC4wPiKb68i+?=
 =?us-ascii?Q?2uZJW2BunQHLSQgX1lVJmpE5prGH0J5dIBmF10ln0azUyJJ38jJQPAvUVU1X?=
 =?us-ascii?Q?RtrbN6/veSMhUpEmQCgU4zW7b1zumrtiMpVbgg0/A4omgQ0kQnAvoCywvITN?=
 =?us-ascii?Q?fevHaaW74vlCQJ6asNf92LMYiYWmFwSomKEPf+p92CnJ6STIiCdLPD5yoSP0?=
 =?us-ascii?Q?YbORkIiSl11PWc4jIOOY16MXZPofYga/p/qDWyOCQ3eVUO+E3/YJcy3I3Wzh?=
 =?us-ascii?Q?z3/b0SX6DC7BCUq7ClA5Vj/upy7T+pntsiSIs8A3GM0mMlhq9/Rb5oWQ260j?=
 =?us-ascii?Q?jdSYQSSNpWJJeRS7+uz5rpUQZdqkaCw7g21700DUiR6Kxe0GkpEHMSpJjG5g?=
 =?us-ascii?Q?xHi7p7A3BAMJ2T3xW0aGhE3pBF8Ydt3PMyci3xtJRcUyUzbnAbrENUZ4iTpT?=
 =?us-ascii?Q?HdDq09SvyyI/1eC+icDEqs+6P5A29tTKW4AhlrhRkyDfq3heuo+DA8YPrKAn?=
 =?us-ascii?Q?1U2LEXPRAw=3D=3D?=
X-Exchange-RoutingPolicyChecked: f8vKbBev30qKatFH8FB4Zny5u1GwaF7bBT3167MZE+nkhKrprxy01MST3SHPo5MHfwi9Nw2CMsqNKAKGPAYmtvI83pLUSnxE90z/vno4SwI6BEBUKSTkKH1+5jbMRUfGOcZ/Smwi6WiT7/P3OrbMiAOmrvkXbVIkk4oSzk9ntK3wp0xmWe55+r8+gEJd4HSOrqRPHqtVaWi7IW8Ts4/EOY5WuywvwXTFsYLWv0JFZRpN/sd++rgq8vGijcEO6apWGohfK/Jm1WrQqn5zx2kOISDVXATHpp8pKqwqTuApaCzgxeCtf50h+ARR11s3KXJYaH2DCujkMM1ZnB40geayCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac4bca7-95bb-456a-9930-08df02b3b423
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:18:15.7271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzzXuBsVN67cy3MzGXecSSjcrNAUCB2N9uPa7K2uXNikXHAyMtPWWhF4osDjA96hJizdta1uGpemFzJEFQ0ABA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7675
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

On Tue, Aug 25, 2026 at 11:12:50AM +0530, Raag Jadav wrote:
> pcie_aer_is_native() was originally exported to CXL namespace in commit
> 49f776724e64 ("PCI/AER: Export pcie_aer_is_native()"). This is a bit
> misleading as the symbol or its underlying implementation does not reflect
> any distinguishable CXL functionality.
> 
> Change this and export pcie_aer_is_native() to AER namespace, which is
> cleaner and more suitable for its implementation.
> 
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/cxl/port.c     | 1 +
>  drivers/pci/pcie/aer.c | 2 +-

PCI and CXL folks, ack to get this through drm-next branches towards 7.4?
Or any of you wanting to pull this through your trees for 7.3-rc1?

Thanks,
Rodrigo.

btw:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
> index 99cf77b6b699..00f675163b3d 100644
> --- a/drivers/cxl/port.c
> +++ b/drivers/cxl/port.c
> @@ -340,5 +340,6 @@ module_exit(cxl_port_exit);
>  
>  MODULE_DESCRIPTION("CXL: Port enumeration and services");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("AER");
>  MODULE_IMPORT_NS("CXL");
>  MODULE_ALIAS_CXL(CXL_DEVICE_PORT);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index c4fd9c0b2a54..8660b18bac8b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -248,7 +248,7 @@ int pcie_aer_is_native(struct pci_dev *dev)
>  
>  	return pcie_ports_native || host->native_aer;
>  }
> -EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "CXL");
> +EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "AER");
>  
>  static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
>  {
> -- 
> 2.43.0
> 
