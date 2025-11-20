Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C5ECF856E
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 15:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167C10E778;
	Thu, 20 Nov 2025 15:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9J7xh1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47D610E778
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763653685; x=1795189685;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=YYSkuCBWQ0LTJ/NzS1x35i0e324XBZK/4ATec44O4b0=;
 b=j9J7xh1I0G2NUoOVjuPS5SYdXBjWZLMQIaHRE/yv1Pzfl8kOXubiIKoD
 jXFk37T0YKSRDJUjdS9IumGFlZKdYNcNZI3x3OX68hYXXlZy0SuFG/EaN
 zP4DomCp8hBC1tIJmmAfXbF9Hg9lVMGl+zXfJgKbDLNrlRak1d3shiOXi
 kalH0LcYmOzqfjMWCxDTiMZhPvydfFKDq+jg3VifPjbQy9I0X3+/mJw6S
 u6EofeydCQcX2WBtbRgN3G7s6NmwCvox7HCHkx15JMGI7cSOJTo1IXhNu
 M0BkGS//kzXA2r5w/FeCwenU5GmdphW5cQOfXgxjyvRosc6gkixN/lKuA A==;
X-CSE-ConnectionGUID: ytKdsp4BTnOWTTqUtFovXw==
X-CSE-MsgGUID: yLNnUMLaRc6ZUYc/EAq/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91209076"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208,217";a="91209076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:47:56 -0800
X-CSE-ConnectionGUID: KMT6PX8QQtOgVv3IaEy5YA==
X-CSE-MsgGUID: grRDBT/mQVGtV/QPOUNsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
 d="scan'208,217";a="195704378"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:47:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 07:47:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 07:47:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 07:47:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDd+4xdLXhhFcNIx9A3QSvsRN4d3A0yXhxE/1m7qNxHL8lBC2n2pIgGHwleeHdyHnRYtuQrD+S4i2zyedW4a9RSceBEpLwDxBfz1pzP61WKp/cNtyRCtv1D2Wx6PyTFpvwCbukdSNEwhdnZu8gShtKOalhiFysYpvZ4MYmW5zVGI3MBfIOX+UuwHOQSzDrfQ+ja23QTyJa+a4bNN8ySCAD1ufUTblzRJdi2IC3EPfccRXAuj1y0RlRPMYqZg2SCke3rmLOA+lORkBq5JXVVTU0TPYiEP9HmwfgoHjeJw26GAwiDeAimVu9BC6aDm68aGrARoyjn1nxPocJ2gvbzPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Qqja3Tj5eoLiPU/ES8elUM3EhlfjhFfdURAvMQTJb8=;
 b=ZcVioEKWY7rjX8FsVgfle4UsiuYd/7IdKZd/vtrUA6FLMOPkrMvCozEIu6Co+fFoJI1976agOUF0JV7My9Z9++ut1astro3HicgTyTBIHzURD+iltrBj1Hw0iTQqgQrpWxP/NQpyJP8hOJUYBO5nUVm9jH5Lj6IQetvUJWIDEwmLkMj+GK2OVvnXScCnySftPwiRFS6RK+dywg23b8+cVRD0yjDDB4J6mXLSfnRllzvAPQHTdywkyIul6ND11Zirs6YiZbHsAi1+9s2DaeJ0/NMrrRX3CWISgaE2rI4Q1oW+B3Ju71bhrWgDhC7teVRIZnu7LS2YOeTDjosibYhK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) by
 CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Thu, 20 Nov 2025 15:47:52 +0000
Received: from DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18]) by DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18%7]) with mapi id 15.20.9320.013; Thu, 20 Nov 2025
 15:47:52 +0000
Content-Type: multipart/alternative;
 boundary="------------0PeVxRVOLjoSN2tOXoLuMlDy"
Message-ID: <c26e2aa2-2073-4e89-b30b-637ed3357d83@intel.com>
Date: Thu, 20 Nov 2025 21:17:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/uapi: disallow bind queue sharing
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Carl Zhang
 <carl.zhang@intel.com>, <stable@vger.kernel.org>
