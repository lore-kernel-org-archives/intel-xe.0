Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89361C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 17:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C20910E88D;
	Thu, 23 Jan 2025 17:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QS56nyok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002A10E348
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737654419; x=1769190419;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vCcVu2gTfk1I5ag5Qwsxvlqu3Gqk21SqPj4p055umAQ=;
 b=QS56nyok0UVx39qZ9FqCNkpXPAyVnIBU5ngigkV7aDkSwnEnqcP5C6Xg
 czq4eV0Wp2Q4uMUaZcjZ8pKuZ7CA38iAEJSX9QEGO0TEGcAMphnhGs1Yr
 3kOYYtIjKRiO0m6VVAv5VF/pIYFVMptvgZbI9Ian73OhcUpFBlm4210Hd
 tnQCCtC+stVyXnldoubMiBCGVnnkTxHCMzE3ToR4zRaMv8trL3M//KlCN
 ERTcAyz5Sq2LT6uSf5P5R0KaPEJBUIvH1PFCFFj/ZmVq4JMS4k007LkV+
 p2bQZNox1X575jW88Zb4bYDIuQft6e543iycq4MKmbkrpNp3iaj1ijxD+ w==;
X-CSE-ConnectionGUID: TnBr05jaSbSKo/S7t3aijA==
X-CSE-MsgGUID: lUrMq3ThQIOWNdZtcXlOQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38422750"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38422750"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:46:53 -0800
X-CSE-ConnectionGUID: eZmMs9QkRuW8wgLz+sRRJw==
X-CSE-MsgGUID: KRjBtaMhQ5CxTNxsE2plFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="108133374"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 09:46:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 09:46:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 09:46:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 09:46:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzbLNj95o2XrrK6htfZ181QBrT1EIyu6wci0+FcFEnEyrHvDs2hxWVUOwNUS1i0efHt1WrnaQPjoT043AkIuWLHixADxZ/39XwQaE6OBB+yjWigKfgS60rD/2I2/WjhggvECi6c0nENixTZk+ynJMHq4O838jhYphz/Szz0zJ1n7txoemnMugjbBhjO+6pWCexws2AqReYsij8bEkq+ZSxw6igM391MdF8P5lzzOvWV9EfY+NBSfVPe/bKUTUVBZH/jYgVt2Gykp18oftw5qYiCxryYVEh1tclkPcsPmmFmVMNB48DHNuZrOMMOp7P1LO9tGT8nYDy9YhgjQk5g+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0ojK35nce9spsgk2x7W0eKjDDjWsnW/bcz029IAjNY=;
 b=s54HESr8rLwcu3XUu7dBuqYUsP+ANTMfQNAN8tKfjLz3/r/I0GIwgjQpgTR7qIe9hG/UlPaPQjf2YwRO2ImqAmCgJur6TVqzxM8a6XQAFR6VS1ioNT6lpfzrMuHFcGB1GFpga5kHEdd9lkLvpKYLYJDSrPfraQwGunW4GJ2cqMax99+e473FKgOKqcf+NbY+lsUJmdo1XcZF3jAbrNKpeGnbDlZroVzR7ago77g5oFG0N4Sn5NotsmIEOWOOLbAIk6rknitbKayDGuGsTuHP57SphUoWcSkTkeljkYEjho9hyNUQVJu0yrueO2iRPU7bpisUoQfZ0qAqGNdpfBs/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 17:46:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 17:46:50 +0000
Date: Thu, 23 Jan 2025 09:47:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
Message-ID: <Z5KAwCqpE/vX0Y9J@lstrano-desk.jf.intel.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
 <20250122214955.632-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122214955.632-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:303:8d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2066ef-4d0c-4240-0eca-08dd3bd5ea54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jk17XvikGS/515IPdkdwQMZf8YUcKbncvCvZfbBygXdGn73te4ozS7R5eT?=
 =?iso-8859-1?Q?vWwT1F43/58+JAu2SntjtZBbSeW3hlO/8O2ztzuMTU/vWjGhDDv8B9ttDI?=
 =?iso-8859-1?Q?wSqo4ywWh0O/nnVRc1WDCD2y2AsPeU9zJoybWUwK2Dii5Kl2z+to4D2Lw3?=
 =?iso-8859-1?Q?dxb+S/GcHBAR/zKWKUoxURWA3jeIcYemu9DdMYRFnyHGUi3wncSiwNk6r5?=
 =?iso-8859-1?Q?yVf54MYo5843QV+ldzly4RBDWlbn/64A4EY3TD90oCD+rADdtbkspZyqoL?=
 =?iso-8859-1?Q?llciGVHVK0/XuVu3iIArk3dkXmeaRrjka1LWVmIHuOJCe4HQuiKU+6TCUP?=
 =?iso-8859-1?Q?NtGh7jojeN8NnGN6fighmnoeeKo64Sn/iNPF1NmGlPPngZvxyWUevpuudT?=
 =?iso-8859-1?Q?bWzmEnhzpJqW1IiaLpUtyEy/vpg/FLom33Up47hmKT9ck1FX74Hb9vdbXf?=
 =?iso-8859-1?Q?weGSvYrji4zgu1b2NnMtKLxZlllkz1lEciGYVVwTtSKBoHS/d27Yaa+9c7?=
 =?iso-8859-1?Q?HRmOtDouGLrFpD2tRn/C7UWMnT0QtT+8dixeByKwwMRaWfdOB2YntYKvxl?=
 =?iso-8859-1?Q?citOBjDf3Dw75fF1q6GZiJnHn16CzMsOHMbdffCZhz+p08UzmxcHZK69If?=
 =?iso-8859-1?Q?quSViW2DogfvRR3X7adB4VXsPwd51y1w94ZYGmPeAzv6D3nUktfQDh2V3P?=
 =?iso-8859-1?Q?Pfn4TXonXx+82D+lDnPcINjrSk/uWkYq41VV9j1w2WSz0JgkVTOF0T74qc?=
 =?iso-8859-1?Q?JRLtl608jaOCHL9pSOwWXWDmkqCgKJJDGz491I7Y9rGa+QmLwz9BHbFVzg?=
 =?iso-8859-1?Q?LHB/SnU8otCnYjbAAq1TwHycUVNdcw/nT6k2FMnpmYEBIwobKo5VjsCge9?=
 =?iso-8859-1?Q?356BxE4eE9OloQ0RVmt9NfvH024qp2mN+7NDmTeKnYvFQ3zEvhNXoFUqkq?=
 =?iso-8859-1?Q?ug+ejFdXqNt3GWr990NffdGOaQWCt/3vGVNCaeG/Xd6f3xAJvJkuAP42lD?=
 =?iso-8859-1?Q?iI9GGBxoKTtvsIF1Mfx3algS4sdrxXQKm+IYflQCNlTjJ+YOTDHKeW17Ta?=
 =?iso-8859-1?Q?ynoojFvAevxUoBFEr8XRJKqgBeiJtanDyQqb57ZWluEoGNzxt4T9ZHyJXd?=
 =?iso-8859-1?Q?rkj5YJe9T4NkcyiWU0DpsnQynCaBHXDrCGDbCokXEQhEJxzpLzMNo0Vxv+?=
 =?iso-8859-1?Q?cZ2BmwAPLsjml4AssiHytgGhDqYSczDTiAnTQ8eCTCrz6TY31xwbIBhWHT?=
 =?iso-8859-1?Q?gQ7CcN/AYLvynTZK2FuPKozGB63mtcZ9JoMcI1U3ilCXxIUwJZ9j+LN0Ug?=
 =?iso-8859-1?Q?8roh/d0CvMFfGfIX5AUm0eZ7C2e76EiM5xtxj3evUwnBxomgWfCU7DcGWW?=
 =?iso-8859-1?Q?s3Lld4qWKrX3D7dXLOtRzgeFkGqU/9s9C492o9CFOwmlzUAMtVUBi1fHpz?=
 =?iso-8859-1?Q?tvC/Ug8fyZOWGy0h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rvxf+y4lhpP7OjX/21ZZVGg9KfktUp+alMSLfbZEOQvaaGLcJX/gR1LiwW?=
 =?iso-8859-1?Q?86fRjNhjwF8jZPvXWi56E8xnJ7stNnd/EkcBqgsvwB5KuVvUuDnpVSGbaC?=
 =?iso-8859-1?Q?8xMNn2PzgxSnAeq/uJwsesvjKKA1orQ/e4WePneC3gb5yPMijtjEGUj2PX?=
 =?iso-8859-1?Q?WHE6qDRlYEKb5bpYkDE86rrweyUpTXpx4ibno3ZxXc5mCZhI1wjW2OtnjK?=
 =?iso-8859-1?Q?Jn5Bps5KCkNhoV9EEeuBx0OgGBbTBjrJ2uCk46Ct+TKSC0WQrbkdlI/rE6?=
 =?iso-8859-1?Q?vod5gufmug8K6K3iAMGsForr29Q8KJlERQ9kds6nzl4RfMvI0l7UFO4ZM8?=
 =?iso-8859-1?Q?CJHf35TKiX7zQ/7XioZ0yh2mp0aoqBeeElW/mIOJCFWl39mOQPg1VhofI6?=
 =?iso-8859-1?Q?9vBKf1eioHxs7midRaWv31fUIljapWiLM6toUU3FKWq1+reVfEPgWSJDUs?=
 =?iso-8859-1?Q?VDrLJBJ2RqplRQRrATVXB6G0xUw+HnCGVzCxCneBYOGQQCw4nfEBYmO6FN?=
 =?iso-8859-1?Q?paz9MQePckCuLRiU4bFWlp5dk21MSjGN+1AuwnLjjeU8aW3DNGTPjWvvoG?=
 =?iso-8859-1?Q?/l+ePGjpEy/1pox/dfGwmDnvryiuUqNoCafDH0tq+84Asrr9cmcFiuGZd+?=
 =?iso-8859-1?Q?6GrnX2yu4+KsOHfnq8x3PdvEWcorrFq8aEULK593RED5lhZF8SkitLwfuI?=
 =?iso-8859-1?Q?No9hyXeTc8a0KVOqz2AjhEFNmw/WKldaPjPhTDB08HvvRjKwyBPZIxAs6h?=
 =?iso-8859-1?Q?qoEWKeP6aOF4pumDxS47NaGHmwqe0S3HunrtXmRBc1XAEC6qJBlV7tZvbe?=
 =?iso-8859-1?Q?GIN/i7w73pjN7GOEZt7Vo6pHzGx0AzMD7iRb40HfvO95UaGUJFt3eTKxJG?=
 =?iso-8859-1?Q?Ot1h6NUYDwcetvgtihvfYjS3QNEaaIdG23KBiKFcb3cKGQTb+FrlOwMyuA?=
 =?iso-8859-1?Q?dD2n0VtT3drYYnlkK02WIwDamqZDW3KWMBx/9XH7neUSAA9tyli0kFOlsI?=
 =?iso-8859-1?Q?bMZEL1vqExzWtm6q9cpEvw6ZpDxjV0Q9iwNRPDPNKcGj9OHikwxECch8x/?=
 =?iso-8859-1?Q?FJnlzCCPczfjS+KeFS8aDj5m0vEm/DBMYs86k1PNVjNSAYDe9q5MQNdkyM?=
 =?iso-8859-1?Q?N+UUrCB6ld0+NSvBaG229Gfggx+8pnbDxdk1TnNXOyWMWmJ28kxOgzIC9Q?=
 =?iso-8859-1?Q?QYYE1XINXXZNF8FacoZCjhPcbcrzdRLtN1slxyoSb1cy8CJaHSDVoEivjp?=
 =?iso-8859-1?Q?iu7mYqM0ihnzJds3rcLqX+7JXPAoVGIMqyWnZS6qKUu2Mpf4a/UzJXf1Dg?=
 =?iso-8859-1?Q?ysYxGd1BOkhT81LunIIbRJQ3Bh7GE8OBw+kD60dyDcD+++mrQHWr5GzvI7?=
 =?iso-8859-1?Q?7jvxplmnypCnA9fQUHFHaTI50wOa3oNPrWmGOuDneLNCOzF6VJ5oxKfufU?=
 =?iso-8859-1?Q?JYJ/PNHwyNeL/HLFDkQFjYBlAxLsSLkXH5opcI9KnDITb+pWZbA1QlSBRP?=
 =?iso-8859-1?Q?XAVfBII3HRKIre2KbSaD90zsy/KYQaK+8rwDo8k8eiEb4iPbAMq3k+8lkN?=
 =?iso-8859-1?Q?H2cHh4hlnm6slSrN4ovl5ywPSC2TDXi/6SoGsLASTVLTqz968owcPAUwy3?=
 =?iso-8859-1?Q?Fcea4M8OUInhqmGQ62m7Nv6GNtiC2HAQCEEzdbIL0D7Mp8w5HmLABBFw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2066ef-4d0c-4240-0eca-08dd3bd5ea54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:46:50.3195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVXBlkYTDQvePymwhDyaVuR5hfwFlCIOuRyPUX6JpQM23HelJgI5+p/o5PV6fK6RK7UxQuZhE8w/5/zE5ek2Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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

On Wed, Jan 22, 2025 at 10:49:55PM +0100, Michal Wajdeczko wrote:
> We believe that we stopped allocating memory during resume or
> restart steps thus we can say that SRIOV is now reclaim safe.
> 

I'd mention we have lockdep annotations to prove SRIOV is reclaim safe.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c9cc0c091dfd..1c42c47a3005 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -90,7 +90,7 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map = {
>   */
>  bool xe_rpm_reclaim_safe(const struct xe_device *xe)
>  {
> -	return !xe->d3cold.capable && !xe->info.has_sriov;
> +	return !xe->d3cold.capable;
>  }
>  
>  static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
> -- 
> 2.47.1
> 
