Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0360AECE590
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 00:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03E810E338;
	Tue, 10 Sep 2024 00:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTJCM5Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5514C10E375
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 00:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725926962; x=1757462962;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6z7b9EMXg5TUnypWgHWPWOdcL9/Qdt7We0ee4y5KHOk=;
 b=RTJCM5Cx81VRy5le7OKyQQ7KfaKhZWphhkh0F4KKDQB7fX2LwgXCqs1m
 Giz+Ft6xBi00rYyURbRQh5t+qeuZpd0e3AlRTaN1tnCM77HQLf3ULa4ac
 I7t2Vhr1O71LZwb/KArlP+ma0TqcygQXGn+38lRU++qQ21dhxgFxqQOpC
 GF4anrYDp0uBury5Lqa4Qv8GaTJIxeiAmAhzojhdFghjxmExPf0jahslP
 LxIdqsmKpenV7q9QsiJWgAcftiY7OsqUd/+L3BHgaZu/YUqzqZiCD40MN
 YZux2n3UMxCcp5kCoh8PhQtrlmSzPAYDqLv7IatG7kt5/RqF77MCGZ6Ry w==;
X-CSE-ConnectionGUID: Rs8mjnGqRQWNsL27Hfc6Mg==
X-CSE-MsgGUID: PIru37EgQyCQDUfsdUkaTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24796324"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24796324"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 17:09:21 -0700
X-CSE-ConnectionGUID: pubWgwcaQtW+NCXR3t9ftg==
X-CSE-MsgGUID: PeSQ9txxRPubcBeIHrRAuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67581187"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 17:09:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 17:09:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 17:09:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 17:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQvCcayf8jQdVR6D/z1+TAFQMMnxVyKG7Piue/IDXDmU/71BXBusy5vATeMGwwmxbJYrzvgza7+xRX1Yt2PWCr6OtHwn/NKszei3saImE3km0SUZGeKs5jkAA94TgXKLnF69zGxOLkvuuGgK6ETS6AYuclKzllkIje6ZrrqFEnyd0mbX7nd8LZc6gtI2wmeZUQBlG0Tvwmzo73SBi0dihU+wFgUm9c+RepmMWSJ/CIYzDEIeN8s/klfa1K+NyfmA1Py80c7gGoDNyjSOl3ZihHwjZaItfTxYa+GYRvWIg35pbxIYfDlMTx54OwTtmWJXwt6+TOpxalcdazs+KcVzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3kKzHGdkZ2uHeXzcaSm6A0UbfjcK1PFyxy7kM1FR5Q=;
 b=Yctizbj7puAmpDy/kvA9JED7bkTZyvS3upcz/dvZHG+7xbnquAwWNCpR9N7JEFjVUUeDof/dvgduI5TIw/tI+56LQ8iqgYLzYPvnTk9wKGk5XAO1xtr/Fx6SecXUJHSDPtpsodofv3ji7x1eEXi3XAJ5CYdCHAG1qFLgusHHJ+Wt5YoAckyItwZK/Zwn6PxyIAo/iGt0WFWoIT05GYhvi15yRNBPIFZxF6EIPazyOxtIIem8imSSsLHHGulYdL1hfbqiHA2MVQtV7Bjo6JIYDeDpb+N47k7uy4wKAGIU6O6+vflZ/Qq6+sjFTwzKu535zDELzOxnoDcYCFYJvw4VZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.28; Tue, 10 Sep 2024 00:09:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 00:09:17 +0000
