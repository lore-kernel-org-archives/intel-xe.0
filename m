Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F139C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 12:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587EE10E25A;
	Wed, 16 Jul 2025 12:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cS0GT+/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4B410E25A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752668088; x=1784204088;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ogi4zEGXYyaRkdetRhNRlL1rAQprqMUbXD4U8542GTs=;
 b=cS0GT+/7nHQGYL4EuojBraaKAFHeEeSMsZV3Ym9sGvLbDnmHHFFAdPDp
 Z7T6D6kCJ3gd7B9+Ee2ZDbwq+KVvoyWgtcXIADQEyiGILGKO7e3dgYEtu
 0H1sPEkhSmGKeRSUz5tn/YfSxpvDyU0dkIyBEo0T7/0IOFO1/+CjWo/2z
 TW1ZrXOjT5eG+28sK1BVYx5qRz2Fv4nxjyprQn+ZMs6HmMO7/da4shjB+
 9HCXRj1vmXeL0VMGhh4XI/qJBf3RcHBPBTnKjgEplQGZhmujnjfPeqR22
 T+aOLVH0dFwYrEfp24qTWrRjYYGICois0nsj/fVutt6KOA3jp6Tl6KUpq Q==;
X-CSE-ConnectionGUID: FoYvrfAoQFWKUbioEwljcw==
X-CSE-MsgGUID: emYrnTKdRr25cy6HDFW8Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54124390"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54124390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 05:14:47 -0700
X-CSE-ConnectionGUID: zPGJsUyjT2W9E+hgM13SJw==
X-CSE-MsgGUID: oeIdLUkqQieoX0raZ6D4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157584833"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 05:14:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 05:14:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 05:14:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.76) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 05:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b71w4pFSixoQhzSQa7eps9kx4uyBHRpfyC5KlwxjDFUc5l72jju6jr6QsQNo69nR9P9SFcUbe2ZDna6udgrCnrJWGtcy8PkE/WH0HoHWwsIjj0ZMJrg5HRGx/KpgQWMoWkP8R1lfwvutHAjyoX1/olEi1kDW6g/5+cyc4aYo06WDM/vB39UsSsNkr7KNSHH/acHqhoFTdEMUK6swRJ51Z4J8c5sRAePVYAL2NL8PXr9nsCO7Gf4XNhx+qK/lW3Fcz4SUl9Lfl0UtH2wlZPW2L5REeuZlLK9MEftI8scm7LD2u6hihQpYeTFJ6PiOhGgw/k7z/JHDmg7zdt+YUIJc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6ov89d75ZPiamO1+oY1HFRUFkBuExIXQavYLN+/NW4=;
 b=GAXXICbPbj4wjNx9RiYqG4VWElAjIw2nHo4FQWgo4MWuBkqUnCFbxGUjdgUwjUsBoe4TygdQc6pJZRPIl+A0S5LM8Ujt3DML5vatdPHDK2mPiuEjdIDW3z8HyIn/XV86+HqzYmSLZLkCrTFUbVLXrUYs4WcykMqTGnkpsSPssLcOWYGJ58Sz/KMyFVRsVM9jfpV/i1m4RuL9skFmAt2GEzuxoI5VF9HJfTrK3JYTCxaZ5k3HlBpkVfKuZu18pj4Y+cquzDC6RoggVmiOGJTCGghUdYjdqPyIppoj7GeJ1QKBo7KrUoh+o/upYtcyI4T9lS0VSoNKxdW5CNC2R/2/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 12:14:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 12:14:24 +0000
