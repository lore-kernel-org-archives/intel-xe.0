Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B90AD2FEF4
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 23:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086B510E168;
	Tue, 27 Jan 2026 23:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWw6op5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681A310E168
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 23:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769557373; x=1801093373;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HrneZXSvpOLgWTbGc2HVdhzBW3UcrJ2B02BiLhLlnIU=;
 b=iWw6op5wco79sXvQXdfkWnQbLK3+UOdHr7LvaXCeJuzfksTbQNnWFUMm
 e0M50ln6AXDxsTl8+diPyIKKK3u+XaTbDfckToshBDy+IwXgggKVkgbCR
 g5rvxBDcM4uGCQhnZXpSspps2JVjqfPYO1SKsMclLSEMX6UQAZmcuVHIb
 825TWxDsFE0PWOn5yLy/Njm13+4gbhkIwZAxXTEBJB5WsXzWct8hHXbFb
 REsG80cejxyRpm/0znvk/Jy7XJSOhIpUU9vZCasRH72+R+z9ortxl72J1
 GRXGVvY2wHessoC6KJCOV7RpO+s4HRtjxprnLcWeIrOhvfduUB01b1Jm/ w==;
X-CSE-ConnectionGUID: pYt5YRk8TMO4OD5M4oA4Cg==
X-CSE-MsgGUID: +3vFoMj2TYCwg3Kj6FvMxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82194773"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="82194773"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:42:53 -0800
X-CSE-ConnectionGUID: XdghZTHMSbWVaxO73bbMBg==
X-CSE-MsgGUID: Wswc8DoUTT2D2Y/GhBayhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212576627"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:42:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:42:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 15:42:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:42:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1mLRe7Oxs16ZmmYLOQnBNGFNzHjnOXrXO3IjFeTUmpga6O4zYpEK6POtdnRsx84yZnNQdGJWJ9RfDIKMjhIaDAdpUk6XNIMLkSwK/vJ751vH+bznCFKH+TqA5ooTHWdP/lZDfvB8pmuEGu9V9/2jkhzpy5M/BMl3q3MpbDjYrigHowNefveOewvze0725faw7HYFiFdhjnHUL+WUspQTmcXZrfgtQIU7jz8422RjZfqQyixlANTwx5JUxG4yD/wtIYcNEkJgP7/XCD43NRS6yygxdrPvcKdeP1yOL47vmlcutrw4jdKN3KsbPP5OCEkN4bV7X81uuc/RZdLYBoS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajUUbwfe+b18Aa7phsxRS2Va8YGyD2q4cgcz82liG2c=;
 b=klPDRza/fyehaRGJc5WjPaSWyjRxpkwHRVEGv9tn6hZUZEkBel+CwkBq4/EE+xcUDsrv7P31c4aaagW1uogddG8eQvISc11nvsZtN9zVu8DfIsbBhgkymVoFBKnI7v4OFPCR8j/o5ErTSZnVUE37By9FtzsVpktB16OkYfBsNU5yxzzF647fn2n5PWvNUK9GjqzaEMqcKsvxB9nCL6NP4LDrCGTqNyCAwxZogZTfFjil5ozKrJqoA6wX8Hx40EfSfwHWaDjmhrp1VWNP3xOuF6SeU4orcW6uh88R/OAWAJL+G7DDw6XBqFaYbkhNaqDqI2t9sp7BpQ7i75NO7enyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 23:42:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 23:42:49 +0000
Date: Tue, 27 Jan 2026 15:42:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe/sysctrl: Add System Controller register
 definitions
