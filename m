Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3FC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 05:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36F510E57F;
	Fri, 16 Aug 2024 05:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LG6SsX1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1350F10E57F
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723785419; x=1755321419;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B6o5ZJMKU4rnS47DPozxYTMuFGealkB0x/n7PC9qh+I=;
 b=LG6SsX1EaQLbmz6IeJrvBk5t2zvmEZ3PbvF1WYTHv8Fi4yViRGPsolQN
 BcCSUgLfoOvg9Y6zd+I6yX5JBZpByUxatamsla/1z27ecpO8WbMjRZpwL
 1KYPWjFyzypSkPdcP5fdPH2TAxQmrSjRuTOXBjEf60NIrPFqXDTm/SjTR
 IA4IRwyZ1rSuUbjMmyY7KQQDCWVRwjcfghsohAD7QgKIhZAbB4OCSaVuQ
 hshO5+f4HSxg30Ff5FTH2+aiT6U9f3T44rfziedum/3xwM+QEBypPDFEk
 saoMo6KkpT9z88k8PB1o8DOr67wNvtA7Ww9CzjuubDnI1aZIcylc4TigN Q==;
X-CSE-ConnectionGUID: V3bP9kv9TymDET/cprzSQQ==
X-CSE-MsgGUID: 6hwIBIovQ3qN1egd19yk6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44588595"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="44588595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 22:16:59 -0700
X-CSE-ConnectionGUID: MY/xCrDwTnSYablsuwfb+g==
X-CSE-MsgGUID: xvu5ADNaQaaFPXOVF86Elw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64422197"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 22:16:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 22:16:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 22:16:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 22:16:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 22:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+aNPtHYL8DCYY0iwsGni/H1Nr7Hsj1dXbbNs2Y59ZSongdrzJRNK/D2h20boUx6l2ZPeCNneWXrwZZY4TFeFJ0MOWZl9QxBJQ9+ZYbKcwp6EWROaT8bhdz9weF0x+MajrMTsD8rLeX3ThX1GoVoZyjt6D94nP9K0c+mZNT8ilSyDbEp1m6VtpbQZF/IivRtePMUZSGV6fWmVxSgk4KvMhblVbto0psguXu9iCgBqlu8Uhcdzo+eS+yTOm+lsKTg2HWSqhX7yoQAqnd+TMD3itmmPek9zHMDHtZbA/kYVmFfrjQneYHkVIbG0QXpmKt6GgSmARdGih3MhnW/hCuFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQ8PtvKDbHgYYKJBwqTB55ND1xbe0PgQUC+BcPmGhwQ=;
 b=U3G3VGcKiPeN7Y/frvGNWVYoR2GFIgu5hzcrVci9H2vP4l97K+rkDq4UlML/+sgVbXcsyMVeiBS689Oxg11r/ARVAZFV3AdBmEUbWuK5ihU4cgTrjc7iQDD/RRgiGpURKONG1NbYPm+z+7tJ3XbP3lrKLQdYDe/P/xsIttdPwMQX3YjaTTj81k+qbF3dNzDV4sA9dxDtwAbCOQi40tJke/4Ejym9qVQAzPtGJfCKESYFjuV0igAten0HdRIT0FBn03juttYzmqLDzocmTzcldXEJEscAKRy4Uy60Mm6uxOVJixUR9mJeKD43mb4qP8c3JQzA5weVl2DRAiy8pXyyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 05:16:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 05:16:39 +0000
Date: Fri, 16 Aug 2024 00:16:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 04/12] drm/{i915, xe}: Avoid direct inspection of dpt_vma
 from outside dpt
Message-ID: <fdtthw5qcngmwdzqltik6voazr2yhx4qtnspyawi6c5gfj2fl6@dpjv3qcqnt7n>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
 <20240815220732.49675-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815220732.49675-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0386.namprd04.prod.outlook.com
 (2603:10b6:303:81::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 8180dd3c-13ce-4c7c-a07b-08dcbdb29b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTllSE1wcG9nUy92UDR4NmlraEk1ZnVLc08zd3FYanJLV2V4Y3lnbTNnV3NS?=
 =?utf-8?B?dXEvWHFvYkQ2Mmw2dldxalFZOTR1c01nVUlndE1od3A4TStCV1lWeXpOMVRh?=
 =?utf-8?B?cVlYZmJHUmNXb0EyUy9mTW4xWTlEL290SVNGUUVZM1ZlZG9Fd1M4bVV3bTI5?=
 =?utf-8?B?SElVTVhqYitkMUdpeXhkaEd1elltaFgxSmUwYTl6TXFOWWlPM2g0VVM3OXJU?=
 =?utf-8?B?OHY3VTVyenM4OXpwYjFudFlXT2pTSUMyQnpFTmhNWERyY3Zhc2FaaWpXVi9p?=
 =?utf-8?B?QnE5bWcyWktyaDlMWjgxQTNtdzZ5Y1pLVUF2V0I2THB1cTY4Tm92MEZnZmd6?=
 =?utf-8?B?ZFQrZHg0UWYxTnI1SmR2V09BajRGWEY2Q2svTDBibVF3cnl1Qm92cnR4RXRy?=
 =?utf-8?B?UEp1bVRodFIwMFZHZ204clRZZksvUkptMXN4QlFFb2FxdXJLdERxY3pqWEw1?=
 =?utf-8?B?K3k1ZHJWZk5EWCtSaWZFMmw4Y0Z4YkJNVEhOYzZNQldsNmsybC9Xd3luR2hW?=
 =?utf-8?B?ZkFMOWwxeUNwdEh3MUhkc1B3bkNOcFVoSnVKTTNsV3F0MUpvOTYydFJmcThK?=
 =?utf-8?B?cWwwaFZqcm9mTVZDeTI2R3EvWmxBamE0SCtVNForWFNOLzZLTVdjYVdOOHd0?=
 =?utf-8?B?U0ttZmpqeS9YUFlIR3Q2blk5MlpudStCT0kzaDBTMGpieVNjQ012Sk5tOUJM?=
 =?utf-8?B?L1REdVFwTFljd0NwUkg3bXBoQXQvTnNDaE9iR0R0MzFpdjhsajNkbDNDcXU2?=
 =?utf-8?B?VUltQjNHZE1WRElLaWtsUlF4MXBML0Y3eWJob1A3KzFyNkFQUFBUZWFrSUNt?=
 =?utf-8?B?cTlZdlVralowRThZMFgrQ3ZQbXFGUUplQWZNbHloRmsyVUJVTm9SSTZBdW9G?=
 =?utf-8?B?SHNQQU5XNWcrYTJ0SlN6RmluLzQ3dFpzY2xkOEg3VWpZOFE5NEp2Z0dKWHZO?=
 =?utf-8?B?QUcvMnZWR1BxWlJRQ2RscGFONVhYbE1pOGFZMS9nSXFRQUlLSk1iWFExbTZX?=
 =?utf-8?B?ZjhMc21SZ2MyODllcm9uYlNXVnlyZmYxbTMrWWwrZU04V0hRKzk4MG9SVy9q?=
 =?utf-8?B?clJoUmQ0SDYvRlYxd0tMcGZqODRmZ2pWRndjcHk2T2RwK01lRkwyc0ozRHNS?=
 =?utf-8?B?Z2NaUUxCcXlFTXBxUVdOL2p4WEY1NCtUZXp4RGFvREtSRXhXTEFBYXB2bzZP?=
 =?utf-8?B?OEtuOFNINytqR0VjNVZZTlVOVm05WEtVUk1UVDRpUFB4L2FheE1PNnpzVnor?=
 =?utf-8?B?bEdXY0lSaXFMajhaSC9weC9GTFVjd2c1M1BsQ3JqTHJIOXZTcXZHL25rNEVk?=
 =?utf-8?B?QmVDdkphMFFKcXpJQ01wdFN1eExWaTdkYjMzSk9OdG9iYkM2QzNyVWh0MDNK?=
 =?utf-8?B?RDhkbnZ0TWZXaXdvZHRZc2V0M25XV1pUYjhKSUxhN0pUWVlha3FQUUJXZ01L?=
 =?utf-8?B?M0JHT3RtWWtiSzAwblFhSy9xQ3NvWDNOVGRNUk11NmpNWGJBZFVLdWJvampR?=
 =?utf-8?B?cjFDbHkxY2lNUkdXdTBtai9qR0ZidGQ1VEx6b21BTXRBMlpTalBOcEhaVS9j?=
 =?utf-8?B?VUlZVGpRME1vNjRBV1QwZWp4WUZoRDBOQXpNdTNSMjFjaFZwQTBiRjRHSHc4?=
 =?utf-8?B?Ym96TlBNZ0I5ZEs1Vll5OGcvUjRkUnF0ODNyeS9GbEs5SlBTQnZydi9HQlVR?=
 =?utf-8?B?aDlQMFQ4dE9FVTNKSENXQ1pJekFoR00zbndwMDBjVFRlaGRRQ1JXWGFaZ0NY?=
 =?utf-8?B?TlJmenRxdTB4VElRNnpZMjJOM1RCRTVOaHZBRzkzS1dieU1ldHdrWWsvdzRT?=
 =?utf-8?B?MVRROEw2YkVMUGdWaTdLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJoVHBiaWUycStwa0tUMGJJcmNGOCtlaVRpSkVvSFMyL2JRMFlhVm5RdUFu?=
 =?utf-8?B?ZXhDK1pvK2VJMm5iL290dHF1Z29QUlp6OHJqUms4TjBvdmRONzQ4aExJS0x5?=
 =?utf-8?B?WlhCZmZYeXVBUUErdHd0eS9Tcm02NEFnZlRUUEwxS091cEJjQzJuMGhZdWkx?=
 =?utf-8?B?NTNEV1FINmRDL3hxalFBY0kwWnV0T0lPQjdHMVJOa2NiNnZ6Zkc3elhudjZN?=
 =?utf-8?B?T2F4R2VvQ3JDUVR5bVFWWTdlNUhrZ1lINDZIUSswNGI1V1kxcVZ5SG15K29H?=
 =?utf-8?B?RXhQeEVVK244TFBQUnVLa3NmSjhHai9RWnZSUzdXRS9tVG4xa3lFb1ZOWHBN?=
 =?utf-8?B?Q21sOW9ma3lUbUdoOG9nVitrbDlhQmt5YithVUQyYmtrNjh1ZHQ4QUhkbjNO?=
 =?utf-8?B?eFVjQ0FqOTZ2TXI5QnhEM1VaeDc1SGJad283eDMybUJLZjR3S3k2MVE4Ynh2?=
 =?utf-8?B?N3R0cFNkZHNsN3RYM1NxbGJITHgvN21CdDI4VzJuZkRjaXBYcW01YkdoTi9E?=
 =?utf-8?B?b2NHdVphNUl0eThHLy9BczRUQjF1aFhrZFlNYUJLWFNzenpPd0g5WUhQR1VU?=
 =?utf-8?B?UlNOYU1jVVAzQ1I2RmE5aWsxeXd4NmdhVFBiWis3R3dmeTJxWTdXc2FZMGdu?=
 =?utf-8?B?eEJLWmsyeVZzUTdnUG9uU1N0TUhsMnAvM2N5ZEgxMlI5QWpqWWJYZjdZSlJn?=
 =?utf-8?B?M0RxcTdQZDF3R2E3bThIYndoT2EwSDc2VTFIV0wrejNNSVBiM3lacTA0K1lY?=
 =?utf-8?B?Z0pIWWlWT1VwWVB4bXlLNWVuUWNneWxRZVpKUmJlNFBmaFhIQ1ArL2U1U0tQ?=
 =?utf-8?B?WUhSUENDSUdhSit2aTdPNEo0R1dsNlhjNk1tVndWL281WmpGQkhJR1VaSXZm?=
 =?utf-8?B?cUVOdk5qK3N0MXk5NnVrNzQ2ejVjWHRldlQyWDZUUEVqanMrMC8xZlJKajM5?=
 =?utf-8?B?WTNCMW9OMHdiZGxPbk1FaGNwNEd3RDNLeUdrRWMzSDJEQ1JkYlAxWnpiSjhv?=
 =?utf-8?B?UmJINXBZQnVXVUFRNThheUR3bUc4ekErYWlVekdXc0xhclVHYnM0aFB1ZE9X?=
 =?utf-8?B?VzRuWG9QSldBQVFjRytLNWlibjVWcGRSS2wrQ1dZT0xvNTBZcC9nL3pud2J6?=
 =?utf-8?B?TjhDWWVDcVJjRmdoaXpDZy9ldE9CSDd1R2lKNWpQWFJoYWZsWnNVTnpid1Q5?=
 =?utf-8?B?aEl1ekRrdm5CQjZ6NlhDNGtRSUxjenh5dDJVNWY1WlR5aFltUFVubnVYYnRK?=
 =?utf-8?B?Nlc3ajNTVkI3eGR1VXhyYUFoOG5jV1FIeEMxWDh6bGZMUGVTN0VKSk1kRC9L?=
 =?utf-8?B?YzZOV1QxTTBJSm5RZmZ0QjRQUFNHbmtTTVBUaTRNbkNCcmRxbUFJQVhhV3Nk?=
 =?utf-8?B?bk94QmtaQW5YTHdkTlR6b0hFTXMvWlJxTkdUZ1B2dDF1bnhoVFdCelJYMUcx?=
 =?utf-8?B?MHdGN0hFek94UVIvV09kbXZZb3lBY1oxc255eGFPTG5sNXE5MkdBMmlNMCtu?=
 =?utf-8?B?Nis0c0dJWGQ0U2ZsR3N0S3lraXBqMFBkaGdqb2cxejVjWk8wVGFQcWpweE03?=
 =?utf-8?B?QzdEcU9rNUxqSDFyVWhXWkdUSlo0T2xaWXA3Y2dxaGg0M1RyS0g0d2tLWWVM?=
 =?utf-8?B?bzRSKzU2NGRreWxRNVJXWU94SlZHZm5MYktERGtaMEtwVnBlOGd1Q0laWXRT?=
 =?utf-8?B?N3g3eU1lcHdZbjA5NS9WSVdaRnFiOFdYcXJaMzk0a1NmcVRRd3dUMjlzamQ5?=
 =?utf-8?B?RGdmZEhIOW91UzBnMTN6RjhqZ1ZlbmdXTDY4c1VleTFZd0FhTFVab2RIYkhu?=
 =?utf-8?B?elU1N2FhT2pmaUlqL1pKbTh4anNnNWZSVCsyVjJhaUNRcUhFdHJBdEptdHdr?=
 =?utf-8?B?cmRGRVZrcEJoaVRzQVNLUDBLOFBJa2NZdXFUZGVhKy9nTGdjaXFsb3hYWENX?=
 =?utf-8?B?WjA5N0lGYjBTSnJoYzhnZjNPSmJiL1lGWFlJYTZkQUFCbU1iSy9QL3Q5N3Ax?=
 =?utf-8?B?N1QxZ1dOMjVxeVZ5MzlFblJtdVg5djJUME0vUnlicmVDc2dwZHlpYXpIMWhS?=
 =?utf-8?B?UkU0bTBxTzJzN3d5aExzczNmREhnMlEyek9ZNi9WblVpRlJuaU9vWVlnSXg3?=
 =?utf-8?B?QzhwejN2cURxN1JPdWFlRGc0eGdacklmcGtKazFySllWdmlsZUZQTkhOU3ZM?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8180dd3c-13ce-4c7c-a07b-08dcbdb29b6b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 05:16:39.0810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsrtTGEiU6Lo7ZsbEr3z9TpIM9bLo01sGRh1zR0cTu0YBSwIH7cxicv7EJqVzRDb2TM78UXVrvVr4CUZkNJyoVqUQRu670JgmP3sVlIv0Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
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

On Thu, Aug 15, 2024 at 06:07:24PM GMT, Rodrigo Vivi wrote:
>DPT code is so dependent on i915 vma implementation and it is not
>ported yet to Xe.
>
>This patch limits inspection to DPT's VMA struct to intel_dpt
>component only, so the Xe GGTT code can evolve.
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
> drivers/gpu/drm/i915/display/intel_dpt.h           | 1 +
> drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
> drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
> 4 files changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
>index 73a1918e2537..3a6d99044828 100644
>--- a/drivers/gpu/drm/i915/display/intel_dpt.c
>+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
> 	i915_vm_put(&dpt->vm);
> }
>
>+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
>+{
>+	return dpt_vma->node.start;
>+}
>diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
>index ff18a525bfbe..7336e905142d 100644
>--- a/drivers/gpu/drm/i915/display/intel_dpt.h
>+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
>@@ -20,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
> void intel_dpt_resume(struct drm_i915_private *i915);
> struct i915_address_space *
> intel_dpt_create(struct intel_framebuffer *fb);
>+u64 intel_dpt_offset(struct i915_vma *dpt_vma);