References: <20251120132727.575986-4-matthew.auld@intel.com>
 <20251120132727.575986-5-matthew.auld@intel.com>
 <aR8uXCNK/jJx0Rsc@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aR8uXCNK/jJx0Rsc@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To DM4PR11MB6096.namprd11.prod.outlook.com
 (2603:10b6:8:af::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6096:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e36f62-7c51-4234-abd2-08de284c29e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnJwY01IbGdNQS94M3ZGanhoNE85aThiN3pGRWRhbkg3a0g3eWdVK0VNalRF?=
 =?utf-8?B?elhOcnRDdWNSL2lSVWtGaFY4M2JBZ2k3eUx5Y09EelFmcHdFNENWTlJZTWNv?=
 =?utf-8?B?bzlSU2JPbC84M0hTZTM1UUlvTVlJMnZTeS8xZ1FMdWIvOUlvR3p5OUJMaGxw?=
 =?utf-8?B?OVhnN2xpa3ZiV01yU2dwNUFsMmpLcU55MU5wSW56bkZ6YmxGRit6UkdseDdO?=
 =?utf-8?B?QlRZbVBMMWVQaDJQNUlyL0pGTDhpVS9HWTFFTGZvRjVnVDY1WDRJWks4WHZS?=
 =?utf-8?B?enpUMDdDWklkR2R5bDRKQjYydkw5em5PcDVvTWRzTWdQZlRwYlE3L3lVdnA5?=
 =?utf-8?B?QmJVZGN0TXh5QkNrZkNydHp2VS9QZld2L3FhMU1Sb1pNSld3eWxZUFdQNzFV?=
 =?utf-8?B?bFhSa0QyZ1B0VDFMcmlRaGVRZnNpOWZQZVF1Y0pNNUo4NU5jTGh2TCtPR25j?=
 =?utf-8?B?Y2VMMmdoM2ttdk9od1VabEFUek1lNlRtYjdjZktiNVorZUVDZmpHMzUzaWtL?=
 =?utf-8?B?L0VTclJYdnVyOE90a1daSElzeFQ5V3cwSzlYdmdOcm9hMENqQmhXaWJmdWM1?=
 =?utf-8?B?YTd1Kzl3NndiUVkrODlLUWp0aUZuY1VkcS9wS2tUb2ZpSWs3M0FCeFR3Sjla?=
 =?utf-8?B?bXRDWCs0bmtSUkJlUERyc292WkUvdW5KZ1dvTlF4RTVtMFdjUXNWS01YbkJa?=
 =?utf-8?B?dFh2NXJoWmhITDR3SHJlcGFLa2FDZXRMd3p6NGUxS2d2MjdqTTJ1ZE1nbjBv?=
 =?utf-8?B?elFoVmhzUURSK00zNDNuSjNNUGI1cVV2M3J4S3JYWXNQTEpGdHpIMGRmY1E0?=
 =?utf-8?B?M3lqRlVsbmE3cDZuN29qVUh6R0c4UnJha1BHdWZQcUpqNGkwODUzckNjdlpk?=
 =?utf-8?B?M2dubGU5SGJHcUtLS2xiNTYwZ2g5eXhoOTFLbEluRlNoWTFOMjBrMG83VEdS?=
 =?utf-8?B?OEVmT2FQV0Zha3dhTWVvSUhyMHhHY0h4bkRtUm1ham53VkxJV3hGNjVMQXlt?=
 =?utf-8?B?aEN3a3AyOWtDc01obnRnL2huaTBBYlVSZHBsR2NKRlE3aklnV2F2cEQ0YU1M?=
 =?utf-8?B?dHRIN2YvaTZNS2tIQ0gzMkUrM3M5UmFNRVNTS1BybWk2YVdtZFgwT1d2cXhn?=
 =?utf-8?B?dGJwemFPaC9VUVd4Vit4RFp4Um9melRvMUxndDI2Nk9IY281RVlGMHRkSGRR?=
 =?utf-8?B?bEF2Zld0ZExEK0ZjYnBGS2prTC9ta2JKcUZQbVNVdHhudlJ3SUx1aHRHTGJ6?=
 =?utf-8?B?RkJqY1FaSUhTaWZhN09MNjlISnc5Y28yQzZ4MENOVUt4T0JYWWRjNDU1VGJ0?=
 =?utf-8?B?VnVta3NVZnp4dzkwRHovSHMwb0hVYUYyZXdraVJ6M3pGYXRPSFpQNGlBd3l2?=
 =?utf-8?B?MHM4ZVFoOU9sK0RPRUlyT2ZTOU91YzhkUWxUZDJNNnZncWdEZTc3bTdEZUI3?=
 =?utf-8?B?VENVUm9qRmtSTUtvUEhiV0Mzb3VocWxSWlE5S3NQemVhY1BDV2dpNTMwaUsx?=
 =?utf-8?B?Vnd0VUVtNDg4NlFucEhka1oxTjF2TWFHTGFJYWdyYm92U2h0eENROGxvazlN?=
 =?utf-8?B?bU9jQS9uYlVod2ovcENpZUVMVk9SN3pXSk9CcTNoUVB1cjZNWThEaHAvVlht?=
 =?utf-8?B?d3N6QjI0SGhBa28wcHlKdEdqd2FzTytOQzlLREZCVHlGcGJiSkZWWUE5WDE1?=
 =?utf-8?B?Z2JXQmdyUDcrOFFrVVpiMnFKWE9QbXJOc2dJamppUFovUmV1RFN4Y0dkVFVk?=
 =?utf-8?B?aVN0NDFZMlQ5N1hLb2JnOG96cW9QUDc1aGk3MEFWSlQrS1BJV2xtbmthelow?=
 =?utf-8?B?ZTh3ek5rQkpnVVFHNHZtelVMMG9WMnh2M1U5OStEYm9sV1UxS1BIc2ZvSkcx?=
 =?utf-8?B?Mk5kVjJHbkk0RTB1N004anJwZzNkUEtUSkFjQmRhSlJLa3hmdUpnK2xyZkJ1?=
 =?utf-8?Q?UYRDIWSlUBNwetfkYcHOauU10+FsOrxA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6096.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRwMTdGd3IxOGFWMTF6M2RTZERjcnVuVGFOblU0TE5EZXJOcFBWSzVBYXF4?=
 =?utf-8?B?NTQ1ek51bEN2eERjR3VOWGp2dm1pNVZBRzBzT2hlbFVxOExTM2tlZXBndCtS?=
 =?utf-8?B?bGtyVHJhREJFNG5EcU5RQVZUZFBldU9rd2twVXhHRUFXWkJMZE9sY2lmNE9N?=
 =?utf-8?B?UW1JY3NLZmt6NGg0TnZIVlRQenQ3dUpDVjAwUlNQcnFPQXprd2VEREFiUHRp?=
 =?utf-8?B?RTNMNklGbTJ1WmZOMG9tMjk1cTdzYmtZeUlXTE01RGJuVktoRnQ0eVZlNEFU?=
 =?utf-8?B?aGwxRUs4ZjBHckMvRGV0U2xYVGQvOUs5UHJIaHhOUmNVb0Rnbkx0S053WW9Z?=
 =?utf-8?B?L0hnRDZWakoyRjVuWHV0elFXdkhGN2hxSXV4dWxJSk0wcjREeFZsNXhvUnJ0?=
 =?utf-8?B?KzVteVk4RndFejZZMXpVaTRjdENlOHpzREdsOXBsSzdwTUhoclhXNWlqMlB1?=
 =?utf-8?B?Ymt2K243OTIrQVdBa3p0eHl6USt5TTROb0ZoQXdhRVRES2tGWUsrcUFCY3pZ?=
 =?utf-8?B?ZTBTMUZPSDR3SlJicjVMTE5sQnk4K1FNR1ZuN0FjOFZtOTJhWkZGRTlINWdD?=
 =?utf-8?B?MXd6QTN5Ky9DWTVUai9rMUkzc3JQMjVmN0RmT00wdWxpZmd3Q2w0RGI3aXFk?=
 =?utf-8?B?Vk9Rd1dCR09ZQ0syUjRWZmFBVmsvY0dZV3RLZjZKYkpGbk85OEhENzVNTktm?=
 =?utf-8?B?V3VZc2NaQmdJdDB4bHVOTVAzWVZRMklXbFpnOEI1ODErTkMxemx4czBXdEVp?=
 =?utf-8?B?YUpPSUZxelplQ1pwVndSemR4NFVoM2cvV0R4SkhIampwZU80RmJKanZUMnB0?=
 =?utf-8?B?ZFdmbUorRlhMamNjcDNHUldHK2h0azZHN2lPRVMyaTVnU1hXNjJLZFhWMkdF?=
 =?utf-8?B?ekNKaitpVktreVR3Nk9CQVFOZEJITDdjMnpMZXYrVUI4bHdXNWlNVUVHNVJw?=
 =?utf-8?B?MElEY0ZOVHFscWtDclJIYUE5Ymx4TXVXTFpnZzZSM1JVTm1XUVovQno2TEh6?=
 =?utf-8?B?YWlEaGJDN21ZWjVGSW1zQUNSRTdjaGVGdWtoSHNPNXhMSnlBUTVqM24xZUh6?=
 =?utf-8?B?cnNQZ0pwTXJkblhVTUZqN2FEaCtNWlNraHc4TmQxcnE0NkJKTnJRTFd3K1V5?=
 =?utf-8?B?YzBNaG5Gb3JTR3NNQWg5M3JBNlF5ZVozbXFnLzZ1b1Uzdmd0NjJ5aDN2Tm53?=
 =?utf-8?B?RWZnMTRTalU1TnZuWVFzUXViWGFJRkZtekd2czE4bjlhS1RWMXNJN3Fydmdx?=
 =?utf-8?B?ampWTWdDMGVtdzVMWSszUFA2NnpzNGVDM1QrUWl1aVQrL3NGdXk0NFNlNzRh?=
 =?utf-8?B?S20xRzB2TGpJcWdxaHRscXlJWkZaV093YjRMalE5S2tOMXB3Znp3Q1d6MWtk?=
 =?utf-8?B?OVd4WWNQdFNkTDhOWWRCVVgyU2ZSNGhNTzVSTDF5MEVtMDZ4VWg0WUhlN1lj?=
 =?utf-8?B?Z2RhaGY3c25lYUYyUzN4UnVMQnZtOVZ0WU1qV2dLclFjR2ljUUx0TVY4YjNE?=
 =?utf-8?B?NWVFNVA4UGpwTkM2Vkh2UnN0L1dCZVgzdmEvcGp6Y1NmVGk0QklMU1VzeGYz?=
 =?utf-8?B?NUI0dWxtM0xPMVh1L2VhbGNpcEgvZWRVMTlkYXNFWXpubm5HeGkxd0dBWTQ0?=
 =?utf-8?B?RlU4NTBEMHlxcjlkbVNDZ2NuYnpOMnBZTmZDRVAwaWp5OVpRRGJRSnJheTlY?=
 =?utf-8?B?YzBLSWpaangzclkvK2hESFowaGRIMVRKSVZaWW1aWDJMTi9VSEFxaGI3RE1H?=
 =?utf-8?B?bEViNHF1Y3cwU0RTcXZDdFRFWDdmVzl0MGhCbjZvRjNmbG40Vy8wdWpEeFRZ?=
 =?utf-8?B?TTcxYXBrelpBdE1pVFJ3eFpiY0tHdkpKMW1Wbm1xYi8yNWZkODVOTFdYMFV3?=
 =?utf-8?B?MEZ4UW1YQllhZnZFZ214Y09mTndDWVFTWnN3TmxmeEFBQk1JRGl0bEczRXk3?=
 =?utf-8?B?MFhvTHJaNVpSVGtBSDgrU1RRZGxDTGo4cVpVR0x0OFEzUTNWMzdkVFArQUZa?=
 =?utf-8?B?c2hKaS9wSFU4VTZ1b0FyQ040STlSSVRTVFRndHphL1VKclBOblVGOUU1T0Fn?=
 =?utf-8?B?dTB0N2dGb2szTkx0aGlZa2ZBTFJ4cGl0NGtISzFRNDdQYU5mc09BanhTWlA5?=
 =?utf-8?B?VTJFT3hWa3YyR3Frd2l6R25uajJnWXp0OVVkbzBLU3UwMVZLL1kvcW16V2s0?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e36f62-7c51-4234-abd2-08de284c29e1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:47:52.2584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m7JWq3oWuiD1lJ4q7b8swS5AD0ML6tEztYDrFlSjlHTxBLikLN/h5cCr0y6r8dBrZOHgV93YGw/NTI1Q/5FJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
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

--------------0PeVxRVOLjoSN2tOXoLuMlDy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 20-11-2025 20:36, Matthew Brost wrote:
> On Thu, Nov 20, 2025 at 01:27:29PM +0000, Matthew Auld wrote:
>> Currently this is very broken if someone attempts to create a bind
>> queue and share it across multiple VMs. For example currently we assume
>> it is safe to acquire the user VM lock to protect some of the bind queue
>> state, but if allow sharing the bind queue with multiple VMs then this
>> quickly breaks down.
>>
>> To fix this reject using a bind queue with any VM that is not the same
>> VM that was originally passed when creating the bind queue. This a uAPI
>> change, however this was more of an oversight on kernel side that we
>> didn't reject this, and expectation is that userspace shouldn't be using
>> bind queues in this way, so in theory this change should go unnoticed.
>>
>> Based on a patch from Matt Brost.
>>
>> v2 (Matt B):
>>    - Hold the vm lock over queue create, to ensure it can't be closed as
>>      we attach the user_vm to the queue.
>>    - Make sure we actually check for NULL user_vm in destruction path.
>> v3:
>>    - Fix error path handling.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Reported-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
>> Cc: José Roberto de Souza<jose.souza@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
> Reviewed-by: Matthew Brost<matthew.brost@intel.com>
Looks good to me.
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com> 
<mailto:arvind.yadav@intel.com>
>> Cc: Michal Mrozek<michal.mrozek@intel.com>
>> Cc: Carl Zhang<carl.zhang@intel.com>
>> Cc:<stable@vger.kernel.org> # v6.8+
>> Acked-by: José Roberto de Souza<jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 32 +++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +++++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  2 +-
>>   drivers/gpu/drm/xe/xe_vm.c               |  7 +++++-
>>   5 files changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 8724f8de67e2..779d7e7e2d2e 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -328,6 +328,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>>    * @xe: Xe device.
>>    * @tile: tile which bind exec queue belongs to.
>>    * @flags: exec queue creation flags
>> + * @user_vm: The user VM which this exec queue belongs to
>>    * @extensions: exec queue creation extensions
>>    *
>>    * Normalize bind exec queue creation. Bind exec queue is tied to migration VM
>> @@ -341,6 +342,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>>    */
>>   struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>   						struct xe_tile *tile,
>> +						struct xe_vm *user_vm,
>>   						u32 flags, u64 extensions)
>>   {
>>   	struct xe_gt *gt = tile->primary_gt;
>> @@ -377,6 +379,9 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>   			xe_exec_queue_put(q);
>>   			return ERR_PTR(err);
>>   		}
>> +
>> +		if (user_vm)
>> +			q->user_vm = xe_vm_get(user_vm);
>>   	}
>>   
>>   	return q;
>> @@ -407,6 +412,11 @@ void xe_exec_queue_destroy(struct kref *ref)
>>   			xe_exec_queue_put(eq);
>>   	}
>>   
>> +	if (q->user_vm) {
>> +		xe_vm_put(q->user_vm);
>> +		q->user_vm = NULL;
>> +	}
>> +
>>   	q->ops->destroy(q);
>>   }
>>   
>> @@ -742,6 +752,22 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
>>   			return -EINVAL;
>>   
>> +		vm = xe_vm_lookup(xef, args->vm_id);
>> +		if (XE_IOCTL_DBG(xe, !vm))
>> +			return -ENOENT;
>> +
>> +		err = down_read_interruptible(&vm->lock);
>> +		if (err) {
>> +			xe_vm_put(vm);
>> +			return err;
>> +		}
>> +
>> +		if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>> +			up_read(&vm->lock);
>> +			xe_vm_put(vm);
>> +			return -ENOENT;
>> +		}
>> +
>>   		for_each_tile(tile, xe, id) {
>>   			struct xe_exec_queue *new;
>>   
>> @@ -749,9 +775,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			if (id)
>>   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>>   
>> -			new = xe_exec_queue_create_bind(xe, tile, flags,
>> +			new = xe_exec_queue_create_bind(xe, tile, vm, flags,
>>   							args->extensions);
>>   			if (IS_ERR(new)) {
>> +				up_read(&vm->lock);
>> +				xe_vm_put(vm);
>>   				err = PTR_ERR(new);
>>   				if (q)
>>   					goto put_exec_queue;
>> @@ -763,6 +791,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   				list_add_tail(&new->multi_gt_list,
>>   					      &q->multi_gt_link);
>>   		}
>> +		up_read(&vm->lock);
>> +		xe_vm_put(vm);
>>   	} else {
>>   		logical_mask = calc_validate_logical_mask(xe, eci,
>>   							  args->width,
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index fda4d4f9bda8..37a9da22f420 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -28,6 +28,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>>   						 u32 flags, u64 extensions);
>>   struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>   						struct xe_tile *tile,
>> +						struct xe_vm *user_vm,
>>   						u32 flags, u64 extensions);
>>   
>>   void xe_exec_queue_fini(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 771ffe35cd0c..3a4263c92b3d 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -54,6 +54,12 @@ struct xe_exec_queue {
>>   	struct kref refcount;
>>   	/** @vm: VM (address space) for this exec queue */
>>   	struct xe_vm *vm;
>> +	/**
>> +	 * @user_vm: User VM (address space) for this exec queue (bind queues
>> +	 * only)
>> +	 */
>> +	struct xe_vm *user_vm;
>> +
>>   	/** @class: class of this exec queue */
>>   	enum xe_engine_class class;
>>   	/**
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 052a5071e69f..db023fb66a27 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -350,7 +350,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   		flags = EXEC_QUEUE_FLAG_KERNEL |
>>   			EXEC_QUEUE_FLAG_PERMANENT |
>>   			EXEC_QUEUE_FLAG_MIGRATE;
>> -		q = xe_exec_queue_create_bind(xe, tile, flags, 0);
>> +		q = xe_exec_queue_create_bind(xe, tile, NULL, flags, 0);
>>   		if (IS_ERR(q)) {
>>   			err = PTR_ERR(q);
>>   			goto err_ret;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f9989a7a710c..7973d654540a 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1614,7 +1614,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>>   			if (!vm->pt_root[id])
>>   				continue;
>>   
>> -			q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
>> +			q = xe_exec_queue_create_bind(xe, tile, vm, create_flags, 0);
>>   			if (IS_ERR(q)) {
>>   				err = PTR_ERR(q);
>>   				goto err_close;
>> @@ -3571,6 +3571,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		}
>>   	}
>>   
>> +	if (XE_IOCTL_DBG(xe, q && vm != q->user_vm)) {
>> +		err = -EINVAL;
>> +		goto put_exec_queue;
>> +	}
>> +
>>   	/* Ensure all UNMAPs visible */
>>   	xe_svm_flush(vm);
>>   
>> -- 
>> 2.51.1
>>
--------------0PeVxRVOLjoSN2tOXoLuMlDy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-11-2025 20:36, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aR8uXCNK%2FjJx0Rsc@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Nov 20, 2025 at 01:27:29PM +0000, Matthew Auld wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Currently this is very broken if someone attempts to create a bind
queue and share it across multiple VMs. For example currently we assume
it is safe to acquire the user VM lock to protect some of the bind queue
state, but if allow sharing the bind queue with multiple VMs then this
quickly breaks down.

To fix this reject using a bind queue with any VM that is not the same
VM that was originally passed when creating the bind queue. This a uAPI
change, however this was more of an oversight on kernel side that we
didn't reject this, and expectation is that userspace shouldn't be using
bind queues in this way, so in theory this change should go unnoticed.

Based on a patch from Matt Brost.

v2 (Matt B):
  - Hold the vm lock over queue create, to ensure it can't be closed as
    we attach the user_vm to the queue.
  - Make sure we actually check for NULL user_vm in destruction path.
v3:
  - Fix error path handling.

Fixes: dd08ebf6c352 (&quot;drm/xe: Introduce a new DRM driver for Intel GPUs&quot;)
Reported-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: José Roberto de Souza <a class="moz-txt-link-rfc2396E" href="mailto:jose.souza@intel.com">&lt;jose.souza@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
</pre>
    </blockquote>
    Looks good to me.<br>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]--><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-IN;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">Reviewed-by: Arvind Yadav <a href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:aR8uXCNK%2FjJx0Rsc@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Cc: Michal Mrozek <a class="moz-txt-link-rfc2396E" href="mailto:michal.mrozek@intel.com">&lt;michal.mrozek@intel.com&gt;</a>
Cc: Carl Zhang <a class="moz-txt-link-rfc2396E" href="mailto:carl.zhang@intel.com">&lt;carl.zhang@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v6.8+
Acked-by: José Roberto de Souza <a class="moz-txt-link-rfc2396E" href="mailto:jose.souza@intel.com">&lt;jose.souza@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 32 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  2 +-
 drivers/gpu/drm/xe/xe_vm.c               |  7 +++++-
 5 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8724f8de67e2..779d7e7e2d2e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -328,6 +328,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
  * @xe: Xe device.
  * @tile: tile which bind exec queue belongs to.
  * @flags: exec queue creation flags
+ * @user_vm: The user VM which this exec queue belongs to
  * @extensions: exec queue creation extensions
  *
  * Normalize bind exec queue creation. Bind exec queue is tied to migration VM
@@ -341,6 +342,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
  */
 struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_tile *tile,
+						struct xe_vm *user_vm,
 						u32 flags, u64 extensions)
 {
 	struct xe_gt *gt = tile-&gt;primary_gt;
@@ -377,6 +379,9 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 			xe_exec_queue_put(q);
 			return ERR_PTR(err);
 		}
+
+		if (user_vm)
+			q-&gt;user_vm = xe_vm_get(user_vm);
 	}
 
 	return q;
