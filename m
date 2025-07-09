Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634EEC83F10
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 23:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20510E0F2;
	Wed,  9 Jul 2025 23:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEjcWbKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE1010E0F2
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 23:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752104706; x=1783640706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pzmmVld1ppgzc3qZ1P/i9fYk8Fe+JE/cDpTCnj7EeSQ=;
 b=lEjcWbKmPN+aXLOjUNMJtVpkrahVzhX9IcKx4nBxcLu2MX75Ic/BhwXd
 ah1mP84RUNWQlDoD55TPDxpgsTLnlWNOxE6OgCnL7XuNPmdszhtNkHPZu
 tAjE2toflrx4cw++THERAOyxqo/miKYRBvJOUbkyEolmuj/rUt1K3ti/e
 vhw1LmUuE1uC/OGm1CAeFfEIchxmwTXbJAwc0xLJntkORnDj9/1yprZQY
 KQs5WXtnp9lHlGFgIC3X+qWOoyhOWKY/ZlhhyWf0Izxcq7BkP8bUH44yj
 bppphrUzzwsdIxou+jqn0nOuSyqoAuauw7iq87Ht047zH10xJbw7aO01+ A==;
X-CSE-ConnectionGUID: uRG+QXCgQm2nLopqooMZJg==
X-CSE-MsgGUID: wGPzrA7/T+Cii6vGRGE37Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65076103"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="65076103"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 16:45:05 -0700
X-CSE-ConnectionGUID: lr//of22Q0KRD+F61VrhsA==
X-CSE-MsgGUID: egf6SRfwRyu428TJsosDnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="159936145"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 16:45:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 16:45:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 16:45:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 16:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp9yupsm6KVaUJMOhAZhixa8BYqv5/2AbgM6q0UFPcVlseO031tHaRhTjmub5MpoCDdmdiPXCZCbOQBbnRdHMTysKSjFPqbMNBil+vnceGyiqKmKDRh8kNrImBygjCW2dcZE2KTys540N5psoeuB0qXNR3jIaJfxS8Mx/MNcypvQyERbH9PYI7qPWJHBNsRpC5Wh3h39cdxcVQ8p2gjZ58m/GY6wqOkAqcvkrM6tlhzgxuSgzQUKulZYisNG16QhAijNDxmYhlp16bDVlOHHzZFjDly2+D+ZQ/LjMVb58PzOw2D9w/4W6+wyvPp6Kt7xqsBr5G02qy9uK5Bomg7udA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCPXKyF/H3tSQSux5/s09SHWp5i0oeCXdevb2NLMH1Q=;
 b=K2xjQO6wEH4RokUn8teaWN15wJBv/XuIFVxhzLmbQ582fLSPkqlyCxLYBIBmYZovGnPxtg8mdlurblPdXxQNUZOrfdJ65SN2Zzq/O9Mqvl0FVQ8xegn5DQIXV75fI2ludeMFS+bEk3KYAjWXDTOwJ3TcGzESUmN1El4+2pmFlPv8INBoOsuXqgr5Q49rFGZgp42ryHlsZHLtfmvSHJmB1vvyJbwnzkSHVjBs8uyjB+X9DsDroV9PvoOmvlDBOO9GFl3eZ7XBMQ8/FS+5H62q3KNaeq72nNfgWyIApEfqS2Vw8GhelH5zwzApSAxs1B7ppmIPpQGasNsPRh7fHKh6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 9 Jul
 2025 23:44:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 23:44:53 +0000
Date: Wed, 9 Jul 2025 16:44:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v4 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Message-ID: <aG7-7Lqw79Y8azK1@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709112024.1053710-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0304.namprd03.prod.outlook.com
 (2603:10b6:303:dd::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a39f96-ca04-4ae7-8074-08ddbf4299fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFdXUDIyckpqdDRDL3QzenRUMGFRR0V2UUZ3YU15ZTNkaHBHOEZEd0ZuQTJ5?=
 =?utf-8?B?ZHA2S1NldlVJcFFmQXVtLytNWml6NXVqbUpZeG1EVUJ6THVPRzFhamlKSU91?=
 =?utf-8?B?aExzQWFpNFdGMlBSbytvT0RGd3doN1Uwdk9DbHFyNnNkN3FyQWZLcWlkblA0?=
 =?utf-8?B?alVLNzFTOE81VHRuQXVRWWh0ZVFQT08zMWIwVWgxczJEN3d0ZlEvMXl6NE9L?=
 =?utf-8?B?djRzVGpROGZlbjNqZUZwcWdBOW1NK1duSE95OXR5bzUzUUF5M0ErV0ttdUd5?=
 =?utf-8?B?V3h1QTdxeGd4dTl1N2hWUG0zWHVDZlY4WmM0RmhEd1ptMUgzeXE5L1VUZjNB?=
 =?utf-8?B?TjhQVFExdWd4ZW1NREFUMG1MQmRjR2JjSmdScG1xdkU1SkxZeXFzTHR5NDlO?=
 =?utf-8?B?NTl3MnFtMklqUkxIczBtK01SZHdQSnI1cVBTYnhLSnF1R01ncEZqZlM5RHNq?=
 =?utf-8?B?Szk0cEZrenRxL21ZVXROVUFoRC93Q0V6cURoMXdWbFN3OGtUWDg2My81ejha?=
 =?utf-8?B?bUF2Tjd3TmlqT0x3dVl6UjQ4WVNrODdpVnIxbXh2QnlDV0dkMWZOdVNRUkI4?=
 =?utf-8?B?VTZKb2s3VEY5aUEyRkxCVm11TkJYWG0zQkdWbG1DMkk0eWJTd1ljZk00eXU0?=
 =?utf-8?B?eWNBNU4vaWNBQm44TTRobUVQampSVmQ1MlZzd1hqMTloMVR4MjdlR0NHVHhC?=
 =?utf-8?B?bVBkYjBFZHIwSGVNUFN4dkEvNGhoNnc2eGV6ZXdKd1JPVitvNjFzZ2w4ZmhI?=
 =?utf-8?B?Vk8xZ1pXNEJtR1RXODd4bmpCejVBUE9aVmVvbFdDWEJQNUtSQUF4OXVQTXF4?=
 =?utf-8?B?VWRNYjlqYnZ6cStQYjREWHR0VWNFZ21kU0N2cW9veStmbUdaNEIyVG44R3Fq?=
 =?utf-8?B?Z3U5VldTVS8rMFVaRjIwdGwxOEV2dEEwSEV4OGc2ZVZqcWs1Vk54NnJXbnR4?=
 =?utf-8?B?eTRJZGhqbk52bUFZU0lCU05LamVXUHlnbUZyOEF2RkxVTS9Wb0ZqNTZoNHV2?=
 =?utf-8?B?YnhuSTZ0bllrMmUzaEwzaFN1VGhtSUtuS0lhK0JKWmNXbHYvTExkYjN5WVky?=
 =?utf-8?B?dU1jZ2JHWUVodHBES240V2tvd0VEcnJQRXhDK3NpVE05SHdLbWVRM2dReHhE?=
 =?utf-8?B?R0s5UjhoZk9EckphMWRIMkYyVmhhNk45R3B4S21vbEVRbCtQSHQrTVY1WjJx?=
 =?utf-8?B?U2tsazVPQlIzeU9GelFaM2Z0aXo3cGlBYWd5QjdKdVdKbVBSU2xrM0RSMnVP?=
 =?utf-8?B?eENxamxRd3FWaTZBRU1aSHVkNTdxeHJpclFCTk45UUZ5am1tZ3RUZk9QWmhr?=
 =?utf-8?B?WWN0RFVxMGRvNllwSFhHcjdwZWkvQ3Q1N2tUMXFoaU5Pa3VxK3lTK21iMVVw?=
 =?utf-8?B?aVhrUzdiVWJqUmUvMi92YWpRbXBtUkhtc2xCMHh1eUdQSEpIYW0vRmpacG5C?=
 =?utf-8?B?RWxiY1AyNEZ3QTVPcVNVa2djbHV2d0lmdnZobnBQWThrdnBNd3c2SUorRGli?=
 =?utf-8?B?Zjd5STBTZGlpVExCOFdtUUF2dC9ES1RkR0ZkMTdXdTdHR0tSSm9LSGpGcUJ0?=
 =?utf-8?B?UVd3cVI4SEF0c3VQeFZSL3pQYXBVYUpEeEd0QVoyOTJXSTlLUTM4c0ZBZ0xV?=
 =?utf-8?B?WXJhOFhkT0xXMThpWG1KNXJ3ZTIrTjcyejdhUTlkMmdwRGc4U2E0VlZIWFJq?=
 =?utf-8?B?OFdGNVNlRm9lUis4dm1lUWg2M3dxVG5yNEpLaElwcTNOV1RLM254UEpGWjVD?=
 =?utf-8?B?ZzZaMFRXejNaakZ1enBNL09vVE5GTGhYYjZERFh1Z1pZbHNWdHFlck14VGRP?=
 =?utf-8?B?Z1R4NVdEMmVJUTI4QjdoUlR4RGtyeHFsNHJDbVdNMWU1WGErVzMyYmRzSFRm?=
 =?utf-8?B?ZnRHSndPVEhDMVdobzV0d0dyTEJUQ3ppLzNHWGV0NXJYcmZNVml3eUoxYldB?=
 =?utf-8?Q?CmBQvmBPthI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTAveFpWVm41TTdkbHBLcHFVZmpjYTVYMzhaMTJTdTZnNHQrQnFhcW9vTjY1?=
 =?utf-8?B?U2xBTXYzNTZ1WHZ3RTVKNldqRkZMcU5HT2txMXNBbXpEWk5BSEtxU3dwN0k1?=
 =?utf-8?B?bXhZSlZhM25VWndJcHQ3STNkeHhZMHJUL2UrekswcGFMbTJGbVVEcC8rWG5k?=
 =?utf-8?B?eEVoc1lVSHVEM0JNemoxdGQ5b0R0dVhiMHd5cit1bm0wMTYwc3pyR1ZjdTFL?=
 =?utf-8?B?ell2N2d5Ni9HSlZIOTBYa1FYK3ZpcU1FdWVKendVaVJXYlJCSnR1Z3FKUTBZ?=
 =?utf-8?B?dTdHdmx1c0kyRWVFY2JtR3IxcVMzdU9wMStDVlNuYkQ3QmxyTlpjYjJISHN0?=
 =?utf-8?B?a3VvcFRRamRZcFhiWDFwUkQvY09tK2tSdy9CYVpwbmlqTCs2WjNCYy9MYkJq?=
 =?utf-8?B?OUo4amVTUXFVU0dHTWo2aUlwam8yVm9Pd3JKNEVxUm96VzZhS2lYanptSXBt?=
 =?utf-8?B?bWZmQU15T0lTUTRXMjhzb1BDOC93NlNjV2thWmE1V2FRdktGdDM4Qm9leXFL?=
 =?utf-8?B?cFRRRkRvWm5VMTkrUjJ4Wnd2VktDWXcvM001MGZwbFVMTXVpMStkMlJMWWh6?=
 =?utf-8?B?cGtEdTJDWlZTeFprMlg5bEJWenRYYmNlWG93V0xzZFhkeHhmTTlDNkI0dTlx?=
 =?utf-8?B?M2lxMEdscmNOR2cvaTVCRXJGSFExdWpzTlF4RDc0bTNIWUJJTUYwMXlUUkZ2?=
 =?utf-8?B?dW55amcxazZMWXFFV1NxR0lLaTdMSVpjcmpvTTNvMHJ5N1FYOVNSK21SZnRx?=
 =?utf-8?B?eTd5MHFkMGZ4M3pBUFRieG5NdGRaTEhwZ0RxUTFzWFZWM0lja0ZLZGVzWVJ0?=
 =?utf-8?B?VWFka1hXemNwbWRoTE00ckcydHdINUg4MXVLUVR0U21FOHRvTDdEOHRaNHZM?=
 =?utf-8?B?dnRURkNQUDRwSEE0TkJzbTdIRHV1VVFoSmU2REYrTnNlbXo4K1BqeEthNjJJ?=
 =?utf-8?B?bXJqOWh3bXh4QnczMGtEeUNhLzF0ZWM4SU04MTlRUjljc3RwYnEzTG1lVzRV?=
 =?utf-8?B?ZlZ0dEVSbmdyMjZCR3k3OXZENk9xQzBNSGtHOXdqODc5NzdQMmlOV1g4Yk1p?=
 =?utf-8?B?NFVSV1lDZ0VpcWtsUUdRZ1oxbHA1TkdnT3Y3elJyZHptRENKQU5HZU9DWm9H?=
 =?utf-8?B?MC8xV0NIbzFHcWE3aUxJUFI3SjdSNCtHNE1lbU1iMTR6NU11NnpaR21EcXBy?=
 =?utf-8?B?a1NlVVYwaWtKSTRFWXcvR0Z6SHl3OW12cHk2SXpDZ0QybER6bVJHOFUvWW5i?=
 =?utf-8?B?NFNnMEdWaklqOWhtWGhPamN3Wm5YQ2Z4eVNDVzRCTngrN1NOOVlzTXFJTFhP?=
 =?utf-8?B?Z3htZnNDb2hqZ1BhSkx0TWJsVEFPcWtVc3lucUVJcVNQd0x6NTM1VmRzcFBZ?=
 =?utf-8?B?cWFJd0tGNmFPWGZWTFlyWlRvT2ZpeVJ5R1VTaWo5aFIyU3RLM0pTL09yelFq?=
 =?utf-8?B?bnMyaWhlTVhMTER2VjdJZ3lvWGZnb1dpZFY2WW5OeDhYbHY3U0dtejMwRE9J?=
 =?utf-8?B?dDZTZEVXNC8rWGtQNW0wRGJ6YnFxU3NjbVEza0pEMmR1cElON0xNZnpMQWNE?=
 =?utf-8?B?cXVobHE1YlBwckw5UFY2RTkwditIYmwvcFc3SndOTVpmdENlaUJ1QTFlRXBF?=
 =?utf-8?B?bDRCcTNNRU9VMmEvbzBGTDVDbG9VN0hEbEdZYkMxK2hlUElicnhIczBETkZ4?=
 =?utf-8?B?Wm4vQVNBWWhyT01yZnQvWW5RSktvNlBaWEVSbENlaVk1aXJ2QUZjSmExeVB6?=
 =?utf-8?B?Y1lqdlJuOVB1WVN2SGhaRTlwN3VTUHk1QlBjMThQdTVXbmZ1TjhOZnpBTXgv?=
 =?utf-8?B?MWFjNHZBZHlCMlF4anAyNnFOb29VV3RMNHh4c0RMbWpqTDlsMER1dERCREVt?=
 =?utf-8?B?eWpNNGMxZmJMZVhnRE1NSlJDMnJKekptYkpRUndQL2tDTXNhQlJBY2RBeWl3?=
 =?utf-8?B?QUl0ZlM2dERjcVNnVXZrVmo2VzhEME1oYU9Hc1ZmUUpKZ1RuUDdwM2J5UzdX?=
 =?utf-8?B?OEYzU0pURnN4VlJkRXNrYm5rRGNta2JSZ1YwY2hOMkJ0WXMwT1lCeXFPcmsw?=
 =?utf-8?B?NFY5R3FiQnJEeUdQZVdWMUp0RTlTSFB0VkVTVWExZGxjZFl0YnB3Y3lIWDFs?=
 =?utf-8?B?SGhpUlNBSDZvZVlVTzlSVHduUUtvZVVZaSs1RkN1VXpzWFZIakMrb2loVytM?=
 =?utf-8?Q?vPrwvPVTCRphCKVrRDXcrrA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a39f96-ca04-4ae7-8074-08ddbf4299fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 23:44:53.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOqppFDBNufYIzoydh5BiA65bh9IABs7vfpPgzmQTKp0N73tTRzF0EzyAr0ETaozyMstS6KX1pZ4wlLuRstqH8l//a9TuqsaFyY3bnI1Ybg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Wed, Jul 09, 2025 at 04:50:17PM +0530, Riana Tauro wrote:
>Certain runtime firmware errors can cause the device to be in a unusable
>state requiring a firmware flash to restore normal operation.
>Runtime Survivability Mode indicates firmware flash is necessary by
>wedging the device and exposing survivability mode sysfs.
>
>The below sysfs is an indication that device is in survivability mode
>
>/sys/bus/pci/devices/<device>/survivability_mode
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_survivability_mode.c    | 42 ++++++++++++++++++-
> drivers/gpu/drm/xe/xe_survivability_mode.h    |  1 +
> .../gpu/drm/xe/xe_survivability_mode_types.h  |  1 +
> 3 files changed, 43 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>index fefb027b1c84..ca1cfa13525a 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>@@ -137,7 +137,8 @@ static ssize_t survivability_mode_show(struct device *dev,
> 	struct xe_survivability_info *info = survivability->info;
> 	int index = 0, count = 0;
>
>-	count += sysfs_emit_at(buff, count, "Survivability mode type: Boot\n");
>+	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
>+			       survivability->type ? "Runtime" : "Boot");
>
> 	if (!check_boot_failure(xe))
> 		return count;
>@@ -288,6 +289,45 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
> 	return check_boot_failure(xe);
> }
>
>+/**
>+ * xe_survivability_mode_runtime_enable - Initialize and enable runtime survivability mode
>+ * @xe: xe device instance
>+ *
>+ * Initialize survivability information and enable runtime survivability mode.
>+ * Runtime survivability mode is enabled when certain errors cause the device to be
>+ * in non-recoverable state. The device is declared wedged with the appropriate
>+ * recovery method and survivability mode sysfs exposed to userspace
>+ *
>+ * Return: 0 if runtime survivability mode is enabled or not requested, negative error

is the "not requested" still applicable here?


>+ * code otherwise.
>+ */
>+int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>+{
>+	struct xe_survivability *survivability = &xe->survivability;
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	int ret;
>+
>+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {

Do you think this condition can be better handled with a 
has_runtime_survivability for platforms that support it?

>+		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>+		return -EINVAL;
>+	}
>+
>+	ret = init_survivability_mode(xe);
>+	if (ret)
>+		return ret;
>+
>+	ret = create_survivability_sysfs(pdev);
>+	if (ret)
>+		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");

You do not return ret in the above if condition. Is that intenational?

Regards,
Umesh

>+
>+	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>+	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>+	xe_device_declare_wedged(xe);
>+
>+	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>+	return 0;
>+}
>+
> /**
>  * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>  * @xe: xe device instance
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>index f6ee283ea5e8..1cc94226aa82 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>@@ -11,6 +11,7 @@
> struct xe_device;
>
> int xe_survivability_mode_boot_enable(struct xe_device *xe);
>+int xe_survivability_mode_runtime_enable(struct xe_device *xe);
> bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
> bool xe_survivability_mode_is_requested(struct xe_device *xe);
>
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>index 5dce393498da..cd65a5d167c9 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>@@ -11,6 +11,7 @@
>
> enum xe_survivability_type {
> 	XE_SURVIVABILITY_TYPE_BOOT,
>+	XE_SURVIVABILITY_TYPE_RUNTIME,
> };
>
> struct xe_survivability_info {
>-- 
>2.47.1
>