Message-ID: <20260127234246.GC2174980@mdroper-desk1.amr.corp.intel.com>
References: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
 <20260127105347.2651751-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127105347.2651751-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f57bf7-48de-4e29-ecfd-08de5dfdc7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GXqXDp5CGAo2KZwAlrjxD2ug7HhMKFhNeAsrfGER9zxx1MwrPbxs/VukTO?=
 =?iso-8859-1?Q?sfNv7DHvG5F1aHPWkT8GGaBu8Eo8/bEnj4VMdHTIf/7y2M7mrH//V+zngm?=
 =?iso-8859-1?Q?2t+vDFvF42VSkSBUWugHgbS3IvNPTwJe6DWzGmq0coBSgW5g9sPupLRNv2?=
 =?iso-8859-1?Q?E6Kim5jqOCtWA8NZNK3dRIPTOmzqMgOi9XFiRedYroYfQrkVC1j6Gbkt0r?=
 =?iso-8859-1?Q?lvhjctxefMPpeTJRnaWuX3Z3YHTmOIfuGqTC9h0hkMXXiRAndW/6+Rakbr?=
 =?iso-8859-1?Q?61TWfK2hRwKXasBBeqCeE5t71OEcCbzIbJThBOf9OsgcHVfYBMelPNvYt1?=
 =?iso-8859-1?Q?8tC0bMynWLIpAMM0OTK+lVwFPwj8TJS9Mziq/u7PPdygE1YX/SfUJQqeaM?=
 =?iso-8859-1?Q?L9B9wtt41P2PFWeGYkg2edgpSkN5cz+SzYlpdZmJ81REbPDLy5fsYpOQVr?=
 =?iso-8859-1?Q?6qGbTklRbH+Qf2+W7DVjxedDprqHcllGryD4tT7/d835VJQP4UPtyJsOCk?=
 =?iso-8859-1?Q?BEnAGoUuzCwltVacc47a1KI5ADL/LY15Tatz4pWVsT6+KfivGIFY8f42+7?=
 =?iso-8859-1?Q?fcbB3Nf4EsOwLlGCwveuZXzYQoZWhliu4uwcqXKdOL5Zy55y0Vwz5EVtE4?=
 =?iso-8859-1?Q?xpRW5yYfpCSDRb3Ipztnsqecmh/VXyU9drb4k1KyfNqC4Sy5mWNg6pN1eI?=
 =?iso-8859-1?Q?qEQnrsa+3KIiGO4+p5QYtaEk2Rf+/UaqfvoYxYcfuT/tQgqhsltlhVYi8P?=
 =?iso-8859-1?Q?MPtVZfPS5w/mD+BwCrxlByw4GghRnAncYAo5UTNe7Q4Ku2XO0lQQavdWHA?=
 =?iso-8859-1?Q?hskJKFJKN8pJJUJDU/ou1FoO+B1isndPei1M6F0we2qccir/06itXucfQU?=
 =?iso-8859-1?Q?8dLKUkMg9r2pokoaHOCmmD+5ZJDgJejjK1pPrB9ZdESnBRDguyGLk3UttO?=
 =?iso-8859-1?Q?I2+v5PZdmkNyPjtFk7EZ9IeUN6u8Q2nSlcFtogFadlkzsnzXo+tSFCaOGH?=
 =?iso-8859-1?Q?0rltdDtg6fNO6bEoZBcLfAsTPbuAIqZ2Et5zAbfDAHZ4iPmoxcFYFI3Z7U?=
 =?iso-8859-1?Q?O7p55r2R7YNivPb4vmkJQgkvb9EVr4wGlKiTkc4U4773PsmGtGvyshgio0?=
 =?iso-8859-1?Q?llN1q/wEcPF6qk++eIa4il5o6CphbFYoToFyoz/JR57rq6q9q9Slk2gKOf?=
 =?iso-8859-1?Q?TcsQnBKg2LZuQhExVIiZdyeGmwpsMkkc7rLD5/XKM+XDuGSao9/IPgDQCX?=
 =?iso-8859-1?Q?RWgOBBZ3IuuTuEdMxYIz1aOHCws961F2Lm/aY3fqAGVhML93TupoIRODvr?=
 =?iso-8859-1?Q?uqHEOnlLoKCTuOuyzNQUEQV0soBMLEcv4NXykWktpN8wZWvf4CGxeveAQR?=
 =?iso-8859-1?Q?IDgqpgD8vrarvtwHwDJmhT0F7UkXNBg2rBRQD2h8BtHu8rIoJjByFNEIX2?=
 =?iso-8859-1?Q?t9KbzP1zBh8g5PRepeSs7FJr6R9twZPaE2DfZlNrJmL6tLkmgkU6WRmVb+?=
 =?iso-8859-1?Q?gZpn98TDxAs7Y5t6A9TqLEbf3LCepF+VZLAcdKrVRl5JVLFxTqVgWl6gBT?=
 =?iso-8859-1?Q?ks4fkuvMyDKUhzeNYaz+WrlPLuX0MhbVXJIpu+Pb3pBxo5hOVxrPTCQgoQ?=
 =?iso-8859-1?Q?b5OYcWvuyVUMc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RWNB33n5XXY//hkVPDHDi8UZbKLay6uBQaTG3Ma7kdmZiwcS6SIeGZXZuj?=
 =?iso-8859-1?Q?IgCAHUqefQ09lKjGtydqQf9X7kz3VwGywHS6VVUByFkh+MWdrx7YiAF0TQ?=
 =?iso-8859-1?Q?G7HH9/M5okei0d1Jyo62RwPAH+vdh6zOkwKymxWwkf7eWRaH2fYn38o725?=
 =?iso-8859-1?Q?rD6b61Ej9Y8ObJ4zkPbdq+jIIM9zsVmzWY0o/EtnSgtY9df60WVIUwYWmv?=
 =?iso-8859-1?Q?pSovjif7o/Ho3UNV3YI5lXFvYU33VvYK4Pq81BnyAFWTyredaVOyhAMa9j?=
 =?iso-8859-1?Q?KlPGxibJZfBeqN0grO9adAdbxupsv+cDIG3KroQd/QlPME/AvFT68f13wk?=
 =?iso-8859-1?Q?XWStyOCWV3LIA+Jv+RXsD8hj1w+7yaSi4TQfRGtjP75nuE3t+GCyrikiVR?=
 =?iso-8859-1?Q?sbq4/cOXEdO1GiwjgOb4Qrlv3jog/NWrpWrf9LwEISYRXk/Fw4+he0RnxX?=
 =?iso-8859-1?Q?cov2/j22AViYLYx/ZhM8D2bUvA/kIcV9lSc2oYeEWAadJv8Xf6ypJa11z7?=
 =?iso-8859-1?Q?j8/KOkFXoqdXeS/3Ajl/JKw0G4mpFYtBL9HNyzSOuR8bA5OzQrhFwn5Gtq?=
 =?iso-8859-1?Q?k1JiAJ0MY3CSJhwPd+sv3RifQUqrxQFqfwhPFzAppovXz2+kxRW1qBXirF?=
 =?iso-8859-1?Q?fRFBm54wCALUjG6NpVlYWD5eEVernELpNJvsYQfjDeuIqi7Aq3bzJkoE/w?=
 =?iso-8859-1?Q?6VSa8r/YZdh9v/ZKUfefKeF3myNq1Gi5p9ToW4a6Gw9RuACjOYxwlVgm1j?=
 =?iso-8859-1?Q?OjVJlmZR7jBt7y0+TCb531V7p4iijhxVvRs2GU/QyZb3htL9RNmPWE87JT?=
 =?iso-8859-1?Q?g0cHMPP3Bt/zBWuQ/7lNjy2sOwU3pyoO99zaj0v1hVNhCrJzGogX0LgR3+?=
 =?iso-8859-1?Q?hMwuQ1Ktu+tZNL7eMFDc5OxyrkX9zm2BhqfeCifDnXI1dB51uljOFlaCA8?=
 =?iso-8859-1?Q?ngvMRbVwiNiyTzt+/udguMyw/ROenU9opMhJKxYMW34dKNg6D/73ZIpStI?=
 =?iso-8859-1?Q?l40mZ0gCF9sylteqEHIprC4hgeAtDSImSjn9fnEv7BnJ7tG27IIdjGZcOv?=
 =?iso-8859-1?Q?iOVxoMIsOLRCfHEqgVcPrySrM9Dg50elMOqRvhgXS5/D64SfI9tIqB+pIt?=
 =?iso-8859-1?Q?htH87fiF7M2ASA8apgEZNDBPDYCQ4MenzS86RH/hkk0ALkG18Io5EePVmK?=
 =?iso-8859-1?Q?xX9rf9rPGTzvw+b8+jaA/0KLwKEdYv7sy7pOtNULy7AAAvz1pmrBpmGX2L?=
 =?iso-8859-1?Q?X6K4iJHv3bceARGYo/WznSYlBJ15sThdbHJjcqp/4aZ8b0tsQ2HqWTxieZ?=
 =?iso-8859-1?Q?h9zUBSA8HLCwjzhf8+X19oyEbZIrCAGQX8RzI4+i5m+pj3tgOioFZFTdgh?=
 =?iso-8859-1?Q?INt25Y4Blar2t4Nl3TieA8prynqF1G2JB9T1VBihYSCJMEQIJeGrNqhrgr?=
 =?iso-8859-1?Q?sv8UnxP4FauyWRQqmzYk8lYaHDO3/+w7oGmlP0INCkB1ve4+fF/gJAHGXG?=
 =?iso-8859-1?Q?ZvW/ShGTqsVNenCRG7MUTgqx4h7f87tGPw1aFxgpLEfykXnrWdmQVDShDz?=
 =?iso-8859-1?Q?rv1EpiJd0BXIW21uwGxm0eF++vT7eWIEm1p/WpGLqgn3J48DmQZD73ogfA?=
 =?iso-8859-1?Q?8qYk4wflh1Wg3arsJJkBmo3MUUtjUodLqhBEkQTalU3MEf7edDfZF6MvhE?=
 =?iso-8859-1?Q?REfPCzVqTnAcmksH/rD55C6bUrDKTeyMxb/qoI06TeAjDQ+8h/muF4S5Zt?=
 =?iso-8859-1?Q?YeWazGsiWled7L7HaBha2q31Ux1NawCuQFsdEYFWLloY5DEj3CwCWuGbr0?=
 =?iso-8859-1?Q?+dHjlDPDZUvGsUb+ZD875mSSlnxMCL4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f57bf7-48de-4e29-ecfd-08de5dfdc7dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:42:49.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71cK1F56fMMMHl34XA424b6hyDVqT5oY3c91SrVMXoVCsUQnBQktQhCPVFhJVp21cXuPaTKygJ3V/KAGwy7HCdo/SCtuJxiD0nA46IwHa1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On Tue, Jan 27, 2026 at 02:53:45AM -0800, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add register definitions for System Controller mailbox
