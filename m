Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9894C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 12:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83910E80A;
	Thu, 18 Jul 2024 12:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxyP2u5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DE910E80A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721307226; x=1752843226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E500V0iHuA2DVeEQ7FQiNkCv4A53/3+c2CJ/2SzOfP0=;
 b=QxyP2u5/hYdDxthazXcudz85VtyAv3Ap7zu/Jcc90rLb34rtUobor0TY
 1CXs6aDrQYvtRtezOBQc2X+S2sfXKtXKXOOExG77GtJCaySIoUCxpK9J0
 GlpjEfxZBRN5w6dGaStXdVx0M2zX+AE3xn+6oYhtRCvZ6KyT0mRmN1wFz
 DQcFsAj2PK8D4Aq61rI1CMsMHuTd8Rn/9qWbQLwsEm/xHPtHMIBHlN3RF
 ktUXyvslnNcfu1H1/jV3VTXDwOj/sEZckubBHDIHug7zov/R0INnwRLtJ
 vQoHGm9+l+YJmvYtx2Z4TDcyEwFnOlH3IR6l3VYpOBQ5/5/QC+Dm/usfo Q==;
X-CSE-ConnectionGUID: gHHsqV5KS0CHfHLCK1s15A==
X-CSE-MsgGUID: z2NZsrQNSte07RhbQbncLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30025836"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="30025836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:53:46 -0700
X-CSE-ConnectionGUID: q8cnAtAnTX6piMQriFcNTg==
X-CSE-MsgGUID: A6HGKaxjRSacXZLCXh/cTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50473420"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 05:53:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:53:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:53:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 05:53:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 05:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1sMDth0dSXfNTQ5jPbsTyhJ8jeDV48zkXCGq7OIltdxXbVoCYjU1pmJlw3fUSLumAcrdDnuWAL1yDbcqDKCxKHIL1wxlNkFyzA2adR5YoyzyTAVk+a56+X5XYXYZSqE5gaeuqcJG/e66wU0LRqpiZzrHg72iXaXwNbijBT4oF5JzHb3AHqsj0cSxpLlH8UfZ0RKLfolMP0bWUiDCZLrSkmCbaGZJKuV2L7BG1XkZuYTUiHXH2d00KkT1Bf6yO01KWr5RN6DKQP0pPdw6hCatmbnTZXnrDZ253+LBatRev+FZ2pZNf2u3a3XXYqsb6OI575gVEbZRQPq/7QDBR7qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj/mJNQyqtKLOxywFal8q398GrfJfyGvrUSL/Kir/Rk=;
 b=h+2Re9sjtvsykBwPmaP703iZsH6eoLUEi1sAlz0x1765otGeWkD5uQDZ4PV0B5g1fQMLJWewZx0cWn4cBUBqwSPg8B+IjpYBZgpcj9Z20AiEaWzxyFAlZeHd7SfYyYgcU7s3SaCA1dRbtmB+xRfaYzGo3q/a1Xj77aie85QmhdotkF4tnll2XUMzdsGRMcNi+6zd5WIix9Vt6N48DzkEyorWtrJjN/oxHYKX5Pu1YABh9s10Co301pA2lwRoMgRytbl2EQEzm25UN/Cp9VBkfBrBkNhltE+EYTJlmC5aej8R3pEpjADSl6z+OlBRwMWfhgAxbVe3S8BNIXP/Jbla8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Thu, 18 Jul 2024 12:53:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 12:53:40 +0000
Date: Thu, 18 Jul 2024 07:53:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe: Move part of xe_file cleanup to a helper
Message-ID: <ihvmz4qva3tsiefqc3lzidz2da32fhfsxhgxjoq4d3lloe2m7v@qzlvgnr2xyla>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240709002835.3372618-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: f222969a-e174-4e40-629d-08dca728a5d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ls85KoDpXWB5Cdk3ntXhs9Eqy8bN7MRBiiP94q+eIVU2ogsPzJoAjkBIqd16?=
 =?us-ascii?Q?fi1RyOIoIBJdv39S9cgTl0wKoPYD9s0mTwTkCrdh3ijMo086foCRrlM1j0xr?=
 =?us-ascii?Q?Hui9GK82dqt54dDnhsQM6baGg7S9ew/UmtuKoZZT+MC3GXmVGzujJC4S/xAi?=
 =?us-ascii?Q?Bc+MOXGx1xmbMh7qlY84EyixA97CVt1wZadrTlMkSxDTKtoQHROKJ3xS/NF6?=
 =?us-ascii?Q?As8JrhbZRyyUHzsk4EhxXZLQ3zTspkpE63m3ZfHl7luM3S7Mf5C3GMQKEnGA?=
 =?us-ascii?Q?N70V4piTQ6QicX+rWkjdLuHOelEkbDqCnZ8OIOue8oCdNa+adH4lzpYXzTlp?=
 =?us-ascii?Q?imgmKkrTck5oEdx2f3J74gSSj1PB+aVlJNFik6chuT09qJ1ZO3V5QGHR71Bj?=
 =?us-ascii?Q?/2hkL5hEnDtfBIrlu9C7qd5gIqpKTphBjCf49gZOU3Dckg6T0RrqfqdMmWl+?=
 =?us-ascii?Q?K/It5rbPvOE88W9Htw5VlV3zgLdFYIhEt5bb6C2/5deSBw/cvIaP65FN0x0i?=
 =?us-ascii?Q?lro/wm7jXXBFe2wLwp0vjBRRlzrQ/l5azlYSwvyg4aErO+GCvvw3rA/PvymU?=
 =?us-ascii?Q?4KamULQs1//m7eadU1CzG0r8m3fk1MRoRDq5npsRUl0TFbzX9WHowJhJED96?=
 =?us-ascii?Q?pdWeHmFnM4w8cTTijgeimySDUsmRe+bw9jxPnK9jjaRxZBsXyZEZz4dEVe3k?=
 =?us-ascii?Q?x7rdDxbSoojqHlkMpxQ94e/zcDrTkv7Sb4p1S1+Kevg0H5Sr3LcBEnWJBXr0?=
 =?us-ascii?Q?teelqjhebtjZ3fJj8b+GgCQwOvp39j7wTkaziG1clVO4Svwhr1nSNoFjYVHt?=
 =?us-ascii?Q?DGMXgqXNW5iA8ARkdM91Ip37Od2jRjUG7k4SPZj0BGfMeh+uiYAucGtmtAOW?=
 =?us-ascii?Q?sfBZ7gv+jcFJOyTUN+l1du1zwJe6j5d0ITQItbcdEeEBu682IMpmhgIz41We?=
 =?us-ascii?Q?xDPJOqrRrutO3umhmPezGxChIhXZfichD83z+duGw+S1ocWlV2a35FJvKL3i?=
 =?us-ascii?Q?bAx7SERKrFBryt2HtQILflrOPhA6wZd/KnDXWsKg/kWGAh2X1mZDBfZdI8jt?=
 =?us-ascii?Q?+kxL+ky6X4atNuOu15FedQtVdW4R1OnfF4W9ysK3mAuMpJliakLXdB+kFFpG?=
 =?us-ascii?Q?/sk8FT7A7roTIdeHrHyoZfHR9fGuH8uRllgjoDkuHNj9b9Dr4jOmXJXy0Iyj?=
 =?us-ascii?Q?5TCDGTwmb5Y75GEu3iXcsYWaqDgmns1zPS4w418gUm4dSB0FVx3AIJt0upuO?=
 =?us-ascii?Q?OCuEcPOqLlakDfu6fpvcaSi+B6Y1yD599OW8zFsWZImf9Vh+bYyi7X/edpVG?=
 =?us-ascii?Q?paG6u+VKI0aiV+0Nmld39GlrA58g8NtrPCaVbZkHMoUUYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKOXh6UqDgzIbqelTm/VYWv9RUnzEWAn8KsABQr0vaPe5Rs9JSuMs+r71Qbi?=
 =?us-ascii?Q?9+znGpoVDk2rt5h0mry5E3UtLEQfYg/ZyQQvmr9a52BMxjNk9XGYeRwBiBAY?=
 =?us-ascii?Q?iz1gVIisoKHtT/C29TG07n6NXTtG1d7vioLdGys7zHuVte6G0rCrHI2atGMi?=
 =?us-ascii?Q?sgQK/W72RjlBboyfDHzvAO0bXe8MnWJvTUTHJVzo6cjLNt8gVxGFjTg7I4mc?=
 =?us-ascii?Q?Tffaza7WNoVKIvHuAVa2hHneusoytvQbMwQYAlzM0rP1VPU09HUhrq9Dm6zx?=
 =?us-ascii?Q?8gW+9vwlOnxV2jqBwJ/bPIOmQKXh65+p9JHGe+eCdJka6zho5zJQjptQpazh?=
 =?us-ascii?Q?Uzcq3wPjf3RvzfOBqtudgSNMhoFcv27vGRyHcP8IHvBiwsY1HicLP0E+WBzt?=
 =?us-ascii?Q?Qco2enZuJ/f6mAwPGHu8r6Fzmv7QPTzqeqwBL6kNIyvr7VsLDELHwKa+PQMz?=
 =?us-ascii?Q?W76jnT1/L9h8StjQcnk9BfVdNdXMgDSRzKIDs00ydllVpGm84NZfRbdeU8PE?=
 =?us-ascii?Q?4jGlFMQzDI3Ni5qiVNz08ksxPrL45KJ7p7ZQAnG6N+HjYEMWzj7VwdOrm5r+?=
 =?us-ascii?Q?b0XslIMLow5WiHKYf39po0MzkvDQdcoGtZIdWoSbxwPo/EE/gOVR7ggKebE0?=
 =?us-ascii?Q?4mZZcDtQ0iLDO1JgEPleD2NhwDYVnlSPYeqCn2c1W62fElxA/PmV2WuX+KJe?=
 =?us-ascii?Q?fiq8Anl333GM2fR5FyzG4kzd5pffAG9BEy/AxCgSUxJ6mhVZZsUaAR3MG+t1?=
 =?us-ascii?Q?t4fGtFXS/sSvfj1/QAAc5ZWs5e3Lf8wSU2SKvTuON23f/EnNyM9B0dUvcFDt?=
 =?us-ascii?Q?TbrEkSOiKpa/F6T53n2dlcQEIPORC4jSr7AEiVc4Rl8SCeE3f4kwJ8zIid7/?=
 =?us-ascii?Q?lbw1iRwY7wUbdDgXyFRxJkygz3NAaXBK+3fp8G20eVD6VJ+D90SPe4ixm1MP?=
 =?us-ascii?Q?gON1cc7TEfSFC5xXeonjB8PiGdPMVBU242/9iOdtkbOaxwaSvzSq+lGjXhkA?=
 =?us-ascii?Q?jnAD2sQONgHllRfSojCBXu6JQpGMywmLPKDYyLDqmEM2LUeIdiprxaYO4VTC?=
 =?us-ascii?Q?teEpKRHgNmPDVeTTG/qqTW6LgvcSM8Q84dye/e/0FtWF7v1AGFH1Sn2yrrUv?=
 =?us-ascii?Q?7f//q+fOPcAKkR2s20nke0dfWNCK5GjIrFHS3CwKXGZ/kmKxhfY2aMgyD5tf?=
 =?us-ascii?Q?0SJjYeKHya1n/JtUFKC+FlYvABwoUO3MqZboHljLbzxUn+0YffnKp2ZpJibG?=
 =?us-ascii?Q?q4dkAYDhDnjVaWQVXwaDLtVYBFMjzPn3FkPrFsfVwSdTY3RZRFAWsqUOMGC9?=
 =?us-ascii?Q?0BYG2WzkukGUuEuvb+xQt6gpp98FsNnS2sKnG5k/5NrxTVDLaC64GTMRNCle?=
 =?us-ascii?Q?uZm4lEo+iSliP1Pu14DKH0JcsIYrg6JKfGD9Mih/ms0kuXoUzC6nqH3zNvwU?=
 =?us-ascii?Q?XDSJn0n5P25ae7ZfjkdYxMPDx/XGhWwdT2rpkn2RQJXo5XCtEQ/agwAQ6FxE?=
 =?us-ascii?Q?e2wSD8XyFO2LRX1A84i+OQjzHeakCIdlm18xpwhwn+tr3Ho7sOryRwDm3gwo?=
 =?us-ascii?Q?tfkPqicWXYk/QTPzhS5AeIuiOETc4Y6POEdsi85J6dyXlp0nGU3tfHFXQOTO?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f222969a-e174-4e40-629d-08dca728a5d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:53:40.6673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muAS8kF5W7JJEuEA+DIc/Jl/yuEHN1zTcaJKE6M6frUYfRFk+OXTCGh7Sd3l62pOt52h377GC2zw9vNnpN8b0K7cSVzgTsEQhcvzk6xhjAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On Mon, Jul 08, 2024 at 05:28:32PM GMT, Umesh Nerlige Ramappa wrote:
