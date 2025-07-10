Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D19C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 13:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3BC10E217;
	Thu, 10 Jul 2025 13:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBVk7bLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0B210E217
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752155769; x=1783691769;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SkYGEx4a+X4KsPFZ13QCarUjMXrtHZpZhYBj1E9zlFs=;
 b=mBVk7bLMuFOT4GS5FSAk88roAjdz7mT7VDQS7dWMUsWAm3iGe3SRP38S
 huCTVuRLqz3vNByu3DLPdy4MDnHkzkHUjpQvjnwP9V5CNACw+oVQtU1hM
 bFOA1Hu1ycQTLDPGJki2yQTVv3bm+U/0VNM8sx0J8Dea05Y7Ls9SAYVW+
 aB4u2EkDo700V37nXEwORPfKIAUAvgGUcz5NVxN3RA3lMDn1N6c/EApZA
 TpJ+BMnEdXxdojN7pyITgVrREv2SkixiaQr7rzkku5E45YWNOLFskvxQ5
 dJZe00d2Md+9pfj170yU8bggJ9c1CTtjimcrYpCCOnVCP6SpD40K/48ve A==;
X-CSE-ConnectionGUID: gXXUpPnNTN+rdFPmqAQqLA==
X-CSE-MsgGUID: otzt+c5gSA+plb0uGNUQYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54587875"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54587875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:56:00 -0700
X-CSE-ConnectionGUID: 0A1PIAOBTFiRPIOn6uXgog==
X-CSE-MsgGUID: muZm2ReYTm+vIlRSbHLAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="161757489"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:56:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 06:55:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 06:55:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 06:55:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3gTIXbvCJdoYoaCKh1TiSj0SeCklBMtfshXo0vWauMDsts/Z20A0ulQBgsXRKqcKuaVBdy0xCNNUhoA/tQi0sLCqDiAgYmWMSby8ucf/6vrvC8EPOaGgNwKoC0ScImKYo02KOUiIU2X+dHjHMWqoCEtVz2vFmfE4IdKqyvcnZn+45HF+MzATQoykE/mlAHuY1BDmTnqthnR5BFGxaeCYoH75nw+40aeWggcYwp3s9oEsDO/69Aj6sri1xaklueUOxeGP0gsdniBkQR777Tkxicfrd4WE7gnNrK0xkXMZE6jGGFRiANpa9F7aoyOHCAo5BL6diDhD9BDQVzBZF625g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkYGEx4a+X4KsPFZ13QCarUjMXrtHZpZhYBj1E9zlFs=;
 b=cEsKuRSsgjLEo+WMbNdYxTkgE4JRisunQA6K9jT27SfMW0KrvbDzsl1r2/awAhfRr5gjg/7cx+n+vO3IOte1uPXpprWoB3OnipfXl7O1chwNy/ER1UazRTzwVf834BHSFqRCCF4wmO0I8cJrAp2w0j07InQFgBxhw15l2ncQrHw/VSDe/vVtYwCPokY4953euGbJhdPoKZAvCDY0c/l2XEKkIDZ52orjeSPNfzWWu/mSNOQv85avUrgby75QwNkwPnpAHnhgOLVqeqNU1S34DZdNXyZf3Do3QmB9IKRZWkWbALQze+Ii7qHT5PPG8/naOVstDGMzVMbuXNAqINWk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 13:55:29 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8922.023; Thu, 10 Jul 2025
 13:55:29 +0000