CI doesn't show the exact line, but build is breaking here:

./../drivers/gpu/drm/i915/display/intel_dpt.h:23:1: error: unknown type name ‘u64’
    23 | u64 intel_dpt_offset(struct i915_vma *dpt_vma);
       | ^~~
make[7]: *** [../drivers/gpu/drm/i915/Makefile:419: drivers/gpu/drm/i915/display/intel_dpt.hdrtest] Error 1
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/i915] Error 2

#include <linux/types.h>

to fix it.

And CONFIG_DRM_XE_WERROR in your .config

Lucas De Marchi

>
> #endif /* __INTEL_DPT_H__ */
>diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>index ba5a628b4757..1cf1d5c8b9dc 100644
>--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>@@ -14,6 +14,7 @@
> #include "intel_de.h"
> #include "intel_display_irq.h"
> #include "intel_display_types.h"
>+#include "intel_dpt.h"
> #include "intel_fb.h"
> #include "intel_fbc.h"
> #include "intel_frontbuffer.h"
>@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
> 		 * within the DPT is always 0.
> 		 */
> 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
>-			    plane_state->dpt_vma->node.start);
>+			    intel_dpt_offset(plane_state->dpt_vma));
> 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
> 		return offset >> 9;
> 	} else {
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index d7db44e79eaf..42d431ff14e7 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
> }
>
> /*
>- * For Xe introduce dummy intel_dpt_create which just return NULL and
>- * intel_dpt_destroy which does nothing.
>+ * For Xe introduce dummy intel_dpt_create which just return NULL,
>+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
>  */
> struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
> {
>@@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
> {
> 	return;
> }
>+
>+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
>+{
>+	return 0;
>+}
>-- 
>2.46.0
>