Date: Mon, 9 Sep 2024 17:09:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Message-ID: <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
 <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bba1265-1fd9-4d39-bf47-08dcd12ccfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mXQI2pew9MKlZ3ut36nOlyMEkah/QHLojowfIlNpDy0W3htUrvbbTFR+Z8?=
 =?iso-8859-1?Q?H1HkyGlnTF3yEyzkzyQes2pINnvCPDSi5+ovQuFyPU9zlnIJGaqk9eNIqy?=
 =?iso-8859-1?Q?d76/djMmuV7j62jX8eaRVfdcHLS13+MXqTOuQBwFvBr2iFmo5M9N32uDvj?=
 =?iso-8859-1?Q?pQOJ9cItfMcGWzV6qyRbNGl8yKWucPeUNKVaMRYrFWDTucSeAAUd2+9xZz?=
 =?iso-8859-1?Q?TNizP/ENlXKeJfEoJPfu4eVHECy4deq3bWXyX8gSwQL9cC6PxznS9LphbR?=
 =?iso-8859-1?Q?UBka13H3oMpw5zkST8y38TFvTwBDO7MSTUXCkNc+h8+TkJPtRJX3OH2teD?=
 =?iso-8859-1?Q?uHagqU497q2YaiWaKY2Dm+VyCOSVbdQd7b7SEg0y1jvGwVRfhLYV+aHbP4?=
 =?iso-8859-1?Q?3DcIMIzNI3igtXH7PSJ3iBtoV+aI5nXFBBVmTC2g525iVFoNW+tuuoineM?=
 =?iso-8859-1?Q?4gNPnyDaHJjDisnlQSU3x92VxNDfuKpA5U4ArukfECIBntbGDK60rcXJD1?=
 =?iso-8859-1?Q?9aPZRbzm+Cb3NSE7BAWykhvkp33Nq3orJXqdAVszfXU6uobCqIVhYTic53?=
 =?iso-8859-1?Q?4tIPY7iS8HOOejfD4sAl/adleK1oO3FSoSPpgBN+F9aemw6brcagURMFs9?=
 =?iso-8859-1?Q?LoxPOJFAe/ei8Plz4M6zlXJPKzllTYKHv4qKagViuMd0ZNB2RcdFVkPNGT?=
 =?iso-8859-1?Q?pro2uPlLPJkr4Xv/1xdpo8x7Qnl21cCtw2IULwjsVXb7Zf4dZF2+FJJU7Q?=
 =?iso-8859-1?Q?mZIok2FkbwZRsyb+mhzAUa8eI2PiNE6ft1FxHpNGUuEXV9tiWpYc+w5kjF?=
 =?iso-8859-1?Q?2Wioq7YuqMJ0xdYKjrW6JaXkBIlwTuQXCaSbB3fX/h3mn6qtUFSF7+yLYi?=
 =?iso-8859-1?Q?RkFFJu8HAf2v6WpQOVHRfM0SZ4R3MAK+rpS3/119lmfhtz63YuQvHw2BhJ?=
 =?iso-8859-1?Q?oHNzlS77MCSmfnHVfH1IJTGTXYczjHgMczWLz4cQUgQErkDAorUUbUtePv?=
 =?iso-8859-1?Q?xioajDN3ALmumMZtI6lN5/nM+q7bMNElXg9AVZMwA7qo0tZca5gkCPBbht?=
 =?iso-8859-1?Q?p6hM6i1mRDkB8qpQ1rhbhl5r2S39aT2UwGnJr+h29LXkQsWb1ipdOu7YeL?=
 =?iso-8859-1?Q?ntyNuzhQeZTcSorQYix9ScMSX40aGs/Vl03XMc1VmW3EogT+GqiwYYm0Ua?=
 =?iso-8859-1?Q?BsA9bjF9Q4KYYDU5MpdIYeqR46F3X8iTrqqM5YyYz64P+5zFQMWZmt3D5X?=
 =?iso-8859-1?Q?HwmSmvlbnF0aKBIgz+q4Ixc1BAI2a9D6vnJMkg4mwZl+xMKZ8Z3Jj3hKny?=
 =?iso-8859-1?Q?wIy6FPPGKREvitjSv22A+24UtIBXHrR5EPEuiUC4zE7Sf2dbcajvBuRFQu?=
 =?iso-8859-1?Q?oFNzq+iiE0cVTva2GFyQAA4bvei23rOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hHj8rt2ydsNtroj7bRKyqv+fVFDh4iXUZYSz/fVnoRZ8XoJGmncSe5FyR6?=
 =?iso-8859-1?Q?62MQ/jt6bJCN9iP7tQ31k/ZxjXyBB1AeHXCqp/XxQPAk/JUw3rpTWXX+be?=
 =?iso-8859-1?Q?FnAnIEW6c4p8X+Xip0Uj5bSL/sysb7DBuNCOh4Hi+8iDtKinCHuTxE/yus?=
 =?iso-8859-1?Q?9dVyaFQ0KeUNde6VhKxjdMktMP/ZhW/StC/zdddnf6AQDjd351iFZwQoAf?=
 =?iso-8859-1?Q?veRtnAL+RdnutXoadNvfiLMiaLrx/QEmsQMoQ+qtlCw+6pmkx9Vz/CpVoK?=
 =?iso-8859-1?Q?BGyo0v9yXHo19as0lWLFNPEBQDjqyGN2d1inSuSMZlexy487xLZHFTSfyw?=
 =?iso-8859-1?Q?ejH0ySMQUVYh6xVIDS6fuR2MiW1xm7ysokaVtg+/CjbwtcF8k8gJcpWq7I?=
 =?iso-8859-1?Q?ZGX1mxcxwIno+jDilN60tNfo9GVf4NoFn0IjgJvct+K97UGsVUpKbHQ/Dm?=
 =?iso-8859-1?Q?Y9mQikM/khmjT1FjHfr/Exe3pmJoqaUS5L+DcjoLG4KWHMs5YxDlj9xpRE?=
 =?iso-8859-1?Q?LeDe2+PCxOwTsoCYRXQtoDX0q2x3mYArUh46LuWaqU1pPcgFZ0ls+wpr4g?=
 =?iso-8859-1?Q?7sKcH6H/QLofjqfx1K15pZfeRLKDayh3XJxSEq34gsU6/n1mrHbpl1EbQI?=
 =?iso-8859-1?Q?WYFutYtnzl8R1pr1E1ZZRHC5rXjW523Xf3XFAid7GLBW4dI9Aohhm3NaoH?=
 =?iso-8859-1?Q?d4xUDs9phpafokz8FjsU2DKM/Ie7tM32kMExNltDeoz9OWQAzf0Z/LxWcp?=
 =?iso-8859-1?Q?YtGb38dnStjM+bHHmvRPM4BH1GJFoKTPlZu0cFsokwtoDtUb9Ad2NcM33J?=
 =?iso-8859-1?Q?i9m+g+9GqHCmv2MQgCAFgaHgBE+HjRLsHm0NFgUgtf1RxEEFa0oGCTfPmn?=
 =?iso-8859-1?Q?hZnyruMHYzs0t6Q5J39Wxbu1b41xWsHJvU9KVI0/4OyOIebxHsQ9Mo5vPS?=
 =?iso-8859-1?Q?+ttxMSGLNjj19kO5wsRXA+0povftdpm7gzKM4+w2Y9SfUUvuopm5TtN96I?=
 =?iso-8859-1?Q?IhJ30janXYfoQeSBUvV7r5zmdregrOa8Fu2StEzX4SOtD89PIey/hQsvix?=
 =?iso-8859-1?Q?07FB+75jWCcUC9qQLfl62WIr7jyOAeZFunU4clk/Nr2SlitHFlg7iMTAMj?=
 =?iso-8859-1?Q?XB72Im/HYS7TJP4RfivLRbT3tolmuP65taICQPmo2Da8dmhBxgxAThgboG?=
 =?iso-8859-1?Q?uYvNPfvB29W8dif8FJvMkqNRcmAIpbiU4XvWEBL6xsxvmWA+L1Ch989+uW?=
 =?iso-8859-1?Q?lv3y5fl70Xt6K5WWGz6b8A8EOIgJqz+APlXSf77HKcUtzLHdabcAgw76rY?=
 =?iso-8859-1?Q?SKOaRuT9BRtpgRe+iP0Z2jNXlazw+wyCzOGSTqgNS6dp/lm57ogM0vrzb2?=
 =?iso-8859-1?Q?+KOhxeIs4Po3AHPkNSoOcQZQ94vtBXEVcpfQFV4u5KRFoDiW3+zGdPnDOk?=
 =?iso-8859-1?Q?X0qJCmmYpmzQzTmg03AS0LtI32KnW8BeZ4evzM12BmB3R+jaz9jl+ouihK?=
 =?iso-8859-1?Q?kTqLiL/75w3mRUpd/JtyBoQv39y07Viw8VPZ26TkEJB9iDFUwOjJHS1+U4?=
 =?iso-8859-1?Q?4jRT9zo/thDkQqiF02qiLShhcB4aC5xSVaX3Wo67oMjlj16Pzt/K0wD/aD?=
 =?iso-8859-1?Q?qxuBKgmadW3X8S6SWj5YgYT2XBAUTjS+MoXVEhqRiGHBv4rnV5mb2vAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bba1265-1fd9-4d39-bf47-08dcd12ccfb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:09:17.7045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDsXL/EFKQcZn+yuPVCzu2K9U4lp0vVCeNmCdKgKMQk09GDM2dY3D0k1K4NIWSXDvirBNqrXv6BXGXy5ADXr4SEL/RjJIkYCuuo3tB141Rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On Mon, Sep 09, 2024 at 12:36:40AM -0700, Harish Chegondi wrote:
> A new hardware feature first introduced in PVC gives capability to
> periodically sample EU stall state and record counts for different stall
> reasons, on a per IP basis, aggregate across all EUs in a subslice and
> record the samples in a buffer in each subslice. Eventually, the aggregated
> data is written out to a buffer in the memory. This feature is also
> supported in XE2 architecture GPUs - LNL and BMG.
> 
> Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
> from the user space to do initial setup and obtain a file descriptor for
> the EU stall counter data stream.  Input parameter to the IOCTL is a struct
> drm_xe_observation_param in which observation_type should be set to
> DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
> DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
> drm_xe_ext_set_property structures in which each structure has a pair of
> property and value. The EU stall sampling input properties are defined in
> drm_xe_eu_stall_property_id enum.
> 
> With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
> can enable and disable EU stall sampling with the IOCTLs:
> DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
> User space can find the EU stall data record size with the IOCTL
> DRM_XE_OBSERVATION_IOCTL_INFO through struct drm_xe_eu_stall_stream_info
> parameter. User space can also call poll() to check for availability of
> data. The data can be read with read(). If the user space doesn't read
> the EU stall data fast enough, it is possible that the EU stall data buffer
> can get filled up and if the hardware wants to write more data, it
> simply drops data due to unavailable buffer space. In that case hardware
> sets a bit in a register. The driver read() returns -EIO error to let
> the user space know that the hardware has dropped data. A subsequent
> read by the user space returns the remaining EU stall data.
> 
> v3: a. Removed data header.
>     b. Changed read() to return -EIO when data is dropped by the HW.
>     c. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query data record info
>     d. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
>        to xe_drm.h. These declarations would help user space to parse the
>        EU stall data
>     e. Addressed other review comments from v2
> v2: Rename xe perf layer as xe observation layer (Ashutosh)
> 
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

A couple general comments, then more inline below.

 - I may have missed it, but I don't see anything that prevents this
   functionality from being invoked on platforms that don't support it
   (e.g., pre-PVC hardware).  Presumably there should be a feature flag
   or IP version check somewhere to block this.

 - This is kind of a megapatch.  It might be best to split this up a
   bit.  E.g., an initial patch that implements the basic interface
   and such, but just stubs out the parts that actually go touch
   hardware.  Going back to my first comment above, with just the first
   patch landed you'd effectively treat every platform as a platform
   that didn't support EU stall sampling.  Then the follow-up patch(es)
   you can add the hardware implementation for PVC/Xe2.

 - I know Intel has changed terminology several times over the years,
   which makes our driver codebase a confusing mix, but for new features
   like this (and also for the EU debugger stuff that other people are
   working on), it might be best to just use the term "XeCore" instead
   of the older terms "subslice" and "DSS" for naming local variables
   and functions.  Since "XeCore" seems to be the preferred term these
   days, we may go back and rename other parts of the driver at some
   point too, but for brand-new files like this one it's probably not
   worth starting out with already-obsolete terminology.

 - Do we truly need all of the API extension properties defined here?  I
   commented farther down, but some of them (like the buffer size) seem
   pretty pointless...there doesn't seem to be a good justification for
   just not using the largest size always.  If we're just exposing stuff
   because the hardware has a knob, then that's needlessly complicating
   the API; part of the reason we have uapi extensions is so that we can
   add extra things later only if/when we decide we actually have a real
   use for them.  On the flip side, some of the stuff like GT ID seems
   like it shouldn't be an extension; that feels like it should be an
   intrinsic part of the API and it shouldn't even be possible to open
   an EU stall stream without specifying which GT you're working with.