Message-ID: <d6745f3c-8384-4ed2-95cf-ed0be7c6c6b3@intel.com>
Date: Thu, 10 Jul 2025 16:55:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
References: <20250624155221.208338-1-ilia.levi@intel.com>
 <cdbrkwbzjkdrerbatfanlplukifvupv3w57ouipbmlaugpdzem@yunngcsuevxj>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <cdbrkwbzjkdrerbatfanlplukifvupv3w57ouipbmlaugpdzem@yunngcsuevxj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c474b0-c024-4b9f-ccb6-08ddbfb96e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlVKUTlJcUNBU3ppcTQyMThqanp4c1EvYXNpN2YrRWhqNnErOVEwVDB3SG1C?=
 =?utf-8?B?b21CVURTNy9yRWQrRzloUFFzR1dKL1JYMHVOYktsT3E1Um1ZbngvdUpkTU8x?=
 =?utf-8?B?emJKUU53NXp3TVhaUmtuQStDOS96S3dqYlE3TFZ1ZThGZ2tJT3MweFRlMFhz?=
 =?utf-8?B?ajFEZlhBdVZxYkpUem5LY1BISXNhdW0zZ1JTQ255dDZ1WWcvNTF4aHo3di81?=
 =?utf-8?B?S055MnlYS1R6UEozOElGN2pxZ2NqaWhBYVhIWWM1dGdoVngyUHlnbUdYS0Uy?=
 =?utf-8?B?MUxaQkRSZURyaDhHRlZYei9CRnhNV0pHRWE1RURZcjhqYkZITENwWm85azdF?=
 =?utf-8?B?cGk2T21La3ltbFFXemdKK2pKR3BoSndvdkVCMjFQbnNRKytMUzlHNFYzZGRB?=
 =?utf-8?B?SG1WQ25PaXN6c01Ha29zUi9rSWtMQTB2R09kYmVYSDdZdVVUdE5rRlg3Mmt3?=
 =?utf-8?B?US9Vc2NZbndVbE9QcCtvanNCYzVCUlk3MCtGREErWjA3QkFNYi9ZMmZZZFdn?=
 =?utf-8?B?bWpZWEt1aExNRG9OOEFiZXBHMVptQldRWlpLbzcyZzErTmV2UDNNb1F2OXNw?=
 =?utf-8?B?aUsyOFZjRnZ1RVJUalZpa3NRMWR1QzJzZGZLNFo0YVFKekN2b240NUtXaVFF?=
 =?utf-8?B?RVV1TmRvMFJDK3hYR3JiSUxtUXg2WkQxeGNCYWJ1VFh2aFJ0QktYVlVOUkVj?=
 =?utf-8?B?aTdHYkZmUE5MaDFMbHZKS242ek5VTHhWNm8veUdCZ3VjaVlPcjhrZDZmNVZu?=
 =?utf-8?B?ZWxLcjJwTllBemV5dFZ4alQyYUxZMXN6Z0F5T1VSbEdiZ0RtWjVNS2RlZTRj?=
 =?utf-8?B?ekM1T2NRM3YydjIyZHFvNFh3OGNrTHpPaHdSSExZbHFCSCszYnlEekJ2Uk9E?=
 =?utf-8?B?dy9JVFdUVmlhbzcwdUJ2OFVlYnJZdTNqY2gvRHBHTWFPeUdYU05tVnBiK3hP?=
 =?utf-8?B?WmtVT1pFTDJ6b1BldHZDMXBJYTVEc3F4M1JWM29ybkZGVGt1TWt6RUdUbVh5?=
 =?utf-8?B?Smt6OEFSRzlUTHlQLzBiMWcxcXdVMGdYWktCMDFOSW80bUNJeTZmc2w3WURh?=
 =?utf-8?B?N1J6NjN5blFTSmlxcFpqNVcvUVhnTnhac1V2Y3FxV0FKZDNtaGRDallndU9I?=
 =?utf-8?B?TGxBaG1IUkFSUmdNdE9DRUt5OXlHWU1keDNSZ0Z5SnJxWDRaNUNoY1JzREdE?=
 =?utf-8?B?ZSt0QWV3NEI1Q2MwY0w0d0N6eitrRk5lbCtCdFh1a2txWUxNcmlXZjdiYWw2?=
 =?utf-8?B?ODV6K3h5Um9nVjZyZmFkSHBWVGR2eVlxLzIvdkdGSE13VU1iQjNUVjdmUERl?=
 =?utf-8?B?MFBadWI0QVN0dGhmaTVtREFiVElxc0h5N0lCdy9IMGdSUjR1NTFtY0xpWTFE?=
 =?utf-8?B?M1pYL3dOZENSdlcxVlJoYVVLbi9laThUYmtqV0FycXREckVRZVZFcE9TMjFq?=
 =?utf-8?B?NmVzeXJwSnl1RUFEKzdsUWp1NHV0QVVRSnlUME1Bazg0aFA3Znl4SWk2VUlj?=
 =?utf-8?B?MEhielJzZVdJdXJwL3FVL1dIM3o5OUI0L0VxUTZVTUZtWE1jNHd4ZkorSHRX?=
 =?utf-8?B?cGRYei9Jd3oxRERxRHg3WUwwK2Zra1FsL2tsZlpTUjNseXo0b1N3NE5Cbity?=
 =?utf-8?B?bmpyTTZrRjBvQnpVbG5ZUlF0VlNzeGNHRlgyVzA0c1M2ZGV0ZWJHWnQrMm5Y?=
 =?utf-8?B?WFgzYUdmYTFjSEdBeGVPdkFVYUdFZmwyWFdPSktaRkU5NDhodSsrVWh3dGlo?=
 =?utf-8?B?NGlkYWdnaVpTL2Z4Ui9VQ0pTZ0ltUHliejNGK002TGgwQTN4RmRmL1ZUVmdt?=
 =?utf-8?B?ZTVzUW9tWU9ud3pSak5mM21LOGNpZXFqYjd5aTcxTis5WnFZWWpTWWhhSGtq?=
 =?utf-8?B?L3oweHVrOGFKbWlmenc4MmYwaEwwTWI2cGlPVDdFc285VmoxYnVoYy9sWFVI?=
 =?utf-8?Q?Gy2v1YQX4Ng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlRFZ0J2N2dPZ3Q5dXowemw3YVlMZGYvKzVwNG42clVFMUNCcGRrMTNydUxn?=
 =?utf-8?B?TFEvakJOSHVjYTZJWEU5NElLWTVnbUMzOWJpeVlvN1p2QmE4WUc5WE1BQmlr?=
 =?utf-8?B?QTE2a2pwZmY3NWxwYm5pZktEa1duMmdPOXloT1NoR2FhNEpWVU5ia3pSeFVP?=
 =?utf-8?B?dFE1SUFRYXFFd1Q2cHlKVFA2cHJqL3JKMjNHZGl3ci9UNW1aMTcwSHRZY2FX?=
 =?utf-8?B?YlVKa0dTc1ZrTG1LVWtTTzFLbTVMK3I4MGtySTUzY2t1eE1sdVlEZ0h6SHJB?=
 =?utf-8?B?RE82ZkhvUXZCTzVPZnRLd2RBTERRQmZSdytLOUtjWGlKbjQyM294OG8raEpk?=
 =?utf-8?B?ek10SnVac2tmMFhWcEt1eW8rUXp2bXB5c0ovSEJPU3Fiak5qc2o0azcxTlcv?=
 =?utf-8?B?ZzRHYU1zQ1BkUmhabE41eStCRE1VaEpaZkZKSkhZMnEwNUgrS3lrNTRUSW1k?=
 =?utf-8?B?OHp3QUFXSTBBeWoraWQzMmxhV0Q3bm1RV3krSEs2SHBWaFpxYW96RXBzNnFJ?=
 =?utf-8?B?YnJpcWtyYXlvbFJlMVJCMFFxb3JJNCtoaXBndmFsZTJkMHovQnNtR0xUOGM3?=
 =?utf-8?B?TjhCKzFoVEZTQlAvNndMdEJDU0xoc24wS1JaenhGNktXbWtzdVQ3M0lnd2VS?=
 =?utf-8?B?Tnd0YUFkY3o0SDFUT0JYemNaQ0J6QTF0SVd3MWRvYk5VaFBVS29XbkZXTjVa?=
 =?utf-8?B?QUVXeFJ6ZndFczBkVGcxRFJNc050ZGRmTTV6OFpJbmJQRjFCT0VVcDNpU3gv?=
 =?utf-8?B?Zjk4M2xYV2hZNXhYNkxWMU56U0NtTXoyOVZTZ2YzYmFpWEw1Wmt6YnpwS2FD?=
 =?utf-8?B?RUNDc01qOUpkVEtqaVJicTNjWUhONDlZb2pyYTh5NSsyemM4WmJIYklmVk82?=
 =?utf-8?B?cHFycHBqR2h3QWM3N1dFNXNsSVI5bmEvajZyZ3JGcE9aV1RLZE80c3Y1QkRo?=
 =?utf-8?B?NTJKaGxNb21QdnZ1Qm5OR01WS0NBR2MvQVpOVGtrMmRmUm5nRkdnNXkxRFJa?=
 =?utf-8?B?OEkvM3JCUWhyeEtvam1zamNsMkRTU0Q2aC83RUlMNTBtUlMreW5mM3dHUHVt?=
 =?utf-8?B?bnRiWk01UkVSVFFKWGJvWm16TEcyKzVJbWYvZytqbmhrQ1JLNDAzNmNEbmNR?=
 =?utf-8?B?ei9rcUpXS0FqKzRJV3RxL01ZZnBiRkNMcXJ0R3BQakhrSUJvNW9RRmVZZmJF?=
 =?utf-8?B?NUF3OUlpUUUyaHB1bTVaR3JyMzd0Y3VOaTFwWWY4dlA0b3FNRGM4cVBYYytY?=
 =?utf-8?B?U2V2VmJXc3c5dENyVW14NWxhYlltQ2E5VHlKWlNmOXIvbEpMbUhjS0NJem5h?=
 =?utf-8?B?OFNUOEUwbERDSnBWYXN5V3VkT3hXcDlCeCtKN0sxYzlOYzlETFZUVWcyMmhB?=
 =?utf-8?B?T0NNbzlYQndIWjY4a21FcFdxSkthYXJlZ2VDWmozdm8yQnB6VGU0S2Q1VWlI?=
 =?utf-8?B?djFpMHhDUGdnanZmek1WOWNGdzhFdzRzMTJBU3dSQmJxUHRrOUw2dXA5QU5t?=
 =?utf-8?B?Wk1VVE9tRmNobHVnMG1KMWR3MGVlRHJDUEFYM1pDd3gwYk00TDRjbzRWdUZS?=
 =?utf-8?B?TExRWEVrNHVjT2FZc3J2akhiVEwwL2Y0dktoSmkxN01JL3cwemlRS1JBVkhk?=
 =?utf-8?B?SkdZR3NnSmVWZmxaNnV4WkZoZmZ1dlg3TEpLeHFuRTlwYWVNZWtSVmZxRWRI?=
 =?utf-8?B?ckpQSDZkN3ErVG5iczdQOWdjNkx2RHFxSDlKaFVZb2pnQmRRcmZkeUg4VDk0?=
 =?utf-8?B?a1kraEg0YTFHU0Q5ZGY4amVJRUV1MHJFTFpFYngvQTZZMlRKR1F3ZVNqcmlu?=
 =?utf-8?B?VnJmTHlRNSt0YVZOZG8xMFFmOWxmcjZ2ZURXc3lKZzZqd2tkSHh1M2xXOFBW?=
 =?utf-8?B?bWR5MWNSTjdFRXVKNXhlaHFYcHBGVVBOY2d1SzVqVHFLR1ZWVjdxSmpaMHd5?=
 =?utf-8?B?SXppeTBtVHV5M3gvS3JianJlN3NsZ010TWVqTllVSzM2RWs0TUF5OE1TdlYy?=
 =?utf-8?B?TEdFU2E3S1VwcThUV1FtbmR0d1hyOTkwdzZyOHJIdGVTVEc4NFFWYWgzUlBm?=
 =?utf-8?B?cFpYQXNIKy9GMzluY1JBbUp6Tit0azVyYmN5cGszdnYraGsveXBtQjJ3Q3Fw?=
 =?utf-8?Q?xsUJwisWKLO1OcQ0IBZNbhBvE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c474b0-c024-4b9f-ccb6-08ddbfb96e34
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:55:29.7972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i11J8aBfiOKt6tcO319cuD92sTiq92dbjkLa5N4SqV+phHkNTqnJb+Bi0nEsJVLUlWIRcxkfZCUD5LgdT2Hxrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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

