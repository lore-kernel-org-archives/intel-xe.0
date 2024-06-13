Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61FAC27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 20:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611F010E15A;
	Thu, 13 Jun 2024 20:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIvDLEf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDFE10E15A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718311066; x=1749847066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=89YU1ddNWAoBEFRxOipREYoVWLKGe3/BWy7cvO8Bh7c=;
 b=AIvDLEf86qKiHMM90qr+QQ1PoqnvZDBFEBE72PHE+HKnwjui/fpR3mtu
 2Opi52mCAb0YqraZtpy92VAAn40cWwwMcpZOBK2O5jHk5qnEfdIgDf9KF
 eesHWh61E687wefgWFcUyj9icq+pLmJ+7wIDI+JPUvrDqpU/e0o8B7lMs
 Dlyw4UjSNi0ZvEwUwgyno9zwMAfjUbjkADS1FFwpOWJLg2AfXRlUQa6MH
 QESw68fMT7119ESl565l2Z23xoOjRB5wDszW5xwxiPUrafeRxHvZ2i35U
 sx0nB1n3YyiKnNRgWTvgT9gxm7YnrUjnr/xPKwqlcgoS8QMp2uJcEwoeF Q==;
X-CSE-ConnectionGUID: qu8y6qi0SOmRhi84YkjnqA==
X-CSE-MsgGUID: F2PXwNnyTh+6zVTon+VwTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12061522"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="12061522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 13:37:45 -0700
X-CSE-ConnectionGUID: b2HWIsSZR32Zne70EGWx1g==
X-CSE-MsgGUID: 0uwVuXngQV+ahlC/0PhZyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="71062881"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 13:37:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 13:37:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 13:37:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 13:37:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 13:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2nOULRyDGJcy2SAk1DDy2zVmH0s+h2ykmiKvUrkh1p1jRwSorowCdIGUh61mxRtZDiCj/ARJCivyxFqxDLJzUgV8sqZt0nFpR9A2Iuo8jiYQOsvA4nV3TeaAcggwIDvaIkjmHEkUxFDyFT1KXpzQD877dHb2e+YMJ3RYEQaTh/rnHy8DhwGzUrV5i5J5UqpdKj5WsUGxRyHVwUzwX/2E9CK8gCKUpIA9Sy2uZiiIsivz+hg8RznP0SIzWyRdWsIK5vYFaRzt2s8dZyE0Huj+AroC/oPKuMY54sTeMupsoraRyWGHsNWstKvbSVTsEdxyXtSXANQbOIb/spJOSdYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89YU1ddNWAoBEFRxOipREYoVWLKGe3/BWy7cvO8Bh7c=;
 b=a0JUDwg1k+pgdiVHf2qdfWim2vbC6OYk+UYhnerRwRBPw8l71kOxSe1CDSOIdhWen2V0UC408gX+RsrSvRw8+ER+gtmjgih7Z54mbNuGksXl42ZedrabTsnrCB7pCZEM+RFDfZY9sUzOa7IXNinIfZEK/Q7Vg379JtovKjL4F/57iXAQ4fstakpq2L2sBsoJknKToeKK0q9NGtRD/iTHDwxiMF7vSjqF6Hm2HM9FOqpp3JtYHWzassRfTUBkco7f2Zf+kpIh9Juh6UQVdmRFDNLT0nuvPJuL+KNAlb2TPD91QD5TwTYtiWrt4EpOa5jeuDD40F9DK/IBCz/FaPWrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 20:37:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 20:37:42 +0000