> interface on Xe3p dGPU platforms.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v4: (Matt)
> - Use lowercase hex values
> - Align macro definitions to column 49
> - Change to relative register offsets
> ---
>  drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 44 +++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> new file mode 100644
> index 000000000000..5875890d19dc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_REGS_H_
> +#define _XE_SYSCTRL_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET			0xdb000
> +#define SYSCTRL_BASE				(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX			0x03
> +#define SYSCTRL_BAR_LENGTH			0x1000
> +
> +#define SYSCTRL_MB_CTRL				XE_REG(0x10)
> +#define   SYSCTRL_MB_CTRL_RUN_BUSY		REG_BIT(31)
> +#define   SYSCTRL_MB_CTRL_IRQ			REG_BIT(30)
> +#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT		REG_BIT(29)
> +#define   SYSCTRL_MB_CTRL_PARAM3_MASK		REG_GENMASK(28, 24)
> +#define   SYSCTRL_MB_CTRL_PARAM2_MASK		REG_GENMASK(23, 16)
> +#define   SYSCTRL_MB_CTRL_PARAM1_MASK		REG_GENMASK(15, 8)
> +#define   SYSCTRL_MB_CTRL_COMMAND_MASK		REG_GENMASK(7, 0)
> +
> +#define SYSCTRL_MB_DATA0			XE_REG(0x14)
> +#define SYSCTRL_MB_DATA1			XE_REG(0x18)
> +#define SYSCTRL_MB_DATA2			XE_REG(0x1C)
> +#define SYSCTRL_MB_DATA3			XE_REG(0x20)
> +
> +#define MKHI_FRAME_PHASE			REG_BIT(24)
> +#define MKHI_FRAME_CURRENT_MASK			REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL_MASK			REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND_MASK			REG_GENMASK(7, 0)
> +
> +#define SYSCTRL_MB_FRAME_SIZE			16
> +#define SYSCTRL_MB_MAX_FRAMES			64
> +#define SYSCTRL_MB_MAX_MESSAGE_SIZE		(SYSCTRL_MB_FRAME_SIZE * SYSCTRL_MB_MAX_FRAMES)

Are these three actually related to the registers?  They look like they
might just be general driver constant which means we probably don't want
to hide them in this register-specific header.

other driver constants that might be better to keep elsewhere


> +#define SYSCTRL_MKHI_COMMAND			5

We might want to move this up to the SYSCTRL_MB_CTRL register where it
gets used and make a #define of the whole REG_FIELD_PREP rather than
making the calling code do that.

> +
> +#define SYSCTRL_MB_DEFAULT_TIMEOUT_MS		500

This is another define that isn't really related to the registers so we
might want to move it out of this header.

> +#define SYSCTRL_MB_RETRY_TIMEOUT_MS		20
> +#define SYSCTRL_MB_POLL_INTERVAL_US		100

I don't see these two used anywhere in the series.  Can we drop them?


Matt

> +
> +#endif /* _XE_SYSCTRL_REGS_H_ */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
