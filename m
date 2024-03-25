Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDBBC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 15:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D647D10E977;
	Mon, 25 Mar 2024 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJwsFJiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2ED10E977
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379870; x=1742915870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yQLydscHguGaijs2rqqw15QQdYU4Lu8qSHCa2J/ADx8=;
 b=HJwsFJiwAWQsnzbhCmmdFSWE5/UXbpzaqkkcRdWIzpD0rztdfHnnmrt6
 44mMed/1f+flI1i2IhLyoEmaepAHQoPQvcN5rBbeTezhD8erqT7J52AED
 osdIq20xuo+vmre3NmjxwEf0GZsRGeN8HQsowWoNoFf0cgwn8MdQKBMIM
 C/y5PkPOGVlmiW1/qJKA51Tz0UmRxZD/daxNWPR+mH1/ILwLSrevGcF/q
 zquohEYcAjn9lpuZI8/neUOXrvQw+BuwIHm7O2O8vCOT3XJK4NftrAV9X
 ZeWq2Y9Q9U9OCQ5sfMQA8d5DBjSoonM53jp+RILcunYd2gBCWS/9bV7lz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6218563"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6218563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20111519"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 08:17:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:17:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:17:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 08:17:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 08:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/qJO8IfXOhLIysPrEUdQDDhEVgXmo/u1ZLci/Q6ZKhNDGRxZq+pIs+rdGwG/DqdzdAh0Eio2DLkWXC2aY4ypuFFAg981PeVZFDhqzYO3L06bxTncAckhn3lhs2NABC/qKc5VtQ0RbjYeYh102FMN9SlImVULjpYbvxXZHGf38/ye2e302SqW09nNBeXHlaabN2GBTF7w34FQpfKFpeVOBM5sr5UHwS0xOTXYMf+rS2u9SAgHS5UZhnrsHh4+RRUG2fRlkdWtjv2H00V2BIF1i83fo1dUwbgYpsIrfo5mEYOWCdf13k4KYZIbm2CtV5WdGFgDGnLWmEG3ViXA+DDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqQ1aeVDhJbJ0Xfn+yoILl6RqPhY2qORkLdIX23II7U=;
 b=XHajpIvZftKpDfru/mDLk2t+aSnY1XuHTGtSMZJknYdcKnGz5+tsNAwFVeITfrmzsE8rZsm2vgSdkpMEpD0uFZvkp1cCz49XHRUEdUumcwiePwj4pGjyzVy/b2So5zzmW+sNj0flMalnsS15sJfxDm4S0M1IVj2EXIdXFSPb26glplEys7pVASOdHGSjPAgd0izvVfJA0pq4dt9NQp/qdBnA7w4IFlnZKdjesCmwvEntAjrdtIX5SG6pQ1S4w86eWsboXe8C6eccbehIrFId4c/iOzOlFlw4ytegO6vi5Dw8CPpuU5P2EUdwvlgmXO2GDRQ8JoYcBXpNCEbaZx7PcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 15:17:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 15:17:45 +0000
