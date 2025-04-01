Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5721FC3601A
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F192A10E661;
	Tue,  1 Apr 2025 19:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BD/wnqC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12DB10E661
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743535320; x=1775071320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QOPwm5/GwaUA9DeNeVekCx+rfyCO8/5TQ7ToiDQb0sg=;
 b=BD/wnqC2vCmWwxpi+3uqZR5h3T0t3WNlz/iAoIM8za/SC7QHK2Fqtq2z
 3U1gA3FnHcomiU1dyuQE4hP68gYebQFJ2yCmciHZ+moxL8SQut3FSsKLb
 0fVCYV+7NX6DVgXhnNV2jKXxx106rlSg1UtWPrXiVXHTS5OU8bQA0c5cz
 LHamEDi0mWPzqCrZIJWpOO3sgnv09YtSm0H7M4q40ipxdociIifESueAx
 OoEvL1W2ForkEPy7TlxyVer6wWniOVYj8qH7nuNabAOYrnCC5n0e7VNuC
 ovMeSFYnNPeYEnR61owsj5k+phiekXhbaPgWZxsGA7RTNmkwyEd/iOUjY g==;
X-CSE-ConnectionGUID: aUg/zoj4QNemPZYnZDQCgw==
X-CSE-MsgGUID: 3Gg0RgtgRt6l94fa5hYX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44769926"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44769926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:21:59 -0700
X-CSE-ConnectionGUID: vymLsVoISfy+a/l4d5ml8Q==
X-CSE-MsgGUID: zkvfmQIEQw68rFvGqzlJiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131342439"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 12:22:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 12:21:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 12:21:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 12:21:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaSHycizYPak9ylZVPulWTWcf8vOzpWocV7djToyQM7mdGA4GtFGN/XzYp4+zGvAG0AwaRTktXT9B296f76JKWR0dRCuv4meVWBAtEsjL9CJdYzeVreEV1zxQpqui8DyzqZLkju+j/cmbWcgugSciax/EWc2AAFsSR2D1hdpXhSJKkWGwl821G6mdAlHnPuQJRI0zSZoj0zxn+se4RH41DfcGTghfPhzNcSJEqNgRrVPRGW9OvNKw6/iwhLBwZAy4TSRpWM21+ZCbcLcJUiC8zqDAVlK18VI9RDkxT4LQSIqMk03i2Q67DEuIZMUEmGhBb22aSW5668zgPlcVQR7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOPwm5/GwaUA9DeNeVekCx+rfyCO8/5TQ7ToiDQb0sg=;
 b=gR+47OARXfpoIV+tRqNWhWBOuzzvOd9yvoPSnYaJeHlQrHo9GwFKoMQl0dTu4g+tTxcwCbLA81AAYM560iDSupbvHQgPEWBHYN/cMPuXwT2BrPnG1kDkKPs6bL0RFojCKjDfBxRokCj/ltzAqm68byA6vseSg3j6SiKGXfzKKg3D8cRPVzSp2XFQxbZIEmvAHD1Ze7ffzrUblWCFmBl2N4V5/Pz3V+YZK/CiSnIVP7ePcMOzHOvuCYpfjR++/qZ+df2Yeut79d7+8vsPRNQsEcX28ZA5vQjT5u6j48w9/2neZ6hpa9qH7hMn1Pz2ggjO6P4Ew2AH2in6oOl0CtghBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 19:21:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 19:21:08 +0000
