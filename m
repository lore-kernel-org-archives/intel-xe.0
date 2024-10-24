Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE057CE8E71
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B4110E933;
	Thu, 24 Oct 2024 13:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsDzq+yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC510E933
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729774873; x=1761310873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eI1+v+mnJBvxJdP7nr24Rztyr8RRzFD7QNRcPfcRytY=;
 b=KsDzq+yyRnX98Y5ktB3tZJRplrOtwde3x8jmsSCjwKi1+aXLL8JZyL1e
 7nothLzTJ/ipTX9qIcN2EY61ZJS9crbebM8YCqEZ8j84M8i+cd9/8ErVA
 L7cGgjEY2VR0tLHC2MFAAATWYiz2XzdGF4ntlwFWX9Dv9ooqjYvUPY4sP
 VZUp/BnTR8cwrWODojs0kPZ6tkvSV4Z8GTAZbZc0EmpPIvLIsb7+0dun4
 33WR3wh9KL9dON7LLDBgdDEdtIfXPxWGGAJAEDNBz6w7qVl8ggkL0QrWH
 Vq80tLLzZoDHVYFfQaUuLFKROmoBOGmSiSAHRWNFbVGrC+ioELD57z05F g==;
X-CSE-ConnectionGUID: AkHkokzETqGFaGmx71HtyQ==
X-CSE-MsgGUID: UZ40osRHSNaRd0/Cu+K4ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17028636"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="17028636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:01:12 -0700
X-CSE-ConnectionGUID: K7WMIJOnQHuqRjBHsgX5iQ==
X-CSE-MsgGUID: 8mVv/CVpSsuRuCJylRhj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80759699"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 06:01:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 06:01:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 06:01:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 06:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3u1PaEyxFT/3qQe8fitav0o+nvZZt/QVNmjaem/rDpoGOpoW9t60ayPD6F8bvkVC/LL37PUlDhGfC6v5WEygzlJzD1sMeyGLa3G/Rk69D76zZTnB6Mo+8qbPBfCFaHcSfgJSTa4FOMpU58pfx2xCCmuML12H01ff1t1U2OGL83cQSuEAhwrepNRzXf4R0oxlil6QTPeTFh+z0PRfxphuK/2HRaJL6teeE0GVgfgM11r4ap1WPNBhJauQ1PuXBI3jce2FXjUExopVqelCFfgwImuqHUsDMOpcKmV0Yjj0sxwJrwugjeT89WayIFaVy//CTzWOZYinHjEfMfYAliryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MHSyJYQEvl3dQB0LyhqSIhC4g2qsJSowb2MRebymvI=;
 b=m5hZ+KE0zNq63T8YkytXFu4dgisRnHJObpK2h+cCEKOcxWVHer12XzxnnvOnUWRiLzeBytKZpYfHkY+oZ9zQ3sYLd62jsoR9sU+bDTASf5PsOI4+C3aGn99aHmcy7HacFRvYAYWdRsHTzFqKejm0KczjhIvSRf7pS2rTRVDtukJWc8R8H/Z+uncQn13ECZ7Fv5QWJuoAYohMzfmmVPe1xYgMB5YyWuZNCX/uUBhgvQlBvJUmYEtA8ur4js9w+1xb9BZTDNCXvRR/luDmDsBVU3YyF7seLpXdrAj2UR9VuWhs4Lhe84c+jggy6gGRDkSOiYx4fk/5fEJF1znnKSbEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Thu, 24 Oct
 2024 13:01:05 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:01:05 +0000
