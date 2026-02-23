Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C7BEEC2AE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 23:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E84010E465;
	Mon, 23 Feb 2026 23:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTb6SfVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9540110E464
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 23:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771890822; x=1803426822;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Pg7qWdGsmRGTP5hWIcogXb31p2CSiaSQWWlrMmbcRM0=;
 b=YTb6SfVP0C/JFXbDHSzYoBP5bwZOnln2y44QeyqR1jzle5A/VGJmWiIk
 XA4etkbSJ2jtw7fp4sYqTa4nF57EQ54/uc4CFPfEOcBtOhZzWp7qLpvyu
 Hj2gN30wQE81kpdZx7AVBHOZGs/IcmcS6rAvUrWgda3vS+8Kuk8+jun6M
 aBV1KJYifZikP1N3v654g21fb1wo8y416X2g7tLARRTYIYYNZvgLjEs+p
 tGVGqBMbsAoL4RrM6RaQT4E5PBbm+PYZ9z3lacIr9MqvLuU9A72bFw8z3
 rOPjArqZY7h9odNFmc93VS3hjbkojSv9yaYieE4xyC7D5RMBHMhjpQ3PT Q==;
X-CSE-ConnectionGUID: /vACmiJ3QPG4ywJR6sT6XA==
X-CSE-MsgGUID: qipklCPWQTuYcN74YelSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71928652"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="71928652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:53:42 -0800
X-CSE-ConnectionGUID: Ht/gSvDOSxCceCKvUFLVIQ==
X-CSE-MsgGUID: wX70JN5wQ7mxL3fAsqH0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220245002"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:53:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:53:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 15:53:41 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:53:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeqwzOVJyqnU0/RLXbTOZF/B+tO3XiAekrzSi7EDLF5nyPeDYCVHAbO2PShAIgIcKvbYk5bU9MSrQUOo/6TCLc4RffEPimjNI6T0Y7sKteKrM2zJWfQU31iWz9pFsdhgQS5O0jlYxYySgrSUF93/AHwOECP/AAhfrUjxG/ey3EvU2wUzhN3YPX/7clES7VOYV4FFWNcL+Ftx/pXLtv/V5Jir1SL8597CLrseauRKTfcgTYia0CKEB0pmdH+Q2jQq3CRW/XUH19AWrUfU0NJ3Kd+wXf6qprnRXSt76il3Y0mwinjz+n22c8B12g3EAeGm5Beug5DGytSATQpnkwqOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZiTKXgTufGhwQlu/Hc3f7H5HZ6GAzXDAZZYUU48LTs=;
 b=pcKEXJP5Jipljt1BMacgoxMkaKj0vJPi19Kyx5vk4sBDC3xbj3k3AUBlrzlv0Y/dubj9VW1qHeBzTQqCXtnNntokpEnwKRJ6gMWvbPocjeRlubYeqAdbsAJVBBEjq+pvp7L4eQGpgOEWHk868DVWg92hQTRlOackx+C6x1+3n/MMSrkgA9uwG/Yy4LZ6o23aNu1RyZv3EX1TOMXcl9qW9mm5nEio04hqGuL1PDk+RVaJFrl7KUYE/s4gEAHGs0p1sfFGkWDj9aIjY1KVwCvH4Izt6GYI2D6FSTnn2mT/tnxbfbf1n0da329TLTG9i21SDvsQFCLFhWR68GWJDT0rdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:53:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:53:33 +0000
