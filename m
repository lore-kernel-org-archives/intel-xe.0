Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A251FC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 22:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050B610E199;
	Mon, 22 Jul 2024 22:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSUwvY4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDC510E199
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721687384; x=1753223384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7vXB1WR6a9Rg+fwyrTLq3Q3VaN0snvviEqKQfEesjdQ=;
 b=VSUwvY4p4gnkPA9bfMORT3/LAMn3i9rES710ejF8vD/slZnxor/WtEFv
 MYaMw27+xevaAugp5kzuySwECy55Uy5sDDqGW7mFhGhY5tcF9ly65bf3t
 6XzwVNIgO4YRpbttYFE85NVrdCh3cf//TGhczxur2o0P4eK5/i6uUTBgM
 PJe1WrrKcox3SHnK+GrDox1ADPxfXrJ7I4dGEKDX+1YsvDZQWRFMcIXwX
 ONYXsMxLm+eXTa3YiZ2ps/qpeUr0r6bwgp88EyQ4tk81P6FnI4NHmM6eN
 XEjj/TsoJIKYIvlA8yo/lhFeXLRhaRi8G0uLJFeyf8YZhIkHmmIr7QG60 A==;
X-CSE-ConnectionGUID: uWz/yzDuTombwnbGybBTkw==
X-CSE-MsgGUID: 0X+PfpEBTi6DpsTkDbGVGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23154715"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="23154715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 15:29:39 -0700
X-CSE-ConnectionGUID: FVWCP4TSStOXQkIH20rvFQ==
X-CSE-MsgGUID: Ivl/XY09RCmME8xyjJDkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="89486771"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 15:29:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 15:29:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 15:29:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 15:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzHk0ae17Mr7FUxI6mX8xeEGR9xzbvRTeiYgVGYZuBZeG8++ENWzW2isSUa5ndBHcYo0BFUg08wClUCP2LkzR+7d/FUTkoiMEsLI/kghqiE8byCgRCoxVLhgJEbDA+yFD9ATP6uoGl96wEY/Ad4P9HEk2i8SokTMF/f1IQE71vwiPr+gSOkrChFPpAPt14PhMpCx9viR87jr6Jj8mMKcAlCEycXuHQfbTr6Fmx7sS0qdFUnptcxaZTWIPwyum3FVuYgQIFiRgtRnhwonXbGxN1diJtT4VuStAvPGO1+maxqhOnVVhrDznmjmGmyuZ4eQFOFzYyv9FvoOANbCa5k47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KK4EHqRwFrBMJsQTuTqQDLJ0yJcTe89EPgAah/eG+k=;
 b=QpvdQahgstndkIUNKou0FVVPg47pwHZUDyOjh+Gm5kXVuq6Ye6jGIXwGcncGk+LTs7ryPJXt4BWtrX+WTA34pqz9t5KsqJQEhjwBnEVG/Wu+MkIHu1dLjJTQVRBf6AZi+EfHypz08ndW3/Ch/ax1Vsehcd2/BXrFtHBAlf2JrQPBjvdijAoOaYX0/oR/56eFi34nZZ7Ah1zMEjvC71KeNur2nitP9yAeqlFhqXh/1u3HvQW1/5+gHLxkqeX3ycJNRGkla0GQFi9KSU1fimKsnvlWtU8LMGzhSpTvizRYwIZ0LLOe1uohDz4QcC8AEA0Z2LvbqSpQS/HNA9+9sySHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Mon, 22 Jul
 2024 22:29:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 22:29:34 +0000
