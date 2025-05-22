Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F22C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC110E0FE;
	Thu, 22 May 2025 20:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LU4Ki8bY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C9810E0FE
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747945370; x=1779481370;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6cTyLO9vTgbJF+c9zsQ/5Mt3+lLLGn9NmD/rYPK/vMw=;
 b=LU4Ki8bY/NkQqTAjGQwHLjGMOLKDBB9cAGzjoWCdLY47OiTB+YKzWuND
 T73ze+9zX/RoKI4NW8I9zf+vBlO1QlZaSrSjAzENkXpPgH860BRHck805
 RXX0yOqOj7Wsbj+ZLLX3RyZKp7sVNVk3yGV2J34KQ5wJjs8HdTE8Wfbic
 dX+uEl1y+vY6m0CKPTbLIfTc/6rbvlw2pVq8lH/j0eNKTB9aVgrm4+prh
 PDItHMc2bWE3+k09qqC7ekMH5MnPSVh/Nl1f3lJao3n8tCT5Uc7Wl0WVL
 kD/mhP+dkGdKCqnT4rNDPvmvVH0hHddTpCUUnTbxrBB5hLVg8iMNlGAe3 w==;
X-CSE-ConnectionGUID: c6Asz2DaQIG43Ap6zJn9XQ==
X-CSE-MsgGUID: wwfnOtvQROyIhxK4r1G8/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61398316"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="61398316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:22:46 -0700
X-CSE-ConnectionGUID: XtMMEiiYRmyslUQE8F8m8Q==
X-CSE-MsgGUID: 8krQSaSYS8qj8eg1ti1erg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141809109"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:22:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:22:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:22:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.54)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhBm+R4dEzEgC2VXLsv39IiujHUMkA2pIB+bkRBjL4rhzvpQxDJtGr4TsenKwGlki4WNpICHksM5AAZh314jt4GY7vKQSINRRa9fpureqoGIxU5ELp1jbkfm+9pOHLECG8hLhREvQ31H3qgp0DEZut7m10fJZL1/hlqr/xTA3eFEEppNKwz6r4qGlGAgAyNxGQy4LU5JE4Dw6CteTSQyVrRDtQJcnH5OUtb2cySl+lmYrLKBmpapAOakDoqM1JoEt1UpiErQvGz6NGbpzEwqmlLwztqSxbiXJ+OcRUSPZoA48bIWxxs+WfapLthnEyVKx4kFYH21C6w15f2KXhukXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRdYPcn12M0lteEJJq8NUDKqbLUcYjuglWSMtrHqRSQ=;
 b=n54EJ4qsR+4Wa0d6K2BrjfVCxZEKHp6MaU7+Xh6ZKy4pBROwqNX9dxP7p5li6zEmTeC4BmetXJW/MJzVtBW7+hJ3cQRlKhv6Kjrwficu1oEiO7UY/x75jHzJAmu4Gt18AZBoKwKg7Fkf54Mrtdpmvd31GClqrbIRKY4QK7c0hsNzeGW8gDHEVSzzwJpJKyL59eLQ7ak6u31zO3BKO0jFloEBk+pvFWAf6pguVj4rB/39A4TbHv7Bqx1lv84/rXwUp15e9Ah2nP8Pcw0FYYQ6ZnOW/bZYVv/hbxuOMXnhkc0FL+1uOi6g1Vmky9xxhHgV2SwoKU4BbzvF3FvzmVSn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 22 May
 2025 20:22:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 20:22:15 +0000
