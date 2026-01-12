Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFA7CF45C0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C059E10E0F3;
	Mon, 12 Jan 2026 18:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbnjy4AL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711D210E0F3
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768241040; x=1799777040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gyd0HiY8+jZ9bTK//8TTliO1JpkTmVSNrU9iVdK6yT4=;
 b=bbnjy4ALhYAoZl84DSJvP2YPSlOfuSPLK86mNjK2v3xaX/92s1SWmFGF
 x1BkMRVcoe/p5LVs6okzc3pMJMyj+v44nDli+M8gtVBOxGSLVXhMzOjZX
 onOxgEaJY6U8b6UG6Z+txKaBp8A3z9Cfe/dE5DDmpCWkGlTXzQEIGvVaK
 TonYQZiCqTGVZfVth7w21hyRr+UhQFPhXF1gwFGWbCeapZR+0Ym11kyte
 S+ujGP9R28O7yFriBfaZ/XcZtXz6c8mqdgHxn8pUb+Bd8Y1ykQ4SrrRUE
 8DvrDWGbEsw7P7RjekH3D/OVspCQzTuAynwGmEujakI04bjoDmFPcodwe g==;
X-CSE-ConnectionGUID: gsBOQ8ttT9mEfv12qBtsDA==
X-CSE-MsgGUID: D6wfW3GITICDzHbXaweyOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69575834"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208,217";a="69575834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:03:59 -0800
X-CSE-ConnectionGUID: S79MhgWoQAizEhqib4N4cw==
X-CSE-MsgGUID: FaHdr5WXQNuqG+q+MnRJAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
 d="scan'208,217";a="209232642"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:03:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 10:03:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 10:03:58 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 10:03:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfVx44lVhvtPd7RDjSAKLVBwa5Y+7ewjSkURIUjQ82WgZr0aI4vUod0KEk/caWjne+Hjrjc1T+iKtT8PDEYeG0vGMeCReLWbHxE6vyFMVFXQcBNbgMnP4XXtLhNO8fDHyY6EyM9WLIAKm1GNlZqpmxFibmoZ6AXoiJRyTsgOdse+XpU5IanuL1u0ziD99PmFEKfOuC9SdUPlERTBt6rejVwcp0ZDhdZ+RTavj+M4NZ+OkhIdidsR9viK7xbnR3pIsHX42+of9umZmzKWYFPRyh01OgPJR1Gvf4ObZNwrwaZrl8ixUg1IzRBN8ehsuTBHwIjsqwLUgAR9fVMP4vf2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9nd28ipZja1sN3ZTUP68MzeNjcLphpxbbnJ558+5e4=;
 b=Cwrz5JvdlVenVN5ZF6j7ZLYCB8QeweWXbSawHRiZD5eSrTDAenESD6dSIys95RUcoDv4YR3oOFFbnFZv5zgV8JvNwh0oXV/IxMy/gLVeBrblsrQ5oALK62zUBHmUfvJNf6YbzjiRdYzXUamqH6uo5ZkNqcICtTtbkiYqJ7AYdY10rvusxIUeiRlKApN4pMg0FjnbEcwy82PJq+a/O3R6SYlWPBMJ5EHGhfQkM8X+hdaWypuB3covJbKX4pZefQwviIfqD9DbKABa0j5NlwYMSOwCMQRzdbXfMsp6SWl9MdskXx9u46jqEUF4ZAJ/IIbB0W3/Kuwc+fw7L8jUAwlZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW3PR11MB4699.namprd11.prod.outlook.com (2603:10b6:303:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 18:03:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 18:03:56 +0000
Content-Type: multipart/alternative;
 boundary="------------DIPO6unW8z9fMDsFRQ18eBpX"
Message-ID: <511b6ae1-0bd6-4e31-8aa5-e039d2d7f817@intel.com>
Date: Mon, 12 Jan 2026 10:03:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable GSC loading and PXP for PTL
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <aV_BA4BlDMgn2IUs@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aV_BA4BlDMgn2IUs@intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW3PR11MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: f8507863-f857-4888-776f-08de5204f410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckhPS1I3dVRIbGJOSWF4b1Vzb0lrV2tIMlBRd3FMU0hRRmdRYXRUQkRaK2Jk?=
 =?utf-8?B?Z2tKUlU4a1FBLy9FZHBqcm55Y3NEU3lqTmF5aGVubHF5MUtzaklSa3lyWm5K?=
 =?utf-8?B?WjVxWUlLMXkzTnhTNU5adDl0REVmbk9jalZaVHVPS0NQK1l0SmQ5bWQxUjZZ?=
 =?utf-8?B?dXM3Qmt3OERtQ29QemVwOWZVblI5NEQrRkZ3bUo3RUVoWll4OGNpRTFITmFT?=
 =?utf-8?B?OFZWS1NXMHh5cThzWlJGTWE1MTJMMWFzMWlxYXgxY01mWTRTNlpXc0FUK0w3?=
 =?utf-8?B?RTl3V0svL25DZHBic1lKUGlXbmdLeUlGcWI4VDdmMW95NGdQaGNxRDZIdmM4?=
 =?utf-8?B?YUVaTE1vRkVEa3pxVFJ0TUpPWFB6OU54WU9jbktldEVrTU92eHJWTEFFWDJ0?=
 =?utf-8?B?NURSSDRFWHY5N2ErM3MyVE8wTTJSckxrZFVyeW9yZFJKOE01MnVaMEFWNnIx?=
 =?utf-8?B?QkNuNWdMZ3VIOGw1UnQrWDN2U3JiV3FOaVJoU0xocklPVDVjU01oWTdNVnV1?=
 =?utf-8?B?cGxSbXlSZWVvQzFzbVNpTmZrRkMzeGZtSEZLSk5pcnh4b3B1T0RXOHV3N3VD?=
 =?utf-8?B?VFNDOHQ2am9GZGNFazdtWTAyREFzdXFUKzRKMEpOMzZFMis2RzlpaEV0RVo5?=
 =?utf-8?B?dFJ5UjdJdHZoZ2lUNEZiL25QVzB5ZjBGVDRGS056a3k5Z2VLbkhRWVR2N25Y?=
 =?utf-8?B?UEx2ZmRyaG1CY1BBbGpTRnVUU3c3THlnemdFelN3cHVEdFQ3MVlCZEE0TWs1?=
 =?utf-8?B?S2RMYVlKMHdRdDFKUE02WVhLM29Mb0VEZGM1dmR5V3lXL3FtSk9hUndIVTEw?=
 =?utf-8?B?ZEgwSjlmdExtTG1BQWVNRlFDYjhleng1cHFhNy9CbHF0M0FtT09wUTJQVXo3?=
 =?utf-8?B?RGF3SG5HVFNRUWRqU2Rjb2MxV1Vvb01OMjlkN3JYREphR3YxTnRrVndRdmht?=
 =?utf-8?B?cDZzQXJqdXNhc1ZGY3dvUkVwcDVZaFR0bVJ6aVFrQUtUdmQrc0huNGF6Wi9r?=
 =?utf-8?B?cW9OMVlwQTk0eDh3NWRlNWdJczNkcnlLelQrKzZYZzlvUVo4TktxdXRneUhm?=
 =?utf-8?B?ZWpGamlXYjg0Q1FLUmFUSk5IRTI4aWphblpmTDNhYmVKL3lXeWwvdWUzdEt6?=
 =?utf-8?B?YnFBYzVuMVBvVjZGamQzRkNYWkhlcFhCbTg3bnpJaHpxU1FEaDdUQWRNTUs2?=
 =?utf-8?B?dUJ5OURJd1hrc2xQMVNnWUo5M0dlMW1QenFSVVQ3U2MxY3c3alZEbHRkdG5n?=
 =?utf-8?B?Qmc4emVJTlR0YkVPTXBvc3U5aDVuMTBhOVVaZEFNMytsbmVRSUNhNGxwdUxk?=
 =?utf-8?B?ZjFrZHlSR3N4Y0N3V1pLaVM0ZkdDaHRBY2VSQWFEK0dtblBkOXBxVllZajht?=
 =?utf-8?B?KzhmSFJONVpCRzdmMmdzeVg1Y0UzOEpPdTV1YTRkK2ovcDVsOUcrYjB3akVU?=
 =?utf-8?B?OEEreVEwa1ZoSUdzMC9PdE1aQnV5dHFJSVpXZC9sejdUYjRGaWhzWnVmWklu?=
 =?utf-8?B?RnNRRlpzdzhnMytUSEp6UnFlVVRzQVNxL2FONHJGOXdWTUduaTM4MGRhd1kr?=
 =?utf-8?B?MlRtMTAyV0pZd01JYkVGeHM1dmlxZ1IyRzhaRi9GeHk5R0dMT09tWGRlS3dN?=
 =?utf-8?B?RVBmRlg5cjFKUVkrY0JYbGVueWxIZlI2NmxLNkZPd3U5Qkpac0pUMllWeEln?=
 =?utf-8?B?R1M1bEphUlN5VmJoRDBHQVBPbTRSTmtuTlY0SmVvYVNjWk9aa1kyandqVE5Z?=
 =?utf-8?B?Q0RLWlMyRVFiL2h2cUJ4Tkx2ZTBEN09Za1FSaFMwRzdUZkZCanVXdU9WQUI3?=
 =?utf-8?B?L2lCQW9VU3lVamtXdHVnYk1OMEFuNnpjVmVpYUhzYVUwZEhyblU5Q3JFQW1x?=
 =?utf-8?B?Z0RNRituU3ZDY1ZuR2p1WXZPcWNXV2hNVVJNSW1Kb1JETDROQ21iRFh1UytH?=
 =?utf-8?B?VHR6d01nblpPUldiTnpROTVZc0JaRWtuckU1eTc3TStuT05pM1NzUEc3c3Ur?=
 =?utf-8?B?WDVMZU1PQkdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5VM1owMXMvSnFiNUthemkrOTdVOXJzeVVhUGFKbmRRTkdoVHJQdHVLUGUy?=
 =?utf-8?B?TndFWTU1OXB0U0dLKy9vdHl5YS9YL0V1OGJ1QkQzT2lCV2NUOC8rSDZ5dnFB?=
 =?utf-8?B?cjJNdWdoSEs0bFRNSWhkQTh6R3Z4WjlRL3FCeWtQRDNjQS9ETzJHNHZKb2Zs?=
 =?utf-8?B?NUU4b0NvL2hMalBnbWxuSFYxcG1UWTl6dXRZSEVodHpFRHp4Lys5ODdueVJr?=
 =?utf-8?B?b2JnTUhVQ0lXejBlTFpvcjJZSi9QMXkrZjFSS292OENPVTMwY1AzWEtJekpK?=
 =?utf-8?B?cjJSd2xHTzJ6bWdwUktTSm5PaUdUczRmS3pjdHR5VGJzRVhPSEZWaWc2bVEv?=
 =?utf-8?B?bzJPaWoxaTkyUm9GN1R5eGxKQm14N3BSMDE2dlZndytwdFM4dVpHZVNWaDhi?=
 =?utf-8?B?YzJLcm5iY1FQQnpzeUNjNXcwakdsOUhwc2ppWVpqVUlCV3dJV2sxb1VEZG9I?=
 =?utf-8?B?OFIvNkdBU0lvODFJWUMrZldrY3dvWXprRjU2cEEySzdpZGpzWTlOWDIwS0lu?=
 =?utf-8?B?eDJ5Tm95UWd3WEFBSUl3ZUdvVkF4TWRUSTg2UEpNZDZOc3BYVTFiUVhLejdr?=
 =?utf-8?B?dDVIam1YSEhYSXJBQjA4L0lVbjd0cFF6cXEvOTVkR1I2ZWk1TSsxVGlodW5E?=
 =?utf-8?B?bFR4Sk14NnVucXZmclAybDQrRnAzMGVTc3RBSFRnU2dDMUd0M0ZyWm43UWFI?=
 =?utf-8?B?S3VjSlNuMHV4MzJUME5VSnlBNzA0bTFacGxrV1RqeXZ4enh2TVM1UFhCVzF4?=
 =?utf-8?B?amh6cGpSSHFyaVZ6K21oNmxFS3BSaEk3WGdkMG52NENNUFU1QmNRRzdINVlu?=
 =?utf-8?B?ZDBGV000VC85V1BJclNtZWd6QUwrWWFaQkI0UWlQdGxmUGMrZDdQbWVOK2Np?=
 =?utf-8?B?RU9BTHVucDN2d081MXlBT3FFV2VmUVhiSHE2T3J6R2QySHZ1ejNjUWJseG9i?=
 =?utf-8?B?UGVqQkd6ZWRvYXhyaXBiTXE0Q2lxanhFZEM0OUZsS0hWQVhmN2MzZ0VRWldk?=
 =?utf-8?B?Qzg3ZmtiaDEyMGE5MHBOOTJwK0l3bG04b245UzlXNWV4RFQxSHpCNHAvWUdI?=
 =?utf-8?B?WlpPNGxzMTkzT2JBdXkvV29kT3BlWGNYNTZ6d2VSZkRqR2luTHhuQ3pXek96?=
 =?utf-8?B?OWU0bFZRdHV0Znd0MG9ZUWJUYkxWMC9DNDJVQ2hCS3FKUVB1MkxpR2hMbnJu?=
 =?utf-8?B?anNOWlhtMW5HSDNNdHlnalNVK1VRSVpOd1BqYURJNjdaSXpEMXFKNjRldFFJ?=
 =?utf-8?B?MXZEbWJsNDQ3dHJHQjB4RlJ6NndHdWNYT1VmY04yRXJVeWRIU0ZiWXlHQTdp?=
 =?utf-8?B?bUYxS2lXVDNRZmE2cER5bURkd1RPYTd0eGxoY3VIU2l1SndUeFZxZXc1RlVz?=
 =?utf-8?B?d0IrMEpIOUxvaUJiZHN2VXcrS3g2L1NBMnRzZnZNYk1FVktoeWpRaTIvVk1J?=
 =?utf-8?B?L1pHM3d6ZURUYTB3UkdLRE45bUR4ck85RG92YlBPVkR4b3Flc0ova2ZIN0Er?=
 =?utf-8?B?KzVzczFJcVA4UVc4Qy9zY2s5YWJOT1VvMksweXpkZXFFT2QwS0JQTGRnVVRG?=
 =?utf-8?B?b205bGRndUloSjYyTzBHUFp4a3ZxQWhzUWVuNmpYcG5UYVowaWlwR0FWWW95?=
 =?utf-8?B?QXBDNnJqTlA3ZkFQTXp1RGxXSDZ5c3ZhUStodFN2K044OTRHbWJUQTNEaSt4?=
 =?utf-8?B?V3RqTkhBR1JlRUt1eFdEQm5sSmlPeWg2NmdWcnZoWmROZ0lNdWJEWmdvRUpD?=
 =?utf-8?B?bkZBRTdOT3NQMVJyMW5iV0JLaHI2L2liKzBpUnhta2ZURGVRZCtGeUdwV1pF?=
 =?utf-8?B?ejErZjJLNi84SmdtRGpVaUpTdWtqVC84YnJVZzluWkJ4MUFscVhMa0dQbUZB?=
 =?utf-8?B?WE5QbDExcE9ZS3hkbzRuVmJWeTlxSmVHUjlibnpTOUE4dDN6VkozTlUraFNX?=
 =?utf-8?B?RFlVSGs1WkNQY2NmQXdlYkMxVE9QR2Nsbk9Id3hmeHVKVHdUbURrSnBlMEti?=
 =?utf-8?B?ODJwai9BekNacURrbXpSUTNLV3crNUF2eTd5Q2UydFo5UXphekNsQlpFa2Er?=
 =?utf-8?B?aG82ellyQ0M4OEZxS2Uwa3NuaHMwT2h4WGphRGJSbVFySENoQlJpbFFkY0Vi?=
 =?utf-8?B?QXR3Wnh0L0JMRHBYazBsREpXcDJIM2V6ZDBPelNwbnNJRklFYzJKWUJ1S09G?=
 =?utf-8?B?RnpMc2gvaVNoNHp4ckV1WDg0UGFHQ2h0TmhjOWVyckRxSkR2OEhIYktVOStM?=
 =?utf-8?B?QWYrdGZnUTRxcjBaQXQwZnpxT0FyVkFkSkpseExBQjBoMThpQnMzelk1Nlo2?=
 =?utf-8?B?andhdEVGejc0T0YvN29vZ2dsTW13VTljTFRwY2pORVNZb1RQeVF0SDNWWGZz?=
 =?utf-8?Q?6EPd9n+0Sa8RN2Dw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8507863-f857-4888-776f-08de5204f410
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 18:03:56.2686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3dutXKWx6Gdpqa23K/l3NXkua8ORRJKk3tYRwvxUo4Whpbas2oSg7VZkScT47XA5r0tm66Kj/ldv1HQ4Fivqdbu9B4l4JDOriNACUKanlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4699
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

--------------DIPO6unW8z9fMDsFRQ18eBpX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/8/2026 6:36 AM, Rodrigo Vivi wrote:
> On Wed, Jan 07, 2026 at 05:13:41PM -0800, Daniele Ceraolo Spurio wrote:
>> GSC loading is required for content protection features (PXP, HDCP).
>>
>> Since PTL force_probe was removed before we added the FW, the driver
>> needs to keep working if the FW is not found. Therefore, the code has
>> been modified to allow the GSC FW to be missing for BMG and newer HW
>> (older HW platforms require GSC for power management, so on those we
>> don't want to continue if the FW is missing).
>>
>> Note that I haven't pushed the FW yet. This is on purpose, as I want to
>> get CI with the FW missing to test that case. Once the patches have been
>> reviewed and tested without the FW, I'll push the FW to intel-staging
>> and re-trigger CI to make sure everything works with the FW as well.
>
> Acked-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
>
> on both, the optional approach proposed by the first patch and on
> the CI approach you took here.

I've re-run CI and no regression have popped up both without [1] and 
with [2] the FW.

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159774v1/index.html?

xe 0000:00:02.0: [drm] Tile0: GT1: GSC firmware xe/ptl_gsc_1.bin not found
xe 0000:00:02.0: [drm] Tile0: GT1: GSC firmware(s) can be downloaded from ...


[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159774v3/index.html?

xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/ptl_gsc_1.bin version 105.0.2.1301


I've also sent the PR for the FW to linux-firmware:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/858

So I'm going to go ahead and merge this.

Daniele

>
>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Cc: Julia Filipchuk<julia.filipchuk@intel.com>
>>
>> Daniele Ceraolo Spurio (3):
>>    drm/xe/gsc: Make GSC FW load optional for newer platforms
>>    drm/xe/ptl: Define GSC for PTL
>>    drm/xe/ptl: Enable PXP for PTL
>>
>>   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
>>   drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
>>   drivers/gpu/drm/xe/xe_pci.c              |  1 +
>>   drivers/gpu/drm/xe/xe_uc_fw.c            | 11 ++++++++---
>>   4 files changed, 17 insertions(+), 10 deletions(-)
>>
>> -- 
>> 2.43.0
>>

--------------DIPO6unW8z9fMDsFRQ18eBpX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/8/2026 6:36 AM, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aV_BA4BlDMgn2IUs@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, Jan 07, 2026 at 05:13:41PM -0800, Daniele Ceraolo Spurio wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">GSC loading is required for content protection features (PXP, HDCP).

Since PTL force_probe was removed before we added the FW, the driver
needs to keep working if the FW is not found. Therefore, the code has
been modified to allow the GSC FW to be missing for BMG and newer HW
(older HW platforms require GSC for power management, so on those we
don't want to continue if the FW is missing).

Note that I haven't pushed the FW yet. This is on purpose, as I want to
get CI with the FW missing to test that case. Once the patches have been
reviewed and tested without the FW, I'll push the FW to intel-staging
and re-trigger CI to make sure everything works with the FW as well.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

Acked-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>

on both, the optional approach proposed by the first patch and on
the CI approach you took here.</pre>
    </blockquote>
    <br>
    I've re-run CI and no regression have popped up both without [1] and
    with [2] the FW.<br>
    <br>
    [1]
    <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159774v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159774v1/index.html</a>?<br>
    <pre style="color: rgb(255, 255, 255); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">xe 0000:00:02.0: [drm] Tile0: GT1: GSC firmware xe/ptl_gsc_1.bin not found
xe 0000:00:02.0: [drm] Tile0: GT1: GSC firmware(s) can be downloaded from ...</pre>
    <br>
    [2]
    <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159774v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159774v3/index.html</a>?<br>
    <pre style="color: rgb(255, 255, 255); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/ptl_gsc_1.bin version 105.0.2.1301</pre>
    <br>
    I've also sent the PR for the FW to linux-firmware:<br>
<a class="moz-txt-link-freetext" href="https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/858">https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/858</a><br>
    <br>
    So I'm going to go ahead and merge this.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:aV_BA4BlDMgn2IUs@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Julia Filipchuk <a class="moz-txt-link-rfc2396E" href="mailto:julia.filipchuk@intel.com">&lt;julia.filipchuk@intel.com&gt;</a>

Daniele Ceraolo Spurio (3):
  drm/xe/gsc: Make GSC FW load optional for newer platforms
  drm/xe/ptl: Define GSC for PTL
  drm/xe/ptl: Enable PXP for PTL

 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
 drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
 drivers/gpu/drm/xe/xe_pci.c              |  1 +
 drivers/gpu/drm/xe/xe_uc_fw.c            | 11 ++++++++---
 4 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------DIPO6unW8z9fMDsFRQ18eBpX--