Date: Wed, 16 Jul 2025 14:14:20 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 3/9] drm/xe/vf: Pause submissions during RESFIX fixups
Message-ID: <ndypvnol2yyqnml5jmsvno55okuddmldemkgi4pi45yqx3amhk@pgtrq5mbhz24>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-4-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR0202CA0005.eurprd02.prod.outlook.com
 (2603:10a6:803:14::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c7b63c-cfde-4bae-fccf-08ddc4624d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG9QaXcydFpxOHg3elRZaEhST0NyUHV1TFVST2NEVy91VnAxcFpFK0VYVng3?=
 =?utf-8?B?MFZHMGMyOFdGUERKZCt5UUMxWW1lMlNvdm84Y1BqMy9kaC9DSWlpL2wrc1g4?=
 =?utf-8?B?ejNtS2dSd1BwajIweU56RFBhZjZTQlV2RC9MMXpCZS9UbU1teGI1MTl1VXdI?=
 =?utf-8?B?QmtFQ0x1NWhjbTZDNjY0TFl0dEdxWUxvVmpIckxVNjhRODBjZExMbW1nTndD?=
 =?utf-8?B?UUQwdS9lYXNSa3k3WnR5ZzdobGRQUXNiT1dUOHpRL2xZMjJObGhlUUc3MC9M?=
 =?utf-8?B?cTVGM3Y4eVh2TFdtUWtnT3lORXpRMDNncHpURVdYZm9Wdy9uaWdUS1JPU0tU?=
 =?utf-8?B?TTZDbFVkemJ3SU1vVE1jREJoRXNMdnJiQ1hySU9kUE00UGFSNnphTlFpU2lC?=
 =?utf-8?B?TzlnN2YvRW9iL0JMVWpneWNKdThTMmIxYVkzaWVmNTloQzhYMFpXTHBaaVJp?=
 =?utf-8?B?dDdwZk1ONTlWL2h5MmlYR1hDZ0dIUmNMYk5LYjBFZnJKNnkrWHNId3FuZWly?=
 =?utf-8?B?R3dkaVErdGVObEtTSXAxWFhFZWZvUWhCM1dRbk1STVlpQVVzcnFwOHZGUkJW?=
 =?utf-8?B?SERhVGt3bVhJSTI5Y3FyT3FzMlNGaGdEdEF3NHZmcEJjR2hTZXMwaDIwM3Uz?=
 =?utf-8?B?RGQ1U0xjUGVkby85WTJEQlg1SkVFa2Ura2tnSDJrTU1NWWNVejZOT0txMWFU?=
 =?utf-8?B?SDRSeUFvYVJOK0REM0dmSFhKak45SGVxOGRGT3A1TW9JU001NDhpWE9HUTg1?=
 =?utf-8?B?eDM3NVBadDV1eWtxbEpUMmlOVEJRNzd6dUFvamJVNWd0amZBWXZoTGt4UktZ?=
 =?utf-8?B?T3BMa1RDS01kdHFneWFmdUM5eTUzTmVMYlpqeW5BY2tkSVMvOEJuKyt3Qk44?=
 =?utf-8?B?dkswZGVRUjF3WXpYazZPR21hdXdMaXFJM0V6dU1xb0pJdThmM1RONVVkWU1t?=
 =?utf-8?B?NXdaV0xybU9SbldLWmQ4TDl5bFBpdFQ4aEduall5UkhNaVBEUUh1WkpPNzJ0?=
 =?utf-8?B?NjZGVnNmd0J6WTdIR1lGT2dpSUZsOW5FZDVidm02aXZIQXhGejNrYWUxUzRu?=
 =?utf-8?B?MU5iRjFQTmxmOUY2cXM2RXV3dHQ3OFg1WXNGSVV2b25nVlpmei9nY2ZCeG5y?=
 =?utf-8?B?SGJUdGZRM3MrNjkxMGczUUswelVRQjFZSWNoVDJsRmlYRHVFTVc3azc3dk9p?=
 =?utf-8?B?WENZZ0NKVXh5L1pueVdRWFNNblZucmNmN1NoY2hlT044c3FNekRjTmw5U0ZF?=
 =?utf-8?B?NXBLTlBXczEvOVFydkd5bW9iUVA4cHlxT0R0YmNpYXpGeTdhY28xQmNqUFI2?=
 =?utf-8?B?M1BQVjB6cEhETXBGZnJnZllScXJqQXk2WExPUE9tL0VHU3lhYU9lOWxrTXNv?=
 =?utf-8?B?cGxSWVJYNUprZHhEMWhVK1VVTnlDbzJ6VnRWUm5BRHNBTXRkejVzbG1NdkRR?=
 =?utf-8?B?dHdqeWxCUithL2Y3MFV2S21sUmxRZ1hpRjhTMmdHakVSeXVUbHRhL2Nkd3NY?=
 =?utf-8?B?dWNoVUxrRmJIb01uVFZoTVhBRjFUUDJmV1VOTHVJTE9DOE41Sml4UDk4R01j?=
 =?utf-8?B?UzZ3MkxVa0R2b3RqMmhaZ1R4b0FlcTczQ2JkWFF3QUg3VmtYYkZFZUwzTmpw?=
 =?utf-8?B?NkpKdEM0S3lnRnMwMmp6OEJnZ0tndVFESmtoTUlYdHNEdmV6Z082OXBRRW9P?=
 =?utf-8?B?MC9kNHRSeWNJN214ODFKTkdsREJPZ0lqUWptYnAzTitQV05ybDFQaUtIenQy?=
 =?utf-8?B?b0l2T3ZrWXloN2ZrTVBsMzlUc0ttWFE3dmUzNmdrTlJEQTUwRktOdmg0Q3dF?=
 =?utf-8?B?TTVDUExDUk5QdXVJUUxNb0lKMmJaeVIwejF0dlJMWTFqKzFQWVJ5RmFWUHZC?=
 =?utf-8?B?ZTZHWkRnelI3bDl2OGhUNlFXQjA5UnhNcm5ySnFqbnBrR2JRdmxBUHJTaWZJ?=
 =?utf-8?Q?E6GNBgJmgTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWpXRm0vUXpDam8rNFM3ajlMaUZsOGlvOXIwalVZT1BtQ29TdzJqZEhDalNY?=
 =?utf-8?B?dGpSQmxmTTZ6WDBkbVk2L2FVcEtoSjJKZ082TGJ0anNFK2t1Rk1VM1ZKbm1J?=
 =?utf-8?B?c2luUnFkellZK0JMUE83anNtNlRCeVQ4eDFHeUV5dVVlaW0zdXVKeU9RUDlK?=
 =?utf-8?B?N2lXcHJ5NzdudXJ4dHZMVjBac0ZKSVQrck0xY0NpNWFHNk9SM2JLaWp2RnN4?=
 =?utf-8?B?bjRuU0lCOHNzSHhBNnI1czBMU3pVbEszSjBRYTBFQytqNjRESi9RY0R4bWJm?=
 =?utf-8?B?czRORlE5emNDVklDQnZJSktIamw0ZzF4Y29pamwxSzhRd0hVSVEyM1pYUVNV?=
 =?utf-8?B?OGdsSTNITG1LY0Z1ZGV5UXBPeE40cjhmLzVTd2svNVNaRGMxaG5xdkZ0ZlRv?=
 =?utf-8?B?MU94dm5PeUl5V3JqN0p4ZDVzZ203anh4bnNhMW1JYWVQK3Q0QVNiNVcvRXdM?=
 =?utf-8?B?VmhGUUNDRUJNRTdpcXJJckxsRmNXWlcvYlZtRzlaakFYaDl5VStqQzFIeTR4?=
 =?utf-8?B?Tzg0Rldia2t1ck5OOG5uZXluWEdoLysxSlliTjJzVFlwNmlWT1dmRy9QWFJD?=
 =?utf-8?B?K0s2bGpxVUtEZ2srcE5qMDJTN0w0WG9rQm9HZWJQK0hXQmplU29WNjFlNEZL?=
 =?utf-8?B?cUFUbDB3bUlFeEQ0dXBvL0hGay9xbHk2WnBJNnRkSHNVKzJZaXZGMEhZU0kr?=
 =?utf-8?B?cTJ4L3lZZWY1eFluS1NBMWo0UGtNbXhDbnhFaUhtalFTdVh6clJIK3JOSFhR?=
 =?utf-8?B?ZVdHZ0JYTzU4NHVaVTY2VkJOM3p3S2tCMmdFaUp3NUpaZ3dFMGE3MUpLcVpR?=
 =?utf-8?B?TDJCcVFGTVhDWUN0S0VXM1MrSVJ6anI3WE93WktsME8yMGxLeUVPaWJkZFVV?=
 =?utf-8?B?akdkZWpvVzJlNzF3YWQzemJ5d2h4MGpHMVE1SktLdG1xWjNMazRHWFQyNHZP?=
 =?utf-8?B?aHRBSVlLKzlIdE5sajMwZzNBdzhwWjQ2SEM4YU1qNWxyRkNzTFhHdVh3YXNt?=
 =?utf-8?B?aDNwUG1RbURoMlJBL00xRTJpeEtNcXB6SGhGdnpQQkEzaFJxNTMvSFFhbzBu?=
 =?utf-8?B?MVdDWEtnNXkrVXI3UkNDSzI3c2xlVDV4aWFUdkx0M1BibC9zY3JvT3E0UXBy?=
 =?utf-8?B?RnBoeFo5QjhjSTJXeXFmQ2dZc202Rzh0Q3ZaTFBhTUZPTTh6dndneG1lc0Vv?=
 =?utf-8?B?a2JJZlRvSmpQbW95eERtUkVMcFF6UVZDdTFVTVEvMUZUZEtJUnhjMExZRWUv?=
 =?utf-8?B?b3I0M016ZWl3YW53TnBKZ21Nek8rSkxSNXFWUmVtZ0FpaVZDK2QzUkRGTVli?=
 =?utf-8?B?aXhnNHlvVjNuZDJ1U3NsMUlUNlpiK042NHRvWFBrM0dXMGpLV0RLRi9tQWwv?=
 =?utf-8?B?NmVqL1gxSzYzRGV4RFhZSGQvSitTUmZLZTFzeUtPZjdzVCsrSzNzMElkN25h?=
 =?utf-8?B?WmxVd3c1RXBVekppanlsVERpT3huNVZBclFTRWdFWG5EZmpQVWhIT2ZDNlp5?=
 =?utf-8?B?bFJUZ29jZU04c0tOT0dQNk9GaUkyZ3FSL01Mb29OR3lPTU9PSStMTS9PeDBh?=
 =?utf-8?B?T29NYmVseTloZ0p0RkpHVGlIMXFtZnRQaXRHbXZoZ0xhem90MGRuRkNUaldF?=
 =?utf-8?B?MmhzMlZDN1FaZHdGZDcvTjFjU3VVUjNkcEh6anBhRVA2eE1tWXcxeExWckM2?=
 =?utf-8?B?NTNsSjVNbXE1azRocm9YdWtpMUp2bC9ZSy9jZTBGVDMwRkU4YmdKYmxBZWQ0?=
 =?utf-8?B?ZXh2V3hHYmpxWVlTbkRFemlQQjlHeUJtVlV0Ukg2T2xvTjZHallna1kzRmVa?=
 =?utf-8?B?d01oWEY1Z3cvemtacnB4SkJOa3ZvVEgvWW5hMVI4dVg5YWtYMzhRT0U2VkFD?=
 =?utf-8?B?Tk43L3krM1h2WDlCdjBYYTNYZUhPYmxhcDV6VVRMU0Y2QUVBY2twMmtha3dl?=
 =?utf-8?B?aVR0RTJpcTVBd2NINFRRU2JJWUl6RFY5NGlWakhrUWowTHNLOUFiOTgzTFk3?=
 =?utf-8?B?Y0lHQjNhQ2NiQmwrZk9JeXREdnFGc1Jsd2pES3B1NUpxU3ZFV3ZERUkxMWRD?=
 =?utf-8?B?L0hlNEVSZ0FFVlhZLzNzUmNTTWwwUXNpZkxZa3BxWjJ0MVpyWE9EMEFZUHhG?=
 =?utf-8?B?eE15RklER2N6VHVnNXpydmdHYkt3R1ptSXVEckFzQkNGUjJVcXE2MSsxekpv?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c7b63c-cfde-4bae-fccf-08ddc4624d71
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 12:14:24.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cC6I++KbquuZdcDAL1HdsAkWQEg76+5kMu5N0+rJlIID+DkBpX/nGYP7wJ/pxF7+CCr8VWzfls0e1wjhLTLuuXEMydyBoZRl+JeR1JcTw/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
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

On Fri, Jul 04, 2025 at 11:02:22PM +0200, Tomasz Lis wrote:
> While applying post-migration fixups to VF, GuC will not respond
> to any commands. This means submissions have no way of finishing.
> 
> To avoid acquiring additional resources and then stalling
> on hardware access, pause the submission work. This will
> decrease the chance of depleting resources, and speed up
> the recovery.
> 
> v2: Commented xe_irq_resume() call
> v3: Typo fix
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>

Might be worth for someone on the scheduler side to also take a look at
this, but for what it's worth:

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 ++++++++
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c      | 46 +++++++++++++++++++++++++++
>  5 files changed, 97 insertions(+)