Date: Mon, 25 Mar 2024 10:17:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [xe-for-ci] drm/xe/huc: Define LNL HuC
Message-ID: <qd7onc2xaqrboj7zw3b2mfqeliq3znorzoim54nzzuxp5v2qir@baeo55vu4w2n>
References: <20240322230040.370138-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240322230040.370138-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2d0b51-6406-42b3-6790-08dc4cdeb914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2rhonDBP7/i2Lo+wTRqDNsdPtakjljynLPjzaS79bk8rexhX2HMrpmH1ok2ZQZupilbgbVdeB6wPsKRphRBkXD8K1bzlvJSzw5ARBdzFTykHQlGCrgh5G7fThi57OQW5OKJhK/3RQuyFh1K6054A+xRDEccxL9TpuxlRA+tveReqWvFLqJdu4evY4Wp2gmoRyAUV44kAScXDEO9cpI1UGHCSGrG789DI0Sb2QFySpmMf2/KovlioslgeSlje8wSbNA/cNlD1zSc75IsQnETtAaS5fAim5M5Gz66PK8jjW/wG8GW3CvF9uhLf455aj6iAPVynggAQnOiw0IPNXOx6KcWxe8vpmwtWXTBT+VClhchTCMRVllk1jozRU7jvTJs10ZhZLNJsOdpMdlHLQNX5UeN68xy3460pV0uGML0l2ZPriQnOTe7lTmVnVhE/FtRn6CEjdxAYHvzXd1+lOGS1xL9UWPr797X44kxvXMwvalCF9urWXEKCLCdwsKx3q6bKByv5y7EWKjlnOcfwf/EyDwg1UnqOFewroeJSzhR12SvfZsMzTz7VG7tmQsZFHhJnyPqCYcWi4TUzJbTIiDyP6XIXqOkavEavBLqKU2Ky1ZfIp5Yv8c0jHAh/5vgnX45
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tPMg+HGX5tDAbxjyH9bEiDNnjz+B4+z4Kc2ujgTg7iW8Gf3jsoXVg2/Cu7PS?=
 =?us-ascii?Q?fjOBTgacFzgmoDTcOjHUsAMeuEpq4DYbDc9VmW4UtdAovNLEaQGbjZufX95V?=
 =?us-ascii?Q?rmxKDsoYUNzGSnuwK7yHMm8U3phF21mDsIN69UKCAa2OArinwnAJMTzMGLL6?=
 =?us-ascii?Q?qCvTAV/fW7wAVRhYvrGNBt0UpR16H58UYeVCPogM8MggVV4y4s7f/am0XaoI?=
 =?us-ascii?Q?c3b2djpgo1BVvkQiKmESfh8a5PpsLl1F8zIc8YO0yJC9TO03zmb8gUcH5Ken?=
 =?us-ascii?Q?Y/DTvjA8db6g/x8S9RbIVOc9VZ6+CqgIi3B3OilxnOe4tWBB6HuB8h54HDpS?=
 =?us-ascii?Q?IlKosO8a4NSg1+P2cP/e1w4wOkbdOdI5HyraXJQpk029Nm3WUMwJWDOzgYRB?=
 =?us-ascii?Q?/LIGyRuxaOHEZuxBmQR+jBdxs1UGohhhEnmz8Za01NML7kZMHSJwT7NuOGaJ?=
 =?us-ascii?Q?9TFG7NNA5xoAgUrvkHoGIpwOuiEKdKELTjNGeT95KXc2HE1RGX4dxrhGTUTP?=
 =?us-ascii?Q?A19bYP7SRzpwjijeM+mPh26AFMnomqGKJ2abahKZAPu7NB2PjGM3+2H5L0SK?=
 =?us-ascii?Q?UhWDB90xW7MDCJo33nrJ7YctZcY4Ims4JTM1siqoiYWYHdrSfPohah8vW9Zx?=
 =?us-ascii?Q?hdbKYqyZ5Ah73qKEctNbJzbU2t2e2DURrZiohI/liv+U8uri6J1UM5hFPjFD?=
 =?us-ascii?Q?y0UT0icpaMQBs0pc1+A6kbZcFfIB8+a6HSsGyON7ru0zLnApdsG4UnPYtvmr?=
 =?us-ascii?Q?hrRy/3LQW8IJ23TjRrwwBt1hVQAkxMh+BrW6oDBrbyGIS+atbh0/fsRAlWCv?=
 =?us-ascii?Q?Pk/GMsn+FCn5yue8VcZkeqWa7FLn07nf6THeLfnbcL6MuJFztOA03MzRZAU8?=
 =?us-ascii?Q?jNs9epgV93cjyyjnhiZ1JnzKt2bwDaM+nsCv3XZEAF1lcSBt7aJzS6OG7eCC?=
 =?us-ascii?Q?RjsMDW1eBUbkRQESCYBj+Z8mFSElnFT6UCxH2tJzL7kHtPIv0mhLoDrynREx?=
 =?us-ascii?Q?+KPdbSmUyzjCxlPhh5aJpL7+XIUsmCNJV6YWVyIHpJDrtfKYc4ZEOSjNPVPQ?=
 =?us-ascii?Q?qRfnQeCwXFILP4dY1oaJUirhnZWkqHFQLI1QcBaPVLLWQH3IOJTXF3IIVoEO?=
 =?us-ascii?Q?ROnoCHILD8pjiGCZG6w5UCGsggqWhu/ORXYXU2DwhqCOqC+wrtLz8QvzNNRw?=
 =?us-ascii?Q?SdqD1sR9fBHj7oN+8Lf93mSXgfLK4Cxvi8fAtjW8ED6m5oEdBM1TJwAsUq7I?=
 =?us-ascii?Q?h/b50REjBBMoRSE5GIIVNCC0GpOORyhJGhGaiiMQxDuI6zrTQVf0i0bch9oi?=
 =?us-ascii?Q?9Vfg2QM6pq2PUz0XuEVKaw8330JvvmCBmfUNJoT+ETTL70LS08/F606g77N/?=
 =?us-ascii?Q?nQiDd9I7T4NraJYigrKww+H3PHhjKTLTGR0hMnvHhc7rU1WGVhOKkaSxJO+m?=
 =?us-ascii?Q?VlA+IXSBatsPZsccxqzd4BlW8WbHcyOxBCpwQF6aryVBPjz9qEqSMmuYeJ17?=
 =?us-ascii?Q?SfP9wCHljz9IYo/nDzelywmKUW1g3xSxE1hUmMlMDokE9g39nqssOysGvWOq?=
 =?us-ascii?Q?4FQsU5EK+qE6+LIjmUqbcyFw/r8Himjjw7R1wP70g5RgS/JGc9j7Y2hQ8Ffx?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2d0b51-6406-42b3-6790-08dc4cdeb914
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 15:17:45.2730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6n5gToDEM6LVTGrNGClaTHOBXsygr7/3a1bo8xam8bBSPFCDisYWzPtfE7UbH3JBNyUlB3pBa0RqCcZ+VcBiCQcMh+uCp0FcpMGoBto49mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
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

On Fri, Mar 22, 2024 at 04:00:40PM -0700, Daniele Ceraolo Spurio wrote:
>First HuC release for LNL.
>
>This patch will need to stay in the xe-for-CI branch until we're
>ready to publish the HuC firmware to linux-firmware, at which point
>we can change it to use the unversioned file name and  move the it to
>drm-xe-next.
>
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1360
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

ok, I see firmware available at intel-for-ci branch in the drm/firmware
repository: https://gitlab.freedesktop.org/drm/firmware/-/commits/intel-for-ci/?ref_type=heads

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