Message-ID: <cdbe657a-4017-4097-8fc6-e176bad9f4cd@intel.com>
Date: Mon, 23 Feb 2026 15:53:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/xe: Enable Wa_14025515070
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
 <20260220170137.328131-6-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260220170137.328131-6-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a28e8a2-cbf4-47f7-c73e-08de7336c0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U05rM0JFVmRGS0MrSTR1MHk4amZKSTdjUHdhOGNzN3k3M3pCMFBsQ2JLUTR6?=
 =?utf-8?B?TDRlTWxudmFtamZZbE9HamFRc21qRTkyYkdFaFJqa1drUFVTZlFJUm5RMisr?=
 =?utf-8?B?YnFwZHdjRjlqV3paTDIzTWV6aUErNnpOOVJ0eHBjSVFxcW9pMDVLNGRTZS9l?=
 =?utf-8?B?WjcyZCt6V1RXcERtVTZNRWZqRkZRd1JwTlNwZEd5SmtOK3d1SlNBQVZMNEJv?=
 =?utf-8?B?UlpCRHNCSzkxQ0F5SXFCQVlESFhtbDRNYzVueDkwaXQ5RmxnYTFCNWFMT05E?=
 =?utf-8?B?SW43ZWE3dnNOc21nQ2lzQzFkQ0FlVGtsQWJkZzd4QTFJdEdUcHZRTTBoMVNV?=
 =?utf-8?B?VG9XVVNuRXZzcWdmRytLRTNrVTlVdUhYWXpVbXkzMlkwY2ZDQmhzT1duWjVC?=
 =?utf-8?B?bWR0WFRJeVBiQ1hQUEhUNDY2U2kyb1BuSGdSQ0ZERmhxb2R3VVBucU92Wk96?=
 =?utf-8?B?SmtuM2NJOTVncEE5UlI5ZEM2RHZWZGQwOXZGb0NXMlBYWVBkS0RQQTZpV24v?=
 =?utf-8?B?QVZjWlJkcnNyMk1tb2MxR0xhYnBzY3d0YWlWSUZRWkFzeWt4S0FUamYrYkpF?=
 =?utf-8?B?Y1FBb2l0SEpsdjYyeHpqWHhyU1NwKytzM2NFUUJ5Ny9hUVU4S2wwNGs4aTEy?=
 =?utf-8?B?U29UWFJ1NE8yYU84bkU2d2VjUkJIdTRmdVdkK0c0RGZoNnZyQVVnYitnWXA4?=
 =?utf-8?B?UFliaFpOOTJXVUNBY3p4VEtNb0o0QVJBOXI5ZUJmVkQxZW9CSUI1RlFMaFFJ?=
 =?utf-8?B?MGhJSzJVYjUzcVhHSmdsaFAvWW5lN1d3Wmt2eWlkZDk1L09Da21uS1RGSDd3?=
 =?utf-8?B?MVRuSDBoVDc2cFFxWG9VV0grZGhHVDNMcXk1SC9rdDB0LzNlYUhpaXg5NFg3?=
 =?utf-8?B?eENQSmh4U1BTSitXNVg4Nzg2MENaQ05VTVVCam5VQUQrR2tNMFEzeHJyNC9v?=
 =?utf-8?B?ZHNJSkRYOUVXRDFqUFJMTDd1TUQ2dGRBTStuZ3d2WGx3dEZpMjhYdTlVV0Zj?=
 =?utf-8?B?R1NwUkxiQVBTNGtRZVpZeURNV0lIK2VhTHQ4WFRHMkx2VlFnMTdqUmI1V2Fu?=
 =?utf-8?B?cytzaituY25ReU1wVnRHMS8zN05zZVV6Q1pOdWYvTExRN1BvNWFKL08rY0xa?=
 =?utf-8?B?dWphRlFPMjNVWkRha1pGOTV2Yld4UTJiMjREWmp2blJJd0MrWllsUHNHaDlI?=
 =?utf-8?B?YS83KzlMSVlFMnVoUGZidlg3LytnK2R6Q2tRZnFQNE01OG5lZjNMY0RuYW11?=
 =?utf-8?B?TW1zTFpyaWQ2bjlXZVVkWVdwRnZRWmJPK2o0eTQ2SGRraE1WbVB5UzIwSkhl?=
 =?utf-8?B?SFgxSGVhZm5aVTR4NUdLSmpmTmlsaUZrelllZGhubVZpMXlmL2FSYzdITTJp?=
 =?utf-8?B?VHVkbkdOUUhIWVVlR2NKejlQL004TzI5UmxmWGdMbmNiVW9ja2cxOUkzSFg2?=
 =?utf-8?B?ZW43KzRRejhPMlduUGtmek5aTElhR3dlZlpFeS8wSHBFM1hjTjN2S3I2UUt4?=
 =?utf-8?B?M1ZiY2RRV0NJa0hhZEFLdjZ1b3hhUUFESklSTkhqb3MyZFRya1dpMGN1aHIw?=
 =?utf-8?B?Sk9DVEhwVEEyUHI1MmhkTDFHRFppdU1wZWFnWWZKQ0ZJc1hJLzJYQ05QNE5E?=
 =?utf-8?B?d1RCbnFoWDdFbWJtZ2QxTE1ESTd3NktPbGNSYU5FcFYvYUtPWFh1WjRLeG9r?=
 =?utf-8?B?QXdGYnc3TGtYeCtoblJUS0dEbm9JTGhMQ0MwL21CK0ZDY25jU1diNzJlODdF?=
 =?utf-8?B?a0dWVU1nWjJ3TllwYnhvWFlRb1c5RktNdXROTGUxN0hTMi9HRlZXd2c0S0tR?=
 =?utf-8?B?cFZ3eW5zQ1pzMVpvcm5uSlYvUXVyV0NabUtlTFZiSU9OclNpclNKNTRDc1V2?=
 =?utf-8?B?TUtZRUpkYkZDMERjbVFKeUphVGR2ZDh1MUdaRG90N24rQVBYMWlCNzRKVGpp?=
 =?utf-8?B?bU41OXc0N0lHL2l4ZCtjckxCMjFLUFRodU1zdjdzL2tkN1NBTHJlQS9adlAw?=
 =?utf-8?B?THRCVmxXQ1pzUUZMVEpEYXV5SmkxbFRZN2FmT0xmdlV1NFRWZkI5L0sxbWZu?=
 =?utf-8?B?Tlo5c09LaytlTTlxNllTbkREM2Vpcyt2d1JXSGJlck1jQnFEK2xVZmJNR3ps?=
 =?utf-8?Q?i3FQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtHQzd0V1lVaTltQlZ2ZEdORklBRDJ4Yk93cytmNzJobGpBQUQ4L0p1ajhH?=
 =?utf-8?B?b3VlN2NQeTU2MWJrd1Btd0VjaXFRYXp0ZENib1NMQTd4QmNHZHUrTktRRnVN?=
 =?utf-8?B?YzFCUlBabzJ4dmVwTCtqcFdMWm43N0pRc080Q2g5Mk1DWTFVMnozeXRTalUy?=
 =?utf-8?B?bjFudmJvT0Q1T3F3dTZtZHVRbGxWN1RwYnhOWG9zMnNYaXo3aDN0VFo3Y3lD?=
 =?utf-8?B?eHd4MTRaUEFTa0Y0MENPWmhxT3NBRk0zMzFNQ1NQL3dpMFdqVUUvSTFnNEcy?=
 =?utf-8?B?dzBmT0JPeTh6NW41SW0yWUZhYzR2dnJLcUpHK0diRTVRdFpLajJtM0I4SDIz?=
 =?utf-8?B?WGY0NDRkdTQ1N1ZBbGRNeDMrNnUyNE8vK0JOTjYyd3RBWk4wL3NVMjFXR0hN?=
 =?utf-8?B?SGd1NHplWjEzejlEN2tiSnpZRkpYVlR5aFFqMmNZQjVqS1pQU0dKVXloU0pZ?=
 =?utf-8?B?WHl6VGdQMGt0ZTNDNEozWnhqOVBkRithaWU4am5KOXdSQmJ4cnFoeFhIQzFq?=
 =?utf-8?B?Zmc5MmdTTHI1M1VNU1NocHV2SW9nRU5MQ1BVNlA5U2VLVTJPakYvMTVsYTBQ?=
 =?utf-8?B?emdUK1k3bUJ0d3dJNGtmTHkzc1ZRK3VyNElGdk1OY0NhZ012U3ZERHhIZGdR?=
 =?utf-8?B?Y1A3R28rVllxY3BGQkpqeWp1cTB4SVovL2VRbXdTa2lzYy9ZQmx2VGJUSVZk?=
 =?utf-8?B?akJHRzFaZ2FqdzJVbjl6dkF4REYzNmQzMnhDWXBVV2Y5ZWd5WEpsVlM0Q084?=
 =?utf-8?B?VU5EVEpSYzRhNTFRUjJjaW83OTRObzZSUTI4alpiQUZQVFJhb29ONmNmV2pF?=
 =?utf-8?B?Qll0cWYyVGMwbVpJeFFNSmd4clVOZFlNTFFwclMrdWptSHd2bWl4NkJ0OXUw?=
 =?utf-8?B?TzJTU2dVMVFGeHVVWG9vQXpXOUxRYmc3ZmpGZDhjUGdCV3JXQXFxV3YyOWpJ?=
 =?utf-8?B?WWtadlBrNURNZGNMUUcxT3pmcDkxckFjZjFKanFEVE4zT2RMZmVkQlRFR2tO?=
 =?utf-8?B?Y0QxdlBhY3NZNmpqcWg5LzZtNUVES0hVRVV2dmhoblBmb0IyUWRxUFRFZEFC?=
 =?utf-8?B?QmliV1c2T3U2OWtuL0lwcmIyblhMbUFmUjNEbXNlZ1lVOU1semtKUkVvVkZy?=
 =?utf-8?B?QTZ1SjduRlpOWm9tbEhIWDBkdTFIZGwvRlExa1ZkWWxua3RaVEprc2NVZEdm?=
 =?utf-8?B?Z3pBYlE2REgxK1JaNEdTZDFNRG5Cbm5OODJMZG5CMndGdzlTQ1dYc3BKMjJs?=
 =?utf-8?B?RzY0NG45aTNXUFdQcXBzdUhGbnd5cE93Vm1FdXpxY0dNV2RJWkF5ZnNuQkZH?=
 =?utf-8?B?U0tsamF5blB4K0k2R0VyTWtTMGJmeUQwVEVnQSs2VkJtamxoYXp1M2JpbzVj?=
 =?utf-8?B?Q3lUTTlwSCswY2Y1UXZWRkJodjAvaFRVWjRYUVYrdFplU3F5REw1eHcwK2Fj?=
 =?utf-8?B?ejEyYnFQcS9ldHNDR3hhSkcrWVord2JIaHNpTTlwbUlMOFVWcmpwV3NFc2d0?=
 =?utf-8?B?Wit6Vld1NC9QMGpwbmdURnFrQXMxM1ZaVnZZOHJWekJDZXpobUxoSU8zN1hP?=
 =?utf-8?B?cDh0MUZ6RE9vMGovdDdTY2hTWHFEeWRVaXM3blo0RjYxeTJ2bnI3ZmV2c0Zm?=
 =?utf-8?B?U1BmR2hITi9zWTZNRVAybzBQeEpGYU5Qbk5qeEVCUGlpYzRVc0t1clo4OXlQ?=
 =?utf-8?B?MWU3TjZ4OTBSVG14TTBVYTZkQVdEUDdOUGJ5VTJtd0VsNEdoL1BuSmJCOUZ3?=
 =?utf-8?B?Sk15SjcxT2dEbXlBQWVjT2VzRzdkVUdxQ3pBL0NiS0lSR0xBbkJMMzluQ21h?=
 =?utf-8?B?ZktoQ1JyeTY1SXlNclJMUnFkdEs5WDdYOGY0cnk2R1JiQ1RYbWF1K1g3SXFw?=
 =?utf-8?B?bTBFOTVFamI2QlZWZWQyd3BOUEI2ZG90UEFidWhNN2xiU1hjNFRsOHFNd25G?=
 =?utf-8?B?ckgyZlQyRjYwY0Z3YVlYSEt6RnNnRncySVJyb0tJOU0rNjRUNFU5aHdXSkdv?=
 =?utf-8?B?SGdjcERmMzBhdzF1VlpDMWlCMjE2ZmVkRmk3N0tSV2tnMXVsYWNEb01YWXpO?=
 =?utf-8?B?dWIvUVJyc1ltNzdnVVNqWTdDeXo4Mkl2WEVwODI0bUtrL2dzWGFnNFRzazJw?=
 =?utf-8?B?cXVSNGJlOTMwb28xRGpuQjhBY3l2dEduKy8wYU8rWWc0QnVrMzdsQVlUOTJJ?=
 =?utf-8?B?Q1BTeWZ3cE5FaHM0K3RzZGFZSWpSc08vNGRvZXZIV2J1SVBJbU9oZ2ZXK3d2?=
 =?utf-8?B?YjF5SGV6TFVDVy9JcjRXcERyOVo4SVZjNWQ0Y0o0SDRrMjFBejA5N2h4MVBT?=
 =?utf-8?B?Z1RLMTZxbWZEa1FvaVViREY4VDhEVm40ZmJjRWtVaSs3WHBhQzVSL3QwYUNX?=
 =?utf-8?Q?XypTHdIMjSMwNnv4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a28e8a2-cbf4-47f7-c73e-08de7336c0fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:53:33.7927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqLnbTurpVMbHGjAH7AOeQLRuUSR+gNbzg9VJzSdlFeUTswxRq1ew2/c2y8i+r7+bDlx7H9KjQ+44I6yixtnGkb23qs89UV41OVK0n1CB1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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



