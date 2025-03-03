Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF1C282D0
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 20:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A9810E113;
	Mon,  3 Mar 2025 20:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kL4gMKRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8583410E113
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741033630; x=1772569630;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WrtRE48eks2qvaeHcMhpOAE1KFJD+756USWax0+5AqA=;
 b=kL4gMKRqi9m6Z2cedctTXZ9H0MI64axqdJtJkgmNs2SsyZuJNNfflEBK
 +m4jDetIbEKNezVkHTyUn1N19TIb4zTSLujWI6FRKWxdSg3qPN8IaLXgS
 GOgGHj5Y6uxEhGyGy01ds6HCpOs7NyWMctXqV4GZuXeg2lIKmAZGFuqm/
 OIlQ2zTMzE1vXN6SC8BrTZYQ+uMDNzLDkwFol3aeLHmPcd6vbJnpBwu1t
 MkBjC1NOw0A3Nt/7T3IJt1qOY7ovU6W1WYfqtKNoCwGvFrW9pECY4IPLe
 8Xqg1sYcG6ACcvxXQeDSvzJp4NrtP18DGC7rIx0SaWndQPBJL7d3Mui8d g==;
X-CSE-ConnectionGUID: E0Bo/QT0TlS/JVyLkEMgUQ==
X-CSE-MsgGUID: elh7TsJMQ/OIRlZme1O3Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41171096"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41171096"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 12:27:10 -0800
X-CSE-ConnectionGUID: 70BmUsXzQw+42Ss8v8FYRA==
X-CSE-MsgGUID: A/a7Su9FQXCvs4o1zqUb/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="122778832"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 12:27:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 12:27:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 12:27:09 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 12:27:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3qNrX1HSNiCCQeRboV0JjWwo1dmBBKvy1yp0t6h6NoIvSiZqUgN7UgbVbvhp1w6bRYE5QHGoVPsjyPzLahYgVCYkUdAR6nRL/UW70LRDhi3fvM/uMrVV1yxXlTl7eMqnF0W97DlmS+KsOEXwZ3DMr1EzLY1/5I/+I6FyVwKitbA6/vqKJBsXx5Pdj2lds+eNf++FJhhc8NGTZ1nZ///3imnRiEs8V7Hh5HtCHrUN9wBTZyfq68nQOnDviXduseFv4mIxZrDhlX6Y7PSdTpJVaRKuEFtRplLRNzDPCgzdrCiXyC1r6/JT6GiRsdgQ0Y+rp2cpH37JM1A20tRZv19Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SxW8SBPsH22kmAdFLnR42ZQTvTExDPDXwdDR5fHqrQ=;
 b=gaUx2AK+ye+fH318tzYjlq94RVzAOZZtDwDp5C2jPUzJ1EZG+Pmo26kiOmbOiQW//v/hVEl2i0jGqhus6JeoUOUquosxVeHQAlK77LJra38tG9eHoaFIKaIqX/CnClpgNQIxSmSEK4vZBUtC+eq93RKwRvsP/5ioZ0z0EGf6bTCaAXoygWJTy2CfkqfxGSYFR2q3G22YGL+ZsemVbNkyepS6iu4K81wpubgx5Whi7L/eMKg6olOe5VX1QjNvoJlK+YehZpp0OzJ5eS6OCWtpm8uhhSHdaR22cJZ5Q1T60JfQDWUudTTKVg3iUZ+wnB/e/5nDTpn8Sv/MQzc1S4Htag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 20:27:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 20:27:06 +0000
Date: Mon, 3 Mar 2025 14:27:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Bhatia, Aradhya" <aradhya.bhatia@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Upadhyay, 
 Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