Date: Tue, 1 Apr 2025 14:21:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/8] drm/xe/gt: Inline gt_fw_domain_init
Message-ID: <3u3o26gsgw25poolga22ceudw7ouhqxrdmsr4mmwypsxj2p3ue@sg2oofvl4kxt>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-7-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250310200653.89731-7-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0379.namprd04.prod.outlook.com
 (2603:10b6:303:81::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 3596ab71-0c2d-4b3f-43ee-08dd71525b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jJPGtXOGl1fg3t11tuilCyQZ3wAOMDBwNP4hng8CLXyH0f1keFATOM+PKWs9?=
 =?us-ascii?Q?1z8sBel6rLFOl989XxdhXI8RJcW2pWbDle8Mq4QjurLKoFhsTschy9Z7cRIw?=
 =?us-ascii?Q?Um2cm+1WO+PyHWUI1/do4cgNRCff95mSb7qSCwyRPM67yZ8BUEJPw1uZuaaN?=
 =?us-ascii?Q?LdRRK3tk9g/lDkekvgH9R+1oWOhTlCaQBsOtuW++9zvsTrDSgj03nB1Kw0w1?=
 =?us-ascii?Q?JT4AT82tYrL2z5gJyqNuv0AsKsy4sUwgl82uFqoLH++e28bZvTkqsoAiuuCA?=
 =?us-ascii?Q?p/2QZbqshMaO2cp2SyKZNRqDB3OQnKjuFaRYgPmaTpgRlc/JzdwF6qxuH/GN?=
 =?us-ascii?Q?++0pjMR0GwMWuWK2txGb+NLaXlTcOB2a5TAqvmIz70/fA9A6KT7xr8JrR71y?=
 =?us-ascii?Q?r0vRrfOvIOjZ7DAOxE1yoWxmNtu+AoIgXKQJ/G0ZUJXAPWFUHnxNtetzqKGs?=
 =?us-ascii?Q?hjNHE8H8Maw26L9VBqGPE3xJqDYQJYIa1Y3qEFiyDsCu5cfeZvjfudiVyjjq?=
 =?us-ascii?Q?bD2pYUcnPGngRgwXZQQdavTq6iccHyBUvTjWTQW71pyahpFtM7q7m9SG4xkz?=
 =?us-ascii?Q?PSa8HA0gR/zvD7HjyjxdTeUavPxEVqpAkwfSJDDTfkPamXbBS9xymGRehMQu?=
 =?us-ascii?Q?swINFkqn+cSBQtxexJ58dAiDNHGBqPS4r5MR/cBSaSEV1aaJm4BxKQ6y5ZeQ?=
 =?us-ascii?Q?mRNLeEHv3BHOE3NB74wx9UD0tQSTkExDQAN4ZilLvuiaGW9AbWtUKS8/JOk4?=
 =?us-ascii?Q?QbjRWZMd8uHAFmpB0da5J3WNmVDyuaoEQzLHgORuUOoFp4BHsQhFpTyO4A0s?=
 =?us-ascii?Q?29Rd8HIDKOm6K5eYuhLi9Vv/9+ZhEiYzTWWOtzW/mvxFQMT9X8x0EA9jkfpo?=
 =?us-ascii?Q?eveCb5I+2gYMjQnaFx8HeryTpp50sg277ZBMrf8Vx3Tp/+8m867QFvHgPow8?=
 =?us-ascii?Q?a6RN7gLfPJq2NRlDNIG3cIBbW0OKqXkr4F5XqdBe2TpUetYRHKxSe5Nt9cdV?=
 =?us-ascii?Q?s02Tn/936ZBvImt4WNmT933ZGO9G2rwUspl/IzIaEg+A7T9RwLX1dL8qNqee?=
 =?us-ascii?Q?7gdS++nkI7b9D+CtehCv7BpH3ILYqlU95FF9URQaGOE7fLd0pk7i7PiWAmAB?=
 =?us-ascii?Q?7Nd7pC08HTjyISYZsyHkbtnzGef3/QZGjfz62SuKBnmgZ677X9WTITjsqMyJ?=
 =?us-ascii?Q?nrQCr4RPIYWd5QWk6bzix8YOPq2c1+9Or902kL2/2YnqF9czl6HvKjzdpNrP?=
 =?us-ascii?Q?kvST6q7YpTEFwqX30aUsbrsHJj4iukddybxlZD5x2e3KVeT5deebM46BW6ai?=
 =?us-ascii?Q?cfMZZeXsxsS/zUPXsuVzOAG1cclvFNaEKmpsx0p0PagMg8MDb/2KUEx8jUsT?=
 =?us-ascii?Q?X/5iVn5OKW6VSAThxm/P9R3DIcZb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+BxCS2Bm8iZeFGQmlUmRnOXpVBVOHjBvp2ETK8K/HJjYiPNnf+Y8Pv1Bt6q?=
 =?us-ascii?Q?oktmCxuFuhGnqnUY+/3MWe8bfOcpOK2Fwb3vAqXHy2vkC/RWG7Hvh1U0FKB+?=
 =?us-ascii?Q?73ZAcqrzZ0CQhurVyCh82nTvQZgIg5k+elpVEHj1jiHhwdnsGdKAMBKgDIrA?=
 =?us-ascii?Q?NL0PdiaNUuaQLwfMhheJTZ1tNZJO88xL68hp3H8opn4tTrGoPS7w6KeagaKE?=
 =?us-ascii?Q?wQLyNEb37lFlwDRYmBZU9rg0FXiw+arif+03fedScmJMbOvq2Iepc0DCmbUg?=
 =?us-ascii?Q?DugrQkVyUowU2kOsqn/7CEwhvLwstdZpMzL0UDidGXAzLN5YQtccdM0pLWVY?=
 =?us-ascii?Q?BMtaOp/TNM0kDuQdn3xdaDqPYClfSsBtvjuxfKhSFJhbIBnswsg96PWRw8rX?=
 =?us-ascii?Q?ed0oUyYi56GsjbZP9/ZGZMgrUWkjLPvfXmmAD9A+7r4FvkIzEQC6qs+v3KXd?=
 =?us-ascii?Q?ZWVshslCrb0iejHtFb+xwdhFcTWplGW84ABNbDrJebOcISXh7Wq4NgpJ2Cet?=
 =?us-ascii?Q?ui4sQUFXJkMaYtMwfQYI8NpVzyizKgMPfKl4X3jUplfEATTlVw6xUZ1wLhjs?=
 =?us-ascii?Q?vo1ntCZdkAoeCmXgkcwsKHF23ud+t4f8M/99CjQ0h0bGX8bRVXC74Qt/0UO4?=
 =?us-ascii?Q?PShadY5qku25KJ/OsanEMA7jYTY1DkKL6LGNdTXwbuhkK8sniu2aK84yIrwj?=
 =?us-ascii?Q?A5VSEzlBN1GCiApKPM4p64CYS75jvu4qWPDzLwcafm7wBlX0WUd+NQav0Hbz?=
 =?us-ascii?Q?Udt5gAeWh0ONMsocj5TDraTpxgmnDEOI0RObvtgBaZCiRG4T6OYpuE/Wc1mh?=
 =?us-ascii?Q?lYtx8wO/lj+XeI9FPTJZ0sFGfCpGLqvxJF68y7PqqunHX0R8/+kP8cVzr6Jc?=
 =?us-ascii?Q?DuJDQV4PTt+xoc/CBPpaYKyMMt4Ml//6qpHwPh4QyJNX4OtyqmETHeSWiOVu?=
 =?us-ascii?Q?jKw8HzVtJ6DojXrht3FAWlFwEE1pL0pERyEbvbocdoN6NtCTsbG+cVcEyhDL?=
 =?us-ascii?Q?k7l6sEjsyayvpmXgcgMlatRu4sZP+4DWVUxxbLy+Qa7KU4td++iIML4ggOZC?=
 =?us-ascii?Q?dbgY9R/uUc1TZ//fGTmGtTDdDbfmqrVi2zS7g/XGWnTH/r+N7qrQPqj2s0WP?=
 =?us-ascii?Q?qf8AQGkPrF1RbCnvhUv7iy1QmHZ3MSJFqOfAP++VJfq/8OOgZfBROn5sYb0R?=
 =?us-ascii?Q?gSTXCJ4uxBfipgTng4x2SFW7SuwXLY6/+tbDSU8/teG69iB9bwGSndfxqRBS?=
 =?us-ascii?Q?Wmxqo3pGPKRnS3j1KfGnDATUNpIIayuLHDyWVbILOsI6Of4YVjZ1wqZAAlM7?=
 =?us-ascii?Q?0d2D1VV7E0x6XguJsvDMYYAUcw6yjv+3lWksfPIAk23BOLu8rUURJCAduTpj?=
 =?us-ascii?Q?IUQtBiRL0TsUPTcOZSLtDIRP5Qy/c7tCLLNLw594fRJGMgFXNBffmdeclT0E?=
 =?us-ascii?Q?8Sv8gvHVFrPYx+SnXOfYBMQb57v+30AA6LwPU061BDJ1fvCRc0mPz7c6w+n1?=
 =?us-ascii?Q?2E4zQcCv8M5kYswFrFlPMCfgrCw6J2S+GnIIMc+WwDyzRl543cXXN2lkQk25?=
 =?us-ascii?Q?VrUmy37yRnlvtIwcmwtxWAk0zdk1T1Y7Gsua8PE+ATSvM8T1eACTT7nDAZ+/?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3596ab71-0c2d-4b3f-43ee-08dd71525b22
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:21:08.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nb5uYi8ttUrHqjDfAvcb37uMP7dneQrWiIhfoRvtlna6zyyoDHd9Ha3bKLc+d4w8ayDcUnwpAicVYlC7PlojJ/r7ErUIgFUdXSmmku1gozo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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

On Mon, Mar 10, 2025 at 09:06:51PM +0100, Maarten Lankhorst wrote:
>Have only a single init function for whole of GT to keep things
>readable.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
