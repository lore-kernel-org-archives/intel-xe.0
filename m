Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D8DC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 06:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C0E10E721;
	Thu, 12 Jun 2025 06:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yn2lxWsm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4E510E721
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 06:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749710967; x=1781246967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xXpPfMM/agt8QAV6jCb++SBu3Nfg5CQAil+Qr+96Lr8=;
 b=Yn2lxWsm6Onj49K/Ydq5zx6ZCKgQ3UULeI8Hbw9iSAvdvcRmFlmJpla4
 xfgJXqUwcOWFXz7hfT9rXpTL5gmfq+krbmUvNmW4CmwyilYeddkcedl+r
 mQ2qXlIkogGEYChpZu9EYuoNng2uvIB8fzS7TFK0OnQI6/H3OBXs8qR/o
 QLOQJR60eHTvsUn8amPhkGbSKbMAiorc5msygCyY05DwHbEzYnT/9dOK8
 wr8IYnlYhG+MZh4EkPcSSD6kNIAOnm+gcTxVFP4PGsK38+9+Cmp1A1YrA
 TWU0YW8OLZ9lgVgykRjX/yP4YLpCtjPTgFLN6OkElXOxZlxZcPcshoL+H Q==;
X-CSE-ConnectionGUID: fWLLJj8gSsOH1UUuHMytew==
X-CSE-MsgGUID: Sri3lrmOS9WguI3pAYhlbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51790666"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51790666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 23:49:26 -0700
X-CSE-ConnectionGUID: A5PLqGkwRQ2dQFoaS3s7Tw==
X-CSE-MsgGUID: ZDKqil3lRUWvXYRDkiOVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152581824"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 23:49:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:49:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 23:49:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR5YrOejAviat0GCAMSttogMd10RX0Ety+RFvGFF9LBcHJ7BI3iVbaD1zaPF4xx4+NlXccerRqltAESRqHIrniO0AIeynLq7Lhrh2AIm3aAXAhGrl+vN6UNxgXLBegUYajcSUvwhYpqVPuHekQF2dp6f7Iw/2UTbkoQ14DhCJmyBCTC7LWWj7UaRmEkDpowbYUwsXGew+xMp7xPIkqctE5P3KLjzCmLw+P8Ce8b0KEgfUM6JkK0pZd+Jwdp6/pkGcJlsv3KOnsH1f3f+fboNP+eiykP5vSF9qYvcnyj4WQpOinD1i6tbAtD+KbRat5zI+FzksQLF0gXMg2HTEIJOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFx3VlxvHfSBcwlQCGCn62CEHpaVFg54pu9q+55e/J4=;
 b=GyqkvvKx75ttcD/5q+FAwhX4kJUXjqW1qQgzVlX+CCQU04E2W7YV05WaEORZsbiBYdv9Mrw5W0jH9o1iaQDi8BT/uuVSXIqBpG/j9IAiCxEjYGMm1tNg/LmNwr/+dZeN+G3O06gkC/ljqawal/gRDbUykAJ+8ydDyIV28d1/f39un50B/mG2kNG3D4CYsaG+Us++srltobPakWtbCWRVs4EjGEiOyyGg36VhsWA1i0IFCmmPI9znzSG0WvZJeyCCMMWZ6UISqanEYk6BEBWxxLlzsbwm2Q/KfjoIZetMP0bEgkmy+ti1uzZELSS0a8l/Nk0eHEdXz9fPVagDVTm5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6322.namprd11.prod.outlook.com (2603:10b6:208:38a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Thu, 12 Jun
 2025 06:49:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 06:49:22 +0000
Date: Thu, 12 Jun 2025 01:49:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Message-ID: <yz6oqvqwsrbcdxsvsg6jep3zf4dul5623vtbu2atx6q54n545u@h24jgw3kvaf5>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
 <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
 <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
 <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
 <ckmq3cgq4onko4ls37uklvqd2gdzkj7noj36qiie23a77zem5d@xpxeo37h2s7f>
 <35db7636c14d554f596c25f7ff9f346f5e9a835c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35db7636c14d554f596c25f7ff9f346f5e9a835c.camel@intel.com>
X-ClientProxiedBy: CY5PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:930:5::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: ec44245b-1252-46ba-8ec1-08dda97d4323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uKvvjM6vrVEC4HZ+XrNl9kDjSpkp13CS5wCGDdTTzyNxpu3zlisnADtwJp?=
 =?iso-8859-1?Q?5XiNcshvoiKIrHIeU9+Z3weT8NTR7L59aQPSHTFNFjHLWNaHYTWezxKpzd?=
 =?iso-8859-1?Q?YwuSIf3090+upGresMrzqN9J+MZ27nPc/mrq484kHXaq2hMmqK91WYRl+S?=
 =?iso-8859-1?Q?QtLxObrH0JRUCwekvpSjjmR9/z+PQ0H5EzxFGkOsdRE9A5NKWRYdYbX+yZ?=
 =?iso-8859-1?Q?pbj85O917YP2a3wVkiTOIOriwO3CU+Lim3x1hoKQBv14NR9Xbj2U6k+VXv?=
 =?iso-8859-1?Q?buxwoOlZQtA+bWuzn7UOCjVvDVmYGF0cIBMyzDHFpFCJpKDaBDogyik3pu?=
 =?iso-8859-1?Q?Mur8kjoYbgGtOGOAeXnZIqB7Gk8eWtG0zgrkzSXuh9RYveTeU7AkHL+PuZ?=
 =?iso-8859-1?Q?q1717rOY+nEaQ5GeI3N275de7zjlEBBe432f27SgaK5j1J94B1pZ0wVRBA?=
 =?iso-8859-1?Q?KF6EN30iLdmWXwyiKQ8ehhnnq9v+S2IqZUrQK49rjLzQz8xqybqksL0402?=
 =?iso-8859-1?Q?y1xnogk2cDXGvr4FyVFmMhmc1oJT3ZpFU9SA6cOImtSubRmdS0ZgJFsXPV?=
 =?iso-8859-1?Q?raimouREcqfNR5blieMshmSZBoXnqPIbYmvA7Q7EnM1wJ01VdxtIdI5ItO?=
 =?iso-8859-1?Q?CLMhGAPeDmUSkjRuarahEzNrAWbd0RcSixnzn/kMiRwbxCIyTjLDh9bTYI?=
 =?iso-8859-1?Q?z4siowsnKyX5hBCZulDv1yaXqrm/ZazfHV2XMPOxrYO7UMaMOknRP7zIkh?=
 =?iso-8859-1?Q?7EISzyKbkbP3Su7s2GnIpBOiyqJ1Xk5nw7NatIpaJIdMterYy3P/nlhncc?=
 =?iso-8859-1?Q?fI8QiKQxhbEGwryHDkkbgO3ALF7OnNKtrCcfB4rwM/2LF2trzbd7ArA2Xs?=
 =?iso-8859-1?Q?SEBFJijItsgZf6p6ocKCkWaIbvEEK4GKNK5WR6BP5M4I476KGKEZzuZmVr?=
 =?iso-8859-1?Q?ksLu+Q0ErRHD3gu2Vr1J8aYzxuTvoB8rbozUU7T3B1rZKhvEGylwpR/9xk?=
 =?iso-8859-1?Q?P20tOYeCtMS8FRVoteu+ej7OHpwbAtsw0KbKkV/OpncZYiEamYox5e9RDY?=
 =?iso-8859-1?Q?Msxh6S+n5QfYd1MSq8mhtny7ZLU4+bW/bY/KMN0h6ISK2dQGQ55S6xADlO?=
 =?iso-8859-1?Q?B6h8dpAa3Hb+qBKZ0eiclYvtrEkTxCFtuxksM5Golpz7O5ov9Yb6nmfdnS?=
 =?iso-8859-1?Q?cX7yEO69xHXvxuB5HoJqdkExv8WPK706hi5ubW3iTN1HrkB0Kg83X/ExXh?=
 =?iso-8859-1?Q?Z2wFjQu9wh3vi2XevhKSSbWG0jtTKOKRotd84MKarUu3pEZ/DHIaZm8qsb?=
 =?iso-8859-1?Q?xTDU+upm8xJ5NpzzutlvMC+jB7Hu3+7FqcuLWOBFq72GreDFcT1cRdzqT2?=
 =?iso-8859-1?Q?I9zmaM2fqcFEiQEKn6T5O9kewLLpVwljoGip+BvABHXe5bEhCluqD0P9tv?=
 =?iso-8859-1?Q?YewF0LlXp1iMOzEUf9+bxj3e6P5N1rc/GeXVjhsoc9iyHcFhzRo95MO+LY?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YXwQO3xCT1jNrII9ZZ9jYT/Xc+8zwZ4YK1GeCb3HSMku0fMAsZBtWAKlz6?=
 =?iso-8859-1?Q?4ed4Lrd/ilH1pp2hfk9yPpSx0sLH1jLEAZK2rWroy6VyC10X3woDgIKHTd?=
 =?iso-8859-1?Q?+LHc9/AiKzEAgiX7eb4zx+C2QFYCx7oOudPgRmuK82mbzqZ0/+OhWhL7bO?=
 =?iso-8859-1?Q?Op5RnOxCrUgTmRjrhj2OrCVPXHKrAohaKiKkf85xO3iH5gFfwQF9DKRlMS?=
 =?iso-8859-1?Q?OkaW0bknzQbFJhkRtw1tmfrsAmAXAOlVLBztAq8nwpCluD6LcGxDcFPBNt?=
 =?iso-8859-1?Q?7hj7yK3jSNgaCOAzle3Vlvd0NM6+kRVDlDIeo71ojPmyH0+pWP1L8q7UKT?=
 =?iso-8859-1?Q?hcoVSJXJw84+LVNWE5CQJBcrkXGjWGYBMLJY83LYSNC5ORDcAYdjMcD59W?=
 =?iso-8859-1?Q?FCr6SxP8fah38H8Y4CDm8fI8FuruKq81fpzj8VJE2nc9bklWVHouXjK6rj?=
 =?iso-8859-1?Q?WyoeU3AtEKpCb2jh1ZWXLNz4o1DRwToRvnkxBanhNIrZqsj/5qRuz9a7w2?=
 =?iso-8859-1?Q?Nt5xGrhkd2MF5ZLF7li+dEVVEFPRgebhVWlKcYhTUTQ6AjgkFsEl4J9JdB?=
 =?iso-8859-1?Q?1GbM9CgOQSKPEM2L6f8xrr7bqJVb1IiFvqC8Lw7thtaoylAxex4PBZ6c1a?=
 =?iso-8859-1?Q?NEQMLT9t/rbVEGx4Hq0vamtjZVW4VigJf/LRpS0X1N/Aulsc0hDW4awxLl?=
 =?iso-8859-1?Q?Gc3QFA2J4+RSTXNfRN0uGb2BFQzF4duEAo/C/+nhelNxSqKfgCQUT10mps?=
 =?iso-8859-1?Q?enWM2aZd4vx1QiPWQ5HxV4OIFbwc9pRuAQWHIB40Vy3CLj/+/qoH/IfeB/?=
 =?iso-8859-1?Q?h0+bNPPcwIBbUhDG3WxYoJxgQOxT0JYsUyl164/1v1h/VeXZb1bTOcv9ek?=
 =?iso-8859-1?Q?RZ4GDJ7EQ7UfaOk5JFTKmpwQtq5pbJrnMHZ0dBoJDGzzuHzZKSSIPyTaPt?=
 =?iso-8859-1?Q?fxP4C96FjH6oShh0vtLJf0LAw+P6nAycUP5O+6x73u+ED9QCT7QZfOCVtg?=
 =?iso-8859-1?Q?l1ZSwrFYlc8xmgQZ7UUOmA2iRy11GynDw2OqkD4lLpL1nf26lHPkgsu/6u?=
 =?iso-8859-1?Q?YXqSSp6BT9loDrurA5vxIGD2GHiwZwylPMI1VbLud1p1Y/z3WYGgd2Kj9Q?=
 =?iso-8859-1?Q?kvkNjQlk8D65/emJJhOy8wtcMBzSxS0jiU1Vg8MEtODz8Lt/1cic418Bsr?=
 =?iso-8859-1?Q?NOsF5tALL1xTEtw9Fw3LcMDasDO/DQIdhVN7nRQlrL1igKKT7MMRlLPB6F?=
 =?iso-8859-1?Q?Ukh10gNneJ/gRDHlXp/ttkVjh/w2jdZ23bUO0Vu7OBWN8pRDpARuDAOACx?=
 =?iso-8859-1?Q?gZ0adF3XupN4rgnwLSrottDOX227EWZNoDibHzKRk3RErkWdSf9Pyf4azC?=
 =?iso-8859-1?Q?njivnd2L6kV8m+bZoXNRtWh4weP8n1IRuPcyglGwa8E37irKG7NYci6clD?=
 =?iso-8859-1?Q?Q85a6os9o3GHBpUvhfDqgZnix916hp+9thAqWFIJwKtGmDJSi7RjnTGuCl?=
 =?iso-8859-1?Q?IeAdm0DNARRer3NZ/IyMy5KnwA0f4Dmt1dxCx9ILMXaS84PmWE8kruxK9M?=
 =?iso-8859-1?Q?Qrp+UZyJGVY0ltd/uahtTj9hE+ja8EMIFumcShWalfbwTH01D+SCNEnX6n?=
 =?iso-8859-1?Q?i4gzgm1N/iD/9CnuSKG1g5MkRPQQbZDsLseWNcF/8HqMxRU0DAUP+Sdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec44245b-1252-46ba-8ec1-08dda97d4323
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 06:49:22.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+C1p0hTf7upeSBANSEixU/0BLKHkRfcUbIdKQkPNPATmNSuO4p8KErAyJ0dPpnfwBQMF1OXJobsfmnBuh/b6a4LlNDVjwtu/Ye5kIKcf3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6322
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

On Wed, Jun 11, 2025 at 11:31:35PM +0000, Stuart Summers wrote:
>On Wed, 2025-06-11 at 18:02 -0500, Lucas De Marchi wrote:
>> On Fri, Jun 06, 2025 at 07:09:39PM -0500, Lucas De Marchi wrote:
>> > On Wed, Jun 04, 2025 at 12:06:52AM +0000, Stuart Summers wrote:
>> > > On Tue, 2025-06-03 at 13:31 -0700, Belgaumkar, Vinay wrote:
>> > > >
>> > > > On 6/3/2025 12:31 PM, Summers, Stuart wrote:
>> > > > > On Tue, 2025-06-03 at 11:41 -0700, Belgaumkar, Vinay wrote:
>> > > > > > On 6/3/2025 10:36 AM, Summers, Stuart wrote:
>> > > > > > > On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar
>> > > > > > > wrote:
>> > > > > > > > Set GT min frequency to 1200Mhz once driver load is
>> > > > > > > > complete.
>> > > > > > > >
>> > > > > > > > v2: Review comments (Rodrigo)
>> > > > > > > > v3: Apply Wa earlier so user_req_min is not clobbered.
>> > > > > > > >
>> > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > > > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > > > > > Signed-off-by: Vinay Belgaumkar
>> > > > > > > > <vinay.belgaumkar@intel.com>
>> > > > > > > > ---
>> > > > > > > >    drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
>> > > > > > > >    drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>> > > > > > > >    2 files changed, 6 insertions(+)
>> > > > > > > >
>> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > > > > b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > > > > index 18c623992035..cb0563494fcc 100644
>> > > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > > > > > > @@ -51,6 +51,7 @@
>> > > > > > > >   
>> > > > > > > >    #define LNL_MERT_FREQ_CAP      800
>> > > > > > > >    #define BMG_MERT_FREQ_CAP      2133
>> > > > > > > > +#define BMG_MIN_FREQ           1200
>> > > > > > > >   
>> > > > > > > >    #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but
>> > > > > > > > no
>> > > > > > > > need for
>> > > > > > > > precision */
>> > > > > > > >    #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be
>> > > > > > > > used
>> > > > > > > > only
>> > > > > > > > at
>> > > > > > > > pc_start */
>> > > > > > > > @@ -843,6 +844,9 @@ static int
>> > > > > > > > pc_adjust_freq_bounds(struct
>> > > > > > > > xe_guc_pc
>> > > > > > > > *pc)
>> > > > > > > >           if (pc_get_min_freq(pc) > pc->rp0_freq)
>> > > > > > > >                   ret = pc_set_min_freq(pc, pc-
>> > > > > > > > >rp0_freq);
>> > > > > > > >   
>> > > > > > > > +       if (XE_WA(pc_to_gt(pc), 14022085890))
>> > > > > > > > +               ret = pc_set_min_freq(pc,
>> > > > > > > > max(BMG_MIN_FREQ,
>> > > > > > > > pc_get_min_freq(pc)));
>> > > > > > > Do we want this above the get_min_freq() call above?
>> > > > > > > Seems like
>> > > > > > > that
>> > > > > > > would further limit which is what we'd want in that case
>> > > > > > > right?
>> > > > > > No, this is during SLPC init, we don't need to read the min
>> > > > > > freq
>> > > > > > at
>> > > > > > this
>> > > > > > point. We will adjust it later in the flow if there was a
>> > > > > > user
>> > > > > > request.
>> > > >
>> > > > This ensures min frequency is set to 1200. That is required by
>> > > > the
>> > > > WA.
>> > > > If there was no previous user request (like before a GT reset),
>> > > > the
>> > > > min
>> > > > will be set to 1200 instead of the usual RPe (which is around
>> > > > 500).
>> > >
>> > > Ok makes sense to me. I did confirm the workaround frequency
>> > > called out
>> > > in bspec matches here:
>> > > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>> >
>> > but why do we do 2 rmw instead of 1? Something like this
>> >
>> >         u32 min_freq;
>> >         ...
>> >
>> >         /*
>> >          * Same thing happens for Server platforms where min is
>> > listed as
>> >          * RPMax
>> >          */
>> >         min_freq = min(pc_get_min_freq(pc), pc->rp0_freq);
>> >
>> >         /* But shouldn't go to less than BMG_MIN_FREQ on affected
>> > platforms */
>> >         if (XE_WA(pc_to_gt(pc), 14022085890))
>> >                 min_freq = max(BMG_MIN_FREQ, min_freq);
>> >
>> >         ret = pc_set_min_freq(pc, min_freq);
>>
>> humn... but that would mean we would always have a call to
>> pc_set_min_freq(), even if not needed, i.e.
>> pc_get_min_freq() <= pc->rp0_freq and for platforms affected by
>> 14022085890, pc_get_min_freq() >= BMG_MIN_FREQ.
>>
>> still trying to figure out one thing though: in BMG this will apply
>> only
>> to the main gt. media gt will not set it and since pc is per gt, it's
>> not the correct thing to do.
>>
>> Matt Roper, what about add the diff below?  Untested, will do later
>> today.
>>
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > index 3861e947387fd..04e112c751096 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > @@ -818,6 +818,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>> >  
>> >  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> >  {
>> > +       struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
>> >         int ret;
>> >  
>> >         lockdep_assert_held(&pc->freq_lock);
>> > @@ -844,7 +845,7 @@ static int pc_adjust_freq_bounds(struct
>> > xe_guc_pc *pc)
>> >         if (pc_get_min_freq(pc) > pc->rp0_freq)
>> >                 ret = pc_set_min_freq(pc, pc->rp0_freq);
>> >  
>> > -       if (XE_WA(pc_to_gt(pc), 14022085890))
>> > +       if (XE_WA(tile->primary_gt, 14022085890))
>
>I didn't see anything in bspec that explicitly called out media vs non-
>media. Where are you getting that here?

Because there isn't.... the issue is in the soc and not really tied to
the gt. We are using a OOB WA tied to GRAPHICS_VERSION(2001) because we
don't have a way to tie it to the soc. However that means it doesn't
apply to the media gt in BMG since there's only media.

One alternative I thought was to tie it to the platform. However there
are skus of the same platform that don't need this WA. So... for now
I think we can check for "is this workaround needed" in the primary_gt
and then enable in all GTs.

with this patch alone:

	# tail /sys/bus/pci/devices/0000\:03\:00.0/tile0/gt*/freq0/{min,cur}*
	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt0/freq0/min_freq <==
	1200

	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt1/freq0/min_freq <==
	400

	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt0/freq0/cur_freq <==
	1200

	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt1/freq0/cur_freq <==
	400

And now with the fix proposed:

	# tail /sys/bus/pci/devices/0000\:03\:00.0/tile0/gt*/freq0/{min,cur}*
	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt0/freq0/min_freq <==
	1200

	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt1/freq0/min_freq <==
	1200

	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt0/freq0/cur_freq <==
	1200

	==> /sys/bus/pci/devices/0000:03:00.0/tile0/gt1/freq0/cur_freq <==
	1200

I think Matt Atwood is working on allowing OOB WA to be per-soc too, so
this may be coming soon. Leaving the comment in the rules file will be
good.

Let me send this patch with additional changes for a CI check.

Lucas De Marchi