Date: Thu, 22 May 2025 15:22:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Message-ID: <brjm2adotuyq7xsfryavidpzh5prq2zd4awm7b25ngxdptzqbx@pqy746ozvyas>
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
 <20250522190138.GS6239@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522190138.GS6239@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: fa51bfd4-2324-4d32-9932-08dd996e57d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R5A6eyCoHORwSwMJhZwwGThlLi8Ty9Pmnmxm7fPGpdDlNHpiIUXwIivkzI?=
 =?iso-8859-1?Q?cSRiuIclWJzrFWT7lCzO+xhen9StN2GD63n4cATjUTlUYLnrF9qI7oaItF?=
 =?iso-8859-1?Q?j7gR7VcJg8PolaTXax+KZUMU6R6qMQx++YMKpZP7qQ2VXZRlQl3C8dSMBr?=
 =?iso-8859-1?Q?TMZAOv2r2woPgonO0mXsoNVLgL6lbSR/rNPuch3vvslVe9Rpdcyh5rpNGg?=
 =?iso-8859-1?Q?my92zwstTy+CMoRQItMbT8o/wI66Rr2z0HSIaf0YuJzL7HPxBeSkQI1dxp?=
 =?iso-8859-1?Q?4D1QagwrX4uIwI7Mvcxodt+DywNwZR6HQx6nnLn2v2LSTQ7DVaxf/bV9BG?=
 =?iso-8859-1?Q?Ngy7Ikz85SFY2r/XJL8NumZLR6ZTbfwmQOFQQPpqMqddMeMpX8nKNqFhQQ?=
 =?iso-8859-1?Q?1Qo0ypHRI3IeEvg41Ab7+safb1+MgWypepQXBwRmDWs8Pv5gNV2HEvWsR+?=
 =?iso-8859-1?Q?PTBXe9vxRBtYp1qvoE7//+fEDAWH+ZEz40+WMBFQDfR4CcD7fTeotuZDOK?=
 =?iso-8859-1?Q?m9P2m66s8DohKHhJ4DcIVHc8w01u+vCHtsbntSoavcc5Ue5ejn+UpYbELR?=
 =?iso-8859-1?Q?FBTQD1fgrkUuIsPIkyQpUXOssHtSrQQxssF2PRY6wcyxGWCXXmVba4MB0w?=
 =?iso-8859-1?Q?daRYs/Lio4QoX4R21Pr3aDnu53bXUiyHpMlli8jNsRqcII1+HGpl9+F6UN?=
 =?iso-8859-1?Q?1AUTfrGqnU8kKlqvXaqQP582YrreA9Tskbu5csDKxg/ZNs1J9yU2GopsWe?=
 =?iso-8859-1?Q?5EQbRjXoOuzgWMS7E1J4/O9IgMBTOMMLccxWUMLY+JvQjJfAITwjbTTLzK?=
 =?iso-8859-1?Q?UnWp0FkwhO9fuwBkO88o8Y/mH2GOtJ0Wcx1OhPS1XrtvA8VpwmwPhPCBsL?=
 =?iso-8859-1?Q?X1e84yzXmO8tCVEXzX9NIBfXclTdFp7+JuMfo3ksyRD56/XhmJvUMukQ/f?=
 =?iso-8859-1?Q?3GwD+gokAkUfGOv/q54c6cp2cS724H1SbvdaD/gA7iSxfj2Iz401FJ5CP5?=
 =?iso-8859-1?Q?Wa20O4RH3i3V4TgRFPsPmXa016gj5OjBX0jT7AKAF4MErBEQ8KaDjmQaFJ?=
 =?iso-8859-1?Q?jVNRRpqFkInLOUUz/7hJMNIAu6tle2dew2zXMiaG6Jfi2KWqpBOv6Hx3H+?=
 =?iso-8859-1?Q?PUSf4EkaXIkMDxFeAkYleDTXw7W9p5TVKjST5+QNmcbRZtI/It2Z/jyxAl?=
 =?iso-8859-1?Q?7BRk2vakDxiNcoVrsHH1w2v4TklD8r7+olSvDAEzd8j8KuieH8sW+3dCWW?=
 =?iso-8859-1?Q?y0zJvZ5TneTlbhvHynsXL/3BWxS9X7gjyc0bzb0JjeL7t3VxL70M+HXfcs?=
 =?iso-8859-1?Q?8D+LUm+fZ6DzPIRj2VNREQjxy6T4/t3vQm0E6qkbZn24nr1nSTpJEj0VEM?=
 =?iso-8859-1?Q?Bf1kN7unvQFEpn8SDjskkQ9CnbTLvFuhAW/3NR5CmAt6tk07I9ehNvvC7a?=
 =?iso-8859-1?Q?zFkPq4LrGwpTuufj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A/PTr5/b7Q9LofbhVNOiEhQermTby5+OUWX7wv5f897YhvYdUCxIPfFVDn?=
 =?iso-8859-1?Q?HwCH7KACWcxKtdGPbNvhRWihioh54IS2dEjdXL5TkwcM+1yH9h4GKc7y7W?=
 =?iso-8859-1?Q?AHgcXsXtiFzuisIeXRL3tijtPraf1OJYpc3Yn4IH9luHJCKZ88pls+cQNN?=
 =?iso-8859-1?Q?oa3ClMQU23rDwg4DREL3TzFwe4VBQj4XiyWkMqWMAr4zdhhiTeapnj9C1/?=
 =?iso-8859-1?Q?+/3ejArtYjrFWX1qLG7Dq4UI2iQpDvWhqg6eXve9MVoAEWtrCngJet1UQa?=
 =?iso-8859-1?Q?Yhf9NGESbpfJNHKj5tXxXVNZJBALcvB1eLVlEOkf2HxRyLhMg1qEOlcpnu?=
 =?iso-8859-1?Q?aX/tRXAxLy72ZBXFLHvjNV2DofjJSn/tgqVEVBYN1PlMxBi8zfe9x2pM17?=
 =?iso-8859-1?Q?ckCIEhp5WLqN5GMl5Udz3Cep8z7eH82e0zPQ8IbOMTcf/GZb1QpfH9zspO?=
 =?iso-8859-1?Q?ip9qcsWRDZv1C4eyVgC3+0NwJVHBULlk78MKdXVSVsB3VHTCa24zTYbuxr?=
 =?iso-8859-1?Q?J/oMSWzA7UTOX5OlCjBn2RzlQqgwH559e6hhenUwGyndAwln4Pz9tGAi7p?=
 =?iso-8859-1?Q?oRzyz+1J3OJ+pFoHKwtGTCeiWhDUYnjvMp6YOI/FPOuKeYfCsIjOhzk+QZ?=
 =?iso-8859-1?Q?iivhd7m2k4V7+rLsrUGvbeujQut0Vu8UV/k4nO0CdPspqwuDer9wgHRw+u?=
 =?iso-8859-1?Q?7b76wA9dhHFgYs5jkvgAV0dTMUAq4XWpK3OHPBImKZjOTKhPjbFACjklcW?=
 =?iso-8859-1?Q?0xMRIZi+bdE+zMIo3cqxDnzk9+cPM/y5A53sl75alDllnJ6T0i7oSJEjU/?=
 =?iso-8859-1?Q?hkge4GPYaQfm9O7yfY2bbJCxndUF5XzdvU5/Fm0fEzKG007fCUkL2Z9ht8?=
 =?iso-8859-1?Q?whTAaqg0PBtmwKdIOknR+Jy8NXgibEjoSjLcb+HRAQODKOrSGgglK0dCHv?=
 =?iso-8859-1?Q?nYjBuYJ9rKhyAexvGoe+DAym9IdKoVoVBwq6cATfD5pGU1XnbTorpqr1E2?=
 =?iso-8859-1?Q?eQ+BXqK7mx0sgB1fwbfsA+G+vSutZGCko1tCOGZjUD/mwjd6Ivzjet/HlI?=
 =?iso-8859-1?Q?1nnJa+OFGsJQJ7UWcWI4LoHXtS7RvQIKzrnnLzxn/cjysiNWXDuIuKFMQi?=
 =?iso-8859-1?Q?AvXQiROvpPHgBIlcXdSoYo8GAhuUZl5MVPzcgj1w95tlachtLCHIKgHzNW?=
 =?iso-8859-1?Q?UD45dpB1HCij0t2FP/mIu7xJN0/amk2vqIx1ViYCj/7+VaYOG9f85HUwTy?=
 =?iso-8859-1?Q?uf7Pu6lNwY9b75H2l/ffr746ifUvYRVlE9nBWz2eLV2Du8F4bcgM6rNwWF?=
 =?iso-8859-1?Q?WH6AmleuTFho+TuSY9qgBhYU09catN3X1TLBeqTSpP09WKVOy17CdDxoE0?=
 =?iso-8859-1?Q?ErrQmzSi0YWytH2oBorg+rGKc7fArtV8rLKnSdy5nR6gMp7CIc0aBBKE4Q?=
 =?iso-8859-1?Q?Y6hDNG+XlLKKxSk6wr2KZl/phEaoKdsxwpdYFKbZmc8NKs/Y1k+IkVeYNM?=
 =?iso-8859-1?Q?/qP6kibEOwmKnINko5Clv2Z0AmJrvkK/pt4zsWhzIcWsDvJG94QAIWnEpj?=
 =?iso-8859-1?Q?HiA/6shwqGhCBq9imUhOBLWs+Qa/xRIUIX9b2bqXr6hvv0V6RsrvP8VooD?=
 =?iso-8859-1?Q?Ht0TPcVCT07Bh8t9QfcGlSggXVHmJE89SarOvsR2D7TsA6qDXj1oDHZw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa51bfd4-2324-4d32-9932-08dd996e57d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:22:15.8768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8Og9a4JrDGKni7c16wOZ0+HhCW4M7ejU/kht6PG1uu7S3A7DLm25nO6p4qyMfeCjgJYXBvtl7uEl/2l2EQJm8D/AVi+t/3d0e5NguXw3Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

