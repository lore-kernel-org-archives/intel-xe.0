Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014E9C83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 08:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2F10E55C;
	Tue, 15 Jul 2025 08:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkWwpLug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF46410E553
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752567970; x=1784103970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vRDpXrBg5ni8b6j4VHJGK+oFDeI69TdKJRhCc2Wg2d4=;
 b=IkWwpLugDOzSqdLDTLUzeJysDJOC5Pu3UgVq9zs74iIZ02C/fvqqP2ag
 Qt7w+dgLHGwoydIDPE+M479kFHGwnMNLKFNTZ3ktXSb3Lx+VIVxUhQbKT
 jDhUk/U92KsqbjIORZTMScdtvgZz2wi5UB1JGrdTund1D75r57TPHwgBD
 4Kkw39PyPGMbNMt5vfsh3nUTtAaXT4hGgp0efJlQWLSUg8iruHqT2tDcg
 f4S6b61C37PUtg4IILbaDusMtnBsbMhIvTehsnhmVQHATNPbY+N50ap98
 BBInXpF/MrgehQPka8y8vIH+B296Bb2qicKB51ALFIwPeMqRr9a8A1a4y A==;
X-CSE-ConnectionGUID: t7V/dNdhTEG5TTSYH5H7Cg==
X-CSE-MsgGUID: zD4jy1gARt6zNjtScxEiUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54486501"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54486501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:26:10 -0700
X-CSE-ConnectionGUID: 6ctzxeRjRni1NPif0mGGqg==
X-CSE-MsgGUID: +yjUU1eJQG6Zt+XR6q4THQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157525949"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:26:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 01:26:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 01:26:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 01:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glvvYcJlRb9WzI8D4blGLPl5UH+bHLKyPAAYVKVPvShRgCLAyVN6ufBWuK7vh2ug4jcIiXmP088QPnXN1mcamV3uOnZ5PTo/iwx0qPRrApnTvbKNWUPK+v8EMx/QjgaJBZ//Sc6fz2gnBBGwAMvwWlWX79grD1OgbkBYN8LzU3WVjFLR9L6V2DWjfnkFYWLmu7eSv9woJwQlGu+7DmGiKZKuNEhje8cp/NjtAoIeiFcBuuv7pqoTAK1rlITPM7rc8qE0XkDD//ekoJ/UfiTa9AR2JNlYUlqsguhJ2PgLZr4ScH5Bdz4/i76jbdRsSArdqnq11eBEkq3owdIgwMDbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zWxWwbW+D7LnJJJRxYMBMOphAz1f3KlZWcmUz7hmG0=;
 b=jJK2o00ptsEvJC2W01YTHaSnAFSNq86XA2i/DXblB4PF0LK90C8f16VgdQhUypXnePlq/TvmuYQxVsmSv+qTJQNihEIN3PJNa4Cq+d6ay6bmFPrsRoD9t6aZbTqiD8RShmiJQr0ny6WJsP2xWpNjni6yXHwmTgrO803hKdwxsYCR5zeTYri5qCcc10dQIwcDUc8pRDcHuP61xrw2PTv/LG0Vp9fcymwG2jHoaCCNQ5jXSWvdbNERu3zNEqT4+FugJjC62DQcjlrvelDPSPNgrHNZRtkiFPiDxWlw6tfvEtPKkC3PygnP0LRBodKh4jsub0Li0kiLozhJ4oQTMNbg8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH7PR11MB5793.namprd11.prod.outlook.com
 (2603:10b6:510:13a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 15 Jul
 2025 08:26:03 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8901.024; Tue, 15 Jul 2025
 08:26:03 +0000
Message-ID: <08e55c66-3f3e-4b4c-8f33-363b7ecd31fa@intel.com>
Date: Tue, 15 Jul 2025 13:55:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Disable compression on SVM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.mrozek@intel.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250714173342.2997396-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: c046bfe2-3bc5-4422-ef9b-08ddc3793c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEhHM2lUcm5ITVlXbnpWaDJsa1EzaElrSmZLb3NZZjVveGhQS3pobXk2Tmg4?=
 =?utf-8?B?NkVRMitxdmJqQmRWTER5QzE4ZC9pb3AyL1I4cE5CaGFMTE93ZzlOVjJMdHFy?=
 =?utf-8?B?YWx5WWJ0aW96elcweklGcG9IeXVHWXkxNnBvZWNLM1dMS1kxanMzdGVYMjBS?=
 =?utf-8?B?YS9KSDZNZHh6dDUzbm1Dci9rMUNRNVJTU1dQZFVlY0VkTWhuTCtyUGV1L25r?=
 =?utf-8?B?di9LVjN4MXpwQThLWlJ5a1RWRDZJNnhqdEtuZFdtUkJiYWNOV1BIcWZHU2Z2?=
 =?utf-8?B?UGpxRGVoSWwwV2pPZ3BMK1A1cTNoRWFLdHhFS1AydWNlN0dlWU10RG0ra2pv?=
 =?utf-8?B?TGtIdklUT1puZE1rTmYxKzdUTmF2ZDRDek5ZTGFmMEltQStHbXM3NGRFc3I4?=
 =?utf-8?B?eFJXSEd4VHlvKzdUQlVUMVVkOW9qR3JEeTE3VmVCckhjaDFDenBnQzVXaUNC?=
 =?utf-8?B?VlJmRlVHcjRYSkhNVG15STJ5TUR2aXpnMmhxVU9UQkhraUJtaGd2bHJKRWg2?=
 =?utf-8?B?Q3NiS1MzOGtxdjVGNWZ2M3VhMTFzR2tYdlYyN0xoNWVYekFBMUNuWFpZV1p4?=
 =?utf-8?B?N08ycjBicnM4VW9PakRSaEltL2tWZzZVbzhkNXQyNndDb1R2SFpmV21ETDNX?=
 =?utf-8?B?WEpiZmphSE93Y2JzNU85ZE4raCtVd1lyQTNJbEV0aFEzdC9tdjF2ZHdtSUox?=
 =?utf-8?B?QVlpOWxVVGhXeXZxYWo0aHpYUTFSQTgycno4aUZ4TE5OK3VNOWxiZ204SWdi?=
 =?utf-8?B?Smd4WXVybjBBNnlIYmFaNGhDRXR2alNlWlFqU3JjS3c4MVBRckdzMzBGT1l3?=
 =?utf-8?B?blhWRThMMGRnVXRsUGZYeGRQaVZOT2tNeVRldzVRL2ZiNGR4ci9SK2Q5UGhE?=
 =?utf-8?B?ZDZSczhyd3F4dWllc1dDOXhZSDJoSnNRVzlNZ3lYNlZrOHp4WUNrMTNMMkxK?=
 =?utf-8?B?RlYrQ2JCY1JybUxtUmZnb1V1aUtoMlA2QzA4THZoOHlnbFJZak5NR1Z2K3Fw?=
 =?utf-8?B?ckU1NmI5amNTTjBKMHNGTG4rdE1LQXpJNWdBYXB4WG9NWnBzRStnbUVwOWQ0?=
 =?utf-8?B?V2tOUlFWVEJJU2FZMGRvQlRYK25pbWRLSHZqNnJQTEpsK0tnL0VXTkJJQ0Fr?=
 =?utf-8?B?YUV1M1ZRS0gvOEtudTFiYlROdzdrNE53TjlNWGdSOTk1MEtMWGpOL0pHdlh1?=
 =?utf-8?B?d1hlNVBKSk5nTjlCUHo4dndKWWwyei83SlJWcG5GMUxqUVBJOEJTYWpZZnBM?=
 =?utf-8?B?NmgrWFRNTE1rdDQ0Q0FvTEUyOXBnQytoYjFTVHNEd2FIS1ZZNFJxa1hqNEFS?=
 =?utf-8?B?Nk1kRlozSGU5ak5KL2NUdDJueUk2RFZXU3B3aFRHZ1BYUy9DMENzeUsvTUFK?=
 =?utf-8?B?U1RHM0MzTGJGSmRNU0RZdHZXUk9ZOWdJUmFETFFWakNoNWp1eGVuNnFZQmV1?=
 =?utf-8?B?MzVaMVNZRDBmT2FsKzVOSHBveDlBZE50bHYyQUYxVkpyUjJWU1V0VGJkSFdw?=
 =?utf-8?B?cHZzWnprM05mNElPOEtzakZqUjBGTHJ1MCtIMkEvQk5nNlA0Z1FUVDRYRkZF?=
 =?utf-8?B?d2VMWnR5WnZia3JERWtCdExiNUlETnZBQ2UwRERrZ2JHOUl0TGNMRkZLQSs3?=
 =?utf-8?B?cUdHb2l6VWxpRmNBdHJTTGR2SldlcTQzTXExWFdZaWt6Y1VXU1RHN1BaLzVx?=
 =?utf-8?B?ZlI0dExmbExFblpaeHRMcmF0QzNkN3VtYVZTVlRqeG9mM09RSGlQTXhrcDkw?=
 =?utf-8?B?dXUwNFpKYnBadW9EcnN4RjRCdUJZMDdLTkI5aEVqRmxjSitUMGphYys0b2hI?=
 =?utf-8?B?bjFJaVZzdlkzSGNQN2FXTmJwbmFmVmoyRDE2bEU0QzFRNTF6ZDNtK2s3Szc5?=
 =?utf-8?B?aGZ4b3lESnR4V0tPNHgyQ0w4NXRZbThiaDUxWHJSNjJnSVlFREo3eWtsWHB0?=
 =?utf-8?Q?WzDeRZrcsLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZpQ2lFMTlYMmdQWHB6eXNONXM4a0pqSEExS1RtRlF4WWgvUldseThNVTFS?=
 =?utf-8?B?MW5yd2dQUkFzZzFYOWNzVGNLZk9CWThOdVlnS3hrcWt6d0xMc3JabkFjU1hG?=
 =?utf-8?B?TmRFWUxIVnFKZ3dTQzFWTXNoK1ljdC9ROVBRZEtZa0krTjRMTjczdjFuK0Zz?=
 =?utf-8?B?UEFhbG1PcmJVWTlUbXlRZEsyYjdCbE53Um1DMndTZithM2Y3d2pMbUJUb2Rj?=
 =?utf-8?B?TGpYVFQ5WU5ITlM3TzVyc2dwMFpFTTI4dy9PQktNeGYrbkpYRlVKSWJEc3di?=
 =?utf-8?B?ejNwVUZIN3c0OEs4TW1PWi9zb0RxQmZyQXZ5dzJnTDUvWHRsSTZ4bjh6blR5?=
 =?utf-8?B?YWR3UnVUMWxYTlFUNzFZbzl1NHdXRWtkaHJIZk02TTBDSUZjS1JtSzc2T0RK?=
 =?utf-8?B?VDZvMFNRM3lxR1BaT3dZMy82dGFEcWhqdEp0MzlaNWJWMHpOMkR3c3JXcWwx?=
 =?utf-8?B?ZVBob2RtT2t5SmtVNlJvQnFKMHo5VTFJbG1JZ2gzTndFbnR0SkxtK2psUitO?=
 =?utf-8?B?Ly9ZWVo1OFZVcXRXODB1VXR5VCt0MUgxU3QwOWUvMEh4ZVRWZm5rUi9Ud2ow?=
 =?utf-8?B?VUplUkczSkNMU29KdWZ5cWRSdG5zd1Y4L2FPRk9pRzBxa0dUVzdSUjJFL1Yz?=
 =?utf-8?B?aVU2OGt1T3ppWEkvaWhHV3l2RjVpZE0xVFJ2OFhnNzRLSlo4THFhVThRdm9n?=
 =?utf-8?B?Rnl6a1ZnSU83WDI3a0lpZ0ZzSklSdEJheklQYWxPYktFVnBzOEduYXN2UkJB?=
 =?utf-8?B?R1d2TFNxZitYTE9xdEZlMFJrdFdxWUthWjJIanpDeUM1aUNGeTRUejQ0QTR5?=
 =?utf-8?B?KzNEQTB0TWNZY1R4blE5NGt4N3lYS24vNUxYZVlNTjhUNUZyNlExUmVXRkRQ?=
 =?utf-8?B?R0JIUVNaVDhGMGdkYkcwTnhlM1NxWVZBOFpYM1M1ZEVnOVh5bnRMb0hkVG1q?=
 =?utf-8?B?dXNSdjYwZzhjTVhHVkJiVE94cTFYdUpzRXN0SnhzeGJaUWQ3WjRsQnRoU1lM?=
 =?utf-8?B?MGRMQjlCQnNEV1ZGd0FlQzFLbW9VRmhJcU9sR25GQnhoOFFQOFE5VndyQU9i?=
 =?utf-8?B?NVlwRmVWNSt6cGFNSlJMSTBnY0h3UlpJcnNBb0dSRGhZYUVsdnZ3c29aTEhl?=
 =?utf-8?B?QWFsZ2NxQnRjMkpGZ3Z2S2czZEhBSy8yaHRUeFRhQnJkTHJRWXlJeExWMURI?=
 =?utf-8?B?dmUwc3FoTWZNYWk4K0daS1VicGw5Z0t0MktqNmRrRkhzT3haN1o0Mi9nQnlr?=
 =?utf-8?B?MG10Z3h0MVV5Umd0Q1dybU9XZHUxbE9mYnFWS0VhcmY0T1lhK0ZPR2pBTVFt?=
 =?utf-8?B?dGh4MnE5QS96Nkh3VXNLcFdmQ2NqWjk5eTNFZFc0YUhUNzRuZUQzSm52UDV2?=
 =?utf-8?B?NXNUQUpIZnRiSXVIdUp3SVg5aDlabllaL0xaRmlRZWtwOWFvOFRlMVFQTjBp?=
 =?utf-8?B?T0VnQlBhbVFaU3dKblJuU3Rhb3o2QWlPbFFNMGo0aWhGSElrWTdvVXpDL0JW?=
 =?utf-8?B?SVNvcnlLVERrNHhibUJmL3BLM252aWNEeUcrU2lHZ1QzTFdad3FmeUEzRmk0?=
 =?utf-8?B?WmZPS25yRi9JSUVDRnA3dWtJYUh4SFExbWVGUEt1QWZwVWp0U2g2Rm51aGEy?=
 =?utf-8?B?VUdENWIvWWRYMWFMUWo2Mkh1eU5nYUZ2cUtkZ29kdXpScGM4NWxaQzFYVjZL?=
 =?utf-8?B?ZTFXMG0xcG1hNWRVMEJYM2lhMDBqYnVBbElMZVg4SkdNaEt6cHhnRmFIZFFQ?=
 =?utf-8?B?SEs5SFQ1Ylg3RVpsSXZaS3VZSDkrcGVWSDFwU1RWRDdIaXJzS3pGeU9uN0pV?=
 =?utf-8?B?S21NdXFIMWpDUC8xSDJ5R3BabHhGUG80YmFBNDRrYUF0MkJ3S2FRUXZuUGpG?=
 =?utf-8?B?K2lUK3gra1I5T2FOS1YreVNRNGhBZGo2aGRPSGJXeDl5M0d0a3RaTnRtTGM3?=
 =?utf-8?B?Zys5eTJaZDBTVUJ3Q3FlOXNmUTNJRVBheTJYQW9VK0V6MmZpZi8vU1d3a1JQ?=
 =?utf-8?B?bkZ0RHlGeC95Q3AvRmw5TE5CZnZjdDZWZHZEYk5KcE5iTElWQk5GTWlIUUZW?=
 =?utf-8?B?b1BaNHgwVzlpTUJ0ODEwZHppRGRBTHdQWTk0WXJMQjJ0bm9RNlgySWw4TGJS?=
 =?utf-8?B?V0xaUzRoU2p3YnRVL3MxK0Q1Mk94ZzVUK1k5bUo2SS9NODZWQUE5eWsvUDhx?=
 =?utf-8?Q?tgYt13EydCg59Hs3YS/BfnQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c046bfe2-3bc5-4422-ef9b-08ddc3793c9e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:26:03.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC8u+Sau2czj+WRVHksJtkWs45yT4sWnjF4gER///53ksoznkQ0B2K0OoDeCnmf/MYk1bRkv3b5hBC6BTtLHKG33sGA25LchfDQ0OVHORMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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



On 14-07-2025 23:03, Matthew Brost wrote:
> This is not yet supported, forcefully disable by setting pat_index to
> zero for CPU address mirror VMAs.
> 
> Cc: stable@vger.kernel.org
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2035604121e6..73cb981c0956 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2362,7 +2362,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			op->map.is_cpu_addr_mirror = flags &
>   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> -			op->map.pat_index = pat_index;
> +			if (op->map.is_cpu_addr_mirror)
> +				op->map.pat_index = 0;

Shouldn't we enforce a default PAT index, only when the input PAT index 
is compression enabled?

> +			else
> +				op->map.pat_index = pat_index;
>   			op->map.invalidate_on_bind =
>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {

