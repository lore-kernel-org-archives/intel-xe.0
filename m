Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D34DC021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E31110E98E;
	Wed, 12 Feb 2025 20:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SghLEzsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243710E98E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 20:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739391110; x=1770927110;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mqAVtNQNZb53m0eM1x4+2rtyAS1IrzHbro6X8ZAcRKA=;
 b=SghLEzsVTenSuG6nsMxhqFxzSY6NCUsie0ygfxU9XwsPjdSCTQ4e5ik/
 HimogYLYLVZkeL1Tku3oJM+cJOD757/qQWf0rLs8yzFRUlVk5bgU0VLFm
 yfMCh8hltMZyeAfo7bbx2bMYWcxRLH4/LsW99fwNCBPSFx9arS3LNADsO
 Zvb6sMauauX43y8xnHEVcNLiDx3E6o2gZRMaoKb0VWlH5S6TtsBIqwgDE
 o/B3D/9ouOaEARsz85L2wVCnsIhN62kS0/Aa3dZnoBCMfTN6wV0L0+geD
 QM0r4psIH2BKDvL2vbkTHjIW/s0EYAdZe00sFPyN0wZIrpR77F8eH3R2m g==;
X-CSE-ConnectionGUID: GEqjQQy1QIO9Y6n3G5Vhrw==
X-CSE-MsgGUID: B9dsP6abREa35LWWMRshdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="44003368"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="44003368"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:11:49 -0800
X-CSE-ConnectionGUID: Ep8BW17WQuGEK3PBxrDIaw==
X-CSE-MsgGUID: LbAG76o+Tk+5WWehEy3k+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113124011"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 12:11:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 12:11:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 12:11:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 12:11:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWxk379OS0rnKflV71FBDSt0FnVEwTF/Jo10weotMy+bJ46Hw486xpym8gwmLqhRhiO7tCZQAKEwCRSXa1GfVrjhOON+6uM3tyrO1S2S90JL6JOCknF2QlsrELM9yqlETwGgFgs3IwHag3yfDOt9pAN2i8BiCDT5ezXsSGB22HDssQ23uFS/vTfXx30IbsHqeO1kwy3b0Uc7Y4OJ45IUrsWkwq5n4FucHcBt1ro9MnQX984gHVTn475CXfH45exFu/kQrOgB38a0T3uZ9K3KwF5Rqd+LRJxmeKHsTBvijV+qc0WOQaRjrPuGkGYF0A2V+IZ+xTG4SBVMMbOJcyrw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDNJHmIAHEhRBKjpua6vAY7AoygZl788a193B9p9qVg=;
 b=dAcplIXAp+gXfMGu7bY6ifsqmEs0EeweGQ3WKC3DJSnDUYquUG+flGh4IH6vZuxF3PiJ8kJCGB6xsscnVI7saRY2xaNL+lZS79xTNA0lI1SE48A7zuUMV1L0Mhq7Z3FVIGJk8rC1af/w6k7+JAW57frhRRiSy+LgA7kThpjZ/4tySCvGm6fFo30EKY5CzO5vAGdBY7oueMt6ttT3neI3SzYUj29b/NGyDwoegp/QvmWs9PISvdWncnpGC0B/cqfruHzKypXilzOdDdRQ6aaNcFNaebuGPvr8v5/Kkp+5aDJZ65Ps8jD7HvJmvmkcGL4bAH0v9XmVKr6gBunmjo0K9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 20:11:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 20:11:45 +0000
Date: Wed, 12 Feb 2025 14:11:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Message-ID: <y2la6txhtvpkpbru6uxfcogmpwmvoujlfk22qem65nvllxvrnp@afh54ajgo6co>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
 <20250212193600.475089-2-lucas.demarchi@intel.com>
 <Z6z-CHRbTtO137d7@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6z-CHRbTtO137d7@intel.com>