Message-ID: <bwdlr6jlric5j26li2qnns5uxycj7te3ohibwo2fycog77ts2q@utjbhndgrent>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
 <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
 <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:303:87::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c3fb16-13f3-48e9-34a8-08dd5a91c3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vLowh7qAMkfgATGV+1+E4Bvadn+RCIljvY7juFHOc5ipm3/C/5VkJZ8Wp7?=
 =?iso-8859-1?Q?v3qgR86Lwm58DCzUO8sSPBTTFKBlpky68JdFSVq/sVb0KPofLjzC363bpg?=
 =?iso-8859-1?Q?TTRVSI7p5bektbIGJeHEhys3O2XykF0p7OEfYdVL9wVn33eJ58Y3B8bLLn?=
 =?iso-8859-1?Q?1zsNQ38hDjc2u2TEI1FnUrpjFCpIGXNBcpPz+OleFkJZQ3BPbYgUFGsGZz?=
 =?iso-8859-1?Q?+265Jl9Wfpr0z+mejYO4hCe6F5EAYwKmBI6giOZfAY30nyaxB7iuplQHIt?=
 =?iso-8859-1?Q?JnhTW9/cgefJjyR45gOPtBc43MvoK5ro4UdEqeurn8YEzuUGU0YEGt901e?=
 =?iso-8859-1?Q?FYs9XOH1a4gZxf5B422H0XMgoVzuPUIJyIE/neUcg+xCt9NL7qPI3XsZtg?=
 =?iso-8859-1?Q?ukccO9pabPDvX3RcGHcz+2xbCuP8keDfRfEX6G1oeoghykI8QYGkwmctx9?=
 =?iso-8859-1?Q?ZaK38LAJX8hvqLUmxZ3xKBH2nNsSfkrNR5w2rdSnsGdJNwptVwuxDc398G?=
 =?iso-8859-1?Q?OxcqbOxgf2XXiZY8gasfbUZQPLvjIM+h8RQZrqdkDsPf3jROLTpDA3kUAG?=
 =?iso-8859-1?Q?lz6TPahUsCw94p1cPCAacvrENpnWwruNytG3m3+tbRWySIAVeseNWZwUrC?=
 =?iso-8859-1?Q?pZnESOOBvY9MICzi4rPBrRj1I/ezON75rAXjVyZ6CpqXvwiZnUSyeCIhOu?=
 =?iso-8859-1?Q?f5vD1I6tpviHliNRQYLQwvqJc+Sn2diJg/kGQfXry5cGFKp1c3GMLqg+uY?=
 =?iso-8859-1?Q?SKFnfsjqbCqSosB/8tAAnV9gVk6vzUTlyU2rzv/L1e5Fo7hzKhYhW3VhnY?=
 =?iso-8859-1?Q?K44bt4Ql7xXTDzJEl2hNlN++zrlcYunY59V8cZC4p4ZsSmRkGSaEnYrV98?=
 =?iso-8859-1?Q?mnFd778qkpOttOkbvXJN8lYYz7jdbIxqF1syeHbhax8WTzqWj0z0qo0h22?=
 =?iso-8859-1?Q?7p/SRYZx7oyy8UXALh1WWAegoOGzj6N4mlXY+ZiM4GpYPnFJ7UDMFj4n8g?=
 =?iso-8859-1?Q?mWAoZyhh6hTQugvvDY+pMYi2NXQARMMNlnRFAo9L3buqVMPzm60iv+VpbR?=
 =?iso-8859-1?Q?jHMdIfe7bpOQWN6aKuvS3fmlLCO2X4ibvEqNfUonN3+nAvaZ3axZKsWUVL?=
 =?iso-8859-1?Q?FfP5yTR70+Eg+DHJ0xKJheJBNMCogCgW3J0zLMliHGUv4IOXsOn/y4hbd7?=
 =?iso-8859-1?Q?boM783vcbq7NZypgfLku417y0kqHHMqhcLHZwszHF1SC/1Nt9QvjRqgbQV?=
 =?iso-8859-1?Q?nWZ4kEJuicVTluFUmJ4Kmo7c8jXkxgqGdhSeVmRa7sBV2p3VWnEypmOtA8?=
 =?iso-8859-1?Q?ZzBpsaPOxXiErwiy99kR1RhdM6oULIedb5AQ5gDPrcsjkWWXKly5nOnlkp?=
 =?iso-8859-1?Q?BVimbWDX0o2kymnssrL51h2ExRAm+3TCyIJzI0oQalPxNGWRsFvKhqeZBU?=
 =?iso-8859-1?Q?lftWhBGmBUW/t8mwRn2JYdddTzU9ej8DMoO+2crtY/rvkDVznPVkwcIFuL?=
 =?iso-8859-1?Q?Phq4/qDEe6xdrPrOLlPgC1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dQUyJfDQQ7CP/Rf5jLYGd8agLWzWZWl6FXfjOLEKGQEMyOwRn9o4kdZPx7?=
 =?iso-8859-1?Q?scI/qteUqOlIgoWqN3gHRBn/ZNiPH6WimNM/q7BaTX57GPcwxwntyAPqQw?=
 =?iso-8859-1?Q?NrT6Ifp5pxWBA6+V52WA+uP46sFwvZZ4Nryg9RfaNAvk6hhLL0n3zHsnkw?=
 =?iso-8859-1?Q?X8mhx58/BucseIVK2VQlbAUfYtor/BARmovbYm1/sdccPYrbFUi7yT7WBK?=
 =?iso-8859-1?Q?JDvy6YUceg8rSKMZVZ1LGOWPrJWPQX/4EwOLioPU1XA1wxOp82MxYiiTbw?=
 =?iso-8859-1?Q?7S8VPergXMvqR2wRGPz9zOSE1WypOwen6Sr5W9Jut3yk0ZCbD92TYkOYhI?=
 =?iso-8859-1?Q?bF95N4Oe7dwObqPbWq8so8qh7zcioXyLNxpCUEKbdunM6FTDizZxIarDff?=
 =?iso-8859-1?Q?WsJOg5vOKiOjar5kJkrZCpG8ydFnLaj48WWdkFL7xIqfdmJohKqN+782xe?=
 =?iso-8859-1?Q?fz56qXZ4+spDK80a+NDIV1v+buDzld4Rz4v3XIKENJkZRKkJAmtB4/f+Wa?=
 =?iso-8859-1?Q?yP7w67KpyAdHTGJFP9eaRZCjvz2BMU0m2mtjW00RNrSzMusCyTa9lbL1hf?=
 =?iso-8859-1?Q?4RKlPndjM87EUvbIDT8bFl2nnheaJbE6XJkAYYLpGBr4Zwre+QAqST+IfN?=
 =?iso-8859-1?Q?VyU2dfUZ0NCOxEBGIKk+RKchAk2rh7/sl9CfMyypo3hzG+/8apHge2ohjh?=
 =?iso-8859-1?Q?hfXcAmQDHQ5+vmQKw+kOcvpo1R3VHXbzxYvX7QDq6YpIvCyKUefaeRSlFl?=
 =?iso-8859-1?Q?vdth3Kvyd4gY0ks9XmqIgAMABgCxQl+WDTHHpLurfuCxcDzUi8/bowfwLH?=
 =?iso-8859-1?Q?wDLGRJgIs7f4Qgbw81R+hWli8cKHQZ2S7kWhfgv94F3qKqqE28RyUkWlZJ?=
 =?iso-8859-1?Q?Azf38X9DUaDuZ4+C2uNuhK8xMKTiVdkAfHTdMjC8FQruSlsP4RlVJWZ1kQ?=
 =?iso-8859-1?Q?p/xhz5l/bLnvzONw1UiFrxJUBGqSVXN4WZvTluikwZZ9VCVTRRFVbhuS/P?=
 =?iso-8859-1?Q?8iE5lw8NR7TCYv0d9vZS30qeMUfw1+KGiAgNBN4f6+bhOy4ubU98hufQ/m?=
 =?iso-8859-1?Q?G27quNjC+VkdH5EchnZ+uhzVLEc3E3M7/1OVjeUuHr2Zp855kkyJg1Bkar?=
 =?iso-8859-1?Q?ZmGHat9syMWuhI0H5yTHNNi6sKBnC/vOG9+nwFYhqSm7dQISrn0jm9SRRz?=
 =?iso-8859-1?Q?gxW39sHqAR9IW1rKTIY6DVhhs5thcm40DSNJZWkxHmezlquuiveEmUT0/W?=
 =?iso-8859-1?Q?hRqOCHzzMyRNljgFG/pKpL38SKPMpOH+yPwBrZTiXzvp/iui7GtKPTM9GU?=
 =?iso-8859-1?Q?mDN6s0v/8NRiAfHg/FRje5k+0dz6tvancASRwY4FjgPMOtgCWq7s+hmGe7?=
 =?iso-8859-1?Q?E3a4sWUJ+rty+LBDOOAsaiAO9dMtvFkmPhcQ0KXHHWmPfHf75Y2zjTa/C2?=
 =?iso-8859-1?Q?qqc4RJmLt6jJfyeqw7/U7VlCrRy9c0ikgSSXN+8P2O2B/EsKOA7I8APY14?=
 =?iso-8859-1?Q?lV1uiStB/yJxRA1QRqefVLgYhMTsm7zK1c3DX3if/CwwztNPP4OcZw+HdP?=
 =?iso-8859-1?Q?zAfsn9uw9Ro9PJJpgskded8ebj5ydq0dD+BIXF8PDrG9hOfvymrz+7eEBO?=
 =?iso-8859-1?Q?TXyiZjCEYYUmLw7o2mXeH52SuB2sEhaqYcLtmd12XQelqMqmV7al2ZYw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c3fb16-13f3-48e9-34a8-08dd5a91c3e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 20:27:06.2655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9QJ91HZXqvT1U2xIAuJAH5jPRSvlwKmKdJO7siGoQQ0fC9p7c/awyUGqMWRtUz7h5A2MeN+z1jG1oByJD25pVn1dvyRjj5/PTpK0+xl7LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