@@ -407,6 +412,11 @@ void xe_exec_queue_destroy(struct kref *ref)
 			xe_exec_queue_put(eq);
 	}
 
+	if (q-&gt;user_vm) {
+		xe_vm_put(q-&gt;user_vm);
+		q-&gt;user_vm = NULL;
+	}
+
 	q-&gt;ops-&gt;destroy(q);
 }
 
@@ -742,6 +752,22 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
 			return -EINVAL;
 
+		vm = xe_vm_lookup(xef, args-&gt;vm_id);
+		if (XE_IOCTL_DBG(xe, !vm))
+			return -ENOENT;
+
+		err = down_read_interruptible(&amp;vm-&gt;lock);
+		if (err) {
+			xe_vm_put(vm);
+			return err;
+		}
+
+		if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+			up_read(&amp;vm-&gt;lock);
+			xe_vm_put(vm);
+			return -ENOENT;
+		}
+
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
 
@@ -749,9 +775,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
-			new = xe_exec_queue_create_bind(xe, tile, flags,
+			new = xe_exec_queue_create_bind(xe, tile, vm, flags,
 							args-&gt;extensions);
 			if (IS_ERR(new)) {
+				up_read(&amp;vm-&gt;lock);
+				xe_vm_put(vm);
 				err = PTR_ERR(new);
 				if (q)
 					goto put_exec_queue;
@@ -763,6 +791,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				list_add_tail(&amp;new-&gt;multi_gt_list,
 					      &amp;q-&gt;multi_gt_link);
 		}
+		up_read(&amp;vm-&gt;lock);
+		xe_vm_put(vm);
 	} else {
 		logical_mask = calc_validate_logical_mask(xe, eci,
 							  args-&gt;width,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index fda4d4f9bda8..37a9da22f420 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -28,6 +28,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 						 u32 flags, u64 extensions);
 struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_tile *tile,
+						struct xe_vm *user_vm,
 						u32 flags, u64 extensions);
 
 void xe_exec_queue_fini(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 771ffe35cd0c..3a4263c92b3d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -54,6 +54,12 @@ struct xe_exec_queue {
 	struct kref refcount;
 	/** @vm: VM (address space) for this exec queue */
 	struct xe_vm *vm;
+	/**
+	 * @user_vm: User VM (address space) for this exec queue (bind queues
+	 * only)
+	 */
+	struct xe_vm *user_vm;
+
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 052a5071e69f..db023fb66a27 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -350,7 +350,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		flags = EXEC_QUEUE_FLAG_KERNEL |
 			EXEC_QUEUE_FLAG_PERMANENT |
 			EXEC_QUEUE_FLAG_MIGRATE;
-		q = xe_exec_queue_create_bind(xe, tile, flags, 0);
+		q = xe_exec_queue_create_bind(xe, tile, NULL, flags, 0);
 		if (IS_ERR(q)) {
 			err = PTR_ERR(q);
 			goto err_ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f9989a7a710c..7973d654540a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1614,7 +1614,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			if (!vm-&gt;pt_root[id])
 				continue;
 
-			q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
+			q = xe_exec_queue_create_bind(xe, tile, vm, create_flags, 0);
 			if (IS_ERR(q)) {
 				err = PTR_ERR(q);
 				goto err_close;
@@ -3571,6 +3571,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	if (XE_IOCTL_DBG(xe, q &amp;&amp; vm != q-&gt;user_vm)) {
+		err = -EINVAL;
+		goto put_exec_queue;
+	}
+
 	/* Ensure all UNMAPs visible */
 	xe_svm_flush(vm);
 
-- 
2.51.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0PeVxRVOLjoSN2tOXoLuMlDy--