I didn't go through the entire patch in detail, but more comments inline below.

> ---
>  drivers/gpu/drm/xe/Makefile                |    1 +
>  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
>  drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1000 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eustall_cntr.h       |   60 ++
>  drivers/gpu/drm/xe/xe_gt.c                 |    6 +
>  drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
>  drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
>  drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
>  drivers/gpu/drm/xe/xe_observation.c        |   14 +
>  drivers/gpu/drm/xe/xe_trace.h              |   35 +
>  include/uapi/drm/xe_drm.h                  |  134 +++
>  11 files changed, 1298 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index edfd812e0f41..9c5325796bd7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>  	xe_device_sysfs.o \
>  	xe_dma_buf.o \
>  	xe_drm_client.o \
> +	xe_eustall_cntr.o \
>  	xe_exec.o \
>  	xe_execlist.o \
>  	xe_exec_queue.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> new file mode 100644
> index 000000000000..c70f35f82cc5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_EU_STALL_REGS_H_
> +#define _XE_EU_STALL_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +#define XEHPC_EUSTALL_BASE			XE_REG_MCR(0xe520)
> +#define   XEHPC_EUSTALL_BASE_BUF_ADDR		REG_GENMASK(31, 6)
> +#define   XEHPC_EUSTALL_BASE_DSS_BUF_SZ		REG_GENMASK(5, 3)
> +#define   XEHPC_EUSTALL_BASE_ENABLE_SAMPLING	REG_BIT(1)
> +#define   XEHPC_EUSTALL_BASE_EVICT_TDL_STALL_BUF	REG_BIT(0)
> +
> +#define XEHPC_EUSTALL_BASE_UPPER		XE_REG_MCR(0xe524)
> +
> +#define XEHPC_EUSTALL_REPORT			XE_REG_MCR(0xe528)
> +#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK	REG_GENMASK(15, 2)
> +#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT	2

Do we need a "_SHIFT" macro like this?  Generally we can use the field
get/prep macros to handle shifting (and get extra compile-time sanity
checking in some cases too).

> +#define   XEHPC_EUSTALL_REPORT_OVERFLOW_DROP	REG_BIT(1)
> +
> +#define XEHPC_EUSTALL_REPORT1			XE_REG_MCR(0xe52c)

This is a masked register, but we're missing the flag.

> +#define   XEHPC_EUSTALL_REPORT1_MASK_SHIFT	16

As above, we probably don't want to be open-coding our shifts (or our
masks).  There's helpers like _MASKED_FIELD() for generating the proper
value for masked registers (with extra checking for mistakes).

> +#define   XEHPC_EUSTALL_REPORT1_READ_PTR_MASK	REG_GENMASK(15, 2)
> +#define   XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT	2
> +
> +#define XEHPC_EUSTALL_CTRL			XE_REG_MCR(0xe53c)
> +#define   EUSTALL_MOCS				REG_GENMASK(9, 3)
> +#define   EUSTALL_SAMPLE_RATE			REG_GENMASK(2, 0)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_eustall_cntr.c b/drivers/gpu/drm/xe/xe_eustall_cntr.c
> new file mode 100644
> index 000000000000..d8546fef8dd6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eustall_cntr.c
> @@ -0,0 +1,1000 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/nospec.h>
> +#include <linux/poll.h>
> +#include <drm/drm_drv.h>
> +#include "xe_gt.h"
> +#include "xe_bo.h"
> +#include "xe_pm.h"
> +#include "xe_trace.h"
> +#include "xe_device.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_topology.h"
> +#include "xe_eustall_cntr.h"
> +#include "regs/xe_gt_regs.h"

Aren't you missing an include of the EU stall register header you added
above?

> +
> +#define DEFAULT_POLL_FREQUENCY_HZ 100
> +#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> +#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> +			     __stringify(x), (long)(x))

We probably shouldn't be using a non-device-specific WARN.  drm_WARN or
gt_WARN would be preferred since they'd let us know which device or GT
actually triggered the warning.

Also, it looks like this is only used in a single place so it might not
even be worth using a macro.  You can just implement the warning
directly at the single callsite.

> +
> +extern u32 xe_observation_paranoid;

If this is meant to be used directly like this, then shouldn't we be
getting the extern declaration from xe_observation.h instead of placing
it here?