Date: Thu, 13 Jun 2024 15:37:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop duplicated declaration
Message-ID: <han7vc6ejwvxupfppvsb3o2bcmxrz7ptdocgmccaztiwfndy22@3fv2xjrnvals>
References: <20240613195702.2164-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240613195702.2164-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2e44c8-ef02-4cf8-bb1c-08dc8be8ac75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ECVXrI5ILm9jVKWpEDYdzcakeqiXF3ACltw0VExAuJsnZ+fD6WDa2/7UOxTm?=
 =?us-ascii?Q?VvhSMsll4QCPWvQmNxgZ8zjNLS8QWj4FMnpU7pvzwRWO4LJQ+1Wm8CkonhTs?=
 =?us-ascii?Q?LjMZ9cSBqkRSgk2RFCEcBhFb7kbxWGuV+5MA9rTDez0+W2zSvlMuX+LL09ia?=
 =?us-ascii?Q?pWkCUOftT9jGBQgvreChkhd0n8zyF922P8BL8Fu1G+EvM6NnILlBEnjJVwJv?=
 =?us-ascii?Q?UoQTXtzI2I605sczNHyVIhK8vuY17LTXsERaF29Lv/WWRaomdLaZmh9jODSY?=
 =?us-ascii?Q?oCsLl7te+oUVYurKC0OSK8BLxEzMRc+1gNRUQS0QQk/ri4WKt0stixDry5E0?=
 =?us-ascii?Q?iGYVav4vt8JPm80LxY//GjmMVliNRiZv7mUF8ljd+CeF7l07vZD+cu5NzibK?=
 =?us-ascii?Q?NZ/pTyCGZzDr6RMPXo79a451q37yNOiGX4d9GhB0721cZLPzjk7YYV5BJ6Wf?=
 =?us-ascii?Q?DdrDvYHPz8st5CtTjeGUhdqwkDTRnZr8AeAQFnV13/WYMPt7+ikcjOLPhTnr?=
 =?us-ascii?Q?M89iCgY4NYwtUCzFIjW9yRsCrcGYOF29CEUKPODIJhbeIAjSLIeT9qVfoPdn?=
 =?us-ascii?Q?rXhK+F5f1sgtQSNrVczRbT+g2TAX55wZt0NcxalRFelswpCxKpEYm4uu6EUC?=
 =?us-ascii?Q?DXfXS8c/GJHLrWSrULOKkykYcgAD+64oopI6CYPQt/nszEKhfIqqCiPeaSjE?=
 =?us-ascii?Q?YqTl5n5SV6y3rJS/cYgdxmLJ4yQipxviY3PD2I9UhLEY83chMpQ9HOwMkj08?=
 =?us-ascii?Q?X7Q4I/Fq4KeAnWyhxihBMaiTPe6bEkEFFs2wS59A4P1/YzVUOdvs/szYskqB?=
 =?us-ascii?Q?tk/nF/dhCBw6pHp/XGlpGK0sfb0DT7ePgHhIgivN9nXhOfN4TswKNNUQYH0K?=
 =?us-ascii?Q?X9AYx7MCgSF3zg9OdLLa0cHW7p5b0JBSx/smCxE5p33NUXAvJyBbxS7U8Qu1?=
 =?us-ascii?Q?iM0Ok4zn/jtdHVClpk/BvDiGbp96nDi/EOSMU5HJOUf7FDfslCukq4Pjoxu+?=
 =?us-ascii?Q?8toBDWpV8rYDbof8JHs0DtP4TfGGgWl/BJJ/2q+mNzgxJKA6F6XEMBwjm/2/?=
 =?us-ascii?Q?GyIbR+WDsQHRDF8RLOxd1R8LlcE9uX4fHmenxEdPo0RaMa0ysMmMTIBbvtz1?=
 =?us-ascii?Q?xWKIwSSzuitMe8Fyi0KKFPx5uDDO/HbrEgEfuWY7GpSNLpXCFcmuv8vrHkBT?=
 =?us-ascii?Q?vWSKbfI6Kk2KbS/ctZU3VSerR8agmvmiu8pcRnq6hK/A8GKPLfipBrdckSCK?=
 =?us-ascii?Q?j+PG0ZlFacEgowBdpc/AVJadJ0weaeF9wBInkx69ExRaoqPsyHD55huGXncy?=
 =?us-ascii?Q?Dsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3bWrIeUqQI0Nc8jsCS6WuBWeW1fuiUfif+nFDYOr+pgiICKEcv6RMC1N+WYm?=
 =?us-ascii?Q?tlM23f8B/4+kmRnhxNzD3SSd+molWwK2pnOqrjk4P5r9KARnWab4t23WWS1t?=
 =?us-ascii?Q?n3F+Y7dDwpAqFGvrmrBqF5vTLLyuevXeDXcYy0Bh5iWNzIiFaAo/Qxq/5cwP?=
 =?us-ascii?Q?bjHDaAgy2bzzz/DOQcKpZGmeS2MdA9A02tnrTAjmIj9IJHPExmNfjkLFIixw?=
 =?us-ascii?Q?omXrXxccZlA6P072EiqRlkjmJceVr1+vZHPwLuoBADqDvC+MGZGAFPE/yc9I?=
 =?us-ascii?Q?XvywMop61H86B8BD13lc5AHZ086gBzXx78H5XFP7Hs2JEIwzWm1BYs88mw67?=
 =?us-ascii?Q?uohoqB1b10VTZ4tAmMo4GE8CUomsIVcuokPQQq1KedIe/lMIHAD0pfX+zWKo?=
 =?us-ascii?Q?QILcx7CHVN9t3+1o+z+MtR0pklOzwsn8zZWarZwHS9zvB5AE99G2qMQ2PtlK?=
 =?us-ascii?Q?yLuG28r4n+NH6NwgzWH7XKuUcHkG6T1PnVh+h52BDNtjQQQghlvt7kAnyrqJ?=
 =?us-ascii?Q?hdJj9Rl9THeEltra2hs2pa4CltVKBv0NcVDhIn7Bwm5mxzqPPCbNAgLFcaHL?=
 =?us-ascii?Q?4aRy0DIoa+bJbDkmgw7aMBroTCumt1Zz7viaK479cIRd1M44fl3bNMWT3mdn?=
 =?us-ascii?Q?CpiAsCzksf/aH1BEW4cyx+4IdJSWAMdqSDqDaiLtU/ddJ1xnlyTW6s+Fp42y?=
 =?us-ascii?Q?NwlaLu/sS/KF/YoY9TfSsVMrVRVxNpWdtttzX7DBuf5pfWRSdR7ERoCcFy+6?=
 =?us-ascii?Q?nKPAXgBYtKEhnDEQAMBHZwapqWzN5stz8+OFKMHbo4tRRA48nTH+gHtu+duL?=
 =?us-ascii?Q?XJLGtxM9q56egC2MJTJ30T72VPHEjsWjNf3NecIrShxg+Xenl3c0WmaUl0Ln?=
 =?us-ascii?Q?PJDkOWm2Mi0QYLDBVGOofrxG3992UfBuwG92YwjeE4vpG2Guq55lvJVIEJJf?=
 =?us-ascii?Q?EfCHKzwFUFI7AzdkGXsIo8Qob9iMcLwmCPrY1OpHC328Yo0EYzGwBow/76lA?=
 =?us-ascii?Q?FKOAdqb53/cX5ypb36kL5xpuQA4o337P3blSeNi/jRd2usyscGPWQqrrubop?=
 =?us-ascii?Q?N4ihDrlIVYL8OiA8OsT+HhuQJHNLfWJWgeT91fkAK9kD5+B3TlbLagru7SPl?=
 =?us-ascii?Q?noXqS9GCWATYnMwCNcX+zlJFwCsKwAHD+/Q84iWDQpHK5TfHPdpnvrFCx2Z2?=
 =?us-ascii?Q?SZQSo9kHKuVU2Ft2EPGLLUGYGlXopvnQPQhrmRWZ62KVtX0ZQXdfbB1upN8q?=
 =?us-ascii?Q?HrdYmsmeI3TNMjMfjJ5B8EDegeHufx7DQqOEYcbv8NCUcmM3BltG13gbZu2Y?=
 =?us-ascii?Q?JVaYyafwXVO1IfFDSdYmmxxvfi5RLf6g44/vuRW4DeUfTshoNCznx7WjrF7T?=
 =?us-ascii?Q?Am+LX5pYt3JOIEjB3l/QHD9/XfqQMBSTxL/ATB0Cqx9XiK9hnzYxX1wCGPQ+?=
 =?us-ascii?Q?KdY/FGyn05ihOEZEVFXIHrFzV9fnXHUJJWZvTWTyjxe6nP9fum9kLULuuV1I?=
 =?us-ascii?Q?PSp/DhuIbdGGMMcTiDMIR1biLRziGcG1UA1INp3ugwQc72TbM8nyfJ1zQRSD?=
 =?us-ascii?Q?67LtaQSe0RI7IpBMJmYcmYvBP59lRGLDShKGI3kYlt5Rn5QTzdJ06of4CjvD?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2e44c8-ef02-4cf8-bb1c-08dc8be8ac75
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 20:37:42.3369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THWn8+QbFcfnPvGpEoXLJWDR4Bq7zKMw4gtwlGeVOVOF6esrFT22Sju+pCWjskHNZ7Zg8Oa70gEFDQP2xIcFmJPdcuNM+TQNZWZZYFMoJ7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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

On Thu, Jun 13, 2024 at 09:57:02PM GMT, Michal Wajdeczko wrote:
>The declaration of xe_reg_whitelist_process_engine() function does
>not fit into "xe_wa.h" and is already a duplicate.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