On Fri, Feb 28, 2025 at 11:11:59AM +0000, Thomas Hellstrom wrote:
>Hi, Matthew
>
>On Fri, 2025-02-28 at 10:21 +0000, Matthew Auld wrote:
>> On 28/02/2025 06:52, Aradhya Bhatia wrote:
>> > Change the scope of the migrate subsystem to be dev managed instead
>> > of
>> > drm managed.
>> >
>> > The parent pci struct &device, that the xe struct &drm_device is a
>> > part
>> > of, gets removed when a hot unplug is triggered, which causes the
>> > underlying iommu group to get destroyed as well.
>>
>> Nice find. But if that's the case then the migrate BO here is just
>> one
>> of many where we will see this. Basically all system memory BO can
>> suffer from this AFAICT, including userspace owned. So I think we
>> need
>> to rather solve this for all, and I don't think we can really tie the
>> lifetime of all BOs to devm, so likely need a different approach.
>>
>> I think we might instead need to teardown all dma mappings when
>> removing
>> the device, leaving the BO intact. It looks like there is already a
>> helper for this, so maybe something roughly like this:
>>
>> @@ -980,6 +980,8 @@ void xe_device_remove(struct xe_device *xe)
>>
>>          drm_dev_unplug(&xe->drm);
>>
>> +       ttm_device_clear_dma_mappings(&xe->ttm);
>> +
>>          xe_display_driver_remove(xe);
>>
>>          xe_heci_gsc_fini(xe);
>>
>> But I don't think userptr will be covered by that, just all BOs, so
>> likely need an extra step to also nuke all usersptr dma mappings
>> somewhere.
>
>I have been discussing this a bit with Aradhya, and the problem is a
>bit complex.
>
>Really if the PCI device goes away, we need to move *all* bos to
>system. That should clear out any dma mappings, since we map dma when
>moving to TT. Also VRAM bos should be moved to system which will also
>handle things like SVM migration.