Message-ID: <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
Date: Thu, 24 Oct 2024 18:30:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, John Harrison <John.C.Harrison@Intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Anshuman
 Gupta" <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
 <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::20) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d7ff35-3c7e-464e-4e02-08dcf42beb52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWF1R1NCZ0M2Z3JuOVhoS3dYRmlMSDg0dGMyQmJxTmllWFRja0krcWtCQTh5?=
 =?utf-8?B?RmtUd0ZoTlV1bG9oM1dyMy9aQy9mWTdpa2lXQ3BWeldQbGdBV0hPOVpXL0tv?=
 =?utf-8?B?RFR3Wm1oK09qYUdENy80dU9HTEo0VmM5LzBVaE83STJSMkxITTBramtlUjFy?=
 =?utf-8?B?akR5enoxdklDVDNWSzl1OVQ5d0JrUFNUZ0J1eGRLVm9WYUdmLzFvdEUwSDky?=
 =?utf-8?B?SkFlTERaeThCeW5XMUYxbGYvQTR0bWU1T1YycEdQbDRFUCtYcUhOeGdrcUI3?=
 =?utf-8?B?ZkVqTFoyQTNuRjNRNm14NWl1akgwTTBBV3l1TjZhb0hxTmIwbjY1emxMQWJM?=
 =?utf-8?B?T3ltQUtraFROVDZyVXJiVWtHZTZPYnRyVkFwV3BUWjRSQzRtV3RFaitPYmpx?=
 =?utf-8?B?RDVFVEtjMjZaMlRhTGE5UExuTUN5SHM1NnpaVUZ4VGU0cFdYZXFZU0xnSUhq?=
 =?utf-8?B?V05oSWNWVHdGaEdJaFZSd0dMMkh2Y21JZjUrbXFOclp3a2FjUFNIQlJiM1dm?=
 =?utf-8?B?ejIva0EzL2hvNzhoOHZ3cTRGTGJ6MkZYMll5cWtyVFNlOHlJN013WW9oVDFV?=
 =?utf-8?B?RkdCZ0ZWVW1BR2xicmFNTnllM0J2NHBjRTBWMkVZdDlVN2VIdTlEb0tjWDVJ?=
 =?utf-8?B?ZUdaMEplSmRUYU1DUENEWXQyd2tUVjFXNFJrZmQ0ZDNjakFoK21RUjB5TUdZ?=
 =?utf-8?B?UUdqdmVpbmJtVFBDOXRDaWxnZUZXakx0THErOExUNUFvMzFodVBIK0Rka05Y?=
 =?utf-8?B?VUhHWldLN1FTWFhRS29GdkJTZ2d6L2xBeVN2VlBOa0VYZDJUNC9hUTBGM0Fz?=
 =?utf-8?B?MlF2RTZuZS81dU9UNHA3UFJRSzdBRUNGN1UyM1pJRmNJWi9Wbmd5WlRMSms2?=
 =?utf-8?B?bDBBRFVSWnZNMk1RVDIzSkI2MXR4eHpEcWR1cWZoOXdoY1paVGwwbDVjNTh3?=
 =?utf-8?B?QnNYWWJPWE5rQWVNMTc1c2NxbGV2WXJjZGxxZTlrMkwrWEtGajRlMS94M0J0?=
 =?utf-8?B?YnZ6TVRQeXIwUVpZTC8vanlrMFR2TWdONkdPMXZDUlk5THdIQS9PaFVmV0Ur?=
 =?utf-8?B?VTE1b1JjOXk4Rmdnb0gvMlFWRGQ0YTB4ZU8vckJmTkw3T1VLa0JUMkdDVE1s?=
 =?utf-8?B?ZGlJdUlXTnV4eW9ENUdjazNZQ2wxZ3ArekRFMjJhbGI4Y0IzNm5aUlE1SWx3?=
 =?utf-8?B?YXozanJSMDFkUDVmNDhRN3BFUmsxdzExTGtJSndmWmVsQVlXblZSbzN4amhh?=
 =?utf-8?B?dStGRWR6cDVLMXFDMmdpNFBvaGMrZVhtWDhUYnpMZzhlTm9INzBWdU9SZXhU?=
 =?utf-8?B?SnUvMzZuclFhWWVnZDk2ZWVVbDI0ZGl5cmVnbWMrUFREMHpXaW5qTnJHMjF3?=
 =?utf-8?B?UE5MWW81UUpMNmJwc1N4Y0ViWmUwSEtUdkh2RWhTeTF3L2dSalhvWXRNY1VK?=
 =?utf-8?B?bkFqRy9rdzF6Ny91dVpaMG9WQk03WVlWTEFiNlJYcGlWV3FsV3BKUnByUjVv?=
 =?utf-8?B?SVNmYkNpWFUrU05XY3U5T0c4bzdtSjVHYVRnTlNha0hjVlRSTUpGQVRISnRo?=
 =?utf-8?B?TVZuditvQkpqdUxkL1RreUxCTUpTN0ZuOFIra1QyUTNXSW5sck1qRWVPVGVt?=
 =?utf-8?B?WDlPWEZ3aGg4YTJBeW9Pd0pTRGpCQVlQYUJpNlptM09BUncvdEFYTThTcE9T?=
 =?utf-8?Q?jKWTi0JP8VyBEG+DYu+9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NIU0ZoZ1RTUEV3amZRV2xoTFJJR3pmWStsdThpRGI1OTVKU0xYVmRXNDQ3?=
 =?utf-8?B?ODV4Wkd1ZElvWllXMmoxc1ZIbHB3bjFrOTJkdWtpV1NSb2ExTi8weHlSK09i?=
 =?utf-8?B?VmtHeEI5K3hOQ01iazlMK3Z6dUkwQVZKVGdCQzFnTnFEb3BjRFRmd2pBRFRR?=
 =?utf-8?B?VSs3dzlUN0RTY0w4TDFnRWZkZmgyYXhTS2J5NlNwdUZOVGRHNUZMdWxYVlg4?=
 =?utf-8?B?RTVTa0p2YVJYYkZTTWVNcGpmZlRNSGdaM2JOU01UZHQ3ek1OWDhSTGlWQm01?=
 =?utf-8?B?VDdVMnVDOExXSUtjelJ2a1RNcVgyRVllN3Nna1FjOWFLUWEzRWpLK2tTU1dB?=
 =?utf-8?B?cG1NTldmRGk1d2wrQlBKN0p1WWI3OXh6c1VOaU1YRlB2bWIvMjJsQkFnTGZS?=
 =?utf-8?B?c1dqR2VhL3NKTklldW1qb1ZlZjQzRTVtczZmVFdYWkJ6MEJGOHJETnJaMEJM?=
 =?utf-8?B?YkdDakUrTkdiK2xWS0hjRUEybVBSSitybXdYRmZhUGo3UlJhUENlZTB6eEpx?=
 =?utf-8?B?NUszUEFrUzNtNlJWSWgrZi9UWlNqcVV4SG42Y0o3MDlWN1Y3V2VobUhXUEpp?=
 =?utf-8?B?L1A2K2wzdWRiM2ZsdEswUTRHZitJNFdVR3dJNWk4OEQ3TmdwU3RlbjFEemEr?=
 =?utf-8?B?L3g2WGdqZXVMUjBSMERNTXhYSTgzNWRVRUxZVGlEc2xQdzJxb1lCZGRYVUYr?=
 =?utf-8?B?UDcxU1B1SFpUNjVmVUk0YWVtYlJhemdMTU1ReUR4RXhhZ05hN3lFcVBkczFU?=
 =?utf-8?B?UThZSXd4OTkwK2R6Qld2VzJyb0xGcElVSGMrVmtDSWRDMGdnNkZDYzI5NFV3?=
 =?utf-8?B?R0oxQm5BSHpjZ2l6K0s2SzZkQytNUllhaSs1eG1hdG1ZOEpNMnNOZnZRVUZx?=
 =?utf-8?B?NmUxeGhWdSt3eGFlejhXQThzcjBmbjlWMUlmOUFPRkhsMHhPQkg2bmxEc0hy?=
 =?utf-8?B?TUxpWGJDdXJIQUlEek9qZ0ZFZm5SNUU4dEhRL1AyejEyWTUwalE5MWM5cGti?=
 =?utf-8?B?K25WbTNhUnU2THIwRXRibmwzVmRHYWU2bVkxR1hHVHJwaitNY3gxUGFiZ0ZK?=
 =?utf-8?B?TFhiQlNacC9SdHpVQnlVOTZJKzhkVEdsRlAxYzMvTEtKSVZua3graUxULzlK?=
 =?utf-8?B?dlRFbExkVk9lSGRUVmdNUkI4cCtSaExlTEtwQ2YzeHBZRDNJK0REdm9PcWdV?=
 =?utf-8?B?SHVIMWhSR1ZrQUJUS1IyUnFCS2h0OEpYRStKZ3YzZXl3YWNqaWhtTU9JMkFo?=
 =?utf-8?B?cjU3N2pUaTNJWFAwS1RkenUvVndWdmNWQjRVZEhJMmdoZVZNNEpQU1NJVnhB?=
 =?utf-8?B?UTlsRmNmRnVzRGVKaUtlZ2o2TnNic3VpVHEzNlFmK21pWjI2RGVTOTZNNndR?=
 =?utf-8?B?c2NaUkk5UVIyeVRnTG1pZmlZZFJxNm1neTNzNlVQWittTTNDY3RGUXRJV09n?=
 =?utf-8?B?Y3h5Z1FpOWpRdytvM2V1U1BZTTNnaXJGVDhmbjhjQ293VFIvek9kU0RHNUJU?=
 =?utf-8?B?b3phL25mMFBJVFJvMWJlYzFZbkJ3dm5WS2hZVWVSNmFiekJHV1pMMEs2ai8x?=
 =?utf-8?B?enROT3hZSkhsdnNDR1VWMmpaR1NRL2JUcnkzend5dnc5RXNyZDBlZ3FHUmdk?=
 =?utf-8?B?V2c2Nm5iS1JkVDdyRGFTZGFwVzhVWXN5UDVjUkE2TzN0czFTYUozM1NRWXBW?=
 =?utf-8?B?MUViRE5HTXNNNlc2MDdDQlNGRllLREt6bWNML3lkVzVzV2Zma0poZW5RSHlK?=
 =?utf-8?B?bmd1b0tiOVZJVjd0MDJtTDZSOFpUR0dMb2FoWndOTm9TdzQ5ZU0yd01YQW9s?=
 =?utf-8?B?eldjdEpZZFN2enQyS2NuUEZVVHd0ZmpjemNpN1NQenNnY2EzcFVWeDJzNXJJ?=
 =?utf-8?B?NGFPVXRHWUFMR0hTak90OXVjU1NCclg5cEdVdjBaVjVGWEJMcUJRMEtpTFJJ?=
 =?utf-8?B?MmE3UFZ5YkZZQVhqRkhBc1h3TDVuZk8zc3VvVEIycUk1RmFzTXEreXpIQmZv?=
 =?utf-8?B?ejM1M0p2ODhFbHZreU1vM2Y0TkdJNjVLZFdxK2E5dkFrekR3L1hiSkdzcjN3?=
 =?utf-8?B?d3hXSmFBS09KcHJJUjI4SEVQWWlJUFVERGI0bW5yVERsQkdYVnpRR3hWeUhl?=
 =?utf-8?Q?9ATyaf1LJthkfblMST5Ae9HtI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d7ff35-3c7e-464e-4e02-08dcf42beb52
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:01:05.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zC3kn8oiwzK2rxf71aQhQ9U/+z+/FOmjilhxJmBERjC4xIgtIf/5cIIyM2+sOCjCWWfqUcxhoLMu3Hc2PrfCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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