> +
> +/**
> + * struct eu_stall_open_properties
> + *
> + * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
> + * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
> + * @eu_stall_buf_sz: Per subslice EU stall data buffer size.
> + * @open_disabled: Should EU stall sampling be disabled at open.
> + * @poll_period: The period in nanoseconds at which the CPU will check for
> + *		 EU stall data in the buffer.
> + * @gt_id: GT ID of the GT on which EU stall data will be captured.
> + */
> +struct eu_stall_open_properties {
> +	u8 eu_stall_sampling_rate;
> +	u32 event_report_count;
> +	u32 eu_stall_buf_sz;
> +	bool open_disabled;
> +	u64 poll_period;
> +	u8 gt_id;

Nitpick, but the current ordering of these fields isn't very good for
packing the structure...

> +};
> +
> +/**
> + * num_data_rows - Return the number of EU stall data rows of 64B each
> + *		   for a given data size.
> + *
> + * @data_size: EU stall data size
> + */
> +static inline u32
> +num_data_rows(u32 data_size)
> +{
> +	return (data_size >> 6);
> +}
> +
> +int xe_eustall_cntr_init(struct xe_gt *gt)
> +{
> +	gt->eu_stall_cntr = kzalloc(sizeof(*gt->eu_stall_cntr), GFP_KERNEL);
> +	if (!gt->eu_stall_cntr)
> +		return -ENOMEM;
> +
> +	mutex_init(&gt->eu_stall_cntr->lock);

Should there be a corresponding mutex_destroy() in the fini routine to
help catch accidental use-after-free?

> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_buffer_size(struct xe_device *xe, u64 value,
> +					 struct eu_stall_open_properties *props)
> +{
> +	if (value != SZ_128K &&
> +	    value != SZ_256K &&
> +	    value != SZ_512K) {
> +		drm_dbg(&xe->drm, "Invalid EU stall buffer size %llu\n", value);
> +		return -EINVAL;
> +	}
> +	props->eu_stall_buf_sz = value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> +					   struct eu_stall_open_properties *props)
> +{
> +	if (value == 0 || value > 7) {
> +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> +		return -EINVAL;
> +	}
> +	props->eu_stall_sampling_rate = value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_poll_period(struct xe_device *xe, u64 value,
> +					 struct eu_stall_open_properties *props)
> +{
> +	if (value < 100000 /* 100us */) {
> +		drm_dbg(&xe->drm, "EU stall data poll period %lluns less than 100us\n", value);
> +		return -EINVAL;
> +	}
> +	props->poll_period = value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
> +						struct eu_stall_open_properties *props)
> +{
> +	if (value == 0) {
> +		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
> +		return -EINVAL;
> +	}
> +	props->event_report_count = (u32)value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> +				   struct eu_stall_open_properties *props)
> +{
> +	if (value >= XE_MAX_GT_PER_TILE) {

I'm not sure what the goal of this check is.  If you want to make sure
it's a valid GT, then comparing against a compile-time constant doesn't
really help since what really matters is the runtime error check we do
on the return from xe_device_get_gt().

On the other hand, if we have platforms at some point with more tiles
than 2, then this will artificially prevent you from doing EU stall
sampling on the third tile and beyond.  Same if we have a multi-tile
platform with multiple GTs per tile.

> +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> +		return -EINVAL;
> +	}
> +	props->gt_id = (u8)value;
> +	return 0;
> +}
> +
> +static int set_prop_eu_stall_open_disabled(struct xe_device *xe, u64 value,
> +					   struct eu_stall_open_properties *props)
> +{
> +	props->open_disabled = value;
> +	return 0;
> +}
> +
> +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> +					struct eu_stall_open_properties *props);
> +
> +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> +	[DRM_XE_EU_STALL_PROP_BUF_SZ] = set_prop_eu_stall_buffer_size,
> +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> +	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
> +	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
> +	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
> +	[DRM_XE_EU_STALL_PROP_OPEN_DISABLED] = set_prop_eu_stall_open_disabled,
> +};
> +
> +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> +					     struct eu_stall_open_properties *props)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> +	    XE_IOCTL_DBG(xe, ext.pad))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
> +	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
> +}
> +
> +typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
> +					     struct eu_stall_open_properties *props);
> +static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
> +	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
> +};
> +
> +static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> +				       struct eu_stall_open_properties *props)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
> +	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
> +
> +	return 0;
> +}
> +
> +/**
> + * buf_data_size - Calculate the number of bytes in a circular buffer
> + *		   of size buf_size given the read and write pointers
> + *		   into the buffer.
> + *
> + * @read_ptr: Read pointer. Uses an additional overflow bit
> + * @write_ptr: Write pointer. Uses an additional overflow bit
> + *
> + * Returns: number of bytes of data in the buffer
> + */
> +static u32
> +buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> +{
> +	u32 read_offset, write_offset, size = 0;
> +
> +	read_offset = read_ptr & (buf_size - 1);
> +	write_offset = write_ptr & (buf_size - 1);
> +
> +	if (write_offset > read_offset)
> +		size = write_offset - read_offset;
> +	else
> +		size = buf_size - read_offset + write_offset;
> +
> +	return size;
> +}
> +
> +/**
> + * eu_stall_cntr_buf_check - check for data in the EU stall counter buffer
> + *
> + * @stream: xe EU stall data stream instance
> + *
> + * Returns: true if the EU stall buffer contains minimum stall data as
> + *	    specified by the event report count, else false.
> + */
> +static bool
> +eu_stall_cntr_buf_check(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> +	u32 buf_size = stream->per_dss_buf_size;
> +	struct xe_gt *gt = stream->gt;
> +	struct per_dss_buf *dss_buf;
> +	bool min_data_present;
> +	u16 group, instance;
> +	unsigned int dss;
> +
> +	min_data_present = false;
> +	for_each_dss_steering(dss, gt, group, instance) {
> +		dss_buf = &stream->dss_buf[dss];
> +		mutex_lock(&dss_buf->lock);
> +		read_ptr = dss_buf->read;
> +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> +						       group, instance);
> +		write_ptr = write_ptr_reg & XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK;
> +		write_ptr <<= (6 - XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT);
> +		write_ptr &= ((buf_size << 1) - 1);
> +		if ((write_ptr != read_ptr) && !min_data_present) {
> +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> +			/*
> +			 * Check if there are at least minimum number of stall data
> +			 * rows for poll() to indicate that the data is present.
> +			 * Each stall data row is 64B (cacheline size).
> +			 */
> +			if (num_data_rows(total_data) >= stream->event_report_count)
> +				min_data_present = true;
> +		}
> +		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP) {
> +			spin_lock(&stream->data_drop.lock);
> +			bitmap_set(stream->data_drop.mask, dss, 1);
> +			spin_unlock(&stream->data_drop.lock);
> +		}
> +		dss_buf->write = write_ptr;
> +		mutex_unlock(&dss_buf->lock);
> +	}
> +	return min_data_present;
> +}
> +
> +static void
> +clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> +{
> +	enum xe_platform platform;
> +	u32 write_ptr_reg;
> +
> +	platform = gt_to_xe(gt)->info.platform;
> +
> +	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
> +	 * On other GPUs, the bit has to be cleared by writing 0 to it.
> +	 */
> +	if (platform == XE_PVC)

We shouldn't really be doing platform checks in code like this.  A
graphics version check would be better:

        if (GRAPHICS_VER(xe) >= 20)
                ...w0c...
        else
                ...w1c...

> +		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> +	else
> +		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> +
> +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_REPORT.__reg).addr,
> +			write_ptr_reg, sizeof(write_ptr_reg));

Why are we doing manual traces here?  The xe_mmio_*() functions invoked
by xe_gt_mcr_unicast_write() should already be showing up in the trace
log, right?  Same question for the rest of the trace calls farther down
this patch.

> +}
> +
> +static int
> +__xe_eu_stall_buf_read(struct xe_eu_stall_cntr_stream *stream,
> +		       char __user *buf, size_t count,
> +		       size_t *total_size, struct xe_gt *gt,
> +		       u16 group, u16 instance, unsigned int dss)
> +{
> +	u32 read_ptr_reg, read_ptr, write_ptr;
> +	u8 *dss_start_vaddr, *read_vaddr;
> +	u32 read_offset, write_offset;
> +	struct per_dss_buf *dss_buf;
> +	size_t size, buf_size;
> +
> +	/* Hardware increments the read and write pointers such that they can
> +	 * overflow into one additional bit. For example, a 256KB size buffer
> +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> +	 * write pointers. This technique avoids wasting a slot in the buffer.
> +	 * Read and write offsets are calculated from the pointers in order to
> +	 * check if the write pointer has wrapped around the array.
> +	 */
> +	dss_buf = &stream->dss_buf[dss];
> +	mutex_lock(&dss_buf->lock);
> +	dss_start_vaddr = dss_buf->vaddr;
> +	read_ptr = dss_buf->read;
> +	write_ptr = dss_buf->write;
> +	buf_size = stream->per_dss_buf_size;
> +	read_offset = read_ptr & (buf_size - 1);
> +	write_offset = write_ptr & (buf_size - 1);
> +
> +	trace_xe_eu_stall_cntr_read(group, instance, read_ptr, write_ptr,
> +				    read_offset, write_offset, *total_size);
> +	if (write_ptr == read_ptr) {
> +		mutex_unlock(&dss_buf->lock);
> +		return 0;
> +	}
> +
> +	/* If write pointer offset is less than the read pointer offset,
> +	 * it means, write pointer has wrapped around the array.
> +	 */
> +	if (write_offset > read_offset)
> +		size = write_offset - read_offset;
> +	else
> +		size = buf_size - read_offset + write_offset;
> +
> +	/* Read only the data that the user space buffer can accommodate */
> +	if ((*total_size + size) > count) {
> +		mutex_unlock(&dss_buf->lock);
> +		return 0;
> +	}
> +
> +	read_vaddr = dss_start_vaddr + read_offset;
> +
> +	if (write_offset > read_offset) {
> +		if (copy_to_user((buf + *total_size), read_vaddr, size)) {
> +			mutex_unlock(&dss_buf->lock);
> +			return -EFAULT;
> +		}
> +	} else {
> +		if (copy_to_user((buf + *total_size), read_vaddr, (buf_size - read_offset))) {
> +			mutex_unlock(&dss_buf->lock);
> +			return -EFAULT;
> +		}
> +		if (copy_to_user((buf + *total_size), dss_start_vaddr, write_offset)) {
> +			mutex_unlock(&dss_buf->lock);
> +			return -EFAULT;
> +		}
> +	}
> +
> +	*total_size += size;
> +	read_ptr += size;
> +
> +	/* Read pointer can overflow into one additional bit */
> +	read_ptr &= ((buf_size << 1) - 1);
> +	read_ptr_reg = ((read_ptr >> 6) << XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
> +	read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> +	read_ptr_reg |= (XEHPC_EUSTALL_REPORT1_READ_PTR_MASK <<
> +			 XEHPC_EUSTALL_REPORT1_MASK_SHIFT);
> +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_REPORT1.__reg).addr,
> +			read_ptr_reg, sizeof(read_ptr_reg));
> +	if (test_bit(dss, stream->data_drop.mask)) {
> +		clear_dropped_eviction_line_bit(gt, group, instance);
> +		spin_lock(&stream->data_drop.lock);
> +		bitmap_clear(stream->data_drop.mask, dss, 1);
> +		spin_unlock(&stream->data_drop.lock);
> +	}
> +	dss_buf->read = read_ptr;
> +	mutex_unlock(&dss_buf->lock);
> +	trace_xe_eu_stall_cntr_read(group, instance, read_ptr, write_ptr,
> +				    read_offset, write_offset, *total_size);