On 08/07/2025 23:14, Lucas De Marchi wrote:
> On Tue, Jun 24, 2025 at 06:52:21PM +0300, Ilia Levi wrote:
>> Allow the driver to expose hardware register spaces to userspace
>> through GEM objects with fake mmap offsets. This can be useful
>> for userspace-firmware communication, debugging, etc.
>>
>> v2: Minor doc fix (CI)
>> v3: Enforce MAP_SHARED (Tejas)
>>    Add fault handler with dummy page (Tejas, Matt Auld)
>>    Store physical address instead of xe_mmio in the GEM object (MattB)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device_types.h |  14 ++
>> drivers/gpu/drm/xe/xe_mmio.c         | 210 +++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>> 3 files changed, 228 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6aca4b1a2824..22a567c5f0de 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>
>> #include <drm/drm_device.h>
>> #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>> #include <drm/drm_pagemap.h>
>> #include <drm/ttm/ttm_device.h>
>>
>> @@ -162,6 +163,19 @@ struct xe_mmio {
>>     u32 adj_offset;
>> };
>>
>> +/**
>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>> + *
>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>> + */
>> +struct xe_mmio_gem {
>> +    /** @base: GEM object base */
>> +    struct drm_gem_object base;
>> +
>> +    /** @phys_addr: The physical address of the exposed MMIO region */
>> +    phys_addr_t phys_addr;
>> +};
>> +
>> /**
>>  * struct xe_tile - hardware tile structure
>>  *
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7357458bc0d2..3298ab0f1fb4 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -10,6 +10,7 @@
>> #include <linux/minmax.h>
>> #include <linux/pci.h>
>>
>> +#include <drm/drm_drv.h>
>> #include <drm/drm_managed.h>
>> #include <drm/drm_print.h>
>>
>> @@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>> {
>>     return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>> }
>> +
>> +/**
>> + * DOC: Exposing MMIO regions to userspace
>> + *
>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>> + *
>> + * This can be done as follows:
>> + * 1. Define an xe_mmio instance that represents this portion.
>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>> + * 4. Provide the fake offset to userspace.
>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>> + *    must match the size of the xe_mmio instance.
>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>> + *
>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>> + *
>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>> + * Make sure not to expose any sensitive registers.
>
> what exactly in this patch is preventing that? 


Like I wrote to Dafna above, I don't think we need any additional security here -
xe_mmio_gem_create is an internal API in the driver. So it is expected that the 
driver developer will call xe_mmio_gem_create only for allowed regions. The 
framework does not know which regions are allowed and which are not. 
Or am I missing something?
- Ilia


>
> how is that any better than simply mmap the BAR already exposed in sysfs? 


Are you referring to the resourceN files? AFAIK they are available only to root user.
Moreover, one envisioned use-case is where the firmware manages the allocation
of HW contexts - the driver will thus expose an MMIO region appropriate to the context
identifier received from firmware.
- Ilia


>
> Lucas De Marchi
>
>> + */
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>> +
>> +static const struct vm_operations_struct vm_ops = {
>> +    .open = drm_gem_vm_open,
>> +    .close = drm_gem_vm_close,
>> +    .fault = xe_mmio_gem_vm_fault,
>> +};
>> +
>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>> +    .free = xe_mmio_gem_free,
>> +    .mmap = xe_mmio_gem_mmap,
>> +    .vm_ops = &vm_ops,
>> +};
>> +
>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>> +{
>> +    return container_of(obj, struct xe_mmio_gem, base);
>> +}
>> +
>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>> +{
>> +    struct xe_device *xe = tile_to_xe(mmio->tile);
>> +
>> +    /*
>> +     * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>> +     * In the future we may want to store the physical address in struct xe_mmio.
>> +     */
>> +    return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>> +        (uintptr_t)(mmio->regs - xe->mmio.regs);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>> + * @mmio: xe_mmio instance
>> + * @file: DRM file descriptor
>> + *
>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>> + * the provided xe_mmio instance.
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +struct xe_mmio_gem *
>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>> +{
>> +    struct xe_device *xe = tile_to_xe(mmio->tile);
>> +    size_t size = mmio->regs_size;
>> +    struct xe_mmio_gem *obj;
>> +    struct drm_gem_object *base;
>> +    phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);
>> +    int err;
>> +
>> +    if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +    if (!obj)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    base = &obj->base;
>> +    base->funcs = &xe_mmio_gem_funcs;
>> +    obj->phys_addr = phys_addr;
>> +
>> +    drm_gem_private_object_init(&xe->drm, base, size);
>> +
>> +    err = drm_gem_create_mmap_offset(base);
>> +    if (err)
>> +        goto free_gem;
>> +
>> +    err = drm_vma_node_allow(&base->vma_node, file);
>> +    if (err)
>> +        goto free_gem;
>> +
>> +    return obj;
>> +
>> +free_gem:
>> +    xe_mmio_gem_free(base);
>> +    return ERR_PTR(err);
>> +}
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>> +{
>> +    struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +
>> +    drm_gem_object_release(base);
>> +    kfree(obj);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>> + * @gem: the GEM object to destroy
>> + *
>> + * This function releases resources associated with the GEM object created by
>> + * xe_mmio_gem_create().
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>> +{
>> +    xe_mmio_gem_free(&gem->base);
>> +}
>> +
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>> +{
>> +    if (vma->vm_end - vma->vm_start != base->size)
>> +        return -EINVAL;
>> +
>> +    if ((vma->vm_flags & VM_SHARED) == 0)
>> +        return -EINVAL;
>> +
>> +    /* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>> +    vma->vm_pgoff = 0;
>> +    vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>> +    vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>> +             VM_DONTCOPY | VM_NORESERVE);
>> +
>> +    /* Defer actual mapping to the fault handler. */
>> +    return 0;
>> +}
>> +
>> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>> +{
>> +    __free_page((struct page *)res);
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>> +{
>> +    struct drm_gem_object *base = vma->vm_private_data;
>> +    struct drm_device *dev = base->dev;
>> +    vm_fault_t ret = VM_FAULT_NOPAGE;
>> +    struct page *page;
>> +    unsigned long pfn;
>> +    unsigned long i;
>> +
>> +    page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +    if (!page)
>> +        return VM_FAULT_OOM;
>> +
>> +    if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
>> +        return VM_FAULT_OOM;
>> +
>> +    pfn = page_to_pfn(page);
>> +
>> +    /* Map the entire VMA to the same dummy page */
>> +    for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +        unsigned long addr = vma->vm_start + i;
>> +
>> +        ret = vmf_insert_pfn(vma, addr, pfn);
>> +        if (ret & VM_FAULT_ERROR)
>> +            break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>> +{
>> +    struct vm_area_struct *vma = vmf->vma;
>> +    struct drm_gem_object *base = vma->vm_private_data;
>> +    struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +    struct drm_device *dev = base->dev;
>> +    vm_fault_t ret = VM_FAULT_NOPAGE;
>> +    unsigned long i;
>> +    int idx;
>> +
>> +    if (!drm_dev_enter(dev, &idx)) {
>> +        /*
>> +         * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
>> +         * This gives the userspace the option to recover instead of crashing.
>> +         * It is assumed the userspace will receive the notification via some
>> +         * other channel (e.g. drm uevent).
>> +         */
>> +        return xe_mmio_gem_vm_fault_dummy_page(vma);
>> +    }
>> +
>> +    for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +        unsigned long addr = vma->vm_start + i;
>> +        unsigned long phys_addr = obj->phys_addr + i;
>> +
>> +        ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>> +        if (ret & VM_FAULT_ERROR)
>> +            break;
>> +    }
>> +
>> +    drm_dev_exit(idx);
>> +    return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..2990bbcef24d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -8,6 +8,7 @@
>>
>> #include "xe_gt_types.h"
>>
>> +struct drm_file;
>> struct xe_device;
>> struct xe_reg;
>>
>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>     return &xe->tiles[0].mmio;
>> }
>>
>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>> +
>> #endif
>> -- 
>> 2.43.0
>>