On 24-10-2024 15:47, Nirmoy Das wrote:
> 
> On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>>
>>
>> On 23-10-2024 20:43, Nirmoy Das wrote:
>>> Flush the g2h worker explicitly if TLB timeout happens which is
>>> observed on LNL and that points recent scheduling issue with E-cores.
>>> This is similar to the recent fix:
>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>> response timeout") and should be removed once there is E core
>>> scheduling fix.
>>>
>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> index 773de1f08db9..2c327dccbd74 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>        struct xe_device *xe = gt_to_xe(gt);
>>>        struct xe_gt_tlb_invalidation_fence *fence, *next;
>>>    +    /*
>>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>>> +     * in case of g2h response timeout")
>>> +     *
>>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>>> +     * fixed on LNL Hybrid CPU.
>>> +     */
>>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>>
>> I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ handler itself. Is this change solving the issue.
> 
> AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.

Agreed, it does handle in the slow path as well, but upon receiving an 
IRQ, it will be managed in the fast path.
So I suspect this is a case of an G2H interrupt miss rather than a G2H 
worker delay due to the efficient cores in LNL.
For now, this change can proceed as it is helping out, but considering 
the possibility of an interrupt miss, I suggest debugging from that 
perspective.
In another thread, Himal mentioned that this issue is also observed on 
BMG, which strengthens the possibility of an G2H interrupt miss.

Regards,
Badal

> 
> 
> Regards,
> 
> Nirmoy
> 
>>
>> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>> {
>>          if (!xe_guc_ct_enabled(ct))
>>                  return;
>>
>>          wake_up_all(&ct->wq);
>>          queue_work(ct->g2h_wq, &ct->g2h_worker);
>>          xe_guc_ct_fast_path(ct);
>> }
>>
>> Regards,
>> Badal
>>
>>> +
>>>        spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>        list_for_each_entry_safe(fence, next,
>>>                     &gt->tlb_invalidation.pending_fences, link) {
>>