We do this same trace twice in the function (both before and after we
modify some of the values like read_ptr).  Was that intentional?

> +	return 0;
> +}
> +
> +/**
> + * xe_eu_stall_buf_read_locked - copy EU stall counters data from the
> + *				   per dss buffers to the userspace buffer
> + * @stream: A stream opened for EU stall count metrics
> + * @buf: destination buffer given by userspace
> + * @count: the number of bytes userspace wants to read
> + * @ppos: (inout) file seek position (unused)
> + *
> + * Returns: Number of bytes copied or a negative error code
> + * If we've successfully copied any data then reporting that takes
> + * precedence over any internal error status, so the data isn't lost.
> + */
> +static ssize_t
> +xe_eu_stall_buf_read_locked(struct xe_eu_stall_cntr_stream *stream,
> +			    struct file *file, char __user *buf,
> +			    size_t count, loff_t *ppos)
> +{
> +	struct xe_gt *gt = stream->gt;
> +	size_t total_size = 0;
> +	u16 group, instance;
> +	unsigned int dss;
> +	int ret = 0;
> +
> +	if (count == 0)
> +		return -EINVAL;
> +
> +	for_each_dss_steering(dss, gt, group, instance) {
> +		ret = __xe_eu_stall_buf_read(stream, buf, count, &total_size,
> +					     gt, group, instance, dss);
> +		if (ret || count == total_size)
> +			goto exit;
> +	}
> +exit:
> +	if (total_size)
> +		return total_size;
> +	else if (ret)
> +		return ret;
> +	else
> +		return -EAGAIN;
> +}
> +
> +static void
> +free_eu_stall_cntr_buf(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	if (stream->bo) {
> +		xe_bo_unpin_map_no_vm(stream->bo);
> +		stream->vaddr = NULL;
> +		stream->bo = NULL;
> +	}
> +	destroy_workqueue(stream->buf_check_wq);
> +}
> +
> +static int alloc_eu_stall_cntr_buf(struct xe_eu_stall_cntr_stream *stream,
> +				   u32 per_dss_buf_size, u16 num_dss)
> +{
> +	struct xe_tile *tile = stream->gt->tile;
> +	struct xe_bo *bo;
> +	u32 size;
> +
> +	size = per_dss_buf_size * num_dss;
> +
> +	bo = xe_bo_create_pin_map(tile->xe, tile, NULL,
> +				  size, ttm_bo_type_kernel,
> +				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				  XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	stream->bo = bo;
> +	stream->vaddr = bo->vmap.is_iomem ? bo->vmap.vaddr_iomem : bo->vmap.vaddr;

Aren't we losing the important details of the iosys_map here?  And then
potentially doing non-IO operations on an IO pointer later?  It seems
like we should be storing the iosys_map in the stream and then using the
appropriate functions on it elsewhere.

> +
> +	return 0;
> +}
> +
> +static u32
> +gen_eustall_base(struct xe_eu_stall_cntr_stream *stream, bool enable)
> +{
> +	u32 val = xe_bo_ggtt_addr(stream->bo);
> +	u32 sz;
> +
> +	XE_WARN_ON(!IS_ALIGNED(val, 64));
> +
> +	switch (stream->per_dss_buf_size) {
> +	case SZ_128K:
> +		sz = 0;
> +		break;
> +	case SZ_256K:
> +		sz = 1;
> +		break;
> +	case SZ_512K:
> +		sz = 2;
> +		break;
> +	default:
> +		MISSING_CASE(stream->per_dss_buf_size);
> +		sz = 2;
> +	}
> +
> +	val |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_DSS_BUF_SZ, sz);
> +	if (enable)
> +		val |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> +
> +	return val;
> +}
> +
> +static void
> +xe_eu_stall_stream_enable(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	struct xe_gt *gt = stream->gt;
> +	enum xe_platform platform;
> +	u32 reg_value;
> +
> +	platform = gt_to_xe(gt)->info.platform;
> +
> +	/* Take runtime pm ref and forcewake to disable RC6 */
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));

Do we really need XE_FORCEWAKE_ALL?  Are we doing anything outside the
render domain that requires waking all the other domains?

> +
> +	/*
> +	 * Wa_22016596838:pvc
> +	 * Disable EU DOP gating for PVC.
> +	 */
> +	if (platform == XE_PVC)

This should be an OOB workaround, not a platform check.