X-ClientProxiedBy: MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e54be43-c40c-42c3-0d82-08dd4ba17916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MesIcgK3mNKsLNrYknlEc0z7O0sAKkfOMa7/rjRQdUnUWKDg/9WdwJykhp?=
 =?iso-8859-1?Q?h271fFxbbRbQsS8ksdGhICElOP2XUqNumgKZNe3Rro64dxMibWuQy/8eNi?=
 =?iso-8859-1?Q?U+Q59AqssB9IrGiT3h0k8OTuci0xD9EyE5dwE15e2AXoYN6kENro6Qq2fB?=
 =?iso-8859-1?Q?qD1zZVGsN5w7yuYIzftZ0tmhJesjd1MQ2BHR6O/043YTk3nEjJGzQO9Pnv?=
 =?iso-8859-1?Q?xBySUUBFRy32Uxls9pcZv1zNWkNmqWj3f1A1S9MQNIWhhkTBgsNEsuiYjb?=
 =?iso-8859-1?Q?Oi0BKa74akwWXdJtB8B8EcfLa1vzcZ82stusiVTGiXrwFctjWXNP6mp8zf?=
 =?iso-8859-1?Q?sYXowACxvZBdnstP7UUT+JuBdxD6QzxikDwVmvNFZt2cdwDeGfx1r0yHWi?=
 =?iso-8859-1?Q?OeNSgFY2SUlbbaTBN+qUA7+ItZfTAPX6yrBQlgvIIxJofXy8QxpEoVUtM5?=
 =?iso-8859-1?Q?iZ76dvdd4zLKe5vpxvXdB5JHjP9LHBFJALOWkQrapdO/YmE2Xeb21iZT25?=
 =?iso-8859-1?Q?PbgSuRnG4mvgpZQ/3DLIsT7lrFIm/Dv4YpCgGwiMy8+l/7fkf73S9qbeZe?=
 =?iso-8859-1?Q?s1Z9l3Gp4iWJlksHFsobJQfdhx4RIVyNbzbW8PzyunnUWoGBhe6+7SZh9u?=
 =?iso-8859-1?Q?n9qozOnolxMGMV9DVsAqi02CZb3Q3fGKuP3lRTe/0krPlG5/cyKiQ6WG4V?=
 =?iso-8859-1?Q?yLzwkvlKkf0Yxn9KdIRxGmhAoOu3dK76Fn4t2REf8XghP55KzweTotsCPD?=
 =?iso-8859-1?Q?TdH1y51M7MG0qfjqq1AzKCVocOSGy5ED+mA/Il/EJjMGcH8ZKdxMaWZuRR?=
 =?iso-8859-1?Q?oPRv//8UD5S9UjVKLyovPVtgCQ7MVP72rrzNItyhlTlDLhdeTpFgwat4FM?=
 =?iso-8859-1?Q?Q0iyEZE2C3G4eLxRfhpelGqIQnsMw8c8u7TjxTKbz30XS+3P7TrdB7Ynvu?=
 =?iso-8859-1?Q?IOIR8/lRjjxdugKuiQDXRlmbu7VvhX5TREOd8ijpxcpWzmiZMa+tt/UvbX?=
 =?iso-8859-1?Q?cH0EtNFGJQInY2HDrqylnzGcQdmaM8v/mj0c0q6F93JqCw8c6a2hWpCdVp?=
 =?iso-8859-1?Q?zow/QGVhYiaZtHhBzfwg0Fh2Xm3WWm2zO2zC/3gi6n+KOtbrgVlnx8Umsk?=
 =?iso-8859-1?Q?raIaHGi9fqDb/z7iMMMtHpjAvRDYNW8TJB/DFi0YkLDIQ9aKzKXX4ufT9Z?=
 =?iso-8859-1?Q?thOu1Fw1K51tEK4toM71ud5TAppOfAsQp6/IhCnzy3ltw98wBqOA5VWnOk?=
 =?iso-8859-1?Q?smebH12eTRIOWg56Y7jG/iXWdqVKju9wP28WypJTM4FMg3PLJfjIFN9aQ1?=
 =?iso-8859-1?Q?jdcQox3zY/aLWmZLM16roVlRVLcRNbNMubSwzXmPqrOV4Lv2Vk8o2DKCZT?=
 =?iso-8859-1?Q?Cq+r+H9P+cPkFCiSnDMQ/xR8qECxZy1x5qh2o6ciGTDZYLgswYHgYegbqJ?=
 =?iso-8859-1?Q?DENdZ8BvLbwLJT7T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hCO4oPg7U2YbrElmt1IrvsjW1t4kbeFobFJyihotY4Bypc1hZ8ww54rjar?=
 =?iso-8859-1?Q?li387kI9Rdg+9HJrWQ0gyWZag0g2v7cGu9HDBPINHAoWSR1BPdkLpyYZ6j?=
 =?iso-8859-1?Q?ApBnu6Jc7nNVVe8fiSp9hgnl1lh4Nffmmf6+7TVBk8139DpHLQeNwqp6Tf?=
 =?iso-8859-1?Q?8ubu8tIZfQUPX1SDY4KUQ858vq/W7D3vjpvMAid9LfmUIh19kl5mRKEe2D?=
 =?iso-8859-1?Q?TixCN457lA3TsUMVgYKl1h4dkCBhLurwdNlQxq6hWpASnKN53y95RNCXco?=
 =?iso-8859-1?Q?wEGTVA74cBy0WFkrOx1ToqVAImD8sIgJrBGJQGksRCbTTTRf1nMwSTENvz?=
 =?iso-8859-1?Q?HTarpthqBL2IBzA4pCPehLHqhMHbPf0Z4wwHAPZ5JctMOy7TU2L9XcjxFh?=
 =?iso-8859-1?Q?GUGbsqD+e4iEJmct9MchUmiCURvVAKLRnod24S9trdfAVe384PkwLS6Yfl?=
 =?iso-8859-1?Q?uXgsEJPH2Wko230UE+ai//pDVh23brRSu1qcm2piQwvnB2R1JoxEXVAyRM?=
 =?iso-8859-1?Q?dRrm0Muo3vsGSqj/FD8P8Bh+b6Bi+mZYPCIWWV061aF1M3bntQGvgPgC7z?=
 =?iso-8859-1?Q?mSEGs7RkZnOS3yAR+nAydEiCb7cEhLHdJPq6vo3d33USoIU0P7wJ2Rzp/Z?=
 =?iso-8859-1?Q?xAMyBMYUDX19zacRaElO/CePj3JwuBFoa+MVe/HfHacg4abBT2LGWuJqlm?=
 =?iso-8859-1?Q?h4TKDvrx2dlZwQMGEWqOKNfDJXXx261gmgwv93nt37S44/Kj6qcQlzWtWh?=
 =?iso-8859-1?Q?OO5UurN4yvAhYbY28kdnfOrlFEoj+TebEMhnLFYl5um0oqMWbUFXmlha2X?=
 =?iso-8859-1?Q?pEmj+LuZE5NlwjKT+5gelgVthaKHYworoeRW9H7XWslvkXBsM31h4exojc?=
 =?iso-8859-1?Q?H0bHjy4+/Sfjkq3SlQ07jYLIKeRCSs46E0JxlI3pyyZxuAfaZMA8An4Ige?=
 =?iso-8859-1?Q?mvRo+H/koxsWA/Xp+hlvc3OaB+fQ2PHB1B/nxlpg69UBIj3RX4nuXrnCa3?=
 =?iso-8859-1?Q?2+VLNnG1bPZlkqx19tUUzbgDSyIY8h6UrMDryxZ6zjSIEBkMdJmo5Kd1IO?=
 =?iso-8859-1?Q?Oe5P/n0pDBHXJAB+SAxf0sjJUYmkGuraibsWEmL50VjVB79KgS/bxik4U6?=
 =?iso-8859-1?Q?rqsQGsNdXm9SyOl04nKA/IwhuNSjhAVdf6RsJgRibIQjgHdil3lrZdidfg?=
 =?iso-8859-1?Q?OkcVXvMvDiiVAwgcEW2yRuFuc++DsIfTjl6rOiYpaKX72fic4qam6PsxsW?=
 =?iso-8859-1?Q?Oh8wK0KyZggU/LU1PxVCoT7/s9d2YC8mEnLoF9ky0khnegIhvd4eFEVJ9L?=
 =?iso-8859-1?Q?OfRpjo4LGecebFZXE6snuMpA+04lO0qSxKH9nJiL9WPCXN/HI3ehBU+3KQ?=
 =?iso-8859-1?Q?/tffPf45DgcZSx37redcEaZH1f5jFj0ddJEjaKT4VAIQWctcexRtRAihfK?=
 =?iso-8859-1?Q?8AH6DBimIRYhRtYVfdoBG3gO5IgpWmoXzbxGpnqHlyhb8cT3zTaxYnBFUH?=
 =?iso-8859-1?Q?ugJNBfS128NOVhXQyWWW0kfXzF43Xl97l3vRq9ORy8zIbo5eDGQ4vbNvzZ?=
 =?iso-8859-1?Q?7L4yaTsDVGHV9xJet6nuMvDyIaer5mn4PIXhJJp2Cd7C+zUKkfSPiOi0Uk?=
 =?iso-8859-1?Q?sjcJLzOr7DLXcpIr2Uh5jtcLEtJ4mN8y3KO2+20FF+1FuNk+P7KMzKuQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e54be43-c40c-42c3-0d82-08dd4ba17916
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 20:11:45.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oph/zR8BJuf3QWJnjYxR2zYnOdlMofTE0caoqg9qn42Es3uzC6XbTXY7eV/EdWgtrKQmrjeCbBhbgv8nHG1JLarbcAPXHEJrS8wINLybN2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
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