>In order to make xe_file ref counted, move destruction of xe_file
>members to a helper.
>
>v2: Move xe_vm_close_and_put back into xe_file_close (Matt)
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c | 29 ++++++++++++++++++-----------
> 1 file changed, 18 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 64aea962afd5..c5464ad5d908 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -93,9 +93,25 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> 	return 0;
> }
>
>+static void xe_file_destroy(struct xe_file *xef)
>+{
>+	struct xe_device *xe = xef->xe;
>+
>+	xa_destroy(&xef->exec_queue.xa);
>+	mutex_destroy(&xef->exec_queue.lock);
>+	xa_destroy(&xef->vm.xa);
>+	mutex_destroy(&xef->vm.lock);
>+
>+	spin_lock(&xe->clients.lock);
>+	xe->clients.count--;
>+	spin_unlock(&xe->clients.lock);
>+
>+	xe_drm_client_put(xef->client);
>+	kfree(xef);
>+}
>+
> static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> {
>-	struct xe_device *xe = to_xe_device(dev);
> 	struct xe_file *xef = file->driver_priv;
> 	struct xe_vm *vm;
> 	struct xe_exec_queue *q;
>@@ -111,21 +127,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> 		xe_exec_queue_kill(q);
> 		xe_exec_queue_put(q);
> 	}
>-	xa_destroy(&xef->exec_queue.xa);
>-	mutex_destroy(&xef->exec_queue.lock);
> 	mutex_lock(&xef->vm.lock);
> 	xa_for_each(&xef->vm.xa, idx, vm)
> 		xe_vm_close_and_put(vm);
> 	mutex_unlock(&xef->vm.lock);
>-	xa_destroy(&xef->vm.xa);
>-	mutex_destroy(&xef->vm.lock);
>
>-	spin_lock(&xe->clients.lock);
>-	xe->clients.count--;
>-	spin_unlock(&xe->clients.lock);
>-
>-	xe_drm_client_put(xef->client);
>-	kfree(xef);
>+	xe_file_destroy(xef);
> }
>
> static const struct drm_ioctl_desc xe_ioctls[] = {
>-- 
>2.38.1
>