Date: Mon, 22 Jul 2024 17:29:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Decalre xe variable in xe_file_close
Message-ID: <epsrdaupx67b6ien7wkzjwstm35bezspclkpghrnymlwmjdzu4@jkkarz24r5up>
References: <20240722203318.1608626-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240722203318.1608626-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:303:16d::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: ac38f144-82d0-40b7-9c9b-08dcaa9dc36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RKQzaMfQtm/ZAeySIGvLbswepYummxgZsqNzrjMAdxlyOlcwSrEZaFngMeLb?=
 =?us-ascii?Q?Lg5VtvIJeAW6o6KxGyLUxNuBUJah6SOzh4eGjXk2g1Y9IZEpNBSkpeZ1Po3y?=
 =?us-ascii?Q?MgkcAxe762eqBK1+wbB4/TDRe0XFP3bFChLbfbX+nWTBx3W/LWJWaocUGyRZ?=
 =?us-ascii?Q?/TO/jONGhEYMQ+SAwDgWXcdvvNLyG8hns243RXMmNrTj4BDcYq5vXGrdQgVZ?=
 =?us-ascii?Q?2n00APLazyc95n9z7vzSH5y5jaOAv8TY+72m6BnaGU/KDEwOEhNkMeofC5ey?=
 =?us-ascii?Q?Y0sWKh8MHADdJxlbAE1RuvhfQu68KI415O41bFLk4lryg8w9kWTwhs4K41qU?=
 =?us-ascii?Q?vD7Kkc9ftnFm43L8gXXNj6Zersk/f5K7wqSeL2ZV6GwPKdCcKiV3Svn6HXeS?=
 =?us-ascii?Q?S39afLDvAsrdFjt67QhXEvcClj70Aiuz4EQOZcykcLEo+PBv3Jf45ZXUX6n8?=
 =?us-ascii?Q?gN9V/56DjQpVW3kvKl86hIoTfYPkMouqGtIAkjV4KGuQTUSU6wlwldpRCkG/?=
 =?us-ascii?Q?tt4+4Krx39cOu3decntEm40awhkzrtKIsoeewMwKem97YsbO3p7s6UW/dP9/?=
 =?us-ascii?Q?ZlkchinAHbFm5372ZdK2ctDr/ejcpkOiAOVqE1xh50E0cePZGMVpwmEhanmN?=
 =?us-ascii?Q?GZ8wo44qOAVrlELIqpmTlK4LowAcvtBp/poUv/rwGGjPOq3Yi3Fy9nspxuDw?=
 =?us-ascii?Q?rsBU1h9bUX8HmYnM7/i9MxUZ1ABq7/ETkkepLhrg1UcLsF1vW9NdZSkb4C/d?=
 =?us-ascii?Q?b8gLTvh5clgF5wMx/Zjshe5QGPpSJP+L32E7YcEHrtug0OhfdbuHxa0cn9Bg?=
 =?us-ascii?Q?0wTtjMHVsMxaDClcmBfdd8VeLCC89eKHk9z/jLz2Fq7HUYmTO/E1wPBuq3EU?=
 =?us-ascii?Q?eb4Cd/fhJ4cNRB6EsZW0XaysQAXuXchcQVvIWKwDM2GnxpDIVCXKnlKIg0BK?=
 =?us-ascii?Q?liLDLjoCjgcIaynLj64OglV0DKSKERE4k4JF1QlSlDoOVFilaHvP6u/msALe?=
 =?us-ascii?Q?9UVlJJHw+Uqdkx6F/u7sqKufux00HClfRdv5KauMR/mSbCp7G5UEL/pO77CU?=
 =?us-ascii?Q?aKgfWUxmtibbfOVq6/ORsL1FCsAPEhwf2tIFKSuRs9M8XVygxvF7iWc3Bb+7?=
 =?us-ascii?Q?UxW2ePzyDuEcnlV53xeutTzFL5KUfxrseeTyxjd4zuzM3B6BKDsJs9DwvJN9?=
 =?us-ascii?Q?xbMnQBArGAK6Z24+hHNNMf2tB24FZOEcYU/crXIKnGU7eubtEmQmON6UG0D6?=
 =?us-ascii?Q?XODEu5fdfTYvMquzR18Fvvmu90kGcjZODd8vJbvGvUvInx9qtzklDD9bv+D9?=
 =?us-ascii?Q?DB2ZY6LqFTVB95fVzcOze6hYs8RdJDqh10LbHWg2XDsOHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zb8y/Sp2syfAH7/RKS1Xo9uYDTYYhh5s/oMFcImCz/BD0mWkgxmkHG/zWxPG?=
 =?us-ascii?Q?WdJVAu/cktX+ITvH0tZ/ZN0qa2odp6PlLKvl1eaoMIz8f4yqaH5KWeOn/Au2?=
 =?us-ascii?Q?aJz7dsBZ5SpY/YsFNKpJq4r9Zu2FM5s+FQl5H+N0iq8Y8tEQR2E8IEvFFPNm?=
 =?us-ascii?Q?nJg5lOaEi/OmewQM8HiJGYFVgCGQqkGa5irezyDwAyA7wMFR38OKFczaqFgT?=
 =?us-ascii?Q?Vuw7RpiBYEX0XSLSV2Er3FccWZdd06bRweec9amZabzz2PdSI8I27nkwMQW/?=
 =?us-ascii?Q?kakpKxgJ4dXUJdgcFoe0S4KjG0jQxbpKB3ZJaM+p5dknjmfubh85C7b7SfLv?=
 =?us-ascii?Q?XuqPNYTgXMNaJzvsz/RoLqgo0etGjfysPxM8GzVT2Ynos0wqHp7NFHNIHx94?=
 =?us-ascii?Q?BMUeSa3kH4Oca+DnNK5+ASZW8cJSISqT2mNf6DA9f6XNKqeDbTOrn0RvF3cD?=
 =?us-ascii?Q?awE2VfFVEuSmkWjevHqkhTa9mbRt3IU8V7xkUkn6cCt30SwNjP2V+g8IAsrl?=
 =?us-ascii?Q?7IRUNBZO6JStPF1qIotJIVDroMjTsWtA6OGg6R8FQwgOnPlK2YtZWxkI9tI/?=
 =?us-ascii?Q?ITU+QmmwclB+zfQicdXdSjJM9I4NtWGg8cu8mbxYdnfuzNaxxZhEBOwmuZMR?=
 =?us-ascii?Q?wcuF5w1ZBA+hjUuDzQEy+9wSA6y4Y+s1HTPQbQDU5nt8KSGyhGIV0Et/Fx7+?=
 =?us-ascii?Q?m56O+WtfyRpZ70JquG3ZOShqA8j3+ygGj+4jUGD5VQTo9wsI6W3jvYVu/uh/?=
 =?us-ascii?Q?IQGaEaYgiUxfc2T1zJSRpIsrxDkR5WEmCgef52fe+ZfW38qIruWnmNdszTHa?=
 =?us-ascii?Q?DDF4CCBuz3orUUTlS/cMafY+y5z824nGu/VwCcxIVfliLxkYDUR3xSjH7v/y?=
 =?us-ascii?Q?WbCXDyJkNN9n8r/IetuubisqYNpN1lJR/BXw/9W4PjKRawBw8rtS+CCzN9um?=
 =?us-ascii?Q?W+PYLmX002/cpeALyuRyw3nQyikFO3JtsiFX4bOIMV4wAPBPz2YuaAXEdfVj?=
 =?us-ascii?Q?hI3lX1I98Y51dDsOl+Y1BBOMQmzLSGWx24mvO+0vZz8XLNfgEc2IwMiQ7a/H?=
 =?us-ascii?Q?uxUSXTAGWnE6xzNB/RMGCgHxjFZA9jqozys9+4Cw4HSIfM37yJzmdU7TKPcU?=
 =?us-ascii?Q?HCOMsD0RLDxl4DXjA/nQK5ae6lzhb8Vm1EwPBMvsG8Nm+Mv3/RhPQBvwS0LM?=
 =?us-ascii?Q?J9DX+gRxZYbYij2MifTLjOVYYLzh40BnyR0izANal2jzEDaVw8QrwZhULL0e?=
 =?us-ascii?Q?P2eqgz6z/ItWmedObvBxxS8/oBY+iHhc/zoRDFv6BYSkKAcJOl+K5ps6Bpo7?=
 =?us-ascii?Q?NFsESnGqOCr37fTXrvryqFMsNKqtT3oU+Ww5YUnBZk6PpQg3JEVd/cP9r3mo?=
 =?us-ascii?Q?izsjhG6bz+85EUfNiTM0Nx5iJ3XcTiFdcesuVJoBzfxOIYoPa+pEszjvePV/?=
 =?us-ascii?Q?RiscUNOdJYFuY9pa14AmVTIcB4HSSEcANJcgNBBlnldEXsmQ8W+Kg6QoIqPh?=
 =?us-ascii?Q?KCyac5dbFhN11toP35UEg9DEtUHY5ooGAE/05N01XAlbaPDca66VcC60JW1l?=
 =?us-ascii?Q?2QJWNFvDVUBrH07m+9TMp7R/kPz2lWsS4iB7DruqaRJv0u+UXljEFC659raI?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac38f144-82d0-40b7-9c9b-08dcaa9dc36d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 22:29:34.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wj/uf75Oryl/+cntOefw3u+DJtdUJvQnhFPHoudYiphFFPSxYPxIjpfEUkkTaABb1z6w5ACd1SoooK4T3/r2ohb/+PFfEeiOZWvTvdyVuPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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

On Mon, Jul 22, 2024 at 01:33:18PM GMT, Matthew Brost wrote:
>Merged a bad patch which broke the build, fix this.
>
>Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index a8148326c69c..b677608eb592 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -141,6 +141,7 @@ void xe_file_put(struct xe_file *xef)
>
> static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> {
>+	struct xe_device *xe = to_xe_device(dev);

this line was being dropped when merging drm-xe-next into drm-tip. I
rebuilt drm-tip with a better conflict resolution.


Lucas De Marchi

> 	struct xe_file *xef = file->driver_priv;
> 	struct xe_vm *vm;
> 	struct xe_exec_queue *q;
>-- 
>2.34.1
>