if the PCI device really goes away, how are you going to move anything
without HW access? I think we just don't reproduce this issue more often
because it's not a real hotplug, but just a driver unbind. I wonder what
would happen with our current logic if the code path was actually
a hotplug and triggering this code path:

pci_stop_and_remove_bus_device() -> pci_stop_bus_device() ->
-> pci_stop_dev() -> device_release_driver()

Lucas De Marchi

>
>But that doesn't really help with pinned bos. So IMO subsystems that
>allocate pinned bos need to be devm managed, and this is a step in that
>direction. But we probably need to deal with some fallout. For example
>when we take down the vram managers using drmmm_ they'd want to call
>evict_all() and the migrate subsystem is already down.
>
>So I think a natural place to deal with such fallouts is the remove()
>callback, while subsystems with pinned bos use devm_
>
>But admittedly to me it's not really clear how to *best* handle this
>situation. I suspect if we really stress-test device unbinding on a
>running app we're going to hit a lot of problems.
>
>As for the userptrs, I just posted a series that introduces a per-
>userptr dedicated unmap function. We could probably put them on a
>device list or something similar that calls that function (or just
>general userptr invalidation) for all userptrs.
>
>/Thomas
>
>
>
>
>
>>
>> >
>> > The migrate subsystem, which handles the lifetime of the page-table
>> > tree
>> > (pt) BO, doesn't get a chance to keep the BO back during the hot
>> > unplug,
>> > as all the references to DRM haven't been put back.
>> > When all the references to DRM are indeed put back later, the
>> > migrate
>> > subsystem tries to put back the pt BO. Since the underlying iommu
>> > group
>> > has been already destroyed, a kernel NULL ptr dereference takes
>> > place
>> > while attempting to keep back the pt BO.
>> >
>> > Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>> > ---
>> >   drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>> >   1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> > b/drivers/gpu/drm/xe/xe_migrate.c
>> > index 278bc96cf593..4e23adfa208a 100644
>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> > @@ -97,7 +97,7 @@ struct xe_exec_queue
>> > *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>> >   	return tile->migrate->q;
>> >   }
>> >  
>> > -static void xe_migrate_fini(struct drm_device *dev, void *arg)
>> > +static void xe_migrate_fini(void *arg)
>> >   {
>> >   	struct xe_migrate *m = arg;
>> >  
>> > @@ -401,7 +401,7 @@ struct xe_migrate *xe_migrate_init(struct
>> > xe_tile *tile)
>> >   	struct xe_vm *vm;
>> >   	int err;
>> >  
>> > -	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
>> > +	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
>> >   	if (!m)
>> >   		return ERR_PTR(-ENOMEM);
>> >  
>> > @@ -455,7 +455,7 @@ struct xe_migrate *xe_migrate_init(struct
>> > xe_tile *tile)
>> >   	might_lock(&m->job_mutex);
>> >   	fs_reclaim_release(GFP_KERNEL);
>> >  
>> > -	err = drmm_add_action_or_reset(&xe->drm, xe_migrate_fini,
>> > m);
>> > +	err = devm_add_action_or_reset(xe->drm.dev,
>> > xe_migrate_fini, m);
>> >   	if (err)
>> >   		return ERR_PTR(err);
>> >  
>>
>