On 2/20/2026 9:01 AM, Julia Filipchuk wrote:
> Corrects a failure on context switch. On registration of context with
> indirect ring state will correct state of targeted and idle command
> streamers.
>
> This Wa requires GuC 70.53+ (uapi 1.26+).  If Wa is unavailable, notify
> and disable indirect_ring_state.
>
> Added additional XE_RTP_PASTE macros for expansion of longer rules.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc.c           | 6 ++++++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
>   drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
>   5 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e33bd622ab44..f0815500177b 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cbbb4d665b8f..a595a7a5c534 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -780,6 +780,12 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
>   		xe->info.has_page_reclaim_hw_assist = false;
>   
> +	/* Disable indirect_ring_state if missing GuC 70.53+ WA 14025515070. */
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 26, 0)) {

This also needs to check for XE_GT_WA(gt, 14025515070), otherwise we'll 
disable indirect ring state on platforms that don't actually have the bug.
Sorry for missing it in the previous rev, got too focused on the version 
thing.

> +		gt->info.has_indirect_ring_state = 0;
> +		xe_gt_notice(gt, "indirect ring state requires WA in GuC 70.53+\n");

Since this log can come out on a VF, it's likely better to use "GuC 
submit ver 1.26+"

Daniele

> +	}
> +
>   	if (IS_SRIOV_VF(xe)) {
>   		ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..d737be03aaed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -360,6 +360,9 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	if (XE_GT_WA(gt, 14020001231))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +	if (XE_GT_WA(gt, 14025515070) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> index a33b0ae98bbc..86eee60c04a1 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -66,6 +66,8 @@
>   #define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   #define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)
>   
>   /*
>    * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index ac08f94f90a1..b5e9cab34da7 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -69,6 +69,13 @@
>   		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>   16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
> +14025515070	GRAPHICS_VERSION(2004)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> +		MEDIA_VERSION(3002)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
> +		MEDIA_VERSION(3500)
> +		GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)