> +		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> +					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
> +
> +	reg_value = gen_eustall_base(stream, true);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
> +			reg_value, sizeof(reg_value));
> +}
> +
> +static void
> +xe_eu_stall_stream_disable(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	struct xe_gt *gt = stream->gt;
> +	enum xe_platform platform;
> +	u16 group, instance;
> +	unsigned int dss;
> +	u32 reg_value;
> +
> +	platform = gt_to_xe(gt)->info.platform;
> +
> +	/*
> +	 * Before disabling EU stall sampling, check if any of the
> +	 * XEHPC_EUSTALL_REPORT registers have the drop bit set. If set,
> +	 * clear the bit. If the user space application reads all the
> +	 * stall data, the drop bit would be cleared during the read.
> +	 * But if there is any unread data and the drop bit is set for
> +	 * any subslice, the drop bit would continue to be set even
> +	 * after disabling EU stall sampling and may cause erroneous
> +	 * stall data in the subsequent stall data sampling run.
> +	 */
> +	for_each_dss_steering(dss, gt, group, instance) {
> +		reg_value = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> +						   group, instance);
> +		if (reg_value & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
> +			clear_dropped_eviction_line_bit(gt, group, instance);
> +	}
> +	reg_value = gen_eustall_base(stream, false);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
> +			reg_value, sizeof(reg_value));
> +
> +	/* Wa_22016596838:pvc */
> +	if (platform == XE_PVC)
> +		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> +					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +}
> +
> +static void eu_stall_buf_check_work_fn(struct work_struct *work)
> +{
> +	struct xe_eu_stall_cntr_stream *stream =
> +		container_of(work, typeof(*stream), buf_check_work);
> +
> +	if (eu_stall_cntr_buf_check(stream)) {
> +		stream->pollin = true;
> +		wake_up(&stream->poll_wq);
> +	}
> +}
> +
> +static enum
> +hrtimer_restart eu_stall_poll_check_timer_cb(struct hrtimer *hrtimer)
> +{
> +	struct xe_eu_stall_cntr_stream *stream =
> +		container_of(hrtimer, typeof(*stream), poll_check_timer);
> +
> +	queue_work(stream->buf_check_wq, &stream->buf_check_work);
> +	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period));
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static int xe_eu_stall_stream_init(struct xe_eu_stall_cntr_stream *stream,
> +				   struct eu_stall_open_properties *props,
> +				   u16 num_dss)
> +{
> +	u32 write_ptr_reg, write_ptr, read_ptr_reg;
> +	u32 vaddr_offset, reg_value;
> +	struct xe_gt *gt = stream->gt;
> +	struct per_dss_buf *dss_buf;
> +	u16 group, instance;
> +	int ret, dss;
> +
> +	init_waitqueue_head(&stream->poll_wq);
> +	INIT_WORK(&stream->buf_check_work, eu_stall_buf_check_work_fn);
> +	stream->buf_check_wq = alloc_ordered_workqueue("xe_eustall_cntr", 0);
> +	if (!stream->buf_check_wq)
> +		return -ENOMEM;
> +	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	stream->poll_check_timer.function = eu_stall_poll_check_timer_cb;
> +	stream->event_report_count = props->event_report_count;
> +	stream->per_dss_buf_size = props->eu_stall_buf_sz;
> +	stream->poll_period = props->poll_period;
> +
> +	ret = alloc_eu_stall_cntr_buf(stream, props->eu_stall_buf_sz, num_dss);
> +	if (ret)
> +		return ret;
> +
> +	stream->dss_buf = kcalloc(num_dss, sizeof(*stream->dss_buf), GFP_KERNEL);
> +	if (!stream->dss_buf)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&stream->data_drop.lock);
> +	stream->data_drop.reported_to_user = false;
> +	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +	reg_value = gen_eustall_base(stream, false);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
> +			reg_value, sizeof(reg_value));
> +	/* GGTT addresses can never be > 32 bits */
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
> +	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
> +				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
> +				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
> +						 props->eu_stall_sampling_rate));
> +	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, reg_value);
> +	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_CTRL.__reg).addr,
> +			reg_value, sizeof(reg_value));
> +
> +	for_each_dss_steering(dss, gt, group, instance) {
> +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> +						       group, instance);
> +		write_ptr = write_ptr_reg & XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK;
> +		write_ptr <<= (6 - XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT);
> +		write_ptr &= ((stream->per_dss_buf_size << 1) - 1);
> +		read_ptr_reg = write_ptr >> (6 - XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
> +		read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
> +		read_ptr_reg |= (XEHPC_EUSTALL_REPORT1_READ_PTR_MASK <<
> +				 XEHPC_EUSTALL_REPORT1_MASK_SHIFT);
> +		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1,
> +					read_ptr_reg, group, instance);
> +		dss_buf = &stream->dss_buf[dss];
> +		vaddr_offset = dss * props->eu_stall_buf_sz;
> +		dss_buf->vaddr = stream->vaddr + vaddr_offset;
> +		dss_buf->write = write_ptr;
> +		dss_buf->read = write_ptr;
> +		mutex_init(&dss_buf->lock);
> +	}
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +	return 0;
> +}
> +
> +/**
> + * xe_eu_stall_buf_read - handles read FOP for xe EU stall cntr stream FDs
> + * @file: An xe EU stall cntr stream file
> + * @buf: destination buffer given by userspace
> + * @count: the number of bytes userspace wants to read
> + * @ppos: (inout) file seek position (unused)
> + *
> + * Returns: The number of bytes copied or a negative error code on failure.
> + */
> +static ssize_t xe_eu_stall_buf_read(struct file *file, char __user *buf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +	ssize_t ret;
> +
> +	if (!stream->enabled) {
> +		drm_dbg(&gt->tile->xe->drm, "EU stall data stream not enabled to read\n");

Here and elsewhere throughout this patch, it would be much better to use
xe_gt_dbg() and such so that we have more useful log output that
identifies which GT the messages came from.

> +		return -EINVAL;
> +	}
> +
> +	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> +		if (!stream->data_drop.reported_to_user) {
> +			stream->data_drop.reported_to_user = true;
> +			drm_dbg(&gt->tile->xe->drm, "EU stall data drop reported\n");
> +			return -EIO;
> +		}
> +		stream->data_drop.reported_to_user = false;
> +	}
> +
> +	if (!(file->f_flags & O_NONBLOCK)) {
> +		do {
> +			if (!stream->pollin) {
> +				ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> +				if (ret)
> +					return -EINTR;
> +			}
> +
> +			mutex_lock(&gt->eu_stall_cntr->lock);
> +			ret = xe_eu_stall_buf_read_locked(stream, file, buf, count, ppos);
> +			mutex_unlock(&gt->eu_stall_cntr->lock);
> +		} while (ret == -EAGAIN);
> +	} else {
> +		mutex_lock(&gt->eu_stall_cntr->lock);
> +		ret = xe_eu_stall_buf_read_locked(stream, file, buf, count, ppos);
> +		mutex_unlock(&gt->eu_stall_cntr->lock);
> +	}
> +
> +	stream->pollin = false;
> +
> +	return ret;
> +}
> +
> +static __poll_t
> +xe_eu_stall_buf_poll_locked(struct xe_eu_stall_cntr_stream *stream,
> +			    struct file *file, poll_table *wait)
> +{
> +	__poll_t events = 0;
> +
> +	poll_wait(file, &stream->poll_wq, wait);
> +
> +	if (stream->pollin)
> +		events |= EPOLLIN;
> +
> +	return events;
> +}
> +
> +static __poll_t
> +xe_eu_stall_buf_poll(struct file *file, poll_table *wait)
> +{
> +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +	__poll_t ret;
> +
> +	mutex_lock(&gt->eu_stall_cntr->lock);
> +	ret = xe_eu_stall_buf_poll_locked(stream, file, wait);
> +	mutex_unlock(&gt->eu_stall_cntr->lock);
> +
> +	return ret;
> +}
> +
> +static void
> +xe_eu_stall_cntr_enable_locked(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	if (stream->enabled)
> +		return;
> +
> +	stream->enabled = true;
> +
> +	xe_eu_stall_stream_enable(stream);
> +	hrtimer_start(&stream->poll_check_timer,
> +		      ns_to_ktime(stream->poll_period),
> +		      HRTIMER_MODE_REL);
> +}
> +
> +static void
> +xe_eu_stall_cntr_disable_locked(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	if (!stream->enabled)
> +		return;
> +
> +	stream->enabled = false;
> +
> +	hrtimer_cancel(&stream->poll_check_timer);
> +	flush_workqueue(stream->buf_check_wq);
> +	xe_eu_stall_stream_disable(stream);
> +}
> +
> +static long
> +xe_eu_stall_cntr_info_locked(struct xe_eu_stall_cntr_stream *stream,
> +			     unsigned long arg)
> +{
> +	struct drm_xe_eu_stall_stream_info info = { .record_size = 0, };
> +	void __user *uaddr = (void __user *)arg;
> +	struct xe_gt *gt = stream->gt;
> +	enum xe_platform platform;
> +
> +	platform = gt_to_xe(gt)->info.platform;
> +
> +	if (platform == XE_PVC)
> +		info.record_size = sizeof(struct drm_xe_eu_stall_data_pvc);
> +	else if ((platform == XE_LUNARLAKE) || (platform == XE_BATTLEMAGE))
> +		info.record_size = sizeof(struct drm_xe_eu_stall_data_xe2);
> +
> +	if (copy_to_user(uaddr, &info, sizeof(info)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static long
> +xe_eu_stall_cntr_ioctl_locked(struct xe_eu_stall_cntr_stream *stream,
> +			      unsigned int cmd, unsigned long arg)
> +{
> +	switch (cmd) {
> +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> +		xe_eu_stall_cntr_enable_locked(stream);
> +		return 0;
> +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> +		xe_eu_stall_cntr_disable_locked(stream);
> +		return 0;
> +	case DRM_XE_OBSERVATION_IOCTL_INFO:
> +		return xe_eu_stall_cntr_info_locked(stream, arg);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * xe_eu_stall_cntr_ioctl - support ioctl() usage with xe EU stall counter
> + *								stream FDs
> + * @file: An xe EU stall cntr stream file
> + * @cmd: the ioctl request
> + * @arg: the ioctl data
> + *
> + * Implementation deferred to xe_eu_stall_cntr_ioctl_locked().
> + *
> + * Returns: zero on success or a negative error code. Returns -EINVAL for
> + * an unknown ioctl request.
> + */
> +static long xe_eu_stall_cntr_ioctl(struct file *file,
> +				   unsigned int cmd,
> +				   unsigned long arg)
> +{
> +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +	long ret;
> +
> +	mutex_lock(&gt->eu_stall_cntr->lock);
> +	ret = xe_eu_stall_cntr_ioctl_locked(stream, cmd, arg);
> +	mutex_unlock(&gt->eu_stall_cntr->lock);
> +
> +	return ret;
> +}
> +
> +static void
> +xe_eu_stall_destroy_locked(struct xe_eu_stall_cntr_stream *stream)
> +{
> +	xe_eu_stall_cntr_disable_locked(stream);
> +	free_eu_stall_cntr_buf(stream);
> +}
> +
> +/**
> + * xe_eu_stall_release - handles userspace close() of a EU stall data
> + *			   stream file.
> + * @inode: anonymous inode associated with file
> + * @file: An xe EU stall stream file
> + *
> + * Cleans up any resources associated with an open EU stall data stream file.
> + */
> +static int xe_eu_stall_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_eu_stall_cntr_stream *stream = file->private_data;
> +	struct xe_gt *gt = stream->gt;
> +
> +	mutex_lock(&gt->eu_stall_cntr->lock);
> +	xe_eu_stall_destroy_locked(stream);
> +	kfree(stream->dss_buf);
> +	kfree(stream);
> +	gt->eu_stall_cntr->stream = NULL;
> +	mutex_unlock(&gt->eu_stall_cntr->lock);
> +
> +	/* Release the reference the EU stall stream kept on the driver */
> +	drm_dev_put(&gt->tile->xe->drm);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations fops_eu_stall = {
> +	.owner		= THIS_MODULE,
> +	.llseek		= no_llseek,
> +	.release	= xe_eu_stall_release,
> +	.poll		= xe_eu_stall_buf_poll,
> +	.read		= xe_eu_stall_buf_read,
> +	.unlocked_ioctl = xe_eu_stall_cntr_ioctl,
> +	.compat_ioctl   = xe_eu_stall_cntr_ioctl,
> +};
> +
> +/**
> + * xe_open_eu_stall_stream_locked - Open a EU stall data stream FD.
> + * @dev: drm device instance
> + * @props: individually validated u64 property value pairs
> + * @file: drm file
> + * @gt: GT from which the EU stall data will be captured
> + *
> + * Returns: zero on success or a negative error code.
> + */
> +static int
> +xe_open_eu_stall_stream_locked(struct drm_device *dev,
> +			       struct eu_stall_open_properties *props,
> +			       struct drm_file *file,
> +			       struct xe_gt *gt)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_eu_stall_cntr_stream *stream;
> +	unsigned long f_flags = 0;
> +	xe_dss_mask_t all_dss;
> +	int ret, stream_fd;
> +	u32 tile_buf_size;
> +	u16 num_dss;
> +
> +	if (xe_observation_paranoid && !perfmon_capable()) {
> +		drm_dbg(&xe->drm, "Insufficient privileges for EU stall monitoring\n");
> +		return -EACCES;
> +	}
> +
> +	/* Only one session can be active at any time */
> +	if (gt->eu_stall_cntr->stream) {
> +		drm_dbg(&xe->drm, "EU stall cntr session already active\n");
> +		return -EBUSY;
> +	}
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +	/*
> +	 * Enabled subslices can be discontiguous. Find the last subslice
> +	 * and calculate total buffer size based on that.
> +	 * intel_sseu_highest_xehp_dss returns zero based position.

What is intel_sseu_highest_xehp_dss?  That sounds like an i915 function
name, but this is Xe (and no such function exists in i915 either).

> +	 * Therefore the result is incremented.
> +	 */
> +	num_dss = xe_dss_mask_last_dss(all_dss) + 1;
> +	tile_buf_size = props->eu_stall_buf_sz * num_dss;
> +	if (props->event_report_count > num_data_rows(tile_buf_size)) {
> +		drm_dbg(&xe->drm, "Invalid EU stall data poll event report count %u\n",
> +			props->event_report_count);
> +		drm_dbg(&xe->drm, "Maximum event report count for the given buffer size is %u\n",
> +			num_data_rows(tile_buf_size));
> +		return -EINVAL;
> +	}
> +
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +	if (!stream)
> +		return -ENOMEM;
> +
> +	gt->eu_stall_cntr->stream = stream;
> +	stream->gt = gt;
> +
> +	ret = xe_eu_stall_stream_init(stream, props, num_dss);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "EU stall stream init failed : %d\n", ret);
> +		goto err_alloc;
> +	}
> +
> +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> +				     stream, f_flags);
> +	if (stream_fd < 0) {
> +		ret = stream_fd;
> +		drm_dbg(&xe->drm, "EU stall inode get fd failed : %d\n", ret);
> +		goto err_open;
> +	}
> +
> +	if (!props->open_disabled)
> +		xe_eu_stall_cntr_enable_locked(stream);
> +
> +	/* Take a reference on the driver that will be kept with stream_fd
> +	 * until its release.
> +	 */
> +	drm_dev_get(&gt->tile->xe->drm);
> +
> +	return stream_fd;
> +
> +err_open:
> +	free_eu_stall_cntr_buf(stream);
> +err_alloc:
> +	gt->eu_stall_cntr->stream = NULL;
> +	kfree(stream->dss_buf);
> +	kfree(stream);
> +	return ret;
> +}
> +
> +int xe_open_eu_stall_stream(struct drm_device *dev,
> +			    u64 data,
> +			    struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct eu_stall_open_properties props;
> +	struct xe_gt *gt;
> +	int ret;
> +
> +	memset(&props, 0, sizeof(struct eu_stall_open_properties));
> +
> +	/* Set default values */
> +	props.gt_id = 0;
> +	props.eu_stall_buf_sz = SZ_256K;
> +	props.eu_stall_sampling_rate = 4;
> +	props.poll_period = DEFAULT_POLL_PERIOD_NS;
> +	props.event_report_count = 1;
> +
> +	ret = xe_eu_stall_user_extensions(xe, data, &props);
> +	if (ret)
> +		return ret;
> +
> +	gt = xe_device_get_gt(xe, props.gt_id);
> +	if (!gt) {
> +		drm_dbg(&xe->drm, "Invalid GT for EU stall sampling\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&gt->eu_stall_cntr->lock);
> +	ret = xe_open_eu_stall_stream_locked(dev, &props, file, gt);
> +	mutex_unlock(&gt->eu_stall_cntr->lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_eustall_cntr.h b/drivers/gpu/drm/xe/xe_eustall_cntr.h
> new file mode 100644
> index 000000000000..417c38838432
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eustall_cntr.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __XE_EUSTALL_CNTR_H__
> +#define __XE_EUSTALL_CNTR_H__
> +
> +#include <drm/xe_drm.h>
> +#include <drm/drm_file.h>
> +#include "xe_gt_types.h"
> +#include "regs/xe_eu_stall_regs.h"
> +
> +struct per_dss_buf {
> +	u8 *vaddr;
> +	u32 write;
> +	u32 read;
> +	/* lock to protect read and write pointers */
> +	struct mutex lock;
> +};
> +
> +/**
> + * struct xe_eu_stall_cntr_stream - state of EU stall counter stream FD
> + */
> +struct xe_eu_stall_cntr_stream {
> +	u8 *vaddr;
> +	bool pollin;
> +	bool enabled;
> +	u64 poll_period;
> +	u32 event_report_count;
> +	size_t per_dss_buf_size;
> +	wait_queue_head_t poll_wq;
> +
> +	struct xe_gt *gt;
> +	struct xe_bo *bo;
> +	struct per_dss_buf *dss_buf;
> +	struct {
> +		bool reported_to_user;
> +		xe_dss_mask_t mask;
> +		/* lock to protect mask */
> +		spinlock_t lock;
> +	} data_drop;
> +	struct hrtimer poll_check_timer;
> +	struct work_struct buf_check_work;
> +	struct workqueue_struct *buf_check_wq;
> +};
> +
> +struct xe_eu_stall_cntr_gt {
> +	/* Lock to protect stream */
> +	struct mutex lock;
> +
> +	/* Execution Unit (EU) stall counter stream */
> +	struct xe_eu_stall_cntr_stream *stream;
> +};
> +
> +int xe_eustall_cntr_init(struct xe_gt *gt);
> +int xe_open_eu_stall_stream(struct drm_device *dev,
> +			    u64 data,
> +			    struct drm_file *file);
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index f0dc2bf24c7b..0f661ebe9403 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -59,6 +59,7 @@
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> +#include "xe_eustall_cntr.h"
>  
>  static void gt_fini(struct drm_device *drm, void *arg)
>  {
> @@ -158,6 +159,7 @@ void xe_gt_remove(struct xe_gt *gt)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  
>  	xe_gt_disable_host_l2_vram(gt);
> +	kfree(gt->eu_stall_cntr);
>  }
>  
>  static void gt_reset_worker(struct work_struct *w);
> @@ -620,6 +622,10 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  	xe_gt_record_user_engines(gt);
>  
> +	err = xe_eustall_cntr_init(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 0662f71c6ede..031782247723 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -264,6 +264,15 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
>  	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
>  }
>  
> +/*
> + * Used to obtain the index of the last DSS.
> + */
> +unsigned int
> +xe_dss_mask_last_dss(const xe_dss_mask_t mask)
> +{
> +	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
> +}
> +
>  bool xe_dss_mask_empty(const xe_dss_mask_t mask)
>  {
>  	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index 746b325bbf6e..7ee022784397 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -28,6 +28,9 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  unsigned int
>  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>  
> +unsigned int
> +xe_dss_mask_last_dss(const xe_dss_mask_t mask);
> +
>  bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>  
>  bool
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 3d1c51de0268..a8eb312c28fd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -428,6 +428,9 @@ struct xe_gt {
>  
>  	/** @oa: oa observation subsystem per gt info */
>  	struct xe_oa_gt oa;
> +
> +	/** @eu_stall_cntr: EU stall counters subsystem per gt info */
> +	struct xe_eu_stall_cntr_gt *eu_stall_cntr;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 8ec1b84cbb9e..b1942bc72ae0 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -8,6 +8,7 @@
>  
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_eustall_cntr.h"
>  #include "xe_oa.h"
>  #include "xe_observation.h"
>  
> @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
>  	}
>  }
>  
> +static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> +			     struct drm_file *file)
> +{
> +	switch (arg->observation_op) {
> +	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> +		return xe_open_eu_stall_stream(dev, arg->param, file);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  /**
>   * xe_observation_ioctl - The top level observation layer ioctl
>   * @dev: @drm_device
> @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>  	switch (arg->observation_type) {
>  	case DRM_XE_OBSERVATION_TYPE_OA:
>  		return xe_oa_ioctl(dev, arg, file);
> +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> +		return xe_eu_stall_ioctl(dev, arg, file);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 8573d7a87d84..dfb1eb121337 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -421,6 +421,41 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
>  	     TP_ARGS(xe, caller)
>  );
>  
> +TRACE_EVENT(xe_eu_stall_cntr_read,
> +	    TP_PROTO(u8 slice, u8 subslice,
> +		     u32 read_ptr, u32 write_ptr,
> +		     u32 read_offset, u32 write_offset,
> +		     size_t total_size),
> +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> +		    read_offset, write_offset, total_size),
> +
> +	    TP_STRUCT__entry(
> +			     __field(u8, slice)
> +			     __field(u8, subslice)
> +			     __field(u32, read_ptr)
> +			     __field(u32, write_ptr)
> +			     __field(u32, read_offset)
> +			     __field(u32, write_offset)
> +			     __field(size_t, total_size)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __entry->slice = slice;
> +			   __entry->subslice = subslice;
> +			   __entry->read_ptr = read_ptr;
> +			   __entry->write_ptr = write_ptr;
> +			   __entry->read_offset = read_offset;
> +			   __entry->write_offset = write_offset;
> +			   __entry->total_size = total_size;
> +			   ),
> +
> +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> +		      __entry->slice, __entry->subslice,
> +		      __entry->read_ptr, __entry->write_ptr,
> +		      __entry->read_offset, __entry->write_offset,
> +		      __entry->total_size)
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..c836227d064f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1395,6 +1395,8 @@ struct drm_xe_wait_user_fence {
>  enum drm_xe_observation_type {
>  	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
>  	DRM_XE_OBSERVATION_TYPE_OA,
> +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
>  };
>  
>  /**
> @@ -1694,6 +1696,138 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +/**
> + * enum drm_xe_eu_stall_property_id - EU stall data stream property ids.
> + *
> + * These properties are passed to the driver as a chain of
> + * @drm_xe_ext_set_property structures with @property set to these
> + * properties' enums and @value set to the corresponding values of these
> + * properties. @drm_xe_user_extension base.name should be set to
> + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> + */
> +enum drm_xe_eu_stall_property_id {
> +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_BUF_SZ: Per DSS Memory Buffer Size.
> +	 * Valid values are 128 KB, 256 KB, and 512 KB.
> +	 */
> +	DRM_XE_EU_STALL_PROP_BUF_SZ = 1,

Does userspace really care about this being configurable?  Even if we
have a platform with XE_MAX_DSS_FUSE_BITS total XeCores, the difference
between the largest and smallest sizes here only saves 48MB of memory.
The hardware makes this configurable, but is there actually an ask to
expose this through the uapi?  If not, I'd say we should just always
pick 512KB internally and keep things simple.

> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> +	 * If the value is 1, sampling interval is 251 cycles.
> +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> +	 */
> +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
> +	 * poll period in nanoseconds. should be at least 100000 ns.
> +	 */
> +	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> +	 * EU stall data rows to be present in the kernel buffer for
> +	 * poll() to set POLLIN (data present).
> +	 */
> +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> +	 * EU stall data will be captured.
> +	 */
> +	DRM_XE_EU_STALL_PROP_GT_ID,

I mentioned above, but it feels like this should be an intrinsic part of
the API, not something coming in through an optional extension...

> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_OPEN_DISABLED: A value of 1 will open
> +	 * the EU stall data stream without enabling EU stall sampling.
> +	 */
> +	DRM_XE_EU_STALL_PROP_OPEN_DISABLED,

Is there a reason not to make this one the default behavior?  Is there
really a benefit to auto-enabling on open that makes it worth the extra
API complexity to make this configurable?

> +};
> +
> +/**
> + * struct drm_xe_eu_stall_stream_info - EU stall stream info returned from
> + * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
> + */
> +struct drm_xe_eu_stall_stream_info {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @record_size: size of each EU stall data record */
> +	__u64 record_size;
> +
> +	/** @reserved: reserved for future use */
> +	__u64 reserved[3];
> +};
> +
> +/**
> + * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC

I thought there was an ask from one of the userspace teams that we make
the layout discoverable?  I.e., a runtime-queryable format description
that lists the counter type, size, and offset in the record of each
counter that has usable data in the records?  Did we change directions
on that?


Matt

> + *
> + * Bits		Field
> + * 0  to 28	IP (addr)
> + * 29 to 36	active count
> + * 37 to 44	other count
> + * 45 to 52	control count
> + * 53 to 60	pipestall count
> + * 61 to 68	send count
> + * 69 to 76	dist_acc count
> + * 77 to 84	sbid count
> + * 85 to 92	sync count
> + * 93 to 100	inst_fetch count
> + */
> +struct drm_xe_eu_stall_data_pvc {
> +	__u64 ip_addr:29;
> +	__u64 active_count:8;
> +	__u64 other_count:8;
> +	__u64 control_count:8;
> +	__u64 pipestall_count:8;
> +	__u64 send_count:8;
> +	__u64 dist_acc_count:8;
> +	__u64 sbid_count:8;
> +	__u64 sync_count:8;
> +	__u64 inst_fetch_count:8;
> +	__u64 unused_bits:27;
> +	__u64 unused[6];
> +} __attribute__((packed));
> +
> +/**
> + * struct drm_xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> + *
> + * Bits		Field
> + * 0  to 28	IP (addr)
> + * 29 to 36	Tdr count
> + * 37 to 44	other count
> + * 45 to 52	control count
> + * 53 to 60	pipestall count
> + * 61 to 68	send count
> + * 69 to 76	dist_acc count
> + * 77 to 84	sbid count
> + * 85 to 92	sync count
> + * 93 to 100	inst_fetch count
> + * 101 to 108	Active count
> + * 109 to 111	Exid
> + * 112		EndFlag (is always 1)
> + */
> +struct drm_xe_eu_stall_data_xe2 {
> +	__u64 ip_addr:29;
> +	__u64 tdr_count:8;
> +	__u64 other_count:8;
> +	__u64 control_count:8;
> +	__u64 pipestall_count:8;
> +	__u64 send_count:8;
> +	__u64 dist_acc_count:8;
> +	__u64 sbid_count:8;
> +	__u64 sync_count:8;
> +	__u64 inst_fetch_count:8;
> +	__u64 active_count:8;
> +	__u64 ex_id:3;
> +	__u64 end_flag:1;
> +	__u64 unused_bits:15;
> +	__u64 unused[6];
> +} __attribute__((packed));
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.45.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