On Thu, May 22, 2025 at 12:01:38PM -0700, Matt Roper wrote:
>On Tue, May 20, 2025 at 02:28:58PM -0700, Lucas De Marchi wrote:
>> Sometimes it's useful to load the driver with a smaller set of engines
>> to allow more targeted debugging, particularly on early enabling. Add a
>> file in configfs that allows enable only a set of engines.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> Changes in v2:
>> - Fix build with CONFIG_CONFIGFS_FS=n
>> - Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c  | 133 ++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs.h  |   2 +
>>  drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
>>  3 files changed, 155 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index cb9f175c89a1c..fb433503501c8 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -3,14 +3,18 @@
>>   * Copyright © 2025 Intel Corporation
>>   */
>>
>> +#include <linux/bitops.h>
>>  #include <linux/configfs.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>> +#include <linux/string.h>
>>
>>  #include "xe_configfs.h"
>>  #include "xe_module.h"
>>
>> +#include "xe_hw_engine_types.h"
>> +
>>  /**
>>   * DOC: Xe Configfs
>>   *
>> @@ -48,6 +52,23 @@
>>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>>   *
>> + * Allowed engine:
>> + * ---------------
>> + *
>> + * Allow only a set of engine(s) to be available - this is the equivalent of
>> + * fusing engines off in software. Examples:
>> + *
>> + * Allow only one render and one copy engines, nothing else::
>> + *
>> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * Allow only compute engines and first copy engine::
>> + *
>> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * The requested configuration may not be supported by the platform and driver
>> + * may fail to probe - intended for debugging purposes.
>> + *
>>   * Remove devices
>>   * ==============
:x
y>>   *
>> @@ -60,6 +81,7 @@ struct xe_config_device {
>>  	struct config_group group;
>>
>>  	bool survivability_mode;
>> +	u64 engine_allowed;
>>
>>  	/* protects attributes */
>>  	struct mutex lock;
>> @@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>>  	return len;
>>  }
>>
>> +static ssize_t engine_allowed_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_device *dev = to_xe_config_device(item);
>> +
>> +	return sprintf(page, "%#llx\n", dev->engine_allowed);
>> +}
>> +
>> +static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
>> +{
>> +	static const struct  {
>> +		const char *cls;
>> +		u64 mask;
>> +	} map[] = {
>> +		{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>> +		{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>> +		{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>> +		{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>> +		{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>
>Is it intentional that this only controls userspace-accessible engines?
>Would there ever be any value in disabling internal engines like the GSC
>for testing purposes?

not really intentional. I just thought it would be weird for userspace
to mask an "other" engine since it's not even visible by the normal
means.  I will take a look on adding it on next version.

>> +	};
>> +	size_t i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(map); i++) {
>> +		size_t clslen = strlen(map[i].cls);
>> +		size_t numlen = namelen - clslen;
>> +		char instancestr[4];
>> +		u8 instance;
>> +
>> +		if (namelen < clslen + 1 || strncmp(name, map[i].cls, clslen))
>
>Nitpick: "namelen <= clslen" seems like slightly more natural way to
>write the first part of this condition?

ok

>
>> +			continue;
>> +
>> +		if (name[clslen] == '*' && numlen == 1) {
>> +			*mask = map[i].mask;
>> +			return true;
>> +		}
>> +
>> +		if (numlen > sizeof(instancestr) - 1)
>> +			return false;
>> +
>> +		memcpy(instancestr, name + clslen, numlen);
>> +		instancestr[numlen] = '\0';
>> +
>> +		if (!kstrtou8(instancestr, 10, &instance)) {
>> +			u16 bit = __ffs64(map[i].mask) + instance;
>> +			u64 val;
>> +
>> +			if (bit > sizeof(val) * BITS_PER_BYTE)
>> +				return false;
>
>Would it be simpler to check that bit <= fls of the engine mask?  That
>will both guarantee that it isn't past the end of a u64, and also that
>it isn't overflowing into a bit for some other engine type.

you mean that for the check below? I could merge both conditions
with something like this:

	if (bit < __ffs64(map[i].mask) || bit > fls64(map[i].mask))
		return false;

which would indeed be simpler.

>
>> +
>> +			val = BIT_ULL(bit);
>> +			if ((val | map[i].mask) == map[i].mask) {
>> +				*mask = val;
>> +				return true;
>> +			}
>> +		}
>> +
>> +		return false;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static ssize_t engine_allowed_store(struct config_item *item, const char *page,
>> +				    size_t len)
>> +{
>> +	struct xe_config_device *dev = to_xe_config_device(item);
>> +	size_t namelen, p;
>> +	u64 mask, val = 0;
>> +
>> +	for (p = 0; p < len; p += namelen + 1) {
>> +		namelen = strcspn(page + p, ",\n");
>> +		if (!lookup_engine_mask(page + p, namelen, &mask))
>> +			return -EINVAL;
>> +
>> +		val |= mask;
>> +	}
>> +
>> +	mutex_lock(&dev->lock);
>> +	dev->engine_allowed = val;
>> +	mutex_unlock(&dev->lock);
>> +
>> +	return len;
>> +}
>> +
>>  CONFIGFS_ATTR(, survivability_mode);
>> +CONFIGFS_ATTR(, engine_allowed);
>>
>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>  	&attr_survivability_mode,
>> +	&attr_engine_allowed,
>>  	NULL,
>>  };
>>
>> @@ -139,6 +246,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	if (!dev)
>>  		return ERR_PTR(-ENOMEM);
>>
>> +	/* Default values */
>> +	dev->engine_allowed = U64_MAX;
>> +
>>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>>
>>  	mutex_init(&dev->lock);
>> @@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>  	config_item_put(&dev->group.cg_item);
>>  }
>>
>> +/**
>> + * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
>> + * @pdev: pci device
>> + *
>> + * Find the configfs group that belongs to the pci device and return
>> + * the mask of engines allowed to be used.
>> + *
>> + * Return: engine mask with allowed engines
>> + */
>> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>> +{
>> +	struct xe_config_device *dev = configfs_find_group(pdev);
>> +	u64 engine_allowed;
>> +
>> +	if (!dev)
>> +		return U64_MAX;
>> +
>> +	engine_allowed = dev->engine_allowed;
>> +	config_item_put(&dev->group.cg_item);
>> +
>> +	return engine_allowed;
>> +}
>> +
>>  int __init xe_configfs_init(void)
>>  {
>>  	struct config_group *root = &xe_configfs.su_group;
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index d7d041ec26117..c80131f994a71 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -14,11 +14,13 @@ int xe_configfs_init(void);
>>  void xe_configfs_exit(void);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; };
>>  static inline void xe_configfs_exit(void) {};
>>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
>>  static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
>> +static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
>>  #endif
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 93241fd0a4ba3..af750ed8c0f00 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -17,6 +17,7 @@
>>  #include "regs/xe_irq_regs.h"
>>  #include "xe_assert.h"
>>  #include "xe_bo.h"
>> +#include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_execlist.h"
>>  #include "xe_force_wake.h"
>> @@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
>>  	}
>>  }
>>
>> +static void check_sw_fuses(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
>> +	enum xe_hw_engine_id id;
>> +
>> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>> +		if (!(gt->info.engine_mask & BIT(id)))
>> +			continue;
>> +
>> +		if (!(sw_allowed & BIT(id))) {
>> +			gt->info.engine_mask &= ~BIT(id);
>> +			drm_info(&xe->drm, "%s fused off (in sw)\n",
>
>I'd avoid using the term 'fuse' here.  Maybe just "%s disabled via
>configfs" would be more accurate and helpful.

ok

thanks
Lucas De Marchi

>
>
>Matt
>
>> +				 engine_infos[id].name);
>> +		}
>> +	}
>> +}
>> +
>>  int xe_hw_engines_init_early(struct xe_gt *gt)
>>  {
>>  	int i;
>> @@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>  	read_copy_fuses(gt);
>>  	read_compute_fuses(gt);
>>  	check_gsc_availability(gt);
>> +	check_sw_fuses(gt);
>>
>>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>
>>
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