On Wed, Feb 12, 2025 at 03:01:12PM -0500, Rodrigo Vivi wrote:
>On Wed, Feb 12, 2025 at 11:35:48AM -0800, Lucas De Marchi wrote:
>> xe device probe uses devm cleanup in most places. However there are a
>> few cases where this is not possible: when the driver interacts with
>> component add/del. In that case, the resource group would be cleanup
>> while the entire device resources are in the process of cleanup.  One
>> example is the xe_gsc_proxy and display using that to interact with mei
>> and audio.
>>
>> Add a callback-based remove so the exception doesn't make the probe
>> use multiple error handling styles.
>>
>> v2: Change internal API to mimic the devm API. This will make it easier
>>     to migrate in future when devm can be used.
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       | 79 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device.h       |  4 ++
>>  drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++
>>  drivers/gpu/drm/xe/xe_pci.c          |  4 +-
>>  4 files changed, 103 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 36d7ffb3b4d90..69bde506ee87e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -65,6 +65,12 @@
>>
>>  #include <generated/xe_wa_oob.h>
>>
>> +struct xe_device_remove_action {
>> +	struct list_head node;
>> +	xe_device_remove_action_t remove;
>> +	void *data;
>> +};
>> +
>>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  {
>>  	struct xe_device *xe = to_xe_device(dev);
>> @@ -746,6 +752,9 @@ int xe_device_probe(struct xe_device *xe)
>>  	u8 last_gt;
>>  	u8 id;
>>
>> +	xe->probing = true;
>> +	INIT_LIST_HEAD(&xe->remove_action_list);
>> +
>>  	xe_pat_init_early(xe);
>>
>>  	err = xe_sriov_init(xe);
>> @@ -886,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
>>
>>  	xe_vsec_init(xe);
>>
>> +	xe->probing = false;
>> +
>>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>
>>  err_fini_display:
>> @@ -907,6 +918,72 @@ int xe_device_probe(struct xe_device *xe)
>>  	return err;
>>  }
>>
>> +/**
>> + * xe_device_call_remove_actions - Call the remove actions
>> + * @xe: xe device instance
>> + *
>> + * This is only to be used by xe_pci and xe_device to call the remove actions
>> + * while removing the driver or handling probe failures.
>> + */
>> +void xe_device_call_remove_actions(struct xe_device *xe)
>> +{
>> +	struct xe_device_remove_action *ra, *tmp;
>> +
>> +	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
>> +		ra->remove(xe, ra->data);
>> +		list_del(&ra->node);
>> +		kfree(ra);
>> +	}
>> +
>> +	xe->probing = false;
>> +}
>> +
>> +/**
>> + * xe_device_add_action_or_reset - Add an action to run on driver removal
>> + * @xe: xe device instance
>> + * @ra: pointer to the object embedded into the object to cleanup
>> + * @remove: function to execute. The @ra is passed as argument
>> + *
>> + * Example:
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static void foo_remove(struct xe_device_remove_action *ra)
>> + *	{
>> + *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
>> + *		...
>> + *	}
>> + *
>> + *	int xe_foo_init(struct xe_foo *foo)
>> + *	{
>> + *		...
>> + *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
>> + *		...
>> + *		return 0;
>> + *	};
>
>I still believe we should add here a note here to highlight this is the
>exception and that devm should be preferred. But up to you, the
>explanation in the commit message makes more sense now and the patch
>is right. I hope we can get some devm solution to handle this component

arrgh, sorry. I was too entertained with the devm solution that I forgot
the update in this doc that you requested in previous version. My bad.

The devm part is here:
https://lore.kernel.org/dri-devel/20250212200542.515493-1-lucas.demarchi@intel.com/

In the end I could simplify it much more than I thought and what is
required on devres side is just one patch, 2 lines diff. Hopefully I
didn't simplify it too much. Let's see. If that one is accepted through
intel-xe tree, then we may even drop this first patch and go straight
with that solution.

Lucas De Marchi

>case. But let's move on:
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I will wait some feedback on that other series to see how we are going
to proceed. If we keep this patch, then I will update this doc.

thanks
Lucas De Marchi

>
>> + */
>> +int xe_device_add_action_or_reset(struct xe_device *xe,
>> +				  xe_device_remove_action_t action,
>> +				  void *data)
>> +{
>> +	struct xe_device_remove_action *ra;
>> +
>> +	drm_WARN_ON(&xe->drm, !xe->probing);
>> +
>> +	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
>> +	if (!ra) {
>> +		action(xe, data);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&ra->node);
>> +	ra->remove = action;
>> +	ra->data = data;
>> +	list_add(&ra->node, &xe->remove_action_list);
>> +
>> +	return 0;
>> +}
>> +
>>  static void xe_device_remove_display(struct xe_device *xe)
>>  {
>>  	xe_display_unregister(xe);
>> @@ -932,6 +1009,8 @@ void xe_device_remove(struct xe_device *xe)
>>
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_remove(gt);
>> +
>> +	xe_device_call_remove_actions(xe);
>>  }
>>
>>  void xe_device_shutdown(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 0bc3bc8e68030..a6fedf1ef3c7b 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -45,6 +45,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  				   const struct pci_device_id *ent);
>>  int xe_device_probe_early(struct xe_device *xe);
>>  int xe_device_probe(struct xe_device *xe);
>> +int xe_device_add_action_or_reset(struct xe_device *xe,
>> +				  xe_device_remove_action_t action,
>> +				  void *data);
>> +void xe_device_call_remove_actions(struct xe_device *xe);
>>  void xe_device_remove(struct xe_device *xe);
>>  void xe_device_shutdown(struct xe_device *xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 833c29fed3a37..b322d49c83c77 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -35,6 +35,7 @@
>>  #include "intel_display_device.h"
>>  #endif
>>
>> +struct xe_device;
>>  struct xe_ggtt;
>>  struct xe_pat_ops;
>>  struct xe_pxp;
>> @@ -70,6 +71,8 @@ struct xe_pxp;
>>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>>  		 struct xe_tile * : (tile__)->xe)
>>
>> +typedef void (*xe_device_remove_action_t)(struct xe_device *xe, void *data);
>> +
>>  /**
>>   * struct xe_vram_region - memory region structure
>>   * This is used to describe a memory region in xe
>> @@ -428,6 +431,20 @@ struct xe_device {
>>  	/** @tiles: device tiles */
>>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>>
>> +	/**
>> +	 * @remove_action_list: list of actions to execute on device remove.
>> +	 * Use xe_device_add_remove_action() for that. Actions can only be added
>> +	 * during probe and are executed during the call from PCI subsystem to
>> +	 * remove the driver from the device.
>> +	 */
>> +	struct list_head remove_action_list;
>> +
>> +	/**
>> +	 * @probing: cover the section in which @remove_action_list can be used
>> +	 * to post cleaning actions
>> +	 */
>> +	bool probing;
>> +
>>  	/**
>>  	 * @mem_access: keep track of memory access in the device, possibly
>>  	 * triggering additional actions when they occur.
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 6a8e82aff3853..70b697fde5b96 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -905,8 +905,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		return err;
>>
>>  	err = xe_device_probe(xe);
>> -	if (err)
>> +	if (err) {
>> +		xe_device_call_remove_actions(xe);
>>  		return err;
>> +	}
>>
>>  	err = xe_pm_init(xe);
>>  	if (err)
>> --
>> 2.48.1
>>
